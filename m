Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D14C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEd0Kwb2AivAH6fLDJ2jTZXPM4cUwHOzdO8EEhmSl+M=; b=3QITvscxs4tTtVJAh1wOOpf4lF
	sy0CE+ta6Z/exxFvquYAaWu4kQDJ2KWeSNF1SOoKJabElHcWttrCqpvHXMyZwD7hnUN5qEiF7ny85
	YbfRoRVCw9DBRi1nATHIV4d95XS1BWYDTxe4U1f5+nZLSavajXaLRt1K9fzOAtSdweGJEBAf6s6YP
	inTB+voIWKSkU3sSLFG/KCVZB8IzIJiXz7fbHuuOW9Gi9OU+IPIMlDNHRPURv68wDJzdOGGdyqSsf
	uYDfmrajvXu7XjV1eKaNYWoqSUvl9VgVNsoKB4gFC8wbx6meLT/JCzZeQhJFBjRdnzISQ4zcvConJ
	SOwKsPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Icc-00000000fdb-2AFB;
	Sat, 12 Sep 2026 07:58:02 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ica-00000000fd9-2ZDA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 07:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789199881; x=1820735881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vXC/lz8sDS7vIK7kkmOHAKB95vRwZ8MKI1dgipjQ6uY=;
  b=a21iApI6lIn8l4zrGQjoSdP5qeVjRhwgvQ2qayS8uB4MhTP/tk8LZyJT
   rOAzRx4CZBffmLQ3zdWV0bHO/EaczFHhLaTk3+tDg079rlIuY4EVRqthg
   Ulqsicn/+nBk9Aq7Ih6R+7J7NTGiY3ChDR7J4keBztvjMqnmTJRvg2dUG
   oFHTYkfTB6PcCUGsJDxe7UM6L6uYw8w3k/a1BCLoins53BhTxwV15Z1yE
   xi2GPTlM03dgBmba8cg/tP+qglcEbPJv8yaJ00Itj5vg9SOjCP4vOsheS
   w5EvAnZ0mHqXXdmu6JMSRfc9zGt0AT9y/dPmlizlEFHuh2wjtRJReupFD
   g==;
X-CSE-ConnectionGUID: nd6kTDtjSvudrccfU5UCXg==
X-CSE-MsgGUID: 0XEP+be/TNeo55MAiqg1kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89691831"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89691831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 00:57:59 -0700
X-CSE-ConnectionGUID: bR4opzlKQVmHrLrg7T0zlQ==
X-CSE-MsgGUID: wAgTxgzzQDaNadMqh9H5pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="268851514"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.230])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 00:57:54 -0700
Date: Sat, 12 Sep 2026 10:57:51 +0300
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
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqUF_8g-DG7GB1pM@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_005800_723343_BE589BBC 
X-CRM114-Status: GOOD (  13.48  )
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

On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> In preparation for the bitmap based bus width capabilities, move
> enum dma_slave_buswidth out of linux/dmaengine.h into a new
> include/linux/dma/engine/types.h.
> 
> linux/dmaengine.h is included nearly everywhere, so growing it with the
> new interface would make every one of its users pay for it. Keeping the
> basic types in a separate header lets the new interface live next to it
> without that cost. linux/dmaengine.h includes the new header, so its
> users are unaffected.
> 
> While at it, add the missing kernel-doc for the enum members. The block
> already opened with /**, so kernel-doc expected every member to be
> described and warned about each one of them. Describe the UNDEFINED case
> in particular, as its meaning depends on where the value is used.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



