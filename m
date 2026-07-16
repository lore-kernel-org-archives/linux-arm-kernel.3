Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6933C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jk72+uoz623NXAbav4t0C7sMjm9XbHy4jVsF35tgyig=; b=wAHc9CH/hGkbiwXHd5oMaNpSkM
	qVAkxIzSPe04sGcAAaSKYqo4f66HB465/CK3KA7o+4n2kSD5Pg4g4bIeLQkgvGRcZwH64n4kk28HU
	hRqHjQHZB+ka9xSjVOUhr1FnkLAgRHCg9hxzg5uUyeT+IU6YcIOuY8OzQVyLRtf/fQY60hAStH3p4
	S5dynfLzxnPGiVKDhRYoZZpWE+NxvW25ON6MYlL8xtRVB04TltFe0MuRi1hOJ5nQdJhaWjqZ7+ouK
	AVtK+cylxuqwTxu/LL6lNiq5fukYtrDKYsmnDkESIbZX1QiteDt4r85QKR6ouYcb40tkvQRKna37+
	/hWZf6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQCu-00000000JVF-3iP9;
	Thu, 16 Jul 2026 17:49:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQCs-00000000JUl-1LSr;
	Thu, 16 Jul 2026 17:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224151; x=1815760151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WDOpxcwFle75xJgV45Y3mz4ze1wpcOya2GSWIlnO6Qg=;
  b=R4Yk3PzuyFeKLBvJFyfCwhVDmVZ7VkMyPd0nDX7Hpq7VMA/fRhp3xnvr
   PlyzWb+EdYfoihASSrQRtO+N6CMyifbw4bQa+S+Z9FyHoiSk0gMN5co6D
   jxFiiIBOS/hZ9HRuhiehKdx/ek2ZiqqT1K/u66MDvq3dNFtjmEbFgGXJn
   m0eRfjL7OXo9z8eGZpSPUaQCq8YZm5m3OsojfAQwztmLB9QfyhfKg4dDQ
   WVWEGpg0zmtfRvwIKo6vF75kmSb5ZKJVuRHeQNJ4/SxCPAg9uXcsUexq2
   IJuMXF79j7V/Xr6Y+VGrEIUnEsOD3dVqNAnr1JXL3LnF7NINUCF1kzXYE
   Q==;
X-CSE-ConnectionGUID: wuelDJ7rRV6YDb8pWsK/Nw==
X-CSE-MsgGUID: G9L+Y94eRGSOH1VdhAYWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84853703"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84853703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:10 -0700
X-CSE-ConnectionGUID: XfGCLMq2TIOWPCEFC2xIgw==
X-CSE-MsgGUID: kOYF/zaMQF25P48lYMtL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255415130"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:00 -0700
Date: Thu, 16 Jul 2026 20:48:58 +0300
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
Message-ID: <alkZiozKVGlAYVUb@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
 <ali7bki3jqpd8ckE@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ali7bki3jqpd8ckE@luna>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_104910_404297_4BFC71FD 
X-CRM114-Status: GOOD (  13.06  )
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

On Thu, Jul 16, 2026 at 01:07:26PM +0200, Link Mauve wrote:
> On Thu, Jul 16, 2026 at 12:03:17PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 15, 2026 at 09:55:16PM +0200, Link Mauve wrote:

...

> I’ve attached a patch fixing this particular issue, I will include it in
> my v3 if that’s ok with you (or it could go as a different series, I
> don’t care much).

Works for me.

> I think I’ve found another bug in that driver, it says .max_register =
> 0xffff but .size = 0xffff, one or the other is probably off-by-one, and
> I suspect .size should be 0x10000 instead.

Yeah, max_register means offset of the last _accessible_ register.
So, 0xffff sounds about right there. As for size being 0xffff, I weakly
remember that there was a discussion about these values. Can you dig the
lore archive?

-- 
With Best Regards,
Andy Shevchenko



