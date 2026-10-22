Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B42606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UOgDnyUi;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=VlMQcpPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f9i8wkFVwMHQ4SaJgNQsC2mhEDqyv5B2iC1yR23KMbU=; b=UOgDnyUi1MFlqGWsV3ttrKHnzF
	CZJIyxh+EkooOPAqPmPu4vD5suQUp1Zq4dqYUWtJVgotRth4tK3okpuUUKfXDKQ0nHnDYBDaZTqTM
	Va9Vxs5E1N8zIFKbXSMod3OXdHu0dWD+2p4iGEfbrjEywNIjMb3ulrw+voZXiLYslgTXY+SOSJBNW
	57ZZvQZzb/d6ZZMHM0WXVnTl3FIouXIDVNRi1LGvVZ8vdumeLykXc/uQGKIh42958su1DbSSvi5fS
	DoFfsNdtzYf/ywiy/V0qdgJydiBOELTfSGcBK9ExTOMmvdyoU1muGvmgpd+rqCQznjzlybE6JiGur
	agjML6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwuC-0000000EdLJ-2thJ;
	Thu, 22 Oct 2026 17:48:44 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwu4-0000000EdJW-3DY4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792691316; x=1824227316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f9i8wkFVwMHQ4SaJgNQsC2mhEDqyv5B2iC1yR23KMbU=;
  b=VlMQcpPNQ4RrW7F7j+Cn3f/22rhkpstmCoE2fKQr07xHUIXkemBbspOC
   343/lc7vCRZoozOjczD1Z4qQIopmP4d4BKfTOV3hunV308scbeGfNweVP
   t7aZ8eV8N0qVZnHjc3TPTBIJsi5hWlHgdSASlpIEfVcR8zv7YCILfq+gg
   KPWZlrNK9cHyNWAiNsN6hBCFkuQZmG9+q8/D9Q58fRTq5NNfcpu2SMl4e
   z4k+5LgJmWOs54YiAEShBTAQw0FP/qiBU5w24NvGuQGDnstCs58ILFbm7
   P037aUeZM7K8KsN2xVxAZFyYOxstCVHPSDrZ7zGdFu+jtmPCwGFYbQs7u
   Q==;
X-CSE-ConnectionGUID: RQZi2DGsSYa+ml+jqpMlvg==
X-CSE-MsgGUID: yTyMOonyS6GQr5ore6opzg==
X-IronPort-AV: E=Sophos;i="6.27,172,1787011200"; 
   d="scan'208";a="31764559"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 17:48:33 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:1871]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.86:2525] with esmtp (Farcaster)
 id 4c96b239-c80a-43e4-9e2a-b476f8e81ec6; Thu, 22 Oct 2026 17:48:33 +0000 (UTC)
X-Farcaster-Flow-ID: 4c96b239-c80a-43e4-9e2a-b476f8e81ec6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 22 Oct 2026 17:48:33 +0000
Received: from dev-dsk-aarnahmd-2a-95203392.us-west-2.amazon.com
 (172.19.38.251) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Thu, 22 Oct 2026
 17:48:32 +0000
From: Aaron Ahmed <aarnahmd@amazon.com>
To: <stable@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<fuad.tabba@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5.15.y] KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
Date: Thu, 22 Oct 2026 17:45:37 +0000
Message-ID: <20261022174537.2767-2-aarnahmd@amazon.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104836_877744_98A35C0F 
X-CRM114-Status: GOOD (  11.80  )
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fuad Tabba <fuad.tabba@linux.dev>

[ Upstream commit c6c156d931c33b92362383cf76f6d6e1291dcbfe ]

MAPC with V=0 drops ite->collection but leaves the ITE on the device's
ITT list, and vgic_its_save_ite() dereferences it unconditionally. A
guest that issues MAPD, MAPTI and then MAPC(V=0) therefore oopses the
host when the VMM issues KVM_DEV_ARM_ITS_SAVE_TABLES to migrate it.
That sequence is UNPREDICTABLE per the architecture, but KVM already
handles the resulting state in the translate, MOVI and DISCARD paths.

Save a zeroed entry, which vgic_its_restore_ite() reads back as
invalid. Skipping the ITE instead would leave the ITT slot holding
whatever is in guest memory, and restore rejects an entry naming a
collection the restored collection table does not have.

Fixes: eff484e0298da ("KVM: arm64: vgic-its: ITT save and restore")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Link: https://patch.msgid.link/20260807104102.2410744-2-fuad.tabba@linux.dev
Signed-off-by: Oliver Upton <oupton@kernel.org>
[aarnahmd: Upstream vgic_its_write_entry_lock() takes in the kind of table
 entry (ite) and looks up its size, while 5.15 takes in the size of an ite
 directly via ite_esz, because commit 3b2c81d5feb2 ("KVM: arm64: vgic-its:
 Add stronger type-checking to the ITS entry sizes") is not in 5.15.]
Signed-off-by: Aaron Ahmed <aarnahmd@amazon.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 054aec8a72e35..e6ed23b14623f 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2151,6 +2151,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
 	u32 next_offset;
 	u64 val;
 
+	/*
+	 * MAPC with V=0 keeps the ITEs mapped but drops their collection,
+	 * and with it the ICID. Save a zeroed entry, which the restore path
+	 * reads back as invalid.
+	 */
+	if (!ite->collection)
+		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite_esz);
+
 	next_offset = compute_next_eventid_offset(&dev->itt_head, ite);
 	val = ((u64)next_offset << KVM_ITS_ITE_NEXT_SHIFT) |
 	       ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
-- 
2.47.3


