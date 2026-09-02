Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DDEC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=; b=vIoIhLQpK/QHMmp3FCF764XUEH
	cBlTVhF0Epm0BaHFicmyNpjuGDTfz7lemt/jmgCX6w4gc233lqNVyY56W9VDqM0mHzQB0I4bFehfs
	C4dGwf7K4SQuTwEQviXv8A5Xays9f4czgLCbpmd3+lES7CODv+z14FeUul2yZLBJ8TWyXRZyMmIU8
	TecTKtjXA4yQuj5iN3JKAoBoIQf8EKtOJAS6zFYidQzmoft8Wjbailz7exZy1DBCvw/QPkXkqFRHg
	APDETcwYe/kPIA0yx4INFt2QaPGMbTeFgRtOIXgFr64D7/UOV4rzQdj0ejdml9NxOIV+nmYO0vakY
	6UoewT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tOY-0000000G03r-2fD0;
	Wed, 02 Sep 2026 22:25:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tOW-0000000G03X-3FPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:25:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso13331565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387923; x=1788992723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=YoXnzPLVyzKJBs15EV56yIHtpC/Yt7rBUDbalXVnLxloaQUEE6ZLQUqpSZl8dRUsF3
         b9aXzBaITMvOoGq4UNjuxmqXnRLehBtncdsKY1er7H1nwCXXuFquKTPfvloK4GjZBcVr
         5VBL7AdCl5uKRs6HyEKUqb/0ECaA8NIRgz1bhofoECkaulSs3ovn38mFv/JqV2SejDEF
         wS100wE37NPx+hM4hPFTZD2FWYzeYDroZPq+VFROqNZBOIZjXRAT3aQJ6wUW1HGMLIj0
         3QYeP9FogBZ3ZtoxlO9PKdTSUzPFM4Uoe/mQTFfM5tbZC3eGnK2dcsu8JOD/+9ZFIR6G
         oB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387923; x=1788992723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=DBPTr5i5kNaPLVVx2oOGY/SOMHF/QVSaGjoyyvtQZziFMDqDtyQHHNlMNrrN1Gs2pa
         KLii6TiOm/wCZxxz3Tr+xfYrk3nttL0ELDymr4ryzsXwGJ6U0dFdlPgqjuV+PVuw2HFh
         vuq2a7ZmFr9hsSzoqJQ2pfGm9VGBaI3JZSiC6zBidC6Xs7bKykRHrXesa0pb7QV51PV8
         zruMpmgEQYkygceB6ruMwk7dtPRPQ0AZugO+7DMnZYEWDA4prDVYzOTnAjnmTz2qUgQo
         Hy7wvoZ5m/BX12fO4q5dOPpirzbxTcbtl2GljLE5XBuQyLDJdsFGkyXcxRxzcHiKlO/i
         rTZA==
X-Forwarded-Encrypted: i=1; AKwUvByQBv11w+UDPenqlMHuqGaSUH5h1UvT+edaYejxIweYtu2FuTC7h8hQAhHHPH6Q+vSedlB4bIIeu9ynVDC0VrJN@lists.infradead.org
X-Gm-Message-State: AFuF++krvc9TXLWjHGcHpGr5/btctu4TB/SyKH4tB4tiPF6c8T0mEhXU
	LyLZ/EKAr9WlfFwZ6PQQZaDZ/7TyzR/cx7H//qsnA6mvnbelCNlDyHZR
X-Gm-Gg: AYBFou2Uzpvczu3+piKDmrvhtMdoQesdezWMMQFj+H9qIQq6XHXQpgW3vKKQWI1qN0z
	SuvLt8BDPwbr9t10f9OQeUnnd13U7BG/I7hdCjWHzDWIi+STv7W7FhMou4zMiiv4pHk3ifc3UNX
	4I3kocRebS3lHGXf3Mtn+eKqtv6v2jf770CR/j8ja/KGwEjR9c8RoC8UzCiFox5LLa9dFMp3srw
	gMZDyTc6FJ3Sd8yfkiT5pilIfZnxkKTtAZprK1IFKlqVzuYM0LICJXeRRZh/WD2yvB2LYneEcn7
	nlPAo4rN9Jsao2TdZ6f2oqSvhnCLsrNvCqsCW/h+jQWEcF2rZLgzZfzhcPXogXgYqJlZwr5Fd0f
	hDRBPV793AuRw0uek6Fqxw769cSJgmh/bA9Ot2GsmS/MDEyfOM+Jdej2ZW0EOYNlMdlQiqyYDO8
	2ojXbv/nvHQjaqNprKAPS2D7HnmgTJrv0yhO+VfupaCpMBhkjMZYWFOcxy48HT8E+3Qg6P7b1Yq
	oIk
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr157349195e9.3.1788387922631;
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm20916915e9.8.2026.09.02.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 00:25:21 +0200
Message-ID: <20260902222521.1752085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
References: <20260902154525.4090276-3-mehmet.fide@gmail.com> <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_152524_828466_CD1071EE 
X-CRM114-Status: GOOD (  13.10  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> What about just implementing generic optional get_config()
> in struct gpio_chip, implement a likewise generic
> gpiochip_generic_get_config() in gpiolib and use that as
> the fallback?

Yes, that is cleaner: gpio-mmio then knows nothing about pinctrl, the
same way it does not for set_config today. v4 will add the callback and
gpiochip_generic_get_config() as a mirror of gpiochip_generic_config(),
with gpio-mmio installing it for the pinctrl backend and seeding the
shadow through gc->get_config.

One detail for the generic helper: with CONFIG_PINCTRL off the
pinctrl_gpio_get_config() stub returns 0 and leaves *config alone, so
the helper returns -ENOTSUPP there instead of pretending it answered,
like gpiochip_generic_config() does for a chip without pin ranges.

> I don't think it is necessary to provide any consumer API for this
> such as gpiod_get_config(gpiod); as no-one really needs it, we can
> keep it as a private thing in struct gpio_chip for now.

Agreed, nothing outside the chip needs it.

Patch 1 stays as it is, minus the npins check I already told the
Sashiko bot was redundant.

Thanks,
Mehmet

