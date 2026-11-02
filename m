Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6538606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=INTlQS7G;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lokeArN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ij4gPNs0GfjVbJFGWJtRXm0Tew534zu7KtTk34Zsa9o=; b=INTlQS7Gok1JAhmpZxOgY6msPK
	Q7w3mn06SdrChiZrBOE5UFPskioRtORT+ROZikyJHPseOYBSDH7vy42oesAiyv1jfY7tIUWvDVZBy
	EV67+SGsMLvulxNkRrfOMGioCOACSYwd5TksXEMEO+baxb8jMsmwQ89galZJmxOGZTf/KjWCpRzFU
	xpf0Cxx9LqRqzA5eGsrcde2Fzv6skcYHaQw6vG8mMlNaZSsrT40vbvGIk9KIite0AGn7pJcW5Ce89
	L59FdjxmcLLGJVzv5Hz3g9s7sbV4p3e+zbsaoUmdGJc64yl2fZU55ahc91V9AIFVkAkcMKyjU1GfV
	y1QaWpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoe2-0000000G4PE-0IEU;
	Mon, 02 Nov 2026 09:48:02 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNody-0000000G4Jt-2y8z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:48:00 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48dff112181so2531925f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793612876; x=1794217676; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ij4gPNs0GfjVbJFGWJtRXm0Tew534zu7KtTk34Zsa9o=;
        b=lokeArN8v9AoCkPXW6/9rIXdULJaJUNX6+yNFKOLOpAZo4bcuRP/2Iy8Ja/ZkYLdF+
         Nr83p8tE+OCNgOS8CfK5zD/5gW055Gyj/4lAe6BvuvKzGJcVorQnm5b5MwWSJF3RGcob
         z6Ew6SsESu7IvSQ4GHs/6z8IizlqDkntTC1xOugPPpd5PZUPbuTZFym9LSb61gUIC5yJ
         5et9DQ2lGUccHcTkCiHv08Klkulvqr1T2ArXIvOKR59LRAxnn9op2JIR4uT0Be1HLO4w
         VN5b8ujB6EBeew6ZNxuH1MOzdHPtDHV2KpJTp2CXWO4/EjCiE5oImOUAeGerdUp6yi7f
         jAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612876; x=1794217676;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij4gPNs0GfjVbJFGWJtRXm0Tew534zu7KtTk34Zsa9o=;
        b=j4EHIWOnr4ohJKNH6lgA04gpLSl7WOqWoiK32eS5XuMPU28CTom51Hgruss8KNLwQf
         gW0PRH9aDCLDbe9X+RKAWSt3bLOWjbfjL5L/FO6qNhGzRLCwcVyLkLnpsFoOTAmVQVAC
         0htQZE5fWwKIX/AxCiJSheEQ+lw4EALwL//9T/vZK/sDovKH42LDM5i2HdkZWbggKUl3
         N/5H8qTdt2y42A41oXDFB++aZ9dhTI7LDAh8io4in6fzFkyy7iYsPEh9dUWwYKc66NW2
         Bk5/xtvg+zddxFqFp8GMtUdbaZZxm+Hnavu33+DeWEW5p6Yff5b7ew12qMnew6JompCn
         UGdA==
X-Gm-Message-State: APuU4Z99hzrxikPaBhJGgrNcY2bCbBVmN4BRSxKDquDKhb8jOqHqbS9v
	rB1YBF2rad2qi/53MW0MioBdv3sGvbUcyuJ7FJxDf59uS60jyXFunnu2f00IUMaNVSpGpScaEw=
	=
