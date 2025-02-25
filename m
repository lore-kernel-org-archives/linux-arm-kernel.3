Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7CBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sM8RqSivE/xijYBrIrwfNgjHaRkEy1XyNdDEacWwgY=; b=Rgb6DNDRSeZVuCgCbL7J+lzNgt
	nLuGWG+Q4R2fYtxXMELz6IyrpdpXA/iKBty9Y7DSQKJZDa99V0qq9hovuigNjjRsKHfI5chLb6prq
	p78s+1Tztjgcz827zVM4uSil4tWPd80+PT8426WVVa+5MTjAFsvhF/c9CemyZi9hcLuoF00qmCo6N
	jTPq0k+dDlDuEkkJMWUnoxk5ywe3Mne4BaJ0sVOhGR4AWV09vXv8VdhsRw0AbNTEHFyPZXadAf0FI
	9yaIsmTdxaBgIXA88WdhO23IKKTFnfHl+DLz6juKBbP6bWfTEoxMA2n/7iRsK2946KdIApsZWgSU0
	jPhDBN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1a-00000000MTg-2VlX;
	Tue, 25 Feb 2025 16:43:14 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwpp-000000004J5-1TQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:27:02 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso65460831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497219; x=1741102019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sM8RqSivE/xijYBrIrwfNgjHaRkEy1XyNdDEacWwgY=;
        b=nRGz471XFhsVliCnSnErdZp0ZYDM7I3sxTFhdGZOyL5KUpajXUDZVVyGJ9JjL4tYFV
         14aDW8V7m1do0p3chzPtloU5P30dFW94h3jV4WOK8/iAwFu2x3lioghyO16eJGT3PJM7
         QuVnnCv92ezrfMR920YuTgZ6zrwjCslrBsJx8d5HFH6alnF/IhjXTdhrRBIqDvE3zfhU
         VqG339KI/DEXezTgGJliXIXm9kb6/2eeeUVMoWHx2hJq6oU0mvF0lite/zV6o+6MLcjC
         BD3wN0wCugBGzdX6DgDh7RtJqP49AA0V4eBafKsuyN/Ias8cJOLYrAgb2rry8hfQtIiv
         tMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497219; x=1741102019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sM8RqSivE/xijYBrIrwfNgjHaRkEy1XyNdDEacWwgY=;
        b=YSccTTzZiHJSWhya+ObMC3RTRAhhSeyH2BEHD0lW3epnXQiFssDcHZLLx5OlWxY12Q
         8ViWKHJ6yK8YXn3EA2xbny8gvUBWYg5dM7GowXpUqyMBQws7MFa1bhu8cmLmaLnbgq60
         gdPDru5gDRuXBHira1MncNNBgNUjsMKyFCrEh7lJukF1Md5TorOc5zWKtckbajs8kn9t
         6PgSy+eYTZatX1Hg+RJbT6i1xcUzwI7KR/zU3hS5AAsK0l2PDpiprCkcZPE1+D8agENL
         SsbTJuWfpIDL9u16zMeR2hVBHSx1tC9pJ60AfdzA9e4O8TvSdryd+/ktLl4yccUBBG/3
         sXyw==
X-Forwarded-Encrypted: i=1; AJvYcCXPKm4/FbNGfSrw0PxgzdORJG8x/+ZYPHgKu2YA9SNZUt5mwl7cxCJ/QCKfFvHo2tpnXPXpj4S2jvapD131b7yj@lists.infradead.org
X-Gm-Message-State: AOJu0YxVKESOEgBob60WFi0wyBAS1EHyd9Q6yE+IIp5rb3EKpMpBdpU/
	hPhCoPW658iP5M0o/UHhEgawOWSPRlO/bMmR8U8rDtkkwdjORQFoJKwwYDLHg1qNFgSpQe/3hKW
	CA7hWntWJ+ah9GbtEipVpywX1o2P+YgMT8SS2TA==
X-Gm-Gg: ASbGnctqyp6ZmQFeOUy+z04jlnAXhs0AlYZSyJhwqi/pfmCXxZj8rRVvsEq3lL5MZUW
	diubtIyd1Z0P9MWIUq2FVq9aUpZbYyTPq82WTgRDgPtE8Wf4LMy41LM/EI2mFrkrltoxQLHDAkI
	uc8B75JTk=
X-Google-Smtp-Source: AGHT+IHg7AciF0bOLP9nYBodRe65E+R68WKpeOCG+glocpt21vjNyZNITKVO4J/tYQr2I8UXgNxYdWfVSbUB/YTUxlo=
X-Received: by 2002:a05:6512:12c4:b0:546:3136:f03d with SMTP id
 2adb3069b0e04-5483925996emr6834200e87.35.1740497219178; Tue, 25 Feb 2025
 07:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-3-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-3-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:26:48 +0100
X-Gm-Features: AWEUYZn8W5PQymPGlQZ6IJQCW62-Rmi8JGi0gK42ubUEcFMkmTbqO5GmXG6Hy4g
Message-ID: <CACRpkdZzUpgFvuYRGUwnNxonQ_TM2DOsAh5188qJ=g81v-asiA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] dt-bindings: arm: Add Morello compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072701_399447_9F242232 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, Feb 20, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello System Development Platform.
>
> Note: Morello is at the same time the name of an Architecture [1], an SoC
> [2] and a Board [2].
> To distinguish in between Architecture/SoC and Board we refer to the firs=
t
> as arm,morello and to the second as arm,morello-sdp.
>
> [1] https://developer.arm.com/Architectures/Morello
> [2] https://www.morello-project.org/
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

