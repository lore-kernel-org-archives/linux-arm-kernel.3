Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F084C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCMHUlDguheMk1DR0iSlAWm0OxNkDe+tjgoSc4700VQ=; b=27ewx/hd/tndDTJRp3XBFJq3V1
	qDf/q/ALQEVvae6vGcn/4F1ZN9mAxU/490QuJeC1EBMYi83Y4S1yoOFYRbGegPXXv04ZH3bx4qvN6
	leP0O2s8F7oYrzxkBQKSNajV8EwZty+jilhl4NoVoUW+aQMaax4IBfZDw90t8vpCmTGABUvw/pFny
	rBnAiim8uT62vtPKPLVtUXTvAvsEy+OmH8mehkl/aPiC1V7T7xs69dpdEymIp4qbbvUQbrtpv2odl
	nyi/1ODBdzEvalKNEOdLBdNzMhcLNuDY/EOSApPVzkjHcXPxpDqKyzr9LLu5hqq3xsIvQD8henNeV
	V62wCcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVXL-0000000BlXp-2BLC;
	Thu, 12 Jun 2025 00:11:19 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDi-0000000BWpe-2TEI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:46:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso213756a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682017; x=1750286817; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xCMHUlDguheMk1DR0iSlAWm0OxNkDe+tjgoSc4700VQ=;
        b=j4FUawEIv5ROFs5mlDnm2AwS7+A5D8D5CurT4xQzM1XwnKxfjb9h3JXSMOM0iZzuyB
         kkfWHdwiuLcO+ZBuqD7xV2M1Q/Rf1DvVuV9yZCHHW+vAr7BnGsE23QBqgKPIKrkBuTka
         1jLK5nCqHBjQCNK2hI+j+ZEFMlEi86lSR2ZVQvmzypqsbLtlmCcIKZEJ25ROYDwjv4sc
         6577EdKJl48FhkhcSl3neVHUHRlYNEl/wWoiT1I5ahUh/ut9UB/lzROthLjchBiEXR63
         sK0Hm/ir9BqfMDvCrIV3M91iefY9G+MlosGw0H4DKZSPCB2VDug9NM49DdsJvIAKeLcj
         FuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682017; x=1750286817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCMHUlDguheMk1DR0iSlAWm0OxNkDe+tjgoSc4700VQ=;
        b=wjfuDefhIDBrNITARtWy4W9PvFUUfG/j5VMuwxzb3tj7jazDCOFEKiTWgrWWPJw+WU
         nNHhhpHzcgy8ASG6J4dqcCYPxWY+lLLEDKkVN2ipgOWYg6u8vQ8jfofwGgAFSfpbM7HN
         ocPcVvQFFrp6zmA9z2bDT9YoElcGDN1bS8SeIDHT4bLJhp704CxjIodA5VSZ7lSIfQml
         VLKEkSOXz0rrwu+EStlpFa+RVZvLp+bSqnVoU2bDfo2wsYbUL3xBnhfXnRav0t4m1p1o
         90kt7OhsTaamC58nV55M0HSDl5bLoJaxHrhsiDK22Pvh6EnFfyIyP8jMHt+MchrkD+SU
         22gw==
X-Gm-Message-State: AOJu0YwnVmk6P1Ub9/NoCywFxM+BkEmWLxEApZA1ixDJgdM7/Eof8j/M
	hxWLmzs50DpU54tmxua967+rw5af7Hl7Of+ZZQGpS31zTwOKprZAWtax2a5k6ev5UKniB7ihMcy
	EzLFwdA==
X-Google-Smtp-Source: AGHT+IF9lRdjIaJMGffmVpoig7dkM1EZi9TG7goqvwtOE+A6AKDHS0ehZiZ8FiJ1CPYjTylPsun8hRe7S+Y=
X-Received: from pjbpv3.prod.google.com ([2002:a17:90b:3c83:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d406:b0:2fa:1e56:5d82
 with SMTP id 98e67ed59e1d1-313bfdcc12emr1459552a91.17.1749682017517; Wed, 11
 Jun 2025 15:46:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:04 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-3-seanjc@google.com>
Subject: [PATCH v3 01/62] KVM: arm64: Explicitly treat routing entry type
 changes as changes
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154658_635236_BDCFAB8F 
X-CRM114-Status: GOOD (  11.51  )
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

Explicitly treat type differences as GSI routing changes, as comparing MSI
data between two entries could get a false negative, e.g. if userspace
changed the type but left the type-specific data as-

Note, the same bug was fixed in x86 by commit bcda70c56f3e ("KVM: x86:
Explicitly treat routing entry type changes as changes").

Fixes: 4bf3693d36af ("KVM: arm64: Unmap vLPIs affected by changes to GSI routing information")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9f..38a91bb5d4c7 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2764,7 +2764,8 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
 				  struct kvm_kernel_irq_routing_entry *new)
 {
-	if (new->type != KVM_IRQ_ROUTING_MSI)
+	if (old->type != KVM_IRQ_ROUTING_MSI ||
+	    new->type != KVM_IRQ_ROUTING_MSI)
 		return true;
 
 	return memcmp(&old->msi, &new->msi, sizeof(new->msi));
-- 
2.50.0.rc1.591.g9c95f17f64-goog


