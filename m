Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4031CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpjh3eu54YfHpN/q6BYiqcSppbbrniN4gWH3kNAk2Xk=; b=RYpT39E/gOTgeTv4kXKouGx8dC
	kNdsRLTeHURkNWJvC8SDaE6LY/G1UgIsqaSWCMgJbCHst1E8jWa+L21VBoQsmv9IVn9s6FMJn/S8z
	+3PWwh8QNrEPxs4qteSEyFfw1nAVoIGXUXRJIipPzuXAtJHdTQEXzBAfLoEnq56/mUsVLAH1DOFw6
	PkTSFIVWN+cr397WZeIqZj1kjg/a9PpRpJFfsnp5HCy3cIr/0BaqZosw8IQUiNZBcuHWMruQKhPZ3
	x//o8yixHhuzProgueecvBcGphSvPa96rT56aLOey1T9pGjCYhB4CnghuPuyUt0S6vTtLNlrkFa2H
	M7mmKMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCezK-0000000BspN-0ank;
	Fri, 02 Oct 2026 15:15:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCezH-0000000BsoG-2HvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:15:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D078F143D;
	Fri,  2 Oct 2026 08:15:46 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 244353F85F;
	Fri,  2 Oct 2026 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954150; bh=iakz7poMJpgb4bw15P/OQM2oL+nxxLe3U5uJbeo3LrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=arA/J/WZ+w6g8dMXcS19DNm8BTe1LBTPxqOT6bKORmxHtiqVvudln81TTLXydbblB
	 lu32Vhz8cct+Xq0RSjCx2WromK43ppQ0m3Qh2240HLaN0w2XL6hqrm0MGk3kSlu+Ge
	 sqO+COS3NDCpJoP+s5pMkW4DhWwDwItpeb8LMkx8=
Message-ID: <b0c756ac-7dec-4b9f-a9e4-16c16a890cec@arm.com>
Date: Fri, 2 Oct 2026 16:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] arm_mpam: Initialize all of struct mon_read in
 mpam_restore_mbwu_state()
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-8-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-8-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081551_633498_7C900C78 
X-CRM114-Status: GOOD (  12.00  )
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
> m->err and *m->val may be read before initialization in __ris_msmon_read()
> when called from mpam_restore_mbwu_state().
> 
> Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
> the spelling of mbwu in the name.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 62562ce2f9aa..cdc2d9d19e19 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -1672,14 +1672,17 @@ static int mpam_restore_mbwu_state(void *_ris)
>  			continue;
>  		}
>  
> -		mwbu_arg.ris = ris;
> -		mwbu_arg.ctx = &mbwu_state->cfg;
> -		mwbu_arg.type = mpam_msmon_choose_counter(class);
> -		mwbu_arg.val = &val;
> +		val = 0;
> +		mbwu_arg = (struct mon_read) {
> +			.ris = ris,
> +			.ctx = &mbwu_state->cfg,
> +			.type = mpam_msmon_choose_counter(class),
> +			.val = &val,
> +		};
>  
>  		mbwu_state->reset_on_next_read = true;
>  
> -		__ris_msmon_read_locked(&mwbu_arg);
> +		__ris_msmon_read_locked(&mbwu_arg);
>  
>  		mpam_mon_sel_unlock(msc);
>  	}


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

