Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479C7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IheE9qVzV7PsklKZKF/CcoIEwL18pQsEGgmo5EP68GU=; b=1gsD3rypykQdHQsRYqCvZw7o3U
	jOiwEuqkD7RWdsxsQO8lFFtXrIkas1BRBfM+GW/xt2HJ+vBzuY97LoauJ67Af0o49nSLiDZqJ2BPf
	JvxRWwwSBPix5tZRTK3VipaxCed84Ug3ehaWyvy/KrVIJZ5/lgrV7pIbFm3WqqF2L6QlzmdMjVHUv
	BcZNlgKx24Zbkki/F99fVyR2CIQ++sUDnI94djbeIUv5kXGcFN9Z1xxbK4G/XzoSvK7F6ZBXxF62s
	Nh9pjmfEDIzKrkxxzgOO/fyq5PWbXvnMrPR5yHTxb5soPgzdlGnqaQfvrEuJ8gpxI79hZs2Lgn6ng
	AlCDomLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBvE-0000000EjGE-3BFZ;
	Mon, 29 Jun 2026 13:21:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBvB-0000000EjF7-3Yb6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:21:11 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37e11438c66so1264656a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782739269; x=1783344069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IheE9qVzV7PsklKZKF/CcoIEwL18pQsEGgmo5EP68GU=;
        b=Exse2RCbEN9M6T2AOfyTjhHBlZO2zwCEP2eo1eN8rI5OJSUnaFQlRRpTB8kLPu7/tR
         Evc7s9jpxihD0iXbf7uoOKeGGsL2I1nW7G3bbamF/xKAW6/Rpz1HlkgFexzVI3QgCHZ8
         MiZJWdB6NNniEXERs88O8QPPplpo52lbVRBGuSEsKQABQEAuONjtErc9Ir5CKSczmB0Z
         GMONbf+XtwmMg9OG4nx4UU/90mg1+nQQFeZhYrMW7bdDdGMcGayGCHHVrPA9lHyH50U9
         jMGE3NW7K2rn/Ny0b7Ey0eye91L+D/k4UASgkLWYL8SelSGM86a14Dp0mwNkykjChlkY
         U0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739269; x=1783344069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IheE9qVzV7PsklKZKF/CcoIEwL18pQsEGgmo5EP68GU=;
        b=GaT5i1WvpLtMZnBH/Jqpqxh1vuebWZckxhZgrxlg9zmKFesXSWyLhhB16YSnBy5k+f
         igx7t2U/DsfbTeVaBoi/1HGLSE5tOyKxvfTVCf+bKn5v76+WBtIOf5rg6fBznS1hD4az
         ottc0VbvrGSckfAQ20/+L7bbWtLoawdJ4YEEv9ALNuBt29RSsTeKWW6hqOTNwALGr+J8
         h6HrhB3tLR0k15vliSa2A9Tl0dLAE9bXdBUa3EaPHZaYkYH8w+FMNAbd+nYtnJdg/ppn
         t+IxspsvrK4TyM8h7BlULW4Yln37IDzkngVYeLbVmPBsE7tsMnKkXRMn41FM6kMtVEab
         WbTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoisFAK/BwNSSXIf2eHdEs3E+xZEXkW22g5EmlYS6uZhCFhG5aRBxEdOu4PAnLhwezrDp561Pk/UckNkO9qv+hH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1og7l+h/75J28LBUUxUL6Um83WmDRdHtCUDu/gDBfN53hzMZZ
	lVMCfiCNsiqx6lw+1UoM9gLB4T9WSJAJDCF7VBrsJu8wp4JDXeLGEyTZ
