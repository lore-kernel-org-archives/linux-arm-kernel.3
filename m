Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5095D0EE1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzpaTYZInXtHQD8ED0W1x2bfWI+VRuHD1QtZI9vQx70=; b=vdYt5juUei1b+rOiogYpqEopDz
	n9dHYGyajMlEdy6CAK2Xzfdru0FukiRX6fMXUnRZSjWt9tL+gapnlZ9EEqjptIVriLritj9FMiH9V
	YbRVHXaIb7XJUeyZ7WppDXap+N44giG0uZCVNfzBlPItu0Y8YyET8Ntye4WlO8v8E/LeItrhu9cF4
	lvo0vkpUqrNNGHGal516XTeydn88PdxX0iOo0CX2yCDI0x9CvpgX7ZvZ3U6PErt2bOZBbsepEFIwU
	TvKwJHQrcwZmmi9Y1o0SNrZQ9668CYeJuBKnIVY61vk7F41Wb5HtqyVMBpgn1JGY5C8T+TkTTp5BY
	EXlu+k1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzV9-0000000Dtc0-0uKf;
	Tue, 25 Nov 2025 20:19:03 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzV6-0000000DtbV-2Fxc;
	Tue, 25 Nov 2025 20:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764101941; x=1795637941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C/nczyx82VZaS4AmQR2UYzKvFB2krpsUMY9RzoSPWb8=;
  b=Lo1ReI/vu7MpK9+/yGpGO5414ceXr79EvgK9nFdFQwO5UbXrJTAD42bH
   b6ML72HyMZrFC7Pn99L9504K4DvcRVSA+zmLmxcyS40/Mb+Hd9owsFeMH
   C/sirUhDgbaZzezrJj9wkhRvXU+2U3JvBC212PwQ/3hNOy9YnEZJCVbtl
   bIKzxbYYjcfemV+52F8/DkjtCk1RrPZFBFgi67GRdLcQXTLhmBKXnpB1i
   ZyG8GvyMtjtfLMChEaGGeejMQmR2Bub5+Pq0EiKVpZBIG1QaoRiwA47y+
   2boeTJBwUJ41bUNL68IRVzD/0EIRIItx+4UDn7E6vd0711v78WyUm6obg
   w==;
X-CSE-ConnectionGUID: K0uWeLPpT0We1DOiU+Glbw==
X-CSE-MsgGUID: XAHK//yAT+2XCSUipIbWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88782062"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="88782062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:19:00 -0800
X-CSE-ConnectionGUID: WwcUIy9TQAutStddwldHXw==
X-CSE-MsgGUID: UUiqtk4+TIehTgfExfLoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="197862607"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:18:55 -0800
Date: Tue, 25 Nov 2025 22:18:53 +0200
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
Subject: Re: [PATCH v5 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
Message-ID: <aSYPLWKEz0lzBtjf@smile.fi.intel.com>
References: <20251125191635.1075027-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125191635.1075027-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125191635.1075027-2-mikhail.kshevetskiy@iopsys.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_121900_636434_55934E9C 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, Nov 25, 2025 at 10:16:33PM +0300, Mikhail Kshevetskiy wrote:
> Airoha EN7523 specific bug
> --------------------------
> We found that some serial console may pull TX line to GROUND during board
> boot time. Airoha uses TX line as one of its bootstrap pins. On the EN7523
> SoC this may lead to booting in RESERVED boot mode.
> 
> It was found that some flashes operates incorrectly in RESERVED mode.
> Micron and Skyhigh flashes are definitely affected by the issue,
> Winbond flashes are not affected.
> 
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

LGTM now, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



