Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234FB108B8E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QqAXd2vpQ8qISDA9ynM6KZSRW1nNUGkKU4X69DBcWc=; b=dZ2NPCgHyfmu7IQs3MMajsUZmu
	GkRPVzTTPD2KmJppOe3++55ZCFWwOK5pU3YuzZJm9RGXDCZIGLVzyDkfzx+b/uqFpHGzxCMCPn7dZ
	/f7fbHbDZhhBZptDNAYVW5CugGNCodXg5Q2pU6RlLa1D7EtfWRU12IJpRLqCySp548NExGna+QlHu
	Wyjugw2iQ4Qf1zFaWkazR0YtmU/c71ByORUHFCnXKl3XE8UuQH3naIC3FRM890f/WPfmYGIvzfYus
	ZkXcTRMx6dv0WW21oCyDvaivRM8btpZZkmIh2tUqsnCeIr/9jkSqM2RwFefZU/xqi5MD+fgPAbEog
	WXHdacHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X8v-0000000CboN-474S;
	Fri, 20 Mar 2026 10:31:50 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X8t-0000000Cbo2-1vL7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774002707; x=1805538707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuyuF6cs3y/UPu3j5OaECQ1GK3ebCt60+TAC0A5pjBI=;
  b=gZUsMpFlalYMWJja53aHCNm51bUWJgkfp+A4HAqKWOwCk+OlGo+YYEw+
   A4JWhyP0poFvMc1/4CiaWQ+bqE5BMNM4D/DoLnsRJu1Ije4jftR2b+b/q
   oBqXPzvH9Juj8ip3IiL61gRJJtLDacAGsLo2GnCy3LbrZfENF9kHgdalN
   EmFmJmbipd/KB+kZimx7+Vx2iQQNI/nqAYHI0rn2sRBEFZm6wi1iFc1qE
   zW51l48PfYgBWGCvtIq8KRg6M+GFB5fuYDcbmB5HgyIRmNvTn0arBuGbp
   C51zggFIABM0Hjt6Bs8GUMp7Et3jEwXawelarWkapCAic3xC3E98g19ho
   g==;
X-CSE-ConnectionGUID: GSGQ+XWDT5G+tLv4sJAS/g==
X-CSE-MsgGUID: qznzMl7+SQWsA2DcIO8eug==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74100943"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74100943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:31:47 -0700
X-CSE-ConnectionGUID: cEr5vsElS/SoNYs1tc2rkw==
X-CSE-MsgGUID: mbnQAE46S0y+yWubfuve9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218618516"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:31:43 -0700
Date: Fri, 20 Mar 2026 12:31:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 3/4] iio: adc: aspeed: Replace mdelay() with fsleep()
 for ADC stabilization delay
Message-ID: <ab0iDUp6t2LuGlAA@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
 <20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_033147_508122_CE32CAE1 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, Mar 20, 2026 at 01:46:37PM +0800, Billy Tsai wrote:
> The ADC stabilization delays in compensation mode and battery sensing
> mode do not require atomic context. Using mdelay() here results in
> unnecessary busy waiting.
> 
> Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
> tasks while waiting for the ADC to stabilize.
> 
> Also fix a minor typo in the comment ("adc" -> "ADC").

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't suggested the idea, I only suggested to use fsleep() for the purpose.

-- 
With Best Regards,
Andy Shevchenko



