Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B385C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL6jKas1cmdLyBHfqWeojKDHQRuRtzuhcu/gUwSMtHk=; b=Xrysc3AWPqFgVrSrHJmtflacse
	sEhevXABM5NB3RCEi1Z5CSAKfU0l3GiLN0ORWjNOqJx7dV1ovZ7CEt+oVPTMV2U7RnLogy3OmtJdm
	y/gERQGnxxLcnM8Lypx7ZnoklaBWsB+WKSmjNhntJnm5l9aswXFKLQiGpXq7Dpkno2Cta2xfwksmH
	D5XV3mzRlT9f0mNNXyp/0HvkWjuD/q27nP0UZSz9g1bZnrtydCooynGN/GppQEWab+x7EpS00d+oE
	BWFrckeUfijgskPukYLsIuPvb00JAkkGjPV/p7ZDqRbBGKsZQY4m0OfZkyg+E0Apl3EPVdcYAjNwe
	bb2QOsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mIP-00000008tpw-3rFx;
	Wed, 16 Sep 2026 09:51:18 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mIG-00000008tls-0RHN;
	Wed, 16 Sep 2026 09:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789552268; x=1821088268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIwWPNKRQ8FW7Bu3jbEPy9yWyv1Y+CRFZBuPobR95d0=;
  b=WSIipDdzxEAMVRuShekuIWphl5WaGPdtNe7r7XOzARhPxXJdkm1gvB+Y
   JkKbAaNka2+L3d7S1+/l+VHAqLbCZ4R3gf7UhEO9wj1SW9E2klbkkfP08
   UyHoxH3aiEj9o+zMidCkHaAqxWOCcvyBuLxaR6OMY4zzmCoZGqMjNkXow
   86bPdJ6ubGycuZWHSPqcPgeE4IOhhLr9c+ppx95GkF8SKAWrwNoDBEbAs
   KFRbvhqNMyxuVfjpixjI1vFhYHLXTvF4ORX9FhsN5qDiO/LpZxGi8jH1O
   bzeYlXqPCwa644GVT1HMWH49fWeNY4++MOMh2qpXo6ZmiITYwH1Lwh/Lw
   g==;
X-CSE-ConnectionGUID: F2KUMXLjTGikjIni6oSIUg==
X-CSE-MsgGUID: 1u4U3+ArRBGAXsSI4Uyw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101270152"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101270152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:51:06 -0700
X-CSE-ConnectionGUID: KfvqFqviTauBpXirtJ5MXw==
X-CSE-MsgGUID: RK56W2AkRI2hfojlaoS2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267080866"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:51:01 -0700
Date: Wed, 16 Sep 2026 12:50:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
	Roman Vivchar <rva333@protonmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: Re: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <aqpmgliQW7FW53o5@ashevche-desk.local>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_025108_193094_816F1C68 
X-CRM114-Status: GOOD (  10.60  )
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

On Tue, Sep 15, 2026 at 11:15:25PM -0500, Ryan Brue wrote:
> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.

This doesn't explain why a brand new driver? Perhaps we have existing code that
may be updated to support this device?

-- 
With Best Regards,
Andy Shevchenko



