Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4417C83027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGhop14EiVjcpxENyD9i8nqUNGx3vgLwf8Ea7kiAqD0=; b=eH5k+jJU7hR1IbveBg90RvIFz/
	pu6KjLJ2PlwIbeIP06lhwrFGtOhZd5fygXP4pJRuc0j6DBsqn3oRrlHPbGeI85cOOhVzAH4syEFEX
	327+Uanb97JxOlE6+19kGi/lZtahVmKI61kW9CFVvZKkMI3E0pI2F9LP5scn/1zuzX/0+oYDW2TNN
	TYW/OOtRK0u2dyh7vPK0fq3gmoj7DTsAY4b52fxTw3ApVlXfe1KlVZvSauIyiXSkp48UVBvlV7uBK
	QysbegHugs/L1qSfAC7ElcHesH2Y8eXJS9zZ3WFnrecjT49T8uI4AbsgUWyn4BIB+oNNKBWuTjcuz
	ctyzsnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU33-00000009T33-298j;
	Wed, 25 Jun 2025 17:36:37 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPVX-00000008fNn-3nNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750855544; x=1782391544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u7KhYtYFfF8hIrEkFmomLpCGUnnfCnEiIwSY+/XufMM=;
  b=XRA7B5eQ+jHdYY16CVQDGt/W2gphoeXlSJHyVwJcziNubmVcDF8RJEOY
   bkbNp8zdVpimNOzZLJKWG5acAcpN6Cg4ubjMFNKASEvvdy1Euxr0wpqgd
   DfeM0joGQwPukGINjG4qRbv5dYqanrjacPyGIaLoAsofJQ77eyQ2C0RoB
   gMYXCRJ7gVgAY0gxdT6x4Hw8pwMhK67R//8zPCcpfQf2vNCzKU6/oKnDI
   xxCEBqeKAk9aERMpsQwllTf6020x8VJxOo2zR1ExO0Lr32ZrURrCoLow9
   EyDPLkWEwTyUe7+tKqDqjXLFVnGH9/fJ3f23jZiDYwjEqdkH7EMTDXI/s
   w==;
X-CSE-ConnectionGUID: jMLCVQmKT0mNT5n8qlFWHQ==
X-CSE-MsgGUID: rEOf2Cu+TqC0+WExla5csg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70556306"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70556306"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:45:41 -0700
X-CSE-ConnectionGUID: NMZhsQVgQSaZDfVpbvOZBA==
X-CSE-MsgGUID: H2UvHpQ4SsKlNtvwARVPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="189380904"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:45:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUPVN-00000009lll-1PDb;
	Wed, 25 Jun 2025 15:45:33 +0300
Date: Wed, 25 Jun 2025 15:45:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: sch: use new GPIO line value setter callbacks
Message-ID: <aFvvbH9nJkgWqj_t@smile.fi.intel.com>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054543_979262_36EFC604 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, Jun 25, 2025 at 12:33:26PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



