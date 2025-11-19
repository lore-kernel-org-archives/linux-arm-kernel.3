Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C7CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvuRIi2ziKsR6xTkpv20Bt95OlEm10rLUXNQns1uoJU=; b=oz399TIf+gPT2hAUWAbRdkOl2o
	fhq+OiU76eR6IShAUuJTdHP0CjRLJWYQCwv7b2/bj9iX7+tENcw2e3spqaVgCzX1O+FLYfYYK/lyC
	q4Gbz93RGjjuvx/vvivWy2rpUQLnPaBUIyonvqlf1SrG6pCu64I2He2iKnEpFbpA1UfHgJKxEW3/8
	lNicCJRZ9CHmQehAWr56CEj7NFeo9KzdmvdVipwfuFVqOhGd5xKOV5pdxnDWMv68ykH4H4N+srwh7
	EMtZBu8GB/gnlV7WWzEXCClkyfdDisS8UWwbJjFBcNVOKxzIEWk8gIju7BF8QBa5iKY8+rGq51Vc9
	qNPWogRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYyf-00000001Tkx-29op;
	Wed, 19 Nov 2025 03:35:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYyb-00000001TkK-1WUg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763523323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvuRIi2ziKsR6xTkpv20Bt95OlEm10rLUXNQns1uoJU=;
	b=HDOH2xi3FdGxNKQOpZVMdwwOcRcWg/oO2fhuLRe/lkBN+w/CXM40Sb87nL6imzrPtL5dXr
	0tcppqV3cKesuqXsMiRqHBX7C0dPyLDair9k39I2ijNa5gahGAJJRecWU93tE4kUCFtQz0
	kDQsyUKa/CEFYS+jzllsSk7w/ZHW8Fs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-nzuRS8vlPyyjCANidIog2Q-1; Tue, 18 Nov 2025 22:35:19 -0500
X-MC-Unique: nzuRS8vlPyyjCANidIog2Q-1
X-Mimecast-MFC-AGG-ID: nzuRS8vlPyyjCANidIog2Q_1763523318
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f587dc2eso115789055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 19:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763523318; x=1764128118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvuRIi2ziKsR6xTkpv20Bt95OlEm10rLUXNQns1uoJU=;
        b=AT5m9z5rQwGXfqajmdZsiCFn/9jdP2GazvmPDW9lnWFN2EnY2ciM5YYGjOau3ZjL+f
         JpzdZfCmqw9yJ5szl2EaC29BPOYya35ZNfB+kKhnyNq0AtddlGeKXnabcHZlWj3rOs9y
         XKOVeMe7ACfkfEngsPbPqsjyRr7JFG0/aSZVCTZmV8Tiu7DALb8WT4BOiIExe4ZalarA
         od4q6af0x9iUhM3eLzcWb80+CMHHPOHTEeDK0zLtfI5QiuOzCDRx+X2vXlz9/EFACv8S
         mzCtjrrAlkJj2nkOzXmqJpCP1XV4xE8d+X5c2TlYhrS5lPMiVCSkpRqxD7EE8fCzfe6f
         3Vjw==
X-Forwarded-Encrypted: i=1; AJvYcCX02oFLEC82KtadTsb9r5J6rcJHZg28/62XMd9lnI06nlHwqeHkcsRv/7yyS69PZSi0JZYukoo/LxoP/vKIMBLe@lists.infradead.org
X-Gm-Message-State: AOJu0YxEhWzys1B6hZmYi0EJKIpDL9CziOG8NTDu8Di6/V4tMZBsabEh
	9pjPEVaUtp+2lOv5pLVYI6OLhnek+59ZqV5u7gM9gPKJkJ1sL/jXvDut/HSRNT+Yb0RMBsinBmB
	3ZKpVeOfAvbPnM6vr71G0CdVib1hqg++CNIYnA80Mi4dXGWP4GaH3zb/hzPiKd9a+VoM8oC6UVx
	gs
X-Gm-Gg: ASbGncv2UZoAWGx/rdJKzMTFJBJSxFAxpLazmU6qh7QbCYxbvEx9tsBEE+NYuqbdTua
	KGHAG7q7Ta9EJ32do/TXl/epkoZEyBnqoE824vzJV3sQQAs79iU/xKlW5tv5sXwpPnReTD+UwdM
	mi3UWWJRGi4dYli1Fwm3cP7qTbY/5O0f1oqUrlBcp1NeyrEc4hJ1/mOdb1RwFez0yvEtPR8ie7F
	EA+XuGE8twTF3UHOAMzAHFKHJiw2b78FzD+sU70/qyv8mTy6hazYccy76auyjKfRfbTp+7O6Fsv
	o19FDZTkHWb8Foz4bbmpb/8/i+ygda3aqRN4rFhWqG/zAI81NA8tLH/EX5bGWuQFKtP3mTlVc/Y
	mYY+oDmdU7NDI7d0caxzKyt4HkP99ebHkqUxitjW2o+n+BHFfLQ==
