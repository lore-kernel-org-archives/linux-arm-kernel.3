Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3211DCA100E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp4Abv/fzY5toSq5c8kjCytYfJxDDQ+v7rc26B0Blgs=; b=Q5fO4XNh0WoO2K97TDZi8DlP8X
	PQVw53lXoyqyv9a5RXW+lq+hBhv7ybQYMqa6ug5RfYWKiMuwC56OJmOmXdN1z/1N232wkUQudlpso
	zpw6wG1BkubefxU7FaDarFwkqOmW8EBWspLxQlD36RWxi39S3gfzJvpBgdyYrU4qJTgjuYcVd9GMK
	ItchZKBFmGo7Iuk2UJtlf0R9aUNEH0+LNPOfv8l4huIdadHsTZpEWnLPcyG+8yd/ulU2rBndpQhWK
	1s/B1A/4X7g6FFgWd+T4jZUzar4MSShyrlqjYEIr009z0NuO8vdql7iPbgXEZfiHSsOYnaz8rsEeu
	gnpvx8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSJz-00000000TGM-0ZFC;
	Tue, 02 Sep 2025 14:49:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPdf-0000000H3aV-0PUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:57:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f687fd3bdso5219870e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814245; x=1757419045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp4Abv/fzY5toSq5c8kjCytYfJxDDQ+v7rc26B0Blgs=;
        b=brwfaPL0C7HKtUHr21lffIJVIeMqvsCZe/+WSq9NjnqDEmBBIy2kJpAyO/rsCtYCZ1
         MEZRVFvZZtCcj7o/ZN7Z3s2FTvX9Gnvg+VmY37BZa9I85Lfw4cUCaUIBGXrOdp2FkdsH
         dGsSB+QxlbRVXYyLaIdLCB9QuwrynzWsQ80zFlvNMIWlbh3FtpBDeI5EnS+vOHGnlCfI
         iS0I7N3QJshimRJNfzmpuZjpR1Gj4BdjFO3QncC5y0bkOPn3TpvQOx7Cp6+AaZta9aH6
         OS4Ba1bLDBdEC98em9pINm73HFhlJuPkbopETC/Q5u56aJjrx55QfjnvCvJT1SeXhjDc
         LL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814245; x=1757419045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp4Abv/fzY5toSq5c8kjCytYfJxDDQ+v7rc26B0Blgs=;
        b=C/7qFVTIqJHQftfa8jgKzQtghUAkwLMs8xtpN/3Zi2eVSjm5zROm0dT/5boik+RZuU
         y3C3OU+9w/GBMfi3WIU7Sd8ayHwmoEdLRAZxSMiSILAvGxlfXjcy/WaVihTSYrmWg/GN
         C9Egzu5xrAvYqgd4MKLEmG1T60s2rPPzsr02Ljt6GMTtBejgauJC9H9yjp37Z5ttjJ6B
         YYgjRa1zpi5K80eg3eeb8T21eq6/7OlmBF5x0a8BGdKu428ZYrbJrfk2wLoKcclm6fPb
         H/sYTzDxLt9prti7+nKCarhbkQagBO2+/M0iw5UCDGd5+rrmB5RcsNF3S9QHxJSXucQQ
         ETWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWLsc1xBNqwvujZwwxRMLLp4DjiFurUQcR63U1RP3g5mds49uLhoygrMWbAaIRb34YvLlcEpsULfrbRL8awmW8@lists.infradead.org
X-Gm-Message-State: AOJu0YwG18oGxSiFht+UMS0bG1KDtoHENpTAaO89ZkGq0zSbcbuSYEke
	ZpZeA3AT/DChJTPbhQmkRS7zi9MYqg+5bUw4j6Iair7nJFM8v1FcoxA06HaIU93gkQfIYT2VINk
	JUANFSvSDULy6ZoF6aoduryUOlABM2RaUF2N8qHF5Qg==
X-Gm-Gg: ASbGncsPky6Xz2AVRU5tQDdH6tBf3vh7YZLWxtsy6XrFHUP1Hzi8EMG6C7o+TVuzK6y
	dtLuTxF4ZoRlR7rkunFm6s9cZs4MJQ+Z5E3dFmWo5TRF4AvLzA2nuyVtQECLqb3UCrxvu5ezUwZ
	wnQGbLbfLs0/i5D2rdrA4XEyI8q1/4S04qUlZcueMeGd2KKbb2likU30T040M9iBL13pSq2wS7O
	pDaJ1faMfDrewnkNoFWmm83fePgFkzKZN9s5Dm9oTisFmdUqg==
X-Google-Smtp-Source: AGHT+IErcjW0+LGFGJcHQchCQeR1Yt+GA9XuQLP2Vn98G+VTiZcJCdrpPfkwDR775dV3lM7lVH5sLJhNO5IY+DD19Bk=
X-Received: by 2002:a05:6512:3b8b:b0:55f:554c:b1fb with SMTP id
 2adb3069b0e04-55f70912819mr3298424e87.29.1756814244976; Tue, 02 Sep 2025
 04:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org> <175680785548.2247963.242433624241359060.b4-ty@kernel.org>
In-Reply-To: <175680785548.2247963.242433624241359060.b4-ty@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 13:57:14 +0200
X-Gm-Features: Ac12FXztQMclI5iZSDKTIUNQ7QH1_dUHxuo2PxWIXoNlkSSmA9MCP00AzVcpvI0
Message-ID: <CAMRc=MeWnrSPrLOq7yH71wpw4vP6RJiLnuLCpwXogZn0yugFgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mfd: vexpress: convert the driver to using the new
 generic GPIO chip API
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045727_374057_7AB022E3 
X-CRM114-Status: GOOD (  18.67  )
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

On Tue, Sep 2, 2025 at 12:10=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 11 Aug 2025 15:36:15 +0200, Bartosz Golaszewski wrote:
> > This converts the vexpress-sysreg MFD driver to using the new generic
> > GPIO interface but first fixes an issue with an unchecked return value
> > of devm_gpiochio_add_data().
> >
> > Lee: Please, create an immutable branch containing these commits after
> > you pick them up, as I'd like to merge it into the GPIO tree and remove
> > the legacy interface in this cycle.
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_d=
ata()
>       commit: 14b2b50be20bd15236bc7d4c614ecb5d9410c3ec
> [2/2] mfd: vexpress-sysreg: use new generic GPIO chip API
>       commit: 8080e2c6138e4c615c1e6bc1378ec042b6f9cd36
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

Thanks, you haven't pushed out the changes yet so maybe you're already
on it but please don't forget to set up an immutable branch for
merging back of these changes into the GPIO tree.

Bartosz

