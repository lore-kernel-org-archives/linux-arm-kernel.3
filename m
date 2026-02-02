Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0711E7315D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEc8TvjnHa5ctWLyR7nKKcSQVtFV4OpS/QLW1YcL9eM=; b=Sc0YBmj/hTMgIy8OJqo0ZpuJ/t
	r1u9krN8lSkAZZCU9CVJA8l5hgVJrRsFvlyBt2gFVx5HWdAbW7xYzLFK5BWCGmsD2kfeyBBBVmhip
	LVh3jxuJdW7Z31nYhreHCCHax82Q3zfB8uL3TjFfnqiXIlJbXwv2oqzUyM18V1cQWrIV9voVMKkJC
	OqBzthShKnCptqCPLtYCUZ9z9t3YfNRDe5minYvqAJ2rTkGX2SSWlRSWpljDz8bXm3puj6pip4dmg
	v50eavh4XNpxCtR2gCil62IDJh3kdYT/pAW56aoq2q08NJf0Xbfcs6fdzFaEOaUmvq0cSReadtXJg
	v7l5Xnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtSB-00000004yQF-1mNP;
	Mon, 02 Feb 2026 12:54:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtS7-00000004yPY-2GkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 12:54:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B82DE1A2B9D;
	Mon,  2 Feb 2026 12:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 887B360767;
	Mon,  2 Feb 2026 12:54:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58917119A8891;
	Mon,  2 Feb 2026 13:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770036879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uEc8TvjnHa5ctWLyR7nKKcSQVtFV4OpS/QLW1YcL9eM=;
	b=O0uWghrHWXwaACUvUJKHzbTu4QLw59L0R/2S+wlYL3pxoyfqk9f0c54BD6+7bowN2+12Ss
	awylkXRFZduyC7o/tZRzRy2Y+FvEl1fsjer/2iNtWqE/oeazmwF3OdJC12pTpFjuFmM6d+
	SYqN8LApm6ddErnuQWEuzOo1BYdvSHbo1dsSl9jtjZA5xK06bTDVCqU3aFNMMOC5oduXzS
	MeezuuwwWFo2CucaaYP2gfY8ktltTJ2J4ubZEYqcAr2ahRPaIxtr9G64JSWFY/FtIQG18m
	sr5VJPZ5L4V3rQ7mAIYfmfJxvp4PfwYEagT1VRqllmmwKQRaI87K3GNxXGD59w==
Message-ID: <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Date: Mon, 2 Feb 2026 13:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
To: Christophe Leroy <chleroy@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_045451_719555_9D0434D0 
X-CRM114-Status: GOOD (  26.21  )
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

Le 23/12/2025 à 08:25, Richard Genoud a écrit :
> When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
> fq_table[fq->idx] state and freeing/allocating from the pool and
> WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.
> 
> Indeed, we can have:
>           Thread A                             Thread B
>      qman_destroy_fq()                    qman_create_fq()
>        qman_release_fqid()
>          qman_shutdown_fq()
>          gen_pool_free()
>             -- At this point, the fqid is available again --
>                                             qman_alloc_fqid()
>             -- so, we can get the just-freed fqid in thread B --
>                                             fq->fqid = fqid;
>                                             fq->idx = fqid * 2;
>                                             WARN_ON(fq_table[fq->idx]);
>                                             fq_table[fq->idx] = fq;
>       fq_table[fq->idx] = NULL;
> 
> And adding some logs between qman_release_fqid() and
> fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.
> 
> To prevent that, ensure that fq_table[fq->idx] is set to NULL before
> gen_pool_free() is called by using smp_wmb().
> 

Tested on a LS1046A based board.
With this patch, the warning is not triggered anymore.

Tested-by: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>

> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>   drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> NB: I'm not 100% sure of the need of a barrier here, since even without
> it, the WARN_ON() wasn't triggered any more.
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 6b392b3ad4b1..39a3e7aab6ff 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
>   
>   void qman_destroy_fq(struct qman_fq *fq)
>   {
> +	int leaked;
> +
>   	/*
>   	 * We don't need to lock the FQ as it is a pre-condition that the FQ be
>   	 * quiesced. Instead, run some checks.
> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>   	switch (fq->state) {
>   	case qman_fq_state_parked:
>   	case qman_fq_state_oos:
> -		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
> -			qman_release_fqid(fq->fqid);
> +		/*
> +		 * There's a race condition here on releasing the fqid,
> +		 * setting the fq_table to NULL, and freeing the fqid.
> +		 * To prevent it, this order should be respected:
> +		 */
> +		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
> +			leaked = qman_shutdown_fq(fq->fqid);
> +			if (leaked)
> +				pr_debug("FQID %d leaked\n", fq->fqid);
> +		}
>   
>   		DPAA_ASSERT(fq_table[fq->idx]);
>   		fq_table[fq->idx] = NULL;
> +
> +		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
> +			/*
> +			 * fq_table[fq->idx] should be set to null before
> +			 * freeing fq->fqid otherwise it could by allocated by
> +			 * qman_alloc_fqid() while still being !NULL
> +			 */
> +			smp_wmb();
> +			gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
> +		}
>   		return;
>   	default:
>   		break;
> 
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

