Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21811F0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtHGmGW+kuNXfpqkwV8R0QzbahP6BhHBAQuRE9dnG2k=; b=pAUrASf010Zju0wFN3iSQtI7q3
	OlUALIHa/657/S0eW932wpbQh478rjcvB6sWWCvyHEaHEDKpZAhxgaGM1KMTVa6pEGsC3xE6SfkH0
	2bGpKWgoaVGmvtVoXU7dcIMf2wYXGJSKVgR84L4gh7UvJ0pcBU2q27BSLMigtka0wmrSkpW7s/9n6
	5XbGSrD1B3LnjdqQ9aBqwoGmtxeWK3u78h42N54RE3TXl30w23X/svjI5+wxus8LK4GVp7ac5wDvI
	jxml/JsrO0eW0nKTeh4OpQRSnQBnIodn1q4sYF2Mq7ztUildElwVqTM/JiqxPzpUooWQ5ccLaB/rO
	lXC1v1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlf-00000003qSO-0L7B;
	Fri, 06 Mar 2026 14:03:03 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlV-00000003qE7-0Fc2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:54 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6613679e8cbso2915580a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805769; x=1773410569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtHGmGW+kuNXfpqkwV8R0QzbahP6BhHBAQuRE9dnG2k=;
        b=FSZHszg6nhGufkYiXe069KP3AruMsgEYci3ZrzmMj6B+w3oqXnHxrDZYRjgiSvxO8n
         Pwy77oVxvc+BlWSL0MaYj1fJ/i/WozvO/390qkK6DkFVs4tu0ANbSdmaHUyIG6emQC51
         CdE++Zjz0uO3tA790E6ywZHDZSDIE/kr2yjiA07Wp4a73UWpSo8r+JHzdHifdeJaMPVJ
         vryflQY8bIA1xBnrerdMo/jZ+08lbTZUYjeUfnPAa/A11HgI2Fb/SxtgFuFUmlSoo/Nj
         ejZXNJsQqDnyzZwKRMYj082ejWuVKpnWFbyM1rUNOKzTAKqYncSZe8z+b3IoElStPbFk
         Cn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805769; x=1773410569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtHGmGW+kuNXfpqkwV8R0QzbahP6BhHBAQuRE9dnG2k=;
        b=VE+hrUcfdqGKyPfxXo1vVEpTx2DYOm41dZNRLpoB1i7Dh4loTZ8C1eSEwWhdnyC5z5
         6a4J8RcD/xBUUUd6oBvRhzLo1Qe695ikHPbe6vltCJ/OYiKWBEaoVd2sWyTOJOKr2Ui7
         1GfewsMY9SdvnpsJvg1QwHa4WFG0iokjuhwAJDsm5FUxSDoSIYcl5oPVR7Fi4HpFbnnP
         mXZmmlZ/Rz4Psw5Dpkgsioc5iKL8H/mox6SgYGlxd2N/iXOZ9/jHD1mu9bV9oPB3dD6Q
         rqoJW7xXCDvV+37ejSsiMcme6eikno4qTomtl02krUI4+rj1o11DqK6piLaaCdi46dsD
         J0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXkl+QkCuKoJ49WiIiszqYDhqM1QMLTK7eL+w9VgphULiJKFaeeQl9HnyhurJR2j5CbRldJAdTyfL+h0RrQpAST@lists.infradead.org
X-Gm-Message-State: AOJu0YwHa8P33dhOlOoBbFnjR6tT3bRWvTfAangyMoO9vbd+mUNggVl6
	nWG8nf3ktWSClhdq73vsUzQXssAP9HffaQeTrp+m8darqmApoNrNCsgDq/dMNguv1jJx3JnPBgc
	gew==
X-Received: from edoy18.prod.google.com ([2002:aa7:c252:0:b0:660:e9bd:31af])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2807:b0:658:1304:b699
 with SMTP id 4fb4d7f45d1cf-6619d50626dmr1271444a12.31.1772805768583; Fri, 06
 Mar 2026 06:02:48 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:31 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-13-tabba@google.com>
Subject: [PATCH v1 12/13] KVM: arm64: Hoist MTE validation check out of MMU
 lock path
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060253_238908_5CFAE184 
X-CRM114-Status: GOOD (  14.65  )
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

Simplify the non-cacheable attributes assignment by using a ternary
operator. Additionally, hoist the MTE validation check (mte_allowed) out
of kvm_s2_fault_map() and into kvm_s2_fault_compute_prot(). This allows
us to fail faster and avoid acquiring the KVM MMU lock unnecessarily
when the VMM introduces a disallowed VMA for an MTE-enabled guest.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9265a7fc43f7..cc6b35efcee5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1870,18 +1870,21 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 	if (fault->exec_fault)
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
-	if (fault->s2_force_noncacheable) {
-		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
-			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
-		else
-			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
-	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
+	if (fault->s2_force_noncacheable)
+		fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
+			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
+	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		fault->prot |= KVM_PGTABLE_PROT_X;
-	}
 
 	if (fault->nested)
 		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
 
+	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
+		/* Check the VMM hasn't introduced a new disallowed VMA */
+		if (!fault->mte_allowed)
+			return -EFAULT;
+	}
+
 	return 0;
 }
 
@@ -1918,15 +1921,8 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 		}
 	}
 
-	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
-		/* Check the VMM hasn't introduced a new disallowed VMA */
-		if (fault->mte_allowed) {
-			sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
-		} else {
-			ret = -EFAULT;
-			goto out_unlock;
-		}
-	}
+	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-- 
2.53.0.473.g4a7958ca14-goog


