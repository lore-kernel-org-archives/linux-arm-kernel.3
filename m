Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C622CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQfA07jrY1yw4S5F8kxwzxEJt28ArdLXUX9ylTyMaFI=; b=Rf7D20rT13JAxoK0PDDB56Vlls
	kft2AUvRjSRpRg0k1OrIo8aPUmsUPJ++p0o2XKjsLdGhrffNXHRw5CSuVMNDyG4CiD0X66wrcXKED
	EOR9+InfM4KJrKiSKR6dLmOI68/uRHkX8Zw9EJ0z4XKDMy/oH0Or4C+tEwXeAN7FaYbkCNGpZdSc9
	+qtf8YVLJdJRsND5hseHYGMKbDsX1TQO5hrHy9OkBXlt9klbS8KNM0hC/EAoMBIwPDJDS+91GElKm
	2OJQ/AALrxdwEHE+GAZUIhG3ql+KDSRvchZERBfpAh9lvTGehlm4laLNX63YITUpYOYjBUrQa4mQV
	+SWZJ47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImgX-000000074wl-2YDB;
	Tue, 11 Nov 2025 11:37:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImgV-000000074wJ-1FuY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:37:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B6942F;
	Tue, 11 Nov 2025 03:37:04 -0800 (PST)
Received: from [10.57.72.204] (unknown [10.57.72.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 460F73F66E;
	Tue, 11 Nov 2025 03:37:10 -0800 (PST)
Message-ID: <d17fc264-7f3d-4257-abec-078e665d7ecb@arm.com>
Date: Tue, 11 Nov 2025 11:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] coresight: etm4x: Add flag to control
 single-shot restart
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
 <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
 <20251111092403.GB281971@e132581.arm.com>
 <a5ca5a65-8d5c-48b3-83f2-82d13c0b930d@arm.com>
 <20251111101805.GD281971@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251111101805.GD281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_033715_408434_B69F5B06 
X-CRM114-Status: GOOD (  16.37  )
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

On 11/11/2025 10:18, Leo Yan wrote:
> On Tue, Nov 11, 2025 at 09:43:13AM +0000, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>     if (!is_idle_task(current)) {
>>>         if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>>>             config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>>>     }
>>
>> What happens when we do a system wide session and a CPU is running an
>> idle task ?
> 
> For a system wide trace, the ETM device is enabled and disabled by
> the perf when the session start and finish.
> 
> During the session:
> 
> - If CPU off states are not enabled, nothing will happen in idle
>    threads, as no CPU PM notifier will be invoked.

What is a CPU is running the idle task, when the system wide session
is activated ? Basing our decision to tune the ETM control on the
"active task being idle" feels fragile to me. This is purely a
decision under ETM driver, specific to the session you are dealing
with. Thus having it in the "config" is preferred and is cleaner.

Suzuki


> 
> - If CPU off states have been enabled, CPU PM notifier will save and
>    restore ETM device context, and keep single-shot status.  This is
>    same with current save/restore flow.
> 
> I don't see any issue for this.
> 
> Thanks,
> Leo


