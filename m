Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696ECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf5oSAywwuaj5Fh57ugeWpBI7UCwJcYNfPkenTc12XM=; b=HVOZO4A3eLnST832muIHijcCbp
	Vs8asZs6FszL5tKBq4vTYpcr3WRyw2o+FW0URVWF01Uff9wvwBwNQ5FMJtpt0iZPI5Uu8Bns6MHO+
	D2Ap0bINspsRJLDud16O+jrcBPfuXtuujIEd0vJNvN4lbXejylWIqtA4LTaYxdIBZaWFtCBH78E0t
	IqLjuIkbzk7uWGAmmlSHRKqd9diKzVC2i5feF29A1d4Db7LmS5n81e01zVK5RdYfkqHyG7neOAWly
	IwT+lo3+nY3Ud4MqcQtltz8Ara0jCECXrcNKBLCbOm1mDqloT+YXet74WnrSKVrZxDcfYD7x4B/Ri
	isHSkjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2j4-0000000Ds9d-2AaI;
	Mon, 15 Jun 2026 08:31:22 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2j1-0000000Ds8l-3Zs1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:31:21 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51765331535so860181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781512278; cv=none;
        d=google.com; s=arc-20240605;
        b=ED44q9eGnbieKGZmT8wCfDzkjDLfuFSoY8KbvXMAEHz0bADBe269pAg1mtQ1pwx5B6
         tKnui/Nk/Nldj0hjDjus43DlJm/8+yyfvjTdY6ViNXSQp8N0aeEKAfiIW9vCLMUrXb6V
         M7F3op/cfj996kc61rilML7blrlhX6x2pubObSxwYt2MH3oWIzjNY6uEbl74ypVUCD5t
         MXGRE15sP1GPZ3zZr1aF6zZ8oYdhlUvqVT5kHyq9Y+ulzUcLRY+GVEFkJnrBBXgJg4xp
         t3RzPx+Bm4gRv/+oerezjmyfTjVAAxplS+aAjrrjf1qnRMaRK/Z++M3LxeJYscjvjAVV
         +9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lf5oSAywwuaj5Fh57ugeWpBI7UCwJcYNfPkenTc12XM=;
        fh=eZzEWTbnHF7Y9cam/Z6tdsGb8069LNe55Bi+7O4fDYg=;
        b=Fw5IolUdTrcjS8u7S3POu6wezkR9e+tpCZkqe2TaHRi9OLy3XG3dPdmhMhsU7HRlW0
         j02ahN3ApbbUIpMnNxVq2OaEDnMsVuyPPg5UokkFc0+I9EzOFEYwJgl94oF64ei6mw8V
         aMpPfNRTfexfUQ3gaxtr/vVGHOvY+V2v/BQKif6Nsyblw3zD5BnaPN9KhWU/EAmIdjdb
         XjNp0ztPyMW7w7CtYLG7nDya3ovS/bApkGIjkLcTBgKAZjAmYP1rQy+omic3sdD4CRhS
         RS98dbU5UisWzuQLI1Wybzl+4UY1oA8pBR2KggiYG2hbmmeEFek7BQWBUxrv0IJFI6Nk
         vIfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781512278; x=1782117078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf5oSAywwuaj5Fh57ugeWpBI7UCwJcYNfPkenTc12XM=;
        b=PRCmIF6H6gAAMjlw83xgoY+yVrROMne+VtNUS/XxPIT8QgwrnIVNtMq9NKttrAoS1v
         d7Yoaze/ebjeW60N9EIm0UihPs3Fv7ksO9X/jaOcuOpH9tEeAHCU8xG/4Wp+NWUuiuzj
         DNjLY9rTWmllOMKtmkXjHZfARWn1wgAHozNiPWuy+yTEjBAUv54EelRznJBgLjRhie5p
         jZ3b2RnaxH1gWzL0XbAVoegsLVN+DDC1pLMM0z0WsEwEyZRLwJkgG79nJ6NLJrNBcM0P
         zYqoyFrCiVzBDwR8CZ5ku8O2KmsVmriUV3NeW2k5DIx1enY699s5OnrmhIZ+qlmCN2BK
         lRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512278; x=1782117078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf5oSAywwuaj5Fh57ugeWpBI7UCwJcYNfPkenTc12XM=;
        b=EbUqPWVbevidCZmkmgP+wSFFQo+GAggWdu0nUukCu1X/farqDyTJrDxOTM3BDKEUul
         2zx/nRSuE2jO8TGTS6Y/q3b0LneZXYcRyy/wzkD4oLtEnzz2Loeanwa2DethVGhDojHc
         pu52w/JLSDss4V+Z9oZp3ER8ME0BY3hHL1PBmLVw1Q847xpaoArwekgr9CBsHVeSgT3U
         RBHwiF/22l3pBO5WNXkutG9MreOVzm9LZiHH0LIF/MqQO4ndmPZe/2SGyDkTo0aXOb9s
         WecGQZ6jslaPe/wineU7gZ2bTtlVZwexu8qrFgJwEECNcm8YnkKkVoXXIRDDDajCfNdP
         KC6g==
