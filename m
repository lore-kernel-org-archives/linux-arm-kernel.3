Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FD1C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roYBOgtGzUsHXQBIXuQZWu8SiQnbw21Lb6vf9yQV4wQ=; b=QgDMi8EWm8Gx9SxAWkAbSosxVA
	okmbO9CaWPF6crU0VlU1mh2+uGXfMfpLtMqwf03x/AmZ+qFI5bFCfLy2ogBtrOjoxgMmtZhuUsuFf
	I1hjKH6RTky4VH4yDFY40DmiNZPT6BEc9aIgs2Qchul1okmCN6FC8/a4+dznFlMgbSSojxH2eewTw
	SwsmWSx1gKO1ofMPN+lSGd0Z7+quOTIQv2UptTXbGd0f0In1D5FR1gzLmnKhyDDdug2AXZv4aReIE
	m880mmg0XVTwAynl5FlUv/+HUw2cmIGgEewKIYa0BdMhb45TK4NwwEQpelFJSHhMA1Yd2Hap2cPf3
	8i0fK3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1z-00000000N8z-293b;
	Tue, 25 Feb 2025 16:43:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwuF-00000000537-44XJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:31:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5461cb12e39so5543972e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497494; x=1741102294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roYBOgtGzUsHXQBIXuQZWu8SiQnbw21Lb6vf9yQV4wQ=;
        b=LDonessgIHWCNNQPCPrf7wugb1KFEZ4Lx3PfpeT66cQCSHBUNdLGO6jGKN6ibLofJw
         3wXMQohNtvipjIPuqjy+w+1a/MCV+pVCKwb9yz5UNKjSatjV8N3VlRq0IPFtmgMSusC8
         T++F1c+PClcnEsi3l0My8qgkpTmFe8J9E9cJ/1sowqbVWLYlxVVVkdWymtBrGh2G2Z3M
         6bpkZZuhExpXmMKC4NV/qQ5EpCvyegkbw1n5Yag8X25IZS+NwlSo1QywB8yrTCnf53Ns
         6tN/q96H4vkH0kQ8WsFodKK+SwjARMT8oEcgDBGVYWhZySZc114mzLTPFoz1bsZQbV9+
         MymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497494; x=1741102294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roYBOgtGzUsHXQBIXuQZWu8SiQnbw21Lb6vf9yQV4wQ=;
        b=YOScZxpeaGoFDljw4VaegcmG8IaCIms04Y8mZkRICH9ao/gJV4/wmEnUTe9uxNvL76
         Wz3h2e71hceYI6KnjoTC2htVNuhqVItHViNvn6hnXbnv3570Z3IOAtMfBEmiygdlLb0b
         3yGUzNNXhcEp3U+yM/gk9/8t7MEMWFQrrW/issHU9w/iAJwsHbuKlcQiWHru8/adHYtH
         9XW+aK+Zj+bZA2UklPJ16PGitAsgM9c7k1OaNZV+KBP8rVS4uyw1UbAsOIh8ijBw7hCP
         u00Csdqy7Ii3pR9M1axdS0AAM6gY/dJY7JI5/DvJNt37ar4SLFOX3N6vTVGzjE00K19m
         Z+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCULP9OiZPnXXN6o7DGH8uyQ6BrhpTiltW2ShrTyGXOfdGWZ5BPxB6UolNQGNpI1V3+JNMm0nV4unI1r37WMblrK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx+5j/+punK6Ko3wDcj81IcipiCY5gprmU5V689XOIg2I+acpg
	Nv0uHdfHIfqcnt7SrCEfAUqoB9ku9ebJ38XxtYxMmKEx3AGyNX9O0Ra7gt8R8sQuKSjHd83DbC+
	K/EsQ/QY1PdLnWRNm630NgdkiJyq1Te2PxIR2Gg==
X-Gm-Gg: ASbGncvBkgpTDq8Ypk+7oqbIdfo4SjqxoP20lfhg+AbP69dyzUWfVDTEdavk1q+ehwf
	AXaqBOS9vw3g7rrUoYrwbgkQ/Uq049Ey42A1L92Syo5ZUlo1TVZENkjLvjmEGGoImN8HoFuEmKL
	9n8rqcYzc=
X-Google-Smtp-Source: AGHT+IEv8sW5Rf4zOcIAVA9dNYgFhkXoWsDkuqwaPaAQjPElrDg/4tWrxkT/p9rUgTIhAQZij4qx9JhUQwq8UCvtKdQ=
X-Received: by 2002:a05:6512:280b:b0:545:bb6:8e41 with SMTP id
 2adb3069b0e04-54838f5b913mr7041479e87.52.1740497494049; Tue, 25 Feb 2025
 07:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-10-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-10-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:31:22 +0100
X-Gm-Features: AWEUYZkE0B0UpjmJyEFbrAVTIFpOAVWVgLL9JuguQEW4Mtoe1czJXzaBv81bD3s
Message-ID: <CACRpkdbZmQxtVqtc=Fw6kiOe3NdEE2mBHr2rKXLP76U7Dguhgg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: morello: Add support for fvp dts
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073136_009253_3F189B34 
X-CRM114-Status: GOOD (  11.21  )
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

On Thu, Feb 20, 2025 at 7:05=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> Introduce Morello fvp dts.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

This one has the PL110 graphics as well, right? (To be added
later, just asking.)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

