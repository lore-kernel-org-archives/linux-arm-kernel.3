Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CBBCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyQUxm3v1jGYAkUjsCt7GxPMnjj4f96T8awcdWOCwlQ=; b=gT/7Ah9fpvaZYDqhSVyyZM95pY
	hXfBYQed+sA/EBHpV2Q+5O+reUUUhrskBSNm9bJfI/YpGyk2Ziuavb/aHwzEFewTckOnfvw4rxRU7
	VWf1YUFJ9CMWrghAwH2n4lXKGETwA5ulXXbFFnzAhm53zXj1qnnf04hHUYfsf8zD+zMvnRJqTSVVa
	WYKPsVr/tl41dm7zyWZMTEOS3wUdp9DZanZiZCQle70RGrwDnZ8jfoIXTJ4v5el8GsZA7vJ7l8iPm
	/NqNPhwI26YFcNkghGh6G3hMojuzXa8u0XfFApEMafZaQq5HUCMLn3r4GzgJqgB7+gi6P9Q4SOHuF
	Vn2dn9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlA9-0000000GXpd-2u4i;
	Tue, 12 May 2026 11:20:33 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlA7-0000000GXof-03Bw;
	Tue, 12 May 2026 11:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778584831; x=1810120831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGiDaSQhQRSB081/ItP6wnZ2UDfNrEKeW34ihRjMV6Y=;
  b=AxnA7a25BccuCOZzd3QTzbwGvHLCFE8KaUoABtV1z3YavI5MMYWoiOet
   ZI2/IYlaZyjqhKIXZtnt7t5oY7JpG42WQv7losGRgDNYpAtK75WFAI2Vv
   h1bRLNCTHua/vTjNljcuoLGwbQ7NOIWQN2p75oQrG1clYmhWuXynWhqi3
   9zA8jHFFBrzQhXbhRn6WSz2bFBfJJRDWQbevEmLrHoBMeTXbNa8Q/DL88
   EHfpSUUf6FaozbuOUj/Ku+mPtBMX6HWfpM5u/l+v0OevfGoWl81igB7I6
   s9z0yKRBzlvlf7KlxOpQKQKXRytpxbMzNJZhwu3jAPnMyf/fYqGxJN/e+
   A==;
X-CSE-ConnectionGUID: k6voVl7+RIawPfz9CNX0IQ==
X-CSE-MsgGUID: PLGfwhbhS7SHm+KcrXEKLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79207655"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79207655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:20:30 -0700
X-CSE-ConnectionGUID: LlvnaGIsSGOpgmZ9mdtdmg==
X-CSE-MsgGUID: 6nvCmJoMQA6pQGsIBkQzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233432777"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:20:24 -0700
Date: Tue, 12 May 2026 14:20:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com, wbg@kernel.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Message-ID: <agMM9soiqpG-TRSb@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-3-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_042031_120294_7FF49C57 
X-CRM114-Status: UNSURE (   8.56  )
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

On Tue, May 12, 2026 at 11:33:12AM +0800, Yu-Chun Lin wrote:
> Expose an accessor function to retrieve the gpio_chip pointer from
> a gpio_regmap instance.
> 
> This is needed by drivers that use gpio_regmap but also manage their
> own irq_chip, where gpiochip_enable_irq()/gpiochip_disable_irq() must
> be called with the gpio_chip pointer.
> 
> Add gpio_regmap_get_gpiochip() to allow drivers with complex custom IRQ
> implementations.

Hmm... Can't we rather add gpio_regmap_enable_irq()/gpio_regmap_disable_irq()
that take regmap or GPIO regmap (whatever suits better for the purpose) and
do the magic inside GPIO regmap library code?


-- 
With Best Regards,
Andy Shevchenko



