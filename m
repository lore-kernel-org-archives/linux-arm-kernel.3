Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CC0CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Nie1h/DAYANojmk9mE4qbYY7UUExRTvoZjX8ZL36hU=; b=aVhEBCUrQ4iE+6HP7EcSq3Lyt3
	VjwIzNeGhCYjfk4GFNT2NNL3MAWtuvxvQeHW6f0pgndYHwEOAcIbIbYyHwjpb83OPM4CXptC9aYSE
	T1IB3nI66GfXALDcTpnie97PXhvak2Ri+53rVgxXlsoNUq/UcQML6PpWBoPrXa4b4FH0ALmBsqOOg
	5/EqTRep2SImaqWcz5Oou4HwfueLMXYzkEJBW59hx6hWvi5poim7XMp50aygMG0oDHZg99A81M/G6
	GSkam5BzeftMamtESF0p4mOJUlmvoDurN2YDVFhPclj3Ch1VFRf9cio9F0FKvkM7Q5Q6gOaiXaaOJ
	HxnT1umQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gh8-0000000AWap-3wQo;
	Mon, 22 Sep 2025 13:35:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gh5-0000000AWaJ-3DME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:35:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B46191424;
	Mon, 22 Sep 2025 06:34:52 -0700 (PDT)
Received: from [10.57.95.38] (unknown [10.57.95.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BDFD3F694;
	Mon, 22 Sep 2025 06:34:59 -0700 (PDT)
Message-ID: <6c8a2900-cec8-4994-892a-3ef157d89a26@arm.com>
Date: Mon, 22 Sep 2025 14:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Workarounds and optimizations for Neoverse-V3AE
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>
Cc: kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919145832.4035534-1-ryan.roberts@arm.com>
 <175853683592.1350681.8237584408369869851.b4-ty@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <175853683592.1350681.8237584408369869851.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_063503_851108_2F811587 
X-CRM114-Status: GOOD (  11.91  )
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

On 22/09/2025 14:14, Will Deacon wrote:
> On Fri, 19 Sep 2025 15:58:27 +0100, Ryan Roberts wrote:
>> I know it's late in the cycle, but I thought I'd try my luck at sneaking this
>> in.
>>
>> Neoverse-V3AE has a different MIDR value to Neoverse-V3, but qualifies for the
>> same workarounds and optimizations ("SSBS not fully self-synchronizing" and
>> BBML2_NOABORT) so this just adds Neoverse-V3AE wherever Neoverse-V3 appears.
>> Details in the commits.
>>
>> [...]
> 
> Applied to arm64 (for-next/cpufeature), thanks!
> 
> [1/3] arm64: cputype: Add Neoverse-V3AE definitions
>       https://git.kernel.org/arm64/c/3bbf004c4808
> [2/3] arm64: errata: Apply workarounds for Neoverse-V3AE
>       https://git.kernel.org/arm64/c/0c33aa1804d1
> [3/3] arm64: cpufeature: add Neoverse-V3AE to BBML2 allow list
>       https://git.kernel.org/arm64/c/8fca3852e33d
> 
> Cheers,

Thank you!

