Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F9D0BB59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 03:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTbaobEH/8/0cqCVbE94En73Ai8HGZclfFb36CJgUYc=; b=Q42e1CpzuVwAJeROqDbV+VKeIB
	6eqEVEVK8FOE/RpX8tjX0n+IHD83NRdtoJmWvwMPbIqq/p2/Pq80RhWEUKHPrPVkBFE9fp/wPvqFU
	vSFLCS7wPLuKv/+rtRI3mKH2uAGNb0R9Py5DaJ8C+ZmxwQV+7HplGBOe4H44YwoZRZiiQwz2tnJZG
	tCtgyhYzTzFwGwHFa8rt9Z4pJ+3x4w0LlXRFDVnRIAm0Ez8yqllA3qNy+ewMfevY6Z4UTpaVmD5cS
	wKH7bKPvlUU0qD9F/CIfW8CJjxgOqlKCfsLM1gf9FPl3V8lutx+66fKdv2VgVpAy+AHSWI1AbtmpS
	RMFhOAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3owo-0000000GfC3-2p7D;
	Thu, 24 Oct 2024 03:55:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ovH-0000000GezC-2OH9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 03:54:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYsSG3ldvzyTmd;
	Thu, 24 Oct 2024 11:52:30 +0800 (CST)
Received: from kwepemd200013.china.huawei.com (unknown [7.221.188.133])
	by mail.maildlp.com (Postfix) with ESMTPS id C7A8E14011D;
	Thu, 24 Oct 2024 11:54:02 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemd200013.china.huawei.com (7.221.188.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 11:54:02 +0800
Message-ID: <da6a0b86-4797-486c-8f02-472c9dcc01fa@huawei.com>
Date: Thu, 24 Oct 2024 11:54:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Return early when break handler is found on
 linked-list
To: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<ptosi@google.com>, <oliver.upton@linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240827110046.3209679-1-liaochang1@huawei.com>
 <Zs3LnYkXL5sg2yBH@J2N7QTR9R3.cambridge.arm.com>
 <f9357dff-1f08-42ce-b6c2-93b3a2d9336f@huawei.com>
 <20241023164014.GE29251@willie-the-truck>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20241023164014.GE29251@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200013.china.huawei.com (7.221.188.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_205407_817850_4F4A433F 
X-CRM114-Status: GOOD (  10.83  )
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



在 2024/10/24 0:40, Will Deacon 写道:
> On Wed, Oct 23, 2024 at 09:52:27AM +0800, Liao, Chang wrote:
>> Kindly ping.
>>
>> I'd like to get your input on the next step. Should I send a v2 patch
>> that only removes the WARN_ON() as Will suggested? Or should I push
>> forward the refactoring of calling BRK hook [1].
> 
> If you have the bandwidth to tackle Mark's refactoring idea, then please
> feel free to send a series. Otherwise, I'm happy to merge the v2. We
> could even do both.

Will, please pick the v2 from here:

  https://lore.kernel.org/all/20241024034120.3814224-1-liaochang1@huawei.com/

Meanwhile, I will discuss the refactoring patch with Mark. Thanks for your
suggestion.

> 
> Will

-- 
BR
Liao, Chang


