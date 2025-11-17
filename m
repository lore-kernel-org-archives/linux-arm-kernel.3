Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E754CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4mw/d+cHuQSW2nKT/VCWC66VyQfn5ntftKqNloGog0=; b=or+tEQxmxX02B8l2HZs1tyVQL/
	MJqw4bpilTsHXDDMtR1LSIUd8xYx3e8Iks1AzjiIotuj/pvadsaqNZUC1jy65/p7+i9oRPRxuXrNo
	jRyNHC07d0RWEyjRTF1beVl43nFSrB1xNA+Swynv/4RM33koWpVQDQX7cotdiTIsKprO/Xv+Q3T1D
	Bw1/Jc0mUdf9ngMvlAocwz9DEwj+QVZDWiT0i2wrZW2x5MT5VDH0Cf902GIQcJNUIEFZZvx462MD9
	KrnlFFA5z8K4HrUDtSBLlplzFzpbTBvtIiZaEZIjC1plkmWQw689jZJUzgNnV+24QIFEjuwj4PJph
	GxstFPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuVb-0000000Fg6m-0t6g;
	Mon, 17 Nov 2025 08:22:47 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuVY-0000000Fg6R-1zcr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 08:22:45 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4ed67a143c5so507981cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 00:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763367762; x=1763972562; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4mw/d+cHuQSW2nKT/VCWC66VyQfn5ntftKqNloGog0=;
        b=ZhY0r6WCRJOumNJiLHM5X2TOeSordxSDzldbJueeutS2+q3c6hiKEZ4jRSL5gYfo/u
         4w0jZjyEtS4DKaWwlGgWNVF2//WmkOnNaKgzp/ml8pDlrY2GLVb6I/gV2tmAhbZnXTm+
         arh71iIE8FdT/23Yo6lMLhIQ0MIkW5gThfK5d1dfPgiyZCddMfZXsOPoVjpQwkVtzSO3
         HqS9V/ri2Ps6qk6TKjgexVDupTkysuNlbVRrxsJpmoRnMwmU96jsvxwPlPpsi6JSBqDY
         jrAqbWzWPVKv/vzMA58YmwUP5NS9pjtyRVhmWH5bk3qzaTy+i5Ey587xzm2K/oYQnxtL
         pHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763367762; x=1763972562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4mw/d+cHuQSW2nKT/VCWC66VyQfn5ntftKqNloGog0=;
        b=Yt/tDdMbgpm92P3ZS8bUofBh8muOuC/DHNvk1QCfExM/G+Tvy57jyox2FPz9m58UQo
         uePnFKpfJ5CLoTT9QHfUNXckLm7NsLhtewWI/cKoDQcVFH+mVqLaPsMSeYStOXPETY91
         xiT7vzUdqrOWQoTgWmBhK9DdKxsTriLdH76iguLvbxEQrmO0ZmbkKlmOBeY+PA9y7dAd
         5Tz86LQrRjcuZlSdjFC8/roJrNdH0jnK6LoyQGJhsRrhm/jUkhFii1p2Gxg98Jw+UZFu
         RE6lHIL5un1OTteSacLpxJkOSxeQTdbJfNEmEG1DPcoygoFmSw+WR4jg+8cutwuo2+gd
         40dw==
X-Forwarded-Encrypted: i=1; AJvYcCWEUHH0obPHDZwxfEYn+MvDVF+qCUs2ZA9StJgWGlIbiMUM0jMFcMUuFfYJKvl1e5p9XIkMM5Fu3rK4KL2cq8ms@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2EZiHBDqMMkVJ5kgwzOuocpBkccwqLjm2mC3EjdTNfgnE9y3N
	hcf6Kf1hfhS1U0q7YeGuuqZ8Rm7u0eBLQM/JE6ZnVFKbz4E7SUIuoNo3tDPANhEe7C9kElJxLDQ
	vX6Ned4QzVcNaZqaQBga+GbRAOGK1rvm+JeTFo4xa
