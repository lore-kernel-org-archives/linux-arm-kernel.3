Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8CBCF65C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrRavWdoxPAWhw62AqSPOVo/OLpyor1u8U+EX9APH/c=; b=H0q9XDFSuvpgtmz+Szwi1VYW5t
	xs18Yba519QeOcLrSnJYjvjy8amN/wgDwvttQGBWjvOrjXWVsPp/MYMoiFitaVbc9n0Y53maxR7EV
	sdZYpDUF++rkGuphiALRZRa+9R/Z7QbfHQnCM3ohWiihQMy6/kO9aShsEwH6sGoi7JOTweNX4j1kL
	S0ZAtKeMOXgXs64Nox+Odg6bxwkMIyt8o2VSFH5vSOFmQf11UJW5aTq8dOoqjcD7yJtkV7Qi45EM9
	0GHQai9LdEn/aCbKaVi8kspOI5kD3WxD1/mATWvN5JU/N3o3mhJm/izReKwIw5w/dzpRnCb5Dxtvk
	dyGBPwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJO7-0000000CFKj-02dq;
	Mon, 26 Jan 2026 10:00:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJO4-0000000CFK7-2aRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421600; x=1800957600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+66ynW/UosBvC/E+PZZmULkSUQHS1YNGDIGs4shhqw=;
  b=E43T/tFW9dDG6B6KZoK9kFzv711xLi7+pioFG2y01JmcNZjOXuwTHifw
   BhdBb1ZVsjYLYpmwmO1VFibFh9w6Pf2fdZyIgSMX+uTBR4ZEKvBkP63bL
   xNP/cpbh6o+RbdfVVA2/Q8BBA7vSN1vUNttM22ovA5RJ19jdpG/eAGd6M
   ZiL68aABc4MhEQfS1DP7F6Bdzmpo9mfbhYiUPaiQKfLAEFcdBM4GaWx1L
   NdZ/XpbI8OHxdQY0n7BMYSLEZMBCLwJkZdlmiA1E7wYrrn87SB129jbsj
   dn116AzOnMu1yFb32a8NP/dVNMdlcQGa3js0WxNs0xcYssBfZfkA7BPMR
   w==;
X-CSE-ConnectionGUID: VUkRnHn+T3SCrAYS8osVzg==
X-CSE-MsgGUID: EGpIC4T9RRiID4EDqzw9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73183359"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="73183359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:59:55 -0800
X-CSE-ConnectionGUID: XFLH6wX1QCeVh2rWVMlKBw==
X-CSE-MsgGUID: lTttj+paRWeICoj+PaAr/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212501718"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:59:46 -0800
Date: Mon, 26 Jan 2026 11:59:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_020000_670858_A10733EA 
X-CRM114-Status: GOOD (  25.94  )
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

On Sun, Jan 25, 2026 at 07:46:51PM +0100, Wolfram Sang wrote:
> TLDR: I want to create a hwspinlock provider outside of the hwspinlock
> directory. So, I refactored the headers into a provider/consumer pair.
> Which seems to me like a reasonable seperation anyhow. No functional
> changes. My build tests went fine and buildbots are happy, too.
> 
> Longer explanation:
> 
> There is a device (MFIS) in newer Renesas SoCs which combines various
> things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
> strictly separated. Registers are kind of mixed and its register
> unprotection scheme will need one of its own locks. I tried various
> paths to handle this device (MFD, auxiliary bus) but I concluded that
> the sub-device dependencies give enough reasons for a single driver in
> drivers/soc/. So, this series will allow me to instantiate a hwspinlock
> provider from the other directory.
> 
> Patches 1+2 do the actual refactoring with a fallback being in place. I
> used '-B' with git-format-patch in this RFC, so the actual changes are
> more visible when the headers are moved.
> 
> Patch 3 converts all the users. There are not many. We could try to get
> all the acks for this single patch. Or I can break it into single
> patches and send them to subsystems. I don't mind.
> 
> Patch 4 simply removes the fallback.
> 
> Looking forward to comments on this approach. If the hwspinlock
> maintainers like it as is, I would kindly propose to apply patches 1+2
> after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
> avoid chasing a moving target and b) this would remove one dependency of
> the hwspinlock driver I originally intend to upstream, of course.
> 
> I would take care of patches 3+4 as needed.
> 
> A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes
> 
> Patches are based on linux-next as of 2026-01-21.
> 
> Opinions?

I don't like the idea of sharing internal stuff. Why would we need to have
a struct hwspinlock to be visible?

-- 
With Best Regards,
Andy Shevchenko



