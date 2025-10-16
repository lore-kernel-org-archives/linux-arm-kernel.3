Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F51CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u4q+H5ARYkVWCNl+U6142GnGsl0yn3w8dvhjLsaut8=; b=IFo9H4vcTFPmlEcivCiAgIh3+U
	cns7CXEOXV+oP9Jl5gDEnbQiNzaL13+9jLw+3OppM323pZZcyadpeshfhmPYxofP0pPGIuSDT56eR
	gda78EXl/ReXwaHz5y/ZS8jP8JTnEs0YiZg/0cmqqgKnxBk8RGll6DzRKCLeG2b4/f0h1FWhNQBn9
	7K7phpjNfzcCjuVT19FoXVqatDnk/1CeZOIfURdx5Y8MT1gJCgoVwhracrxEIWoLPTmjfefMWtFDE
	ileedP9u9JYE3a2u1pjk+JJd6crgDjZCPhlpP8DkqR+NH7GNEO5XyeE/hDuaciBCT6rAL+jAlXvRq
	DxlX47SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoK-00000005Zwb-0MwA;
	Thu, 16 Oct 2025 17:30:44 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro5-00000005ZgI-2xg8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:33 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso1406564a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635825; x=1761240625; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4u4q+H5ARYkVWCNl+U6142GnGsl0yn3w8dvhjLsaut8=;
        b=IPbyMxg9I8A9fApiCFBUA6xiynB9PoPCEGgkk1qpuSn0At6OwLVLIBbnuCSIfjQCZa
         fNi6twA9HUYlRMRBFJsYOfXA5OBemtMBC5Hpd0eOiRLF593ZSX6ailBs6aH71iuBx3hq
         gSo9bcMLdbY5FePnJyg/bEDNhtVlCQfr4br/xSAzPUr1FW8rpMeX5aAP++NiPx3SeyVY
         OSOGpqCgbBQxnDSFrwFx+9xbYYhWMgPepu/IK17RcFD8TQfCbTITJ+dS2ZVYADAPeyUQ
         XFFNT9BA2OyD/nUg1sgmI1+GwxKQmWJQzIf8r859rcYhYEhDn7LzQ6RxQQaICfKdYEnO
         cJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635825; x=1761240625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4u4q+H5ARYkVWCNl+U6142GnGsl0yn3w8dvhjLsaut8=;
        b=RRtHWo11Zl94MGPQmAaWwYXaXoEkzQbtihX2zyIlUqZiMG7beofnPihhm628P+KBrS
         PLeslPhNEDjpjQjuvrKT5nYi4uLVIRIcMmoCPbOku9FVKXlPxlbmi0pn9ZWUlFRlNn9Z
         NCm0qaw8A3o0fFXvFsQe5sJSvUNIx7SXRBw/+dEw1CdO6FTh9xp2kHCfpjkBJm+EjnDW
         UNWa8dm0fP9/YAfXMEETN7EcFLkbOLKUdJtoboULMijPAjpBFzhiq/ZFa9eGnTl7oczO
         8J0/UtFHzn5aP0ddvUTia8cl6JakqnVJUPwkqUY+EummfJNMmBxWZDnk7hyYkEVI6y11
         NG8A==
X-Gm-Message-State: AOJu0YyxhPUlSR+nEVOH1yaHfBIA8m6+nnxjpsxlHIfvnW9d+8GeeBKC
	BCjJBhCwD1Gt5Hp/UBBqtAWKWmn5urUQZP0LkjNUNs6MseujwStbX85YhrX2Yz0fmR3+95jq7O5
	5M38FOw==
X-Google-Smtp-Source: AGHT+IFjz6Aq3RDvBNfXfc7PgYrCrCMU7f2p0qSK1iEGyybs/z37dRTZt+Dzr1VQ+adtly8KdiPZ7TtQHj0=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c88:b0:32e:1b03:6e12
 with SMTP id 98e67ed59e1d1-33bcf88aaa6mr718301a91.13.1760635824646; Thu, 16
 Oct 2025 10:30:24 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:50 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-10-seanjc@google.com>
Subject: [PATCH v13 09/12] KVM: selftests: Use proper uAPI headers to pick up
 mempolicy.h definitions
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103029_838327_F64E6E0E 
X-CRM114-Status: GOOD (  14.38  )
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

Drop the KVM's re-definitions of MPOL_xxx flags in numaif.h as they are
defined by the already-included, kernel-provided mempolicy.h.  The only
reason the duplicate definitions don't cause compiler warnings is because
they are identical, but only on x86-64!  The syscall numbers in particular
are subtly x86_64-specific, i.e. will cause problems if/when numaif.h is
used outsize of x86.

Opportunistically clean up the file comment as the license information is
covered by the SPDX header, the path is superfluous, and as above the
comment about the contents is flat out wrong.

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
2.51.0.858.gf9c4a03a3a-goog


