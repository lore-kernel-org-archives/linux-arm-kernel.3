Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06770CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PktsIKsXT7+WofBjDIwf6iQfwyP9CFogd6p16sia/gQ=; b=Ps6wK1Hrzk/Rnx+8v2XiU1F6R3
	L7ysZBQQC/nVd5jolQHDfDIRWatALjQGV7KOVR3rTzJR513/MHAErhGzz+zBO98llMk+rKnOIzWzX
	3po0OH7W5A8j+CxbGYCBbBw5FjFagVA2w1B8n+niy/afyrw082dkWJOHgWds9/u4dVXpAF9BCTzEG
	+WJxDK1jKWBVqEmZ7L6tOESjmQFf0TayY6AqBEMdGbbQjAn8yunWYVkhmBpXEg4wxgbNVFJT9Nzj1
	3g3tzTt59I9u8Owd+9wA8kl0VH/LHBU8orpkwUmmBTENVrmA1bhSO692LHn/HAHSF3ifTCOZXO1go
	zIEpftyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iLW-00000007erH-1TNY;
	Thu, 25 Sep 2025 09:33:02 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iLU-00000007eom-1yjf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:33:01 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58B454E624;
	Thu, 25 Sep 2025 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758792778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PktsIKsXT7+WofBjDIwf6iQfwyP9CFogd6p16sia/gQ=;
	b=Qn1Wh4DDYle+RfyQF6cuLRawJoaacWpKkQtAwZ/8906+o4FSfhGe8DZYISx04MwIHczF+j
	ttZJdjtHDGEj2vWNED1HKxNXSV1t8HdmX3t/tY8UjvK4Olx1l5V5jcp/Ibz96R6Iz1uhxG
	yBycnKOlJeZ6swJQXK06LJNE1Tr8Rek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758792778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PktsIKsXT7+WofBjDIwf6iQfwyP9CFogd6p16sia/gQ=;
	b=wes68xN3HKt4ysa7pijHIcKrJPMnh189kIxorhTj28QtII11L2cPWpE76KIgHVJg5tCczJ
	K0NHosrQJlpiOJCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758792778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PktsIKsXT7+WofBjDIwf6iQfwyP9CFogd6p16sia/gQ=;
	b=Qn1Wh4DDYle+RfyQF6cuLRawJoaacWpKkQtAwZ/8906+o4FSfhGe8DZYISx04MwIHczF+j
	ttZJdjtHDGEj2vWNED1HKxNXSV1t8HdmX3t/tY8UjvK4Olx1l5V5jcp/Ibz96R6Iz1uhxG
	yBycnKOlJeZ6swJQXK06LJNE1Tr8Rek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758792778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PktsIKsXT7+WofBjDIwf6iQfwyP9CFogd6p16sia/gQ=;
	b=wes68xN3HKt4ysa7pijHIcKrJPMnh189kIxorhTj28QtII11L2cPWpE76KIgHVJg5tCczJ
	K0NHosrQJlpiOJCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 015FE13869;
	Thu, 25 Sep 2025 09:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8MShOUgM1WjnWwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 25 Sep 2025 09:32:56 +0000
Message-ID: <3d2252ef-92a2-4717-a472-3e5b275419ce@suse.de>
Date: Thu, 25 Sep 2025 12:32:54 +0300
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
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250910204309.20751-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLj7mp877dpkcx5p1r49fdbjkp)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023300_661867_FBFA0A3E 
X-CRM114-Status: GOOD (  20.47  )
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

On 9/10/25 11:42 PM, James Morse wrote:
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
>  * Replaced commit message with wording from Dave.
>  * Fixed a stray plural.
>  * Moved further down in the file to make use of get_pptt() helper.
>  * Added a break to exit the loop early.
> 
> Changes since RFC:
>  * Removed leaf_flag local variable from acpi_pptt_get_cpus_from_container()
> 
> Changes since RFC:
>  * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
>  * Added missing : in kernel-doc
>  * Made helper return void as this never actually returns an error.
> ---
>  drivers/acpi/pptt.c  | 83 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  3 ++
>  2 files changed, 86 insertions(+)
> 

<snip>

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

Leftover, drop this.

> + */
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> +{
> +	struct acpi_pptt_processor *cpu_node;
> +	struct acpi_table_header *table_hdr;
> +	struct acpi_subtable_header *entry;

<snip>

regards,
~Stan


