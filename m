Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=; b=zsDkSDsQxhpsKxjvyPK2I9y70C
	FE4tzzWcyGHzruj4B1P2QplNAZW6/jsj5GpTIikrQckjd0RBKNG8+s3m6IBbu8O3Q2ggeHndvfOiQ
	kgQ7P8eJV5hJu4tQUSyQRD/dld6YC+W4CCnQBED7yryfdaiInCu1xzChBf8ioKo9rlT6VqTLPkgqb
	OET2J8NzZwKP3roqD8op3xdrjt4XY7gczj+9N1g7OOz4SbXQF2CxDIjOqHdYdA/STP2TEfdBDGbEy
	V3HJkHIENk6xSZ1tPn5MYNCgy63KUDCJMfTPLEqsc/qyl78sN/CP469v2JTtwZtN2S5BZXjx4eVHO
	3DI7kgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM75H-00000007lHe-3qjb;
	Mon, 02 Jun 2025 15:28:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wG-00000007jz8-2R3L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso37438525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877539; x=1749482339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=c+nVNRUJbuZytuXWeAiuZ/zUuRrVOZ/SmWg0A5votZTGsDv1PFIGsjJ8eP60J0qzyi
         qFLd/FdqovN/P44zAi6GgUKwBzlb91lSX2m99A6Y1FMZ4xno2Zi1Ez+7hne0EwKeJgeZ
         uzi/f2Wb+JysQmNotzu+XD507l6CVjnIdYLAqD2x2jokAZarGtb48OpALoeo3pNTG78J
         rUkUnxxwv5Rpfm4QzZh072NwQMCqp82LNxhpw+fLijPK8Ia9t0kag44pI77cgoaPaYRB
         PbDjZu/zxZPHSBIsBClS/8hAPy+obVKqXSGIbLM17SxvjVIRl5Qb1Xr8NFUQooUcaAQS
         xSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877539; x=1749482339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=OrKJO1gX3M9XNolFizG2wr0GcXXMJQoWFA3oxwOH2DuTONG+cGQ09S+aPp7QjX+AGd
         mHF73Gw18pD1JhJdWO4uSxQj9Fhyip8tEPKo3WQbvaEcSzmI5zSJNui6EZGdTCubAF1G
         qPxIPizFbrKUkRnP1LwGMbHR/tPhBtX/C6gNsDxxuAPmnOfK5j+ieN2hILRIDNU1wggv
         ZVAXZ2CUm2m8XC4nsfj+rqN2Fv4UUUyFSvmDlildwNaiKA0N0gOp0LOZnC2HzlWodzv3
         j9xc3c9jNQ4RZpzqa2AszuUV7306I7i7G6iTr5CMpz8/WAj5bQudp/shAOrUPTuUvtAy
         BKmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHi+koI8RoXz+SgyFeIlkV7vwrpRa3ALk5UqpVlIP80fyAO6LqBas/bFQCcUNGcQeCs9x0bsuQAmKaLsl8mhB1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HmqhyeS8+Q/Tb5SjY+WT/ugRv+rc37NzlLSc+W8nn/8MjIEt
	teYQlQeLoybx8Y7wqTKyEuOa9Zq8NxgUHWHUP3BUPTiocTwxcerI65sRybd6nG9+y9M=
X-Gm-Gg: ASbGncvjJ4vk0w6NMDm3WPN3uZ4Rv4L4XijM7QyhNrTRFPqSatKF6kCvCQRmLodZt5r
	pmomZPxkiPmbj8ESeygCeBV+ZkBUsezVuJ9qWQN6a8DB0baRY2HNA5kv/ynR5fDD5PnC5/0ZMqg
	fL0Tjs8Gk6blgxTwDHNNZV5YktvIdQ/KoVOJeRf4OwBrU7aKN8qNc/GzjCTvacL4CrnI7Zxh9o3
	2Sx0YLgBOAqYRazbTwImDjccXiRNOLmvQJl+dR7ogwUlpHY7LwxLDq+qR04oGc0lpSFfbSdkZbx
	8408RL/vpiEBWMIxfnXIudNhsFoEU3GNosLQrEYrhMRn+Wh8mZFChWCo+KPkBrNMeXujCLGAV1h
	5Kblh0U1momuN
X-Google-Smtp-Source: AGHT+IG1GHyy8b8GYVbfzlnN8+J2RSq7hqEKi6/Yl/QaRXVbKZmvYaubZ7QAl5jOTOJVDXQoWBizUA==
X-Received: by 2002:a05:6000:381:b0:3a4:f893:3eff with SMTP id ffacd0b85a97d-3a4fe39a982mr7159013f8f.57.1748877538797;
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
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
Subject: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Date: Mon,  2 Jun 2025 17:18:45 +0200
Message-ID: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081900_617984_A35EBFE0 
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
 drivers/clocksource/scx200_hrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
index c3536fffbe9a..5a99801a1657 100644
--- a/drivers/clocksource/scx200_hrt.c
+++ b/drivers/clocksource/scx200_hrt.c
@@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	/* mult, shift are set based on mhz27 flag */
+	.owner		= THIS_MODULE,
 };
 
 static int __init init_hrt_clocksource(void)
-- 
2.43.0


