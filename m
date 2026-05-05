Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06919CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i83n7NuT2pQ/Akq17/SCbs9ONTxlHA2pYmlE9jzOXWk=; b=qcvH2CrwbKbve4lBNfJcATCrjU
	9yqUqxZXwzjLG3BAFmkurTNQoctnpNKZ/5e/ibR/uQnbDSKl6dJP48pM9KZNb0R9gZdnI5ziab9ZZ
	YbuoQzGiWGsHKItt1ieOhsCqqgc86hkeDEkBgPnwTRGfX44mL+nIpIHpCyDALawd8UUdMTLFFPqKD
	hRWYMO2QoVUofxAuce/hmPjHHy+H5dziKPjMxb2ACfoEvTI/BfO/CXaC1pt2jcxZbpvyNDxjscC78
	HrY385MzAGgk0qwGd+7brYrnjmfM1TZgKepiEwZsZWAxTD/455EyrBFBSfarsDO1QWLAjpqPLzBES
	TXc202GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZi-0000000GTS0-0lRx;
	Tue, 05 May 2026 14:16:38 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZf-0000000GTQN-24JB;
	Tue, 05 May 2026 14:16:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKGZZ-000000008RH-2sqA;
	Tue, 05 May 2026 14:16:29 +0000
Date: Tue, 5 May 2026 15:16:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 2/5] net: dsa: mt7530: preserve VLAN tags on trapped
 link-local frames
Message-ID: <3ad4b724d7ae6250b8429d50fe913d2dca07a3f9.1777986341.git.daniel@makrotopia.org>
References: <cover.1777986341.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777986341.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071635_935590_174E642E 
X-CRM114-Status: GOOD (  14.43  )
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

The BPC, RGAC1 and RGAC2 registers control the handling of link-local
frames with reserved MAC DAs (01:80:C2:00:00:0x). These frames are
correctly trapped to the CPU port, but the egress VLAN tag attribute was
set to MT7530_VLAN_EG_UNTAGGED which causes the switch to strip any
VLAN tags from trapped frames before they reach the CPU.

This causes VLAN-tagged link-local frames (STP BPDUs, LLDP, PTP Peer
Delay Requests) to arrive at the CPU without their VLAN tag, so they
are delivered to the base network interface instead of the VLAN
sub-interface. The DSA local_termination selftest confirms this: all
link-local protocol tests on VLAN upper interfaces fail.

Set the EG_TAG attribute to MT7530_VLAN_EG_DISABLED (system default)
so that the switch does not modify VLAN tags in trapped frames. This
way VLAN-tagged frames retain their original tag and are delivered to
the correct VLAN sub-interface, matching the behavior of non-trapped
frames which pass through without VLAN tag modification.

Fixes: 69ddba9d170b ("net: dsa: mt7530: fix handling of all link-local frames")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b1903da7d500..a696c8736982 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1300,37 +1300,40 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
-	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress them
-	 * VLAN-untagged.
+	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
+	 * them with the EG_TAG attribute set to disabled (system default)
+	 * so that any VLAN tags in the frame are not modified by the
+	 * switch egress VLAN tag processing. This preserves VLAN tags
+	 * for reception on VLAN sub-interfaces.
 	 */
 	mt7530_rmw(priv, MT753X_BPC,
 		   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
 			   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
-		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
-			   BPDU_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+			   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   TO_CPU_FW_CPU_ONLY);
 
-	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and egress
-	 * them VLAN-untagged.
+	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and
+	 * egress them with EG_TAG disabled.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC1,
 		   R02_BPDU_FR | R02_EG_TAG_MASK | R02_PORT_FW_MASK |
 			   R01_BPDU_FR | R01_EG_TAG_MASK | R01_PORT_FW_MASK,
-		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   R02_PORT_FW(TO_CPU_FW_CPU_ONLY) | R01_BPDU_FR |
-			   R01_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+			   R01_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   TO_CPU_FW_CPU_ONLY);
 
-	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and egress
-	 * them VLAN-untagged.
+	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
+	 * egress them with EG_TAG disabled.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC2,
 		   R0E_BPDU_FR | R0E_EG_TAG_MASK | R0E_PORT_FW_MASK |
 			   R03_BPDU_FR | R03_EG_TAG_MASK | R03_PORT_FW_MASK,
-		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   R0E_PORT_FW(TO_CPU_FW_CPU_ONLY) | R03_BPDU_FR |
-			   R03_EG_TAG(MT7530_VLAN_EG_UNTAGGED) |
+			   R03_EG_TAG(MT7530_VLAN_EG_DISABLED) |
 			   TO_CPU_FW_CPU_ONLY);
 }
 
-- 
2.54.0

