Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E6FCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=; b=n/KlBelHPZbLbAz2EPfTd1qiiG
	4qN84oPuwK9LfQfWttHBKp/lJUt1ot2VvKAvtdYC1vg+I/+Z3Ja9KLG6x3i/uQreAP9Ai2sfhdfio
	c6q6gXvroFG0La04ZVBFUb5a1Lz4KRQ8qt1BKV4lfg00okgXeyWWnpMfF+MrW8VWpbtFeMeFEXnne
	bjPZtBjPsoCZKCrC0XQ75vH4ot/SSrQWAh+Ii1+OGJyn/qhjc4Lk/N0Ys4H9eMsQF9Zr4laqhz4EZ
	bCnCWGOcUEyI/YynuoCzqaOd/viz6zd2IaO4qpx8VmkmiCjoSAuUugZOWRMYGDZiuylwITgDZQepZ
	2J0PXzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndZ-00000003xd6-1TSm;
	Fri, 29 Aug 2025 01:10:41 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjO4-00000003Bzx-1MKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:38:25 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-333f92d60ddso11597211fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756413502; x=1757018302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=;
        b=Md1t/zmqVZOB92o4awwFV6Y8WRHQOiUXJyubhvtDWnVYew9d+n96HQL4xlDTcsiibS
         m95xb3MvvhvlUj0MWngdwMaTq3PwxogjDaKNAuyKOpeesYTApWSMtYTOExEGSvh0OpwZ
         MFx6kUfNRCwNt9iZ+kfPf99gnhHnmajNKb+Kd9zky9CcbVYNqIbyZTvSL7IYSKUKFw5w
         0v62aB51PBdQO9A2vbyrOETYA8L4tNKeZVNF/1pA+MkUGG9LWZRAPVKyZOkNGwqlzQQc
         cVhor09JqWxcQenJDzKZ+HOwY/JYd1q7TISrXF1vp21VuSaYR3dIM/43Swy7Q+oUJuyd
         GirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413502; x=1757018302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=;
        b=hyl8KEdIWfHZLfZlp2VTYgZu9q84I85h2qmNGuOGEznuBzPCAXF+ptuQ+L/T75182j
         BtFGAu8I0Ypq6FTDG9nWEAxnyJ9IsO8X2vwt+HFX17QnQHSoIFSZ0bYj7YpXqlMtvLqv
         bdgycF877sMGhY8+pqYJRelbpTEjEgKzqfTd/J/J8tDIcDbGjHXLbLmr1u6u5xJ2hxJM
         Vwn4R5CopuSpA60EyPdko8ORu5l2jdxpRjpYCxrqPSB1jdSJFzfNrtBwGVRc6Rzmp4Kp
         EdGHTxBkligzixLodf8CQaI6QqnkO+UllM4Pir/OWSqXrALGAQvVqWWM5fwXKCBGSw6Z
         IuqA==
X-Forwarded-Encrypted: i=1; AJvYcCVg4QAlsKx+qlXaef0bzUxcVhqxa5DGSiMbia2yCYKKCydNdgtX5Xg/Nrqv8LwskFabclsmsdn+9SSzr78ppjFI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk4yTNNE5E1xDMfGEhM1qyOBPY7woQ40/LNTosoaHo86A0UsSH
	B54sP4iMnCVaC8vaBAKK8un3Y/OTauHJz7t2hd8itUDZn1ybZ0RLT6krQXycU3uNQUbcfPT95pA
	NYRDlJFLqG6izzeDXR1zp/lQGYLBelofgs2WeYJAaTA==
X-Gm-Gg: ASbGncu0nlnREYUKCQOlC/X2IKs18sdC9Fg86WPcnwhoUaHuX1HtqzdrlGJoNBx3kwD
	QPlmzUjjwYTzqw8HYA7MF97zfhaaBmSS+CDwhHEN3YHwT9O04cRsqW6bDk1r5HQwh4OVWFpE5QK
	nPFSfghmlhqt946lT90cfAiCzYmo9+puDRkvsq7gtgXJRvtG56gMsH+0/dB0P2770kS+ROxzb9t
	7vdXDctMcviI/36Bg==
X-Google-Smtp-Source: AGHT+IGFctSS9xIvuPsDh46p14WQZ80AJsz61TeaeY863j+AA+52SQqM5uWJISSdTvREAPPmDBfGMmRKqf/htgUE6Y0=
X-Received: by 2002:a05:651c:1508:b0:336:b4d1:a304 with SMTP id
 38308e7fff4ca-336b4d1be3bmr1583191fa.44.1756413502286; Thu, 28 Aug 2025
 13:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:38:09 +0200
X-Gm-Features: Ac12FXy-IwjUULMJvRyUzt8VKPtHqknlXLB_SFxBVFF1kcuFfQ2Q2i3x0YxAaf4
Message-ID: <CACRpkdbcWiq0xCVUwh9VZ+_JU9XOu=SgVKHr2YMSuv3Bnee+tw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Yang Shen <shenyang39@huawei.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_133824_380188_5DF370C2 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 26, 2025 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All patches look good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

