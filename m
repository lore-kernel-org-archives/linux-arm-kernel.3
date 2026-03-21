Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C3F1093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cuzcUcquOIpuEvBuH4lStYzlUUTfGnCUE2b66iIEQMo=; b=CdeMO9WRYTB2d48ygmmvBJYoHG
	yP7qqzsBak/c3bjGrDgyvD799sa6UDDipSijXyqAWA3EqzsqhlK6d8cnVICQyMWIRExQwLSxuxBc1
	QPDaGsdub9yL0I+2ugycpwBBCXRMahq37xnR6Xwqp/qdl/lsos/pGjHQThZD2cNnHqZVuX6DSnEkb
	LDf4tGLsNqX/NhKBe3tWHBY2+ttj92JNJ5jnWk+/jFQAIQW0x2s6Qc7MPa9nz7ueA6rSBCBJ03CfG
	ePBSdY+dza7auxIkTKiYmh0WP4LHdpooKGCmKepbKz30t3PvRpkpMQGLg05UMarLLUlk23YxIxRrY
	gJmAnuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3p30-0000000E6Nz-0xPj;
	Sat, 21 Mar 2026 05:38:54 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3p2w-0000000E6NA-1wCL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 05:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cuzcUcquOIpuEvBuH4lStYzlUUTfGnCUE2b66iIEQMo=; b=uneE3rGyjHiN0M6FvRHDM1q/TE
	nMmqUvSuwJnjGmo9uPYMHU7ssNgpGuuJ0sjpe6WYE+Di5tBQ3ToMTk/PF4+KmtGe9Y6GrPghw+HAp
	e675zS5gQwbHU+lYJy/CkXI1RTJorF4AgdVHFeplLtY3JDMGPNq89IUYgwnTvXcH+rdWxhTGITrqH
	dgo0XvYxm3QlPG3UyYviXW8CrJgonUfPh+MEugTtz1qek8r8O7eXa4hsytuRf9uFKSiVRinHNSbKM
	b6Y4ES0532y4N282eMzcGuu/CJ14ndQrfJIhmG526awHyqtRbUEAcelb2m1GksFUj0UfKTterzasg
	KtheNFIg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3p2p-000000088Q7-0S6s;
	Sat, 21 Mar 2026 06:38:43 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 21 Mar 2026 06:38:17 +0100
Subject: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAMguvmkC/32NSw6DMAxEr4K8riscPq264h4VizR1SiR+slFUh
 Lh7Awfo8o1m3mygLIEVHtkGwjFomMYE5pKB6+z4YQzvxGByU+cFlRh7O6KwLpMwssgk6O+vwpK
 7+Sq3kIazsA/fU/psE3fhaK/nR6Qj/auLhISld7Ur2BBVvhmGWVddeNDr3EO77/sPF5qAm7gAA
 AA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774071499; l=1877;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=+bvTMvdty1fzgGCGx7v/YOGgwFlkD7szerZ7TPZd6jE=;
 b=zSrlFLj2+YAmXXjeA5B74clu6Ih6A2qDQaIcZg1MC6BKlQ4CyUZM1vm5Wa41N7pbzWysMMasq
 tpBqMbRpWvkCo961IqT5g0j8/EWoyoPl12g+XE65SzpeMFXEXpq+Y2v
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_223851_003571_70F55406 
X-CRM114-Status: GOOD (  10.36  )
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

stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
-EINVAL via stmmac_do_void_callback(), resulting in a spurious
"Failed to restore VLANs" error even when no VLAN filtering is in use.

Check presence of VLAN HW FILTER flags before stmmac_vlan_update().

Tested on Orange Pi Zero 3.

Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This patch fixes a noisy "Failed to restore VLANs" message on platforms
where stmmac VLAN hash ops are not implemented.
stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
VLAN hash ops presence which results in -EINVAL. 
---
Changes in v2:
- Replace check for hash ops with check for HW FILTER flags
- Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..cfc0ce9cec9c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
 {
 	int ret;
 
-	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
+	if (!(priv->dev->features &
+	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
 		return 0;
 
 	if (priv->hw->num_vlan)

---
base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
change-id: 20260314-vlan-restore-error-f8b3a1c7f50a

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


