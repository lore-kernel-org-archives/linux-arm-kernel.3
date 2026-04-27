Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE88FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db8F4KeIIKgotS0m5VajXBkhh09wCMMeXtO9GVN34HA=; b=c45KMAcACj6jALY63+rmgLOsTs
	PjLprfjrv612n2TJz8UeXmgbbBHV7oF1sVi/E7pEkQgCDiAtqn8upYi1kXK9R9QNRoldjXEyOzuh/
	hFEcNS1jkK1k6lE36ldB/v0Nrxb+N7RM14sFMRBoftjwIWQb/583WyfftrgA7dEgiyw2g17x4NjSU
	waEsNEaTI0oQJYwXqO8vxR+pMCpnrMCaqSaC0tdgtLgcYr+8qVOOse0xPdo3SXKwe6447iu37TcTH
	ykqSQV8cBovrlb0v/ERRyvob6MT6K/SzGlxvIEuronPUGQ3Gcba4mJpP2qOSKqkvYzZDUMWYST3Ge
	Y1ISpJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPIn-0000000HOmC-0iTB;
	Mon, 27 Apr 2026 16:59:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPIk-0000000HOln-3NzW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:59:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F782202C;
	Mon, 27 Apr 2026 09:59:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01763F763;
	Mon, 27 Apr 2026 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777309156; bh=7Kd2Dnx/mPiJejhHB2UzLEvDM0wFuW0EGYMjY2Aokdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmLb1AXaf/43gvezyq09ZgyMr1KLIp/4sZxuVZ34l8XUnO7P+Ez8uNogX4CeOAIFn
	 UOHJ4ud9+zsm26h90ZXbUUhxjg9BQVP8RPB7l9jEbr+qlzh2ILcLUCE7y/jGS8F3Ub
	 DoRmeCdmSXdQTPz7YbsZxrm5QjlTFFLv5QdNt0cY=
Date: Mon, 27 Apr 2026 17:59:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Message-ID: <20260427165913.GA16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095918_944424_F0BDDED7 
X-CRM114-Status: GOOD (  13.10  )
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

On Sun, Apr 26, 2026 at 05:44:38PM +0800, Yingchao Deng wrote:

[...]

> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>  {
>  	struct cti_trig_grp *tg = NULL;
>  	int err = 0, nr_filter_sigs;
> +	int nr_trigs = drvdata->config.nr_trig_max;
>  
>  	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>  						     CTI_DT_FILTER_OUT_SIGS);
>  	if (nr_filter_sigs == 0)
>  		return 0;
>  
> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +	if (nr_filter_sigs > nr_trigs)
>  		return -EINVAL;
>  
>  	tg = kzalloc_obj(*tg);
>  	if (!tg)
>  		return -ENOMEM;
>  
> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);

Here would be:

  tg->used_mask = bitmap_zalloc(nr_filter_sigs, GFP_KERNEL);

> +	if (!tg->used_mask) {
> +		kfree(tg);
> +		return -ENOMEM;
> +	}
> +

It is likely this will have merge conflict with the new patch [1].

You might need to rebase this patch on the top of [1]. We need to
give [1] priority as it is a fix.

[1] https://lore.kernel.org/linux-arm-kernel/20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com/

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

