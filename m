Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD5AD2D0EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9jM4JSnpe2aPhEsn9hNWKH45uLdjbDld+fZ/M8EK6g=; b=zNuP0a3AndsohqOpdF3oFGGCvJ
	sD3meGFlCu6f2xAMnciLeIF/QqvYvqeO6A/f0+8ToyQTrSZcrMK5vlpxVymV+yTPQK4g6AsdnzddC
	BGRr7WcCTtG43Y4n+P1D+A/5P5kRUXCeH993OXjYaHg5FQROHSpRBbf4WObq8pWkDP6FdF/aC+B5D
	VOziTYbnJusyJmir7DacOXGU0ibfpVLWYicxXvdTleL85+86T4XdJpnXbtcvqTybVsMJZcO0yhBlr
	7xu1wYl2jbfu4jbuoawL/8L6G09yl5GP8qALmCGPBKr6GZd9ygVn3CPohyGR6QkzR++pqNYdOjWdr
	cJvwqRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfffS-00000007Haz-1ziQ;
	Tue, 13 Jan 2026 14:46:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfffP-00000007Ha2-3P5Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:46:45 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4drBrx25g6zJ46D8;
	Tue, 13 Jan 2026 22:46:25 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D52B4056B;
	Tue, 13 Jan 2026 22:46:38 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 13 Jan
 2026 14:46:36 +0000
Date: Tue, 13 Jan 2026 14:46:35 +0000
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
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	Zeng Heng <zengheng4@huawei.com>
Subject: Re: [PATCH v3 17/47] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
Message-ID: <20260113144635.00000755@huawei.com>
In-Reply-To: <20260112165914.4086692-18-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
	<20260112165914.4086692-18-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_064644_140058_17F39F01 
X-CRM114-Status: GOOD (  19.87  )
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

On Mon, 12 Jan 2026 16:58:44 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> We already have a helper for resetting an mpam class and component.  Hook
> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

There was a question from Zhengheng on v2 that doesn't seem to be addressed
and I'm not seeing a reply on list.  Maybe an email snafu?

https://lore.kernel.org/all/20260109034506.1176234-1-zengheng4@huawei.com/

Please +CC zhengheng on future versions if we need them!

Thanks,

Jonathan

> ---
> Changes since v2:
> Don't expose unlocked reset
> ---
>  drivers/resctrl/mpam_devices.c  |  4 ++--
>  drivers/resctrl/mpam_internal.h |  6 ++++++
>  drivers/resctrl/mpam_resctrl.c  | 15 +++++++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b81d5c7f44ca..0dd7f613f7a3 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2544,7 +2544,7 @@ static void mpam_enable_once(void)
>  	       mpam_partid_max + 1, mpam_pmg_max + 1);
>  }
>  
> -static void mpam_reset_component_locked(struct mpam_component *comp)
> +void mpam_reset_component_locked(struct mpam_component *comp)
>  {
>  	struct mpam_vmsc *vmsc;
>  
> @@ -2568,7 +2568,7 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
>  	}
>  }
>  
> -static void mpam_reset_class_locked(struct mpam_class *class)
> +void mpam_reset_class_locked(struct mpam_class *class)
>  {
>  	struct mpam_component *comp;
>  
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e394ee78918a..f89ceaf7623d 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -393,6 +393,12 @@ extern u8 mpam_pmg_max;
>  void mpam_enable(struct work_struct *work);
>  void mpam_disable(struct work_struct *work);
>  
> +/* Reset all the RIS in a class under cpus_read_lock() */
> +void mpam_reset_class_locked(struct mpam_class *class);
> +
> +/* Reset all the RIS in a component under cpus_read_lock() */
> +void mpam_reset_component_locked(struct mpam_component *comp);
> +
>  int mpam_apply_config(struct mpam_component *comp, u16 partid,
>  		      struct mpam_config *cfg);
>  
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 1566d0c686e6..683bdd6989d4 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -169,6 +169,19 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>  	return comp->comp_id;
>  }
>  
> +void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
> +{
> +	struct mpam_resctrl_res *res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	if (!mpam_is_enabled())
> +		return;
> +
> +	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
> +	mpam_reset_class_locked(res->class);
> +}
> +
>  static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
>  					 struct rdt_domain_hdr *hdr)
>  {
> @@ -352,6 +365,8 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
>  			continue;
>  
>  		if (exposed_alloc_capable) {
> +			mpam_reset_component_locked(dom->ctrl_comp);
> +
>  			ctrl_d = &dom->resctrl_ctrl_dom;
>  			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
>  			if (ctrl_dom_empty)


