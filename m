Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B68606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qH3ZMeqP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YE+jlkkd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TRfZVZt4tcGcaGYkCxyGHwyR1u4kYNjbLJ3T1lmacwg=; b=qH3ZMeqPGuGqdW2m4sNkWxbIVz
	vLXLff+plaRr+dD4q1vx9BA95llUJkG00tbxU7hELXfUsr3JqD45TNHMODKEHvQOz05itSMV5Bxz+
	/WcC8y0I4UDFK7ep0zo9NFfPdSBGIpV+5CuJs6mEGn32Hh3I0Z5ppy/7zZFAF7ou43tdVNCyLmnIC
	+50eLdm74iHUcfT2vmnku9LHrkH5f+7Jo9+JzwPc+VYOXK9OUtZfpguY1vWtMh7a7mcRHzJN2YMyx
	hzKMufQWoiNtIIoNF6gEL1skiXlQtzsieNx9Dj+NltWujH4bNd5jKO2hitYNGXFa9fZFAyuY60yCb
	zBbfELuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGLh-0000000GXR3-1X80;
	Fri, 23 Oct 2026 14:34:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGLg-0000000GXQi-07SX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:34:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F24AA60200;
	Fri, 23 Oct 2026 14:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605901F01825;
	Fri, 23 Oct 2026 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792766062;
	bh=TRfZVZt4tcGcaGYkCxyGHwyR1u4kYNjbLJ3T1lmacwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YE+jlkkdjVyLffJ9mFnWXu8HQlNbNTlntAcB2y5n2toyCWGzsRIAA8Vcig9DJ1R3n
	 YxE92SVj8T3Gy59VC6pz7TG/xckQE7nvNK6dHi1l3+wONC6F8EspwbYL/bgSvpkhr1
	 IUhoKhbqeIJ59EQq559628xtdt5Zr/1DelAh4vbUW6QTuyq/CvbhI8eAqAX1p1jcR1
	 HzInNT3CBny3BObQPYkmIcMQnyxCy5mNm/Ci4XccPhxUrl0/2WWgHeX0thrcl4oCmB
	 m2w1X9tguph8kKMxPjTM9+FJBidT8kSMNcI6/ME+2/rwYs7rX9B69tzyxPPDHnOXTB
	 6nBarPoINR7iw==
Date: Fri, 23 Oct 2026 15:34:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] pmdomain: arm_scmi: Skip domains that fail
 initialization
Message-ID: <20261023-sympathetic-raptor-of-domination-c03cdf@sudeepholla>
References: <20260923101608.4180057-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923101608.4180057-1-sudeep.holla@kernel.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ulf,

Not sure how, I seem to have used your kernel.org email on this
couple of fixes I had. Let me know if you want me to repost with
Qcom email id.

On Wed, Sep 23, 2026 at 11:16:07AM +0100, Sudeep Holla wrote:
> pm_genpd_init() can fail while allocating generic power-domain state.
> The SCMI driver ignores that error and stores the partially initialized
> domain in the onecell array. Provider registration then fails because that
> domain was never added to the global genpd list.
> 
> Preserve support for partially available SCMI power domains. Log the
> failure and leave the corresponding onecell entry NULL so the other
> initialized domains remain available. Explicitly skip empty slots when
> unwinding provider registration failures.
> 
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 3d73aef21d2f..00192472f325 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  		scmi_pd->genpd.power_on = scmi_pd_power_on;
>  		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
>  
> -		pm_genpd_init(&scmi_pd->genpd, NULL,
> -			      state == SCMI_POWER_STATE_GENERIC_OFF);
> +		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
> +				    state == SCMI_POWER_STATE_GENERIC_OFF);
> +		if (ret) {
> +			dev_warn(dev, "failed to initialize domain %d: %d\n",
> +				 i, ret);
> +			continue;
> +		}
>  
>  		domains[i] = &scmi_pd->genpd;
>  	}
> @@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  
>  	return 0;
>  err_rm_genpds:
> -	for (i = num_domains - 1; i >= 0; i--)
> +	for (i = num_domains - 1; i >= 0; i--) {
> +		if (!domains[i])
> +			continue;
>  		pm_genpd_remove(domains[i]);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

-- 
Regards,
Sudeep

