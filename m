Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6E9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG9nHCTvM1dTCKPm7f3ySs8mv4StPQ3vt+CXBnQbhf8=; b=ARxx0KvJP9lYn04SPocKfgX6BB
	+79BQRg3jVi/vO1Zvq1LxrX8ibF1f/ZJxpACJLkcoihkzjcrSYRGGVx2MK0oaq780pY25qrh7wlj+
	r2Me7FSuVuFOm3Gs3i++LDm1jw1Qg6tsdL9zhciyXi4VAsX4+BnkxY6UrMLQhy7amkjOmW4kYWUDf
	S5WP+i2gbWqhoUXCp2mLZnuLUM9CTQWGdEf2X0rf/Ja0YhRzrnn7UG4RAeo9IIdx7xqeDJnbxuMF5
	Ok/iLUK5OKjpxE92/6Rwzvw+ezdz/enlCX2fh5DHutBVDjBrshOdjTkYCRcAUmCroVDbuC7knCZLt
	ZXLv9SSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWtW-0000000AjqG-3SV8;
	Thu, 13 Feb 2025 10:56:34 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWs0-0000000AjcN-4APq;
	Thu, 13 Feb 2025 10:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739444101; x=1770980101;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=FC+osHMM1wMl321HcyQTgueNyff8+QNBAFPiwB2uKhA=;
  b=KCNMHMIHhVQyy+lCpUjIOV1UaSIE/yDzIG0aWIPOVDCJjRwSEk9UZ3/8
   v2jBbqkLCvUjO9bVGs5Qd40mFdkgaW6xue0dR9E619lppe8G4VBTmLBUy
   ZDUfvXCsbShOuxFF2Gs2oRq/mpxpIt9VNdmJ4Mzv/F+KU8ijdcgW6GwNm
   981NcgdQkG2NBuCG9Z0/Xx91lpiEytBDlnwPAOl4FRnpLCt1/lqBgvEYG
   2H3mXnSPpwQ7FNItrg4D0rpnS+MvvFB3ZAhIUmrYV1kTijUNCQv5LrFey
   0ntpPU9HHkBvW0vS2zZah6W6bH2YJOuQtsgWC/6p9KTx0PlKNequ0tznp
   g==;
X-CSE-ConnectionGUID: ke9j+w35RYy/V0CS7tiThg==
X-CSE-MsgGUID: wtywGlBIRbeVrpzsGJENKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51568220"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51568220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 02:54:59 -0800
X-CSE-ConnectionGUID: gH7RkWeCSpOd3hLhl3vVuA==
X-CSE-MsgGUID: qaKLpqIXQIm8x0zlic78AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118049979"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 02:54:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiWrr-0000000B8iO-2JGV;
	Thu, 13 Feb 2025 12:54:51 +0200
Date: Thu, 13 Feb 2025 12:54:51 +0200
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
Message-ID: <Z63Pe1clM4VZBmIX@smile.fi.intel.com>
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
X-CRM114-CacheID: sfid-20250213_025501_046564_F06CA84C 
X-CRM114-Status: UNSURE (   9.70  )
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

True, but still it makes sense to reduce the respective code base.

-- 
With Best Regards,
Andy Shevchenko



