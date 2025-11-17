Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B8CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4iPsNPmkfuJ1cA2QIm1+zZAl2TgmFyV4FeEo9bCgdc=; b=2PRMhCtCgnlTm+Cqh6K6+2NzPz
	aNQ+g85jnK4Tyw8Zl/Tfof87tNj7aaK/GR5BKYlAg74/OK8LntCHNmMj2G1yvblKzwBCSkYZRHaVe
	JO58tYXKny5aGua+jSNUsp+LHz0MpUmm8IhQVLJnxFTRwEbfPtlJdXOMaz/ziQAyGXGBVtJq+v3Qg
	Dz1t2/LYKYkGdqK4EiIBGZqNzG/ZLHdN1wIDeHHgmYJ92Xa3T2el2vS0JZVv9hNrnG3bmKwjKpNPA
	KJWCX7rB3jEmXgZj+8PPeRtlU739qJ+bg+i5HWq5w4KJ+1bhKqZ6D2J11s8dLOYrghbYwlrXTTQQp
	EfEzEPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvjl-0000000FoVX-261Y;
	Mon, 17 Nov 2025 09:41:29 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvjj-0000000FoUy-30VM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:41:29 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ee147baf7bso384431cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763372486; x=1763977286; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4iPsNPmkfuJ1cA2QIm1+zZAl2TgmFyV4FeEo9bCgdc=;
        b=4svoV5sURSJMLki+idiIugtZ0CZWN2bQdBOcF5buYbBE4TSjagf+ypdYi3zxIefAJb
         aul5EnTp8SyNm1GQ63P2r/plKHhj/nySOS6je02i5VtA2eMajc3gY0elc005jHYmjkyl
         7yvqKbD67vXA08ZfXYuFiyNm3w717d/1tHsNfgbg5IiWsyMW73KmASrEGrDZ9ScpswR8
         tGO7Q0U8oZ3TvBNx/k4190uIyANdFWaR75BD1Ay3hdMpO8if97BZpc7gEksefl0T30Ww
         Sw4RpQt14jhXxNRSJu+H2sa1JP65nwN4NXcYg/tV0RDCgfL2RIBra49aVdOL0UNY+daO
         gZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372486; x=1763977286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4iPsNPmkfuJ1cA2QIm1+zZAl2TgmFyV4FeEo9bCgdc=;
        b=f6WivDtZ1TFt0HApsbVRHAd9THC4kd6nX7wZYbfYTkh/lZ3egq4gPwQL8yYvlhlcKw
         WV6vkr9Iay6vL1hhTkvzc/EvZ/CbQkqp6SnDhP54vPHVf6Vfsap8TcWeIcDAH1fvm1vT
         E1It75MJr7dfRZVj7zsHSpSVefl1mJuA5T6q8lrec49aJp4NWVX3TgajOa6HGVdCVApZ
         bGqmxL8TZcxEravkLbs9R/UoDYcre82NO+UWzc9UtTvh3hB/lMV+mu5Xg2Gkrdm8ifuO
         nUcE6pnaHcPMA+rxT0+3f6/wHO93iQKFDAphVkOhL90Fb1gnactoPR2OY8/np468XtpQ
         F25Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbmVfVCRPZgKC6/uama0m1VbOxe+jznNSgEwdcWMYG4NFI2hXrJYuXdX78qoL/xh/WSOdrmqnVePh2CP0/zib6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6v3+OSVJP8xn/FdZMjLCaN3i28/jmx7VEqijIlxsT8CeqtpDk
	bvDncoQcNBpOQNvk2COiZVVaqWqp5Sk5r9lKXqq7nSNFR16h5IZGvnvpG4hsK9QW54jL34BskxW
	L4BGIeFUUuMQoiDrx+C3CVM1zJ9koDXpCXgCFVxom
X-Gm-Gg: ASbGncu1FnYSMJGoSDUDGA0dMjvEGsfo6J2KPcehHedllXfbfle5I9/OwJuOjLRrtlL
	d9oE121cxJ9nB9n+LanvMlv+5vVWmApl0HfQOORHv2e8XzDHVhp/qWdMM/ntH3gBCTVMIXrXuZa
	OakLBdW6DaGIX3aZvfT5AOBoPJusLWpJVYyWf6SbHEX2mff0MvIziL4EKpH4YNmpteEMIZB5Q3O
	TVAfDJ5c+EyQvwd39YYIgrFdRXYh1oU0U/WyTnT0uQtpvXwP/HQjKoI79OQSF7wZ0XqXo19MGjX
	Qkgy8g==
X-Google-Smtp-Source: AGHT+IHyo86gLv8n5byRB2qu1f3O+SKyJvAI8m25dfDky6i1oSr81nnsILE93xqowzBnQ39Jo2dqU3RBGBtQLDM1NBM=
X-Received: by 2002:a05:622a:1802:b0:4b7:94d7:8b4c with SMTP id
 d75a77b69052e-4ee02670f8cmr10745491cf.0.1763372485428; Mon, 17 Nov 2025
 01:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 09:40:47 +0000
X-Gm-Features: AWmQ_blkni7hFj-3KPK3MSATlT_Q1XxZLNDeB0Yy2C3U6vIpgzPianfsTz7ILTY
Message-ID: <CA+EHjTzudrep2hEno4RPwh8H88txiVYFoU7AyJYVWG9SFSk87Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_014127_783882_8306B88C 
X-CRM114-Status: GOOD (  30.85  )
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

On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
>
> This is a follow-up to the original series [1] (and fixes [2][3])
> with a bunch of bug-fixes and improvements. At least one patch has
> already been posted, but I thought I might repost it as part of a
> series, since I accumulated more stuff:

I'd like to test this series as well. Do you have it applied in one of
your branches at
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
, or which commit is it based on?

Thanks,
/fuad

> - The first patch addresses Mark's observation that the no-vgic-v3
>   test has been broken once more. At some point, we'll have to retire
>   that functionality, because even if we keep fixing the SR handling,
>   nobody tests the actual interrupt state exposure to userspace, which
>   I'm pretty sure has badly been broken for at least 5 years.
>
> - The second one addresses a report from Fuad that on QEMU,
>   ICH_HCR_EL2.TDIR traps ICC_DIR_EL1 on top of ICV_DIR_EL1, leading to
>   the host exploding on deactivating an interrupt. This behaviour is
>   allowed by the spec, so make sure we clear all trap bits
>
> - Running vgic_irq in an L1 guest (the test being an L2) results in a
>   MI storm on the host, as the state synchronisation is done at the
>   wrong place, much like it was on the non-NV path before it was
>   reworked. Apply the same methods to the NV code, and enjoy much
>   better MI emulation, now tested all the way into an L3.
>
> - Nuke a small leftover from previous rework.
>
> - Force a read-back of ICH_MISR_EL2 when disabling the vgic, so that
>   the trap prevents too many spurious MIs in an L1 guest, as the write
>   to ICH_HCR_EL2 does exactly nothing on its own when running under
>   FEAT_NV2.
>
> Oliver: this is starting to be a large series of fixes on top of the
> existing series, plus the two patches you have already added. I'd be
> happy to respin a full v4 with the fixes squashed into their original
> patches. On the other hand, if you want to see the history in its full
> glory, that also works for me.
>
> [1] https://msgid.link/20251109171619.1507205-1-maz@kernel.org
> [2] https://msgid.link/20251113172524.2795158-1-maz@kernel.org
> [3] https://lore.kernel.org/kvmarm/86frahu21h.wl-maz@kernel.org
>
> Marc Zyngier (5):
>   KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1 when no vgic is
>     configured
>   KVM: arm64: GICv3: Completely disable trapping on vcpu exit
>   KVM: arm64: GICv3: nv: Resync LRs/VMCR/HCR early for better MI
>     emulation
>   KVM: arm64: GICv3: Remove vgic_hcr workaround handling leftovers
>   KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
>
>  arch/arm64/include/asm/kvm_hyp.h     |  1 +
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 11 +++-
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 78 ++++++++++++++++------------
>  arch/arm64/kvm/vgic/vgic-v3.c        |  3 ++
>  arch/arm64/kvm/vgic/vgic.c           |  6 ++-
>  arch/arm64/kvm/vgic/vgic.h           |  1 +
>  6 files changed, 62 insertions(+), 38 deletions(-)
>
> --
> 2.47.3
>
>

