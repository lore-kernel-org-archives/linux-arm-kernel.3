Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C80C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq6XBwo/n1ylbDzJLrpKU8LcJDZWVEE4G1S4XxsG0qQ=; b=O2tYJelN+IK+LZKvbh+lmIlhv1
	UwpIT7b5kFw0g+TMbp0WPQH9NYGbi6lljxSztSsGDveHvWjw1zoHbgVZPMrn46Hnv2sUocvnA+4QX
	b4s5ID9AxTCk3G1nPEvDxMYugaCvMZmJF0hKCv5BVPVz0cDndKDiRhd1SpSVX4FGLxvaOoCKgdJSh
	gLtbwgFaO1edo7hP0vUIn73+FulTlvtLEpH7tKVJQWM06mWheVfDaoW/mBsgnFfRrS1vfIrCi8gyf
	7DVpfXn99QSvhyASRLS7X3Q9lnEBsUVFCfDm0vGoTL61FEeGOoqCHtuMQQVP+ZJnO4r0dyTczN4sT
	hpAylnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU35-00000009T5F-1tYD;
	Wed, 25 Jun 2025 17:36:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPVt-00000008fV9-1v0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750855565; x=1782391565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2Q5pv8/n1x+u1urkiz+OyiZd1H1/C8DF5+taITB/dQ=;
  b=SGFjyBvHYZyp1+Pj80VuazIyIe4+NXu/RHEYLH8RbCBg8g4gFVuoVl/S
   NIJAH2OEsCPcaXBJ3LSQNdDvjfHz3/7PbEN/xOwg9WcRMaQUMg2YA1byI
   EQrVUt/T69x+/501sXGOu2GTHrQ8znO21Nxr42HBI/DwxO1Hkt3VUqWYl
   cJGxU9jznsFBtd3kZFrPrlnaVGEClAJB99OprKb/NWLExGwZ8cklzgOXo
   hfDUAb29w4ZFaBRv8J4oa9VWGqqbZ/Ho8/6hWforADfuSzhpjgCMtAfyg
   mXxzF644MLqnWKKUW5Mp9KqdC/MHLVTxaETz2epQ5COi9EuChMGIjoxid
   Q==;
X-CSE-ConnectionGUID: PYqoavV/Sh+dF1S6nsC6dw==
X-CSE-MsgGUID: cR82z2C8Qt2WQEuHn7zfNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64183629"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64183629"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:46:04 -0700
X-CSE-ConnectionGUID: BJ7SMdQuSVmu4Q7VYDrZEw==
X-CSE-MsgGUID: OM33N+tETeSr9vYH4S1pZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151629821"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:46:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUPVl-00000009lm4-01Fh;
	Wed, 25 Jun 2025 15:45:57 +0300
Date: Wed, 25 Jun 2025 15:45:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 11/12] gpio: tangier: use new GPIO line value setter
 callbacks
Message-ID: <aFvvhAo9BRFpy7Uy@smile.fi.intel.com>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054605_540301_DF54FD1E 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, Jun 25, 2025 at 12:33:34PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



