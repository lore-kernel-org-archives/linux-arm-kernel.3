Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D0C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t7yDZCgF5yF794oBaYJTVqMg1ClYWvzuDLcLD0bTKE=; b=Kt/5k8CsOvkwzAPC62GswI1o2X
	50DmpvSE4iH1Flgx1O0EGGSo1q4QfuLX4+aX5Dzjay7ynOhVXbN3NKNKz6lYWdNyAyBV3jU+CJNV8
	WHK239Mrz1bq+ZQnGaPh+X/puZtl8ab0XpGfORc0h6Ley8uRvg2M6THnkyIv1bXKVDCUqA4I1D+JC
	WUKYz9C2gHTl2AntKZEwPmpWhB1izqcLGRBCYre+RTAOKDBLuWPkuw6b7p3rUqFG0UhOYwgSpvcU7
	IkcFEpkq2RYdme9KDdNKQDC2OIM74K3xm8g3FS6uLpQtBDO03bnAsKb1KPRiZznFdNZJyqkPJa4p+
	xEraeczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WP-000000028Dl-3HKC;
	Wed, 26 Aug 2026 09:02:15 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WK-000000028BG-3uot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:11 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2cfe48ca1efso12738305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734928; x=1788339728; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2t7yDZCgF5yF794oBaYJTVqMg1ClYWvzuDLcLD0bTKE=;
        b=Xiw/Tw2Bkvcg/tXesigrmOQ3IPxJ/WJWQ7ezEqcK2K4YzSM1DpHjxuA4AG/BcvbYsi
         DW67Gr0E93NGfOqNTDQn+YPkD8NYpmdsYfK0fu+GPv5seQKRMujWKSQjz/H/xgQXrdgv
         ZjqDD7KGOVnpN1ZMFiyjErQzmwF+AWdt9kaP64ZergrPupTWVkyWpkWdWhPXYZTGgkEa
         m3iZh38L/MwvpsSYzkVH/0dxA76y5F1M8AJqVqH5AByAWwPUACoUXLjep+e13dol68Ty
         K5NcTaEsyYcll4rO5+L16RmfDtEFqpj6fS9Ndj/H8EYYSd37C7jPTtvPg9zVgzy5cDma
         LnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734928; x=1788339728;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t7yDZCgF5yF794oBaYJTVqMg1ClYWvzuDLcLD0bTKE=;
        b=F4wjH34T2Yp05xp512tP/NFZ2S5QzQGTYyCYkzL0i9XiEOnCQ27whgdOw87+uSEGzx
         IYhcFbwfLbk40QG8MKgQ+vL8hg4rIL4LQLvDqWXeQTErduObRS+UXUViwzMt7gzcfymm
         uxTShi1DhkAhYl0EdFUaesxETbs7DG1L3vwmK2e++dFj+t7ndetipPjHRlxIc0qdjKoL
         MlmOl1w30sQeEjfTk+1Rho9tBaM7CeuuQhZskUI7pmSYPf/upYZFIKJKn/f5hAgIvzed
         O8WTX8LVVqld6g2XSAQMh3MNJSBNOY/lvuTI92PsqiWRU4k9dCJhMmJia5q2PAvtKisk
         oIEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod5KXDr7U/zwsQdsq03gn0ZOYtzkhBPobD70KszRT0OrT2Yn+3hW/m8xRm1O6RkCwQjxm9O6ecPwRpvldH27M8@lists.infradead.org
X-Gm-Message-State: AFuF++m+fnEZuwKt2fybuoelH1FChA+3xkJYgYQweCpIH/arLQ/FNokC
	loLU1lHHHeDZHjiYA0y8k/dE19Tp4hXBPi2OTjx0IVrHxpnDkBX+DC7CMqMxCNjJgESAKQaptQL
	k7YKe4dxW20VAT0uR/c0CthPP5Q==
X-Received: from plae17.prod.google.com ([2002:a17:902:e0d1:b0:2ca:cba4:f740])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3910:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d707a3ed87mr93106385ad.4.1787734927046;
 Wed, 26 Aug 2026 02:02:07 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:48 +0000
In-Reply-To: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Mime-Version: 1.0
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787734920; l=1785;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=enAIdIfpjwlSqC1gWlXPx7NV0FU3Pk1m0whhjn5JXcU=; b=X/J0naFXaXcacGRfyWJDRGmjT1pR6S35RpMfjdWjFbARTVW571RbgREp+itIh0+NkYxsS2pCt
 0GRcegdOuePAemCvojQPvh6N2NgBYZnP3n8QANxjyBigz32FysjP3WD
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-no-return-page-v4-3-3bb9c1ddb4e3@google.com>
Subject: [PATCH v4 3/5] KVM: SEV: Check for invalidation before warning on
 unassigned RMP entry
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020208_991768_254C8A0A 
X-CRM114-Status: GOOD (  13.43  )
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

When handling an RMP fault, KVM looks up the RMP entry for the backing
PFN to determine if a 2MB page needs to be split via PSMASH. If the RMP
entry is not assigned (or lookup fails), KVM logs a rate-limited warning
under the assumption that private memory should always have an assigned
RMP entry.

However, a concurrent invalidation (such as guest_memfd hole punching) can
race with RMP fault handling and transition the page to shared, unassigning
the RMP entry after KVM fetched the PFN. In such cases, not finding an
assigned RMP entry is benign.

Check mmu_invalidate_retry_gfn() under mmu_lock before warning about a
missing or unassigned RMP entry, and suppress the spurious warning if an
invalidation occurred for the faulting GFN.

Fixes: c63cf135cc99 ("KVM: SEV: Add support to handle RMP nested page faults")
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0d027cff734cf..f9dce8acac8eb 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5060,8 +5060,12 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 
 	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
 	if (ret || !assigned) {
-		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
-				    gpa, pfn, ret);
+		guard(read_lock)(&kvm->mmu_lock);
+
+		if (!mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
+			pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
+					    gpa, pfn, ret);
+
 		return;
 	}
 

-- 
2.55.0.887.g758fc8c411-goog


