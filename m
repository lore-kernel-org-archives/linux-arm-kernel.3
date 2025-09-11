Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B29CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwzDNI9yJYt0FbdpLoCs5UFoez7p7JLe3AO8r/PxG6I=; b=YyILs0wO9SmaMfvQep9jj/1C2D
	qlN1jRNPbUUEWNkxvaCGI/UyETfTyHU0w7ZBeRUUFRMYqyiJDKdYtC8obZxFFk6oFWWAS82stYurL
	9DesWs07G5Tkc4kvsDcrxco70ieFHnrYtX2Fkyw2M5kXFUkA1FuSND/NiJPtnxm2BRyoRDucvfGd6
	AGjYE7OqGZomERennckjLMcF1C6pY9aYDGmnqvYUSvhppagfhieNeVJow29pkMKB5kQLE5lJmtKR8
	Ru8KKFT03ltxso9VHusmE0DO03pusGjDR20VJoJ/Yw1LIQC21cnXjVKs+84UXO+NkJPg1KwG++McP
	hBsiRVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc4j-00000001bmV-2Zns;
	Thu, 11 Sep 2025 07:50:37 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc4g-00000001bja-2CE5;
	Thu, 11 Sep 2025 07:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757577035; x=1789113035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m30L7S1WvoRggLHv6LreiIlctXHF+XJ1XKVdT0+e9qo=;
  b=evqZHtSqpipMWXDEHCEbwflep9ss26zIMN+Z4K/8W4WkLo+VRZVle43P
   2VnmlelG6v9u47Xd8L6UCGgbZQnkSB2j/3fhVCjeDsjTihwmPse5w4CKy
   VE2z2YdUgSBRh14dL5eHm85je/1MK8nPF6nvyvnsmaiXq4KHV3hnuzo8b
   LCgzo1oFyMBVQaDG5Qk5E35hwZQH8KfebUT0ZQojo6jEPFSjoMluqk/k7
   K5a1HLq+aDSWpaQ5Y/aMwYFCnV+HYLLauH+T5MyvFs4UGb0+gjy9t5C67
   kzm+SHW1G/B/zBUoIp7pJVy7m35s0v2Yl57iLOPUHb17JbC0GIQI3xm0d
   g==;
X-CSE-ConnectionGUID: S7aT7ocUR7iJt9vIwfcRZQ==
X-CSE-MsgGUID: 266ZSZ7/SO2fv+XXUkGIsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58941633"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="58941633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:32 -0700
X-CSE-ConnectionGUID: /rkAzoZPQPW19fuKTvUXuA==
X-CSE-MsgGUID: uzsJIT7GTJKG20+iNoc2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="178821912"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uwc4R-000000022QJ-0Efr;
	Thu, 11 Sep 2025 10:50:19 +0300
Date: Thu, 11 Sep 2025 10:50:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for
 compound literals
Message-ID: <aMJ_Ohp5YtYNFnYV@smile.fi.intel.com>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005034_843496_9E17505E 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, Sep 10, 2025 at 09:25:44AM +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.

Thank you! All look good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> [1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

-- 
With Best Regards,
Andy Shevchenko



