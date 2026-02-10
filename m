Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23450EA8126
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gomPojk6ybAu2H/648ski52YGY8aFgI0kQOhNHjdOpc=; b=v9Q2JHEDN4DnpU9vtovH/XXjN+
	lTGXboI2yPZUBOpYjio8nnWe2XpvcW7lEX3BjPT4Eh+9Ux17VYaUYRJxz2E//yF74KbGGHOs+HZgx
	B2XUzYF5rP/g73mXuyYApV9gwQwdACwBjOEElBPKgtDnh6MpzlkRV597vflJggw5wpuhHH77JOOFc
	2g2SlL4SeI//aJ66siA4ga2yckCnCODOuwrgEXzQQIyXRSoSqZNtpIdvG8dAAOnFae3B5W50PkXFz
	6neJ3n/WWsUJ9NnJC4lHndJNBeaWiq4EYfAhT+Fj2MON+Cxp2A+SNfo8BGYaqJNNhArxLaVVDeNox
	SIgVefGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppRU-0000000H768-36tc;
	Tue, 10 Feb 2026 15:14:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppRR-0000000H75O-33bx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 15:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770736458; x=1802272458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5XHstcK3GNmPCCnMCyYj61+dg73mEfAPf1RQMlNT978=;
  b=OSQnuzSg5WZqJFW9A3B/2TlHUCGhhR4xdYEwcnexMzQOr7w2JVnGLYfe
   VcCZe4PEOJnJ0VrM4ZmzLnOB5W7PRV3IsHEkpgUWW0g/gRh6CExvibJ+Q
   grGKGqoDkzV5WrEC8LFmwMOdzAquitfP+9MPLtEkiGqUEhKBIQLPOQVNE
   Tl2h87ES70u+rz8y8gNDY7qPFru6eSuxlNiToJ9TUHw1Zs9wlxe4gwO6J
   NCy+7wG18t0rc6ntSTibCipCprWgFGCXyOIy2Yu13V4PGNGVBvsfmVtd2
   HxlrKqWG+oTj44jAOQ5/7R1XuJQ8WISjgIirz7NyCtOaJUykzsTMBz/kU
   Q==;
X-CSE-ConnectionGUID: AQWAkLL6SLWIFomgoor2Zw==
X-CSE-MsgGUID: 4O3yQGZFQk6zDTpk7P5UVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82505029"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82505029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:16 -0800
X-CSE-ConnectionGUID: PLTW0sgvRr+sZIyjb4ObHQ==
X-CSE-MsgGUID: 0j9FHxy/Qi2fCSVgALjwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211778201"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.131])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:08 -0800
Date: Tue, 10 Feb 2026 17:14:04 +0200
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
Message-ID: <aYtLPHmZTg8oFxfL@smile.fi.intel.com>
References: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
 <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
 <aYsMCVf1qpLSCXTs@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsMCVf1qpLSCXTs@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_071417_808562_30D67DC2 
X-CRM114-Status: GOOD (  17.61  )
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

On Tue, Feb 10, 2026 at 11:44:25AM +0100, Wolfram Sang wrote:

> > > And if so, would be this series acceptable
> > > as-is then (modulo the better include-sorting mentioned by Andy)?
> > 
> > *From my experience it's not the Q "will they or not?", the Q is "when?"
> >  they start abusing it. I really prefer to hide as much as possible from
> 
> I totally agree with you on that.
> 
> >  day 1. Maybe the structure can be split to two? Currently IIO has a
> 
> I also thought that keeping some internal header might provide that
> safety. When looking into it, I didn't see an obvious and somewhat
> elegant way. Even more, I got a better picture of why Bjorn named the
> current approach "unergonomic". I got some ideas which look doable in my
> time frame. I will try going the full route, after all.

Thanks!
Looking forward for the rest, the cleanup is quite good, no added lines.

-- 
With Best Regards,
Andy Shevchenko



