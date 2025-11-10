Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC84CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdovdGmmzkPB07Atx83zLkFIQG8sKIWorertqJNScAI=; b=jDxx9eQc5vGutd1rb+V7LPynfs
	crYku2G+iiAtna9JPPYa0WScAjKmidbsAbWP62sn5otE0zEM6bPAP1x+ytm+BQ7BJoyrGIjqdRNeA
	5m5ZZxEimW6qtzu40FHGnzNexJwZ30S/4e8quXsWERP9uzgDNz3MDmziD/N5Q0J7DLCF5FORPhluM
	LDSlyl3ZBO8nfOTp+0LQwR2YdsruP0Ow2YN0l1NCOCgiW3iEtYffGKSfyuuP1hj5TjiZeXKR+nPjS
	afM7UOOLbJkUEZWdiFKgpZFqYWhy+LbUCZu/4TTXzPZ3648Hm50ROwg25J0W+CjGmaq5yaSOgbXK/
	pvY9M9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUQE-00000005lY0-2xLN;
	Mon, 10 Nov 2025 16:07:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUQB-00000005lXT-0HKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:07:13 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4vg25B99zJ46dN;
	Tue, 11 Nov 2025 00:06:38 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3350D14033C;
	Tue, 11 Nov 2025 00:07:08 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 16:07:06 +0000
Date: Mon, 10 Nov 2025 16:07:05 +0000
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
	<xhao@linux.alibaba.com>
Subject: Re: [PATCH 07/33] platform: Define platform_device_put cleanup
 handler
Message-ID: <20251110160705.00007387@huawei.com>
In-Reply-To: <20251107123450.664001-8-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-8-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_080712_066330_971CD1EB 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, 7 Nov 2025 12:34:24 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> Define a cleanup helper for use with __free to destroy platform devices
> automatically when the pointer goes out of scope. This is only intended to
> be used in error cases and so should be used with return_ptr() or
> no_free_ptr() directly to avoid the automatic destruction on success.
> 
> A first use of this is introduced in a subsequent commit.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

I'm fine with this but probably needs a tag from Greg KH.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  include/linux/platform_device.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 074754c23d33..23a30ada2d4c 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -232,6 +232,7 @@ extern int platform_device_add_data(struct platform_device *pdev,
>  extern int platform_device_add(struct platform_device *pdev);
>  extern void platform_device_del(struct platform_device *pdev);
>  extern void platform_device_put(struct platform_device *pdev);
> +DEFINE_FREE(platform_device_put, struct platform_device *, if (_T) platform_device_put(_T))
>  
>  struct platform_driver {
>  	int (*probe)(struct platform_device *);


