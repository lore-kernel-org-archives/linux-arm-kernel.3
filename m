Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC07CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W34qTxfCjvZa+ZUYbwyoKKJ8GVVJFHt9413LSd8yxlw=; b=ANvjFu4takGZoIUBHq2bSXL/d4
	dxwobUj7V7W379hA9AW9HSS7nK/J3YwAsyvOwnB6Qyh4gFPdMf8h7KtZgrF27/Ra9WmdFTiI5s5uB
	GXBFldHpdxmSPWWxBAoK7PWASOy/tGbnz63YebZ2FcwIgonRUzSQFKitHcYpxo+Jtjas+L3PVDJKp
	aeE/6XngWEfi9ZrXwpzRWsCoLF0zzHG1BEnfyyFxWQuQ6Uv8bj5n+5jJ3BGKeq/8ag1xHhqGhjOY2
	v5XpB1TUymhScLc6sW7HZ1Nc99Kije7xvifhAs3fqo4TP2JtZzLX00AAJXgfOQEQmIbSApaDiY/Z4
	PHYoERig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZVp-000000069P1-3d9V;
	Thu, 14 May 2026 17:06:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZVn-000000069OE-11Pt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:06:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5741762;
	Thu, 14 May 2026 10:06:05 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D563F836;
	Thu, 14 May 2026 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778370; bh=cJq7WaPtEwccN11DGbBz/bxDRdzYI63msQptK5T8nPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d1aSdDFBvKaMSeOaTWTuPHs6iF2Fox8X7BdTOGPoC8lY2yUkQDGfgqoQsfp546Euh
	 EtBxetv2Kc+KiFMo6z5kBcGHpZ8gpzasDAJLyh59uxlH+fOTq1SeKhroubHQHDjrGD
	 40XHojM9MVNLyeDWgDniNL124z2hbyzd9g7vwAZM=
Message-ID: <ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com>
Date: Thu, 14 May 2026 18:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_100615_567432_E77BD3F5 
X-CRM114-Status: GOOD (  49.28  )
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

Hi Zeng,

(beware this is the first version I've seen - arm have been silently deleting your mail,
 it looks like a problem with DKIM signatures)

On 13/04/2026 09:53, Zeng Heng wrote:
> Background
> ==========
> 
> On x86, the resctrl allows creating up to num_rmids monitoring groups
> under parent control group. However, ARM64 MPAM is currently limited by
> the PMG (Performance Monitoring Group) count, which is typically much
> smaller than the theoretical RMID limit.

The MPAM PMG limit is 255. Is that not enough?

I think the real problem is the CHI interconnect protocol is forcing people
to only have 1 bit of PMG - regardless of what the architecture says. This
isn't an MPAM problem as such - its an implementation issue.

(but we can try and work around it)


> This creates a significant
> scalability gap: users expecting fine-grained per-process or per-thread
> monitoring quickly exhaust the PMG space, even when plenty of reqPARTIDs
> remain available.

This is more about MPAM's philosophical stance that PMG extents PARTID, whereas
on x86 RMID is an independent number.

Please don't muddle these - it results in muddled patches!
If we want to try and attack both with narrowing, we should do them separately.


> The Narrow-PARTID feature, defined in the ARM MPAM architecture,
> addresses this by associating reqPARTIDs with intPARTIDs through a
> programmable many-to-one mapping. This allows the kernel to present more
> logical monitoring contexts.

I'd put this as "can be abused to avoid this problem"! We still have a problem with
controls that don't alias and need to be removed from MSC that don't support narrowing.
This isn't what the feature was designed for - but it is a really cool trick, it works
for some real platforms, and solves a problem seen in user-space.

However - throughout this series you seem to be discarding all the control-group support
for a monitoring-only setup that allocates intPARTID for everything. This might work for
your use-case on your platform, but it doesn't generalise to platforms without narrowing
or where multiple control-groups are needed.


> Design Overview
> ===============
> 
> The implementation extends the RMID encoding to carry reqPARTID
> information:
> 
>   RMID = reqPARTID * NUM_PMG + PMG
> 
> In this patchset, a monitoring group is uniquely identified by the
> combination of reqPARTID and PMG. The closid is represented by intPARTID,
> which is exactly the original PARTID.

The way I think of this is 'RMID' bits being spilled into PARTID. This
means each control group has a set of PARTID. For MSC using narrowing,
CLOSID would be the intPARTID value. But as you note, we need to support
mismatches:


> For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
> driver exposes the full reqPARTID range directly. For heterogeneous
> systems where some MSCs lack Narrow-PARTID support, the driver utilizes
> PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
> capability. The sole exception is when any type of MSCs lack Narrow-PARTID
> support, their percentage-based control mechanism prevents the use of
> PARTIDs as reqPARTIDs.

It'd be good to have some discussion about what the interface between the
mpam_devices code and any other user (like resctrl) should be.

As a hypothetical system to think about:
  64 PARTID at the L3, which support CPOR and CCAP
  64 PARTID and narrowing to 16 at the SLC, which supoprts CPOR
  64 PARTID and narrowing to 32 at the memory-controller, which support MBWU_MAX

