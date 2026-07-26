Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7310AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gH91vs1XUmyWPNxOvMm5JbdkkX4kBzPrXZaO8GwcXc=; b=UI8T3Wuv3gdr/MZCaAXaCYt5am
	aFRCEYfrs/65o/ebYwwh03U8o0AaSv4m9N6xh/lpww1QK6Za9emwXYM/NjXhGBuFYEjemHCJxhhuI
	ebodbI9xpgsGb3Yk+nbAtquj9x3/ngY03XYs4TUv20bWQgr0g7GwTTovHZ4jkNhndnerdMZbXCjAe
	AXBvvJCy5uEqTjpDRovBkk6fhOZOe2pQF2QQyFJKpjM2CdOmC9fSqdFSNBAn+lTc9oune47mTqu4W
	OQimGjsb7gYJ6n63owJpxZHTcby9kQf61L6AdDLuOGUvH2JzxJkvQWxRLpnaVDdgCgQirlcR114eK
	kM8KBAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyP7-00000001B2S-1Hwg;
	Sun, 26 Jul 2026 12:56:29 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyP4-00000001B1v-27qE;
	Sun, 26 Jul 2026 12:56:28 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 046A5F40DDF; Sun, 26 Jul 2026 14:56:17 +0200 (CEST)
Date: Sun, 26 Jul 2026 14:56:16 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
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
Subject: Re: [PATCH v3 3/4] nvmem: apple-spmi: improve calling safety with
 wrapper functions
Message-ID: <amYD8I6a1c01fnvs@luna>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-4-linkmauve@linkmauve.fr>
 <alkd0WWr3KX7MS5O@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alkd0WWr3KX7MS5O@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_055626_713320_6F18F254 
X-CRM114-Status: GOOD (  19.64  )
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

Ah, someone independently sent the same patch as this one in
7089170e1df160f5f8fb395bc5aa2e2697b4e896, so I’ll drop it from v4.

Sorry it took that long!

On Thu, Jul 16, 2026 at 09:07:13PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 16, 2026 at 04:24:10PM +0200, Link Mauve wrote:
> > This driver used to cast the regmap_bulk_*() functions to void *,
> > bypassing any compiler safety around incompatible function pointers.
> > 
> > With two small wrappers, which just convert the void * priv parameter
> > into the wanted struct regmap *, we can remove the void * cast
> > altogether.
> 
> Reported-by: ?
> 
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> 
> ...
> 
> > +static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
> > +				 void *val, size_t bytes)
> > +{
> 
> > +	struct regmap *regmap = priv;
> 
> No need :-)
> 
> > +	return regmap_bulk_read(regmap, offset, val, bytes);
> > +}
> 
> static int apple_spmi_nvmem_read(void *map, unsigned int offset,
> 				 void *val, size_t bytes)
> {
> 	return regmap_bulk_read(map, offset, val, bytes);
> }
> 
> ...
> 
> > +static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
> > +				  const void *val, size_t bytes)
> > +{
> > +	struct regmap *regmap = priv;
> > +	return regmap_bulk_write(regmap, offset, val, bytes);
> > +}
> 
> In the similar way as above.
> 
> ...
> 
> > -		.reg_read = (void *)regmap_bulk_read,
> > -		.reg_write_const = (void *)regmap_bulk_write,
> > +		.reg_read = apple_spmi_nvmem_read,
> > +		.reg_write_const = apple_spmi_nvmem_write,
> 
> I think the proper ordering is to address this first (before your main change)
> and update later with const argument. Yes, it will be a bit more changes, but
> it will be cleaner.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve

