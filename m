Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E7C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agfqRcX4Mpju56NeWpoeTXUedTUg8+bW2vmKHAJk+wA=; b=JWwrSQJucGTtXHKNfHllsnYPzQ
	rU4Gu51o/y4QQrZwXlfzp6pdIIN+IT1UlxrWwfuSgQC7JFRdMr2zsLXU0nP45pmpVVQglOjPy7+Vg
	1H7tTsnSgFS7QVS60Vl3SOL2d+y82C+8Ht78Ome1I6sWS79f27m/cYf5rvljgN2u1nPLd6v6+uRo3
	UcmBncd1ahkGG8EpWnWMQyYIOS5tzYkV8jlUdAhcTNxZ4bOrc84s0NZftngJ06e7tt4n1dnNZ2UGW
	FA8BTljO7g5t9gozTrhym0NsoaGIWiGnZcs+DP/zJb1ZK/IcDKNFMh43BFlMJLjshzki62bg3+D3J
	iNvuYiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Mm-00000009WrS-0sKU;
	Mon, 31 Aug 2026 13:48:04 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Mj-00000009Wqc-2uH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788184081; x=1819720081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ie3xlaMgCZRHfQFO9tpvIrY06r9dN2T6vkkF4iH+iGU=;
  b=bEUOnQ3HyVaAbr6H8uE/I1cBRrlchpRGlmdXDC3jbsAje3sqU+78Y8yl
   g8fqx/UvqcsFXcZ95cINkuoIvhXZMIplPdYiuO7Jnlt9HupwUTRc2rK6A
   69+JxXLfUBi3Xjzp/HdALPWLxOZp4TkdySV9VrxbNhqQXJeVJELBJU2G5
   8ICGAWlHfm39db9krHRLtUt1iFMlumFkQ50eLbFsCFL0z64LLzmeTB7v8
   2W+uo4QHVcn4/ePaFM7g8jk/3fTKGCX9ZgP12vFG/pcqT1Soiklfc/hr/
   bMf5ThBQ63t94qjJ8SQNdn9OBvtI0o5xKPzV5gIzA98h2DcP6dHwhuouK
   w==;
X-CSE-ConnectionGUID: fX2IC5iQTuGBLU1jFZsCfQ==
X-CSE-MsgGUID: lEyo1MwZTNaFGcSGkcPIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114129759"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="114129759"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:48:01 -0700
X-CSE-ConnectionGUID: +4KfFTj7TNWoAYw8FptzuQ==
X-CSE-MsgGUID: GDSOXyHfQ+abDtDfzeAhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293633674"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:47:56 -0700
Date: Mon, 31 Aug 2026 16:47:54 +0300
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
Subject: Re: [PATCH v3 8/9] spi: dw: Use dma_slave_caps bus width helpers
Message-ID: <apWGCkIJ7zGh2Gd0@ashevche-desk.local>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064801_749250_8A5150C7 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, Aug 31, 2026 at 12:46:45PM +0100, Nuno Sá wrote:
> Store the common TX destination and RX source bus widths in a
> driver-owned DMA bus width bitmap and populate it through the
> dma_slave_caps helper.
> 
> This avoids depending on the legacy src_addr_widths and dst_addr_widths
> masks returned by dma_get_slave_caps().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
One nit-pick below.

...

> +++ b/drivers/spi/spi-dw.h

>  #include <linux/scatterlist.h>
>  #include <linux/spi/spi-mem.h>
>  #include <linux/bitfield.h>
> +#include <linux/dma/engine/types.h>

Even if it's not sorted, try to squeeze the new one into ordered manner.

-- 
With Best Regards,
Andy Shevchenko



