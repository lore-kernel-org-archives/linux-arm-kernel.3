Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0290CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3+qDXnHDB/pV4lm+hm1szVHIyB0qNMfb0btMjTZN2c=; b=ktMv9Zl4kQ2f4zw+1YbFfcyHf1
	Y+mPpvWmP38KVC1WPKZjyZb6gUqWBIi9mNUkMVPEHOZ8coL2McNbXkimEcwOeQ2Y4vzL/1bfl7q+m
	eDomh32tyzPDWn1neOLLK6zqdbzPpU5Dk4u7RzFYxPSb4/jtQfzec8Rwnu69Em+PclfSMfuhg/PRj
	06Cyu2u6Z3hc/yDd4BUYT2wr1DxcyyH0Hn4zH1/PQ0iLMcenJcHgtO/Xq5Y6p+zuHo3nVxGsgp5nx
	4qg3X2oXQmtLyUBCcPQDwoCL5AMopNQFOpM2kfPyCDfUfVsDrdyhwQV+GlLCWjAvZX8Vmy2gs/5YV
	XJWRhzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLpU-0000000A8cv-3pkQ;
	Fri, 24 Oct 2025 17:43:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLpR-0000000A8bJ-0F5L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:43:55 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctVbD5wFLz6L4yY;
	Sat, 25 Oct 2025 01:42:16 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E6FB14010C;
	Sat, 25 Oct 2025 01:43:48 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 18:43:46 +0100
Date: Fri, 24 Oct 2025 18:43:44 +0100
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
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 12/29] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
Message-ID: <20251024184344.000036f6@huawei.com>
In-Reply-To: <20251017185645.26604-13-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-13-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_104353_385150_B17E25C7 
X-CRM114-Status: GOOD (  22.87  )
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

On Fri, 17 Oct 2025 18:56:28 +0000
James Morse <james.morse@arm.com> wrote:

> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSC are not accessible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with SCMI
> or PCC mailboxes it must be able to sleep, meaning a mutex must be used.
> The SCMI or PCC platforms can't support an overflow interrupt, and
> can't access the registers from hardirq context.
> 
> Clearly these two can't exist for one MSC at the same time.
> 
> Add helpers for the MON_SEL locking. For now, use a irqsave spinlock and
> only support 'real' MMIO platforms.
> 
> In the future this lock will be split in two allowing SCMI/PCC platforms
> to take a mutex. Because there are contexts where the SCMI/PCC platforms
> can't make an access, mpam_mon_sel_lock() needs to be able to fail. Do
> this now, so that all the error handling on these paths is present. This
> allows the relevant paths to fail if they are needed on a platform where
> this isn't possible, instead of having to make explicit checks of the
> interface type.
> 
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Change since v1:
>  * Made accesses to outer_lock_held READ_ONCE() for torn values in the failure
>    case.
Guess that went away. I'd prune the old version log or add something to indicate
it did in a later version log.

One stray change inline otherwise seems fine
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> ---
>  drivers/resctrl/mpam_devices.c  |  3 ++-
>  drivers/resctrl/mpam_internal.h | 38 +++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 910bb6cd5e4f..35011d3e8f1e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -738,6 +738,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  
>  	mutex_init(&msc->probe_lock);
>  	mutex_init(&msc->part_sel_lock);
> +	mpam_mon_sel_lock_init(msc);
>  	msc->id = pdev->id;
>  	msc->pdev = pdev;
>  	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
> @@ -822,7 +823,7 @@ static void mpam_enable_once(void)
>  				      "mpam:online");
>  
>  	/* Use printk() to avoid the pr_fmt adding the function name. */
> -	printk(KERN_INFO, "MPAM enabled with %u PARTIDs and %u PMGs\n",
> +	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
Move this to original patch.

>  	       mpam_partid_max + 1, mpam_pmg_max + 1);
>  }


