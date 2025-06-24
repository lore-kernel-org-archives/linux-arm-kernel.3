Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDCDC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqh8hyO2e/5Pm97GkiDtr+4uzRCgOd1ghb5PF76CpaM=; b=kwLP2M/c/5QKofIrZZBE6/B707
	a3dY86E4ZfaW/ASRMcwzMV2r+MjKM9QD2i6h310FgOOkcy/++7U2XiwDQF34MuAo7TJyAtyGt84Yp
	FC/fjsHe/sOVtVTF70LTvGf5cCOTMwE/e/DuvxmKo+e2AdVkVGncssgdqxombiJbhnQdincHRoSn9
	Ck7SuLXm1XoJYx1lTqJiLnD3DLlJ6zOr2fgD84wFzzcCl6O8ch5SeQwsLntVZWee4ENfzmkjEJf/5
	+ipvmwU9IAB58VmRcGogbgbuVYy4YzPRNG+96DISGG7BnpZjTYD+CmB/sI6/q4KaSPHlUkbxSb6aP
	3i2rSU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1tR-00000005RJ7-0Uk0;
	Tue, 24 Jun 2025 11:32:49 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1LK-00000005MrC-26be
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:57:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bRMM40RWHz2QVL1;
	Tue, 24 Jun 2025 18:56:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 168711A0188;
	Tue, 24 Jun 2025 18:55:21 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 18:55:20 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 18:55:19 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, <linux-pm@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 0/2] Update the watchdog period according to
 real CPU frequency
To: Andrew Morton <akpm@linux-foundation.org>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250623163028.1914d7ec909eb9bfc1daa666@linux-foundation.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a23d3a95-665f-d7b6-064c-770b1c30a05f@huawei.com>
Date: Tue, 24 Jun 2025 18:55:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250623163028.1914d7ec909eb9bfc1daa666@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035734_704302_2240B098 
X-CRM114-Status: GOOD (  11.47  )
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

On 2025/6/24 7:30, Andrew Morton wrote:
> On Thu, 19 Jun 2025 19:48:03 +0800 Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> watchdog perf needs architecture to provide method for converting the watchdog
>> thresh to counter period. For arm64 we're using the max CPU frequency for
>> doing the conversion which is from cpufreq driver. But some cpufreq driver
>> are registered lately, for example cppc_cpufreq will be registered at late
>> initcall which is after the initialization of watchdog perf (initialized in
>> armv8_pmuv3 of device initcall). In such case the period of watchdog will not
>> be accurate enough. Fix this by registering a cpufreq notifier and update the
>> watchdog period once the cpufreq driver is initialized.
> 
> Great, thanks.  I'll add these to mm.git for testing.
> 

thanks.

>> arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
>> include/linux/nmi.h              |  2 ++
>> kernel/watchdog_perf.c           | 23 +++++++++++++
> 
> This is not exactly my comfort zone so additional review would be
> appreciated, please.  Even though it doesn't touch drivers/cpufreq,
> perhaps the developers over there could take a look?
> .

sure. I've already cc'ed them.

thanks.

