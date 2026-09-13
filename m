Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E3C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LiFj+YViXnUILO1Xl8u0yjE4yvh4W8pLQubMdsa1jkQ=; b=1uT27uBe3SdOa+2k9DLZbTSHSY
	FRUJc3p4f9yDPyxJRNzboO89zhAsIUcRsncbyp7hlPzS942ENBUgNEB3nf5mc3sD/twFd9OvO8b9l
	OJbx+Noqc+QUnSf9Zxzn61+Xq1XJEM2r6RNdy3vdYar7/AQO+lbEuJSuUQS5IHSoOe/B9BW3xawv3
	AIIIkigtyYpfm8WRRG1XO3s1/7viU+MfA14M8zKHh4WMMgQUEipkh8m8ZxFzDNf8ENWk6uHf7cWcI
	hvNne3kNcAvfuCDvv4nvYZ5ipKtc2nLIABIHVW/mFZTWSGPi8cW+h4xeoU3C9WLeBFxPE5tr1AmXG
	NmtXS77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5s3U-000000023j1-0rs5;
	Sun, 13 Sep 2026 21:48:08 +0000
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5s3P-000000023hh-2bSL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 21:48:05 +0000
Received: by mail-oo2-x07.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so1099792eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789336082; x=1789940882; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LiFj+YViXnUILO1Xl8u0yjE4yvh4W8pLQubMdsa1jkQ=;
        b=BEboUwQBh5r89AkJFf3H0kxEiisC/i6C76MXq/xq0d9t6ikARt36w6DNG/8LDTdbqx
         +qhJQwG1Pue6s5oCsWKEZ6VTQIkadZMxxHDWz3EvEn31BtfoHwMGlUUjf1xiQkGbpfLN
         HIp3KvN29u/AiDsASc7i/Y+WkprCuoAq+Ta6fr85IIYvMzwNxzwaJw/5WEfWHezrtCvP
         1L7wX/FZJvZs1ZRWYSEnDKYSZMRsyT3D2kEtroqTgsMoIWaKNapDRc2uv/0heo9Joopa
         P460VCW0/tQRCFJsW3Jr7PYKb8zX9f7Ur77JNBn6447UTkaPs1DjvLX+D94iMJqg77Xi
         4taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336082; x=1789940882;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LiFj+YViXnUILO1Xl8u0yjE4yvh4W8pLQubMdsa1jkQ=;
        b=WNZA238+T7n6pQ+lK4JKr9BpLXAmju4pw2VbN9AOiprlGt6/xmeJAe/4N4u17HAfzp
         SBuIProAbX6OD9BNxO1kqcfnJ9u5jOGOEEvlcMJAQAJ2t+eqTLKvf5Men20nP2rOauP4
         oERz02Wfqh40/EPgbNxCnQsrIvwIqPrdxbtP+ajeyyvOT7dyTo4G3zDLqFEFEfxYJg/3
         jet+p+BGpnwbw3ODrLteIe2uUPu75QcVrehSp86i0jQf4wXzg6bBuUyV8FRgPIJIB0X3
         +/yIuolgIUhTbEgNFaWFZRl7QlxTkSEb1vRBCkcAzLQHPBHZVxhlPoIi6gF8W/VPLck6
         CHxg==
X-Forwarded-Encrypted: i=1; AKwUvBycUFfYjQGHFZ4E5VBQr1blOdfCEgQsqn2O8CvDb3tVpt/yExQXkSV38BxFdEXb3fVtrAl1pRicNH1WBOd8gwJe@lists.infradead.org
X-Gm-Message-State: AFuF++kHiBTctkmotN7Gnffl1Js7wammGC3SsrNb6d6LCZbwr9spPrZo
	MA122pRPMykH+wfGDuEKq59Fsh5AdavYeQtD3q6bx7gnjbhvDHx7sCye
X-Gm-Gg: AYBFou1lHEEjZWdibZYzHsSrDqTMwdZI3aw3bv9MqV5MtgKj0GcUMWXzzAoFmrJP/gq
	R+c3SeL/Hbre6wUUoItPMApYzhYIhgsbEfiqP+LZErSWTRpXRQ63ZStjUc4NcZ+E80Ueod0kxDP
	EewHf2taRvDDw603GOkh/XJl3D1Wm6DYvJKqt0b8RdgrMcR+1UPxbaafA2VvPNpI0A0LOLQg34I
	0SaN/q14VNJ+vv27epjw2qb5ujoBy17KSCHeFQgpers7E5B7sIiYx9nvkOVoy6787UXG5ARwq6C
	PEqdaXh2QU+zpYPJyWaIaZZZ7AXFFp0OS5QZaU82xIfdhLYa3RVDcaYXJdkbjR4vHdTQP4ocD2+
	0yk5iBvkgK2DUCVWTP5RxMROuZyhOmiJlfI1RYOv7kJ46Usk5RRxhs2khYce2H4vNjQuZu9WrZn
	LwdejeTY90du9oHWbSxtHC+cslK4SMLaE0fGHPmPuLw6diLLltAo+axulrbTqyDiwyN/BF3r7fg
	Og2b5Y=
X-Received: by 2002:a05:6820:2213:b0:6c2:5e92:b599 with SMTP id 006d021491bc7-6c25e92c715mr7185528eaf.4.1789336082388;
        Sun, 13 Sep 2026 14:48:02 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990cc05fsm8928296eaf.3.2026.09.13.14.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:48:01 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 16:47:53 -0500
