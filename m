Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE2DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2rrjtFYCNa+l0opUFsEhFJAlzA2QKbBJlwN52j4330=; b=coqCj7v+7EUqL8Gv4UhYyVkRzG
	AUpB10lE5JEzKch9D5NfhrnO3e3QufxtXRtpAsoyYh6vIafnv2JecTu/hux9BtYapvsMYc090yrWS
	W11j/ALY8Nimwh05RGmhjldM9g82xhN/yk7Mh1l0BP0gFLhn6m61ebUUadrXboDI28VsO0IEYVER7
	HozIlcrqwOHH0KjFGxRyMqBwxKZ13pK4RAfLTA7JwljN73rg8j9cDKRI3nmxiTtgdnBFtrmGCQDue
	W10zjWb3hJlPZCn99hB0mZL8hImcx7G0Ug8TaUon7S/b19SRVDuX6KXmtG/TOIveeRWDg6T+QRqJF
	KqnSPJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOwl-0000000FK9y-0tht;
	Wed, 11 Dec 2024 15:48:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOur-0000000FJeu-0Ti8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:46:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-435004228c0so30526285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 07:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733931979; x=1734536779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2rrjtFYCNa+l0opUFsEhFJAlzA2QKbBJlwN52j4330=;
        b=I6T2D+Oa6HZqo8L9/QuFcAVwsDoGNdJLp/pOcnLbMZ2tGx9FUpgbUqc3AVBbh0vwRe
         pOXuc7SAQ0NIdBFgNJUSOd0z7wVZWuRESvrDq3uhbwIsL5UQYJLQCqtFvHrnRZx+JaqI
         tqbdgjclC+nzeATorYsZEiEzuBDC/Y0++tGKyXGETaUwb5yAsVekWnzNy7dmHkWj4G5g
         pdcIBV1BZNNsxBFrW6d6NW5IoEEb1WVbtZEiqbQLPX9duPoFbS5etjHcb06Sus/+Ckbk
         OPe+mMg1cInXZbSQrQdmcfum2tn5Z9YQn8CZ3oKcWjiZZNSLQiQJq+Yq40st9bLQ7Fth
         aAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931979; x=1734536779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2rrjtFYCNa+l0opUFsEhFJAlzA2QKbBJlwN52j4330=;
        b=B/TcOIMzMjrk/LtKDOM+NGMQqH2GTjLpf4mdcAIsAYTRC4kn2gLKqlK+HlUBWtJAZN
         00sxLNotH4oWGyTZtGYPpRQPLirgO5VSY5dEjtERMoqbdaq/SxXWhFmQaSYnvfqBC436
         Zq17Y4z0/WiMBOkSgaokaRBGV655UNycRSVmZdGq/mXVQJjfZ16Jb7XzKdWJVDiY86Eu
         JrzobBNEZuqEzd8x36DousTbno3a6oOOr9jCgwEkOTHEumL0AKY00RYHV+DgVPsOTrvz
         R2UWdrXzCDbHg70jid7Zh4ZzFUF4adDViBAOAOeB6pZgwsrEWhFSoPbmAFT/xi//6Yst
         aIaA==
X-Forwarded-Encrypted: i=1; AJvYcCWwSVja80H43ToZVjJ9oAMMKHAnTPXegYuKIwrkwZXaWm4Hu1FbcCnaVsHMzWlr/vNDkbQs+mzvOpoGcQf0RMGD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrlbe9VU1mx70LF8X4csnmkpTOy7h83dNuQwxYYMWXEqIsYJ1R
	H7ax8n0HzEPcBAAaBIURIFhPjgxW3FBnP6yc8qUgNpfl/0CrIyLQeKoZpc66nks=
X-Gm-Gg: ASbGncvNNDCz97ZgtFymJY9sjRIotKfQVTuIic8jEnjkE+crjirebOicAbYhSmyqVtV
	SPsPbvdoQ4/bfawaiLzV+GXhtsBNueCragHt1ORvUksCx6LMprl8YslP3Y4HMqLqLhRoqinFoGx
	z5sbK0q/yV1OvVNg1k2MgHsurXatVIbD4rIYy7B7Zdv932gkw2HkHZnNbzyMUVMGzS5gUuZmFkC
	5mcBD2XZvZPft3j6X9oh1tLebvFQN3gVOC3zuMkix+MnksP32uZtnzf+YY=
X-Google-Smtp-Source: AGHT+IElAjFrQA1BOKFF5sD8uSomr+adDjCh2fxba5+aLmeIQZ30HWVdJYlj+iWlHcRAJRttZ0NMfA==
X-Received: by 2002:a05:6000:1ac8:b0:386:3213:5ba1 with SMTP id ffacd0b85a97d-3864ce97262mr3126317f8f.24.1733931979554;
        Wed, 11 Dec 2024 07:46:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251dba9sm1532151f8f.98.2024.12.11.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:46:18 -0800 (PST)
