Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A9CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioxZ9+DNy86koGENgFZw7NoVqbAVt0aWywoB+DgYjJQ=; b=fbhWGhj2vtfV+3Y5soKxxG2kNK
	1BXJNkmcfWS1tRcHBlDsdMf+f5TdlH/0M8I6q6g+IFr1N+Z1MhLu/ezqamCWn+aOm6BmUyaS5Q+uZ
	JLGr1FyqSyOOg9iAs/umLjJnlqFB+cGB35XSTpJ7DhWUrqOZNGxAC6ioTjti6a+7EFPbAq7QaxJMc
	X+2DIKsDRKOMfxI4M5uDL7M0zdbIM9/UyU1/lHjuilj7lyzaY7B/Mw30/bqd0V3AvNOz/OFXcZTDY
	ASUpoPkxeNbzrXL+w2fngWCZyfiRuUEVLMHlm0Wvu3pYKtqhobepDzw/TKofo5X4ZkH7vqWMN4KjQ
	BiaYZ0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVRu-0000000Boo1-1Xz3;
	Tue, 19 Aug 2025 23:09:02 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFm-0000000BfO3-1hm1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b9e4146aa2so3250070f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640344; x=1756245144; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioxZ9+DNy86koGENgFZw7NoVqbAVt0aWywoB+DgYjJQ=;
        b=dbfsV+jkCDER5paB/oE1nG4er7mA6cesZHx52titdxCh2Hfs664DRle2aYEdG+Efrj
         aGGaB/SEjPX2L7Ejig02Y7PcGaFTJoMwYjYBNteBl26AOaVWJ/+MpNNZ8OlBMM5eZrvT
         ij3NLInj/55ZaN+av12BC2M+bjrkOqgDLnAPzKATu8zJz1DIbqcNxuSoF1AqJhDN243h
         eoWO6KZOQchS4krij8fi1iXmh499Sak4VutveQEkoHNWHNIYzL+onUcQWbHanF1/2X2i
         HucA0/EOZ1Cwje0yYq4uzVKjbq3bX28D3pG6yf1VmWc0YlGclpjjNgAvF9dpz/7TYJLh
         tvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640344; x=1756245144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioxZ9+DNy86koGENgFZw7NoVqbAVt0aWywoB+DgYjJQ=;
        b=nOvWNKn3f4kwom1QJRAhA65PHqEfPVA8NEkSKz1EcPYZkJjpYX12g1s5icGDiCBrGB
         a1/wfBb0mYguUTaRkg0DXWWt0clarAiqC8nh0STwI/PDDGtOsym/ecYHGIu7wJfSjCnH
         fEB/+OAt6M9StKrBMvsiwOSv0fbg7a1vRM0SyjeviiERzD29GQoNvxW9ubJFpmJwh53Z
         tcS8R6pq7xNZCYxsAK0Gk6xxb4rAjp57r5CycexsI/FShD1tDMqCgdx8IaZyj/jwGDRx
         /XbdfRGCvxQhe+wicI2YdcIwYTkoF89l30pzz62+HL1pKj3qiFFgWnugc/hZCMAOgdIo
         89NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJCKmj8fEw0OkhKBxycFAFbIkO1gwXIlcuL/H66U4IFW+lMqDax9NtqI2qS5E+TGDmgByq7Llqr3XtUGLHz1HG@lists.infradead.org
X-Gm-Message-State: AOJu0YyXXw1mJ6zXo88zwgEr3Ze44Ue57QrLMs08n9MgsYsGsDPqxvt/
	vVxgFIRJ5WJeMf/iMNQnWvqmt8y3IL32OGHyb8fPh1hImOGqeX4UGT1d3qWo+AG5InQngehsLOP
	pYupz50gEcTemIQ==
X-Google-Smtp-Source: AGHT+IEHXpWg/f+rEUO60O9qrX4vZsfY84WtfBBV4+NcwjtcLonZ2Ky7JZEiBzijF5XkyOmNGYqUgyc+J4F+Sw==
X-Received: from wmbfa5.prod.google.com ([2002:a05:600c:5185:b0:45a:2855:e836])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:438a:b0:3b7:b3f2:f8c3 with SMTP id ffacd0b85a97d-3c32ecce5bfmr288271f8f.57.1755640344145;
 Tue, 19 Aug 2025 14:52:24 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:29 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-2-smostafa@google.com>
Subject: [PATCH v4 01/28] KVM: arm64: Add a new function to donate memory with prot
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145226_446675_1637B55F 
X-CRM114-Status: GOOD (  11.72  )
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
index 8957734d6183..861e448183fd 100644
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
 
+	WARN_ON(prot & KVM_PGTABLE_PROT_X);
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
2.51.0.rc1.167.g924127e9c0-goog


