Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C6BE9E2E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0z0Y4at7iU0imbx5PZh3w9uUZRimxGgcL1Dub/w7i0=; b=L0giX6MdAV3797f9rZgXFRP09B
	mkhdjckMNaZwDd6wIPtyaCv09bZsLn8rBRf0xrlvkt7OjEw3RDey9YvIOZ1ZEHAMtqz8w0pylg/FJ
	Swk0f9kssO+bZiKGKOst3bhbcnYANP+1MKtcYZ1OH8xiJsb2/7QgecqmAMAdFqAP1+GDqY/tNk5Hw
	AgcXk/iN/a4ptR0dnYmk1dDFhZ1z8TaGqjx9cKBw8/1DLarWvdleewvWaGKqNGjL3Ci2w/yrjLfZt
	mm5nOOH73qtYTEqQTTFdDtvZ7iOPX9N6Kq35eO6b+Z987yE+Cjj/laRyt2CVm1PeTE5RkzElRNxAT
	Il3/rzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7oB-00000000XWF-2f4d;
	Wed, 11 Feb 2026 10:51:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7o8-00000000XVt-28q9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 10:50:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8171339;
	Wed, 11 Feb 2026 02:50:45 -0800 (PST)
Received: from e134344.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D668F3F632;
	Wed, 11 Feb 2026 02:50:46 -0800 (PST)
Date: Wed, 11 Feb 2026 10:50:38 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	gshan@redhat.com, james.morse@arm.com, jonathan.cameron@huawei.com,
	kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
	corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	zengheng4@huawei.com, linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v4 20/41] arm_mpam: resctrl: Add CDP emulation
Message-ID: <aYxe_rFXLSru5p-J@e134344.arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-21-ben.horgan@arm.com>
 <2271224c-1796-4823-8c2c-6f529814e645@nvidia.com>
 <7a0953ff-6475-4311-b34c-47eed9d38cb1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0953ff-6475-4311-b34c-47eed9d38cb1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_025056_642051_A4221B94 
X-CRM114-Status: GOOD (  41.40  )
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

