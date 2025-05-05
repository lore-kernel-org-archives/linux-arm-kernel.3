Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC8C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQK7my/uVRmtZo4bwrmWl8ViLGRMQloVOEhmjyHVRfM=; b=neuqjX8kFU4oAt62/HW4ZFezlZ
	SETNSB5dxV/1hlB1xMh3CjYhuw02+ED4SO+koUGd6FsP1LGTGdH/0cZu2GP2Sgd3XCCuS9tLEkvMb
	ElUUvuJZrzUrQpNXheJWqVMifzhzCqj6CraYelzT76FhbIbi9YFDsvESvud1M2msGgcRARylSL9Xr
	Dy+7j+WNh1lfV0efCVm6B0zBvdV9uLYEz7CjzdFTyP4oWlHZHCYa8sNAzvQOOxeKNGb4xxlAZBxwb
	3yUHo6o+wOCvZsnmt5agMPrsLD8I1Lfd1qWARqXzKkrCj5AYa1JgUYuVHO5jba1OaptwZPJ8HfNi3
	psFDSxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC754-00000009Vqv-1Dlx;
	Tue, 06 May 2025 01:26:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ZR-00000008r1U-0Lqr;
	Mon, 05 May 2025 22:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2139E49CDB;
	Mon,  5 May 2025 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA434C4CEF1;
	Mon,  5 May 2025 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485156;
	bh=BGOI489bdY00iXxdONJ68NPbmk9zDk85Z0+dGBRltEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hR+VqgbMMedWHzMIG7brGj6BJD0e/2YTyVs29NTzCxrg/EQp/koCMT6bmukPJ6geV
	 7x5CXOOicjN0ec6oWFBInk2OX66WgL8Ddhnx3MVoLDeOhqc6ekgmeXuNoZUgkIOn4M
	 Ujlv8p/L1prJRmxDBEd2C+wZcmkLNpl57QXoe5FjZsVtJfw/f63pduuqraQBuGAqEF
	 8B4ytN+onLyOwmXkEJxWc6GWgTBqxs+9CuAlCC2J2ASVydKmlPEdcV2ODp/dkeGOQo
	 oDRjemhGy+7iLvEDru5h92m0PSgLYZKpqmJZ6i/x7X17YMsEvdiDUMG03Mio/zMtoP
	 B//2DTUvAVW8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 190/486] soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
Date: Mon,  5 May 2025 18:34:26 -0400
Message-Id: <20250505223922.2682012-190-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154557_158909_B9F14C10 
X-CRM114-Status: UNSURE (   9.16  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 694e0b7c1747603243da874de9cbbf8cb806ca44 ]

MT8188 uses DPI1 to output to the HDMI controller: add the
Start of Frame and End of Frame configuration for the DPI1
IP to the tables to unblock generation and sending of these
signals to the GCE.

Link: https://lore.kernel.org/r/20250212100012.33001-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb9..aaa965d4b050a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -155,6 +155,7 @@
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE3	23
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE4	24
 #define MT8188_MUTEX_MOD_DISP1_DISP_MIXER	30
+#define MT8188_MUTEX_MOD_DISP1_DPI1		38
 #define MT8188_MUTEX_MOD_DISP1_DP_INTF1		39
 
 #define MT8195_MUTEX_MOD_DISP_OVL0		0
@@ -289,6 +290,7 @@
 #define MT8188_MUTEX_SOF_DSI0			1
 #define MT8188_MUTEX_SOF_DP_INTF0		3
 #define MT8188_MUTEX_SOF_DP_INTF1		4
+#define MT8188_MUTEX_SOF_DPI1			5
 #define MT8195_MUTEX_SOF_DSI0			1
 #define MT8195_MUTEX_SOF_DSI1			2
 #define MT8195_MUTEX_SOF_DP_INTF0		3
@@ -301,6 +303,7 @@
 #define MT8188_MUTEX_EOF_DSI0			(MT8188_MUTEX_SOF_DSI0 << 7)
 #define MT8188_MUTEX_EOF_DP_INTF0		(MT8188_MUTEX_SOF_DP_INTF0 << 7)
 #define MT8188_MUTEX_EOF_DP_INTF1		(MT8188_MUTEX_SOF_DP_INTF1 << 7)
+#define MT8188_MUTEX_EOF_DPI1			(MT8188_MUTEX_SOF_DPI1 << 7)
 #define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
 #define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
 #define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
@@ -472,6 +475,7 @@ static const u8 mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_PWM0] = MT8188_MUTEX_MOD2_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8188_MUTEX_MOD_DISP_DP_INTF0,
 	[DDP_COMPONENT_DP_INTF1] = MT8188_MUTEX_MOD_DISP1_DP_INTF1,
+	[DDP_COMPONENT_DPI1] = MT8188_MUTEX_MOD_DISP1_DPI1,
 	[DDP_COMPONENT_ETHDR_MIXER] = MT8188_MUTEX_MOD_DISP1_DISP_MIXER,
 	[DDP_COMPONENT_MDP_RDMA0] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA0,
 	[DDP_COMPONENT_MDP_RDMA1] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA1,
@@ -686,6 +690,8 @@ static const u16 mt8188_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] =
 		MT8188_MUTEX_SOF_DSI0 | MT8188_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DPI1] =
+		MT8188_MUTEX_SOF_DPI1 | MT8188_MUTEX_EOF_DPI1,
 	[MUTEX_SOF_DP_INTF0] =
 		MT8188_MUTEX_SOF_DP_INTF0 | MT8188_MUTEX_EOF_DP_INTF0,
 	[MUTEX_SOF_DP_INTF1] =
-- 
2.39.5


