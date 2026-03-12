Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36147FED2F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/PK2NoM2XgmfEiVVn39HbEOc1b+SZKe5Qd43oQ7yJc=; b=0BE10b8dje1rukICyoZYrIUz+4
	QdNRnVOczorz5Q4rS9uqo2+QP9ZZd2bqZWqgAOqUFksqx3DvopOs2j/tL2g3onPNrdcKLD/rF/uvq
	hAEd+Tw8uC4QeX16DwhjZH/DqGsuVUwdHPqiThXiNBH+kU6PtjCl2gaeED4ENaERWFImZvokYsJVT
	EsUbEPYvWs0ke4hWs3V246LBo3WXNjq+LFDPSKk+dP+ZWW7UqzJhkQiuMiju3/a44qg8+OKuTCnTf
	n1BBn2aZ4vmLlRxGkv0Z6qDWKHD6OVX/ZQe5FSA87cjwn0PKsXfUM5V8/JNp9C72fLbkuBBmHm4h3
	fRzRJP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cLx-0000000DixY-2Q26;
	Thu, 12 Mar 2026 09:29:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cLs-0000000Diwt-24UH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307749; x=1804843749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lEOtM4zhrzldYTBWFHJI+Dhum9TqJxp4kJWyKgJHjgI=;
  b=jA0tfWLuzauzj02fuwXwtpZSOdsY4IOexlp/s4UEi+h4MPlsTfhu8LzT
   esE+11xQwx5tXBL7eMLQGOE0LxRvVLmC2vZ6McH/Vt9O58L4XbkRV6L8i
   hE4zRyJ2UDnvZQmeewJRFDrr1wEiN2DZQckAsM2huNo7xAAKl+hVsIvmc
   cpkUujhq5EinxkdONSH5W223yRwCZSTHvjKlUhQfsN70M6nOB8G3Lsp9y
   0eXkbR1yi6sZmrJWOfN5/R9msnt6gf7RfHA+zmhWmARI5v7qWbMiZ2hi4
   4q2tCwESrOU0xYG0qtx3Av5SV+loHtpUd1oCS4UhLn8nU33dZELwLCNQq
   A==;
X-CSE-ConnectionGUID: ny/X4TkJR9Suua3/WohAiw==
X-CSE-MsgGUID: nDn7deQ/R5W/+wJcEmnOoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74285422"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74285422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:29:05 -0700
X-CSE-ConnectionGUID: Bmp7J73lQ2KkDt15aqIghA==
X-CSE-MsgGUID: VGjzDg/3SbWUY6CwzC6H8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="225466070"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:28:57 -0700
Date: Thu, 12 Mar 2026 11:28:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: wens@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <abKHV7RSJWI0U-sK@ashevche-desk.local>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
 <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
 <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
 <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
 <2d4e69cb-a43c-4d13-9f7b-20b95cee43a7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d4e69cb-a43c-4d13-9f7b-20b95cee43a7@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_022908_861667_48CB7A0A 
X-CRM114-Status: GOOD (  28.43  )
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

On Thu, Mar 12, 2026 at 08:41:03AM +0000, Jon Hunter wrote:
> On 12/03/2026 07:49, Chen-Yu Tsai wrote:

...

> > > > To me it sounds like a bad design of the driver for this SoC/platform.
> > > 
> > > I am not sure why you think that. Assuming a 1:1 mapping of the kernel's
> > > GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragile.

You may use valid mask (which is also available via GPIO device properties) or
as said below. In any case this thread just convinces me even more that driver
has a design flaw.

> > If the hardware has uneven number of actual pins for each bank, either
> > you end up using the deprecated static GPIO number allocation and
> > have holes in the GPIO range (sunxi currently does this), or you use
> > dynamic allocation, which gives you no holes in the GPIO range, but
> > not directly calculable mapping between DT and GPIO numbers.
> > 
> > The driver handles the mapping by providing an .xlate callback. A
> > consumer shouldn't assume anything. The shared GPIO library probably
> > shouldn't be try parsing the property itself and use the result to
> > grab the GPIO descriptor, but just rely on the gpiochip's .xlate
> > callback in some way.
> 
> Right. I was thinking that isn't this why we have the xlate callbacks in the
> first place to handle such things and not make these assumptions?
> 
> I am curious if other platforms could have the same issue? I did not see
> this immediately with v6.19 because it is only one specific platform  we
> have that showed this. So very much a corner case that will only be seen if
> a platform uses shared GPIOs and the shared GPIO happens to be high enough
> to overflow the descriptor array. Even if we don't crash, at least for
> Tegra, we could be using the wrong descriptor too for shared GPIOs.

None of Intel platforms has this issue, for the rest I have no clue.

-- 
With Best Regards,
Andy Shevchenko



