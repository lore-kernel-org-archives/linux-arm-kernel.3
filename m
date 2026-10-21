Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C85606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZRzHyx0u;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CtwAc54H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIYBFbjC/JqHo0qDK7NxuyTwTfuFB9bR24RyXwEbtJw=; b=ZRzHyx0umWFPpfV2R3htuV4Pjm
	6jCOWTBK+bkyWFPupPmDDbP7upJfTOPb0Nt+uw6em5SFhHY9hRfh97TCeQ6gwFIX0h/0185HfRdhk
	bbTorzmeFz6E2WfyXEMGNGq4d9P6epjOI6atlMI6kfW6xg9QNCWvo1UamRCNrEuX9h1V5EiYO/lIu
	/CXoeb4zE/tGVx+vcu+aTzRFiwIvkOCu6UBO4aeF3+8LM9fRj23wylqiMKhyIFOjUqFhDg1RW6hIO
	cNjoZRVfiMVODbqqYwroaCO/isyDchWjn2dpyZkGAke1VJbEZehYA6zSJv415aJmxDiXydsrKH0bY
	rlSQqFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSCg-0000000BQOe-0pxp;
	Wed, 21 Oct 2026 09:01:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSCd-0000000BQOE-1Ha2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:01:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1898C1476;
	Wed, 21 Oct 2026 02:01:36 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423013F7B4;
	Wed, 21 Oct 2026 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792573299; bh=IF9maRMh0ugYhaWVRkx0qEpMGhQizVGkaK12H+FqOb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CtwAc54HU8054fUIqwxPvGqgDv1y8BiPTMukHE8vK7E3wsJAPqkZVb4s19U8s5WyL
	 r/cDYTKzp2qSTXixDwHCWkXzNrV/0xX0IUGLysYCa7DlSmdDe8MrLQRXs5LWaik5Pa
	 /thsOstjqTY2LxEUh1k4dkl8p/uYx8Q1VSfnYMrQ=
Message-ID: <f73ab1cf-490e-4e81-8307-92f5eaae12c7@arm.com>
Date: Wed, 21 Oct 2026 10:01:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: andre.przywara@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_020143_415717_528B6338 
X-CRM114-Status: GOOD (  18.63  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 20/10/2026 12:48, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.
> 
> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>

Thanks for this. Looks like this was a result of the conflict between the MPAM-Fb series and my
minor fixes series.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Cheers,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..c067b6d57d71 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>  	struct mpam_class *class = ris->vmsc->comp->class;
>  
>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> -			return -EIO;
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
> +		if (ret)
> +			return ret;
>  
>  		mbwu_state = &ris->mbwu_state[i];
>  		cfg = &mbwu_state->cfg;
> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>  
> -		if (!mbwu_state->enabled) {
> -			mpam_mon_sel_unlock(msc);
> +		if (!mbwu_state->enabled)
>  			continue;
> -		}
>  
>  		val = 0;
>  		mbwu_arg = (struct mon_read) {
> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>  		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  		if (ret)
>  			return ret;
> -
> -		mpam_mon_sel_unlock(msc);
>  	}
>  
>  	return 0;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad


