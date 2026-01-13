Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDFED30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MiB31PEzftiGi6EBzyBZ5GTh0yx74H4SnLQaZca0H0=; b=q8FYaDgLubHwFDJjPe2YYxGS0X
	P6mMo1ZtA1/P4rNAEUvkxSzF8RsmLeVzUtKwmzszdnZ1ra1JdVCMsA89/IqYqgoESEh5rsvyzaMFc
	uEv4vgJXUtvTaailL5IGSJGG+Oqd9D3Hl3rfTAQ2tLs08vfzf3KZtIu2Sm8nHbUeNmNrXkXWfZtPq
	/FzW+8/dPNtFk1YIueLNkURLBu4IMkgXp/ziMj8iwIyqjCEwc9OdQbynq2eJjM0f789ZmhUlmAnWX
	405b6rnvF8y1Zl+LDwirk0cJ4uIr/Pn/+LJHEO8+3Ei4i3W2WCt5Aj0HvTIabpsIyqMTxCPHqYiLW
	xvzyvDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfknw-00000007fvR-2lD6;
	Tue, 13 Jan 2026 20:15:52 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30] helo=mx0a-00082601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkns-00000007fv3-2Ysr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:15:51 +0000
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 60DHU1Qn029357
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 12:15:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=8MiB31PEzftiGi6EBzyB
	Z5GTh0yx74H4SnLQaZca0H0=; b=YdDFmF+pD+59O0+hcg4yq0T/xLyNP7TI6xyu
	KOqQFTSvieIvAFLANdvlDsj+uQF5RmGQDFw4ZYTfbERSwE4LXeLM3kgRi62MCq2I
	G8qIIDCZaB/W4sgzdDTpTu8E4pYrZIfMGMVra2++n0riEnBMEinqk4uA6FFv1dOw
	1gweGY8TC3BAyHQHM4EpNlxR/UgeP+pkLusz5bud1I0Gd0hgpC5IgPAR1tkSCU2C
	q6s4xijGKoBaxZLdAsKX0nHnRUvlNdh7n5wXedcAh3VkGBVR/i5HhrfXVzpA3LDa
	IBJC8mieJbMAPVQw/ElGcIQ7XzPgZVU/1ZWY1f8SoHSmAMMKlA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4bntgmspwj-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 12:15:46 -0800 (PST)
Received: from twshared26141.04.snb1.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 20:15:43 +0000
Received: by devbig071.cco5.facebook.com (Postfix, from userid 704538)
	id 4A553DF8374D; Tue, 13 Jan 2026 12:15:36 -0800 (PST)
Date: Tue, 13 Jan 2026 12:15:36 -0800
From: Ben Niu <BenNiu@meta.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Ben
 Niu <BenNiu@meta.com>, <niuben003@gmail.com>
Subject: Re: [PATCH v2] Faster Arm64 __arch_copy_from_user and
 __arch_copy_to_user
Message-ID: <aWan6Bymtg/e/EEw@meta.com>
References: <20251018052237.1368504-2-benniu@meta.com>
 <5fc3d97e-2736-468a-8038-8ae411385590@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5fc3d97e-2736-468a-8038-8ae411385590@arm.com>
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=B+q0EetM c=1 sm=1 tr=0 ts=6966a7f2 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=G0TMNxxQFAgbWyTrZrcA:9 a=3r5snXNnLsiO1MEH:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: bfggUlscFAK2wvf3sI5sjatyRJzs0bgS
X-Proofpoint-GUID: bfggUlscFAK2wvf3sI5sjatyRJzs0bgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2NyBTYWx0ZWRfX4u0coztIIxcq
 nS1Z/7y5tqLGb2B4F/6IoF7PuPE69U6NB73igACiQdt+E3qRgRxKcWHY7imnhXViURBey7acx6N
 3PFHR8BLEv516Jlu5VofJ13uFznu/CNDEVOvvQzNtbQYUkC36KwxoWGaFYcfI2FXssChAiMEN8r
 NpOOlUyjhi40U+GPF9VJTzW6RKls7JfhD9dgP5rbaxxKMBev16GPCcI+WId7zD9olNJLTl2Ett8
 Wbb3jYZQx4QmKeLD0iKn7QKsh8Csi4bVyvjE1ansVw16H7Ndz1b0NWaSAOIQ7dY3H1T9QioqQlc
 NMIeg1hmi6Ax0qFJqzJNqyc9TJzsqzz6dy7zSEov2ICeTR/ECkI9D/LVgPNBUfgYiP8rl01mEs/
 G9mOZTSp08lc7mBj02c6LJ5IwOkfMDpkVt5NiRVsocTjQXl4BSD7iito5SIQtBCWDcL/eODxizj
 8YKE3siurYFU9cS/fyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_121548_878944_246DBF5A 
X-CRM114-Status: GOOD (  45.70  )
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


On Fri, Dec 19, 2025 at 05:19:06PM +0000, Robin Murphy wrote:
> On 18/10/2025 6:22 am, Ben Niu wrote:
> > Summary:
> > 
> > This patch adapted arch/arm64/lib/memcpy.S to __arch_copy_from_user
> > and __arch_copy_to_user and the new implementations seemed faster
> > than the current implementations.
> > 
> > For __arch_copy_from_user, two new versions are provided: one for
> > when PAN is enabled, in which case memcpy.S's ldp/ldr are replaced
> > with ldtr; the other for when PAN is disabled. In both cases, proper
> > fault handling code is added to handle exceptions when reading from
> > unmapped user-mode pages.
> > 
> > Similarly, __arch_copy_to_user's PAN version has memcpy.S's stp/str
> > replaced with sttr and also fault handling code is added.
> > 
> > In addition, a new test case usercopy_test_init is added in
> > lib/tests/usercopy_kunit.c to exhaustively test all possible cases
> > in which the new implementations could fault against user-mode
> > pages.
> > 
> > Test Plan:
> > 
> > For functionality, I booted private kernels with the new impls w/wo
> > PAN and usercopy_kunit. All the tests passed. Also, I tested the new
> > functions using Arm's memcpy test (string/test/memcpy.c) on
> > https://github.com/ARM-software/optimized-routines.
> > 
> > For performance, I used Arm's memcpy benchmark (string/bench/memcpy.c)
> > on https://github.com/ARM-software/optimized-routines. See below for
> > results on Neoverse V2:
> > 
> > Baseline:
> > Random memcpy (bytes/ns):
> >     __arch_copy_to_user 32K: 12.10 64K: 11.98 128K: 12.11 256K: 11.50 512K: 10.88 1024K:  8.60 avg 11.03
> >   __arch_copy_from_user 32K: 12.04 64K: 11.82 128K: 12.11 256K: 11.94 512K: 10.99 1024K:  8.81 avg 11.15
> > 
> > Medium memcpy aligned (bytes/ns):
> >     __arch_copy_to_user 8B:  5.25 16B:  7.52 32B: 15.05 64B: 26.27 128B: 46.56 256B: 50.71 512B: 51.66
> >   __arch_copy_from_user 8B:  5.26 16B:  7.53 32B: 15.04 64B: 33.32 128B: 46.57 256B: 51.89 512B: 52.10
> > 
> > Medium memcpy unaligned (bytes/ns):
> >     __arch_copy_to_user 8B:  5.27 16B:  6.57 32B: 11.63 64B: 23.28 128B: 27.17 256B: 40.80 512B: 46.52
> >   __arch_copy_from_user 8B:  5.27 16B:  6.55 32B: 11.64 64B: 23.28 128B: 34.95 256B: 43.54 512B: 47.02
> > 
> > Large memcpy (bytes/ns):
> >     __arch_copy_to_user 1K: 51.70 2K: 52.36 4K: 52.12 8K: 52.36 16K: 51.87 32K: 52.07 64K: 51.01
> >   __arch_copy_from_user 1K: 52.43 2K: 52.35 4K: 52.34 8K: 52.27 16K: 51.86 32K: 52.14 64K: 52.17
> > 
> > New (with PAN):
> > Random memcpy (bytes/ns):
> >     __arch_copy_to_user 32K: 20.81 64K: 20.22 128K: 19.63 256K: 18.89 512K: 12.84 1024K:  9.83 avg 15.74
> >   __arch_copy_from_user 32K: 23.28 64K: 22.21 128K: 21.49 256K: 21.07 512K: 14.60 1024K: 10.82 avg 17.52
> > 
> > Medium memcpy aligned (bytes/ns):
> >     __arch_copy_to_user 8B:  7.53 16B: 17.57 32B: 21.11 64B: 26.91 128B: 46.80 256B: 46.33 512B: 49.32
> >   __arch_copy_from_user 8B:  7.53 16B: 17.53 32B: 30.21 64B: 31.24 128B: 52.03 256B: 49.61 512B: 51.11
> > 
> > Medium memcpy unaligned (bytes/ns):
> >     __arch_copy_to_user 8B:  7.53 16B: 13.16 32B: 26.30 64B: 24.06 128B: 30.10 256B: 30.15 512B: 30.38
> >   __arch_copy_from_user 8B:  7.53 16B: 17.58 32B: 35.12 64B: 26.36 128B: 38.66 256B: 45.64 512B: 47.18
> > 
> > Large memcpy (bytes/ns):
> >     __arch_copy_to_user 1K: 50.90 2K: 51.85 4K: 51.86 8K: 52.32 16K: 52.44 32K: 52.53 64K: 52.51
> >   __arch_copy_from_user 1K: 51.92 2K: 52.32 4K: 52.47 8K: 52.27 16K: 52.51 32K: 52.62 64K: 52.57
> > 
> > New (without PAN):
> > NoPAN
> > Random memcpy (bytes/ns):
> >     __arch_copy_to_user 32K: 23.20 64K: 22.02 128K: 21.06 256K: 19.34 512K: 17.46 1024K: 11.76 avg 18.18
> >   __arch_copy_from_user 32K: 24.44 64K: 23.41 128K: 22.53 256K: 21.23 512K: 17.84 1024K: 11.71 avg 18.97
> > 
> > Medium memcpy aligned (bytes/ns):
> >     __arch_copy_to_user 8B:  7.56 16B: 17.64 32B: 33.65 64B: 33.10 128B: 57.97 256B: 70.43 512B: 75.89
> >   __arch_copy_from_user 8B:  7.57 16B: 17.67 32B: 32.89 64B: 31.40 128B: 52.93 256B: 71.36 512B: 75.97
> > 
> > Medium memcpy unaligned (bytes/ns):
> >     __arch_copy_to_user 8B:  7.57 16B: 17.65 32B: 35.29 64B: 31.01 128B: 38.93 256B: 44.58 512B: 46.24
> >   __arch_copy_from_user 8B:  7.57 16B: 17.67 32B: 35.23 64B: 29.51 128B: 40.30 256B: 44.57 512B: 46.26
> > 
> > Large memcpy (bytes/ns):
> >     __arch_copy_to_user 1K: 77.33 2K: 77.89 4K: 78.19 8K: 76.36 16K: 77.39 32K: 77.94 64K: 77.72
> >   __arch_copy_from_user 1K: 77.40 2K: 77.94 4K: 78.28 8K: 76.56 16K: 77.56 32K: 77.92 64K: 77.69
> > 
> > As can be seen, the new verions are faster than the baseline in almost all tests. The only slower
> > cases 256B and 512B unaligned copies with PAN, and I hope the reviewers from Arm and the community
> > could offer some suggestions on how to mitigate them.
> 
> In fairness it's quite hard *not* to be at least somewhat faster than the
> current code, but beware that big cores like Neoverse V are going to be the
> most forgiving, and the results could be quite different for something like
> Cortex-A53, and even those older CPUs are still very widely used so they do
> matter.

