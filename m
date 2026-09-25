Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB13CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIWMARKuRjjn10UkJssEUPC/ARkuARC+7ckgDqrGPPE=; b=eMnfLqJiow2Fnfq1EbeLn5cfJs
	SQsbTqdqCb2H1UCmDaztViY5hgnq9tjpJiclCLnoKVGHKdf3mes+RqtnBAosNqmFMd8/NxOjxcDjB
	D/hd/Kj6zrhhj/gfRO4atDv+5I0yMcfpX0mgn/sY7cc1zd3mhrpPV0x7tB6l74dNvGXcmG6tkUEwl
	PV6dFT/XUIrHaE7gwxvK5NylLZbKHTHpPk6cQEyQGt9nEhvZuzOsSG1psz3MKluy9Ff13+gUOroHb
	8TeBDS499/6jDm5EynsMizE4tLefzxTKBxuxzFonFcSxJBxdbUDAMYbDFB/T+ot//my+k7amcVVCZ
	f7PrU7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Xp-0000000DGRm-1T9g;
	Fri, 25 Sep 2026 11:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Xm-0000000DGRF-0ZKv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:56:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07BF3169C;
	Fri, 25 Sep 2026 04:56:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACE8D3F86F;
	Fri, 25 Sep 2026 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790337404; bh=NWvP4bp61oJ9JUE/KO0abBEniNY3zf5ZJnrDX2baCh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ruy17rAUaPubtMkD0lV1Gdg3WSAAQRlrEPuUowdOFMWXkOOQCxEJCmtmZqFurmwue
	 R6mXbNJYY9CC6Rr4JH3y34FHWuZJJgTV6FqaLY2I3ohMrahzAtSOKy04ThwmO7rBOR
	 vz4yUVKMAA0mANNhxAUssHGtLbZzoZsOxsJ+kNQs=
Date: Fri, 25 Sep 2026 12:56:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 7/7] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
Message-ID: <arZhdzjoOejKdAvp@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-8-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-8-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_045646_325970_0AFD81B8 
X-CRM114-Status: GOOD (  11.96  )
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

On Thu, Sep 24, 2026 at 02:52:01PM +0100, Suzuki K Poulose wrote:
> + * rmi_rec_create() - Create a REC
> + * @rd: PA of the RD
> + * @rec: PA of the target REC
> + * @params: PA of REC parameters
> + * @sro: Allocated SRO context to be used
> + *
> + * Create a REC using the parameters specified in the struct rec_params pointed
> + * to by @params.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rec_create(unsigned long rd,
> +				  unsigned long rec,
> +				  unsigned long params,
> +				  struct rmi_sro_state *sro)
> +{
> +	long ret;
> +
> +	sro->addr_count = 0;
> +	sro->regs = (struct arm_smccc_1_2_regs) {
> +		SMC_RMI_REC_CREATE, rd, rec, params
> +	};
> +	ret = rmi_sro_memxfer_execute(sro, GFP_KERNEL);
> +	rmi_sro_free(sro);
> +
> +	return ret;
> +}

Nit: isn't this just open-coding rmi_sro_memxfer_cmd()?

-- 
Catalin

