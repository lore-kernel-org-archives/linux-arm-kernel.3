Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4230BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFQblKrUPUsyUzYqlmv4v4FRDoEKQKJ1p2yWOHyxIcs=; b=Mrstb6WCi7Lsai5NMk0eC4deNY
	yr09gZTFA8fOLXNaGhHq2qKVPfn3BVI4nPlaIJ4wUCoZKufig5gcLGpJJjdh8mlFs+z26v78uJHeF
	H6r20KinNW7xkiZk65mp+9/XQEP6eGnveDhQw/P06qVtr8U1fHLsPs/dcDexmlgfWV9g2hqpFbmxb
	jSQ5L9koZV361bqhg3lUsb1zeGK0CuSzISCpqjGyFg/u1ITXD6Q0uoQi0lmo4eflmm6nB6NslsM5E
	DYSItRzRipTevM+x3HXIzB9GNF8pD07jv8R64S9Y+6LbRRLRcYYkXa7QOmIuOmVaCIeemrf/8Z5au
	IbacIw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DU-0000000Egk3-0ACo;
	Sun, 09 Feb 2025 11:11:12 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5C3-0000000EgHz-3hsl;
	Sun, 09 Feb 2025 11:09:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab771575040so665052266b.1;
        Sun, 09 Feb 2025 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099382; x=1739704182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PFQblKrUPUsyUzYqlmv4v4FRDoEKQKJ1p2yWOHyxIcs=;
        b=br+HLGfsQXLwLeYxQF+75bIxdIllb5RwFrAlGZCQTc5v3yWOnRl+fYV1xKnkbZnkmI
         ++HchRa0zY45Tky3ct+RL3lHtYZQF0Yxm+3VFB1SznU7Ss/zmTeXylf5Mll1g75x+767
         Tg6+ndjigDeOkyQPTKXxNLshmlyMVr9W7asfW9hMj8um7w9xIiGqqjcWIf3quA3QP81C
         AIYuQ4RoPQyzpSWgnYaSbHsIiGkBEupLWOEgwAfBUcbUAcdiPojYibwAjzii4N/BlPyO
         F3n1rICcJ73iHCpxYm+rCAvTb4Yw9lGxOzE10/SPrbO9QBkfI+rveWHE9tNsP5fofMkD
         S57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099382; x=1739704182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFQblKrUPUsyUzYqlmv4v4FRDoEKQKJ1p2yWOHyxIcs=;
        b=iEISlcJud1qoDCf0OsTSmsJy9Fyx4pufheUipxGd199PmpgacGA56brLpodO6U/qM+
         Iv+MqnPtSX29AA3XOgIXOKflbJ7H4DKHQu4Hdxb+u3iAVXWPXX5dvAAFnxyXxR35yukr
         8aO3QbKnoHj35b3CbkS+TQjX5IpufufHSkmbaLTdynmV5/ExIHTa5QuGc7od7G2Ys3QV
         9V3eW8GZSIA889j/i871ToQ55Eh3bHOJhwu5HVznhqDpX/7u02rs9NB2lCqqUFmWJcmf
         83326XZ07Noua9jAUkK0W7FJXJL7kgPT04OXi2lCDv08AbvuYoozV8LxaLaxJex1hGCH
         R0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7hul7+1yOdLlQcdzicQZrIBPh11mLEnVq9TqihvJ7hPczD4j+wsI0MYqdf9KfSs4ZctrVfQLHeUVGnUa1WJzL@lists.infradead.org, AJvYcCXIm42je7MXA2+Mxv9JJzCErMuepmsoX2TRY1MbNt+6wMbfXoq7sZ1aNmg0Ygp5q99w3H1uG6k6QFrzTWaEYPM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzedu0x5b8d90uTs/GF1S0Rw+xcpktICbZDetOfgbl7YkpBmYQ/
	9dzOjb7uyufPXHWzjGAI2/HASXggS0xKPZHC37MpSm2pQa8jzomO
X-Gm-Gg: ASbGncug8Zga4IRpo6z5qKyyU0z4hoJEsDdwW82QUhLJayZlH9LsQUwnlguumiV1JLr
	bfn7jfppdY6jakrQJfCebKH03Y2J6BrpdVnvu5hw/b6gkqFNVQkuNIRjWO2JFKwJAofWJ1XUrEN
	abLw0Gu0pzUA7zgJ0/pRS1pMEtWJgsbqXS1T18BuB6z8c0nbRQJrHWOX04vuaLFLsW9lU0ZCSQy
	3u9c/u4l54FextkCkg09uiWceAyV2utvqHHuYcEQQjBMC3diUzdFYJl8YS5N9ieV0nvtTC/WD1E
	oKmhWAvc4lE00NrBXEChN1Twj6cR3ys5PuPNjyRDtWZvGJ9FXxsvuCvOz6Debp0ol5Og1ZjapDV
	TUXZp7ceO5c3pEKtbOKwP0EOBavA8LJCR
X-Google-Smtp-Source: AGHT+IEo6Ozc2zXCqL86RQlmR/7Ph/AUPkjCkQRNEm9/1bvXI5GT4AQEumf4kPi+YCr2l95/7ECTNg==
X-Received: by 2002:a17:907:94c2:b0:ab6:c726:2843 with SMTP id a640c23a62f3a-ab76e98834amr1371080466b.22.1739099381438;
        Sun, 09 Feb 2025 03:09:41 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b88aa451sm82595066b.133.2025.02.09.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:09:41 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v3 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Date: Sun,  9 Feb 2025 12:09:36 +0100
Message-ID: <20250209110936.241487-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_030943_949943_576A5056 
X-CRM114-Status: GOOD (  15.93  )
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

mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
double vlan tagging, but mtk_flow_offload_replace() in
mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
combination with pppoe and dsa tags.

This patch adds QinQ support to mtk_flow_offload_replace().

Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
of PPPoE and Q-in-Q is not allowed.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---

Changes in v3:
- Removed unnecessary second check for ETH_P_8021Q.

Changes in v2:
- Unchanged, only RFC to PATCH.

Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.

 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index f20bb390df3a..c855fb799ce1 100644
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
@@ -349,18 +351,19 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
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
@@ -450,12 +453,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
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
2.47.1


