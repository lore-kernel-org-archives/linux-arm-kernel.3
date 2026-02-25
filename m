Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA8FD3776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY0eOcbP10xypHAaHBqk13P+uVcLzRh1cwtoBu1zlLg=; b=B/5vEzhPH0K79pWQpN4KsJqO1B
	uxc6HtE/7fL2JF8DCBbuElO7Y4Pw+JXUbg9gMvfQpZvGuxPYS6jBccOQb7Y0e+h+fhH3iuC1TIe60
	4VSUJPnmWrRwe8Ge0xr+mFC39TCnmlMAG+lnQF3nu+VzmBdvXyzMzY9WHYZJQXmkVAAb91rVIoB46
	ThvMpY9Fpy/LqVFRpGVKQjh5M4hrKlIH6SkJY0mUNPt/8EQIgFzyXmLqZndiMgBLs8kz4N5oHWhge
	0PyWq1PEVZZzV13XR0JDPAqN489zs+cOqfE/UQQ2BQubsHQECzHa3m4QroZIlv1bLEiT35rNvJyDe
	NGr70mPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInj-00000004fQe-3djv;
	Wed, 25 Feb 2026 17:35:55 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInd-00000004fNz-20rH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:35:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772040939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VY0eOcbP10xypHAaHBqk13P+uVcLzRh1cwtoBu1zlLg=;
	b=T6tTNy3J0NKZ3vVtfsZaNmJ3RWluFB+MVGvDgb63KduKHnw56dW5iFn4tJuihx1rmd6/OV
	hBRZrSxFr4yjZJGd4AofiyEpHb6vQkp82KPkGqCDKJI4NB8Al+7IVpCEEjPVQSkxQpzrKV
	5ayRPePmoODkK4hJ5K9IeRqfpza+8mQ=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 1/3] KVM: arm64: nv: Check S2 limits based on implemented PA size
Date: Thu, 26 Feb 2026 01:35:13 +0800
Message-ID: <20260225173515.20490-2-zenghui.yu@linux.dev>
In-Reply-To: <20260225173515.20490-1-zenghui.yu@linux.dev>
References: <20260225173515.20490-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093549_668992_52848F98 
X-CRM114-Status: GOOD (  12.25  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

check_base_s2_limits() checks the validity of SL0 and inputsize against
ia_size (inputsize again!) but the pseudocode from DDI0487 G.a
AArch64.TranslationTableWalk() says that we should check against the
implemented PA size.

We would otherwise fail to walk S2 with a valid configuration. E.g.,
granule size = 4KB, inputsize = 40 bits, initial lookup level = 0 (no
concatenation) on a system with 48 bits PA range supported is allowed by
architecture.

Fix it by obtaining PA size by kvm_get_pa_bits(). Note that
kvm_get_pa_bits() returns the fixed limit now and should eventually reflect
the per VM PARange (one day!). Given that the configured PARange should not
be greater that kvm_ipa_limit, it at least fixes the problem described
above.

While at it, inject a level 0 translation fault to guest if
check_base_s2_limits() fails, as per the pseudocode.

Fixes: 61e30b9eef7f ("KVM: arm64: nv: Implement nested Stage-2 page table walk logic")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/nested.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 620126d1f0dc..44ed3915b961 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -152,31 +152,31 @@ static int get_ia_size(struct s2_walk_info *wi)
 	return 64 - wi->t0sz;
 }
 
-static int check_base_s2_limits(struct s2_walk_info *wi,
+static int check_base_s2_limits(struct kvm_vcpu *vcpu, struct s2_walk_info *wi,
 				int level, int input_size, int stride)
 {
-	int start_size, ia_size;
+	int start_size, pa_max;
 
-	ia_size = get_ia_size(wi);
+	pa_max = kvm_get_pa_bits(vcpu->kvm);
 
 	/* Check translation limits */
 	switch (BIT(wi->pgshift)) {
 	case SZ_64K:
-		if (level == 0 || (level == 1 && ia_size <= 42))
+		if (level == 0 || (level == 1 && pa_max <= 42))
 			return -EFAULT;
 		break;
 	case SZ_16K:
-		if (level == 0 || (level == 1 && ia_size <= 40))
+		if (level == 0 || (level == 1 && pa_max <= 40))
 			return -EFAULT;
 		break;
 	case SZ_4K:
-		if (level < 0 || (level == 0 && ia_size <= 42))
+		if (level < 0 || (level == 0 && pa_max <= 42))
 			return -EFAULT;
 		break;
 	}
 
 	/* Check input size limits */
-	if (input_size > ia_size)
+	if (input_size > pa_max)
 		return -EFAULT;
 
 	/* Check number of entries in starting level table */
@@ -269,9 +269,11 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	if (input_size > 48 || input_size < 25)
 		return -EFAULT;
 
-	ret = check_base_s2_limits(wi, level, input_size, stride);
-	if (WARN_ON(ret))
+	ret = check_base_s2_limits(vcpu, wi, level, input_size, stride);
+	if (WARN_ON(ret)) {
+		out->esr = compute_fsc(0, ESR_ELx_FSC_FAULT);
 		return ret;
+	}
 
 	base_lower_bound = 3 + input_size - ((3 - level) * stride +
 			   wi->pgshift);
-- 
2.53.0


