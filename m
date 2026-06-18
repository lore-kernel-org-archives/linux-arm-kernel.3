Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04CCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6i1EBve8VgH9NFCJHV43H1GJ8AEaTDJcQZdwOxP7rs=; b=dmOfk3Tj2wuQRZgfdqCfYDhCw9
	CrnF7TtL6cmWfaE7y0f39Tif4IjU5xnr+ObaUZa+ohy6a/uhN4XldeV2GF49Z/GdWyhg28ndy+kGK
	lygt99d/0bN93vEnl2J9h8nQV6+jNsrW1KR5+BVb/Zo1KBdmXdZgKqy+D0nanN/F8dq8SSkaLWX6Q
	NhAsyH4w7YBLVWqW4W0eeFsXUsYyGJBEFRajw0Vbo3QI8JJChTc+nqYsHu4FhOk9M9e6BjAsFm7K6
	bnZn5ZO1F41ucfsOfHuWZ1mxsncUpogunw6QRhzBB9dpfsi1ifVT5OoSgc10fCNQ+rKkYQ+XwVHUJ
	9KTF5cAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8d0-00000000tDY-430F;
	Thu, 18 Jun 2026 09:01:38 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8cw-00000000tBT-15L1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:01:35 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4625b4f54c6so622862f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781773291; x=1782378091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6i1EBve8VgH9NFCJHV43H1GJ8AEaTDJcQZdwOxP7rs=;
        b=jFV4iwf0vMjKdVpL9epkEDQLtePQGn6aylpOrqqW8vVd+5aAVJGeV2fTQISkIyrUZ7
         /zEiRBQR0sDfLSN6pwP2leRVfm4UDc1xtshzLTdXzBM3F+U8dKYE02btxbhxWCwoYPEz
         dOrSjuGK25qlI4m1aEHBrTztmh2usYweV92/mvYjxsoWCdpMsl0D6krfuyrelx2bNs5o
         hGT+YbwEqKRVrfYXtkzybL1UJR7+RMBmZuAHkkaC4/E9TQRVRnHjPWlQQr6oRumpnZjK
         aJuH4zEtLcqT+f54WjD3Bwg2PM2y5mrriQQCLWYqHyF0iwdBX2njONqUvv0uBx7vdWck
         mwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773291; x=1782378091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6i1EBve8VgH9NFCJHV43H1GJ8AEaTDJcQZdwOxP7rs=;
        b=QNpjQ0zNEews3DyRYDDeDDab64rnsgXdSUoDjO74+e4c2/VY/UqfFyEOlqa2VZyQwl
         h2oelutKqUBJWAB+sRRNTNMkkTQd/zmB86r2jAfIi9JaRaYZTXe69rszluTvrkTt3xn6
         LbhkIUBKwpMR/nEyLT7LDkOZV6iMQuDxqnXyYOShWJEAQxUGeCWYF9ZARC+Dh2mqUobx
         NcYlzGsYDfFbEWyeHRZfgYd95KRsu50y4Z920Qg9tlg4URzIBF8oDugdw7k6UzaaDt9p
         i5hSxYLB3KtHSVZYlEXmpC/Wb1JB/JuIkKg2RB5IGUpiepk2AGUsQ53+7bBCoIbNImGT
         ctdA==
X-Forwarded-Encrypted: i=1; AFNElJ/T02sjfpPgEGGbX+GH3bTdtBJ44Ou+e1gE0sNWaiMe931+IFReVxJecf9n2tUyJx0qFGLjz72jdIjxR4S4fJaH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo3dmM4ByD9nm8nKRp5vOD1/nsnRNgNXDSWiTbJbf2ZBTFbJvt
	UYS0NHkja7t4FSkfNvssm7rq5JnnwEd6+aFm3bdQdY5YQxdJM0HUmJORluD+AmvlRjzfH4HMyRF
	byA==
X-Received: from wrsg17.prod.google.com ([2002:a5d:46d1:0:b0:45e:f3ae:e713])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f488:0:b0:45e:ea65:d329
 with SMTP id ffacd0b85a97d-4623627634dmr9439000f8f.7.1781773291246; Thu, 18
 Jun 2026 02:01:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:01:26 +0100
In-Reply-To: <20260618090128.3913688-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618090128.3913688-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618090128.3913688-2-tabba@google.com>
Subject: [PATCH 1/3] KVM: arm64: Drop the unused EL2-side is_created write
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Keir Fraser <keirf@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_020134_302192_4B3CC9AC 
X-CRM114-Status: GOOD (  10.59  )
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

init_pkvm_hyp_vm() sets is_created on the EL2-private VM struct, but the
hypervisor never reads it: pkvm_hyp_vm_is_created() and every other
consumer operate on the host's struct kvm, a distinct allocation from
the EL2-private copy. The field is write-only at EL2.

Remove the store; host-side is_created tracking is unaffected.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index eb1c10120f9f..30dd4b2afc26 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -433,7 +433,6 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->host_kvm = host_kvm;
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
-	hyp_vm->kvm.arch.pkvm.is_created = true;
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 
-- 
2.54.0.1189.g8c84645362-goog


