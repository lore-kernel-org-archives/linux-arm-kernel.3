Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCDFCCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlfTuxpg2vZermn3xEvTp73moBNB2p5ILIMcqfhHtkI=; b=iXPt0C50Ex8YdxFtgbdTwJYYDD
	Y3py8Ge3F5assOwVZfTwd4+wGI0z1yYlnnU4q5ItxYuxQHn/0dPK1WtNjH6nu8KGyPL8899G7jRpP
	KXcpeAG0J7eHd/H7sh/kOW7Ro/3hUGX6P0Bj20nfKV8rHbKVtWeuDA0FG3/ClcGgDgv3roOXq4mQd
	LdfiSyX5uZAQFWBkJ9UNqinimVOGs9rxB5MYEf+mkvCJLFNTpleP+8U4ncG14k3jAcKnSUjJVg412
	m6LWgwWX0xPTtuD0Kkgi4W4A1hX0gwHeC5IMJ0p7L7Ur+Ckt7cfWEZA+Ev9WBagZQCo6wU+vesdtP
	BvKXYV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWY-0000000EU2Z-0BEO;
	Mon, 13 Oct 2025 20:52:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWU-0000000ETwo-31Zr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:52:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so25325065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388721; x=1760993521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlfTuxpg2vZermn3xEvTp73moBNB2p5ILIMcqfhHtkI=;
        b=OR0Ucm5hJWfMZMAGmrU2vIJJJGolZrtLlGm9qSHbU+52N8Mdo9k0TzbWfL8dgUVFrR
         bicMSBkOWLQqtxEN9dXKqGbE4ZRXvJH6Sx6RFIecPgQv1V6cFMFS+EV6GnoLU2gLDVOJ
         AczpB5hY3cAZReWYH59EnPQiUzUDuZFz3pufNoL+AWFmdE451cTeqtTsTV8uvNWxmcKU
         42lHsKt2/zLfejb2Idx3lMDycWDk4ITpYtp1Kbq++hlIRKCxBWnvWHNtyal7dUWUQEkZ
         l7e29gOZdecSsOHW2SXbx+Ss4pNKRs3PHUVwQdXrVxmHGqiu7kpPcJIP2TiL0d8Nk8iz
         41Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388721; x=1760993521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlfTuxpg2vZermn3xEvTp73moBNB2p5ILIMcqfhHtkI=;
        b=XFgVOZzId2JVb/P1COunh5DXxVQ4cyQaS/Tr5QcgmycyvQ7tDqQelEangNGx1kzWDK
         dwvfr2MIyEij+Ua3BvUIN9RMVH0PzUPuvIyCv/KVw5/K9XgdbkyTjun9mOFnDN3t+GWf
         NJYm1QmAlXS0IQ59mj1Arr1PNAosZFab+K9Xcq6D7HL02oOrYeyTIlDLwierfkxGAPoh
         22Rq/NLMj/VY9HkeqoB8GpNnWQtut6WE9cnsAAhLOg5Im/PxmcS3t/dMv3Mz1H6d+qv+
         Jj/T20JRpuunst6+uex8Wi3lnGVtEjtXBoQef+AWMloADbrBqGIVJli4DHzf7c2FA0UF
         rTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEemJINQMQD8hUmTtGiRnFU7iUNzHYSaxdYVDpKU22dwbYJUbieLbTxgBe9CUdP8QuM2hmMUxF9roNrf+SuG+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yxko7fHk4Zd/hIxJFm3LfKYUJXge2Boyc53Gh8Xei7jWveuUvtw
	zbFF0mN7Kz8OFgdGBubk7/I1DDzMBM7tFxN8KFDjW8yFWz0GzRi01fMLeZA/ybxRCxc=
X-Gm-Gg: ASbGncsB9lnyESkHeF36AZ7Iuy2PmsmSUsyMXr5pJxYafhHvB5+RBKKZhb5DoAjkxBA
	tYZZBhWlQ1pQW5s7mNkpVPjGOz30/s7+nMzSnObC9Wn6LDGtZhPk2ComDPpm+HS/ztKRX7LydD8
	7R+MIdyqBobElW4hURiB7JlfkUV2S+YZiiwhfxs3CapL1oRYRYePB19OEdFzHD1V9MWyC+At2n3
	7DqupcqZTJFbYfwqEgAuXgSLMC2vGxcXUpqW5+ZKeKyOXZCyZBWDMYRnP0OswTeRwLw1zBrwnly
	UlKo8Oqsew3DeU3mwCXcUgV1YfU4DTAuASp9DeOU8h+Dnbeai1iPdhoN+9Mu30c/WlWLlnvNri/
	hSKDh2W40l3AWxsG20PKz+sEDrNTlM4x0U4NZWVpRELhKNx8lnJEgGD8nSVCwzTMdRt4r8HGsIH
	4=
