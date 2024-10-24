Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C7DCFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pYI8kQhzLjk8qhIVY25r6ky5/FBxidxa1N2CUq2AxI=; b=TGAlTiALuSJhuw45PFwYhnLvPv
	8JCTht9c0rWPQpp+M+AKca452mkQMP8ETpw5ZDFGUQWRqtYiiGUTproS3tG6ULfkjOyfStqnKwCfC
	POK1zKNZHydjjh9d9YEIz42SJOPUw4IzBGT9UHjZBUjVTY2NCh9wMXNvTR98QJBSVvg9U+tMsnarR
	HOFPXh6QXWgBd3NXOrnx8QIw12Y4Pk3w8h4z+zvAhSjdgS/F2Pp8annS0rkVxDrvtQheJbfSxjqpi
	vDsqQDSCPXP/y5ae9q9c7NK8dc/8OYuJYBoU/FI3W+9gHeSg42M6F09yeqWblg3cP7k90wbdLAFdC
	lnnzWdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v98-000000004pD-15vR;
	Thu, 24 Oct 2024 10:32:50 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v7Y-000000004Qx-178s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:31:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OAV0AH105566;
	Thu, 24 Oct 2024 05:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729765860;
	bh=7pYI8kQhzLjk8qhIVY25r6ky5/FBxidxa1N2CUq2AxI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=meUcuEIUCGevKlh1I5NWc5PRPQTLTOTK4YmrI1wNzb5KaJTIzU78AYCe50port1j+
	 xcAgZNKpRdhHstjQDVV5IILKC1rpVO9GO9G/r1zbhK83kRP9U9nRIbpyJle6pgwfRX
	 mVFCgFgjEgocNz10kfLTDynGWlVtipqxVz4tu6fQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OAV0DB022888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 05:31:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 05:30:59 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 05:30:59 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OAUxwd082187;
	Thu, 24 Oct 2024 05:30:59 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49OAUxfs024592;
	Thu, 24 Oct 2024 05:30:59 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>,
        <jiri@resnulli.us>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH net-next v2 1/4] net: hsr: Add VLAN support
Date: Thu, 24 Oct 2024 16:00:53 +0530
Message-ID: <20241024103056.3201071-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024103056.3201071-1-danishanwar@ti.com>
References: <20241024103056.3201071-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033112_430104_002D5A1C 
X-CRM114-Status: GOOD (  17.48  )
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

From: WingMan Kwok <w-kwok2@ti.com>

Add support for creating VLAN interfaces over HSR/PRP interface.

Signed-off-by: WingMan Kwok <w-kwok2@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 net/hsr/hsr_device.c  |  5 -----
 net/hsr/hsr_forward.c | 19 ++++++++++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index ebdfd5b64e17..0ca47ebb01d3 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -572,11 +572,6 @@ void hsr_dev_setup(struct net_device *dev)
 			   NETIF_F_HW_VLAN_CTAG_TX;
 
 	dev->features = dev->hw_features;
-
-	/* VLAN on top of HSR needs testing and probably some work on
-	 * hsr_header_create() etc.
-	 */
-	dev->features |= NETIF_F_VLAN_CHALLENGED;
 }
 
 /* Return true if dev is a HSR master; return false otherwise.
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index b38060246e62..aa6acebc7c1e 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -280,6 +280,7 @@ static struct sk_buff *hsr_fill_tag(struct sk_buff *skb,
 				    struct hsr_port *port, u8 proto_version)
 {
 	struct hsr_ethhdr *hsr_ethhdr;
+	unsigned char *pc;
 	int lsdu_size;
 
 	/* pad to minimum packet size which is 60 + 6 (HSR tag) */
@@ -290,7 +291,18 @@ static struct sk_buff *hsr_fill_tag(struct sk_buff *skb,
 	if (frame->is_vlan)
 		lsdu_size -= 4;
 
-	hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
+	pc = skb_mac_header(skb);
+	if (frame->is_vlan)
+		/* This 4-byte shift (size of a vlan tag) does not
+		 * mean that the ethhdr starts there. But rather it
+		 * provides the proper environment for accessing
+		 * the fields, such as hsr_tag etc., just like
+		 * when the vlan tag is not there. This is because
+		 * the hsr tag is after the vlan tag.
+		 */
+		hsr_ethhdr = (struct hsr_ethhdr *)(pc + VLAN_HLEN);
+	else
+		hsr_ethhdr = (struct hsr_ethhdr *)pc;
 
 	hsr_set_path_id(hsr_ethhdr, port);
 	set_hsr_tag_LSDU_size(&hsr_ethhdr->hsr_tag, lsdu_size);
@@ -368,7 +380,7 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
 
-	skb = skb_copy_expand(frame->skb_std, 0,
+	skb = skb_copy_expand(frame->skb_std, skb_headroom(frame->skb_std),
 			      skb_tailroom(frame->skb_std) + HSR_HLEN,
 			      GFP_ATOMIC);
 	return prp_fill_rct(skb, frame, port);
@@ -690,9 +702,6 @@ static int fill_frame_info(struct hsr_frame_info *frame,
 	if (frame->is_vlan) {
 		vlan_hdr = (struct hsr_vlan_ethhdr *)ethhdr;
 		proto = vlan_hdr->vlanhdr.h_vlan_encapsulated_proto;
-		/* FIXME: */
-		netdev_warn_once(skb->dev, "VLAN not yet supported");
-		return -EINVAL;
 	}
 
 	frame->is_from_san = false;
-- 
2.34.1


