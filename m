Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C778FF506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxJ4lZ8qpN0azXDhDuYNMBFlk26kc4wHsRqoUGPLHbo=; b=br46b0AE6v78XgCL0IU2p0Jqc/
	epkav1Ja8JkAX6nKsoLCu+cuEJjMvWh8beNIayOygBQdIZ9nv8uLFRXTxemME+RGAmP9ZGYLOjL5x
	Wye7qkvyxk0uyeoFtBI+cvtL0GDgmEh6w8IeXAGoc1AtM6y1J3OeaUHQEX6xjVCk0MIrlIagw9cD9
	4dpLwYTe8guU+aR+lmd0Km5E3btN2MH5OWc7E15HdWnNbkOgS5+eDjfmGNB2RSzaMYNXVm9u53jHl
	XTz5LUUBJ7wXvL//0A51+E5zflKnd2iwy3mLeeeTvmKesg8C6Ud+F/x/I+vrk9zhPUmJmiaP5jKM3
	+T2thFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28uJ-00000004B47-0Tmh;
	Mon, 16 Mar 2026 14:26:59 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28uH-00000004B3X-22UE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671217; x=1805207217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHZKMW2URFGAFnuWPY2dSlQRkpSj1pWYiDSSZoc4g/A=;
  b=edLGMb3X2l0CBMjq1wrXwyGgFSuzrhZUifzM95eUlrRU3qjN3yEXm52A
   DmfyRyqSUmkB1fcSCvN2TexvIOS0eJEiuFrXmgsDdzcBDzV1bHRCN+ZZg
   FoqmhFCjsg3wADiRz/D38bG63GdRakuteH4euLZo9NdfcIv/+V/puBKKR
   G5oGrF6ABrcoteJWxvR/Pcqa8NoX37PDSBBYu8e20GXqzFjCjuc3klBRl
   vN4fgcdUilB61glwcDR2tObmHmhjJyUr0/jVOZ3nDHEXPuhBQWUm6At4q
   lD4KN6kV1la2fi8PP5oL3pYiKB81tU/5A8a3fP7YhCTA/qFlkCWQWb7x2
   A==;
X-CSE-ConnectionGUID: cG1y6WIrTOCSi1W62uBvjQ==
X-CSE-MsgGUID: /GmVGE5VTsi8ubFBaxZJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86039934"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86039934"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:26:57 -0700
X-CSE-ConnectionGUID: tsI2Z1KxQnWT9RmUCOp0KA==
X-CSE-MsgGUID: F04AREtNTA2z0GTK803eTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="216439404"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:26:54 -0700
Date: Mon, 16 Mar 2026 16:26:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v2 3/3] iio: adc: aspeed: Reserve battery sensing channel
 for on-demand use
Message-ID: <abgTKzfiDPFQJPVo@ashevche-desk.local>
References: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
 <20260316-adc-v2-3-21475a217b09@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-adc-v2-3-21475a217b09@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_072657_539573_957B2D0C 
X-CRM114-Status: GOOD (  10.66  )
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

On Mon, Mar 16, 2026 at 11:00:48AM +0800, Billy Tsai wrote:
> For controllers with battery sensing capability (AST2600/AST2700), the
> last channel uses a different circuit design optimized for battery
> voltage measurement. This channel should not be enabled by default
> along with other channels to avoid potential interference and power
> efficiency issues.
> This ensures optimal power efficiency for normal ADC operations while
> maintaining full functionality when battery sensing is needed.

...

> +			/*
> +			 * After enable a new channel need to wait some time for adc stable

ADC

> +			 * Experiment result is 1ms.
> +			 */
> +			mdelay(1);

Why atomic? If not required, use fsleep(). Otherwise explain.

> +		}

-- 
With Best Regards,
Andy Shevchenko



