Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nkMKWc+p;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Upjdc+mS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RCZFKzJ5FU5wXI/AAra2JtvLPo4fWmIXc6OYvhxEbRA=; b=nkMKWc+pk5P/Od
	wjLtV3N4y5majJOJ/F+pO6qVSzt3tPEZmNkukSGPnHcfo9Gpx/5+rgRJjnELx/FVOBI+T5PaWbDsm
	pWGuAnZOEBSnFQGjNxfAjD4LAQCGKlPiX7kQqh3EC7XA3yIDWyhNqyzTXKKuyyVcPhDyLIDFNCOwx
	ZPh4zbmbvH7gomDlDFgAIkZcE3oBGa4MLuQSpJE+AahtxaLbJDOqZtIE+rVPlMM6ifUIlcZKsrXzj
	TrsMDQIpjLVSoQfIqgnEp6KL7AkGP+CALf+TRyGM9ilWVVWyszqa6WhwQ11Kxy1orsDhGyxbsYd7j
	g2RuzdZj9lEj/wc1Pwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObsJ-00000005c52-0tyC;
	Wed, 04 Nov 2026 14:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObsG-00000005c3j-0EW9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EBF81D34;
	Wed,  4 Nov 2026 06:21:54 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EEDF3F628;
	Wed,  4 Nov 2026 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793802117; bh=Hr/3oRpndyHDDyfM5E1feoKXxm11nbcgryaiMGXfRuU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Upjdc+mSRyCDC1OhOnE9Tr4U/cVmnaynLs1JILZLzeDfb+EfrE8RV5OpM0GBVORLF
	 2ekeZ+3vWpR/iaaiTrnWkaBFcNE954J5mpER0aYHp+zpviOV4OmWsOBU9kLsRzSOHq
	 ye2u2uRIzJX5MkADh8ctHN26f2PEF0kh7wABHWvI=
Message-ID: <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
Date: Wed, 4 Nov 2026 14:21:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, zengheng4@huawei.com,
 gshan@redhat.com, jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104101622.563280-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104101622.563280-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062200_204633_07872FC4 
X-CRM114-Status: GOOD (  21.80  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

For patches touching the glue between MPAM and resctrl, essentially mpam_resctrl.c, the prefix used
is 'arm_mpam: resctrl' rather than just 'arm_mpam'.

On 04/11/2026 10:16, Jinjie Ruan wrote:
> resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
> the resctrl core halves the CLOSID count: schemata_list_add() divides a
> CDP resource's schema by two, and closid_init() takes the smallest
> across the schemata.
> 
> When the PMG count and the CLOSID count are both odd, halving the
> product counts RMIDs that belong to a CLOSID resctrl never allocates.
> With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
> resctrl has times 3 PMGs only allow 6. The count is visible in
> /sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
> includes RMIDs no CLOSID can use; 

Good spot.

It occurs to me that 'num_rmids' is also too high on a monitor only system too as there is only one
PARTID that can be used.  Can you see a clean way to fix this in one go?

Thanks,

Ben

RMID allocation itself is bounded by
> the free list.
> 
> Derive the number of RMID groups from the index space and halve that, so
> the count follows resctrl_arch_system_num_rmid_idx().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..d3f957162b68 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	cdp_enabled = enable;
>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>  
> -	if (enable)
> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
> -	else
> +	if (enable) {
> +		u32 num_group;
> +
> +		/* Halve the number of RMID groups, keeping whole PMG rows. */
> +		num_group = resctrl_arch_system_num_rmid_idx() /
> +			    (mpam_pmg_max + 1);
> +		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
> +	} else {
>  		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> +	}
>  
>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)


