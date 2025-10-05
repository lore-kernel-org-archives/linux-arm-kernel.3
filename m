Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC08CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYidqcEX9U3o7Bztkz8i90HOOyfwJwJtx1hIlUqq8Ww=; b=2Ou+D3r6f8Wwc+Dj4vHbgJqC2R
	yObdLphG4AcLWXDIo7syE95X9+aussKDWgALJz832yqqhLb3mFFLKwcExLYLbXcX2D+2aKj4QrV7W
	Vkwy1yAaPy99oTF0mtSTldPEoGOl9ax59isbcCmFxnliWpykpRrLxySzqpPxu962Xt2zbuxrGRqfa
	QHPPWqkJ2zdHzYoE81gRlLpknqWztqkPlV3SwgYWwFvUEMGPWUU7egnCF4O3X3XAljFWSo/36ZLwc
	I0vx5K+zMLhbcOqJC5KgrRjDs1rUwGtFMsa3eR2gRJ6ucs8nZBbKpZVU7J53q0vr4MNtlrUOH1t/L
	YwxA9eQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QAk-0000000FY4M-2iVZ;
	Sun, 05 Oct 2025 14:57:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5QAi-0000000FY36-1fSQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 14:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D0EE45504
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F687C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759676231;
	bh=OfxBuX2NG6qRYHgT4owtNmha9ytoyldyaEdP+EyW59o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hIHuPo7nD/q6+vT/w6NqUCxbffUHAqbz+zHUQOObboqixR5e07MZnIo2dnIeK7lrR
	 REGdcmTP4HqQrYRyXZ1doZjbTkaKHNFdIESi6j/tK82CYv/7+n3T4vX+3PTrNHUMrj
	 ZfGpSSEcyDOnvKw6ULvk6GhulAvUCZfxueiw6x93KqSXKKb6U9Hc/UD5axNH1FXGYB
	 Z5Bs24H9PYv66JynSqQ/W22oPytOMqLk1usm97IlBtpYtg4WwGH0MvVKlkqH7ALAuT
	 AciCHqcq5xwjfRRoodYba8iVgblVx0DK7nJtFC4Eck60xAy1bIQLeK7iUcUEgc+HX6
	 AKJcyCr0Qww9A==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-373a5376d0bso40402041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 07:57:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6mJ0e/M/ud998NJA/RYL3MY2EXCD0/joIwDjkzKLi1okVkztbYAn6vhRaTKnl8/UodcCvBXTvuMwMSYX8AT2A@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96IvY0+0tJNezF60yKjSNb6qO6MxxBoS/N6IMgoYYQ68UNdVw
	TSDsgFA4ZQSOYqvm2PgAsdYqspRVh0TU7ZrMfr1DdcCg6toFf7ZbfJCQD0l3KLu+QGaR3cH7Gzc
	ZRpD1WI5KtyjsUkbQhagJZp2VE24Vt7Q=
X-Google-Smtp-Source: AGHT+IFdUUomsft5E8FUnkormYOwKRzYQeKZmO/G18QMqhFbnT5zgoA+GQiOMmDzGpZq09lHMaM7alUM8i7Yu8aR1j4=
X-Received: by 2002:a05:651c:12c1:b0:36a:878b:6e34 with SMTP id
 38308e7fff4ca-374c3434da7mr21926661fa.0.1759676229581; Sun, 05 Oct 2025
 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251003184018.4264-1-will@kernel.org>
In-Reply-To: <20251003184018.4264-1-will@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 5 Oct 2025 16:56:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEo-4Rw=Nttbfnf2Bjv7zSomw1FAnNwbCe97i5UmQ7EVA@mail.gmail.com>
X-Gm-Features: AS18NWAWBJWNYFeWaecMOW4SEUuN_L3lqjI9wswzCjVaIi0JK_wVGUBis0E81yk
Message-ID: <CAMj1kXEo-4Rw=Nttbfnf2Bjv7zSomw1FAnNwbCe97i5UmQ7EVA@mail.gmail.com>
Subject: Re: [STABLE 6.1.y] [PATCH] KVM: arm64: Fix softirq masking in FPSIMD
 register saving sequence
To: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kenneth Van Alstyne <kvanals@kvanals.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_075712_479838_B9D2BDD4 
X-CRM114-Status: GOOD (  11.82  )
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

On Fri, 3 Oct 2025 at 20:40, Will Deacon <will@kernel.org> wrote:
>
> Stable commit 8f4dc4e54eed ("KVM: arm64: Fix kernel BUG() due to bad
> backport of FPSIMD/SVE/SME fix") fixed a kernel BUG() caused by a bad
> backport of upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally
> save+flush host FPSIMD/SVE/SME state") by ensuring that softirqs are
> disabled/enabled across the fpsimd register save operation.
>
> Unfortunately, although this fixes the original issue, it can now lead
> to deadlock when re-enabling softirqs causes pending softirqs to be
> handled with locks already held:
>
>  | BUG: spinlock recursion on CPU#7, CPU 3/KVM/57616
>  |  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: CPU 3/KVM/57616, .owner_cpu: 7
>  | CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           O       6.1.152 #1
>  | Hardware name: SoftIron SoftIron Platform Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
>  | Call trace:
>  |  dump_backtrace+0xe4/0x110
>  |  show_stack+0x20/0x30
>  |  dump_stack_lvl+0x6c/0x88
>  |  dump_stack+0x18/0x34
>  |  spin_dump+0x98/0xac
>  |  do_raw_spin_lock+0x70/0x128
>  |  _raw_spin_lock+0x18/0x28
>  |  raw_spin_rq_lock_nested+0x18/0x28
>  |  update_blocked_averages+0x70/0x550
>  |  run_rebalance_domains+0x50/0x70
>  |  handle_softirqs+0x198/0x328
>  |  __do_softirq+0x1c/0x28
>  |  ____do_softirq+0x18/0x28
>  |  call_on_irq_stack+0x30/0x48
>  |  do_softirq_own_stack+0x24/0x30
>  |  do_softirq+0x74/0x90
>  |  __local_bh_enable_ip+0x64/0x80
>  |  fpsimd_save_and_flush_cpu_state+0x5c/0x68
>  |  kvm_arch_vcpu_put_fp+0x4c/0x88
>  |  kvm_arch_vcpu_put+0x28/0x88
>  |  kvm_sched_out+0x38/0x58
>  |  __schedule+0x55c/0x6c8
>  |  schedule+0x60/0xa8
>
> Take a tiny step towards the upstream fix in 9b19700e623f ("arm64:
> fpsimd: Drop unneeded 'busy' flag") by additionally disabling hardirqs
> while saving the fpsimd registers.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <stable@vger.kernel.org> # 6.1.y
> Fixes: 8f4dc4e54eed ("KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix")
> Reported-by: Kenneth Van Alstyne <kvanals@kvanals.org>
> Link: https://lore.kernel.org/r/010001999bae0958-4d80d25d-8dda-4006-a6b9-798f3e774f6c-000000@email.amazonses.com
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

