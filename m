Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7352C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwfhEA6DjY06jdZYNyVVDSd6IsOSO5Gdzlqx52hkTXA=; b=Z818jrn3MXXhsBBaygnXJ586aG
	0jxRCyGZXiJrULbD9CWrpC0o7pziraQ1Yru4NNUB1TFn252GH8Law0O1wbSpyJV+NSuWSuwuSjFVj
	oHyi7SUcdn13RAYjXWSjOtOmhb3cIVUzeeAC6bwqklt7EzHduZxfHc9jAmdfMzYPCun3/qoGIyDFY
	vs3OyrdUVqfjT+AdWSKIxtngO3M5GB3UsMjjH5RJNoJ0XDyVKyJ4DkKne2LcxqFAlaiyM26X9Agol
	Exfp3sts+sd2nt3IO8OqDVESEizSNX1AMFTZYkBUXzKchGCkERJfQa0zCDWgPE/btyB22+GD+BcSl
	UPQa16Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2wA-00000009iOX-1GeK;
	Mon, 19 May 2025 16:01:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2AM-00000009Z2W-2xLO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:12:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6819152B;
	Mon, 19 May 2025 08:12:20 -0700 (PDT)
Received: from [10.57.50.157] (unknown [10.57.50.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 039123F6A8;
	Mon, 19 May 2025 08:12:32 -0700 (PDT)
Message-ID: <aad1bf55-2952-4985-9dd1-5e1a0fce9824@arm.com>
Date: Mon, 19 May 2025 16:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Fix timestamp bit field handling
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Cc: Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <20250519135027.2204747-1-leo.yan@arm.com>
 <a6e1be6a-0684-4cef-9052-ff19fcff8a56@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a6e1be6a-0684-4cef-9052-ff19fcff8a56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081234_826889_B7C5B828 
X-CRM114-Status: GOOD (  16.32  )
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

On 19/05/2025 15:11, James Clark wrote:
> 
> 
> On 19/05/2025 2:50 pm, Leo Yan wrote:
>> Timestamps in the trace data appear as all zeros on recent kernels,
>> although the feature works correctly on old kernels (e.g., v6.12).
>>
>> Since commit c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions
>> to sysreg"), the TRFCR_ELx_TS_{VIRTUAL|GUEST_PHYSICAL|PHYSICAL} macros
>> were updated to remove the bit shift. As a result, the driver no longer
>> shifts bits when operates the timestamp field.
>>
>> Fix this by using the FIELD_PREP() and FIELD_GET() helpers. Simplify the
>> ts_source_show() function: return -1 when the value is zero, as this
>> indciates an invalid value; otherwise return the decoded TS value
>> directly.
>>
>> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
>> Fixes: c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions to 
>> sysreg")
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   .../hwtracing/coresight/coresight-etm4x-core.c  |  2 +-
>>   .../hwtracing/coresight/coresight-etm4x-sysfs.c | 17 ++---------------
>>   2 files changed, 3 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 6a5898355a83..acb4a58e4bb9 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1237,7 +1237,7 @@ static void cpu_detect_trace_filtering(struct 
>> etmv4_drvdata *drvdata)
>>        * tracing at the kernel EL and EL0, forcing to use the
>>        * virtual time as the timestamp.
>>        */
>> -    trfcr = (TRFCR_EL1_TS_VIRTUAL |
>> +    trfcr = (FIELD_PREP(TRFCR_EL1_TS_MASK, TRFCR_EL1_TS_VIRTUAL) |
>>            TRFCR_EL1_ExTRE |
>>            TRFCR_EL1_E0TRE);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>> index 49d5fb87a74b..8a2749eeb9a5 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>> @@ -2315,23 +2315,10 @@ static ssize_t ts_source_show(struct device *dev,
>>       int val;
>>       struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> -    if (!drvdata->trfcr) {
>> +    val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
>> +    if (!val)

I think this might be problematic. TS==0 is a reserved value for
software, and doesn't imply a TS is not in effect. Thus I think
we should retain the older check as before to ensure TRFCR is effective.

The rest looks good to me.

Suzuki

>>           val = -1;
>> -        goto out;
>> -    }
>> -
>> -    switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
>> -    case TRFCR_EL1_TS_VIRTUAL:
>> -    case TRFCR_EL1_TS_GUEST_PHYSICAL:
>> -    case TRFCR_EL1_TS_PHYSICAL:
>> -        val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
>> -        break;
>> -    default:
>> -        val = -1;
>> -        break;
>> -    }
>> -out:
>>       return sysfs_emit(buf, "%d\n", val);
>>   }
>>   static DEVICE_ATTR_RO(ts_source);
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 


