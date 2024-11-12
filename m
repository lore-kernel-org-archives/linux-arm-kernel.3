Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A563D597B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XvnojsbDU2iklE9xJFwgVgRWENV+XinNVMN6pOt4es=; b=NONKMVOxDwZYiTsKHyRxmiQRav
	QZCDnn6wMC5Br71vCp7WRK1QkL91yp8bY65Ibyg7Y/tJdXPYJ6rIH+stlBfecjvjdb1/SjUDMu1x2
	7BnhpTS/1WH2Bs+98gDsIW3fJHSW9vEJFT03PH1xQN1TIKBvB0V/x3ADs4o1hjLkuMBQ/HBQ9dKog
	gal1qWb3e7OGLTl6jHNItsMuMZHX6z+3waGs2aEQ2gGcdTNxHOzoX53g0ME3cAhQrREfzQvjlyRPp
	WtpO9F0/56UZ89MDOYOkoUKUzUqMymVHBeYmtTMiIrP6H9LUXyxz+y5UWpuF0nL/HmvDCQO4MJ5c2
	IKlf6kiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB07P-00000005G2e-0Y8t;
	Tue, 12 Nov 2024 23:16:19 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB02z-00000005FDM-0Ytp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 23:11:46 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id D08794C739;
	Tue, 12 Nov 2024 23:11:39 +0000 (UTC)
Date: Tue, 12 Nov 2024 18:11:37 -0500
From: Aren <aren@peacevolution.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <6jwurbs27slfpsredvpxfgwjkurkqvfmzccaxnfgtuh4aks3c6@ciapprv3wsex>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
 <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
 <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731453101;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
	bh=/XvnojsbDU2iklE9xJFwgVgRWENV+XinNVMN6pOt4es=;
	b=QSjWisTh28m3ad1tuS8ksPEWHblcKQJX1GVqDMfbdGFRlCO9UKjCCII5U0UztBmrE6NUW1
	ajTb4KKLxsSIaHAKj3gbmwqW91BnTF6mZ0TQDRXEPGHJTR0fJFipdfoO1DNQLMvoEaffwy
	Uz5hZTjJ+fCuSFtKzzlpepmg9SJyEi0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_151145_337679_C9468398 
X-CRM114-Status: GOOD (  31.96  )
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

On Tue, Nov 12, 2024 at 11:15:54AM +0100, Uwe Kleine-König wrote:
> Hello Andy, hello Aren,
> 
> On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> > 
> > You can do it differently
> > 
> > #define STK3310_REGFIELD(name)							\
> > do {										\
> > 	data->reg_##name =							\
> > 		devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##name);	\
> > 	if (IS_ERR(data->reg_##name))						\
> > 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> > 				     "reg field alloc failed.\n");		\
> > } while (0)
> > 
> > > #define STK3310_REGFIELD(name) ({						\
> > > 	data->reg_##name = devm_regmap_field_alloc(dev, regmap,			\
> > > 						   stk3310_reg_field_##name);   \
> > > 	if (IS_ERR(data->reg_##name))						\
> > > 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> > > 				     "reg field alloc failed\n");		\
> > > })
> > 
> > I am against unneeded use of GNU extensions.
> > 
> > > > > replacing "do { } while (0)" with "({ })" and deindenting could make
> > > > > enough room to clean this up the formatting of this macro though.
> > > > 
> > > > do {} while (0) is C standard, ({}) is not.
> > > 
> > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > don't see a reason to avoid it, if it helps readability.
> > 
> > I don't see how it makes things better here, and not everybody is familiar with
> > the concept even if it's used in the kernel here and there. Also if a tool is
> > being used in one case it doesn't mean it's suitable for another.
> 
> Just to throw in my subjective view here: I don't expect anyone with
> some base level knowledge of C will have doubts about the semantics of
> ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> because it's more verbose and when spotting the "do {" part, the
> semantic only gets clear when you also see the "while (0)". Having said
> that I also dislike the "do" starting on column 0, IMHO the RHS of the
> #define should be intended.

Thank you, this sums up my opinion on this better than I could have (and
some bits I hadn't considered).

> So if you ask me, this is not an unneeded use of an extension. The
> extension is used to improve readabilty and I blame the C standard to
> not support this syntax.
> 
> While I'm in critics mode: I consider hiding a return in a macro bad
> style.

Yeah... probably worse than any of the formatting options here. I guess
the proper way would be to use devm_regmap_field_bulk_alloc, but that's
well outside the scope of this series. Perhaps it would make sense to
move the macro definition to just before the function it's used in so
it's at least a little easier to spot?

 - Aren

