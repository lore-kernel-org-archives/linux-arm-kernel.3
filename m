Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1BBC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIdCNAM4sjVbnTTkK2qbnrhOgJcFALss879IYMiIyLc=; b=e9RJQSwlcoJr/gDFWRPNdKmy+q
	Jys5bXK1M3FUsXIRYW7gV5wkRax8r2SrL9mwPT78ZZF+ZzI4M8PUTyHJUeG6vFETos+oEzDW8w8zx
	Gy6W9qQc/ENLZX1iac79G1Acrr75Zxibhdz/gSoTJl88sVK6+tSCcTy1tCS0CXMohlotEVTnkyVX3
	EDMDgLROvOQk84LpdbxyEwuHTw55Dlhfstxza+mXqzJQgUho2MzHPeGLMhfrtNJBC6Fv/Qi2jksqp
	Buw2pd4ytQTwYIvvJM7y2Fcs9nPtm2v2xnMw/VJAEJNSXJ1LKa/avFiAgrPDNbQj5L44xJTH4g/vI
	UHpdYTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trugx-00000004xOT-3Sc6;
	Tue, 11 Mar 2025 08:10:23 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trudK-00000004wr0-3f6C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:06:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZBmSY289mz1f0NZ;
	Tue, 11 Mar 2025 16:02:05 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 096F61402CD;
	Tue, 11 Mar 2025 16:06:26 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 11 Mar 2025 16:06:25 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH 1/2] watchdog/perf: Provide function for adjusting the
 event period
To: Doug Anderson <dianders@chromium.org>
References: <20250307021811.46981-1-yangyicong@huawei.com>
 <20250307021811.46981-2-yangyicong@huawei.com>
 <CAD=FV=WfB6inJPuwfhbw4mtFBYpr+3ot2J+SJAZ3pT3t4fW7cw@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5eaf8f37-c7f6-b2d0-c87b-6c48dcc80e52@huawei.com>
Date: Tue, 11 Mar 2025 16:06:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WfB6inJPuwfhbw4mtFBYpr+3ot2J+SJAZ3pT3t4fW7cw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_010639_081318_FB41017E 
X-CRM114-Status: GOOD (  14.82  )
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

On 2025/3/8 0:53, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 6, 2025 at 6:18 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> @@ -211,6 +211,27 @@ void hardlockup_detector_perf_cleanup(void)
>>         cpumask_clear(&dead_events_mask);
>>  }
>>
>> +/**
>> + * hardlockup_detector_perf_adjust_period - Adjust the events period due
>> + *                                          to cpu frequency change
>> + */
>> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
> 
> Running `scripts/kernel-doc -v kernel/watchdog_perf.c > /dev/null`
> after your patch shows:
> 
> kernel/watchdog_perf.c:219: warning: Function parameter or struct
> member 'cpu' not described in 'hardlockup_detector_perf_adjust_period'
> kernel/watchdog_perf.c:219: warning: Function parameter or struct
> member 'period' not described in
> 'hardlockup_detector_perf_adjust_period'
> 

so the script will check whether parameters are documented as well,
need to add description.

I just followed the document convention like hardlockup_detector_perf_cleanup().

> 
> Other than that, this seems reasonable to me.
> 
> ...but I'd also have to ask: is there a reason you're using the "perf"
> hard-lockup detector instead of the buddy one? In my mind, the "buddy"
> watchdog is better in almost all ways (I believe it's lower power,
> doesn't waste a "perf" controller, and doesn't suffer from frequency
> issues).

ok, sounds reasonable to me especially for save one perf counter.

> It's even crossed my mind whether the "perf" lockup detector
> should be deprecated. ;-)
> .

I think it's mainly due to the policy of the distribution. watchdog_perf
is used by default on openEuler which is used on my board.

Thanks.


