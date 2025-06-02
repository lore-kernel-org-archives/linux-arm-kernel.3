Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8FBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoerK/xmnoCBy1REctsz2X3Jy0xIXqQaEz84x7pRJ6Y=; b=DI6TyZoPHMpBNoEI+NyZGZKlye
	yg6FC9LzPDysHxMJhUDWjIUipjS7g6RWpculKqIKlihzrD7Pj24st2u5DVXKUnTLLfORyBIIAc+oy
	z7Wcz/H8zRcn7/vphQsV17BrE2Cy1QA/Q7mBBEubcx0Gm6vRflNh9bo+UNgWHab+N10HzcMucZxfn
	+tHr92JazJalQobnoKBiXVceWgWyApPHAgemBvKMF14zvfePpYxF94nyUdrZywVa6zi4XzDZz/Ejw
	OmlpMq3Xy4wUmtOjanG6ke5odZP2m5Dz//3ayV7nsErxI8Zfz6i5JFK6HhLk0AohpEnLuCgn9W0XD
	wiH+n0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2yJ-00000007Fnc-2Nhr;
	Mon, 02 Jun 2025 11:04:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2pp-00000007Eo5-10eP;
	Mon, 02 Jun 2025 10:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E017A4FF82;
	Mon,  2 Jun 2025 10:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE787C4CEEB;
	Mon,  2 Jun 2025 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861764;
	bh=bir4tUxt7/G2lXTS4/G8XHslHlPXIFMwBBqhZnV0PaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kl2e5rlKCiNvhxnj0/N3KDau5K/WRaoMLPftTELQcULdgyJOpDJ+TWtu87d2glNCn
	 D0kYOUIzpYIM7Ci9SFvaqdym0qGZaDBD7AcEIL8CirD+LUjy/hQDxatMDiM1L09j4x
	 hcLmKcMSp0a82lViH8a9OjXfopPq2GnqOkiJlmhdv5papPqvwVgDpqgQqgkdzgt3An
	 ZfORauwWGO1S6nzT132NPXNrJAubD2TlmqJr6HHlZA8eLnKngFSV6u5UQBZomEWF3u
	 9RsQ5N/clnID10TDh8bt01O5QUXhcEzhdtDEqcHA1kwCcGHiLveHmLW6Xt54kdI7jD
	 5SIoIPcE6AI0g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 02 Jun 2025 12:55:39 +0200
Subject: [PATCH net v2 3/3] net: airoha: Fix smac_id configuration in
 bridge mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-airoha-flowtable-ipv6-fix-v2-3-3287f8b55214@kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_035605_349180_33013A01 
X-CRM114-Status: UNSURE (   9.79  )
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

Set PPE entry smac_id field to 0xf in airoha_ppe_foe_commit_subflow_entry
routine for IPv6 traffic in order to instruct the hw to keep original
source mac address for IPv6 hw accelerated traffic in bridge mode.

Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 557779093a79a4b42a1dc49b8ba0dacbdc219385..9067d2fc7706ecf489bee9fc9b6425de18acb634 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -660,6 +660,11 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
 	if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
 		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
 		hwe.ipv6.ib2 = e->data.bridge.ib2;
+		/* setting smac_id to 0xf instruct the hw to keep original
+		 * source mac address
+		 */
+		hwe.ipv6.l2.src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
+						    0xf);
 	} else {
 		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
 		       sizeof(hwe.bridge.l2));

-- 
2.49.0


