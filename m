Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869BECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CPM66VcrINL92Jo5ORupc7PN6tPDPcidTQjTGXaIkdE=; b=l3ln3KU1MvURq3/uHK2Rf/2DoH
	gIPIWYQYeNPaJsAFYfJnn6REwR+Hw6brUN1deULXfssV3OVSPwTM7RZf9Q6teiw06E3Oh/A2AMNLI
	Wxh2LLGREnuPBIvPn10kp82rywxrBfXet+CmbFx9IFZMeQu/tcYwkvkuQFL769EDTxupqw/+xeROm
	KnRHxGtWfCNBWHzjW+ICZmSoZDUNN3fkfM4cCJylDxr20fhBfXtpLwAgmJesxaHcrTj8g4FegKazY
	4BVE1XDnNwZ3Sx3MG67cmHhd06eJfN0ssb6PwbOF0WxnkmZMzBcEsVqowI25jSbsz07wBaA+ZcANf
	4bypGMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURbQ-0000000DP3z-3V9R;
	Tue, 02 Jun 2026 16:04:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURbO-0000000DP3c-3Gk4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:04:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf02708e8fso41229485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780416265; x=1781021065; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPM66VcrINL92Jo5ORupc7PN6tPDPcidTQjTGXaIkdE=;
        b=YdH73HxeOqLQtwly8Y6rC3UdmKeU9qjzITzfV7ETJ54iI5XhKrsuOhlFwqzw1Lfgjo
         KrO4kv6f3pmRXif5kESGUbqKDAZoXi4UxC9qZdNFOYHJwsj5H9KC12a8+r/qzIdbWHyO
         0jhIsMUMxlUQTNrn63si9eOAkmK0NjGog/Q+XPUz5LjU6dUrIcwvY2Z2Q4+vsx2En+r7
         Xx0R46994/yQpvA3I7yBWqPhn/JwAsGK19om4fAE3hULx7XVJ7r5ixTkE4k8m9emS9E5
         8Kq5GZnmgtIdoSOLVBRlyeUlfq/ps/oyVZHyBn/CIhF6dzLdv9c9x036bTWYUkANTn+K
         7mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780416265; x=1781021065;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPM66VcrINL92Jo5ORupc7PN6tPDPcidTQjTGXaIkdE=;
        b=YFz58TplXV9zBoeljzmeQDVfkcJVE3rrTqp/sI0Dp8pkLeMqbdSrBNSCgNP4+Rd5dg
         iDyhS0i3tjW4fc5mqC4ijj3F42tpDKKqqF9vzdY21VD32MELBglVZo/PqSMj6+7/1YV9
         9jCTEi8JQ4P+tXw3EcHC5cj36HYCI0HcD1KHy6E5vykBfHjiJh7eBG1Yput8K9Hrwkrp
         tK4XKE4s3pxczlVj1gIFUaAsS2HwJggedOAY7KsmmNXaI6du3W07mhCHbhDHbXiFFpa6
         s5ugoQdVUQnoOPpUOcui669/XNStrDabVWFjXV8orfKXd77wCvhCJSSoVvqKTLKlXo2k
         f+eg==
X-Gm-Message-State: AOJu0YzqiDD/tdO0WslFW+ZDMuqis4lisfsR7KkTzQUSEikqBlIuSKwi
	BrYCeF/D3Of7vb1+yZb5kLZLFCi2flcSYPF4jt7n1GDJ5i1sHMkWq82B
X-Gm-Gg: Acq92OGhdFUbjz9g5H0PjJY5uX/wueUAV7Cjk/W+3b9xAHa3QhInAtzG9yG1go9bK6j
	LTR+jOT4iYLxejQIW76HuzdH59BNMQA1WX2eRv7z/ursCAjKx0aCzoTC0XEp5AvrDozT0A+Ia3/
	y/yv5GiV5xRYpl6chhhH9dqPWMslzcl1ISRMQGB2yiI7hBOefbUgRgG9binkSu5ycUpV1/adphy
	7R4xCregPp5Sr/3pxOmv+udLbCKLwLGaJ5R6berb7UPgwDkbA821Mmmw33+ksmK+rontiBw76Bs
	dhsiVMRAhsONNmUDzB++jGuKZ/Wp3buCq/ghUw1SUED6ssXoUKSZdUTfUS7p+d4bwqjpfu7WB0s
	lKVoc/epqraJEaTGjICd551n7MlHt5qeLbQwVse5dL5SoQFqX+CL50m5uzgRb8bqNVDlHdouQYJ
	8IMjE7YZCzxAcAVWWpR+AGLZBnAuEDdiU2e/Yt4hdK5N+/ouwPOk8fhQ==
X-Received: by 2002:a17:903:4b07:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c0b6c7267emr145511365ad.3.1780416265235;
        Tue, 02 Jun 2026 09:04:25 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2381bsm140818235ad.62.2026.06.02.09.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:04:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 01:04:20 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: Take the SRCU lock for page table walks in fault
 injection and AT emulation
Message-ID: <ah7_BAAzHggzdZeI@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_090426_822102_AECF4138 
X-CRM114-Status: GOOD (  13.76  )
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

inject_abt64() rewalks the guest stage-1 page tables via
__kvm_find_s1_desc_level() when injecting an abort for a failed S1PTW, and
__kvm_at_s12() calls kvm_walk_nested_s2() to perform the stage-2
translation. Both walks reference kvm->memslots through kvm_read_guest(),
which reads the descriptors, and __kvm_at_swap_desc(), which updates the
access flag, so they must run while holding the kvm->srcu read lock.
__kvm_at_swap_desc() asserts srcu_read_lock_held() on entry, and the other
callers of these walks, handle_at_slow(), kvm_translate_vncr() and
kvm_handle_guest_abort(), take the lock before calling them.

inject_abt64() is reached from the SEA and size fault injection paths,
which run before kvm_handle_guest_abort() takes the lock, and
__kvm_at_s12() does not hold the lock across the stage-2 walk. Take the
kvm->srcu read lock with guard(srcu) in both places so that it is held for
the duration of the walk.

Cc: stable@vger.kernel.org
Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/at.c           | 3 +++
 arch/arm64/kvm/inject_fault.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 9f8f0ae8e86e..eb334a1c2672 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1569,6 +1569,9 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	/* Do the stage-2 translation */
 	ipa = (par & GENMASK_ULL(47, 12)) | (vaddr & GENMASK_ULL(11, 0));
 	out.esr = 0;
+
+	guard(srcu)(&vcpu->kvm->srcu);
+
 	ret = kvm_walk_nested_s2(vcpu, ipa, &out);
 	if (ret < 0)
 		return ret;
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 89982bd3345f..868895ed0930 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -121,6 +121,8 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 		if (hpfar == INVALID_GPA)
 			return;
 
+		guard(srcu)(&vcpu->kvm->srcu);
+
 		ret = __kvm_find_s1_desc_level(vcpu, addr, hpfar, &level);
 		if (ret)
 			return;
-- 
2.43.0