X-Received: from wrtf8.prod.google.com ([2002:a5d:50c8:0:b0:48e:773f:1c7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:310c:b0:48e:5cd4:aa60
 with SMTP id ffacd0b85a97d-48e6e2fbc14mr23004113f8f.42.1793612876088; Mon, 02
 Nov 2026 01:47:56 -0800 (PST)
Date: Mon,  2 Nov 2026 10:47:49 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102094748.2638468-2-ardb+git@google.com>
Subject: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
From: Ard Biesheuvel <ardb+git@google.com>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014758_778882_7037B378 
X-CRM114-Status: GOOD (  22.39  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

When a stage-2 permission fault doesn't report its IPA in HPFAR_EL2,
__get_fault_info() recovers it with an AT S1E1R/S1E1A on FAR_EL2. If that
fails, kvm_hyp_handle_memory_fault() goes straight back to the guest, on
the assumption that the replayed access will either succeed or take a
fault that the slow path can handle.

That assumption doesn't hold when the AT fails because its stage-1 walk
takes a stage-2 fault on one of the guest's page-table pages, while the
guest still holds a cached translation for the faulting VA. The guest
doesn't walk its page tables, so it never takes the S1PTW fault that
would let the slow path fix things up. It takes the same permission fault
again, the AT fails again, and the vCPU livelocks in the world switch.

This was observed on Apple M2, which has no hardware Access flag
management at stage 2, and no DIC, so execute permission is granted
lazily and the first instruction fetch from a page takes a permission
fault. With DAMON_STAT enabled (CONFIG_DAMON_STAT_ENABLED_DEFAULT=y),
kdamond keeps sampling guest memory, and damon_pmdp_mkold() ages a whole
PMD at a time through mmu_notifier_clear_young(). With THP-backed guest
memory, kvm_age_gfn() therefore clears the stage-2 AF of 32MB of guest
pages at once, without TLB invalidation. When that covers both freshly
loaded code and the page-table page that maps it, the first instruction
fetch from that code livelocks, and the vCPU only ever recovers when its
thread happens to be moved to another CPU. In all 52 instrumented
occurrences, the AT reported a stage-2 Access flag fault on a stage-1
table walk (PAR_EL1.{S,PTW} = {1,1}, FST = Access flag fault, level 3),
while an AT S12E1R on the same VA succeeded. With DAMON_STAT disabled,
the AT didn't fail once in 210 boots. Nothing in this is specific to
nested virtualisation, nor to instruction fetches: a write to a
read-only memslot hit it too.

A stage-1 fault can lead to the same livelock. A guest that ages its own
page tables without invalidating the TLB, as MGLRU does through
ptep_test_and_clear_young(), can keep using a cached translation while
the descriptor in memory has its Access flag clear. If such an access
takes a stage-2 permission fault (lazy execute permission, or dirty
logging), the AT reports a stage-1 Access flag fault (PAR_EL1.S = 0),
which the guest never takes either, as it doesn't walk its page tables.
This hasn't been observed, but it is why the invalidation below is done
whenever the AT fails, rather than only when PAR_EL1.PTW reports a
stage-2 fault on the walk. A guest that merely races with its own
page-table updates isn't harmed by it: at worst, it takes a translation
fault that it was allowed to take anyway.

Invalidate this VMID's TLB entries on the local CPU before replaying the
access, so that the guest has to walk its page tables and takes the
fault that the AT ran into: either a stage-2 fault on the page-table
page, with a valid HPFAR_EL2, which the slow path resolves, or a stage-1
fault, which the guest resolves itself. In all instrumented cases, the
next exit was an S1PTW Access flag fault on the page-table page. This
only happens when the AT fails, so the cost is negligible.

With this change, an EL2 UEFI guest that livelocked in 27 out of 210
boots didn't hang once in 420 boots.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>

 arch/arm64/kvm/hyp/include/hyp/switch.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e0c55644224c..4ba61b71d511 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -843,8 +843,21 @@ static inline bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
 static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
 					       u64 *exit_code)
 {
-	if (!__populate_fault_info(vcpu))
+	if (!__populate_fault_info(vcpu)) {
+		/*
+		 * The AT couldn't resolve the IPA, typically because its
+		 * stage-1 walk took a stage-2 fault, such as an Access flag
+		 * fault on an aged page-table page. If the guest still has a
+		 * cached translation for the VA, it won't take that fault
+		 * itself, and would replay the same permission fault forever.
+		 * Drop this VMID's TLB entries on this CPU, so that the replay
+		 * walks the page tables and faults with a valid HPFAR_EL2.
+		 */
+		__tlbi(vmalls12e1);
+		dsb(nsh);
+		isb();
 		return true;
+	}
 
 	return false;
 }
-- 
2.56.0.317.g454f8302e1-goog


