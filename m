Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vGmu6C3Y;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XKrALMtX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NSvfLE1NFGHuHhVgj8eEQzJdRfw1ghMvfCC3P4c9eM=; b=vGmu6C3YN2yx+3kNinq9ZiY/pw
	xzTmAViPQlS+doURVq+pB93oWt/uploYhyhf39SGajAeEPUUgYAvyZ7eSvr9Xw/giogcVsmFCdqel
	uaW09VAu9cSRMjFmoek/EmdL+pSV2fTT/URclWwiN1rtWkTczrMCCYRQoYMT3OOgXw/iUl8tu5PU2
	sVGFFtEm6zyZ7cFx6C/Kbl5h0YWM8AOvQEOzA59e2wCEJ0GZusJFUXgkVQNmFONJHG+NK/MhI9tu5
	5dPC6EBxmi2xkdasNNIlehxjAIqcJh5oer8s5SJUBo8Z0uUs2tvov7f5xHlMFShKYup/gqqq0sfFm
	PTpT4zRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSaN-0000000BUOz-08NL;
	Wed, 21 Oct 2026 09:26:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSaK-0000000BUOP-2lTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:26:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9EB72720;
	Wed, 21 Oct 2026 02:26:05 -0700 (PDT)
Received: from [10.0.153.134] (e142021.arm.com [10.0.153.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B7B3F7D8;
	Wed, 21 Oct 2026 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792574768; bh=RcUVXWcp7EOL+dU9VEwm/n2B8NbJB9AEP0xAsiqiyiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XKrALMtXRKPK2cxv4moI9F8m0dt+nQW5yilJlFHkn6Ye4o+DQQrU+HPJit16Vn40j
	 4i19cfDR5agLapAUD2dyr4YiTVYHLgCOe4VxLNk+tMcIxefyComHcqmnDOQCZIpeH6
	 wsPSHyaDThCb42a86nbRTmJF1Oh12OKbeJIjqhkA=
Message-ID: <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Date: Wed, 21 Oct 2026 10:26:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com, ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_022612_842011_29027DD9 
X-CRM114-Status: GOOD (  20.94  )
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

Hi,

On 10/20/26 13:48, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.

many thanks for spotting this!

Similar lines were in the last patch version sent out, but as Ben 
mentioned, this somehow conflicted with the other MPAM changes, so it 
got accidentally removed.
The original version always returned -EIO, but we now always use this 
error code inside mpam_fb.c already, so there is no difference, and this 
version here is more future-proof, should we lift the restricted range 
of errors handled in the future. So:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre
> 
> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>   drivers/resctrl/mpam_devices.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..c067b6d57d71 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>   	struct mpam_class *class = ris->vmsc->comp->class;
>   
>   	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> -			return -EIO;
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
> +		if (ret)
> +			return ret;
>   
>   		mbwu_state = &ris->mbwu_state[i];
>   		cfg = &mbwu_state->cfg;
> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>   		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>   		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>   
> -		if (!mbwu_state->enabled) {
> -			mpam_mon_sel_unlock(msc);
> +		if (!mbwu_state->enabled)
>   			continue;
> -		}
>   
>   		val = 0;
>   		mbwu_arg = (struct mon_read) {
> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>   		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>   		if (ret)
>   			return ret;
> -
> -		mpam_mon_sel_unlock(msc);
>   	}
>   
>   	return 0;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad


