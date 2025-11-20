Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5B0CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8BXYkJo09cffbco27DiXaVUKDDylvywu2kiuIHEYbM=; b=ZkSMOFLSxwcufUvME3dAJjHJJT
	groTtcgrk4JLK4FTtvkw0f1ho/i47sTfRrgsMqEXd+xVc35Jd9ZlGgg3MbWtmkd8ZkAXpuP+G1njQ
	tqI+TKML+qvv275EvMtQPziHhx36FEjTFeb1g4A6FazkzqGvK7FzC9iGvfSeDiNc4uMbd/YMGs0oZ
	S5RzHYNR4MeWxfdkor0cD5fErXCWgeYcEY7jeAhzJacDKLQZcOT3AurvWb+4z/HDtT4oN4u13Vk9v
	4HCazREmtJUiwpDMc+Vjtsy/Myc9Sc9ds0M7xl+3e/HVe4rflJJiScRgAV/PmoXPNXTBs3Ayw1U3B
	EasfJU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrX-00000007OxD-1ZhV;
	Thu, 20 Nov 2025 21:06:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrL-00000007OsZ-1ZDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:06:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b3c965df5so766116f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672789; x=1764277589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8BXYkJo09cffbco27DiXaVUKDDylvywu2kiuIHEYbM=;
        b=U+gWVbSEo9jVnky6j2Q/ZYF5783Pdau/wgy2Y+WiPiE7whRoa/+LP+Yqe/U3a3R5g4
         dLouh4P/iO8Mszfp0qvE3BLOpGQOyzt3KkoqYauxgcWtv8HfdCB4J88saQid5JMpZsoP
         Qx40s5ZZPw7Dmt/qdAMGd5T0JAz4NYAarpbPGE7DxPFod0ng8UxySfRZfbTYCcaGw1IP
         L26GL+JEChpVqbjb8YeuRBknwBDgstrrigo5+q0oq/aVg5hyJfyXJ+yxOWbKmMcS5/J4
         oLODSFqJGPcveu57m55zR5KVJvqCn/NsbNoTW4g/aCkx/XYBkCYoqRvdxFrOb9gK8FXX
         B+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672789; x=1764277589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8BXYkJo09cffbco27DiXaVUKDDylvywu2kiuIHEYbM=;
        b=v0miWTlPlP4u/zJi9G7vsCj2P7j/pZZHg1qXZcRfL1Wj6IN+04f2wDWCX1YbgfoM29
         Zbrp830QEsm8EzK+RPK1/Qjf+2FWn6nI6WEcW1wHoq8l6UZtTWbSyRDVTLnhcQ9nJVrg
         FPdnCBF/4J45dMANwryeXARAlyL8ZOFEINzPsaQljiL5LjjfYxGS1ecN1IvRxa7TXKfF
         jQbo98MOpFrhLJVKGUCSmQPW2UCLvWwNygyVtjId+VpioNu2Z0/KADncqjquoW+m5kc/
         /xntMLgddDB8qUZbhV10GSm0zS0Iy4oaAxG9jIHQ9VJA3Ke8ncQPRnfFzRCaBQbM7RLo
         wLTw==
X-Gm-Message-State: AOJu0YzXiSgPPM/VguagPQ9k3od3O+WnmjKNhyoC5gQ07B96v0W0qZI5
	QQi1/qyGvMV6CrP9XhptPM8s+eqXqo+k0hxZhXL4zyR+MQNfV90UQAVGs8iuqCBMmN8=
X-Gm-Gg: ASbGnctCy30geKal4IPhvteVi1TDt/YCd9ut12JZdSi5fGlGb0DH3KKFLzczwprrTTg
	ppYrPCvyChM2KBQRA1kAJi0LoeBm/1uBwOKOqpxaV0whxaImmpiP1TY4mNWpsMr6BYBTqowQxiE
	yV02ryP1/li0PKZci43np92CmUPvbNjh/a6oEXX0ct881nrW8kqpPgM1Dxflucw5w9ScLwAF4Zr
	ww3LOFkpBBBFSnjNpSAj/ujYbI+NHU3XB1t+2Km4rFdxi8JRyhjaRGH6j1jZqrN0BEENMPsY8W7
	hUAoQG0l50egk3GIl2RGqMgISkVfs7uipzgpyzSuaXcNKLBUqVqoxFDH9e48uzCiJdxnIHfQzGN
	pUQOB7seqe3SQSJjZe75PERwXsU8+v7yMgUypyl5005jczEgX+GG/OEs5wyU9Oyu6wyaYGvPhDV
	qWjAI3Z3ZbJn5Iwp3fHvvTtgOaL+L5G90u9KVys50=
