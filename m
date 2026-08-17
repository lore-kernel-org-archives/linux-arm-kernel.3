Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDDEC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebNzfdivjf/Gswal05COkbATM/3n6MgcCMGst44BTqI=; b=2Lil2a9C/TViBPfXQ62TqpRHNJ
	BHHtmrzOlbJF8gwdRqxq6w/2GGOY9JnjyXjPel3jjoki1Wb1adzi/MVgpllYi3rnbsurcFSk+AjGd
	IM7Inrt9T1tkLG6rAuJUkDiugUrAc0iCmZUy7gi8RptAgkI282GYBCiicxYcMQ5rT0/JHL5/h1BOc
	7KM6cnvl/lyvMxy+q/78xj1REaoF29gJ54zmAl/AUQEqGXefLcnpAfPskjbP5Km2YwD2+Mx9phhyT
	afxnOjUG/LCs3Qv3xsOoxEba4S3qIJOVJ6eJ/tbCxmGd9uZRCwPrVqrNc5drssEwFIsjJv8kI3avt
	a6Eay5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2U8-00000006gIO-0jT1;
	Mon, 17 Aug 2026 18:55:00 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2U4-00000006gHv-3LWC;
	Mon, 17 Aug 2026 18:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786992897; x=1818528897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UagiHACKsOzSdTkMKQraTvqxzxYR38G+03DH+tjOxy8=;
  b=jlJVanGWGpzgUHsEr6Pc10W3TBD/+9t6M0bopWPor3FeisOCIAFJIjwF
   1pPnP+4bOfY+6MmAiO3bl45TkVCSJwMNs47oSGrX5qr/Q+yI3alDwh9T2
   ye+DluuKq9gLcsPzIP5rzLnrzF++iLm5sY9J0JdGIMBuBDYSJf9h20cvv
   Ut1MW7pp2PrgqEUxJcIILYF5EDxMxCogfiMdyV7BphafTc9pqrIuRyPuk
   1TxowU5s+tfjTJ1f5S6hgUYTXU4wTUOCsMUZ3e+oO1Wz507JfbIgCAYVl
   2WSlQ0MUM4C7746G1p9NUaCD/bA2ih/4aoBjoWWTziQunhu3JvwayrfZU
   Q==;
X-CSE-ConnectionGUID: vhb7Jf5gR/m4pP2GMUCRRA==
X-CSE-MsgGUID: 7eyvox3MTVKPACLiz1J9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87330821"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87330821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 11:54:55 -0700
X-CSE-ConnectionGUID: yFyEuGAqQ9Gm8zboujI71g==
X-CSE-MsgGUID: Z79PQw2ITnSV0r6BrpxHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="266971517"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 11:54:45 -0700
Date: Mon, 17 Aug 2026 21:54:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
Subject: Re: [PATCH v5 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <aoNY85rdMdBDSiGW@ashevche-desk.local>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_115456_880255_9426F3EC 
X-CRM114-Status: GOOD (  12.64  )
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

On Tue, Aug 04, 2026 at 03:59:34PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

FWIW, if the approach taken is okay by maintainers,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I think this is right direction to go. We should use all possible ways to
protect the data from corruption.

-- 
With Best Regards,
Andy Shevchenko



