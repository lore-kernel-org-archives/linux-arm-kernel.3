Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606B1CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0YvRC2XyG3/0ftsAtYxtYAMsDCEsoQr81DmullkijE=; b=uNwlSyhb+DTojLm1eMwqUTOeMq
	6/WDtXLa97j4nGXBkfE+GVDXD6Ur15ntyCiCwrOaE27MGDoO8Qi/xS3JWMqQ0gOJsXd0TxOp1ui9p
	ZK5tfZyaR+xEpl496H6/HPw9EatsEPUfso05RK0ch8iWX22DhqFzYbo8I/rs0ZxSAT5+UYHBYVtzi
	nizUbDnMhKFgIffEBgbj93TbLe3JKrRzvZmakfchYW7dSEcc/ZpbzeDO+Ks0VIZPiSwvf4MYYZc9B
	siACEgYjb/m+rTvR5w/+4zynPrtkmx+9CqdkDfHq9n1iCkvqq2l+4bc9i7Fhj1Y17vON8ZrK5LCyX
	ecu0AGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ38e-0000000DvZP-1SSE;
	Mon, 15 Jun 2026 08:57:48 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ38b-0000000DvYj-4AOX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:57:47 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5177d1ff061so9781cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781513865; cv=none;
        d=google.com; s=arc-20240605;
        b=hq+YVgXOVmnwCPSjz6o3/e54IqLhSBeq8O/eWAdGaTO9NKhDomYZ+VXLxKOxNFWbOo
         xIwM17x26wfNMeTxsTq4rHLgnBhE0TYZfCyG5sKN6c1X4OTjSTg8vmwuBfLrznOGgeWi
         LqLINvo8ARyd6/HTnaoLV8jOXWGeQS45t7D/4B+EaVQwMRvf2M7gVmfV4NuhV4SvlOf6
         mxNoTrHUtJdCJm+Blurhlr15/Pnp9/b8TVs6L9apKbZsgj1pzuDRRbpaObrgNUNy3IDh
         KJwPtrHYxcoH2hAzyz7PAlywbp3Wpwd2kSG48ZktH6YW2RkCIJj4uM2VGHU/T6EdjR57
         iyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w0YvRC2XyG3/0ftsAtYxtYAMsDCEsoQr81DmullkijE=;
        fh=JNfh7+ZSEY+Ys60mUn95fmF2xWirIA6dQJKrcRKuVao=;
        b=drAfb7jOS0ejDZLSWbDMUyJdjQ4F/usKjvrE+xA0jzZqHlyZwAqV+Zyi7fKr6q0ur+
         JkeImmf2Vn+Pspwg2M5J4pMABWNfRQtlgmL/xMturSo5WBBn9A9vvwrESxhmJaC0ch5y
         OB6MzPiZxaxZNdGQ23k1QHJe7Kt/q2FoNneEXEfnADClShCP97eyym+uXvsgxvWkTRec
         r2b5O1YmVK9nuJj53o3/so60+qMLdnlL+3kNfBuwZ7GgqmKqIwlJBA2EDvVpzX3yq5JF
         viuKhY2inXtukWaQp/bpjiDoBeOI06ilSprEJ9lzYBwipJDam4yQ2CTTzsRoQNsdpF3G
         zsWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781513865; x=1782118665; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w0YvRC2XyG3/0ftsAtYxtYAMsDCEsoQr81DmullkijE=;
        b=XgR92EnLL5meiw7RxWBwYOXhKMicgzjyiwH98scVjan+HDSsrb0eF9BOTyRMyBJH26
         0qVdaBqSJZ+XjfptjwszisFFfSA/RztstgICg72BcCrnlm5lAfbpDNQMWVFgASUlB+6Q
         +Mjxfjg+vTTuHdQNpyT9sHsdoE5GDBn2WFfofLWKQMgikWErMlSu+sAftnYfeqRm9iZz
         pcXg1mbB5tvAWz6zmdrhcYVRKlQK1b6KGgtP5spCR58tnvLbrfxquT8qo4ayeRXb0+gS
         qLyIilTH8pvL695/JZKQ6ymOMOq7YFWX2hD6WSXLRyIp8tNWEiWVwMke7DtqJGJqyTy7
         21pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513865; x=1782118665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0YvRC2XyG3/0ftsAtYxtYAMsDCEsoQr81DmullkijE=;
        b=IFWwDxn6by0r6n+wGNLDNBFiCd39AIDzTbzqFJ59ufIVSNqBxgu+ur8PBigXwtn1iZ
         LDiMDwbsDUCYgqsXx/DUEWvagszHzo29tDLnCw8F7NOMCvv4zVHKgq+EbBngfZ5fT7MB
         BCVq5n6dGS8U0zrWlTGynCWUeCgVEuGmBl8AZdliS5l8k2mqpvR19jYtkmvyhQUio6sQ
         jHa9geLzskBywJpFFUBpE1G0lKArf6LYe1MDLbB09xwIb+BQbbXGolyLqHj4gBGAFiap
         TFUfrg2byBTRKPmQWF0otwyctyPgW9se8UGwhYshk2NrJExGbRRteTwqAKIjHVFf0ZzQ
         /zrw==
X-Forwarded-Encrypted: i=1; AFNElJ9P+rnNBTUtNxHZ5UC3HIa9voyz1v2kItqbMAkIlqFUy4cQuIMbS2Q+w6/ezYgduI8gHYMX6m4UfyBHK4hLYXjb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4m7D3EsLadNt35xC/Qe6994qU1riCBfT6Pto0GKnC6QF6pby3
	4FSvcn1OpIAyXtgFwwFQx5fVCm1u3Lqs/jQKyc8qegCx19Wq1Qvi36w7tOCgAnju4HLvRdvTVpp
	xOSrva2yMN74iFPBewSK8StL0WduemBCPtwELaZnN
