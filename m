Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9936BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7ohw21peF1wa7DEgIBZtn4bdrDZ/CehDFJ7shfFAF0=; b=gqriRvvZXLarz6v31K6anv8JNu
	4rUh5R/FoMLbkW6tL0NOtadfHuzYm7IyqXQe08n5bANL84Fscw98nCDmn04TPYtC+IARzcBzdddZy
	e4qTyM9qKvtsa1il1tEXQs0hI0NjSJaO9wyp/BSan8LzmU5ezGLP6vcia/J5qku9RJuvckpPyCerL
	uZ1WvMQRZ3BqoCtrDIANmew7zD6Drfe8Fk8hqoFp4fNFIqkG5iI2ELd9AdEKajRyhAimFqs8irnpY
	c42AkxSes9EN7GGc1WOtp0W9IZ1NV2VJn+wx25ks1hE59YEqB61OosAK3CtMjVZ+jr28vWAlXuhrM
	bQ1mVCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ6-0000000BCk9-1A97;
	Tue, 01 Sep 2026 08:09:56 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ3-0000000BChl-37En
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:55 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a18e611c82so4620668a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250191; x=1788854991; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7ohw21peF1wa7DEgIBZtn4bdrDZ/CehDFJ7shfFAF0=;
        b=kob9c+6ex4/Ra1w+yC4+oI6VzZ9pph/Xf2LbB4vLsbKoeTvOhrwXiIpBHdjzTQQuQp
         4+HAve2BOc1bHdQ2htpy5UJMlqZlpssDW+iWR8fjp6S2sN4Qw/FeuC4HystoJXyERGPS
         6cjDA9cXWcdP9k4XCbDmwnEwH38kg3yENGBzKkkNwHm/JgCgHlbMrczUC+a6sWJFYxns
         hvKFLQn+QRxjs/kLDx6tUpBaAEtSmw3JXqmfjFRBJOPgxxrK5Goiww4qMw1YgCx8/0sg
         nw85ogvmd74E8uZKcKV8qAbFjQOU3VEpxhVsRiBcE8/NRLVNvY+iHNpLFWvMJpNHm9Ar
         mhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250191; x=1788854991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7ohw21peF1wa7DEgIBZtn4bdrDZ/CehDFJ7shfFAF0=;
        b=HaFH0Tl4fMO4qXbvIubmGpj474xKgOiOmLwbHNS8Sl7dUwxFa/titfHStpAx1B6lSI
         sDD1DvnT2kKiBetG0jOGhF9w1G1Yma70jF2dhlTjXrwxVywovPcnodPziIo08+tkS0o+
         XUsoZDf07dDt7Cf6ALgq/z8T/Pk7ILYLb6cdPd1dFqTQDvyY2Qnsdvu7B+npNIpyXeRu
         vwjgAymwSNbwcpNh7XBBh/PG08w2ovgJs9osRZe/IrQhbGed6Df6mwgtkHXyjLKbbpZt
         LYboxgpaTbY/X5RffzPBd7DzRIiKUSEUwELSX2jVFi70pHs1z+BGWTE/Z3VdqMvC++zB
         RUyg==
X-Forwarded-Encrypted: i=1; AKwUvBzZmXg0jgYQ9jqYPlm089SVBu4Bzbk38DSNH5TM/5XhoCMRzdMdN5Kjdv++IhJxFkbeRK0q9chmZZm2kUxBPjfY@lists.infradead.org
X-Gm-Message-State: AFuF++lDPJCHhBY3zSe8k6v6RO0ddkZ/DzGSfcxblHCgkqdIAmcQfdyw
	nGpSVbZVQp2AkYlt4FEmbHepexgQuaTG6yMv7gRdd9EwOz5HhIm2BxOYcWic9SoMSmPX5DQlyvg
	q/k96v2gmZnkj+RT9MYK5sw==
X-Received: from edbfd6.prod.google.com ([2002:a05:6402:3886:b0:6a3:facf:9e96])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a6d2:10b0:6a6:1719:3f42 with SMTP id 4fb4d7f45d1cf-6a6171940bcmr12374431a12.6.1788250191164;
 Tue, 01 Sep 2026 01:09:51 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:25 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-3-vdonnefort@google.com>
Subject: [PATCH v5 02/18] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010953_792970_D4AC52CB 
X-CRM114-Status: GOOD (  10.23  )
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

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 85f1e3c711d9..00cadd13ee5d 100644
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
index 755630c0d15e..9ab7f613fa36 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -164,6 +164,24 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+/**
+ * pkvm_remove_mappings - Remove mappings from the hypervisor page-table
+ * @from:	The starting virtual address of the range to remove
+ * @to:		The ending virtual address of the range to remove
+ */
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	WARN_ON(from > to);
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.55.0.897.gb25b4bd76c-goog


