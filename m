Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8156ACD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nACpjvzcAjptbYO/D+EZnxCKpAsH5nEmPSKqPy+CCm8=; b=l4etB46sKOOe80UyednjBxvixh
	L4XXDJoXAcAynE3kMfAZW+asWyE7B1RgJq7kRYnvlBQ5brq+7ZoE5NS/FKRX2+Xa4gflTfqMjZgEZ
	ig5ltexAUA8BzMgiFkJhM5EWdFWoxOK4hcmJq5g2neLu0yDcTL19AEnghjw3C4gGQCuxb7R2utbWb
	xJItb3uQmBXDCV3uTZbVyb3Cy7XDIBpeipO+6GxgaDgfTUnvBpK+hjQ3bTSNFAiSP0KWpdgMwIVT3
	1Qw/USDUQZU0FUVCvw7Bqpj4oG68qVivqetyx+Oi82QLvS044Vf/rcUuZrA9Ssob7404CxcrJ0MWE
	r/X2EtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2ft-0000000DrgX-2IEq;
	Mon, 15 Jun 2026 08:28:05 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2fq-0000000Drg2-42ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:28:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso6807368a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781512080; x=1782116880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nACpjvzcAjptbYO/D+EZnxCKpAsH5nEmPSKqPy+CCm8=;
        b=fExTHQitwdxjH/Izw7glZ5iJoLr8hEhVxYUB8oUs0K1OuXxz+ijCMsoklPQcHc0Ebl
         58PZ2GaG8AIlLFl1vP5AYZw/C1460W3ZYSjwwaK5PdY7PSAuew+NLP8rYr5KIgj+Vojx
         kgW0ihUjEWmI4UHF/NpQOpwDl9/py/iwbzComSZPm32DsVRAKDOIOcFa3hvot7QUpd/g
         UU7GZxKjQFhDvAAGOqaExvzk8ZocXUix3Dt/+4cyU0xf4hR+Zuj+5efmi3bBDWU3MEvs
         bLfBby/9E2IQn9zbgFL87kaaCjGYdhy3LyLePYcXBPiaxEPvTHVi7c3dkw/3DB/Fnm8U
         0kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512080; x=1782116880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nACpjvzcAjptbYO/D+EZnxCKpAsH5nEmPSKqPy+CCm8=;
        b=LX3tVZAAl6Yvco3+OAjeGWhsHUF+jovNN7tQxbewtTFHc4q7z1Y0/dnWA63c9mrwni
         IroPwGCXcYMURkaHYZx5g8dRSLASFxWdXw1K9/o61Dqjo2vvF2aE8sy3nr/GH9WmTO0V
         D/+CtST3dCAbMpWJugurT/yy5+3FxcjWWI0jaDz7SgBZHj0lpXQAUJwvZcQU8Ti9J+Jr
         C6nJaOpQBKP8w13evBRwZTUAO2lQSnfU+gpWuYmmXttOajT3jaFLq66hdQY4UnoQYYXp
         nNjJxrrhbpsY3A6tKOIMNwf9MhUZtfoPyh4RLL8meZkd/anC/nuVJudDlZLYBwcgAZAn
         jtOA==
X-Forwarded-Encrypted: i=1; AFNElJ/yetQDfub9G2QJkm6x9H9ZH5TIDGP0E8lMKA1UjNplm/Mt0RkFzzo71P6mw/ufTYhYZypYGwBgHJ6ub2ygAUvI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyks3rmI8KeTs/IC+CoXdbWv6ZlZt2xW8lpRtX8K5E9W7ymMnuJ
	ZBYyGn4KEFsmeRYYpntQe0577dUWk0x1rbnIcnkhzlFloW3DtR13lbNAJiLVui4d8w==
