Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6496CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p75CvvJIDH6qNfnUs0gO+Nm9mIpQLlEjYBAGW26AtKM=; b=xiq+BoL3n/a9Zfbmu8MV11knhK
	OL4RA8WPF7r6CEh3SfESstkSAdu8uq6VpXjDnZiu1oyHhAzq+aLsVHhNFT7OHzkF0RYAmEDIDjb7G
	guVyI07EI98HJLrg+0zzNDCYgijvrgJaKfwmOS4S52QV73Wkdn3owy4CYPdN5W/B8DxR68cqBtnD/
	mpt1p2QxPGZEhrJZyVN3O+8Qmr8tLkH5LEds9+q2YDmBWrbQ7az3u54xuvpIRwFEs+biWI38t6liy
	nERw4lVIpLZU92aJ+wp55AmraKXzqEIDG9YPx1C4ZvbuQWWBpbV9TSkuL6Zj9GQ5d35mwBgXWf5g+
	8zwyLMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWb-0000000EU6v-0Tdg;
	Mon, 13 Oct 2025 20:52:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWW-0000000EU01-3t4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:52:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so43667015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388723; x=1760993523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p75CvvJIDH6qNfnUs0gO+Nm9mIpQLlEjYBAGW26AtKM=;
        b=sM8JSZO2/ZiRM5bI08zgmy7XipcEvx62IXnoK6TPD4E1sARI7SlKkSQBcZCUBA/Ij4
         KBJK5Dsv39sQdfHmmB6yOaBpu5xegQcdBc9Z9KfvLqw0oB/N1SnqXuOzWcpla6/qO4oR
         te5isPg33XpQk7mDSG7TRdyRA0ffCpz5943L3Jz8PTHF4vcT/sE3cD2zw3SViiSyb2+7
         SYBNkoebtiSRQkFYxB3cYVJ5bk3DtdpPkI3MgDZr0JJnORcibSXjb3TZQfm4jf9wG4uj
         C59+ETctand6mtzfpaekacZIY6gCqvneHUjo6vVdVhC7aFTOiwXhqhxqNS+gmmsLIfEz
         g2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388723; x=1760993523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p75CvvJIDH6qNfnUs0gO+Nm9mIpQLlEjYBAGW26AtKM=;
        b=l7uB5Cj3cahSEFdzAA6lt19IFty0gJaHb2bPqoKu5zJEcLA96/lGKlpQJszNF7Nw7n
         dkDsQ+1bX4s8N8+ZXAnmzvSR4945jmoicKIrc6Y17tOGA0ITIyp3xToPDBcngP3e2w0/
         kyUfeyK0CtHAPmp5tqAkLo3sLVNW1UonmWUYR829v3brnqzfN9LC7Amj7H2KhzzzuWQH
         upDQV54uoEdOlmfpOQ/s1nhoNyBwjgiY/L4zurUMnS7R60J9zr/Ky2nPhigi88LibjPy
         Lcbyv2XfmOQnf6vF8cyCss4SGTtJGRmH33efVZ90i3H26DJjujmWXPvtKQhOFbsYpdXv
         niGA==
X-Forwarded-Encrypted: i=1; AJvYcCXbuKOdV/1wWMpJWCWWqJ2JqsAP4bAMjFJ0Rgst/KQpLRfmeuNFtj/HmHYM7q6yDNG89JNA7vEh+cI3X3tiP8MN@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGeWHanCFh72htMZGIEktWAglEm6JWCUD1wMdrn6g/8oBON5I
	x9nbDeh4pvPOj5o9riuczWjQZjAESrfDwBGlS9sGmGMGUO0qdPYPhWntyUXkWu9f7KU=
X-Gm-Gg: ASbGncunTvrx9886lmjePdkVvN/d8FtvTO75wM1yQIMT93S2VOIiVbpsOeDq0QjehGk
	7PQraSTbJ/k+0M0eHtJhTBHqnUSRCJur5kPJsqNppheIIIgENw2Gz3oFGvZLiskcHmyJCrQFP4S
	SaKgUagVMsactj7OOiqG6YuCdrWNV2rj879UmJ6Pl6OrGLENBAXOKg/VS0e20S2NGazcXFE8HYL
	7NHTZoIfw3d+oWuAPD9hkfsSPvEoCOjoT57EXjkRD++utzHPiQjNyckEmTz5Sgi5BWVcaTnOGbE
	PIeRNopF6GgxEk/9Wkp8CZ0zs0dap7eUADYOvy1IbQ6qtaVkrz7a0PbHYuud9E05rXRInP8uaf2
	T6I3orLpb9NGq5EylswF8WyrIGie7n4R8GuImkUYXj5j/iOLvXpp+rh61MPJODMtlQrsqCRYceL
	g=
X-Google-Smtp-Source: AGHT+IFlSMRo+GJbrZC2R6cadbg0Mn2wjcwo558vGXjQZ987pWFhJmxXyrKyNE/lrCX6DAooh7pdgg==
X-Received: by 2002:a05:600c:608d:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-46fa9a8b2aemr152563365e9.4.1760388723134;
        Mon, 13 Oct 2025 13:52:03 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:01 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:38 +0100
