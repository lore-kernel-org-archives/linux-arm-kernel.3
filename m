Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C311C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pgGRsyWGB27M3bJAc9wfaUAq75se7AWO1ZiC6dAz88=; b=FhIc7o9r6iCav9RO0n+ubFtUS5
	qTWAotHGKJ1HXH4IpiJNSvA5dfbGtJnrepSL0o6SVNcIN2lN1UjilguElgJCWqsomPEuHh6WxGtoz
	gU1YCcBQM6b0GyaCOK/hvTkEWhbUyRGETFi1FIvcKCHt8uKroGZ8zj5/ZFdQF9q87jXLUXpANpYRY
	WygaduJnC54AOjqReXFt5ExpQg4Z6jRjhtzx3soKo54swq92znOwOdxkifErAO+JZ+ZLKpldrZ7B9
	nFLPAg2Rw+PY9nYMjwJRdYTqKEe4vLf9cDYxns0Uf2kdDiSdH2lucd0C8WqCIN+FoYSahP197zgWY
	HczFGyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx3n-000000084DY-12QN;
	Mon, 20 Jul 2026 23:06:07 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx3k-000000084D8-3UCi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 23:06:06 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.226])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wlx3d-00062W-NS; Mon, 20 Jul 2026 23:05:57 +0000
Message-ID: <0e117330-36ed-4917-8a63-384d1e4f77fc@trager.us>
Date: Mon, 20 Jul 2026 16:05:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] arm_mpam: Initialize all of struct mon_read in
 mpam_restore_mbwu_state()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-8-ben.horgan@arm.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260710115546.29644-8-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_160604_881641_9388E44E 
X-CRM114-Status: GOOD (  15.88  )
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

On 7/10/26 4:55 AM, Ben Horgan wrote:

> m->err may be read before initialization in __ris_msmon_read() when called
> from mpam_restore_mbwu_state().
>
> Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
> the spelling of mbwu in the name.
>
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index a49f426aefc0..c9adc450f087 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1640,7 +1640,6 @@ static int mpam_restore_mbwu_state(void *_ris)
>   {
>   	int i;
>   	u64 val;
val is still uninitialized. Its passed to to __ris_mon_read() below 
which does *m->val += now;
> -	struct mon_read mwbu_arg;
>   	struct mpam_msc_ris *ris = _ris;
>   	struct msmon_mbwu_state *mbwu_state;
>   	struct mpam_msc *msc = ris->vmsc->msc;
> @@ -1653,16 +1652,18 @@ static int mpam_restore_mbwu_state(void *_ris)
>   			return -EIO;
>   
>   		if (ris->mbwu_state[i].enabled) {
> -			mwbu_arg.ris = ris;
> -			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> -			mwbu_arg.type = mpam_msmon_choose_counter(class);
> -			mwbu_arg.val = &val;
> +			struct mon_read mbwu_arg = {
> +				.ris = ris,
> +				.ctx = &ris->mbwu_state[i].cfg,
> +				.type = mpam_msmon_choose_counter(class),
> +				.val = &val
> +			};
>   
>   			mbwu_state->reset_on_next_read = true;
>   
>   			mpam_mon_sel_unlock(msc);
>   
> -			__ris_msmon_read(&mwbu_arg);
> +			__ris_msmon_read(&mbwu_arg);
>   		} else {
>   			mpam_mon_sel_unlock(msc);
>   		}

