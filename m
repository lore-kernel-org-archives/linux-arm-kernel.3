Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF7C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=; b=wwHdElKpbFV96NnqDDqq8j75ub
	v0zg6BIAYEvvFh+3gvSi5y0RaRnSu8ijkEXY7vfE4fyYogZahlj8Bnv/vmzzTAinRWg9dR0aargYS
	SwhJonQy47mfhqSyCfSX1ZMY0rmbzIZH1IXJm50XPP27Epmac1zLOx+24/sHgw4fOVJYVdbasWWjR
	z61AGSEFkCvEzmuy6mjO7EfVj5ZT/F4I2RGnFrF+sPgjvifSSc0aXE/1IEUOh2aw6kWD9BwecgkLG
	Bu3fl64R2gYAmlJyNRu3kYgIw+uF4i5iNDpCEkTJZJE02agDJKk3QfIrZgL1o1JPmgGk3RhXHg74+
	o98dFjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvT-00000007aEY-0bKj;
	Tue, 18 Aug 2026 09:16:07 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvN-00000007aAv-3oRB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:16:03 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d5d00fd19bso13649925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787044560; x=1787649360; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=;
        b=GMEl03NQeZkCtG7ajPd2TuS7MJRBIb9pWuwBD4NLvzMcj6+jWvhO1EQCjyuDUBxoZ0
         XjXhgQHl6qrmZitHYpCiybCJwLfVLGF5R1AyjRJnBx3/KmJbr4VMI51GfodYks1ZeCJe
         X/JmqRVW3sHBx77INo6fpaBh5GAfpzBr283P90QvCYRukbvB4QW18oWTLKpIdw0tMZ7r
         M9ZsPcaqWpZNZ+Ehawv4B23HjLSwclTQk7zLYuLOpH7tzz9zEB0DsEVqi6zkvXjDfkt0
         9qmrV8s7YlkkO+S6kwcxhbaJ6JiOtWJ32aBSzyI2TM5jruX/l5k9xPVBX96WFri9RN8N
         TVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044560; x=1787649360;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jHUMARs30oMku7rrAHEp5fhgY0hNDCAk+0nqtnlfj0=;
        b=n3nF+YWtcSGy6U1bkm/p1cY9a+HfwI4/6Ntwsvs+cnJj81jkrQ1Ibd9woQ4cbVpkyf
         EUOwNwDisexxsykUXekksv62jC2PiOk0ofextn+jld2CziBmsTWXq8vzlsfeyPfnKPlO
         +itoGu+vDZ28khYrxyvWpXGzZeGt1qCQX5DaRo7+K6pxThWTJ8erIPrjGCS0C9LGbiV6
         VmKFSU6dZsrwNJqAD36ZRqWMfgRHFYKZuz1UjI9lC8RNMLvGFM61ED7Pfa2yjHYa0OwB
         dLdEQWJ0WP+vZ2ZwSiX+vd68GLoA/kJtNr3udS65WS9qvfDt/WQF+/PuFQ3AoxR+VYSc
         60BQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMV3AzpCk3w631rPwCQlajzyC+/5dARtL1YnFs1zzXitoTtBdnPGlSe22BzESJhS2WX5Sl37DwevXbgL9S9Ymj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx2E3FAFpr5rAjP40BGQwiiaE9l6bxL3DcD/X856nBrvTJUb8S
	nUlk2MvKRcapkHITPb9aiVtrh10OtqnWof0SNy2ABt+OCQKBtXkuukEuth4KDdvSq6jtsIuShis
	CWveWkMizPUAcGL+Wlo8VrVTJvA==
X-Received: from plbky6.prod.google.com ([2002:a17:902:f986:b0:2cf:75c1:ab87])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5cd:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d5c4f38113mr76619975ad.7.1787044559821;
 Tue, 18 Aug 2026 02:15:59 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:15:52 +0000
In-Reply-To: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787044557; l=2004;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=M2Ifb8ZR+HwA/H1LGAE2C/jP4eVMt+pmNz86ycTCoCc=; b=j3bFONysasSYdfRKZGzzTAvRwhttD2/ahY+24IAmXMaUu0NHy2Fu2f+igLek2uckCdA21JPeZ
 SpwDdadSI28CzEHJTFEC/85MZAcMO0lcD0WYLfkAzsYZ/YxzsQNemOq
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v2-1-5298f42d49bb@google.com>
Subject: [PATCH v2 1/4] KVM: SEV: Treat unassigned RMP entry as benign race on
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
X-CRM114-CacheID: sfid-20260818_021601_970473_E5A31C4C 
X-CRM114-Status: GOOD (  17.13  )
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


