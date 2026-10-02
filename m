Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CD5CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHxYBTE1OsKuhsEE6ZrEfxWyEtF/byjSQDlGxJMoKJ0=; b=IwZ/60UnKcFY7ZNrP+L/3xMJ7K
	3Yi1jzcs6r2drma78OzCpGSBZAnszRFzLIkztBdIA9BkWJbsBBPTQVoDnmbB8xbEXds7ioLBUdnKo
	dNk1AunMWMtDA4hfJzGF441B36ZW7KSBMxR6aKXTHZsKa7XxI473y8pv0lQ5c5czCPVzKgpaH6mZk
	QdWCoxwYjxyhbs4THdWVafHo7Sy/y7j/lhgZXH/tUq+KC/Tmz1vnWloStic7k1cVt21gDPXK5E+qE
	/hAM5wg0DNSr5cNu/mQUXex+utxylgueWgEbYOAkHfjkCgQwDlW2rB+4Y3LxGm2rHCRVcLk/2lr8a
	8sQoNlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCewm-0000000BsRL-1yRq;
	Fri, 02 Oct 2026 15:13:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCewj-0000000BsPT-0uOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:13:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7A3143D;
	Fri,  2 Oct 2026 08:13:08 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253603F85F;
	Fri,  2 Oct 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953992; bh=jUwYm8A449oFyERTeHMiXV6Q+jSW+utHZmHcbtHiDIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PyVT89QGatZIIud1XV+UTsOLiIwaLnnaGqTJevACKxSvJns+jdMbQSS0lulFkChIZ
	 WoZDkvYmg5SbAOznG34b7NpQDPc5r/hHWaQ5o38Vtwzdud/hh4BWRGGxfko9WWzduA
	 427KgUdySdoM2Whfrg02/+iyT4QBIPvMCNVaToCQ=
Message-ID: <b61f8b82-a872-4d50-88fc-845287305011@arm.com>
Date: Fri, 2 Oct 2026 16:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081313_920938_E17F5D67 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
> will mismatch when restoring and so the monitor will be reset. However, the
> state may have been lost and so there are no guarantees.

Power management and kexec are the reason this is done.

I have a niggling suspicion that some hardware engineer may allow 'running counters'
to inhibit power-down - which means the cache could stay on when all its CPUs are off.

We may kexec while these CPUs are off. Leaving the hardware in its reset state is
the least surprising thing to do, and also means we don't get bitten by the above
(theoretical) power management thing if the next kernel doesn't know about MPAM.


> Ensure the reset happens by setting the reset_on_next_read

Doing this makes it more robust,


> and remove the unnecessary writes from mpam_save_mbwu_state().

I think this is still a good thing to do.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index d39d210574a6..6cba3ef21cc8 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1652,6 +1652,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>  	u64 val;
>  	struct mon_read mwbu_arg;
>  	struct mpam_msc_ris *ris = _ris;
> +	struct msmon_mbwu_state *mbwu_state;
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_class *class = ris->vmsc->comp->class;
>  
> @@ -1659,16 +1660,20 @@ static int mpam_restore_mbwu_state(void *_ris)
>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>  			return -EIO;
>  
> -		if (!ris->mbwu_state[i].enabled) {
> +		mbwu_state = &ris->mbwu_state[i];
> +
> +		if (!mbwu_state->enabled) {
>  			mpam_mon_sel_unlock(msc);
>  			continue;
>  		}
>  
>  		mwbu_arg.ris = ris;
> -		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> +		mwbu_arg.ctx = &mbwu_state->cfg;
>  		mwbu_arg.type = mpam_msmon_choose_counter(class);
>  		mwbu_arg.val = &val;
>  
> +		mbwu_state->reset_on_next_read = true;
> +
>  		mpam_mon_sel_unlock(msc);
>  
>  		__ris_msmon_read(&mwbu_arg);
> @@ -1701,15 +1706,11 @@ static int mpam_save_mbwu_state(void *arg)
>  
>  		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);

> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);

I plan to drop this line,


> -		if (mpam_ris_has_mbwu_long_counter(ris)) {
> +		if (mpam_ris_has_mbwu_long_counter(ris))
>  			val = mpam_msc_read_mbwu_l(msc);
> -			mpam_msc_zero_mbwu_l(msc);
> -		} else {
> +		else
>  			val = mpam_read_monsel_reg(msc, MBWU);
> -			mpam_write_monsel_reg(msc, MBWU, 0);
> -		}

But keep this. With reset_on_next_read the driver won't consume the stale value, and
that approach also covers the hardware resetting into unusual states.


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

