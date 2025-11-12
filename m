Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C66DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=; b=mX8LEY/h7/SRO1eMn9hY9s/qSQ
	O1U5oAvmseRZv1wSx9BLQRNF+O0S2681vVFEF+CpBeW1T9pz6a+oKba8DbC0MGvEMNsvB2v0lGCsj
	AhJOu+UjxRqwcGbhyRA2+k65vracDhMIXxh1KBBPNugwsCWBpwPyxFKGGvleQLPfmhldTCMnzf7XS
	QNPzFpXTCHf6rsm18I7y7OsGOXglmRRaL0Zw5qFQSzME83pKBC383M0u7WZBPDxwfoSU4nuhrknmU
	MEAyAr2eZj/37t0AoW1dVU7k1VnS7cVimmak+k3Ox6WEfp6UTSs5c7r3rt70DW5RcYOMi38D1Nv1w
	BvA0P0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rY-00000008fCq-0IHP;
	Wed, 12 Nov 2025 11:18:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rV-00000008fBO-2wI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:18:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso664511b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946285; x=1763551085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=R53/uqzt90V80/HmObG3PadV9nVMmwiCF9a8Q6Lt8CxgYfQp542nK53cprGifZnISO
         IpWCTrf/Tsok6Lpj921jbiXzKzi4aK2RPdRUrL5P+wJBYXsoriElLOETeIhjCJxrFlb0
         Ls1I1a4SYmY0r2SDEybt/c8o/SRDgvHUw7ru5yWeHCKaonrayJ3YKrjs64Aw2eY8RJl1
         DADL7npjI27Sx0dKTMRhFrdMfcWkSBNHeEhBHiHzjVL33vMs7BRKaJPFMg9lJFuz5mjz
         UH5Ez+PlZ59dDGcBp0XA3NJt8hfoMg7vSfLnXbmJ3Zcl+xZMjvYdByJKTcdpuQQWHcAx
         ZIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946285; x=1763551085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=eR3V4Mqd8MGv3WN/0N5pmAJrSQbx8Eu72cavUZtI3Q19h7XdjrCUFEz5+CYQyfGuZw
         kDc+2OBgJkqSoeDu8VK6OzNnclFqP9P9InWt0eV70Ed1PJKqiia/2Iv5jVgXPnmWUb6H
         bu4hVunnGz8kGe/kBc1IqKXXs5p0Oa4zO+G3NDN9EThc85WsCTtWBgFZan/fJpEf0U4g
         31ZmNg/fee+v2D5yhCh57tj0AkOi9359rXAg659fuC9qg5reJZVgIwu4uPyqvBbpGn7m
         8IEAjZtkf74qo/i++KjdPl8KfT29RvLGWeLxsP7uinZAPMC2JdcOfvA0VXkFl0wV35BQ
         Qsdg==
X-Forwarded-Encrypted: i=1; AJvYcCWRBM3TZ5uukFPRiilzGkUFJ7Y2tXE0FPUPQ1Hb9UjPz484l0LWJFpDUeTtf104Qki4uB69ipnWfJ1U+uy5Muhk@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvSrTQ85yiXTrJ2KTlkCR0ezKoo736RgynZ8L9VsfpxlH85xD
	0UwD21fOEtTHGrfr4nMGc7rlXllBLpBQ2LAEZhP/q5PpV67q3dCECnoc
X-Gm-Gg: ASbGncvZRb6PsDX4n8HfUDDYTl4vS/ZzHHlK52lc5+HJvQ2CTS6VC52fbfiMdbir7uB
	B4bcXGq/FPCmgqbGEyTF3s2UM8kXQZU8hNqJlRQAkIxbdBnDOPS8SzcQG9Mxj5DZe0k2cX+it4w
	Y+WC7n52KXJx91qStbzdef2MEmwaJQi1QboK/ErEiEDeVVscKX12Kcn457iRVntx/zJChca0idn
	/1VWWZ6j+UXZTYALg00/rLDMiVSF7fjS3t0sWPAbZhpV+up1Dbzggw8HuMN/7R62GUkF5YOtytE
	0/06XB6Sa809Z81dIewxWIoSqjTYioBuvilJFKWaq9BfiNy+osH8vrsn0txLXVPhjYI2BckbhNA
	km4a+rF/8kKps2jqEHlrsaxGMH89TSZMVdgJOXN/2+fvJ83+MHzlZ79GBGFr1wA8u8J0nvE7qR0
	KlZ60Z0UupWO5mEjl18uGu+DSLdsCQOrr2UIP0CxaXFCPYYwmut0VlJnNZLAZGGj8weaUkm1VXw
	KJ20ivB+tXVgTTT6P3GrouaOydLbOjrdpZdnjJLSFAZ2TCgfypUcuA=
X-Google-Smtp-Source: AGHT+IHA0P4UnsPFIhj4utJwEq6rWs7Nkg1EY8pIQ9eKSlMotkC1tp8iAeDrvqrEcOWVVi+EwKFK9w==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr35066775ad.46.1762946284740;
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:50 +1000
Subject: [PATCH v5 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-4-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUeYXSp6HTiumdkXFc1P4lS9PK9pZfHi1fzZ2ef4u
 HINXwV1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MAptrWmuF/hdDOyUmTfkptiMp9whlc1h/rFWiQ075Z8Ps7E5W4r7/9GRkmt8XcOv9
 ZLjFA4cGDV3ZBzGeuTKy/kmDxwz4r+r3ILmcmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031805_749479_668382DD 
X-CRM114-Status: GOOD (  10.75  )
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

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.2


