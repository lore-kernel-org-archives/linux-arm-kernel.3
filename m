Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A3CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjl+UovRofdoPTj4emOm44uWFRBi7Tw1Dei+zuUrC8A=; b=D3tPZ1lggTaimhE78gdHh35C3K
	c+0Ble7izGlvGAE9vqxgtx/MfjqqiEnYt/zbzgTNiAYUMjvXgaNKvkdc7D6KaXbzwVcEBZ0AQqW5o
	i9yKQM2514aMZt1Pw+mI0qmCRr4EHY9sC35gUGpiN7YxellS5+o5MABVzStgJX8JqxGmKX+CdkgP+
	IPZ7D2wbX9PgHX5QwlgqS6USyWzOLvQME2m+kl78E6y51/b+LPgdMJ/9PvkaTHG69jf4TlirQA0Ph
	8MJGoyEDB4ZKMGiVRWlV3G5w3L9sphoA3a6YVxv3W89Uw+d+5klADPgLK/gRoy8J2sN+yszzEDn1I
	hcmSfG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjae-0000000GjqC-2b9V;
	Tue, 29 Jul 2025 12:37:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjU9-0000000Gj39-2CzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:31:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F041516;
	Tue, 29 Jul 2025 05:31:05 -0700 (PDT)
Received: from [10.57.3.117] (unknown [10.57.3.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A99D3F673;
	Tue, 29 Jul 2025 05:31:11 -0700 (PDT)
Message-ID: <422098f2-4c91-4e55-a890-7e80a1e04249@arm.com>
Date: Tue, 29 Jul 2025 13:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] coresight: Fix and improve clock usage
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <175343531849.493374.1972746372917823.b4-ty@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <175343531849.493374.1972746372917823.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_053113_614591_3842E4B5 
X-CRM114-Status: GOOD (  11.43  )
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

On 25/07/2025 10:22, Suzuki K Poulose wrote:
> 
> On Thu, 24 Jul 2025 16:22:30 +0100, Leo Yan wrote:
>> This series fixes and improves clock usage in the Arm CoreSight drivers.
>>
>> Based on the DT binding documents, the trace clock (atclk) is defined in
>> some CoreSight modules, but support is absent. In most cases, the issue
>> is hidden because the atclk clock is shared by multiple CoreSight
>> modules and the clock is enabled anyway by other drivers. The first
>> three patches address this issue.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/10] coresight: tmc: Support atclk
>          https://git.kernel.org/coresight/c/e96d605a66ff
> [02/10] coresight: catu: Support atclk
>          https://git.kernel.org/coresight/c/7eca4399060d
> [03/10] coresight: etm4x: Support atclk
>          https://git.kernel.org/coresight/c/14fb833b8204
> [04/10] coresight: Appropriately disable programming clocks
>          https://git.kernel.org/coresight/c/ce15ee28bddd
> [05/10] coresight: Appropriately disable trace bus clocks
>          https://git.kernel.org/coresight/c/90b0000bd501
> [06/10] coresight: Avoid enable programming clock duplicately
>          https://git.kernel.org/coresight/c/5c0ead76597b
> [07/10] coresight: Consolidate clock enabling
>          https://git.kernel.org/coresight/c/f47d7f7da638
> [08/10] coresight: Refactor driver data allocation
>          https://git.kernel.org/coresight/c/7471c81e60b9
> [09/10] coresight: Make clock sequence consistent
>          https://git.kernel.org/coresight/c/d4cf59aa905b
> [10/10] coresight: Refactor runtime PM
>          https://git.kernel.org/coresight/c/2b52cf338d39
> 
> Best regards,

I have dropped this from -next, due to the issues reported by
Mark.

Suzuki


