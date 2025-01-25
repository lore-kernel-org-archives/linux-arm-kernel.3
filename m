Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C00FC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=; b=F8sNfq0Q9Nd2F/9io08hc70hEl
	/vRr6E0Ofw7Ov0Kx7x0qTIf10Ny88ZETeltsp3oxlUz9o4H2TyDzByFWpiw1uhtWBtlFrvQLM/y1d
	Qnu98Mt9H+DqNYy5v8muA3qePfkmKGtxd4Uq8mF33pdAt+LbmnZUwC7K/9SKY8f/P0uE9UMbCBJCU
	wRPHg3UNv2t9MZ3AxQDvAQdl4AKuDF3Bpcu9bLcgRrcOQlJvLmLfDQKnuT1DR2tkey3uK5tOMeznf
	QcmN1JB6Z/jxoWXuOHOSm2W6hh63GkVxQ7+SR0A83orNO92ZyFiIoGH//XdsgVfIokgRF7eQgyYPo
	/r5ER9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbg7Z-0000000GQi9-1z6M;
	Sat, 25 Jan 2025 13:22:45 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbg6G-0000000GQem-24J6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 13:21:25 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so5523301276.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 05:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737811283; x=1738416083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
        b=iNdk7p1MevP1iV8Y9yZZT+AYFXkaEAHnK0fh1k5WhxXGwL43TyyjoH/WK3oXoX+1RZ
         JHv9ztdcs8xvbObKgnxgdTPwoeglYQzChW5atgI4sxyqOOpSOMoNVc7/y9frBjc2QPMq
         zE71df0SW9kO9W0/2w3caJe+XgxNTcTOdLibw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737811283; x=1738416083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
        b=GLvgVw3BO6Pldq2ZvmKQ+DtNm6hd4qsgS0Zp7mlmLeXzFNID8rxCYn50Jkfg2atMGF
         uVsxMNRYYCTkzmFujFGh6kIguMswZVKAjdvhlVgOyc0c/vlM7HiS22zVriLmcccLQB4X
         I8S0e/LinY2Mog14UHeUTnwr3ON1kI2OJ9gaVRX4UESxZnK8O27i+r7tMd4JdrLVO3vN
         E2U1VbJMdETUIj5TV8hjeJ5JUfiXnF/fd2m/rTl5SNWdm05admLDrncUPwdC/GAZpsRw
         hF7OLXkYzDKGjA6kTMi71UqFfB9+3Zw8xI5QmBIHSd9byHg6/D23wp8OpOK2ee6YJdbG
         FOXg==
X-Forwarded-Encrypted: i=1; AJvYcCXhjdDHUzSFMpknkkONXry2UL1/49QJCFiwp2I3bISgX8GkQMdEvyOjIedsMkUVE9iNhE7e0T5XtfeJupOyYX/6@lists.infradead.org
X-Gm-Message-State: AOJu0YzWJA2trXZDWRiRNDaoTMqfX3W71pMTNt2xUWYWuHLba3E+y42X
	v+b+HA1cSYxGHI4gQMSXaaMBeEroO7wKhe+kmmxVFEb8LY1y7Qf712lKkqDMabbZfPr/97mnzhO
	8y6XOAj94st1Rv70POkqolXAqM3TbQKLoXM2cVg==
X-Gm-Gg: ASbGnctAJ/48VhSeLT0QvJIZp4nTfP2bwGOUuTYiY8wWXevFS8HOrt3AbiOwEzycu3y
	MXBltkOqoFXPrGZczGKwR2B75ur7aCAzP8y6UBCtnq48JVx1FV9RU5Oh1bBuK
X-Google-Smtp-Source: AGHT+IEC66mHyu/T69Up/dX022TugdsmD0uulT2kpXSasOG+om+qGGY/LBwo1LfOlHcKiAvuEQ7Oi2p0ts4rAblyPzI=
X-Received: by 2002:a05:690c:25c7:b0:6ef:6c57:ddc6 with SMTP id
 00721157ae682-6f6eb937ac1mr261166397b3.34.1737811283560; Sat, 25 Jan 2025
 05:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
 <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org> <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
In-Reply-To: <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 14:21:13 +0100
X-Gm-Features: AWEUYZn9YZy8Owehe6KhYJIuvjU2tyrCD5F9XaUX2lhI1_Zpu924GXyOjD3iZ7A
Message-ID: <CABGWkvpeOyrzcU64pNxSYC7n-VOsjSEL-iD-_YqmCveGsrH-hg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_052124_539754_16D39AE2 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, Jan 24, 2025 at 2:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/01/2025 00:22, Stephen Boyd wrote:
> > Quoting Dario Binacchi (2025-01-14 10:19:47)
> >> The addition of DT bindings for enabling and tuning spread spectrum
> >> clocking generation is available only for the main PLL of stm32f{4,7}
> >> platforms.
> >>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >
> > Applied to clk-next
>
> Unlucky timing. NXP just sent this:
>
> https://github.com/devicetree-org/dt-schema/pull/154
>
> which makes these bindings obsolete.
>

Why have the DT bindings already become obsolete even though the PR
has not yet been accepted? The series has already been merged into
the kernel. Please let me know if and when I need to make the changes.
This is the first time I find myself in such a situation.

Thanks and regards,
Dario

> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

