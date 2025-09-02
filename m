Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660F3CA1011
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vy67ObTbkZdZhbIeej3G7oE3M7Losn79kkcFsXwKCg=; b=n8GLkPSu0tDH7GGag7q7t+B/s8
	w+UKEcMzAHRZ1jL/zcoMEtGw250RBp61WykHwbee2fHiK1x+vNra7pfdlCFdWoKk1oimzPpntGA0D
	oHbEg6Pb7tWrCy302GOilHViKRv44DrTuCGvqIZa2n13xDK3Vy/S3VbrokCyu8MyghKVPYyLF5lF0
	z3o/AWz1iTr865DlgZfAxu7Bv70jCVHBYqpezrC+WlPTOHW+f3WyTLKTzwAgHAQaG7awmXG9ZFjj4
	11n9NV+Gtk+YsrSmQJYkUw+LAbXo56nMrpzwqdtEW07AFy7Cf8D0Bdey0TIi+rZVlaaqa3kH6kr61
	Vebh73oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmA-00000002Ahq-4AOM;
	Tue, 02 Sep 2025 21:42:50 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utS4N-00000000Nad-24rt;
	Tue, 02 Sep 2025 14:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756823591; x=1788359591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CqeygO38G2UqLYwyJWypxYe4AznIXuR38IzQgfyWO78=;
  b=R+NOi+nJrarhs80YhsVfWzBjLjNOh1LR+BDIiUxqfFYOimx7IRISA52F
   e1tpSpQcfj7/pR/gk6PzacsO2gLM7J5vM4kcwcZzRFRWOCpXX/YOxBJCe
   IagZlfxytlGfste3qJOvso0JPtFNFMnX5kW6tJOgxGo5k5FfpU/uAIP1p
   y32SUjuI5fkNZhbKKwPBr88owZIhURVJnijlUyc3soXbz8++L7SvMpYyv
   d4wFxdequ/Mh+vF3+uCgRowN4z6lLGiRQivs74MyPB8npz4N+UPFq01W9
   DfnlZIP9wRWFbvBOGYrEVtR3tX029JZHAcwQcA4dKgwmozC0nshns5ft0
   w==;
X-CSE-ConnectionGUID: Kn23gWXFRP+qedQy3N/9Wg==
X-CSE-MsgGUID: jzXLv+1nTNCHTkmRou/95Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70529031"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70529031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:33:10 -0700
X-CSE-ConnectionGUID: t6YdkPslS0eCpPn1gsG2vA==
X-CSE-MsgGUID: 2hQHF1LATnKCD8YNAvpqBg==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utS49-0000000AiVG-092e;
	Tue, 02 Sep 2025 17:32:57 +0300
Date: Tue, 2 Sep 2025 17:32:56 +0300
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 15/16] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
Message-ID: <aLcAGKnrh-GeR-NL@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-15-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-15-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_073311_579500_A777E35E 
X-CRM114-Status: GOOD (  10.09  )
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

On Tue, Sep 02, 2025 at 01:59:24PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" or "egpio" function to be requested as
> GPIOs even if pinmux_ops say the controller should be strict.

Why?

-- 
With Best Regards,
Andy Shevchenko



