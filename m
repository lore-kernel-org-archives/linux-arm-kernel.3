Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C4CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87zE7hbPkSG6fs/NDuOJydVnDYSsz3jHrc+kSNAXNrY=; b=R40lRabbXB6AD4W3ARFuwyMM2g
	THZoU+mkJ99eOqBhF+mGToK82Ml9v4tPalCCW+u8FDglipNpb9esnzyyVgRrH/t0DTGvjvEU346Wb
	lZUbk9axR0Mx3OyylPIAFb5txcFDfNetm9JwOWSn8HJxnYwAAj+wGNCds/9uJM0kRA0LGoK5UiHf5
	kb/LbAq/huD1dMG5sOKa98ncXbrFi7iUm+Xhxl7IaxKzTfXkf+VIWcPMvVD8hCie9IBIKi9noS+/K
	LJYHUy6Qd9qhP0F5xQZ0pPd6L/EOUOJ0vv6xTTh9MPEdLSMIYr35MMrrNtoGWC9D5y9OmvxvUfx5L
	HjzR/IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QAN-0000000FXwP-0Z48;
	Sun, 05 Oct 2025 14:56:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QAL-0000000FXvk-1CZi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 14:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADDED602A4
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A7CC4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759676208;
	bh=Yj4tiE4dTWU4yfDRcYohrrunQ86WlGRjquzJPgYlLoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bM39LkrnNqlprILFdRvaDox5bzxzS2ZLyd4b/WpKjBb7l/K7x+qXirkK+cOJTdNTC
	 3fe+/9CUlhP5Wm73T82uUg5mR0NIGY62ZMS34qPzzXrS1TyFEv4HcORRU4CtVpfRlv
	 E6NqAAjYn1TgPm2f8AKt4WMYL1cpimRHR0gr54ht/BGx0acP0ERt6WgTWITF5Gi3pg
	 SrPnRk8n/TeffzlvYlutXyG5lbRdoZ3dNoB0ot+X4617yvliFCApWnsa615NShxZmH
	 oaQQsVtG3wEId6xmZUXKoYyXKOYpR1PGF7959cR9nIXmU4FjBy/WMbrPncy2YYIkZs
	 EUX238+/UCznw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58af7f8b79dso4347752e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 07:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTsYsCoZWBhoPIev7IpJ6ZF3YU93iVUxQLYRngCzd4tPZRZzm8J5o1y35Jclf3QSmEMWNBBJhov/QqrSnBZR1H@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6u3m15wZqVsvlc9EfN26KON0w+khUIKwaRkO6Tz05cFZ8I4Qf
	m31+pi6HIs3mCpN5qXmcoej/dvY/qhjm8WCmr2a6TagXfZJxeHrZ53GIZ4PpQzzpleY2uLR5/Df
	gw4znV7Ljn+qHreop5JJh7/WsDNzh9Ro=
X-Google-Smtp-Source: AGHT+IHTBpde/4YqplVs3DvfJcUY45IE5HyynZLYjJZCEhLnl34hecKm47NpIOXlv+NwHQkGQNpDfmKYcWNAPQWIcTw=
X-Received: by 2002:a2e:bd13:0:b0:372:a12c:45a5 with SMTP id
 38308e7fff4ca-374c3841062mr34212861fa.33.1759676206685; Sun, 05 Oct 2025
 07:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251003183917.4209-1-will@kernel.org> <aOAZR0-4ZCq78DZ8@willie-the-truck>
In-Reply-To: <aOAZR0-4ZCq78DZ8@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 5 Oct 2025 16:56:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE0v7mtDbOLMmXkmSJVQFcjTPvib1D+MnHSHCfximyixA@mail.gmail.com>
X-Gm-Features: AS18NWCWnxptvHIz8dittp-mT7s9UTTlScpg8LcZAgmaKGO2Z1S4zTcYNuKocPU
Message-ID: <CAMj1kXE0v7mtDbOLMmXkmSJVQFcjTPvib1D+MnHSHCfximyixA@mail.gmail.com>
Subject: Re: [STABLE 5.15.y] [PATCH] KVM: arm64: Fix softirq masking in FPSIMD
 register saving sequence
To: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Kenneth Van Alstyne <kvanals@kvanals.org>, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Oct 2025 at 20:43, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Oct 03, 2025 at 07:39:17PM +0100, Will Deacon wrote:
> > Stable commit 23249dade24e ("KVM: arm64: Fix kernel BUG() due to bad
> > backport of FPSIMD/SVE/SME fix") fixed a kernel BUG() caused by a bad
> > backport of upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally
> > save+flush host FPSIMD/SVE/SME state") by ensuring that softirqs are
> > disabled/enabled across the fpsimd register save operation.
> >
> > Unfortunately, although this fixes the original issue, it can now lead
> > to deadlock when re-enabling softirqs causes pending softirqs to be
> > handled with locks already held:
> >
> >  | BUG: spinlock recursion on CPU#7, CPU 3/KVM/57616
> >  |  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: CPU 3/KVM/57616, .owner_cpu: 7
> >  | CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           O       6.1.152 #1
> >  | Hardware name: SoftIron SoftIron Platform Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
> >  | Call trace:
> >  |  dump_backtrace+0xe4/0x110
> >  |  show_stack+0x20/0x30
> >  |  dump_stack_lvl+0x6c/0x88
> >  |  dump_stack+0x18/0x34
> >  |  spin_dump+0x98/0xac
> >  |  do_raw_spin_lock+0x70/0x128
> >  |  _raw_spin_lock+0x18/0x28
> >  |  raw_spin_rq_lock_nested+0x18/0x28
> >  |  update_blocked_averages+0x70/0x550
> >  |  run_rebalance_domains+0x50/0x70
> >  |  handle_softirqs+0x198/0x328
> >  |  __do_softirq+0x1c/0x28
> >  |  ____do_softirq+0x18/0x28
> >  |  call_on_irq_stack+0x30/0x48
> >  |  do_softirq_own_stack+0x24/0x30
> >  |  do_softirq+0x74/0x90
> >  |  __local_bh_enable_ip+0x64/0x80
> >  |  fpsimd_save_and_flush_cpu_state+0x5c/0x68
> >  |  kvm_arch_vcpu_put_fp+0x4c/0x88
> >  |  kvm_arch_vcpu_put+0x28/0x88
> >  |  kvm_sched_out+0x38/0x58
> >  |  __schedule+0x55c/0x6c8
> >  |  schedule+0x60/0xa8
> >
> > Take a tiny step towards the upstream fix in 9b19700e623f ("arm64:
> > fpsimd: Drop unneeded 'busy' flag") by additionally disabling hardirqs
> > while saving the fpsimd registers.
> >
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Sasha Levin <sashal@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org
>
> Sorry, Greg, I lost a stray '>' here ^^^  and so you didn't end up on CC
> for this one.
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

