Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D2AC5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3ULsNgYxwRhZwue5bCy+g9EswRkhCGynb1/tmXwwp8=; b=HuU+pWQkUc6RppiGx5Jn+upTsd
	T+BrIpyATCIhZszSxUQqRlNleA7c5wfvqEra5mzvx8r0ldtkcew3MGrmU7ClYd7UquZ+++P4OhdWy
	lcO6cBpoWV3SEzJmUmyyXrPDD5NE6/bXXHjQ1Zo5NClVOYyIqkJDspnKM+CEz5s+EpRoCdbCYq355
	jcBnBcuY7HbMDfIIrSOpNjHQSdqaeig8hT4Lzsyl/M5vcVGKSxJUkRC7E9aRGAAsetjma1t6eYZoq
	INgcUKgdBlk7HYL6l6sL5Yx1j8sFpXkzuVEmjUkE6AeSvitc9EBdzog4/l1UxIDagzWk5hKTJ77O9
	mdasCMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwS-00000007UzP-2tKw;
	Tue, 18 Aug 2026 08:13:04 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwN-00000007Ux5-31fy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:13:00 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbeeaabcadfso5247956a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787040778; x=1787645578; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3ULsNgYxwRhZwue5bCy+g9EswRkhCGynb1/tmXwwp8=;
        b=gCdn8CRPgs8QuKIUttNr034yFcox+arr/WWVLGOOlDrUxh8GV8geK0v480dnZdOnD3
         P7UwULJM3j1dB/Sql+3TsrY7taqo9MJdMDZBTlq6rsuVn3h2XS8q+9Xh8eCbwsWBXdnB
         xHbXrONBxp6CYP7kChaon6tfaSqP+/6XT3LATnhKR9PcGd1nOsX7CK4uyjX0BDM5d9XQ
         h0T2GRSMZgQuZ+NpqCiqA1OczP6EWJn1vt9q+C6IOKLoJz93cga8V4gV/iz6hnseVqIF
         bAwYBeh87Vn/9MkRHdmRol2LW7DiyP88OCCUzACpOP6+H7Aix1IJHTYlcfQJ+0YQL9Xt
         CxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040778; x=1787645578;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3ULsNgYxwRhZwue5bCy+g9EswRkhCGynb1/tmXwwp8=;
        b=mE8blyVxZCg+ymvGWlbxgNRwCKL3/KE4oeMExb457hLkSymBdU4BZ86q73s7cvDvh3
         2UHIQCOy0uHgiNXkgNYWSUN2N8Me1Cqekod4iuZKNlOz7NDPvo1yxU1I56aKmydLEXu7
         vA760bAffY6pbO9aDaoCDOaAC4YDKQi/htjFvR/WhHSaJP2akUhyLQ8v9zL0Cv+LOP9B
         zb6GD2OZcBdoDvJ/8B9+GnNgTPdbnXhMnm8SYnSLFy0QNzzVqL2IS+M7BD3EERBe5f9I
         M4MY5zZWItdwed9do+aSo+UC9nn2akw6BnG3YbPI6qgGl/yBLHSA4yoVAXIReEnHNGS+
         GQJg==
X-Forwarded-Encrypted: i=1; AHgh+RrWxcC8gXhVOW3FGRzSsBxItPMm7bUuglk2b5v+VORdNp2Y+10IhOr4ynp5/XTY1Qo0qbpife/Mhe/ZTqmtfva7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/dgFeXfYvJp8PgvjQXxAdZdapnOdpyTdUq7+OEkXDwhOnRpNg
	hXKr/2ZzdF7SFruJaFGDhqtcNimN91rWHFIdkrN/+489LcAWy7QxmZ417nind/TVfav4UuN6Uex
	pvLbwQZsON+U0p6xpMc+AQIY7xg==
X-Received: from pglf19.prod.google.com ([2002:a63:1013:0:b0:c96:da8a:c09c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:10a:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cc71b7acbamr41629166637.13.1787040777693;
 Tue, 18 Aug 2026 01:12:57 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:12:36 +0000
In-Reply-To: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787040773; l=1697;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=7i6cqBtbFkQctrI98iz0J10uujeLpSmIIWcG5kUAid8=; b=ekVPncMmVUriS84Zt3+p8nRYXWSGEYGwwUVXJK5NXlHtz70OGF8spprSioZ5xfncCfU5EKAue
 7ocjFnw2d/JCgGzlgbUnq1q4Jp4Sgvc0ggqydJcjSIEBFCCyy17BUEN
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v1-2-4f8d939efdbc@google.com>
Subject: [PATCH 2/4] KVM: SEV: Drop page refcount early during RMP fault handling
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_011259_764661_17E00CA2 
X-CRM114-Status: GOOD (  11.45  )
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

When handling an RMP fault, KVM retrieves the PFN for a private GPA from
guest_memfd. The page reference taken during PFN lookup is not needed for
the remainder of the handler, as checking the RMP entry, splitting the
2MB page via PSMASH, and zapping shadow page tables only operate on PFNs.

Drop the page reference immediately after retrieving the PFN instead of
holding it across the entire handler.

A later patch will follow up with completely not returning refcounted pages
from kvm_gmem_get_pfn().

No functional change intended.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b2738362a928b..19c31fa944e34 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5036,12 +5036,13 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 				    gpa);
 		return;
 	}
+	kvm_release_page_unused(page);
 
 	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
 	if (ret || !assigned) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
 				    gpa, pfn, ret);
-		goto out_no_trace;
+		return;
 	}
 
 	/*
@@ -5088,8 +5089,6 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	kvm_zap_gfn_range(kvm, gfn, gfn + PTRS_PER_PMD);
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
-out_no_trace:
-	kvm_release_page_unused(page);
 }
 
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)

-- 
2.55.0.699.gb54405d56f-goog