Subject: [PATCH v2] clk: mediatek: mt8173-mfgtop: do not use the clk API
 from power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBAAv0J6dg1tRaIn/mE4lLLAKnSbFlFD+
 LuAH/A4yWRmFhEDYRTXZBYBJ4rEbgV1SITtjGsRqF5ZqFSd04tUMDTtyB4cg+0fYDyB5xcGYAc
 mw9Roc9KV1mIN+IANvff4rfxxfFZ3tONW3IyO4sjhs98nuXl/jSYJEmpsZJabWqo8L9rBUH+0P
 IhyWZYvjqeF0tYAAAA=
X-Change-ID: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789336079; l=6274;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=nfq4xKN/U3UCWCePBLPoeRZgNdv9ADYvF1h2MfVGoe0=;
 b=vmOHX9MbkBdVuDpyVXNrpAACjzRmh8NFH++7aqIkxLDNaUdOwDwWdteL6obQKE5zRwy2+rwS/
 aywx2+gD5K0DV1qhZwo9lOccQKn78Ow5Vp+8xyhd3YiddwHrJZXr6wv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_144803_688617_45386333 
X-CRM114-Status: GOOD (  20.95  )
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

clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
that this same driver provides. That is a layering inversion which cannot
work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
-- this driver's own device -- and genpd power transitions run at _noirq
time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
-EACCES.

Measured on mt8173 (amazon-suez) during resume from suspend-to-RAM,
immediately after the secondary CPUs come back up:

  clk-mt8173-mfgtop 13fff000.clock-controller: 26 MHz clock enable failed: -13

The failure is not survivable, because genpd_sync_power_on() ignores what
power_on() returns and marks the domain on regardless. The clock is then
left ungated-but-unprepared, and the next power_off() underflows its
refcount:

  mfg_26m already disabled
  mfg_26m already unprepared
  WARNING: drivers/clk/clk.c:1048 at clk_core_unprepare
  Workqueue: pm genpd_power_off_work_fn
    clk_unprepare / clk_mt8173_mfgtop_power_off / _genpd_power_off

Gate the bit with a direct regmap write instead. The vendor driver
(mtk_mfgsys.c) also drives the four MFG CG bits with raw register writes
from its power sequencing. The runtime-PM path was never affected, only the
_noirq transitions of system suspend and resume. mfg_26m stays registered
as a clock for any consumer that wants it; nothing currently does.

Because the gate is now driven from the domain callbacks, its enable count
in the clock framework stays 0 while the domain is on. Mark it
CLK_IGNORE_UNUSED so that clk_disable_unused() does not gate the 26 MHz
clock under an already-powered domain when a consumer probes before late
init; the domain callbacks are the only writers.

Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Mark mfg_26m CLK_IGNORE_UNUSED: with the gate driven from the domain
  callbacks its CCF enable count stays 0, so clk_disable_unused() would gate
  the 26 MHz clock under an already-powered domain if a consumer probed
  before late init (reported by the Sashiko review of v1). Verified on the
  Fire HD 10: the gate follows the domain (hardware Y with the GPU active, N
  after unbind) while the enable count stays 0, and the GPU keeps working.
- Link to v1: https://patch.msgid.link/20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com
---
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
index 5669ca9954dc..53918ad7f402 100644
--- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -30,6 +30,8 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.set_ofs = 0x0004,
 };
 
+#define MFG_CG_26M	BIT(3)
+
 #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
 	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
 
@@ -38,7 +40,8 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
-	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+	/* Driven by the power domain callbacks, not by a clk consumer */
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, CLK_IGNORE_UNUSED),
 };
 
 struct mt8173_mfgtop_data {
@@ -46,7 +49,6 @@ struct mt8173_mfgtop_data {
 	struct regmap *regmap;
 	struct generic_pm_domain genpd;
 	struct of_phandle_args parent_pd, child_pd;
-	struct clk *clk_26m;
 };
 
 /* Delay count in clock cycles */
@@ -66,12 +68,12 @@ struct mt8173_mfgtop_data {
 static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
 {
 	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
-	int ret;
 
-	/* drives internal power management */
-	ret = clk_prepare_enable(data->clk_26m);
-	if (ret)
-		return ret;
+	/*
+	 * Drives internal power management. Written directly: the clk API
+	 * needs runtime PM, which is disabled during _noirq transitions.
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
 
 	/* Power on/off delays for various signals */
 	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
@@ -103,7 +105,7 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
 	regmap_write(data->regmap, 0xec, 0);
 
 	/* drives internal power management */
-	clk_disable_unprepare(data->clk_26m);
+	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
 
 	return 0;
 }
@@ -155,16 +157,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 		goto put_pm_runtime;
 	}
 
-	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
-	if (IS_ERR(data->clk_26m)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
-		goto unregister_clks;
-	}
-
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
-		goto put_26m_clk;
+		goto unregister_clks;
 	}
 
 	data->genpd.name = "mfg-top";
@@ -197,8 +193,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 	pm_genpd_remove(&data->genpd);
 del_clk_provider:
 	of_clk_del_provider(node);
-put_26m_clk:
-	clk_put(data->clk_26m);
 unregister_clks:
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 put_pm_runtime:
@@ -217,7 +211,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
 	of_genpd_del_provider(node);
 	pm_genpd_remove(&data->genpd);
 	of_clk_del_provider(node);
-	clk_put(data->clk_26m);
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 	of_node_put(data->parent_pd.np);
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


