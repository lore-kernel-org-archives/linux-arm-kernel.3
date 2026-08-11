Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF51AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0Y8XFy4Cr5mSbO1ygPEQcGzY7wJ/bk+XYxgiT/LhLU=; b=jIRw/P+gDKVeBZuUq86v1LAchM
	+vwBdPDRGd/1PrcKioQQrp8dYBFufyX3yg85HksBV0dUhL+Br7N/+wvrBAmwmmLbCBAu2Mpa867JC
	9wEfwd3HEjf1DZxs4Tu1jjtFKDoP0ZPHhgqbCxli10wgMXQ5SS+EJ60CbezIG7A/3/Zi+sTr/Onc/
	Bz4mQQOVHGiiYykkE0E1ANUwPSbFZVrWSyzytyE43oy2SmkzFiIaZXZ45BdfDX4tBJKyZ0PwmujU7
	zGXDahQwdHBcf8h7jZLddJC4lAbqMch/dwCWIqwFqUo6n4YAy2VGj8RfMkkblnuJENhvRqJzoWETz
	s+Cquv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrTD-0000000EnG5-2nBF;
	Tue, 11 Aug 2026 18:45:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrTA-0000000EnFQ-3HEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:45:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a1f8757b4eso1501a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 11:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786473899; cv=none;
        d=google.com; s=arc-20260327;
        b=gj96HP4LVYZO4Kf7uOa18y3x9EzkEhNHg12MNM91uuCnXLV3UNjF/6HSacOHIJ0XmK
         68jg+pKtwibOaS8zsZOZ+6gbHJPHAVwH0FMNP/MRAxHS0ipjdtoSgSTdejS4O+6KEY/P
         3xHkRcEBLFk97dVzzESJsP9QYUUK2rhN9xhTq6FVTUCLnqr6ts17Eg/P5Zt7uYoHzhYP
         jxtL3k/D059C5zyjWO6E1mq5hrTi1BaCgKoRue3I2hliuBJgEHs84WeBfLjWwmRs25d6
         bNwvUlH8aQ4HaAO2V7z01WVMWq3jOgzs+8mrYxStV79m9StE4THNL1dVHekk3t1IfOF/
         NCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O0Y8XFy4Cr5mSbO1ygPEQcGzY7wJ/bk+XYxgiT/LhLU=;
        fh=kSyWkz3hesXr6Co2KRVirgWlKFlqNVHJ3ejnTknnkRE=;
        b=FC7UEaTUPqDaRpgXD2MOhE2/FW5l9hxrz8+0KJ85erXz6EOpWtWftNfYTy/ZkPz13f
         AVGIO3bpsShd1+Gfe/7UsLA2LL1L8rD6Ipg0k2KplKIQzVtXDN/8dQv8yPubZG7gcDT2
         CUSI79zuCP0JYgYNtnEnueliBTgHRbPCbP3t3uFa6bdwGDzFP1r16jIy5BN32iHdeFRT
         bPgIMay3YLRCUvlJ+QyvemFJCLahc4fXekxl5+819T2JG5zHGsaETEjitI8nTVvBXQ6F
         M3o+AknOtks9tDOqTyKTMq7WeNktEnzadrZrZEa80GMPSSRANNYauPaRnuO0mqMr7wol
         +BRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786473899; x=1787078699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O0Y8XFy4Cr5mSbO1ygPEQcGzY7wJ/bk+XYxgiT/LhLU=;
        b=I48pxZ0ocEreccNjKJ4i20a2z7iPNkgCPXXHMnu3w8sMr+hO718ZVhJHhLVeJs0/JP
         zf03GAtdZrtKmZsCABOF23H588NTxJs0A57NoYp6SGbKJN+I2MmAbBcGuuHqgnSbXyit
         9RkCn3aDXxspuR3/TUoIOhxTaAqYWw2beXiP1BbANDkJJYX/ML5/HOyjjhMXTlZdT4sa
         eGWy+ghjHzcAkzbW50aGy+pxZC3Rs6Fosez/f2r5SWVlPNp7oUG41lUaYOKbZido3XK/
         DN9C1W54vQKeNnoGsO5UCD/KF1KW37WjFuYYtMBXRiMjx/mzinv1ceNU47+AIeDLPYRW
         a93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473899; x=1787078699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0Y8XFy4Cr5mSbO1ygPEQcGzY7wJ/bk+XYxgiT/LhLU=;
        b=OkYxl6GgNKQkN07FZyYy1o0F0z7N5TyOtXODAe/DdjQSSnFLbNiexDad+bRmhxcad6
         G5bpAnl3fd9P6ri3LRknYGmzSfPIJVRQgCDYzbOQ3KQmPX+Ks595Nui2Wg/AIZFYb23/
         Bi87iZh9QG/TgTUBa/gFXhGYoht7dIKpr2+H1hliNihxYbGka46C4maBnUF2MiE1H1i8
         aypjEaHUpzIjh2c2QwBQJiqyZ2FRKeHoSNpK80NG1nLPxNXSRP/VxiVAUiuGekz5Ajwk
         VCgp7noeXbOVVkfyhpxRKo2JveN6QHp7SKZjdXupn0bC11I3Ty+8WqFhhQDAXdYOBRfd
         7puA==
