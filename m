Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B744C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hakErszKHTtOs4Wy81rK0wCSNo3C7i1Eglw64nX85ko=; b=34lT6uWmCET7Um7JTpiwgX0rFw
	xoUhOZL0E5CtWdm9nei6GsabV3esfeg2EdoHO/UwiiXFKWP7+S23c+XpgHuDRLgaLvVm31fI82dxa
	Kpc9stKbKsQysTkePe3bDLnJR4o2HsjJNLOpivHA7oSVoZZ2bvdr394QWnyarETHy3kBXYyS+oEBy
	eJF9vvdFUgktT2CGmihAp2pMRAFFqu46+gkjRupVgOAGx8J9VNdNk6M55w/2S0BdBjg3x7VHvrMPl
	g5pvaorILzapDyBfuPS8/RjjZwvv2bULZ+7SYTdxDdeLCGVknE3UJ27DF22BjOmywRQRBQGJ1ZgwK
	I00O1FIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDTy-0000000E28r-3yvv;
	Fri, 24 Jan 2025 06:47:58 +0000
Received: from mail-m1973173.qiye.163.com ([220.197.31.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDSc-0000000E1hF-0Q5U;
	Fri, 24 Jan 2025 06:46:35 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456e1;
	Fri, 24 Jan 2025 14:46:22 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/3] clk: rockchip: Fixed some incorrect commits
Date: Fri, 24 Jan 2025 14:46:16 +0800
Message-Id: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZGlZKGklKTkpIGkhPSB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fcd5e03a3kunm994456e1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6URw4IzIPDiEWARMZDB80
	EEsaCjBVSlVKTEhMTEtKSkNPSkJDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhCTzcG
DKIM-Signature: a=rsa-sha256;
	b=Bm2kb4XJ8h9ZAx8pB34IrXe66neBGLNV0dJTem0EA4zI/qtoWWtbeXI3wgkmx7bkekvL7BBCNJf+GA1GL2KwRlT8pp7C8h/3VwmMYvJCN4FpyRcwpK1Xa1yUte4e8wgTY22Cht5HSKvhg2OhSfvxUCg2voduaUeC37DKFotG0LA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hakErszKHTtOs4Wy81rK0wCSNo3C7i1Eglw64nX85ko=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_224634_610590_6B58D3ED 
X-CRM114-Status: UNSURE (   5.17  )
X-CRM114-Notice: Please train this message.
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

Elaine Zhang (3):
  Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
  Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 drivers/clk/rockchip/clk-rk3228.c        |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1