X-Google-Smtp-Source: AGHT+IF1y8NS7fSk9ziWEi5PszSWt8O9ekApxvVjAqVjXDU6OKQ3ZcI1ywbVKU56ntpqV90CAcY/xw==
X-Received: by 2002:a5d:5d0a:0:b0:42b:4177:7136 with SMTP id ffacd0b85a97d-42cb9a6075fmr5196598f8f.32.1763672789027;
        Thu, 20 Nov 2025 13:06:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:14 +0000
Subject: [PATCH 4/4] clk: samsung: gs101: add support for Display Process
 Unit (DPU) clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-4-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15641;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=QHk8SiPa/eaPMZxAsAQiLzZk+6fLpZAERsS/cFDDl8A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LLaQE+sYqCV4pJQLUBYS+awWcWDoBUANWyY
 B9Qz+UNyreJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CywAKCRDO6LjWAjRy
 umlID/93RgADTcD22ilasX9gZ4Sdeps/lGe7ouZBzFVb4ZJ1GW+ehklO8xMW9bocRQ0bPS8dchZ
 jU/EZUk5+PLE20IJPra5D+QaCr06c7yuKHIIWXhcY73kbs+UaxSwnq1jpTpOinQifo4TPaMqWzB
 u4MHhUlyVw9jlHs5Zj0vs/gjTJmyXpSzzfGv3IOo3Pg0VElyt3OVSZEbWWU0oqzT5pXEdG0bciy
 Fb3FP6AaVBr7/vYjCuQmzN0+WQcTn90URC0L29DaxMBLG/4s85ro9OBdCneE/t+IDa6NWC2cJcQ
 29mtKBjvUDBZF6FudmmIBnmgUmpJytm09zq69+NJaBhFmgVZo50JQWd5IXzuR7xE31DO6O9MXqE
 UoIwdSPGm5VnsUvKTAqdp/X8Pi/UNuDsmv2c65QAFrXsGYwMrOLLosR87tiU0ow43ao4ZTT2czC
 1Po77OSkwdmnzw2OPmYigiIxLorjsGI1gQLLj3s/m+8YlGTV9KXHEwsZPTxw6ZM/4iSNWGO9+ku
 BT+0zU16Q3dMLfTyxjnh+AuI6zOtq0ixt7BZc/C6QeEPpzW0/uDFTP5EBiHNVzmaY9fjxJ2JEfT
 +r2Mvtf+9PmQe0NqNEXr1/ZjRIw2PLVatn+B46Y+MTh06xVBW+2ldE6JT7gkNGfuTEMVDjyRIOz
 FQTpfE2EtNlNy6Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130631_613742_92DC3E0A 
X-CRM114-Status: GOOD (  11.94  )
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

cmu_dpu is the clock management unit used for the Display Process Unit
block. It generates clocks for image scaler, compressor etc.

Add support for the muxes, dividers and gates in cmu_dpu.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 8551289b46eb88ec61dd1914d0fe782ae6794000..82f2343ecc63cc285343cc79692f3a199a9c16cc 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -25,6 +25,7 @@
 #define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
+#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)
 
 #define GS101_GATE_DBG_OFFSET 0x4000
 #define GS101_DRCG_EN_OFFSET  0x104
