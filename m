Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F47ED3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLOIaqC3hEJkyYvuUjnvuaQvOjdgxxlRkOKE6yNtpUI=; b=SBsHE62ylHifa2ES8yX7e+Ps+v
	6AZF9iULU4IPbnHkOqqon21bZ2v9BLuCjLdLOzv4KYyShq2mI+aSYx20L3y2bnZSgnpMM65BXHJGF
	98YBhw3qVTVykdx82o1iH/PTkBiRx3nZBAqurbdO5CilXXK+rCJaGXXNk/91opOm/1/l2cKx3ekIh
	geMIv8ASeJLofH6GM5dQP6QwO8bguAQGVTu1tqrhebgMTFpzF7citvEZ0L+j/utPXF6x26m0Haf2w
	HfN30DCgC1aWmX+eKe+vCoONu1O2dcYKa1NCBZqy1XB7bEctpgXH/yDyt/sdH4112VMiel4l2A72/
	poKg3Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0M1-0000000EVPD-1UJE;
	Tue, 09 Dec 2025 16:14:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0Ly-0000000EVOm-32cl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 16:14:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2461A175D;
	Tue,  9 Dec 2025 08:14:10 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1930E3F73B;
	Tue,  9 Dec 2025 08:14:13 -0800 (PST)
Message-ID: <95c9947f-574a-486f-953c-fbac6ead0853@arm.com>
Date: Tue, 9 Dec 2025 16:14:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/38] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Peter Newman <peternewman@google.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com,
 amitsinght@marvell.com, David Hildenbrand <david@kernel.org>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, rohit.mathew@arm.com,
 reinette.chatre@intel.com, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <41bcd0d2-d5b8-4f3d-b0b3-132387f547ed@arm.com>
 <CALPaoCgDuA1D+ubUv3UJ0+LyUfjCFKOcrEhg6Q80rNK5idjEmA@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CALPaoCgDuA1D+ubUv3UJ0+LyUfjCFKOcrEhg6Q80rNK5idjEmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_081418_821575_68A97CAB 
X-CRM114-Status: GOOD (  14.32  )
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

On 12/9/25 15:53, Peter Newman wrote:
> Hi Ben,
> 
> On Tue, Dec 9, 2025 at 3:40 PM Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi James and all,
[...]
>>
>> One major departure from the previous snapshot branches referenced in
>> the base driver series is that the same MPAM setting are used for
>> kernel-space and user-space. That is, MPAM1_EL1 is set to the same value
>> as MPAM0_EL1 rather than keeping the default value. The advantages of
>> this are that it is closer to the x86 model where the closid is globally
>> applicable, all partids are usable from user-space and user-space can't
>> bypass MPAM controls by doing the work in the kernel. However, this
>> causes some priority inversion where a high priority task waits to take
>> a mutex held by another whose resources are restricted by MPAM.
>> Thanks,
> 
> In our experience, the disadvantages of the x86 model were worse
> because they triggered on hosts unintentionally, while making the
> kernel do work unrestricted on behalf of the user at least requires
> intentional abuse.
> 
> -Peter

Thanks for the quick feedback. Do you have any more data/information on
this that you can share?

Thanks,

Ben


