Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DC4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQt8aDAcT+pT0xkh+esWHy6l7T4oBo6vOKm84lKYkDk=; b=rKoz/mFxKgc1zGIX/p91eMJ9L8
	qi6IE4hIEpYmbX5aFJEFwJOpBwBtkFhmD7ZK6cpPMAIgBkDi8TTEtnYSnua8tH01QP9oky5PReP2k
	fDMcsnkBlfuqE3jTCbIM5HaAi0Sa5EnrdnVJi/4Nvwlq9R7pwRtBexgHnQyde6H8BW9Z6kF/zc6kB
	ZrVuLHLEh4ai5PodPWf76YcjFiDAGNnRUQbOfVePs9j8CUTNQPM1hZbwtzaQBXZTDOAl1u69FHmIo
	2iGigDvPoOWO14DArAk9mgzPeRFSVTcOOH+1MxeCgQfRnvvQ2F3LxriKx/ZzyhTx0HBSioIaHZgGX
	B3yY02cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wei6s-00000000Mrr-2TUg;
	Tue, 30 Jun 2026 23:43:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wei6r-00000000Mrl-1owD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:43:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC84440160;
	Tue, 30 Jun 2026 23:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3DD1F000E9;
	Tue, 30 Jun 2026 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782863000;
	bh=VQt8aDAcT+pT0xkh+esWHy6l7T4oBo6vOKm84lKYkDk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CXEouIuGnmZkc61Kw7GRTjTiHsJtTmMz9EE+gS6ISSMXRyyz+pVA+Vc7XZm+qGhMG
	 SZzmPLMZejh1dQjkyleXHt9bSfvkRlwINkvwPV9YqNXZER8xH8oaxzBJkBQ2HT+nbv
	 GNT0at1RY/GAa/e24bLPGGpCOSmsfDRz0ErwD0D5FwtfwDml2CRrg9eZk1NZr8lNpf
	 00X+ZyX4hbzV0EVK8naX5LrXlmkwyY+meoOHLSRM8xiZ3ooMtTMKed2LGGDZy5/+cb
	 3WqHAipBeY04rrH61utvgWUWa4FfiVaOwyPMFGu2/Lu+rec8yD2i5rk/w1luXeSUwE
	 q/z/Kz2lyvZog==
Date: Wed, 1 Jul 2026 00:43:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>,
 <jorge.marques@analog.com>, <mazziesaccount@gmail.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 04/13] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Message-ID: <20260701004313.7bd1a35e@jic23-huawei>
In-Reply-To: <20260630093603.38663-5-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
	<20260630093603.38663-5-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 30 Jun 2026 15:05:54 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add support for sama7d65 ADC. The differences are highlighted with the
> compatible. The calibration data layout is the main difference.
> 
> Update Kconfig help text to mention SAMA7 SoC family support.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> @@ -2639,6 +2667,9 @@ static const struct of_device_id at91_adc_dt_match[] = {
>  	}, {
>  		.compatible = "microchip,sama7g5-adc",
>  		.data = (const void *)&sama7g5_platform,
> +	}, {
> +		.compatible = "microchip,sama7d65-adc",
> +		.data = (const void *)&sama7d65_platform,
Silly question for you that is more about the original code than what you
are adding, but why the casts?  It is already a const pointer so I think
we are fine under the C spec to just do this cast implicitly to a const
void *

If you agree, ideally please add a precursor patch to drop these casts
before this patch.

Thanks,

Jonathan

>  	}, {
>  		/* sentinel */
>  	}


