Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACF1CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjk8tLSE5G/7EVc82F57gdXYTpWgPPWoprPGBKWTZ58=; b=xB2zvSUhTK5YKcMHC7lo0RkXIm
	XiGLT9AyqRufjQgNiaaJjpeRBDeU/i9mpMvqSyPQYUi+5COHYJhkTCuxxuQWv8xXZWlV87E7N74ed
	s9JonCWHjOJItBGOufPzFxVdyE6ZaiBhYmta27CnsGgLlRtPcQ1KXA8flVCeohJiet6azE5AxKeSp
	mrq8QmndEPTTnbI5Y9+Sb7y/fq3Apm88/oAmnWrfnrYchihpZ3OXvxgCrRzG7YoXWNxoyBPNodY+W
	OPEOQy5TsBSh12HTSFwggH1XV7YMp2eEi6pAYwzQ8nLnspiCSytk0b83HhwEr4oaJpP0NxHkYT8xc
	y72ypN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvO-000000039kH-436X;
	Mon, 29 Sep 2025 17:44:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvC-000000039eo-3Cmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:44:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB2F1758;
	Mon, 29 Sep 2025 10:44:13 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC47F3F59E;
	Mon, 29 Sep 2025 10:44:16 -0700 (PDT)
Message-ID: <59fbb8d9-5df6-4269-aa81-147618450644@arm.com>
Date: Mon, 29 Sep 2025 18:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/29] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-11-james.morse@arm.com>
 <13347819-c83d-446b-856e-d7fd8ec742ea@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <13347819-c83d-446b-856e-d7fd8ec742ea@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104422_943751_DBE4EB1F 
X-CRM114-Status: GOOD (  17.53  )
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

Hi Ben,

On 12/09/2025 11:42, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> Because an MSC can only by accessed from the CPUs in its cpu-affinity
>> set we need to be running on one of those CPUs to probe the MSC
>> hardware.
>>
>> Do this work in the cpuhp callback. Probing the hardware will only
>> happen before MPAM is enabled, walk all the MSCs and probe those we can
>> reach that haven't already been probed as each CPU's online call is made.
>>
>> This adds the low-level MSC register accessors.
>>
>> Once all MSCs reported by the firmware have been probed from a CPU in
>> their respective cpu-affinity set, the probe-time cpuhp callbacks are
>> replaced.  The replacement callbacks will ultimately need to handle
>> save/restore of the runtime MSC state across power transitions, but for
>> now there is nothing to do in them: so do nothing.
>>
>> The architecture's context switch code will be enabled by a static-key,
>> this can be set by mpam_enable(), but must be done from process context,
>> not a cpuhp callback because both take the cpuhp lock.
>> Whenever a new MSC has been probed, the mpam_enable() work is scheduled
>> to test if all the MSCs have been probed. If probing fails, mpam_disable()
>> is scheduled to unregister the cpuhp callbacks and free memory.
>>
>> CC: Lecopzer Chen <lecopzerc@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>> Changes since v1:
>>  * Removed register bounds check. If the firmware tables are wrong the
>>    resulting translation fault should be enough to debug this.
>>  * Removed '&' in front of a function pointer.
>>  * Pulled mpam_disable() into this patch.
>>  * Disable mpam when probing fails to avoid extra work on broken platforms.
>>  * Added mpam_disbale_reason as there are now two non-debug reasons for this
>>    to happen.
> 
> Looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>


Thanks!

James

