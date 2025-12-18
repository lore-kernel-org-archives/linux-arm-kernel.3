Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE2D6D226
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3NR3D0pcqoKjUc5PYOsd4k3CDAuEeHXW3s7b2AXN5E=; b=ATEAS3WQ4yc8X+8JaYwEv5Kf7g
	2IWUzpatb/2//wfG/MZ9IZnwhu0iIOac1wA5mlL3Zdt8lGe1ecpbFvMefgZ8Crfbh/ImS1CHkkS1Z
	W3LaF6eGUbQzMgGqbz7RlZpjJF1DB0zjBFSBG2YqFX6IYYOAwzQprOvq40lRGVkD/n7XtZph0jVGc
	suBlYK6XmNB9EYqBWJEdqp04QzCcyFb+Ja5aUGwn+76kT2Eon//PRGuuIxnaAhcl1kweLYVgOceBH
	78rGvN19S4Ac6Yv/U42ddu4sWvYb8dSuZSs027e49mw2S7oo/6Qpt7fGpkOC19QWsNvvwG7Dsomlc
	wC4E6Ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEOK-00000008ZAQ-3EyN;
	Thu, 18 Dec 2025 13:50:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEOH-00000008Z9c-15li
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:50:03 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXBqF1VwqzHnH2q;
	Thu, 18 Dec 2025 21:49:29 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 71EAA4056A;
	Thu, 18 Dec 2025 21:49:56 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 13:49:55 +0000
Date: Thu, 18 Dec 2025 13:49:53 +0000
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
Subject: Re: [RFC PATCH 24/38] arm_mpam: resctrl: Allow resctrl to allocate
 monitors
Message-ID: <20251218134953.000064b1@huawei.com>
In-Reply-To: <20251205215901.17772-25-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-25-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_055001_447620_3FD9DD2C 
X-CRM114-Status: GOOD (  18.79  )
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

On Fri, 5 Dec 2025 21:58:47 +0000
James Morse <james.morse@arm.com> wrote:

> When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs
> to allocate a monitor on the corresponding resource. Monitors are
> allocated by class instead of component.
> 
> MBM monitors are much more complicated, if there are enough monitors,
> they will be pre-allocated and free-running. If ABMC is in use instead
> then 'some' are pre-allocated in a different way, and need assigning.
> 
> Add helpers to allocate a CSU monitor. These helper return an out
> of range value for MBM counters.
> 
> Allocating a montitor context is expected to block until hardware
> resources become available. This only makes sense for QOS_L3_OCCUP
> as unallocated MBM counters are losing data.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Since ABMC got merged it may be possible to remove the monitor alloc
> call for MBM counters from resctrl as this work is now done by ABMC's
> assign call.
> ---
>  drivers/resctrl/mpam_internal.h | 14 ++++++-
>  drivers/resctrl/mpam_resctrl.c  | 68 +++++++++++++++++++++++++++++++++
>  include/linux/arm_mpam.h        |  4 ++
>  3 files changed, 85 insertions(+), 1 deletion(-)
> 

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 22ad5dd3c383..a2b238d47117 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> +
> +void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
> +			       enum resctrl_event_id evtid, void *arch_mon_ctx)
> +{
> +	u32 mon_idx = *(u32 *)arch_mon_ctx;
> +
> +	kfree(arch_mon_ctx);
> +	arch_mon_ctx = NULL;

Why is this useful?  Updating the local pointer copy which is not
used again. Maybe I need more coffee.

> +
> +	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
> +}

