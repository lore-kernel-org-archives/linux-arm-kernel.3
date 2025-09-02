Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFE9CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tasK8TskdTx60J9GJNRpcyksYAQk990fnvsSxxEeMs8=; b=sVOvZvH8t8Dsp/nBOEgP5VFOXi
	lvclQeWMyKo827qCd3+jchp3BIfZWCTOFrxnRxKcMcA3psfabGEguJQALeqUu2whf0dnw86oC1/jj
	8k6Q8DnlQXs2VZuCjZJ+r5UmAnNXkblJPmQPqeCfHmcy2ijiz8YLTYDTqMQbLHgLQq5Mi8B15afi5
	uDsehO80oEFvwRwg7MDC80FlketNF28oS7GP6N4l9kcANbodqvdYGXV2K4OZD5VPKkiOhPzopoosS
	jIcws89y1dlJuaqZc96ijShnro/Id7YLaDl7MLttJ+YSf8r1wwRLEN8hajWJJoCVjBZ4THb3P6Fvo
	yeeQz0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm8-00000002AeC-3Ecg;
	Tue, 02 Sep 2025 21:42:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utS2Y-00000000Mtg-3fu4;
	Tue, 02 Sep 2025 14:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756823479; x=1788359479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNLf2ov03mImFGkf61U7OTdGwEMuGY1mZCV4bcE5xQ4=;
  b=gOu+98BHyO/cVrpjT61uVVkZ2Yuv60TwCgYNaKV1BfwaQQBBbIlLa3qC
   5o/E9pWPaIivXQvALTJFDF4uEaUqCq5tqbxBxWr5uHKEgsq4bAMDvV1oC
   uSFoKY7MyfCMgLO0Ddgonng5yV7kc4D14YLbyMffMSyoq1g0nXq3iyo6z
   //iKqd7tGgIpo75JHtfcRjg/qyPSAIVe7b808L79ghehb8xYaKko3yB/b
   ExCxVl+4THWRKdL7A/1pvC3aa9TvSIk9Q/6JX6l6mwYzFk3wMTYvrP+8y
   uoggadpRdfZyQJHsykbR1d6GGyYrR4rIMtF1vTp3IDgF9sesEvGc+kWaa
   g==;
X-CSE-ConnectionGUID: HThKJ6V1QPSfzCUHaaGjlQ==
X-CSE-MsgGUID: v+LgYhDpRWWFhgq9+E+pMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76543124"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76543124"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:31:16 -0700
X-CSE-ConnectionGUID: fiXJ/SYAR0Our4Y6vRb6cQ==
X-CSE-MsgGUID: /BXe/BoATnONrCvRrOtmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171186010"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:31:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utS2G-0000000AiTf-1Q9X;
	Tue, 02 Sep 2025 17:31:00 +0300
Date: Tue, 2 Sep 2025 17:31:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
Message-ID: <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_073118_969541_90843DF8 
X-CRM114-Status: GOOD (  21.14  )
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

On Tue, Sep 02, 2025 at 01:59:22PM +0200, Bartosz Golaszewski wrote:
> 
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core.

Which I disagree with. The pin control _knows_ about itself. If one needs
to request a pin as GPIO it can be done differently (perhaps with a new,
special callback or with the existing ones, I need to dive to this).
On a brief view this can be done in the same way as valid_mask in GPIO,
actually this is exactly what should be (re-)used in my opinion here.

> While we could go with
> a boolean "is_gpio" field, a flags field is more future-proof.

This sentence is probably extra in the commit message and can be omitted.

> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers.

So. this changes the contract between pin control (mux) core and drivers.
Why? How is it supposed to work on the really strict controllers, please?

> Add a new callback to struct pinmux_ops - function_is_gpio() - that allows
> pinmux core to inspect a function and see if it's a GPIO one. Provide a
> generic implementation of this callback.

-- 
With Best Regards,
Andy Shevchenko



