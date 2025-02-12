Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVD/TzWf8xNmuKwiACtI1JZzyEv978UeZM6dCbKDUxQ=; b=1CD74JqT5Ue9SwuaQQg54wK+bX
	ZB8WamdydK07Xf7+Od3WYowly45QqsgzTKAJ5sdbWw/Xq/cKDcwtar3uZZgq7i1OnRyKEGZ06tDFC
	yyck3PbWIad2ioJujOhfuz/6VlSzA9QJdFjb7IefbDpvdBax8IchB/m/Dc8/zjavbUSap24yX1/SD
	PttQNft4F8JtQXmEfqH6+nR/lpXaUZ2MMszaCnPggVaxlOBkYyd0ODCkjy/mQvO7FeN/wASZJ7roQ
	16+RspPLKdC9bwcN18hqJHjhHuV0PTFIfVrn7ugBn+6JY49JVFQFjjMyV/f7zh3rxRRXksRAcxKnk
	+MXUOW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLl9-000000097ZA-48rN;
	Wed, 12 Feb 2025 23:03:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLjf-000000097Ko-2yqL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:01:41 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63C73203F3F9;
	Wed, 12 Feb 2025 15:01:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63C73203F3F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739401297;
	bh=kVD/TzWf8xNmuKwiACtI1JZzyEv978UeZM6dCbKDUxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U08z9jK9iAY0zzo79A7JsC/Mz2ZbWBnrHFM5KY0O7MHmTpEOGkvA8SJUPe2B3lRVa
	 jvX1WzrD4fslrZg15JInATk0D9kx25QMttWTdsm0IK1VZtYMIGPhwhJNJuJAgX25PJ
	 Kv5P4xmlJC1vHp70JcBwBMfZWe2qmtpArPf05eG8=
Message-ID: <f7ce3ca7-e555-418d-9c88-6df379a3ec56@linux.microsoft.com>
Date: Wed, 12 Feb 2025 15:01:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hyperv: Add CONFIG_MSHV_ROOT to gate hv_root_partition
 checks
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, daniel.lezcano@linaro.org, joro@8bytes.org,
 robin.murphy@arm.com, arnd@arndb.de, jinankjain@linux.microsoft.com,
 muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
 mukeshrathor@microsoft.com
References: <1739312515-18848-1-git-send-email-nunodasneves@linux.microsoft.com>
 <20ba4b7c-bebb-4b1f-8c6c-4cd52a5083b5@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20ba4b7c-bebb-4b1f-8c6c-4cd52a5083b5@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_150139_801138_E4A4A80F 
X-CRM114-Status: GOOD (  27.13  )
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

On 2/11/2025 9:47 PM, Easwar Hariharan wrote:
> On 2/11/2025 2:21 PM, Nuno Das Neves wrote:
>> Introduce CONFIG_MSHV_ROOT as a tristate to enable root partition
>> booting and future mshv driver functionality.
>>
>> Change hv_root_partition into a function which always returns false
>> if CONFIG_MSHV_ROOT=n.
>>
>> Introduce hv_current_partition_type to store the type of partition
>> (guest, root, or other kinds in future), and hv_identify_partition_type()
>> to it up early in Hyper-V initialization.
> 
> ...to *set* it up early?
> 
Yep! Thanks for catching that

>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>> Depends on
>> https://lore.kernel.org/linux-hyperv/1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com/
>>
>>  arch/arm64/hyperv/mshyperv.c       |  2 ++
>>  arch/x86/hyperv/hv_init.c          | 10 ++++----
>>  arch/x86/kernel/cpu/mshyperv.c     | 24 ++----------------
>>  drivers/clocksource/hyperv_timer.c |  4 +--
>>  drivers/hv/Kconfig                 | 12 +++++++++
>>  drivers/hv/Makefile                |  3 ++-
>>  drivers/hv/hv.c                    | 10 ++++----
>>  drivers/hv/hv_common.c             | 32 +++++++++++++++++++-----
>>  drivers/hv/vmbus_drv.c             |  2 +-
>>  drivers/iommu/hyperv-iommu.c       |  4 +--
>>  include/asm-generic/mshyperv.h     | 39 +++++++++++++++++++++++++-----
>>  11 files changed, 92 insertions(+), 50 deletions(-)
>>
> 
> <snip>
> 
>> +
>> +void hv_identify_partition_type(void)
>> +{
>> +	/*
>> +	 * Check partition creation and cpu management privileges
>> +	 *
>> +	 * Hyper-V should never specify running as root and as a Confidential
>> +	 * VM. But to protect against a compromised/malicious Hyper-V trying
>> +	 * to exploit root behavior to expose Confidential VM memory, ignore
>> +	 * the root partition setting if also a Confidential VM.
>> +	 */
>> +	if ((ms_hyperv.priv_high & HV_CREATE_PARTITIONS) &&
>> +	    (ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
>> +	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
>> +		hv_current_partition_type = HV_PARTITION_TYPE_ROOT;
>> +		pr_info("Hyper-V: running as root partition\n");
>> +	} else {
>> +		hv_current_partition_type = HV_PARTITION_TYPE_GUEST;
>> +	}
>> +}
> 
> This should assume GUEST as default and modify to ROOT if all the checks pass.
> 
It is doing that, isn't it?

In fact the 'else' branch here is redundant and just there for additional clarity.

hv_current_partition_type is zeroed (so GUEST) by default, but I could make that explicit
if you prefer:
+enum hv_partition_type hv_current_partition_type = HV_PARTITION_TYPE_GUEST;

How does that sound? Am I misunderstanding something here?

> <snip>
> 
>> +static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
>> +{
>> +	return hv_result(U64_MAX);
>> +}
> 
> Is there value in perhaps #defining hv_result_<whatever this is> as U64_MAX and returning that for documentation?
> For e.g. assuming this is something like EOPNOTSUPP
> 
> #define HV_RESULT_NOT_SUPP U64_MAX
> 
> static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
> { return hv_result(HV_RESULT_NOT_SUPP); }
> 
The idea here was to copy what hv_do_hypercall does returning U64_MAX in case the hypercall
page is missing, which will hv_result() into an invalid status code. A special value for
that status could make this pattern clearer. I'd want to call out that this isn't a "real"
Hyper-V status code somehow. HV_STATUS's are 16 bits, so it would look more like:

/* "LINUX" because this isn't really a status from the hypervisor.. */
#define HV_STATUS_LINUX_FAIL 0xFFFF
static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
{ return HV_STATUS_LINUX_FAIL; }

Another option: there is another patch coming (which you know of) which maps hypercall
status codes to regular Linux errors like -EOPNOTSUPP. I could simply merge that patch
with this one (or make this a series for v2), and that would result in less churn.
(And leave alone the current use of U64_MAX in hv_do_hypercall, for now).

Nuno

> <snip>
> 
> Thanks,
> Easwar (he/him)


