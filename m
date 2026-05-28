Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD2CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfsuEDJN1ipfphVBJaiFXTA0dTI5h3vFIwbblHoC3Ao=; b=hZ/Ah7LekGj7JGF7NEJUklFrVP
	FFmP6hKKcp5xHFhNauhKeX1LvvtSjAEccVzqH5Lmt56pp3spvutv6FIENBIneEwgfmPCvzP0hiVxg
	PIEoHUobHy7Cc2DM6bEr1zM4AArT6ql7jlwKR4eooCr12h79z+ya1F9Qm1SJ3vU47tdTo/v7PlAmS
	u9sGc3+Sl3q/hVfFSlI6imOjQBPU7+OXl8H+Td8M47EpeBB6riSwAmCeypB/Rw7MQ7u8U5HX7eUMR
	LAqsSSPDLzz8bMfoz4sscHnaASkpIbvKUklCZ96OcJ9uwxN27bU41gmm07xcsz2h3tk5EbFc4ygn9
	1OHRgGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdAn-00000005xFF-3HEw;
	Thu, 28 May 2026 16:01:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdAl-00000005xEn-2Frm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4DDD201B;
	Thu, 28 May 2026 09:01:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5F3B3F632;
	Thu, 28 May 2026 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779984085; bh=Pb9KUS39SJ5eL/Q/btXVm8CCz+Epp99Lk53Gb8UqVPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j06nIJDZzjkPJV40mZ+R/MeV42TMdsDbkYLohE0T+wduF621CMnrKn+SPjjQ+sc5k
	 StMzfr18i9Q/lv5o3ZtCANDP02cDsOJVOcOMgNhDRJYhjMW2IDa1DmINBz8yZCQLDM
	 WQDTbVL9u8ACbFRk09KB4M+IIzqdgWXIeV6TGcnw=
Date: Thu, 28 May 2026 17:01:22 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <ahhm0uIwQw56WhYO@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-10-yeoreum.yun@arm.com>
 <20260528143358.GF101133@e132581.arm.com>
 <ahhUnJSIvGabGbQe@e129823.arm.com>
 <20260528152633.GH101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528152633.GH101133@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090127_759975_AB00C06C 
X-CRM114-Status: GOOD (  30.28  )
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

> On Thu, May 28, 2026 at 03:43:40PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > > @@ -931,6 +919,18 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> > >  	if (ret)
> > >  		goto err;
> > >  
> > > +	/*
> > > +	 * Set any selected configuration and preset. A zero configid means no
> > > +	 * configuration active, preset = 0 means no preset selected.
> > > +	 */
> > > +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> > > +	if (cfg_hash) {
> > > +		preset = ATTR_CFG_GET_FLD(attr, preset);
> > > +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > +		if (ret)
> > > +			goto err;
> > > +	}
> > > +
> 
> > No. since preset overrides the "perf configuratoin" formerly but
> > this code makes it vice versa.
> 
> The above proposed change applies cfgfs after calling
> etm4_parse_event_config(). This is just use preset to override the
> config. Do I miss anything?

Ah sorry. I've misread the code location that was my bad.

> 
> > Also, cfg_hash and prest is also part of
> > etm4_parse_event_config(), and it doesn't seem to good to separate
> > cfgfs handling from that function.
> > 
> > IMHO, It would be better to keep this as it is.
> 
> I have another version to give a try. I'd leave to you and maintainers
> to choose which is better.

Funcionally, Code works. However, To be honest, the pairing between
etm4_parse_event_config() and etm4_clean_event_config() feels a bit artificial to me.

So here I have simply followed the principle that,
if etm4_parse_event_config() fails, the configuration it touched should be
cleaned up within that function; and if a failure happens after
etm4_parse_event_config() has succeeded, the caller should perform the cleanup.

Renaming etm4_parse_event_config() and splitting out the
CSCFG-related handling as suggested would be possible,
although I still feel it may not be strictly necessary.

My preference would be to keep this as-is, but Suzuki, what do you think?

> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 0889937811cb..471824234800 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -882,16 +882,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		/* bit[12], Return stack enable bit */
>  		config->cfg |= TRCCONFIGR_RS;
>  
> -	/*
> -	 * Set any selected configuration and preset. A zero configid means no
> -	 * configuration active, preset = 0 means no preset selected.
> -	 */
> -	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> -	if (cfg_hash) {
> -		preset = ATTR_CFG_GET_FLD(attr, preset);
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -	}
> -
>  	/* branch broadcast - enable if selected and supported */
>  	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>  		if (!caps->trcbb) {
> @@ -899,8 +889,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			 * Missing BB support could cause silent decode errors
>  			 * so fail to open if it's not supported.
>  			 */
> -			if (cfg_hash)
> -				cscfg_csdev_disable_active_config(csdev);
>  			ret = -EINVAL;
>  			goto out;
>  		} else {
> @@ -908,10 +896,31 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		}
>  	}
>  
> +	/*
> +	 * Set any selected configuration and preset. A zero configid means no
> +	 * configuration active, preset = 0 means no preset selected.
> +	 */
> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> +	if (cfg_hash) {
> +		preset = ATTR_CFG_GET_FLD(attr, preset);
> +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> +	}
> +
>  out:
>  	return ret;
>  }
>  
> +static void etm4_clean_event_config(struct coresight_device *csdev,
> +				    struct perf_event *event)
> +{
> +	struct perf_event_attr *attr = &event->attr;
> +	unsigned long cfg_hash;
> +
> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> +	if (cfg_hash)
> +		cscfg_csdev_disable_active_config(csdev);
> +}
> +
>  static int etm4_enable_perf(struct coresight_device *csdev,
>  			    struct perf_event *event,
>  			    struct coresight_path *path)
> @@ -938,15 +947,14 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  
>  	/* And enable it */
>  	ret = etm4_enable_hw(drvdata);
> -	if (ret) {
> -		if (ATTR_CFG_GET_FLD(attr, configid))
> -			cscfg_csdev_disable_active_config(csdev);
> -		goto err;
> -	}
> +	if (ret)
> +		goto err_hw;
>  
>  	csdev->path = path;
>  	return 0;
>  
> +err_hw:
> +	etm4_clean_event_config(csdev, event);
>  err:
>  	/* Failed to start tracer; roll back to DISABLED mode */
>  	coresight_set_mode(csdev, CS_MODE_DISABLED);

-- 
Sincerely,
Yeoreum Yun

