Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95DFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRhAGyzUZRi1jjBO2+0a2vqLcqSoZqNGW/ZSVMMVt0M=; b=LvXueX58teQfjldl619iI1vMbt
	lFY/pKUuAhzME9qhiGmoM2+BjzaX+Nv0gr+t+H2EQ/BUaQcs9CmN8D3u2zf2OQ+Kwa9jS/KHsvi4M
	RA/r4i7jR4brHxl/EhJfNlBehRYR73kfCCKZpE69PNZAOvVhX2puXeJgmdjyIMel48gKuX1E+2+Wh
	E0kKzo5iL3bleP25XUUtnE/LP29zRHRfocFOysvWOzqzp9hXoL/n+GJd30Cm26ywD2yfFhqWMAMhA
	5Xu5hqdedH7gUgc+a8vvNf0BSos2g1QrZTJNiaLNrA2OneLwDBrYwCrMKpLPdrnpO/qKRXfIy2KDv
	9Zgoaqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vYw-0000000GLmd-0h0Z;
	Sat, 19 Sep 2026 13:57:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vYt-0000000GLll-26Er
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789826224; x=1821362224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XNAAz2y1hQI1jpd/UD1AKmVlqfxjbi/3Ibab7fxF58U=;
  b=R4OYjAtSpA/nbZukiR4B6GNBNz7UUTtxqTt1xq/507wxMDJJSjo6cxE1
   0TfL8p0VVUVzrLLM7HqOyxXulGQ9ifVBy/pfZyzG45+WUiRSldwngMn5J
   im4cUaP8Ot1m3We4c60fsW2nwwLiUHTsE2iH8eDJhsVa05uMUfjP82sm8
   G5s55K8BWSbJMWCow1qbYEMZOVh7QUGq/pbbKr9ZCPeTKCMYGhQw1Sywk
   U1abYvFLba1TEh9OKj8sD1VBcuqO+/A5x7dvcp1sna4NGCLQFkWvOy5jA
   DU/+NaB3Sn8TRm0xp7gX3c+Sb2CASATuBQrHVDFRcaZN/jdRR/xqFoV6R
   g==;
X-CSE-ConnectionGUID: gS3jNAzSSXCHFdDyk9wjQQ==
X-CSE-MsgGUID: Uhv3RdeoR/aKgCeYSzTjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92856440"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="92856440"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:57:02 -0700
X-CSE-ConnectionGUID: sOAvjBjpTLqXtcDgmqC3/Q==
X-CSE-MsgGUID: iJhVdkZTRsGRyU1tFZqjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="276781262"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.50])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:56:55 -0700
Date: Sat, 19 Sep 2026 16:56:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v2 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aq6UpdBvXV6qnj3G@ashevche-desk.local>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
 <aq17qvmxF6nwclkR@parshuram>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq17qvmxF6nwclkR@parshuram>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_065703_574454_9A239AC1 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Sep 18, 2026 at 11:28:02PM +0530, Vinod Koul wrote:
> On 18-09-26, 13:34, Andy Shevchenko wrote:
> > No more users.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I thought I had acked earlier one. Here is it again

This is strange. I used `b4 am` to collect tags, most likely it was an old
version (before you sent that email). I will anyway issue a v3 and I double
check that all new tags are added.

> Acked-by: Vinod Koul <vkoul@kernel.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko



