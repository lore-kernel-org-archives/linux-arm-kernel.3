Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A3DC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaF/MziN4VO+EFMaiHkBZbbEKirJjIzKV4McjuiO2SY=; b=ZxSmoNvWM2CSMXeLzTiZxdNrv2
	/Fv7dNZsaOhPiZSQR0NEc6o0UffDTNwS7b/MGB2RkrGvPc6yVsx51nmZCZmL1Vkpg3yoGirvFftci
	GhQu5pcmWHc2lBiIKCuldWo/J5Zj2K/dksXbiyY2yrNOlPZyYFRwM2zVu/jlO66kvzTOBup9UO1pr
	m4m+y0lGktzhuB4azT2oX0Q2kIv1D8Jm7k0pV9yN4Y/Irl9LPbYRjgyViJNOObEck6nxVkP2db2sS
	Pd3tKMvj9hTnfxh602lcdCWhWifHZ5fRwgZcp0u0yMHGAjKdZX2Uhcf4BOeZVn6VGf1YnDJcEYCJh
	hdqiza9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT3D-0000000CQPo-2PJV;
	Mon, 10 Aug 2026 16:40:35 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT3B-0000000CQPF-2Swe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786380034; x=1817916034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6bka94qCXLkxxKxYMGy5L/+fdjutV4evZrWjERQmmK8=;
  b=GNHFv1MRLFkxaRwWv0BpT2oDICB1z/AbtFA03tx2t+QOtVI89AYotxqX
   DJATuwFlDGZUOEFgoLEh6za49yIoHB20Kiw3MWWeGDSkfj0Cndy+6fV4M
   wXS5jTVMEV8T6mR4TdbfuyqDvBTSL/uoKiwYTwXIpqI7zBI9pepBfA29s
   xcjExmxqyh6EPdDgylBI7mOo0Hes19CnYY7eX0qpi7RvRuGKy7Ko6GZPu
   XuqixbNwSNSitZFZyZg2HqQ2xpoWpoLynYY54Edop0C8rp6dEVXyVItPh
   Yt45s0xY6Pxv0PTWhCFQzZww9BPXqS62oiFNhpO1Pgi+2gm//397WW25s
   w==;
X-CSE-ConnectionGUID: +yIeEhAjTe+Pjuy4j4VXag==
X-CSE-MsgGUID: OZ1rG8mWQcGkru2Ya99lBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104432283"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="104432283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 09:40:29 -0700
X-CSE-ConnectionGUID: 6PKzKGuNRQa6Y9gd7Espyg==
X-CSE-MsgGUID: D1ZNIAGpShekzEIKt8WNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="286503623"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 09:40:25 -0700
Date: Mon, 10 Aug 2026 19:40:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3 3/6] iio: adc: xilinx-xadc: Split driver into core and
 platform files
Message-ID: <ann-96_VVW6mGzJX@ashevche-desk.local>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
 <20260729125455.95893-4-DileepKumar.Nagavarapu@amd.com>
 <amuqm5qdzXqKutPS@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amuqm5qdzXqKutPS@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_094033_637351_F9EB2151 
X-CRM114-Status: UNSURE (   8.76  )
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

On Thu, Jul 30, 2026 at 09:52:24PM +0200, Uwe Kleine-König wrote:
> On Wed, Jul 29, 2026 at 06:24:52PM +0530, Dileep Kumar Nagavarapu wrote:

...

> > +#include <linux/mod_devicetable.h>
> 
> I wonder why so many people recently add <linux/mod_devicetable.h> in
> their patches. Is there some tool that suggests that?

My bet that this is AI agent suggestion based on the previous numerous
recommendations to include it.

-- 
With Best Regards,
Andy Shevchenko



