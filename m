Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87FC47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMe4DgwRHghfW84I3As1xTXpEwajJUlEUeUv0zooUL8=; b=3FEUo04U0FGHgHtUUU4GiNlQDr
	xoXGEk44UnX33tgGS/V3uo+qpJXAjd3xuPoh9rTsu9yWFQ8doUd57LS70B4jxnEIkH4ahLwlbSnd7
	529ubtQsbjUjTgDNdxshHKuoXXaHKmvrVFsq9BN4fiiltrGfnIr7z/z6n+VfmrqVX+NazcAR0wXYm
	qK4rOMhssTlQHktVNQRoXjVDuVJ2AkBdPsjcIWw5tC1fT1uohZHPIoJ08DCbCEejcfHaxXyuvW5hU
	LlEcOO00MldFxDmxm3JsbV6WxIK4hj+U2KyfHYgf7dS5SLjrLBXVKHRDghVde3nrfKMicZUgUKYm5
	Epm5N0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Jx-0000000Ct4I-3ZN4;
	Tue, 06 Jan 2026 11:33:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Jv-0000000Ct3e-3J9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:33:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3717497;
	Tue,  6 Jan 2026 03:33:43 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D26E33F5A1;
	Tue,  6 Jan 2026 03:33:45 -0800 (PST)
Message-ID: <316c5635-75af-4ebb-ad2c-fab0742beb20@arm.com>
Date: Tue, 6 Jan 2026 11:33:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/45] arm_mpam: resctrl: Add rmid index helpers
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-24-ben.horgan@arm.com>
 <20260106112115.00000201@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106112115.00000201@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_033351_882175_058C77BD 
X-CRM114-Status: GOOD (  16.59  )
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

On 1/6/26 11:21, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:25 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Because MPAM's pmg aren't identical to RDT's rmid, resctrl handles some
>> data structures by index. This allows x86 to map indexes to RMID, and MPAM
>> to map them to partid-and-pmg.
>>
>> Add the helpers to do this.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> one comment inline.
> I messed around with GENMASK + field_prep()/field_get() - new
> versions of these with no need for runtime constant masks, but
> it ended up as not that much more readable than what you have here.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>> Changes since rfc:
>> Use ~0U instead of ~0 in lhs of left shift
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++++++++++++++++
>>  include/linux/arm_mpam.h       |  3 +++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 4275b1a85887..bdbc5504964b 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -120,6 +120,34 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
>>  	return mpam_partid_max + 1;
>>  }
>>  
>> +u32 resctrl_arch_system_num_rmid_idx(void)
>> +{
>> +	u8 closid_shift = fls(mpam_pmg_max);
>> +	u32 num_partid = resctrl_arch_get_num_closid(NULL);
>> +
>> +	return num_partid << closid_shift;
> 
> Given I think you restrict mpam_pmg_max to be power of 2 elsewhere,
> doesn't this end up the same as something like
> 	return mpam_pmg_max * resctrl_arch_get_num_closid(NULL);
> Maybe its worth keeping it in the form you have here as
> it sort of provides documentation for how you pack those IDs

We only warn if (mpam_pmg_max + 1) is a power of 2 and so I'll keep this
as it is, although yours is equivalent in the expected case.

> 
>> +}
> 

Thanks,

Ben


