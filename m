Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0743DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=; b=ZK1aaxekwN48/PYdQmacbo0tyS
	8+bkXuelOY6k+/ag7Wk65wW08GpJLpRr1Qw6nerUo9udfI9vH/45jlyun8ZnG/NxHPUe9B3pNlXXS
	3xwPZyQwqOOncahcJStian10wUfy/uDauXFnFlJTYmiI2gG8BMy7C22BlV+V6Avj1RWOwcNt7o4Q0
	p4UEc3Nzw1PeMnYwIDxtLeh9OfUtQbyExAYrhR25kXNo1QD5tsCbb+nGsY9Yv9cUgHFbxugLhArnP
	Qzp7YWRok8wRBgGXZevvlx+HqFsdYMBCZZs8KnNmV4f6ZyGjpLBT9qzLq+pYkHsR/4/dSJZnPCYNT
	uDth4oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM77S-00000007lZK-36Wr;
	Mon, 02 Jun 2025 15:30:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wH-00000007jzg-3caJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1075227f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877540; x=1749482340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=Bet96x5L1sS/J8jrPrnpMVkimcmYkq/2BixC+AeS/UjSaA3yxLTi7MuwQGYqkgdhwn
         hayvrJJbJ51CLlvBLw9PLHOWpc7mTTKriPRdmrilRe6gWDaQtAqbCxaVp9frNgrQLU+n
         QwFej5HmIuFFH0TRsWBc7hHXCvuEKQ/md9NfEFnfA7HW6mo7K2Y1JUdMVDNFoFcjBymo
         YX4DVVendt2ebiNWfgXOFRPMHqCG/jPx4mkJ2d5gy202Uj+D5oTQcpkDEBc2hRco180b
         ink1999+GXnJj/OYIZAJftyfcTz4qxsbNILrJg0UkyrFYXxXj8szU68qL3Q/4/ja7vwU
         i4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877540; x=1749482340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=jKQls5HzJEGp5hA8U6ozwjkZayi1W5CmH7E6/aF4zxj81EZPWAA1/5kcV0SsK5e9TU
         JtRHPBhUHgduXSvsCOr74qsIRT9tbVA6ZXOq7YUk+LwHWxChXU98/DCFexvjsGf+IS34
         i/xFf6OTUgYU2pOd1U8EfXOJZ2aCF9m3EGmOoeWQAizuk3UKw9gjgzSPclSOkflHy+V+
         30lIOCgPu7x0ewNkdfyjqgabLcF34A7tVIAA4kx/YAe14WZCQfmkEGNGbOlkfMSRedeq
         8qYY0QUSjEuhqITMfpMvixNv/hPZg2I4WZ70E1gZF5Jv3Fytom7mDSK3hkillSRqT8+s
         CUIg==
X-Forwarded-Encrypted: i=1; AJvYcCVpgZI5d4+epuVYU07hIdfIzx9umkg7sdaR0Wr768Oa/wYCXohKB15shtv8ZNMTe3JHL5s1xSCyqbn2dfB88dIy@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTPfq3N5PHU5IxFWBEsMhbK7qWtzhMbs4mOGhPwDMFmr0RpCG
	80FUKFTFAjCLk/0MFubwYl9/fU9l/UfDPYhbbqpoO77z0c9PhfZ8msgmYWIAxB8F/Zs=
X-Gm-Gg: ASbGncuSPdA46lvuFviUyykzofbJSzMvDFJEXqaAkObxJ/C1Y2DvSMo6j/Dn1NG8Gf7
	YtrssXOaki2y+Hs8YmFXQXWIY+hQRnmuCqW3xDyNpr5b8OmVn76yewRuXAoeGF5odDds1U0xLsC
	BIOgli8w4+LhnM+Y2XzNoLpfWh3nazBy+qexbBate0/dyoaWVsFzBRPI3YRPTlP8wcnTrCSgfWt
	mWUr4rzm4D4M7mj4YY52dLRqg21Kxz1rppG/+vUMGUhfSby1Au+yaXY0g391sB42fO4cBG5k5h8
	E2Um1+e8sVZ+meWR9JG7jvjVdklkTLHeXNy/FdF1B+9jywhFQpvvX2ra6YoGNFfpwqhOgLnhWCZ
	aV4niiE9lAfNB
X-Google-Smtp-Source: AGHT+IFyISAqwMHhCGLRj9aCfOACSARamwm5CChRIpOs6jPFxpI1R1pUgcUMERHo5kjL0SIXDlP4UA==
X-Received: by 2002:a05:6000:18ab:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a4fb3388bbmr9485326f8f.46.1748877540038;
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Date: Mon,  2 Jun 2025 17:18:46 +0200
Message-ID: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081901_908989_7AEEDFEE 
X-CRM114-Status: GOOD (  11.93  )
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-stm32-lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..cf1423ca00d0 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.rating = STM32_LP_RATING;
 	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
 	priv->clkevt.resume = stm32_clkevent_lp_resume;
+	priv->clkevt.owner = THIS_MODULE;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
-- 
2.43.0


