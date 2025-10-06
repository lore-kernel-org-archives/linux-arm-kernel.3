Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BCCCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyB/2Pk5wijagVYBD6/smx6bBOT8c4NVWW3i8n/rIkA=; b=faw7L4Ym1f+2yNw3lesPECwnUc
	MPydT/8j2vZGEVJP/O7VgXs7i6zqfZIz3DFF4zK31+ueOjYEaSNMfHm8fUp1TtvDDD3TXD+huUIcc
	zT+F5JjUcTlP9U65YV10mS80rlWsyiLPxaAxJhqRn45GirMPRl6z7GRKDGSYue+YkxxMTQ9CPyUX9
	e3SvTCO9zPrPFZXvilqSLfOyXZ+YHPvH0VvSw7eZVs07KQ1CcTvskk4bJGUZ3Mu8OBYGr00KMzjGL
	i2b17UnNF5IHpeN70ZMwd1GT1mX5qEx1Ia7uqK9EMNgDDRVlCWTTVorWVqfaeAVdIl4w5Fdywgnsq
	rVeRGnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uar-000000010e4-0gk9;
	Mon, 06 Oct 2025 23:26:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uap-000000010dk-0HU0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759793170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyB/2Pk5wijagVYBD6/smx6bBOT8c4NVWW3i8n/rIkA=;
	b=AbLHdYro6p8XL/0/7lrqOPWhCRymXVEihMuEjBT0EjLc/O/SZgAh0J72LviqtvDFtTlDL0
	AfcXYhtYpV5OZC9rSqz+tkNvOu/7M/QJ3oTlwuCPjFf61nYmNRodlpxROl74W+2MiDFK+M
	ztm8QowS6okKwCIcuWRJQcRoXBZbyAY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-PEBOn8Z5O9eifOf4m0Rc5A-1; Mon, 06 Oct 2025 19:26:08 -0400
X-MC-Unique: PEBOn8Z5O9eifOf4m0Rc5A-1
X-Mimecast-MFC-AGG-ID: PEBOn8Z5O9eifOf4m0Rc5A_1759793167
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so10021127a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759793167; x=1760397967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyB/2Pk5wijagVYBD6/smx6bBOT8c4NVWW3i8n/rIkA=;
        b=V9gCGK4prnlyu23H0X3B5amaBqSWvoN+SeDUF7ldQ5+vFz/9RI7F7aLKjNUPDcSzeJ
         0zqO4Sh6W8mIcWHpfYgbGZd8jQQ32oyUqQz9TaWt56zNCVz+kqHuE7P99Lhh2Gso89aQ
         fv2EM9N1JdQTlwxlpbkJC2kE2DZ/ZoTYoVk4koOaTFxsAu02QaislQuk4MybrRLLXrSF
         nEU3XfVr67TsJ9uIbw1PJmOoKDsfpuJjsqYAiFmTMmLqvpR68Im1qdx2QaxWO+iL8W3e
         dZ4uvnvFqZmV0zC1HIkaa1xe0mUZecCSTpo3d/1LuBbClEVtcsGFOFlspBAAYocnnhnq
         evTA==
X-Forwarded-Encrypted: i=1; AJvYcCWz9LaO6Bx3uSRk50043YGdk3pgpJMdehlF41pq48WAc+pbE7+iylQwl48kdCxnGk7XOXmveSnmwzSkGtnnnhRN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6VZxU+hWK9zK6cMd4zDHT1YA/SCENit83NPoI16i3CYPO0KYp
	2yn890Ux8eCx9wUxSvzQCC50JwS6PUKc3r5uTU88LKs+5s52P5HNc4Ghm6uU/yiLWJLWG/anfIG
	BsyF921kzsVG1vk8f8pFHgCPas/MTg1He9xzvSzcmej9wYfuga9YhxuWSB5WuD1Qta3CljDyUHd
	eP
X-Gm-Gg: ASbGncsTTELjDIQ7e+UvkImfgqCv36+n7aJ8rH8r/43oIrrBiali7xBWqG1QPA2SxAe
	LU8Oklf6rjOkdb/c72ooDrBKyhZjpwurENfavhqjg2vVgEaJyF5lsHyi59Li6qTkAFWoeH7Ng/x
	ZlnIJlQoyk05810bVzZuHBImN1fyyT+RHbXS+PHCe3q+3xS2krIHYwC12yEv8DMChfbcoSSlhSC
	PsbgzZJmFMba2VbtS3H037QxXbWz4+M7YubTbS2iJSsEI01rS8tOB4lr6j3J53MOFhEKoeH9xmF
	OilPqPukasR5FWV0suqhqtmB5KChTY5/p+b4s+jUklXa/B3GG+JXwpvybSwd6wER3Mpva94UVT8
	/DEMm+r49IA==
