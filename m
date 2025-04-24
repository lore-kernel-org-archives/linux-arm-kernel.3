Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S74NKpGFaVYOESsCH+rK4kh5DkFdas6Gq4YwtRp9OLI=; b=WUQhHmdJrqjZhwvK5JylXU0cvR
	yTgfon0S5WQ0wHFEaqMKea4U2RJUyAfkXRx0iW5pCnucIHHf1hzR6Chg8sJeqrG8byGVuQ7ZNq5sE
	bqSlOich4v5jJPbUrIaGfKpo24SGRTBRwDFlbP/FQAzIFHx8NlBAWoSV5QwtOA01RUGD7HQNvHJEX
	YN2tvNLD6MjT7f0rTDPA0gv41K4aRb4Wj307Zu6tG9jOoNxnlAvCVw8QHqcrKmbHei8gGQ8Z4NlMS
	pv+B12sPFrOpjZq8E7HiSze3iPG4c2tfqqRpvUynFzZXM4W1U+48RXtv8wYgcQT10zaaDyi98T01p
	C3HsjVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z59-0000000Ed27-0K3G;
	Thu, 24 Apr 2025 16:05:47 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKu-0000000EKfC-1q2t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:57 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so7789685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504034; x=1746108834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S74NKpGFaVYOESsCH+rK4kh5DkFdas6Gq4YwtRp9OLI=;
        b=VJQ0aR7HuTz8PG7jUpKlV1MIXmC++jtqba29jci/xfztNRTgQ2swfomxRMKlsmvJYD
         oTQqfgbGp7WMuospxiZRFBxgrEYknRPNtmdloxwlyJXSspzlR6IXpVMOWSb1h7Plp/5z
         M3Pme5CEYyS6GvKWgsyvO07YICTR8kdGFMhfRBYeI28poyrtUc1DfL4CqUC1uoiqJY7J
         j6xb8GLWvL4LdxOOPvtBe+L9rGWYxRDpw2Xe+AetaPTwoGyfSKVejmKfve79MOx09Klr
         2mlO+z9C7dSvo0VQSGni5Cd3GJy9Vd4IMN/lzy2NTc6FFHwKv2jt8iDzGgZ6Q3f92TpQ
         UNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504034; x=1746108834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S74NKpGFaVYOESsCH+rK4kh5DkFdas6Gq4YwtRp9OLI=;
        b=n0nLOakQe0fPW8nGNAql/FLOn6cizVp9vxSyi+El1fuqeH9zeeMm9Wj688etKw/Vl2
         hfGfHb5B7gC35/wMtieo7R++VWq8RYRr2cog1RkcMBjRmh5m7cJTLehjrZzq4NfAUox9
         HajobgCbPbyTGfNEhbVyXYXfJ2N0HaJVeUQJguZrx9whxULYFm9hEBxCE6KEZeoRFLWr
         /mB/bLc8ogTxnCzVZHd4ky1xGukrzEI1+whsqRBUZ3gms/jlTOSBSCHtz2dEsHwaZBJC
         7+RU6uYauf2OJ3u0mUgjpxeNDltD4SABJ4IKKir2jTNqU3Kf5pHS7E0+PNfhbH25Xz/p
         Cksg==
X-Forwarded-Encrypted: i=1; AJvYcCUhbr5UEbhwyCdZDI30n6QdkajVg3DMJoE/EdkRntRO/PpqL+MYfVXWudvYixrYc0BiFXqhqQyxuSyWO+upAJf6@lists.infradead.org
X-Gm-Message-State: AOJu0YyxY5Zu5W15S2sXoEXGQlGktPhCfqc+BHqQuMk7wTmlFXyF+uYn
	NXlH/aBfpjunOEFC0bkgCnD76dCCMYmppZzfcN1I5RaCqU0sc6VA8LV7EQrcrlU=
X-Gm-Gg: ASbGnctUYtlKs6/ZKxyFsBn38hs7Ubxm9ywrhm8P8wzZgUXSZc33q3c0cIZXqeym3ud
	rl1VBQDTSSrdXCZqrNBSxXSDBe41izg/69iHA/5iC3Z/0mou/0SrOGaJj6Q04cm5pTZgrg7XCZi
	O7BoHeZMbMWKi0REqUwseqMO0aea+FyX0YUBOvngvgrN2O6mUZpgMp00MaPey5j319ZoKKD6Mn7
	AMD1yN9J5or6BlPx4fGYUj7+98qv5UcNfrBK9K167oEcJSAa3nAv6/fE6oFGCtin68RYRjYZvKx
	EZpvAXSFXCsHINPhN98XMsj9rDHM/m+A5CTZZOnjwgSfY0fdJsRohycEahvXBLqJX5cg1Ojmsq8
	Egj19IC8yGh7nw9Va
