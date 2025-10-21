Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA7DCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEjqvkmkqdRYqQ2jpw0MN2hBy2g0zYvGOlu8RW2w35A=; b=dtG1bZEIL3HjBvWV5u0xMHUJY3
	RndUSV4hNuG5KpXvvikJX39fzsw6p0MV1JwxvhbVDugC18CvN1xKMlYb+hrjfioLQvvlkd80oymWZ
	tdr3gL9pUozEENrQD+Jehq3Ackqt/dL+29gpE4KJBYbnBbuGi0nQnQqu4UQayX4G7JhYfVe/JAfQ7
	swbdZWBlueJvTPZ9Jqio9QZoMNBqs599S5+s4d4XJAPgfjty1XvKPk8PxLclgJaKtwKnpL73Z3F/L
	49iMlvu1AEOdWgpoLIo4GfuridBZeMSeqTvOViU6E99JC41kr7hWEyBBwj+hlZKR2KxnQj9qJflph
	sJwxGDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEiq-000000001La-43Tw;
	Tue, 21 Oct 2025 15:56:28 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEip-000000001KZ-0c1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761062187; x=1792598187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jq4JC8Ux1vFQg5wDBSPB01/bGxMh9cnLPXkN0FYtWFo=;
  b=P7ghCTljcRNyW1xmFfZjFcLcJdU3a2h8rtBNohLiK+ROdXmVYSEIuayM
   Zr0eh4V57avS5K/9IYSFpI5DhalVBxw7C7+h5EIiQ1E35XkEh0CAfk9NR
   5QNh8m57mGwIgQJ4IPIB8ua5gsL/LYluUqmrpcGzcIRyIUu29y3Ibabkc
   hOHDH79OD54GVYuVy0n/A+MIjSpea5DMe4j7F1dNVHgDq6yi0gHTKY/u/
   hv+9CJsx87xNwyfpgmqIAWtNN47T1zCCQCACxgxeToB+2HUqU/a2be18L
   9MIQsidVxGgQAX5vN5v3t3l7s4m0QbPspZnuA/H8Y4eaudXM1t//7jg6T
   Q==;
X-CSE-ConnectionGUID: BKH5h4dZRk2fzrI8UjRzEA==
X-CSE-MsgGUID: G/RbuoXURtSaVDDLMRHizQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66833936"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="66833936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:56:22 -0700
X-CSE-ConnectionGUID: ZJo85j7gSq2uWsrYv4yW5A==
X-CSE-MsgGUID: K1YUBjw8Sr6lspBiL2Hzbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188736412"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:56:17 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBEib-00000001XFh-1JOW;
	Tue, 21 Oct 2025 18:56:13 +0300
Date: Tue, 21 Oct 2025 18:56:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <aPetHXE0zuWANRNd@smile.fi.intel.com>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_085627_236575_03838972 
X-CRM114-Status: GOOD (  35.03  )
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

On Tue, Oct 21, 2025 at 02:06:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 3:53 AM Manivannan Sadhasivam <mani@kernel.org> wrote:

...

> > > That only happens if the driver uses the reset API. If you go with the
> > > GPIOLIB then none of this matters. I definitely don't want to change
> > > the existing DT sources either but I want to find out if the code in
> > > this series is suitable (with some modifications) for supporting the
> > > PERST# line or if the logic behind it is more complex and possibly
> > > requires separate, more fine-grained handling.
> >
> > All PCI controllers relied on '{reset/perst}-gpios' property for handling the
> > PERST# signal. Now if we change it to a reset line, then the drivers have to
> > first detect it as a reset line and use the reset APIs, if not fallback to gpiod
> > APIs (for DT backwards compatibility), which will add unncessary churn IMO.

Can't the reset check be added into a common place once for all the PCI controllers?
Also one can make a helper that does all necessary checks and if required falls back
to the GPIO.

int pcie_controller_get_perst(... dev, const chat *con_id /* fallback */);

(name is from top of my mind without following any patterns).


> Ok so some platforms define perst-gpios while others use reset-gpios,
> I see now. Yeah, it's better to go with explicit GPIOs then.
> 
> > But if there is no way the GPIO subsystem is going to support shared GPIOs, then
> > we have to live with it.
> 
> Well, there is going to be. We already de-facto have it but it doesn't
> work very well and is fragile (I'm talking about the non-exclusive
> flag). I very much intend to bring this upstream.
> 
> My question wrt PCI PERST# was whether this is useful for it because
> IIRC all endpoints sharing the signal will assert it (or rather their
> pwrctl drivers will) and then only deassert it once all endpoints are
> powered up. This would translate to the pwrctl driver doing the
> following for each endpoint:
> 
> perst = gpiod_get(dev, "perst");
> gpiod_set_value_cansleep(perst, 1);
> 
> Do the power up.
> 
> gpiod_set_value_cansleep(perst, 0);
> 
> And with the implementation this series proposes it would mean that
> the perst signal will go high after the first endpoint pwrctl driver
> sets it to high and only go down once the last driver sets it to low.
> The only thing I'm not sure about is the synchronization between the
> endpoints - how do we wait for all of them to be powered-up before
> calling the last gpiod_set_value()?

The refcount inside GPIO descriptor? Then gpiod_set_value() will do the magic.

-- 
With Best Regards,
Andy Shevchenko



