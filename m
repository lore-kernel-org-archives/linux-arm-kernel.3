Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F97D4661A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LomUmIenOCeNWrZBziXnsmvr65y5f06EFVAsM4df/E=; b=RWddwbWQNja1tQ8uvIWPLrue2b
	M8LQR+xUarh3svbImNFdt3iVixlG7aFThsd2u2KSw8HtWqMeifpHKyXg6aaxtNylTErIKPM0ZX1t1
	KTgKq4jyiHOiOf8vUp85PG1/LYtjV+vdzF9D6BBttv2JhdAd2g2mGFpwPz25amtPlUEGuDig1CI+o
	HgL39yRkGii4qEs3pPn2e+V8gRRGsF+FyyuRzKSdrX12UANeNjC+M9Rld/p+pjcVMrJXsoXqxyMEV
	1VS+aTBZuGxaO61C/xqpK8m1XcR1lzsnF18NqeuHN2fY1IXFsWchCw3AsPrM/OKNCW8xqvXoNrdyC
	bmgNCQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSn7-0000000D1kR-2BEh;
	Thu, 15 Jan 2026 19:13:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSn5-0000000D1k4-29G4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:13:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12A451515;
	Thu, 15 Jan 2026 11:13:47 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 690DC3F59E;
	Thu, 15 Jan 2026 11:13:48 -0800 (PST)
Date: Thu, 15 Jan 2026 19:13:45 +0000
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
Subject: Re: [PATCH v3 11/47] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
Message-ID: <aWk8aZafbtXx5bPu@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-12-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-12-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111355_592582_C83E0667 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 12, 2026 at 04:58:38PM +0000, Ben Horgan wrote:
> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
> +					    u16 partid_d, u16 partid_i,
> +					    u8 pmg_d, u8 pmg_i)
> +{
> +#ifdef CONFIG_ARM64_MPAM
> +	u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
> +
> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
> +#endif
> +}

Isn't this function, together with mpam_thread_switch(), in an enclosing
#ifdef already?

> +
>  static inline void mpam_thread_switch(struct task_struct *tsk)
>  {
>  	u64 oldregval;
> -- 
> 2.43.0
> 

-- 
Catalin

