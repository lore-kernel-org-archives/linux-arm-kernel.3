Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA3CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v/hJ+4x3k39wuad0XYD2upfXtx4bmPzWfekaW7y9vs=; b=kgGXxMR8OAcMQGf7hpNXylg9jX
	iC1jjjP69SbasCSczSeyyzl3F4DJfFRFEpg6D+U1zxaWsdUznbzMRvWtHB8lE2PsxAfPEJGR4IJrH
	PJixcLrBWais8Ae2YFG9jG4uE2d/Om9bIw3VqI2mrZZjUWfAhMM/6Il0B4EM9cmuzZo6rJGvJ1+iF
	4eCcX4kaQ0K6FjNyufouAF6Scbqc1K86ZjC8XiZqpb99ADibEKsBv/53WMI2DYZpxkHvn5eBKOMXW
	2HDXcV8OLIJLPOZc85WAfWOwqBPaf++5yTFyjJPLAvqIzOKTKKJNHwdCoFLBLBWXUesGuCmuNx3k+
	ZhNfjrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbrP-00000004pZ2-0nRC;
	Mon, 22 Jun 2026 10:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbrL-00000004pXp-2194
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 10:26:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07DE41BF7;
	Mon, 22 Jun 2026 03:26:24 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2922A3F632;
	Mon, 22 Jun 2026 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782123988; bh=wxS1GBA5+0T3tdNgKK+Y6NF5mI+zXq9Oddgyf6Zumio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBncEEiVS+R/Fj/s7EP0mJW94iPEi1PFC6YWV5jT7AM51VUXtZ2p7ZAB9sSBgQTR8
	 iTeArdRGQWNfkgmOaRcvq5llKVbE+Qf5H2BnrIAKiGowCCu2DQ8kzEb7RhciVqAdR0
	 Xij3gQZmxGecg+ss08VPVZAHzXZCbdV5BiQYiCF0=
Date: Mon, 22 Jun 2026 11:26:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	james.clark@linaro.org
Subject: Re: [PATCH v3 1/1] coresight: fix issue where coresight component
 has no claimtags
Message-ID: <20260622102625.GF31870@e132581.arm.com>
References: <20260619160148.499223-1-mike.leach@arm.com>
 <20260619160148.499223-2-mike.leach@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619160148.499223-2-mike.leach@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_032631_671903_A5F716D2 
X-CRM114-Status: GOOD (  21.59  )
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

Hi Mike,

On Fri, Jun 19, 2026 at 05:01:48PM +0100, Mike Leach wrote:

[...]

> Any device which is not verified to support claim tags, will now get a
> success return from the claim/disclaim calls.

Do we really want to relax this?

AFAIK, all Arm standard modules should follow the claim tag protocol.
SoC specific modules that do not support claim tags should not enable
claim tag handling in the first place. In that case, they would not
need any claim tag-related operations.

The tricky part is that if a module provides CORESIGHT_CLAIMSET, it
likely supports claim tags. Conversely, if a module does not provide
CORESIGHT_CLAIMSET, validating claim tags using that offset seems
pointless.

As a result, can we constraint to only two cases as below?

  enum coresight_claim_tag_info {
       CS_CLAIM_TAG_STD_PROTOCOL,
       CS_CLAIM_TAG_IGNORE,
  };

For CS_CLAIM_TAG_STD_PROTOCOL type, it must pass the validation.
Otherwise, the claim tag operations will be totally ignored.

[...]

> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 43abe13995cf..d8a0ecc502af 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -574,10 +574,14 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
>  	catu_desc.ops = &catu_ops;
>  
> -	coresight_clear_self_claim_tag(&catu_desc.access);
>  	drvdata->csdev = coresight_register(&catu_desc);
>  	if (IS_ERR(drvdata->csdev))
>  		ret = PTR_ERR(drvdata->csdev);
> +
> +	ret = coresight_init_claim_tags(drvdata->csdev);
> +	if (ret)
> +		coresight_unregister(drvdata->csdev);
> +

coresight_init_claim_tags() is much simpler than coresight_register(),
this is why we can put coresight_init_claim_tags() before
coresight_register() to avoid complex rollback operations for claim init
failure.

I have no strong opinion for this, as the sequence in this patch should
can work as well.

> +/* helper for checking if claim tag protocol in use */
> +static bool coresight_using_claim_tag_protocol(struct coresight_device *csdev)
> +{
> +	return (bool)(csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
> +}

Redundant for bool cast?

> +
> +/* helper to check initialised */
> +static bool coresight_claim_tag_noinit(struct coresight_device *csdev)
> +{
> +	return (bool)(csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN);

Ditto.

> +/* cpu bound devices (etms) may need to run on bound cpu */
> +int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, int cpu)
> +{
> +	int ret = 0;
> +	struct cs_claim_tag_init_arg arg = { };
> +
> +	arg.csdev = csdev;
> +	ret = smp_call_function_single(cpu,
> +				       coresight_init_claim_tags_smp_call,
> +				       &arg, 1);
> +
> +	if (!ret)
> +		ret = arg.rc;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(coresight_init_claim_tags_cpu_smp);

Do we really need a specific SMP call for this? I understand this will
be used by ETMv3/v4 drivers, can we simply init claim tags in the local
functions (e.g., etm4_init_arch_data() for ETMv4), same as the current
implemenation?

Thanks,
Leo

