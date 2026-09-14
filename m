Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FBCC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44fJRGOyJ6H1OZ+wEEbVtfF16Q6dlMTeYVS8EKfh61o=; b=SSE14yFaqjERUOSeKM/z8tkUO4
	VQNdnW5uC2UXE7zoSeg9XavHcIJ1F06RFuYeO2dGoJ1Dcy8/X5EUXr/iXoM4dXe3JQCGi40qpbopF
	oI5n3PLN3H5iqIcS6O9zmC08e3oumFTELUEkRMzBfUrqnEMv4sSt60AAxmR08I6Uqn+kbmwoaF97R
	C/DIX5U6lYONhr3XEGNTeEUR0Vga7EmsVuJU4JwpDQIQk9f7rHoJAQ+MSsdoGBpYHW9hcNgNOldrF
	FjSsWXK6X3T5Nt0s+7vyvII5nZhIBB1NpDNAv3TgsyVZ9dtRcis6umUmqk1qEtR7Ozouo8mdE2pRR
	aqPX+wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nX-00000002gLX-11ml;
	Mon, 14 Sep 2026 08:12:19 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nU-00000002gKk-4AgB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789373537; x=1820909537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1OQgv3CLoOAvRHFXo8obITZm5ME7dKxVV+fENPflSNs=;
  b=XHeiFAeaSByI4sh3XEnuRNpAKyoGkKknvT0NfSCT8k/E+r/ioWBAR9Sf
   6jW6c/+0/Mls/ThsLk5rlUOZOS0V0f7iheOSfZoc4RzbafmhIKwtGlDvC
   tmqZqv+p/0aJnUWqYQzRAefl8ciJvOE/mZTLHY1jpIn6QsuxPYm23Tzz5
   jR2JZqtSll7JyX22nzbTUOu2hadwWLuuwNF8h0kWilrEPl4brTYqh/FcX
   VUrfpV2YP5ruIw0CXSBo5iTFYfu3RM8c0W7sBARY0sKBcPXpIMRr7naiw
   WQnDsclAUExYtFrEzHXEgoNGlrPCtqh998iKQZwoRHtL4fUiQUKuwq9MC
   Q==;
X-CSE-ConnectionGUID: cLeKZU3mRFm7XkM5O2Cn1w==
X-CSE-MsgGUID: 0C9lPdbvSz2rk7NN+R1sIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89930533"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89930533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:12:16 -0700
X-CSE-ConnectionGUID: Pk3tLVsuSq+B8gP2yd78ag==
X-CSE-MsgGUID: j+X708W/Q1mtQ7SjumjlBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="269292406"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:12:11 -0700
Date: Mon, 14 Sep 2026 11:12:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 08/10] ALSA: pcm_dmaengine: Use dma_slave_caps bus
 width helpers
Message-ID: <aqesWfdIsiR31sql@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-8-72b8fd4cc78e@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-8-72b8fd4cc78e@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011217_068180_8409E205 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, Sep 11, 2026 at 06:25:43PM +0100, Nuno Sá wrote:
> Use the dma_slave_caps bus width helpers instead of reading the legacy
> src_addr_widths and dst_addr_widths masks directly.
> 
> Keep the existing default assumption of 1, 2 and 4 byte widths when the
> DMA channel does not report slave capabilities.

...

> int snd_dmaengine_pcm_refine_runtime_hwparams(
>  	struct snd_pcm_hardware *hw,
>  	struct dma_chan *chan)
>  {
> +	enum dma_slave_buswidth default_widths[] = {
> +		DMA_SLAVE_BUSWIDTH_1_BYTE,
> +		DMA_SLAVE_BUSWIDTH_2_BYTES,
> +		DMA_SLAVE_BUSWIDTH_4_BYTES,
> +	};
>  	struct dma_slave_caps dma_caps;
> -	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> -			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> -			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);

> +	dma_buswidth_mask_t bus_widths = {};

Do you really need the zeroing?

>  	snd_pcm_format_t i;
>  	int ret = 0;

>  	if (!hw || !chan || !dma_data)
>  		return -EINVAL;
>  
> +	ret = dma_bus_width_set_many(bus_widths, default_widths,
> +				     ARRAY_SIZE(default_widths));
> +	if (ret)
> +		return ret;

I assume that if ret == 0, bus_widths should be set accordingly.

-- 
With Best Regards,
Andy Shevchenko