Subject: [PATCH 9/9] clk: samsung: gs101: remove CLK_IGNORE_UNUSED and
 CLK_IS_CRITICAL flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-9-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13977;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=uWkxZU/Hl8Nl10OdzwhtsVKl5aw0le6G5ifJ1QQqHl0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZaPc65TE1WfAGkP722Wyk85+blnbkvhUHrU
 U7QDhVWSSSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWgAKCRDO6LjWAjRy
 ujkpD/4nQc7i5Ki84Xi71NS6m0M4/YubG7TkMt2P1UyU1+0hFiVLbs8oAVDjzS5fv6fUyVLpE1q
 HoUXjuJnYeM5tCbqiXiLS4wH44TQlCUM8rvGFUA2wM1C09q+1coeSzI/T+q3ImXdU3P0awnOcIM
 aB7lwJZbRf7s736y+c+yb/0BvvOpq60q5JHwOO5a2CLvV1nkrNtiGkBVjPjxdYl3qFW4zpXjigI
 95QCCp81HlKKs1aXRrpP29HJhK3nG4pyMwws3C6+MCGwAck14MBIJJMA/aiPCb+00Kf5uxmXnRj
 6XwbRcFqABW1lGXMCSsmDSjX/cOZzlRs/qRKD7gphWCvqCWhnN2US1v15dAN3xtSxENOGexCljt
 HM/tSIFGFSCq6v5ZtUaXl1DOnClFaGn+sQJnycL5OzYWoDqpD35LBlWzoKtx27UdfNpUoz6rLSG
 AfujdrLAL/4rKbQWtg1g1MEoWS62Y7Nauc9ZkSTxPmzM/nI19e5z29XrVpCyC6QwinZWOCcyoJs
 K3XRcVheoQdOnHFsYGS2oESrkrCqelscvwQrXy6vu79tUH9e+DQZ9xgHA0mIhXhUWaRY0W4ylmb
 uZezozg1b7CsxKZseNZ+wSjxnDjk6+oHuKiwrfH1mt4ytZGRmAQEAe58iq1ihjAOOaaOf8TgorR
 lwC5ZTLppfmiwZw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135205_127185_29B01D36 
X-CRM114-Status: GOOD (  11.71  )
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

Now each CMU is in automatic mode these flags are no longer necessary. All
unused clocks are automatically gated & ungated by hardware as
required.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 87 +++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index baf41ae6c9e2480cb83531acf7eae190c6aff819..d01c94994d86bc27d344969c33955da63ed0e4a1 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1901,13 +1901,13 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_APM_UASC_P_APM_PCLK,
 	     "gout_apm_uasc_p_apm_pclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, CLK_IS_CRITICAL, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_WDT_APM_PCLK,
 	     "gout_apm_wdt_apm_pclk", "gout_apm_func",
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_XIU_DP_APM_ACLK,
 	     "gout_apm_xiu_dp_apm_aclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, 0, 0),
 };
 
 static const unsigned long dcrg_memclk_sysreg[] __initconst = {
@@ -2211,11 +2211,10 @@ static const struct samsung_div_clock hsi0_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_PCLK,
 	     "gout_hsi0_hsi0_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_CLK_BLK_HSI0_UID_HSI0_CMU_HSI0_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26,
 	     "gout_hsi0_usb31drd_i_usb31drd_suspend_clk_26",
 	     "mout_hsi0_usb20_ref",
@@ -2252,16 +2251,14 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_lhm_axi_p_aochsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHM_AXI_P_AOCHSI0_IPCLKPORT_I_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_LHM_AXI_P_HSI0_I_CLK,
 	     "gout_hsi0_lhm_axi_p_hsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHM_AXI_P_HSI0_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_I_CLK,
 	     "gout_hsi0_lhs_acel_d_hsi0_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_ACEL_D_HSI0_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_LHS_AXI_D_HSI0AOC_I_CLK,
 	     "gout_hsi0_lhs_axi_d_hsi0aoc_i_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_AXI_D_HSI0AOC_IPCLKPORT_I_CLK,
@@ -2286,21 +2283,18 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_clk_hsi0_bus_clk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_BUS_IPCLKPORT_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_SSMT_USB_ACLK,
 	     "gout_hsi0_ssmt_usb_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SSMT_USB_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SSMT_USB_PCLK,
 	     "gout_hsi0_ssmt_usb_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SSMT_USB_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SYSMMU_USB_CLK_S2,
 	     "gout_hsi0_sysmmu_usb_clk_s2", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSMMU_USB_IPCLKPORT_CLK_S2,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_SYSREG_HSI0_PCLK,
 	     "gout_hsi0_sysreg_hsi0_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSREG_HSI0_IPCLKPORT_PCLK,
@@ -2358,21 +2352,18 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_usb31drd_usbdpphy_udbg_i_apb_pclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_USBDPPHY_UDBG_I_APB_PCLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI0_XIU_D0_HSI0_ACLK,
 	     "gout_hsi0_xiu_d0_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D0_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_XIU_D1_HSI0_ACLK,
 	     "gout_hsi0_xiu_d1_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D1_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI0_XIU_P_HSI0_ACLK,
 	     "gout_hsi0_xiu_p_hsi0_aclk", "mout_hsi0_bus",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_P_HSI0_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 };
 
 static const struct samsung_fixed_rate_clock hsi0_fixed_clks[] __initconst = {
@@ -2677,22 +2668,19 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_GPIO_HSI2_PCLK,
 	     "gout_hsi2_gpio_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_GPIO_HSI2_IPCLKPORT_PCLK, 21,
-	     CLK_IGNORE_UNUSED, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	     0, 0),
 	GATE(CLK_GOUT_HSI2_HSI2_CMU_HSI2_PCLK,
 	     "gout_hsi2_hsi2_cmu_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_HSI2_CMU_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_LHM_AXI_P_HSI2_I_CLK,
 	     "gout_hsi2_lhm_axi_p_hsi2_i_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_LHM_AXI_P_HSI2_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_LHS_ACEL_D_HSI2_I_CLK,
 	     "gout_hsi2_lhs_acel_d_hsi2_i_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_LHS_ACEL_D_HSI2_IPCLKPORT_I_CLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_MMC_CARD_I_ACLK,
 	     "gout_hsi2_mmc_card_i_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_MMC_CARD_IPCLKPORT_I_ACLK,
@@ -2795,38 +2783,35 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK,
 	     "gout_hsi2_qe_ufs_embd_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_QE_UFS_EMBD_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_CLK_HSI2_BUS_CLK,
 	     "gout_hsi2_clk_hsi2_bus_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_RSTNSYNC_CLK_HSI2_BUS_IPCLKPORT_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_CLK_HSI2_OSCCLK_CLK,
 	     "gout_hsi2_clk_hsi2_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_RSTNSYNC_CLK_HSI2_OSCCLK_IPCLKPORT_CLK,
 	     21, 0, 0),
