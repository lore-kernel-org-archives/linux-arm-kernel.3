Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351FC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWl3Jwu4rKchLcaWiVXcQP18p1/uA9ROHPuRgijoaGI=; b=hRv/ydPn/zkeT61sWWrENE0VkJ
	0gzCM17vn6wNFrgwSal1ZgkDJ4DdNzZDUji/89K81+qAL5DLUH9VwM/tRdffHGUUWBGUQAP/Ascm8
	RvHlx/dR/fOsKZLzJeI40YH85sCgW7OljryR77beUafrIUUU5I1W6EqXoMwfMd7vUhpZpYE4yME7e
	7AIxzQRSsj1YXC5o8htf4oFiGvUgpzr7ajrFqrlD0bcDHLB6is33eCEAfPmVxZzn5lOyawqjopMsN
	AS9CRNZqvIXKK8KH9RgyrwpxzvLPGLp4r86AOLkgyB5+Gn3TN25sP+ahtobyVboyPAG2GuUI0U4q7
	q1uPWMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Gi-0000000AzSX-2Ai6;
	Thu, 17 Sep 2026 09:19:00 +0000
Received: from out-157.mta0.migadu.com ([2001:41d0:1004:224b::9d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GT-0000000AzK3-2GwF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:18:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uv/QqzkCASpL/8RQbBzCZik975p5clqE6ezIH1NXyV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789636723; v=1; x=1790241523;
 b=c5nNcqoP5YWAKr+ihICugNGB3xouSZ4XFkDHJKmSX0/Rw5Y9yel3x9pufcYL/PsN/XWtYJwk
 iO5W6+iKPH6x3THUJNfQSSwixhYq3nJOwHun7Uu2P6iYzu2zmp94zkoRBXP5fC8gdnCyWLTIOQP
 15T45bJ5/6iRrzazSaZyAYcw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c94fbe1e4d9196cd;
	Thu, 17 Sep 2026 09:18:43 +0000
X-Mizu-Trace-ID: c94fbe1e4d9196cd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	qperret@google.com,
	vdonnefort@google.com,
	martijnbogaard@google.com,
	seiden@linux.ibm.com,
	tabba@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] KVM: arm64: selftests: Free the VM when the GIC device probe fails
Date: Thu, 17 Sep 2026 10:18:26 +0100
Message-Id: <20260917091826.2639205-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260917091826.2639205-1-fuad.tabba@linux.dev>
References: <20260917091826.2639205-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021845_720064_80A6161E 
X-CRM114-Status: GOOD (  10.52  )
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

test_kvm_device() creates a VM to probe the GIC version under test and
returns without freeing it when the probe fails, in vgic_init and in
its vgic_v5 copy. Free it on that path.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 4 +++-
 tools/testing/selftests/kvm/arm64/vgic_v5.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 47e34b43afb29..53894d32b0fc8 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -732,8 +732,10 @@ int test_kvm_device(u32 gic_dev_type)
 
 	/* trial mode */
 	ret = __kvm_test_create_device(v.vm, gic_dev_type);
-	if (ret)
+	if (ret) {
+		kvm_vm_free(v.vm);
 		return ret;
+	}
 	v.gic_fd = kvm_create_device(v.vm, gic_dev_type);
 
 	ret = __kvm_create_device(v.vm, gic_dev_type);
diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/selftests/kvm/arm64/vgic_v5.c
index 96cfd6bb32f6f..10fdfe362428b 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -187,8 +187,10 @@ int test_kvm_device(u32 gic_dev_type)
 
 	/* trial mode */
 	ret = __kvm_test_create_device(v.vm, gic_dev_type);
-	if (ret)
+	if (ret) {
+		kvm_vm_free(v.vm);
 		return ret;
+	}
 	v.gic_fd = kvm_create_device(v.vm, gic_dev_type);
 
 	ret = __kvm_create_device(v.vm, gic_dev_type);
-- 
2.39.5


