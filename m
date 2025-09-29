Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC0CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4em2lZOOBEUhKYvANMjmIesb63X37XcCy+DllgJDHI=; b=WYs/bXqCbpj1HsGoom8UWTldaW
	Twxwft10+8DuTo8GxwT9JjcJjmsdj+INCzdSyp8lRQIsZkMfxGuD6vM+T1GgzNedjBrMnwKgeHpSA
	C+nQwY3JM0cZdloxPwOxgnhjau9NKvQPiaM1T7itONrPTapCOk9QEBU5zzxpEVgN+NSTR0XzD300E
	mm8bGp+NMFkRzkirCbQc7tEn6xmSBrcpuli7zLlGLz7/cnrMNLz5aI2v1mJKUafjMZV1KqeBx0Wa3
	0YvQYBs8B69LnIze301xLHDRFIspj1uehAne5LqlfywJQ3DN3jcctctgBcc6dMERUNBe5F+4TXtKD
	R3GQph9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HwV-00000003ARL-1eiv;
	Mon, 29 Sep 2025 17:45:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hw2-00000003AAt-26Jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:45:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6081CC4;
	Mon, 29 Sep 2025 10:45:05 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFDE3F59E;
	Mon, 29 Sep 2025 10:45:08 -0700 (PDT)
Message-ID: <32bc0e4a-d0bb-4aaa-8706-95a6edd470a9@arm.com>
Date: Mon, 29 Sep 2025 18:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/29] arm_mpam: Probe the hardware features resctrl
 supports
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-14-james.morse@arm.com>
 <8ed9fbe9-1075-4abb-91d0-20203906a4dc@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <8ed9fbe9-1075-4abb-91d0-20203906a4dc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104514_697684_1D9E831B 
X-CRM114-Status: GOOD (  18.03  )
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

On 11/09/2025 16:37, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> Expand the probing support with the control and monitor types
>> we can use with resctrl.

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 4cc44d4e21c4..5ae5d4eee8ec 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -112,6 +112,55 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>>  	raw_spin_lock_init(&msc->_mon_sel_lock);
>>  }
>>  
>> +/*
>> + * When we compact the supported features, we don't care what they are.
>> + * Storing them as a bitmap makes life easy.
>> + */
>> +typedef u16 mpam_features_t;
>> +
>> +/* Bits for mpam_features_t */
>> +enum mpam_device_features {
>> +	mpam_feat_ccap_part = 0,
>> +	mpam_feat_cpor_part,
>> +	mpam_feat_mbw_part,
>> +	mpam_feat_mbw_min,
>> +	mpam_feat_mbw_max,
>> +	mpam_feat_mbw_prop,
>> +	mpam_feat_msmon,
>> +	mpam_feat_msmon_csu,
>> +	mpam_feat_msmon_csu_capture,
>> +	mpam_feat_msmon_csu_hw_nrdy,
>> +	mpam_feat_msmon_mbwu,
>> +	mpam_feat_msmon_mbwu_capture,
>> +	mpam_feat_msmon_mbwu_rwbw,
>> +	mpam_feat_msmon_mbwu_hw_nrdy,
>> +	mpam_feat_msmon_capt,
>> +	MPAM_FEATURE_LAST,
>> +};

> I added a garbled comment about this for v1. What I was trying to say is
> that I don't think this quite matches what resctrl supports. For
> instance, I don't think mpam_feat_ccap_part matches a resctrl feature.

Ah - right. I thought you meant something was removed later.
Looks like I thought something could be emulated with CCAP, but that turns out not to be
true because it doesn't have an implicit isolation property, which the
resctrl:bitmap-from-userspace requires.
(I think rwbw was a later addition to the architecture and I added it to the wrong patch).

I'll move that, _prop and _rwbw to the later patch. The split is fairly arbitrary - it was
just somewhere to split an otherwise large patch, and does help determine if a bug is
going to be visible to user-space or not.

_capt can go completely. Last I heard no-one was interested in firmware descriptions of
how the capture hardware can be triggered. I suspect no-one has done anything with it.


Thanks,

James

