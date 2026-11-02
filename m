Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QmnhlVgx;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ogl8CBtQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I7f0XyCAtF4SJfvjHPyOeR1juZYlK47QDPUr9ArN18s=; b=QmnhlVgxxhltsP
	TdIEGqAGASRMWIKMJZxw79YXPTnp7K83w8PL3KEC+M4KQe4lTYKKZuqnyk839Qvy269PtSnpERJi/
	KCiSLciux6K85neU5UJS621vJSl8feBgsUlh8IgT/GMK4Guu/U+6EvvVvB9JiYUSLEn/3E1qXc8pS
	jkDMaO1Nn9ctYmzM23r/ljMrwukqpA4mo+rrXCaFa0t1tni58Uy+pcYNbuT9u6VSwoWTpc0rKrNno
	tI97oTTiuQ3JQYXK2BWT12DQxoivsLqcmcjtBki7XXqEvLiQJbyvC34iNAkyVEARuvW59xpFjCmLN
	VslJxa3Tzk12YsKsxgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwT-0000000FoMJ-0iea;
	Mon, 02 Nov 2026 07:58:57 +0000
Received: from out-114.mta0.migadu.com ([2001:41d0:1004:224b::72] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwO-0000000FoK1-1UJP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:58:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0wwKFnAfKLxHm3MqsSLnib+x1Cbbb0RE6cyNuCZw7gg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606328; v=1; x=1794211128;
 b=ogl8CBtQDjMx17gldrzG8y9aQpsv613GYEwNn1rJXC+6g/+opPkIIcn+HlXnAavrY1GAUOPR
 txvgIyi154ghhKYCU0qOvD37Z8I+Q68/aAi2YXxkuHE8YpTvtAEVvcChEiA6LpGxcNy4ifYtDgx
 6Gx1AIx4F8D+VlBhLhO16xlA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9c4dd2f3ef011e26;
	Mon, 02 Nov 2026 07:58:48 +0000
X-Mizu-Trace-ID: 9c4dd2f3ef011e26
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when kvm_setup_vcpu() fails
Date: Mon,  2 Nov 2026 07:58:42 +0000
Message-ID: <20261102075843.2556018-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075843.2556018-1-fuad.tabba@linux.dev>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_235852_533677_7DDF34B3 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM_ARM_VCPU_INIT records the requested features in the VM-wide bitmap
before kvm_setup_vcpu() runs, and leaves them there when setup fails
(e.g., HAS_EL2_E2H0 on a host without FEAT_NV1). The PMU attributes
read that bitmap before the vCPU is initialized, so after such a
failure with PMU_V3 requested, KVM_SET_DEVICE_ATTR on the PMU group no
longer returns -ENODEV.

Until an INIT has succeeded, every INIT that gets past the feature
checks rewrites the bitmap. After that, kvm_vcpu_init_changed()
requires the requested features to match it, so the copy is a no-op.
Clear the bitmap on failure while KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED
is clear.

Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
Suggested-by: Oliver Upton <oupton@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 157bf4b812020..3e91e01b032c4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
 
 	ret = kvm_setup_vcpu(vcpu);
-	if (ret)
+	if (ret) {
+		/* Clear the bitmap if setup fails on the first vCPU to be initialized. */
+		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
+			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
+
 		goto out_unlock;
+	}
 
 	/* Now we know what it is, we can reset it. */
 	kvm_reset_vcpu(vcpu);
-- 
2.47.3


