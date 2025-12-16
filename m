Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596CD5E38D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXwyLM/C5r2xejMIxi9xf4Oxi+I9E+3W8/4haYXDy5U=; b=D36d6cfoO2tKzD4gyCX5C6MwgL
	MNWmya5ehYAygiO3Xj4NHzSzUBP+9Y0sTsEZNXWCMCEOg372hWyQLCNSRvR04c0Pf99rmyLAp7l+k
	mg+chPS32b0oWKdYT8O6fHjvNjTmBfTqhR6Wmex7OI+UdKE51Zj30GJ3V6nrsUppcIf5jUSLXFNsf
	Fx5YiMndxOAu4skBeP8QxAfsMmsGWR1NRnt70+HF11di7MQ5mUSM62+SICz8pB986ZPwI7IFetB1G
	dXI0Xt6N6ZX6YcW+MOEHmuvZ3mYu8BbQmSvv9MxyghVvVLZkhHn+fELrkXjPJAyk2GmyJNebZniBc
	WsChLqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWYs-00000005Osh-1dr4;
	Tue, 16 Dec 2025 15:02:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWYp-00000005OsU-0L3I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E330F6017B;
	Tue, 16 Dec 2025 15:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2628EC4CEF1;
	Tue, 16 Dec 2025 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765897317;
	bh=l6BsXuUQhKVvOvNQVNusVS5RLyr3LsVQL3METhXptkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYGx0CcroGx+8n06A1aiaZqq4+chW41i1tx54gQ6z3/T5zHt55tvXEFa2vuQEcXe2
	 Af3ucF7wj1DbxMHQ+f6pzwHYMEyZ7g3EVjkXuPBW2N2gzexqlklcONWJMzeRDYiZmh
	 N2i9sityb9jgDYljDPBPifwuuQFa285GMh2k//q42YRSsrm7b1mzNFreY8b/Wal3kt
	 aqLszFgTsVGqVLLQKMA/C5yoZBFELxhQRtMDKKvRYjZU6kLVUEFGTjlNdBA/rgU95d
	 XQcKiZOhlQuzOzy5V4YZ0CWCmBwH/VUUCkh/cdKYxhnhOETyR+sWL3hgHEH7AwsXKU
	 1uSkfhtJ/uVLg==
Date: Tue, 16 Dec 2025 20:31:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Frank Li <Frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Message-ID: <aUF0Yu5Cexvm7JFe@vaman>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
 <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
 <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
 <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>
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

On 04-12-25, 08:07, Dave Jiang wrote:
> 
> 
> On 12/3/25 6:30 PM, Frank Li wrote:
> > On Wed, Dec 03, 2025 at 03:48:41PM -0700, Dave Jiang wrote:
> >>
> >>
> >> On 10/3/25 9:26 AM, Frank Li wrote:
> >>> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> >>> cleanup and simplify error handling.
> >>>
> >>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >>> ---
> >>> Check patch report exceed 100 chars, but it's still better put into one
> >>> line to keep consistent with other DEFINE_FREE and better readablity
> >>>
> >>> change in v2
> >>> - remove surpoiouse remove empty line
> >>> ---
> >>>  include/linux/dmaengine.h | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> >>> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> >>> --- a/include/linux/dmaengine.h
> >>> +++ b/include/linux/dmaengine.h
> >>> @@ -5,6 +5,7 @@
> >>>  #ifndef LINUX_DMAENGINE_H
> >>>  #define LINUX_DMAENGINE_H
> >>>
> >>> +#include <linux/cleanup.h>
> >>>  #include <linux/device.h>
> >>>  #include <linux/err.h>
> >>>  #include <linux/uio.h>
> >>> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
> >>>  	return desc->desc_free(desc);
> >>>  }
> >>>
> >>> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
> >>
> >> maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.
> > 
> > If that, 'dmaengine_desc_free' is better because avoid create new name for
> > it.
> 
> That works too.

Agree, it is better name

-- 
~Vinod

