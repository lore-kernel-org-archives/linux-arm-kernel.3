Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D0BC98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=; b=IWHCSRWEfhstOlt1uoatXJhhMn
	ASO88JOY+MI8njO/CMavPGErOMcTM85NI7peMLebvMYptEsQdsrP6YdUf6fFoFO5PhEwTDeLzsdd+
	UkM2oMOlrPVxOju1yq5iK9b7nsN51DNkxIU7TcGatu4wHR2Iz3ybdb6imZmpsW5z5sijUGhClZO8L
	2/3iKi+QHPxizexIY7MjLWm312JbHjUA6xyXSkgo7Qp1vx2+ZPa90mWAkoVFdlcb9tab6Zhyjz4cT
	RcLxjVONJgn2d4XDVwfED9TpUaPVorTcbfzCu3kfSslqPaQQatyNcTS79Gdr6emnbTaQFD0H9zcuT
	5pX6v1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Feu-00000007AqT-1r1f;
	Wed, 23 Sep 2026 05:36:46 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Feg-00000007AnE-377L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:36:32 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2ffef2so308198b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141790; x=1790746590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=U8vLm+JUUCCCRLSxDYqsBlr6C1jeMchtbZQRTDxoivXSIzPya5BtqqCoQ0qoSYqHof
         lB8ZDm4h8kI89RU1Onqs9RyrHXhyGLZ7owWxH43lTwARCmBaBi6bkMKQ9AjLvWoVVFi4
         Z5jKwMu5bsF3Bl4Kj/kYUIVE5AIMawgm6lIQ4N/vTQk9cntPY0a3lt03svl18600WhGz
         qBMs/kio9A1+bRKLGfO6SKPGq0CjW3tcOjQcdSBBXGyskVkB5d/EO3SkVXAzxjTDN6Mh
         M9uS+qSZwOsymkACvIcaTJrzvdPy8TQ1UJ464TsSC8KZD8P707gbSsexFuQe+PYS+/MY
         S6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141790; x=1790746590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=jl+lLFS/kXOae0avbmvDKUtFzI+FMJFOThaK1TgFTdMxxV2k/CcUDSrZmtxk7LxSno
         KQyiwupnoZ5/PgndzpNPD3nuJIokm4p9LDVTo2O/NkPzkGt6rDcUr+BrUjReEUKiDGO1
         C/WEBIsbv3I3J7B3e7AhobqkvYGtq0UwXF6QqD/SYZAx3zEmtognuqlPvTCnAplOyOxO
         erLlVxHwC2ozB6txrBRc6ED5LW1MjBFxvMLl3L7oy+tnyUORYxhTn257FBDpGBVvBD6e
         GZKHo3RRjXlin6WWzO5lEQh+IQem0x6a87dG85LmsKHW3bYwsn5D+7zyduMJWOAauIj0
         ewMA==
X-Forwarded-Encrypted: i=1; AKwUvBz/7sB6M/5vRAMtOlZwWf4aikxB+bF5ob2zm7lHl77YLaymwTHiAtrJVy+TkLVOweVskcNmPbionQPSE+QSsOKj@lists.infradead.org
X-Gm-Message-State: AFuF++m0fLgu4UN4J8zWruADWaI6p1ouQEmZmHA9IUY1PXpBVnNKGOKX
	eu8dFom/sLbndUopSNM3pftM3HAaJWn2i2k82MwZJugARv23AuWSgPrK
X-Gm-Gg: AYBFou3Yjz2U7/mPWSvvwBIa68v+sQbtKZfk+yX5VTbEepMdbcukiUippCx4DdOZuey
	9AWwT4fsvm9VliLeGCYLTiBk9Ar/DaZbg/3SaBtKpNIGHY+sbh+7I5zuScOZoLAO8kEdKhw90yH
	AF0TpSGzGGahjv47xlZO37hDi0uB3z63op/aBZ7E3vWmaSP9sleRdGhOSPG6T/TtUTYltjlAZWU
	6e01sX9CH8o2BE/62hg6W/8H6ZC4l5o4Cf+L5HLPNwhdkQlp7jncv6HmgmLWY40JhdcEN1DpF31
	m7z+tsigfV1tW3CTx+D+n3uF1InZ7HJHY0+myDkmysSwqDAs/c6Bwc+E1M9MlApUm/YpsXYV43r
	cuzSDXkqqu/h7IfpDSxbPG+au3CmoF0qviU9t45jd+HBBQjJjHsZIpD7/gwlVvuK1NajvsUgr3S
	kCYRvMf1nwESs83D/n0xRUQn8gjyiYKI5MnPQmRX+/bd7BOhLmBXK9k8fy31i/9aEquwpC7QuXj
	yACoYwQiFF7cEzYdMjn5fS/zG+0gGKNKkQAMjJRRqIYxGi0AUTeGChtwrBcoQ6ZKz6KJoDAbxUT
	iAkMK2AlXUlm+aS7/dLfFmKMXPMGKhBB7pyik+S0fO3g3oyGv2Ca6mgz64n2Me9ksali1AfnZED
	zHc3VAgd4+O3ajhX5Eq72
X-Received: by 2002:a05:6808:1495:b0:4b9:e5fa:8a1d with SMTP id 5614622812f47-4d5ba092ea7mr1861997b6e.34.1790141789974;
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:18 -0600
Subject: [PATCH v10 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-5-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_223630_813881_EE3584DB 
X-CRM114-Status: GOOD (  11.09  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


