Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F528C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/wCS6AW4yw8QcS7QY3gaRD9kvn94QRirSkbHp2Mhmc=; b=oXfVAh0Gv1kJdygteWxvsExSqg
	WL2FOuXcb2GVL0h3bt+jo2PFt21poUv3MkIODaJ9v6hP/kcHrv2iR74EyAkhTzPJuePZelbhK48q1
	XO7248SF97vEh/7/vmel68TA2PfdWu5FBIJzpxL3Qj8PqFIjG/gpd3ss2jGBUW7bsngKsJBNlWrmu
	Oyj4P8//agh/BsMrCE5xuHsymGlOtPrcl3MqF9Hfye/UCX8XwFhY/XJtEgbXyPsr6PB2cYkPScJyA
	uQECnvbbt/JnaTwYTQB6IJnQNqpE2S1ugB1TegmB4gmXVVpmgQO8S928wqguKHfEVHAPsDD7hlios
	rxHVZeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcobJ-0000000BrFE-17TS;
	Mon, 05 Jan 2026 17:42:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcobH-0000000BrDb-02uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:42:40 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlM7w1RF4zJ46BK;
	Tue,  6 Jan 2026 01:42:36 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7566940086;
	Tue,  6 Jan 2026 01:42:36 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 17:42:34 +0000
Date: Mon, 5 Jan 2026 17:42:33 +0000
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
Subject: Re: [PATCH v2 16/45] arm_mpam: resctrl: Sort the order of the
 domain lists
Message-ID: <20260105174233.00004df8@huawei.com>
In-Reply-To: <20251219181147.3404071-17-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-17-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_094239_350067_C3391EC6 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, 19 Dec 2025 18:11:18 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> resctrl documents that the domains appear in numeric order in the schemata
> file. This means a little more work is needed when bringing a domain
> online.
> 
> Add the support for this, using resctrl_find_domain() to find the point to
> insert in the list.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
I guess this was split out to try and make previous patch easier to read.
I'm not sure I'd bother in this particular case as those TODOs were
ugly, but anyhow LGTM

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/mpam_resctrl.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 4beeeded00ff..5481d9cc69d9 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -117,6 +117,21 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
>  	return false;
>  }
>  
> +static void mpam_resctrl_domain_insert(struct list_head *list,
> +				       struct rdt_domain_hdr *new)
> +{
> +	struct rdt_domain_hdr *err;
> +	struct list_head *pos = NULL;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	err = resctrl_find_domain(list, new->id, &pos);
> +	if (WARN_ON_ONCE(err))
> +		return;
> +
> +	list_add_tail_rcu(&new->list, pos);
> +}
> +
>  static struct mpam_resctrl_dom *
>  mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  {
> @@ -154,8 +169,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		ctrl_d = &dom->resctrl_ctrl_dom;
>  		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &ctrl_d->hdr);
>  		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> -		/* TODO: this list should be sorted */
> -		list_add_tail_rcu(&ctrl_d->hdr.list, &r->ctrl_domains);
> +		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
>  		err = resctrl_online_ctrl_domain(r, ctrl_d);
>  		if (err) {
>  			dom = ERR_PTR(err);
> @@ -169,8 +183,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		mon_d = &dom->resctrl_mon_dom;
>  		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
>  		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> -		/* TODO: this list should be sorted */
> -		list_add_tail_rcu(&mon_d->hdr.list, &r->mon_domains);
> +		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
>  		err = resctrl_online_mon_domain(r, mon_d);
>  		if (err) {
>  			dom = ERR_PTR(err);


