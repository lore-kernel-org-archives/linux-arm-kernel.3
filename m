Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCDE9A75C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8hLQeWn2SawlmbKdo9IB78VkiJhKc50JmvqjbezSnA=; b=uWwJaMM99L2/Dwd5p5chRQl29l
	fBZY/ylvffOqJDNS1G0y6DD6VeyDEXt8w/YWDq/bfNlkIe1XeGfCREIdYdSmoZ3xnP2eXtxKJc4BD
	VaPr1mm53lvUVV50NxWGt3oNUJLubQM4kV29+n28E5vp67qJgJsk/WHq2qGFftjey0L8xb+7znOXX
	zfuAvMGeXv680PyFtXsh9lpqEkax8lFBCPJVYmF+9ouGrTfrPH9eILm1K2M9FGNy0rdNNEtgiIGT2
	8/KslR/Qn7LqDq85XZafd65/bl3Ei9t7wUzaIsU/cCnJDgrMn9KX/jYwcucIZ4LY3ACuBwXzeBqMg
	RC63yMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yhw-00000001BKL-0ezq;
	Tue, 24 Mar 2026 10:09:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yht-00000001BJm-24a0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:09:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5AFF1476;
	Tue, 24 Mar 2026 03:09:45 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 733453F63F;
	Tue, 24 Mar 2026 03:09:47 -0700 (PDT)
Message-ID: <745ed151-949a-47cf-a987-b811c98cf251@arm.com>
Date: Tue, 24 Mar 2026 10:09:46 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Gavin Shan <gshan@redhat.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <71f9ac1e-9f5a-4f12-807b-bbe0803f99e7@redhat.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <71f9ac1e-9f5a-4f12-807b-bbe0803f99e7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_030953_661141_BE1A257B 
X-CRM114-Status: GOOD (  24.65  )
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

Hi Gavin,

On 3/23/26 04:41, Gavin Shan wrote:
> * # Be careful, this email looks suspicious; * Out of Character: The sender is exhibiting a significant deviation from
> their usual behavior, this may indicate that their account has been compromised. Be extra cautious before opening links
> or attachments. *
> On 3/14/26 12:45 AM, Ben Horgan wrote:
>> This version of the mpam missing pieces series sees a couple of things
>> dropped or hidden. Memory bandwith utilization with free-running counters
>> is dropped in preference of just always using 'mbm_event' mode (ABMC
>> emulation) which simplifies the code and allows for, in the future,
>> filtering by read/write traffic. So, for the interim, there is no memory
>> bandwidth utilization support. CDP is hidden behind config expert as
>> remount of resctrl fs could potentially lead to out of range PARTIDs being
>> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
>> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
>>
>> There are a couple of 'fixes' at the start of the series which address
>> problems in the base driver but are only user visible due to this series.
>>
>> Changelogs in patches
>>
>> Thanks for all the reviewing and testing so far. Just a bit more to get this
>> over the line.
>>
>> There is a small build conflict with the MPAM abmc precursors series [1], which
>> alters some of the resctrl arch hooks. I will shortly be posting a respin
>> of that too.
>>
>> [1] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/
>>
>>  From James' cover letter:
>>
>> This is the missing piece to make MPAM usable resctrl in user-space. This has
>> shed its debugfs code and the read/write 'event configuration' for the monitors
>> to make the series smaller.
>>
>> This adds the arch code and KVM support first. I anticipate the whole thing
>> going via arm64, but if goes via tip instead, the an immutable branch with those
>> patches should be easy to do.
>>
>> Generally the resctrl glue code works by picking what MPAM features it can expose
>> from the MPAM drive, then configuring the structs that back the resctrl helpers.
>> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
>> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
>> counters are considerably more hairy, and depend on hueristics around the topology,
>> and a bunch of stuff trying to emulate ABMC.
>> If it didn't pick what you wanted it to, please share the debug messages produced
>> when enabling dynamic debug and booting with:
>> | dyndbg="file mpam_resctrl.c +pl"
>>
>> I've not found a platform that can test all the behaviours around the monitors,
>> so this is where I'd expect the most bugs.
>>
>> The MPAM spec that describes all the system and MMIO registers can be found here:
>> https://developer.arm.com/documentation/ddi0598/db/?lang=en
>> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>>   This document has the best overview)
>>
>>
>> Based on v7.0-rc3
>>
>> The series can be retrieved from:
>> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v6
>>
> 
> [...]
> 
> Retested this series on NVidia's grace-hopper machine where L3 cache partitioning
> and MBW (soft) limiting worked as expected. Besides, The L3 cache monitor counters
> are increased as more cache usage is observed.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>

Thanks for testing and all the reviews.

Ben

> 
> Thanks,
> Gavin
> 
> 


