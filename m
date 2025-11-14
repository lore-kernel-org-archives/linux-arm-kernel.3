Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F5DCE8D4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ets8NwguOS7BugcXiDCmLziy7av2VUMc9zU1Tb1oNaA=; b=ybF2rOznVbfOFhcIJoQF61CmU4
	Ln/SkooDzt2C6MuL6q7fLM9vfsBQMEPvOlqcCrafeXn+r0CQNNHtSfHWzdCVpwojTNfE3LCXYrCT2
	3V6zdAPD3EbCYV28q89xO8SRyEqSfRahDKYwTMTRjv/ENc2EXL3QCT5Bsz6bmERHWu/QKFtS4Og5I
	D3w1UW6dyWspxa9EakBLSmO5NIZ8hIXswHg/hImoz8vmHpngiKmc+1T8ZYD1+1DfVqsRZNPNZKbBT
	0riiG+5iAykN/W9iGJ9lWTMB6QIz1sDdbDgtYfDiy1HPW+0iG95j0x0ZGLBkk2UwbonxnPDxTNNuq
	Znw3JY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw80-0000000Cd0a-3IWI;
	Fri, 14 Nov 2025 15:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw7x-0000000Ccv0-2Npq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ets8NwguOS7BugcXiDCmLziy7av2VUMc9zU1Tb1oNaA=; b=BMNxRIL55cQB4vZghFoA/fJc9e
	pCOtR346Jk8p7iUviNuXU1FId4P65ICaKv2FVzNRtPMehn1eK32RaPqXFDuzBzmYIFk3yKrxro1iV
	YMkGaBiZ/CdLY2Sbba+bPIFb5n8hOVW3Mk6KgBG+S/7naB2+GYoHrqqJJo7Na8U5/4ws77+DMEEP6
	KdIpliQqB2HrCgyxZgvFdUqsgypl/2LFdyS9X7wFtwycdjBTSQdqiQ0dXxI7Udu14fPvEk2pfnYEx
	L0XvuWFyHvP2txNfUwwXqMrFrCT0jZT9bI86WfRT4SFWr4IHLbUZW/sOgP+BAOzTH/vw2VBaK7ggw
	jVd11a+g==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvGA-00000002tBu-45Pq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:58:52 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ede12521d4so337771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763135651; x=1763740451; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ets8NwguOS7BugcXiDCmLziy7av2VUMc9zU1Tb1oNaA=;
        b=BJodKEaBU1EkvGoliHhjjf5ODNNtnFhi+D0SUxVNk4Ov5j9SM/kVdXEIO2wALVeO48
         ClPwebQ1CSs7YhgbzIv8GyvHiPaouLbnWjkTxW8jkTxtAUyYIn2YCTOsoeKpodimfnTb
         poqTvTJ2asn8xjRakfgHtf87tpm06NeW1WPWbXcIH4NipQZ3KemNyYW4A9rDs33075a8
         gWRFqxb/kE65GHWlBHuuFEfFfhQjpwmiE42K+MLyZy2nbfEspigdca8yqZqYe420Eea7
         9qOnln2UclpZyslt3P6vjhi1yzuYsmyzRP5TY/S0Lnn65/xhIM3xk89zUKARzsl2xg7g
         XfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135651; x=1763740451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ets8NwguOS7BugcXiDCmLziy7av2VUMc9zU1Tb1oNaA=;
        b=fcTrPjrfKcNvvPJZWJbtyrv6kyNQgM1No4oSZr4GTspdRX1gWN/++/av2Kx4jUdy/F
         vcLZK6l/IIQCyCZGO/pTBgtpFMxZY5xCswe2QzJ8OvbFOUBtEKPET7KR41A2f4LKUJjm
         ZgZFk5yUOORdLea/HT8snd9j+U80Q/LkxiykQs3jZI/toKR8dNldImCxZZzk3IEJj3T2
         g8yR9EmQMTPTsSvPKbpaL1i6ekXTzW+3dHjA71gZWMFT+EEKVPr+OPFQt/dJPuLpWnj2
         7PSiplvOvGhX2Rnoeie9W0MVXFWldWJ3HCJExcCF/GyZife9+/0r8X3Tvisk0IlugCEQ
         ApgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpgAML+BiMEM2aJjGcjvXXgbHmEVlpr4CxZ47OZr8r+prcbciTuEhSiMZWiJkk2QI1/C1rB6bWQVdvVDlvgywn@lists.infradead.org