X-Received: by 2002:a17:902:ebd2:b0:294:fc1d:9d0 with SMTP id d9443c01a7336-2986a750101mr236282135ad.40.1763523318228;
        Tue, 18 Nov 2025 19:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3FthsHiIYHA1hbqE2+ofewwVDvuKvv9vofOfVLsaX5rxLiZRjK5scHiZUaUDJ/yZF94bAvA==
X-Received: by 2002:a17:902:ebd2:b0:294:fc1d:9d0 with SMTP id d9443c01a7336-2986a750101mr236281645ad.40.1763523317726;
        Tue, 18 Nov 2025 19:35:17 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346b8sm189887835ad.16.2025.11.18.19.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 19:35:17 -0800 (PST)
Message-ID: <455c577a-2c6b-4d57-9547-8f55bfe1c126@redhat.com>
Date: Wed, 19 Nov 2025 13:35:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/34] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251117170014.4113754-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9_mklXjNYt7w0fm9kqcHWn2idlAn4RSJ0-sYkL2l8s4_1763523318
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_193525_481939_D83C4744 
X-CRM114-Status: GOOD (  29.10  )
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

Hi Ben,

On 11/18/25 2:59 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> The ACPI MPAM table uses the UID of a processor container specified in
> the PPTT to indicate the subset of CPUs and cache topology that can
> access each MPAM System Component (MSC).
> 
> This information is not directly useful to the kernel. The equivalent
> cpumask is needed instead.
> 
> Add a helper to find the processor container by its id, then walk
> the possible CPUs to fill a cpumask with the CPUs that have this
> processor container as a parent.
> 
> CC: Dave Martin <dave.martin@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v4:
> Remove blank line
> 
> Changes since v3:
> Refer to processor hierarchy in comments (Jonathan)
> Fix indent (Jonathan)
> ---
>   drivers/acpi/pptt.c  | 84 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  3 ++
>   2 files changed, 87 insertions(+)
> 

Since this series may need another respin, a nitpick below...

> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 54676e3d82dd..b8248c0092fe 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -817,3 +817,87 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>   					  ACPI_PPTT_ACPI_IDENTICAL);
>   }
> +
> +/**
> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT
> + * processor hierarchy node
> + *
> + * @table_hdr:		A reference to the PPTT table
> + * @parent_node:	A pointer to the processor hierarchy node in the
> + *			table_hdr
> + * @cpus:		A cpumask to fill with the CPUs below @parent_node
> + *
> + * Walks up the PPTT from every possible CPU to find if the provided
> + * @parent_node is a parent of this CPU.
> + */
> +static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
> +				     struct acpi_pptt_processor *parent_node,
> +				     cpumask_t *cpus)
> +{
> +	struct acpi_pptt_processor *cpu_node;
> +	u32 acpi_id;
> +	int cpu;
> +
> +	cpumask_clear(cpus);
> +

The CPU mask has been cleared in its only caller acpi_pptt_get_cpus_from_container(),
no need to clear it again.

> +	for_each_possible_cpu(cpu) {
> +		acpi_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
> +
> +		while (cpu_node) {
> +			if (cpu_node == parent_node) {
> +				cpumask_set_cpu(cpu, cpus);
> +				break;
> +			}
> +			cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
> +		}
> +	}
> +}
> +
> +/**
> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
> + *                                       processor container
> + * @acpi_cpu_id:	The UID of the processor container
> + * @cpus:		The resulting CPU mask
> + *
> + * Find the specified Processor Container, and fill @cpus with all the cpus
> + * below it.
> + *
> + * Not all 'Processor Hierarchy' entries in the PPTT are either a CPU
> + * or a Processor Container, they may exist purely to describe a
> + * Private resource. CPUs have to be leaves, so a Processor Container
> + * is a non-leaf that has the 'ACPI Processor ID valid' flag set.
> + */
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> +{
> +	struct acpi_table_header *table_hdr;
> +	struct acpi_subtable_header *entry;
> +	unsigned long table_end;
> +	u32 proc_sz;
> +
> +	cpumask_clear(cpus);
> +
> +	table_hdr = acpi_get_pptt();
> +	if (!table_hdr)
> +		return;
> +
> +	table_end = (unsigned long)table_hdr + table_hdr->length;
> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
> +			     sizeof(struct acpi_table_pptt));
> +	proc_sz = sizeof(struct acpi_pptt_processor);
> +	while ((unsigned long)entry + proc_sz <= table_end) {
> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR) {
> +			struct acpi_pptt_processor *cpu_node;
> +
> +			cpu_node = (struct acpi_pptt_processor *)entry;
> +			if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
> +			    !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
> +			    cpu_node->acpi_processor_id == acpi_cpu_id) {
> +				acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> +				break;
> +			}
> +		}
> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> +				     entry->length);
> +	}
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 5ff5d99f6ead..4752ebd48132 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
>   int find_acpi_cpu_topology_cluster(unsigned int cpu);
>   int find_acpi_cpu_topology_package(unsigned int cpu);
>   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
>   #else
>   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>   {
> @@ -1562,6 +1563,8 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   {
>   	return -EINVAL;
>   }
> +static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
> +						     cpumask_t *cpus) { }
>   #endif
>   
>   void acpi_arch_init(void);

Thanks,
Gavin


