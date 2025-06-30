Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C3BC83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmo+BYw5aG6F2wZgnSo4TilI8Luc1t8DuiGQ62vjbJY=; b=qLfmdVK1j48tjj8+7J490Fwrfv
	YhhEfwwHjkRtcgjzi9AgsS2vSrAe72FMt8G0SBBDrDuUvpIuKq7aigR3diStyvJlAe1GxKMKvjkkt
	48sIxXnlpmZJVG73FwjDgwqOGVCRfXWKaDLWkisgJHepxW6MdfX5X6GYDqIkbsn4Ry0pwHObtLJUt
	+WdcxM5VlSCl+DOLVm2fe/KHUQCZBClXhRORSvWXTi8CAQ81iTdW6gW078pqs+95pZzaC1hAlGAzY
	SBUeNIlFzh1xbbZhVQZazpe2BHx3GRYnI87bHeDd6HlOSmOu0ucKXjsQIDH+lob+I33Ztjm03b5iL
	y3obhiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9a2-00000001Zpb-3iv6;
	Mon, 30 Jun 2025 08:09:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Xi-00000001ZXR-3gaG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:07:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bVzGD099zz13MgZ;
	Mon, 30 Jun 2025 16:04:36 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1ABA4180064;
	Mon, 30 Jun 2025 16:07:03 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 16:07:02 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 16:07:01 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>,
	<akpm@linux-foundation.org>, <dianders@chromium.org>,
	<sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [RESEND PATCH v2 1/2] watchdog/perf: Provide function for
 adjusting the event period
To: Will Deacon <will@kernel.org>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250619114805.16968-2-yangyicong@huawei.com>
 <aF66Kk1qhcs9U1Lw@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8aa0710a-7544-abb1-116c-382153b9fd57@huawei.com>
Date: Mon, 30 Jun 2025 16:07:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aF66Kk1qhcs9U1Lw@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_010711_236309_3A19A2EE 
X-CRM114-Status: GOOD (  18.06  )
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

On 2025/6/27 23:35, Will Deacon wrote:
> On Thu, Jun 19, 2025 at 07:48:04PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Architecture's using perf events for hard lockup detection needs to
>> convert the watchdog_thresh to the event's period, some architecture
>> for example arm64 perform this conversion using the CPU's maximum
>> frequency which will be acquired by cpufreq. However by the time
>> the lockup detector's initialized the cpufreq driver may not be
>> initialized, thus launch a watchdog with inaccurate period. Provide
>> a function hardlockup_detector_perf_adjust_period() to allowing
>> adjust the event period. Then architecture can update with more
>> accurate period if cpufreq is initialized.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  include/linux/nmi.h    |  2 ++
>>  kernel/watchdog_perf.c | 23 +++++++++++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
>> index e78fa535f61d..0a6d8a8d2d5b 100644
>> --- a/include/linux/nmi.h
>> +++ b/include/linux/nmi.h
>> @@ -103,10 +103,12 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
>>  extern void hardlockup_detector_perf_stop(void);
>>  extern void hardlockup_detector_perf_restart(void);
>>  extern void hardlockup_config_perf_event(const char *str);
>> +extern void hardlockup_detector_perf_adjust_period(int cpu, u64 period);
>>  #else
>>  static inline void hardlockup_detector_perf_stop(void) { }
>>  static inline void hardlockup_detector_perf_restart(void) { }
>>  static inline void hardlockup_config_perf_event(const char *str) { }
>> +static inline void hardlockup_detector_perf_adjust_period(int cpu, u64 period) { }
>>  #endif
>>  
>>  void watchdog_hardlockup_stop(void);
>> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
>> index 75af12ff774e..41c299e63fab 100644
>> --- a/kernel/watchdog_perf.c
>> +++ b/kernel/watchdog_perf.c
>> @@ -186,6 +186,29 @@ void watchdog_hardlockup_disable(unsigned int cpu)
>>  	}
>>  }
>>  
>> +/**
>> + * hardlockup_detector_perf_adjust_period - Adjust the event period due
>> + *                                          to cpu frequency change
>> + * @cpu: The CPU whose event period will be adjusted
>> + * @period: The target period to be set
>> + */
>> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
>> +{
>> +	struct perf_event *event = per_cpu(watchdog_ev, cpu);
> 
> Given that this is always called in the context of the current CPU (and
> has to be to avoid the race you describe in the next patch), why not
> drop the 'cpu' argument and use this_cpu_ptr() here instead?
> 

work for me. In v1 this may be called in a remote cpu and I forget to change the
prototype. will drop it, we only have one user to call this on the local cpu.

thanks.


