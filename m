Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4DCC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRi13urPf1s8iS1Y5TOXOPMfOOng2yoJIcbPobf34Z4=; b=j5zcy5yrSJj1a9KDHzOPxYqJKW
	OVBSttYFAHeS/P+PULsUFnxhxHDAW1GKOWIx5+wMi96pG4o087DZW73cAcUHXjdpnkJ5ABRu+ZqtM
	AX7ZG4Oihr18PrtJSd4DG/pHhIWC1bKlO9O7uzUCGs7b27AB4GumW3fXE2iNUJyEOXn3W192B7/Fk
	CSg4313NPsoDWCQzdmSZQXVZhv2mwb+In6mOZdznSS34QYyK1RL14TGp0l4UnGcGTpGKGVDBbNvEX
	Bb91e2sRPnUSC+DyWCH49HZgYJFZWapY8xopKo1wX3xSxe2z+mwVZtMHCz21ue74jJIdLSCSvqjSW
	sfCOEIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTVX-00000009Pa9-0yxY;
	Wed, 25 Jun 2025 17:01:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPHO-00000008dAM-34Mo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:31:07 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4532ff43376so52439635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854664; x=1751459464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iRi13urPf1s8iS1Y5TOXOPMfOOng2yoJIcbPobf34Z4=;
        b=mBoN/HRyMltsZg1Oz9DpVt5AS2wAacEvqkjWqCFeWVYC5NExevKZWk3gv6ZStRCvkH
         g3hjgktbRsAzwzvFVoNUaMz+HnwkoLJS2onQMMtpIOwW/YfUm9ggA+Bk8gqQRCE+Z764
         xDpNBjgMzD+KRBPqT0yz42faGHUMitQ0iIpbQnQGzDJye1Qvq2v0aQ3oEiMI+urP9dVi
         zJ+b5PbkTsD8dZzZSoBqUqEJdXpY1PTLJoLKxT8rL+W8w9jELKUJrjg1CTqH8Z/CqY//
         SjI7M9k66+T3g/gySANhNGvc36lVFawPNcEH7ikL/X8CPZP958+zSDCdvqoPnGIs99ST
         euaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854664; x=1751459464;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRi13urPf1s8iS1Y5TOXOPMfOOng2yoJIcbPobf34Z4=;
        b=DRcqMbJYEaTGWM5bWuFwSonqFKFXOEN4TukryqhBNM5sZkSSB/+bhdvQckLV0XpKRg
         CGl6DFoaSNRc8XfEC++FotDTHfCgRLzLyqDTmE2KMBVxmNX7f0pJhEwdg40ypk34iUyd
         SbClkifC2ZHlgY5Y2AgFR6cR8H9bId05HeBl4OboR0cHs3LwtlbS9YmM21mALX1F5eCN
         Yo12XX1JIr6nEMCy3PtYZ7iBKoVYvsWszwq0PLOtrgANtjJU4RFtSs31zqr3dswBwIi6
         /MZTt3HzcKRb8ZSNi7xEKdeVflFjSVkMjI3T/iRJ2vsj7l851Qfs8dLiPzjdm9oWdNzQ
         jhPg==
X-Forwarded-Encrypted: i=1; AJvYcCVoqZ2M/HKESv7rumWi6XjlHoYhn/2XdJs65VCkWDNSr2wuKdxjcFK8MQLdt67z49FLKJa6ReO8vC69d2NJJnXX@lists.infradead.org
X-Gm-Message-State: AOJu0YwAKz0GxfOUK7UnVHin3byTCmF19Bw5TzVTdVL+N4GVn69xgcNx
	Agir+ZhoHVs+4ZnUPqjUtfbqzUadIONM/U0kwtMPB/XJJB1sST5wmsRQLmQqzptk8Ll4VFMOuva
	Dfk3nafYenuB96w==
X-Google-Smtp-Source: AGHT+IEwANlGVnDCXGN7hg9uNGMVTxicEuUKtoVCQA9kfAk4equFrtEicPN5MHaP2YqeylAONmjqdnnDHvce6g==
X-Received: from wmqe9.prod.google.com ([2002:a05:600c:4e49:b0:44a:ebc5:9921])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d5:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-45381a9f52bmr26163945e9.6.1750854664293;
 Wed, 25 Jun 2025 05:31:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:30:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625123058.875179-1-smostafa@google.com>
Subject: [PATCH v2] KVM: arm64: Fix error path in init_hyp_mode()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053106_772739_0E08D8C8 
X-CRM114-Status: GOOD (  12.87  )
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

In the unlikely case pKVM failed to allocate carveout, the error path
tries to access NULL ptr when it de-reference the SVE state from the
uninitialized nVHE per-cpu base.

[    1.575420] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    1.576010] pc : teardown_hyp_mode+0xe4/0x180
[    1.576920] lr : teardown_hyp_mode+0xd0/0x180
[    1.577308] sp : ffff8000826fb9d0
[    1.577600] x29: ffff8000826fb9d0 x28: 0000000000000000 x27: ffff80008209b000
[    1.578383] x26: ffff800081dde000 x25: ffff8000820493c0 x24: ffff80008209eb00
[    1.579180] x23: 0000000000000040 x22: 0000000000000001 x21: 0000000000000000
[    1.579881] x20: 0000000000000002 x19: ffff800081d540b8 x18: 0000000000000000
[    1.580544] x17: ffff800081205230 x16: 0000000000000152 x15: 00000000fffffff8
[    1.581183] x14: 0000000000000008 x13: fff00000ff7f6880 x12: 000000000000003e
[    1.581813] x11: 0000000000000002 x10: 00000000000000ff x9 : 0000000000000000
[    1.582503] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 43485e525851ff30
[    1.583140] x5 : fff00000ff6e9030 x4 : fff00000ff6e8f80 x3 : 0000000000000000
[    1.583780] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
[    1.584526] Call trace:
[    1.584945]  teardown_hyp_mode+0xe4/0x180 (P)
[    1.585578]  init_hyp_mode+0x920/0x994
[    1.586005]  kvm_arm_init+0xb4/0x25c
[    1.586387]  do_one_initcall+0xe0/0x258
[    1.586819]  do_initcall_level+0xa0/0xd4
[    1.587224]  do_initcalls+0x54/0x94
[    1.587606]  do_basic_setup+0x1c/0x28
[    1.587998]  kernel_init_freeable+0xc8/0x130
[    1.588409]  kernel_init+0x20/0x1a4
[    1.588768]  ret_from_fork+0x10/0x20
[    1.589568] Code: f875db48 8b1c0109 f100011f 9a8903e8 (f9463100)
[    1.590332] ---[ end trace 0000000000000000 ]---

As Quentin pointed, the order of free is also wrong, we need to free
SVE state first before freeing the per CPU ptrs.

I initially observed this on 6.12, but I could also repro in master.

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2:
- Address Quentin comments.
---
 arch/arm64/kvm/arm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..6bdf79bc5d95 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2346,7 +2346,9 @@ static void __init teardown_hyp_mode(void)
 	free_hyp_pgds();
 	for_each_possible_cpu(cpu) {
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
-		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
+
+		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
+			continue;
 
 		if (free_sve) {
 			struct cpu_sve_state *sve_state;
@@ -2354,6 +2356,9 @@ static void __init teardown_hyp_mode(void)
 			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
 			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
 		}
+
+		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
+
 	}
 }
 
-- 
2.50.0.714.g196bf9f422-goog


