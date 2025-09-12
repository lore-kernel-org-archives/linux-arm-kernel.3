Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F215FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX6FnGnFsu2zJTHIwUJ96kS5B6QGFTAvNOfOinwEn9Y=; b=gMl26EeFXw/zusZyg5vFrQ7ZjW
	tqANMOzyFCkJkYr6YvtYGw+5muq5Nb3WcZmgiADjG197ow9Vehljx7h7N0lPGloILVlk1PpP/sqCs
	8+rMvfiNQM7d+IvQIL3veIL8huI9uJNWoJGZblHtsK4LrJ12oyrrVUGZpsgNdGUNlYptvJf1MZXM6
	lPqeq5j2AyyMAHKnanToh1pRQc7QJtcDGd9+FHejRp0OTuRMEVOsPkfDagWU1+YGBA5Ih3P4zGDLK
	LP3lSbZxVSQLemNONq+umWYYMU278V3hPWxSiER1JIZBvvTLirwmi2OIvIZF9snFmg3cGFDKvt0uq
	h/xJYH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3lP-00000009Xbq-23Rm;
	Fri, 12 Sep 2025 13:24:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3lM-00000009Xb0-1Djz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:24:29 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNZqX0v5cz6GDGM;
	Fri, 12 Sep 2025 21:23:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5579C14038F;
	Fri, 12 Sep 2025 21:24:22 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:24:21 +0200
Date: Fri, 12 Sep 2025 14:24:19 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 24/29] arm_mpam: Track bandwidth counter state for
 overflow and power management
Message-ID: <20250912142419.00006c6d@huawei.com>
In-Reply-To: <20250910204309.20751-25-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-25-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_062428_473888_288055FF 
X-CRM114-Status: GOOD (  17.90  )
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

On Wed, 10 Sep 2025 20:43:04 +0000
James Morse <james.morse@arm.com> wrote:

> Bandwidth counters need to run continuously to correctly reflect the
> bandwidth.
> 
> The value read may be lower than the previous value read in the case
> of overflow and when the hardware is reset due to CPU hotplug.
> 
> Add struct mbwu_state to track the bandwidth counter to allow overflow
> and power management to be handled.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Trivial comment inline.  I haven't spent enough time thinking about this
to give a proper review so no tags yet.

Jonathan
 
> ---
> Changes since v1:
>  * Fixed lock/unlock typo.
> ---
>  drivers/resctrl/mpam_devices.c  | 154 +++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |  23 +++++
>  2 files changed, 175 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 1543c33c5d6a..eeb62ed94520 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -918,6 +918,7 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>  	*ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
>  
>  	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
> +
Unrelated change.  If it makes sense figure out where to push it back to.

>  	if (m->ctx->match_pmg) {
>  		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
>  		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);


