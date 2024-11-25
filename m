Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E358BD58067
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e2VpkWq82vaaKzbwsn8oz6ppxvBe9Csm8kj7t6lq7c=; b=lDmBnc6aGes4E8X3hW0H4iQ+o4
	le5qDVSkGTrV9YcPUyXnSy18CdL4/HsRipkNliGcWTbSH4UhLjzbLWbsrHVUwhbSJ+2X43vPxCoNX
	8eBU8DzsPooes81SBiaSuYxLhqDuKpT2X9xUj2ryVEzCX9lKVTByZ5PYBbhpMgd5b9jqEHFCfZeN3
	7m12ZH9uTPuk+pWVJnZKbsscMO9tHXbreaQcMZZDgT71dTbnneww+y1CRbFpqcuvZjKakgMWVf1xv
	392GdETQtyDKEVPjEEaemlRhfBK0ggKx6rl+AVYuX/5cj5qRGDCHIHGcnntPhSN2q9n+pBQATZ61J
	PItb/1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXcT-00000007wGn-1dLb;
	Mon, 25 Nov 2024 11:51:09 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXbW-00000007w7d-3eaO;
	Mon, 25 Nov 2024 11:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732535410; x=1764071410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kSYSImDUvkzfXkaqiB+cnw9SCsDTqsyLlK3fME3dMxw=;
  b=oK2s4pmc7e3mcsFPPhrImrQlACtQ/wOlSupU6f/GgP/vo9Hbua37WkWi
   H8swLdxYBTkZqiWThIJ49YHzliFgY9LQHMIziBtew3I38OAhvE4CXEv48
   smx2jKNfUo63/lrs/w7Dk8YpZCp93fcyPd0wCrn0mBHknng2Y/MNPszSy
   9i3Wiuf64J28ZyvgPy2K6IGBaeJC9aUgd8G/kpPO9rGy3dlBxUDXuIp1d
   9wc5GASGMLAiRhASehAtChvWYrAE7u1AdTPdJu+pRisNK/86yBzrQMjq5
   9GKIrAMc4lDbwKATs4NS8mJNCtf0KwYSftGBw3iorx+vUvqHwsKIAVNu3
   w==;
X-CSE-ConnectionGUID: rQIhfVxkRIOF+hxoSMMkDg==
X-CSE-MsgGUID: lopzR6epQcK6qSSBN3RLcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="44017393"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="44017393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:50:08 -0800
X-CSE-ConnectionGUID: mhL5UBfPSYuWDQnQLKUlgw==
X-CSE-MsgGUID: 6j3M5iBBQp6hsk0gnibVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91589894"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:50:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFXbO-00000000joT-27qB;
	Mon, 25 Nov 2024 13:50:02 +0200
Date: Mon, 25 Nov 2024 13:50:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Message-ID: <Z0RkaqfID9v0age_@smile.fi.intel.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_035010_948274_8A5EF307 
X-CRM114-Status: GOOD (  14.70  )
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

On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
> Hello Andy.
> 
> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
> 
> That mean all added include in this patch aren't required.

Do you mean the driver doesn't not use types from types.h or dev_*() macros
from dev_printk.h? I don't believe this, sorry.

Basically what you are trying to say is "let's move of_gpio.h implicit
includes to become something else's problem". It's not what this patch
intended to do.

> On 04/11/2024 22:12, Mark Brown wrote:
> > On Mon, Nov 04, 2024 at 09:06:26PM +0200, Andy Shevchenko wrote:
> > > On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
> > > > Update header inclusions to follow IWYU (Include What You Use)
> > > > principle.
> > 
> > > Hmm... I think we are waiting for somebody to Ack / review this change?
> > 
> > Yes.

-- 
With Best Regards,
Andy Shevchenko



