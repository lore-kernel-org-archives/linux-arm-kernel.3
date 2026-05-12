Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC650CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8dPxVWRLRxQbXg/hz6I3Mk1xu2etFhGz0aLIBW0GUA=; b=a7CHrI4qEaVP9e81OCTsJoKbEN
	/zAa2cZI1XeXw4XN3n9GOKuwsFsAuJHk0CqomxCmZOrmejWumRafGLNDgL7hvCtgmRWqJuiAE5SAV
	uSiOnenCee1yUyVWMiEm1ioQ6CRTy3xXED0kxU+YomEWIM8HGuUcVvywXlp834pGE9y99hJeC6tC8
	hl7KIIWS7UBJLIiY5fOWKSvlZusiq4m69l9MuOyXxnfgNcJSC8pjNOskKIhIObg3o8YyoH8Puudnr
	ptCX//rNmzg4xXgdrqfjUhH/3Kq77HG8Ca/lwXFXrIOSGyPAf4yKkfSlNG//J4G3SVS+9ZLRVfO+N
	ap5JZfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrbJ-000000003qz-3ETt;
	Tue, 12 May 2026 18:13:01 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrbH-000000003qR-0rz4;
	Tue, 12 May 2026 18:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609579; x=1810145579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kVfoR+AdplYfIvhGONb3dXURbBAhg05PeV7RbNU8OdA=;
  b=GnpZi2XyR0gwxZMeLWxSuuNNEAlwHu/Q4NL81MrO7M1TWvHkhBI0eWmd
   8tJaBXQCo9X1iVuovojgvywa62gg/lWJA7nHKfzYoK48+OzVnbj9WqV1V
   CyyxsLVqLRxnbvdQLpv0Cz2y+9SI/fMsA4WzPOYN0+aHGeqDJcUZSwzPb
   W7BUTCowYpvQz6Xamo5mf9o0MhazFqI8bQVGqKl5BSzhB+ksQjBcd1DBF
   RKfTbgTGxLiJp0UqgQ7D32ZuSpQh5bKFNQLKhNO7R7JWCffiz1dj8NFNS
   dZfBSu+9Jkourdjg9FJTTrgwJi/1XHYUTCyuE/odSt81IcamNPTv311tW
   w==;
X-CSE-ConnectionGUID: bNp1zdVtTZuejdEc50ZEHQ==
X-CSE-MsgGUID: hBDia310SraxH17Vf+7ibw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79549991"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79549991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:58 -0700
X-CSE-ConnectionGUID: y73hOpATTu2pBU/3FyrbEA==
X-CSE-MsgGUID: nDNi67M3SVG6IGS6BXBILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236986462"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:53 -0700
Date: Tue, 12 May 2026 21:12:50 +0300
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
Subject: Re: [PATCH v3 4/7] gpio: regmap: Add set_config callback
Message-ID: <agNtok_vgcph1TZK@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-5-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_111259_286149_697911F8 
X-CRM114-Status: UNSURE (   6.93  )
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

On Tue, May 12, 2026 at 11:33:14AM +0800, Yu-Chun Lin wrote:
> Add a new set_config callback to struct gpio_regmap_config to allow drivers
> to implement hardware-specific configuration such as debounce settings,
> or other platform-specific GPIO properties.

Okay, if it's needed...
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