On Mon, Feb 09, 2026 at 03:36:32PM +0000, Ben Horgan wrote:
> Hi Fenghua,
> 
> On 2/9/26 01:16, Fenghua Yu wrote:
> > Hi, Ben,
> > 
> > On 2/3/26 13:43, Ben Horgan wrote:
> >> From: James Morse <james.morse@arm.com>
> >>
> >> Intel RDT's CDP feature allows the cache to use a different control value
> >> depending on whether the accesses was for instruction fetch or a data
> >> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> >> different partid label to traffic depending on whether it was instruction
> >> fetch or a data access, which causes the cache to use a different control
> >> value based solely on the partid.
> >>
> >> MPAM can emulate CDP, with the side effect that the alternative partid is
> >> seen by all MSC, it can't be enabled per-MSC.
> >>
> >> Add the resctrl hooks to turn this on or off. Add the helpers that
> >> match a
> >> closid against a task, which need to be aware that the value written to
> >> hardware is not the same as the one resctrl is using.
> >>
> >> Update the 'arm64_mpam_global_default' variable the arch code uses during
> >> context switch to know when the per-cpu value should be used instead.
> >> Also,
> >> update these per-cpu values and sync the resulting mpam partid/pmg
> >> configuration to hardware.
> >>
> >> Awkwardly, the MB controls don't implement CDP. To emulate this, the MPAM
> >> equivalent needs programming twice by the resctrl glue, as resctrl
> >> expects
> >> the bandwidth controls to be applied independently for both data and
> >> instruction-fetch.
> >>
> >> Tested-by: Gavin Shan <gshan@redhat.com>
> >> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> >> Tested-by: Peter Newman <peternewman@google.com>
> >> CC: Dave Martin <Dave.Martin@arm.com>
> >> CC: Amit Singh Tomar <amitsinght@marvell.com>
> >> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> >> Signed-off-by: James Morse <james.morse@arm.com>
> >> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> >> ---
> >> Changes since rfc:
> >> Fail cdp initialisation if there is only one partid
> >> Correct data/code confusion
> >>
> >> Changes since v2:
> >> Don't include unused header
> >>
> >> Changes since v3:
> >> Update the per-cpu values and sync to h/w
> >> ---
> >>   arch/arm64/include/asm/mpam.h  |   1 +
> >>   drivers/resctrl/mpam_resctrl.c | 117 +++++++++++++++++++++++++++++++++
> >>   include/linux/arm_mpam.h       |   2 +
> >>   3 files changed, 120 insertions(+)
> >>
> >> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/
> >> mpam.h
> >> index 05aa71200f61..70d396e7b6da 100644
> >> --- a/arch/arm64/include/asm/mpam.h
> >> +++ b/arch/arm64/include/asm/mpam.h
> >> @@ -4,6 +4,7 @@
> >>   #ifndef __ASM__MPAM_H
> >>   #define __ASM__MPAM_H
> >>   +#include <linux/arm_mpam.h>
> >>   #include <linux/bitfield.h>
> >>   #include <linux/jump_label.h>
> >>   #include <linux/percpu.h>
> >> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
> >> mpam_resctrl.c
> >> index cd52ca279651..12017264530a 100644
> >> --- a/drivers/resctrl/mpam_resctrl.c
> >> +++ b/drivers/resctrl/mpam_resctrl.c
> >> @@ -38,6 +38,10 @@ static DEFINE_MUTEX(domain_list_lock);
> >>   static bool exposed_alloc_capable;
> >>   static bool exposed_mon_capable;
> >>   +/*
> >> + * MPAM emulates CDP by setting different PARTID in the I/D fields of
> >> MPAM0_EL1.
> >> + * This applies globally to all traffic the CPU generates.
> >> + */
> >>   static bool cdp_enabled;
> >>     bool resctrl_arch_alloc_capable(void)
> >> @@ -50,6 +54,72 @@ bool resctrl_arch_mon_capable(void)
> >>       return exposed_mon_capable;
> >>   }
> >>   +bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
> >> +{
> >> +    switch (rid) {
> >> +    case RDT_RESOURCE_L2:
> >> +    case RDT_RESOURCE_L3:
> >> +        return cdp_enabled;
> >> +    case RDT_RESOURCE_MBA:
> >> +    default:
> >> +        /*
> >> +         * x86's MBA control doesn't support CDP, so user-space doesn't
> > 
> > s/x86's/ARM's/
> 
> In CPUs supporting MPAM the instruction/data distinction is made at the
> CPU so doesn't depend on the specific control. The point this comment is
> trying to make is that as x86 doesn't support CDP on MBA, resctrl, which
> was initially x86 specific, expected CDP not to be supported on MBA and
> hence MPAM/ARM64 has to match this behaviour. Therefore, the MPAM driver
> doesn't support CDP on MBA either. In essence, the MPAM driver emulates
> the x86 CDP behaviour. Having said that, this comment relies on the
> reader knowing this historical context, and so I'll update it to not
> reference x86 and just mention that it is the expectation of the resctrl
> interface.

Looking a bit deeper into CDP I notice a couple of issues here that will make
code change. The resctrl mount options for L2 and L3 cdp are separate and so
they need to be considered separately here too.  Secondly, as 'CDP' in MPAM is
controlled at the cpu interface rather than the component it needs to be hidden
for the resources that it's not enabled for. (In MPAM, when 'CDP' is enabled
PARTID_D and PARTID_I to different values in MPAMx_ELy and they take the same
value when disabled.) As mbw_max is a per-partid maximum setting the same
configuration for 2 partids is not the same as setting the value for a single
partid. Furthermore, there is no way to pretend convincingly that the 2 partids
are a a single partid. Hence, in MPAM the MBA resource can't hide CDP and needs
to be disabled when MBA is enabled.

In the future, a resctrl mount option to enable CDP for the MBA resource could
be considered. Some more thought is needed here though as it's not obvious how
this would work with the software controller and would likely not work on other
architectures.

> 
> > 
> > Thanks.
> > 
> > -Fenghua
> > 
> > [SNIP]
> 
> Thanks,
> 
> Ben
> 
> 

