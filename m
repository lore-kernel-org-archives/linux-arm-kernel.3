Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF43C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/6dlNNzxrep/I+kUXeBP0Zntpy18OdT5rMs8LfTOhI=; b=DQ9sHePrazClDGpb9aCbP6ZA8j
	apX8/UBLPgVaot1QrM5z0R+7a8wdEbth4PyKonnDyAZJdcXsspRh08I7javkukiVtPAozOUb/O0m+
	1609y56sh1hlwzDguyeLbd7YbvCpfhOsfJwAJQxpV1pzNy8Zy4W3pzRHF6d4KNVQFmxNFexI9WyHr
	e2jPTvzQuTto9eyW27RWYWOR4PypNSqYVR7ugFqzERlkFU0/4hFBGIim0QRrnRb+Ht8XsDUrFy849
	q+uAmxU1idDkb87PsThq3Spz9kvNRAxiZe+CWRv0Q4gi5SpSG95qX44P03Xn/KofH0qfa58q+/0x/
	XRK8bfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmH7l-0000000ANyN-1Blr;
	Tue, 21 Jul 2026 20:31:33 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmH7i-0000000ANxt-485y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784665891; x=1816201891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mELpT8EvpAt86dh+Sl+XOiKX3cuLi6TaXGjWeybKb3c=;
  b=iP4XN+Igw1puPa+uAtQgahHWgeJPBRGQPWOVSS2PPn1dSLvTZC6fZfoL
   +VY0PY6Ihacw+Llux7Kd8Lf7vG9M8kCm1ZJL3FflZHzyJo3A746TjC7g/
   VIOpWjyv2ANzhqHWTA36h/2evu0J30PjPJDGYeDpyat2kOUk+6Gw/pnjZ
   SMrbkNmpBOMWRD1AI0dli7BCWk5HgkRxIxpc/R81tmXVKKruBug10WezN
   j0fqcrGg3FWEdHO9gKxQlv13P61Z/hJizMUy9cclJUFbzlOv2nlPkkXJO
   5pyJVSiLE7cQJ1mI5lPMXQ7i2a7/bGN5jNrzz+vV4nZHXzVGfrEaQj1gf
   w==;
X-CSE-ConnectionGUID: DOSBuig1RdCskQi+d2DcYw==
X-CSE-MsgGUID: Qfw9B4eMQ1ikZIhKZEKGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85046555"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85046555"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:31:30 -0700
X-CSE-ConnectionGUID: iT9pIwoOSTusznNhX95K7g==
X-CSE-MsgGUID: 1l8sK7okT1O+xBqBdpftvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257940865"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:31:27 -0700
Date: Tue, 21 Jul 2026 23:31:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <al_XHWJktSD_MWHe@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al52kpB1hklx5guG@ashevche-desk.local>
 <CAAT15mOxrJxb+jRf1P=yu=vXgDj9kRhrdSLkB8v4tEbhHOZ+Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAT15mOxrJxb+jRf1P=yu=vXgDj9kRhrdSLkB8v4tEbhHOZ+Pw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_133131_058177_3D67C64D 
X-CRM114-Status: GOOD (  19.19  )
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

On Tue, Jul 21, 2026 at 10:49:17PM +0800, Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Jul 21, 2026 at 3:27 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:

...

> Thank you for the review and feedback.
> 
> Regarding your question about why DMA fails on this hardware, I have
> just sent a detailed reply to Lukas in this thread outlining our
> physical verification findings. In short, I confirmed that the
> DMA controller's physical interrupt line is not functioning on this
> motherboard,

It might be wrongly described in ACPI tables, but in HW it works.

> and macOS and Windows 10 also completely bypass the DMA
> controller. Please refer to that email for the DMAR/IOMMU and
> cross-OS analysis details.
> 
> Regarding your other comments:

> 2. The force_pio Module Parameter:
> The original spi-pxa2xx driver is designed to hardcode DMA usage if
> DMA channels are available. I introduced the force_pio module
> parameter for two reasons:
>   • It serves as a diagnostic tool for users on similar hardware to
> easily test and verify if their issues are related to DMA.
>   • It allows developers to easily test and debug the PIO code path on
> DMA-capable LPSS hardware to prevent regressions.
> 
> That being said, if module parameters of this type are strictly not
> preferred, I am completely fine with removing force_pio and keeping
> only the DMI-based quirk for the MacBook8,1. Please let me know your
> preference.

Neither is preferred until we will fully understand what's going on there.
Yes, DMI quirk is a last resort, but to come to that we need to try better
options. See my other reply about the DMA case.

-- 
With Best Regards,
Andy Shevchenko



