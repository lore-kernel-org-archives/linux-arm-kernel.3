Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0DAC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm2Nrp7Imh72FuDU5pPppeehnA/Ha/4A3yBMluiIZH4=; b=v5f8MWLLhJz61BNksBi+Cye1ae
	fDgObibLqJMKFvyo7J+Fl9rxr24UKRLeNkPg8wofROy+hyCg7oJ39GdlW9JiTJAi2FIFisUeADVQ3
	gdvwg/K8WT3zPPELSlVL02BDVajCk1nuuxA1wyvjyJm4Adse3x3qj2cTtgpfAj0USfewf8SLPaegx
	3q92ugI63WVG/qwkR6GDFIEdSKQnDBOA+05FszA+ZVoCbsXmi5j30W3quPJZPkWN3DrX76DEZw57S
	TTGGiDYL9SetQHRVJ7sOMDJbp3U2tiSjV5OwE404sCbKUA46AfuH5m/VhQMF2iCegs04eucG8kwMi
	KwiYbk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp66v-00000008NqP-0BbS;
	Wed, 29 Jul 2026 15:22:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp66u-00000008Nq2-0sfJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 15:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pm2Nrp7Imh72FuDU5pPppeehnA/Ha/4A3yBMluiIZH4=; b=D1MEXqnW00vo9XqGC4iEYxWN1m
	s6Muit33t810hCzAnFre3MfwzNUDPJSYF/PLuReOVxiOP6iYh3X7orQyz0yFPCGaVn0vTTZpPcIcK
	m8vSyW/wAaC3JUhmMxMmsBbENVWewRoz7yCTins4cCIzH3koRTMfJOiUPiERfpEG4Ym5Lhe4bModV
	9biV7SoYfKbtAAn/DL3a4hMrT+S8ZPhUsfgouKchsZ4PmBzyrVZCkE0K9qonDU9VMm+cOMFOEWYYY
	kC0ZScFLToem0MaxMQNEgPCDYIF2mPPdlO2fVYaisWcp6jA1VXit4FG2fl1iDCqZufJPU2UOsqSKE
	RmW3W0mA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp66q-00000005wlY-2SxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:22:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 413CB1A1300;
	Wed, 29 Jul 2026 15:22:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 078DB6039A;
	Wed, 29 Jul 2026 15:22:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1212C11C14FF4;
	Wed, 29 Jul 2026 17:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785338520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pm2Nrp7Imh72FuDU5pPppeehnA/Ha/4A3yBMluiIZH4=;
	b=yg11ygwCPHXsInhwI2RvhudDxTtt6qLEl1eKqq9BFv4JKYR0cyKCFjigq48ct3Cm251irR
	AIinH5hNkagJFmmCnnj5ykP11y4MQFLygGr8WXWO49BZlPwhBfmxP0MNRxnT4h54t76tFd
	8Xn7hU2aNZzpEqFI3QDkrCeZzaXP4w6qIfw+2cNcm2T6Id04b0473lpx+EzBApfUV9arl8
	EmIQtWlbDs61ttvU6o19hvFVah0bxq71brHeWtFqJK7neRDSQsatDsQ2II+tD1giep4F6Y
	rODJ5gsyDSsLadzjDEWpeTRSr1cB+MGY/SbKEkeYFb1JaupdTnvIR5exOhx0EA==
Date: Wed, 29 Jul 2026 17:21:56 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Paul
 Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
Message-ID: <20260729172156.4371a8bc@bootlin.com>
In-Reply-To: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162216_776410_779FE82A 
X-CRM114-Status: GOOD (  18.81  )
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

Hi Christophe,

On Wed, 29 Jul 2026 16:10:36 +0200
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> proper platform driver") qe_add_gpiochips() was walking the device
> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
> 
> After that commit the discovery is handled by the platform core,
> therefore it is necessary to call of_platform_default_populate() on
> the par_io node.
> 
> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
> index a5e2d0e5ab51..02ca556c8db0 100644
> --- a/drivers/soc/fsl/qe/qe_io.c
> +++ b/drivers/soc/fsl/qe/qe_io.c
> @@ -15,6 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/ioport.h>
> +#include <linux/of_platform.h>
>  
>  #include <asm/io.h>
>  #include <soc/fsl/qe/qe.h>
> @@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
>  	return 0;
>  }
>  EXPORT_SYMBOL(par_io_of_config);
> +
> +static int __init par_io_populate(void)
> +{
> +	struct device_node *np = of_find_node_by_name(NULL, "par_io");
> +
> +	if (!np)
> +		return 0;
> +
> +	of_platform_default_populate(np, NULL, NULL);
> +	of_node_put(np);
> +
> +	return 0;
> +}
> +arch_initcall(par_io_populate);


The par_io node is a sub-node of the soc@xxx node.
The soc@xxx node is simple-bus compatible. This child node should be
populated.

Why do we need this additional of_platform_default_populate?

Also par_io node has a compatible. Maybe the related driver should call
of_platform_populate() to populate children of par_io if needed. If this
driver is missing, maybe it should be created.

Do I miss something?

Best regards,
Hervé

