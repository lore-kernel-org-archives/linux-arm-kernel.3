Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BEBCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pDO3CiZDcgl6FpTMD0qpu93FtQQ0Hu54ZUk55r1Ur4=; b=rM1AmluEx6mc68Of315B7HXYTO
	XpiOA0YGWsjtz+OchdBupUrotfjHZP2dIwiron+fmXWggLhJLKg2twHQyPQ+gb1igBkvfENPIO5Ip
	gO1p8CqEiLF8PL+pw54s73L9q3YwsqW6zW/1hKVOarZUenaWrS5XjbHKaQRJszK6l2Fu7Ys8Mz4ab
	A3j+ZD9IMSPvSu7CELYlswLgri4/XxAYhMjaaZ1ykrtPCqpbrpw7m3R01Q0P2HAtS2NAxCszB5/qJ
	/z87HcW4rf/zk4s0Qxk+5WqLZVPUUpkEpX+DAuMyhClFIiLLqVvcSHbuCQnJOI4gQrFuH1ZHRO68D
	49qGK4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNh-00000001ZHn-3GnO;
	Tue, 02 Sep 2025 19:09:25 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQmF-0000000HXZ4-0yLZ;
	Tue, 02 Sep 2025 13:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818623; x=1788354623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1LweHExYhd8TIGAtsNsPF1dVuZ9HmUdwiz8regfEmyY=;
  b=SLCOT4T5qLpZpZl7fHQyAljcIndFmagyl8OX5Jd/6deJ9FphAMxNHgFv
   J68jHmg6azBtxFzZWvE8Omf45+esXU+nDASf4a3i5mpDmtwmgnMnxqmyk
   ao+286l9BjMIBqG/w21l4WVZvLOQVYMHnDEV8pz7bKy1i/DqRNapFdz/Q
   zivN0cZm79POIPgf4bX9ArvKNZO/vZ4jvEBYpTcEEIyfQ8jPhrrSP1QLE
   fFdP5U1G5+ks5tnek4yttZmuPvRD3cUen04iYd3MnLqg1ZYoYyyMlXJZG
   59eTBHRFwCKjq3pS2yV1xHv42Mjdp6WLfT5Omjiy8AOSg5gLWD3WsyPz9
   A==;
X-CSE-ConnectionGUID: 4BEGNVarR/uZCecgnZbUKQ==
X-CSE-MsgGUID: NAQSTTQQSD++MxJIy4b8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58296874"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58296874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:10:21 -0700
X-CSE-ConnectionGUID: ABQ3ZIn+Qu67Yn1YR+Rhyg==
X-CSE-MsgGUID: rodiyp3KRASXPRSRymwAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175651755"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:10:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQlz-0000000AhRr-2lqG;
	Tue, 02 Sep 2025 16:10:07 +0300
Date: Tue, 2 Sep 2025 16:10:07 +0300
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
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
Message-ID: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061023_293031_C00F48F2 
X-CRM114-Status: GOOD (  17.23  )
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

On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> 
> Unlike all the other allocations in this driver, the memory for storing
> the pin function descriptions allocated with kcalloc() and later resized
> with krealloc() is never freed. Use devres like elsewhere to handle
> that. While at it - replace krealloc() with more suitable
> devm_krealloc_array().

With that in mind...

> Note: the logic in this module is pretty convoluted and could probably
> use some revisiting, we should probably be able to calculate the exact
> amount of memory needed in advance or even skip the allocation
> altogether and just add each function to the radix tree separately.

...

> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

This tag is not applicable to all patches, I do not believe this has been
tested.

...

> -	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
> +	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,

...switching to size_mul() also adds more robustness against too big npins
values.

> +				     sizeof(*keembay_funcs), GFP_KERNEL);

-- 
With Best Regards,
Andy Shevchenko