X-Gm-Message-State: AOJu0YyHGVr7jwH3UqKJ7I/aRKLV1EkUzP81QPMAXz06PL1eRT44YxdD
	2YVYBeuQBcgYpZph8/+tsR478qv5Sg2kiwYMw7/NElcED86AedcAOnUzGCi2sKd4SB1R2odJV+Q
	ajTeYoTxZWvwg72kfgfUfOvJuDUJ7TEGcvKym7h34
X-Gm-Gg: ASbGnctKCALuSsw7wHB7pdOpK4Rv6M8+ri9mt1RcnU78OpPPerDLYSfQJJqjAqE/yKa
	5Km/iD872brOwJrXdDi3unEz19QJi1aNyJjJ46dd8S0hy9gQG2ys9rJVSai2BXvLPjcElAePNmn
	tC9ADQRJIS6qOr+4pirsHjMy9gGdPA0C3xCI9cMsxrKCSyTe5VLdAAQtmLfzjWm71CmSweMJHVY
	Ne9ICv1rTO8+GM0gL1XYXzvhcVhEqn9fxN45MGk1733/+Sy7oMIxVFjqr2Ms9E6+90wdd9lPy7o
	ZSBKSw==
X-Google-Smtp-Source: AGHT+IHiwTWU8jeDp2ELw5Kdfmmit9MUQPX7dTwszSoQEWn92TA+ugQDOGIXhjYg1SCQOH6qRDHLIXyjijT0X6iM6cw=
X-Received: by 2002:ac8:7c41:0:b0:4b7:8de4:52d6 with SMTP id
 d75a77b69052e-4edf313c286mr6619431cf.2.1763135650429; Fri, 14 Nov 2025
 07:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20251109171619.1507205-1-maz@kernel.org> <20251109171619.1507205-30-maz@kernel.org>
 <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com> <86cy5ku06v.wl-maz@kernel.org>
In-Reply-To: <86cy5ku06v.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 14 Nov 2025 15:53:33 +0000
X-Gm-Features: AWmQ_bkDzrH8JV6r7KfYUXsoDbXfGgi939IKX55rEfFNXq-zUyYJ_6136aB575g
Message-ID: <CA+EHjTzi9Q9hqAu1Xk51hO3uz0FdUGjdPSViN4RAD6tuXJkvYQ@mail.gmail.com>
Subject: Re: [PATCH v2 29/45] KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when
 interrupts overflow LR capacity
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Yao Yuan <yaoyuan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_145847_130506_7E519EEE 
X-CRM114-Status: GOOD (  37.59  )
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

Hi Marc,

On Fri, 14 Nov 2025 at 15:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 14 Nov 2025 14:20:46 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Sun, 9 Nov 2025 at 17:17, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > Now that we are ready to handle deactivation through ICV_DIR_EL1,
> > > set the trap bit if we have active interrupts outside of the LRs.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/vgic/vgic-v3.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> > > index 1026031f22ff9..26e17ed057f00 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-v3.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> > > @@ -42,6 +42,13 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
> > >                 ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
> > >         cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
> > >                 ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
> > > +
> > > +       /*
> > > +        * Note that we set the trap irrespective of EOIMode, as that
> > > +        * can change behind our back without any warning...
> > > +        */
> > > +       if (irqs_active_outside_lrs(als))
> > > +               cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
> > >  }
> >
> > I just tested these patches as they are on kvmarm/next
> > 2ea7215187c5759fc5d277280e3095b350ca6a50 ("Merge branch
> > 'kvm-arm64/vgic-lr-overflow' into kvmarm/next"), without any
> > additional pKVM patches. I tried running it with pKVM (non-protected)
> > and with just plain nVHE. In both cases, I get a trap to EL2 (0x18)
> > when booting a non-protected guest, which triggers a bug in
> > handle_trap() arch/arm64/kvm/hyp/nvhe/hyp-main.c:706
> >
> > This trap is happening because of setting this particular trap (TDIR).
> > Just removing this trap from vgic_v3_configure_hcr() from the ToT on
> > kvmarm/next boots fine.
>
> This is surprising, as I'm not hitting this on actual HW. Are you
> getting a 0x18 trap? If so, is it coming from the host? Can you
> correlate the PC with what the host is doing?

I should have given you that earlier, sorry.

Yes, it's an 0x18 trap from the host (although it happens when I boot
a guest). Here is the relevant part of the backtrace addr2lined and
the full one below.

