Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC80B10ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCG3QV8zg8nnzDRAbzpy5JpAMM36FiYtFCUhHZacPmM=; b=45wetl5d70ezD64PQDBvCbadaf
	Tr4jnhqg/DL6If0gCh03R7fDliLF8K+TbY97RV2GJLbdlxzJQ3TBYPbHV/l0n4p8eV0yf62r4z7Gy
	h+PwhdSeomrtRd0i1tG0lAbxV6zlRgBdt5dqShfuIEF32R3Tsff+Vq9uetD7b5/H2vSd/xkkeCRiq
	/Q2HorxC5WePgmfg1kf5VM4kAN8Ebe87+NJjSuPbdAqN6fcfFhWajeMt8UDKAx6MSrbxjTMhAh031
	9fIh2uos3/uxuIdwKr6WTnWDstKV0NF361QiTJvbQ1uiG4CenVQb8a5VLbWMARE9JHBhf/kxMIWNh
	0QjCy6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ue-00000007FKI-3mbU;
	Fri, 27 Mar 2026 11:36:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UI-00000007F1c-3ZdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E913433C3;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A64C2BCB0;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611386;
	bh=JLJno+3X94Z+dwP3LduacgmLynCJjyUa2fPX69f8UCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bA3b8wpnsdKA3TZhMahzbVrOBC175eV4tVhJ2HnIfK2791PpXKKj+w5uC1vtUrTtC
	 p37/9Lo5OW7HI3IMPJv1N3u0WsUczLAVaDZhlE3XDx+6uDa3iB4UOzN16hkOBYefp4
	 f86f7QQq/ZAEiSpwebRH7H0TaqcBSZekLb+DjlYHX9Y4TY+J37RwRPK8RqXsnCTawC
	 Y+vwuwJ73bnDMX2BnJkohR1mRWPOyVscOHTVvhhpMPTNy/ohcxlXevo5GN9glGM/iP
	 6TsZm75hxLCHTz8yrHdv+sK+tVeMUE6/R1Fc0Z8/4hFMhpni1UvEo+5+vfZf/Q/oI8
	 5Z/4L5m2GKFug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UG-00000006K4a-17aW;
	Fri, 27 Mar 2026 11:36:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 09/30] KVM: arm64: Simplify return logic in user_mem_abort()
Date: Fri, 27 Mar 2026 11:35:57 +0000
Message-ID: <20260327113618.4051534-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043626_927769_0AE63D5B 
X-CRM114-Status: GOOD (  13.38  )
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

From: Fuad Tabba <tabba@google.com>

With the refactoring done, the final return block of user_mem_abort()
can be tidied up a bit more.

Clean up the trailing edge by dropping the unnecessary assignment,
collapsing the return evaluation for kvm_s2_fault_compute_prot(), and
tail calling kvm_s2_fault_map() directly.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1b991300735be..e77b0b60697f6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2005,22 +2005,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (ret != 1)
 		return ret;
 
-	ret = 0;
-
 	ret = kvm_s2_fault_compute_prot(fault);
-	if (ret == 1) {
-		ret = 1; /* fault injected */
-		goto out_put_page;
+	if (ret) {
+		kvm_release_page_unused(fault->page);
+		return ret;
 	}
-	if (ret)
-		goto out_put_page;
 
-	ret = kvm_s2_fault_map(fault, memcache);
-	return ret;
-
-out_put_page:
-	kvm_release_page_unused(fault->page);
-	return ret;
+	return kvm_s2_fault_map(fault, memcache);
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.47.3


