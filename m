Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FECBFC6165
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KViZW5fwyykO6fUVHMd4MvYMBNQgS9IVd0D0l1O9UVc=; b=J9if0Ua/+7/HdGNBKp9o8IEGpG
	6k6wgKQQIyeaMhRL82jlFNFuzU8aYpZXESsiqVj9bMDJ9GxqHI2uCZfTdBfai2nrUhdt70S3HxB2S
	sTmSUW1xYJvF9KLExpSfp2MNo5SDuSgwFGcV35Epu4x9+PjOXPFweSW+IIB6AKAiWM6rdTC4m6RyS
	IgLMgFhS7XUUqlvIpbBLGBSWtfbbVfhoubP/u76ViKRH7DBoF3c+5G68msoEFwM06fQFBEvQ2o9nn
	gXrNJ9g9V63aHFz0C9Opp+FUhxilz7kiTuZOcLVb2r/LLltHJ8BHmLtRrRze4CctDzZpBGp1Utjf1
	z7yjhr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpqt-00000008pT9-1OwI;
	Sat, 03 Jan 2026 00:50:43 +0000
Received: from ms-10.1blu.de ([178.254.4.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpqb-00000008pSU-3UHx;
	Sat, 03 Jan 2026 00:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pace-systems.de; s=blu0479712; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KViZW5fwyykO6fUVHMd4MvYMBNQgS9IVd0D0l1O9UVc=; b=NKyTFur2+419d4urisS5kRu4Sp
	419Ea7chY3PN0ab7HcPqpnORKAub58r9wZdS2iPgR055gGS9DvurWO4axrFG6m8/PQsThhFcTUvlx
	2ybgGvjmt1BnCvIToJRgKQyoSFiOYqHVmstAhOa6J1KYYmdzZWpWPGUTM4Lik32MgQ4Y/ggQdJB0i
	gBrvXLZAiP+do7WUp/aP2hPv0zjUa6Mz7U5FOshxpOpAZfBjlYUe6s+XQGRMMwWTKCfDnkPjvPLJW
	x2WzAarSjct6JfimYR8D39ECmuKWj7kS/yc7QTdW8eIAoCFbiot/zc0FB8xeJyc/i9N771qWtDFW7
	CyDzENBQ==;
Received: from [178.201.20.114] (helo=sebastian-zbook)
	by ms-10.1blu.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <Sebastian.Wolf@pace-systems.de>)
	id 1vbpqO-00F1iG-OS;
	Sat, 03 Jan 2026 01:50:12 +0100
From: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sebastian Roland Wolf <srw@root533.premium-rootserver.net>,
	Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
Subject: [PATCH v2] net: mediatek: add null pointer check for hardware offloading
Date: Sat,  3 Jan 2026 01:50:08 +0100
Message-ID: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 282146
X-Con-U: 0-sebastianwolf
X-Originating-IP: 178.201.20.114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_165029_712608_B32A8840 
X-CRM114-Status: GOOD (  10.85  )
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

From: Sebastian Roland Wolf <srw@root533.premium-rootserver.net>

Add a null pointer check to prevent kernel crashes when hardware
offloading is active on MediaTek devices.

In some edge cases, the ethernet pointer or its associated netdev
element can be NULL. Checking these pointers before access is
mandatory to avoid segmentation faults and kernel oops.

This improves the robustness of the validation check for mtk_eth
ingress devices introduced in commit 73cfd947dbdb ("net: mediatek:
add support for ingress traffic offloading").

Fixes: 73cfd947dbdb ("net: mediatek: add support for ingress traffic offloading")
net: mediatek: Add null pointer check to prevent crashes with active hardware offloading.

Signed-off-by: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index e9bd32741983..72bc4a42eac1 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -270,7 +270,8 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		flow_rule_match_meta(rule, &match);
 		if (mtk_is_netsys_v2_or_greater(eth)) {
 			idev = __dev_get_by_index(&init_net, match.key->ingress_ifindex);
-			if (idev && idev->netdev_ops == eth->netdev[0]->netdev_ops) {
+			if (idev && eth->netdev[0] &&
+			    idev->netdev_ops == eth->netdev[0]->netdev_ops) {
 				struct mtk_mac *mac = netdev_priv(idev);
 
 				if (WARN_ON(mac->ppe_idx >= eth->soc->ppe_num))
-- 
2.51.0


