Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB98CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raqXDfwkMXRUmW6TDGJbWsdyb8Rm1C9Uy9ah47adkoY=; b=FwAdU7oxWXpXD1LVsdRaFmSK+3
	gGVTlqE6iBvTNrgbbAM3d4DRYFHi+Ab18v5kxXIKK/6uN+3tFAtlSF+M7cLYROIsO1iBqb7z7lpDU
	WtE0xl/uYxOEjmrPo4EqGInoTl2t83gLzQekzFLgYP7F1uIgq8xdD1kllN2hriy8lt4VcGmC7B6gM
	2olW3b9pokpzCy2/THrkTil78BdAuPQkN8t9buPewC/oJA4gEg8wm+0fbiOFa6U2yjPv/9UoGcduk
	wQcl8L/x7zR6EN4gZT2+GJ3+vXhplMcy0KzdtxttrX/lWWsRwHqP2gnFqIkKvVlRx5pAM/C2VhrJa
	M5kARYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkQD-0000000Cznm-1Gyx;
	Sun, 14 Jun 2026 12:58:41 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkQA-0000000CznM-1wdR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 12:58:39 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51765531803so655321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 05:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781441916; cv=none;
        d=google.com; s=arc-20240605;
        b=RxKXzvDLrWimXSq5fajY6nkANUJEVl2ocmIAy42JwGS8Efvcr3M4fPn6sz7mTQ+cKX
         ij43jyaMS8DJIEsua1lw0bVX7502/mXFnjsHw4t7df6hro1DbyD4KuiNvaZ9XyjeFEQU
         C3NO6VP5iP67YCgtYL0EOcDdL2fOPCq6CfIUgzliqkvrWOdRxxL9MrXlUD5GHzaWCbfk
         apeuVDEiowpHP1ti6F4yhflpl7nR9Ic8qNkgRNsAeuSOb/1AqA8whZWS25TaN8gMKAZM
         GOrPJmewZWEO/3cEEHGCSwS9rtSfYujKsKYdy3oa5aTe8J+1PLXzP65/Mwftfv6FsX16
         Ac9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=raqXDfwkMXRUmW6TDGJbWsdyb8Rm1C9Uy9ah47adkoY=;
        fh=CSsXDUkAy+SX1/QyUB04yv35UGDq4eK6nV0l8BslmXM=;
        b=MW0W8wLquxpO4zugZKCC2O2PGVRdWZLli2Th7QchzedbDmXa0eoPzdC5JPEpypFG7G
         6Tbh1jR1ktUDTbTWxhoAIn4Xmy0JIGILf+KmpJDss4poxa9n2yM43zhYmw3R5/8ACFMs
         n9Ebyi1n7RJZrAFKtzMQsIKzJ6A7SOI5sjz/NxgXbNYZ6WNaVpYCodXLnrura0EHJHLb
         4Q74Yp58W6806wpwo7qKmc0geXaJUaP+l16OGw0/J1lV+FywuxFcLMZgDFDhkD6X8sqA
         t62ScIKBlcu5vkL5P5g74He2jyIsGDPlaVje2amGI7Pb5KM8wD7vcL8JddVQFuM88z0G
         KG2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781441916; x=1782046716; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=raqXDfwkMXRUmW6TDGJbWsdyb8Rm1C9Uy9ah47adkoY=;
        b=LgBdFYGyjJwR0/1s44uGBqQ37CAKM5SLi4+eDC5Sm848PF9AVBuglpvKvpiJ4/1x0i
         3qQi4dOrYujs/ILeH/TklNMMruIFHWTO0VplNmPuWn589i3HaSW/BW90hxoivne+dXJG
         y1fFV0bT7LSTbqU8W4f3KKW7bURHFptULqHgacywy7fT6MBxDmobP1V39xHvqYBS3/hE
         Rt6iO+464bjs22xfEko279dOC7J3X+1NS8F88TUCu6XrUmEp/HtxI+pgjpkI4oiARY/V
         ZP2gqCYXhg79aAHKZRdpPtPjgPYghJXAKa4bojbm42cgS3CwfgXMGrEUUooqBUdd/m3S
         mBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441916; x=1782046716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raqXDfwkMXRUmW6TDGJbWsdyb8Rm1C9Uy9ah47adkoY=;
        b=sNzp/C7/sChrxR1QPOeW49r24jJqWiscx149Ed3nv9t4x2qbo0Pmw9vVypgWndf9vI
         zQ/OhqKjtp7lLdRhUTZ/Se3GdxPsCp2aTiCaSIFc116SUT7MdxeIVCcr2j5mKMuQJZpg
         33u2B1GQdBNX6UZOxVfUErErT4xoaFgHuwhsMkGsu7sXLTv18l08raRqHRgYSJQVQ2lG
         UKOSH+8bHGI1w8U2AljSEz1Y/JMC7pUQsoVquSWWpBtlA6wRc4Y+tctoMsvbZgaV/vWY
         RpNXcWCQTpKB47pU9BYQO5kvl69kls1Ae44mQoUyBifR21rZvYDaD8HX26qp3u4Ha/nf
         3Ttg==
