Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732ACD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H4jjp7axaBvicMbdr4s2WtfV9ES1GnvYOOI9pfOctHo=; b=DnICGVe57ThtlMCNFui3cRGj7o
	p6jCktwPBUhebiSOtvoa47N5IRxlnIU28x5+DeS+OZcMEAnGEVqNhqA5pi0mit8JV0j3RSr8sJ4LB
	TtYnjR67CwV4yiT+Vx8nUu0lmxcC+q+ZGCyBAbIwc3I5MNLRgkvBL61FfrEnYSpkKE29AxGr4zg/c
	KqJXPhivUWs7iPYt3S5s7OgUAbclUmj1Kblpx8l9fEZCtdLE/6aoNF1EmsdUxTi4AX24kUcnTvH7h
	Et207FWzq3NIF/oto26A1hb0hivwz9WQCACdWWZ/IgH5Luo17OAqjhHXbI6FnEVl9WkOPuM7+NfzW
	WM4NbQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJazC-0000000ArFn-01zN;
	Thu, 13 Nov 2025 17:19:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJazA-0000000ArFP-0A4F;
	Thu, 13 Nov 2025 17:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20FB042E34;
	Thu, 13 Nov 2025 17:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7621FC4CEF5;
	Thu, 13 Nov 2025 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763054391;
	bh=YgN1ZBq/zprMvZP9Ny3zoKp3YiLQvdalkDw2OGjAfhk=;
	h=From:Date:Subject:To:Cc:From;
	b=gEk3/99qvhItMDJFcO6s/DbvkfrTE+bK/hXx2ga16uTB4dKZb7ESUAWBcUJgqNT+b
	 tq1cmgodEnrbDGvzdUHUDG2yNRvkcTJGe0JRrB9vtahinldZ0zNupKGsh2ohmkpxtq
	 BGJew8PK6u4wcocyjYuJ3m/O/x2597arfVwiZnBGRARg2A0MLovNtLBOTb7LFVCnAj
	 MywOH/o3MwQDnQC/k2x80K/eWDJyO0IvYu8XEMyMXYpt1yPTbkVKbUjmKXVSZcKMWL
	 Dt610IRqeO/QlvyyKCBEEg6uf11XG9g3CfqTTqHt3Plpwj7wW1hL4sliMaBsV9gUFm
	 ox3Q64+okmQyg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 13 Nov 2025 18:19:38 +0100
Subject: [PATCH net] net: airoha: Do not loopback traffic to GDM2 if it is
 available on the device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-airoha-hw-offload-gdm2-fix-v1-1-7e4ca300872f@kernel.org>
X-B4-Tracking: v=1; b=H4sIACkTFmkC/x3MQQqAIBBA0avErBtIK6iuEi0sZ3KgMhQqkO6et
 Hx/8RNECkIRhiJBoEui+CNDlQUszhwrodhs0JVulVI1GgneGXQ3eubNG4ur3TWyPKh7brizXLU
 zQx6cgXL+5+P0vh8gh6zqbAAAAA==
X-Change-ID: 20251113-airoha-hw-offload-gdm2-fix-29f4f8df05bf
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_091952_107102_4F706049 
X-CRM114-Status: GOOD (  11.85  )
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

Airoha_eth driver forwards offloaded uplink traffic (packets received on
GDM1 and forwarded to GDM{3,4}) to GDM2 in order to apply hw QoS.
This is correct if the device does not support a dedicated GDM2 port. In
this case, in order to enable hw offloading for uplink traffic, the
packets should be sent to GDM{3,4} directly.

Fixes: 9cd451d414f6 ("net: airoha: Add loopback support for GDM2")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c373f21d95f5a610deae365c64bc589c21f5e1a0..0caabb0c3aa06948e46ad087c50eba5babc81994 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -308,7 +308,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 			if (!airoha_is_valid_gdm_port(eth, port))
 				return -EINVAL;
 
-			if (dsa_port >= 0)
+			if (dsa_port >= 0 || eth->ports[1])
 				pse_port = port->id == 4 ? FE_PSE_PORT_GDM4
 							 : port->id;
 			else

---
base-commit: f694d215d34035cc64b1d176fd82db0d1f2428d4
change-id: 20251113-airoha-hw-offload-gdm2-fix-29f4f8df05bf

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


