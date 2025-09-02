Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E51CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRQ10qRNRmzAf6GZKpqv2GmmEnSMmDjPlw/asGr06Ss=; b=vnL8UvE7aA7XnOyv8xnqoQrqNk
	7uMJlvzwYwym2h04QngTcnnHJxo4GSp6nzqG4L0B9JrhGI4tr6dwAaKKblthUIyJ9/jdEqlH6c5qb
	15ETya6C+nxnRyz3mAw+nUem7HRNeKeM1caFlsbCKMmyq8lz6kskrz/MrPXN3uSbxBk7paJhfSL69
	WBbZb1/B5RI2UUh55hxhNCSivQxI37kEwx9gQDlC5H9RWzQHU0LKkg2fj7OqJJ/BKMNep/6zo7jAR
	xpFNQmSNpfLkJAQaJHHVCiW/C1ryVM2x4EOD3ObAjkKWF8Wr/Kn/P2CIytGICXAsjt9oXR3T7Vb7r
	eojcAd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQ0-00000001clC-23ii;
	Tue, 02 Sep 2025 19:11:48 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRPB-00000000ADy-2t1n;
	Tue, 02 Sep 2025 13:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756821037; x=1788357037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pxx41/VBJwEQCpU5u+vMOlc6AdRXauTq/XBO/2b9BuM=;
  b=A8MSM3zko1l90dWbdTL5yeeYBsP0E0tovi964SFSc9mL22+FV/Ub9kJp
   IigKKeTXXVwzwDUZoecUrqOgZ20CsRpnAUdWFAkBrfpl/z81y8Zgmr6cj
   bnAGNQJZvz+usEHPTKbw6r7AgzpP+yIB0clSDxTm9oEJjLKDnIMFjcoai
   xJlngDiOMbbkeQyM4+VFXT4jUaeVXF4b4XOsCojp40teo0PSwM5sofIBV
   QHJI+U/e+WmjLdZOom5v3RN80X5nlLKSKDHNvIeFmPN1l3MN4Vfhp2yt9
   lvsdEaov6f9518WJuLlHM+UTZEPnOSn3kFPml1Ldew37nBxdYU2OQthgD
   w==;
X-CSE-ConnectionGUID: S9y4f8m9RE+pqwuCGEh8zQ==
X-CSE-MsgGUID: xjqJyrUnTYeT5Lpi/Bq4Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62738137"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62738137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:50:37 -0700
X-CSE-ConnectionGUID: ZHIE/dHOSB+FAZRCRRCs4Q==
X-CSE-MsgGUID: 2IiLBKTERdG7VU87j86+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176590815"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:50:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utROu-0000000AhyY-2NM3;
	Tue, 02 Sep 2025 16:50:20 +0300
Date: Tue, 2 Sep 2025 16:50:20 +0300
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
	stable@vger.kernel.org
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Message-ID: <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
 <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_065037_801197_57C2B67A 
X-CRM114-Status: GOOD (  25.98  )
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

On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 2, 2025 at 3:06 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > >
> > > While the API contract in docs doesn't specify it explicitly,
> >
> > So, why not to amend the doc at the same time?
> 
> Because this series is already big as is. That would be another commit
> that can be separate.

I meant _in the same_ patch.

> > > the generic implementation of the get_function_name() callback from struct
> > > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > > NULL. This is already checked in pinmux_check_ops() so add a similar
> > > check in pinmux_func_name_to_selector() instead of passing the returned
> > > pointer right down to strcmp() where the NULL can get dereferenced. This
> > > is normal operation when adding new pinfunctions.

> > Fixes?
> 
> This has always been like that.
> 
> > Reported?
> 
> I mean, technically Mark Brown reported my previous patch failing but
> I don't think we do this if we're still within the same series just
> another iteration?
> 
> > Closes?
> 
> Ditto.

I meant that this fixes a potential issue disregard to your series, right?

...

> > >       while (selector < nfuncs) {
> > >               const char *fname = ops->get_function_name(pctldev, selector);
> > >
> > > -             if (!strcmp(function, fname))
> > > +             if (fname && !strcmp(function, fname))
> > >                       return selector;
> >
> > I would slightly refactor this:
> >
> >                 const char *fname;
> >
> >                 fname = ops->get_function_name(pctldev, selector);
> >                 if (fname && !strcmp(function, fname))
> >                         return selector;
> >
> > >               selector++;
> >
> 
> You can do this in a subsequent patch, I prefer a smaller diff personally.

Sure.

-- 
With Best Regards,
Andy Shevchenko



