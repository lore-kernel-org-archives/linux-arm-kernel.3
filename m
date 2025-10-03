Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF42CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbG34W5wLU8kMo+w26HTYJSkVYz8ACAbrUj0TVdxCOs=; b=Mn1QvKUBgI92ugneDKdiZQx5zl
	gXDB4hJ04Iy1yX7Vd4LJdyfKpizGhHYdSJAFLgNuLI1AJOLNua1QZwOtSl83k0HIF81TnHI7nBD6f
	4n7OTpEeArXo3R5/gORr6E9jIdevUV7pLBnDeuTp5SacF+ttZDYEiHdFHg4wWn22pzr2c/6KIEarS
	U0gYzEUFkeCQslehgk+v4gA97PlJFxuDmFBPcEQjNztMavgZu8L/xDEZCZco2lq2ufzkeYYmdhIM3
	QuvM91EEWQGZM2ErtSTkPYd8Ojh7zOHP9VtdtVD0+2+siIDIBhB++b5n67RspmWTOiD4EYMZDkmup
	bHpY7nJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TSN-0000000BRD3-38QL;
	Fri, 03 Oct 2025 00:15:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TSK-0000000BRCg-1cJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759450524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbG34W5wLU8kMo+w26HTYJSkVYz8ACAbrUj0TVdxCOs=;
	b=gB4yr3Fwiz1WGydT5O/v/2iaB2Vf0B5gehMzTO8t8aLnAKT7o/D77zfark0c7Vvt3GAOrP
	NOps3+xu3LxTM8XGg6rao/R1UkU0fXYlYgDY+XYnRBL0Vc2tAECmY6DF/MfNio2GnoLJQr
	3O7rUvN8Mb+IyFyRPWut3WBwHLMpFdw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-xTz4GCbXNcyerVyO86t8mQ-1; Thu, 02 Oct 2025 20:15:22 -0400
X-MC-Unique: xTz4GCbXNcyerVyO86t8mQ-1
X-Mimecast-MFC-AGG-ID: xTz4GCbXNcyerVyO86t8mQ_1759450521
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5529da7771so1075992a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 17:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450520; x=1760055320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbG34W5wLU8kMo+w26HTYJSkVYz8ACAbrUj0TVdxCOs=;
        b=ll/OlMCNRhoDKKm/152js8YNcrforywokM4/ZmToSIFucrAWCriIhTyTowgq7OtW/0
         pSWF2oc9DcvjN4ldXA0A9AZ6jqzfFUXukJ0KjR82txQTN57gPLfg6W+E+eLqGHdID5qt
         hQrLrk23AAnlMOuAqthy92Qi168A68iSARz/cVaIBroZLJtEo8orDfb0WccCynE9W1Uy
         P2vjJKqvuRd6EPMnXP0kfVDfzQ3HYsAz1n6XlI2ZwbE2NOpKF6kJiby+y9BnkzS2w3tC
         8kbIxAEQ2sERF9xCYCKDLxSJGygDvsF7r1Yvhp/1dfAW4WPhzFc0Gccsx3K1DkCmFZjG
         yRYg==
X-Forwarded-Encrypted: i=1; AJvYcCW8VrBL0RziWy68wbSAJFQNLXsGzCEnpJEeQEy5DI7hAmWmsIeP5WNtAJo20/Q53kxrSZGWu07SURzwmcZQkQXw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx30quPrAdPX7310a5a6bswP8BOpT3EZlANxdNSpU9TiBA//ZOF
	hzNDt4Tm1U4Bow3BI/mPvJ0VCJri62ATeNg5bOGUc/d5TtflmbbXW0aU0yRH3SDnzyaEYhJvoOD
	bCV1BNnj+56J4QJw1ojpKf5toxTNrjQw8J8DrtjX61NIUbPdRz0rza+j3w3hHA8A4rGlTwAGGCr
	bl4/VBBpdc
