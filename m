Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF782C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdRypN3NdO1PcqpQF5cRxUFE7ZzVAaahg2EngRSRWgQ=; b=C1bQzApHP7dFTMnHLEVaAvCX5X
	yQnMXMq1mHUcnXl0qqjC0/ztUDDllvj5izks0We1UccCcUZoU+kszC2YSlHY2vpnYQ8nE6VzKZ7Wa
	5ynDrbom/bITkzbvF5nk/OK+NKrj854hqZXs3px7HmFKzKpW1Qpom4vY+grdxJqcOEEbqwmnNcNxc
	XTX/GZppUyz+KBUM9w9dTcXmXZuCLm+H0sNkDyLjx9cESlaPYART+GtdbOpZJ2wV5RfJg4e3SKip9
	NkRnCA0fgDSlW9mmaJKCPQMF50iSiPJ9HWxxVxTmIDuEIM8Zn8mR1e8J9s7qokcyw8TFL+LWBliXA
	hY+9T28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1laq-0000000EtEX-2jlt;
	Wed, 02 Sep 2026 14:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lan-0000000EtDw-3hfW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:05:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74BE6165C;
	Wed,  2 Sep 2026 07:05:29 -0700 (PDT)
Received: from [10.1.34.165] (e121487-lin.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CB643F882;
	Wed,  2 Sep 2026 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357933; bh=HdUOyaSyLSw7MUyV3NZhJV5QqKVEGr6Kg0j/lkyryVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LC0UAHu9yZVdmjuctWxQksIkeeD0YogY0lXMeDRl1igfzsBTIM7M2NzkO2PpRmiRv
	 ZIuLH3Rv2oNPg6iPO5F97K+iHobzJ1lMvDtU0gtQta0aBzsrHDhKvNZ8/qeSwBSj9C
	 rqH2EDYpy8pFqBJrQeSz3tgWkpIhh+epYZwbj/ME=
Message-ID: <c4c6bce4-f60a-4239-8084-fb7adc442286@arm.com>
Date: Wed, 2 Sep 2026 15:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 38/45] arm64: smp: Abstract SGI and LPI operations
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-39-vladimir.murzin@arm.com>
 <290a5478-5415-4b0d-a790-79fa7e430888@huawei.com>
 <2e1853fc-93ca-4a16-9056-57725b6327b5@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <2e1853fc-93ca-4a16-9056-57725b6327b5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070533_961174_84D25E2B 
X-CRM114-Status: GOOD (  12.44  )
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

On 8/29/26 04:47, Jinjie Ruan wrote:
> 
> 在 2026/8/13 16:01, Jinjie Ruan 写道:
>>
>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>> SGI and LPI backed IPIs require different setup, enable, disable and
>>> send operations. These differences are currently handled by repeatedly
>>> checking percpu_ipi_descs. As the implementation specific logic grows,
>>> these checks make the common IPI code increasingly difficult to
>>> follow.
>>>
>>> Introduce an operations structure for each implementation to
>>> encapsulate the specific of SGI and LPI handling, leaving the common
>>> IPI paths generic.
>>>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>> ---
>>>  arch/arm64/kernel/smp.c | 163 +++++++++++++++++++++++++---------------
>>>  1 file changed, 101 insertions(+), 62 deletions(-)
>> Hi, Vladimir,
>>
>> I believe that the modifications here do not need to be so extensive. By
>> maintaining the order of the related function definitions consistent
>> with the original, the changes can be reduced to only 126 lines, and the
>> modifications will be easier to review.

Hi Jinjie,

> Hi, Vladimir,
> 
> What do you think?

I think that perhaps we should pay more attention to the end result after
applying the patch. However, I understand why diff looks like that and
amount of work required to shrink it is close to zero, so in next version
stat would look like

 arch/arm64/kernel/smp.c | 135 ++++++++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 47 deletions(-)

Cheers
Vladimir

