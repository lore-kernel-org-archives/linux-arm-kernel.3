Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69EBE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxqJA6gLDd6wDNqRz6eHKedqD34HTN5ZngdrvN1RISw=; b=qp+JioE+jKPGTGc0XJ6iM6WF+y
	h2KmBCCscj1N+jyqIx+KPXjkWh4Zt64MVeG5Za0Bi0GMZPhxlZq8BYlc1wTRqppVMgtOH99jZSVFa
	k7a0d1CRB6/b+U5COuzKeUVZ/DuBo3efWZgstbSlzXFXl4u5qt7lp080U9t+OoTClyR2Oop4u9x1Q
	27Y6LLVjVgQa36l4F6zMYbPvqQBu5Uhj/ZKy0O4W1j7i3J7xppFEZwIy1K/JmTAeMUe3y84jTgJXA
	ha/CM/bQBKd7I4gXCPY6o1diHKKGDoWuTWrEeXsvCDQ3Legi7nJh4jXwzCFPVjTE6lDV2T7Gg1Bnw
	Bn6F6/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskwO-0000000A8Rm-0S9l;
	Wed, 18 Feb 2026 17:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskwL-0000000A8Qt-1uIv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:02:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97A0E339;
	Wed, 18 Feb 2026 09:02:09 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF5843F62B;
	Wed, 18 Feb 2026 09:02:10 -0800 (PST)
Message-ID: <9d0cc06b-f8cb-43bb-94da-98d106cb5798@arm.com>
Date: Wed, 18 Feb 2026 17:02:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 41/41] arm64: mpam: Add initial MPAM documentation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-42-ben.horgan@arm.com>
 <20260205170557.00000d4d@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260205170557.00000d4d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_090217_549133_C1B69497 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Jonathan,

On 2/5/26 17:05, Jonathan Cameron wrote:
> On Tue, 3 Feb 2026 21:43:42 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
>> resctrl. Add some documentation so the user knows what features to expect.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes by Ben:
>> Some tidying, update for current heuristics
>> ---
>>  Documentation/arch/arm64/index.rst |  1 +
>>  Documentation/arch/arm64/mpam.rst  | 93 ++++++++++++++++++++++++++++++
>>  2 files changed, 94 insertions(+)
>>  create mode 100644 Documentation/arch/arm64/mpam.rst
>>
>> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
>> index 6a012c98bdcd..189fa760dade 100644
>> --- a/Documentation/arch/arm64/index.rst
>> +++ b/Documentation/arch/arm64/index.rst
>> @@ -23,6 +23,7 @@ ARM64 Architecture
>>      memory
>>      memory-tagging-extension
>>      mops
>> +    mpam
>>      perf
>>      pointer-authentication
>>      ptdump
>> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>> new file mode 100644
>> index 000000000000..0769bccff25e
>> --- /dev/null
>> +++ b/Documentation/arch/arm64/mpam.rst
>> @@ -0,0 +1,93 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +====
>> +MPAM
>> +====
>> +
>> +What is MPAM
>> +============
> 
> 
>> +  MPAM (Memory Partitioning and Monitoring) is a feature in the CPUs and memory
> 
> I've not seen this style of indenting much in rst.  I checked a few
> files in this directory and it's not used in the ones I randomly picked.
> + it's not what the kernel-documentation.rst file suggests is standard
> formatting.

I seem to have needlessly invented a new style. I've not removed lots of
white space. It should match the rest now.

> 
> Other than that the content looks fine to me.
> 
> Jonathan

Thanks,

Ben


