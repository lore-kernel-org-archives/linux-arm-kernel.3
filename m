Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F593CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRjzQJGjw2JJF6SecgP0kJUb+uYm0x+KVQlxHfAeE7w=; b=tXVsVL6uBW4KRXn8m28jMWKHap
	CKu0fH7mbzYXv0dhDoVt2GJzNVFJwdbFB9P6opTOMepgZy4KJFNDepPf41Z7wH6qNVROQ3CDENNGL
	Nx77LSm+fVTdsOhZrcLox706r5UgYOT+ZIcUhT9Wb3T0XNhMEUNjeJnW5T3cNwPaMkHh4A/MSyWKR
	n3tb57h+Rl3kKNmB9x+sUX5RxoNeclyne0NwognbzFZOEEJxLyUL0bF8B2ioBnMec2gkm2Hv1l17V
	+BNc/TMA3DWW/Fi6PE/ZOIjEHTCEih3XoBqS2d7bfktSMQF2CKULQFNGmpirGSZmVZUazfejKibx/
	FqarsLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xFB-0000000Cf7l-1u5d;
	Tue, 23 Sep 2025 07:15:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xF8-0000000Cf7K-0vp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 07:15:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC997497;
	Tue, 23 Sep 2025 00:15:08 -0700 (PDT)
Received: from [10.57.81.133] (unknown [10.57.81.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E7D73F66E;
	Tue, 23 Sep 2025 00:15:14 -0700 (PDT)
Message-ID: <3aadd340-f2e3-4926-8a39-69a0162eaa9d@arm.com>
Date: Tue, 23 Sep 2025 08:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@redhat.com,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 Yang Shi <yang@os.amperecomputing.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
 <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
 <aM0-FQlepoxxGkRd@willie-the-truck>
 <ceaf604f-8ad7-4e19-812e-7eeace10d835@arm.com>
 <aM1E34lRjKg7nlRu@willie-the-truck>
 <38fa4717-9105-4bca-a2cd-914afc109570@arm.com>
 <aM2kg49jBia4VKYr@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aM2kg49jBia4VKYr@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_001518_381815_A7D20623 
X-CRM114-Status: GOOD (  11.81  )
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

On 19/09/2025 19:44, Will Deacon wrote:
> On Fri, Sep 19, 2025 at 01:00:49PM +0100, Ryan Roberts wrote:
>> On 19/09/2025 12:56, Will Deacon wrote:
>>> So how about we:
>>>
>>>   - Remove X4 from the list
>>>   - I try harder to apply your patch for secondary CPUs...
>>>   - ... if I fail, we can apply it next time around
>>>
>>> Sound reasonable?
>>
>> Yeah that works for me. Cheers!
> 
> So after all that, the conflict was straightforward once I sat down and
> looked at it properly.
> 
> Please can you check for-next/core? I forcefully triggered the
> repainting path in qemu and it booted without any problems.

Thanks Will, I took a look and didn't spot any problems. Thanks for squeezing
this in.

> 
> Will


