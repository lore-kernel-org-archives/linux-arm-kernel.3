Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318F3C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwmzaJ2YawJZB/O6hrcBLYDYP6+Ln0uIsTfu/SId0gY=; b=oL3UwzJdaHTOegdPy33Owkqirb
	PkyCGFmIGvu0MeonW0nnOdelLTOcvSK6Sy/61TpSkPLrQLP2lvCAJZxT8r1wcxevAS10xinm14laD
	cTskdsw5k4NSvm3et0bDj4V0YM7JxkFzC1ggyv3rSTOPZVm+Kq18VpDA7kynp8Z9jiJ6/zDAiY/99
	ajuc1Zh+kEsK5NK0HXYiZMERcb2waCcds79bG/hAHWXplAIKG5naqi88avWup9JMrcvsFeet2RPvk
	u0opsMbVd5dum8uCZWrf855tFWKrqq/Lz45m1MeUVyUx/mtw+gIp5sjup5fJndvMaJ8qi+5DQcsMY
	FBx2+z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct8-00000009Be2-30c2;
	Sat, 08 Aug 2026 08:58:42 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct2-00000009BaM-1uM6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:58:37 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-492488f8583so2807665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786179514; x=1786784314; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwmzaJ2YawJZB/O6hrcBLYDYP6+Ln0uIsTfu/SId0gY=;
        b=Fna5H7e3UvBKLjSFVrWYzThZ+nb4Omm7YwTnSsJ31XJUlh3zQ5mh5T5qcJXxlaj0ix
         TelHGgYcDsNWPtwYZg9bUwzXxuaU7GUpJD0FVOFuHcgztt5ZfWp34iPb8kpo+t9QMMyI
         uiR2MLDaxLNLpwhh7grNgf4ASU0v0PIYT+t4DiQzxUedZDjVFXUEWc65jEsiVngGvJfq
         V0x+9L720Jr9xvfaLAUwN0zuwioLw1MVXK5XbMO/3aMl7w6wire7ymLoS09l2srdGntg
         CbLU3Y/gQ5K4FM3btq2xkei8XnntZMPrDFtnHJhiR4DpTQDztQKCfuu6h9qmzlhWJ8z7
         hbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179514; x=1786784314;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwmzaJ2YawJZB/O6hrcBLYDYP6+Ln0uIsTfu/SId0gY=;
        b=WgIAvfHuZqaagPg4Vqkk3LivsHEpFsN666zSzTqLgnBNECJwC1bKX3xBwW4hZ9CSl1
         31Vd63ZM0e2wG7gmgBV2oe7wX3ZAJeCSkNw5Uu3lly9W6fEyNwcJxzbZ3fd+NLR/93hQ
         S88U47iRqSlEbZ4BxkbmMS38JsE//GNAyi0BcsXyM4WAwDD0O8tgwWkzKKEUS0DueiQl
         cVKpPjlzdatF6E1zq9DI/qKSEvHtW30gqTOtoDgQ4r9QwrICnFWsrFRcUDr0trRNw3aj
         epxP642D90/3Tr/mggU6lgAEvGzWWUDQamihJNW4nZR7RZhTDpjBFj89pf+hp5oCyJul
         oNAw==
X-Forwarded-Encrypted: i=1; AHgh+RpcsWxACsqkDWaScTToLT+m7HgTcPOW1uRmqkYM/oMQ+lHPiFms7cT0q5AoK5LZ1BGTNvpnrR6GvPkGJExRpkC9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3k9Xm3KhT1Yz/DfgI8BFdmUEwpKdF00yx7fD7zRkJnKbAwJqT
	l8LcV6ZsOxExpH6+OcMl3/OiwZaDCoU0uto53Y1axrkb7VIFnf0BBPLnfe2LRuada9MWR+lrMC0
	u6JmWWjUzOOyWBQ==
X-Received: from wmdd13.prod.google.com ([2002:a05:600c:a20d:b0:493:b301:e269])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:620e:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4994e70a6f5mr464694635e9.2.1786179514030;
 Sat, 08 Aug 2026 01:58:34 -0700 (PDT)
