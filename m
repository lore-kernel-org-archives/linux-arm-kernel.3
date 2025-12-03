Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA417D15DB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IhoWxNFDu3j7D3DNvg2ADtdccUif/aQwtR3Tng18gQ=; b=y4r3hKGEcLRNBBR0NGblK5629V
	xunUVbwVfFO1avDfvNBCQ5K3UGSwgeJq6fvoOZw/P9ZNkrSYYdA5W11lpIJgpjCpK9nq//CiI8lLT
	hEr0lZmM7+ynZgeEHnWyOfBe4wb7h5XrDw8Eu0XJb7zZAqFJaSLciSdapRXt3Ol/d8oiTOnAxxMkO
	qQCNNdhqDANd165XDg9we/XosDrxbH3luFK4t1sWE7G5V+Ynz60TV753NRJ44atrK/PK0PdO6IG1o
	J80NSWngpaW2QSkjRxEvfpW66vWWfmvRX0/H+kY+jaQ/L5n1KjzFDiKiUnh6mf1+qreFOQX5Ln1Y5
	lOTkNcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQveU-00000007E3O-1gpv;
	Wed, 03 Dec 2025 22:48:50 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQveR-00000007E33-2XBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 22:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802128; x=1796338128;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tymJv/clMIhryQKr0qljGJrmVTsR3odBiq+iNwBeUv0=;
  b=ltHTCXBCeydG1o/0Ie0lKLsd7KqPbjjuFUMtPWfb1VfrpB3VpeL5SD+J
   gUvj02wTGKkz39g/H3Iu/tmTiOI01hyC4IjVRl20KjIRr59fWpeX1AOnK
   B+s+BYutFzdzrlkKZB7w+k4VFviRLDNdDtEmcKyZ9VKeu/sNy9Rwa1AVz
   1MFl6/yysbct9c7VKOI++JtRVPzGvVy8Yvfn5EZTTzq2k5H3kEjhMPsE2
   UENHWwZHTpQP3qgwKQL3Y8ukoQeOwnQWVLFEzUWBG22RJxRL9D3Z17C0O
   txzgtP7Fe19V+tqjqikqrvmwqX+Bcse/hqbYmqHQeoJT1UOoVQUidVRg6
   w==;
X-CSE-ConnectionGUID: 0JO9xk7rQL+KG0OyvkqJEQ==
X-CSE-MsgGUID: 3Rt6T6ftR0iA43q+IA7e4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77135073"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77135073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:48:45 -0800
X-CSE-ConnectionGUID: sZjm4yIGQU25k28g4ENMYw==
X-CSE-MsgGUID: WfFN5FAeRg2CxiE7WXh/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195229109"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.108.28]) ([10.125.108.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:48:43 -0800
Message-ID: <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
Date: Wed, 3 Dec 2025 15:48:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_144847_715486_1E38FB5E 
X-CRM114-Status: GOOD (  14.47  )
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



On 10/3/25 9:26 AM, Frank Li wrote:
> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> cleanup and simplify error handling.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Check patch report exceed 100 chars, but it's still better put into one
> line to keep consistent with other DEFINE_FREE and better readablity
> 
> change in v2
> - remove surpoiouse remove empty line
> ---
>  include/linux/dmaengine.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -5,6 +5,7 @@
>  #ifndef LINUX_DMAENGINE_H
>  #define LINUX_DMAENGINE_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/uio.h>
> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
>  	return desc->desc_free(desc);
>  }
>  
> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))

maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.

DJ

> +
>  /* --- DMA device --- */
>  
>  int dma_async_device_register(struct dma_device *device);
> 


