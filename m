Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0770ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRJDgRmHBw+J65zqV+/QCRhrrek5fZfoXh2Mkgbf81o=; b=jVKgGdFrpsKseAw8F25aYw9wnl
	Gmgc8YrQdJsG+9BEVGELMZiVX//KjjcCvdAgIzGi+k4HIx2jfThtBxvmPgSB6elyuUxNXh16RkLeK
	kvyEOIeG1fQ7WkCluUqGSCpg3nXNYmN79F9a+pI9nsSupjlsqYYb0NnxJHz0MH148X1GYPd46+q7b
	KQbWCvE6MbKnDBtxnDUlwTX7rbJBBbQAInG7n2dCK5BASzb9DdGlpex5RVxaYivWPYVTaRU7bu9Vp
	VpvZ7dSxNXZmSD/FxDHmESHCgrf0Z2a2cQELcGgPvlsPwDMyfvMJiH0nbJFaHYWV1mmNpOgl7AQsY
	YGywD1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNu-00000001Zhg-0RrY;
	Tue, 02 Sep 2025 19:09:38 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQr3-0000000HZAf-0SxN;
	Tue, 02 Sep 2025 13:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818921; x=1788354921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cIei6RTUCtT55QsspDgWfZe1lPcqVs/yM9oKakcEt4M=;
  b=FTIEpFsuLv9mZ8+akStrwqn7q0K3h49PXIrkbx8Ksykja4UHhcl3M19D
   17n1cfItwZn1D8DdsKTTZI0bt/JL4cdyAPrNIS85yJI6QthMY7z1YydGm
   8KgU3djf9M1El7zJfFU5cvIlFcppF2cX9hvLExudeCXLxkSakQE3i6/Vj
   JzExbneItCn/D61gR4vI3G+b+y0WOdH6FOPZmmXRlke7rgUONOG4K/UdC
   I/0AgEAUzAsqbQsdAZZwjzR1lhvlEIb5+zowvYzjlzaulzFuILzghyDAi
   GoW6bvSER5qEPqyrrxD18t9xJQn4yoPKnpAzVo4kHBQ7XY2ubSvFC2gVP
   Q==;
X-CSE-ConnectionGUID: z0U/lNb+TsK3hv0nWldAdw==
X-CSE-MsgGUID: 01LLDi2FQjKAuAAq1aN69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59041784"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59041784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:15:20 -0700
X-CSE-ConnectionGUID: QF8sMWo2SGOcClSTfRIdKw==
X-CSE-MsgGUID: FLZgbnm/Swu9LSfjg8Kdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170530232"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:15:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQqn-0000000AhVQ-1jBt;
	Tue, 02 Sep 2025 16:15:05 +0300
Date: Tue, 2 Sep 2025 16:15:05 +0300
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
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
Message-ID: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061521_194057_BC27B7A0 
X-CRM114-Status: GOOD (  14.85  )
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

On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.

...

> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)

Why not simply

		if (ret)

> +			return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko



