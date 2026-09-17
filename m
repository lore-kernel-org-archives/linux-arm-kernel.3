Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87EAC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh72jO49p04PRkreNf+ii/VDb1IH8XwrXdrV6KO/67E=; b=dBgunAU+hqrr6Vv+DsLTgAWMxZ
	6boL4rDurZ/zryi6w28hxtRx1T6zM5CKZ6c2J+GWSjaShMIMWVOmeFt5qVjfP15gBFwV1KDsrN4v9
	keJ5CW50OO/G6ywZDGQnDltAXIGvCcVJS1lUDw/f0vBf12lwem30rYVPz0HxgehVHFCOVCOBh9zI2
	LNT+mpKZ3P+Bm27zVBnYyrZ9SugQak+pPocsvOngcwNXr8cBNPSoQ5CjMyJPMSPgBLX6Cd7SEG6sh
	+A2DIFw4Z0ohoX54nAByrHI5v1HeWVJsx2JefdhOpFUGqz0DEykFnXLSGGPqn+toAqLVsHmCFXbqG
	WKTWC3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75kV-0000000Afwx-35RP;
	Thu, 17 Sep 2026 06:37:35 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75kT-0000000Afwc-2jG9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789627053; x=1821163053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=78P9uDbVpVsDBbxBNte9yapveZ3PtV/4i6FzzhSTwKo=;
  b=Tz/Rd+4oSKS4IWvBTPoJ3mQiXkJy2hJILMBK0sQRpgFOip7bmnNXpzgv
   NDgGafD2wqp/qWvBQ315Oqzwa+dDTAXU6EWD7RATqeY/lydw+8z4oL5IU
   V5UonmLKNbBScLI5BW6Gd1M5q0yoEvAs5jJmXVH4JfJOVpELT+MvTjSOc
   /sD3+yzmJx0cNFIpnQ7TGXSNIvWbP0kKbjrkOYTptXWyCRtezU2SkVjsw
   qQ+tmLLO+ACeLJwaTXSQoJcTFZ8hPwwFL2q3atUW3tgbIIjwykhi33A8u
   QRPlnOuN5At6qcG6PSF2b2aZXejbugwQ8y/h9LIV8blwBLJMNvNUCH9wi
   g==;
X-CSE-ConnectionGUID: eFhF2lL2RV2Ez5RLZv9WDw==
X-CSE-MsgGUID: CGsalZ5yQNS98EXkpJLG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90151628"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90151628"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:37:32 -0700
X-CSE-ConnectionGUID: Fa8hJPMZQrqasr8yiCW3dQ==
X-CSE-MsgGUID: OkfdFBPIQg6itJ72x9YO/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1829865"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:37:29 -0700
Date: Thu, 17 Sep 2026 09:37:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: stm32-adc: fix possible division by zero in
 processed channel
Message-ID: <aquKpzrNNpX0gy1c@ashevche-desk.local>
References: <20260916-adc-fix-div0-v3-1-bedf027a6e7e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-adc-fix-div0-v3-1-bedf027a6e7e@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_233733_733539_A3ED4F68 
X-CRM114-Status: UNSURE (   8.93  )
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

On Wed, Sep 16, 2026 at 07:15:04PM +0200, Fabrice Gasnier wrote:
> In case the conversion has failed or returned zero, processing *val
> can lead to a division by zero. Need to check for errors, or converted
> value is zero, before processing the data. In case the converted value
> is zero, e.g. the Vrefint channel, this should be considered as invalid
> in all cases.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



