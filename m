Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D24BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnWdzCsn1nlRc6iuM9H0ibjxeQVRnrEakscBkjfXWF4=; b=QPfGIYEaWT2NyKvUhGQfN/9eYd
	NOaKG+qej3sJtHCf8umsd6TO52w6M3B87xi7ibrimoE/Ufj3kxxP38A7XiXpmfBbqsi5ae3Dx/zoc
	WfPxmyN1+p6IJ4mV7p/FkRYaMn+VA3kL8BRwbxGzbfsFfHtQgJYiPOGRsOqh9Suhog/tTQMya6Sw/
	R+T5pj4LzD5Zgp1oLh1Og/QIFEuDY/6FkwpYc7vE743528/aIeE5aU9khu8EfvDpIH1ckx1oulF/X
	ojooHb14aaqQhJaUPRQba8Ra9Tq8hh+wDwTs6p1Ono5PHbFyI93z2ESSjPUSdKUm5jXXflkjD0eh/
	n9kVZtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjVq-0000000BYIc-2edg;
	Tue, 13 May 2025 06:53:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjTq-0000000BY98-2RQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:51:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZxRt44RJDznfgv;
	Tue, 13 May 2025 14:49:48 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id C9CE01800B2;
	Tue, 13 May 2025 14:51:05 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 14:51:05 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 14:51:04 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2 0/2] Update the watchdog period according to real CPU
 frequency
To: Andrew Morton <akpm@linux-foundation.org>
References: <20250512130919.23915-1-yangyicong@huawei.com>
 <20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3d9ef0c0-11b3-6ce2-5a48-5a01dbc9bf58@huawei.com>
Date: Tue, 13 May 2025 14:51:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_235110_936517_C01A76A4 
X-CRM114-Status: GOOD (  25.76  )
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

On 2025/5/13 7:06, Andrew Morton wrote:
> On Mon, 12 May 2025 21:09:17 +0800 Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> watchdog perf needs architecture to provide method for converting the watchdog
>> thresh to counter period. For arm64 we're using the max CPU frequency for
>> doing the conversion which is from cpufreq driver. But some cpufreq driver
>> are registered lately, for example cppc_cpufreq will be registered at late
>> initcall which is after the initialization of watchdog perf (initialized in
>> armv8_pmuv3 of device initcall). In such case the period of watchdog will not
>> be accurate enough. Fix this by registering a cpufreq notifier and update the
>> watchdog period once the cpufreq driver is initialized.
>>
> 
> Thanks.  Thoughts.
> 
> 1: What is the impact of this change?  Is the current code causing
>    problems?  If so, what are they?  How is the end-user experience
>    improved by this change?  Important info!
> 

This will make NMI watchdog (hardlockup detector) work more accurately. HARDLOCKUP_DETECTOR_PERF
is driven by the PMU sample interrupts of cpu cycle event with period related to the watchdog
threshold.  User will set the watchdog threshold in seconds (e.g. 10s by default) and for
HARDLOCKUP_DETECTOR_PERF we need to convert the seconds to cycles to setup the PMU counter.
The coversion method is provided by the arhitecture by implementing hw_nmi_get_sample_period().
For arm64 it's using max_cpufreq to do the conversion:
cycle_event_period = threshold(s) * max_cpufreq(hz)

Since arm64 doesn't have an arthictectural way to get the max_cpufreq, we use cpufreq_driver
to get it. If cpufreq_driver is not available, currently we use a safe max_cpufreq as 5GHz.
Without this patchset, if the cpufreq_driver is initialized after the hardlockup detector we'll
use 5GHz for calculating the event period. It's my case here as described in the coverletter.
That means in the default case (10s threshold) if the real max_cpufreq is 2.5GHz, the NMI watchdog
is actually working in a 20s period. With this patchset the period can be calibrated after
the cpufreq driver is initialized, much more accurate.

> 2: As far as I can tell, this patchset impacts arm64 only.  Do you
>    think that other architectures should implement this?

It's highly depends on the architecure's implementation of their HARDLOCKUP_DETECTOR_PERF (the
implementation of hw_nmi_get_sample_period()). If other architectures can gain the max_cpufreq
without cpufreq driver they don't have this problems (seems x86 implement in another way
and can gain the cpufreq by some arhitectural way).

> 
> 3: As far as I can tell, this patchset affects all cpufreq drivers
>    which use late_initcall() (on arm64, of course).  Is this correct?
> 

cpufreq drivers are not touched. we registered a notifier block to the cpufreq framework
so the changes to the cpufreq will notify us to see whether it's needed to modify the
event period.


> 4: It is asserted that we should use the *maximum* possible CPU
>    frequency for this calculation.  Why?  I assume this is because we
>    care about the minimum watchdog period?
> 

I think it may because it's impossbile to use the current frequency for calculating the counter
period as it may change at any time. Using maximum frequency will make the real period as close
as possible to the expected watchdog thresh in a simplest way.

> Can I assume that the ARM maintainers will be handling this?
> .

I think yes since it only affects the arm64's implementation of HARDLOCKUP_DETECTOR_PERF.

Thanks.


