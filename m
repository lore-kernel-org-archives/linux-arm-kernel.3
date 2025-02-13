Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GzGABJgHTOp3nei5Fd9TK1naLhp48npkzwu2BhDcEo=; b=QelNWMbZCuxY7N7/41WEPOh3oL
	9sVp+t368dtnzadhazPR0BkNYHxxjO3Yk6+Svj0dRm01e4EdW23MzizUo9g9lyyHb2zPTJxMbHswO
	drn+hxhY7m0GCNQlr+l/rW+Lhqh0+2ZUZzCdawIayUIBq2pMP+Y8qdEBVISBAoSniIkwRjgRuW8Ia
	IvRZabF3QOmwWwuRyps3H6fjmO87zS5l2CJDbzy2EzGhO9CRiQrubsDtFSQ165zTUnfzTKZjYFy6i
	V29qdZaZvcGvqVjMFTeQ68HOpmnk0Z98zLOfixL8OWzCMiHO9hfUjkzCZ7+8M/ZHBvMLl+guS4iCh
	47PEcIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZ4h-0000000B7Vn-0y5x;
	Thu, 13 Feb 2025 13:16:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYtY-0000000B5cF-1FzN;
	Thu, 13 Feb 2025 13:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739451885; x=1770987885;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=1ao/hLWrKoa83auIAZK5YxLztQb4shphbE+wPtgggOw=;
  b=f+LcaWzma/cVsJKeb6mY1CI4ydtA5kJ6PcckfAfH8T1NgEyetkhtUPoK
   qEEXSKKy731+sgY5xMQL8dBUxrI3KKtmDUGMshAGTx9uhnRBolIgKylhE
   zYvGm/MOVFkPpj8LEcT6Q4FKrlxHgIz1DBjEJB2zGhPEAGkHIQ7BO2T5J
   0Iaq9q7JbnpexAgDvWi6VWHdPx8gQ5vjRKbOeQuFi/A1A/8XAvROGxRN6
   ncXAj4ts6+O/Y840NqtfkewIs2NrRm7y6QatIShMql6WMQaHUuVYnPtbD
   ygewgHN1b+Jv/iWVSdgZIJoksbLcOuygqtURxgbAzVCHAWSKj4JtC7gfO
   A==;
X-CSE-ConnectionGUID: iMgck7ahRbu9D5NrlV7v2A==
X-CSE-MsgGUID: Ebf582jZR1qCxg0toMb8UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62620709"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="62620709"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:04:44 -0800
X-CSE-ConnectionGUID: +jlj1GxVRC2wIJFPhxSM/g==
X-CSE-MsgGUID: 94nDy0MzRWeyG3Eoe5LYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112975678"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 05:04:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiYtQ-0000000BATf-1YMb;
	Thu, 13 Feb 2025 15:04:36 +0200
Date: Thu, 13 Feb 2025 15:04:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z63t5KcQ6tq5uDG3@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
 <Z63DT_XdzEWrP4eR@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63DT_XdzEWrP4eR@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050444_383441_B0BBE684 
X-CRM114-Status: UNSURE (   9.50  )
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

On Thu, Feb 13, 2025 at 11:02:55AM +0100, Wolfram Sang wrote:
> 
> Just a generic comment: please don't spend too much energy on 10-bit
> support. I have never seen it used in the wild. It seems more like an
> academic excercise.

Just for the record, AFAICS nomadik, octeon-core, qup, and maybe others
(that are not covered in the series) have bugs for 10-bit address mode.

FWIW, I2C_M_TEN is mentioned in a dozen of drivers outside of
i2c subsystem folder.

-- 
With Best Regards,
Andy Shevchenko



