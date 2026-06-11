Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B283CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPHVCzEmoRH38kBZNJG9WDA/L2U05T7qfjobfhznPlY=; b=iCGKoO/alCTsXBCRy/132JdBXG
	C9sbPlfCJA0yTWnghW6ejX+6njqQJbEamOxpYcZhRin8EM97S/PDS4fYJBk6yZNvp9sYI/d8mBG1U
	wL4BkbZ2End14moWrApPiLuI5KmoA0iwm4w5Rk8+s4KteGE7nX3a6EHcjJu3qbbI3sgzHxTGwWdD5
	iP5Y8k6Lqmktcz+ZcH/NhKKeSe7mnqGNYrFSy73zF1Pw4sspNsmVelxLtOvZZI+qe7WgdcSB/UKQy
	bpP4EQLxMlDkvwfdq9KgfC+8Zd3khqcWVPudNV0DsmiUzxzOuwBob24CuGnLBXCtSDIQOqxyGWg5Q
	knEuhgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZgh-00000008rdK-0Qii;
	Thu, 11 Jun 2026 07:18:51 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZge-00000008rcl-1HYO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781162328; x=1812698328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CR47QW2aqYQi3jjpuH+JWQWF89PSQdAAS2jmeVBQZyk=;
  b=Gt3dN2fCK2ivIDU1syRBFnYYmNySsYUXDLcKehqyGDgfrZkGh6M0gCyu
   kh46Tnp+sgbo67uZIsg0mLi0D+t6eY4IeSuVWkFy4PSp8OJ8MbYA9LIMc
   9F3hO1+cnp1p7locK3MTeka8zxlU//gQo03C6aQGHgsmWAZooY+eYnlex
   BYc/odg2SZ+9tVtMX4/QeGOuJCV96ggo4qF9mSrgt7WcihZmmhZC0xIl6
   Kgnv4vDWIimQipDpSo8pqSaCuxXBRLZgzlEy+2XRjknbdWhPO7h45BHKA
   Cn+RrkIwc8moTiL2M/uYxSuhjdnEdpgC85kQgCh9Z7jezFzUle0L+WThL
   g==;
X-CSE-ConnectionGUID: cImlClGASMuNSIdci5ql4A==
X-CSE-MsgGUID: xqTnKlSuQ16/60DMA/ENjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82076704"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82076704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:18:47 -0700
X-CSE-ConnectionGUID: WyffcMEbQ3ya3qcBYdFtvw==
X-CSE-MsgGUID: hStgdhTMQNqoCp3tMzGfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243456670"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:18:43 -0700
Date: Thu, 11 Jun 2026 10:18:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v5 06/10] m68k: stmark2: use ioport.h macros for resources
Message-ID: <aiphUQvNzzaoTjxX@ashevche-desk.local>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-6-b76b83366d5c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-wip-stmark2-dac-v5-6-b76b83366d5c@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_001848_368879_5880388F 
X-CRM114-Status: UNSURE (   8.63  )
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

On Wed, Jun 10, 2026 at 10:35:11PM +0200, Angelo Dureghello wrote:

> Change resource declaration using DEFINE_RES_*() macros.
> DEFINE_DMA_RES() is for a single dma channel, not a range, so used twice.
> 
> Also, some drivers assume IRQ resources are from index 1, so just to stay
> uniform, moved IRQ resource at index 1.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



