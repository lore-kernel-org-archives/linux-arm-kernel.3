Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSD/9wBjujVG0Uf1/rsF26GO0rnc/+iTaIpHwa0fJV8=; b=ocej7cJr5JyGq4IRnjNq9BRjry
	8l1yK9hXd41XaPWzY0pINvAoGoN9x+jmxlgH3GrSyyOvvALzOlpIJyKWeNTJqlQboRlLSiCviVqg7
	MUlPQMVTEyf5TyOm2IBNBFCoub7zZsvYdxkqm+jzjs467Y39nVJ3HaeDsLYAywOpIr0/1CUQ4GF6Y
	XfWU+WI3ybScW4nL6bESxtI87eGoIaNC8xrxmZKGGgf0T4buLTFuU9SgLYTE4Q+epjBeWnFkX9FpI
	57bORJxEyeD/5ctggSXGEGNiYvoQx0wL/zWERWVlsHlLvUbhoCBqWY4BNDh2ajTWUMk3Lv6pE+Lrt
	P73IyXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFhH-0000000Fh0h-2Q56;
	Sun, 09 Feb 2025 22:22:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSO-0000000Fej1-11H0;
	Sun, 09 Feb 2025 22:07:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436345cc17bso25227125e9.0;
        Sun, 09 Feb 2025 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138834; x=1739743634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSD/9wBjujVG0Uf1/rsF26GO0rnc/+iTaIpHwa0fJV8=;
        b=MnnVBmBdMnXKL06xcfIB0qzVnOy4vj5spB482jP6mj0SD/C2BOfyMX1NDDD8VtVVZ7
         725XWsBAZDWPw77gSClDW/OqpBUIxP0y39+xvU1mzESDmzpu2bbBc7CexSYoTw1BG6K0
         FnOD91nc4I3BPKI1bwtZ7idbOAm8dIUsig7N/drKOZK3Ti/6f5/JEmWwCDP5ETQpE1LV
         5h3TBQFuj0dw4h61NyMCZ/NYyygHScODgO3unqD9Pbm+TYnMwh8pxj6XpSlJAfQgCZXq
         ar3V1dSoDV5niNydHVDgDYoytFb/yD+3Th5F5+y/QYo1UkTK1jdFWw+jfcO5R2bG/ob8
         SUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138834; x=1739743634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSD/9wBjujVG0Uf1/rsF26GO0rnc/+iTaIpHwa0fJV8=;
        b=AjGmvkUe721dnMYXSkpKPDutMZ+PYCmtL6jFg+/QEwZHdhJPaDk5I2Um1ldcxl0W7I
         thC6J2P74dM9nIbYw4h+r/XiyJy2G8xSHbxpQSZ0mA3d2Km81XOzZJ2IaZZP6Irv+uu+
         KUdNeTp3L2PgrFq1i5OZ2j674p97iIvUy/0B2ZGFCQejvQKry3Qq+fWn1PR6K16ZnTCs
         ckTqLw5flrCeziIGVsahj/Jmvds1LdVEAiimbyiY8wmqU/i85s7dEZ6t6VGQo+sC43qj
         4/8kgZasdZE0S1Aslird2mJS8GCXXDsReaaxnpVJ5VRaqDrRQAe1j/bmE7C7TM40EncU
         dBFw==
X-Forwarded-Encrypted: i=1; AJvYcCUiAjVO3FMACzpQ+9eb0NKO4DzlcJp8TS3bkofwyZ/Q3u+Wl1FYGD/1p7hWT45TrIBCwL/NcJ+ImCq4Xa6Utm5d@lists.infradead.org, AJvYcCVQFbxVZ4jGhJQ5ddsex+pf7F/X4wnzQ91fAIqQZCUkzek4mDKC2u8a5aitr9xPAOXvCh4pMSaB1Pwm6kI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhb19iEQe5HYnLmujeXC0Pig2ScNwMYgCy8h63G3/Yj2lZyeVE
	rvhVsg+A0QFYWJtK0FzjmxQpAMr7zPubZerjJEcABzzUrGd6Vrvu
X-Gm-Gg: ASbGncsg7er9JkfVBW5W5pLLJp+x8CcB4ZBocuE9pyqOf3TEybqNJsXTKt2U3AZ6oJ8
	5ZnLnTbmpgeAL5uITQ34IWUJ5eZi4VZFCGMw9ruZM/6V2P1yZLsvB4yuh3hULF2yGGysfURft8m
	pedIz5g0iAUpglAAfTBrEFq6Tv6DjyY+MuzE+Oe2TjBMaivZy1aqlJW2naFnzoKm169AqpFGqgv
	cKILuRz4yz2Rlgcmv2mK3K3IEc9Ss3d/QFhZhQLWyXNbQCVOGgga4XKrxMqmgxfMY2/gk6hMK7e
	aqrhSYSR6syFD26/9im1k60V1rVx
X-Google-Smtp-Source: AGHT+IEemx6QBODy8RjpsuHiiuRss/UBX12yPNG3tLMU0rDbQWy2PzuGa/GWF5u1qU2RXyctSTvcSg==
X-Received: by 2002:a05:6000:402c:b0:38d:d9b3:5926 with SMTP id ffacd0b85a97d-38dd9b359f3mr1828331f8f.5.1739138834402;
        Sun, 09 Feb 2025 14:07:14 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:13 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 10/10] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Sun,  9 Feb 2025 23:06:35 +0100
Message-ID: <20250209220646.1090868-11-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140716_278901_2EF076C4 
X-CRM114-Status: UNSURE (   8.71  )
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

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01 EVB.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..56e2c833f745 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1517,6 +1519,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1


