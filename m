Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5459C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOJp4blY5phc9Vv5SsCAuVuk6WuoBNzFXQ+AbRV2dCA=; b=CvdkPPoceY8n4kUwnQOZ3wIy+u
	C0VnJoTDASozkZitdn+1bUl+7qAnnwn1l/XNcObf+aorBNLvS6WMOiL0QXzhaRkRsqf2rEsWjp8Wg
	hhUWpiNuK4oQD/J16+MTNq56lFoatoRQnmxRKcIoI4QU3XsivW727xndrgqqILTn7B5ij013C5/bM
	a8vQ4OE+0AAB3tsIVJ8MPHkgm6BcWNBkhqI7CsHaYJLXzDrSIZWYRRtUPPZ8C+l3ems7zaralCCOo
	rdOpW7qR7efRMmE736ekWJlUDaB3ugY0WX+ttoyqXD+vMOKIHIREBLuaH5Zjw5YAdUF6ffEyj+gKf
	q8RoljAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xjV-000000052w5-3aGa;
	Tue, 22 Sep 2026 10:28:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xjU-000000052vt-1ZbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:28:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87568601F7;
	Tue, 22 Sep 2026 10:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6371F000FF;
	Tue, 22 Sep 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072895;
	bh=LOJp4blY5phc9Vv5SsCAuVuk6WuoBNzFXQ+AbRV2dCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fnYBUmgRgs+DrsVZ4E7rNjAcBrnd55YcN/xtuScQWsatNfiAK8CaVLVsalX3VbpUU
	 eNkioZbKquxGIoNHlQ7nqM0jpOUdzZH0J+duAdiQESUtuvBz/gRJVJju43DDfkdx0c
	 gZzSSLz63VkeapKrh7dhYaDqtES+j9Avm5vKFp9sITBwDo2tVuZCqh99EQfBo6szyV
	 qCRg19zxrNl9cSUSFHHdaN1c7FR3ysLbmT0alDo2qHpi5LIuANCwx6XPf+Kr2GU1R1
	 NfnYw5z5if634DwpeVaRGRJoOiBF2kD9dDlQYp1JLCqMUBW7iuBvt8l54XN1v6Mmmr
	 kQ2acyT8DnXww==
Message-ID: <0a35cf00-32ba-4a21-b05c-edd44d3ca219@kernel.org>
Date: Tue, 22 Sep 2026 12:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: order the probed flags with
 release/acquire
To: jaidevshastri@vt.edu
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260921-mb-qbman-v1-1-35f3321aa330@vt.edu>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260921-mb-qbman-v1-1-35f3321aa330@vt.edu>
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

Hi,

Le 22/09/2026 à 02:47, Jaidev Shastri via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+jaidevshastri.vt.edu@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> dpaa_eth, caam and the portal drivers poll qman_is_probed(),
> bman_is_probed(), qman_portals_probed() and bman_portals_probed() before
> they touch the state the probe functions set up: qman_ip_rev, the CCSR
> and portal register maps, the FQD and PFDR bases, affine_portals and the
> pool allocators.
> 
> Each flag is set with a plain store at the end of its probe function and
> read with a plain load in the exported accessor. The stores that build
> the state are not ordered before the store to the flag, and the
> consumer's load of the flag is not ordered before its loads of the
> state. A consumer probing on another CPU can see the flag set and then
> read state that is still stale or zeroed, and program the hardware with
> it.
> 
> Set the flags with smp_store_release() and read them with
> smp_load_acquire(). The error paths storing -1 keep their plain stores:
> a consumer that sees -1 fails its own probe without touching the state.
> 
> Found with MBCheck, a static herd7-based memory consistency checker.

Sashiko made comments, can you have a look ?

https://sashiko.dev/#/patchset/20260921-mb-qbman-v1-1-35f3321aa330@vt.edu

Christophe

> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/soc/fsl/qbman/bman_ccsr.c   |  6 ++++--
>   drivers/soc/fsl/qbman/bman_portal.c |  6 ++++--
>   drivers/soc/fsl/qbman/qman_ccsr.c   | 11 +++++++++--
>   drivers/soc/fsl/qbman/qman_portal.c |  6 ++++--
>   4 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman_ccsr.c
> index b0f26f6f7..c5be35aba 100644
> --- a/drivers/soc/fsl/qbman/bman_ccsr.c
> +++ b/drivers/soc/fsl/qbman/bman_ccsr.c
> @@ -180,7 +180,8 @@ static irqreturn_t bman_isr(int irq, void *ptr)
> 
>   int bman_is_probed(void)
>   {
> -       return __bman_probed;
> +       /* Pairs with smp_store_release() in fsl_bman_probe(). */
> +       return smp_load_acquire(&__bman_probed);
>   }
>   EXPORT_SYMBOL_GPL(bman_is_probed);
> 
> @@ -279,7 +280,8 @@ static int fsl_bman_probe(struct platform_device *pdev)
>                  return ret;
>          }
> 
> -       __bman_probed = 1;
> +       /* Order bm_ccsr_start, bman_ip_rev and the pool allocator before the flag. */
> +       smp_store_release(&__bman_probed, 1);
> 
>          return 0;
>   };
> diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bman_portal.c
> index 4d7b9caee..056fe3fbb 100644
> --- a/drivers/soc/fsl/qbman/bman_portal.c
> +++ b/drivers/soc/fsl/qbman/bman_portal.c
> @@ -90,7 +90,8 @@ static int bman_online_cpu(unsigned int cpu)
> 
>   int bman_portals_probed(void)
>   {
> -       return __bman_portals_probed;
> +       /* Pairs with smp_store_release() in bman_portal_probe(). */
> +       return smp_load_acquire(&__bman_portals_probed);
>   }
>   EXPORT_SYMBOL_GPL(bman_portals_probed);
> 
> @@ -157,7 +158,8 @@ static int bman_portal_probe(struct platform_device *pdev)
>          spin_lock(&bman_lock);
>          cpu = cpumask_first_zero(&portal_cpus);
>          if (cpu >= nr_cpu_ids) {
> -               __bman_portals_probed = 1;
> +               /* All CPU-bound portals are initialised and in affine_bportals. */
> +               smp_store_release(&__bman_portals_probed, 1);
>                  /* unassigned portal, skip init */
>                  spin_unlock(&bman_lock);
>                  goto check_cleanup;
> diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
> index aa5348f49..b46cfb964 100644
> --- a/drivers/soc/fsl/qbman/qman_ccsr.c
> +++ b/drivers/soc/fsl/qbman/qman_ccsr.c
> @@ -711,7 +711,8 @@ static int qman_resource_init(struct device *dev)
> 
>   int qman_is_probed(void)
>   {
> -       return __qman_probed;
> +       /* Pairs with smp_store_release() in fsl_qman_probe(). */
> +       return smp_load_acquire(&__qman_probed);
>   }
>   EXPORT_SYMBOL_GPL(qman_is_probed);
> 
> @@ -864,7 +865,13 @@ static int fsl_qman_probe(struct platform_device *pdev)
>          if (ret)
>                  return ret;
> 
> -       __qman_probed = 1;
> +       /*
> +        * Publish the flag only after every store made above (qman_ip_rev,
> +        * qm_ccsr_start, the FQD/PFDR bases, the work queue) is visible to
> +        * the consumers that poll qman_is_probed() and then call into
> +        * qman_set_sdest(), qman_liodn_fixup(), qman_alloc_*().
> +        */
> +       smp_store_release(&__qman_probed, 1);
> 
>          return 0;
>   }
> diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
> index 456ef5d5c..181c0f373 100644
> --- a/drivers/soc/fsl/qbman/qman_portal.c
> +++ b/drivers/soc/fsl/qbman/qman_portal.c
> @@ -175,7 +175,8 @@ static int qman_online_cpu(unsigned int cpu)
> 
>   int qman_portals_probed(void)
>   {
> -       return __qman_portals_probed;
> +       /* Pairs with smp_store_release() in qman_portal_probe(). */
> +       return smp_load_acquire(&__qman_portals_probed);
>   }
>   EXPORT_SYMBOL_GPL(qman_portals_probed);
> 
> @@ -251,7 +252,8 @@ static int qman_portal_probe(struct platform_device *pdev)
>          spin_lock(&qman_lock);
>          cpu = cpumask_first_zero(&portal_cpus);
>          if (cpu >= nr_cpu_ids) {
> -               __qman_portals_probed = 1;
> +               /* All CPU-bound portals are initialised and in affine_portals. */
> +               smp_store_release(&__qman_portals_probed, 1);
>                  /* unassigned portal, skip init */
>                  spin_unlock(&qman_lock);
>                  goto check_cleanup;
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-qbman-84f56ef0f84c
> 
> Best regards,
> --
> Jaidev Shastri <jaidevshastri@vt.edu>
> 
> 