X-Google-Smtp-Source: AGHT+IG1NwQmtOjjZ2/dGF38ZzGggflM2yvAgmMVXAjSdlZJTXywrvmzmtGp19sycSBPbak19TsvNQ==
X-Received: by 2002:a05:600c:4752:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46fa9af8fb0mr166311105e9.17.1760388720655;
        Mon, 13 Oct 2025 13:52:00 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:59 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:37 +0100
Subject: [PATCH 8/9] clk: samsung: gs101: Enable auto_clock_gate mode for
 each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-8-72851ee00300@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7486;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=fQZhEsh+9ZgYadJsDPZd2/yZYZlJq55drQnSNUYsOok=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZaFmB5oO6bxerWS75hxLV3Q/O3DBVJInhcK
 HuIddY42LCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWgAKCRDO6LjWAjRy
 uiUMD/90qqTQd5Jt7lfdvd8T1Ib2G44/7tTA/l6AJ9HgSoevW3uhesRJ1AHoyZY43EA44Ym1MlG
 OoJ0nbcq9iGwa0QQpxvoLrmHKqcsJvIqb/VrInAdkaDLbGMcH7AobRgYppbwnHjKDuBDM2+fkMG
 NwNKjj4p1MNOCfbnFYoElEhHI/F4S8Sq55lGAvGja5/CIRLD3woKLLDOeIby93HMnuV6/sTf8s9
 gK6a/VOor46whtehVuH5TyWVWSUBa2NyNvaN3DB0jJYZ12wVwrMI1bY0+QUz7EjCQJl/R8f51xX
 s/jcLl0fV6rn+brULQ6mrpu66BdLSmZDHIOBpY+BibhyqdJJZwJLp9EZkSOt9G1zlu4jb72hbMW
 D5baSNrIzgbB2kypuclaRzN91foPFpiYA26dwyzWk6LVOyT5+1CmNMGHLMTONwT99CtdxW8L6jQ
 nqHI92of3SR5vFisBnthTY59IWQkZjjWLkjtCSlLGTxusAEkI7Yf9ugpa/gTKC2yvHeqZZnZKsH
 eX22vl6nHQQxhNYhIbjiI4mQtIdQvhsxImJ79WtgR8ALoPfCM5yp+qyD8mvPKfRxx+/ZRxLWigr
 Ssu9j1PU88KjtSi8Y/OlAK4NNUD/kaVWDBrjefABDGGXW67zU7CZcP+/nTLkgyFFKQrMwu+8Kzm
 7wP1hmxcQmJWa/Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135202_844576_6C83CD21 
X-CRM114-Status: GOOD (  18.16  )
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

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled. To ensure compatability with older DTs the
resource size is checked and an error issued if the DT needs updating.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 80 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..baf41ae6c9e2480cb83531acf7eae190c6aff819 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/google,gs101.h>
@@ -17,6 +18,8 @@
 #include "clk-exynos-arm64.h"
 #include "clk-pll.h"
 
+int check_cmu_res_size(struct device_node *np);
+
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP	(CLK_GOUT_CMU_TPU_UART + 1)
 #define CLKS_NR_APM	(CLK_APM_PLL_DIV16_APM + 1)
@@ -26,6 +29,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1440,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1910,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
+static const unsigned long dcrg_memclk_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+	GS101_MEMCLK_OFFSET,
+};
+
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.mux_clks		= apm_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
@@ -1912,6 +1927,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_APM,
 	.clk_regs		= apm_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
@@ -2375,7 +2396,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI0,
 	.clk_regs		= hsi0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI2 ------------------------------------------------------------ */
@@ -2863,7 +2891,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI2,
 	.clk_regs		= cmu_hsi2_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_MISC ------------------------------------------------------------ */
@@ -3423,11 +3458,37 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
+/* for old DT compatbility with incorrect CMU size*/
+int check_cmu_res_size(struct device_node *np)
+{
+	struct resource res;
+	resource_size_t size;
+
+	if (of_address_to_resource(np, 0, &res))
+		return -ENODEV;
+
+	size = resource_size(&res);
+	if (size != 0x10000) {
+		pr_warn("%pOF: resource to small. Please update your DT\n", np);
+		return -ENODEV;
+	}
+	return 0;
+}
+
 static void __init gs101_cmu_misc_init(struct device_node *np)
 {
+	if (check_cmu_res_size(np))
+		return;
 	exynos_arm64_register_cmu(NULL, np, &misc_cmu_info);
 }
 
@@ -4010,6 +4071,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4085,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC0,
 	.clk_regs		= peric0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- CMU_PERIC1 ---------------------------------------------------------- */
@@ -4368,7 +4439,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC1,
 	.clk_regs		= peric1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- platform_driver ----------------------------------------------------- */
@@ -4378,6 +4455,9 @@ static int __init gs101_cmu_probe(struct platform_device *pdev)
 	const struct samsung_cmu_info *info;
 	struct device *dev = &pdev->dev;
 
+	if (check_cmu_res_size(dev->of_node))
+		return -ENODEV;
+
 	info = of_device_get_match_data(dev);
 	exynos_arm64_register_cmu(dev, dev->of_node, info);
 

-- 
2.51.0.760.g7b8bcc2412-goog


