Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7208CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCkYYC6v/BreRMrWAsS/EDBBuECL2fnseS12s28lNAI=; b=zhl1D2z+dMq3CypLVZMt6RVpS1
	/WUju2A2dvpAR7p2mrPIOudwEb/pGBIt+QJZvX+Wdz5NS8GZYvDxQ0U62A5kumyF+d4ELIThxPEZt
	x3gJGjXrwRnkVOwHE6Y/TTuP9dNqvWa5YligjCFwZPIk5VWmI9iaWAt/T6qS99jPfMVnQ7iJRKCgD
	k0bAemTXuokWtqMRzQYgqoY21PpJU8ZheLEANGIEHzL+/12pbbB5Q++FXMcMzln9SLNRBuYYx1Ava
	msRYAOxEwqnRfS5MHdzGrRfmr7cqZOEq+HvHBArg0tamsY1iWf9W6w7sdMHf8gzGJ1OgD/Yc8gjFf
	eRPMesCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXnF-0000000Aqmm-0J78;
	Fri, 02 Oct 2026 07:34:57 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXnC-0000000Aql2-43VB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790926495; x=1822462495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LAqCXjWcEhA+NMDRpZZ0gzroQBLg4coCBF1VGUyHcCk=;
  b=GZxPd0af6IhSL8v7dDPP+PVt662hWR21GCxxX4P0WIxkazec+FsRa1l/
   /1Or+v3BowusaTiPuiXwbIOtTwmCn/ZcCWiLmdeArzwgohcqiRidA/qgS
   OO50o3crssygSQLaRTKD34RyNcAWzT/rd/mPseBMqgtoAODy5pTe6D3KN
   D0JGJ4flAN9c4S7ClkmxfOEB9FaSP2yNFETuI5o7vvYTrb4J/OtFrvBNq
   KvscOcl2bjYKEOAInMujlgHU6xiL0eCVOPoMQPLpYYo+ux0nUwIiPyKPp
   g7apRLOZ3pSqeIXy4mH8lZ51VD4IbsVRZk+N/oavbvQzwKqXfcyKj+JmL
   A==;
X-CSE-ConnectionGUID: /e0xN2IiST+2VO9GMMXWIA==
X-CSE-MsgGUID: JXTLk0BTS6Kvnqm/J9i8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101022380"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101022380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:34:54 -0700
X-CSE-ConnectionGUID: x+xxJ71wS42dlwxUAsn9Xw==
X-CSE-MsgGUID: 5nLUqPeIQmuQ3TadL1+U6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279450625"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:34:50 -0700
Date: Fri, 2 Oct 2026 10:34:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
Message-ID: <ar9elr1_tuFhJi1r@ashevche-desk.local>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_003455_039701_9DB4754C 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
> The Exynos850 ADC controller located inside the CMGP block differs from
> other Exynos ADC controllers, mainly in its register layout.
> Specifically, the data register sits at offset 0x08.
> 
> Abstract the read_value() operation in driver data exynos_adc_data to
> support SoC-dependent data register read callbacks.
> Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
> It also requires its own hardware initialization and exit routines.
> Add them as well.

Split this to at least two patches:
- add .read_value() callback and switch existing users
- add new user

-- 
With Best Regards,
Andy Shevchenko



