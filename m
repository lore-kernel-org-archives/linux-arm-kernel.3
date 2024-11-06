Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4675FD3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pYI8kQhzLjk8qhIVY25r6ky5/FBxidxa1N2CUq2AxI=; b=4rVDNx2A8EFJK6qhDpr25Sq/uI
	B8WRW+rITiMMw/+FiEhaifmvY+DeHvyfs2pBrAe1zTZR5tEXgAVNxXic2QjwfSCnCHiz+6kP41gwL
	l/XZIlOn945PvET1AxbzUPM9ZfnGpeQTlupb/JGi80WypmBWwixIQLkVkWKDM6Kv19dW4iNsS34z8
	T+BFDDWVus0oeB4Jp+EL86lYhbdkap3jBa8tDOHSpvftSvpA9HbQvqtujQccRf9fYALw1rZJOeSyE
	81wXNYi5+KlHB6HEPeySgPKGbzURmg3PCQ9l+Qr3gJKiEqznmSkouVgTrP0XWWnXfdTO4FYG2FQ67
	HNTA7U7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cag-00000002ba3-385s;
	Wed, 06 Nov 2024 09:44:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cAJ-00000002TFD-0cqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:17:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HFOL110698;
	Wed, 6 Nov 2024 03:17:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730884635;
	bh=7pYI8kQhzLjk8qhIVY25r6ky5/FBxidxa1N2CUq2AxI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fVEYmXbltt8Xc7Xm+CpIDL0w0E6bHBXl6InclwWRsf4S6VZdDZB1W+IN1JfI5utqJ
	 +uiqSYH1wxPcCA31bc9T2sJYI1pr/qM5+JTU+K+Urs6qF+A7iz7SmRWp9T+8M5sp0M
	 jyR8yG2HS7/v6NlLg9nf1WtP1mGHYL5fcIw2Ndf0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A69HFVt016164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 03:17:15 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 03:17:15 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 03:17:15 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HFic081211;
	Wed, 6 Nov 2024 03:17:15 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A69HEcK020781;
	Wed, 6 Nov 2024 03:17:14 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <jiri@resnulli.us>,
        <w-kwok2@ti.com>, <aleksander.lobakin@intel.com>, <lukma@denx.de>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <horms@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 1/4] net: hsr: Add VLAN support
Date: Wed, 6 Nov 2024 14:47:07 +0530
Message-ID: <20241106091710.3308519-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
References: <20241106091710.3308519-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011727_441600_BA50468F 
X-CRM114-Status: GOOD (  17.70  )
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


