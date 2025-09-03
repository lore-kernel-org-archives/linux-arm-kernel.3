Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D32FCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIzMLsOLaDWB1GYhoINqzSJt837aONUkQA3ng3cfEkg=; b=l8lJzyHAkNN/USEwQusZBG9bXP
	XQLNQoanC8iHVr+zMn9Uug4Ob6JpMBmD1F1MwJqzqdhg02nY0x0l+Oi9+KCw1PEJlP/iHhimdR1cs
	I6uSF4+hQIeXj8kw61mtP6wtsqdleyyq4Yi+H5XI4S5MlLQu8ixh91r1GCY+HACnMKZpYk5bHH9Le
	NvXnJJGhHt0DWTxbn6wQDfGqWHq0clUFxP2x6ANGY5TkHHjWO7tyShgB4jjBpPD+wu8bTDIWYAPX7
	usIRd6+jRZWhURjw1M/HvcSrUFGfdPiK0FWNSVZWCIIYePsYBJie+wgHTYJhWqEVh8l4Y0auwq//A
	IMzFPkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmvo-00000006SKe-45er;
	Wed, 03 Sep 2025 12:49:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm1I-00000006HR6-1bJs;
	Wed, 03 Sep 2025 11:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756900280; x=1788436280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nDvbAiY6rHd3SKV/DYo7HnX4lUjAZdHwuJei+GGsRW8=;
  b=Lmu9zSaCUL2DDmt+VYYUG73Rf0ud4haj8E+ZxpnguWFsGTL9pzpyPvoX
   vR9PEAAh//yGEqksOE76diSk8WlL5xQyiNERDvY/vysJWOcHLAnlunYbP
   01C8t+Cq66wyhyyoErkc+vuHzg9AXRzGNoHWa6C7WWL3Ea9lNtoltF9s5
   s+r1MJsvCA1F3bzKRIa/bi/Py5H1ryo2Mvhm4gN90s9+49butgTQLCdvK
   cqW8ttsEZXoKXQ0ipX+A7ClNv9Ii5ZlsTdYoag1BBfplxsE+JJtCH+b4I
   hrCWZ5PQhLT39bWJ4JfF0jzePMZgfVmGegR9gNQY4qCK1aHIUHUgc34S/
   Q==;
X-CSE-ConnectionGUID: BLnpC03MSgygMYWVm2oFwA==
X-CSE-MsgGUID: dux3X92mRiy446ir4xvHpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69822595"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69822595"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:51:19 -0700
X-CSE-ConnectionGUID: IwmxuAerSUCIeLGnj4/KSA==
X-CSE-MsgGUID: exSghXJzT32WBa3jKCspRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="195199401"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:51:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utm13-0000000AyQC-2iW1;
	Wed, 03 Sep 2025 14:51:05 +0300
Date: Wed, 3 Sep 2025 14:51:05 +0300
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
Message-ID: <aLgrqZETNLmuMHhv@smile.fi.intel.com>
References: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
 <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com>
 <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
 <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_045120_431025_67664FC2 
X-CRM114-Status: GOOD (  42.63  )
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

On Wed, Sep 03, 2025 at 01:05:27PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 3, 2025 at 12:53 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Sep 03, 2025 at 12:41:48PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Sep 3, 2025 at 12:38 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > > > > On Wed, Sep 3, 2025 at 12:22 PM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Tue, Sep 2, 2025 at 10:46 PM Andy Shevchenko
> > > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > > On Tue, Sep 2, 2025 at 8:42 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > > > On Tue, Sep 2, 2025 at 4:38 PM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:

...

> > > > > > > > > > > The strict flag in struct pinmux_ops disallows the usage of the same pin
> > > > > > > > > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > > > > > > > > process with enough privileges (or even a buggy driver) can request a
> > > > > > > > > > > used pin as GPIO and drive it, potentially confusing devices or even
> > > > > > > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > > > > > > >
> > > > > > > > > > How does this keep (or allow) I²C generic recovery mechanism to work?
> > > > > > >
> > > > > > > Anyway, what is your point? I don't think it has any impact on this.
> > > > > >
> > > > > > If we have a group of pins that are marked as I²C, and we want to use recovery
> > > > > > via GPIOs, would it be still possible to request as GPIO when controller driver
> > > > > > is in the strict mode?
> > > > >
> > > > > Yes, if you mark that function as a "GPIO" function in the pin
> > > > > controller driver.
> > > >
> > > > How would it prevent from requesting from user space?
> > >
> > > It wouldn't, we don't discriminate between user-space and in-kernel
> > > GPIO users. A function either is a GPIO or isn't. Can you point me to
> > > the driver you're thinking about or is this a purely speculative
> > > question?
> >
> > The recovery mechanism is in I²C core and many drivers use that.
> > I'm not aware of Qualcomm drivers in particular. But mechanism is
> > in use in I²C DesignWare which is distributed a lot among platforms,
> > so using word 'purely' is incorrect, and word 'speculative' is a bit
> > strong, but you can think of the issue coming later on when somebody
> > does something like this.
> >
> > The same applies to the in-band wakeup UART mechanism.
> >
> > Which means that with this series we will relax it back anyway for
> > the above mentioned cases.
> >
> > (Not sure, but SPI DesignWare requires programming SPI native chip selects even
> >  if the GPIO is used for that, this might have also some implications, but here
> >  it's for real 'purely speculative'.)
> 
> The high-level answer is: yes, a pin that will be used by GPIOLIB
> needs the function it's muxed to, to be marked as "GPIOable" in its
> parent pin controller if it's strict. That's still better than the
> current situation.
> 
> I can imagine we could differentiate between in-kernel and user-space
> users of GPIOs and then make it impossible for the latter to request
> certain pins while they could still be requested in the kernel but
> that's outside of the scope of this series.
> 
> I don't see why this would stop these patches though, as they don't
> break anything unless you decide to make your pin controller strict in
> which situation you'd need to verify which functions can GPIOs anyway.

It can't anyway, Linus already applied :-)

-- 
With Best Regards,
Andy Shevchenko



