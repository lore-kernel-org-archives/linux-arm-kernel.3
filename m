Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23301C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNiDSDY5zBtmRhY35zkQby441xpQefuxe6fSaW7W1aM=; b=O5v2VVGHnX5CVlgwdONKgkKOWF
	C5ZAI4Ka9Acz2ERXKw2O0dW1Urr5JJ6Bq9vprzkHuLa1RM3J9yA7dqsshjNkSek7hJA1drR5bZlQP
	N1mQHq5dfvgKajzRANHyB0kah8P6eX13P/TRrhqWsYTOuf28GtkP5mrjcDB9jmIuMnfs3opFexUuE
	HgYZSFwsgIlJD6gVC18eI7bSxyrlwSKHhi0uI38OJHbJ8Boc7owm1no3dSc8jAxkXJfWK7OcMKtXS
	Do0U308TvMxGCFo389e09P+7BmbnzGKkYAuxe69BGBrrMz0Ix4sgzXscqN0Ju1HqPBVaZ6WgSx8HO
	83zqIaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7N-0000000DtMx-3tq2;
	Thu, 19 Jun 2025 18:36:09 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGTW-0000000DIiJ-3Cbj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:42:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bNNYt6MQ2z1d1qs;
	Thu, 19 Jun 2025 22:40:18 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id E3B2E14011A;
	Thu, 19 Jun 2025 22:42:31 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 22:42:30 +0800
Subject: Re: [PATCH 0/2] ACPI: Improve SPCR handling and messaging on
 SPCR-less systems
To: Li Chen <me@linux.beauty>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Liu Wei <liuwei09@cestc.cn>, Ryan Roberts
	<ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Li Chen <chenl311@chinatelecom.cn>,
	Sudeep Holla <sudeep.holla@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>
References: <20250606072802.191580-1-me@linux.beauty>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <af292806-633e-287a-2c05-777ac7bab22b@huawei.com>
Date: Thu, 19 Jun 2025 22:42:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250606072802.191580-1-me@linux.beauty>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_074247_018462_E0FE6692 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Li Chen,

On 2025/6/6 15:27, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> This small series improves the kernel behavior and output when the ACPI SPCR
> table is not present or not supported.
> 
> Currently, even on systems that completely lack an SPCR table, the kernel prints:
> "Use ACPI SPCR as default console: Yes"

Agreed, this is wrong, we need to fix it.

> 
> Or if with acpi=nospcr:
> "Use ACPI SPCR as default console: No"

I think this is OK, it's just to let you know we are not
using ACPI SPCR console when ACPI is enabled, including
cases with no SPCR table.

> 
> This may mislead users into thinking an SPCR table exists
> when in fact there is no such table at all. This series addresses this in two steps:
> 
> Patch 1 ensures that acpi_parse_spcr() returns -ENODEV if CONFIG_ACPI_SPCR_TABLE is disabled.
> 
> Patch 2 updates arm64 acpi_boot_table_init() to only print the SPCR console message
> if acpi_parse_spcr() succeeds.

I have some detail comments for patch 2.

Thanks
Hanjun

