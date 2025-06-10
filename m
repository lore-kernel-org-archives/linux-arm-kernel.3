Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB8C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=; b=MpM5iicF/EbDDHrOKE7hBJz5IK
	AX9Tgud+HsOgGiqkCJOduxv/HzXy/2tHRgA4JZTqMv6sC0q4fNHdbMyH/n10Qx9lbMpdceeRlz2qc
	v6SkWTHrLDkEEAWFw/5Ammm52RBwAHkPU2pLMtda1qTJBhkdCwtkoBaL8EeejDrJJzfMgge4uWDa+
	aRs+37qck5+aaLu6WBuiChjzP2NI9Y3yHn6QU41kDjvYV+tWUQrcqJq3CJ/1YTgM7d16mAayRx4GP
	cvmMtAKZTbz2A2L/IuXp/5u23VKVPjIVR9BtVAK13BcpeQz7MUkYw6xbbonFHFsgjQuSHZL/HYzPO
	99tad/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nJ-00000008INA-1aWu;
	Tue, 10 Jun 2025 22:50:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5L2-000000080lW-1Zgn;
	Tue, 10 Jun 2025 20:12:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-450dd065828so40735435e9.2;
        Tue, 10 Jun 2025 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586371; x=1750191171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=RLVT2dJg0SJufuDwUkCA1axmHH0xk+nHXrh1fpe+5PW7VW7U1+2C3ogRncR8NUpbiY
         hOF5JL7hna7z0omcktv4DPkC9k5NIOEyC+nM/iC+pi2gNiPxvlYI2jI2VDgBwQ6bkHU6
         AbCSObg0nBXWOeRt2ukuU5Qe2JsZx95tgmeUKCjZGCwghDMFVUlDx1BMZWE+zt9n6CkW
         UF1CgPPT3i4NilRDSZ1Et+mmsdxTNesdqRDtENUmMZMYXT+C398pwujslNVL3Q9ewE29
         BPHszq2WTtIfquSw8er/BiMK/6Ht3fFqzzHvjYw0JU4ELhyWQIAumLHokptpKXhrwZow
         WZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586371; x=1750191171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=kCqCm2RpEwJK2RJtTHUyCqdjphf6/Sqifi0589Gsh0zjsULDkGvzMVJQ0z3KQ+pdeS
         Nu8TrGgFe5MEhC8ACX3+9Q/4DJgJqOrAdZPK8fF1d+BFoYKqVyCtXYULRvLhxp+IuLp0
         RJ/OZUkAQbZkQyd9yoaxE9kiPqZ/dtyvnQw6evZJpxxS+2A8BfsyTbApL200LZL7HXYt
         E9/tcGPBE6npseZUizUWA+2m6OSCQetU9LPWBsl4IsiC0zL/44YRfW4cCOndAHT3ez8F
         /bThZoYXcfnH/1hrr4r8agS60i5Gma3vCN6cKUwByA0wxW6Zwb1CSOHW9tR/ke7OEoWT
         Hv4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaIgsqD6pYUbMPJvnUFFLaNf/EbnweYIkN/u6j0Bul1a4hDJMaK8Lq1om7CWmRQRy2XKFD8yBfMOfnIq/LDlZo@lists.infradead.org, AJvYcCW1o5GYMKuPOp9Hxrjb5R6qToHlLG75eQ5SjDTNi5lN/jadGbPqw1N+5OiCebDswKv6rdLhm9B2smNkCb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWRsWX8n9aDHVsDz0QZP704EaNOmSVwtMBVKu7ZsH2n8bCglAP
	EileCvNDtO3QUFSgH9IXn7EBQ/JGi5rUI5GPdO7hwY49GVN2uhTaJIwg
X-Gm-Gg: ASbGncu10k7yhGXMZ2YS6X4N4ooz/Gl15cwFwKUdDdj75p7vgGUReBeGTDoqr3Jcjbm
	DQiM5Qvlhih8i3j24kwqjPtHhkvioKMzWmdDo7z+ONP0HFHsN7AcNFL1kTgRXZN5oSJdVlRiCf6
	BPtU+84cB3lwKcW8BTFF9QRGTsH6VEMDNuG6S+d2T0JgiAmVltF66p2sldBcj1OeyqvTLmSnpGV
	M8T4pg4RrernSmAYp5sconcbqZ6hiabLlsPtewgSKXkphzPHgeus+z880zj5grfPnYaRjb+bTjy
	HaK72EGJ+YdUpGKLFVCBA4MD5dUnwdivf5ta/BkKmV5F8hM9RrGcrvR7tB/1GFQjV8Y9fWLOcOg
	=
X-Google-Smtp-Source: AGHT+IHAfus2as8xEX4iDfu63duVTXHrbs5exQRrMVtiCIQNQ6/TZbKnWxqRaxxHybEddLqJocBNng==
X-Received: by 2002:a05:600c:1395:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-45324ec37d2mr1288935e9.13.1749586370869;
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 22:12:19 +0200
Message-ID: <20250610201241.730983-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131252_412716_D90899FF 
X-CRM114-Status: UNSURE (   9.59  )
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
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..b43f9502acce 100644
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
@@ -654,6 +655,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1430,6 +1432,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
 CONFIG_HWSPINLOCK_QCOM=y
@@ -1530,6 +1533,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.49.0