@@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
+/* ---- CMU_DPU ------------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DPU (0x1c000000) */
+#define PLL_CON0_MUX_CLKCMU_DPU_BUS_USER					0x0600
+#define PLL_CON1_MUX_CLKCMU_DPU_BUS_USER					0x0604
+#define DPU_CMU_DPU_CONTROLLER_OPTION						0x0800
+#define CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0					0x0810
+#define CLK_CON_DIV_DIV_CLK_DPU_BUSP						0x1800
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK			0x2000
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK	0x2004
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM		0x2008
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA			0x200c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP			0x2010
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK			0x2018
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK		0x201c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK		0x2020
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK		0x2024
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK		0x2028
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK			0x202c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK			0x2030
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK			0x2034
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK			0x2038
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK			0x203c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK			0x2040
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK	0x2044
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK	0x2048
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK			0x204c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK			0x2050
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK			0x2054
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK			0x2058
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK			0x205c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK			0x2060
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1		0x2064
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2		0x2068
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1		0x206c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2		0x2070
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1		0x2074
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2		0x2078
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK			0x207c
+#define PCH_CON_LHM_AXI_P_DPU_PCH						0x3000
+#define PCH_CON_LHS_AXI_D0_DPU_PCH						0x3004
+#define PCH_CON_LHS_AXI_D1_DPU_PCH						0x3008
+#define PCH_CON_LHS_AXI_D2_DPU_PCH						0x300c
+#define QCH_CON_DPUF_QCH_DPU_DMA						0x3010
+#define QCH_CON_DPUF_QCH_DPU_DPP						0x3014
+#define QCH_CON_DPU_CMU_DPU_QCH							0x301c
+#define QCH_CON_D_TZPC_DPU_QCH							0x3020
+#define QCH_CON_GPC_DPU_QCH							0x3024
+#define QCH_CON_LHM_AXI_P_DPU_QCH						0x3028
+#define QCH_CON_LHS_AXI_D0_DPU_QCH						0x302c
+#define QCH_CON_LHS_AXI_D1_DPU_QCH						0x3030
+#define QCH_CON_LHS_AXI_D2_DPU_QCH						0x3034
+#define QCH_CON_PPMU_DPUD0_QCH							0x3038
+#define QCH_CON_PPMU_DPUD1_QCH							0x303c
+#define QCH_CON_PPMU_DPUD2_QCH							0x3040
+#define QCH_CON_SSMT_DPU0_QCH							0x3044
+#define QCH_CON_SSMT_DPU1_QCH							0x3048
+#define QCH_CON_SSMT_DPU2_QCH							0x304c
+#define QCH_CON_SYSMMU_DPUD0_QCH_S1						0x3050
+#define QCH_CON_SYSMMU_DPUD0_QCH_S2						0x3054
+#define QCH_CON_SYSMMU_DPUD1_QCH_S1						0x3058
+#define QCH_CON_SYSMMU_DPUD1_QCH_S2						0x305c
+#define QCH_CON_SYSMMU_DPUD2_QCH_S1						0x3060
+#define QCH_CON_SYSMMU_DPUD2_QCH_S2						0x3064
+#define QCH_CON_SYSREG_DPU_QCH							0x3068
+#define QUEUE_CTRL_REG_BLK_DPU_CMU_DPU						0x3c00
+
+static const unsigned long dpu_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_DPU_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_DPU_BUS_USER,
+	DPU_CMU_DPU_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0,
+	CLK_CON_DIV_DIV_CLK_DPU_BUSP,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK,
+	PCH_CON_LHM_AXI_P_DPU_PCH,
+	PCH_CON_LHS_AXI_D0_DPU_PCH,
+	PCH_CON_LHS_AXI_D1_DPU_PCH,
+	PCH_CON_LHS_AXI_D2_DPU_PCH,
+	QCH_CON_DPUF_QCH_DPU_DMA,
+	QCH_CON_DPUF_QCH_DPU_DPP,
+	QCH_CON_DPU_CMU_DPU_QCH,
+	QCH_CON_D_TZPC_DPU_QCH,
+	QCH_CON_GPC_DPU_QCH,
+	QCH_CON_LHM_AXI_P_DPU_QCH,
+	QCH_CON_LHS_AXI_D0_DPU_QCH,
+	QCH_CON_LHS_AXI_D1_DPU_QCH,
+	QCH_CON_LHS_AXI_D2_DPU_QCH,
+	QCH_CON_PPMU_DPUD0_QCH,
+	QCH_CON_PPMU_DPUD1_QCH,
+	QCH_CON_PPMU_DPUD2_QCH,
+	QCH_CON_SSMT_DPU0_QCH,
+	QCH_CON_SSMT_DPU1_QCH,
+	QCH_CON_SSMT_DPU2_QCH,
+	QCH_CON_SYSMMU_DPUD0_QCH_S1,
+	QCH_CON_SYSMMU_DPUD0_QCH_S2,
+	QCH_CON_SYSMMU_DPUD1_QCH_S1,
+	QCH_CON_SYSMMU_DPUD1_QCH_S2,
+	QCH_CON_SYSMMU_DPUD2_QCH_S1,
+	QCH_CON_SYSMMU_DPUD2_QCH_S2,
+	QCH_CON_SYSREG_DPU_QCH,
+	QUEUE_CTRL_REG_BLK_DPU_CMU_DPU,
+};
+
+/* List of parent clocks for Muxes in CMU_DPU */
+PNAME(mout_dpu_bus_user_p)	= { "oscclk", "dout_cmu_dpu_bus" };
+
+static const struct samsung_mux_clock dpu_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DPU_BUS_USER, "mout_dpu_bus_user",
+	    mout_dpu_bus_user_p, PLL_CON0_MUX_CLKCMU_DPU_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock dpu_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DPU_BUSP, "dout_dpu_busp", "",
+	    CLK_CON_DIV_DIV_CLK_DPU_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock dpu_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DPU_PCLK, "gout_dpu_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_OSCCLK_CLK, "gout_dpu_clk_dpu_oscclk_clk",
+	     "oscclk",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_AD_APB_DPU_DMA_PCLKM, "gout_dpu_ad_apb_dpu_dma_pclkm",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DMA, "gout_dpu_dpuf_aclk_dma",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DPP, "gout_dpu_dpuf_aclk_dpp",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_D_TZPC_DPU_PCLK, "gout_dpu_d_tzpc_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_GPC_DPU_PCLK, "gout_dpu_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHM_AXI_P_DPU_I_CLK, "gout_dpu_lhm_axi_p_dpu_i_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D0_DPU_I_CLK, "gout_dpu_lhs_axi_d0_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D1_DPU_I_CLK, "gout_dpu_lhs_axi_d1_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D2_DPU_I_CLK, "gout_dpu_lhs_axi_d2_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_ACLK, "gout_dpu_ppmu_dpud0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_PCLK, "gout_dpu_ppmu_dpud0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_ACLK, "gout_dpu_ppmu_dpud1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_PCLK, "gout_dpu_ppmu_dpud1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_ACLK, "gout_dpu_ppmu_dpud2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_PCLK, "gout_dpu_ppmu_dpud2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSD_CLK, "gout_dpu_clk_dpu_busd_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSP_CLK, "gout_dpu_clk_dpu_busp_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_ACLK, "gout_dpu_ssmt_dpu0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_PCLK, "gout_dpu_ssmt_dpu0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_ACLK, "gout_dpu_ssmt_dpu1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_PCLK, "gout_dpu_ssmt_dpu1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_ACLK, "gout_dpu_ssmt_dpu2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_PCLK, "gout_dpu_ssmt_dpu2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S1, "gout_dpu_sysmmu_dpud0_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S2, "gout_dpu_sysmmu_dpud0_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S1, "gout_dpu_sysmmu_dpud1_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S2, "gout_dpu_sysmmu_dpud1_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S1, "gout_dpu_sysmmu_dpud2_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S2, "gout_dpu_sysmmu_dpud2_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSREG_DPU_PCLK, "gout_dpu_sysreg_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info dpu_cmu_info __initconst = {
+	.mux_clks		= dpu_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(dpu_mux_clks),
+	.div_clks		= dpu_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(dpu_div_clks),
+	.gate_clks		= dpu_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(dpu_gate_clks),
+	.nr_clk_ids		= CLKS_NR_DPU,
+	.clk_regs		= dpu_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(dpu_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= DPU_CMU_DPU_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+};
+
 /* ---- platform_driver ----------------------------------------------------- */
 
 static int __init gs101_cmu_probe(struct platform_device *pdev)
@@ -4443,6 +4723,9 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	{
 		.compatible = "google,gs101-cmu-apm",
 		.data = &apm_cmu_info,
+	}, {
+		.compatible = "google,gs101-cmu-dpu",
+		.data = &dpu_cmu_info,
 	}, {
 		.compatible = "google,gs101-cmu-hsi0",
 		.data = &hsi0_cmu_info,

-- 
2.52.0.rc2.455.g230fcf2819-goog