-	/* TODO: should have a driver for this */
 	GATE(CLK_GOUT_HSI2_SSMT_HSI2_ACLK,
 	     "gout_hsi2_ssmt_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SSMT_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SSMT_HSI2_PCLK,
 	     "gout_hsi2_ssmt_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SSMT_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SYSMMU_HSI2_CLK_S2,
 	     "gout_hsi2_sysmmu_hsi2_clk_s2", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SYSMMU_HSI2_IPCLKPORT_CLK_S2,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_SYSREG_HSI2_PCLK,
 	     "gout_hsi2_sysreg_hsi2_pclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_SYSREG_HSI2_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UASC_PCIE_GEN4A_DBI_1_ACLK,
 	     "gout_hsi2_uasc_pcie_gen4a_dbi_1_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UASC_PCIE_GEN4A_DBI_1_IPCLKPORT_ACLK,
@@ -2862,25 +2847,23 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_ACLK,
 	     "gout_hsi2_ufs_embd_i_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO,
 	     "gout_hsi2_ufs_embd_i_clk_unipro", "mout_hsi2_ufs_embd_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK,
 	     "gout_hsi2_ufs_embd_i_fmp_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
-	     21, CLK_IS_CRITICAL, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_XIU_D_HSI2_ACLK,
 	     "gout_hsi2_xiu_d_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_XIU_D_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
-	/* TODO: should have a driver for this */
+	     21, 0, 0),
 	GATE(CLK_GOUT_HSI2_XIU_P_HSI2_ACLK,
 	     "gout_hsi2_xiu_p_hsi2_aclk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_XIU_P_HSI2_IPCLKPORT_ACLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 };
 
 static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
@@ -3849,7 +3832,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
 	     "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK,
 	     "gout_peric0_clk_peric0_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
@@ -3865,12 +3848,12 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
 	     "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
 	     "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0,
 	     "gout_peric0_peric0_top0_ipclk_0", "dout_peric0_usi1_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
@@ -4003,7 +3986,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
 	     "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
 	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
@@ -4012,7 +3995,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
 	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
 	     "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,
@@ -4310,7 +4293,7 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_PCLK,
 	     "gout_peric1_peric1_pclk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_PERIC1_CMU_PERIC1_IPCLKPORT_PCLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_CLK_PERIC1_I3C_CLK,
 	     "gout_peric1_clk_peric1_i3c_clk", "dout_peric1_i3c",
 	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_I3C_IPCLKPORT_CLK,
@@ -4330,11 +4313,11 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK,
 	     "gout_peric1_gpio_peric1_pclk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_GPIO_PERIC1_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_LHM_AXI_P_PERIC1_I_CLK,
 	     "gout_peric1_lhm_axi_p_peric1_i_clk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_PERIC1_IPCLKPORT_I_CLK,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1,
 	     "gout_peric1_peric1_top0_ipclk_1", "dout_peric1_usi0_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,

-- 
2.51.0.760.g7b8bcc2412-goog


