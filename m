Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2569DD6ACED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2u/Npv2UxatptpWZ9pHwkU5UrSTiIqHrR/oYUXoGkQ=; b=gL/XAfwpUs+5AV/JQSEuPCbJNG
	gwBfcyr+6GW9Z5m5BJqJSbBGoPjvh6OhwiCSVC1ziyNO6LUNdIT8odvaL1GP+K+KZ4yK2NWGM9yIt
	2bGqW235tmt7AnSX1Cu1DGwpr91M3jriDg5Jyt587aNsPun6j2/Oyl/xs1umufnkUbeRL4mdrXzUk
	/MaKF1gH6lnj0cyBy+NchtodsslB5UUHrrp+R0UqDs9zymF4SqdVOC05i3YuEKKp7Vrj0+Mhg4BV5
	r6VT8WTbUzNBi75K1uSN+WKI3xiQb74atDbJu+zL+pdIXLaeX3vt5OHktxM7jYiuaYpr0k1Fm+Xqb
	AAITNhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCTp-00000008NaL-04DO;
	Thu, 18 Dec 2025 11:47:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCTl-00000008NZU-3LWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:47:35 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dX85t4WvSzJ46bF;
	Thu, 18 Dec 2025 19:46:58 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 883834056A;
	Thu, 18 Dec 2025 19:47:29 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 11:47:28 +0000
Date: Thu, 18 Dec 2025 11:47:26 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, D
 Scott Phillips OS <scott@os.amperecomputing.com>,
	<carl@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>, <rohit.mathew@arm.com>,
	<reinette.chatre@intel.com>, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 11/38] arm_mpam: resctrl: Implement helpers to
 update configuration
Message-ID: <20251218114726.0000651e@huawei.com>
In-Reply-To: <20251205215901.17772-12-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-12-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_034734_133475_C58E6E4F 
X-CRM114-Status: GOOD (  21.30  )
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

On Fri, 5 Dec 2025 21:58:34 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl has two helpers for updating the configuration.
> resctrl_arch_update_one() updates a single value, and is used by the
> software-controller to apply feedback to the bandwidth controls,
> it has to be called on one of the CPUs in the resctrl:domain.
> 
> resctrl_arch_update_domains() copies multiple staged configurations,
> it can be called from anywhere.
> 
> Both helpers should update any changes to the underlying hardware.
> 
> Imlpement resctrl_arch_update_domains() to use

Implement

> resctrl_arch_update_one(). Neither need to be called on a specific
> CPU as the mpam driver will send IPIs as needed.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 71 ++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index a26eb1f3efd0..ae0d17857b78 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> +int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
> +{
> +	int err = 0;
> +	enum resctrl_conf_type t;
> +	struct rdt_ctrl_domain *d;
> +	struct resctrl_staged_config *cfg;
> +
> +	lockdep_assert_cpus_held();
> +	lockdep_assert_irqs_enabled();
> +
> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> +		for (t = 0; t < CDP_NUM_TYPES; t++) {
> +			cfg = &d->staged_config[t];
> +			if (!cfg->have_new_ctrl)
> +				continue;
> +
> +			err = resctrl_arch_update_one(r, d, closid, t,
> +						      cfg->new_ctrl);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return err;

If it stays this simple in later patches
	return 0;

to make it clear this is the good path. Also can then avoid initializing
err at the top.


> +}
> +
>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
>  {
>  	struct mpam_resctrl_res *res;


