Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D203FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LknFG3wsjhT2Ixkhnp63+U1Zw0PaERXJmqF/5y21l/c=; b=DO+Qw+cbdWyp1BpjS9682RtsRb
	CYeQrN8cJ1u8TE3w0VfcNgNzkjeYaIHFxanC+xf8m1ZsGcsCZ1jp/21G0aioRz9808Aq9eZGP4tmz
	JdI3CLcjMv9dvBLF5VHxb/isY/0FIifYiKetN8laHS3/Ch03J6JxaxBBkGb1awFFysMNZ5K5IQ58n
	JbD/1nqL/sr7ouUI4m6dzKJYds79oK/QCuO+C02jowBJ479fvyL7E7Vjag6eyShRNkCV9nLTBZB3k
	RlwfWvnWSqShu1+d8mhXuOBEqs/1f1QL51dI6uCNUuTC+kBhe/PdKTCR8kSq/Gk3gxKgmi/7BjCUr
	D+cQ7Qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJkk-0000000GkUl-0LN3;
	Mon, 27 Apr 2026 11:03:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJkh-0000000GkU6-0jME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:03:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0C31684;
	Mon, 27 Apr 2026 04:03:39 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B8443F763;
	Mon, 27 Apr 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777287824; bh=RGu2430lNGgXf1aFh7GGMH4xc5y/o0HdWxVr81e1cSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3jHWTScA0Zo9XQQ+v+cdNdzLLYxdC+eZJZSvFwcN7rC/61dcZj0dtvIOpdD811qB
	 kXwYaQAHCcSzXfV+n1QAY8hHb3MvbV0UMM2zgu/NH273ZILIYiYKdO+wwcX/ARnTCh
	 JGJ4kQyXJpENctegHrpXA68JDCCKIyntc8y9Em3Q=
Date: Mon, 27 Apr 2026 12:03:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH] coresight: cti: Fix DT filter signals silently ignored
Message-ID: <20260427110342.GH929984@e132581.arm.com>
References: <20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_040347_254008_5873EE1C 
X-CRM114-Status: GOOD (  15.18  )
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

On Sun, Apr 26, 2026 at 05:59:34PM +0800, Yingchao Deng wrote:
> In cti_plat_process_filter_sigs(), after allocating a temporary
> cti_trig_grp struct via kzalloc_obj(), the code never assigns tg->nr_sigs
> = nr_filter_sigs. Since kzalloc zero-initialises the struct, tg->nr_sigs
> remains 0. cti_plat_read_trig_group() guards with:
>     if (!tgrp->nr_sigs)
>         return 0;
> 
> so it returns immediately without reading any signal indices from DT.
> 
> Fix by assigning tg->nr_sigs before calling cti_plat_read_trig_group().
> 
> Fixes: a5614770ab97 ("coresight: cti: Add device tree support for custom CTI")
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 4eff96f48594..d6d5388705c3 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -329,6 +329,7 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>  	if (!tg)
>  		return -ENOMEM;
>  
> +	tg->nr_sigs = nr_filter_sigs;
>  	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);

I checked the naming, seems tg->nr_sigs is the right field to store
the number.  LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