X-Forwarded-Encrypted: i=1; AHgh+RrW3t1CMzsu+//ImBMAFzl1q898mvdXNYWzz59u+p9NksWnT3aTcNkBrwmcloiibtQ7MsR5fEOL7RRQ+mvTrpBf@lists.infradead.org
X-Gm-Message-State: AOJu0YxIOx1sq/PbEYnNhjpmf5CAHiotsQH169SWTNC0hw/otfD0L7kJ
	s+vJxqLVKNd5FQo9sSg6emCJ7tMzxtcNEuHUyvDlWuAnxgqrucr8CjQZ25rmIBHn9oGI8VmQISJ
	16OABqIli5RRBetbJ2Otc7Ulkc90eoFAkm6N568Kj
X-Gm-Gg: AR+sD13ea1AnIcOywbkVU74N9Islo+qveyVjFPtQCrbHOWeO3JH+z+JIxdKyOzUSNKF
	+ZE/VPTJKJkA58opUrjFdDGu6HsWIBvAh7GpqnTxxjQ//9Oz56LLczmQDo7gxthOJZjq5s93T5K
	SKFiwjHt9he5Twf06aeYTrUHZYuhxxpIcun29ebn6LDfvhRM8mH5L0JFQ3l1LLO+mbNUA1XZ7oY
	y7pVKpD5JjQI8swWPEdc/lgqwyUNr0nHzRrPCIDcThLVS72O/qm1+hd4fSeiuyZGzIM5G0kIMpe
	JYDX8/BsDZj/F0zq+FumSmqLtx6ScDlSLSUDQFURHnZuQk5I+nvh24RBPz4zAap/+MEpzvvnGh4
	=
X-Received: by 2002:a05:6402:5690:b0:6a0:6679:be47 with SMTP id
 4fb4d7f45d1cf-6a3720e98f1mr7838a12.1.1786473898473; Tue, 11 Aug 2026 11:44:58
 -0700 (PDT)
MIME-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com> <178621460524.381735.15023846552532101058.b4-ty@kernel.org>
 <CAFgf54qY8c9wO_RHQZpVSKUCTOgr+WWKCxetjb6BGf-G=5OTSA@mail.gmail.com>
 <86pkzo23u0.wl-maz@kernel.org> <antaNocfJp6mX-oV@google.com>
In-Reply-To: <antaNocfJp6mX-oV@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 11 Aug 2026 19:44:45 +0100
X-Gm-Features: AUfX_myPHMsxz7vu-KOTkZeD0CkvzolqvNKht92XUvhOAw-KTF5RzZ5iKSgzCiM
Message-ID: <CAFgf54rguaNDTDxtGfWG4rZEkFz3C_VoBw=Z8rVuWPLSfquVjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fixes for timers and pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_114500_886251_0C593A5B 
X-CRM114-Status: GOOD (  37.29  )
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

