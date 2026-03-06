Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371AF513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut177twL0PacBE2z61Frj7vgbi2jyi6u2nd3yBgDyD4=; b=Tzu85jHR4+wezXA2WyP9cEnt7P
	68KLz/Ua/v+kKx1dihfHPVfzYKuE7GXDI4hIeR2bO+iRyh4BLR15yRtYz6PkorSEkYEulCXoe0Od7
	mC/AqS8Yd3lFTZsXTZZfFQIfbwOYMPfHMqT4dOfhSMye3XOye+EmHu1kbmxDEBStSW7Fw6n98KGBh
	ZIc3OP3+hQ9UHV66ikVzKdLTNnFuldLK6vNSjhOhW1eMMQ89heNA/vYAaUIKA0pC3SGj7h/IPK+rJ
	TAUrJUQ/UHkC9a4jsyi2RtBz2uc1mlXi8h1POzO088E7WvKQgBJF86mhPOYCOxuPSVVxY2St4aC2S
	T8kTjCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJfA-00000002ocw-00QI;
	Fri, 06 Mar 2026 01:07:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf7-00000002obI-17oi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:07:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae56f8776dso34144155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 17:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772759248; x=1773364048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut177twL0PacBE2z61Frj7vgbi2jyi6u2nd3yBgDyD4=;
        b=TNyUSsVnVvuSczKtNvdKHDWrk8/tr4nKG+kcCDZZtmFAYyeEzhI2etVRW1raeyICqM
         o0IRpIJ9EX+i3kbI+Tar1RzJybgUaQUbsqDvX6z1LssyvmLoIB/uBtYyGB8l8m4eUh6u
         wCINvS9cu2D2rIhibAIPu96/4IWZhMwy8Whaj98IZEmPoADDeS0Xl5nZVfIYZqTCqIgZ
         q/ffxoWgWiLa7ABE3xWft0tAxuzTbK7An0hgvKkVGc2ceBKl8QijHLcZE3yDCmsmZGmr
         AO1uldEBMudOeNsfPd+SWBxm37dnJa39MrCgo3L6AqM68W43tRfXyXHq3MB7+/SbzB2l
         Gc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759248; x=1773364048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ut177twL0PacBE2z61Frj7vgbi2jyi6u2nd3yBgDyD4=;
        b=nPLNu/oJfjuGWeDuSYRZ5N+0eMjQu7KRXmnFLSHSHh6rPQ06Rvrh0lHqRYZbc5kbLv
         gKf7pbQTXNfDu308soiZpab86ZDBgObUMvy2EzbVG2ELKVEEevjebl2o7zuoP7Tg9c2k
         k/r5iC0RlkzOqM9bEZ6SwWBv/7Cw5qVOvEoLMDb5/Xc375CUKIndYrrRku4wg3RTsijQ
         3UiPE8yhil7VAjk0vu7GNyYPNVZbaEYcUW3ef4v0dFqfZQ4DMCgXtFyafdoQWFrbEttX
         rgSXQaG+XtffcR9D+zpk4vjAaXPE6ecajSL88NbnalFeI8XtAvsYdqhTNF1+IwMch+Cq
         tH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCURh8NB28fA9NsgahNGt2oqdqlK/cacspJXUdpuKlYaMHSoxjeAaavo0/L/hSE2HdtQjsY39sAHObHtjCdwHDaV@lists.infradead.org
X-Gm-Message-State: AOJu0YxSoI5T+UtRQeLFlVQo9pDrGLIq2VhonkzxdLDyuZ1gV6loXwcc
	kbYvuUu5oBal7ldeKnzh1gzTMf4B17vzPJKZlp7gkf2E6HyiLtqcEzhVgerYhqRDtZ8=
X-Gm-Gg: ATEYQzyZnVvKP0U/znc7B1NcBwhyjh3F5nrLf5TnDSIu/0JB8/m6jy1WHvdZMvLiyZF
	Wa3hNaJiC4uKQHSZJQiYKVX6fMTCvWkbAA0W2J8kNTWJlvvYC6l0RnMe9MdJvt+SfABNUAa+8Xh
	E/ItIVkr6eCOtztLHgmMEDP/iYaD2im1o8cb2niXzJzvXrveAVxAVI6CBG+P9URqQQL0a3EtAxX
	eYi1GFbdoInK8LpnbtxZFvpP2XOMoUUaubgXtf1+vIs20odmRob/CtfqSqEDQy8DgsNBxjXbvfS
	z0uL4sExEYY40DSy3bJgvu5S7e9yK3HdtAxH+Lw79gN8K8XIkSQa21XL7Mdl7vKdXNMdnkpHXnd
	gr3vWcdhhMf62QX6PKE86+Rr8quizMC0Ba1LSpTnHTPm7Jp2TNAFpir49ax5gdG3rI6Gk6ArnLI
	PCKvw78js/QT1k1Sx/ieGg
X-Received: by 2002:a17:903:2411:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae825373b1mr4708775ad.54.1772759248437;
        Thu, 05 Mar 2026 17:07:28 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e68a573sm95459485ad.56.2026.03.05.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 17:07:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux@armlinux.org.uk, ebiggers@kernel.org, ardb@kernel.org, 
 arnd@arndb.de, geert+renesas@glider.be, tiwai@suse.de, 
 dmitry.baryshkov@oss.qualcomm.com, twoerner@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20260220184336.616623-1-andreas@kemnade.info>
References: <20260220184336.616623-1-andreas@kemnade.info>
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP 3/4 related
 configs
Message-Id: <177275924729.1445909.1247430469685908669.b4-ty@baylibre.com>
Date: Thu, 05 Mar 2026 17:07:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_170729_316973_14EAC6E2 
X-CRM114-Status: UNSURE (   6.98  )
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


On Fri, 20 Feb 2026 19:43:36 +0100, Andreas Kemnade wrote:
> Enable drivers commonly used for these boards.
> 
> - CONFIG_*TWL*: PMIC mostly used on these devices so enable all functions.
>   Especially charging is required to avoid having battery drained.
> 
> - missing SoC functions (watchdog, thermal, sound)
> 
> [...]

Applied, thanks!

[1/1] arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs
      commit: adcf290f9de2fc4768e5ba07c700e91faf9c86bf

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


