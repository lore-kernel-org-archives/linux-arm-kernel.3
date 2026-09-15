Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CDEC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNOmklwMT3+8WwCRItuHkffYh/JkNHAawYZ2FWhI2k0=; b=k3HOBn8fsP26ka0xE+Cyt4JeZE
	pb5M4aOe6kPNQKF/YsBR0Rh7BX8/olenF9m6kuKbzHap/u4xey2BKW+DuBsCzNXF2aXIBzbOO6NQx
	8b9m/hH0L3psCxldIt+fJrAufPr4u6IcPCkmnWRgozrXCF/ZhAzlCSfuqbfpikOLOeFRZX+GZYeI9
	ZKxlp/eliykB/hXxzL3UTIymAM/bMQSfn50UKetENFolfc/eVEiKg2pSVV2cag+4m/XpXCmppMRJ8
	TMZK6eewI5JGTuv0ScCsTUsjUbMqyH+uG36w5D4Ilytre4EtQtOBz4gjnoj3/+GPBtnYHwePUEhni
	DKcr1c7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X6W-00000007bwz-2HlQ;
	Tue, 15 Sep 2026 17:38:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X6V-00000007bws-0mSr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:37:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EF58600D1;
	Tue, 15 Sep 2026 17:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F081F000FF;
	Tue, 15 Sep 2026 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493878;
	bh=lNOmklwMT3+8WwCRItuHkffYh/JkNHAawYZ2FWhI2k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BamemBGZLZEiNhzMEf53sH0aaBEGi/k7AS44kJ1lRb72jC2kMNobzBmsJjmYi4HPs
	 B3BxYdYFv/95wWGhWlLtkqBX084LIjizXy765ex13o62PZFGhuQviruML7X3jHwNl9
	 0pBZowc7i0vXoSJ36xFtqKoLH+7c4x2aqEU7AkRvQm/QJ8Z+CuVFktxBjV6HHmU4Am
	 SNP34f0gL9dnEuASoKHV0rsWJZA9AnRTZfio88imGgIc0sdlsWCvj7RHjEONeIg+/P
	 jmiGOUetPwMRYR6sordYsfjRBHVv/2mvRiomODvdIsnUBQPIotj1bZ6YcTKlGPOz3o
	 UbkETCel8UBVA==
Date: Tue, 15 Sep 2026 23:07:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aqmCcXRa3EIsIU6k@parshuram>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>
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

On 15-09-26, 12:04, Andy Shevchenko wrote:
> No more users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

