Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53113CE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOTKwp0adOL4jPwfWhfwM8YwO6RBrghgftMY4ldtJKc=; b=HS2BJAe8z1K7e6Hni8TEoWKtNe
	vX1ZNeTvgkCNawugSZOlOxU3WL6UArrFgt4bdMytSByUP4n5ewY2aNifvlqs0Ge+Zlu+Sq02Hg/TR
	zm7Xwd0Knldg3cfDuZE00aM+d5hJ+BDlqXGhRsMpeeqqgkWEV5sRY4WJE/eY/tIKLxjYEPMpMbG5i
	VVS4oX8KIqlHdlZZcYNNK8mFKA8Io31IsBvThk9yZiO1vjTqIS8dQ1K0rgvf7YgIMoiEAhsCsWbZD
	Hs+BVNyNa7DlG0Ym0iyv9z9PaYjYSuA8+aZppaEs0tbmepnGVTRQU3PW8WIkSisdvqjYh3LneX1jv
	3qjYapVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvkr-0000000CZa0-1ES4;
	Fri, 14 Nov 2025 15:30:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvkq-0000000CZZS-0flA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aOTKwp0adOL4jPwfWhfwM8YwO6RBrghgftMY4ldtJKc=; b=ZwjYn6QHiSI99XnRDScg+ffq+F
	qnXm4WqJuzg0d1Ds5oT2LwUWtvOus1iAdJuUxvoGBwsZZOo/v3SSZcsaGmZ3Ll1vg0T9TLLSaM0GY
	3qOw/WMEgjfa/7zjf7mR4tFxGAMKjmYn6tVvkZpAWkXYZreQ5Ntcyl3KEWQffIYcsEC3+KNfPoL+0
	o2LUrZEFN/xjHN3bzfl3wj/6hnM8h/B6uaGlje81vW+XYpzYnicSR4nXpl0VfpVWd3EPPaXOuszkD
	1jPmVBnhpub3QQUQov/qsDgeN0L/cHjHmI3kfb4Qs2rkzGdcZqflwnGh63uQ0iNyzW0iKrFi9951M
	UybysXFg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJut8-00000002pXy-1tgu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:35:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D12A51063;
	Fri, 14 Nov 2025 07:30:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14CBA3F66E;
	Fri, 14 Nov 2025 07:30:22 -0800 (PST)
Date: Fri, 14 Nov 2025 15:30:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114153021.GH3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143458_720318_6118E19D 
X-CRM114-Status: GOOD (  16.37  )
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

On Wed, Nov 12, 2025 at 03:22:14PM +0000, James Clark wrote:
> The "config:" string construction in format_attr_contextid_show() can be
> removed because it either showed the existing context1 or context2
> formats which have already been generated, so can be called themselves.
> 
> The other conversions are straightforward replacements.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index d19e2568a0d1..7272e758aebf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>  					  struct device_attribute *attr,
>  					  char *page)
>  {
> -	int pid_fmt = ETM_OPT_CTXTID;
> -
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> +	if (is_kernel_in_hyp_mode())
> +		return contextid2_show(dev, attr, page);
>  #endif

As said, this function now is only used for ETM4, we can remove "#if
IS_ENABLED(...)".

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

