Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzYeQ19SvsGHPOnRphF4Uobk/zE+UGMKVRi+nf13iRw=; b=3NTdBfdxEN7eepece/j/3QKyNy
	FJVJGEd5A0Kcrnnbmg0CZw9CNWymVdtnsbCVTrDK4MdHAIMq/EvjHlBHO1ZcYT3PGyKXxZbLLHP/4
	gARnESAeWUH7hOouakbUHEgkybbE6xOPKp0KtkNeFYGjNM7Vx8nhJ78lLgpQsPQ0RPQxqhTU7By1n
	YPIMB3b1wMSKntetHuCRTW30SS/TvylKdYsRvMtyD9b1LMP1dUMoBX2+bnic2lfHs+CFh/PQUojsh
	PJTWcjRU49jzihY6NJa4Fdgj1FrONawAmydys0ajhScz64LKlJcRDnYT8Rzn6WtUJ0iY54h5yZQFO
	l9fI14Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtZb-00000000HDF-0fKG;
	Tue, 29 Jul 2025 23:17:31 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEV-00000000DmG-0VoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:44 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5959787a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829742; x=1754434542; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jzYeQ19SvsGHPOnRphF4Uobk/zE+UGMKVRi+nf13iRw=;
        b=2rBvxBaswarPgqJDV4gDga00jymETSjRxMKYB70yjYnvBgqzeJuzuzwGwN0nsdblsw
         47tGSdPocGJghj7FHN2eVj5pQWRwCtvmXvBZZjLouMVqGRUsZIwB0cn9vwBtlXs5EeSs
         UyJYhbsW5sUESDTjkf4c5oFJJwv9Grsx0N3o6jrjvU5DI5/Zf+xmgCILukD4c5AWfjA7
         BH0QwAVnU2gQcQ0k/nl6nfrc68DT4pzPsKAFLKuIMoR34/1ebxID3+jUBEqBiiu8mSJ1
         PQCtHgxLk3/aHI2dt1/TLCZD3MWwc/9EMdCoEPsQmKFLEceoLwzdwxHyxBqGknEioH1W
         Gujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829742; x=1754434542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzYeQ19SvsGHPOnRphF4Uobk/zE+UGMKVRi+nf13iRw=;
        b=ehorqKO6k8J71gaTHAqNE8mRLQWUMtW5eQ2cA5ZBfGlydo7xhshDMoXnGRNZArCdFv
         /uwEmSyeIpegao1ZWJqaYvtm5EoAvTKLFr9VZXPdS6NCAlkNRHkWaeETZPkzMZdjpIxx
         0pmAiySBhggOeGh3tgNbIKeQn2nzcwPS/pbC0t/t2FZxnKZcTCTwz5F9HD2NGol2Iv9N
         If7lehU1YFnFyCzEl60lwgalZoPmKOBUwVvrM6G9Vw418ttA3bF8xM7UPn2hpVMFzKnZ
         FaxaAqz4KfKZUFzDC1/ciKV8cCYK0SK662efyqj3PQxih4YPPAnAKkhvxy5t/PsC2icF
         3PDg==
X-Forwarded-Encrypted: i=1; AJvYcCXW0fQF1k6R689wl6I9gLqVb4+NwwKtQh4BqR1InqteVwi3pWG0/Xop87FlNRAxvIb0IRT4WBK4bPIMm+mJrGSb@lists.infradead.org
X-Gm-Message-State: AOJu0YzPtrwuo+F/iBUk66biQlLzTMs49RmDmrcwmp6s2fHi19kAEAW8
	3wc+zZh67etUjaKaXAjjCa+EVgruYAHUm7Z12rzgRhgta8UmkNu2VUOYccp9Vo3xo79LmszfDp2
	kiK7nCA==
X-Google-Smtp-Source: AGHT+IFn2WAK9ukizMY0dgeyzampJaEckC2xblRT2k3Bk2uKavbOCAt+9mg9yLDOobFQoDGRUwGnRmEVCVE=
X-Received: from pjoa9.prod.google.com ([2002:a17:90a:8c09:b0:31e:fac4:4723])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc1:b0:31c:36f5:d95
 with SMTP id 98e67ed59e1d1-31f5de2f372mr1596778a91.2.1753829741953; Tue, 29
 Jul 2025 15:55:41 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:38 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-8-seanjc@google.com>
Subject: [PATCH v17 07/24] KVM: Fix comments that refer to slots_lock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155543_167969_3A030517 
X-CRM114-Status: GOOD (  12.45  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fuad Tabba <tabba@google.com>

Fix comments so that they refer to slots_lock instead of slots_locks
(remove trailing s).

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4c5e0a898652..5c25b03d3d50 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -860,7 +860,7 @@ struct kvm {
 	struct notifier_block pm_notifier;
 #endif
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
-	/* Protected by slots_locks (for writes) and RCU (for reads) */
+	/* Protected by slots_lock (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 25a94eed75fd..aa86dfd757db 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -331,7 +331,7 @@ void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * All current use cases for flushing the TLBs for a specific memslot
 	 * are related to dirty logging, and many do the TLB flush out of
 	 * mmu_lock. The interaction between the various operations on memslot
-	 * must be serialized by slots_locks to ensure the TLB flush from one
+	 * must be serialized by slots_lock to ensure the TLB flush from one
 	 * operation is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-- 
2.50.1.552.g942d659e1b-goog


