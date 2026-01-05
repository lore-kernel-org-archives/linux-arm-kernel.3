Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55580C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr7zEhWlffYSQLswZtqhQf2abpHcTgb8aUkc7lWPQcI=; b=lLLdQaU9fbGVmuyF3J1mz5zFJ9
	eQcQWDwkJIpu2P9GTyGw9N+8DJysLdDTrxS0uy4Ybnja9jELwK/eS2tdr2q2xY6AWnW5ZOLzuk85G
	BnKsu0CGWJxtjkwrn/iznKXg4nAG1pmJxnWK2Tt0dC+uG7GrCW0a5PLdBooKK4/6LAQkmvuCI9Bv6
	Tq4Mg14sD76eU7BIQnRsZfaS01olWxsLZ63sBxlJYJj8qCA+ZFsho/gvoU9c6a847sgcVI7sAdgVC
	F2eAz8mzrpPFZOzrw5Vv2ylsVMy5c/AJcFzlrrNhMnqtnemEvHy7fkmdAg4H4KGBRBXEvR0WJsOQP
	ioHa0Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnkH-0000000Bl83-1OvQ;
	Mon, 05 Jan 2026 16:47:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnkD-0000000Bl6b-20dk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:47:52 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlKwW0qpSzHnGhT;
	Tue,  6 Jan 2026 00:47:39 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A183B40570;
	Tue,  6 Jan 2026 00:47:41 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 16:47:40 +0000
Date: Mon, 5 Jan 2026 16:47:38 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 06/45] KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
Message-ID: <20260105164738.0000792f@huawei.com>
In-Reply-To: <20251219181147.3404071-7-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-7-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084750_641100_EADAFE79 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, 19 Dec 2025 18:11:08 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> The MPAMSM_EL1 controls the MPAM labeling for an SMCU, Streaming Mode
> Compute Unit. As there is on MPAM support in kvm, make sure MPAMSM_EL1
> accesses trigger an UNDEF.
> 
> The range of valid configurations for the PARTID and PMG in MPAMSM_EL1 is
> not currently specified in Arm Architectural Reference Manual but the
> architect has confirmed that it is intended to be the same as that for the
> cpu configuration in the MPAMy_ELx registers.

Good to know but I'm not seeing why it matters in this patch. Perhaps
a little more on that?

> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index c8fd7c6a12a1..72654ab984ee 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3373,6 +3373,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  
>  	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
>  	{ SYS_DESC(SYS_MPAM0_EL1), undef_access },
> +	{ SYS_DESC(SYS_MPAMSM_EL1), undef_access },
> +
>  	{ SYS_DESC(SYS_VBAR_EL1), access_rw, reset_val, VBAR_EL1, 0 },
>  	{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
>  


