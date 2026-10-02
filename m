Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9013CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gg7U2x2IZp/OJGjfGFYpNFCTTeGZoPy58UqTMIpGBc=; b=SfDxvxvXbRi5IxfD/J4A58yjyM
	aMd1vavFEEnTY9jgYwMrIEwJ4/1+PZK4QKTBdFUPhWS23nnjzA3R3HY2KI+0CrRIhd/99AW7IhY8J
	zcR7z97sR93ox2usFfulHowFfDoUYv9/bCw4DDoC9FfJBWf6hK1ESQtDYTHp2FZhxXtMPmrYidv6e
	cpmecYVHeDNy+WVmISBblpyBIhX1r5kf8ouwCB7ASRwyuPA1rJfw1E/19wqdx4TNBjrSkaieOadn1
	37bQRrQSURg3XzLLsdBGE6Bt1lXfzTK8bS3Dpn21V5oCb5yB0HgwjFyO7JNq4BNufSOvvzYCrOKXC
	MhEB6TKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1W-0000000BtIW-3fCk;
	Fri, 02 Oct 2026 15:18:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1T-0000000BtHk-1t7S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:18:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C513143D;
	Fri,  2 Oct 2026 08:18:03 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3B433F85F;
	Fri,  2 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954286; bh=QY7JUXndpEa/tJCGaH2qcR+1m6vm1dEsYp+MGwdzjHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tweEO7yz7Qco3Mfyl6HiJkOw9TnKEfFX6StLOV0sHSjBPkL0JWAiCeTX2os4PYy0e
	 wCenOui266a9CbPN9oyFV7l5aRRJchK/GjqSVTfwhi8EsnBQDi1as5RNUUtL0OplfX
	 G32X2UL8qqo4Rn5Uliqp13NjdccMDGAjANjnbfGo=
Message-ID: <01e3c08b-8127-46ac-9d88-0e289f7ce2c1@arm.com>
Date: Fri, 2 Oct 2026 16:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the
 maximum possible amount of PARTIDs
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081807_543667_9764A48D 
X-CRM114-Status: GOOD (  14.00  )
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
> On a theoretical platform with the maximum possible number of usable
> PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
> mpam_reprogram_ris() will never reach their termination condition leading
> to a system hang when register the cpu hotplug handlers when MPAM is
> enabling.
> 
> Fix these loops.

Ha! MPAM's mixture of num/max fields is really annoying.

Looks like we never loop over the PMG field.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index cdc2d9d19e19..10fc5168699b 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1754,7 +1754,7 @@ static int mpam_save_mbwu_state(void *arg)
>   */
>  static int mpam_reset_ris(void *arg)
>  {
> -	u16 partid, partid_max;
> +	u16 partid_max;
>  	struct mpam_config reset_cfg = {};
>  	struct mpam_msc_ris *ris = arg;
>  
> @@ -1764,7 +1764,7 @@ static int mpam_reset_ris(void *arg)
>  	spin_lock(&partid_max_lock);
>  	partid_max = mpam_partid_max;
>  	spin_unlock(&partid_max_lock);
> -	for (partid = 0; partid <= partid_max; partid++)
> +	for (u32 partid = 0; partid <= partid_max; partid++)
>  		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
>  
>  	return 0;
> @@ -1811,7 +1811,6 @@ static int __write_config(void *arg)
>  
>  static void mpam_reprogram_msc(struct mpam_msc *msc)
>  {
> -	u16 partid;
>  	bool reset;
>  	struct mpam_config *cfg;
>  	struct mpam_msc_ris *ris;
> @@ -1835,7 +1834,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
>  		arg.comp = ris->vmsc->comp;
>  		arg.ris = ris;
>  		reset = true;
> -		for (partid = 0; partid <= mpam_partid_max; partid++) {
> +		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
>  			cfg = &ris->vmsc->comp->cfg[partid];
>  			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
>  				reset = false;

Reviewed-by: James Morse <james.morse@arm.com>



Thanks,

James

