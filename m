Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3471EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=; b=gsMqWPZwGi9Wx7n8Dmp/KVg8Fl
	rEdP/MNXlzjUSRORS4ss/YIPwNooO2gkLUnDnjIGCpZq55d5qbpVnAfAoa5Qsq4kIjehTOJY7wMwF
	Ue5W8igFHWzMPOcd0h5aXAOzWpMDDxewSDVXPs3OMZHIWdVgiccu07TpKOdyqoqzNsEudVipnps/N
	TH8OJbRXPeifNdOeZA5BpzXC8XGD2iWvr372yos+fT4+de9HEYyQYrpCRrQQP268mAVDELs5qmIWi
	DAl3qqxQqlPOZVYOFWSm4+fc2W7PVy5hN9804YmkfyE4Rbnst8YeucBnf7vG/6oGZTPuBj2i7FVOJ
	3u6dzXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7Kz-0000000FIlL-2x58;
	Sat, 04 Jan 2025 16:49:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FM-0000000FHvl-3lk1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so8346525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009011; x=1736613811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=;
        b=V1VJPWmDGjyKH8GGHhZXtS3L90vqMR+gbeYfTfRGFtOAo4C3Dw/UozNHul/cpjOgHI
         1JHcuVlTx1farUml5PJ9Sf0z+cv8/P3kkR/40M6H2a79fLfT8VjdBRvqJC0YPk+2cDRX
         0cxSEwLZf3x8rFfRLtintujY/XwN7AJOMjNBF5ckp4Ef0iSqASoBNQTzTXZvJHAaZGZv
         /ZNd7n3DpScKKcKSVzGnyKmZTiFrr7ysfffhLGnwH4RMkLZsur5SG8RgvCttLRLcZDzZ
         q7iTxnjirHz8MpESBqSmbTiVDBZAX5o65X7UqO4ktYMy8KAcoj+3+4Wetq81QfO5vFtD
         2E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009011; x=1736613811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=;
        b=eeePia6Vx+GZFGPgQFVeZmatuRWzCaTFQcPEspX1se1EUyvLaMNL9rmQo4ksKpHm5v
         Xd3iFCo8o34bKzS4XGAmkqYG3sJDLyTo7uBh5P5o7HwV56RtyJeUJEPf2wKsPPVA5nPp
         DxBi732BDAlfRsOdXoV6Ra09HSyxKXlAJX5azs1fddCwRWitrp+oOx8YBHv4P7Zxyqua
         Hj3bl1qjPYUoGNvCRwECwWGKcOqNDSK3w0pI4d44PhXeslhM3tK3h9HRvy2syt9oDLdo
         3PahEvnLeP60poiGIU9EdZ4RZNScJg1FG6G5pXWKKDvCEQkZDOtmJWcrJtC2l1jR48wf
         E71g==
X-Forwarded-Encrypted: i=1; AJvYcCWGOxb68RCSjGsxUtaCmkcQxV7MlvRPkAluO0jCMcleOcWXm2P4v+p4FMfwQZxRjNgwiJa+2wJVjXDyVIv7jIW1@lists.infradead.org
X-Gm-Message-State: AOJu0YwcsEQZ59eigQP3dIntD4sFq91HC88VdVSXbyalDrgqilD/LkOZ
	gbsvDXqe4KDDzo17bHQNLcAXxqpcstz1cyL+kmdoIXyFavhS1P3M
X-Gm-Gg: ASbGnctTBCOiyOE0BctPp0DovlevJeeF2wxLKcBNMgfoJnI9dEb3OWFPSzpeQb4KMaa
	M65/LVDYePlJ7mTVDICTW8b7aamJWqR2hxeMDRXRaM2/tiAJbNVHbKXg0en9PCr1pZe+8ywuESx
	WVyGPTVYpeeMB13VKRseFCbAL0j4OjCw4+mJdMbCBS38Xog1pek5e0ShFaXSg7h3l78/4F134s+
	6PFy3P14IWuZ95/hYZYP7iPgQMjJjAcgSg5j66Hf6690T9fzFrzCwnMSxSd9Ag59NadLnA=
X-Google-Smtp-Source: AGHT+IFEd9TA8dblUcRj2G2e/O+u7WmpkbdkPiQNrDMG23a+47JqngNVM0VhHsKcr0jkNu1yUvtlHg==
X-Received: by 2002:a05:600c:3b23:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-43668b49950mr393455515e9.25.1736009011200;
        Sat, 04 Jan 2025 08:43:31 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:30 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: exynos8895: add a node for mmc
Date: Sat,  4 Jan 2025 18:43:19 +0200
Message-ID: <20250104164321.333669-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084332_934134_4C7EE3B9 
X-CRM114-Status: GOOD (  12.89  )
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

Add an MMC node in order to allow devices with that SoC to make use of
it. It's typically used as a secondary storage option for SD cards. In
the vendor kernels, it's labelled as mmc_2, but since there don't seem to
be any other blocks, treat it as the only MMC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index eedbd1728..f92d2a8a2 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -1296,6 +1296,22 @@ pinctrl_fsys1: pinctrl@11430000 {
 			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mmc: mmc@11500000 {
+			compatible = "samsung,exynos8895-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x11500000 0x2000>;
+			assigned-clocks = <&cmu_top CLK_MOUT_CMU_FSYS1_MMC_CARD>;
+			assigned-clock-parents = <&cmu_top CLK_FOUT_SHARED4_PLL>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_I_ACLK>,
+				 <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <64>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pinctrl_abox: pinctrl@13e60000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x13e60000 0x1000>;
-- 
2.43.0


