Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9883CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvZuk1I/j+eWEKq+4R+vmT9mUVOs9QlwW/okf/c7JhA=; b=LtIabk1rN9SgR6U31xJFoLqfk/
	SReEK8A+Omw7hRY+zn1NnvEVzbn07FOFG/8j5RyzONZYxK/qnUXhU9zLddi46pxKv3D3ryO+dxJQX
	8i3wb65sRmiDAfL0JOLe6qw0SRtcLZw9T5YAmL+3oq6iBfg+BmS66sLYClVNw5oSzuRiUziR9IDFj
	zsjeagoI7AqQcWsOXp616TokP3GIEgglycV0Bf1IQzJha0Q52rjIsWt8t5RAwBEdfiS5oPqddl+Yi
	T4mFEWYmCqyqDjEvX6N9Rl/5AXdDTPhGs3IfBTpDXHT9qSsdEMnyx7B3gVChYPH0IwF124cW5QPYb
	PP3oaFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyXy-0000000G5bl-2jvm;
	Thu, 04 Jun 2026 03:15:06 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyXw-0000000G5ao-1Yyl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:15:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780542894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YvZuk1I/j+eWEKq+4R+vmT9mUVOs9QlwW/okf/c7JhA=;
	b=K68z+di4bi5be0A+GTUpuzeEG4UPq2J6Sghnv71y46NB05mKWRAdz8Pvyp3rea3dx42Lre
	n/7cxHYkGe0yTr8Y3nmChoFw2xdtgw0C61G+dM/01aPp6a+eFx+8vN7bgnWawz71FCavJy
	HY5IVq84Q+vKiv6FkRctRd3FabW/r9M=
From: Jackie Liu <liu.yun@linux.dev>
To: maz@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oupton@kernel.org,
	yuzenghui@huawei.com,
	will@kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH] KVM/arm64: vgic-its: Fix memory leak when vgic_its_set_abi() fails
Date: Thu,  4 Jun 2026 11:14:26 +0800
Message-ID: <20260604031426.16109-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_201504_574953_82FBD064 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Jackie Liu <liuyun01@kylinos.cn>

In vgic_its_create(), if vgic_its_set_abi() fails after allocating the
its structure and setting kvm state, the allocated 'its' is leaked
because the function returns without freeing it.

Fix by rolling back the kvm state flags and freeing the its structure
when vgic_its_set_abi() returns an error.

Fixes: 71afe470e20d ("KVM: arm64: vgic-its: Introduce migration ABI infrastructure")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/arm64/kvm/vgic/vgic-its.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 1d7e5d560af4..83718eab4e06 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1878,8 +1878,6 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 	INIT_LIST_HEAD(&its->collection_list);
 	xa_init(&its->translation_cache);
 
-	dev->kvm->arch.vgic.msis_require_devid = true;
-	dev->kvm->arch.vgic.has_its = true;
 	its->enabled = false;
 	its->dev = dev;
 
@@ -1887,15 +1885,21 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 		((u64)GITS_BASER_TYPE_DEVICE << GITS_BASER_TYPE_SHIFT);
 	its->baser_coll_table = INITIAL_BASER_VALUE |
 		((u64)GITS_BASER_TYPE_COLLECTION << GITS_BASER_TYPE_SHIFT);
-	dev->kvm->arch.vgic.propbaser = INITIAL_PROPBASER_VALUE;
-
-	dev->private = its;
 
 	ret = vgic_its_set_abi(its, NR_ITS_ABIS - 1);
+	if (ret) {
+		mutex_unlock(&dev->kvm->arch.config_lock);
+		kfree(its);
+		return ret;
+	}
 
-	mutex_unlock(&dev->kvm->arch.config_lock);
+	dev->kvm->arch.vgic.msis_require_devid = true;
+	dev->kvm->arch.vgic.has_its = true;
+	dev->kvm->arch.vgic.propbaser = INITIAL_PROPBASER_VALUE;
+	dev->private = its;
 
-	return ret;
+	mutex_unlock(&dev->kvm->arch.config_lock);
+	return 0;
 }
 
 static void vgic_its_destroy(struct kvm_device *kvm_dev)
-- 
2.54.0


