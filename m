Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D41DC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfs34GcY0r4wv0eSPiGXm922A/FiwM+UAE29G9mIwSo=; b=pSKaw+7vsoreyydmQ0FpQSbmzp
	WoEj/KTFGirTVq6ZXsGZQTv0+vI3rC9QkBGKa5y9J3JYAKGRMghuCChcI3HsHqB2cdqMKHkjKFyDP
	3vkSoRAC+vFdABy3PdQgpic9C5Jc6pE/RjohpvVS2QeFuQCKVgOjGSHuRshwWW7lUmpoeor8H88AA
	rlXPHo5OR5ff1j8b772JEnub42KVkl/3R66ZeDWvMmQFczH6MaT2XxVJe3tLsta4eoXKOxDhz8SoB
	hjTudpsjzM+rsVL5c25c1nfcFmGwi/JseFwAvPW7hQBQW4Zyabbl//hyOd6A4J5oGS8ttJZohjKgY
	PMFLBhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61i0-00000002f1M-245k;
	Mon, 14 Sep 2026 08:06:36 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61hy-00000002f0f-2BVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789373194; x=1820909194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X6brkOAP3lrhzjUoaD0QihF8srSFXE/F/lrOZE26crI=;
  b=a9OF7xiP6YGmqrFoheDWJne5S0xQg0t9JRVHro+Kd6YX/aYB8pTGutgq
   RSpVCA1vAtLXANf5QKtTHwjCZ3zLlNdU3fQfVkoRDyhtwCV3B+Uc1JKae
   btCU51j5csa2osGdDy7l+Pq9I+8cAbg9Dj2EOXlF9eJn7+Pe/md3RG7h/
   jOtlrpMNoFp40kNh+b99lsYWXPKBLQAaImnY3YCfyrk6FQbN9oRiIZF7v
   XD+UvvYHL65wN3i+YmXjsgHgZLaoiwGvyeW5MHwsCaXWcRMYs40FLPxoD
   1UNzOdli/UWUvimxodowXJUmQh4ThePvKrDQfml+xbib1x+wCQD22Sn1A
   Q==;
X-CSE-ConnectionGUID: kYFd8BJwTwy3/AcKjwjX9A==
X-CSE-MsgGUID: 5cit7gRdTNy93j2CAQPDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="232837"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="232837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:06:34 -0700
X-CSE-ConnectionGUID: nPzRhKimS7K9nb7ijcLj6w==
X-CSE-MsgGUID: BwSpFtfCQaufbZDXPiEzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="277837276"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:06:29 -0700
Date: Mon, 14 Sep 2026 11:06:27 +0300
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
	Frank Li <Frank.Li@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] iio: buffer-dmaengine: Use dma_slave_caps bus
 width accessors
Message-ID: <aqerA3A1kgOB6fNC@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-7-72b8fd4cc78e@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-7-72b8fd4cc78e@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_010634_575739_948F86EE 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 11, 2026 at 06:25:42PM +0100, Nuno Sá wrote:
> Query the minimum supported source and destination bus widths through
> the new dma_bus_width_min() helper rather than decoding the raw legacy
> u32 width masks. This keeps the buffer working
> with DMA controllers that advertise bus widths via the new bitmap
> representation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