Thank you so much for your review, Robin.

The numbers were collected on Neoverse V2, and they showed that even on the
most forgiving cores, the new version was still faster. Cortex-A53 does not
support PAN, so the new version essentially falls back to the same code as
memcpy, which presumably should be faster than the current
copy_to_user/copy_from_user.
 
> Certainly I found that a straight transliteration to ldrt/strt pairs in our
> memcpy routine is less than optimal across a range of microarchitectures,
> and it's possible to do a fair bit better still for many cases. Furthermore,
> microbenchmarks are one thing, but even a 100% improvement here may only
> equate to 0.1% on an overall workload (based on squinting at some numbers
> from our CI that would need orders of magnitude more runs to reach any
> statistical significance), so there would really need to be an
> overwhelmingly strong justification for having a separate !CONFIG_PAN
> version to chase a relatively small fraction more at the potential cost of
> weakening security/robustness (or at the very least, the ongoing cost of
> having to *reason* about security more than we currently have to with the
> architectural guarantees of unprivileged accesses).

copy_to_user/copy_from_user cost ~0.4% total CPU cycles in our workloads, which
translates to millions of dollars per year fleetwide, so a 100% improvement of
those functions does matter. A separate !CONFIG_PAN version would bring us this
benefit before FEAT_MOPS is available.

W.r.t. security, on cores without PAN, there's really no need to use ldtr/sttr
because other memory accesses in the kernel may be diverted to user memory. On
cores with PAN, having that !CONFIG_PAN path gives engineers maximum freedom to
choose between a perf-security trade-off. Sure, in cases where untrusted code
is running in user-mode, it'd be better to turn on PAN, but in other cases where
user-mode code is not hostile, one might disable PAN to get better performance.
On x86, SMAP is similar to Arm PAN and can also be disabled for perf or compat.

You mentioned that "it's possible to do a fair bit better still for many cases",
could you please elaborate on that? Would such improvements also benefit memcpy?

> As for the patch itself, from a quick look I have to say I find the mass of
> numeric labels even harder to follow that the monstrosity I came up with 2
> years ago, and while it looks like you don't quite have the same
> copy_to_user bug I had (missing the adjustment of src in the copy_long retry
> case), I think what you've done instead won't work for big-endian.

The numeric labels, especially in copy_to_user, can certainly be simplified.
If the direction of this patch is acceptable, I can work on further
simplifing the labels. Please let me know.

Not sure what bug you had (perhaps wrong calculation for the number of bytes
already copied before a fault), but this patch comes with an exhaustive test
that covers all faulting cases every user memory read/write instruction may
trigger.

This patch should work for big-endian because at no point any copied memory is
interpreted as an integer. This is true for fault handling code as well.  After
all, it's a translation of the memcpy that supports big-endian. Let me know if
I missed anything.

Thanks,
Ben

