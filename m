Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F42F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=; b=MEqtsu/NyvpndtYqdQfDrpUvoL
	fzaR5YwcDwlwOoiOVvlZAOzdhR88TePy5pUXiTJdUp8R9yHlbz3f5G93xff5ly/W/PBkHCGr5yFNe
	DZ/bYbq8bweM1KzgejTwQ2/+f0Li57ardI9to2eR8z0Ym5CB6i07bzfXtRSGPocimQrUQfzLlIS3U
	2LKNnscg8VT8Fy7L74B9m3eipOS1gOm7a7cM8zQZyHAPcX/onsC92guRn1ldZ580OmWIGiHEa1Na2
	lQ/xGOUZxHMRm/iVTI6tl+eU0aa5uHmS8NKKnVkdMw+9UUoJMPl5LexMR6lUMbrMJdZVTALA5cJNp
	SHCIYZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGZc-0000000Ffet-2g1V;
	Mon, 13 Apr 2026 12:39:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGZZ-0000000FfeB-2SVC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 12:39:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so83181e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083963; x=1776688763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=M2nrMc80ZSZR/S6W3KYFUKknQuiPbcHjNedxVkqTGtEwLFqpSxvpgJNlMOvCaExwqQ
         /XyoClYqze14zDAdtyep2i1NXFZQjCsgz2YnaKY2yTqkkBhgO1FaLuAh2SKOC/aRYEC5
         CDuvCfMuDDdzN4VwIDc1b79vL/o4oGfQoc1LNsXxn4+n0t6/mIYqC0crx7GC5z3hupGL
         pTiO9J+sUQxiWkdQVdFNf99oQVh+ZLGGqzAve68bUp6X/jVEflptQNYz2S4H7drzvs2V
         RVHbxwEUUbw9oU2UG/kr567Rz63oYfxG1kGI0v6fboOAntAsVhr0Bvbz6v2ARc/fetd/
         QByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083963; x=1776688763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=SV83FYhdrAOHitsIDqE5PPNlIeFlJKZl2QKdNKbHIwChvf2H/mJPiVtRAgfs0EC0Ia
         gKZ599N3D0v3wImJF+7SakYkdBKSJ0XPMHSDzxX+Cav6Fg+bbcAOIAe5rv8BUaMekmX2
         PXS0kB8jLRG7y1JgVompKdbxPprSkZ6fRTkr7wHQ/hVWLYjp5aMgHqZg5+thm+f5NJ5C
         alq9PKDZn7iBmT7mAOuY/6EGh4x6bU7OfIQ4bwfutsvpE8VrmMSjViFyOyhWUI26rrDs
         s/iAvKW/lqs67iOzjrZxkGFZpqn2UWsBzgZI9Y1fyAV5hAqr2hS1ugS50P/6k8ikhoy1
         mzyw==
X-Forwarded-Encrypted: i=1; AFNElJ/DIICEYVm42NTJqKtB+SpIPoCoeBqlJhBWgTNHPc5PI71xtOFI7KgIdYsGVJ0XErY2PAf9V+ol6vZZf04f/ros@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+f/HPEXs9Xx8K1NKw7rsmmBaVVGoNj224BxAVZ/IiemNgPii
	xzZ96IQ+N4vqb0UwH8yhNTnAfGdJ0TgmJP7zYjysgvpDAbDpwdWVHVNM
X-Gm-Gg: AeBDietiGBGyo1AmrSf5jTyHmY+uUd9bkyyUam2QfXU4Ge5iNHS9zdrzrLPd3DB3YUl
	QCclImVhMY62B5Ii5u35jPPzWWUCTvWbdRlo87Rc/9mvP6E/SpAsiOn/ZHGIV8Aygr3JyOkLJ2C
	6rATlelwK6CWI5VL/WT89MJ4KPklykNUHv1jnZXWWuuIlJgFNwlPQ3SJkxyYBpK4cShg2t0WaYY
	H/vStue928xN7nPh37LxHmkdXCktPx98mcovfgUiwQx2Fy06ZA2tWc4Ey8WAsnv6IOSiDJRy9sh
	CpYUUhbItwEtr8bjj4Nkom83ddM3gRHrfWG+az8rm+FHrAakb5FrLTsqw6yAbk6T0HL8zphkY6t
	Y4fyxU09Fl0Hqa3effXiFt/awhOZ16JPXmj5hJTz6vE5g58gaxbYod955VzTng1Z3OkdcdBF3vL
	zK3FF1SFaG5Oj2IUWBLBR4NC0cCUrhJp4Vjs0yk8vXAggGBw==
X-Received: by 2002:a05:6512:3503:b0:5a1:1496:922 with SMTP id 2adb3069b0e04-5a3efd8b5c4mr4514818e87.33.1776083962516;
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef00327sm2532549e87.73.2026.04.13.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
From: bigunclemax@gmail.com
To: richard.genoud@bootlin.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	joao@schimsalabim.eu,
	jstultz@google.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	p.zabel@pengutronix.de,
	paulk@sys-base.io,
	robh@kernel.org,
	samuel@sholland.org,
	thomas.petazzoni@bootlin.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org
Subject: [PATCH v4 2/4] pwm: sun50i: Add H616 PWM support
Date: Mon, 13 Apr 2026 15:39:20 +0300
Message-ID: <20260413123920.2459916-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305091959.2530374-3-richard.genoud@bootlin.com>
References: <20260305091959.2530374-3-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_053925_674221_3A4668B1 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Richard,

> +
> +/* PWM Capture Fall Lock Register */
> +#define H616_PWM_CFLR(x)		(0x74 + (x) * 0x20)
> +
> +#define H616_PWM_PAIR_IDX(chan)		((chan) >> 2)
> +

It looks like there's a typo or a mistake in the PAIR_IDX calculation.
It should be like ((chan) >> 1).
For example, for the 5th channel the result will be 1, but it should be 2.

Best regards
Maksim

