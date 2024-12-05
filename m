Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A40E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fwQWQ8p4fSiVsjGQYWImVyS0fCQtF0Xd9Qrli2C/FI=; b=hfO5mqlqYLEIEbRw63XoD9Ubmc
	iLYY5JyBI3fapKr8YuXlMhO+07iY4u6PleC0+nSyVwAT0ojnAnQO6H1mgSIcBROQXrKvJQIdLx8pH
	07ErRwSI1q9wFsUp2bzwZCe++mlEZb3zX8KFqYvKyN5fg5Vu2ZHspUDa5+c09JO07Y3Q7CLFVD0Kn
	wvxyXzfwp8r05m5qXDcJUsYizLXK1V5bShyIjZuJ9LUv6P0xDsPognRyuba303lZO7VVy2SoKv9/E
	J8GBFPjAHEBkHmRhJIgJTUbx3ZKfh0qyPSdQsW4LUy2AUrLQISEsUG63z5F5VIRukLsU8ZgPKs2F6
	L/6k7PHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGFv-0000000H47S-0pD7;
	Thu, 05 Dec 2024 18:07:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGAy-0000000H2zL-1y6U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:02:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso12317715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421727; x=1734026527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fwQWQ8p4fSiVsjGQYWImVyS0fCQtF0Xd9Qrli2C/FI=;
        b=G57wKVa9uqzRxmmR/J9pZejE10a6lGxQCFd4D18ZhpUzjXqO7/nCWIjGSXtHtmtmwm
         e3n38ddcSV3OEZ05QzIBLvi+7Ceeajww31zkrz7cqhf0QTeyq9xv/rbjd5qtSv9KRXyT
         //1q3TmAzp8AdjPXX21Wrq5HsiAzp9f5J65ZCG+yIIIGvXY4ujuF9fAR+18ho/jpmDSC
         Pa+jH34uJIh+YlvmB9YSzhcAhBUJRQ2v4y3J8zzfmtNm7C0Q3NgyotDnpo3P/eYXxHpi
         pwB7+AZoUxSJCJHv4hfJSOZnT093Wtox30SVfiGxuDrU5LjF4F6o7tv2CXfLxiKbzBYl
         Chsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421727; x=1734026527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fwQWQ8p4fSiVsjGQYWImVyS0fCQtF0Xd9Qrli2C/FI=;
        b=BCFA+ujhiKuI3/+rC6V5k3sA7iO5QKlWOhGfYCo4gV9wzLJ4l/btwZUFEZEExrHrXU
         zMWsCVPaFUYZStSJs+8dLtd2NrJ/MPEp7Od/yyee/yhvRa+7EdqC4TiXBrRcA11Xk+jr
         dgBL1CbivuKF2QQO9cplx12q3u6wQyUvHowD1VfvXwjkyg/hM7cDsvk3w2LF1ofd/QXV
         IhAAM3J1QFWSn5hmO9fCaKqQ2d64U66akyMsHKv4WkgNOR0mm5WJF92FetYfl+Tte60E
         hVITa3yeQQThFm53xocX62VrF+wQrlbYxf3Melzg1SSyWg0j9un1e2Kkp8y5Y5n1XK7o
         EdHw==
X-Forwarded-Encrypted: i=1; AJvYcCWVQnIiSPNCL/4tjQrLvfPgpc0371Amj9AGPRvTNqv7Xd4pv5DjxWaw2dgNwesx8jA/T9lzAumWK2kl7jC69eQP@lists.infradead.org
X-Gm-Message-State: AOJu0YxjJ5VL7pOyrHp9XaNv//4q1/hhDtemUQlFdyPyZtoIw/fSXMcu
	kjbPyz1urzAGeP8U/y4FZfDcf4HMV3LGU4BVtGka+Z4ztaEg3deE9PdYofWJCA8=
X-Gm-Gg: ASbGncvlS6nx+0EU9zxpFcl7AKMMfJbWyDSuLiUlNDUMimE3b/1fJGqje/Dj2hkIuex
	Ku0Y0qv3M08MPAcvVLzl5mjAnZkU8hTeaLDkyqY3tXetlkQyvgxSMZHhctUDaM9OxT4admMWncB
	feewtTQMUFjHx7I+UmZLeSdNBRrcHDRbAtUNDDCRR3zNcxhVAUl2ZyDnA0BFRB59cI8TYDEr4nl
	v9cn6NIXzAt4cE08RCAwCq29H4RHtfPeD3RmSBSuyGn8b8wkwn9Gyi0xJrBsDmQwkd71vEw8u9h
	2tukLM+TB/Gv1FQNWQAvSAGfh8OHPQfH
X-Google-Smtp-Source: AGHT+IEF0Sy2Q+DDxTeCkIQlhde+ymelj1BdzVhOSZd3iGZysiBbmVwX72aWK/Yxm+/ZlbdpgcXp2g==
X-Received: by 2002:a05:600c:5125:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-434dded663dmr2047465e9.24.1733421726692;
        Thu, 05 Dec 2024 10:02:06 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 4/4] arm64: defconfig: enable ACPM protocol and exynos mailbox
Date: Thu,  5 Dec 2024 18:02:00 +0000
Message-ID: <20241205180200.203146-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100208_504445_2E50C519 
X-CRM114-Status: UNSURE (   8.97  )
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

Enable the Samsung Exynos ACPM protocol and its transport layer, the
exynos mailbox driver. Samsung exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91139b1cf813 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1378,6 +1379,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.47.0.338.g60cca15819-goog


