Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B6CF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ51CgQpN6Hc12+GBsB9pILpazBm+Ze7/F736tiSDzU=; b=1AQqnhS3Wv5yR186V9nmtuHgdD
	6mkj6G2+gqlyL6WyL5pjBIRXYCOSzFVq0aATRpbknUwu3giy3ba31eCB/R1y+4mEoUaAVGgPEDJ2Z
	0d/PI+ADQEMasVlB1RfxikByehA6fRJftFIhdCjMjL2w5eSMaTRN9qR5b7cN7Fw25fnT6tpI5WG7e
	pGpI2EJRq9ZZi4DKWxgWlHJc37tVoz6jwmdG4uuL5qAHpe0GEXG1+av1VF899HwMB+l0VXcRwSvyB
	ZELNcrFUPxTFT0MZ/NMCo+J2MwMcIzCBjgrcMhG8oic7RoQOWJO4f71nYA3swtatyecQUT8v1F3xO
	PLiGDjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl06-00000003hHf-1iVT;
	Wed, 19 Nov 2025 16:25:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl03-00000003hGv-2noL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58B4BFEC;
	Wed, 19 Nov 2025 08:25:34 -0800 (PST)
Received: from [172.27.42.169] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BFC43F740;
	Wed, 19 Nov 2025 08:25:38 -0800 (PST)
Message-ID: <e08b021c-5db9-49a8-b95d-0b3f957fedca@arm.com>
Date: Wed, 19 Nov 2025 10:25:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/34] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-3-ben.horgan@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20251117170014.4113754-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082543_790975_B2654A0C 
X-CRM114-Status: GOOD (  23.95  )
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

On 11/17/25 10:59 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> In acpi_count_levels(), the initial value of *levels passed by the
> caller is really an implementation detail of acpi_count_levels(), so it
> is unreasonable to expect the callers of this function to know what to
> pass in for this parameter.  The only sensible initial value is 0,
> which is what the only upstream caller (acpi_get_cache_info()) passes.
> 
> Use a local variable for the starting cache level in acpi_count_levels(),
> and pass the result back to the caller via the function return value.
> 
> Get rid of the levels parameter, which has no remaining purpose.
> 
> Fix acpi_get_cache_info() to match.

Sure,

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>>
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> s/starting_level/current_level/ (Jonathan)
> ---
>   drivers/acpi/pptt.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index b8248c0092fe..2856254e29d7 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -177,14 +177,14 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   }
>   
>   /**
> - * acpi_count_levels() - Given a PPTT table, and a CPU node, count the cache
> - * levels and split cache levels (data/instruction).
> + * acpi_count_levels() - Given a PPTT table, and a CPU node, count the
> + * total number of levels and split cache levels (data/instruction).
>    * @table_hdr: Pointer to the head of the PPTT table
>    * @cpu_node: processor node we wish to count caches for
> - * @levels: Number of levels if success.
>    * @split_levels:	Number of split cache levels (data/instruction) if
>    *			success. Can by NULL.
>    *
> + * Return: number of levels.
>    * Given a processor node containing a processing unit, walk into it and count
>    * how many levels exist solely for it, and then walk up each level until we hit
>    * the root node (ignore the package level because it may be possible to have
> @@ -192,14 +192,18 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>    * split cache levels (data/instruction) that exist at each level on the way
>    * up.
>    */
> -static void acpi_count_levels(struct acpi_table_header *table_hdr,
> -			      struct acpi_pptt_processor *cpu_node,
> -			      unsigned int *levels, unsigned int *split_levels)
> +static int acpi_count_levels(struct acpi_table_header *table_hdr,
> +			     struct acpi_pptt_processor *cpu_node,
> +			     unsigned int *split_levels)
>   {
> +	int current_level = 0;
> +
>   	do {
> -		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
> +		acpi_find_cache_level(table_hdr, cpu_node, &current_level, split_levels, 0, 0);
>   		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
>   	} while (cpu_node);
> +
> +	return current_level;
>   }
>   
>   /**
> @@ -645,7 +649,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>   	if (!cpu_node)
>   		return -ENOENT;
>   
> -	acpi_count_levels(table, cpu_node, levels, split_levels);
> +	*levels = acpi_count_levels(table, cpu_node, split_levels);
>   
>   	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
>   		 *levels, split_levels ? *split_levels : -1);


