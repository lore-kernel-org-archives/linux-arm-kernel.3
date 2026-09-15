Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFDC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UysFqNBsECnuerH2uSkhwPdwI7r/Exwnjf1Chvgf1lM=; b=taCfmVzM4GW7IpYCm4gEZxk9Kr
	Y1y2dSLBGTvLm7H1EvDSEiHAk69hg24+FiG30NuFOc/gL6ekYfWsFheQ/ZLZdtnvN1WOM6vqLxNcS
	iNOKiMJJR1FddX4RyfcMIwz/DF/SdHqshq27MbU4lLZOpkqdQMoWjhfLrfC0zp99AkgsAZH87SjAi
	hsVgtLIiDXvhuAOa5XgMyb2rQI4TqAt5wqrAKX2uHOOTjEzdXYpLiFWZZ9lv8eetagBqqG/NEjFEH
	gMdg97PapyFVpymglw8e2AabwdZ9EDjd4w+M36N10IDzuJpsgbHjn16Fy8YnAICy9QzN8qh8G6V1B
	W/x+ITiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6B-00000006h3m-0pQ4;
	Tue, 15 Sep 2026 13:21:23 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T68-00000006h3G-2sU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478481; x=1821014481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bAV413W0oii9dQt3sDWvtF96rCyU8tAPKboiyRTjIcY=;
  b=SyHvQLuoGeaFo+IEPuBs3GbcW0+pAuewvxe7DY/7uG8k/p+gTtNAnJmI
   DwhCPkuy1tcL+osMfwx5TIjLKBXv9eVY5RwAOY/zS5riBNHXwtg15eREs
   N+D5vdmI00k4K1TYD5oY6+XsWMFKh6L8KiS4ln+ndIGNzPVgW7rBg5oNy
   rxnwHbYB4xVb5ZdOMm/TXDuXgvY+pMuw+ZIiD1ba/KONr7gQeZHraCNgm
   A5of/bfDzL1AhwOPk71pMbjxcFXOQ61rcWlIlfpSRcMwyKP2erSrqDK4k
   0M11gYDpo88sU8wY+huHys9YVqKrVV3AV0i+lGcxc6v8mnNehT39pL/aQ
   Q==;
X-CSE-ConnectionGUID: j+dSPWs+TAO6Hg/IlWwGKA==
X-CSE-MsgGUID: n91DekIMTZSfVSWvWsGMHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100164806"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100164806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:21:21 -0700
X-CSE-ConnectionGUID: tO5gH38UQOuIzfyibc7Ggw==
X-CSE-MsgGUID: mimHhMWXTYmyC/Df3JH2pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268726193"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:21:14 -0700
Date: Tue, 15 Sep 2026 16:21:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 13/15] serial: 8250_dw: add Ambarella CV75 quirks
Message-ID: <aqlGSDVrd-k4mRjS@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-13-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-13-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062120_805664_5149A61E 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Sep 15, 2026 at 07:15:43PM +0800, Long Zhao via B4 Relay wrote:

> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
> 
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

>  static const struct of_device_id dw8250_of_match[] = {
> +	{ .compatible = "ambarella,cv75-uart", .data = &dw8250_ambarella_cv75_data },
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },

I assume we deliberately keep snps compatible to be the first, so your will be
the second. Update in case it will be v8 of the series.


-- 
With Best Regards,
Andy Shevchenko



