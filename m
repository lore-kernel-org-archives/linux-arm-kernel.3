Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BC2CE7B12
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izrTMD0huWeNRknL/GAHd/+r7uT+qo4tnd5Axn/4bzo=; b=Um7F84hVFP1ftV/L8JdhuVpM77
	wqFG8CAgAOodBcMf8np1Um9wqE4j7HCQMW9WxrzX9thj0dX+G3etjeR/BZLb4kvHy6sjc/w+OEW3k
	p6cA+4tcyjslw15KcY9N/pJHPwaDYcDRSNDHSz+PtaoSScXIybR2yG69AAecrm+T4VNl0KFIAzvZj
	M50DDZzRQbO8CKZZxxzygQtzI2ctxp6IsjYZ1SPd7w8z/bapW2lQBMddeSZ4DRkcUW5bHJT1Iph/a
	h48dNMr5M4LDkmeklNDmNSRv25T3uwfKrHNocCIxkhN+gW+FdUcbCXwf9RPvbxcLYY2Lm9ObJJnmy
	ZFSy1Lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubz-0000000CL5g-18Ia;
	Fri, 14 Nov 2025 14:17:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubs-0000000CL0R-0iyn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:17:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b427cda88so1492935f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129826; x=1763734626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izrTMD0huWeNRknL/GAHd/+r7uT+qo4tnd5Axn/4bzo=;
        b=POP1bnwHw60RwZhr0BzJEgWMMbWOqhpVtoz60Kaw5YgoZIlHIpNEtvp8CdLBpi0Vvn
         xu9LkZKO7uInDXH5q+LaujJocmBIGug7j67Dm9NQOcAHvAklSXguBi4rPxppSDhvoa7M
         iH7dD4nJ//UOFroo5HdL1FdCaq1jhT1Q5/MQoyFbNWALPAVtdbNtBuh/vV5XVp3AE3zS
         lRFvWNgb5EDzh7Wt6D810s/vO0Xjbc9hOQ7FPaGwU8d61PQFc5hnw54uOHRZhAS1QZ70
         kniz/0ki8rC/YLUhFaAxomQH7PFBQeSWB/6NRp5q1qxzN7zbGwULt31zc79Hg4f2rXoP
         lVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129826; x=1763734626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izrTMD0huWeNRknL/GAHd/+r7uT+qo4tnd5Axn/4bzo=;
        b=o/1reV76HphLO1pr5zB2x3cCm+sj8ca3cUxxbbBPmBCV2JPJR+TDfH5A8m7qE2BJ46
         9+/Q8A0jXPYnp87yISEBCwUFX1jW/ddEHbrQ+dux7Ctz4oNHbSl8bH3m4r3inICc04cD
         th94PgpPxLkp9H1Iq3GKcej7T9F06F9Ar3ry6qE7Vj/EmjSp8h0rUxT9aOAUivsiYltg
         rhPaxm5dWB+sF2w6+R/H2xSflDy0pdcSA/UqOw7gu9Kyk3AJ3Nsi5B8foyULbSOJMrNC
         +0rFCxQ/En3aHvpMYB+RhI/1UxiDb00dPTlrWGxw7WasBPpggw+bBWT8mZEo75p0LaTJ
         bANw==
X-Forwarded-Encrypted: i=1; AJvYcCWrP9nBp2ratYu84KtUF685PHu3WnO4XSKCjHXCAcXbaBfYKVarEvshU+SM7crOC5BkiYI+uMFN4YPFKRWbdi5a@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZIrZyp8L4HSbbJe2uPpKgey6d0L60UReLPd89tpDuC6dvD/E
	B3tE1Sz1zwWD8/0D89qLMT5k8cK7Yuq9lf0zFcU6ZeBaCFBmvW2hVidO18d4QuDhcwbLaDIRcE2
	9KRb72+g=
