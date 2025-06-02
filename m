Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D74EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=; b=s3O+GFcVr8mYAiJ3cHA5/IE3Gj
	yxMAhOtVfUJIDvT/KQfjUk4G800r29z50DtsKlOjsF7TKn/qwJ/Ee/lNfY5kAMYKEoNBYHmiHIkip
	W1m9rHpZVEwxBYAdqumEhoIhvV3NegrbNkMGIQw8OBhN8iXMcQZtGk7L56hxwkUZi8/RQc5a+8z74
	cPghq+/t1Vb2nbGG+DiPCT8wKB2rE6d06JdtBFppoxkX2rxekoMjsuwL1YX52P2vJX8kAiGn/LQom
	McJB19l2JyVkbPRWMFMZxm/XEAIM13BUk9JWiaBXJLuFzwQ/gdIvMxxHJBJxVs+J7DVwbZbbYtroX
	6ZZifTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM79d-00000007lts-2C8T;
	Mon, 02 Jun 2025 15:32:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wI-00000007k0g-4AOl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442f9043f56so26972575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877541; x=1749482341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=et0PFLB4/ThcT8Z16M5VMYgfCaIyClsQi+rh230hjk62mLBE+sf9sKASUJfKKZCzNB
         i0WqXOsh2y7jslAcE5PzQbEUqQAVUe+LTX79fBPjY8x7lM7qy8MKhOYcgSYABZmhTVLp
         V8FZI9R+LvHV1kpKWHhBZYhiobnqgvy9GS0I1W+ULStergpbb3Nh4udV3Cl4phju2o3t
         cNWjIG2ThMiVDbiay44Qy9oVol61gZ5f1aAeuj3BmK5EAa4PpyE6INkHyXSpdS5Ljmxk
         Hf+MkpL45QeRi7V6p699MTY2TGCHPJV2MF1dZYBrlUdn6uoQ8T98e4Znj0eRgktDjKI7
         Om4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877541; x=1749482341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=FFyAzaKDIPCKjOD/nqwtkrx9uPFIOyVu0hMoJah8E5/fJkYj5jS1dOWggGiVXBRE6o
         eP9uWiEyhgVsQNqXtrey8pq+6ESNu3RSVpV7CEgxkbe6ZNAIdghAc9fWgChphmvX7HtU
         L/N55SF7yfu3L3YgV+RVK2zsFQ6J0oRgWfA90kw6fWYWQ64nDVvXjhZUsFKQD7yDR2pd
         NiavzCUIvJcwucX38KaFgGgqYIT9Ni2kLgbGjLYoX+0awzvQe9I7NCJG7ZWD1ZpY9c8u
         IE0J7BRRbzTwyRmR+4dzJFN4aFm+uFHUAqgCY639bS+2isnopdvbrUU/1+kACqBmED1y
         nEZA==
X-Forwarded-Encrypted: i=1; AJvYcCVV5THtJXgEoq8Zasy7RgcshVYPP+ssWCUtQQyyvHSvhPKDHVD7tAfZzhL8ces0bEtoZwh8k52pAT0B1sBgI02x@lists.infradead.org
X-Gm-Message-State: AOJu0YxdsTD7hpDaeTHUHtXQwVw0W02hslWGYVRTUzTMPpY4sMwatmqT
	ySMQWSOZ93/QW/QKUhyPcnuh2MFSnF4UN8hLDKsHD1GZ+vrIKAh+BLDpHCfnody13XY=
X-Gm-Gg: ASbGnctRlTBrMQOtrBq58ZZFoDmTWGI+f+IOyb2hahQqugNPLEjcbH/TFADMt6sMMqE
	6c7wWt4C7rbsGLoZyh7TXeAfYX9Xn3TaavPagUi61O3Fuz6O2kyfmNZ1Z3IazIp+ZeZ+ygb8DGU
	cebofqZ4uUt1VHBiuev8n+u8g+IwLrENExNorW2ctj6zYrb2XGVtYpbfZeP71Ktm1uApnatqJug
	9NqbaMpDDrMIb4YsSd2nyLUID8k7op6EF1CnvnpYZV/YaJoi0C0OPIrc6UWplvGRGJJzEeoX17s
	8T7fpxiK99p1KaZnE8wmhOuEaUDLVm/BnY0pa7cpGeBrk89y0PGpeFLUIcMoK/P9Ki3bFSlRv1a
	zHcv2kptAYIzp
X-Google-Smtp-Source: AGHT+IGm8o6nqRRjiZlM8OEtcH7Giz5iqVqvOKIqNhMfKW6+DVKKTld7vkKIltD7iNqNITzYzwGGxA==
X-Received: by 2002:a5d:5c84:0:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3a4fe3a8214mr6931603f8f.59.1748877541180;
        Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
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
Subject: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Date: Mon,  2 Jun 2025 17:18:47 +0200
Message-ID: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081903_031962_24E6C94B 
X-CRM114-Status: GOOD (  13.38  )
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
 drivers/clocksource/timer-sun5i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6b48a9006444..f827d3f98f60 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 	cs->clksrc.read = sun5i_clksrc_read;
 	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
 	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	cs->clksrc.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&cs->clksrc, rate);
 	if (ret) {
@@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ce->clkevt.rating = 340;
 	ce->clkevt.irq = irq;
 	ce->clkevt.cpumask = cpu_possible_mask;
+	ce->clkevt.owner = THIS_MODULE;
 
 	/* Enable timer0 interrupt */
 	val = readl(base + TIMER_IRQ_EN_REG);
-- 
2.43.0


