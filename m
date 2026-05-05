Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F89ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IglbAQHF+NhQTjbv9WpCpxizvQAYxPtqZ/kh+G/wf0M=; b=zjk0vAWzS1WF8SokZkWdrTZP/V
	9eMP9SjNjg5w6+3+52rnl6DvE4BaQx32SfvSTwv8fmwRqe9PUYBSfAOfXZeBPSUbE1JIL+Zos8Ngm
	y3VJ/VS4evUJuQNt+aXhyVmYCAzArqVKk4EYGKmIwKwXpTbWEytk5elPhXtFQJyFTRR9DEB7e2qoV
	z/5kSGsemxsJnUc3AIBxGspoWkhpWm8eoJfSV6mfJDVq3dIheYWJOleDv6k4TOaxEXR8kyjXBANOg
	cYsC2YRIZMKUpk0G/79f2sAFprg8kdS64sdBsoBXIdoSvMVRMuVuLHlKxk3jY2GNoaEevjoFYcSuk
	XNB/CkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBC2-0000000FXEf-44dz;
	Tue, 05 May 2026 08:31:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBBz-0000000FXDn-3iEW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969908; x=1809505908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hwDIJ7pMtHCCustNvs0AAaepY8/PftFzyLYey8zGy4c=;
  b=UcvNdjRTEhbxQiv7Z3N1iV4nwsiBVTszx+xWG5u9utsFNvqWCP5euDVK
   5Ecp5Jc5BzRExtzyHT+GWM9C8kS9sEVQarlCnEMeuNGTGdfxzsyRdPMbT
   FISMI6kC3VDos+hoy8wEEJF6Y5M5b502Wpl03j3h1iWyP4D+2uNqShji1
   ZZ76x3sn4/NyCky6V/nCZKavVqKz9EuTbxOjFCXxpYZFCbQZe4U9JdG6L
   OBjaebPGVO9cB2OQ1epSb7H2LhpFT2IR/4syqqr4YJvdXdg/tYMxusCb7
   imqKbuykWAbLP2hJ1wZoe9SLnmpULulTvctvhJ52QQGSjGk0rLJ+56ZVO
   w==;
X-CSE-ConnectionGUID: 3hgt9AN0TgOd4Eh7SMKB+w==
X-CSE-MsgGUID: p61cysGvQwq9YxYLJ7dEbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78933494"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78933494"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:31:45 -0700
X-CSE-ConnectionGUID: tuc2W5dZQyOeHu5cjmszog==
X-CSE-MsgGUID: S21AuqnmTmuWUCuhw4jPkA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:31:41 -0700
Date: Tue, 5 May 2026 11:31:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <angelo@kernel-space.org>
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
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	Angelo Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <afmq6-AfomfKtX7c@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_013147_959835_F3697102 
X-CRM114-Status: UNSURE (   8.26  )
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

On Mon, May 04, 2026 at 07:16:46PM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> +static struct resource dspi_dac0_resource[] = {
> +	[0] = {
> +		.start = MCFDAC_BASE0,
> +		.end   = MCFDAC_BASE0 + 0xFF,
> +		.flags = IORESOURCE_MEM,
> +	},
> +};

ioport.h has a lot of DEFINE_RES() macros. Please, choose the best fit in each
case and use them.

-- 
With Best Regards,
Andy Shevchenko



