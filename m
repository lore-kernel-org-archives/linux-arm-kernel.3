Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94DE74AD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G33sr/zeO/KNwROltqYFJOHkNCcSFcaU2C0F67a9tG4=; b=ZrMa9MPjOVaf5L6EJzmYEm5zoR
	18FPwv0aGVPiuFUtw+0xC+VrZ2AR85iJAiv6YwaezlLwLXloay4lV6bzVfpAcANX3xIphEJ602r13
	r1YKPE+charOArIjsxcJ8d9/Qlt/3FCdG0YLU4pKM6igbOP4bJ/7t+Tu2VzF2jU3pZVkVT3K9JWF+
	3dAcC2mvxNAKt7xMPKGEGghZyzuBSRDXrGSRBqjCmVYDrOsLA/EWTTNcq0ib+sEmPBC/wH4ZNKeWX
	+xJqI7QZ3N2G9GlWTOPDoUNBFVNzPRIPl/DdB//uVQRFRG34OIIR3mQrzx4ZvaCw/NxrqL1opaQSb
	5KUIXOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZXJ-0000000AdZy-1iDF;
	Tue, 03 Dec 2024 20:30:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZWF-0000000AdQR-2W1U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:29:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so5283072e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 12:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733257753; x=1733862553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G33sr/zeO/KNwROltqYFJOHkNCcSFcaU2C0F67a9tG4=;
        b=PGvkmQKy2s3AGuG8SUVyPublusxtwKgt7MIn94ByvXA9ThtUVTgrlzNFIdc/hd6bgW
         CSfHvUR+gQlq9Mo92TRJg8mqMsl433SsVua2reWtJXkLVmCFB7p+HaJVhQ9Sshc3ujbr
         yzgCZ/unoAk0PDFbRYYasMEcbS+acy8DlmGYGhU//Uq5HlxaPQT1BM3CZtTAxG2uAfgy
         p0ID/Bd2vRirn1BI20sCgJ7V75qcRvhkTOUCaH6sQ16UmOHOqN7tQfMDSM47gyqvoD+4
         Iuo+jXA8OeiWyKGzsTnJCmG+WGUmWoLkHOV7AwhdId3YGp06s0fgryGf9R6FjnzL9OO1
         esiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257753; x=1733862553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G33sr/zeO/KNwROltqYFJOHkNCcSFcaU2C0F67a9tG4=;
        b=eVLkFYJvnBogtwCdkJ0aIjTykhYUwmp+8l1uGcmlZewg9baOxpfkINny4FlB6coVuk
         55IjOWyMzZFdsbpJnfc5If2Wh670PE5Je111bItmfHZ25SJSBcmGcDzPwkkMNPxJf1uI
         dVW4cuFmn2JVjEt6NGpigErLeMhsQ8w/psCNMEJd/nHgS+5Dt9mIF3JwU1mhxlcTvDYb
         KAmTENDQWUpqmkfAxXKkY3/4qkw4CNqiOnwUYT7lA48uXeycPLVXKpM1Mtaoj4qNQ2BY
         TdRSlYiTgIzkzOtGaW1Y+i1MOVr5T+uk5U2ClBZSzhUJX+6KoP8P965vqcAJeJNvnUha
         ADYw==
X-Forwarded-Encrypted: i=1; AJvYcCWENcH9wGPCk6PQPnYnNI9G/dApUAh8zEAC4AjOIz7Cfm7uFZWN69h7LheIYD4hF9wK2hNiLESqUHDblM11MqhN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1alNaq2KW89xPZ8xX9BoVlreZXqxsUY76VfP9OrvBO69HUQbw
	UyfIg1NtqeI4bOcYGFn+u99A7y1MB2m6eo4AuXl5k4ACpyXKRPVQOfCQmRxjs1dR8rVMfP3WQQI
	j+hKOSHpg9VP7d0pS8Fl3a+a+EjnT0rTd1sXAhw==
X-Gm-Gg: ASbGnctoHViZ74fjFkpKnIwVCevN0wQnJyrtBQiBFRULteejJHqGKNApL54XsSreDFc
	3Cmf3/x/SybzKX4FY6QMMh5zYGpb9ygY=
X-Google-Smtp-Source: AGHT+IFibD9nFMNX+0okWcr0jW9dG5zLnrxoOl37S9ED0qKXToBphOFXAaG0TMap6CEbrI7BqpcPt8HoQ70SurfLgYk=
X-Received: by 2002:a05:6512:10ce:b0:53d:a4f3:29ed with SMTP id
 2adb3069b0e04-53e1b890148mr621166e87.27.1733257752908; Tue, 03 Dec 2024
 12:29:12 -0800 (PST)
MIME-Version: 1.0
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
In-Reply-To: <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 21:29:02 +0100
Message-ID: <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_122915_640125_DAA92154 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Dec 3, 2024 at 9:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > Merely enabling compile-testing should not enable additional
> > functionality.
>
> Sorry for being dumb, but i don't actually see what is wrong here.
>
> There are 4 GPIO drivers which have
>
>         def_bool y
>
> COMPILE_TEST is about building as much as possible, in order to find
> build bugs. So i don't get what you mean by additional
> functionality. No additional functionality within the MVEBU driver
> gets enabled by COMPILE_TEST.
>
>         Andrew

No, Geert is right. I have been yelled at by Linus Torvalds already
for too eagerly enabling too many options. COMPILE_TEST is really
about making it possible to build more things with make allmodconfig,
not necessarily defaulting to y for everything.

Bart

