Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB8D46607
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYiQAKUYsNXN3OMJD64PdDfVshj7F2/n/IikbQLw+5I=; b=NWpPVqXLssjqHIaLTQjBZIflbY
	Y2M/EtbaMgLFG91bsEvZTNeFEEiSbqZhjM5DvBSskzVjXLXlaTGHsnmdEaeda9pWnitY4/ztBZF+N
	5EM5thdD7FjlQ0vLGx/LONW53YdivcNTrCVAvoDO0T4riQxnmxKPrek9n1CugrMEludZN4BiHtwVK
	btNUmN+v77maQpGhrbB87PtXYUuGTae/8cy8q8ICfmb7OCa49goEY0UrrElqhC7zf9eD9wouRAJsA
	WXn58y97J16CO6LQvVhXWBSXdeNr0U5booH7VgCCIsgRtvhlZTYl9Vh0W49B0I1C4nwpWWeO6rov+
	Q3RiaPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRx8-0000000Cwvf-2gUN;
	Thu, 15 Jan 2026 18:20:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRx6-0000000CwvH-0ORP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C5691515;
	Thu, 15 Jan 2026 10:20:03 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1DC3F632;
	Thu, 15 Jan 2026 10:20:04 -0800 (PST)
Date: Thu, 15 Jan 2026 18:20:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 09/47] arm64: mpam: Add cpu_pm notifier to restore
 MPAM sysregs
Message-ID: <aWkv0jsX-tMHEo9G@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-10-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-10-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_102012_199320_0BEC4CED 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Jan 12, 2026 at 04:58:36PM +0000, Ben Horgan wrote:
> +static int mpam_pm_notifier(struct notifier_block *self,
> +			    unsigned long cmd, void *v)
> +{
> +	u64 regval;
> +	int cpu = smp_processor_id();
> +
> +	switch (cmd) {
> +	case CPU_PM_EXIT:
> +		/*
> +		 * Don't use mpam_thread_switch() as the system register
> +		 * value has changed under our feet.
> +		 */
> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +		write_sysreg_s(regval, SYS_MPAM1_EL1);
> +		isb();
> +
> +		write_sysreg_s(regval, SYS_MPAM0_EL1);
> +
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}

This looks fine unless we decide to save/restore them in the low-level
suspend/resume functions.

-- 
Catalin

