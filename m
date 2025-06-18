Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDE8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVnf3lMkIKRUxEbUeJAMlZspnmHQTE70UyCPO9eZzDs=; b=Jwdf9wXRZ/WhVS3yfTcgAQh6Y9
	CXY3WB5fLHHgd11HzgXrpWlAxnROGOeqbaBHSv0q44CRsSuLj5ZQos7CAlE0AS6MfOrlXYB6Ijbd/
	Mp3nw+BT+gEnKVBPwy1NT5c7tHhgZbrX6nQCgYwqg8DzDGdhL9QtcIzWk7h1bBLE5Haa5+zB+fTPq
	LzSiMfzQmSDhokJ/HfZtwQVioBnSIxd6RYoynjhAqXSkalF52OsIXxma5LwUcbtIQlT5VK9qSY5iU
	nriU2dkXjVU4IqlMiNWyH8goRkNJHIWPzOQbTO33zjFn3o4DlqzV/2rvHKlaWLbPFUIiYXLpRvYF8
	72dOlWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsSG-0000000ADow-26AZ;
	Wed, 18 Jun 2025 13:03:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqsF-00000009vTA-2b2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 11:22:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bMh9X54rFz1d1yR;
	Wed, 18 Jun 2025 19:20:16 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 408DD180B64;
	Wed, 18 Jun 2025 19:22:28 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 19:22:28 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 19:22:27 +0800
CC: Leo Yan <leo.yan@arm.com>, Leo Yan <leo.yan@linux.dev>,
	<yangyicong@hisilicon.com>, <acme@kernel.org>, <james.clark@linaro.org>,
	<namhyung@kernel.org>, <shameerali.kolothum.thodi@huawei.com>,
	<will@kernel.org>, <catalin.marinas@arm.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH] tools/headers: Workaround the copy coherency issue of
 arm64's cputype.h
To: Mark Rutland <mark.rutland@arm.com>
References: <20250618083017.62879-1-yangyicong@huawei.com>
 <aFJ8bQh_30JMzF_-@J2N7QTR9R3>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2fe89c81-9613-eb01-2487-115b8ea27e8e@huawei.com>
Date: Wed, 18 Jun 2025 19:22:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aFJ8bQh_30JMzF_-@J2N7QTR9R3>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_042235_819843_FE629A44 
X-CRM114-Status: GOOD (  17.09  )
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

On 2025/6/18 16:44, Mark Rutland wrote:
> On Wed, Jun 18, 2025 at 04:30:17PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> arch/arm64/include/asm/cputype.h is copied from arch/arm64 and used
>> by perf to parsing vendor specific SPE packets according to the MIDR.
>> The header diverge after errata management handling for VM live
>> migration merged [1] so a direct copy will lead to the build failure
>> of perf [2]: is_midr_in_range_list() is used but the implementation
>> has been changed and moved out of the kernel header.
> 
> The build failure described above manifests *IF AND WHEN* we update the
> userspace header with a copy of the kernel header, and there's no need
> to do so.
> 
>> Workaround this issue by maintaining is_perf_midr_in_range_list()
>> in the userspace. Temporarily include the kernel headers for the
>> MIDR definitions, a later refactor will generate the MIDR header
>> dynamically similar to how we handle the sysreg-defs.h in userspace.
>> Remove cputype.h from check-headers.sh.
> 
> Sorry, but NAK to this. As-is, this means that any change to the
> kernel-internal asm/cputype.h is liable to break the userspace tool, and
> placing a burden on whoever modifies the kernel-internal headers.
> 
> The simple solution for now is to *NOT* update the userspace header, and
> to stop warning that this has diverged from the kernel header. If we
> want to improve matters, we should split things appropriately for
> sharing.
> 

ok then I think we just make it as is and wait for Leo's refactor.

thanks.

