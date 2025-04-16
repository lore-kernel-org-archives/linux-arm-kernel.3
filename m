Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51853C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+5woTKLEDxUzA3eOLn0hsAEJ5MJo4JdU/wMD9M47qc=; b=Kc6HDJDWaEYhjrFjEBaxwnQKYp
	niiqnSsLqPpgzs3jBB6/y4U0/mXg1XWaWRjChguXV2I0i6+6YUgwBtiXK2/2Gh9Cet49aslSZAUmX
	kjyUINLE42Yxf/rCT/KJmZzciM6mL5Ud9Bf8NdGPz98kDn8lQYUGs+nXUb3o9c88TiZwCsNKzdulg
	POBnO5pj8nhgw/4a1SdDhjqG+H1p2MZsjYCx7cfmc5wt42zfHM0Qx8/5EKgsWu2NzOS7YUR9LssCr
	Wr6kVTpXTzkZ/6NDH2r7tRP7E5YgPpASG/cKVlua/n7ODjCGSSqB/QhsPG2i4/9x0EqnIdrBFD6aq
	7Z9ozujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55WO-0000000AEBM-46lM;
	Wed, 16 Apr 2025 16:21:56 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fM-0000000A4WM-447W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:27:10 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ab39f65dc10so120341166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817227; x=1745422027; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+5woTKLEDxUzA3eOLn0hsAEJ5MJo4JdU/wMD9M47qc=;
        b=qe+ps0SHoRj75zg5pK4lUl4MvKEhq/sOjSruS5NhcMDA8Gx4P6g8d4zKm5cd73J8ON
         5ZO+USf3J0b8Alh8iWVZEuPaGzUeJO3GAMlsj8VudPhUC6GW0k3BH+X98A7PQmeMPne1
         3NofV6K4hbMrzbzRrPh/zlynF2qKai820A5qx5GX1POCo+JMAwcb3tsRJwndMUbVAHp2
         NSn7cFQuY7xxDdvdjDW4Tqr8L7pEaRsnQlFn4hoF41wEtgIAHqG9H7qzCZps+0Ks8qWz
         htyOv+l5XTjQzj6UCSKHnf90yLOi06cQqhZe/PsWeAeRrsz9nfAytdvh5OXZ8vqWa2My
         Fq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817227; x=1745422027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+5woTKLEDxUzA3eOLn0hsAEJ5MJo4JdU/wMD9M47qc=;
        b=MbSIGv602Z+dRKLP8B3k//rUyWpxIgkd8Q95PaPVn8xF0+QnnflsZx475nxYLxxaZU
         0woVwm0MdTKmGGNBqVkVrUkDRvQOLXbP97+x6U2dXWaXXH0fsmwohaHV6ROGbEeoF2cy
         b5Sv+RQFrXSUtC/Wx7d3tj8kHPjaJsLnbf9YYSvcP7fSpnt9SJN/rLqrblhr2NdlH/oh
         AFuq9PFM7gNXISZJ9lloW5D++gjAWaLt9bTt9PhqJe449S98tMr6V/T2rTvkjpC7UlHk
         j3PdrPDA5NBAJ9j3jTJNizDYNrdt4uHbbhIDlv8bnEtrHqX+zdvpYieFxEu0vVpdvPwa
         Mk/A==
X-Forwarded-Encrypted: i=1; AJvYcCUJHvj/D3EhSt5U3NUjG791AyEm+Vh7M9KXSTHdRqM00QmpUH84cZu3hBPQMyvdeoiIfDJU3J00NGpbBNJZBTLI@lists.infradead.org
X-Gm-Message-State: AOJu0YwV6K5PHg0rUpTgGZS0T+6UjpM8bmWsx8gfiX3IJbDm7HwVFKNi
	4O2S/BAA9k2u246kRP98Hq9hwktOiEv9/tcWmBOINZb6gbKUbUQA0+p3uk0uH0klHHhV++FrnZj
	LpqNLvQ==
X-Google-Smtp-Source: AGHT+IGCybzKX7dX809ygOrq+ajkf80dzTivmVZqG7Y0aKxNYJUDug4w5qsQZIOiGF/fQUZzevVuaJaQC1OG
X-Received: from edqt19.prod.google.com ([2002:aa7:d713:0:b0:5e5:339d:60ab])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:42c5:b0:5eb:cc22:aa00
 with SMTP id 4fb4d7f45d1cf-5f4b748ff90mr1896967a12.19.1744817226898; Wed, 16
 Apr 2025 08:27:06 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:47 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-8-qperret@google.com>
Subject: [PATCH v2 7/7] KVM: arm64: Unconditionally cross check hyp state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082709_004680_658FF088 
X-CRM114-Status: GOOD (  10.13  )
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

Now that the hypervisor's state is stored in the hyp_vmemmap, we no
longer need an expensive page-table walk to read it. This means we can
now afford to cross check the hyp-state during all memory ownership
transitions where the hyp is involved unconditionally, hence avoiding
problems such as [1].

[1] https://lore.kernel.org/kvmarm/20241128154406.602875-1-qperret@google.com/

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 91b757e3fb4c..709d286999a1 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -702,11 +702,9 @@ int __pkvm_host_share_hyp(u64 pfn)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
@@ -762,11 +760,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
@@ -792,11 +788,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
-- 
2.49.0.604.gff1f9ca942-goog


