Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1663BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKV+hWN9JpR1oWviShl5FW1hZNTpiT4lwbZMt2wB8jc=; b=mbk5vQMouVFLwgY2OUzYoTHUtj
	0ac/x5IEzSBvgsDyf90ujwd3KO5wMaayBKI/hXjA4fHmRDPpbiR1veIGqdreWgL1L5VIr6lnsoooT
	/Jq+a7pqCUGsYm9vW9+WALxCa6YL8v305tvzR4lgl2MQe18aeg6a9M6u23zM1OvTgE/em41aPSqTq
	gzQdF+pxL8q07Y9tjblwH98zx2UhNPN+TA1Dynh/zGjFbuTg5Bqe5eFbjD623ePQZy93OrcFWZ0pG
	TNaVjrKjY/TiCzBFti7YgWN6NekouoZTn596ttkzRjMiE5cmlaiBTy3D2OCfYwVwf/rIpJ6ddn6dv
	5v5YR5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttNV-00000000WR2-3MG9;
	Sun, 16 Mar 2025 19:10:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAK-00000000UPc-2bLx;
	Sun, 16 Mar 2025 18:56:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43948021a45so14782755e9.1;
        Sun, 16 Mar 2025 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151411; x=1742756211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKV+hWN9JpR1oWviShl5FW1hZNTpiT4lwbZMt2wB8jc=;
        b=OaW98EFEMV7iaoILy2vk6q4f3eqHERWn+T2dh2TRHNZgjpWXg6E3wBADGlyJVMMdRt
         Gw/9YKz19d9p0Vcl2P7RNBPyTRwJv9XUkmjH3XNS0l+lOlyDfIc1T6GotQDn1Xt6HP0z
         f1nei6X6dOC5uD8uZvC3C4Vk1XLXAHgeFs4wmb6adsvoZ9s/k7x+ayCrzOBaOkSQEUVP
         vatjecwAMkO/6kmuRETB3+Ob05vJQELh/bKs/U6GtkDQ4ZJdac1fT0notzM1AzFvvN+t
         UXRWFAnJvXpXWjAqU54grBLpnCBwESoFfb8rsrVFBX4cmp3ZaK5FbzFFNl35blRQ/MmA
         QQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151411; x=1742756211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKV+hWN9JpR1oWviShl5FW1hZNTpiT4lwbZMt2wB8jc=;
        b=AlDApRlNvWuq7MZ6aA9WMvPIyt47nq+lwdhV7yx0hvc6q5/ozst6ltMFINI6GH3zH3
         Jg/Zw19OxvIsGGBqghmF3LeqmOtO33n+OTF19VYw7p3i/DVhXY4qqAFNo0gs9BMKx6HN
         FrEn/a1b/+chsaC/YX5x4jKkF1oQHWp+kxBML+kQoU3/c/dI+S5xuBs/c12hwz3kZCkq
         gd9U9OAw0dabuM3T3Xw/mdxoiSwfC7eLvKW43r38Qx3F2N+SfpxBxz/LkfxHlOsWJsgW
         qu7PB2UgndnuHre2oDltXgCuSNiqaLGTRj7LXI74+Z00RRucArGyjsBSkQ83mDBImhkz
         1CDw==
X-Forwarded-Encrypted: i=1; AJvYcCUevLiez8HFTMiroS7844yf5JeHzw7CAMnOwfxddL8v5LjmSgc/+qlwnxdB1dEEnHs1UyPZfXPd/j8iFnc=@lists.infradead.org, AJvYcCWZWsD318312jwRHmEQswxwFNmbLHSK+TuKayADY8+lhRlmZAxLr8R2ulcizCb5daBVKYFTGoDdwT9oMahgDMUG@lists.infradead.org
X-Gm-Message-State: AOJu0YzglOUbzPRATsOBQHT3+HRoIYXUtlqn/A1wNu+QvQXUU4OsQQRV
	REy59RXY+d//55aMq0fFk82WzIG0jebTEm05zjj9jJSK7OyjS5vu
X-Gm-Gg: ASbGncvLOrW+oX8NjenKl52BaptAiqYZLJH+/lYVB0PWsoikIp2bCipUP2UuO0G7Z+l
	kgsNDIFeZUzJnRh6g+PuUZ0KujR7e0L+AG8nqwEI3IvvlKuxqBqMSofeQAnDIleLsrdP2fh+wT1
	IlVJSO8gk+tfQPabzhHb+zOx8YvPlhM7qZynOuo9C2UUGmsJPHxkJCelnZDEgpbhN5vOJ3MCOhW
	tlItS+yHJWjJsAeIXkEFt6gmHezqKFFxsJA9E8B2uYG4U6gulGZeAs2vUu4Gnb1oXAamGOkuMBH
	rxWlyeReQR9jF2v91WClEy+VGJuHACfFAMYrF4pamEBNHEJPLTOE6h7clIbCj/BOgu3t
X-Google-Smtp-Source: AGHT+IHLZK3FCf/r7+5MKurX3pr5o4LJldkBwRRoPZ2/8ot7v5lwjboRWlnOjFSLvqToQ7g90WgAwg==
X-Received: by 2002:a05:600c:3399:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43d2230311bmr92200575e9.0.1742151410666;
        Sun, 16 Mar 2025 11:56:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:50 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Sun, 16 Mar 2025 19:56:37 +0100
Message-ID: <20250316185640.3750873-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115652_687751_FB4BA922 
X-CRM114-Status: UNSURE (   8.78  )
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
Changelog:
v5:
v4:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bde1287ad9a7..9c01f5333f0f 100644
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
@@ -1409,6 +1411,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1528,6 +1531,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1


