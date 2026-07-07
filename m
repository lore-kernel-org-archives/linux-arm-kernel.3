Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=; b=TYMqGAPDCXbJdCsTLhoSG8vztZ
	h8wBmKYLoRbjcelYwcM8mFo5fpgfk4Lx2J4QXjl7b5jEC11qbF46VEx37464OIaDg1NrzTnbkcQOl
	QCIq+vUiVc6ufsdBZ3koMThmMU2UXhD42vnt/3/oXVEdjWu+bXVYQt31Swp0H6sWChg1CrY3zlHS3
	cYoXyuyXKJSbukodaTSa36BbTSxk5M4fYmpPByUNW3CVPGx9QKd4UEuu+OQXuho+729eN7GPdnqj3
	RJPr6j6QfK/IznqJvgifjx2h0ve+snEjMN9ZQPc3elkqH0hVZ68pgxEflXS/mGwvovcMR/Ir8A1X2
	CPIUbcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0qb-0000000EQ39-332z;
	Tue, 07 Jul 2026 08:08:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0qa-0000000EQ2q-3y11
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30342618A6
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 08:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEAE1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411683;
	bh=ZFqJenKHf79crL8FtIJ8E7FQoJ2ItmaH9orqP1Mmhj8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lubf3GRN11yRP6pd3XtD9CF11ay8H0xWcijybnNwc7z/zgJGFwiA9v49GBdDJR4rJ
	 ZaUXrmc8fi+RcbawHc0XdafcLMy7Ne9Oh4Rmf3daWSPmcgDkxcEzVzw58z51lKGTbX
	 LbfdEslLiW9k7O5LmKtKdKGpPIYcRfT0v7OfH5lOJ4dpPxpw7mHkeKNXLglno8Aroy
	 xtQOlbf/E/z8EPgv3iuwElMi22LJ8OaESFnyzk01ih6p9XQdVPsUQ7bjCQV5wp+Vq8
	 D7g/+5b6lEvT7WqtG810HEZhLbyF/OBlOH1RAOLKRxCf5+aC2mjf82HvXH+wQR723n
	 sXZoMrB+zi3pA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b3027009fso31578011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 01:08:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYdK91Mi/pILir5chQxqd0T1qIaHyjupcU5qOjF27PwGrBQWNy
	bYnlrvw+LLg3sp9Mnvwka8rHPGqHFzuOwUFF2ECWtGIwwzL3LAV3pCVeYnJbNOY/jGJSxPxwX0I
	iCJJMhqr8/FuAlPOBMFBpEU3vkVAIBmC0YEsRx/XZ7g==
X-Received: by 2002:a05:651c:551:b0:39c:6927:5c0e with SMTP id
 38308e7fff4ca-39c69275c6emr4674581fa.18.1783411682550; Tue, 07 Jul 2026
 01:08:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:08:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
MIME-Version: 1.0
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Date: Tue, 7 Jul 2026 01:08:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
X-Gm-Features: AVVi8CdXMJVBF0F-w40gf2-4DxP-Pr9ZrnyQOzWnxVH-2OB9v_JiQsUD63iUHTg
Message-ID: <CAMRc=MdfRs13TAqRqwff+=v3SrTXynyhCb75udG46hmwTRwuKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 7 Jul 2026 05:13:59 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts StrongARM SA-1100 evaluation and handheld
> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
> (struct gpio_keys_platform_data) to static software nodes and device
> properties.
>
> The first patch registers a shared software node for the SA-1100 SoC
> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
> node directly to the GPIO chip prior to registration. The subsequent
> patches convert the board setup files to define static software nodes
> referencing the SoC GPIO controller directly, allowing pin bindings to
> be resolved via the attached firmware node without relying on name
> matching.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Will this board not die? Anyway:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

