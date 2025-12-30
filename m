Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB25EE01F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aempC3xup8zdxs82u0niExWKRbrEWWiY7rS3u4Pr19E=; b=git7Y/ClGE1caFMi3PXWnicF11
	nH1V8Uw9w8gN2u0T9ePCsn/WqyJcsNOJgM6LJudoYGAZubVIKOP7Dq2hvoqalfpUlGxt5n98jlvQZ
	7sOFxEJGRj1JVSwqtww9d0TLx/iLypPto0EmfRuBLUCsJ0ex4AhoP+qw0l0P4E/IbDVq4rZg0TFgS
	fQaaAf9sJtLIiB7OWtZHqN8bJo6bA10aiUG2DmUICWGMebmKejbZ5uYlPrqmoyFhtACGrwS6Fg1Wp
	OElRHbvtj4dqY4P0crLLfHtjQp3J01LnEvPrUMlwF6XB+h8AVkGwUYF17uG/A9uZfdThRBsR0liwF
	j7/DW0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikK-00000005O7V-0hQR;
	Tue, 30 Dec 2025 23:03:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijG-00000005MpW-2qtS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:17 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso22057110a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135733; x=1767740533; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aempC3xup8zdxs82u0niExWKRbrEWWiY7rS3u4Pr19E=;
        b=0fVwd2bSCyS3sK/07diUcztZ9/s72/hjbhfXmYZ524w3YGTSpuC7AT2NQC10f4AOdn
         YsMzt/+kqNOxKlHA5lWe+O4M1tLJOWh0F0MucBk2SP+YroIhd1uMgDIsfnBwl3qLpseO
         hCV2qMcyQsehYHK69zUp2uJq/X+eEtnXu4HTE86hOoBXFvRBUKmhXqOIAwmwD7DL2TTm
         NgGnOgrE+mQDWHFKlux5Dkf2qQsyHKrS0o4t5T6EiN8ROgRkNYJBetDdx/uwd01+V8y6
         OBp6Cxb9vLj5ocWbkAD+zgIFLfFao+4/6MxLWQdeNVBnYlcLEUIiNXnt9yRac670ak8h
         buXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135733; x=1767740533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aempC3xup8zdxs82u0niExWKRbrEWWiY7rS3u4Pr19E=;
        b=njRC+5SqyARmJyPR+14p2uaOX2rffQrt83/FsBQyq6XNKFh+kxBTNV1l9DmRkbPvO3
         x+oz0uGmC/K/tNZpmRMVxw5UoDjeSViLWd1qgyEWZ0pKUqdb3lTEIUwUflQk2tusnGCR
         07e249mwBgj1TLSnTkzpd8TnMTl48feI+dJ9IJi5zq+8nlCDsY1XrQ5tUjibCj1543C2
         7Ao6zsJvejDbh7PupyhUFbrEYwEVOON+CJTBPwNrGLy/LTXLJ/ofMmFFlIK4bUufm1em
         mfvKHSeX0Uc5GRJLnT8Wod1oXfLc8yevpX5KqO0rFFm872rWgDYWktLdg7cZJCsOJzSF
         nxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe9GThx/JV9xNTyT+dmz/pkdR/Lhqrtbrv/soifkkPpdV5DtMGoYdJ8OFXr3qzJiOer3QS6OlsWGBR01OrjUPR@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5HD6V6Z1ZRT3DIG7sUV4MFUnFzkE0BzrybD8T1OAAiySXMYZ
	kdEVIptrm+O+Z1flWTkDw5zSBqEhIlpHxUl9TAZwpt4pdAHQMeLser6Y9BFeDfX+6Jjyx30ZMl3
	ElI5itQ==
X-Google-Smtp-Source: AGHT+IF1//ZF8YQZFDW338R6CLvvv/Jhm6bfFusPZNwPuigVsAoIaoiYhFuoR4zT4Z2vqbXSCzOrQaND/Kk=
X-Received: from pjbpm1.prod.google.com ([2002:a17:90b:3c41:b0:34a:b3a0:78b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:34c:94f0:fc09
 with SMTP id 98e67ed59e1d1-34e92139d60mr28142377a91.10.1767135733534; Tue, 30
 Dec 2025 15:02:13 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:41 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-13-seanjc@google.com>
Subject: [PATCH v4 12/21] KVM: selftests: Add a stage-2 MMU instance to kvm_vm
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150214_788060_F81284B7 
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a stage-2 MMU instance so that architectures that support nested
virtualization (more specifically, nested stage-2 page tables) can create
and track stage-2 page tables for running L2 guests.  Plumb the structure
into common code to avoid cyclical dependencies, and to provide some line
of sight to having common APIs for creating stage-2 mappings.

As a bonus, putting the member in common code justifies using stage2_mmu
instead of tdp_mmu for x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c1497515fa6a..371d55e0366e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -116,7 +116,12 @@ struct kvm_vm {
 	uint32_t dirty_ring_size;
 	uint64_t gpa_tag_mask;
 
+	/*
+	 * "mmu" is the guest's stage-1, with a short name because the vast
+	 * majority of tests only care about the stage-1 MMU.
+	 */
 	struct kvm_mmu mmu;
+	struct kvm_mmu stage2_mmu;
 
 	struct kvm_vm_arch arch;
 
-- 
2.52.0.351.gbe84eed79e-goog