X-Gm-Gg: Acq92OECwlsy1Lh9ShAwqjDHSbVKK3/71mWS0FWKwA1qZI4lyakjFnoGHPWl93ztd0A
	1s1FW73m4UWT5QxcpRuCiph8mS0p7e48JvSxeSZYI1IPTbIZm49sRIawvudhEgOP3eW5aQA25Ro
	h8WZVgzRVt99TeUY39a6cuCaD1F7AooHWgNBgOk7Xy+xNU2Hh4pACMKDoyA6P5Y/jsZzrVeKCGq
	iQgm9G7q0GTnilxe79RrkyOxyAkwqnSelsbI8EXHw4l3ytBhbjLUMeDzR5sGyL0Ubmc4uOgp5q2
	V55g02qTEUQ3thlYVNE=
X-Received: by 2002:a05:622a:4a16:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-51955e0312dmr16071311cf.1.1781513864113; Mon, 15 Jun 2026
 01:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
 <CA+EHjTxditViT-yd+y-DZ8zM7dATVEpe8qWNGbugq6sL7KN+uw@mail.gmail.com>
 <ai-3ii1BtOPP25zZ@google.com> <CA+EHjTxG8dK8o7GmoH9hg1p0h5W7H8EnNt1ZwRRXQcNad7R1pw@mail.gmail.com>
In-Reply-To: <CA+EHjTxG8dK8o7GmoH9hg1p0h5W7H8EnNt1ZwRRXQcNad7R1pw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 09:57:00 +0100
X-Gm-Features: AVVi8CfkmZN27j_F1CgpJ6v5jI0GcIRXaBXtp0X3wAEEeteL-dHCDhXfvrkFdCU
Message-ID: <CA+EHjTyh5nTFVyEZLNgkNYCQp1a2g0B-o6W-m5FsVZd1X0MZhg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_015746_072862_FE4F3B7D 
X-CRM114-Status: GOOD (  34.53  )
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

On Mon, 15 Jun 2026 at 09:30, Fuad Tabba <tabba@google.com> wrote:
>
> On Mon, 15 Jun 2026 at 09:28, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > On Sun, Jun 14, 2026 at 01:57:56PM +0100, Fuad Tabba wrote:
> > > Hi Vincent,
> > >
> > > On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > This series adds a hypervisor event "hyp_printk" which enables
> > > > developers to log pretty much anything into the hypervisor tracing
> > > > buffer, just like the kernel function trace_printk().
> > > >
> > > > This enables rich logging from the hypervisor, while leaving all the
> > > > string parsing burden to the kernel. This has been the main way of
> > > > debugging pKVM in Android.
> > >
> > > I tested the series on v7.1-rc7 under QEMU (cortex-a53 CPU, pKVM nVHE):
> > > - Booted a host under pKVM with a non-protected kvmtool guest (npVM)
> > > and a protected kvmtool guest (pVM).
> > > - Functional test: added a temporary trace_hyp_printk() call site in
> > > handle___kvm_vcpu_run() with 0-arg, 1-arg, and 2-arg calls. Mounted
> > > tracefs, enabled the hyp_printk event, ran a kvmtool guest to trigger
> > > vcpu_run, read the trace buffer. All expected entries appeared with
> > > correctly formatted output.
> >
> > Thanks for the testing!
> >
> > >
> > > One question: kvm_hyp_trace_init() returns early when
> > > is_kernel_in_hyp_mode() is true. On VHE-capable hardware, pKVM uses
> > > hVHE. So it seams that the entire hyp tracing subsystem (not just
> > > hyp_printk) is non-functional in hVHE mode. Is hVHE support
> > > intentionally deferred?
> >
> > You got me scared for a moment but I did try hVHE and it seems alright:
> >
> >   [    5.369985] kvm [1]: Protected hVHE mode initialized successfully
> >
> >   $ ls /sys/kernel/tracing/remotes/hypervisor/
> >
> > is_kernel_in_hyp_mode() just checks if the kernel is running at EL2 which it
> > shouldn't in the hVHE case?
>
> I'll try again and report back, must be user error.

Confirmed, user error. I must have messed something up with the hVHE test.

My Tested-by for the series covers that now too.

Sorry for the noise.
/fuad
>
> /fuad
>
> >
> > >
> > > Cheers,
> > > /fuad
> > >
> > > >
> > > > Even though not strictly related to trace_hyp_printk, I have added the
> > > > following two patches:
> > > >
> > > >   * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> > > >
> > > >     This one mainly intends to support one of the new features I have
> > > >     posted here [1], which allows to enable tracing as early as
> > > >     possible. I have added it here to limit cross-posting.
> > > >
> > > >   * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> > > >
> > > >     This one is just a cleanup.
> > > >
> > > > [1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/
> > > >
> > > > Vincent Donnefort (4):
> > > >   KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> > > >   KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> > > >   tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
> > > >   KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
> > > >
> > > >  arch/arm64/include/asm/kvm_asm.h              |  4 +-
> > > >  arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
> > > >  arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
> > > >  arch/arm64/kernel/image-vars.h                |  1 +
> > > >  arch/arm64/kernel/vmlinux.lds.S               |  4 ++
> > > >  .../define_hypevents.h}                       |  0
> > > >  .../kvm/hyp/include/nvhe/define_events.h      |  2 -
> > > >  arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
> > > >  arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
> > > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
> > > >  arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
> > > >  include/trace/define_remote_events.h          | 19 +++++-
> > > >  12 files changed, 176 insertions(+), 9 deletions(-)
> > > >  rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)
> > > >
> > > >
> > > > base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> > > > --
> > > > 2.54.0.1136.gdb2ca164c4-goog
> > > >

