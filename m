Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E512CFD364
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTc+iHYIfY6BT0FJuK7oQoucYlObBps7bEJ5JLzDQO8=; b=PmXQXYw580DZ4ohYNlHW6ARmse
	a6muBEsieYYrHgy9842BKkJXDIh9yjFUkDAI6I0QnSP9ii6hj8k6xqJ/d8hXYs8dEMoXAzcRDKAMj
	7t46Tjo/OKZcI0fX/ll20WjBCFyyHhk3UHQ9ZYZRXLc6X4K1xOREivr5DigjQoPPyqSpuG9lTlYqF
	zFuZlRSqD3KUtJ5sYTzVzyvn1gLAUMzLRBTtPQNuOnkFJy6gZHabkkB4zEyw0FbChRAbCV/xZxJmn
	3KG1w+/4MT8jq3WWQR+kQ8+R1kUFUZct6zqTkDyizazFKlhqG6XzITuhXtSbCUWfFlDifCekwvJ2i
	muuqviiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnK2-0000000Csg3-3CPK;
	Tue, 25 Nov 2025 07:18:46 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnJz-0000000CsfL-2OHd;
	Tue, 25 Nov 2025 07:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764055124; x=1795591124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/X+wco292UFJAKK39s6qaccyy9GGH1wWRxkeCx6P5qw=;
  b=EJodWv/q+w5Yl4a4bVJSIRu1c1K3DGoQW48ZJmwd9IeSzgWeC/mzJ/L3
   4OOYT0jRorbigNHuMx7o7j0YOKtrcmqzDttQjRPgh2NFjSXRE3uyWHyuM
   HKWQLL4bRq6qrc5lOfVgVu5UOjzHmof4vjhJEhmGAre9GQgzRTpX19bB6
   ldW76n/zmUZG1y7RajctYHTMnT9y07Z+O+llXqFEte4XI50tSDsHZBBAV
   T1QivDwybaVH9J9dF+6tgzkBXFr7CiEA/U2FqAOh3ZK9N59r/ifXfIHEh
   GHq+Mg7RxhV4UHrkMFI7oJ05PoSEtYWOBAZlx4Qrj59RPxcuNXjEbW7zE
   g==;
X-CSE-ConnectionGUID: MjET/q0lRDSnb3h+nbuv2w==
X-CSE-MsgGUID: v8MLXfmyQ02UT5AkZKxvPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77176688"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77176688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:18:41 -0800
X-CSE-ConnectionGUID: BWEPn88hRXSOdQ6eSCA73A==
X-CSE-MsgGUID: n8YhzwQNQE+i8HSVsoquTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="229840402"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:18:37 -0800
Date: Tue, 25 Nov 2025 09:18:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v4 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
Message-ID: <aSVYShXLirW--bYe@smile.fi.intel.com>
References: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125021051.857159-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125021051.857159-2-mikhail.kshevetskiy@iopsys.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_231843_688464_DD4A6430 
X-CRM114-Status: GOOD (  19.17  )
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

On Tue, Nov 25, 2025 at 05:10:49AM +0300, Mikhail Kshevetskiy wrote:
> Airoha EN7523 specific bug
> --------------------------
> We found that some serial console may pull TX line to GROUND during board
> boot time. Airoha uses TX line as one of it's BOOT pins.

I know the term bootstrap, what does BOOT mean?

> On the EN7523 SoC this may lead to booting in RESERVED boot mode.
> 
> It was found that some flashes operates incorrectly in RESERVED mode.
> Micron and Skyhigh flashes are definitely affected by the issue,
> Winbond flashes are NOT affected.

NOT --> not

> Details:
> --------
> DMA reading of odd pages on affected flashes operates incorrectly. Page
> reading offset (start of the page) on hardware level is replaced by 0x10.
> Thus results in incorrect data reading. As result OS loading becomes
> impossible.
> 
> Usage of UBI make things even worse. On attaching, UBI will detects
> corruptions (because of wrong reading of odd pages) and will try to
> recover. For recovering UBI will erase and write 'damaged' blocks with
> a valid information. This will destroy all UBI data.
> 
> Non-DMA reading is OK.
> 
> This patch detects booting in reserved mode, turn off DMA and print big
> fat warning.

...

> -	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> -	if (err)
> -		return err;

> +	if (dma_enable) {
> +		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> +		if (err)
> +			return err;
> +	}

Why do you need this to be conditional? The settings of DMA mask should not
affect the (in)ability of the device to perform DMA. I.o.w. it should not
influence PIO mode. Can you confirm this?

-- 
With Best Regards,
Andy Shevchenko



