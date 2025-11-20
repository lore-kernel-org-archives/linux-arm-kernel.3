Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAEDCF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73NU6o35CcbVeqGPJQvHCAI4EckiavRaUZguzz4WRKM=; b=YVKihc15qCYrSkqBP3kWRwqDZb
	oEGu3FRVdOl/ZxpbB2S74ZdHOJ/c0O8S/OGiKAO3y+9/gilWKOSLK00YytVOF6Nd5e+hevzpSak7A
	VtFX7WwQTYbHCEMIGfxM8XWkt5OPwMLzSr5sFMHpeNsHHr7qI0lCjVqp4SCX5i0N5lP4/95+UxQOP
	Bh2ml2Sr6dzJZYI8ntUAh52PTf8Vx1XKnXddkGOA7+I/Uc93VFg/P55RDjptx/Uy5HxpbLBqVU6ev
	51Bl7U1UxI4u/myDgwLinmRx8ZRXtYXD3FoseEnlf2IEv5FK/9MaqllCL0Q62ysNrqhoNKtopGcPh
	5+EmR8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2A3-00000006WqO-2BO5;
	Thu, 20 Nov 2025 10:45:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2A0-00000006Wpn-3LZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 10:45:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEF6F339;
	Thu, 20 Nov 2025 02:44:59 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9143F740;
	Thu, 20 Nov 2025 02:45:05 -0800 (PST)
Message-ID: <cdbd12fb-af91-4e22-ab19-4018bc88f6c7@arm.com>
Date: Thu, 20 Nov 2025 10:45:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
To: Leo Yan <leo.yan@arm.com>
Cc: Junhao He <hejunhao3@h-partners.com>, james.clark@linaro.org,
 anshuman.khandual@arm.com, yeoreum.yun@arm.com, mike.leach@linaro.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 jonathan.cameron@huawei.com
References: <20251111122149.1981162-1-hejunhao3@h-partners.com>
 <20251111122149.1981162-3-hejunhao3@h-partners.com>
 <15868ecb-c1e7-4273-a2e2-5c10f2701c0b@arm.com>
 <20251119180447.GG8204@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251119180447.GG8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_024508_880482_94BD6035 
X-CRM114-Status: GOOD (  15.70  )
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

On 19/11/2025 18:04, Leo Yan wrote:
> On Thu, Nov 13, 2025 at 03:02:45PM +0000, Suzuki Kuruppassery Poulose wrote:
>> Hi Junhao,
>>
>> While your patch fixes the problem it introduces imbalance in the
>> way perf vs sysfs modes are handled.
> 
> Previously, I suggested setting the mode in a unified way in
> tmc_enable_etr_sink() [1]. After looking into the code again, it seems
> that both my suggestion and this patch set the perf mode is too late.
> 
> Maybe we need to set the sink's device mode once a session starts to use
> it.  So we should set the perf mode when allocating sink's buffer
> (tmc_alloc_etr_buffer()), as this is the first callback invoked for a
> perf session.

Thats too early, in setup_aux(), when the event is not scheduled in. We 
don't know when that would be.

> 
> As a result, we can keep to set the sysfs mode in
> tmc_enable_etr_sink_sysfs().
> 
> A side topic is we need to refactor the tmc_etr_get_sysfs_buffer()
> function, ideally this function is purely for allocating buffer without
> any locking. We can defer to assign "drvdata->sysfs_buf" until
> acquired spin lock in tmc_enable_etr_sink_sysfs().  Essetionally, we
> can enable sink in one go rather than acquire-release lock for several
> times.

Patche welcome :-)

Cheers
Suzuki

> 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20251020143718.GH281971@e132581.arm.com/


