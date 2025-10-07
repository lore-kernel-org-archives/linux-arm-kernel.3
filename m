Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E70BCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efPtgGQoMr4oubNxAv1qKprX0Kma5wbATW1PH+6tg30=; b=aUpWafrN1SJgXXWLKvuSe7G7wh
	YBf0klZx23A3cwUVi00/b9njGWTKSU5ho2UCkZ+6Wt7Sh83a5euK/jNPSO/wnzPePDO1TlcShFqnq
	o6G5nw+Hcj68m95T7MLHI8DKteaeGrNi8HwhUPZfUJfn8OVdlWAENUjV7N0zDc+C1cNA3Zun9i0SH
	ut5PZcHInHkOS6xnjsKpZhgI8rQHLw5GGjCUY1re39ya+qOTYEDquzgi6z0EFmsYrJP/qMuLwK5b0
	1dugdOWxuvv+b8hR/suurDfUrx9l3SI1fJ7CKdj/2a00E18wWZGNF2teV3dX47TZORlly13LnGJXU
	WL2jm0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxR-00000002qgR-3qyg;
	Tue, 07 Oct 2025 22:14:57 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxO-00000002qbP-3CKi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso8264559a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875293; x=1760480093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=efPtgGQoMr4oubNxAv1qKprX0Kma5wbATW1PH+6tg30=;
        b=a/2Y7ZaJK+2ziCtF5e2EC43dqELp0it4k4FLzTtnw6chXEwWvXkK7eQoxImCX4nax5
         ofbxcWWgIq83iIQNPuT1OeDCanbqJnd+edq/dZa7yowdBA7GpxVDMvo3xOZqBHxo3pi5
         Wmzwusu1QCB4ekeinYiP1TeS6RC0AMI2H+MBkg2rtzCJiBnXnCtA8CPwmvys+adqwdCh
         FSVtAQW3TNmfI2unPy2LqZ/vcDsyHmfevBHLhchya8QIqkOHbwtvyWCJ5mm9n6whAqZe
         z0oMsKET2QSgIKu921FKQ5ovrhvBYWyu6OhvPfumIcwfei6qgH4psEsiIsZKfK5xI4OF
         Pjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875293; x=1760480093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efPtgGQoMr4oubNxAv1qKprX0Kma5wbATW1PH+6tg30=;
        b=Bt0qn/Zo8Kcy5fSX0S2stsx5cgn1shBCPEhKnoGfC0qQQqtRqNEY3v0uAf+p9S0Ik5
         vjPGPC1PomuLdIRza0JhktWwpT0gRb3lrL4LohKZuNzNJ96FxN3EdMKWE4BANOKCSTRb
         LwpTdgBuuUBJsiwZSPni3y+PKmeGTxHmSX9fgVx/e1ZcP7x1YJoLX9Sm3sAWvi1DnXRT
         wkS7Nk+bfwkPzx0zjq42eXdCK6RVQid2Kt9cdXL1dqWSwSuqCc91Qr7wvsXOsp3haND5
         g68GWCGS5pLFCrVkRh/QZWnRvo+l0yQU8ov2twEdVHeht28YeHykc8mWzwjqkUckaNNv
         OIvg==
X-Gm-Message-State: AOJu0YxOQE9hfPItMZUJo/ukCGdNOxNaTRcN2RENClSGu9Kb6XthdjDJ
	1FcK3uN4TQkuFqErqgJyk9rwOzR9cMCy/4FWMeCMa9ECDnIiuu4zGUCPPwq43AJbdNVRHJLtxq+
	eBU3E+Q==
X-Google-Smtp-Source: AGHT+IFTaBPktlqVR37VqVA9cZzZZ/8OTio3uAd9mQ94N7kdyxx902DDy6/7iqhCbZbcOwfgNKOb2jtvL6Q=
X-Received: from pjbsn6.prod.google.com ([2002:a17:90b:2e86:b0:32b:61c4:e48b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1806:b0:32d:db5b:7636
 with SMTP id 98e67ed59e1d1-33b513cdaf5mr1179313a91.27.1759875293062; Tue, 07
 Oct 2025 15:14:53 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:17 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-10-seanjc@google.com>
Subject: [PATCH v12 09/12] KVM: selftests: Use proper uAPI headers to pick up
 mempolicy.h definitions
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151454_817451_53E635FA 
X-CRM114-Status: GOOD (  14.20  )
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

Include mempolicy.h in KVM's numaif.h to pick up the kernel-provided NUMA
definitions, and drop selftests' definitions, which are _mostly_
equivalent.  The syscall numbers in particular are subtly x86_64-specific,
i.e. will cause problems if/when numaif.h is used outsize of x86.

Opportunistically clean up the file comment and make the syscall wrappers
static inline so that including the header multiple times won't lead to
weirdness (currently numaif.h is included by exactly one header).

Fixes: 346b59f220a2 ("KVM: selftests: Add missing header file needed by xAPIC IPI tests")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/numaif.h | 32 +-------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/numaif.h b/tools/testing/selftests/kvm/include/numaif.h
index aaa4ac174890..1554003c40a1 100644
--- a/tools/testing/selftests/kvm/include/numaif.h
+++ b/tools/testing/selftests/kvm/include/numaif.h
@@ -1,14 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tools/testing/selftests/kvm/include/numaif.h
- *
- * Copyright (C) 2020, Google LLC.
- *
- * This work is licensed under the terms of the GNU GPL, version 2.
- *
- * Header file that provides access to NUMA API functions not explicitly
- * exported to user space.
- */
+/* Copyright (C) 2020, Google LLC. */
 
 #ifndef SELFTEST_KVM_NUMAIF_H
 #define SELFTEST_KVM_NUMAIF_H
@@ -37,25 +28,4 @@ KVM_SYSCALL_DEFINE(mbind, 6, void *, addr, unsigned long, size, int, mode,
 		   const unsigned long *, nodemask, unsigned long, maxnode,
 		   unsigned int, flags);
 
-/* Policies */
-#define MPOL_DEFAULT	 0
-#define MPOL_PREFERRED	 1
-#define MPOL_BIND	 2
-#define MPOL_INTERLEAVE	 3
-
-#define MPOL_MAX MPOL_INTERLEAVE
-
-/* Flags for get_mem_policy */
-#define MPOL_F_NODE	    (1<<0)  /* return next il node or node of address */
-				    /* Warning: MPOL_F_NODE is unsupported and
-				     * subject to change. Don't use.
-				     */
-#define MPOL_F_ADDR	    (1<<1)  /* look up vma using address */
-#define MPOL_F_MEMS_ALLOWED (1<<2)  /* query nodes allowed in cpuset */
-
-/* Flags for mbind */
-#define MPOL_MF_STRICT	     (1<<0) /* Verify existing pages in the mapping */
-#define MPOL_MF_MOVE	     (1<<1) /* Move pages owned by this process to conform to mapping */
-#define MPOL_MF_MOVE_ALL     (1<<2) /* Move every page to conform to mapping */
-
 #endif /* SELFTEST_KVM_NUMAIF_H */
-- 
2.51.0.710.ga91ca5db03-goog