handle_percpu_devid_irq+0x90/0x120 (kernel/irq/chip.c:930)
generic_handle_domain_irq+0x40/0x64 (include/linux/irqdesc.h:?)
gic_handle_irq+0x4c/0x110 (include/linux/irqdesc.h:?)
call_on_irq_stack+0x30/0x48 (arch/arm64/kernel/entry.S:893)

[   28.454804] Code: d65f03c0 92800008 f9000008 17fffffa (d4210000)
[   28.454873] kvm [266]: Hyp Offset: 0xfff1205c3fe00000
[   28.455157] Kernel panic - not syncing: HYP panic:
[   28.455157] PS:204023c9 PC:000e5fa4413e39bc ESR:00000000f2000800
[   28.455157] FAR:ffff800082733d3c HPFAR:0000000000500000 PAR:0000000000000000
[   28.455157] VCPU:0000000000000000
[   28.459703] CPU: 5 UID: 0 PID: 266 Comm: kvm-vcpu-0 Not tainted
6.18.0-rc3-g2ea7215187c5 #8 PREEMPT
[   28.460247] Hardware name: linux,dummy-virt (DT)
[   28.460615] Call trace:
[   28.460900]  show_stack+0x18/0x24 (C)
[   28.461234]  dump_stack_lvl+0x40/0x84
[   28.461421]  dump_stack+0x18/0x24
[   28.461566]  vpanic+0x11c/0x364
[   28.461698]  vpanic+0x0/0x364
[   28.461838]  nvhe_hyp_panic_handler+0x118/0x190
[   28.462056]  handle_percpu_devid_irq+0x90/0x120
[   28.462248]  handle_percpu_devid_irq+0x90/0x120
[   28.462439]  generic_handle_domain_irq+0x40/0x64
[   28.462643]  gic_handle_irq+0x4c/0x110
[   28.462814]  call_on_irq_stack+0x30/0x48
[   28.463003]  do_interrupt_handler+0x4c/0x6c
[   28.463184]  el1_interrupt+0x3c/0x60
[   28.463348]  el1h_64_irq_handler+0x18/0x24
[   28.463525]  el1h_64_irq+0x6c/0x70
[   28.463799]  local_daif_restore+0x8/0xc (P)
[   28.463980]  el0t_64_sync_handler+0x84/0x12c
[   28.464164]  el0t_64_sync+0x198/0x19c

> It would indicate that we are leaking trap bits on exit, and that QEMU
> is trapping ICC_DIR_EL1 on top of ICV_DIR_EL1 (which the HW I have
> access to doesn't seem to do).
>
> > I'm running this on QEMU with '-machine virt,gic-version=3 -cpu max'
> > and the kernel with 'kvm-arm.mode=protected' and with
> > 'kvm-arm.mode=nvhe'.
> >
> > Let me know if you need any more info or help testing.
>
> On top of the above, could you give the hack below a go? I haven't
> tested it at all (I'm in the middle of a bisect from hell...)

With the hack it boots, both nvhe and protected mode.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index e950efa22547..71199e1a9294 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -243,7 +243,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
>                 cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
>         }
>
> -       write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
> +       write_gicreg(0, ICH_HCR_EL2);
>  }
>
>  void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
>
> --
> Without deviation from the norm, progress is not possible.

