Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2927C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjgvz/vhhUio96FpNONomwZvx9Irp7LiY8/VCGdRF4E=; b=dKtGKRr9IA0jH0YrbRqQ7ihuU/
	cZUYuFJ0f5YiKmF7cFoS9r+7jh8mYqGiIwa+htOTRdd4cQvc4VARMZlPGYaWMq7YpVumimf9bVpnH
	y6pceQap+cQ5yOinVDEy7J16qTI7yin+QzZTq64G7V6gj0SP7gu+tcvKjiA4lCPLiEKcvyBFF1zmY
	3HWayn5j43iy9AguvMVg8syjqwTGuK3YQYQ0RUiumlYi5ck5DSoFEIsRKoetnc5UDnQ6wAgkmtPtB
	ajD5F56cLHhi1Hb+vy8jjcb4xOnmFucQRX2oU8kBpLPdmVJXwyhp0lbSre/jxCAxbB14q91O5R/6S
	6atW3X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0C-0000000GoCe-47jx;
	Thu, 16 Jul 2026 09:03:32 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkI0A-0000000GoAK-41Uo;
	Thu, 16 Jul 2026 09:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192612; x=1815728612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdc0Qg0CaS9HhMRhYLzKY0lvqzMX6zDKQ+/7G+CVATM=;
  b=jYILcZEHkQCRcC2bQQWXxoVLRN4I92P8XCKdFZP2IDy6Ih22ZzJ1LCbB
   Zq8TzYQHi6JZkcVbCoF/Kz0JSu64HstwhjeFRhRsXP2XOwkjh6BGEARaX
   9/g0lGizJcNKgTQDgq3Rg0vVDwJkW1cjA65yETJLHSg0MKFvPVpPh9NHW
   mCyOzQlMVvxqsQgEU4W4XqaIKSwybDW9lzFKlFUBV7vJ8E2DGpDARdykC
   kiQvLZjHQFhJ3YkFtkcAd+jRJiE+90chE4JzydiFncF/v1ybLaUvTfciy
   fkIItJyvZxYlPPzD73MBMd7j2x8dWwaoj71O/fZJwY2KtaPLvXtmjg+Fl
   w==;
X-CSE-ConnectionGUID: Y4grOjKVQ1CtVI7OiPzs5A==
X-CSE-MsgGUID: V3kmYgzSTOq/Q9oDEyKgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84874235"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84874235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:03:30 -0700
X-CSE-ConnectionGUID: lRoi4/cIQz+TT/pG5vIyBg==
X-CSE-MsgGUID: /nbhLZgmScmziK0fSPUDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260260162"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:03:20 -0700
Date: Thu, 16 Jul 2026 12:03:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] nvmem: fix a const-unsoundness in reg_write
Message-ID: <alieVR1cOtOySi4_@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715195520.25410-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020331_078282_EF15D356 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, Jul 15, 2026 at 09:55:16PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

You forgot to use --base. It's unclear against what should be this applied.
I tried Linux Next (next-20260715), and it fails.

Yes, it applies against v7.2-rc3, but it means that this won't be applied on
top of maintainer's tree (which has something already that you have to take
into consideration).

For the record, the first version of the series was no go as the first patch
there breaks the things, like

drivers/nvmem/qfprom.c:446:22: error: incompatible function pointer types assigning to 'nvmem_reg_write_t' (aka 'int (*)(void *, unsigned int, const void *, unsigned long)') from 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
  446 |                         econfig.reg_write = qfprom_reg_write;
      |                                           ^ ~~~~~~~~~~~~~~~~
1 error generated.

This version doesn't have this issue (at least with my smoke build tests
on x86_64).

Now, what catches me is that regmap_bulk_read() proto used for both cases in
drivers/nvmem/apple-spmi-nvmem.c without any changes. Which makes me think
that the approach can be done in a simpler way, id est converting users first
to use const specifiers in their callbacks first. But this trick is done with
using (void *) casting (?) which makes warning to disappear, which is
interesting case. So I think the Apple driver should actually use proper
protos and hence wrappers, otherwise it makes compiler blind, which is not
good. TL;DR: you should fix the Apple driver (and might more if any of them
use that dirty trick).

-- 
With Best Regards,
Andy Shevchenko



