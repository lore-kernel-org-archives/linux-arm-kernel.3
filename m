Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE8FEB7ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJmHFljpEktxG+o1kVluo3l2vFyFucx25ZTMVp0Iv+8=; b=qeXayShS+9+Z7dpXKYc/LvUbXF
	+KngsRzKuRFo3i/1bWmYXUlqjgTVVvQwWzJ40KB/lxopfdvZBaUqh3ZOCkuH5iGi9IfucGLZRP+ym
	M7NYlv3JzirzW/rkZsC1t0dG2DaiRx+MY2kPhtUKxg+/iV1//p+sA2cXX3Gk0IonkzLYP/4V1n5yu
	8IZmDXBWbYsq8TICgdCH5tMzJ4pXDguGAfxZ9RFYZW3icTt//peCfMq0MMcnlyXLpczZEe6tDx3Gn
	HYIozn7wMVOVSlFCf/R6aenrf/lE/ebeeJuPxi0aMqVVeuTPGPoN6SmvKV+JUPv8Xx8NiBz9jsB9E
	dbGf6Wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7q-0000000HA81-3ui6;
	Wed, 04 Mar 2026 12:14:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7o-0000000HA74-3DCW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=GJmHFljpEktxG+o1kVluo3l2vFyFucx25ZTMVp0Iv+8=; b=OajnsuJJ1NA1PqL+KDNrbZ8CDH
	ZUC26BqxVv/yf70Sj1xTLz4sy95IrnDdcliQoHTWuAYUSezlaNqWzlQGTSlrGP+1RbIiN4dlnfow5
	wsN/08VCmBPrmKbrrjfIKIh9vaIpKPG5XWZ4YELcIBzK6aHPfhzL6HH8Qq+qCQZlM7IBvQ+9vZnUO
	QlRiO6ShW0MwoiPD8wOs2ZOQsmjavnsSr8uBA3Urd7D0kTbj0IJJ3vWJeD0WixLMoaich4jwMNVsz
	V9m6eIoGdV1L8bPUkatefFiGk9L5p5xff8negxLSmtkbEMCq8Mm1L1Rp6Nj+l1C+iGvo4MjjCU+Gy
	bJJBFQKw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs
Date: Wed,  4 Mar 2026 13:14:26 +0100
Message-ID: <20260304121426.1184680-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_041448_806549_4C90C0B3 
X-CRM114-Status: GOOD (  12.83  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Right now dclk_vop2_src is not allowed to change its parent, while
the other two dclks are allowed to do this.

All three VPs can drive non-static outputs (HDMI, DP, eDP) and even the
eDP can also support full DP connections (though no DP+).

Therefore remove the CLK_SET_RATE_NO_REPARENT flag, to allow VP2 the same
flexibility in aquiring its clock rate.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/ DP
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index bea2deed0e23..cf83242d1726 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2094,7 +2094,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VOP1_SRC, "dclk_vop1_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(111), 14, 2, MFLAGS, 9, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 11, GFLAGS),
-	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VOP2_SRC, "dclk_vop2_src", gpll_cpll_v0pll_aupll_p, 0,
 			RK3588_CLKSEL_CON(112), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(52), 12, GFLAGS),
 	COMPOSITE_NODIV(DCLK_VOP0, "dclk_vop0", dclk_vop0_p,
-- 
2.47.3


