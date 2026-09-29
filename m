Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA27CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dyYbTObh62hi+fWsCU7QOW9sp8JH41mugoLKDlkqq68=; b=KfpymNqT7UhyxeLgHVK65ICQno
	5mRiVwnwfn64nvuxq10nv18RtbaPqPi04gf8ihGk1yGwzT9MpKZJFFTp0lo3+VHRURh3Gf+PHOUNj
	qQqafe51oICRIVVby8ntgUSPLUTzu6/VHKbL7IPC6YTMAKxJ3+LppBpOjYktIVPRoC/fNkaA+f9g2
	PpFQ8NvQuYpiGzjDsSrtaMjYvs5AfAbn1AvcVNzFeW7cPRrNM+PYsPpmqV7wV1VmAiO+fOmN7RNT8
	HPzedLfD0NoQP1SaJ+/7IaJpnpVOFf0EObkGFN7HsHa6lAKyj3CdXgkm+M6jewL01h+t9j0mA6D8S
	2AqmieNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUuw-000000037As-25Rh;
	Tue, 29 Sep 2026 10:18:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUut-0000000377R-11JU;
	Tue, 29 Sep 2026 10:18:32 +0000
X-UUID: f8767926bbec11f1acbe4559397dec65-20260929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dyYbTObh62hi+fWsCU7QOW9sp8JH41mugoLKDlkqq68=;
	b=g7y+dHa2TSK84tqdvo6a8NdeubMdWavuWlXtN4l9lDYc3w6JIcTx90cDO/JlsF0DA6/ZV0betAf6mWfW3FjqyVQdRQZaEK+PFexVhics5U4xPRe+VHPsosO9S1xI6vChCDkgelnCj4SyHEboVRdEBf6sGpdsg0xB3ugIp2j81Bs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:8778c410-4abe-4fd7-91f2-62355e817106,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:a5431909-d10d-41b3-a8f1-bc707284d0ce,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8767926bbec11f1acbe4559397dec65-20260929
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 256616827; Tue, 29 Sep 2026 03:03:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 29 Sep 2026 18:03:05 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 29 Sep 2026 18:03:03 +0800
From: Shiming Cheng <shiming.cheng@mediatek.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <willemb@google.com>,
	<daniel.zahka@gmail.com>, <alice@isovalent.com>, <sd@queasysnail.net>,
	<eilaimemedsnaimel@gmail.com>, <imv4bel@gmail.com>, <nbd@nbd.name>,
	<dsahern@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <stable@vger.kernel.org>, <steffen.klassert@secunet.com>,
	<lena.wang@mediatek.com>, <shiming.cheng@mediatek.com>
Subject: [PATCH] net: gro: mark frag_list GRO packets as SKB_GSO_DODGY when a list element exceeds gso_size
Date: Tue, 29 Sep 2026 18:02:48 +0800
Message-ID: <20260929100256.23192-1-shiming.cheng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_031831_299260_4593026E 
X-CRM114-Status: GOOD (  11.19  )
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

When RX LRO (or similar offload) is enabled, the TCP/IPv4 GRO path may
aggregate traffic using frag_list. The resulting skb is later segmented
via the frag_list segmentation path (skb_segment_list()).

However, some drivers can hand GRO/LRO-aggregated frames to the stack
where individual frag_list elements are already larger than skb_shinfo(p)
->gso_size (i.e., an element itself contains multiple MSS worth of
payload) and may be non-linear (nr_frags > 0). This shape is not
naturally produced by the software GRO aggregation logic for devices
without LRO, and can lead to unexpected behavior in the frag_list
segmentation path.

Detect this condition during frag_list aggregation and mark the
aggregated packet as SKB_GSO_DODGY when a list element’s length exceeds
gso_size. This forces a more conservative segmentation/linearization
behavior downstream and avoids relying on assumptions that do not hold
for LRO-produced aggregates.

No change for normal software GRO aggregation: the new check only
triggers when skb_shinfo(p)->gso_size is set and a frag_list element
length exceeds that size.

Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
---
 net/core/gro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/gro.c b/net/core/gro.c
index 29b4d02bf519..e70ecf19b0a7 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -259,6 +259,9 @@ int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
 	skb_shinfo(p)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
 
 	NAPI_GRO_CB(skb)->same_flow = 1;
+	/* frag_list element larger than gso_size (already coalesced before list-append) */
+	if (skb_shinfo(p)->gso_size && skb->len > skb_shinfo(p)->gso_size)
+		skb_shinfo(p)->gso_type |= SKB_GSO_DODGY;
 
 	return 0;
 }
-- 
2.45.2


