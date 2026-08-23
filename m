Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E787DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6JRhIClHpIiMlFLO5uTGIqqFtPw2tQAF6VLvxWskqc=; b=SiWpvE0/9r5tTZLRwGSpdIQCwd
	zpKCwzoNTr7oJXP2w9JOMbnkeyekfxHEEVtGPeer7+bb2yUft9w3ZGP1R8QzFmljOyA+/8eds7AoW
	atgsRZbCKzMePPL7AEBnfviv2pnoqxSfG1KXN8PDUHv8FoE2rKVS7U0RRLI7n9Xiv83clgYTx0LbU
	FcCWryaFAqZ8yw7HyjYvLDBZa8BJQT6UQmxJc7yPmMmOyY5n7FF5szviIxi6atz+KCJIYH/u0Q2+J
	tyBNqQbv8LSVOm8g9G5gEaVzGpZII/POnvYYsa8x5+MTmsu/Rf1KA99Eu1tXDwmDB8ZItAVo/c1zT
	A/2IdALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7xQ-0000000FNWA-0Doe;
	Sun, 23 Aug 2026 13:09:52 +0000
Received: from out-92.mta0.migadu.com ([2001:41d0:1004:224b::5c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7xM-0000000FNVi-1J9L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 13:09:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+5k1rXmTX/it9boYs3lIDPyaHBv4G9129/fVZ2lADWQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787490583; v=1; x=1788095383;
 b=HP7iy8wkYruvox1Q1XkjaZh06SZIuJ9J4kFAkJd1WQuoSTROk9ASvJzdGOpM4P43GwW2S1ZF
 bq1vMBxkefzmf3xbefBzneNP2Owb+l5hwAKpSUG0PHbOliU/rj7TqZfAQsxxW7mM4UOzLJAulzl
 ngTSSnWD0HIwTsS7m08vl3x8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f52.google.com (209.85.167.52)
	by smtp.migadu.com with ESMTPS id 01c8261515b48322;
	Sun, 23 Aug 2026 13:09:43 +0000
X-Mizu-Trace-ID: 01c8261515b48322
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so4960e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 06:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8oI6W1iutJWQqSZOVGPQ1I4wzDNTjeIIRNpqHhAySBfI1bi8YIohZ9GSwZl6zG+pycm7Xtw+zQVqeBcCIFME1@lists.infradead.org
X-Gm-Message-State: AFuF++lQLCMIkPQ+OEBNqlZdiUb8oR40rDkR8jXY0JhMND0Nsn7ebhE+
	2Y+IAhn7zJ27Rx5mKrKgMjOSEGgMuxS1J0zeTsk6CcgXh4WXppIQPFIpxMMPr+k7tphLA1BTeTp
	NKXqU6eb6NBmLfHu4SW1uLd7vHU+sljmNhmWqREpu
X-Received: by 2002:a05:6512:110a:b0:5a8:6646:d7b4 with SMTP id
 2adb3069b0e04-5b48c2f3ce4mr101634e87.1.1787490578785; Sun, 23 Aug 2026
 06:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260819142558.1300100-1-fuad.tabba@linux.dev> <86se464ixe.wl-maz@kernel.org>
In-Reply-To: <86se464ixe.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 23 Aug 2026 14:09:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwCuSO37k3mJSJLPW4kHHN+MTWYiLRLQMzNzisMsunQ=A@mail.gmail.com>
X-Gm-Features: AcwNN1VTPhsoVRXIEYl1K8kNwsfcX0dYbmxiyufgRZKr-RVlTK7GPAHaV8SAaFM
Message-ID: <CA+EHjTwCuSO37k3mJSJLPW4kHHN+MTWYiLRLQMzNzisMsunQ=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: Defer the GMID_EL1 read to {init,update}_cpu_features()
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Oliver Upton <oupton@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_060949_095857_BCF9E1E5 
X-CRM114-Status: GOOD (  29.43  )
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

On Sat, 22 Aug 2026 at 10:13, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 19 Aug 2026 15:25:58 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > __cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
> > ID_AA64PFR1_EL1, so it reads the register on MTE hardware even when the
> > kernel has disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets
> > HCR_EL2.TID5 in that case, which traps the read to EL2 and injects an
> > UNDEF:
> >
> >   Internal error: Oops - Undefined instruction: 0000000002000000 [#1]
> >   pc : __cpuinfo_store_cpu+0xf4/0x264
> >   Call trace:
> >    __cpuinfo_store_cpu+0xf4/0x264 (P)
> >    secondary_start_kernel+0xc8/0x1d0
> >    __secondary_switched+0xc0/0xc4
> >   Kernel panic - not syncing: Attempted to kill the idle task!
> >
> > Only pKVM is affected, and only for a CPU onlined after KVM init: its
>
> Is that for a CPU that has gone through a an offline/online cycle?
> Because otherwise, such a CPU wouldn't be able to boot at all (we have
> a strong requirement that pKVM sees all CPUs at boot time).
>
> If that's the case, some clarification would be good. Otherwise, some
> clarification is absolutely required! ;-)

Yes, an offline/online cycle: every CPU's first bring-up happens
before KVM's initcall, so hotplug is the only way to reach
cpuinfo_store_cpu() with TID5 set. I'll say so in v2, along with a
note on the reproducer (offline then online CPU1 with arm64.nomte, on
QEMU with MTE enabled).

As a side note, to answer a question Will asked me offlist, it's not
an issue in any of the Android versions: Android 17 (and earlier)
never gets the trap. The Android commit that disables MTE there does
the HCR_ATA hunks only, and there is no handle_host_mte() either, so
the read is untrapped.

> > PSCI CPU_ON relay sets the host HCR before the CPU enters EL1, whereas
> > plain nVHE sets it at CPUHP_AP_KVM_ONLINE, after cpuinfo_store_cpu().
> >
> > Defer the read to {init,update}_cpu_features() and gate it on the
> > sanitised ID register, as MPAM already does. system_supports_mte()
> > cannot serve as the gate, as update_cpu_features() also runs during
> > initial SMP bring-up, before smp_cpus_done() calls
> > setup_system_features(). The init path gains the CONFIG_ARM64_MTE test
> > the update path already had, leaving SYS_GMID_EL1 uninitialised when
> > MTE is compiled out, where its only other user (lib/mte.S) is not
> > built.
>
> I'm starting to wonder whether having CPUs to go through a feature
> collection process during an offline/online cycle is a good idea. The
> data should still be there, and is not expected to change.
>
> Is it just that we don't have the correct tracking information?

I think you're right. Nothing on the arm64 side tells a re-online from
a first boot, so secondary_start_kernel() collects everything again.
The tracking is there I think: notify_cpu_starting() sets
cpus_booted_once_mask, and it runs right after cpuinfo_store_cpu(), so
the mask is usable at that point. Gating cpuinfo_store_cpu() on it
would skip the collection and the cross-check against the boot CPU on
a re-online, and leave the verification in
check_local_cpu_capabilities() as is.

That changes what hotplug does on every arm64 system, so I'll send
this other patch after the merge window, and keep the current one as
the narrow fix for stable (the trap is in 7.0 onwards). Does that
work?

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

