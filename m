Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99CAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMsgE4cTOvGu1oHN2jPXinLwurlF8Y91utoENFVkqYo=; b=RIrAzAyJFGstTzYT1anFn5ufFj
	0XSJdhgY7DbWH2QW55fcBckMeOwl2Z894V2tnwvT7oA6udWsypJUzxhC7e2CbCABtBLl7NQDxlMuN
	1zECxnSkYsEtZV9aIOF7uHEmUvo0c8NaEtG8wN/wgyulHfYeettATUNxTTTLvx9C8BF/Md8TpqKpG
	nvx1uQsZs4KpRF1vHT+qT9C8gNbDYyRqaE+kb1n6yqxShgGJZgM0vcFPe5HBVeKdpnZg4R/Ufi64X
	wJ3/9trsfdTX4ZAcnMBXTvffDWISJSGzHQ6zv/GhCIc2anydQMntpP83M2EV+OlQhRf598xZccAq2
	RtNpZBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavkm-0000000COO8-4A1g;
	Thu, 23 Jan 2025 11:52:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavjV-0000000COEx-0g7Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:50:50 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NBoEvq1193662
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 05:50:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737633014;
	bh=BMsgE4cTOvGu1oHN2jPXinLwurlF8Y91utoENFVkqYo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PIQTGdD0zerWx/dHLYjUCcDjoAEz+GBDXpI17vGfhHrA5NGrmok0w438APiNoBOAg
	 8jsc/s+7p0tdHxD2E2GmKW3gldTWSZb2VfHhqt6CBqjGuw1Sm/XfGPytf0pY5K8DWn
	 KdBAJkHHnBLXuIvaPABQA5nXPo0kZ6FCLByvTRRY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NBoED8054261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 05:50:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 05:50:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 05:50:14 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NBo7bw107089;
	Thu, 23 Jan 2025 05:50:08 -0600
Message-ID: <f1bdd422-5034-4390-95b1-36cd04109fb3@ti.com>
Date: Thu, 23 Jan 2025 17:20:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/3] Add native mode XDP support
To: Simon Horman <horms@kernel.org>
CC: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <robh@kernel.org>,
        <matthias.schiffer@ew.tq-group.com>, <dan.carpenter@linaro.org>,
        <rdunlap@infradead.org>, <diogo.ivo@siemens.com>,
        <schnelle@linux.ibm.com>, <glaroque@baylibre.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122131341.GH390877@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20250122131341.GH390877@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_035049_287128_E58285E1 
X-CRM114-Status: GOOD (  15.95  )
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



On 22/01/25 18:43, Simon Horman wrote:
> On Wed, Jan 22, 2025 at 06:19:48PM +0530, Meghana Malladi wrote:
>> This series adds native XDP support using page_pool.
>> XDP zero copy support is not included in this patch series.
>>
>> Patch 1/3: Replaces skb with page pool for Rx buffer allocation
>> Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
>> Patch 3/3: Introduces native mode XDP support
> 
> Hi Meghana,
> 
> Unless I am mistaken this patchset should be targeted at net-next,
> as a new feature, rather than net, as bug fixes.
> 

Yes Indeed. Thanks for pointing this to me. I will be more vigilant next 
time I am posting to avoid such mistakes. :)

> With that in mind:
> 
> ## Form letter - net-next-closed
> 
> The merge window for v6.14 has begun. Therefore net-next is closed
> for new drivers, features, code refactoring and optimizations.
> We are currently accepting bug fixes only.
> 
> Please repost when net-next reopens after Feb 3rd.
> 

My bad for not checking this before posting. I will re-post it after Feb 
3rd. Thanks a lot.

> RFC patches sent for review only are obviously welcome at any time.
> 
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
> 
> --
> pw-bot: deferred

