Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18857CEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gey9r3BX8+q00LlBjzU+MZugMloP0I19eNAirMDKs/Y=; b=hmeubGcvbozPJPpT6GKoax6Uv2
	45NlicnlJcId0kTtmHREn7Y0v4xYaoAN8PligaToqLbInx3xR7YyJsQvaepnRHtHm1vTFS7jWDNmj
	6J5D/hlDbC0K7Ew6ChNMQ7XvJmSSoPb/5LLWNydaWf6eDqsjXdpHt5egLdUUBKqRsO6KIXrm6Qhva
	iCBmPNt6j0tMA3gtDis5FIfXNg9lZoHKMlvpVc6DpCbg5Fvp+qB9iZ0k5tik+LAbPQd+pIutG1tR9
	rWlvt7Ffpei4cbooc6IXYKCFciQAKZJti1d7dEp/7k26rewrHo/agS8WmgVWWg6l/WVcouOgLxZE2
	xBVdCe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4H9-0000000GdPj-2wL7;
	Mon, 17 Nov 2025 18:48:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4H7-0000000GdOM-2pje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47496b3c1dcso61928775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405307; x=1764010107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gey9r3BX8+q00LlBjzU+MZugMloP0I19eNAirMDKs/Y=;
        b=f3rir80f3mTj1Gv3uT82vFNX8YYVEmNchDdRvrHwWXVEMef6FzhOZgjGhvFk6WSlaG
         UM2jA64QQ4TCuu6+gY28hTUyBLQ4W8XNYtZIuefrEhn1Z1VGIG7uXHUhFeQfNFrnqyex
         uyLsa3lSh2N+0Lmqq9Ryfst+G4ea/71R7hFP39nat2s3rIJ5Z+J12m5Ttny1whll2ymm
         JRR9MMSheQdW+sFR+cpeOvaXmUkfEIz5qC7q9/Rvos/B/NLA7BQ382e5SSc1Gi+pC2zw
         HV4c4nhQ+dh97XIUPgCIBOfBH3KnoLHXjG4I2oLcdAckXZz/bsAy+HIjC3yIUf55L51Q
         SlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405307; x=1764010107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gey9r3BX8+q00LlBjzU+MZugMloP0I19eNAirMDKs/Y=;
        b=OmgJAJGwAHvtYyBHt8FcntkvA5K/nsOlmLdh5s83FaV5LNEKZXxdeIDZfeBcWelywB
         id0YtBmNk7HkdmNdJMXoDHMWme+1C1eoxvSVkAmIWRZro4HQrNm+xamEkaLuUEKcxTy5
         DUQCJEFJeHkAZeGoxSqIYcm755juOrJJsywTYTmSCeVPa4ZGzmqyW3F2nQVfbjWIONoh
         dD9I3jo+JGLrlFpYKQ4W6vNQOTyzgnYjg2UkRP8AypJizuFccv15xnr1DSXsRwGZxsBk
         1lERQQOOv089ZzJlIti3iz4Ol/2fNnK9E/XPBtqe4VO/1jdhsu6y4ICY4u7awdn2dCzo
         Ubww==
X-Gm-Message-State: AOJu0Ywg8iadbEfKF4gqo/Nh6E9ZTNE/dDPLZuCE5OmUEJKfZor+UU1z
	BRdqM9fr0NQo5jiFIKL//s3eLY5jEMEnhUHlGr9gsTBvUNonszucfPO8s5bShegwRVik17gZRqt
	mysYhfJdMBmZ3S79ariY8k/VL0FEVr1HmqvqkvdVeJshL14isq6mFYu63OnKuT2h6NWTHVApCH+
	KstPFzO6xjpQrjlgpEf8vAX1XU+PTzD9Q2x2yEJIjZZ6MFZQTkqZNyvj9wiRUe+enHCQ==
X-Google-Smtp-Source: AGHT+IELZ+q3N1lhluRpg0RwaEHfI9/MWh02IHmoZQ//qg9i+LZm5h9SGh+IdmhWZuUmmhd2BHNm41tOgYJ4fA==
X-Received: from wmqt6.prod.google.com ([2002:a05:600c:1986:b0:46e:37d6:c1a6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f93:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-4778fe6654dmr122626225e9.18.1763405307068;
 Mon, 17 Nov 2025 10:48:27 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:48 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-2-smostafa@google.com>
Subject: [PATCH v5 01/27] KVM: arm64: Add a new function to donate memory with prot
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104829_728872_835E4823 
X-CRM114-Status: GOOD (  11.13  )
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

Soon, IOMMU drivers running in the hypervisor might interact with
non-coherent devices, so it needs a mechanism to map memory as
non cacheable.
Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..52d7ee91e18c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ddc8beb55eee..434b1d6aa49e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	return ret;
 }
 
-int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
+int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 size = PAGE_SIZE * nr_pages;
 	void *virt = __hyp_va(phys);
 	int ret;
 
+	WARN_ON((prot & KVM_PGTABLE_PROT_RWX) != KVM_PGTABLE_PROT_RW);
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -787,7 +789,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
 
 unlock:
@@ -797,6 +799,11 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
+{
+	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-- 
2.52.0.rc1.455.g30608eb744-goog


