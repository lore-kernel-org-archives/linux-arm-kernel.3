Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849EFCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uYAZ5xpTdukFx6n1PPLkaWN4RJ0DPcWf9/7eQpm6NU=; b=DW4DiQcpKQ13k1DQkYPYpQp5a6
	MFgv2bLHcGY5aIMQqc15GDJY47phQ/0cOmfj59SUCXyvuVLt/NREn1H2EaN9SpcfuSoB3PPsE4J2e
	aHDUtmem99PSrvrNWtBNCdWY13MnHEqWEF7df7NMpldSsYHxNdRrXRKmsWeSNMgjRLAIPqyMHOwHT
	kfPTkh6FT7wlgM6ONcuD/ewHmYnbwszg51O8uu1UL9m+Lxmjeuzt8A6VUnrSd5m5UYrAv8sEq/m1f
	KOKxTH0CJFGHCq21yZoewYMFbo9ghWhoW8AeIJ3h2VxtNMj4Fm6tltxY9Qzw064qhovdnrplQSK+6
	8hTgQFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHJh-00000001256-0u1D;
	Tue, 19 May 2026 10:04:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHJe-0000000124c-36yI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:04:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418112008;
	Tue, 19 May 2026 03:04:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76AE03F85F;
	Tue, 19 May 2026 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779185085; bh=ch2K1is+ZokQ/np75YnpANDr6DrQEd/ob6OQOR/rCxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQlhvxXI4yYI0XE8Pwic2nBsFTHhpGvQZ/xyF0louoF6SuIJwF+hJmMH42wj+Fm9h
	 rJqhd7Xv4zFUDZdl0sfLkJAkaXOO65sj8PWfGrc4lX3Oo0eCGUjZakEWbpjusDw+CI
	 a524l2Z6XazJ19jH8N2oLpMYv30/PHqPm3ac0Zlc=
Date: Tue, 19 May 2026 11:04:41 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
Message-ID: <agw1ueCQ0WjoBX7-@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_030446_884610_0A55797F 
X-CRM114-Status: GOOD (  20.99  )
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

On Sun, May 17, 2026 at 08:02:43PM +0100, Sudeep Holla wrote:
> Powercap protocol v2 keeps local enable and last-cap state per
> domain. Some public operations indexed that state before checking that
> the supplied domain id was valid, and cap_enable_get() updated it even
> when cap_get() failed.
> 
> Validate the domain before touching the per-domain state and only
> refresh cached enable state after a successful cap_get().
> 

Hi,

> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> index ab9733f4458b..eb5c35cad026 100644
> --- a/drivers/firmware/arm_scmi/powercap.c
> +++ b/drivers/firmware/arm_scmi/powercap.c
> @@ -453,10 +453,14 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
>  		return -EINVAL;
>  
>  	/* Just log the last set request if acting on a disabled domain */
> -	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 &&
> -	    !pi->states[domain_id].enabled) {
> -		pi->states[domain_id].last_pcap = power_cap;
> -		return 0;
> +	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
> +		if (!scmi_powercap_dom_info_get(ph, domain_id))
> +			return -EINVAL;
> +
> +		if (!pi->states[domain_id].enabled) {
> +			pi->states[domain_id].last_pcap = power_cap;
> +			return 0;
> +		}
>  	}

Yes, definitely better.

>  
>  	return __scmi_powercap_cap_set(ph, pi, domain_id,
> @@ -637,6 +641,9 @@ static int scmi_powercap_cap_enable_set(const struct scmi_protocol_handle *ph,
>  	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
>  		return -EINVAL;
>  
> +	if (!scmi_powercap_dom_info_get(ph, domain_id))
> +		return -EINVAL;
> +
>  	if (enable == pi->states[domain_id].enabled)
>  		return 0;
>  
> @@ -678,16 +685,20 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
>  	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
>  		return 0;
>  
> +	if (!scmi_powercap_dom_info_get(ph, domain_id))
> +		return -EINVAL;
> +

Ok.

>  	/*
>  	 * Report always real platform state; platform could have ignored
>  	 * a previous disable request. Default true on any error.
>  	 */
>  	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
> -	if (!ret)
> +	if (!ret) {
>  		*enable = !!power_cap;
>  
> -	/* Update internal state with current real platform state */
> -	pi->states[domain_id].enabled = *enable;
> +		/* Update internal state with current real platform state */
> +		pi->states[domain_id].enabled = *enable;
> +	}

Mmm, this changes the logic as stated in the above comments...now the
problem is recalling WHY I adopted this logic :<

Thanks,
Cristian

