Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=; b=uNYE3xEVYJCprRGTEngM1brKvA
	bRIgnMGrVYAnu7o/ITDxAEas/++uvUte1tsVUzOD+2Z2olme0m3RGR2hgX/yFzwIlwRSrOgt1iho7
	D4CagO6vPcKTCJDUSux8a2RpF1e+AnMKwG715s0BQWs38caD6gCYd8QiL+IiaWopfsm1vh9FFnJPA
	koF3R0AUh/gwtibD4pzITnxjJdU5eDdcKXuCIl1+4CWvfdceYn5ocf0wGj+5OyWugENxOjv6i2bES
	oijSkbt8JLoIa1aPCUTgZUC64/wGoF/YRdwldZqkEiuK9glhKBfC2Hzy3jP5zH030DfH6kd1iGoSK
	NIdaCXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBBC-0000000EZOF-15Y9;
	Mon, 29 Jun 2026 12:33:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB6-0000000EZEy-1XfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c1269e4721aso128180966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736410; x=1783341210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=fExl0xl3W2RZM21891oyB7PAbC9HAvDfkgVkCLOncezutBwfcUCR7MSo3bTgujyZ9K
         rg8A6Mall7+JQwcOHObH1EwdlvIQn6gGRxLrUwjLzsnhEzafiAZUuQlQkTwlTwC0ileD
         FgN++6yW/I4vY4GNryzVrid47ZaFzMJ7h28eKUG6di603534iQb1HqZmnczbismHKSM9
         aUlFU+LLCywsuiLwL/rWHM/goT9CkKrajx4x40s7/p+QXuzRcClw0DyBTKBXqp/96wps
         9hOSziZH9OIrpNes7+ptyelhu4j3YH/1BLo8ay1riXlAOCeE96UXwe1zId4/1dK9HMzT
         mHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736410; x=1783341210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=oVsk0KDT8djO7Me8gmZlSE+imWUfBjizs80vuDn6PnkvlDTlLiYcDMPiL/yZEoLqNI
         TdRjI1PtEWKqG05bJNxXaX3+Oah+d+wPe2jCzkxnlwt2Vn9kKpL2AaRd3TjDzySaN4YJ
         99GwVexO4PVR8lyIGr1vkBXBExPHsZzXweSlxpILDp5R2Y236z8b/Mlj20PR4txNjnjM
         8p770ZxWGT0V5XHvSa96Uf7vozKz2A9thQyHnMuX/x9QitakHC3w68eBRLu7bEGMrPbQ
         3J7BsR/fVL8r9UQOTdqMJaV7Wj+pEgDomQqVo8/isz5l8QjFZ9SNc9CknxenVQMP8U8A
         I9kA==
X-Forwarded-Encrypted: i=1; AHgh+RqTHkb9P43pi3sM3nlbq5fk29JYAEfPsRwioNvDpAvVKtfXsBYVNLtoThwPgC4uzwpZVv+MhPtzVl+z+lRDbTuf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfbl5j5cb7XiGcZrvPqEI6S+YzCXisg64ZHWjYAi/kfADbKx0L
	Q9izROWbcQF9n8TWWqL1jngDvtaUvVEIH2AujU0vJumcq/hFw6ijRTiD
X-Gm-Gg: AfdE7cmt198RY8mrpJh5O4ELmd1M6PSDqwSS0I/+nBfCqtrDlit9GTq+MPX8iickGCR
	VsDMvEOaKsqqafBt7nYF4WZkuXgB1+efztbUmOhQWCcIR28Y3yr/4Ln+R1tGbLUN6vJKFiEuEn3
	PBooQBNR0XYnu8Ekjr7Q8LLtH7EgB/xa4zFvLpzya+4g8VbdY0a1RyARBshahEgctDWklvBtKU2
	3w2M6GKmoLDV7LHiO9FVbJuwnxzcKnU56qvqcSVs1omAGlbR2XN7kRBq0egUz0l5nT8mFeN4+TG
	CuC5Uol5h+RpmaslebD6G1fD9Lt+wSXppGMRHWs2Fk8sjtLCIp8ArQM3+kdu4ptPnQb45z6YQhv
	VHESlLRGvpOkWPQEswqjGhyFy/6DJZa9TuEXWHcUvI9lhevS4DAKS6TID1hb016SIINtNTZ2X6o
	h5vylhCbo=
X-Received: by 2002:a17:906:6a1b:b0:c12:6b39:2211 with SMTP id a640c23a62f3a-c126b392346mr184315266b.43.1782736410170;
        Mon, 29 Jun 2026 05:33:30 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:28 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 4/5] netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
Date: Mon, 29 Jun 2026 14:32:52 +0200
Message-ID: <20260629123253.1912621-5-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053332_816161_B01C1330 
X-CRM114-Status: GOOD (  12.04  )
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

From: Ryan Chen <rchen14b@gmail.com>

Without this change, nft_dev_path_info() hits the default -ENOENT path
for WiFi bridge offload via WDMA on MT7996. When a bridged flow goes
through the MT7996 WiFi device, the DEV_PATH_MTK_WDMA step does not set
h_source, causing the PPE entry to receive a zero source MAC and packets
to stall in both software fastpath and hardware path.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6c470854127f..580aa1db3cb4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -219,6 +219,10 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			}
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
+		case DEV_PATH_MTK_WDMA:
+			if (is_zero_ether_addr(info->h_source))
+				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
+			break;
 		default:
 			return -1;
 		}
-- 
2.54.0


