Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFB3CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=; b=EYMHcacmcjNkZmLcgD1bRoDr2i
	4KF1mx0kCPbMSw+ZrsQiI6YCQIC3k98NXNsgzX1CMPUx6P+f6qluM1WOG7rBdWJWmvBQ0J+8GjkMM
	Ne/UWpT/QiWzjggAqt18OGxkJt0OaiDPi/hL+aOT3/TtqSG0vaJAP0COIaT8on/bkpIcQlgQEEj8B
	ba8TTSpXtVT4aWAkfennmVGFEuoCCmVTgbTuX93Ydnf6XjEt/vkxhfUXyyatVDmfaEPuLRF8iU1Qm
	uhcK1Z6159omcTn2Wd/NHmYDmg/2st14jMeEVu3sERbWclx7DzUWGrqweP+PPaGo+qk/6NZmMicvL
	DH5WBMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOV-0000000Fy2w-2qL6;
	Wed, 27 Aug 2025 15:49:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFZ-0000000FFX6-28fl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3253f2a7679so5413421a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293812; x=1756898612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=eE25SJr6OjTD4ADxy+WLPAYhF+qS/LL8/sqGqd9a3s0pk+eC089Vy6tW2iY82zL6cc
         7CF9L90gc62qOVdou/r+1gdvB59NOulf0JR9UH02+y2PHsa7pAtDllvg+dMe+WV5vOxV
         wDwY4t1yn9SEVwPxAzEMnYzKwDgzmPjNz/8GdGnPddg9vaZpZSwdKuxP3gXt+Q8nWg83
         fvhgC4zU0T56q+qTQoMI4lye0xttpPJToJphO4Elkn63x1NU1afLmFAzazpx5o818ehJ
         8rIm2zyCBfBY32r1klRtsmq/2edVWIqiRpWXKHK/md4kf4htYhILZvIuniSv9gLoNaBw
         FDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293812; x=1756898612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=mhILKdvMA0Mgq0m/WNoOVT/wOzRuqgwzr8pdxFP3180JAD061N4Plr9sdXz1jCAith
         kWW/OlfeTIrXcvcE/OmzIY6bOB9KWcmvqhIZOabXQQ3mWdGPxISWxlLynEcX4JLX1ZZy
         QjlCo7pngaBwLoMXCeoZ2sdFLrEb1SAeQRK9aLoSn6RKAHz5pEh3mP9NFIfvLnKeU5kX
         J7AjHjqJjJB5FmbzIcFG6n7ilHG4k/weG3ntPpm0PuR0ib7OmicMZdMuIHt4+p98y9HL
         o+RnHpzgIl+aT2YiiKmjAouK2Ph8re6AIwFIsdcR/cJN9RoBAHoZuqvHHB3XUAm2YVQ/
         Heig==
X-Forwarded-Encrypted: i=1; AJvYcCWJWDeKb7zRs/yNaUl81NlkSOTD33ebfx3fiA8QkdXs5zOqTDTIFLJOHeTGqh8ETVdLBj5cEsCiuFPL584/yYmH@lists.infradead.org
X-Gm-Message-State: AOJu0YwCVf2LeBim88aP1+/PCN6gvq1wk8PQZcrDJhKGNts2gcNkCocj
	gdBRYGxkA3TbOFMPSo8sSxbJmAGUQGuUEX24YqPBAJYVZAVgFp1ZC56h
X-Gm-Gg: ASbGncswnByr8x0iFwH091C6MzNCNSMCQQrXdX3Rf4r8HXpaijf3FM1zLwnyAWlwXqi
	pow95SKuNEYaxOcGRR5AwBQmyv2Z9wc4QU3mdsGr/iv+5UP+wWTT4vMY9e2Bw2lYXuZFsTDtJtO
	u8DNkF4NP5zZrCLTf55Z1jtoJGSDof1zKFVD+bt9rVmONRx7PulidPDbzGoQmWcft+3gwPmFtom
	gEaXxfZd28iua2evj5sYYwUKcgaXeJ0McUI5wsX+gGXHZ7I7ekOog3ZibTrEUbUwMs2sfAabxRd
	Ccxd2nJEyfBQ5k2Bol36Z5FFaYhz+S8LVTn/+V/DT+XgeAAeOem0/AMRB49Zwk5uO3SbqC8s2Cf
	4q7I001fF3TDCBewM6JA6m9JHRI6MdAj8SpSbfBgIrV9aa2UygNVzJlicxT/wYSQ6vUKiTrY9P8
	e5U2DqnY3LGIYX82p9
X-Google-Smtp-Source: AGHT+IGiOxv9V6MjUF8W3nBziWAzOujTYr/YcybLHLky8CSMlEhB3V6Q2vxGNJMmePXDcxETbRO/Dw==
X-Received: by 2002:a17:90b:4c02:b0:31e:ec02:229b with SMTP id 98e67ed59e1d1-32515eabb9bmr25336674a91.20.1756293812432;
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:40 +1000
Subject: [PATCH v2 06/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-6-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MzVBIMhZBV0HKkjqFJuByEq0RXCQQFero/TsgkVgPbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVnT/rJIPuE60z/BsMkY5Gacx1BZhKGvuYro+yPT
 3c5xTS5o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlosjEy9L2TsF6fId9yp/VY
 El/Q7mvv1uUbH3n+v9ni/KuPixomnmRkeBJt73vIvPNu2Z010ltm2P91mTn3zzOJQzuOfT/6kqn
 IgRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042333_553732_B6207DEF 
X-CRM114-Status: GOOD (  10.32  )
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

Add the SMC hwmon functionality to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 59be894460d33afa754927630881532b548b7ad8..286dc150aa6cfdd6d29f769094278daaddabe7c3 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0