I think whether using intPARTID is a benefit needs to be user-space policy.
You've likely got a platform where that choice is obvious - but it is a
trade-off as you lose the non-aliasing controls. In the example above, using
narrowing on this system means losing the CCAP controls on L3 as they don't alias [*].
Where its a policy, its likely to be one policy for resctrl, and another for any other
user.
We can get the resctrl glue code to turn it on unconditionally if there is no trade off,
I think that means: no non-aliasing controls in any class that doesn't support narrowing
- including 'unknown'. (we couldn't add them to resctrl in the future if you already chose
to enable this).

As for the interface with mpam_devices:
I think this means the resctrl glue code needs to be able to discover which
classes support intPARTID, and how many controls they actually have. From there
it can apply to policy to determine whether its better to support fewer features
in resctrl to get more RMID. (the alternative is always to ignore the MSC with
narrowing - narrowing lets hardware lie about the features it supports).

Currently the resctrl glue code has to program a configuration for two PARTID
when CDP is being hidden on the MB resource. This is ugly and fragile. I'd like
to explore generalising it as this narrowing stuff will also need to apply a
configuration to a set of PARTID when that MSC doesn't support narrowing.
In the example above, we'd need to discard the CCAP controls and write the same
CPOR bitmap to each PARTID that is mapped together by narrowing.


I think this means the resctrl glue code will need to be able to write a configuration
to controls using the full partid_max range as it does today. But also be able to set
the narrowing mapping on classes that support it.
For the monitors, the resctrl glue code will need to allocate and configure a set of
monitors, and read and sum them. This will be regardless of whether narrowing is
supported.

I think this means allocating a table of CLOSID to PARTID(s). the intPARTID would
always match the CLOSID. Monitors and non-narrowing MSC would need to walk the list.
I'm hoping we can make CDP a subset of this problem.
Some clever arithmetic may save allocating memory for a table - but if we change resctrl
to do this dynamically, the numbers become arbitrary forcing it to be a table.
It might also be possible to support moving monitor-groups between control groups with
the table driven approach. (see what you think on how complex it ends up ...)

I'd like to keep that grouping static for now, the table needs creating at setup time,
(+/- CDP), to avoid problems like you've found with CDP. This means the intpartid mappings
can be written once at setup time.

I'd like to avoid exposing user ABI to control this until we get it working, then we can
talk about whether to try making the grouping dynamically managed by resctrl. (there were
some proposals in that area - but I can't find them on lore).
If there are platforms were its certainly not a trade-off, we can enable it
unconditionally - but I'm wary of this being "what we care about now", requiring user-abi
to enable features that were detectable.
e.g. we ignore an unknown MSC, and add a resctrl schema for it later - only we can't
expose it if we were using narrowing. Now its a trade-off.


> Capability Improvements
> =======================
> 
> --------------------------------------------------------------------------
> The maximum        |  Sub-monitoring groups            | System-wide
> number of          |  under a control group            | monitoring groups
> --------------------------------------------------------------------------
> Without reqPARTID  |  PMG                              | intPARTID * PMG
> --------------------------------------------------------------------------
> reqPARTID          |                                   |
> static allocation  | (reqPARTID // intPARTID) * PMG    | reqPARTID * PMG
> --------------------------------------------------------------------------
> reqPARTID          |                                   |
> dynamic allocation | (reqPARTID - intPARTID + 1) * PMG | reqPARTID * PMG
> --------------------------------------------------------------------------
> 
> Note: The number of intPARTIDs can be capped via the boot parameter
> mpam.intpartid_max. Under MPAM, reqPARTID count is always greater than
> or equal to intPARTID count.
> 
> Series Structure
> ================
> 
> Patch 1: Fix pre-existing out-of-range PARTID issue between mount sessions.
> Patches 2-6: Implement static reqPARTID allocation.
> Patches 7-10: Implement dynamic reqPARTID allocation.

I've had  a hard time following this series. You dive in with invasive changes, then
unbreak things in later patches.

Please added the needed infrastructure in mpam_devices.c first. This should be free of
resctrl-isms, and 'only' needs reviewing against the architecture.

Then add the resctrl glue code stuff. That needs to comply with what resctrl expects.

I think the cleanest way to think about this is to break the mapping between CLOSID and
PARTID. We're effectively moving bits of RMID out of PMG into PARTID. Adding helpers
to explicitly do this early in those patches will make your changes clearer.
Please avoid spraying the narrowing terms for things everywhere.


Thanks,

James


[*] It's terminology from discussing this with Dave, just in case a summary is needed:
  aliasing controls are like CPOR where two different PARTID with the same bitmap
  compete for the same resource. If you give them each the same 50% of the portions,
  they can't exceed that together.
  non-aliasing controls are like CCAP where to different PARTID with the same fraction
  compete for different resources. If you give them each 50% of the capacity, it adds
  up to 100%. You can't represent 'the same' 50% using these controls.

  Narrowing papers over this problem with its remapping table, which gives you a 'same'
  property. For MSC that have controls of that shape - and where more monitors are
  desired - we'd have to drop the controls.

  I think "more monitors are desired" is going to need to be user-space policy. But
  we can come back to how to do that later.


