Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67810FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFAG4VMl/JrvmU+mQ4HzgZSqyLnCpsKHU4Ha1Y4GQNY=; b=KMoMmKx4OW/6b1ZE5ESza3Pt6r
	z4pLs6MwFTs7XsFGZDi5eM7BdWNsg8k2/hDAODJDiiMQKAcPpBa7jjizPLWpxOgWKrGQ6WT82bit5
	/CsOA19ptPBwgVUEp1d/LJtn8s8P3jz93OT0s+nTfTaEfbulvaEsTsFWJTq0hLNvPd+o5+pu1judw
	PK/UXEXLg04B2TDCBucIiEJgM7CD01TpwOYU7W5oQWCB2ne71vwgGi3jbsEkEk9CWczmNMmWD8rnT
	AvR7GUmTDWpzPZmm+h0WDcK1yQpxga+MB2XfBnbm9e+h1nTPfb/WilSIH6v6JzD3Hb+bQtMm/R9Oj
	m9fHfNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOGB-0000000HF4I-32TS;
	Mon, 27 Apr 2026 15:52:35 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOG9-0000000HF3l-1fAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777305153; x=1808841153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZzygghIaYNoBXzjbpF+bp1gCuinbN7CeWYke3oLa4U=;
  b=BQBRBtYxiA0xTSJWR54Zqk43OMcLIj+5CKxzgOD5wu9GxC0vgZ96WN7P
   hQHLabqyRGPxlYMLphXFqL/LYhQnWfkp0nCRBDbHtaue41Yk2HUlxb+2f
   0gx1Np1i++0fJlybiS0I5AV4AImnvDolHy4T+qQB3ldiTxE35CJpv8wRA
   Pk+cjofyohPSRdCq/vG7Yj9ZrXz1ilLtOihKKRo0faKZyb7Fz29ZUVooU
   Q/3gEKNuAKvnkyoPLsfNR/3O438BSDRGgrQA3pBzy/akyJ1BFpwUNE6aE
   6K1fDzfgrzFNCRX8INLLRIlG+KEG8ODJjD+Rbfy/jWqileCAtKpw0e4lI
   Q==;
X-CSE-ConnectionGUID: Jmmm4s7kSlCUb5drTyOhhQ==
X-CSE-MsgGUID: RbdiVMiYR6+Q1aVL/o2cGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65728613"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="65728613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:52:32 -0700
X-CSE-ConnectionGUID: QaxYEsZuSQqV1Lg0u0bCBQ==
X-CSE-MsgGUID: Uqme4H9aRTmYVVKbBLbUXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233517889"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:52:28 -0700
Date: Mon, 27 Apr 2026 18:52:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: pxa: integrate sound/arm/pxa2xx into
 sound/soc/pxa2xx
Message-ID: <ae-GOQjD4Kq0ve8D@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-3-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_085233_491861_80FC0EC3 
X-CRM114-Status: GOOD (  14.57  )
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

On Mon, Apr 27, 2026 at 04:46:31PM +0200, Arnd Bergmann wrote:

> The pxa2xx sound library modules are only used by the ASoC driver since
> commit b094de7810f3 ("ASoC: codec: Remove pxa2xx-ac97.c"), so move the
> code into the one module that uses as a simpliciation.

Is this part of the series that touches UDC? Btw, the UDC one despite on being
mentioned as v2 in the changelog still have no versioning in the Subject.

...

What a lovely change! I would like to give a tag, but see a comment below.

...

> +#ifndef __PXA2XX_LIB_H
> +#define __PXA2XX_LIB_H
> +
> +#include <uapi/sound/asound.h>
> +#include <linux/platform_device.h>
> +
> +/* PCM */
> +struct snd_pcm_substream;
> +struct snd_pcm_hw_params;
> +struct snd_soc_pcm_runtime;
> +struct snd_pcm;
> +struct snd_soc_component;
> +
> +extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
> +			      struct snd_soc_pcm_runtime *rtd);

Can we kill 'extern' while at it?

> +extern int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
> +				struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
> +				    struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params);
> +extern int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
> +				  struct snd_pcm_substream *substream);
> +extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
> +				  struct snd_pcm_substream *substream, int cmd);
> +extern snd_pcm_uframes_t
> +pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
> +		       struct snd_pcm_substream *substream);
> +
> +/* AC97 */
> +
> +extern int pxa2xx_ac97_read(int slot, unsigned short reg);
> +extern int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val);
> +
> +extern bool pxa2xx_ac97_try_warm_reset(void);
> +extern bool pxa2xx_ac97_try_cold_reset(void);
> +extern void pxa2xx_ac97_finish_reset(void);
> +
> +extern int pxa2xx_ac97_hw_suspend(void);
> +extern int pxa2xx_ac97_hw_resume(void);
> +
> +extern int pxa2xx_ac97_hw_probe(struct platform_device *dev);
> +extern void pxa2xx_ac97_hw_remove(struct platform_device *dev);
> +
> +#endif

-- 
With Best Regards,
Andy Shevchenko