X-Gm-Gg: AfdE7cmYdRG9wqfx7XzRxREf4ZglUgKOND/ZFjEPI3dtPTRjxXXUBUyGBrjCnYKaosb
	aprjlKoEgEPTshxUE51mp+Ak0gyot0mSdZPcWwXoAom5CjzqyWmlEu633xSavxqiZJvRN5IBn5y
	MwXQsS2DC/6XCYQOKPPKh8fzA/hFYh3uFXnwjTrWxH+tODwnZlKMlTQ23MQ0dBs4y/4+Gf+iN61
	k1bFuVzGeNeun+YtG+CeTzN4opTT5I4put6iqWHr9SvkA5THI4KbK8OnaJdBcQHHI4C5HUpc+mi
	dQOyZwknxDH1BOANzr1AevLxtT14Zi+33hX9JwKTK4ylbxYr3jxtEooNL+297PzgEMBXF4UPjbj
	ksA/QCfyXBFFrmc/7jMeQwllPy/7IYIontJjwkl1Y5IzWdDOidKRTweYcQSJfMa5sUSgyggrd/U
	JkSNnvCpPe4HTpYbu+7lvEATXos8sHqjdcFV7KATfyr9KA
X-Received: by 2002:a17:90b:3f10:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-37fdb062e8amr5490736a91.21.1782739268802;
        Mon, 29 Jun 2026 06:21:08 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df411ddf7sm9007528a91.16.2026.06.29.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:21:08 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] clk: mediatek: mt8135: Fix inverted gate control for devapc_ck
Date: Mon, 29 Jun 2026 22:20:43 +0900
Message-ID: <20260629132044.208905-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_062109_898786_9A324796 
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

The devapc_ck (CLK_INFRA_DEVAPC) on MT8135 is currently using
"mtk_clk_gate_ops_setclr". However, checking the downstream kernel reveals
that this clock is configured with set:enable and clr:disable making
"mtk_clk_gate_ops_setclr_inv" the appropriate choice.
But, it is strange that some downstream kernels are not like that.

Amazon: INV
ChromiumOS (early): not INV
ChromiumOS 3.16 to 3.18-revew-v2: INV
ChromiumOS 3.18-review-v3 and later (sent to kernel.org): not INV

Link: https://github.com/amazon-oss/android_kernel_amazon_mt8135/blob/e2b2163a8ec4a7c8d961c89003a15b4ba0f0e371/arch/arm/mach-mt8135/mt_clkmgr.c#L1022-L1028
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/4b624ee66e65d5dcd43fca36b313086efae8922a/arch/arm/boot/dts/mt8135-clocks.dtsi#L944-L948
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/decd80c01d0dbe9f3afa8ff72273b5618b418180/drivers/clk/mediatek/clk-mt8135.c#L881-L882
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/9b6f06cb7637100aa1a42e1fc351b36b384a1c54/drivers/clk/mediatek/clk-mt8135.c#L450
Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8135.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 084e48a554c2..1d20e15608f7 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -409,6 +409,9 @@ static const struct mtk_gate_regs infra_cg_regs = {
 	GATE_MTK_FLAGS(_id, _name, _parent, &infra_cg_regs, _shift,	\
 		       &mtk_clk_gate_ops_setclr, CLK_IS_CRITICAL)
 
+#define GATE_ICG_INV(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
 static const struct mtk_gate infra_clks[] = {
 	GATE_DUMMY(CLK_DUMMY, "infra_dummy"),
 	GATE_ICG(CLK_INFRA_PMIC_WRAP, "pmic_wrap_ck", "axi_sel", 23),
@@ -419,7 +422,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_ICG(CLK_INFRA_CPUM, "cpum_ck", "cpum_tck_in", 15),
 	GATE_ICG_AO(CLK_INFRA_M4U, "m4u_ck", "mem_sel", 8),
 	GATE_ICG(CLK_INFRA_MFGAXI, "mfgaxi_ck", "axi_sel", 7),
-	GATE_ICG(CLK_INFRA_DEVAPC, "devapc_ck", "axi_sel", 6),
+	GATE_ICG_INV(CLK_INFRA_DEVAPC, "devapc_ck", "axi_sel", 6),
 	GATE_ICG(CLK_INFRA_AUDIO, "audio_ck", "aud_intbus_sel", 5),
 	GATE_ICG(CLK_INFRA_MFG_BUS, "mfg_bus_ck", "axi_sel", 2),
 	GATE_ICG(CLK_INFRA_SMI, "smi_ck", "smi_sel", 1),
-- 
2.54.0


