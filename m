Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B12CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFLvgc1XX4un00zJ+Q3n4wY8PGvVCm9vyoI1XyLfwEk=; b=1Cd/XUASWFGHcVFiKh3TBAJsQH
	FvjfOQ8jVptxp3Q3T8GJXcStDAfOhyJ81ZpLbaN0vHdozLQs2m0K/7LoaX4ZcREnX1jd56ujZObGL
	cP7+FtFX+rNL+KbsAyH5lxW7UhXYZ0RH4FouN/GuZk9Jt62qQlRXsAg5FdPT9AbwglFt2RgqRRSVD
	4iRfnRETdv70OcqaYvlLPdtrPqZAUqdkla4AHCrarUkYror4pQmPgT6+3iiyVoYr4pZxtc7R9XCnW
	1rqfzFwyK9wxtXWpvqwcymZduwg4X38YH3D97jfDK0jo7X/+3oFjBss+qXVpuh6ZbXua0JKIWXMHo
	8vAqL2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eQk-00000006uVo-1u32;
	Fri, 17 Oct 2025 06:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eQh-00000006uUL-3tuW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FF541595;
	Thu, 16 Oct 2025 23:59:01 -0700 (PDT)
Received: from [10.57.66.216] (unknown [10.57.66.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000D03F66E;
	Thu, 16 Oct 2025 23:59:05 -0700 (PDT)
Message-ID: <47f246e1-7c18-45f9-acc0-32cf45cb8816@arm.com>
Date: Fri, 17 Oct 2025 08:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64/mm: Allow __create_pgd_mapping() to
 propagate pgtable_alloc() errors
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>, stable@vger.kernel.org
References: <20251015112758.2701604-1-linu.cherian@arm.com>
 <20251015112758.2701604-2-linu.cherian@arm.com>
 <91a246e6-1efb-43d9-80a4-8445549f47cc@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <91a246e6-1efb-43d9-80a4-8445549f47cc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235912_006593_9220F605 
X-CRM114-Status: GOOD (  11.32  )
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

On 17/10/2025 07:24, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b8d37eb037fc..638cb4df31a9 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -49,6 +49,8 @@
>>  #define NO_CONT_MAPPINGS	BIT(1)
>>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>  
>> +#define INVALID_PHYS_ADDR	(-1ULL)
>> +
> Should this be defined as (~(phys_addr_t)0) instead ? Probably
> INVALID_PHYS_ADDR macro should be made generic as well as this
> is being used in multiple places. But that's besides the point
> here.

This patch is simply moving the definition higher in the file, so I
think it should leave it unchanged. Moving the definition to a generic
header (in a separate patch/series) would clearly be a good idea though.

- Kevin

> arch/arm64/mm/mmu.c			#define INVALID_PHYS_ADDR   (-1ULL)
> arch/s390/boot/vmem.c			#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
> drivers/vdpa/vdpa_user/iova_domain.h	#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
> kernel/dma/swiotlb.c			#define INVALID_PHYS_ADDR (~(phys_addr_t)0)

