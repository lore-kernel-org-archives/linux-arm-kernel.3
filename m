Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F0E83EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5p/GG6am0De+54Jw2KORk5R626u+IDpCl/qGStKE3Xw=; b=sFDaLiX+wHWB6mIUHjHPj9N89N
	ZMws8vNZ4nDnkFf0RBLkGx+jYG+6ISw7ZzIEKwOyhTprubRB+0p6XywTGUeqO4XAYXSP0LA2KJ8yp
	4x0EOuD6FfkpEY4+K+U4VRxH9zMLTp5z9Lz+PqWv6LA0YPC2gIRuaLrMT7gLQ9pTy6vP+YzOXHUTO
	3CstW8wRlw6DODv720sXtpDMnSHI67uLapSLAb0NMqhxWdQ1zDGF11PpOyXs1zZinl9gEaBWgo++1
	h5wsr8Ltck2l5YagDA3/CAhAfhQNa3vy3Wy39uPFtkXXoJZOQWLK2sGNn/LnhItNWO3zpOfp4IZdJ
	ozEQn4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXtP-000000085Ey-078J;
	Wed, 04 Feb 2026 08:05:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXtL-000000085EJ-43ED;
	Wed, 04 Feb 2026 08:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770192340; x=1801728340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DDwHMOsMUXm6WJ1FhegVa/SYna+oMCYrxCy4oam8+74=;
  b=EfCVzjh+oBr2nXy4A8qQLXPanLT6siDtLaJlR9nGz+USQWArGxPJClKy
   faQX9hWykkXUjYgfHyqXUyhh1HtJYh215J0DXLljbZPUpXI39ebd9eYqz
   xC7foA3qnh+5enWM2wM9wGoOFc2EF8W5GCt364F2vU9861uGRITeYjrep
   FdwGpSAz+NTv7mzJPyamF5iQGrJZBNtI7NIY4L4Hzq2Zb2S8pVI8mLq5x
   wTSq+1hcjdCL3CB2iEd/FLuPhYyPSvzHuRE7P5BXiNUQVSKrNSPWEg6Gf
   b5ty3km8mE+Xqi83E31kIdGLfm2KtC3aK1FF+Gs1ikAHXskgkiz0K63nj
   w==;
X-CSE-ConnectionGUID: EqvbRBaFR2SC6420wWu/0g==
X-CSE-MsgGUID: dTBPDmFTSyyRV7hX++xNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73974813"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="73974813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:05:38 -0800
X-CSE-ConnectionGUID: gieHYdZRQuSMnX4Z5OrgTQ==
X-CSE-MsgGUID: ZLpUHnB4SdKCro4KdvDuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209473784"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 00:05:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5881F95; Wed, 04 Feb 2026 09:05:34 +0100 (CET)
Date: Wed, 4 Feb 2026 09:05:34 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYL9zgEyCarrluvP@black.igk.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_000540_044539_B6D3CA29 
X-CRM114-Status: GOOD (  14.31  )
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

On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

> > pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> > function, and really belongs in the amlogic-am4 driver. There are three
> > reasons why.
> (...)
> > The other dt_node_to_map implementations accept a being called for
> > either a node containing pin configuration properties or a node
> > containing child nodes that each contain the configuration properties.
> > IOW, they support the following two devicetree configurations:
> >
> > | cfg {
> > |       label: group {
> > |               pinmux = <asjhdasjhlajskd>;
> > |               config-item1;
> > |       };
> > | };
> >
> > | label: cfg {
> > |       group1 {
> > |               pinmux = <dsjhlfka>;
> > |               config-item2;
> > |       };
> > |       group2 {
> > |               pinmux = <lsdjhaf>;
> > |               config-item1;
> > |       };
> > | };
> >
> > pinconf_generic_dt_node_to_map_pinmux() only supports the latter.
> 
> This alone is a good reason to apply the patch.
> 
> I have a strong urge to apply this already for v7.0 despite its RFC state.
> 
> Anyone against?

Quite the opposite! I fully support unloading pin control core from OF-centric
code. Note, please, remove extra '.' (dot) in the Subject.o
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



