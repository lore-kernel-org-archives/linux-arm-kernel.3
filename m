Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E8BCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6qFHxqoWBG7IV6u8Cbs7on3ylcj5l0UA0SsRBcTYU4=; b=0X7NqKdbhw3WakGAuAbRlqRveJ
	36lrvQ3lQaQhu+uhvya0X/11EYfVTn8Ftq8m6NehD8ito05Kw1tugNNkEs8kR5MYFP6pUrxm1znFs
	ETY+VNIo/DrDx3/an2LmkhSQYUEyis8rW4Y28Y7gHNgfbO1HYNrXC2I37jRMSsVX1fYatHsSq65q1
	P2kTMmm6mI6Pwtx3/fs2VnPAu4VWjTK8rc+ejaVh8CrHc14TFz6FFwK5mZMpZjr+pPMB+BZC30EgS
	CwT7kmK1NAAY7WuUD7O32RbCcggN7g4wXNjpxWbP9ClR7UFoTenrh6jXMvyMPvMdriSIaa5sKbawW
	E7LLtrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBno-0000000DgCC-41ht;
	Tue, 06 Jan 2026 18:29:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBnm-0000000DgBP-2wzY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 113EB60144;
	Tue,  6 Jan 2026 18:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3793EC116C6;
	Tue,  6 Jan 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724145;
	bh=viOFB4/yDJPmlUVK9aA8lHxdD5KZeK3qCbk9U703L4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SyQv0/FVAuHmLLwaUjLZZIbKRJ0Ehmu9FcOAuL/Te9JbKsrsAcuaCb+Hh5YGxuW6G
	 VkVl8ulqlqE9lEttQE8XxMTMSYEK1D96atzzOY+t6d3yb53OVWzVVs2F2Ptfg7EOAU
	 zeGB/Vs5BjrBO6KddnnwOZJag4OPAytBPKke+X49hvirea36YlOw3RKtTaZ/hhidQ8
	 Rn1333x7VB3pOwB+julHkI3YIxt7CFmNBtmk40LsDlrG0YeDPkkm45Pe7DCpPKl1hw
	 WOFU9KcQzE2WHLhzt+ILx6VR9mPYNNg+IHyLj4uk6TMckdb/PicweYTbTqAwAu5Mp3
	 yFArfhjPITKdA==
Message-ID: <da2988cf-8f4b-4f85-a915-d83ebcb9923e@kernel.org>
Date: Tue, 6 Jan 2026 19:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
To: Richard Genoud <richard.genoud@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
> [Vous ne recevez pas souvent de courriers de richard.genoud@bootlin.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
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

You dismantle/reimplement qman_release_fqid(). Is that the only possible 
approach ?
Isn't it possible to just clear fq_table[fq->idx] _before_ calling 
qman_release_fqid() ?

> 
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
> +       int leaked;
> +
>          /*
>           * We don't need to lock the FQ as it is a pre-condition that the FQ be
>           * quiesced. Instead, run some checks.
> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>          switch (fq->state) {
>          case qman_fq_state_parked:
>          case qman_fq_state_oos:
> -               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
> -                       qman_release_fqid(fq->fqid);
> +               /*
> +                * There's a race condition here on releasing the fqid,
> +                * setting the fq_table to NULL, and freeing the fqid.
> +                * To prevent it, this order should be respected:
> +                */
> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
> +                       leaked = qman_shutdown_fq(fq->fqid);
> +                       if (leaked)
> +                               pr_debug("FQID %d leaked\n", fq->fqid);
> +               }
> 
>                  DPAA_ASSERT(fq_table[fq->idx]);
>                  fq_table[fq->idx] = NULL;
> +
> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
> +                       /*
> +                        * fq_table[fq->idx] should be set to null before
> +                        * freeing fq->fqid otherwise it could by allocated by
> +                        * qman_alloc_fqid() while still being !NULL
> +                        */
> +                       smp_wmb();
> +                       gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
> +               }
>                  return;
>          default:
>                  break;
> 
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> --
> 2.47.3
> 


