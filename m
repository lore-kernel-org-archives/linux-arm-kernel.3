Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263E7C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83jOXWPQSPQe3gg5iHsQh92dMJu0a5wIkWiuQ1mdnIE=; b=O8YwdJU7XByba3ySSLZV0+FZ6t
	gmLNLgD7xyUZKX4lfhICbQDwYh7BzzD249iXwZ0oi1UI1JsoYjQY8gJW/kor6vREOKXkEdaErOPrl
	SxrzQGIt0OvwehHbqIqF9yFMTfGrAlk2sTdd01BBGTcWU9j72Swhrh78cynM418WvDRf9DdfMCe9h
	TlEc/lXkEuQOgiwZSqhNZIxNRXS3jhTsUN+KgGUQXKDHWiU9QYtxP3xaigWaTuk2JAt/2WcU2seB9
	ipEovtWYbrrwtxgzPsbHUGpmlL1AFV7xEmvvIW0tz44+QMyie4BerFUngl3HMyOSUAHtLemcqijvk
	PT0roF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZF-00000009AIQ-1s9B;
	Wed, 02 Jul 2025 17:48:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0le-000000092cn-3puA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C1E06111F;
	Wed,  2 Jul 2025 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1317FC4CEEF;
	Wed,  2 Jul 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475425;
	bh=ocNwR/XXz0H6vYXtxoEREo6XhUYrxZeTqCH9xLXk4Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRdRrBd4rqlB8P6ErGgt4dvwpJ1u94yU+jWyu49x4SA6gFJNM0mkK6DqYNPhRr2cx
	 ASDxNstDubarmmecPdK72Xh7hjJPR7qRiDFqkILrbugZJAitqUdPhke+aIfhnm/oPj
	 teu1773om9O6m6zKuBi0N2Cw7YHP0vtecXbXdaS0PtKUg+na4X229xfbyfv2rhQsJm
	 stZy47lY2torkY8GlO5HjTfcWb2uIi08rf39WN2ywlh5BFuSnIwrG7TAhSQZtWrJC4
	 RnVJ+LRovqcXfETHgEkNAFhWgnih5HrjuobsWNkhaISKTZFqlA6XMHBxFGsD5IgHpd
	 zwtUHA+TAL1YA==
Date: Wed, 2 Jul 2025 18:57:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
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

Hi Clement,

...

> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
			      ^^^^^^^^

this one should be "dev" too, which renders the chan_dev variable
unused.

Thanks,
Andi

>  		dev_err(dev, "DMA mapping failed\n");