X-Forwarded-Encrypted: i=1; AFNElJ8FdTBuC5y1Usgl2ZAPAtCnJSWadvwQCUrB/IxvQyYomnHjc+Mj+LyM8zSjmRIuLd6NYNLCe3VkjC/xcv5wD6ki@lists.infradead.org
X-Gm-Message-State: AOJu0YwV7RhMmtrvWaq0c6rRiI2rhqclG++Vz+PG2mWHzGk+RshPi1fe
	u3k3Ilks6kpTZ/sOZIPjmTLAl5rHwGc1DrQHdcluiVNAZN9Z/tVfccQJT2Txoxp30jfmC7Nuz/C
	IIvFzoOvuMZ7MjnS7NeEBN+oUB7QLStSG3y/19tog
X-Gm-Gg: Acq92OF4W8dEWJ8edB5jeyRqV81RE1NOi9CiAsqIq0gfz0TmHH0brNg4/3VASJNX+HH
	ij2/LkwV32MEwEmXBaPyEW6J60pK4J3Zerx03YRJQOGea6577k0JqJ8bxZIlIMHZrJ2drY9Yacw
	xxpKyRvd4Mh3YALKEaMSo8WDKPQhjbDKb0kTSkiY9jZVU6XUxF1XPGgxa9C3oX2eK4Kbsre31QJ
	Kj+0nZwSl/FnX4cW/doDAWZYqMt1/MGNV1ojC43vaXPUcjbhN70WMwI21qmiX++j+5WOs21Cn6f
	Ls84XA4k
X-Received: by 2002:a05:622a:16:b0:516:4f62:85eb with SMTP id
 d75a77b69052e-51954a90335mr11763881cf.22.1781441914933; Sun, 14 Jun 2026
 05:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
In-Reply-To: <20260612142245.1015744-1-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 13:57:56 +0100
X-Gm-Features: AVVi8CdMUSvMeQIM4Hqjh1XZ6PUpczBd7rfGCO8vFiVuNomXp3ysnwWL4HQmk6A
Message-ID: <CA+EHjTxditViT-yd+y-DZ8zM7dATVEpe8qWNGbugq6sL7KN+uw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_055838_537347_73E390CB 
X-CRM114-Status: GOOD (  20.67  )
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

Hi Vincent,

On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Hi all,
>
> This series adds a hypervisor event "hyp_printk" which enables
> developers to log pretty much anything into the hypervisor tracing
> buffer, just like the kernel function trace_printk().
>
> This enables rich logging from the hypervisor, while leaving all the
> string parsing burden to the kernel. This has been the main way of
> debugging pKVM in Android.

I tested the series on v7.1-rc7 under QEMU (cortex-a53 CPU, pKVM nVHE):
- Booted a host under pKVM with a non-protected kvmtool guest (npVM)
and a protected kvmtool guest (pVM).
- Functional test: added a temporary trace_hyp_printk() call site in
handle___kvm_vcpu_run() with 0-arg, 1-arg, and 2-arg calls. Mounted
tracefs, enabled the hyp_printk event, ran a kvmtool guest to trigger
vcpu_run, read the trace buffer. All expected entries appeared with
correctly formatted output.

One question: kvm_hyp_trace_init() returns early when
is_kernel_in_hyp_mode() is true. On VHE-capable hardware, pKVM uses
hVHE. So it seams that the entire hyp tracing subsystem (not just
hyp_printk) is non-functional in hVHE mode. Is hVHE support
intentionally deferred?

Cheers,
/fuad

>
> Even though not strictly related to trace_hyp_printk, I have added the
> following two patches:
>
>   * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
>
>     This one mainly intends to support one of the new features I have
>     posted here [1], which allows to enable tracing as early as
>     possible. I have added it here to limit cross-posting.
>
>   * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
>
>     This one is just a cleanup.
>
> [1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/
>
> Vincent Donnefort (4):
>   KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
>   KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
>   tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
>   KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
>
>  arch/arm64/include/asm/kvm_asm.h              |  4 +-
>  arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
>  arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
>  arch/arm64/kernel/image-vars.h                |  1 +
>  arch/arm64/kernel/vmlinux.lds.S               |  4 ++
>  .../define_hypevents.h}                       |  0
>  .../kvm/hyp/include/nvhe/define_events.h      |  2 -
>  arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
>  arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
>  include/trace/define_remote_events.h          | 19 +++++-
>  12 files changed, 176 insertions(+), 9 deletions(-)
>  rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)
>
>
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