X-Received: by 2002:a17:90b:4a8c:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-339c27bc475mr17899831a91.29.1759793167276;
        Mon, 06 Oct 2025 16:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERIFLl8GkviCDqbLVDIbfSKCg91e+HAkaXDPlbRbY5H7aG5yx3n7cRQWkYPRFuLdo2BGpp1g==
X-Received: by 2002:a17:90b:4a8c:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-339c27bc475mr17899797a91.29.1759793166872;
        Mon, 06 Oct 2025 16:26:06 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff256dsm17874793a91.16.2025.10.06.16.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 16:26:06 -0700 (PDT)
Message-ID: <92e05ef2-356b-4c1f-99c3-1e7482775cdc@redhat.com>
Date: Tue, 7 Oct 2025 09:25:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/29] arm_mpam: Add MPAM MSC register layout
 definitions
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-10-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-10-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nvJtIIFSKtgpAm875eHCH1K7psffU9zsFpXPu-A7FNM_1759793167
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_162611_182249_839CDDF2 
X-CRM114-Status: GOOD (  18.48  )
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

Hi James,

On 9/11/25 6:42 AM, James Morse wrote:
> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
> (MSCs) with an identity/configuration page.
> 
> Add the definitions for these registers as offset within the page(s).
> 
> Link: https://developer.arm.com/documentation/ihi0099/latest/
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v1:
>   * Whitespace.
>   * Added constants for CASSOC and XCL.
>   * Merged FLT/CTL defines.
>   * Fixed MSMON_CFG_CSU_CTL_TYPE_CSU definition.
> 
> Changes since RFC:
>   * Renamed MSMON_CFG_MBWU_CTL_TYPE_CSU as MSMON_CFG_CSU_CTL_TYPE_CSU
>   * Whitepsace churn.
>   * Cite a more recent document.
>   * Removed some stale feature, fixed some names etc.
> ---
>   drivers/resctrl/mpam_internal.h | 267 ++++++++++++++++++++++++++++++++
>   1 file changed, 267 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 02e9576ece6b..109f03df46c2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -152,4 +152,271 @@ extern struct list_head mpam_classes;
>   int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>   				   cpumask_t *affinity);
>   
> +/*
> + * MPAM MSCs have the following register layout. See:
> + * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
> + * Component Specification.
> + * https://developer.arm.com/documentation/ihi0099/latest/
> + */
> +#define MPAM_ARCHITECTURE_V1    0x10
> +
> +/* Memory mapped control pages: */

":" seems unnecessary.

> +/* ID Register offsets in the memory mapped page */
> +#define MPAMF_IDR		0x0000  /* features id register */
> +#define MPAMF_MSMON_IDR		0x0080  /* performance monitoring features */
> +#define MPAMF_IMPL_IDR		0x0028  /* imp-def partitioning */
> +#define MPAMF_CPOR_IDR		0x0030  /* cache-portion partitioning */
> +#define MPAMF_CCAP_IDR		0x0038  /* cache-capacity partitioning */
> +#define MPAMF_MBW_IDR		0x0040  /* mem-bw partitioning */
> +#define MPAMF_PRI_IDR		0x0048  /* priority partitioning */
> +#define MPAMF_CSUMON_IDR	0x0088  /* cache-usage monitor */
> +#define MPAMF_MBWUMON_IDR	0x0090  /* mem-bw usage monitor */
> +#define MPAMF_PARTID_NRW_IDR	0x0050  /* partid-narrowing */
> +#define MPAMF_IIDR		0x0018  /* implementer id register */
> +#define MPAMF_AIDR		0x0020  /* architectural id register */
> +
> +/* Configuration and Status Register offsets in the memory mapped page */
> +#define MPAMCFG_PART_SEL	0x0100  /* partid to configure: */

":" seems unnecessary.

> +#define MPAMCFG_CPBM		0x1000  /* cache-portion config */
> +#define MPAMCFG_CMAX		0x0108  /* cache-capacity config */
> +#define MPAMCFG_CMIN		0x0110  /* cache-capacity config */
> +#define MPAMCFG_CASSOC		0x0118  /* cache-associativity config */
> +#define MPAMCFG_MBW_MIN		0x0200  /* min mem-bw config */
> +#define MPAMCFG_MBW_MAX		0x0208  /* max mem-bw config */
> +#define MPAMCFG_MBW_WINWD	0x0220  /* mem-bw accounting window config */
> +#define MPAMCFG_MBW_PBM		0x2000  /* mem-bw portion bitmap config */
> +#define MPAMCFG_PRI		0x0400  /* priority partitioning config */
> +#define MPAMCFG_MBW_PROP	0x0500  /* mem-bw stride config */
> +#define MPAMCFG_INTPARTID	0x0600  /* partid-narrowing config */
> +

[...]

Thanks,
Gavin


