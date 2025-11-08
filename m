Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB92CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf3dtK9whnvoieMQrk7xUOMK4ZkLioSOkS+mxb2q8k8=; b=BguyKAKLyQRliWKPGn1+j3uWsv
	wNW7Ig77qoO9vJfcr5qUlqj+HLo2PoB3WsziG03RcN729tHEWA4jrw3RFGehGMmcr6nMjQeArzgeu
	xhO8sP/qDgDcdkyM8B2KqhtA4IIwjA604pdXIKHzOiYLehd+rEIMK5K33d2gzTfrbGC7muO03lz7y
	Xk2npS7ApsYlRydKg9k1K3gQeDbhYluvviL/MfCJp6GJPlHRPK7q5lLkngZ9zcw2r9+NNwsXsK5mG
	WflaNlWsKmibW31zYnH3+mNK127MCccjGn/cIUg8nhYJGLw4M7GJH/4aATNdELTkxzlM3ZTUu8tCs
	hogolFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHacE-00000002VjS-2dnJ;
	Sat, 08 Nov 2025 04:31:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHac9-00000002Via-2KCy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 04:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762576305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gf3dtK9whnvoieMQrk7xUOMK4ZkLioSOkS+mxb2q8k8=;
	b=BFK/RhjYE4Mfs/uB9b8NxKmCdFG6Ll4tYKxqSyXXcGBdzp1JIZBYt9nc5j/OX9N3dKhUL+
	2C0HUslAUVnyZ6lbkoSDWDjyJkEQG1IlSGNzHw+WqAsdsdnqf5nL0Ll3SvGRABKcxq7EHe
	VfzZy1X5LUUGT9yH5O7RXS+fKhVZHrk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-qjh31wi4N2SBANw4SG351Q-1; Fri, 07 Nov 2025 23:31:43 -0500
X-MC-Unique: qjh31wi4N2SBANw4SG351Q-1
X-Mimecast-MFC-AGG-ID: qjh31wi4N2SBANw4SG351Q_1762576303
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so18841185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 20:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762576303; x=1763181103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf3dtK9whnvoieMQrk7xUOMK4ZkLioSOkS+mxb2q8k8=;
        b=iut9WF87zQTdA1cIPJVqIFFdFqT6WNRWfg+uc0jOQZcVUg0spX3OiSlFVW1w5sLq5E
         r2xR7qa8LgxgsZytP5WBcys1cMAdydr/fL8t7OUiTCCVubOAOkgysAWdRvYrQHyKjheV
         uL4xNPvdC0XVWLNzF1G1UXmfg+lWJNJnhNws79dehwq28r01MyuLNh3o26JPfEK+NMkq
         O8pz/jgcpcRwH6Bj0ITmdSpibx3xc9gjzSG7aXuXEcbsVhgkNH6NQwmzTiAD+bcDRzoh
         VSkDMkDxzip04RNXjoRRqM8/es8hOb2P/MroKT+ebPg8aRvaulacLqK0CfisBylck/dp
         F6ig==
X-Forwarded-Encrypted: i=1; AJvYcCUtQ9P7j/Mz+7PxE6i3A1wKZKjhUQVlmdcj4ArJ3dBY4615ki6XR7iEHUyvxBmDZyXcii6pyVvqJE59/I2vrFHL@lists.infradead.org
X-Gm-Message-State: AOJu0YzoahdnwiZdvYje7xMgSteN17BRiijl6VBgqGe0dxNx4qQRacHI
	XCoCXeIJa3U9WGWi71niC8R7T9RWvIBxt40+Ja+CwwqbgpMIAi7hgt7X/nNFG/Xrc74QStySQTj
	WjjNulJWqH93RQL9MHh7G2WDj6BmkBWv60K23KP0OF4vkfVZvZSB78V5Z+xUhaWhL2AxVnQg7ol
	MJ
X-Gm-Gg: ASbGnctj+J2/WETUqiOLod6Ft1LaQy34OVR2PSYxqY7pcc2pZEeNsMgwRmc26a6yGUE
	Osxdr5sEanovE62WzI59S4PT2fwOxpzuGPoiNjrV2Q16NSVGArE2jJxCNE02vA4ibbWY8iUpmR8
	J+BrAvj1SHWCIZz2hS/WKNkp3n/Bs3DIYShPateislYdufGO2TrIKsGV1NxQ0dczLmTnOcOccif
	X9ZVHHcQgr3M7apw9efb971VLJ0p5cXzmVWNgs3R6Jh3r3syooxnXg6U/P3H+K8FNPrhzG3P006
	0Q1TXbRQh41UFNayYxJB0o+VIyv0AiTSmW9vpnUSlZtmarPZV5Q/7dvipTAPHgUewIUt41Fy0r1
	LC2YWYR1fejfTT4Gkmt+dHbOequWm4LJiJXVzENU=
X-Received: by 2002:a17:903:40c9:b0:295:56da:62a4 with SMTP id d9443c01a7336-297e56caea4mr15886695ad.45.1762576302814;
        Fri, 07 Nov 2025 20:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQTitOB0enfK3OsnV3JV6rJIse5pQU20FSNU11DFWBQoFKK5PuvCsMDdw2vNkdjw8y8BgN8Q==
X-Received: by 2002:a17:903:40c9:b0:295:56da:62a4 with SMTP id d9443c01a7336-297e56caea4mr15886445ad.45.1762576302385;
        Fri, 07 Nov 2025 20:31:42 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0ee9sm76355185ad.112.2025.11.07.20.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 20:31:41 -0800 (PST)
Message-ID: <11f80800-2e0b-4f41-a022-a88ad9792da8@redhat.com>
Date: Sat, 8 Nov 2025 14:31:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 processor container
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mF-iTfU8yw27NhZYjln5JpDi6L8di9QYnZ46RyLXbXU_1762576303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_203150_022180_5B86F4E0 
X-CRM114-Status: GOOD (  29.43  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
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
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Refer to processor hierarchy in comments (Jonathan)
> Fix indent (Jonathan)
> ---
>   drivers/acpi/pptt.c  | 85 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  3 ++
>   2 files changed, 88 insertions(+)
> 

Two nitpicks below...

> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 54676e3d82dd..69917cc6bd2f 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -817,3 +817,88 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
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
> +

Unnecessary blank line here.

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

Need we to check if @cpu_node does crosses the boundary (@table_end), as what's
doing in acpi_find_processor_node()? Actually, the similar hunk of code from
the function can be reused here.

static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_header *table_hdr,
                                                             u32 acpi_cpu_id)
{
		:
	while ((unsigned long)entry + proc_sz <= table_end) {
                 cpu_node = (struct acpi_pptt_processor *)entry;

                 if (entry->length == 0) {
                         pr_warn("Invalid zero length subtable\n");
                         break;
                 }

                 /* entry->length may not equal proc_sz, revalidate the processor structure length */
                 if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
                     acpi_cpu_id == cpu_node->acpi_processor_id &&
                     (unsigned long)entry + entry->length <= table_end &&
                     entry->length == proc_sz + cpu_node->number_of_priv_resources * sizeof(u32) &&
                      acpi_pptt_leaf_node(table_hdr, cpu_node)) {
                         return (struct acpi_pptt_processor *)entry;
                 }

                 entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
                                      entry->length);
	}

		:
}


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


