Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5645CC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2PsJzyG2oOJ2ksgty2+8DYWID+BIfcfTdqxn2ygSiY=; b=ConkU6gMKwmFYVw3uSkNP/kCSj
	ZhvA38pzCJ9Z5+c4zcySN8Su/AN96yg9Oudxsxe0WNyQAqozS0JL24625EAOsZshSHWornFBwJkRo
	gV6bAZcfnPrBW5NHkCXcw5B72n8GlCNTvw4ND3HlMUizs+S5mhyaaXhO8O380KB9MV5nRMNn17N72
	JxAKLaauPyFojnxi9wyq0NV/Q+Yq36KPR7wsZeGlYXpS09SinbevKa5vPCFzK+e6oW30Z94bmxaL1
	pVc3Bf0Vj8A/To6tR2kt+KD0D9rJ9iRcS31CGmU54FVD2Wp0BWZ+zjErlfZKXlchvLa1ED4IgrNdo
	wl9g1t8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX7-00000009Y3Q-2MgU;
	Wed, 19 Aug 2026 10:28:33 +0000
Received: from out-219.mta0.migadu.com ([2001:41d0:1004:224b::db] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX4-00000009Y1C-4636
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:28:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ND3FDfa/qCk5V+rP9yXVtcSn7EWp1L01qy+mI7z3Zkk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787135309; v=1; x=1787740109;
 b=OiKqPEq3KTu4gORRoIWR5xMLppn2wWk+G5qLoG7tMPbFJ+iLPGHpMb8vnfrdP8qfMihHZI9f
 EP9c1yYiQZ5VVHXGJQU7072aOW6j9jSUhzY5zgF3AFXJUVWZCe9/tMMnAefPIoRz6huSmSfRs2V
 47ibg3ffvAEFyq89QJaNTb+I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 3086ea0630f1674f;
	Wed, 19 Aug 2026 10:28:28 +0000
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Eric Auger <eauger@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] KVM: arm64: vgic-its: Skip unreachable devices instead of failing the save
Date: Wed, 19 Aug 2026 11:28:08 +0100
Message-Id: <20260819102809.310708-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260819102809.310708-1-fuad.tabba@linux.dev>
References: <20260819102809.310708-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_032831_241939_615A4B8C 
X-CRM114-Status: GOOD (  16.54  )
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

vgic_its_save_device_tables() aborts with -EINVAL when a device's entry
falls outside the device table, which a guest can arrange on its own: an
indirect table lets it clear an L1 entry's valid bit without touching
GITS_BASER. That fails a save userspace should be able to issue
reliably.

Skip the device instead, and point the saved DTE chain past it, as
commit ad1e686e2378d ("KVM: arm64: vgic-its: Point saved ITEs at the
next valid entry") does for ITEs. compute_next_devid_offset() takes the
next device off the list whether or not it was saved, so the predecessor
would otherwise point at an entry the save never wrote. Restore follows
that offset while it stays inside the table being scanned: within an L2
block, or anywhere in a flat table. Both need userspace to remove a
memslot under the table, since dropping an L1 entry takes the whole
block with it and scan_its_table() stops at the block boundary.

Fixes: 57a9a117154c9 ("KVM: arm64: vgic-its: Device table save/restore")
Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/86bjaz5s6v.wl-maz@kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index cc6ea5c3409ae..717fbd563fb01 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2013,18 +2013,22 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 	return ret;
 }
 
-static u32 compute_next_devid_offset(struct list_head *h,
+static u32 compute_next_devid_offset(struct vgic_its *its, u64 baser,
 				     struct its_device *dev)
 {
-	struct its_device *next;
-	u32 next_offset;
+	struct its_device *next = dev;
 
-	if (list_is_last(&dev->dev_list, h))
-		return 0;
-	next = list_next_entry(dev, dev_list);
-	next_offset = next->device_id - dev->device_id;
+	/*
+	 * Point at the next device vgic_its_save_device_tables() saves. It
+	 * sorts device_list first, so the subtraction cannot underflow.
+	 */
+	list_for_each_entry_continue(next, &its->device_list, dev_list) {
+		if (vgic_its_check_id(its, baser, next->device_id, NULL))
+			return min_t(u32, next->device_id - dev->device_id,
+				     VITS_DTE_MAX_DEVID_OFFSET);
+	}
 
-	return min_t(u32, next_offset, VITS_DTE_MAX_DEVID_OFFSET);
+	return 0;
 }
 
 static u32 compute_next_eventid_offset(struct list_head *h, struct its_ite *ite)
@@ -2265,17 +2269,18 @@ static int vgic_its_restore_itt(struct vgic_its *its, struct its_device *dev)
  * vgic_its_save_dte - Save a device table entry at a given GPA
  *
  * @its: ITS handle
+ * @baser: GITS_BASER<dev> the caller is saving against
  * @dev: ITS device
  * @ptr: GPA
  */
-static int vgic_its_save_dte(struct vgic_its *its, struct its_device *dev,
-			     gpa_t ptr)
+static int vgic_its_save_dte(struct vgic_its *its, u64 baser,
+			     struct its_device *dev, gpa_t ptr)
 {
 	u64 val, itt_addr_field;
 	u32 next_offset;
 
 	itt_addr_field = dev->itt_addr >> 8;
-	next_offset = compute_next_devid_offset(&its->device_list, dev);
+	next_offset = compute_next_devid_offset(its, baser, dev);
 	val = (1ULL << KVM_ITS_DTE_VALID_SHIFT |
 	       ((u64)next_offset << KVM_ITS_DTE_NEXT_SHIFT) |
 	       (itt_addr_field << KVM_ITS_DTE_ITTADDR_SHIFT) |
@@ -2374,15 +2379,16 @@ static int vgic_its_save_device_tables(struct vgic_its *its)
 		int ret;
 		gpa_t eaddr;
 
+		/* Don't fail a save that userspace must be able to issue. */
 		if (!vgic_its_check_id(its, baser,
 				       dev->device_id, &eaddr))
-			return -EINVAL;
+			continue;
 
 		ret = vgic_its_save_itt(its, dev);
 		if (ret)
 			return ret;
 
-		ret = vgic_its_save_dte(its, dev, eaddr);
+		ret = vgic_its_save_dte(its, baser, dev, eaddr);
 		if (ret)
 			return ret;
 	}
-- 
2.39.5


