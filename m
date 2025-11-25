Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F88D0EE1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jrlmrv+WE1d+q+BZ0HW8yQDBYRl1yl+/6bzuMswpF0=; b=iwntJspVeZpXQuR6wljT9s+hc2
	yE5p5jXfSE4qbxlfFjAiM00OIuv1CA1aSD36hyWAKYHmuCvXubgeGsIIcjmm3LiezsXuccuwKbIc6
	AKwMc5SMfE1UND6EwPdW02n5eZhaN3HxHoJDsjd4H/nD9ucme85fipyqNGv3Uc5MFtaMGSl9buIpB
	trjvC8895T0x1Wr+WeeZ+f5wyk5hgzzMnZ/+MpUZaKu/TK2peJlIpdWliMWX/cO3EG6w6ipW1C0ti
	7YWbhDJLTtBJsEoQCDTHrK75DMNYQFzn3jfrLuIuhf/d0HeH5i5cSUQlNcwR5pHGSYap8MmFq5bDS
	GrZsk8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzab-0000000Du3a-35Z2;
	Tue, 25 Nov 2025 20:24:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzaZ-0000000Du35-2kjm;
	Tue, 25 Nov 2025 20:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764102280; x=1795638280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nlQgA8SwbQHk5U14QPjlZByfr1U0IgvDlzMgeQQE/KI=;
  b=SHMK0xk+sTYYUE6Oc3ds/HCz+QHEtp63jw7/l0m0hVZHsGLJ/soYtGtU
   WmFA04bbjQfRb+zfGxSXBYCDwraM3sSSWJLGIyBfulaseQbM/dis8gdsL
   UriedIFDY+xQ0wDXR9p2g5vGZOiNQzke3xx31wZV0d6KFOgqU3TxmHuqd
   qfivKbf2uIZWsTJ8Q212hDpa38+LEvMCma8XSh1TlD4TDlRcvOFM1tSpt
   u9MBCjm1q/iKbImh3ZoPQTgWAq6tTAXBsyJ3hhUhaA67nLi4ODfjVsUo4
   zMUnOYuPGoN6JmJsaNh0y7IjgP11CRGA2n3l//x5FMjtdvj8BW7aqoxAz
   w==;
X-CSE-ConnectionGUID: TQv8uylxSiW+L3fH/dP4mg==
X-CSE-MsgGUID: xwu2wT1WS8KahXtxthmg3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69990521"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="69990521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:24:39 -0800
X-CSE-ConnectionGUID: gSiRx9hWTuul5+64L2UjIw==
X-CSE-MsgGUID: 6tBO7O20TrKO4OAE7VUosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="223722026"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:24:35 -0800
Date: Tue, 25 Nov 2025 22:24:33 +0200
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
Message-ID: <aSYQgZR1YoVQkbxC@smile.fi.intel.com>
References: <20251125191635.1075027-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125191635.1075027-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125191635.1075027-2-mikhail.kshevetskiy@iopsys.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_122439_738741_E834CC13 
X-CRM114-Status: GOOD (  11.65  )
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

...

> +			dev_warn(dev, "Detected booting in RESERVED mode (UART_TXD was short to GND).\n");
> +			dev_warn(dev, "This mode is known for incorrect DMA reading of some flashes.\n");
> +			dev_warn(dev, "Usage of DMA for flash operations will be disabled to prevent data\n");
> +			dev_warn(dev, "damage. Unplug your serial console and power cycle the board\n");
> +			dev_warn(dev, "to boot with full performance.\n");

One non-critical remark (for the future), the '\n' in the string literals when
we print messages has two meanings:
 - (obviously) new line
 - (seems not so obvious for people) flush the line to the output device

Due to the second property the messages might be interleaved with the other
messages (assuming SMP machine actively doing and printing something), hence
your messages might be split with other and imagine the user who gets in the
middle of the text something like

"Usage of DMA for flash operations will be disabled to prevent data"

The first thought will be "what the heck does this mean?"

TL;DR: place '\n' with a care in the messages to print not only here,
but in general.

-- 
With Best Regards,
Andy Shevchenko



