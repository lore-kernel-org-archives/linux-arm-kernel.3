Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2BBGmbLI1nr/65Z65ONI0gv2HpVmeamawdFIgGF+JQ=; b=1cgR3LMvwohDGCoeTuDB/VZT2Y
	TzEygFTj6DbT/0vYho7yPDqE447bDXhArPU6R9kaoKxp1ZNWzvSWIVDva+uhSUEb9Z4zfc3ox6hwK
	noNbJwYOnDPueyoVbo8AM9ylB/qNmOCkjRP7DXV39nro56fMj+NjszcgsvwVECVOsXZGuNMC5JcoG
	qDqk/qxfLFrMkK8lHs9cvhX/q48JtFDN5gfU3l4FPauqWW2z9LVhbkraDOvFf1CLnzIutIBtkXBfh
	9haXcTpMe4EQ3Xxc1+5+jm1nXhjBgFkC168aH/2QZZzDVYxz/BlObsTHaDCOVvwLFIXcHO2Ay/ix4
	aweuT6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1d4-00000001NtQ-3wa6;
	Tue, 25 Feb 2025 20:34:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Kv-00000001KQl-1qfX;
	Tue, 25 Feb 2025 20:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=j2BBGmbLI1nr/65Z65ONI0gv2HpVmeamawdFIgGF+JQ=; b=cBHp2KGcg55lw2D/3wtSouXX24
	W5UDWSPttPIY9kqt983LEmSyFQYrWgsn6TWd+0hCYFzSiwWs2oEenZrgZkcMAu7TzWfvGFwRWdFyb
	DqU9SZvbeTNP+wfV9CYabGgxO2bUIvDkv3opJmKOShxqQwf5VP1EggZ8MjpCDii3RkKfrR4517lrT
	CMEq6TvvYtcHVaDkwNscUpBo1vSa4uNNkC+ruQYYCFHW+S9xwTAeSwQblNUCR5LyERsH/sZ3G6qT8
	4JE/pGonDZ6lTJuHctbveVvyjxnOVHypPf7dJCbJ/dXRqvhuiqOJ5tSfrusYfuXPu42Z0Q7v1c2R8
	Ej7rG2sA==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Kr-00000003PEv-12ir;
	Tue, 25 Feb 2025 20:15:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaedd529ba1so700048666b.1;
        Tue, 25 Feb 2025 12:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514518; x=1741119318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j2BBGmbLI1nr/65Z65ONI0gv2HpVmeamawdFIgGF+JQ=;
        b=O6DqQkPm+vJlH77UzlW9Xckhh+Nr/Guo3fp7zE8DpWUIsAKZUQo/VKGEe+fbTnLr33
         c4kNgKSLXy/wNIsk3DMKSewctPKKapGbJH+Msz65bt5Oeh8iStZMCdRWgY78FwQ8+S80
         70V9LN/tTxqP93JEtgSwBIz/UevuOlBD0CTlI17Zz2Jy0m/WlaJd9czdAh/OtBPsB/6y
         e/0cR8BGuueevU2VhkBKqy7nXrIDhflHCx9ggoUCzw87MxapZygMyNBuiRX+YDBof45i
         WVqZL++UX0oAuCBmRSBtL/Rpja4eZVoDyEIq0jiNR3ctvdtn5ICM7hG0yTF4GXIOyMsN
         Belg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514518; x=1741119318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BBGmbLI1nr/65Z65ONI0gv2HpVmeamawdFIgGF+JQ=;
        b=GkdIBuvEmiUtMrhmw4OVtQGxkpTVQKBwsXKOAPXPLfS67kdbQrIWpe5cbUPlvEuBJV
         DBFcNGPLUT3/lm9gUN0WVxrQb0ONkMPdwSiv/ZDB0yK2T3djgi32RB0sMAJaNAOTDjAE
         l0HHLHhY7/Imft+UyYUYhf0LeQDwsGadd22LSsCThLKOEoWGxy5iFFZJxSqNoY0giLn/
         U6uxkbf1I8AE0XLe0AaFBJi34G673EvQ+//tZCo/WudCZ6mM8GWFQM0p+9PJXrrPW/In
         Mb76g39DoJ33zlqcX6IUNd46iQPXtkuwj3UBdc7U/87cGnX2N0XQYqzCbVnEKiRM+pWJ
         ko3g==
X-Forwarded-Encrypted: i=1; AJvYcCU0yVLtFMiSCHSQQ3M4zkOka7wu2URKtzmbLx1Ify/iV/0Oa0qOsDgJKeTpBFExwCfewt/dGk7VF+sUNZepCkw=@lists.infradead.org, AJvYcCVhBL71vgygaFQpB3GJ0R4KFDIgSFJBG2RDDCYP4O3C9USUNoWT63D2SSqyTU0Ek4EPurta+Rfu1jXUE1RhkYTF@lists.infradead.org
X-Gm-Message-State: AOJu0YwoT+nCnhfHqvlR9JgycZ+hQW8jOusV4wUbX7Sxxxu6PEw8ORUp
	EW6+sUsek5nPTj9/U0WATxJ87cgLcCXkIxgoIasTwioVeYXoUAxZ
X-Gm-Gg: ASbGncuRHqWeBBxqx4jkGDiWXdD99/ER7LjvL5LZ2J+2idWPMm2vQamaFaOLWlyV++y
	BN4ukgOaJup70bTTnXfTmWWoR166qNZT7X9yCVHtBeF3JniXDG6ET6lAMUKf7dXUyEjbLIUjJJT
	OSGqVSBhrfUm5+fAf0vx3LdpSGEsoH1x4L2iRTVedp+P00ympTMMJhTrKhGaklhRHGEZgZHlSSU
	ZgC7X2B0o65udWz2tqVg66a/kuxpGH10/YvdE58YWp2Ddmz1lfDVkov09yU65dqf2MHwVj8gyfl
	BNVA8eNYPHA0gtkIc4wTTKZbBeu8mx+gcoCoxP8rGLnpBKL8mE8r6t7Wu9kyZhJ2XyOpvoC/Z+U
	nlHd7MU5tXwbbduK0oF/OrQjq2/uMBOES2bcPexfmAFM=
X-Google-Smtp-Source: AGHT+IHroxxCR3JqcHk3B/BB2QKboxFSx/yXhrjGWREQjGgy7ImL6JVfDRnn1C0NlLFmeDqy09etbw==
X-Received: by 2002:a05:6402:4604:b0:5e0:8b68:e2c3 with SMTP id 4fb4d7f45d1cf-5e44bb369d9mr9617140a12.29.1740514518140;
        Tue, 25 Feb 2025 12:15:18 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e461c61e97sm1721710a12.65.2025.02.25.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:15:17 -0800 (PST)
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
Subject: [PATCH v4 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
Date: Tue, 25 Feb 2025 21:15:09 +0100
Message-ID: <20250225201509.20843-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_201521_379321_2BF80BD2 
X-CRM114-Status: GOOD (  18.28  )
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
---

Changes in v4:
- Describe in commit title and message it is for double ETH_P_8021Q only.

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


