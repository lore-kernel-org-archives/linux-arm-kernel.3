Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82665C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nr1P0tgliNgWrwwlskRYCnoUwDXrwYuGsx1cH5L+SI=; b=mVzB8DGKDkYcuK6QMv9v1kYptI
	OA2izIqSbPgt7b6dehRbBj0CCGyvVnRYynMnSUGreseIUSjHKADg65ue81diMmNhu3wW7exK85WLN
	ciEDtXnLRTBJtU7vSSzurGTIPwnjUYN2qpOdsICNYc0IBRpT/Bg3Nknm8G4oAtE8RFGTdhlguCEBM
	FBnVsdNmftARy9vdq32rALAIt8igJ+c8jhqP9CBMebzwR/6u//nzcYcgNoSzfcU01x2h+Uet3bAIo
	R9Z3rdnhQ0ZYRU8gczIGvoXCZ4hsF3mNx3wrUiapL+LQFTvJeGCFYidGoRpSHUR9p4CbhyA/odgyl
	n1VSzihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NOT-00000005RCX-14lg;
	Tue, 15 Sep 2026 07:15:53 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NOQ-00000005RC3-1dXz;
	Tue, 15 Sep 2026 07:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789456550; x=1820992550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hFmXzfeob24QkbjYP8iQSqL7rHNCW4SoAluNe2Mtzo=;
  b=SqTPGq1/wIAt9oHS4ekKDbtM/G4Ocj3SZMwt0/NBaW1JmxQb5STj2vgF
   EUI19h3YNhp+CgoentcZiZFmvRElTAipytatNsq/Ai6mc7N4l+8SD9OHM
   NPjZlQ7A2uHGNx/i2EEi+7ZxXX7HQOa1KzrZnPUqt3uxaPwOiqVs69dyo
   KjlFTby+Ol7uNVYWfX4aTBx15PnJ0CEVVNfxOVaZQtv8kA3yWJr4Gh59s
   bWk+D3oWw+dZlEyhkWtmc2hWQdQT/jsUZElIISdLLZh5PLJyfRcIX4H9C
   a8BWJKM4Wkx4uV8SHLJUUXbk/ZhtMJChv+tjzlZRLMKc0XYtk+PJHWSal
   A==;
X-CSE-ConnectionGUID: NbIW9kUsSw+Vm0GcbJ19pw==
X-CSE-MsgGUID: lHDkDJ2iSI6DNlBTXCwZ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77372791"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77372791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:15:49 -0700
X-CSE-ConnectionGUID: jCoR3+hhS+iTfoVrXV+ydQ==
X-CSE-MsgGUID: EtpDa52ZR/agKBjetRCxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268588584"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:15:38 -0700
Date: Tue, 15 Sep 2026 10:15:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/3] nvmem: core: deprecate reg_write callback with
 reg_write_const
Message-ID: <aqjwmMn7GkAoxsu2@ashevche-desk.local>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
 <20260804135940.2378737-3-linkmauve@linkmauve.fr>
 <a1488d9d-3014-44ea-a0d7-6ab99fedccc9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1488d9d-3014-44ea-a0d7-6ab99fedccc9@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001550_585261_6F6996DE 
X-CRM114-Status: GOOD (  11.70  )
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

On Mon, Sep 14, 2026 at 10:48:21PM +0100, Srinivas Kandagatla wrote:
> On 8/4/26 2:59 PM, Link Mauve wrote:

...

> > - * @reg_write:	Callback to write data; return zero if successful.
> > + * @reg_write:	**DEPRECATED** - please use reg_write_const instead.
> 
> Marking here as deprecated is total waste as no one will read it,

This is still okay as we have many such things in the kernel (during the time).

> May be move this message to the core while registering.

No objections here.

...

> >  	nvmem_reg_read_t	reg_read;
> >  	nvmem_reg_write_t	reg_write;
> 
> flag this with compile time __deprecated flag.

__deprecated is DEPRECATED :-)
No new code should use it.

include/linux/compiler_attributes.h:110: * Don't. Just don't. See commit 771c035372a0 ("deprecate the '__deprecated'

> > +	nvmem_reg_write_const_t	reg_write_const;


-- 
With Best Regards,
Andy Shevchenko



