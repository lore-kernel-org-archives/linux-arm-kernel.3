Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D1C47BE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OChfs98qCrhRHQ8Yc/NhQZaeh8LNpmqmgzLth9NGaU=; b=vtKiqkT6aYB3mQyBPL8BkWzwJL
	RX+VeHJeRkn8swU/DG7Tjbn8mpYWzlWea1s9gA3ya2XGQy5dErsuQvAxCp4s+LJVHUW27bLiPPkXk
	rcEnWVajEijeSBXuHU5VS8pyU7qattarXPJJTiWAYQ4mR/1eHe+xUJ6xhLDU/sAwsZuPWW8UE0lss
	Po1CISC4kyk5wuSrUhPYK2dJuSpvdpnSqC3/AzG7MYLeoJbi2kdpnUYEgNnbPpy2x/NkfimU318kN
	btrtbZV1eagBbK1PQROUzIJz3CeIvWPpiW2W6uvZHDVUoAizt1Fzz+EwuwMYdmITt2NMozWx5otdz
	p0Ab0TAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd581-0000000Cs57-2StM;
	Tue, 06 Jan 2026 11:21:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd57y-0000000Cs3K-2nE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:21:32 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlpdT23LWzJ470f;
	Tue,  6 Jan 2026 19:21:17 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B9C0340570;
	Tue,  6 Jan 2026 19:21:18 +0800 (CST)
Received: from localhost (10.48.155.65) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 11:21:17 +0000
Date: Tue, 6 Jan 2026 11:21:15 +0000
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
Subject: Re: [PATCH v2 23/45] arm_mpam: resctrl: Add rmid index helpers
Message-ID: <20260106112115.00000201@huawei.com>
In-Reply-To: <20251219181147.3404071-24-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-24-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.155.65]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_032130_852258_8055A28B 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, 19 Dec 2025 18:11:25 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Because MPAM's pmg aren't identical to RDT's rmid, resctrl handles some
> data structures by index. This allows x86 to map indexes to RMID, and MPAM
> to map them to partid-and-pmg.
> 
> Add the helpers to do this.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
one comment inline.
I messed around with GENMASK + field_prep()/field_get() - new
versions of these with no need for runtime constant masks, but
it ended up as not that much more readable than what you have here.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
> Changes since rfc:
> Use ~0U instead of ~0 in lhs of left shift
> ---
>  drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++++++++++++++++
>  include/linux/arm_mpam.h       |  3 +++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 4275b1a85887..bdbc5504964b 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -120,6 +120,34 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
>  	return mpam_partid_max + 1;
>  }
>  
> +u32 resctrl_arch_system_num_rmid_idx(void)
> +{
> +	u8 closid_shift = fls(mpam_pmg_max);
> +	u32 num_partid = resctrl_arch_get_num_closid(NULL);
> +
> +	return num_partid << closid_shift;

Given I think you restrict mpam_pmg_max to be power of 2 elsewhere,
doesn't this end up the same as something like
	return mpam_pmg_max * resctrl_arch_get_num_closid(NULL);
Maybe its worth keeping it in the form you have here as
it sort of provides documentation for how you pack those IDs

> +}


