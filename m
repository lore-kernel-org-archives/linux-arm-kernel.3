Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8411FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdcyBmRiYnupt5usNoa8YsTNzt1V3OCJZIqsaCSd/iY=; b=Ew/KbF0+QQaShzmILKcdQ6R9Jn
	z9Sj+xJFLVuvf05RZ9LPYGdDJM56feCbjLDzP4xy7/yC7PeqnP1e8VH1vdT+khzAgFdzdoUdlL0mz
	5V9+CtcVTeaDvTeh1o9J6mpxizu/kmCgoXjZSjfztYaptTQ9U6eSj7ipo4DtKSpPXC4J6Qu8ZudKJ
	s5MJYBI2U18EETgi4+L1h/r0nNz9ugVaGn/rIwinu3D5/qO18iQ6xWXN5BWbibG7yEOqOrYT1Ndws
	SEwIQUUPJnme3T14qEwMiP/RQIk3e3POf8MiEC6GIspoundi+j/qNVWlCsuRHdifrktqdZUrIwuH3
	uYIqMfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFXB-0000000AuKt-0bL0;
	Mon, 16 Dec 2024 18:09:33 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMN-0000000AqyE-48sh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:26 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d40c0c728aso3250982a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371902; x=1734976702; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdcyBmRiYnupt5usNoa8YsTNzt1V3OCJZIqsaCSd/iY=;
        b=f7ejoaiZqhjA8FuDFZfUIh420Xi86gRY8ZyLASs3X3tQYlz10hdbWN/TEXG+G+UM7Q
         0dtGQsG+uK0nlYkrGGg2Rcd0jSD2jxVSMkhmcSwI7Mh9ULNeNRKgWk7P7Lz8nXJ28hRo
         k7SAABiFeq0jemvM/r9nG8UwbI/aNKClLmNbukgKlh9xkor0E3I0sHbGYro0IeXSgBwr
         xgloZAgNm4FOawGUJjGE8n6qLva7rXGgJuHFO8dEu4BVQ1KS0WMmroKAYBFqdxKaByv2
         DVT59UuAyxsfsIwSYF3ILPa7TBW2UT7aGe5ZPngYNry/LxKywJHHS+cJsd+8JEfhwHyD
         v7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371902; x=1734976702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdcyBmRiYnupt5usNoa8YsTNzt1V3OCJZIqsaCSd/iY=;
        b=Tr4vIAp1sEPd58PtDhGXAi5U8LPqV7pe3pMH1GP7trOK1zxeJHM4ioopbApMITfs5q
         dbSpnCR3Ah+FvAYgWv81qXtMa4+rMeHQ9+Sl2mPu1bivN6ECUuGeoWUw/8Yjc2+gBYvR
         crw6nobRWgsy3mxJXqtYL3UeTTWHelJPKIXMqUN8jFM6C4y2hquvHeVCHai3jokd9YdV
         6mu8zcwbv3uRw7pYH25Edxf2wKAQ1C5J9+0cCCeq8LKbZMQZ4u16L1wPddZOjgxIQKDA
         YGxEN0KLjQaJbIUNYXsIfEFugi38hko5nH527f4zbSBSPtzBVlvwE0hfA/DrQ0WcR4XA
         MWgw==
X-Forwarded-Encrypted: i=1; AJvYcCV5fUdWDYA+1XASIOCklV9XKlqUVLvtKN0WCtbAn9ahhS3+EYCP9vFg9Qcc5jT/xd9O02YNnE0oxzClxZ7tWBVA@lists.infradead.org
X-Gm-Message-State: AOJu0YxIiJtEYGtLjXEMjO4uvz/8EmDUBjs1PLWYGhss3gSnP6vuJ11d
	hmbxjfjZwoz7AwOPSULdA9xkkb+Rgfy2y1mTNJByqCphW85j51mv8OTEEVVyi0QM1F8Dg9DhF2T
	QZkGPqw==
X-Google-Smtp-Source: AGHT+IHpcpJq4kyenHoOx1fxav7mIvFDvXklCXubp7lwpwsMau839iNr+DB/Q2jwccyvsQCELDrIix68lHxb
X-Received: from edbfj7.prod.google.com ([2002:a05:6402:2b87:b0:5d3:e71d:9abe])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:254e:b0:5d2:7270:6128
 with SMTP id 4fb4d7f45d1cf-5d63c3dbe25mr31398284a12.25.1734371902351; Mon, 16
 Dec 2024 09:58:22 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:53 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-9-qperret@google.com>
Subject: [PATCH v3 08/18] KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095824_031396_69208F34 
X-CRM114-Status: GOOD (  11.06  )
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

In preparation for accessing pkvm_hyp_vm structures at EL2 in a context
where we can't always expect a vCPU to be loaded (e.g. MMU notifiers),
introduce get/put helpers to get temporary references to hyp VMs from
any context.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 24a9a8330d19..f361d8b91930 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -70,4 +70,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 071993c16de8..d46a02e24e4a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -327,6 +327,26 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+
+	hyp_spin_lock(&vm_table_lock);
+	hyp_vm = get_vm_by_handle(handle);
+	if (hyp_vm)
+		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+
+	return hyp_vm;
+}
+
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
+{
+	hyp_spin_lock(&vm_table_lock);
+	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+}
+
 static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
 {
 	struct kvm *kvm = &hyp_vm->kvm;
-- 
2.47.1.613.gc27f4b7a9f-goog


