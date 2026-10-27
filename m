Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D215606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fZaBfACG;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ddLT2Zf5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jfyUDsKhlOqT9ZVuYcSgjElm7tsdbAKRMFhtvXe6L9A=; b=fZaBfACGWUDt/0
	5LV0z5hRLvSVtG009sE8kuxe+RKe9lYaz/Xv4hVRvc5p4liQFuJUhqp4/MtmxaJDEpeT+bukk/wvf
	A61ojd3k+wAP6/LwIQVu7an1VkRoiecYwB6qQAid836/UX2gRF60N/LaNOIz0syYG8b1RPKwpp1sw
	tfpKap6WTMkpOEtkXej02FU9sN3bGt7tLXZ8jf03N3gyuTIs93vxIclYIx1Va2ob/xlpTkJPjeZL+
	UTkx8vKxnE8ntJFIbITBWoZyGCpUTIkzVX5YcIpYiHtaalOggTXnGh8tN8se+JflLYfQizcFABemd
	SrRj3F+eo585on2eygQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfFp-00000004TXe-3FUz;
	Tue, 27 Oct 2026 11:22:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfFl-00000004TWl-2vmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:22:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C580D15A1;
	Tue, 27 Oct 2026 04:21:59 -0700 (PDT)
Received: from [10.57.10.231] (unknown [10.57.10.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3740A3F59E;
	Tue, 27 Oct 2026 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100122; bh=838wFtDFsF0HokI538R5ofd77JbIMlhOLC16rwoHK7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ddLT2Zf5YQBgKygXg943E7oErBMT3tunlYUxi1c2QV3J7lV97pOhC5X6oYoLTnzyx
	 kcEHAurLuaud35aWmyo7L/LpN4baP1jt+0SlVLTZMdMxxdk43dhKxBNPhg/Pf23EbK
	 fI47paTsb38KgDdHi4IVmMZQYK3vU+ixcdKUBAaE=
Message-ID: <82adee03-a169-4106-99f2-7624a4926037@arm.com>
Date: Tue, 27 Oct 2026 11:21:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities
 separately from device class
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-3-aaupov@fb.com>
 <20261021143958.GH26205@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261021143958.GH26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_042205_852761_17A4814C 
X-CRM114-Status: GOOD (  18.16  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 15:39, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-config.h
>> +++ b/drivers/hwtracing/coresight/coresight-config.h
>> @@ -30,6 +30,12 @@
>>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> 
> It is good to introduce a marco:
> 
>    #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)
> 
>> +/*
>> + * flags defining device capabilities a feature can require. A feature loads on
>> + * a device that matches one of its classes and has all of its capabilities.
>> + */
>> +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> 
> To make the mask explicitly 32-bit unsigned:
> 
>    #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> 
>> +
>>   /* flags defining device instance matching - used in config match desc data. */
>>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> 
> Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
> unused and could be removed in a separate cleanup patch.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>> index a816c22c87bc8..1545d64afec01 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
>>   }
>>   
>>   /* load one feature into one coresight device */
>> +/*
>> + * A feature matches a device that shares one of its class flags and has all of
>> + * the capability flags it requires.
>> + */
>> +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
>> +{
>> +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
>> +
>> +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
>> +	       (csdev_flags & caps) == caps;
> 
> For clearer comparison conditions:
> 
>         /* Class type must be matches */
>         if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
>             (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
>             return false;

Why not use FIELD_GET() to compare to make it more explicit ?

> 
>         /* No required capabilities miss from the device */
>         if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
>             return false;

Same here.

Suzuki>
>         return true;
> 
> Thanks,
> Leo