X-Gm-Gg: ASbGncsNnk3EdniRsSVMkiW44jKmgeUqYKkJhKrGl8hn9nSRmjNOp54NWMdzY5p6zar
	449oq+eXTq0Y6v0Xw9WC5/r6bKC5hM1DifvlsMkJvRKgkB77bFcbgA611NPVeIsD4mg1dAwLQ4w
	VI/OCEug4OtyE/ADxBEmylcicxWcoHSWmHasKQ2WEKGTjFQceKuFzbGEdQTmywXCW8zWLCfEC7D
	O8rmGqlHaVXe/7yinXkFZ8Hkg06cAq5rWMn3ijO7Wa6zQK2fagBYH/2VOohVUk3/iaSynCucLEL
	wq0pzGaxSDWbkpblOhlKNMdieD9NsGZQ59wX0aVXYLt8LGb/0H80WC6AdATbfhlWnJB9vACbRGo
	AhfDiV3s93A==
X-Received: by 2002:a05:6a20:7291:b0:251:a106:d96c with SMTP id adf61e73a8af0-32b61dff63fmr1543820637.10.1759450519865;
        Thu, 02 Oct 2025 17:15:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0md3EjClymeLVNxoCZz4Jj91+vv+JPhX5FV8arUGQC8pDP1Ea2wN2DR0g85Dqyra6o57e1w==
X-Received: by 2002:a05:6a20:7291:b0:251:a106:d96c with SMTP id adf61e73a8af0-32b61dff63fmr1543784637.10.1759450519408;
        Thu, 02 Oct 2025 17:15:19 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9daccsm3112663b3a.16.2025.10.02.17.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 17:15:18 -0700 (PDT)
Message-ID: <3a2f6807-9a49-4976-a4d7-7577756c3c26@redhat.com>
Date: Fri, 3 Oct 2025 10:15:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-2-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-2-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7h1hHHVUv7060OB3DozCAcP868Uy3UMa01iTkLWt-_Q_1759450521
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_171528_861188_F0110AAA 
X-CRM114-Status: GOOD (  30.74  )
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

On 9/11/25 6:42 AM, James Morse wrote:
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
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Replaced commit message with wording from Dave.
>   * Fixed a stray plural.
>   * Moved further down in the file to make use of get_pptt() helper.
>   * Added a break to exit the loop early.
> 
> Changes since RFC:
>   * Removed leaf_flag local variable from acpi_pptt_get_cpus_from_container()
> 
> Changes since RFC:
>   * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
>   * Added missing : in kernel-doc
>   * Made helper return void as this never actually returns an error.
> ---
>   drivers/acpi/pptt.c  | 83 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  3 ++
>   2 files changed, 86 insertions(+)
> 

With the description for the return value of acpi_pptt_get_cpus_from_container()
is dropped since that function doesn't have a return value, as mentioned by
Stanimir Varbanov.

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 54676e3d82dd..1728545d90b2 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -817,3 +817,86 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>   					  ACPI_PPTT_ACPI_IDENTICAL);
>   }
> +
> +/**
> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT processor node
> + * @table_hdr:		A reference to the PPTT table.
> + * @parent_node:	A pointer to the processor node in the @table_hdr.
> + * @cpus:		A cpumask to fill with the CPUs below @parent_node.
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
> + * @acpi_cpu_id:	The UID of the processor container.
> + * @cpus:		The resulting CPU mask.
> + *
> + * Find the specified Processor Container, and fill @cpus with all the cpus
> + * below it.
> + *
> + * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
> + * Container, they may exist purely to describe a Private resource. CPUs
> + * have to be leaves, so a Processor Container is a non-leaf that has the
> + * 'ACPI Processor ID valid' flag set.
> + *
> + * Return: 0 for a complete walk, or an error if the mask is incomplete.
> + */
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> +{
> +	struct acpi_pptt_processor *cpu_node;
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
> +		cpu_node = (struct acpi_pptt_processor *)entry;
> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
> +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
> +			if (!acpi_pptt_leaf_node(table_hdr, cpu_node)) {
> +				if (cpu_node->acpi_processor_id == acpi_cpu_id) {
> +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> +					break;
> +				}
> +			}
> +		}
> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> +				     entry->length);
> +	}
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 1c5bb1e887cd..f97a9ff678cc 100644
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


