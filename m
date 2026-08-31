Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A34C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JUB+2i8D1nfQHZcBdc6IJYhrnVENssOUR8oDakba3aY=; b=WBG5RVrENFoYmg81a/PFz3cMde
	ml93hHgZegK2PMbVGdTZFoU8mhL+vSwlBZYuAyDse9RGBsVNVvqXQdDrG2T/CnsxDq3L8vGM46zR5
	yz1al/TURVYjqMdOdrCnSmQfHMRItWm5ZCqXz2G/DO1u4s4CASrxRFj1qa21aUTqdbeL+zocFSIgg
	9cAeqvqcB8KAnJjPqJ7o2ogWjSzvjNJREZBuwTWmrh7LN4s0hrrFm71yk82jRwLbLA8xyhRTv5wL0
	fQs5WXdpnSjra0Sw5lya0Vrvha5Wms7FT2vpf0Pc3NMCWa54oEXQV1TIKJoEicgChVEI1jfIf6Std
	SxS5M/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14rt-0000000A2ml-4Ax5;
	Mon, 31 Aug 2026 16:28:21 +0000
Received: from out-48.mta1.migadu.com ([2001:41d0:203:375::30] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14rr-0000000A2ll-2FtZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:28:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xIutThzYKRk+MmgmvnI6jxLg86YKS37TTQ0Ve9SNoQs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788193696; v=1; x=1788798496;
 b=eZv0dstr7e0JcCExDFQuAwZ2D//Ch5dXmkdHho3oWMIg2+k3zQbQXxY/5knFWLVWncdhsvV9
 ICeBSeSXv41n0ISsMXvcSIbarMq4AURU2NALsg0Mq/AqWA2ZeYBPo2eNWOwkN8AQaaK7+fvhc10
 ybsbw5G3axM5XAZkvOG8bdVQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 55f6d3df3ac0595f;
	Mon, 31 Aug 2026 16:28:16 +0000
X-Mizu-Trace-ID: 55f6d3df3ac0595f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix the KVM_ARM_PREFERRED_TARGET documentation
Date: Mon, 31 Aug 2026 17:28:15 +0100
Message-Id: <20260831162815.269851-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_092819_782507_85AFC137 
X-CRM114-Status: GOOD (  11.70  )
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

KVM_ARM_PREFERRED_TARGET has never set a feature bit: the original arm64
implementation zeroed the bitmap, and kvm_vcpu_preferred_target(), which
only ever zeroed it, was removed by commit 5346f7e13e5e ("KVM: arm64:
Always return generic v8 as the preferred target"). The ENODEV error had
gone earlier still, with commit 08e873cb70f3 ("KVM: arm64: Change the
return type of kvm_vcpu_preferred_target()"). Document what it returns,
that userspace selects vCPU features itself, and drop the error.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9e..193f3b0ec77d1 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3600,20 +3600,14 @@ Possible features:
 :Parameters: struct kvm_vcpu_init (out)
 :Returns: 0 on success; -1 on error
 
-Errors:
-
-  ======     ==========================================
-  ENODEV     no preferred target available for the host
-  ======     ==========================================
-
 This queries KVM for preferred CPU target type which can be emulated
 by KVM on underlying host.
 
-The ioctl returns struct kvm_vcpu_init instance containing information
-about preferred CPU target type and recommended features for it.  The
-kvm_vcpu_init->features bitmap returned will have feature bits set if
-the preferred target recommends setting these features, but this is
-not mandatory.
+The ioctl returns a struct kvm_vcpu_init instance containing the
+preferred CPU target type. The kvm_vcpu_init->features bitmap is
+returned empty: userspace selects the vCPU features itself, and their
+availability is reported by the capabilities listed under
+KVM_ARM_VCPU_INIT.
 
 The information returned by this ioctl can be used to prepare an instance
 of struct kvm_vcpu_init for KVM_ARM_VCPU_INIT ioctl which will result in

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5


