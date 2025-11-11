Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F0CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7JJhpcPBcycUh/i+53zc3rliqCw0yD/rIF426v6aKU=; b=Z5PkT1T7xQ/BOZGfcrvXMX7U5o
	DPj8eIbmmJ445+jMEObIwL4TwdaORLyepJjXI1YyjycOz43BJABXbgVLcOdwKywC+P6P4LBGSUNiN
	zNbGSO+lbHSzmVWJaIYVOXs11+wykNeTz8NWNsg6at8NBup61/6m9wSGVFZtGdpqMd9IPu5lKdnS4
	ztG6GGUb3Ds9RcOvm2t+ZpSJJW+q8lz/wQeJJPXlzd71V39M6bYqdnftatzkF+2wc2UTRQhqCMPRv
	0Iuo6kw9Xs7Tcf/3X9NkS09sWdBIY38+jNXS61Xf6jS1Qjui8ZvDwzzMLCjZvUc5Y8rDHcdlKGsR6
	73HEFgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrXQ-00000007UHZ-3HZj;
	Tue, 11 Nov 2025 16:48:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrXO-00000007UH5-3aic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:48:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC03497;
	Tue, 11 Nov 2025 08:47:59 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBCD33F63F;
	Tue, 11 Nov 2025 08:48:02 -0800 (PST)
Message-ID: <0457614c-0f36-4427-835f-2645f3a67c9b@arm.com>
Date: Tue, 11 Nov 2025 16:48:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Jeremy Linton <jeremy.linton@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-4-ben.horgan@arm.com>
 <1a52079f-e12f-430b-b3c5-cb184f73c6c7@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <1a52079f-e12f-430b-b3c5-cb184f73c6c7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_084811_058891_F4D2564D 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Jeremy,

On 11/10/25 17:00, Jeremy Linton wrote:
> Hi,
> 
> On 11/7/25 6:34 AM, Ben Horgan wrote:
>> In actbl2.h, struct acpi_pptt_cache describes the fields in the original
>> cache type structure. In PPTT table version 3 a new field was added at
>> the
>> end, cache_id. This is described in struct acpi_pptt_cache_v1. Introduce
>> the new, acpi_pptt_cache_v1_full to contain both these structures. Update
>> the existing code to use this new struct. This simplifies the code,
>> removes
>> a non-standard use of ACPI_ADD_PTR and allows using the length in the
>> header to check if the cache_id is valid.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v3:
>> New patch
>> ---
>>   drivers/acpi/pptt.c | 104 ++++++++++++++++++++++++--------------------
>>   1 file changed, 58 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 1027ca3566b1..1ed2099c0d1a 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -21,6 +21,11 @@
>>   #include <linux/cacheinfo.h>
>>   #include <acpi/processor.h>
>>   +struct acpi_pptt_cache_v1_full {
>> +    struct acpi_pptt_cache        f;
>> +    struct acpi_pptt_cache_v1    extra;
>> +} __packed;
> 
> This presumably won't match an acpia change, right? Those structures
> appear to repeat the fields in the newer structure definitions.
> 
> Maybe its best to keep this as close to an acpica change and do a quick
> patch posting for acpica to assure they are onboard with the eventual
> structure (IIRC it was fast a few years ago when I had a similar problem).
> 
> That would avoid a bunch of the churn here of adding the 'f'/'extra'
> dereferene which would then potentailly have to be reverted at some
> point when acpica corrects the original structure.
I've created a pull request on their github:
https://github.com/acpica/acpica/pull/1059. This extends 'struct
acpi_pptt_cache_v1' to include all the fields of the Cache Type
Structure. I think this could be acceptable as there are other commits
in the history which make breaking changes to structures in the headers.
Let's see what they say. I got an immediate reply in Chinese but was
just an out of office.

Thanks,

Ben


