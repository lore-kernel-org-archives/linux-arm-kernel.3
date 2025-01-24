Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64679C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/anGkf2igP9SKOSzCFL/ChT8CaIIzLztcOi6KLOhh+8=; b=wTnoITZ63VCT+gh3jxL9ZmfODj
	SXlhGuE9gE90wWs89Xol7sy52wWte5uhIrZpKvbeMUWyd0KzgFLj7NCwT6ywxpEufZP8OlPiRT69r
	kVSJqDCx1auQ6x1betbfMATtq5vgIwxq+JLpYSS6cTXnK5qsu2VXXWhAe6bmRoqvpWkUjxrE1cdM1
	Vl+m/vnIOoPOlrvr3O/pe7dhwlOQl4+crBtkF4+tOW72YXtc48QbuLNxhQ7d93ePAaa6peW07g7A2
	+hG9tPCA3IFMWiKXmfRh9KFIdIVQIN0XvEL1OS9u1U9zuSW5/DpaQBSxy1XT7F0fYcc65pdHi2VHS
	Pft4cQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDWf-0000000E2sm-1oH8;
	Fri, 24 Jan 2025 06:50:45 +0000
Received: from mail-m49248.qiye.163.com ([45.254.49.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDSc-0000000E1hH-0osQ;
	Fri, 24 Jan 2025 06:46:36 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456e9;
	Fri, 24 Jan 2025 14:46:24 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
Date: Fri, 24 Jan 2025 14:46:17 +0800
Message-Id: <20250124064619.13893-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250124064619.13893-1-zhangqing@rock-chips.com>
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklPSVYZQ0NCTR8YGk9KHRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fd33703a3kunm994456e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6LCo6OjILNCEPLxIjDCk*
	OFEaCUlVSlVKTEhMTEtKSkNOTEhPVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJSUM3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Q3AHsp8ZPf0u4T67+2WEdLl0ZeMtCIFJmcVsIVcJS6//9sW7npkSYDvORxz0jdb79/kL8wbrY5vEGCqM6kNKBgicq8R50+ZOHjxOC5GfnY6pIMoNwN5zk82tar3rK3px/X6iG3zGKF0yB3C6dt54IIdrZ2VMHMZN5O8CFK4AErM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/anGkf2igP9SKOSzCFL/ChT8CaIIzLztcOi6KLOhh+8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_224634_608779_4D17D25C 
X-CRM114-Status: GOOD (  10.64  )
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

This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.

RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
dclk_vop to change its frequency, CPLL is used by GMAC,
if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
affect the GMAC function.

If the client application does not use GMAC and CPLL is free, make this
change on the local branch.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index ed602c27b624..9c0284607766 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
 	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
 			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
-	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
-- 
2.17.1


