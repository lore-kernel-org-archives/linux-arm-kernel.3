Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8608C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=; b=wO/4m/B9y+xBQQP9oidK2r2efK
	YmA9k5gk4e/O1XW7S3p2Wp6Q565AoS0DEfYzYZD/Vo7amYPR8PlyOujbyo21/97RPyc6/OgvYaf5U
	alTN4NDWUHmoM3plKW+ZsB+YUP39OoWPXuhxw4kVRBr92RmnctYY/Or2lODfxODxNlkGj8lSZDeCw
	aQd5vSLy4ibE04irsBMHSCzhJQSgtzzMqvZBZ4kYz2h6xjtqWeJ/2qhD9Uk7njlC1PBV70lFQ7Guj
	gmau5Pc7+yHK4Jm1t61ZB/KagPMM9y6H2Ci88tee/o/y51rv4lGKoyxYwujSIYfuyEIh/Ny7iwSy4
	Uk7vcB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMA7-000000012lS-3LkG;
	Sun, 09 Mar 2025 19:18:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLor-0000000111v-1XHe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 18:56:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912622c9c0so179734f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546572; x=1742151372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=WhzT77gZ1vdffqWPJN50Ln+a0Bjuzu5xu35u/j65V8NL6a1+ArasWW4/xIG47c3T44
         r6/GpqzGUIQe+CiwMqzAOQoA8iv7Ue5m7GOX5ZD55ekeLd+z4dQqjtlcT5iCgzJcktDt
         Jk7G8exoMMrnl/EW2pwpxoRQlOfhhsHcHiXLDqF5WrLXThdApuI14YHkqw7J9ZK4bgR/
         tx4qYaYQEuz+aLeYpVYaX22Gbwx9qgP/EIGheUZ37YAhodJWWCydrl507hdRTmha3ODG
         xTpvVE/LTJtiQJSyWrksHZmPUXlbxDQFhIUsZT9Kwq+t4PV5JlSGP7Mfj+JtWENONJXj
         KhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546572; x=1742151372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=i74obSNfUwYCt8nneG3u2/VViOJZoWZjPuAT9jn1Q8SU0uGc2zbZwVhJ49bC5zrhDc
         fHuouCvq+xMQ4riFrXoaOgsY1a02GYCfttUhi6zcZzzB4qyilt/NNf7g/1WkXBm12OAj
         7dBp7jTjJ0DnEvdZdMuyt7L/ze8W5gNzpp2Ok7ArJnh/ZnMe9k7OMfwwlVN9OTydhJIs
         uG0lZAWI3ObVTUw1MzsXvZL7BDEbejTWRBOt77e/bGxaV3AMK/HWep+81Y2KFmn4kVLi
         HiODfDqe8grjpCJPwa9Vwh5lgEoeuhClmrz4+dkz9PdVUGPA38H1Md9+rx8xGgnadnx5
         8JFA==
X-Forwarded-Encrypted: i=1; AJvYcCUFpk09kTakswu+xV+8Lgk/tGMplNIdSfU8e0kU7hpQtMS5bTAhyholYVo3uej5avtFAjv/oE661g4R1MJCRHVI@lists.infradead.org
X-Gm-Message-State: AOJu0YwTY6msCQjDmo24wu3JKW2hsoNNnVpfMuJNQrbHWhknIbIO1KwX
	eyi/mWnSFku6dacCu+yO8t5QkSjdKLRP+ws+IvrDpuJlx+HXv1r6f31xKxgzXco=
X-Gm-Gg: ASbGnct/SxhmSGPuRkd7f+Ums6dRLy7RwlHZGCTG+y/xrWtCZ1nyyY3NRn709uFHbL8
	64ARJE+P2YRwFpius7w57vu9tZCtFpPvu1gZXYMKwy4CDklGt2IzPh7XWtntzrjtqoVW4vTPmxl
	YgBBaT0myv2PFBo5xSdqaqr1mZVtiJq83053bl1RYai8RK6uWAsiqsEKi0XD59KGBAtbtM23kgk
	tvmI5KcK0Wezy1vF/YZ7gHff4hBgOH3xxwDYidfv3/t4YHfN6q90F6ruVPp9B26SQB9Y2BqZNmg
	4aErOgg/rswchYTCfLPoT5dyK3RTy2nXMPa4fLBLV4buXVLU6c8h9lKRAB0=
X-Google-Smtp-Source: AGHT+IEKpRHbbGfEM98G+jT1dTf4FeQB+l3gBVL1qFl0csub7dukLp0ucTCxODN6l+bL/aW/iBduNQ==
X-Received: by 2002:a05:600c:5122:b0:43b:c0fa:f9e5 with SMTP id 5b1f17b1804b1-43ce6eb5ab2mr15192015e9.4.1741546571601;
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 4/4 PATCH] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Sun,  9 Mar 2025 19:55:58 +0100
Message-ID: <20250309185601.10616-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_115613_403137_A7EA4A53 
X-CRM114-Status: GOOD (  10.09  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.43.0


