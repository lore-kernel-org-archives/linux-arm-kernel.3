Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7133FC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUYw+bKmtZMKiUuqmTKklNQo1kdVyC2ASm9zrjeaODY=; b=4pmslr2AhJvpBb7DWx2RXbQwP6
	6ZQlpyJ+lf99PDRrqcswv6Nb+9nmTzpoXEPkHOBmhT9TGo4J1e4M/QdhdruD6CoXMu/XxQpwFIWPP
	fBW68Yc1GoEx4vWVGECxZSg/4b1mmvHOTmyRwHZYPu3goihQc+tZyLXzYXKAHqrmD1uK/P95bxQyp
	nYrQ9FR9h27Fz3Xo/nu8SV//sC+UGRhb1y2S+RNnLY1FcyUq5lmPLqcDkk9/CYS1R/xpU0eCu8Q86
	o/MBXOB/cxx//aqaYZbr1/qSxIFYkPzYEQTUdb9pJAPc7iJ9yajGcL30UWCS7gISI21MenMl0SNrL
	SRivfHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WO-000000028D7-48Y2;
	Wed, 26 Aug 2026 09:02:13 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WH-0000000289u-3brK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:07 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1547321a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734924; x=1788339724; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUYw+bKmtZMKiUuqmTKklNQo1kdVyC2ASm9zrjeaODY=;
        b=W9RvKf8v99U3qNsI8Fwwg0mg9NOvGcJGQxWns7AhOnFuhalB9dju6HUMQTQ4TEzogW
         +fNBq4BlgKpnfu0pmFcwpetrED2NpM9aKqPj65qkSUcJ8M877EAotEgZ5UT+UK6LvHh3
         7wCwOD290CLYi7DGHmDjdlUmEnFir7K1gtGtls4CdFL9ZRNmzLwiovXHj7ulEeCCgDDd
         WEFLq6LMnMlzbeqloutTo5EqnIjfMbKMl31HyK4SyURDUBMP4c2gH13vyLA97AuJpPsk
         WrPmrvhq8fLadrA8+dWWIdDakbgkPhYvMePRZ/SqgIkZFpGCRJyiEZsNSjFiorjdEfBj
         oStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734924; x=1788339724;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUYw+bKmtZMKiUuqmTKklNQo1kdVyC2ASm9zrjeaODY=;
        b=CO5FatSEkR5C1lCT5tfQ+wF+IAM8H65TO6Vl22Ed7sfD9X5DJbmoaKsZGEW5AlFXJV
         82VfGsnmDgnCr9ZnlvxU5IZD4op9wag9Kiy8e/vxCG9Nj+GL/ze6RSumO53GKCKT0cQI
         FOaEuSprkE7W+ZuxxS96Am80I8dOwgPkTzEoWL78QHZ+zkfRobhr89pgkPBrsnFWKnjr
         PkCD3VBxmuq8RhkhUBz0Tshny95FJZVELCpCehxFgmtQqndK3caO3J9Cxuo79TumCo0r
         AxHCcT4svJqcG9r1d9ow/TM6qPgEAx+naQNyZUtaHD59onllYi6otLKG0BPw3DdIe31o
         42pw==
X-Forwarded-Encrypted: i=1; AHgh+RosU8+xXYlAT7VxjUcLdEuyrUUpDjLQ/BqcU82cnuvVrMv2mY/emwMZ1Mba3eO1kacbzZAB7Z9lQUAsZPGRuKZT@lists.infradead.org
X-Gm-Message-State: AFuF++mU7jmZfwQcQ63AonOKcRslvu1xRdb2pktKl2Evc/+yrTMR8H7p
	gaqEPJAQBu3t66TwZhwWOoN8Eb5GnsnSCSqI8hQ+Fj1HakBDPK20P0ej9h11eCJIoeuIlXPwcv8
	pyn/F9AT+hi0RnenO+ixOiv+skg==
X-Received: from plhk3.prod.google.com ([2002:a17:902:d583:b0:2cf:7c8c:cf2c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c83:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-3966d1a48b7mr9860233a91.6.1787734923676;
 Wed, 26 Aug 2026 02:02:03 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:46 +0000
In-Reply-To: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Mime-Version: 1.0
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787734920; l=2054;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=tBQj3Zs/zFgJuqob5UUxqzp8WSGa3DX0/uF2e5leoMQ=; b=nHLIey2i5u9SSFrucSIZdJ1XmfoAN4s5aKHgC3ZELugP1EEPbj+x4Hm6gj03zMVF4F5nca+id
 ZU3e9ubiktdC65mxiZZgRyVvXsoN/yMoCRncYdGQyOWDEy2KAsc3df+
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-no-return-page-v4-1-3bb9c1ddb4e3@google.com>
Subject: [PATCH v4 1/5] KVM: SEV: Treat unassigned RMP entry as benign race on
 PSMASH failure
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020205_905021_321FA637 
X-CRM114-Status: GOOD (  16.91  )
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

When handling an RMP fault, KVM attempts to split a 2MB page via PSMASH.
If PSMASH fails, the only expected return value is FAIL_BADADDR, which does
not distinguish the reason for the bad address. Hence, another RMP entry
lookup is required to determine whether the failure was benign.

Specifically, KVM re-checks the RMP entry to determine if another CPU raced
and already smashed the entry into 4KB pages.

A concurrent operation (such as guest_memfd truncation or hole punching)
can also race and transition the page to shared, removing the page from the
RMP table and causing PSMASH to fail. This can happen even if the page is
still referenced by KVM, because guest_memfd reclaim transitions the RMP
entry to shared when the folio is removed from the page cache.

Treat an unassigned RMP entry as an expected race when re-checking after a
failed PSMASH, and skip logging an error warning.

Fixes: c63cf135cc99 ("KVM: SEV: Add support to handle RMP nested page faults")
Reviewed-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723f1f412..e198469eb074c 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5090,10 +5090,11 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 		/*
 		 * Look it up again. If it's 4K now then the PSMASH may have
 		 * raced with another process and the issue has already resolved
-		 * itself.
+		 * itself. If it's not assigned, then this must have raced with
+		 * another process that made this page shared.
 		 */
 		if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
-		    assigned && rmp_level == PG_LEVEL_4K)
+		    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
 			goto out;
 
 		pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",

-- 
2.55.0.887.g758fc8c411-goog


