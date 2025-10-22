Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A25ECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUYU5ST3fNGR5nEf4gfqMtyeNocN0hq6s2wiZRHF+dY=; b=ahfY3OmhJ61jbV0Rs0xIrBTUGw
	AAKXBnVPk61wq8nF6HnvC12Pzy9ZFB+slI5XGPuBzpO2Yo3a3qDZEQWlSdTGXvsrB8Kf8A0onOSXN
	s6YGjuGnsbhGyWSIgJi0EZeLHCLMYYm9wbSzDnkssl1AtD/NjdJN9FaOqd5s0JiTFaWJ6OPSdnESW
	7mOUe6SSAXA9hJ/3BqLxrXIq5sre3mwxlcnpA881We48OnSKhCe1rYjxhHZW5hKBVpipcupujleg1
	zTio7meHJpShy+V6nAOE5+FRyLDZCfZwnzOIMS+yMexjNJHpsOHRSOC793sLZ6l4OrvemmjxYn5lQ
	2im8vLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcON-00000003jx5-3ZUV;
	Wed, 22 Oct 2025 17:12:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOL-00000003jwM-2nWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761153173; x=1792689173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CA2iL+o+DO6b320JfGgya3sZsmpPjkeP4srUuVWXJQY=;
  b=g1BSwmGV3LvNM776l8LIKnYAhHwSL3JG0k0fyC9+oDZgnOZWHOIHJ0xT
   81uVse9L5hec19WGFPlyNr/40ihlairrggaRaH/xxABQKnHlsduYwKK+X
   Pq/RXIUJJ27Ae1ouHzcFNcSoxpYWcty1GbjgzH0TvBvhAl7I70bpjfu+E
   XZ7yz2pM7hlEalEMjcF7f1ZSB6m1UvPUT3hVMihmpI1RrM07zVdWL8sb2
   CAZ6j1+m6dZoz0IZq8yn73514Y0aU2A5jzuxvFf4StVL1l4yyDa+zvFsp
   LOedJ5lsOE3tEvxbrL8ZPaHej2Y8cZIIjGJQm81aoVYbqkflyFoaAZV2c
   Q==;
X-CSE-ConnectionGUID: IiicW9xoTgKdFIVQdnyxng==
X-CSE-MsgGUID: sZfxGtthTPCvzHCBfSxPew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73979651"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73979651"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:12:53 -0700
X-CSE-ConnectionGUID: u2ERStFSS/aim79IAjV65A==
X-CSE-MsgGUID: 3dwWDioCRDGoZpxlH9UaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183146706"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:12:46 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBcOB-00000001km0-2Hse;
	Wed, 22 Oct 2025 20:12:43 +0300
Date: Wed, 22 Oct 2025 20:12:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
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
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] string: provide strends()
Message-ID: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
 <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_101253_715702_8CBDC3C8 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 22, 2025 at 5:25 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:

...

> > > +static void string_test_strends(struct kunit *test)
> > > +{
> > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > +}
> >
> > Have you checked the binary file? If you want this to be properly implemented,
> > generate the suffix. (Actually making the function static inline makes my point
> > really visible)
> 
> Andy, this is bikeshedding. This is literally the least important
> piece of this series. It doesn't matter for the big picture whether
> this is inlined or not.

It's definitely not a bikeshedding. I try to keep a bit consistency here and
I don't see the point of bloating a kernel (binary as well) for the function
that just a couple of lines with simple basic calls.

Also note that with inlined version strlen() for string literals will be
calculated at _compile-time_! This is clear benefit.

Really, library code is not as simple as dropping something to somewhere...

-- 
With Best Regards,
Andy Shevchenko



