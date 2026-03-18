Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F154103E196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLEICUz9ihJuwmY4dcR5N5+bWMHmcgeGVJdm6ITxGnw=; b=2fVSkq8ypK03eg3ea769+xJB9l
	aMMKAMrPhDP6eM8Cr7FCtXsguf+AjnvFG4LUtCHfCLtLJGKa1v6enY9cIws48bTjAisXluEzJAnAU
	QNcYRwE5m3timZfgNChWdaEcb1RTWIUauwejtY0xlF9kmufmzOEUiZWQ42Evuqaf1TDfgtnzbE/fM
	URbdMkGR6GHCUAjIycF/Bj2BJzhP4SCchGFIA/qT3Gib5CanXtQhn457XtaqwsNobWSN0a7UNrJIB
	JbmqwWs8EHeiFq/FPKv0hfCWvFb9e6v2xOtDKOdjor7PqVYeDbobuQKM7NO46yiWwOldwDV15/e/j
	hslhtuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sMF-00000008dzb-2c29;
	Wed, 18 Mar 2026 14:58:51 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sMC-00000008dzG-2hzJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773845928; x=1805381928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2iDCU09TkLNCtHevuEEnfgvg2rEWWP+vxV6PlfCdLc=;
  b=K+spFiGTiIE2MmxmXDkc6El2tU2j+oxUCRbaL330byAz4e1HFt0vzH3O
   WGb0s15mB/iOcN0vuW2A+ozlwc4Z6C2jy8tEXHoAGZ3s9thziq/wq9n7Y
   0Jktp3KfTYAqnIJ09Rx9QsOkUZq5Wnt3s7EeuCtEhMdcM3fhivAZu9lVn
   HETAUrxxWmpVEGMC6SzSfIqRKNmvvlKOtFG7iuD6sYX2Zqciu8KshQWfM
   5CXrEQ5mWpEGxp8xGoI4rM+nvF7vlTB6dtqwB+w3Jmkdv421DY+PfOcXy
   MgQoSyN2DO2NZZVzRxtxr7MSpljXPnOffl46oNvPVKIfaSMHqd6IEj075
   g==;
X-CSE-ConnectionGUID: 1wHIeAhrS7KlIi0MDmEe8w==
X-CSE-MsgGUID: BSdyIxLsQAqujCwufsjMhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92472062"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92472062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:58:48 -0700
X-CSE-ConnectionGUID: O3ynTGZcR46wY5Mle4i/gA==
X-CSE-MsgGUID: 9t+5v8boRw+ZqCq/5FIdLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253128214"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.240])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:58:45 -0700
Date: Wed, 18 Mar 2026 16:58:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Message-ID: <abq9o6OyYH9A-Y58@ashevche-desk.local>
References: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302152610.2498426-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_075848_724352_91772772 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, Mar 02, 2026 at 04:26:05PM +0100, Andy Shevchenko wrote:
> No need to open code the devm_gpiod_get_optional() wrapper.
> Instead of checking for a certain error code, check for NULL.

Are we waiting for anybody from PXA to look into this? I believe it will
take too much time... (based on my experience with PXA related patches).

-- 
With Best Regards,
Andy Shevchenko



