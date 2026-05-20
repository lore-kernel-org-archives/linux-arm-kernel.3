Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BDECD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DJX4EJoKniCBYBRiPrwr9iFrJzTWXNPzF+QsbMYmjU=; b=naoUtjtaccAiyefTmb5UzMggGN
	ykCnkoYAty6DUMZc9xp9fHGZPsTq2FTfHnn5hZUBEGoLDjLo+apxMwh+dfAj9SoqHBVV5n9Hz5CiD
	s/VHlMXqAwghhtp3n4cW+4jLNAVJvRRlib2XIHUpJ3FVplyWuqk26V5KWD/k2vyvc2auOQIwiWQTA
	4x9eZ96m9hwIuqadxWawVRmFtTeRJhKJj2eWKq5829uqkpkGJczVZJ6XXLKUL6pY6XYIdUVD88UH0
	SQX4/C89plKeYDCBNnKurZ/JqB4hDWhLidV1HGdZmopDEOUOk20BqY89mF4P07b5v5sktR8J1xpr7
	AqiGoQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipQ-00000004z2Y-1Svf;
	Wed, 20 May 2026 15:27:24 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipK-00000004yzO-1ScI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:19 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67fd8b662ecso5271062a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290836; x=1779895636; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DJX4EJoKniCBYBRiPrwr9iFrJzTWXNPzF+QsbMYmjU=;
        b=Uv43Vqo5nnF8SrDsFVRvMaHKvggSXomMmTe3yo99pJqJ8HCbBT1YNBAWtz82bp5o7w
         3ttsc5MMl1kkECNW6YiSYoZc5XfjPXbrEIKo6/mFViTnYqIsUbGxdihChym2+vzm1h9E
         wVGvMdYc3sUxKv+2szkhfBHAshpWcH8hoK/3UvczhD6lIwnmc1NtOsaoLUTOvbokLuVz
         fPZ9N1/uB3/dJpoKSgGZOSeY8uJD4726i2rw96Yh2SmqJtqczj9qq8aWWvkNAvvkfV/F
         m+4ccEp3ulmsGGJIW3wlwpxUFDk+Ocssx1FNpWZFPv78wSGIPOHsxpfzZg9FearYgs0u
         Qa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290836; x=1779895636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DJX4EJoKniCBYBRiPrwr9iFrJzTWXNPzF+QsbMYmjU=;
        b=JoJaXvZ2mMFXlVd9DKebpT6vQFu718OyGpau2dbhZxlLe3wEmp25LVfImVH7Ne1jNP
         juHNkJaYsrxn0LMdqJkRLQPRUHju/cWxi4Bdi3fMBdauNM0r9jHK7o05n2ZCxoJulQ/6
         TgN/QG6uXCAlPiNTIANmCFDqP1WK5a2Hsd/Ine09tWkFje3QNR+wbjxJcfN0TzoXQB3L
         xCT56aN2sEPmSGz3/WwOLpHGA6gqUBr51YAu8hVsWJfkirsZTcEGB+LqSlUH0r4vONUy
         rXOxnxfDPjqmKFGziOFH5BsVFiHcsB+7QWfY+YEStmvoOWWrwcfBAN9Cb8mgybNWlZ8k
         vSpA==
X-Gm-Message-State: AOJu0YxRi6U+XsfoqUc8huAEWYsCZwMFppHjTHEQsxTWib05yTHmspZW
	+/cG0g+gQCd4msrCWT+d7dAQOSIUZxPkZZOvApImg2n34kf9UxTOwOzmEws2eZBIBhzZt0r3Ogs
	5NZ6P67PqltnbCACMw8AJ9A==
X-Received: from edys23.prod.google.com ([2002:a05:6402:17d7:b0:66f:c143:4ea4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d6cc:0:b0:674:bf55:6f40 with SMTP id 4fb4d7f45d1cf-683bd58a136mr10437148a12.26.1779290836035;
 Wed, 20 May 2026 08:27:16 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:35 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-3-vdonnefort@google.com>
Subject: [PATCH 02/17] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082718_390282_1E4B13CB 
X-CRM114-Status: UNSURE (   7.99  )
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

Add the counterpart to pkvm_create_mappings(), allowing previously
mapped ranges to be removed. This will be useful for the upcoming pKVM
heap allocator to manage its private mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index d3137c16b632..725bb0fb941d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -25,6 +25,7 @@ int hyp_back_vmemmap(phys_addr_t back);
 int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
 int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
+void pkvm_remove_mappings(void *from, void *to);
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 773426a68d2d..ec59da1322a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -146,6 +146,20 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+	WARN_ON(from > to);
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+	hyp_spin_unlock(&pkvm_pgd_lock);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.54.0.631.ge1b05301d1-goog


