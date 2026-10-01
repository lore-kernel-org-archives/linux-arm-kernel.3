Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414BCCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99jEViOl5PDPr7S4f6dFd8qky+WBhygyyknHOH+obmo=; b=t1oilXjwqkSX0U5zFmCk+qgS6w
	NxfrPjIWwSdi3JDvCo+0FV14xmIiV7kqMVZIt8WeF2imYeLu71+FXxrdD/9fnlER/gY/EwhwJlfgq
	/0wZKRDU/1yzWUPlrd72We/bVGRAIxHzF2+YJRvJcwjQ2V14JnAMZB5aPZxZNUXsTO+ouAq0VTDRw
	IcxH8Asme1bE9ZqMZWGtLbOqhZbph7eaJfFYvBi1vVrr3FYZ08ihHa+pETaC3lsBGHmQgrCLKQuxd
	H4U4/7cG+RfIpqP/+yrcsUxeRU0hKan6pV8tQCl/kfW7hVwGLp8/Ngn5EUHEkSlmkdgdshDnDtBYl
	vfyPidag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGN8-000000099l6-2SRV;
	Thu, 01 Oct 2026 12:58:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGN5-000000099k1-2pUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:58:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A72497;
	Thu,  1 Oct 2026 05:58:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C879F3F85F;
	Thu,  1 Oct 2026 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790859523; bh=weZVC+SDGzZZWfiF/GwygFk7zdR+r8AfKnlAZb1gUMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9AVJug1MjC/YjRWCqkfe7HbKIGnHgNws/5ZDp00SJD8kp37BFpOu0gXPNauTPfI+
	 IHxC4kCwwyboG2Lu2OkI3LZQK6RvbGqaG3XlH+R7ITZhN1obN8g7uXZRtOJjmmwuwf
	 Z38xa3Czv10sIGb7BizmWgDu9Ddek0qyPqXBRfRM=
Date: Thu, 1 Oct 2026 13:58:38 +0100
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
Subject: Re: [PATCH v21 8/9] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
Message-ID: <ar5Y_pHBUQHbXr85@arm.com>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-9-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001084555.1456543-9-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_055848_531675_AB139046 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, Oct 01, 2026 at 09:45:54AM +0100, Suzuki K Poulose wrote:
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index 5d005054f3c6c..e3503aba646e2 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -53,6 +53,17 @@ static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
>  	}
>  }
>  
> +/*
> + * rmi_smccc_invoke_once: Invoke the RMI call and return the results. Do not
> + * retry the command. Let the caller deal with RMI_BUSY or RMI_BLOCKED.
> + */
> +static inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +
> +	arm_smccc_1_2_invoke(&args, regs);
> +}

Nit: I don't think we need to copy to args since there's no retry here.

That said, the SMCCC call clobbers regs->a0. We should write a comment
in case the caller thinks it can just retry with the same regs.
Alternatively, we could pass args and res structures separately.

> +/**
> + * rmi_rec_destroy() - Destroy a REC
> + * @rec: PA of the target REC
> + * @sro: Allocated SRO context to be used
> + *
> + * Destroys a REC. The REC must not be running.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rec_destroy(unsigned long rec,
> +				   struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_REC_DESTROY, rec);
> +}
> +
> +/**
> + * rmi_rec_enter() - Enter a REC
> + * @rec: PA of the target REC
> + * @run_ptr: PA of RecRun structure
> + *
> + * Starts (or continues) execution within a REC.
> + *
> + * Return: RMI return code
> + */
> +static inline long rmi_rec_enter(unsigned long rec, unsigned long run_ptr)

Nit: should probably be __always_inline. rmi_rec_destroy() and
rmi_smccc_invoke_once() as well.

Not for this series but something claude spotted in the integration
branch - kvm_rec_enter() is noinstr. On this path, we end up in
arm_smccc_1_1_get_conduit() which is not noinstr (again, that's for the
other series; here just __always_inline should suffice).

> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_REC_ENTER, rec, run_ptr,
> +	};
> +
> +	rmi_smccc_invoke_once(&regs);
> +	return regs.a0;

Should this use RMI_RESULT_STATUS(regs.a0)?

The rest looks fine to me.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

