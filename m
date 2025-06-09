Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93979C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=; b=hbuSAYm/csYKfHrXwIyVsKeUkq
	RohhtwVb10IQW22CRQWZuFcVUH2dHpjJu4ZVDUt3q6R7Ymx9wNeSL/XgTDx2lGbVZk9DAR5PsEavX
	nchHQw1HhqEb2LK9+6YlV2k4oGYQ/YryG+zT6mVubQsWhptZJTqYiavFW3mH+t/2YXStXuMu0jlu0
	aXdrv1x01PFpMHd9z+mL+ArgjEQSNNpsv/vwVcsAlbcF1iFGSyI5rSQ1sRhzH0Tj1YlMdPfPAuu0z
	mNDc4u+t4BiiniSgNjTnuOtXJ7l4CRuoU0ftT9j6eezAm7RqpKnH4K8ZL65aGOcwXYD38rDfAnHj/
	/+MYp3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmMc-00000005TkH-1B7M;
	Mon, 09 Jun 2025 23:57:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7o-00000005SG4-19Kt;
	Mon, 09 Jun 2025 23:41:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a510432236so3759806f8f.0;
        Mon, 09 Jun 2025 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512515; x=1750117315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=bl60fvTWuBAFQ/V3gT/RCu440AnwoXhxdfUohLrBhSsT0COwI0472xz5uGDiG6uXPZ
         yZSNPx3mp5nhBNWOUZ4q9QJfShvXbRtf4n61OFdX8Z46WIevzlpaa01GX6qYNFKUjG55
         PB2p9x5KMMKZTl27CHpF+ZH5TQNYg9N4FULuKPoBvKQDyT3pleCRb8tFyYY8RaC8bHiF
         w6hmK3exOiZaFQNnvaa2ru2rONySlXQboqGKV+rsr+gZdEJFVE/eXeQ5rFHy5/eYcYrB
         iPmRv/RS+X9eEK1zu9iFmp9rn4g86rDWGlv39bQ0MQpTr9swgeLgUx4ud+H+roG7pw4/
         t8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512515; x=1750117315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=QrDi8E7aJQTs9pe7KXsihFjLfw7TRmBpsPuXRnmdoE8KF7RD0H13D50jZr6L9QFr1q
         3RgUs3Y6NIxyA5O5cLzFWGWMbkUEumDoPdeWjU1nvGoXKfjwsPY0vNbRvlGf6OzCmFaq
         567x60ub9sOn7IJMHljeH1MuY5XR7osaQCpLczkMLPFWeom2fOA5qS3A2Aa7KgqSz7u3
         z3NLvadSowfISYLT7cqjJM7mboIzp3GujItG2evurom12JeILbIhrQbPROqOjJ6kfk8/
         j0UUiNLqe9nu9kiqLK8BuXS1zR4hBxq9LVHdVow9F6ta8G62PzXzcS36hj+9MCP4mGxr
         zYXA==
X-Forwarded-Encrypted: i=1; AJvYcCXEB8jI/mJcWDK7Cdrhuq27twUqJaoOwLK9TRoyyfrSpwu88Dv4NNNrpSKsemYz0KXeqcMvOezd/zXKmK0=@lists.infradead.org, AJvYcCXgbrlfgKtO6QIxrsXq4SDSaHOdv5Qm1FayYw6GgEr4c+hqvRK8vz89W1Kv3+u5fWOedKzPM9kTPtKWLA6hduYg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3NahVK7yYaOo4fA5IL2AFR6BMjZBrxbGW/MLoogcJ+XlTGxX5
	uQ1E9Jry6WAuzGmGj1dIIqqJ/OBUlFBtnyEnP5ydaDjNUfW2R3cg5qAp
X-Gm-Gg: ASbGncvhT0B8A/w67qLcTnE8dJqvcEFs58REkksd8XNN36xq2l638AFkIcDhnGx3Icj
	uR4PeIDjUgNdlve5nvKDeqhCuXtmPipemCiYWbrzwIMxabDTk+7r9ELCQKlR5S0eHG53P87fnl+
	Y2S22pn8155JoleYOxuybLAnpDAwJaL0qz06zOpZfJqVYX67PlXI8cBKcQQdR/AW5Qy58psNI8t
	oZoPw4kE+w1YRewBMV7bWwIUnQAi3kojD5wKUxCjCfC+LXNAr8bNWgCeoY/+lKLuj1vqrfjjeMe
	psQRaJ5QDl7taJirefZn2AIMrqQPZgEhTWnWZkhhPa/Qy5RSQu/RP6e7FxHZJe8FsNqk2iP+yDQ
	=
X-Google-Smtp-Source: AGHT+IH8d+d87qasytIhytWan/WEKNQkCJ5MRSNoOqGEJq+vqhXarvhfJpA5UduVPDcP1PlcvnPGqQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a531ce7122mr10392078f8f.50.1749512514738;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
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
Subject: [PATCH v6 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 01:41:17 +0200
Message-ID: <20250609234125.722923-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164156_322620_C6AB001A 
X-CRM114-Status: UNSURE (   9.51  )
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
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..84c85a222b3b 100644
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
@@ -652,6 +653,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1411,6 +1413,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
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


