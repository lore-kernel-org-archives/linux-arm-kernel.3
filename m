Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F1DC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNZyrkA1MPW6blbXS+8IoLxxbhfVJfNKDO+UiPwJv1A=; b=loYiVQkT+zEK/IpxqNDDIQ/xN2
	GdRt2XbnY6sDiarGDPYJZDvJ+v5ThYUXsWVsanNyVk9ST1vGd2lAFXhf8+PO/t6WYm505StgG0kSg
	IxtsEhiMKMBw3yPsIofE8/0NtjJg+ZdJDQ4KLhTS+CPb6EKTV9fBJyYUkVxd8SCJtDmOktMq9LA+a
	LjnjxT5kldgnKwlzdklKCWGmaY6UFgIcDTvGdd6MCUSv+MYrP9yAAlc/8tb+2Jy5MhrsbqJODvyoK
	4eXi0QOardy2BbN9Jd/DOHj4nK2E1soJOYtiytb+EtMQRt6hv9UsmfXpiXmRP2FwK6fFTXmndENrj
	6nTuYnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1iJ-00000007ZRW-0ziK;
	Wed, 29 Jul 2026 10:40:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1iE-00000007ZQG-0TKc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:40:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB9F71688;
	Wed, 29 Jul 2026 03:40:27 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C51E53F66F;
	Wed, 29 Jul 2026 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785321631; bh=DCWggK9HdejFC4QCwQcCIZqhPjEXoYjYmhah3dVOUWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oxsqFAuZfkdxKLl75vbVcDb0Wzdx90Ft6r04yRCmlZnbesJVM0LV0DDFgw2WPntG0
	 rb14Q1j/Y40/Yo9tzoFrfmUn6Y4vQXhGvzaAOXAIe+YLSP2grcM8wsSnsosuM46jiC
	 bL7RzrSDF8WnqWmNroYOI4pTQU9VJ7s4yU/ozXA8=
Message-ID: <d4ce9d65-cd1f-4cfe-99a9-a7ad92ee0eec@arm.com>
Date: Wed, 29 Jul 2026 11:40:26 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
To: Gavin Shan <gshan@redhat.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jic23@kernel.org,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <8e36f71d-598b-45bf-a3ea-6d44ff728877@redhat.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8e36f71d-598b-45bf-a3ea-6d44ff728877@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034034_203335_6A8A8638 
X-CRM114-Status: GOOD (  12.33  )
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

On 7/15/26 06:44, Gavin Shan wrote:
> On 7/8/26 2:24 AM, Ben Horgan wrote:
>> Version 5 of this series addresses a few review comments but is pretty
>> similar to v4. The precursors in x86/cache have been merged so there is no
>> longer a need for this to go through there. It's likely easiest if this
>> goes through arm64.
>>
>> This series adds support for memory bandwidth monitoring. Counter assignment
>> will be used for all platforms with memory bandwidth monitors rather than just
>> those with insufficient counters as originally proposed.

> 
> The tests on NVidia's grace-hopper machine looks good: (a) no error or warning is seen
> from the kunit-tests; (b) L3 cache partitioning and MBW (soft) limiting aren't broken,
> still working to me; (c) The counter 'mbm_total_bytes' can be assigned to newly created
> group and it gets increased when workload runs in the group.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>

Thanks for the testing and reviews.

Ben

> 
> Thanks,
> Gavin
> 


