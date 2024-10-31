Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD2ED767FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETPLCcFOzsbm2EUKzHQHpjrgkvcCKJmMREUbmAxMcBE=; b=jnU/2H/5/UDWbgM1yJil4jpkSB
	esmPCOsiQ3qsGhlMCPpNAZfAphQae5qn3fBPPmhrC671hWFnIDuTFoJCXZYa2Q49wVlTDOv336T6u
	wtIHSIJxcE+Z40XiJXGz8niNq2ckmrjje8JlK7u+xjTrIyfXiWmXJMZX2KD4CfIe4xsGPHzbmg5F8
	rt2sUuLuYGQfAiATRtMI/ldKJRByAOvAluaiQvoBtBk7qcX5Zify0Ner6xMIbBsXECDOG4YAQ4NJH
	lxieKKhZMKsi8uJbdBVjazfqHndIdPSY8yVNefiR21DIkRhVRcstvsUV05OdqINo29nMjPgO3EQxJ
	xYMUN7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bKE-00000004iel-1nBV;
	Thu, 31 Oct 2024 19:59:22 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bHh-00000004hxQ-0GfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:56:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730404601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETPLCcFOzsbm2EUKzHQHpjrgkvcCKJmMREUbmAxMcBE=;
	b=h0t050BkX3ihCZkm0W74a9hiZ/GkSTBi0EHcfzhpLzK/YJ1qkNFIaHnidJggXPZ2y98CAz
	+QQQDV/z0K/cRFxB7iB9bC6zDRytorf1X/deRUGQClrGZKcG0MYC3n8M5EgSFI74RzFDRA
	pJ2n8dZlCe24+bCRU88+I4G0KVC9jJs=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	kvm@vger.kernel.org,
	syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH v2] KVM: arm64: Get rid of userspace_irqchip_in_use
Date: Thu, 31 Oct 2024 19:56:28 +0000
Message-ID: <173040458509.3411583.4399376120814266828.b4-ty@linux.dev>
In-Reply-To: <20241028234533.942542-1-rananta@google.com>
References: <20241028234533.942542-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_125645_428704_0D2CE191 
X-CRM114-Status: UNSURE (   5.57  )
X-CRM114-Notice: Please train this message.
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

On Mon, 28 Oct 2024 23:45:33 +0000, Raghavendra Rao Ananta wrote:
> Improper use of userspace_irqchip_in_use led to syzbot hitting the
> following WARN_ON() in kvm_timer_update_irq():
> 
> WARNING: CPU: 0 PID: 3281 at arch/arm64/kvm/arch_timer.c:459
> kvm_timer_update_irq+0x21c/0x394
> Call trace:
>   kvm_timer_update_irq+0x21c/0x394 arch/arm64/kvm/arch_timer.c:459
>   kvm_timer_vcpu_reset+0x158/0x684 arch/arm64/kvm/arch_timer.c:968
>   kvm_reset_vcpu+0x3b4/0x560 arch/arm64/kvm/reset.c:264
>   kvm_vcpu_set_target arch/arm64/kvm/arm.c:1553 [inline]
>   kvm_arch_vcpu_ioctl_vcpu_init arch/arm64/kvm/arm.c:1573 [inline]
>   kvm_arch_vcpu_ioctl+0x112c/0x1b3c arch/arm64/kvm/arm.c:1695
>   kvm_vcpu_ioctl+0x4ec/0xf74 virt/kvm/kvm_main.c:4658
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:907 [inline]
>   __se_sys_ioctl fs/ioctl.c:893 [inline]
>   __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
>   el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>   el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> [...]

Applied to kvmarm/next, thanks!

[1/1] KVM: arm64: Get rid of userspace_irqchip_in_use
      https://git.kernel.org/kvmarm/kvmarm/c/e571ebcff926

--
Best,
Oliver

