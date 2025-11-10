Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12DECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD6D1rar62jsL1zHC1IEq519p2xAp9IZhJ41iuxrkDg=; b=H53Ejsjq422cwvGMaUvXO8554B
	DM/BXtL+m+Bbnm2cO/0jEEHi/VlO9icqe0WEiSiQozBQtQ6qOP0WE+AXMMRiERkpSZfKDG8xzy2jX
	k6xCSsUFdUacn6p5WAH1ChuwfpUjVgUZfxy3rY0FSonlgHrLYytSTdWQVVc1B4dKCMTbi+nRTEZlq
	+bqL8HlarzW7cCoX5BK0OGy6hl9e/N7PZY0XfzrOsZ9WODb8Iwjhf9fZylL0MDGjKvZP+B1C/hzEl
	xHhDx/cqbZiIPLdCOz47Cz+9X5sczcZ2nm674lQ/a4feK7nQ6FeUcX2okE298QInX8c/s4YWp2Jmk
	RMjBb9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVk1-00000005uIj-444G;
	Mon, 10 Nov 2025 17:31:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVjx-00000005uHL-2l2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:31:44 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4xXq462SzHnGcw;
	Tue, 11 Nov 2025 01:31:23 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1921314033C;
	Tue, 11 Nov 2025 01:31:39 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 17:31:37 +0000
Date: Mon, 10 Nov 2025 17:31:36 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<bobo.shaobowang@huawei.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, Zeng Heng <zengheng4@huawei.com>
Subject: Re: [PATCH 27/33] arm_mpam: Track bandwidth counter state for power
 management
Message-ID: <20251110173136.000074ce@huawei.com>
In-Reply-To: <20251107123450.664001-28-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-28-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093143_033116_D39CBFE8 
X-CRM114-Status: GOOD (  13.68  )
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

On Fri, 7 Nov 2025 12:34:44 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Bandwidth counters need to run continuously to correctly reflect the
> bandwidth.
> 
> Save the counter state when the hardware is reset due to CPU hotplug.
> Add struct mbwu_state to track the bandwidth counter. Support for
> tracking overflow with the same structure will be added in a
> subsequent commit.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

One trivial below.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

>  
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index d8f8e29987e0..1f2b04b7703e 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -91,7 +91,10 @@ struct mpam_msc {
>  	 */
>  	struct mutex		part_sel_lock;
>  
> -	/* cfg_lock protects the msc configuration. */
> +	/*
> +	 * cfg_lock protects the msc configuration and guards against mbwu_state
> +	 * and save and restore racing.

Stray "and" that isn't needed on this second line.

> +	 */
>  	struct mutex		cfg_lock;
>  