On Tue, Aug 11, 2026 at 6:22=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Tue, Aug 11, 2026 at 02:18:15PM +0100, Marc Zyngier wrote:
> > On Tue, 11 Aug 2026 13:17:25 +0100,
> > Mostafa Saleh <smostafa@google.com> wrote:
> > >
> > > On Sat, Aug 8, 2026 at 7:44=E2=80=AFPM Oliver Upton <oupton@kernel.or=
g> wrote:
> > > >
> > > > On Sat, 08 Aug 2026 08:58:21 +0000, Mostafa Saleh wrote:
> > > > > What started as a  small patch ended up as a 3 patch series thank=
s
> > > > > to Sashiko.
> > > > >
> > > > > First patch from Marc to consolidate the offset calculation,
> > > > > follow up patches fix issues with non-protected VM and timer
> > > > > offset and protected VM running with broken CNTVOFF_EL2.
> > > > >
> > > > > [...]
> > > >
> > > > Dropped the unintended SOB in patch 3 you mentioned.
> > > >
> > > > Applied to next, thanks!
> > > >
> > > > [1/3] KVM: arm64: Make timer_get_offset() work in all contexts
> > > >       https://git.kernel.org/kvmarm/kvmarm/c/2858600ecd01
> > > > [2/3] KVM: arm64: Fix timer offsets for non-protected VMs
> > > >       https://git.kernel.org/kvmarm/kvmarm/c/47d3eef780e3
> > > > [3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
> > > >       https://git.kernel.org/kvmarm/kvmarm/c/2e813a6e8ebe
> > > >
> > >
> > > Thanks Oliver! I believe there is one more bug. I'm not sure where th=
e
> > > bug is or if it relates to the broken timers.
> > > Before those patches I could not boot a protected VM because of the
> > > panic, now after booting protected VMs, I sometimes get a system
> > > reset.
> >
> > On this quality HW, this is usually an indication that you are taking
> > an exception in a tight loop.
> >
>
> I tried to add a poor man exception storm detection in the kernel
> handlers (el1h_64_sync_handler and __gic_handle_irq), but it didn=E2=80=
=99t trigger
> before the reset.
>
> My hunch would be that there are some paths in protected VMs that takes
> too long that the watchdog fires. I saw the resets mostly at either
> userspace boot or VM teardown, otherwise the VM seems functional.
>
> I will collect timestamps from hypervisor entry/exit and check
> how large are those.
>

Max numbers I've seen doesn't exceed 2-3 ms, compared  to SMCs which
can take almost a second.
I'm not sure if the watchdog is the right conclusion, but without any
clue from the firmware logs, I am lost.

Also, correcting myself, I now see it happened with a single vCPU
although that took longer to reproduce.

Thanks,
Mostafa

> > > I confirmed that cntvoff_el2 does not get written to non-zero, I also
> > > removed the sysreg write completely (rely on xzr value at init) so my
> > > guess is that the HW might be allergic to more than just non-zero
> > > values in cntvoff_el2.
> >
> > Is that in hVHE mode? Can you trap the access and route it to the
> > existing handling code?
> >
>
> Yes, only hVHE. Protected nVHE works fine.
>
> One interesting observation is that when starting a VM with a single
> vcpu I don=E2=80=99t see the reset anymore compared to 4 cpus before.
>
> Enabling traps for timer unconditionally for protected VMs still has
> the same issue.
>
> > > I do not have issues with non-protected VMs anymore.
> >
> > Do these run with an offset or not?
>
> Yes, they have the offset set from kvm_timer_vcpu_init() with
> kvm_phys_timer_read().
>
> Thanks,
> Mostafa
>
> >
> >       M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

