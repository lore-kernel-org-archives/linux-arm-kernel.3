Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5ACCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T75Z0/6UYuicUfJwFfuHQPhIkIStk0qG3Y/Uteudou0=; b=s+G7unC1jrxO6mT8uG7hxgkWrG
	Nwhu+6u/hb/g99PcRV/ucMpvcxlL21bnh5S3AgJxqu1itlIqyNK1ku920PAQUTz9HEer/mD18y+pG
	qlISpSU++hQYY+GzEpQLmgnxdoY6uy7pia4ZAsD3JPQaVVFGLf5/181meG5P6j/d5nCb1+CgA9IKY
	R/eArC3ehtcMKScf/kLrMH2lCgJHHfMqnHPN+pP+Sa/tG09KVXBObq6P/rFEdS13uDlIB+D9wQCRk
	awijLFHm25uZo7eTFVDRT6cGGlGR2uMx2GdSXSo+jieGu2sgpdVfu9XPjpHakea0WJEKpzK9ps4uT
	rgLpi8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNop0-00000007sqX-242j;
	Fri, 15 May 2026 09:27:06 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoox-00000007spY-2R5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778837224; x=1810373224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3CPAkx9yIEtqzPlXREwAuQyeXg/nb9inT4H1AV0ImEM=;
  b=AWdZq1aeFlGVidX4g++SYwbL6J808HRTjm+EtqVA8hT0fjuW7+hFKetR
   2Y/6bHA50u9SUkst342ITajsHEwDTeZmX2HJqCT339Y/Tn+r9X0Ax8/3u
   DgJqZKVr7matj0X51avZUxR/5CJXn2BSuMQAGPAIGYtnoen3FfMHhdT0D
   MD7hUzJN+duo1NCiamxtf5MerRUWPbUmNiert+Dxo6u7ltVFyv0nYVYU3
   yLPMhz/15ZWwVP3IqWTTG+2s+As/HMdolqqB7A6e04y2LNgCdQ1nC5eF4
   3omYoFE51KnvCCLRkIMvkLrQGjSpVwUWMt0VxLXzqsy2iK3p96QxXBgyb
   g==;
X-CSE-ConnectionGUID: K88kp9K4TMWw9hrjCvk/fg==
X-CSE-MsgGUID: 2ySO4R9dTnipzbCKkrNxFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105248641"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="105248641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:27:01 -0700
X-CSE-ConnectionGUID: ehTBC+14Rc6nlGWd7Enpcg==
X-CSE-MsgGUID: rdDzyRzqT9eg9E+FgzAdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="232249466"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:26:58 -0700
Date: Fri, 15 May 2026 12:26:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] iio: adc: sun20i-gpadc: support non-contiguous
 channel lookups
Message-ID: <agbm3-GUqgzecUlQ@ashevche-desk.local>
References: <20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_022703_626365_41F3B5DB 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, May 14, 2026 at 05:19:34AM +0200, Michal Piekos wrote:
> Using consumer driver like iio-hwmon which resolve channels thorugh
> io-channels phandles will fail for sparse channels because IIO core by
> default threats phandle argument as index into channel array.
>         eg. <&gpadc 1> will fail if there is only channel@1 specified
> 
> Add .fwnode_xlate() which maps DT phandle to the registered channel
> whose chan->channel matches the hardware channel number. It allows
> sparse channel maps to be consumed by drivers like iio-hwmon.
> 
> Tested on Radxa Cubie A5E.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



