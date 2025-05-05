Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFB7C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFZcvKW+QWExH/idRe1aBQb6I3bAOLOOrM7ulDIZ5bw=; b=wUYGd2EJKQV2YTP5QuJpBlQRtM
	uYAnqfUSdLLj9QmbNpdl2odEkQVkpYJMQno7RYGH9cYmd1xJj6t8S5yDUrMofbFS2McYyg/JMZkVT
	fMKl2qlJMv2oWjP8u/NHvu5J7YbcHGllFktkAj7rjShv6uygj2UMra4bMpZ3c2vtI7r7Anj3QubnK
	mpPHHkOIZ68K87Kt/hK6rKL+vrSQeXxmSJEqX4Qgd5vWwuXWvVH7UCZ2Vw8TmO/jEvevl5aPAnHb/
	9FNR2JO+cOQS7wBG/SIXFMHd/2ZyOpZuhpIWSPQXFgQAycRgGpXJ0TZ/weMzdEoqn/7y1qfaW7mz/
	59YAvFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9SZ-0000000A6oX-3IJ2;
	Tue, 06 May 2025 03:59:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ww-00000008yOW-04fg;
	Mon, 05 May 2025 23:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96503629C8;
	Mon,  5 May 2025 23:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FA5C4CEF1;
	Mon,  5 May 2025 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486613;
	bh=aWAaNwhV/x0DOI5AMVG//fIxQeAHIm2Mo3OcOCuYYfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElR7jyKIL8u/HSDGnAGKW6B5a6hK4dXCOU528IhH7XXokOfx8fLaI74ywOPouMt3C
	 wL4BXAphZjl5lDnM3MY0d/ygStNZskyqWs9Z/mA9ES2QmNbZRc17JfYkTcVaGZAohS
	 prnaBBajVcZpPJu6zN2EnU8Nhf7eXSeAFvUzr6OMjbwNV0AX4zmPvlIKQ3iXCcuiTS
	 sCoJLPtNxih98xmucUY23l0y7XUSsBp7jKalsRY0uroUrNc+tWqGL/GkoZCYGu76oc
	 dlzsLQJc4NytKqxmOsAiSLEBqTKp+ThdrAjSWRaCvdk/gqe8tlJ9fEfDQud7urmGp9
	 15zg6ogMn1ACA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 118/212] net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
Date: Mon,  5 May 2025 19:04:50 -0400
Message-Id: <20250505230624.2692522-118-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
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

From: Eric Woudstra <ericwouds@gmail.com>

[ Upstream commit 7fe0353606d77a32c4c7f2814833dd1c043ebdd2 ]

mtk_foe_entry_set_vlan() in mtk_ppe.c already supports double vlan
tagging, but mtk_flow_offload_replace() in mtk_ppe_offload.c only allows
for 1 vlan tag, optionally in combination with pppoe and dsa tags.

However, mtk_foe_entry_set_vlan() only allows for setting the vlan id.
The protocol cannot be set, it is always ETH_P_8021Q, for inner and outer
tag. This patch adds QinQ support to mtk_flow_offload_replace(), only in
the case that both inner and outer tags are ETH_P_8021Q.

Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
of PPPoE and Q-in-Q is not allowed.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Link: https://patch.msgid.link/20250225201509.20843-1-ericwouds@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 6a72687d5b83f..8cb8d47227f51 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -34,8 +34,10 @@ struct mtk_flow_data {
 	u16 vlan_in;
 
 	struct {
-		u16 id;
-		__be16 proto;
+		struct {
+			u16 id;
+			__be16 proto;
+		} vlans[2];
 		u8 num;
 	} vlan;
 	struct {
@@ -321,18 +323,19 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
-			if (data.vlan.num == 1 ||
+			if (data.vlan.num + data.pppoe.num == 2 ||
 			    act->vlan.proto != htons(ETH_P_8021Q))
 				return -EOPNOTSUPP;
 
-			data.vlan.id = act->vlan.vid;
-			data.vlan.proto = act->vlan.proto;
+			data.vlan.vlans[data.vlan.num].id = act->vlan.vid;
+			data.vlan.vlans[data.vlan.num].proto = act->vlan.proto;
 			data.vlan.num++;
 			break;
 		case FLOW_ACTION_VLAN_POP:
 			break;
 		case FLOW_ACTION_PPPOE_PUSH:
-			if (data.pppoe.num == 1)
+			if (data.pppoe.num == 1 ||
+			    data.vlan.num == 2)
 				return -EOPNOTSUPP;
 
 			data.pppoe.sid = act->pppoe.sid;
@@ -422,12 +425,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	if (offload_type == MTK_PPE_PKT_TYPE_BRIDGE)
 		foe.bridge.vlan = data.vlan_in;
 
-	if (data.vlan.num == 1) {
-		if (data.vlan.proto != htons(ETH_P_8021Q))
-			return -EOPNOTSUPP;
+	for (i = 0; i < data.vlan.num; i++)
+		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.vlans[i].id);
 
-		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.id);
-	}
 	if (data.pppoe.num == 1)
 		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);
 
-- 
2.39.5