X-Gm-Gg: ASbGncuyjIpBeMkquuUpJ+k62BPczYdxmHH3VOmKZwLmKb5c5L/3ES8t7YldtFzlr/Z
	GxrDlgzFu8MUZUlyZ2Px9yOj1eP/Tb1MVODq9y+lGnBi44Sy+c0EKWMAiZl9hg3JKscdyQuYlJT
	d17Basq4PhB4qpkAeEyilRhJn/CMle1Knk5M/MNjgfVaRi/dehNZwLzOzUF7LNvMpxC4A9IPQFx
	FM/qtLghVmMeFuuhsvnXvW+0zI980a5jUY/mfrVR1lnRmilSSE4C8HFkyCXkn1Y8AXZcdk5aczV
	DgYRTdW0r74DgdpP3Sb3OYyvZYIXMWSo+bbBQ1BgYK/QeTrPu0lCpo9+o0vAmq+fQm+tAE64zlz
	E3FUhS8wdV0dctd9jdhr3KTSB7RI72YVmB5RIJNklNXd+9uIf1jtxA8Sbrl4HTkj/w3ZpyI8GGE
	SwAOfgevwan14pRf+wZS8ruvfOP8HRiQ==
X-Google-Smtp-Source: AGHT+IH96TxZeOefX8+SY8uloxCFq2LKDEjHOXQ7zqlH0Jw8f3vwrEecayPgVM4Hu/FkPGbODo1b8g==
X-Received: by 2002:a05:6000:2509:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b5937335fmr2978794f8f.43.1763129825971;
        Fri, 14 Nov 2025 06:17:05 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:05 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:51 +0000
Subject: [PATCH v5 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-4-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
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
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6082;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=MKpewkNORbzAchE7rOq+25/zxxY9N/8QM3gYPecQu2A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznZjRn7B08lXbfeHCgvZruDuguZEiCYDtEZS
 G6Sh7bBJoGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc52QAKCRDO6LjWAjRy
 utPTD/4p8UJafm5z3n3XNt0BjCf+MReD7ndnIAJlkxzL9tG0v7gAUB8VT7IHK+rdTOuHBtKT0RQ
 SI1kX0hDDlVkGwi6OLZHK7tjqtyzdMy4Xo23R1MmHvl3NPOx9rytFuMEJrOEdxDstjbq6eqA9y/
 bgt8VkED8iWLgDGTb1ONPkhhyXTiomMYxJItr9G8GU7PChZOGwcuMqww3xu88CFWId0O9xK5aif
 +Ns6ID7pcOeSU8upN564uKZRBeQOEskxWnZuf2ucuMnD41DP17B/vBcKJqJhBs4L2BkalLGDKPk
 /dN9k3u+YxK3dYPq1u1I01D9FAbYYv3rE3zy8U4Dume5HlFZULcooAAUwYsYM9Q8reX4EtnW9Sm
 PijR3oY6A6VYn2/HzbVPuoagtV0WWAYMtdHkQ+2jxYJei9CvqVZZI4b6hZ595CtZUngeA3WY6vp
 RNm+saZuAbHfsd6W0OIrdErK6hxh8c0Ziwt9o0kXSU5QV/ggB9dHe5+lQyTIW+XLzaHrwrnkgDt
 fQfKd1lBICfMNTqUbR7rq9UEkjAR20tip3tWMmhUJQ3NdnUQsR8r1cc6vX+bI5vnYDbhYsW1kh4
 ggAJJRfQpoCGUwXXE2DzWytdrvE+JUKtRlfYlTtnSHtrCYIDFdEn2X46xUwWbqA14CvAfbIAd1s
 DcDh9yE70fsUFvA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061708_255257_BA78AFC9 
X-CRM114-Status: GOOD (  13.15  )
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
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Remove unnecessary header of_address.h (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..8551289b46eb88ec61dd1914d0fe782ae6794000 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -26,6 +26,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1437,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1907,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
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
@@ -1912,6 +1924,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
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
@@ -2375,7 +2393,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
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
@@ -2863,7 +2888,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
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
@@ -3423,7 +3455,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
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
 
 static void __init gs101_cmu_misc_init(struct device_node *np)
@@ -4010,6 +4049,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4063,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
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
@@ -4368,7 +4417,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
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

-- 
2.52.0.rc1.455.g30608eb744-goog