Date: Wed, 11 Dec 2024 18:46:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, matthias.schiffer@ew.tq-group.com, robh@kernel.org,
	u.kleine-koenig@baylibre.com, javier.carrasco.cruz@gmail.com,
	diogo.ivo@siemens.com, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v4 1/2] net: ti: icssg-prueth: Fix firmware load
 sequence.
Message-ID: <304870d9-10c7-43b3-8255-8f2b0422d759@stanley.mountain>
References: <20241211135941.1800240-1-m-malladi@ti.com>
 <20241211135941.1800240-2-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211135941.1800240-2-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074621_151389_776A26AE 
X-CRM114-Status: GOOD (  22.66  )
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

On Wed, Dec 11, 2024 at 07:29:40PM +0530, Meghana Malladi wrote:
> -static int prueth_emac_start(struct prueth *prueth, struct prueth_emac *emac)
> +static int prueth_emac_start(struct prueth *prueth, int slice)
>  {
>  	struct icssg_firmwares *firmwares;
>  	struct device *dev = prueth->dev;
> -	int slice, ret;
> +	int ret;
>  
>  	if (prueth->is_switch_mode)
>  		firmwares = icssg_switch_firmwares;
> @@ -177,16 +177,6 @@ static int prueth_emac_start(struct prueth *prueth, struct prueth_emac *emac)
>  	else
>  		firmwares = icssg_emac_firmwares;
>  
> -	slice = prueth_emac_slice(emac);
> -	if (slice < 0) {
> -		netdev_err(emac->ndev, "invalid port\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = icssg_config(prueth, emac, slice);
> -	if (ret)
> -		return ret;
> -
>  	ret = rproc_set_firmware(prueth->pru[slice], firmwares[slice].pru);
>  	ret = rproc_boot(prueth->pru[slice]);

This isn't introduced by this patch but eventually Colin King is going to
get annoyed with you for setting ret twice in a row.

>  	if (ret) {
> @@ -208,7 +198,6 @@ static int prueth_emac_start(struct prueth *prueth, struct prueth_emac *emac)
>  		goto halt_rtu;
>  	}
>  
> -	emac->fw_running = 1;
>  	return 0;
>  
>  halt_rtu:
> @@ -220,6 +209,78 @@ static int prueth_emac_start(struct prueth *prueth, struct prueth_emac *emac)
>  	return ret;
>  }
>  
> +static int prueth_emac_common_start(struct prueth *prueth)
> +{
> +	struct prueth_emac *emac;
> +	int ret = 0;
> +	int slice;
> +
> +	if (!prueth->emac[ICSS_SLICE0] && !prueth->emac[ICSS_SLICE1])
> +		return -EINVAL;
> +
> +	/* clear SMEM and MSMC settings for all slices */
> +	memset_io(prueth->msmcram.va, 0, prueth->msmcram.size);
> +	memset_io(prueth->shram.va, 0, ICSSG_CONFIG_OFFSET_SLICE1 * PRUETH_NUM_MACS);
> +
> +	icssg_class_default(prueth->miig_rt, ICSS_SLICE0, 0, false);
> +	icssg_class_default(prueth->miig_rt, ICSS_SLICE1, 0, false);
> +
> +	if (prueth->is_switch_mode || prueth->is_hsr_offload_mode)
> +		icssg_init_fw_offload_mode(prueth);
> +	else
> +		icssg_init_emac_mode(prueth);
> +
> +	for (slice = 0; slice < PRUETH_NUM_MACS; slice++) {
> +		emac = prueth->emac[slice];
> +		if (emac) {
> +			ret |= icssg_config(prueth, emac, slice);
> +			if (ret)
> +				return ret;

Here we return directly.

> +		}
> +		ret |= prueth_emac_start(prueth, slice);

Here we continue.  Generally, I would expect there to be some clean up
on this error path like this:

		ret = prueth_emac_start(prueth, slice);
		if (ret)
			goto unwind_slices;

	...

	return 0;

unwind_slices:
	while (--slice >= 0)
		prueth_emac_stop(prueth, slice);

	return ret;

I dread to see how the cleanup is handled on this path...

Ok.  I've looked at it and, nope, it doesn't work.  This is freed in
prueth_emac_common_stop() but partial allocations are not freed.
Also the prueth_emac_stop() is open coded as three calls to
rproc_shutdown() which is ugly.

I've written a blog which describes a system for writing error
handling code.  If each function cleans up after itself by freeing
its own partial allocations then you don't need to have a variable
like "prueth->prus_running = 1;" to track how far the allocation
process went before failing.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter


