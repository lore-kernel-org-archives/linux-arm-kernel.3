Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA3D2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJbWL+Qimibb0gq0ZOdR91/bptsudQEpBDltHCsi3Jw=; b=SIVylkRSadDGIFMFO57nOZIW9a
	Ip3sw/fEFbEhlyMl7XV4eE+ryigHKXjEVxam213jxwJzBqph8xrXAbQKySbSNwFafRtFIVbu/bJsn
	n9ARts25yx/z9QxGFkeSp7ktNLEY2uDrGDwAvPuIyIYPb/6oWP/3uK1SUMVRREoqSrYfRkLk9lU09
	355RZu+Jcs005YiQyQYO/Tat/1nuJQ7qWPE1NGKqxMkdk/uKMRZZ6cvLc+FHOtQc1bG2TWKn4jh6g
	LZDPttXR1Pf3nwve9fXRYrri3VoZLcmOJpfwDIEyhEENLEkGkMKoM19g0sdy3mVqw9CAc+J3K+MAU
	vuMSXAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwGd-00000002qwH-2CQ7;
	Mon, 19 Jan 2026 20:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwGZ-00000002qvw-2ZJZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:54:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D831497;
	Mon, 19 Jan 2026 12:54:19 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F46A3F632;
	Mon, 19 Jan 2026 12:54:21 -0800 (PST)
Message-ID: <bb2d36a3-1c0d-40ab-aa44-e94089ca141a@arm.com>
Date: Mon, 19 Jan 2026 20:54:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 44/47] arm_mpam: Add workaround for T241-MPAM-1
To: Gavin Shan <gshan@redhat.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-45-ben.horgan@arm.com>
 <598750f9-5df5-4f29-8912-2c20d929b82c@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <598750f9-5df5-4f29-8912-2c20d929b82c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_125427_717795_072F3C5B 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Hi Gavin,

On 1/19/26 12:16, Gavin Shan wrote:
> On 1/13/26 12:59 AM, Ben Horgan wrote:

>>   +#define MPAM_IIDR_NVIDIA_T241   
>> FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0x241)    | \
>> +                FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)    | \
>> +                FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)    | \
>> +                FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b)
>> +
> 
> An error reported by checkpatch.pl as below.
> 
> ERROR: Macros with complex values should be enclosed in parentheses
> #205: FILE: drivers/resctrl/mpam_internal.h:247:
> +#define MPAM_IIDR_NVIDIA_T241   
> FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0x241)    | \
> +                FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)    | \
> +                FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)    | \
> +                FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b)

Fixed
> 
> 
>>   /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>>   enum mon_filter_options {
>>       COUNT_BOTH    = 0,
> 
> Thanks,
> Gavin
> 

Thanks,

Ben