X-Gm-Gg: ASbGncuMaqGo2V895lbdTIKpxc/UMH4ge5LF2zdgVhdUohGu+/nKNDHEUazXeo9tPjb
	/Ev/ICgdlxKRCO4ricxeEAdoFyw9Q8aBbTaXnG32M0ROu63HImhk12tRF3lyyEgG9bQ2m1c5A5I
	SrWhTmzk9wF1qojJYrBGQjSnV9jb0QVamFUUoseg0SrwOPx37H2PmMfSsUDbnEdsT0+kMuuArV4
	Sdh4rPFYDo/TO8XoO85AZQrHvyzHngmKr+mrzrP964Gyt0+g+kJb2AfX4DIzTqw9BGPL6M=
X-Google-Smtp-Source: AGHT+IEwrJtjWNdFAKXP4Cq6tm8luNUUXLzjFmpWEc5T/ifpGhnOTJaKY/1iZ6Vy1SGx0WQsbM+vgRDsvnbfJpkP4eE=
X-Received: by 2002:ac8:5893:0:b0:4ed:341a:5499 with SMTP id
 d75a77b69052e-4ee02c20affmr10129241cf.11.1763367762168; Mon, 17 Nov 2025
 00:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20251109171619.1507205-1-maz@kernel.org> <20251109171619.1507205-30-maz@kernel.org>
 <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com>
 <86cy5ku06v.wl-maz@kernel.org> <CA+EHjTzi9Q9hqAu1Xk51hO3uz0FdUGjdPSViN4RAD6tuXJkvYQ@mail.gmail.com>
 <86a50otsuh.wl-maz@kernel.org>
In-Reply-To: <86a50otsuh.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 08:22:05 +0000
X-Gm-Features: AWmQ_bmqi9yyjBAanZdrMqxT0R_6WY6hFkqKJWlr94OwYemsxfqLBAjqPjPKDzk
Message-ID: <CA+EHjTwcf7HXypmt-1gS2G8GK5iBt3VQrpmRiHysr571J96VvA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251117_002244_550966_10F08C98 
X-CRM114-Status: GOOD (  47.40  )
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

On Fri, 14 Nov 2025 at 17:41, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 14 Nov 2025 15:53:33 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Fri, 14 Nov 2025 at 15:02, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 14 Nov 2025 14:20:46 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > Hi Marc,
> > > >
> > > > On Sun, 9 Nov 2025 at 17:17, Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > Now that we are ready to handle deactivation through ICV_DIR_EL1,
> > > > > set the trap bit if we have active interrupts outside of the LRs.
> > > > >
> > > > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > > > ---
> > > > >  arch/arm64/kvm/vgic/vgic-v3.c | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> > > > > index 1026031f22ff9..26e17ed057f00 100644
> > > > > --- a/arch/arm64/kvm/vgic/vgic-v3.c
> > > > > +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> > > > > @@ -42,6 +42,13 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
> > > > >                 ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
> > > > >         cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
> > > > >                 ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
> > > > > +
> > > > > +       /*
> > > > > +        * Note that we set the trap irrespective of EOIMode, as that
> > > > > +        * can change behind our back without any warning...
> > > > > +        */
> > > > > +       if (irqs_active_outside_lrs(als))
> > > > > +               cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
> > > > >  }
> > > >
> > > > I just tested these patches as they are on kvmarm/next
> > > > 2ea7215187c5759fc5d277280e3095b350ca6a50 ("Merge branch
> > > > 'kvm-arm64/vgic-lr-overflow' into kvmarm/next"), without any
> > > > additional pKVM patches. I tried running it with pKVM (non-protected)
> > > > and with just plain nVHE. In both cases, I get a trap to EL2 (0x18)
> > > > when booting a non-protected guest, which triggers a bug in
> > > > handle_trap() arch/arm64/kvm/hyp/nvhe/hyp-main.c:706
> > > >
> > > > This trap is happening because of setting this particular trap (TDIR).
> > > > Just removing this trap from vgic_v3_configure_hcr() from the ToT on
> > > > kvmarm/next boots fine.
> > >
> > > This is surprising, as I'm not hitting this on actual HW. Are you
> > > getting a 0x18 trap? If so, is it coming from the host? Can you
> > > correlate the PC with what the host is doing?
> >
> > I should have given you that earlier, sorry.
> >
> > Yes, it's an 0x18 trap from the host (although it happens when I boot
> > a guest). Here is the relevant part of the backtrace addr2lined and
> > the full one below.
> >
> > handle_percpu_devid_irq+0x90/0x120 (kernel/irq/chip.c:930)
> > generic_handle_domain_irq+0x40/0x64 (include/linux/irqdesc.h:?)
> > gic_handle_irq+0x4c/0x110 (include/linux/irqdesc.h:?)
> > call_on_irq_stack+0x30/0x48 (arch/arm64/kernel/entry.S:893)
> >
> > [   28.454804] Code: d65f03c0 92800008 f9000008 17fffffa (d4210000)
> > [   28.454873] kvm [266]: Hyp Offset: 0xfff1205c3fe00000
> > [   28.455157] Kernel panic - not syncing: HYP panic:
> > [   28.455157] PS:204023c9 PC:000e5fa4413e39bc ESR:00000000f2000800
> > [   28.455157] FAR:ffff800082733d3c HPFAR:0000000000500000 PAR:0000000000000000
>
> I expect you have a write to ICC_DIR_EL1 at this address?

