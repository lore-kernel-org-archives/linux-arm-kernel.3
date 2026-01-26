Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F3ECF65CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3B2Yk2Wls+/bbAv538+aqt6iqYnxKSAtB3S9BRWp2Q=; b=15n9i+FiSiNd0TaK4ubCvVHNmH
	XLLKQy9KZ7VaYQtH8qLPFIz7OQXqvUryft9Lb8xemkhC4g6G1Ist2QDSPkekvhR3cFeHo9jUjnlyt
	vkzz7nCQydQ373PPGeR/NFJyNABTP2mVj3VpzdJXuygs62ILkoJIuY+wZ+0vvC8fLSuoOd8mi/fuG
	O0pY1yNM+/VKPo2CarcFXMpHuwnRQfd/yzYvIT/B6kHEA150qt56HNlLvdvZGe5AKR6vsXKtfH/op
	M6lFsCXbVusRWtyiQjj5c2lFemUJzFmgHVOrtKfeX0elSg4gL4uy/kXXVHO/r4URymNPyBTqyRs9v
	nCUQxlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJIn-0000000CEvy-0IjG;
	Mon, 26 Jan 2026 09:54:33 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJIl-0000000CEvE-0rCx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421271; x=1800957271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=biNWH6Rr15jnwx8nyn4xZSAxcP4dKu8eJOtBc9tUiV4=;
  b=A5XDDsgf7fb1KmUFb1J8Or6xmxrvt26nTvRFsy+ypTeR3HFwdasP5/tD
   pzxoieESV9da7ZziiPsbiLe/SrqbVF//+RIgoCPWy4cDAeVT9DjlIyhJA
   Y6x2jDrE2aHm4nBKx8SJzxWTq+Yxtfpr7KLN6ra734jkYiKdp9u3NQFas
   YAA7U4S563oRTaYz8EB0/C1ZqBn9/YM07Ok8kkG+VEuXzgUDgd3KKJEGy
   vwkNutQ6AMgduLyw7HC3Ulu96Y08NIEBj4QzxcTRUoomM7YBE1nrt6WI1
   hqen5CDj8mqWOtPYgTbWJvpwxnz2vwrN05Tqez203wsuYeXt1IE0X9D9d
   g==;
X-CSE-ConnectionGUID: BQDVd730R8aHwLvJTXCDnw==
X-CSE-MsgGUID: vye269GuQvS+EBgDkcmD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70564207"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70564207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:54:30 -0800
X-CSE-ConnectionGUID: /uPQCNh+TY+54SwqBmU90w==
X-CSE-MsgGUID: oOdeRaRpTx+ETctxkEpfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207242420"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:54:24 -0800
Date: Mon, 26 Jan 2026 11:54:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] treewide: convert hwspinlock users to the new
 consumer header file
Message-ID: <aXc5zVLkSAHT55Tm@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_015431_281878_1ED8915C 
X-CRM114-Status: GOOD (  10.82  )
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

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

...

> +++ b/drivers/base/regmap/regmap.c

>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/log2.h>
> -#include <linux/hwspinlock.h>
> +#include <linux/hwspinlock/consumer.h>
>  #include <linux/unaligned.h>

Can it be also moved to be a bit more ordered? (With given context like to put
it before log2.h).

-- 
With Best Regards,
Andy Shevchenko



