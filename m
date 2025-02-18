Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhzFTefke9aiwOhT1sXO8hl3m9KW8kRy+oM3OsZ8HL8=; b=EjKiADAWvfa0um4pgZRazwbubl
	oXx8vvKXWSOJbk3Q1Ez+IrpiKbnjji6VlmAoYo990W9c9J1o1Ris9EGSp3jt/APPuMkRLwRvP2o23
	qj4lhm3+IpdL6zOg6N/3eMXedurYbDFhkbRFu3aMmy2z5VWOffGh4FKY9d5yS4n/1uoSjj1Hy37EH
	bXrWf0xRE77zOFRnX8oXnad4lCpNvJ9/S7tezBIFH4WMC6KQFTuc7nOd35Uen4/xOoI5xk2vosa2S
	MGxehKrdihscaHcRlE8Lcj6qyepDrnngHF2PaUE/aT3hft9NOraBRpkA9ah4FIhcWorjSXa7U0VMb
	DePcZh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkHB6-00000006zW8-0Hko;
	Tue, 18 Feb 2025 06:33:56 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkH9c-00000006zMt-1h5T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 06:32:26 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YxqT72Cwtzpk55;
	Tue, 18 Feb 2025 14:32:43 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id AFE741400DD;
	Tue, 18 Feb 2025 14:32:12 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 14:32:11 +0800
Message-ID: <f1be34f0-fed8-0256-fbb3-a1cce42d786b@huawei.com>
Date: Tue, 18 Feb 2025 14:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH mpam mpam/snapshot/v6.14-rc1 3/5] arm_mpam: Provide
 conversion method for new closid/rmid pairs
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <bobo.shaobowang@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250217031852.2014939-1-zengheng4@huawei.com>
 <20250217031852.2014939-4-zengheng4@huawei.com>
 <d7069933-903e-9e1e-d7a4-5a6a9fa53064@huawei.com>
 <Z7M7R8uf4g2C68cO@e133380.arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z7M7R8uf4g2C68cO@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_223224_747698_90B057D3 
X-CRM114-Status: GOOD (  21.37  )
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

Hi,

On 2025/2/17 21:36, Dave Martin wrote:
> Hi,
> 
> On Mon, Feb 17, 2025 at 02:18:44PM +0800, Zeng Heng wrote:
>> Hi Martin,
>>
>> On 2025/2/17 11:18, Zeng Heng wrote:
>>> The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
>>> For the new rmid allocation strategy, it will check if there is an
>>> available rmid of any reqPARTID which belongs to the input closid, not just
>>> the rmids belonging to the closid.
>>>
>>> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
>>> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
>>> expanding the monitoring groups.
>>>
>>> In order to keep the existing resctrl API interface, the rmid contains both
>>> req_idx and PMG information instead of PMG only under the MPAM driver. The
>>> req_idx represents the req_idx-th sub-monitoring group under the control
>>> group. The new rmid would be like:
>>>
>>>       rmid = (req_idx << shift | pmg).
>>>
>>
>> To consider future compatibility with dynamically allocated reqpartid,
>> should I refactor the rmid?
>>
>> Instead of defining rmid.req_idx, we could place the entire reqpartid
>> directly within rmid. In This way, the allocation of reqpartid will no
>> longer be constrained by the static allocation of closid, facilitating
>> future compatibility with dynamic allocation mechanisms.
>>
>> In this case, it needs to refactor the resctrl_arch_rmid_idx_encode()
>> and resctrl_arch_rmid_idx_decode(), and we can simplify
>> closid_rmid2reqpartid() to rmid2reqpartid().
>>
>> What are your thoughts on this idea? Thank you in advance for your
>> reply.
>>
>> Best regards,
>> Zeng Heng
> 
> Does this mean that the RMID must be expanded to cover all possible
> (reqPARTID, PMG) combinations?
> 
> A single reqPARTID cannot be allocated to two different resctrl control
> groups at the same time, even though a PMG value can be reused across
> multiple control groups -- so it sounds like your proposal would
> require changes in the resctrl core code as well as possibly requiring
> a larger rmid_ptrs table.
> 
> But I might have misunderstood what you are proposing here...
> 
> Can you illustrate with one or two examples?
> 

Yes, as you have written. It might be worth trying this approach:
rmid = (reqpartid, pmg).

But to avoid the reuse of rmid across multiple control groups, we will
check the incoming closid in resctrl_arch_rmid_idx_encode() to prevent
rmid from being reallocated by resctrl_find_free_rmid().

We don't need a larger rmid_ptrs table, nor do we need to modify the
existing resctrl common code by continuing with the current static
allocation method.

Below are the implementations of several key functions for reference:

~~~
u32 rmid2reqpartid(u32 rmid)
{
	u8 pmg_shift = fls(mpam_pmg_max);

	WARN_ON_ONCE(pmg_shift > 8);

	return rmid >> pmg_shift;
}

/*
  * If the closid and rmid do not match upon inspection,
  * immediately return an invalid idx value.
  */
u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
{
	u32 reqpartid = rmid2reqpartid(rmid);
	u32 intpartid = req2intpartid(reqpartid);

	if (cdp_enabled)
		intpartid >>= 1;

	if (closid != intpartid)
		return U32_MAX;

	return rmid;
}

void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
{
	u32 reqpartid = rmid2reqpartid(idx);
	u32 intpartid = req2intpartid(reqpartid);

	if (rmid)
		*rmid = idx;
	if (closid) {
		if (cdp_enabled)
			intpartid >>= 1;
		*closid = intpartid;
	}
}
~~~

Best regards,
Zeng Heng





