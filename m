Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F221CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpoJObt3fXHmnCgApXAd+PJkE0iJXu1bG38S0G7zckA=; b=dnki8UVVjHsroRpLdaMLlC2Twi
	yUXFXxibvwdwg/sE9KmlePvk36Fzybm/Icc99OvV2N6rfx3cLuO43ckHZ0GGtj1vvJS4pRCkn77Qz
	41e94tWTjd3w0lUL3ATe2obxpQkfISuiTD7ZF3wK1ASqHudrx3wnUJRTqxibnlwXbTPRA0rJQCDFe
	w/3PN2GWmzrtNAcztugS0NcbRe2dVwDybOE7dyStfDUPJb7V9vnsXbZD5DNBVaBUnppPs7Si31CyB
	KJYcQo2BEV78GKN+jsf3/Yrcntb3XQFKHiwQwXyWd21h58WEeZkkwiTnrnZkAc9qUTq4x7H4B5PxE
	Qvl3hX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm16-00000006HMi-0l4S;
	Wed, 03 Sep 2025 11:51:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkt2-000000067Rs-2VnO;
	Wed, 03 Sep 2025 10:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895924; x=1788431924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GCTF1UYtOSCeRAlhubdQAJ7qhlBqyZpfpnhA1MMIZJE=;
  b=aoIeSVfgjxBHaBK/rH7eeDtjQn6Q93RiB9ABmLVlCPmjCKXUIIPqN/nV
   KM0cssTP95HMkBWKzLY0/l3d8NRTnpcK4PWYron/+JrhboKVkBl4U3S13
   Bh5pybcx0vaY35wVOE8ZSR9zcTmuu0lWla6FXzgj2yW3A871RzNYklG+s
   H6Wx/gRMJ2u06zDiAGYIDycA0GJ4+I49tlpOw8m68CWbTRw1S4FJDiAl1
   WR4uza9hQ6vvJnArbqe30TMsnQqJIvR1ViQWKsDWHtb2oW+AsD9Qwz3C+
   F8G8jGU51Sa5bgwGByzQnnOOdHZt4KSMXnrBor9D/06I8fGrJSaACIqMA
   w==;
X-CSE-ConnectionGUID: Ors3eccARVC0EZZbjhmDMQ==
X-CSE-MsgGUID: vHbF1tytT8KLR/1r665UIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70632578"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="70632578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:38:43 -0700
X-CSE-ConnectionGUID: gcUgIZtvSDO2dFM95UNdfw==
X-CSE-MsgGUID: hQkiLlfsRpSs+9G/ykDw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="202430131"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:38:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utksl-0000000AxU5-0dpr;
	Wed, 03 Sep 2025 13:38:27 +0300
Date: Wed, 3 Sep 2025 13:38:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
Message-ID: <aLgaoivmBUgoeO6B@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
 <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_033844_675944_4CCF3897 
X-CRM114-Status: GOOD (  24.91  )
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

On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 3, 2025 at 12:22 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 2, 2025 at 10:46 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Sep 2, 2025 at 8:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > On Tue, Sep 2, 2025 at 4:38 PM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:

...

> > > > > > > The strict flag in struct pinmux_ops disallows the usage of the same pin
> > > > > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > > > > process with enough privileges (or even a buggy driver) can request a
> > > > > > > used pin as GPIO and drive it, potentially confusing devices or even
> > > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > > >
> > > > > > How does this keep (or allow) I²C generic recovery mechanism to work?
> > >
> > > Anyway, what is your point? I don't think it has any impact on this.
> >
> > If we have a group of pins that are marked as I²C, and we want to use recovery
> > via GPIOs, would it be still possible to request as GPIO when controller driver
> > is in the strict mode?
> 
> Yes, if you mark that function as a "GPIO" function in the pin
> controller driver.

How would it prevent from requesting from user space?

-- 
With Best Regards,
Andy Shevchenko



