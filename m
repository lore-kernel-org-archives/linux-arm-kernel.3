Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037FAC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=; b=UO2o2VuP239JkRHDG2jlNy3I8Z
	BouucKHNgzl4HtLYQhrb4Ftv0NlhQR/AA/33QjOSqHpnDiof9jToIzOwacNqW/QNUV4EDmdmaSrgW
	rR43v4cnKxsGqUAOyodHER1wcl9oicxGM3A0ejimGt7lMo9fb7QJI2c7+TwCwmm1nxcnm749JWWkR
	ZNY4E4lSSi8/VD2IwfrE+lzc4sIhCQI10lmYxKhBfRpNyTDv/bGW/SqOTIiMxQPhE66R3qQsQJgPf
	8ewPe7na5gMQHGLcHLub0HR3m4c+fB7iVTSiEUrv4fT9jcRgWHxo+F+GB2AuKgsYVOZcbbhUf1hRF
	Etca+U5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSoh-00000009Fom-35IG;
	Wed, 25 Jun 2025 16:17:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUONb-00000008USM-3pLg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=; b=Q0gM0hbSSW09PTvVopQ9NHUjPc
	sWRRqL1c5lYa9jG3rMDUChbrZRuFJDzeEYGpS7tbGGtPYttdT3/3eoHgqjWaAc+eYK0M0kZVt57jY
	obMIapfjy9fOZzAbcM6adzSA+eaOfrq5o4zNh801ONYGf9t9NceB18+6dNm8Ow8DVbIW/nFDI0HC6
	+uCaqZfKWHUY7xcQ/z5nog3U7qhuu3m6As2uoOddMaDyXptSZwfiRVybXQC+/d8GBKxTHuVNEm9LD
	CibGLvpWySkVTIGbyD5dbMFjQ8UnlS4Wmcu1xssyW3lzTyYi2rb4tbC5bUGah2SSIlP1nXyw80p9A
	s3nc97Fw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUONZ-00000005pYM-0q8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:33:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4532ff43376so52013865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 04:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750851202; x=1751456002; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=;
        b=HhWdYPaR1X0UrFcw+UTiJ94d7IcpFxdKm++dpkcLPdRC7pfR3ykV4jWaHOv1rFKjRY
         tNyz0SsYVFkzIoHvbjOcVoK2OLL+nZ5Q/xADKtEkoiEevfdAEuVS3JVU/xYMD70RMTo+
         Cqy04gymH+6dLp8ogZBYImtglExPfB44k1rDORCWs/ZGxfKbT4U647/EpJjqStm6bhHh
         CsNsTv3Ya2YtPoBtqBgkS5UZ7Ihnz/E8omuOH/Cdd4MImbyUCLtwXdjejSCx1UeiM6Y3
         s5/4ADgqJn6o4fym4YEUzJYnsbB0Bz+LXQyKUbT2lqsrnj+XKZ6Y6wafSj1992O2hQJk
         zIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851202; x=1751456002;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=;
        b=Bh+9b0q0YGhPnUN4sA8S5lOa3u7SXoa18OHbQB4QIXJi6e4Jt44n6NGFv2lQf8Z+ne
         AjJPR3VcRZthF0EKB22TaVthsP2dSPbf3ojT5wops2pCcp8kdoWrSycbPUNh41t9fKGy
         HvrdVshSTlNRac1Yj4cn+5mApfOoRJoozfzS9SCeGsgSE0qownvNYtZutRVKP6bcs12t
         WAUVt0AoGCmKgD8ACzk5qb+qCNVbptofvsxyPpAstetjUT8nb/w/YwpaagnTbr6V+wqJ
         wwrJVwerPXNRGMZuSUqrDPqb7jRMZ9prMrrHoh7xghg1uZeToquxjO9XyZQxRoh+E/1T
         2Nyg==
X-Forwarded-Encrypted: i=1; AJvYcCW9GjcCahQcgE9RWonUn2OPHNCMiCz6MKfMxlu6es/GtjZeTWp4VjDe9g8Nyy+8A4GNsSfL2K0PyZZiOCzVgjGD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYgAP9TvKxPq+Fjw3+qtJgIRvltA0/r9K2+X0Ar7zgAw1S5M1T
	WgKmXmIDbWKGFLVbQSTpYExeROJpswQ+6W4ekx1rJebaCZYe/TsKFPISVp91o8smSNcSsfO6zZD
	B0cTw/W0NlLNuwg==
X-Google-Smtp-Source: AGHT+IFOs0Gi4knoSxkuw3WEzWTeg5pmNz2XOZ2P1IvG2UaOypTfCATZEtKucsPAekJhdqLV//IPLmdoJn1rpQ==
X-Received: from wmbfs5.prod.google.com ([2002:a05:600c:3f85:b0:450:cfda:ece7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674a:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-45381ab25e9mr28886085e9.14.1750851201981;
 Wed, 25 Jun 2025 04:33:21 -0700 (PDT)
Date: Wed, 25 Jun 2025 11:33:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625113301.580253-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_123325_386159_0D342E9C 
X-CRM114-Status: GOOD (  14.97  )
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

It seems also in other cases, it can try to free NULL ptrs, so add the
proper NULL checks in teardown_hyp_mode(), we can skip the loop early
if any of the ptrs is NULL as the order of free matches the order of
initialization.

I initially observed this on 6.12, but I could also repro in master.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/arm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..5bb36c3b06b5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
 	int cpu;
 
 	free_hyp_pgds();
+	/* Order matches the order of initialization init_hyp_mode() */
 	for_each_possible_cpu(cpu) {
+		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
+			continue;
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
+
+		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
+			continue;
 		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
 
 		if (free_sve) {
 			struct cpu_sve_state *sve_state;
 
 			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
-			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
+			if (sve_state)
+				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
 		}
 	}
 }
-- 
2.50.0.714.g196bf9f422-goog


