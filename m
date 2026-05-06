Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B2CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcmptKt+MTwveZWEC+lX3KrlK03zilMKOxywpmHM6Yg=; b=ILAjeZ1lYZq5ALEXXWdaw+RVKb
	ZDwssvXwsw/DarXqOKuOnE3IFZ/hYllc1nRc9zmzIh+cQzsCd7vMkFxUbvlrfUaKEKEm2P34a+SmM
	juDeNeXhtRPCtcXsLMveI4iM2S5wuMahj9aSkCGyixuWBiL9lMHcs6MHkbItn1z47l8uWPVjaH7/3
	eKjvphzF5T4IBV4+QRASjLm9aHJ5kaZOeTPXN/co5TSIbQq31GkQDPUTXGN3V1o/xUmbSXcUayWdX
	llMMkV/wwh5BEm3vNIw6LI/1vIIGpSsQMpWBu9sx1jBhk2LK40mgBVlJDDwlnggdaEqOBEEgcae2s
	ueyuA5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXPc-000000008GY-1dg9;
	Wed, 06 May 2026 08:15:20 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXPa-000000008Fw-1Xjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055318; x=1809591318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T80dOqr4anPkgiKzA+RtUt2kYySAP0UYfoKm1mXKHG4=;
  b=aOa90XzsY6bn9KR7ITvSyQ9tfjIZ58Dd1W8CIb0eJWNN/YtsG+UFWOcC
   Bt5PTad1ejarUDZA4QycBLx2q2nlcNgG9OoAxYcTHK0fRQq6F15K1UNMx
   9Cy8FalCjiFkeFaMfDs5b0SLEdYpqBHsKja0CF5xAzVk16g+JdO9wtuXJ
   7pdlqBkU9dCL44yqPjuvqrfmDsN9DYrmi0LCp0fB507pGuBqMKizxr9on
   rbRAUKUhCIhYbpQcHMHWeQIMogDHKZYlCRek9Mb51e2gjbVD9LzJpzotf
   eWE1OCUaGxn1GG51W59KZmtxMBlHWGnKbMWtIY64G0lEZOXEKCpq/zlzT
   g==;
X-CSE-ConnectionGUID: vZvoL7SuRxOVcFBt7u54CQ==
X-CSE-MsgGUID: HLB+d74DSZ2hjfHCVgNHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89288096"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89288096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:15:18 -0700
X-CSE-ConnectionGUID: wAzjOWATQf2H5PkbEPLe0A==
X-CSE-MsgGUID: CVNeWIcST7az/6oW75+gCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259501423"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:15:15 -0700
Date: Wed, 6 May 2026 11:15:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afr4kOIVFif-iPJw@ashevche-desk.local>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
 <afqEHZSUCASXPUze@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afqEHZSUCASXPUze@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_011518_446109_E77C15F1 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed, May 06, 2026 at 08:58:21AM +0900, Mark Brown wrote:
> On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

...

> >  #include <sound/pcm.h>
> >  #include <sound/ac97_codec.h>
> >  
> > -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> > +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);
> >  
> >  #endif
> 
> You're adding a use of struct gpio_desc but not including the header for
> it or declaring it.  Which won't really matter here but still.

Usually forward declaration is enough (for clarity).

struct gpio_desc;

and we do that in many headers.

-- 
With Best Regards,
Andy Shevchenko



