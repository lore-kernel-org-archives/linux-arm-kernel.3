Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EAFD6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNHoAzpjRtp8xwOAT6uiR+lgYpZ4BjqylPskH2NGDl0=; b=uplNLEnWib8FS8MuCbRcucSOXT
	oZYAdIvxqSnhC3d1ITKzYyGdQolfEvN/wZkvxWRLZXplfD6k6+tnLfEhVGB/LiiPdTVg5y+hECwG4
	txoPVQyIgUfesE9MBeo1Ieq9kyLXzGjQ97FUWf8+BXvs/8ZiXs3HZVaLH+jZVZFc2Sdpcr3weJ3aR
	aaaMOVd2z47NeOIohhk7RN4hTu1N2h3nps+C3mkAtVkX95Q559LyMwmdvp+evlyflSN2HpnS6OKLC
	XqKDP6I12krAhVzfzssqYv983cjZS8+2qmMBTPWS4ZaMKqoOF4U0aFVpJf5/LTedYLqINVh6UdMy5
	nDrQ8nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDwQ-00000008Vze-2t6f;
	Thu, 18 Dec 2025 13:21:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDwN-00000008VyV-1B5N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:21:13 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXB9q5XDxzJ468x;
	Thu, 18 Dec 2025 21:20:31 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id C374940565;
	Thu, 18 Dec 2025 21:21:02 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 13:21:01 +0000
Date: Thu, 18 Dec 2025 13:20:59 +0000
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
Subject: Re: [RFC PATCH 18/38] arm_mpam: resctrl: Add support for csu
 counters
Message-ID: <20251218132059.00001a0d@huawei.com>
In-Reply-To: <20251205215901.17772-19-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-19-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052111_633133_A3513DDC 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri, 5 Dec 2025 21:58:41 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl exposes a counter via a file named llc_occupancy. This isn't really
> a counter as its value goes up and down, this is a snapshot of the cache
> storage usage monitor.
> 
> Add some picking code to find a cache as close as possible to the L3 that
> supports the CSU monitor.
> 
> If there is an L3, but it doesn't have any controls, force the L3 resource
> to exist. The existing topology_matches_l3() and
> mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
> even if the class belongs to a later cache.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

More triviality from me.  I'll take a separate look at whether this actually
works for all the systems we care about.  It feels like maybe a top level
MPAM to resctl mapping document might be useful as people are going to fall
into traps around these various heuristics, particularly as more exciting
topologies arrive in the future. 


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index fe830524639e..fc1f054f187e 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

>  /*
>   * Calculate the worst-case percentage change from each implemented step
>   * in the control.
> @@ -499,6 +531,64 @@ static void mpam_resctrl_pick_mba(void)
>  	}
>  }
>  
> +static void counter_update_class(enum resctrl_event_id evt_id,
> +				 struct mpam_class *class)
> +{
> +	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
> +
> +	if (existing_class) {
> +		if (class->level == 3) {
> +			pr_debug("Existing class is L3 - L3 wins\n");
> +			return;

As returned the else isn't adding anything much.

> +		} else if (existing_class->level < class->level) {
> +			pr_debug("Existing class is closer to L3, %u versus %u - closer is better\n",
> +				 existing_class->level, class->level);
> +			return;
> +		}
> +	}
> +
> +	mpam_resctrl_counters[evt_id].class = class;
> +	exposed_mon_capable = true;
> +}



