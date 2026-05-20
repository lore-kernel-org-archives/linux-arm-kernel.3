Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0971CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZONiO+mDswOu3N7D8n6Jxwck2D3vsYCGy5DutX7HM4=; b=ATF9iJBizv1cVL7PNm7ObnYc9f
	hFadUVLg97HwqXZ5P+QSMhL6wwsn1lOtoFbZxGlN2BPlZRQwD5KCsWXi8QolWA7rS11JlBBIstZRD
	V49245c5WlVGc6BJyjROJJ6BwcwX4D/+ukB1lCLd2SQrkyJbiyVkX//yYHKAGSmXSWI8+gF62Biac
	F35xHHpyxCLr037q5M0lutR6103qACsCyaGPZ2gTnO7ZGShtgrpf/C3RgThj7VNVREcJ5dhiwLe3O
	umQB1J5p3cYT1Ug7byP+m2ddgIIM6NBdegVsrUHt3MIPCLNBE7hShKJwmm+DXxrt5+sQguKWuMuOn
	7TFZ+WWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipQ-00000004z2H-12jj;
	Wed, 20 May 2026 15:27:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipJ-00000004yz2-27WG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:18 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44a52d5e572so3768737f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290835; x=1779895635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZONiO+mDswOu3N7D8n6Jxwck2D3vsYCGy5DutX7HM4=;
        b=kF7SW3SGVSFxMTmK0JtVCLJK6BjDSiQJw6rwHfLq/FKDWNoooGhskxXcam8HWK1WAh
         ldjFRWNyApGarO5wis3DSkFQaIQpFXfiHr6ckwIMkJyGRNIJG1BQTKGQzFPYnD4LfVMt
         omqAdSfbeVRQi4KOBYa/Mz7NIIxregJpQpK6c92W2lwmz0YnUWWayu0sPEwEztbn9HWW
         max4tRxxBYoCGUrAglWCBAgn/KuXdnX/jgMp5sZ7aVEB7H3cWZFyDwThlu/s9o46R+Ss
         IT2VmSw8K4a46WD8ljls3InPE0A63hK8JtRg9P8NK1Y6WA82RcCcAow8yH3Y+SNC3VNS
         hxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290835; x=1779895635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZONiO+mDswOu3N7D8n6Jxwck2D3vsYCGy5DutX7HM4=;
        b=cKZzjPYj086ief/P05b+UnsMPdlvn0NEP0bILjj0noyAI7ljI2Fo4MhBtOEhp/mwRM
         waM6HdIlCVEPBWrUZOXb5kgl1+9OGh0gb1BkKmInlrhlEiF3YfQhm8QvYzRBrYCz2RRP
         c0AQYBfguf7BiX4nXKBOLvRbifSq7iUsRt9gKoJRIvfgdu8/5jEqVcKCTsX8K5LMBybY
         6SzCe97P+aOHpk3xHiPyYjNaFy5sXhWutyFrvM6bqfYW7LmNMpfYPv0C/Wnis3/5FiIF
         oKwdz+tINByefS6dCCfVUNDBJUKZxBbtznQK2TYDdHKYfU2fQEOQecIowWF4ylyONhV9
         yQxg==
X-Gm-Message-State: AOJu0YzH1nT5/8ImqLf7vhWa9UdjnjMkZ3Mznh4WYQxxJkH3DdqfK58G
	9bkPhN9pcjwE3fRTrNRIDB9rviIPLzmRsvdiJZ1uE2y6GoTyIw8ASb9mZVuoRrjDlPzu+TZkt+0
	MVggFjUqJdXHuQae4lHN2CA==
X-Received: from wmby19.prod.google.com ([2002:a05:600c:c053:b0:485:3aa2:da59])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8707:b0:48f:fddb:dcd9 with SMTP id 5b1f17b1804b1-48ffddbf75emr298355385e9.27.1779290834936;
 Wed, 20 May 2026 08:27:14 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:34 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-2-vdonnefort@google.com>
Subject: [PATCH 01/17] KVM: arm64: Add __pkvm_private_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082717_549485_AA5C064D 
X-CRM114-Status: UNSURE (   8.24  )
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

Mappings in the pKVM private range are not identity mapped, making the
standard __hyp_pa() unsuitable for translating these addresses.

Introduce __pkvm_private_range_pa() to resolve physical addresses for
this range by walking the hypervisor page-table. This will be useful for
the upcoming pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2..d3137c16b632 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -30,5 +30,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+phys_addr_t __pkvm_private_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..773426a68d2d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -502,3 +502,17 @@ int refill_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages,
 
 	return ret;
 }
+
+phys_addr_t __pkvm_private_range_pa(void *va)
+{
+	kvm_pte_t pte = 0;
+	s8 level;
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, &level));
+	hyp_spin_unlock(&pkvm_pgd_lock);
+
+	WARN_ON(!kvm_pte_valid(pte));
+
+	return kvm_pte_to_phys(pte) + offset_in_page(va);
+}
-- 
2.54.0.631.ge1b05301d1-goog


