Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEE0E7E0CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAhQDNNsjcJwMAWm9FqeJTQdxQql2LGLlK6WWmFsjiI=; b=wn0d6bFnLt0nKSZowphpkenWAH
	ELVvSNiP+TEXBDasay+DhOo8qZZ9AYvQbjpS814PKuZydKTxqn28ZDljs67HARBOYSqqpBWzBThuC
	FHfrRLZ9+PisnEsMXF0BKg+1TFPVPiQhqj5a51XDr6MXzglw5+JKgBGuszHxU0Ctz0TiMBtfJFTgt
	FxlrPl1dJYHNDcpSaHYvTU01MRtMcwBXSpeCCrTrJfh+4N+6uEwMnL3mRD7+YpUSJJQ17TCCAm5MY
	IgsITgneFyQxxSORaFEhL5FOyu3EykrdY4c2hDcU4A4Q5/Y6QTEyP6APNy3iXAl33ziVUk2KhzQvF
	4zyeYDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPYB-0000000FJ8P-0xYW;
	Mon, 09 Feb 2026 11:35:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPY8-0000000FJ7Z-1xsK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 11:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770636928; x=1802172928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xwaqb36Nvj3ZWe9RdJQ2KBhRmKitRe0XNRuCltuMInM=;
  b=Ob+ZbWY+YsrUm2Qu+czKtC6KMzhtdVrzZ06lSWJ65LmVCTkTulANJF1O
   8ape89+zVH9iR/Xfp9EB7ZkSVPlB/kt8PKNm7QyOnHbSdWzZ5oRVzTKLd
   G/egh2TprWkxVv5eXzYMLqaIBCvWHJxkPZ2MpZC5p6UxCmHPmYFAIzu7a
   AmH0NUyv4cpsraKEh9iEK6ikKmDozPWVGy2hbXAwz3dUaONVAsCRoHYdH
   GFEnYP4D+jSYoSiOU8U8dKJclOIzQf5MtNq6F5gwggou7iPOAf6Lvf05U
   iGEbtvDNznkjdSVw4tebMLKy0d101rRnwCHs7vDjd729D1OqFJrzXyKff
   A==;
X-CSE-ConnectionGUID: KT2ikYpUSgC/VMQvVOjUDA==
X-CSE-MsgGUID: NugGstrEQz2M5pTidFjHPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82388012"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82388012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 03:35:25 -0800
X-CSE-ConnectionGUID: ZxoVSCP1Sv6TJkkP0NM1Qg==
X-CSE-MsgGUID: XrdCgqgDQnK0u4xyIQwZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216051310"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 03:35:17 -0800
Date: Mon, 9 Feb 2026 13:35:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Message-ID: <aYnGcsK3jq2wrOHL@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYnBrN0JRCf9-UjB@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_033528_564931_912ACA1D 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Feb 09, 2026 at 12:14:52PM +0100, Wolfram Sang wrote:

> > > > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > > > 
> > > > But can't we make it opaque?
> > > > 
> > > > We may have getters and setters for the priv member...
> > > 
> > > I think we could do that.
> > > 
> > > Two drivers use the bank member, but only for the device
> > > (lock->bank->dev). That can probably be refactored away, I'd guess.
> > 
> > I am willing to develop this series in the above direction. Before
> > though, I'd like to know from hwspinlock maintainers if they agree to
> > this refactoring in general.
> 
> Moving maintainers from CC to To ;) Do you, in general, approve this
> change to the headers? I think it is more modern and e.g. the mailbox
> subsystem has a similar structure, a header for the client and a header
> for the controller. And do you also prefer an opaque 'priv' member?

I'm in To and I am fine with this change (but not sure if I'm anyhow
a maintainer in the matter of the series).

-- 
With Best Regards,
Andy Shevchenko



