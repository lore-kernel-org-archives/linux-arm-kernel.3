Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D083C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYB1vJmLe3Rdmr0/MzKqJ7D+Hn3xvbuTIwyJ1UMzVdU=; b=o69TwH07XHU8uvzzbXdOjUrorx
	ej4IAh1onFqLMAt4JieqziftBBXUeyAOzEVCvQN3UcqKxv+gHl0olXHV61GbwdKE8zkAsLJUcnIbW
	KOCwIIbxSqcIfmVO+bG6d0z4Mn8i3xCK6aY2DjSzA75fen84RPv31EQug9Np75cxRGIonwRy3SPhP
	+AMU7DtXeNmQvRANDy0TILNLr2bClOcpZkgQquElJcdoA0HKtStjl1P5P4dG5tu8wSoYxtQ/jBwFP
	SuixYCl0ty66SNz0SvQA1bYTSHvs7E7l6IQgZwUq9sHpvHN0jvPxqwZSQ0eXuwpPdaA14CZYa2uEd
	BQMJMaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQEs-0000000GWVh-1GDR;
	Sat, 28 Jun 2025 07:44:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQCX-0000000GW5Z-3yDK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 07:42:19 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bTklm3rKCz10XKK;
	Sat, 28 Jun 2025 15:37:24 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 30664180492;
	Sat, 28 Jun 2025 15:42:03 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Jun 2025 15:42:02 +0800
Subject: Re: [PATCH v2 0/2] ACPI: Improve SPCR handling and messaging on
 SPCR-less systems
To: Li Chen <me@linux.beauty>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Liu Wei <liuwei09@cestc.cn>, Ryan Roberts
	<ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>
References: <20250620131309.126555-1-me@linux.beauty>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <67983ddc-b8f8-43b5-209f-ca77c91fe56b@huawei.com>
Date: Sat, 28 Jun 2025 15:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250620131309.126555-1-me@linux.beauty>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_004218_260028_413520DF 
X-CRM114-Status: GOOD (  16.00  )
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

On 2025/6/20 21:13, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> This small series improves the kernel behavior and output when the ACPI SPCR
> table is not present or not supported.
> 
> Currently, even on systems that completely lack an SPCR table, the kernel prints:
> "Use ACPI SPCR as default console: Yes"
> 
> This may mislead users into thinking an SPCR table exists
> when in fact there is no such table at all. This series addresses this in two steps:
> 
> Patch 1 ensures that acpi_parse_spcr() returns -ENODEV if CONFIG_ACPI_SPCR_TABLE is disabled.
> 
> Patch 2 updates arm64 acpi_boot_table_init() to only print the Yes
> if acpi_parse_spcr() succeeds.
> 
> This results in cleaner and more accurate boot logs on ARM64.
> 
> Tested on both SPCR-enabled and SPCR-less qemu-system arm64 virt platform. [1]
> 
> Changelog:
> v2: refine the printk message logic as suggested by Hanjun Guo. [2]
> 
> [1]: https://patchew.org/QEMU/20250528105404.457729-1-me@linux.beauty/
> [2]: https://www.spinics.net/lists/kernel/msg5730585.html
> 
> Li Chen (2):
>    ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is
>      disabled
>    ACPI: Suppress misleading SPCR console message when SPCR table is
>      absent
> 
>   arch/arm64/kernel/acpi.c | 10 +++++++---
>   include/linux/acpi.h     |  2 +-
>   2 files changed, 8 insertions(+), 4 deletions(-)

This version looks good to me,

Acked-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

