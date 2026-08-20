Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1ACC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOtJGHo3/D29WlRaeSux3KPdmxoRq/W1Kkt3/Ky2TK4=; b=gDPo3pYLdzgSda1aXGLf/0mH55
	u08kB7Wyq7aJ/bzIS46F1+A3xEfrDWrb7ZBWK3LN7yvWQxAqW/52Qtz0pxhHubNOQNcFA+cvMv14/
	yLnNSZK0B1vkVReKaQ8b/tweRPBChqOFzKipHNf8CmbfSC4NX3Xzy+CsMsJ7PTU3Pyv/YMx2M+sZA
	KccrlN6D4V2NOmt5bzYEEpPVMOYdG4f1g1G4nQx/RIG3P+lz0YlifJmcFKFEaIqbYXma4goOu26vw
	mPjLFI5UEWMPXu2y3VdCs8XvpPP6eYbqrnU7Z6yPkqDVGPpl6CYjaSfgeIYKuapxDKNfyDSU00bWT
	eNcvvwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFd-0000000CLdO-43Vc;
	Thu, 20 Aug 2026 23:32:50 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFX-0000000CLbC-0QfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:32:44 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84842381150so378036b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268762; x=1787873562; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOtJGHo3/D29WlRaeSux3KPdmxoRq/W1Kkt3/Ky2TK4=;
        b=tyjvqom9IWPzH+7mE5ep57lqtOmwFMt2p1pHG2Jida+l1bpaJS5D25LzmcT8p8vO3y
         nStYdkeDLrUUssxwIBGewqS1HQobjqcNzuP1eKs+fBCXZDacgII7JyxZEIqsF0RZstZO
         D7+WIP/Sw0aCD+Jkn1m2EdHzoSiWbV55g4TADR83Sl84EuQ5mtoYdDL8lmffBw6ldQKC
         fMLLLdN/mcfQujAw9F8LXkZLzPoQyUu4/8v0kma52zXrDInYSUFKNH/ocD7DmP2cDjDM
         B6cA3n2cwz4GoUIV8dSvmUKGYXuPRyyuDR1HAsV25YNwcsWWE/vM7XDQV60C7wZftDwp
         zUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268762; x=1787873562;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOtJGHo3/D29WlRaeSux3KPdmxoRq/W1Kkt3/Ky2TK4=;
        b=SFuhpvxiOlvwO4dKngwRmKKoZ7tLO1NjrY64yXgTs7DQzStVYQ0IPZ1fJ1lJpgmXGw
         71pViy5FneQO3UHpuGZxqYvgptnPOx2e/WNUAbPiddb12XrE/7xdDD7syDV5KT4vaeIV
         Ps0CrFTQoFv5dTtVsTk6RH/FYs+paEhQXywfIVNLnMhjezpd3mk1cMWgonq8Dazw3Rms
         kPlBoGcgow8uqhBOO9jxBXBNXRo3q3mnOwLiOJvvAe+7Vqcc15GwOpJNz/tKkeNCyuK0
         7G8o3Ja8YQ8XERlwy8A/bC3fCsFZKy+61yKi/NEpToOzkgex+KpdzTc76A0QW2jxG6PY
         gHtA==
X-Forwarded-Encrypted: i=1; AHgh+RpKYH067lHrHFitMXCrvmnW7jHDrvjAs6P5uuZjaG3Ez5hlOkhNzXcMKAR1a42y6cN+WHKzDeOHyHQ38xhfzn0/@lists.infradead.org
X-Gm-Message-State: AFuF++kZoQhCbZtXoOS/uxB82CBqVid6f2PeFe7Mvml4FifKAJ2lr2K1
	FZR/ZOr7OL5oxK0tKAtKmA2PNDl+6t8S3ZFNogRd4PwhTYAQCFl55vF4KbItuRPzAfrz8xlB8Ip
	L90ZVQ8mfSsH8WMRJT/6NPYfAAQ==
X-Received: from pgp16-n2.prod.google.com ([2002:a05:6a02:62d0:20b0:c86:5f41:8c94])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:bb91:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-851f9a4b169mr3008115b3a.4.1787268761627;
 Thu, 20 Aug 2026 16:32:41 -0700 (PDT)
Date: Thu, 20 Aug 2026 23:32:34 +0000
In-Reply-To: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
Mime-Version: 1.0
References: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787268758; l=2054;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=mNa+pOHnNs9fqxuQsPFY+ubnJ/wGpTSJgDScv2kh/cw=; b=6jdqB/w2bbq3ZNh0ffVDxVWzMNTWlrX73bzku35jkm0BU43Yrh40zgvuTo6drlCXWWiORe1p+
 oG8cHQn44j5ACK9QKezxII+AIYAkCbRDpSItfDEuBO1ZfxEg/YLwW8A
X-Mailer: b4 0.16.0
Message-ID: <20260820-gmem-no-return-page-v3-1-3bf8f80a7b4d@google.com>
Subject: [PATCH v3 1/4] KVM: SEV: Treat unassigned RMP entry as benign race on
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
X-CRM114-CacheID: sfid-20260820_163243_142387_0E88B04C 
X-CRM114-Status: GOOD (  17.05  )
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
2.55.0.766.g2966f0265a-goog