X-Google-Smtp-Source: AGHT+IHx9bXGbc/XwzdBX2sEvhGOWsNMsxK7elP9ZHfuoFqJa71fFuvenAr2zCrjXuMcvE5wd1GoWA==
X-Received: by 2002:a05:6000:290d:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a06cfa9d47mr2143588f8f.54.1745504034133;
        Thu, 24 Apr 2025 07:13:54 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:53 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 07/34] KVM: gunyah: Pin guest memory
Date: Thu, 24 Apr 2025 15:13:14 +0100
Message-Id: <20250424141341.841734-8-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071356_473981_6C7B7794 
X-CRM114-Status: GOOD (  20.51  )
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

Qualcomm's Gunyah hypervisor allows to implement protected VMs, in which
private memory given to the guest is no more accessible to the host (an
access violation will be raised if the host tries to read/write that
memory).

In the context of protected VMs (aka confidential computing), the consensus
to manage this memory is via guest_memfd. We would like this port to be
be based on guest_memfd. However, for this RFC, the port allocates
anonymous pages, which are subject to migration and swap out. That will
trigger a violation if the memory is private, which is the case for most
of the guest's main memory.

Since the memory is allocated and given to the guest for possibly an
unbounded amount of time, we longterm pin the pages to prevent the
kernel from touching and possibly swapping or migrating those pages.

In upcoming versions of this port, we intend to move to guest_memfd.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/gunyah.c           | 68 ++++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index efbfe31d262d..9c8e173fc9c1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -229,6 +229,9 @@ struct kvm_s2_mmu {
 };
 
 struct kvm_arch_memory_slot {
+#ifdef CONFIG_GUNYAH
+	struct page **pages;
+#endif
 };
 
 /**
diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 0095610166ad..9c37ab20d7e2 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -660,11 +660,47 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 {
 }
 
-void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   struct kvm_memory_slot *old,
-				   const struct kvm_memory_slot *new,
-				   enum kvm_mr_change change)
+static int gunyah_pin_user_memory(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
+	unsigned int gup_flags = FOLL_WRITE | FOLL_LONGTERM;
+	unsigned long start = memslot->userspace_addr;
+	struct vm_area_struct *vma;
+	struct page **pages;
+	int ret;
+
+	if (!memslot->npages)
+		return 0;
+
+	/* It needs to be a valid VMA-backed region */
+	mmap_read_lock(current->mm);
+	vma = find_vma(current->mm, start);
+	if (!vma || start < vma->vm_start) {
+		mmap_read_unlock(current->mm);
+		return 0;
+	}
+	if (!(vma->vm_flags & VM_READ) || !(vma->vm_flags & VM_WRITE)) {
+		mmap_read_unlock(current->mm);
+		return 0;
+	}
+	mmap_read_unlock(current->mm);
+
+	pages = kvcalloc(memslot->npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	ret = pin_user_pages_fast(start, memslot->npages, gup_flags, pages);
+	if (ret < 0) {
+		goto err;
+	} else if (ret != memslot->npages) {
+		ret = -EIO;
+		goto err;
+	} else {
+		memslot->arch.pages = pages;
+		return 0;
+	}
+err:
+	kvfree(pages);
+	return ret;
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
@@ -672,11 +708,33 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	return 0;
+	int ret;
+
+	switch (change) {
+	case KVM_MR_CREATE:
+		ret = gunyah_pin_user_memory(kvm, new);
+		break;
+	default:
+		return 0;
+	}
+	return ret;
+}
+
+void kvm_arch_commit_memory_region(struct kvm *kvm,
+				   struct kvm_memory_slot *old,
+				   const struct kvm_memory_slot *new,
+				   enum kvm_mr_change change)
+{
 }
 
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (!slot->arch.pages)
+		return;
+
+	unpin_user_pages(slot->arch.pages, slot->npages);
+
+	kvfree(slot->arch.pages);
 }
 
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
-- 
2.39.5


