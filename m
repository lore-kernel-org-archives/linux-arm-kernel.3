Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BBDC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drA4MbAbfA7Yk2ZplEVuf7AbjA5LPX00J45ZkvRmoLA=; b=bzOC9lkJSz4yHH1l115etiGvYX
	Cx/CoG4KFix/qUr8YARK56+wj7xAm5s4JZOUyVQ2rOcgD5nI92blF8FAsoKsWud5zTab8K5r2zElv
	LxPvOg+E+wmI+8YsIlRFzNWjF8fcdw0sLqwdrrv1deFWmxWDqMHqUDQpkvfbrXFabWhS3CLkOwiH9
	nq7veU2N2BV0u2apBfYTJC+tBgMcVjE6FIo/XsEGu2AEIJeg99JdMfvprdh7dqozVEoxoy98GYKn6
	5A5yQ/1F/5Osy+gmeRoSUw2gIz17qfna113YQtd/TEqzjqFhDitwYXrqAXeykcaqh/cWzpc5+t5Sa
	fNndxDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54DF-0000000HEU2-42p3;
	Fri, 11 Sep 2026 16:34:53 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54DD-0000000HETJ-1L9x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:34:52 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso897346a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789144490; x=1789749290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drA4MbAbfA7Yk2ZplEVuf7AbjA5LPX00J45ZkvRmoLA=;
        b=nS8vU7qOhWhAg+NPKSzNubjfT2gkUCWMTJRJgk8zB5QuOayOteRECbf/SHUSKup/5Y
         Q7C5tMgBhVj3TxszmYc5Owzrt5cXYzNL9jxj1lk3QlFbk3wsKMIiQkbTrIcdLCLNAKCW
         eeMNd+Egivgo8sHXeC1gvAz3J97R5j6xQuJfl/3zZDAd6l2qCIJbx2ZDXAApS30JeK2D
         u9ck44NlaH31/LRgkPwj2D5z5xEcKoy4g1mtTvu7CZSzrv83vZ0Y0tIg4+BI8eCEkElB
         lRjZBJRZraZvEPav4SAZXTMPwhIzx483qii7M47ERl0ZptrksnlD6wTPMeQHxdulzEmZ
         btDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144490; x=1789749290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drA4MbAbfA7Yk2ZplEVuf7AbjA5LPX00J45ZkvRmoLA=;
        b=CAWTA+NgWGjjR/V67pTGnGFocAPn7gM+6kLSlIHTPu4MjG/KcpKp27ZRNErjXjM3Vd
         hxVlodF4znQzv8sV8+BviWvxQSu+kNjoA/Tf29EsuPWdDlccMw1IjHkEywXLZhawo2af
         bvO8R2hLQjrcJ+SN5YCkzCB2jAUuN7upxH/TJO2vWbyDl5siRhzOL4gS3sYwGdQ0lugj
         ahp7OsBy+/8N5nzmgsPDklRr63+JFu+I3L6brf0sDyogLjSQww5gGOZdyITfay/lswlW
         0js1PhCwaUlbHS/d4f/7yBWM0dfpxkXYrWIZag58ngWha5p9P0vKcdsg+Hy/DoPDWwjW
         MF6Q==
X-Forwarded-Encrypted: i=1; AKwUvByGeGLwB86HBC80dRNzH+kz6r8ZnqaVyfmIIWUc3xcXmlnQ9W3cfZsAN461X6tpF9kOD9OGMm3auVjFopDtoM7Z@lists.infradead.org
X-Gm-Message-State: AFuF++kob0QN++x1K5vm0V1z+Bsm9myFvb8OIcrMpyxsmMoSvoxKPk2m
	WgRKu/9H6I0OiOzN84MQ0+NODVXL5loUEfNMdw7G5K4FGIT/fME2VaUQ
