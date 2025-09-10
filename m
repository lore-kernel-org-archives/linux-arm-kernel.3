Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13777CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3inci7AoCnUJagDBCYtNHWHGT0lCvEGo1A9fU6eNzk=; b=hO61Jf7iJ9Iw2+ucIAXlry6Vex
	lheE6pTE0k0O1vJH5iyUv93/98EnRq4NBHtkTG/7rKuCKUJ8asIufaR3bKseaMpPjXSAOxcCZqOst
	NVAZhkwbA+jglXhELabebg/dro9uUg78ET2bbsyGiBzGM/DG2yxpFQNqgRE8o/iJqRLpKZ/qEVTXp
	spGjP3vsHTzOQOUpyd/Kk5DsGSVq9kjweks87x4oyPzbN9ri8GKlgZWDMVUFNQjLq8x+WfeE3lSVL
	yptDFzyB2LZ4Frt7N2n0fxaYbtugJe/09zXLyjuSkCYT2cB8J0kL1nMqIHMg+nwjXnsQzJrYXmeTY
	nRYiJaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL7y-0000000ESU1-0Kxy;
	Wed, 10 Sep 2025 13:44:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL7v-0000000ESSt-4BCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC7FB40AE9;
	Wed, 10 Sep 2025 13:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A457C4CEF0;
	Wed, 10 Sep 2025 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511886;
	bh=lQtS1uAvZyCIoOaVmx4Kjk/94Sw+HBfw4GcgLVbEaBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lf/LWaARgNYUiFbHFsFtVjyFH8HFYjWCzyl1Y41QLK+pYBfO5yQs0F4JyuMrT0vlZ
	 nxXzMsM7ujPcVBkPiVsfRCvmcRbPxqvh+hL8VDf1pl4x68gtJf1/40DuKCZvI7dg6v
	 txKPIb8/FgUR+Kc1e/v0dKCHAwNZGfL+v0SZoh75LkO8X0eu2J6a3DHSimPml/E7Kq
	 MMh+8z6eijjQ9DKcmgRbB8z8k6MFHLdKmeSblm/VQdK4ADEdZDN8dNLe4cJOouSsHz
	 mwP0zzSco/lp97bKe1ipPtEXDcQbsJrgkA3W+EXAtaVo4AWXdr7CQXIPReD6WP2Q/L
	 t+pxtFM7t41IQ==
Date: Wed, 10 Sep 2025 15:44:35 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 04/33] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
Message-ID: <aMGAw4+/IAWBPiqn@lpieralisi>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-39-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-39-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_064448_077878_47CE1D59 
X-CRM114-Status: GOOD (  28.09  )
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

On Fri, Aug 22, 2025 at 03:30:19PM +0000, James Morse wrote:
> acpi_count_levels() passes the number of levels back via a pointer argument.
> It also passes this to acpi_find_cache_level() as the starting_level, and
> preserves this value as it walks up the cpu_node tree counting the levels.
> 
> This means the caller must initialise 'levels' due to acpi_count_levels()
> internals. The only caller acpi_get_cache_info() happens to have already
> initialised levels to zero, which acpi_count_levels() depends on to get the
> correct result.
> 
> Two results are passed back from acpi_count_levels(), unlike split_levels,
> levels is not optional.
> 
> Split these two results up. The mandatory 'levels' is always returned,
> which hides the internal details from the caller, and avoids having
> duplicated initialisation in all callers. split_levels remains an
> optional argument passed back.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> 
> ---
> Changes since RFC:
>  * Made acpi_count_levels() return the levels value.
> ---
>  drivers/acpi/pptt.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 4791ca2bdfac..8f9b9508acba 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -181,10 +181,10 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   * levels and split cache levels (data/instruction).
>   * @table_hdr: Pointer to the head of the PPTT table
>   * @cpu_node: processor node we wish to count caches for
> - * @levels: Number of levels if success.
>   * @split_levels:	Number of split cache levels (data/instruction) if
> - *			success. Can by NULL.
> + *			success. Can be NULL.

Nit: tempting but this change does not belong here.

>   *
> + * Returns number of levels.
>   * Given a processor node containing a processing unit, walk into it and count
>   * how many levels exist solely for it, and then walk up each level until we hit
>   * the root node (ignore the package level because it may be possible to have
> @@ -192,14 +192,18 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   * split cache levels (data/instruction) that exist at each level on the way
>   * up.
>   */
> -static void acpi_count_levels(struct acpi_table_header *table_hdr,
> -			      struct acpi_pptt_processor *cpu_node,
> -			      unsigned int *levels, unsigned int *split_levels)
> +static int acpi_count_levels(struct acpi_table_header *table_hdr,
> +			     struct acpi_pptt_processor *cpu_node,
> +			     unsigned int *split_levels)
>  {
> +	int starting_level = 0;
> +
>  	do {
> -		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
> +		acpi_find_cache_level(table_hdr, cpu_node, &starting_level, split_levels, 0, 0);
>  		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
>  	} while (cpu_node);
> +
> +	return starting_level;
>  }
>  
>  /**
> @@ -731,7 +735,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>  	if (!cpu_node)
>  		return -ENOENT;
>  
> -	acpi_count_levels(table, cpu_node, levels, split_levels);
> +	*levels = acpi_count_levels(table, cpu_node, split_levels);

Looks fine to me - though initializing

*levels = 0

upper in the function now becomes superfluous (?) (well, it initializes
*levels to 0 if an error path is hit but on that case the caller should
not expect *levels to be initialized to anything IIUC).

Apart from these (very) minor things:

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
>  		 *levels, split_levels ? *split_levels : -1);
> -- 
> 2.20.1
> 