Date: Sat,  8 Aug 2026 08:58:24 +0000
In-Reply-To: <20260808085824.732659-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260808085824.732659-4-smostafa@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com, Mostafa Saleh <smostafa@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015836_513026_82123BF8 
X-CRM114-Status: GOOD (  14.50  )
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

When running on a setup affected with broken CNTVOFF_EL2
(has_broken_cntvoff())

Booting with VHE or protected mode(nvhe) (id_aa64mmfr1.vh=0
and arm64_sw.hvhe=0) works fine.

However launching a protected VM with protected hvhe mode panics the
guest kernel:

[    0.000000] Internal error: Oops - Undefined instruction: 0000000000000000 [#1]  SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc3-g05f75bd71e0e-dirty #29 PREEMPT
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 000003c5 (nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : arch_timer_shutdown_virt+0x4/0x1c
[    0.000000] lr : arch_timer_starting_cpu+0x1c4/0x2d4
[    0.000000] sp : ffffa6bd9a193c00
[    0.000000] x29: ffffa6bd9a193c20 x28: ffffa6bd9a1bcf88 x27: 0000000000000000
[    0.000000] x26: ffff00001be70dd8 x25: ffffa6bd99d85000 x24: ffffa6bd99d85ee4
[    0.000000] x23: ffffa6bd99d85000 x22: ffffa6bd9a1499c0 x21: ffffa6bd9a1ab900
[    0.000000] x20: 00ffffffffffffff x19: ffff00001be8b600 x18: 000000000000028c
[    0.000000] x17: 00000000510f0010 x16: 00000000510f0010 x15: 00000000500f0000
[    0.000000] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000018
[    0.000000] x11: ffffa6bd9a8ac000 x10: 0000000000f0000f x9 : ffffffffffffffff
[    0.000000] x8 : ffffa6bd98822e18 x7 : 0070752d65746174 x6 : 00111ff76e007261
[    0.000000] x5 : ffffa6bd9ad68078 x4 : 0000000000000000 x3 : ffffa6bd98822a0c
[    0.000000] x2 : 0000000000000073 x1 : 0000000000000001 x0 : ffff00001be8b600
[    0.000000] Call trace:
[    0.000000]  arch_timer_shutdown_virt+0x4/0x1c (P)
[    0.000000]  cpuhp_invoke_callback+0x11c/0x280
[    0.000000]  cpuhp_issue_call+0x1e8/0x224
[    0.000000]  __cpuhp_setup_state_cpuslocked+0x1d8/0x2b8
[    0.000000]  __cpuhp_setup_state+0x50/0x74
[    0.000000]  arch_timer_register+0xc0/0x148
[    0.000000]  arch_timer_of_init+0x148/0x170
[    0.000000]  timer_probe+0x74/0x124
[    0.000000]  time_init+0x18/0x58
[    0.000000]  start_kernel+0x1c0/0x3ac
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] Code: c80b7d2a 35ffffab 17ffffeb d503245f (d53be328)

The workaround avoids setting non-zero CNTVOFF_EL2 and trapping the
virtual counter to emulate the offset.
In the VHE path (timer_set_traps()), traps are only enabled when the
guest actually has a non-zero virtual timer offset.
However, __timer_enable_traps() in hyp/nvhe/timer-sr.c unconditionally
set CNTHCTL_EL1TVT and CNTHCTL_EL1TVCT whenever has_broken_cntvoff()
was true.

Which causes 2 issues:
1) Protected VMs: kvm_handle_pvm_sysreg() does not find "cntv_ctl_el0"
in pvm_sys_reg_descs and injects undefined instruction exceptions.

2) non-protected guests are trapped all the time even with offset of
zero.

Fix this by adding a check in __timer_enable_traps() similar to the one in
timer_set_traps()

Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/timer-sr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index 51b4f5010b66..993065716913 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -61,9 +61,9 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 
 	/*
 	 * Trap the virtual counter/timer if we have a broken cntvoff
-	 * implementation.
+	 * implementation and non zero offset as in timer_set_traps()
 	 */
-	if (has_broken_cntvoff())
+	if (has_broken_cntvoff() && timer_get_offset(vcpu_vtimer(vcpu)))
 		set |= CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;
 
 	sysreg_clear_set(cnthctl_el2, clr, set);
-- 
2.55.0.654.g21b8a5bc05-goog