It almost surely must be, but tracking it down hasn't been that easy.
That said, I think it's ending up in gic_eoimode1_eoi_irq(), which
calls gic_write_dir() if !gic_arm64_erratum_2941627_needed(d).

I wonder if your hardware needs that erratum.

> > [   28.455157] VCPU:0000000000000000
> > [   28.459703] CPU: 5 UID: 0 PID: 266 Comm: kvm-vcpu-0 Not tainted
> > 6.18.0-rc3-g2ea7215187c5 #8 PREEMPT
> > [   28.460247] Hardware name: linux,dummy-virt (DT)
> > [   28.460615] Call trace:
> > [   28.460900]  show_stack+0x18/0x24 (C)
> > [   28.461234]  dump_stack_lvl+0x40/0x84
> > [   28.461421]  dump_stack+0x18/0x24
> > [   28.461566]  vpanic+0x11c/0x364
> > [   28.461698]  vpanic+0x0/0x364
> > [   28.461838]  nvhe_hyp_panic_handler+0x118/0x190
> > [   28.462056]  handle_percpu_devid_irq+0x90/0x120
> > [   28.462248]  handle_percpu_devid_irq+0x90/0x120
> > [   28.462439]  generic_handle_domain_irq+0x40/0x64
> > [   28.462643]  gic_handle_irq+0x4c/0x110
> > [   28.462814]  call_on_irq_stack+0x30/0x48
> > [   28.463003]  do_interrupt_handler+0x4c/0x6c
> > [   28.463184]  el1_interrupt+0x3c/0x60
> > [   28.463348]  el1h_64_irq_handler+0x18/0x24
> > [   28.463525]  el1h_64_irq+0x6c/0x70
> > [   28.463799]  local_daif_restore+0x8/0xc (P)
> > [   28.463980]  el0t_64_sync_handler+0x84/0x12c
> > [   28.464164]  el0t_64_sync+0x198/0x19c
> >
> > > It would indicate that we are leaking trap bits on exit, and that QEMU
> > > is trapping ICC_DIR_EL1 on top of ICV_DIR_EL1 (which the HW I have
> > > access to doesn't seem to do).
> > >
> > > > I'm running this on QEMU with '-machine virt,gic-version=3 -cpu max'
> > > > and the kernel with 'kvm-arm.mode=protected' and with
> > > > 'kvm-arm.mode=nvhe'.
> > > >
> > > > Let me know if you need any more info or help testing.
> > >
> > > On top of the above, could you give the hack below a go? I haven't
> > > tested it at all (I'm in the middle of a bisect from hell...)
> >
> > With the hack it boots, both nvhe and protected mode.
>
> OK. At least we know what the issue is, and it shouldn't be too hard
> to fix. I guess there is an opportunity for cleanup here, and I'll
> look into it shortly (probably not before Monday though).

No hurry on my part. I'm just here for the reviews :)

Cheers,
/fuad

> Thanks again,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

