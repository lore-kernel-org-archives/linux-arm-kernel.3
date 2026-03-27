Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7E010ED643
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tqxcv+CemeP4RpbyqkeQRYUzEChsZ1uBxAkXmmwWKA=; b=N9S0aqLuLVe9nCPskXD38J49+f
	LZUONAk9CTpojNZmBmz9hE3JoMBMVDOA/Z5IRNMVf+8PjnLnBzzrUo3HzmTLOb6jprS2IWzy/QZCS
	yx8R0b+xopWm6//WseH4XjBZ0ZTXjH69Gl7NXGKqxrPfXx69Dc2NdMbhc3HLpV1p/AoVngTnZ8zeZ
	XImwE7zm+xjPMWqB7JUZ4gBQsgPTmoko7VJdYVoNVgXoH5g9DN3h8CLt6Gm/GID7SQcW5JmnBs527
	EN+XKAXeru0X+YlDPQto6ricyc37bPOwzJccdXPLKaMrxZjJ3xbKx2T1sgf3eZilWvMY28siLoFiW
	rEZ0/ymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63pc-000000076yF-3O9S;
	Fri, 27 Mar 2026 09:50:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63pZ-000000076x0-2ugE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:50:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E3C235A1;
	Fri, 27 Mar 2026 02:50:08 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93E63F915;
	Fri, 27 Mar 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774605014; bh=xGqDhRLT0ONetRUEOxZc/0mC+NNriKwAeI+b3xAsydc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HSPKfmR1Pfenjxu9tz32Aa30xPUnJs4sSBngvS4tlWPwJkUE3tdq/TgCaudiHSbjL
	 qym9k6HpuKuXmjHB9B2Hz3I0lYodoXZ+2tK8oDlzDaNy0LRQlitOVqQaV3fspGl9sc
	 b10ZoPCZH6UOsMVPXnC/8DrsePvIxQlHBn2fYv3E=
Message-ID: <599617aa-aade-4fde-9efa-79d592f1ff3f@arm.com>
Date: Fri, 27 Mar 2026 09:50:09 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 1/5] arm_mpam: resctrl: Pick classes for use as mbm
 counters
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "zengheng4@huawei.com" <zengheng4@huawei.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
 <20260319165540.381410-2-ben.horgan@arm.com>
 <TY4PR01MB169309AB957008DE0FCA442F18B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <TY4PR01MB169309AB957008DE0FCA442F18B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_025017_783418_A8810872 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Shaopeng,

On 3/27/26 02:53, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
> 
>> resctrl has two types of counters, NUMA-local and global. MPAM can only
>> count global either using MSC at the L3 cache or in the memory controllers.
>> When global and local equate to the same thing continue just to call it
>> global.
>>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

> 
> There are environments with multiple L3 caches within a single NUMA node.
> In this case, mbm_total will be the sum of traffic from all caches within that NUAM node.
> Is my understanding correct?

No, currently you only get mbm_total if there is single L3 cache and a single corresponding NUMA node. Rather than
adding partial support by summing across numa nodes we plan to add support for memory bandwidth monitoring with NUMA
node scope.

Thanks,

Ben

> 
> 
> Best regards,
> Shaopeng TAN


