Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4039C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri27k6j/49pprQ8TKGAFn3L2lgZSLKEqBYxSAGDZRtw=; b=QpU4j0EVfTzmBm5bNd4MB9Irif
	61thwWF0CDcGnveMwrq48rIfdQ9qkYKW8isnpZVFGiKZiDy8QNAQ/N2TmQRzLqxcs5wNPinoa7JVY
	YUEVKuHG+CcFyEFQwsPgEEbdShl5+ni5ZXdR3qxftUlV5Dt6blfDKlmiqdmUSw5jwwdEjDusofHTm
	JSmnfbANBo+AZBKVaA/lyFYx/1zP1Q3JdgFov8N5CeWIedT/V9ycOREafCq44W07v6wNfzcazTNyc
	EEj2+gJnn2kMpLyHdhBXzFHEktPEdS/O6ZYkXC8FqjzzazbDyqXSz6lxjL/XbayyyWcu4pWdnmP7R
	EUBody8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDiP-0000000CJqX-1b49;
	Tue, 05 Aug 2025 09:12:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDJk-0000000CErv-3slm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 08:46:46 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bx6S263Wkz6DBg1;
	Tue,  5 Aug 2025 16:44:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C12B1402F0;
	Tue,  5 Aug 2025 16:46:36 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 5 Aug
 2025 10:46:35 +0200
Date: Tue, 5 Aug 2025 09:46:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 17/36] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
Message-ID: <20250805094633.00003e7c@huawei.com>
In-Reply-To: <20250711183648.30766-18-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-18-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_014645_112557_A24EE74B 
X-CRM114-Status: GOOD (  18.36  )
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

On Fri, 11 Jul 2025 18:36:29 +0000
James Morse <james.morse@arm.com> wrote:

> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
> 
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed.
> 
> Later once MPAM is enabled, this cpuhp callback will be replaced by
> one that avoids the global list.
> 
> Enabling a static key will also take the cpuhp lock, so can't be done
> from the cpuhp callback. Whenever a new MSC has been probed schedule
> work to test if all the MSCs have now been probed.
> 
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Hi James,

One trivial thing noticed whilst testing..

> @@ -513,9 +541,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>  	return err;
>  }
>  
> -static void mpam_discovery_complete(void)
> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  {
> -	pr_err("Discovered all MSC\n");
> +	u64 idr;
> +	int err;
> +
> +	lockdep_assert_held(&msc->probe_lock);
> +
> +	mutex_lock(&msc->part_sel_lock);
> +	idr = mpam_read_partsel_reg(msc, AIDR);
> +	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
> +		pr_err_once("%s does not match MPAM architecture v1.0\n",
You are only checking MAJOR REV which is probably the right thing to do
but in that case maybe change the message to be v1.x ?

> +			    dev_name(&msc->pdev->dev));
> +		err = -EIO;
> +	} else {
> +		msc->probed = true;
> +		err = 0;
> +	}
> +	mutex_unlock(&msc->part_sel_lock);
> +
> +	return err;
> +}
> +

