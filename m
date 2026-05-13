Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1F0CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1novDsaZ0cgu0TC5njhsL7djZsSe69Y5unS91qyegiI=; b=mf0tHk6SfONLiu8t0Y053Ku64P
	0/8PZlsgtJW/kd2+2P5SugPyCFFGn9MvAqC3JdJZ+tmVa98al9jAV6RaYOYwz/0XfdNb3AtE4Cn5O
	psNDh3VqO48/TxqhFBdRQW2OapWTBri/qRek+8HTlx8U7EWd9/5Df3NSYGRob1mF1bghollPpLC3a
	r2O76xWcO5x2FTLT9oi/N2tzLXpeZQc96HjYpsKwCerWvwzh9uZLGo3sLwEz8sxsdeuVDXtDAtm3h
	L6PzRc37ndMRFwLolodxe4C1jKaq6NfizfK3wwqfS1MHkwDWwbsxSrNWD3dtLHK3BuzEjm/m9PYft
	Y/wV9KgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG0G-00000003fqS-1peY;
	Wed, 13 May 2026 20:16:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG0F-00000003fq6-0Ebt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778703383; x=1810239383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mIQ+1K+1Vc9lN+OORTOgLG1EPzXtmw6+x8IuxCo8fsw=;
  b=IMB8fiAm4nKePIgwGrePsti3B1HE4nRyy4vDIua7fSP9xMjAzwgP62q9
   b5M+lNAC9/DcjwUcIiWLCkK1qVCygrLAtpUKaiKuh9oYNs1BtYcPO4xkx
   FaPnzLcspbH4ASl6Fs7EA7KrtNQ64ceajKKwchxfeKN7L7y9hVi8wz3jo
   PCHf0LEn2ujudmzCoyr3M4eKpcfrusr6tGOBLwl7DQEwjECYRiXCeeEtC
   OrjP+yLqzPh4JXB3Vi0ISIsPylkfL9ws6NlIGN88eO8JzpkNKlqHiLf1O
   a5bad5N+/UZaSG+gFRZ0JHKiTOJur6jhKOPYgTnSDe+HOjgVT2pWSyi71
   Q==;
X-CSE-ConnectionGUID: PBMwu7cJQ3qkHuqC7tQ5wg==
X-CSE-MsgGUID: s1JqWtljTK2T1+o8DW096A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67172027"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67172027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:16:22 -0700
X-CSE-ConnectionGUID: 6/JJXADcRba65k/N30FZZg==
X-CSE-MsgGUID: Mvsw+TwPTt6nTk/svVCyig==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:16:18 -0700
Date: Wed, 13 May 2026 23:16:16 +0300
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
Subject: Re: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <agTcEECgJvBydhe2@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_131623_105271_B989FF66 
X-CRM114-Status: GOOD (  11.28  )
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

On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> +static struct resource dac0_resource[] = {
> +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> +};
> +
> +static struct platform_device dac0_device = {
> +	.name = "mcf54415_dac",
> +	.id = 0,
> +	.num_resources = ARRAY_SIZE(dac0_resource),
> +	.resource = dac0_resource,
> +};

It can be

static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);

static struct platform_device dac0_device = {
	.name = "mcf54415_dac",
	.id = 0,
	.num_resources = 1,
	.resource = &dac0_resource,
};

...

Same for the rest. But I haven't seen the followups and don't know if those
structures are going to be expanded. The commit message doesn't say anything
about that. So I assume my suggestion valid.

-- 
With Best Regards,
Andy Shevchenko



