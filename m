Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB82CFA74F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rw6P3vTkq9/VDf2BdRM52eT1wyytd0Ws0h+4Sg6bhM=; b=3MKF5I+UmKWfq+yj8onzX1iPJV
	ljBjS8Em9bxvShjK26weRJVuNBU9UJP1fDm531DX7MffikH4oxQ5BBSA+iS13IVGcMY0DVyqv1BkX
	tDY4dMP286I60B2zfmbDYN9VYzKlFlluo3vzcOwYrExGF8UFZSVDXsExd/Rh2zsHX6OWwSZZUH0dH
	bX8zXLUJRVsnl9LYRqFRvKhiPfdcTuEYexjmwz0ZFa1LtouyJASs98Saq/ulBAcxdcEa1GkTBtKfR
	IquTT7r8ij2Q/5bq8IcRL9EgDV36dOXnJTquNpHsRQeCJP36tblGaVBNVnF+m0clw7U+/jsAhwXjw
	aBWoyXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMnF-000000085lY-2fNC;
	Fri, 21 Nov 2025 08:47:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMnD-000000085ks-3rT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:47:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1574270b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763714818; x=1764319618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rw6P3vTkq9/VDf2BdRM52eT1wyytd0Ws0h+4Sg6bhM=;
        b=tX7YYGhDS5nRY6mU0gwehzkzr0wFaFwdG+wEzc3M0CPJ0OTRzQSg/ygB4VK6QIt2so
         HIMau39h96jAEQ6oZ4sjRfVw6thFU/9DH4sNz23/OwSPh7B/BmCDJvJLwU8UvPDYhpz2
         MHerwlgi9Xx5z+nm7iNILyCDn/Fk23s3PxdcLQWlq/GmVt8DC5yX7V02aP7MTp6AgLTy
         xA9EQnxRlWJhJ0Sb4PXrLyLX/mvti/PzUQkwksUhML3ZE8QQhVZ/4y9S3OS6XA6i5Js/
         rrYWUQA04HXIoDY7Js+5M3kQT+1baCc0anPpwfb9HzHcSDTiDt5TGdLFxSX6DvTlupWa
         op4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714818; x=1764319618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rw6P3vTkq9/VDf2BdRM52eT1wyytd0Ws0h+4Sg6bhM=;
        b=g4sgquLs82PxfdrbN+WxhrEnMwTEPnS8qppgMmd3NxXt+j3kYmwZCDqdmQcCuFtbSG
         kHRBhdBNllKQ8mgpmYROPMis+XTfv7kaW3O69nm3+bv1u1NBieGtCAH7nyAKFpujA2dD
         bpZIwoFQ/s8OpK46Y1tgCuY70Og52suwGgbuDuNvfxty0zdZzoxGWhlL9/6mulqXPD8U
         0mnt+/wWkv1VXphBmynoyaBMUZum+foOYnK/XvbKL2UQjIj4CWjxpklsX2HRk64RpMnY
         hPvqCAzJvA694NZ9bxX1Fs2PbVLcKIhpUdvoFSYYFG9F5ewVhmnNpHDPtD9gv3D50HfX
         k+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUBEfZ1U4IBTokFtFw/zWHq59Cq3KqwEBdLi51YQhbg4h5YUeCXnRQ+yvc0K4Own0ozJ4YthgGqrMQOUKnCHrPh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhk8dQxgHhcufWKRMLHbS2kMMQwZF2mb5xv3OGFrt55VP+vzcB
	SoJCkqny/Q/4lDijf5mRlug638ZLxAZAS72qjiHjPwmoIAhIfRfk6jhO3P1jfqZF4HwYCZdbETQ
	wdGmywjSRr/6uB0h26NbK3VxJqryztEy3sqAm7gMx
X-Gm-Gg: ASbGnctH9iTtrmsKTubPkZNc0HrDXfJ3twzNK34GSzBh8GbV0MzcZA2HiI9WXkA0Y1t
	Ltk+krGt2r38plKzRM0H+a54zMaNtd6W/AKfmIRmY6ejDiPYO175kV+2bobXJjFYvc0TBW+e6eE
	6ynOTN+l2HbHxz+rihceg+FWHCvzjeYTNGJiTOqUkc9jSS5DTZBIX83r0rGRw6nwHj9KBaa+P7m
	zNiLUtwrqAAwMeFjktP4Z5ApCy9WxtRqJuM25gEYznk4UUHOGO8aGdxb612jJS4Ej1kA5Y=
X-Google-Smtp-Source: AGHT+IEGKK1JVapl4Bfkn+X1caSvW4BJYyhUwjXrKD36ojgbUTuY+cLlAhIn+4hGtsKsgQZA7TevAUxQK94FOcafFjQ=
X-Received: by 2002:a05:7022:ea46:10b0:119:e569:f26c with SMTP id
 a92af1059eb24-11c9d819c4amr549173c88.21.1763714817986; Fri, 21 Nov 2025
 00:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com> <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
 <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
In-Reply-To: <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
From: Roy Luo <royluo@google.com>
Date: Fri, 21 Nov 2025 16:46:21 +0800
X-Gm-Features: AWmQ_bmUVOlmJqcVyT_EtvB6gdvlOG5rtdefUR1SndkOE8ikDuOVfBKFFoK6hGc
Message-ID: <CA+zupgxskC2HMy_sLusDbb_L1t49frjLQW6isBfAKa6BgNvpNQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_004659_963649_D06763CF 
X-CRM114-Status: GOOD (  19.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 21, 2025 at 4:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Nov 20, 2025 at 05:36:41PM +0000, Roy Luo wrote:
>
> I read last discussion and patch is fine, except one issue in example I
> never noticed before (see at the end), which I want to fix. Apologies
> for not bringing it up anytime earlier, I missed it. While at it also
> one more nit.
>
> > +description: |
>
> nit: drop |, do not need '|' unless you need to preserve formatting.
>
> > +  Describes the USB PHY interfaces integrated with the DWC3 USB contro=
ller on
> > +  Google Tensor SoCs, starting with the G5 generation (laguna).
> > +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.=
0 PHY IP
> > +  and USB3.2/DisplayPort combo PHY IP.
>
> ...
>
> > > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb_phy: usb_phy@c410000 {
>
> node name: usb-phy, because there are no underscors used anywhere in
> upstream. While at it, you can drop the label as well, because it is not
> uised, so just usb-phy@..... {
>
> Please send new version with these two fixed and:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof
>

Thank you for the review, I appreciate it!
Ack on both points and will send out a new version.

Regards,
Roy Luo

