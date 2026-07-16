Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743EAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEtfcM+KW7L5CPl0b/+m1XcLdqGH3Lnf0/OmVJPKHLg=; b=2e2l4bc8ScxRXD0XRK50jfYHJO
	kJ7uLIPEUqYsaXSq+TMs221EhAkYvFvXZrVdhmH93zNDSQChM8q03NDI2dMge9f/xJt4wHM6d3Adw
	+6PdDDFXrqKGJTY1gLUFVMbDxZJrJnHb0q7ta9k3e5/gq2+wbsZmBnmAvPXkxhCvoOm4e/AcvlQsA
	Cbjo/5LnkUBGTT+Hl17LDh5yqMJhnZZNAoTUO2/8wR5wUBxRIMVub8UNuuNigS7X/ANG0uGsrcWAI
	8v2FK3eH5LbBBSslPvBwDBCTuWhkqTUuV1a3CfFbeuQU8nZdN1mHL3ym4tqgE+YUehidjU6WGkqA8
	8cmx1mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQ9-0000000HHkC-47ml;
	Thu, 16 Jul 2026 12:42:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQ6-0000000HHjp-45US
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:42:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3F11476;
	Thu, 16 Jul 2026 05:42:25 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB1D33F7B4;
	Thu, 16 Jul 2026 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784205750; bh=Bu3u6wPSdJa2kf7X/oaorEhXjHXCtj79kYQ35nA1rTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y7JV1bySJv8kadfk00E+z5GQ/401Y+MIhxN7sxJjscQd4rCtCSNvrNN4ZAuK8iUUI
	 RFmjRwBEtiJbXkoWnWDxr2Hcr/U767395SwiY0pU2h3i208J3xW7u/8Nwq6FrFj2HH
	 MKEAwrxR3Q8tmKXM4vCsRX765WJYiP5f9AGyDF0E=
Message-ID: <d7498d65-50e7-4fe5-a414-dd4bdf3b2c76@arm.com>
Date: Thu, 16 Jul 2026 13:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with sysfs
 configuration
To: Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706172159.GA1024232@e132581.arm.com> <akvxCqDgkElhCuH5@e129823.arm.com>
 <20260707082510.GD1024232@e132581.arm.com> <aky_9FCsv1XbyUvW@e129823.arm.com>
 <akzMypA6LOtjCsXz@e129823.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <akzMypA6LOtjCsXz@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054231_114693_0B53C9BD 
X-CRM114-Status: GOOD (  13.77  )
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

On 07/07/2026 10:54, Yeoreum Yun wrote:
> On Tue, Jul 07, 2026 at 09:59:36AM +0100, Yeoreum Yun wrote:
>> On Tue, Jul 07, 2026 at 09:25:10AM +0100, Leo Yan wrote:
>>> On Mon, Jul 06, 2026 at 07:16:42PM +0100, Yeoreum Yun wrote:
>>>
>>> [...]
>>>
>>>>> I try best to not paste any non-sense AI reviews, record one from
>>>>> Sashiko [1]:
>>>>>
>>>>>   | If a user writes to a sysfs attribute like pe_sel_store(), it acquires
>>>>>   | drvdata->spinlock without disabling interrupts. If an IPI is then handled
>>>>>   | on the same CPU, etm4_enable_sysfs_smp_call() will call
>>>>>   | cscfg_csdev_enable_active_config() which attempts to acquire the exact
>>>>>   | same spinlock, hanging the CPU."
>>>>>
>>>>> The flow for acquiring drvdata->spinlock in SMP call is:
>>>>>
>>>>>    etm4_enable_sysfs_smp_call()
>>>>>      `> cscfg_csdev_enable_active_config()
>>>>>           `> cscfg_csdev_enable_config()
>>>>>                `> cscfg_prog_config()
>>>>>                     `> cscfg_set_on_enable()
>>>>>                          `> raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
>>>>>
>>>>> We might expect the complaint from LOCKDEP with this patch.
>>>>
>>>> Hmm. I miss the this point and there is two solution:
>>>>
>>>>    1. Remove "feat_csdev->drv_spinlock"
>>>>
>>>>      Before this patch, the "feat_csdev->drv_spinlock" is for
>>>>      synchronizing with the "drvdata->config". However,
>>>>      After this patch, the the configfs only show the "active" config
>>>>      and the active config can be used only after taking the "mode".
>>>>
>>>>      Furthermore, the sysfs only uses the "config" not "active config",
>>>>      there is no race between the sysfs and the configfs.
>>>>
>>>>      When I check the, "feat_csdev->drv_spinlock" is for the
>>>>      active/deactive the configfs config, so I seems safe to remove.
>>>
>>> My interpretation is:
>>>
>>> After this series, we updates active_config on local CPU within atomic
>>> context, it is nature to be protected. So we don't need to use
>>> feat_csdev->drv_spinlock when updating active_config.
>>>
>>> If so, it is fine for me to remove feat_csdev->drv_spinlock.
>>
>> Yes. but if I add a little bit more comment. the "active_config"
>> is accessed after "mode changed (perf of sysfs)" it accesses atomically
>> and the "active_config" is refered from the configfs not "config"
>> after this patch. So we can remove the "feat_csdev->drv_spinlock".

Ack

Suzuki

