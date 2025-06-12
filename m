Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61561C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=; b=eaK5ny2EpqCC2GLDWe2jm8KvQk
	t8ZfAwAJFOTef8aD6qFmBgMW0HTmqFQpRbca4nLQpSpRYj4CMi3ZYDSQ4qAxygYlvkWbooSBRiKl9
	UCZkP5AsdF6wi5c5qZ5L6E3hdOfpFqIUV7tXJeZXNw5W+y75fv2qzM5sAzin2VCNfkkEYyZGjh8Ot
	LKcs6/EC3dASx2yt+vPpU9eft128BzZBL2SdG1LX2ueDq8u+VpBeMcm8n0oWbuHqbPXrY5gXgzVK4
	PP+PF2JF1Apghr8OHw0ze8p2DYXr2455uMq3Jm6/1Gs6rPGPa0KiP4LU+LY5KPxKCJE+MY0nPoDiB
	faQy/Q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowM-0000000EXDK-1dOz;
	Thu, 12 Jun 2025 20:54:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyy-0000000DSVp-3WOO;
	Thu, 12 Jun 2025 13:28:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a51d552de4so643874f8f.0;
        Thu, 12 Jun 2025 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734919; x=1750339719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=kBqHjJNl2v0Ks6/mqT8brvUlVDL4rmMSbfugOIpSaLi2L7MBtbeCFxOHSYobQ8Gz/G
         /iMHDxMG3BivIrYWzCPox/gEXvr0WrRPwFl7Wdb0kSUr8K+reXdqPXMSh7CZ9Fic1mjO
         1jliQRNE/pRP3ugIdquFt31dMONbM/58W4yAD2gzBzhxup/eHO3Z35QDZjE8RNljNMkD
         ov9/16FlCKI9c/7D8YSPc+osGdP9/fruL5StH7ZHKoIhfQ4rLTTb6l87uNwr/q9x5cyW
         VzPv77HUCFlJcBYoZFWHI2hd08Heb0eKNXPmtuVEu/0m5t4dEmcu3N04mrYwAcTnDmX+
         XnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734919; x=1750339719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=vpsrMuzy6hBu+j2Rq+WyYszJw4Ehvbx1ktVaKds9UDlxZ8igP76ScaIw5xrSdJATOF
         T2wgAbkFhAdePRDmJdMXbChveWcGNuY+KeXTq5Ys8BGR4lN7tgsyC7KxMUpRCvuQFCYD
         QvNiOsbUOMFnZ55kBoKGwNXUQJ1GSxf/uNKbh8gVwwxxm63CXdattNaH16UYxHknmcLM
         GpcwJk0/gVfqVEzP1iwGmOspvdL6+r7wbS2BdDC8VWi9aghKQj7oCcXY+HhBg7YgVNpE
         Td6/cGguwR0buN4ak8dyWup0RON8sa7szDeFD+2lBYZzqmaRhqriufzgb9+e4if1zzfZ
         UdGA==
X-Forwarded-Encrypted: i=1; AJvYcCWuDQn5STi3rwriKxsEQn1xrr9yfssSAtB2J3KPbLtbGgBeQSgVv8XCGBkBgzcdGROWR0TysKNxvWtRuaidpMPL@lists.infradead.org, AJvYcCXxAtPQbufKaCYhu1ZhkrILe6lK7noi5oi7mzBsha93wTeb563KPqYGycut1qoxF0xAfJv8hf4YGV3WosU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA5787bzwGxH1LnA/Qw7BgmHRtrYKR0QFinPTXeYpn8qDrG4Fr
	vYFhBeTQNG0eNsQnsqwy9RLniLwljyPEvDbm7g4gAgJxpprcnIG/3GA1
X-Gm-Gg: ASbGncuhhJPYop2En3whbdOT0oJED8iy3cnppuFbItbowpjsh+v+2GTiNFKK+qe5lUe
	ydxkWb/Hd+8Pw30DWlMvHS5P7B328fDah3DvKR2uO8h5uhjK2tzav0BSXeBe8R0hDtpqkbH8UUn
	0yO08Ff8RyuQjmLD0Oxsi8ZYMRo+GErNbmhx+i4kk6ywvf+h8qb+zpwSX23CJCYlplxnBDQnyfF
	hNG7+XdUTSFyNB+XO05PaGV4aCIxt+DIyivGVPs6BXtl6HjH4txCk+bzKVY9HHSSg+fFgB3Y/zl
	QhfJHDz2HrYj6eCRNrIYJOSdrbJ1zPNYj+PJr/rshLJF3FQVwY50OXXpO8onSuhtNEKCfi/i4d+
	lDCXPYBLAwQ==
X-Google-Smtp-Source: AGHT+IHcFVWEX+KjeW3ppd6At7eyZ4IER05LLmIVtxkWrdoTFMl7T38r6NDDqCMPQK/Fvj5rzzGoqA==
X-Received: by 2002:a05:6000:26c7:b0:3a4:f70d:dec3 with SMTP id ffacd0b85a97d-3a5606c7a11mr2662391f8f.16.1749734919190;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
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
Subject: [PATCH v8 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Thu, 12 Jun 2025 15:28:14 +0200
Message-ID: <20250612132844.767216-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062840_888543_C98D3DD4 
X-CRM114-Status: UNSURE (   9.50  )
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


