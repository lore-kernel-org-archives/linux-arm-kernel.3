Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F89CDB476
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrvQ4xZo00tHR4nLEOqlvB8fl4SfZ57SuQT4UUKpNQg=; b=vBRI96crdCF7N95FfNfo0KvOux
	TNTFp8oL/cNLcjYZdgC/zSzI2xRurHhAnm2ISCeKcG2kT/1x/FqVWxGQRnpbv/AfSQWERcyvIe58U
	LB8D6sgfaTeb8wn0lTiaPFVndwO7tFuUT3Vh9yyf533NHoqD3MfeSbQVWYFBA8QmXsW9uFpS0Kd9w
	sgWM+GdurW2+sLVT8sM4w3EhuV399xEWfEYO51g2y68qEoZZKscP23jyMEKDU+rtr2IFUl23iiGEn
	/jTNuU+M+xAei3l+OUZpRnOjVm5xVk86krh69peNSaibrcfTdv+2jrpn3hem+q1MpUmhmsIz06vl5
	Ymj08wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQn-00000005VOZ-22j6;
	Tue, 23 Jun 2026 00:56:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VN5-18LY;
	Tue, 23 Jun 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC5044235;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4974DC2BCC9;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=O3h+r3KMVJ2BTpp0cvTdaW3R2CnFXiiBiYPuDmFfHv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I1KDKWzZ05p2vEB9ZiL8dlaQ3Sv2kboq9k/QGP9FkaFIVFuhBXqU5q64AfynPYREy
	 6GSbxaQY7NqW+0Dtkrh/OTpNVXtvQaOlCPvgHbDT1zoCKO6eTJuomRf/+V1juEBsON
	 E6X9tKDK91rDM/C4lRmRbWrSpl+54SZf7V3H+pfOlYFet0fr53lShb8nZjTGEvLEcr
	 vPvqIx2c9NEYf2RVAOy7Qt9jl3aI4/rpGYJqEakwigcxI+SgxGPv90WIr3lhjurtFQ
	 fFQ0ujpsPYMjQW8Xgi4S/oXq/hYGzVCX9V9LIU6NMRyLBJhVsJ9xz+XKgGGyTVFBVf
	 JJCMgy1ksqBCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3191FCDB466;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:22 -0400
Subject: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=4544;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=Nkcn4urkSzO8xVsWhGDA3qPh5MIpKzECwfoMwJPmbeM=;
 b=2VndCX5WEP4sJ4zXlSVdNf635h5yO9ULJwd3imAAL8DT4Qlqv9EG9o460Gip0qDb6BehVETmC
 FjFevWKU9cfAwmUzfu0xC5f54vhpTPpbqMj+09WbWfzlJO1fcCFheS3
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

Both of these changes allow the framebuffer to show upon boot and let
the mdss driver take over afterwards.
Before, none of these actions were possible. Only mdss takeover was
possible, but screen had to be turned off first.

OLE configuration may have been a misinterpretation... that's not
something that's done on the downstream driver.

Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
clk_rcg2_shared_no_init_park_ops fixes this warning as well:

[    0.075780] ------------[ cut here ]------------
[    0.075791] disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
[    0.075812] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#3: swapper/0/1
[    0.075840] Modules linked in:
[    0.075856] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S                  7.1.0-rc2+ #320 PREEMPT
[    0.075870] Tainted: [S]=CPU_OUT_OF_SPEC
[    0.075877] Hardware name: Motorola ThinkPhone by motorola (DT)
[    0.075887] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.075897] pc : update_config+0xd4/0xe4
[    0.075906] lr : update_config+0xd4/0xe4
[    0.075914] sp : ffff80008005b9f0
[    0.075921] x29: ffff80008005ba00 x28: 0000000000000004 x27: ffff000782892200
[    0.075937] x26: ffff0007823a46c0 x25: 0000000000000004 x24: ffffffffffffffff
[    0.075953] x23: ffff0007823a0240 x22: ffffdbc0a0940220 x21: ffffdbc0a0940220
[    0.075967] x20: ffffdbc0a0dcb388 x19: 0000000000000000 x18: 0000000000000048
[    0.075981] x17: 0000000000000014 x16: 0000000000010008 x15: fffffffffffea870
[    0.075996] x14: ffffdbc0a0c5d580 x13: ffffdbc0a0c5d600 x12: 00000000000001ee
[    0.076010] x11: fffffffffffea870 x10: fffffffffffea828 x9 : ffffdbc0a0c5d600
[    0.076024] x8 : 3fffffffffffefff x7 : ffffdbc0a0cb5600 x6 : 00000000000001ef
[    0.076038] x5 : 3ffffffffffff1ee x4 : 00000000000001ee x3 : 0000000000000000
[    0.076052] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00078066adc0
[    0.076067] Call trace:
[    0.076074]  update_config+0xd4/0xe4 (P)
[    0.076085]  clk_rcg2_shared_disable+0x50/0x80
[    0.076096]  clk_rcg2_shared_init+0x10/0x20
[    0.076107]  __clk_register+0x1b4/0x9ec
[    0.076118]  devm_clk_hw_register+0x5c/0xd4
[    0.076128]  devm_clk_register_regmap+0x44/0x84
[    0.076139]  qcom_cc_really_probe+0x304/0x514
[    0.076149]  disp_cc_sm8450_probe+0x104/0x200
[    0.076160]  platform_probe+0x5c/0xa4
[    0.076172]  really_probe+0xbc/0x2ac
[    0.076182]  __driver_probe_device+0x80/0x154
[    0.076193]  driver_probe_device+0x3c/0x184
[    0.076203]  __driver_attach+0x90/0x18c
[    0.076213]  bus_for_each_dev+0x7c/0xdc
[    0.076224]  driver_attach+0x24/0x30
[    0.076233]  bus_add_driver+0xe4/0x20c
[    0.076243]  driver_register+0x68/0x130
[    0.076251]  __platform_driver_register+0x20/0x2c
[    0.076260]  disp_cc_sm8450_driver_init+0x1c/0x28
[    0.076273]  do_one_initcall+0x60/0x1d4
[    0.076287]  kernel_init_freeable+0x24c/0x2d4
[    0.076299]  kernel_init+0x24/0x140
[    0.076311]  ret_from_fork+0x10/0x20
[    0.076323] ---[ end trace 0000000000000000 ]---

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 2e91332dd92a..b99d3eb5e195 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -614,7 +614,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
@@ -1824,8 +1824,8 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
 
-		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
-		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
+		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
 	} else {
 		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);

-- 
2.54.0



