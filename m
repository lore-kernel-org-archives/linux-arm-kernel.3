Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4F5CCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ohIedUWhnjKYv2p3zuHEYsCNmMRgtBHVjK2tYZmViw=; b=B57n11ocB5nsOn4M0JxTs9OpI/
	AFeCMx7dsLj6r3TpdV1VP0k3yaMEAjbCUXyPHa6DJfUE+6r807ExWU8VkHLIYbDnIIQ2CIPCTnCab
	NZLVvPlyMXReqzL5EuPV/ALTEXPaGcCE0VPsoh7gLcIza7/TntN91ryBlc2cx7IACu4eLQEVSXIHG
	kql2kxv4kUrAvH4jXgO2gIER4tYBBCOtxhL5grdmRN21d8zGvEAJeGdcAJVkAPwZefq5aYlFeQaWA
	PYewBFu+nx0gmcp1T3VAoJouqeACKr1lvkx9xe/qzj378Zwdh7RTfTLyHtRKt0YNJFqb/xj03U2+7
	+1CbBk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnzw-00000001wcz-2LoZ;
	Mon, 19 Jan 2026 12:04:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnzs-00000001wbz-10wz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:04:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17DC01517;
	Mon, 19 Jan 2026 04:04:12 -0800 (PST)
Received: from [10.1.197.58] (eglon.cambridge.arm.com [10.1.197.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A802D3F632;
	Mon, 19 Jan 2026 04:04:12 -0800 (PST)
Message-ID: <c157d2b6-7282-438f-b9e7-1a24be3fbf53@arm.com>
Date: Mon, 19 Jan 2026 12:04:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/47] arm_mpam: resctrl: Pick classes for use as mbm
 counters
To: Peter Newman <peternewman@google.com>, Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-30-ben.horgan@arm.com>
 <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040440_461477_96B4E316 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Peter,

On 15/01/2026 15:49, Peter Newman wrote:
> On Mon, Jan 12, 2026 at 6:02 PM Ben Horgan <ben.horgan@arm.com> wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has two types of counters, NUMA-local and global. MPAM has only
>> bandwidth counters, but the position of the MSC may mean it counts
>> NUMA-local, or global traffic.
>>
>> But the topology information is not available.
>>
>> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
>> probably NUMA-local. If the memory controller supports bandwidth monitors,
>> they are probably global.

> Are remote memory accesses not cached? How do we know an MBWU monitor
> residing on a cache won't count remote traffic?

It will, yes you get double counting. Is forbidding both mbm_total and mbm_local preferable?

I think this comes from 'total' in mbm_total not really having the obvious meaning of the
word:
If I have CPUs in NUMA-A and no memory controllers, then NUMA-B has no CPUs, and all the
memory-controllers.
With MPAM: we've only got one bandwidth counter, it doesn't know where the traffic goes
after the MSC. mbm-local on the L3 would reflect all the bandwidth, and mbm-total on the
memory-controllers would have the  same number.
I think on x86 mbm_local on the CPUs would read zero as zero traffic went to the 'local'
memory controller, and mbm_total would reflect all the memory bandwidth. (so 'total'
really means 'other')

I think what MPAM is doing here is still useful as a system normally has both CPUs and
memory controllers in the NUMA nodes, and you can use this to spot a control/monitor group
on a NUMA-node that is hammering all the memory (outlier mbm_local), or the same where a
NUMA-node's memory controller is getting hammered by all the NUMA nodes (outlier
mbm_total)

I've not heard of a platform with both memory bandwidth monitors at L3 and the memory
controller, so this may be a theoretical issue.

Shall we only expose one of mbm-local/total to prevent this being seen by user-space?



Thanks,

James