> Thanks,
> Robin.
> 
> > ---
> > v2:
> >    - Added linux-arm-kernel@lists.infradead.org and linux-kernel@vger.kernel.org
> >      to recipient lists for public submission
> >    - No code changes
> > ---
> >   arch/arm64/lib/copy_from_user.S | 434 ++++++++++++++++++++--
> >   arch/arm64/lib/copy_template.S  | 191 ----------
> >   arch/arm64/lib/copy_to_user.S   | 615 ++++++++++++++++++++++++++++++--
> >   lib/tests/usercopy_kunit.c      | 303 ++++++++++++----
> >   4 files changed, 1199 insertions(+), 344 deletions(-)
> >   delete mode 100644 arch/arm64/lib/copy_template.S
> > 
> > diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> > index 400057d607ec..a4e8dbd10336 100644
> > --- a/arch/arm64/lib/copy_from_user.S
> > +++ b/arch/arm64/lib/copy_from_user.S
> > @@ -20,38 +20,6 @@
> >    *	x0 - bytes not copied
> >    */
> > -	.macro ldrb1 reg, ptr, val
> > -	user_ldst 9998f, ldtrb, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro strb1 reg, ptr, val
> > -	strb \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro ldrh1 reg, ptr, val
> > -	user_ldst 9997f, ldtrh, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro strh1 reg, ptr, val
> > -	strh \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro ldr1 reg, ptr, val
> > -	user_ldst 9997f, ldtr, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro str1 reg, ptr, val
> > -	str \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro ldp1 reg1, reg2, ptr, val
> > -	user_ldp 9997f, \reg1, \reg2, \ptr, \val
> > -	.endm
> > -
> > -	.macro stp1 reg1, reg2, ptr, val
> > -	stp \reg1, \reg2, [\ptr], \val
> > -	.endm
> > -
> >   	.macro cpy1 dst, src, count
> >   	.arch_extension mops
> >   	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
> > @@ -59,13 +27,45 @@
> >   	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
> >   	.endm
> > -end	.req	x5
> > -srcin	.req	x15
> > +dstin	.req	x0
> > +src	.req	x1
> > +count	.req	x2
> > +dst	.req	x3
> > +srcend	.req	x4
> > +dstend	.req	x5
> > +srcin	.req	x6
> > +A_l	.req	x6
> > +A_lw	.req	w6
> > +A_h	.req	x7
> > +B_l	.req	x8
> > +B_lw	.req	w8
> > +B_h	.req	x9
> > +C_l	.req	x10
> > +C_lw	.req	w10
> > +C_h	.req	x11
> > +D_l	.req	x12
> > +D_h	.req	x13
> > +E_l	.req	x14
> > +E_h	.req	x15
> > +F_l	.req	x16
> > +F_h	.req	x17
> > +G_l	.req	count
> > +G_h	.req	dst
> > +H_l	.req	src
> > +H_h	.req	srcend
> > +tmp1	.req	x14
> > +tmp2	.req	x15
> > +
> >   SYM_FUNC_START(__arch_copy_from_user)
> > -	add	end, x0, x2
> > +#ifdef CONFIG_AS_HAS_MOPS
> > +alternative_if_not ARM64_HAS_MOPS
> > +	b	.Lno_mops
> > +alternative_else_nop_endif
> > +	add	dstend, x0, x2
> >   	mov	srcin, x1
> > -#include "copy_template.S"
> > -	mov	x0, #0				// Nothing to copy
> > +	mov	dst, dstin
> > +	cpy1	dst, src, count
> > +	mov	x0, #0				// Nothing left to copy
> >   	ret
> >   	// Exception fixups
> > @@ -79,5 +79,365 @@ USER(9998f, ldtrb tmp1w, [srcin])
> >   	strb	tmp1w, [dst], #1
> >   9998:	sub	x0, end, dst			// bytes not copied
> >   	ret
> > +
> > +.Lno_mops:
> > +#endif
> > +
> > +#ifdef CONFIG_ARM64_PAN
> > +	add	srcend, src, count
> > +	add	dstend, dstin, count
> > +	cmp	count, 128
> > +	b.hi	.Lcopy_long
> > +	cmp	count, 32
> > +	b.hi	.Lcopy32_128
> > +
> > +	/* Small copies: 0..32 bytes.  */
> > +	cmp	count, 16
> > +	b.lo	.Lcopy16
> > +	USER(9000f, ldtr A_l, [src])
> > +	USER(9000f, ldtr A_h, [src, 8])
> > +	USER(9000f, ldtr D_l, [srcend, -16])
> > +	USER(9000f, ldtr D_h, [srcend, -8])
> > +	stp	A_l, A_h, [dstin]
> > +	stp	D_l, D_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 8-15 bytes.  */
> > +.Lcopy16:
> > +	tbz	count, 3, .Lcopy8
> > +	USER(9000f, ldtr	A_l, [src])
> > +	USER(9000f, ldtr	A_h, [srcend, -8])
> > +	str	A_l, [dstin]
> > +	str	A_h, [dstend, -8]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 3
> > +	/* Copy 4-7 bytes.  */
> > +.Lcopy8:
> > +	tbz	count, 2, .Lcopy4
> > +	USER(9000f, ldtr	A_lw, [src])
> > +	USER(9000f, ldtr	B_lw, [srcend, -4])
> > +	str	A_lw, [dstin]
> > +	str	B_lw, [dstend, -4]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 0..3 bytes using a branchless sequence.  */
> > +.Lcopy4:
> > +	cbz	count, .Lcopy0
> > +	lsr	tmp1, count, 1
> > +	add tmp2, src, count, lsr 1
> > +	USER(9000f, ldtrb	A_lw, [src])
> > +	USER(9000f, ldtrb	B_lw, [tmp2])
> > +	USER(9000f, ldtrb	C_lw, [srcend, -1])
> > +	strb	A_lw, [dstin]
> > +	strb	B_lw, [dstin, tmp1]
> > +	strb	C_lw, [dstend, -1]
> > +.Lcopy0:
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Medium copies: 33..128 bytes.  */
> > +.Lcopy32_128:
> > +	USER(9000f, ldtr A_l, [src])
> > +	USER(9000f, ldtr A_h, [src, 8])
> > +	USER(9000f, ldtr B_l, [src, 16])
> > +	USER(9000f, ldtr B_h, [src, 24])
> > +	stp	A_l, A_h, [dstin]
> > +	stp	B_l, B_h, [dstin, 16]
> > +	cmp	count, 64
> > +	b.hi	.Lcopy128
> > +	USER(9001f, ldtr C_l, [srcend, -32])
> > +	USER(9001f, ldtr C_h, [srcend, -24])
> > +	USER(9001f, ldtr D_l, [srcend, -16])
> > +	USER(9001f, ldtr D_h, [srcend, -8])
> > +	stp	C_l, C_h, [dstend, -32]
> > +	stp	D_l, D_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy 65..128 bytes.  */
> > +.Lcopy128:
> > +	USER(9001f, ldtr E_l, [src, 32])
> > +	USER(9001f, ldtr E_h, [src, 40])
> > +	USER(9001f, ldtr F_l, [src, 48])
> > +	USER(9001f, ldtr F_h, [src, 56])
> > +	stp	E_l, E_h, [dstin, 32]
> > +	stp	F_l, F_h, [dstin, 48]
> > +	cmp	count, 96
> > +	b.ls	.Lcopy96
> > +	USER(9002f, ldtr C_l, [srcend, -64])
> > +	USER(9002f, ldtr C_h, [srcend, -56])
> > +	USER(9002f, ldtr D_l, [srcend, -48])
> > +	USER(9002f, ldtr D_h, [srcend, -40])
> > +	stp	C_l, C_h, [dstend, -64]
> > +	stp	D_l, D_h, [dstend, -48]
> > +.Lcopy96:
> > +	USER(9002f, ldtr G_l, [srcend, -32])
> > +	USER(9002f, ldtr G_h, [srcend, -24])
> > +	USER(9002f, ldtr H_l, [srcend, -16])
> > +	USER(9002f, ldtr H_h, [srcend, -8])
> > +	stp	G_l, G_h, [dstend, -32]
> > +	stp	H_l, H_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy more than 128 bytes.  */
> > +.Lcopy_long:
> > +	/* Copy 16 bytes and then align dst to 16-byte alignment.  */
> > +	USER(9000f, ldtr	D_l, [src])
> > +	USER(9000f, ldtr	D_h, [src, 8])
> > +	and	tmp1, dstin, 15
> > +	bic	dst, dstin, 15
> > +	sub	src, src, tmp1
> > +	add	count, count, tmp1	/* Count is now 16 too large.  */
> > +	USER(9003f, ldtr	A_l, [src, 16])
> > +	USER(9003f, ldtr	A_h, [src, 24])
> > +	stp	D_l, D_h, [dstin]
> > +	USER(9004f, ldtr	B_l, [src, 32])
> > +	USER(9004f, ldtr	B_h, [src, 40])
> > +	USER(9004f, ldtr	C_l, [src, 48])
> > +	USER(9004f, ldtr	C_h, [src, 56])
> > +	USER(9004f, ldtr	D_l, [src, 64])
> > +	USER(9004f, ldtr	D_h, [src, 72])
> > +	add		src, src, 64
> > +	subs	count, count, 128 + 16	/* Test and readjust count.  */
> > +	b.ls	.Lcopy64_from_end
> > +.Lloop64:
> > +	stp	A_l, A_h, [dst, 16]
> > +	USER(9005f, ldtr	A_l, [src, 16])
> > +	USER(9005f, ldtr	A_h, [src, 24])
> > +	stp	B_l, B_h, [dst, 32]
> > +	USER(9006f, ldtr	B_l, [src, 32])
> > +	USER(9006f, ldtr	B_h, [src, 40])
> > +	stp	C_l, C_h, [dst, 48]
> > +	USER(9007f, ldtr	C_l, [src, 48])
> > +	USER(9007f, ldtr	C_h, [src, 56])
> > +	stp	D_l, D_h, [dst, 64]!
> > +	USER(9008f, ldtr	D_l, [src, 64])
> > +	USER(9008f, ldtr	D_h, [src, 72])
> > +	add		src, src, 64
> > +	subs	count, count, 64
> > +	b.hi	.Lloop64
> > +
> > +	/* Write the last iteration and copy 64 bytes from the end.  */
> > +.Lcopy64_from_end:
> > +	USER(9005f, ldtr	E_l, [srcend, -64])
> > +	USER(9005f, ldtr	E_h, [srcend, -56])
> > +	stp	A_l, A_h, [dst, 16]
> > +	USER(9006f, ldtr	A_l, [srcend, -48])
> > +	USER(9006f, ldtr	A_h, [srcend, -40])
> > +	stp	B_l, B_h, [dst, 32]
> > +	USER(9007f, ldtr	B_l, [srcend, -32])
> > +	USER(9007f, ldtr	B_h, [srcend, -24])
> > +	stp	C_l, C_h, [dst, 48]
> > +	USER(9009f, ldtr	C_l, [srcend, -16])
> > +	USER(9009f, ldtr	C_h, [srcend, -8])
> > +	stp	D_l, D_h, [dst, 64]
> > +	stp	E_l, E_h, [dstend, -64]
> > +	stp	A_l, A_h, [dstend, -48]
> > +	stp	B_l, B_h, [dstend, -32]
> > +	stp	C_l, C_h, [dstend, -16]
> > + 	mov	x0, #0				// Nothing to copy
> > + 	ret
> > +
> > +#else
> > +
> > +	add	srcend, src, count
> > +	add	dstend, dstin, count
> > +	cmp	count, 128
> > +	b.hi	.Lcopy_long
> > +	cmp	count, 32
> > +	b.hi	.Lcopy32_128
> > +
> > +	/* Small copies: 0..32 bytes.  */
> > +	cmp	count, 16
> > +	b.lo	.Lcopy16
> > +	USER(9000f, ldp	A_l, A_h, [src])
> > +	USER(9000f, ldp	D_l, D_h, [srcend, -16])
> > +	stp	A_l, A_h, [dstin]
> > +	stp	D_l, D_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 8-15 bytes.  */
> > +.Lcopy16:
> > +	tbz	count, 3, .Lcopy8
> > +	USER(9000f, ldr	A_l, [src])
> > +	USER(9000f, ldr	A_h, [srcend, -8])
> > +	str	A_l, [dstin]
> > +	str	A_h, [dstend, -8]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 3
> > +	/* Copy 4-7 bytes.  */
> > +.Lcopy8:
> > +	tbz	count, 2, .Lcopy4
> > +	USER(9000f, ldr	A_lw, [src])
> > +	USER(9000f, ldr	B_lw, [srcend, -4])
> > +	str	A_lw, [dstin]
> > +	str	B_lw, [dstend, -4]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 0..3 bytes using a branchless sequence.  */
> > +.Lcopy4:
> > +	cbz	count, .Lcopy0
> > +	lsr	tmp1, count, 1
> > +	USER(9000f, ldrb	A_lw, [src])
> > +	USER(9000f, ldrb	B_lw, [src, tmp1])
> > +	USER(9000f, ldrb	C_lw, [srcend, -1])
> > +	strb	A_lw, [dstin]
> > +	strb	B_lw, [dstin, tmp1]
> > +	strb	C_lw, [dstend, -1]
> > +.Lcopy0:
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Medium copies: 33..128 bytes.  */
> > +.Lcopy32_128:
> > +	USER(9000f, ldp	A_l, A_h, [src])
> > +	USER(9000f, ldp	B_l, B_h, [src, 16])
> > +	stp	A_l, A_h, [dstin]
> > +	stp	B_l, B_h, [dstin, 16]
> > +	cmp	count, 64
> > +	b.hi	.Lcopy128
> > +	USER(9001f, ldp	C_l, C_h, [srcend, -32])
> > +	USER(9001f, ldp	D_l, D_h, [srcend, -16])
> > +	stp	C_l, C_h, [dstend, -32]
> > +	stp	D_l, D_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy 65..128 bytes.  */
> > +.Lcopy128:
> > +	USER(9001f, ldp	E_l, E_h, [src, 32])
> > +	USER(9001f, ldp	F_l, F_h, [src, 48])
> > +	stp	E_l, E_h, [dstin, 32]
> > +	stp	F_l, F_h, [dstin, 48]
> > +	cmp	count, 96
> > +	b.ls	.Lcopy96
> > +	USER(9002f, ldp	C_l, C_h, [srcend, -64])
> > +	USER(9002f, ldp	D_l, D_h, [srcend, -48])
> > +	stp	C_l, C_h, [dstend, -64]
> > +	stp	D_l, D_h, [dstend, -48]
> > +.Lcopy96:
> > +	USER(9002f, ldp	G_l, G_h, [srcend, -32])
> > +	USER(9002f, ldp	H_l, H_h, [srcend, -16])
> > +	stp	G_l, G_h, [dstend, -32]
> > +	stp	H_l, H_h, [dstend, -16]
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy more than 128 bytes.  */
> > +.Lcopy_long:
> > +	/* Copy 16 bytes and then align dst to 16-byte alignment.  */
> > +
> > +	USER(9000f, ldp	D_l, D_h, [src])
> > +	and	tmp1, dstin, 15
> > +	bic	dst, dstin, 15
> > +	sub	src, src, tmp1
> > +	add	count, count, tmp1	/* Count is now 16 too large.  */
> > +	USER(9003f, ldp	A_l, A_h, [src, 16])
> > +	stp	D_l, D_h, [dstin]
> > +	USER(9004f, ldp	B_l, B_h, [src, 32])
> > +	USER(9004f, ldp	C_l, C_h, [src, 48])
> > +	USER(9004f, ldp	D_l, D_h, [src, 64]!)
> > +	subs	count, count, 128 + 16	/* Test and readjust count.  */
> > +	b.ls	.Lcopy64_from_end
> > +
> > +.Lloop64:
> > +	stp	A_l, A_h, [dst, 16]
> > +	USER(9005f, ldp	A_l, A_h, [src, 16])
> > +	stp	B_l, B_h, [dst, 32]
> > +	USER(9006f, ldp	B_l, B_h, [src, 32])
> > +	stp	C_l, C_h, [dst, 48]
> > +	USER(9007f, ldp	C_l, C_h, [src, 48])
> > +	stp	D_l, D_h, [dst, 64]!
> > +	USER(9008f, ldp	D_l, D_h, [src, 64]!)
> > +	subs	count, count, 64
> > +	b.hi	.Lloop64
> > +
> > +	/* Write the last iteration and copy 64 bytes from the end.  */
> > +.Lcopy64_from_end:
> > +	USER(9005f, ldp	E_l, E_h, [srcend, -64])
> > +	stp	A_l, A_h, [dst, 16]
> > +	USER(9006f, ldp	A_l, A_h, [srcend, -48])
> > +	stp	B_l, B_h, [dst, 32]
> > +	USER(9007f, ldp	B_l, B_h, [srcend, -32])
> > +	stp	C_l, C_h, [dst, 48]
> > +	USER(9009f, ldp	C_l, C_h, [srcend, -16])
> > +	stp	D_l, D_h, [dst, 64]
> > +	stp	E_l, E_h, [dstend, -64]
> > +	stp	A_l, A_h, [dstend, -48]
> > +	stp	B_l, B_h, [dstend, -32]
> > +	stp	C_l, C_h, [dstend, -16]
> > +	mov	x0, #0				// Nothing to copy
> > +	ret
> > +
> > +#endif
> > +
> > + 	// non-mops exception fixups
> > +9003:
> > +	sub count, count, tmp1
> > +9000:
> > + 	// Before being absolutely sure we couldn't copy anything, try harder
> > +	USER(.Lcopy_none, ldtrb A_lw, [src])
> > +	strb A_lw, [dstin]
> > +	sub x0, count, 1
> > +	ret
> > +
> > +9001:
> > +	sub x0, count, 32
> > +	ret
> > +
> > +9002:
> > +	sub count, dstend, dstin
> > +	sub x0, count, 64
> > +	ret
> > +
> > +9004:
> > +	sub count, count, tmp1
> > +	sub x0, count, 16
> > +	ret
> > +
> > +9005:
> > +	add tmp1, dstin, 16
> > +	add x0, dst, 16
> > +	cmp x0, tmp1
> > +	csel x0, x0, tmp1, hi
> > +	b	.Lsub_destend_x0
> > +
> > +9006:
> > +	add x0, dst, 32
> > +	b	.Lsub_destend_x0
> > +
> > +9007:
> > +	add x0, dst, 48
> > +	b	.Lsub_destend_x0
> > +
> > +9008:
> > +	sub x0, dstend, dst
> > +    ret
> > +
> > +9009:
> > +	add x0, dst, 64
> > +.Lsub_destend_x0:
> > +	sub x0, dstend, x0
> > + 	ret
> > +
> > +.Lcopy_none: // bytes not copied at all
> > +	mov x0, count
> > +	ret
> > +
> >   SYM_FUNC_END(__arch_copy_from_user)
> >   EXPORT_SYMBOL(__arch_copy_from_user)
> > diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
> > deleted file mode 100644
> > index 7f2f5a0e2fb9..000000000000
> > --- a/arch/arm64/lib/copy_template.S
> > +++ /dev/null
> > @@ -1,191 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Copyright (C) 2013 ARM Ltd.
> > - * Copyright (C) 2013 Linaro.
> > - *
> > - * This code is based on glibc cortex strings work originally authored by Linaro
> > - * be found @
> > - *
> > - * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
> > - * files/head:/src/aarch64/
> > - */
> > -
> > -
> > -/*
> > - * Copy a buffer from src to dest (alignment handled by the hardware)
> > - *
> > - * Parameters:
> > - *	x0 - dest
> > - *	x1 - src
> > - *	x2 - n
> > - * Returns:
> > - *	x0 - dest
> > - */
> > -dstin	.req	x0
> > -src	.req	x1
> > -count	.req	x2
> > -tmp1	.req	x3
> > -tmp1w	.req	w3
> > -tmp2	.req	x4
> > -tmp2w	.req	w4
> > -dst	.req	x6
> > -
> > -A_l	.req	x7
> > -A_h	.req	x8
> > -B_l	.req	x9
> > -B_h	.req	x10
> > -C_l	.req	x11
> > -C_h	.req	x12
> > -D_l	.req	x13
> > -D_h	.req	x14
> > -
> > -	mov	dst, dstin
> > -
> > -#ifdef CONFIG_AS_HAS_MOPS
> > -alternative_if_not ARM64_HAS_MOPS
> > -	b	.Lno_mops
> > -alternative_else_nop_endif
> > -	cpy1	dst, src, count
> > -	b	.Lexitfunc
> > -.Lno_mops:
> > -#endif
> > -
> > -	cmp	count, #16
> > -	/*When memory length is less than 16, the accessed are not aligned.*/
> > -	b.lo	.Ltiny15
> > -
> > -	neg	tmp2, src
> > -	ands	tmp2, tmp2, #15/* Bytes to reach alignment. */
> > -	b.eq	.LSrcAligned
> > -	sub	count, count, tmp2
> > -	/*
> > -	* Copy the leading memory data from src to dst in an increasing
> > -	* address order.By this way,the risk of overwriting the source
> > -	* memory data is eliminated when the distance between src and
> > -	* dst is less than 16. The memory accesses here are alignment.
> > -	*/
> > -	tbz	tmp2, #0, 1f
> > -	ldrb1	tmp1w, src, #1
> > -	strb1	tmp1w, dst, #1
> > -1:
> > -	tbz	tmp2, #1, 2f
> > -	ldrh1	tmp1w, src, #2
> > -	strh1	tmp1w, dst, #2
> > -2:
> > -	tbz	tmp2, #2, 3f
> > -	ldr1	tmp1w, src, #4
> > -	str1	tmp1w, dst, #4
> > -3:
> > -	tbz	tmp2, #3, .LSrcAligned
> > -	ldr1	tmp1, src, #8
> > -	str1	tmp1, dst, #8
> > -
> > -.LSrcAligned:
> > -	cmp	count, #64
> > -	b.ge	.Lcpy_over64
> > -	/*
> > -	* Deal with small copies quickly by dropping straight into the
> > -	* exit block.
> > -	*/
> > -.Ltail63:
> > -	/*
> > -	* Copy up to 48 bytes of data. At this point we only need the
> > -	* bottom 6 bits of count to be accurate.
> > -	*/
> > -	ands	tmp1, count, #0x30
> > -	b.eq	.Ltiny15
> > -	cmp	tmp1w, #0x20
> > -	b.eq	1f
> > -	b.lt	2f
> > -	ldp1	A_l, A_h, src, #16
> > -	stp1	A_l, A_h, dst, #16
> > -1:
> > -	ldp1	A_l, A_h, src, #16
> > -	stp1	A_l, A_h, dst, #16
> > -2:
> > -	ldp1	A_l, A_h, src, #16
> > -	stp1	A_l, A_h, dst, #16
> > -.Ltiny15:
> > -	/*
> > -	* Prefer to break one ldp/stp into several load/store to access
> > -	* memory in an increasing address order,rather than to load/store 16
> > -	* bytes from (src-16) to (dst-16) and to backward the src to aligned
> > -	* address,which way is used in original cortex memcpy. If keeping
> > -	* the original memcpy process here, memmove need to satisfy the
> > -	* precondition that src address is at least 16 bytes bigger than dst
> > -	* address,otherwise some source data will be overwritten when memove
> > -	* call memcpy directly. To make memmove simpler and decouple the
> > -	* memcpy's dependency on memmove, withdrew the original process.
> > -	*/
> > -	tbz	count, #3, 1f
> > -	ldr1	tmp1, src, #8
> > -	str1	tmp1, dst, #8
> > -1:
> > -	tbz	count, #2, 2f
> > -	ldr1	tmp1w, src, #4
> > -	str1	tmp1w, dst, #4
> > -2:
> > -	tbz	count, #1, 3f
> > -	ldrh1	tmp1w, src, #2
> > -	strh1	tmp1w, dst, #2
> > -3:
> > -	tbz	count, #0, .Lexitfunc
> > -	ldrb1	tmp1w, src, #1
> > -	strb1	tmp1w, dst, #1
> > -
> > -	b	.Lexitfunc
> > -
> > -.Lcpy_over64:
> > -	subs	count, count, #128
> > -	b.ge	.Lcpy_body_large
> > -	/*
> > -	* Less than 128 bytes to copy, so handle 64 here and then jump
> > -	* to the tail.
> > -	*/
> > -	ldp1	A_l, A_h, src, #16
> > -	stp1	A_l, A_h, dst, #16
> > -	ldp1	B_l, B_h, src, #16
> > -	ldp1	C_l, C_h, src, #16
> > -	stp1	B_l, B_h, dst, #16
> > -	stp1	C_l, C_h, dst, #16
> > -	ldp1	D_l, D_h, src, #16
> > -	stp1	D_l, D_h, dst, #16
> > -
> > -	tst	count, #0x3f
> > -	b.ne	.Ltail63
> > -	b	.Lexitfunc
> > -
> > -	/*
> > -	* Critical loop.  Start at a new cache line boundary.  Assuming
> > -	* 64 bytes per line this ensures the entire loop is in one line.
> > -	*/
> > -	.p2align	L1_CACHE_SHIFT
> > -.Lcpy_body_large:
> > -	/* pre-get 64 bytes data. */
> > -	ldp1	A_l, A_h, src, #16
> > -	ldp1	B_l, B_h, src, #16
> > -	ldp1	C_l, C_h, src, #16
> > -	ldp1	D_l, D_h, src, #16
> > -1:
> > -	/*
> > -	* interlace the load of next 64 bytes data block with store of the last
> > -	* loaded 64 bytes data.
> > -	*/
> > -	stp1	A_l, A_h, dst, #16
> > -	ldp1	A_l, A_h, src, #16
> > -	stp1	B_l, B_h, dst, #16
> > -	ldp1	B_l, B_h, src, #16
> > -	stp1	C_l, C_h, dst, #16
> > -	ldp1	C_l, C_h, src, #16
> > -	stp1	D_l, D_h, dst, #16
> > -	ldp1	D_l, D_h, src, #16
> > -	subs	count, count, #64
> > -	b.ge	1b
> > -	stp1	A_l, A_h, dst, #16
> > -	stp1	B_l, B_h, dst, #16
> > -	stp1	C_l, C_h, dst, #16
> > -	stp1	D_l, D_h, dst, #16
> > -
> > -	tst	count, #0x3f
> > -	b.ne	.Ltail63
> > -.Lexitfunc:
> > diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> > index 819f2e3fc7a9..e50bdcef7cdf 100644
> > --- a/arch/arm64/lib/copy_to_user.S
> > +++ b/arch/arm64/lib/copy_to_user.S
> > @@ -19,37 +19,6 @@
> >    * Returns:
> >    *	x0 - bytes not copied
> >    */
> > -	.macro ldrb1 reg, ptr, val
> > -	ldrb  \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro strb1 reg, ptr, val
> > -	user_ldst 9998f, sttrb, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro ldrh1 reg, ptr, val
> > -	ldrh  \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro strh1 reg, ptr, val
> > -	user_ldst 9997f, sttrh, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro ldr1 reg, ptr, val
> > -	ldr \reg, [\ptr], \val
> > -	.endm
> > -
> > -	.macro str1 reg, ptr, val
> > -	user_ldst 9997f, sttr, \reg, \ptr, \val
> > -	.endm
> > -
> > -	.macro ldp1 reg1, reg2, ptr, val
> > -	ldp \reg1, \reg2, [\ptr], \val
> > -	.endm
> > -
> > -	.macro stp1 reg1, reg2, ptr, val
> > -	user_stp 9997f, \reg1, \reg2, \ptr, \val
> > -	.endm
> >   	.macro cpy1 dst, src, count
> >   	.arch_extension mops
> > @@ -58,16 +27,48 @@
> >   	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
> >   	.endm
> > -end	.req	x5
> > -srcin	.req	x15
> > +dstin	.req	x0
> > +src	.req	x1
> > +count	.req	x2
> > +dst	.req	x3
> > +srcend	.req	x4
> > +dstend	.req	x5
> > +srcin	.req	x6
> > +A_l	.req	x6
> > +A_lw	.req	w6
> > +A_h	.req	x7
> > +B_l	.req	x8
> > +B_lw	.req	w8
> > +B_h	.req	x9
> > +C_l	.req	x10
> > +C_lw	.req	w10
> > +C_h	.req	x11
> > +D_l	.req	x12
> > +D_lw	.req	w12
> > +D_h	.req	x13
> > +E_l	.req	x14
> > +E_h	.req	x15
> > +F_l	.req	x16
> > +F_h	.req	x17
> > +G_l	.req	count
> > +G_h	.req	dst
> > +H_l	.req	src
> > +H_h	.req	srcend
> > +tmp1	.req	x14
> > +
> >   SYM_FUNC_START(__arch_copy_to_user)
> > -	add	end, x0, x2
> > +#ifdef CONFIG_AS_HAS_MOPS
> > +alternative_if_not ARM64_HAS_MOPS
> > +	b	.Lno_mops
> > +alternative_else_nop_endif
> > +	add	dstend, x0, x2
> >   	mov	srcin, x1
> > -#include "copy_template.S"
> > -	mov	x0, #0
> > +	mov	dst, dstin
> > +	cpy1	dst, src, count
> > +	mov	x0, #0				// Nothing left to copy
> >   	ret
> > -	// Exception fixups
> > +	// mops exception fixups
> >   9996:	b.cs	9997f
> >   	// Registers are in Option A format
> >   	add	dst, dst, count
> > @@ -77,7 +78,545 @@ SYM_FUNC_START(__arch_copy_to_user)
> >   	ldrb	tmp1w, [srcin]
> >   USER(9998f, sttrb tmp1w, [dst])
> >   	add	dst, dst, #1
> > -9998:	sub	x0, end, dst			// bytes not copied
> > +9998:	sub	x0, dstend, dst			// bytes not copied
> > +	ret
> > +
> > +.Lno_mops:
> > +#endif
> > +
> > +#ifdef CONFIG_ARM64_PAN
> > +	add	srcend, src, count
> > +	add	dstend, dstin, count
> > +	cmp	count, 128
> > +	b.hi	.Lcopy_long
> > +	cmp	count, 32
> > +	b.hi	.Lcopy32_128
> > +
> > +	/* Small copies: 0..32 bytes.  */
> > +	cmp	count, 16
> > +	b.lo	.Lcopy16
> > +	ldp	A_l, A_h, [src]
> > +	ldp	D_l, D_h, [srcend, -16]
> > +	USER(9000f, sttr A_l, [dstin])
> > +	USER(9001f, sttr A_h, [dstin, 8])
> > +	USER(9002f, sttr D_l, [dstend, -16])
> > +	USER(9003f, sttr D_h, [dstend, -8])
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 8-15 bytes.  */
> > +.Lcopy16:
> > +	tbz	count, 3, .Lcopy8
> > +	ldr	A_l, [src]
> > +	ldr	A_h, [srcend, -8]
> > +	USER(9004f, sttr A_l, [dstin])
> > +	USER(9005f, sttr A_h, [dstend, -8])
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 3
> > +	/* Copy 4-7 bytes.  */
> > +.Lcopy8:
> > +	tbz	count, 2, .Lcopy4
> > +	ldr	A_lw, [src]
> > +	ldr	B_lw, [srcend, -4]
> > +	USER(9006f, sttr A_lw, [dstin])
> > +	USER(9007f, sttr B_lw, [dstend, -4])
> > +	mov	x0, #0
> > +	ret
> > +
> > +	/* Copy 0..3 bytes using a branchless sequence.  */
> > +.Lcopy4:
> > +	cbz	count, .Lcopy0
> > +	lsr tmp1, count, #1
> > +	add dst, dstin, count, lsr #1
> > +	ldrb A_lw, [src]
> > +	ldrb C_lw, [srcend, -1]
> > +	ldrb B_lw, [src, tmp1]
> > +	USER(9008f, sttrb A_lw, [dstin])
> > +	USER(9009f, sttrb B_lw, [dst])
> > +	USER(9010f, sttrb C_lw, [dstend, -1])
> > +.Lcopy0:
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Medium copies: 33..128 bytes.  */
> > +.Lcopy32_128:
> > +	ldp	A_l, A_h, [src]
> > +	ldp	B_l, B_h, [src, 16]
> > +	ldp	C_l, C_h, [srcend, -32]
> > +	ldp	D_l, D_h, [srcend, -16]
> > +	USER(9011f, sttr A_l, [dstin])
> > +	USER(9012f, sttr A_h, [dstin, 8])
> > +	USER(9013f, sttr B_l, [dstin, 16])
> > +	USER(9014f, sttr B_h, [dstin, 24])
> > +	cmp	count, 64
> > +	b.hi	.Lcopy128
> > +	USER(9015f, sttr C_l, [dstend, -32])
> > +	USER(9016f, sttr C_h, [dstend, -24])
> > +	USER(9017f, sttr D_l, [dstend, -16])
> > +	USER(9018f, sttr D_h, [dstend, -8])
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy 65..128 bytes.  */
> > +.Lcopy128:
> > +	ldp	E_l, E_h, [src, 32]
> > +	ldp	F_l, F_h, [src, 48]
> > +	USER(9023f, sttr E_l, [dstin, 32])
> > +	USER(9024f, sttr E_h, [dstin, 40])
> > +	USER(9025f, sttr F_l, [dstin, 48])
> > +	USER(9026f, sttr F_h, [dstin, 56])
> > +	cmp	count, 96
> > +	b.ls	.Lcopy96
> > +	ldp	G_l, G_h, [srcend, -64]
> > +	ldp	H_l, H_h, [srcend, -48]
> > +	USER(9027f, sttr G_l, [dstend, -64])
> > +	USER(9028f, sttr G_h, [dstend, -56])
> > +	USER(9029f, sttr H_l, [dstend, -48])
> > +	USER(9030f, sttr H_h, [dstend, -40])
> > +.Lcopy96:
> > +	USER(9043f, sttr C_l, [dstend, -32])
> > +	USER(9044f, sttr C_h, [dstend, -24])
> > +	USER(9045f, sttr D_l, [dstend, -16])
> > +	USER(9046f, sttr D_h, [dstend, -8])
> > +	mov	x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy more than 128 bytes.  */
> > +.Lcopy_long:
> > +	/* Copy 16 bytes and then align dst to 16-byte alignment.  */
> > +	ldp	D_l, D_h, [src]
> > +	and	tmp1, dstin, 15
> > +	bic	dst, dstin, 15
> > +	sub	src, src, tmp1
> > +	add	count, count, tmp1	/* Count is now 16 too large.  */
> > +	ldp	A_l, A_h, [src, 16]
> > +	USER(9047f, sttr D_l, [dstin])
> > +	USER(9048f, sttr D_h, [dstin, 8])
> > +	ldp	B_l, B_h, [src, 32]
> > +	ldp	C_l, C_h, [src, 48]
> > +	ldp	D_l, D_h, [src, 64]!
> > +	subs	count, count, 128 + 16	/* Test and readjust count.  */
> > +	b.ls	.Lcopy64_from_end
> > +
> > +.Lloop64:
> > +	USER(9049f, sttr A_l, [dst, 16])
> > +	USER(9050f, sttr A_h, [dst, 24])
> > +	ldp	A_l, A_h, [src, 16]
> > +	USER(9051f, sttr B_l, [dst, 32])
> > +	USER(9052f, sttr B_h, [dst, 40])
> > +	ldp	B_l, B_h, [src, 32]
> > +	USER(9053f, sttr C_l, [dst, 48])
> > +	USER(9054f, sttr C_h, [dst, 56])
> > +	ldp	C_l, C_h, [src, 48]
> > +	USER(9055f, sttr D_l, [dst, 64])
> > +	USER(9056f, sttr D_h, [dst, 72])
> > +	add dst, dst, 64
> > +	ldp	D_l, D_h, [src, 64]!
> > +	subs	count, count, 64
> > +	b.hi	.Lloop64
> > +
> > +	/* Write the last iteration and copy 64 bytes from the end.  */
> > +.Lcopy64_from_end:
> > +	ldp	E_l, E_h, [srcend, -64]
> > +	USER(9057f, sttr A_l, [dst, 16])
> > +	USER(9058f, sttr A_h, [dst, 24])
> > +	ldp	A_l, A_h, [srcend, -48]
> > +	USER(9059f, sttr B_l, [dst, 32])
> > +	USER(9060f, sttr B_h, [dst, 40])
> > +	ldp	B_l, B_h, [srcend, -32]
> > +	USER(9061f, sttr C_l, [dst, 48])
> > +	USER(9062f, sttr C_h, [dst, 56])
> > +	ldp	C_l, C_h, [srcend, -16]
> > +	USER(9063f, sttr D_l, [dst, 64])
> > +	USER(9064f, sttr D_h, [dst, 72])
> > +	USER(9065f, sttr E_l, [dstend, -64])
> > +	USER(9066f, sttr E_h, [dstend, -56])
> > +	USER(9067f, sttr A_l, [dstend, -48])
> > +	USER(9068f, sttr A_h, [dstend, -40])
> > +	USER(9069f, sttr B_l, [dstend, -32])
> > +	USER(9070f, sttr B_h, [dstend, -24])
> > +	USER(9071f, sttr C_l, [dstend, -16])
> > +	USER(9072f, sttr C_h, [dstend, -8])
> > + 	mov	x0, #0
> > + 	ret
> > +
> > +#else
> > +
> > +	add	srcend, src, count
> > +	add	dstend, dstin, count
> > +	cmp	count, 128
> > +	b.hi	.Lcopy_long
> > +	cmp	count, 32
> > +	b.hi	.Lcopy32_128
> > +
> > +	/* Small copies: 0..32 bytes.  */
> > +	cmp	count, 16
> > +	b.lo	.Lcopy16
> > +	ldp	A_l, A_h, [src]
> > +	ldp	D_l, D_h, [srcend, -16]
> > +	USER(9000f, stp	A_l, A_h, [dstin])
> > +	USER(9002f, stp	D_l, D_h, [dstend, -16])
> > +	mov x0, #0
> > +	ret
> > +
> > +	/* Copy 8-15 bytes.  */
> > +.Lcopy16:
> > +	tbz	count, 3, .Lcopy8
> > +	ldr	A_l, [src]
> > +	ldr	A_h, [srcend, -8]
> > +	USER(9004f, str	A_l, [dstin])
> > +	USER(9005f, str	A_h, [dstend, -8])
> > +	mov x0, #0
> > +	ret
> > +
> > +	.p2align 3
> > +	/* Copy 4-7 bytes.  */
> > +.Lcopy8:
> > +	tbz	count, 2, .Lcopy4
> > +	ldr	A_lw, [src]
> > +	ldr	B_lw, [srcend, -4]
> > +	USER(9006f, str	A_lw, [dstin])
> > +	USER(9007f, str	B_lw, [dstend, -4])
> > +	mov x0, #0
> > +	ret
> > +
> > +	/* Copy 0..3 bytes using a branchless sequence.  */
> > +.Lcopy4:
> > +	cbz	count, .Lcopy0
> > +	lsr	tmp1, count, 1
> > +	ldrb	A_lw, [src]
> > +	ldrb	C_lw, [srcend, -1]
> > +	ldrb	B_lw, [src, tmp1]
> > +	USER(9008f, strb	A_lw, [dstin])
> > +	USER(9009f, strb	B_lw, [dstin, tmp1])
> > +	USER(9010f, strb	C_lw, [dstend, -1])
> > +.Lcopy0:
> > +	mov x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Medium copies: 33..128 bytes.  */
> > +.Lcopy32_128:
> > +	ldp	A_l, A_h, [src]
> > +	ldp	B_l, B_h, [src, 16]
> > +	ldp	C_l, C_h, [srcend, -32]
> > +	ldp	D_l, D_h, [srcend, -16]
> > +	USER(9011f, stp	A_l, A_h, [dstin])
> > +	USER(9013f, stp	B_l, B_h, [dstin, 16])
> > +	cmp	count, 64
> > +	b.hi	.Lcopy128
> > +	USER(9015f, stp	C_l, C_h, [dstend, -32])
> > +	USER(9017f, stp	D_l, D_h, [dstend, -16])
> > +	mov x0, #0
> >   	ret
> > +
> > +	.p2align 4
> > +	/* Copy 65..128 bytes.  */
> > +.Lcopy128:
> > +	ldp	E_l, E_h, [src, 32]
> > +	ldp	F_l, F_h, [src, 48]
> > +	USER(9023f, stp	E_l, E_h, [dstin, 32])
> > +	USER(9025f, stp	F_l, F_h, [dstin, 48])
> > +	cmp	count, 96
> > +	b.ls	.Lcopy96
> > +	ldp	G_l, G_h, [srcend, -64]
> > +	ldp	H_l, H_h, [srcend, -48]
> > +	USER(9027f, stp	G_l, G_h, [dstend, -64])
> > +	USER(9029f, stp	H_l, H_h, [dstend, -48])
> > +.Lcopy96:
> > +	USER(9043f, stp	C_l, C_h, [dstend, -32])
> > +	USER(9045f, stp	D_l, D_h, [dstend, -16])
> > +	mov x0, #0
> > +	ret
> > +
> > +	.p2align 4
> > +	/* Copy more than 128 bytes.  */
> > +.Lcopy_long:
> > +	/* Copy 16 bytes and then align dst to 16-byte alignment.  */
> > +
> > +	ldp	D_l, D_h, [src]
> > +	and	tmp1, dstin, 15
> > +	bic	dst, dstin, 15
> > +	sub	src, src, tmp1
> > +	add	count, count, tmp1	/* Count is now 16 too large.  */
> > +	ldp	A_l, A_h, [src, 16]
> > +	USER(9047f, stp	D_l, D_h, [dstin])
> > +	ldp	B_l, B_h, [src, 32]
> > +	ldp	C_l, C_h, [src, 48]
> > +	ldp	D_l, D_h, [src, 64]!
> > +	subs	count, count, 128 + 16	/* Test and readjust count.  */
> > +	b.ls	.Lcopy64_from_end
> > +
> > +.Lloop64:
> > +	USER(9049f, stp	A_l, A_h, [dst, 16])
> > +	ldp	A_l, A_h, [src, 16]
> > +	USER(9051f, stp	B_l, B_h, [dst, 32])
> > +	ldp	B_l, B_h, [src, 32]
> > +	USER(9053f, stp	C_l, C_h, [dst, 48])
> > +	ldp	C_l, C_h, [src, 48]
> > +	USER(9055f, stp	D_l, D_h, [dst, 64]!)
> > +	ldp	D_l, D_h, [src, 64]!
> > +	subs	count, count, 64
> > +	b.hi	.Lloop64
> > +
> > +	/* Write the last iteration and copy 64 bytes from the end.  */
> > +.Lcopy64_from_end:
> > +	ldp	E_l, E_h, [srcend, -64]
> > +	USER(9057f, stp	A_l, A_h, [dst, 16])
> > +	ldp	A_l, A_h, [srcend, -48]
> > +	USER(9059f, stp	B_l, B_h, [dst, 32])
> > +	ldp	B_l, B_h, [srcend, -32]
> > +	USER(9061f, stp	C_l, C_h, [dst, 48])
> > +	ldp	C_l, C_h, [srcend, -16]
> > +	USER(9063f, stp	D_l, D_h, [dst, 64])
> > +	USER(9065f, stp	E_l, E_h, [dstend, -64])
> > +	USER(9067f, stp	A_l, A_h, [dstend, -48])
> > +	USER(9069f, stp	B_l, B_h, [dstend, -32])
> > +	USER(9071f, stp	C_l, C_h, [dstend, -16])
> > +	mov x0, #0
> > +	ret
> > +
> > +#endif
> > +
> > + 	// non-mops exception fixups
> > +9000:
> > +9004:
> > +9006:
> > +9011:
> > +	// Before being absolutely sure we couldn't copy anything, try harder
> > +	USER(.Lcopy_none, sttrb A_lw, [dstin])
> > +	b	.Lcount_minus_one
> > +
> > +9020:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_8
> > +
> > +9021:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_16
> > +
> > +9022:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_24
> > +
> > +9023:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_32
> > +
> > +9024:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_40
> > +
> > +9025:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_48
> > +
> > +9026:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_56
> > +
> > +9007:
> > +	sub x0, count, #4
> > +	ret
> > +
> > +9047:
> > +	sub	count, count, tmp1
> > +	USER(.Lcopy_none, sttrb D_lw, [dstin])
> > +9009:
> > +.Lcount_minus_one:
> > +	sub x0, count, #1
> > +	ret
> > +
> > +9001:
> > +9005:
> > +9012:
> > +.Lcount_minus_8:
> > +	sub x0, count, #8
> > +	ret
> > +
> > +9003:
> > +	add tmp1, dstin, #16
> > +	sub x0, dstend, #8
> > +	b	.Lmax
> > +
> > +9049:
> > +9057:
> > +	sub count, dstend, dst
> > +9002:
> > +9013:
> > +.Lcount_minus_16:
> > +	sub x0, count, #16
> > +	ret
> > +
> > +9050:
> > +9058:
> > +	sub count, dstend, dst
> > +9014:
> > +.Lcount_minus_24:
> > +	sub x0, count, #24
> > +	ret
> > +
> > +9048:
> > +	sub count, count, tmp1
> > +	b	.Lcount_minus_8
> > +
> > +9010:
> > +	mov x0, #1
> > +	ret
> > +
> > +9018:
> > +	add tmp1, dstin, #32
> > +	sub x0, dstend, #8
> > +	b	.Lmax
> > +
> > +9046:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #8
> > +	b	.Lmax
> > +
> > +9072:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #8
> > +	b	.Lmax
> > +
> > +9017:
> > +	add tmp1, dstin, #32
> > +	sub x0, dstend, #16
> > +	b	.Lmax
> > +
> > +9045:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #16
> > +	b	.Lmax
> > +
> > +9071:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #16
> > +	b	.Lmax
> > +
> > +9016:
> > +	add tmp1, dstin, #32
> > +	sub x0, dstend, #24
> > +	b	.Lmax
> > +
> > +9044:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #24
> > +	b	.Lmax
> > +
> > +9070:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #24
> > +	b	.Lmax
> > +
> > +9015:
> > +	add tmp1, dstin, #32
> > +	sub x0, dstend, #32
> > +	b	.Lmax
> > +
> > +9043:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #32
> > +	b	.Lmax
> > +
> > +9069:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #32
> > +	b	.Lmax
> > +
> > +9030:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #40
> > +	b	.Lmax
> > +
> > +9068:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #40
> > +	b	.Lmax
> > +
> > +9029:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #48
> > +	b	.Lmax
> > +
> > +9067:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #48
> > +	b	.Lmax
> > +
> > +9028:
> > +	add tmp1, dstin, #64
> > +	sub x0, dstend, #56
> > +	b	.Lmax
> > +
> > +9066:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #56
> > +	b	.Lmax
> > +
> > +9027:
> > +	sub count, dstend, dstin
> > +	b	.Lcount_minus_64
> > +
> > +9065:
> > +	add tmp1, dst, #80
> > +	sub x0, dstend, #64
> > +.Lmax:
> > +	cmp x0, tmp1
> > +	csel x0, x0, tmp1, hi
> > +	sub x0, dstend, x0
> > +	ret
> > +
> > +9051:
> > +9059:
> > +	sub count, dstend, dst
> > +.Lcount_minus_32:
> > +	sub x0, count, #32
> > +	ret
> > +
> > +9052:
> > +9060:
> > +	sub count, dstend, dst
> > +.Lcount_minus_40:
> > +	sub x0, count, #40
> > +	ret
> > +
> > +9053:
> > +9061:
> > +	sub count, dstend, dst
> > +.Lcount_minus_48:
> > +	sub x0, count, #48
> > +	ret
> > +
> > +9054:
> > +9062:
> > +	sub count, dstend, dst
> > +.Lcount_minus_56:
> > +	sub x0, count, #56
> > +	ret
> > +
> > +9055:
> > +9063:
> > +	sub count, dstend, dst
> > +.Lcount_minus_64:
> > +	sub x0, count, #64
> > +	ret
> > +
> > +9056:
> > +9064:
> > +	sub count, dstend, dst
> > +	sub x0, count, #72
> > +	ret
> > +
> > +9008:
> > +.Lcopy_none: // bytes not copied at all
> > +	mov x0, count
> > +	ret
> > +
> >   SYM_FUNC_END(__arch_copy_to_user)
> >   EXPORT_SYMBOL(__arch_copy_to_user)
> > diff --git a/lib/tests/usercopy_kunit.c b/lib/tests/usercopy_kunit.c
> > index 80f8abe10968..d4f4f9ee5f48 100644
> > --- a/lib/tests/usercopy_kunit.c
> > +++ b/lib/tests/usercopy_kunit.c
> > @@ -22,14 +22,12 @@
> >    * As there doesn't appear to be anything that can safely determine
> >    * their capability at compile-time, we just have to opt-out certain archs.
> >    */
> > -#if BITS_PER_LONG == 64 || (!(defined(CONFIG_ARM) && !defined(MMU)) && \
> > -			    !defined(CONFIG_M68K) &&		\
> > -			    !defined(CONFIG_MICROBLAZE) &&	\
> > -			    !defined(CONFIG_NIOS2) &&		\
> > -			    !defined(CONFIG_PPC32) &&		\
> > -			    !defined(CONFIG_SPARC32) &&		\
> > -			    !defined(CONFIG_SUPERH))
> > -# define TEST_U64
> > +#if BITS_PER_LONG == 64 ||                                                   \
> > +	(!(defined(CONFIG_ARM) && !defined(MMU)) && !defined(CONFIG_M68K) && \
> > +	 !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_NIOS2) &&            \
> > +	 !defined(CONFIG_PPC32) && !defined(CONFIG_SPARC32) &&               \
> > +	 !defined(CONFIG_SUPERH))
> > +#define TEST_U64
> >   #endif
> >   struct usercopy_test_priv {
> > @@ -87,7 +85,7 @@ static void usercopy_test_check_nonzero_user(struct kunit *test)
> >   		kmem[i] = 0xff;
> >   	KUNIT_EXPECT_EQ_MSG(test, copy_to_user(umem, kmem, size), 0,
> > -		"legitimate copy_to_user failed");
> > +			    "legitimate copy_to_user failed");
> >   	for (start = 0; start <= size; start++) {
> >   		for (end = start; end <= size; end++) {
> > @@ -95,7 +93,8 @@ static void usercopy_test_check_nonzero_user(struct kunit *test)
> >   			int retval = check_zeroed_user(umem + start, len);
> >   			int expected = is_zeroed(kmem + start, len);
> > -			KUNIT_ASSERT_EQ_MSG(test, retval, expected,
> > +			KUNIT_ASSERT_EQ_MSG(
> > +				test, retval, expected,
> >   				"check_nonzero_user(=%d) != memchr_inv(=%d) mismatch (start=%zu, end=%zu)",
> >   				retval, expected, start, end);
> >   		}
> > @@ -121,7 +120,7 @@ static void usercopy_test_copy_struct_from_user(struct kunit *test)
> >   	/* Fill umem with a fixed byte pattern. */
> >   	memset(umem_src, 0x3e, size);
> >   	KUNIT_ASSERT_EQ_MSG(test, copy_to_user(umem, umem_src, size), 0,
> > -		    "legitimate copy_to_user failed");
> > +			    "legitimate copy_to_user failed");
> >   	/* Check basic case -- (usize == ksize). */
> >   	ksize = size;
> > @@ -130,10 +129,12 @@ static void usercopy_test_copy_struct_from_user(struct kunit *test)
> >   	memcpy(expected, umem_src, ksize);
> >   	memset(kmem, 0x0, size);
> > -	KUNIT_EXPECT_EQ_MSG(test, copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > -		    "copy_struct_from_user(usize == ksize) failed");
> > -	KUNIT_EXPECT_MEMEQ_MSG(test, kmem, expected, ksize,
> > -		    "copy_struct_from_user(usize == ksize) gives unexpected copy");
> > +	KUNIT_EXPECT_EQ_MSG(test,
> > +			    copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > +			    "copy_struct_from_user(usize == ksize) failed");
> > +	KUNIT_EXPECT_MEMEQ_MSG(
> > +		test, kmem, expected, ksize,
> > +		"copy_struct_from_user(usize == ksize) gives unexpected copy");
> >   	/* Old userspace case -- (usize < ksize). */
> >   	ksize = size;
> > @@ -143,18 +144,21 @@ static void usercopy_test_copy_struct_from_user(struct kunit *test)
> >   	memset(expected + usize, 0x0, ksize - usize);
> >   	memset(kmem, 0x0, size);
> > -	KUNIT_EXPECT_EQ_MSG(test, copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > -		    "copy_struct_from_user(usize < ksize) failed");
> > -	KUNIT_EXPECT_MEMEQ_MSG(test, kmem, expected, ksize,
> > -		    "copy_struct_from_user(usize < ksize) gives unexpected copy");
> > +	KUNIT_EXPECT_EQ_MSG(test,
> > +			    copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > +			    "copy_struct_from_user(usize < ksize) failed");
> > +	KUNIT_EXPECT_MEMEQ_MSG(
> > +		test, kmem, expected, ksize,
> > +		"copy_struct_from_user(usize < ksize) gives unexpected copy");
> >   	/* New userspace (-E2BIG) case -- (usize > ksize). */
> >   	ksize = size / 2;
> >   	usize = size;
> >   	memset(kmem, 0x0, size);
> > -	KUNIT_EXPECT_EQ_MSG(test, copy_struct_from_user(kmem, ksize, umem, usize), -E2BIG,
> > -		    "copy_struct_from_user(usize > ksize) didn't give E2BIG");
> > +	KUNIT_EXPECT_EQ_MSG(
> > +		test, copy_struct_from_user(kmem, ksize, umem, usize), -E2BIG,
> > +		"copy_struct_from_user(usize > ksize) didn't give E2BIG");
> >   	/* New userspace (success) case -- (usize > ksize). */
> >   	ksize = size / 2;
> > @@ -162,13 +166,15 @@ static void usercopy_test_copy_struct_from_user(struct kunit *test)
> >   	memcpy(expected, umem_src, ksize);
> >   	KUNIT_EXPECT_EQ_MSG(test, clear_user(umem + ksize, usize - ksize), 0,
> > -		    "legitimate clear_user failed");
> > +			    "legitimate clear_user failed");
> >   	memset(kmem, 0x0, size);
> > -	KUNIT_EXPECT_EQ_MSG(test, copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > -		    "copy_struct_from_user(usize > ksize) failed");
> > -	KUNIT_EXPECT_MEMEQ_MSG(test, kmem, expected, ksize,
> > -		    "copy_struct_from_user(usize > ksize) gives unexpected copy");
> > +	KUNIT_EXPECT_EQ_MSG(test,
> > +			    copy_struct_from_user(kmem, ksize, umem, usize), 0,
> > +			    "copy_struct_from_user(usize > ksize) failed");
> > +	KUNIT_EXPECT_MEMEQ_MSG(
> > +		test, kmem, expected, ksize,
> > +		"copy_struct_from_user(usize > ksize) gives unexpected copy");
> >   }
> >   /*
> > @@ -182,28 +188,29 @@ static void usercopy_test_valid(struct kunit *test)
> >   	memset(kmem, 0x3a, PAGE_SIZE * 2);
> >   	KUNIT_EXPECT_EQ_MSG(test, 0, copy_to_user(usermem, kmem, PAGE_SIZE),
> > -	     "legitimate copy_to_user failed");
> > +			    "legitimate copy_to_user failed");
> >   	memset(kmem, 0x0, PAGE_SIZE);
> >   	KUNIT_EXPECT_EQ_MSG(test, 0, copy_from_user(kmem, usermem, PAGE_SIZE),
> > -	     "legitimate copy_from_user failed");
> > +			    "legitimate copy_from_user failed");
> >   	KUNIT_EXPECT_MEMEQ_MSG(test, kmem, kmem + PAGE_SIZE, PAGE_SIZE,
> > -	     "legitimate usercopy failed to copy data");
> > -
> > -#define test_legit(size, check)						\
> > -	do {								\
> > -		size val_##size = (check);				\
> > -		KUNIT_EXPECT_EQ_MSG(test, 0,				\
> > -			put_user(val_##size, (size __user *)usermem),	\
> > -			"legitimate put_user (" #size ") failed");	\
> > -		val_##size = 0;						\
> > -		KUNIT_EXPECT_EQ_MSG(test, 0,				\
> > -			get_user(val_##size, (size __user *)usermem),	\
> > -			"legitimate get_user (" #size ") failed");	\
> > -		KUNIT_EXPECT_EQ_MSG(test, val_##size, check,		\
> > -			"legitimate get_user (" #size ") failed to do copy"); \
> > +			       "legitimate usercopy failed to copy data");
> > +
> > +#define test_legit(size, check)                                                \
> > +	do {                                                                   \
> > +		size val_##size = (check);                                     \
> > +		KUNIT_EXPECT_EQ_MSG(                                           \
> > +			test, 0, put_user(val_##size, (size __user *)usermem), \
> > +			"legitimate put_user (" #size ") failed");             \
> > +		val_##size = 0;                                                \
> > +		KUNIT_EXPECT_EQ_MSG(                                           \
> > +			test, 0, get_user(val_##size, (size __user *)usermem), \
> > +			"legitimate get_user (" #size ") failed");             \
> > +		KUNIT_EXPECT_EQ_MSG(test, val_##size, check,                   \
> > +				    "legitimate get_user (" #size              \
> > +				    ") failed to do copy");                    \
> >   	} while (0)
> > -	test_legit(u8,  0x5a);
> > +	test_legit(u8, 0x5a);
> >   	test_legit(u16, 0x5a5b);
> >   	test_legit(u32, 0x5a5b5c5d);
> >   #ifdef TEST_U64
> > @@ -225,7 +232,9 @@ static void usercopy_test_invalid(struct kunit *test)
> >   	if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
> >   	    !IS_ENABLED(CONFIG_MMU)) {
> > -		kunit_skip(test, "Testing for kernel/userspace address confusion is only sensible on architectures with a shared address space");
> > +		kunit_skip(
> > +			test,
> > +			"Testing for kernel/userspace address confusion is only sensible on architectures with a shared address space");
> >   		return;
> >   	}
> > @@ -234,13 +243,16 @@ static void usercopy_test_invalid(struct kunit *test)
> >   	memset(kmem + PAGE_SIZE, 0, PAGE_SIZE);
> >   	/* Reject kernel-to-kernel copies through copy_from_user(). */
> > -	KUNIT_EXPECT_NE_MSG(test, copy_from_user(kmem, (char __user *)(kmem + PAGE_SIZE),
> > -						 PAGE_SIZE), 0,
> > -		    "illegal all-kernel copy_from_user passed");
> > +	KUNIT_EXPECT_NE_MSG(test,
> > +			    copy_from_user(kmem,
> > +					   (char __user *)(kmem + PAGE_SIZE),
> > +					   PAGE_SIZE),
> > +			    0, "illegal all-kernel copy_from_user passed");
> >   	/* Destination half of buffer should have been zeroed. */
> > -	KUNIT_EXPECT_MEMEQ_MSG(test, kmem + PAGE_SIZE, kmem, PAGE_SIZE,
> > -		    "zeroing failure for illegal all-kernel copy_from_user");
> > +	KUNIT_EXPECT_MEMEQ_MSG(
> > +		test, kmem + PAGE_SIZE, kmem, PAGE_SIZE,
> > +		"zeroing failure for illegal all-kernel copy_from_user");
> >   #if 0
> >   	/*
> > @@ -253,31 +265,36 @@ static void usercopy_test_invalid(struct kunit *test)
> >   						 PAGE_SIZE), 0,
> >   		    "illegal reversed copy_from_user passed");
> >   #endif
> > -	KUNIT_EXPECT_NE_MSG(test, copy_to_user((char __user *)kmem, kmem + PAGE_SIZE,
> > -					       PAGE_SIZE), 0,
> > -		    "illegal all-kernel copy_to_user passed");
> > -
> > -	KUNIT_EXPECT_NE_MSG(test, copy_to_user((char __user *)kmem, bad_usermem,
> > -					       PAGE_SIZE), 0,
> > -		    "illegal reversed copy_to_user passed");
> > -
> > -#define test_illegal(size, check)							\
> > -	do {										\
> > -		size val_##size = (check);						\
> > -		/* get_user() */							\
> > -		KUNIT_EXPECT_NE_MSG(test, get_user(val_##size, (size __user *)kmem), 0,	\
> > -		    "illegal get_user (" #size ") passed");				\
> > -		KUNIT_EXPECT_EQ_MSG(test, val_##size, 0,				\
> > -		    "zeroing failure for illegal get_user (" #size ")");		\
> > -		/* put_user() */							\
> > -		*kmem_u64 = 0xF09FA4AFF09FA4AF;						\
> > -		KUNIT_EXPECT_NE_MSG(test, put_user(val_##size, (size __user *)kmem), 0,	\
> > -		    "illegal put_user (" #size ") passed");				\
> > -		KUNIT_EXPECT_EQ_MSG(test, *kmem_u64, 0xF09FA4AFF09FA4AF,		\
> > -		    "illegal put_user (" #size ") wrote to kernel memory!");		\
> > +	KUNIT_EXPECT_NE_MSG(test,
> > +			    copy_to_user((char __user *)kmem, kmem + PAGE_SIZE,
> > +					 PAGE_SIZE),
> > +			    0, "illegal all-kernel copy_to_user passed");
> > +
> > +	KUNIT_EXPECT_NE_MSG(
> > +		test, copy_to_user((char __user *)kmem, bad_usermem, PAGE_SIZE),
> > +		0, "illegal reversed copy_to_user passed");
> > +
> > +#define test_illegal(size, check)                                              \
> > +	do {                                                                   \
> > +		size val_##size = (check);                                     \
> > +		/* get_user() */                                               \
> > +		KUNIT_EXPECT_NE_MSG(test,                                      \
> > +				    get_user(val_##size, (size __user *)kmem), \
> > +				    0, "illegal get_user (" #size ") passed"); \
> > +		KUNIT_EXPECT_EQ_MSG(                                           \
> > +			test, val_##size, 0,                                   \
> > +			"zeroing failure for illegal get_user (" #size ")");   \
> > +		/* put_user() */                                               \
> > +		*kmem_u64 = 0xF09FA4AFF09FA4AF;                                \
> > +		KUNIT_EXPECT_NE_MSG(test,                                      \
> > +				    put_user(val_##size, (size __user *)kmem), \
> > +				    0, "illegal put_user (" #size ") passed"); \
> > +		KUNIT_EXPECT_EQ_MSG(test, *kmem_u64, 0xF09FA4AFF09FA4AF,       \
> > +				    "illegal put_user (" #size                 \
> > +				    ") wrote to kernel memory!");              \
> >   	} while (0)
> > -	test_illegal(u8,  0x5a);
> > +	test_illegal(u8, 0x5a);
> >   	test_illegal(u16, 0x5a5b);
> >   	test_illegal(u32, 0x5a5b5c5d);
> >   #ifdef TEST_U64
> > @@ -286,13 +303,136 @@ static void usercopy_test_invalid(struct kunit *test)
> >   #undef test_illegal
> >   }
> > +/* Test fault handling when copying from/to user mode */
> > +static void usercopy_test_fault_handling(struct kunit *test)
> > +{
> > +	size_t start, len;
> > +	struct usercopy_test_priv *priv = test->priv;
> > +	const size_t size = 256;
> > +	char __user *umem_gp = priv->umem + 2 * PAGE_SIZE;
> > +	char __user *umem = umem_gp - size;
> > +	char *kmem0 = priv->kmem;
> > +	char *kmem1 = priv->kmem + size;
> > +	const char fill_char = 0xff;
> > +	const char override_char = 0xcc; /* cannot be 0 */
> > +
> > +	KUNIT_ASSERT_LT_MSG(test, size * 2, PAGE_SIZE,
> > +			    "size * 2 is larger than PAGE_SIZE");
> > +
> > +	/* Copy to the guard page should fail with no byte copied */
> > +	for (len = 1; len < size; len++) {
> > +		KUNIT_ASSERT_EQ_MSG(
> > +			test, copy_to_user(umem_gp, kmem1, len), len,
> > +			"copy_to_user copied more than 1 byte to guard page");
> > +	}
> > +
> > +	for (start = size - 1; start != 0; start--) {
> > +		for (len = size - start + 1; len <= size; len++) {
> > +			memset(kmem1, fill_char, size);
> > +			KUNIT_EXPECT_EQ_MSG(test,
> > +					    copy_to_user(umem, kmem1, size), 0,
> > +					    "legitimate copy_to_user failed");
> > +			memset(kmem1 + start, override_char, len);
> > +
> > +			/*
> > +			 * This copy_to_user should partially fail with retval containing the
> > +			 * number of bytes not copied
> > +			 */
> > +			unsigned long retval =
> > +				copy_to_user(umem + start, kmem1 + start, len);
> > +
> > +			KUNIT_EXPECT_NE_MSG(
> > +				test, retval, 0,
> > +				"copy_to_user should not copy all the bytes (start=%zu, len=%zu)",
> > +				start, len);
> > +			KUNIT_EXPECT_LE_MSG(
> > +				test, retval, len - 1,
> > +				"copy_to_user should at least copy 1 byte (start=%zu, len=%zu)",
> > +				start, len);
> > +
> > +			/* copy the umem page to kernel to check */
> > +			KUNIT_EXPECT_EQ_MSG(test,
> > +					    copy_from_user(kmem0, umem, size),
> > +					    0,
> > +					    "legitimate copy_to_user failed");
> > +
> > +			char *tmp =
> > +				memchr_inv(kmem0 + start, override_char, len);
> > +
> > +			KUNIT_EXPECT_TRUE_MSG(
> > +				test, tmp,
> > +				"memchr_inv returned NULL (start=%zu, len=%zu)",
> > +				start, len);
> > +
> > +			unsigned long expected = len - (tmp - (kmem0 + start));
> > +
> > +			KUNIT_EXPECT_EQ_MSG(
> > +				test, retval, expected,
> > +				"copy_to_user(=%zu) != memchr_inv(=%zu) mismatch (start=%zu, len=%zu)",
> > +				retval, expected, start, len);
> > +		}
> > +	}
> > +
> > +	for (len = 1; len < size; len++) {
> > +		/* Copy from the guard page should fail immediately */
> > +		KUNIT_ASSERT_EQ_MSG(
> > +			test, copy_from_user(kmem0, umem_gp, len), len,
> > +			"copy_from_user copied more than 1 byte to guard page");
> > +	}
> > +
> > +	for (start = size - 1; start != 0; start--) {
> > +		for (len = size - start + 1; len <= size; len++) {
> > +			memset(kmem0, override_char, size);
> > +			KUNIT_EXPECT_EQ_MSG(test,
> > +					    copy_to_user(umem, kmem0, size), 0,
> > +					    "legitimate copy_to_user failed");
> > +			memset(kmem0 + start, fill_char, len);
> > +
> > +			/*
> > +			 * This copy_from_user should partially fail with retval containing
> > +			 * the number of bytes not copied
> > +			 */
> > +			unsigned long retval = copy_from_user(
> > +				kmem0 + start, umem + start, len);
> > +
> > +			KUNIT_EXPECT_NE_MSG(
> > +				test, retval, 0,
> > +				"copy_from_user should not copy all the bytes (start=%zu, len=%zu)",
> > +				start, len);
> > +			KUNIT_EXPECT_LE_MSG(
> > +				test, retval, len - 1,
> > +				"copy_from_user should at least copy 1 byte (start=%zu, len=%zu)",
> > +				start, len);
> > +
> > +			char *tmp =
> > +				memchr_inv(kmem0 + start, override_char, len);
> > +
> > +			KUNIT_EXPECT_TRUE_MSG(
> > +				test, tmp,
> > +				"memchr_inv returned NULL (start=%zu, len=%zu)",
> > +				start, len);
> > +
> > +			unsigned long expected = len - (tmp - (kmem0 + start));
> > +
> > +			KUNIT_EXPECT_EQ_MSG(
> > +				test, retval, expected,
> > +				"copy_from_user(=%zu) != memchr_inv(=%zu) mismatch (start=%zu, len=%zu)",
> > +				retval, expected, start, len);
> > +		}
> > +	}
> > +}
> > +
> >   static int usercopy_test_init(struct kunit *test)
> >   {
> >   	struct usercopy_test_priv *priv;
> >   	unsigned long user_addr;
> > +	int ret;
> > +	size_t total_size;
> >   	if (!IS_ENABLED(CONFIG_MMU)) {
> > -		kunit_skip(test, "Userspace allocation testing not available on non-MMU systems");
> > +		kunit_skip(
> > +			test,
> > +			"Userspace allocation testing not available on non-MMU systems");
> >   		return 0;
> >   	}
> > @@ -304,13 +444,19 @@ static int usercopy_test_init(struct kunit *test)
> >   	priv->kmem = kunit_kmalloc(test, priv->size, GFP_KERNEL);
> >   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->kmem);
> > -	user_addr = kunit_vm_mmap(test, NULL, 0, priv->size,
> > -			    PROT_READ | PROT_WRITE | PROT_EXEC,
> > -			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
> > +	/* add an extra guard page */
> > +	total_size = priv->size + PAGE_SIZE;
> > +	user_addr = kunit_vm_mmap(test, NULL, 0, total_size,
> > +				  PROT_READ | PROT_WRITE,
> > +				  MAP_ANONYMOUS | MAP_PRIVATE, 0);
> >   	KUNIT_ASSERT_NE_MSG(test, user_addr, 0,
> > -		"Could not create userspace mm");
> > +			    "Could not create userspace mm");
> >   	KUNIT_ASSERT_LT_MSG(test, user_addr, (unsigned long)TASK_SIZE,
> > -		"Failed to allocate user memory");
> > +			    "Failed to allocate user memory");
> > +
> > +	ret = vm_munmap(user_addr + priv->size, PAGE_SIZE);
> > +	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Failed to unmap guard page");
> > +
> >   	priv->umem = (char __user *)user_addr;
> >   	return 0;
> > @@ -321,6 +467,7 @@ static struct kunit_case usercopy_test_cases[] = {
> >   	KUNIT_CASE(usercopy_test_invalid),
> >   	KUNIT_CASE(usercopy_test_check_nonzero_user),
> >   	KUNIT_CASE(usercopy_test_copy_struct_from_user),
> > +	KUNIT_CASE(usercopy_test_fault_handling),
> >   	{}
> >   };
> 