X-Gm-Gg: AYBFou0kNQqTOXm2yjSvyd4+Xh4XJPi72OlAzVaeO5iJlxEq9T4bpsUs5Q2DeT7L5rq
	AkBkLWU8k+vf9zkdHOc5d9YZ/63gejxXIwwjZ362Y5pPPZu3IvUWHfMbqtyz2lWjd12LtZpvKZF
	gWyP0V/ejD0KQI7TP2XWQNGu6GX32fPrYjGw2KDJRgEDnhvLOigoBNGEp0+QqFNT1hAmLsbekQm
	so0VYIKG3yGEZsPPz+QKGSgPGOqUuqXPSMHR4u/aDOgs/MhGz5yTcvoV+kERe+IYjLNg6JMCu4q
	yAYcVmMEYPIrTwn4/bP4rUiPb6ieNwbNTZ8nZcTbLKmys8uBLecXGeH2O/jQ99rgtP/81yI80/m
	pJ4yfOHCDiQpJnikz8i3cnjB+UuaucqYHZlNafBtmWkIbSkPs/w5q0IZj3KuwQuWI4KN9oRk+eo
	lPbWCmyMYk+mP77nqKJVMp4my/ZSEbY48nnY84Rc8+auUoFKRw4DypXXEcunHLGGwbypCQ3tKNv
	zJWpkfr1nyNzjoEc4Nw4fslLHJENtFLVV4CI67HpFrog180nA==
X-Received: by 2002:a17:90b:498c:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d9bbfa327mr9043413a91.5.1789144490077;
        Fri, 11 Sep 2026 09:34:50 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d6b08sm6058803a91.8.2026.09.11.09.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:34:49 -0700 (PDT)
Message-ID: <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
Date: Fri, 11 Sep 2026 22:04:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_093451_368714_E2CD12B5 
X-CRM114-Status: GOOD (  28.99  )
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

On 07-09-2026 16:46, Ulf Hansson wrote:
> At the point when the PM domain and the topology are registered through the
> genpd subsystem, it's not really known whether corresponding CPUs are
> online and thus if the PM domain should be initialized as powered on or
> not. Instead this information becomes available when the CPU devices gets
> attached to their respective PM domain through dt_idle_attach_cpu().
> 
> This is a problem when using PSCI OS-initiated mode, as we may end up with
> a PM domain that has the genpd's status indicating it to be powered on,
> while it in fact may not be the case. In the less severe scenario, this
> leads to selecting a shallower domain idle state for the PM domain than
> necessary. A more critical problem is when a non-CPU device shares the PM
> domain, leading to their corresponding drivers not being able to trust the
> status of it.
> 
> Let's fix these problems by initializing the state for the genpd's to be
> powered off and in the deepest possible domain idle state, when using
> OS-initiated mode. The support for ->sync_state() is maintained by setting
> the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Fix a bug in the call to pm_genpd_init().
> 
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3..4d8c63d329c2 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	 */
>  	if (use_osi) {
>  		pd->power_off = psci_pd_power_off;
> -		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> +		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
> +		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
>  		if (IS_ENABLED(CONFIG_PREEMPT_RT))
>  			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
>  	} else {
> @@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	/* Use governor for CPU PM domains if it has some states to manage. */
>  	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
>  
> -	ret = pm_genpd_init(pd, pd_gov, false);
> +	ret = pm_genpd_init(pd, pd_gov, use_osi);

If CONFIG_PREEMPT_RT=y,

psci_pd_init(use_osi=true)
  -> sets GENPD_FLAG_POWER_UNKNOWN
  -> sets GENPD_FLAG_RPM_ALWAYS_ON
  -> pm_genpd_init(..., is_off=true)
  -> genpd->status = GENPD_STATE_OFF
  -> RPM_ALWAYS_ON + OFF is rejected (pmdomain/core.c: pm_genpd_init() 
				      rejects an RPM_ALWAYS_ON domain whose initial state is OFF)
  -> return -EINVAL

Therefore, on a PREEMPT_RT platform using OSI and hierarchical PSCI domains, psci_cpuidle_domain_probe()
should fail while initializing the first domain. The genpd providers are then unavailable, so 
dt_idle_attach_cpu() fails during PSCI cpuidle initialization and the driver rolls back its CPU
registrations.

I don't have a device on me to test this path, perhaps one of the QC devices + RT config
can reproduce this?

Should PREEMPT_RT case instead initialize these domains as ON?

This might be safer here atleast:

ret = pm_genpd_init(pd, pd_gov,
		    use_osi && !IS_ENABLED(CONFIG_PREEMPT_RT));

Regards,
Dhruva

