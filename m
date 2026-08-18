Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC55C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=; b=xsmREYD6Zeazuh8n1xviffyi0v
	nlDqJPajzF/PpRK1h7zSgTt1hz73nXlabnXYewi9N/pA02tsaimxZ64eGcHeLDtelt6aPqqM6/J7u
	xsEsI/99AIJa7BResQWvq7FFq4OXdrWhEodbIOZRQ+JlWOfuai36Jb0gRKTOKlTUTwaRRHVo6RtX8
	tDUbwT7SiJVXZGRdprmAyDUy24K1k+zQEW5MQLcwfy1hNJD4KNTWXyF9RMNkm4FcbmJISUn0aQRNS
	uuOOQOFDfVgD9s4+NwjpGfr5dDenbQLhingry8SMddtIGrdIFT7yN+0Uir3i/HrrQvq8GvNBdoxeM
	WCeYvenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwS-00000007Uz5-2Qa3;
	Tue, 18 Aug 2026 08:13:04 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwL-00000007Uwj-2D0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:12:58 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so3433244a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787040776; x=1787645576; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=;
        b=wQdwM7mQ8HV1t/3Upc9fuYPEyMZugLT0L4o01GyrT0hQI1wAkbYNoygMDGvLBfPfT1
         weEZoZBV5hmMWxO7uaDvnLhaxFV7akbqF2x6LyetWckz+m4lCEILZkqUhn/C6qpXuCK7
         1Yh94DluRPV7w6bgpZ6SFtAxxqei496ERuu4UY+Yg7gUFamhoPOiPsr+bTxOzDB3o72K
         tA51ZJuiACE8DVH9+6Hor8A6cag12k9afgey/fiaIbFo5QBTrkTxJjaC45WGKtYBEYR5
         6URuTwDcJ8H0zYDdAV6k6A91b84fgV5KN+fvztHm6hCGBf0F+k6DIayg8vfww9UhUJGl
         zJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040776; x=1787645576;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=;
        b=Q4y2dsjXvaQDPM7T4oiAHq9YFkWuWBFaoIKrskqXKl6aXroiACZ57X71hlxIEv2N/X
         QRxwyDXWcaV55t4hZ0Sas8JnrF7XjgDZDWMRJnx9bkj1Zx9IpHPllR1pfsBdK7icqpOd
         T09inoCOk+ST8/8tJY3YljWIKrmlqoCIZOIm3iO6SJLyjlGVHdaDrkpf8qgcpTjWy7qh
         vxNEox41rCDW+5zjhqvVJVQjPi3M5SdXM2sxRPqFhPoQ48GFEgDp1KM95/t2N5XApSwk
         Rjg6So//U2ESThIxiRx25YDtnDP5S9dXBWvw2irNXbvDxw0CAAzyCIP2g497WwDrUwIU
         nUng==
X-Forwarded-Encrypted: i=1; AHgh+RpdRZYH4E+9f/ZDq8ZFv3d7CLwuWEyIjVabUCfz+/s0kNgDywcxsPB2IAm1QsdRRQWsk+HwSxOaXqTgdnQYIyN4@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGJn4GeL8MaN+7LIRPJgfmjr/M3QkbYzl1BabwLCYP9MHJXva
	PPvT+JKjXPufeOnzZbjWSeNfri3hvkar9svfd47pwDLRWYldqLdff4g0tOhsyBVDdQQPs4zPVEC
	Xnpvj0bSp2xz3Z1r87SjDP/hHzQ==
X-Received: from pgdh4.prod.google.com ([2002:a05:6a02:5184:b0:c9a:37aa:b17d])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f8b:b0:3cc:4d86:389c with SMTP id adf61e73a8af0-3ccda4b542amr9870906637.13.1787040776115;
 Tue, 18 Aug 2026 01:12:56 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:12:35 +0000
In-Reply-To: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787040773; l=2004;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=M2Ifb8ZR+HwA/H1LGAE2C/jP4eVMt+pmNz86ycTCoCc=; b=NMp2JIOD4jsbFJI/klpvqjQYI52qH+FRAQ3nl2QtSwfyO9la4WUlSpaEfhVwNd0VJlP0lcaCT
 c2/EcIXTH8fCy1k0RKSRKA3SJNRZKxQY4GJqvWPjQUHmryAYp7Y8Bq7
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v1-1-4f8d939efdbc@google.com>
Subject: [PATCH 1/4] KVM: SEV: Treat unassigned RMP entry as benign race on
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
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_011257_571181_9F43B637 
X-CRM114-Status: GOOD (  17.02  )
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
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index fcb41dfde4c02..b2738362a928b 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5074,10 +5074,11 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
2.55.0.699.gb54405d56f-goog


