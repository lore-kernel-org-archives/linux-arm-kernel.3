Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAECA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=; b=LK6MjfBuLKI2eZpaMkEv3Ifesd
	cq8hYUUk3a6z6KGJ3qCsKG6rHCYfyx7nXZScEQqltTf1r6/I55oUyDjlV+O6uJhAVZX3u1le6l+Kj
	SDLdSXmsllqG/G66yar5a9uv88YaOCPghSjn0fTzi0pkCtxYMMlboYNZxfAJ8LMZbZTOI1v/AisOZ
	dD1y6xP2uR87/dNoqRH5h2mOkNvmLOAEy+E04ZOFjBifEmOLLDJzAcaAkQpXm4kIv3T01tA4aQL9O
	vpr46g4GJ22U0vqrwtxTqxOqH7rezzxTdfBg+8+bChqfFYBIDzD5DwvcfyEXbt6qsF+DltcmOips5
	i5qlG+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOX-0000000Fy45-020g;
	Wed, 27 Aug 2025 15:49:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFm-0000000FFae-3hPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:47 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-77057266dacso3719567b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293826; x=1756898626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=EK9QL26iB+MZd33DUJBAqw09SyPVhSEcGdhikLTgesAYU1qKYtSrWywL4y+otGMKgj
         wsbnQik3k+fLizgDPAfZbZy7p6RuwkD8Bu7ABpZz/P7Ex8iaR4FsMadq38vtLt2Dlq+A
         bKZJqql0MHLSHzK/4cnJZxnvYGlhiBnyBiCc3rl3YJxDAYerwRsZ5zbKZl1jJHh3RvO5
         u4p2UOyY7izuXW6e9nb5xTe4p7GcvfS7r0vbqRCf1+IMiwxiCSogd9GKtliXu+xelOin
         CceFaxUyEOkHoAlEs2PLZScKXFpbw2FU57m//j47/iuYzmPyiw2bN03HBUqCxgRSGIVb
         YUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293826; x=1756898626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=ddcIdgJ+qj6TAe/qZeLosGR6vqEBDVtP9VjtTehHXlkhxhfz8nHpbex36FZqDBNHvg
         aqU/+0MoNT1C30nFc2vfJdDdh/BvLPQTuyi7kEwel4/g9XomyzoJH5IECIp5OaoVMa12
         FxCLpzfNyQAc9YzuHs4CHVGT9zKU69bG9FrDiI5Ryna6MBOwESIymjZ4Q/EQG8D5K4IV
         NQywvNqnH9LoPFkQ0cQWEJvdhuI7dAt6HGIKNoCRZaBu1gQQC04J1byZdVDt/aHsRGCY
         qNFSVVbFgVCO41V1v233pKwZNenmR+Zovn53Vt5oKcawZSbpWmNmdWY7chgLuv5b1vnN
         ZXHA==
X-Forwarded-Encrypted: i=1; AJvYcCWgmWoxC6wkuwGddhbwB8e+M0crHHBBEd7O63ho1w54mQOylGNcxi8PBsFWyF58vNjf6dMiLrcTKq5lRI9dr43e@lists.infradead.org
X-Gm-Message-State: AOJu0YykVacecVXNfKTKUAfNVLSZLdIv6UJFh17xlIrWiTaC7pa/fISK
	qlJRrz9BIEaaQu0WR1iCA6MBtrtPcFQDelZq/a0HxA7bW/y9k5/MupSr
X-Gm-Gg: ASbGncslq9silneTpEcDiqiKa3GjFy9TZ3l7KUKJ2tfKFATmrqPGuKccX6nABXBFxDu
	f2ifJIuJkahFN6kT1ZWhkDuJky6TA0xtYjabPImPvaNN5Pyo/cZs5wZAWATObMSeTwiOtxy3EpB
	c9na1mBs+U5RInm+bsshjmInKxGTT/ucQla8oDxNhvlFJdN6zharRL/l3ofiJfICaQBZ9xKcgeq
	gu9nMH/m6xh1NEL8QwBS0OD13kGxAAvuVMhhL5Eiu/8SsSd8pFGeMiNJW6VnrB8XgjF1fpqbW35
	/DYYkm3IB329SnVmrrCVGWAvMDfn398hUULLnKr8Z57uZS6MBTXzuIrzVYcy16vOAkCamFPepO9
	AHDk8wGv4DzHJIelLKLgJBfw41MX47inob+PodCcQJnX2D7XZiVr3X/31NgZI0JMInJdQHzVvG2
	U1cOv5auld5lGSJ7rr
X-Google-Smtp-Source: AGHT+IG1I34LBUT0TKwrF5NX7fXsjRB/PM9YKtCnoAQa/Vc6sojIb33NnLwLORwxlipIekaFiHkkCQ==
X-Received: by 2002:a05:6a20:72a0:b0:243:15b9:7660 with SMTP id adf61e73a8af0-24340d6e2ddmr30868600637.58.1756293826022;
        Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:42 +1000
Subject: [PATCH v2 08/11] mfd: macsmc: Wire up Apple SMC HID subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xCTwt54W2CQBJO75F2Lvz2paGIMG/Mf6mnXKlTqhQ4M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVrS4q3nWUJLd3+9z83o8Gb9w8fnvFzvL7gvVyM+
 PLnXb4HOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjIN2FGhktv57J8Yqkzq9oQ
 5RByS8mkQ6ZLSuX01I/+idKtkRcitBkZPisUKE+Zo3y1/VqA0Mon/Xapaf3bOKWX5m7ivGOp3jS
 NDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042346_923795_D73B1427 
X-CRM114-Status: GOOD (  10.38  )
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

Add the new SMC HID function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 286dc150aa6cfdd6d29f769094278daaddabe7c3..893fc47d62b2c956d966d1841895a3fa2b9a3005 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-hid"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0


