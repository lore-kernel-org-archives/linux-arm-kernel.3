Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C00BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIjKxzEPWY2SYGWXUttLCwx6grvtC94JIZYrLh5T5H8=; b=QdLQ6kFKavKYQRO2nwUfgquiq3
	S2AmQ9F44xH3uXTGqCOKy/68SNz40Xc25+pCDVhZkLqqpRs6XmR+ZPvcX6h7I8F/FApDQk0rFdztW
	Abb+Q3jq+B9Xhxv7+6dm2MZzQUMJYHM4x7ijjU5zkc1UCq+k3mumIEueslO+wwFlOq7a1YoxYho4o
	rEjoPbcI0D9rJpw4VspYKcs7alqk1hL03rHkXPgZ9G1scfjDlpnGnW3mNzbyjzO78ujghIMrPTJ/S
	PMtipDj+anEPEkrUTTDgT6LjgZjRU5B3+zwOashusRUAIYexY1urZUnXgobbH/eMSobdQkxagtjG6
	FijF5ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszWl-0000000BWfs-43iV;
	Mon, 01 Sep 2025 08:04:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz9E-0000000BSun-02rA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 07:40:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EC7B1A25;
	Mon,  1 Sep 2025 00:40:06 -0700 (PDT)
Received: from [10.57.57.17] (unknown [10.57.57.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 195E83F63F;
	Mon,  1 Sep 2025 00:40:08 -0700 (PDT)
Message-ID: <3f6e36f1-c942-40d6-8a46-63f3ba0d0d84@arm.com>
Date: Mon, 1 Sep 2025 09:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
 function signature
To: David Hildenbrand <david@redhat.com>, Kees Cook <kees@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Yue Haibing <yuehaibing@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, James Morse <james.morse@arm.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250829190721.it.373-kees@kernel.org>
 <c13af2e9-a0ac-4e1d-be8e-4612ae8d9c0f@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c13af2e9-a0ac-4e1d-be8e-4612ae8d9c0f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_004016_094626_52C4E63D 
X-CRM114-Status: GOOD (  11.05  )
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

On 29/08/2025 21:13, David Hildenbrand wrote:
>> [...]
>>
>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>> index 6e8aa8e72601..49f1a810df16 100644
>> --- a/arch/arm64/include/asm/mmu.h
>> +++ b/arch/arm64/include/asm/mmu.h
>> @@ -17,6 +17,13 @@
>>   #include <linux/refcount.h>
>>   #include <asm/cpufeature.h>
>>   +enum pgtable_type {
>> +    TABLE_PTE, m68k_table_types
>> +    TABLE_PMD,
>> +    TABLE_PUD,
>> +    TABLE_P4D,
>> +};
>
> Just noting that we now have "enum pgtable_level" in
> include/linux/pgtable.h that could at some point possibly be used here
> instead (not in this fix). 

Thanks for the heads-up! I'll look into using the new generic enum
instead, there's really no need for every architecture to invent its
own. m68k could also use it instead of m68k_table_types.

- Kevin

