Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E579C77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkY3MrfRSLNYn/u61MEE9jJLRaSaNkliNGoNHtTcBi4=; b=kK0yxL5+X7gh6X
	d/407YAb+Koinw23pQbaP3erB+EcR4qyzGZA04uhcZKblyq/j+iHHBdm7lDtAxC8+DuTo0AnZO3Jb
	mlwZtHD0Qke4MtBZa9jzEtraFIQPU0qikqI2naLp3MjC4ahtbdyWO4fGFM+xFeRpSV9JcKTzkG+9k
	gYgs4TYBUhU9R4ub65a2KZA0CV1lif2c96sPQgic/9xRCAg3y996qt6IuPCHpGkpxZ+i7Nv6Gvo2K
	4l80q00ZZY3oCd6iV47vW/VZCJYvW70z1L9gjfxZ2K3jYqjIxvuwVZIPaBDrMA/T6zw4GSPoTvGOE
	cVWBSF278m1J3PgT4DFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyR-0000000FkCx-1zRs;
	Fri, 20 Jun 2025 13:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbVz-0000000FgJF-19yX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 13:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZkY3MrfRSLNYn/u61MEE9jJLRaSaNkliNGoNHtTcBi4=; b=lTf+UEoJPQra+5krgJqjPKv6AO
	z66GYF86mAW/c891YJuEP+pA94S+ZSB+N5euK91C/wZcYlhfVifNrHbo3BZcmPI4DiL94NpyovdQr
	JeEpWqcH77wykjqd8+dkufEAt7m9W++o4PqrqsGn4Vd3VOWtATzzMIDMcfy8H5YyGKo5pf/KRrlFm
	uOPqjBRNIDB52qFHvPSu3Dm77KWYae27o+0sjVnOrr2R2KkpcN3Fy6pL608p/EZwO6S5AVkCsSTwu
	pjhV3lVCgX38/Dkm5i8g3d7/pPsc0LyJBOPQLWoes5Uwi92IuVA8AOAbQ+A7c9grNeH17mUFtvWeM
	keIZlfdg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbVw-00000004jqf-2lzc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:10:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNyQB0GHCz6L6NZ;
	Fri, 20 Jun 2025 21:05:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8D72914027A;
	Fri, 20 Jun 2025 21:10:24 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 15:10:23 +0200
Date: Fri, 20 Jun 2025 14:10:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Jie Zhan <zhanjie9@hisilicon.com>
Subject: Re: [PATCH v5 2/2] PM / devfreq: Add HiSilicon uncore frequency
 scaling driver
Message-ID: <20250620141021.0000694c@huawei.com>
In-Reply-To: <20250619151456.3328624-3-zhanjie9@hisilicon.com>
References: <20250619151456.3328624-1-zhanjie9@hisilicon.com>
	<20250619151456.3328624-3-zhanjie9@hisilicon.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141040_896115_EF9ABAF1 
X-CRM114-Status: GOOD (  22.08  )
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
Cc: yubowen8@huawei.com, linux-pm@vger.kernel.org, zhenglifeng1@huawei.com, liwei728@huawei.com, linuxarm@huawei.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 19 Jun 2025 23:14:56 +0800
Jie Zhan <zhanjie9@hisilicon.com> wrote:

> Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
> the devfreq framework.  The uncore domain contains shared computing
> resources, including system interconnects and L3 cache.  The uncore
> frequency significantly impacts the system-wide performance as well as
> power consumption.  This driver adds support for runtime management of
> uncore frequency from kernel and userspace.  The main function includes
> setting and getting frequencies, changing frequency scaling policies, and
> querying the list of CPUs whose performance is significantly related to
> this uncore frequency domain, etc.  The driver communicates with a platform
> controller through an ACPI PCC mailbox to take the actual actions of
> frequency scaling.
> 
> Co-developed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>

Hi zhanjie,

A few more things inline that I missed in earlier review.

The devm_mutex one is a definite thing to fix as having it
where it is will make it far to easy to add bugs.

The other stuff is a nice to have.

So with at least the devm_mutex() call moved

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> new file mode 100644
> index 000000000000..e19678692c16
> --- /dev/null
> +++ b/drivers/devfreq/hisi_uncore_freq.c
> @@ -0,0 +1,664 @@

> +static int hisi_uncore_request_pcc_chan(struct hisi_uncore_freq *uncore)
> +{
> +	struct device *dev = uncore->dev;
> +	struct pcc_mbox_chan *pcc_chan;
> +	int rc;
> +
> +	uncore->cl = (struct mbox_client) {
> +		.dev = dev,
> +		.tx_block = false,
> +		.knows_txdone = true,
> +	};
> +
> +	pcc_chan = pcc_mbox_request_channel(&uncore->cl, uncore->chan_id);

I'm not particularly keen on the repeats of pcc_mbox_free_channel() in each of
the error paths.  Either use a goto and clean it up at the end or
DEFINE_FREE(pcc_mbox_chan, struct pcc_mbox_chan *, if (_T) pcc_mbox_free_channel(_T));

then here
	struct pcc_mbox_chan __free(pcc_mbox_chan) *pcc_chan =
		pcc_mbox_request_channel(&uncore->cl, uncore->chan_id);

remembering to do 
	uncor->chan = no_free_ptr(pcc_chan);
where you currently set it below.

The DEFINE_FREE() might prove useful in other drivers.  kunpeng_hccs
for instance could be simplified with this.  Various other candidates
though not sure how keen on cleanup.h magic those areas of the kernel are.


> +	if (IS_ERR(pcc_chan))
> +		return dev_err_probe(dev, PTR_ERR(pcc_chan),
> +			"Failed to request PCC channel %u\n", uncore->chan_id);
> +
> +	if (!pcc_chan->shmem_base_addr) {
> +		pcc_mbox_free_channel(pcc_chan);
> +		return dev_err_probe(dev, -EINVAL,
> +			"Invalid PCC shared memory address\n");
> +	}
> +
> +	if (pcc_chan->shmem_size < sizeof(struct hisi_uncore_pcc_shmem)) {
> +		pcc_mbox_free_channel(pcc_chan);
> +		return dev_err_probe(dev, -EINVAL,
> +			"Invalid PCC shared memory size (%lluB)\n",
> +			pcc_chan->shmem_size);
> +	}
> +
> +	rc = devm_mutex_init(dev, &uncore->pcc_lock);

This is oddly placed.  Drop this out of this function and do it at least one layer
up.

Having it here leaves the risk of future error cases being added after this
where the devm cleanup will happen out of order as a result.

> +	if (rc) {
> +		pcc_mbox_free_channel(pcc_chan);
> +		return rc;
> +	}
> +
> +	uncore->pchan = pcc_chan;
> +
> +	return 0;
> +}