X-Forwarded-Encrypted: i=1; AFNElJ9xnEnZLMHp0FzsJ8lMdKmG5cA30OhrnxChRzmfH0v9m/018GRB/TuGJ13gIjt+SrsbM37+Zzx5/5YfTVAaqkQF@lists.infradead.org
X-Gm-Message-State: AOJu0YyAusF6c+QI0e9+rn20DaBvgcYkLgIhxMjCGuEInIDGBslEzTwm
	VOfj1cx6HBdKTO3GRj+/WfNyKLaA6ta+MvznTFxHrI8hpx/Mlr8NyDsY0ndU1YvYdcAOEL2/iOB
	sUCXaEohPLndusD1RdphqZs+sihzxoZfl+rTIHI8+
X-Gm-Gg: Acq92OFm/p1LcEekMLYytIDcUXVhy93ntXCJvO1dc5vXn8XYf6CncjUyHSFxDhi6cu4
	5AyhIK7V8YIsH/r26MzBxyxc99tarzBrGUorLDuMqtmekMnD8h2pUGEhymbBVz1JqsEbvZOIs8H
	pfTyH4Ayn3IU6mBZdC2oV9wORKx4sd/ixu7yMz9rCAu2ByjATL4fw1HO9ccAAwyx7kZir7c+55n
	eqr7TcTNGW5JZ5wANT9jUAhQsMgFnJrOX78Blg4oBz04ga0+NK2qI/Td45XD5/nHoZu3LL9DR4B
	N+jJoJCd
X-Received: by 2002:a05:622a:259b:b0:517:99ea:ab7e with SMTP id
 d75a77b69052e-51954aa0119mr15764481cf.24.1781512277927; Mon, 15 Jun 2026
 01:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
 <CA+EHjTxditViT-yd+y-DZ8zM7dATVEpe8qWNGbugq6sL7KN+uw@mail.gmail.com> <ai-3ii1BtOPP25zZ@google.com>
In-Reply-To: <ai-3ii1BtOPP25zZ@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 09:30:40 +0100
X-Gm-Features: AVVi8CfOdOmbcJCI28yG7LXzWPtT8_aBQIv2i0hFe5aIhj1Gi5TsHAY_jSZdybc
Message-ID: <CA+EHjTxG8dK8o7GmoH9hg1p0h5W7H8EnNt1ZwRRXQcNad7R1pw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013119_902709_0A2E2C4B 
X-CRM114-Status: GOOD (  32.60  )
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

On Mon, 15 Jun 2026 at 09:28, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Sun, Jun 14, 2026 at 01:57:56PM +0100, Fuad Tabba wrote:
> > Hi Vincent,
> >
> > On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> > >
> > > Hi all,
> > >
> > > This series adds a hypervisor event "hyp_printk" which enables
> > > developers to log pretty much anything into the hypervisor tracing
> > > buffer, just like the kernel function trace_printk().
> > >
> > > This enables rich logging from the hypervisor, while leaving all the
> > > string parsing burden to the kernel. This has been the main way of
> > > debugging pKVM in Android.
> >
> > I tested the series on v7.1-rc7 under QEMU (cortex-a53 CPU, pKVM nVHE):
> > - Booted a host under pKVM with a non-protected kvmtool guest (npVM)
> > and a protected kvmtool guest (pVM).
> > - Functional test: added a temporary trace_hyp_printk() call site in
> > handle___kvm_vcpu_run() with 0-arg, 1-arg, and 2-arg calls. Mounted
> > tracefs, enabled the hyp_printk event, ran a kvmtool guest to trigger
> > vcpu_run, read the trace buffer. All expected entries appeared with
> > correctly formatted output.
>
> Thanks for the testing!
>
> >
> > One question: kvm_hyp_trace_init() returns early when
> > is_kernel_in_hyp_mode() is true. On VHE-capable hardware, pKVM uses
> > hVHE. So it seams that the entire hyp tracing subsystem (not just
> > hyp_printk) is non-functional in hVHE mode. Is hVHE support
> > intentionally deferred?
>
> You got me scared for a moment but I did try hVHE and it seems alright:
>
>   [    5.369985] kvm [1]: Protected hVHE mode initialized successfully
>
>   $ ls /sys/kernel/tracing/remotes/hypervisor/
>
> is_kernel_in_hyp_mode() just checks if the kernel is running at EL2 which it
> shouldn't in the hVHE case?

I'll try again and report back, must be user error.

/fuad

>
> >
> > Cheers,
> > /fuad
> >
> > >
> > > Even though not strictly related to trace_hyp_printk, I have added the
> > > following two patches:
> > >
> > >   * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> > >
> > >     This one mainly intends to support one of the new features I have
> > >     posted here [1], which allows to enable tracing as early as
> > >     possible. I have added it here to limit cross-posting.
> > >
> > >   * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> > >
> > >     This one is just a cleanup.
> > >
> > > [1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/
> > >
> > > Vincent Donnefort (4):
> > >   KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> > >   KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> > >   tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
> > >   KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
> > >
> > >  arch/arm64/include/asm/kvm_asm.h              |  4 +-
> > >  arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
> > >  arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
> > >  arch/arm64/kernel/image-vars.h                |  1 +
> > >  arch/arm64/kernel/vmlinux.lds.S               |  4 ++
> > >  .../define_hypevents.h}                       |  0
> > >  .../kvm/hyp/include/nvhe/define_events.h      |  2 -
> > >  arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
> > >  arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
> > >  arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
> > >  include/trace/define_remote_events.h          | 19 +++++-
> > >  12 files changed, 176 insertions(+), 9 deletions(-)
> > >  rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)
> > >
> > >
> > > base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> > > --
> > > 2.54.0.1136.gdb2ca164c4-goog
> > >