X-Gm-Gg: Acq92OFk0D4qhi+kb6H8WgEQogM/6bTNFcAbGgpmEET/ma7q1Gv7R6gGpoavbBWSmoR
	W2mOsWpiPck5HxuYMxz30G+bHFJvS+fs2XA5nlH5qNYJz6G4J7ffPNAwhPObnBymXC+FflihUh/
	dg5zTiUt75BFhbrnfVD6M2A1AiJyyjHklKakbzSPynYKCeI8WlLW9tGXcJxoO+HypUoejxXgVFl
	QWdmfTnHVNVFZYqaEmtM2K/W2tG0lEbjAOKaF8BkSEgPV6nhlgMuyqEnCPknj6zUu0aSsXUeRw9
	TyvgQ2H0rNkSCVACvmLSRKVyowG8g5kxy8ppFvBZPd7qnnhp0VhFnLR3o9wv8jwL96wCwlhaIxd
	TwnJ32OSlpxNHuM8zGNBPQDBU36WNQ4DQYzrU735F9FYiPsXa3vq/swpnNXrWzrWvClZ4DAXi55
	1dNYwDfWMDOgNDxJZ79IgyTtBCnzpth22Op/5IAm+bV8CdBkm5i0zkBWyV4juztu133AU=
X-Received: by 2002:a17:907:9493:b0:bef:87ca:aec3 with SMTP id a640c23a62f3a-bfde279852bmr603924966b.9.1781512079604;
        Mon, 15 Jun 2026 01:27:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4423439sm416285666b.2.2026.06.15.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:27:58 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:27:54 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, rostedt@goodmis.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qerret@google.com
Subject: Re: [PATCH v1 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
Message-ID: <ai-3ii1BtOPP25zZ@google.com>
References: <20260612142245.1015744-1-vdonnefort@google.com>
 <CA+EHjTxditViT-yd+y-DZ8zM7dATVEpe8qWNGbugq6sL7KN+uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxditViT-yd+y-DZ8zM7dATVEpe8qWNGbugq6sL7KN+uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_012803_032028_1CC59E7D 
X-CRM114-Status: GOOD (  29.17  )
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

On Sun, Jun 14, 2026 at 01:57:56PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > Hi all,
> >
> > This series adds a hypervisor event "hyp_printk" which enables
> > developers to log pretty much anything into the hypervisor tracing
> > buffer, just like the kernel function trace_printk().
> >
> > This enables rich logging from the hypervisor, while leaving all the
> > string parsing burden to the kernel. This has been the main way of
> > debugging pKVM in Android.
> 
> I tested the series on v7.1-rc7 under QEMU (cortex-a53 CPU, pKVM nVHE):
> - Booted a host under pKVM with a non-protected kvmtool guest (npVM)
> and a protected kvmtool guest (pVM).
> - Functional test: added a temporary trace_hyp_printk() call site in
> handle___kvm_vcpu_run() with 0-arg, 1-arg, and 2-arg calls. Mounted
> tracefs, enabled the hyp_printk event, ran a kvmtool guest to trigger
> vcpu_run, read the trace buffer. All expected entries appeared with
> correctly formatted output.

Thanks for the testing!

> 
> One question: kvm_hyp_trace_init() returns early when
> is_kernel_in_hyp_mode() is true. On VHE-capable hardware, pKVM uses
> hVHE. So it seams that the entire hyp tracing subsystem (not just
> hyp_printk) is non-functional in hVHE mode. Is hVHE support
> intentionally deferred?

You got me scared for a moment but I did try hVHE and it seems alright:

  [    5.369985] kvm [1]: Protected hVHE mode initialized successfully

  $ ls /sys/kernel/tracing/remotes/hypervisor/

is_kernel_in_hyp_mode() just checks if the kernel is running at EL2 which it
shouldn't in the hVHE case?

> 
> Cheers,
> /fuad
> 
> >
> > Even though not strictly related to trace_hyp_printk, I have added the
> > following two patches:
> >
> >   * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> >
> >     This one mainly intends to support one of the new features I have
> >     posted here [1], which allows to enable tracing as early as
> >     possible. I have added it here to limit cross-posting.
> >
> >   * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> >
> >     This one is just a cleanup.
> >
> > [1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/
> >
> > Vincent Donnefort (4):
> >   KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
> >   KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
> >   tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
> >   KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
> >
> >  arch/arm64/include/asm/kvm_asm.h              |  4 +-
> >  arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
> >  arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
> >  arch/arm64/kernel/image-vars.h                |  1 +
> >  arch/arm64/kernel/vmlinux.lds.S               |  4 ++
> >  .../define_hypevents.h}                       |  0
> >  .../kvm/hyp/include/nvhe/define_events.h      |  2 -
> >  arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
> >  arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
> >  include/trace/define_remote_events.h          | 19 +++++-
> >  12 files changed, 176 insertions(+), 9 deletions(-)
> >  rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)
> >
> >
> > base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

