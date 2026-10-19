Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF99606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=It7hgLgW;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rtq8hxqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+7tIdFx2CZna94rLbvcst0wmmeGVJ2/denMG9ZxUVY=; b=It7hgLgWyaHRlvJuJ6Xr/azzbc
	0knWP/lGDMrjIN1i27rWL5iVN2GHbnnPKubBdYno+6WfL4WS870govTFvbGYh2rSWlEdsm2RImJJa
	ZRW+Gt7cM27SbaC1UZfWT1GDAIMaxSzKW4Lb1myn1CkMlbed7KcufnmID9kK0wQt4gV13iFj6Zyak
	nk4wJLqn9ykQwLXGprZZ3YyEBsOQEJ2C1NhXtFR+CwiHMO+V11lfQvILdxTXAiQa+hjpsiBN1IN9V
	3XjW8jaVs844+CCoRcLkwsVmqZ4TVjiT20tcDoayViPytZmyg1TwSLXqFKL/MoyaLjhjKYozLseuK
	NiGvxK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq0W-00000007wCT-35mq;
	Mon, 19 Oct 2026 16:14:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq0U-00000007wC4-42iO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:14:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C320BA;
	Mon, 19 Oct 2026 18:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792426351;
	bh=ZIVyyqQnMiQPKh6vfUHB6ETpY3hIiE6ECUkpT8nmUAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtq8hxqZHb855CpRIjODSktO+Ye4qbFYBQWgoxiOwGPtHvR91oQlHNMOgci85Gjvf
	 Cb7T2oDCsoqC6UGrLkHp9p82OpVpz0kvNG0p01Lb8DEP+l7U7mEYAL0HykAvtEti/A
	 PLKBppXhm7TEyUVu6cPP5e1rREnI81Au9CYSw7eQ=
Date: Mon, 19 Oct 2026 19:14:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
Message-ID: <20261019161436.GD3705@killaraus.ideasonboard.com>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com>
 <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019152203.GA5830@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_091439_147382_3D18AD23 
X-CRM114-Status: GOOD (  39.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > pointer to the clk_map structure, and populating it up-front.
> > > >
> > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > @@ -16,19 +16,24 @@
> > > >
> > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > >
> > > > +struct clk_map_in {
> > >
> > > The "_in" suffix isn't very explicit.
> > 
> > I can add a comment...
> 
> How about calling it clk_id_map ?
> 
> > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > +};
> > > > +
> > > >  struct clk_map {
> > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > 
> > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> 
> Possibly. I was about to recommend just using a single structure and
> leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> waste isn't very nice, especially if we end up with many entries :-(

Actually, you could even turns clk_map into

struct clk_map {
	const struct clk_id_map *map;
	struct clk_hw *hw;
};

It should consume the same amount of space on 64-bit platforms. Doing
the same in the MDLC driver would save space.

Or, if you want to save more memory, you could drop clk_map and store
the clk_hw in a separate array in r8a78000_cpg_priv, using the same
indices as clk_map_id.

struct r8a78000_cpg_priv {
	struct device *dev;

	const struct clk_id_map *map;
	unsigned int num_map_entries;
	struct clk_hw **clks;

	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
};

where clks is a dynamically-allocated array fo struct clk_hw pointers,
having the same size as the map array.

Too many options.

> > > > +     struct clk_hw *hw;
> > > >  };
> > 
> > > > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> > > >       return hw;
> > > >  }
> > > >
> > > > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > > > +static struct clk_hw **register_fixed_clks(struct device *dev)
> > > >  {
> > > > -     struct device *dev = priv->dev;
> > > > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > > > +     struct clk_hw **hws, *hw;
> > > >       unsigned long rate;
> > > > -     struct clk_hw *hw;
> > > >       const char *name;
> > > >
> > > > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > > > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > > > +     if (!hws)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     for (unsigned int i = 0; i < n; i++) {
> > > >               rate = fixed_clk_rates[i];
> > > >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> > > >               if (!name)
> > > > -                     return -ENOMEM;
> > > > +                     return ERR_PTR(-ENOMEM);
> > > >
> > > >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> > > >               if (IS_ERR(hw))
> > > > -                     return PTR_ERR(hw);
> > > > +                     return ERR_CAST(hw);
> > > >
> > > > -             priv->fixed_hws[i] = hw;
> > > > +             hws[i] = hw;
> > > >       }
> > > >
> > > > -     return 0;
> > > > +     return hws;
> > > > +}
> > > > +
> > > > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > > > +                                       const struct clk_map_in *map_in)
> > > > +{
> > > > +     struct device *dev = priv->dev;
> > > > +     struct clk_hw **fixed_hws;
> > > > +     struct clk_map *map;
> > > > +     unsigned int i;
> > > > +
> > > > +     fixed_hws = register_fixed_clks(dev);
> > > > +     if (IS_ERR(fixed_hws))
> > > > +             return ERR_CAST(fixed_hws);
> > > > +
> > > > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
> > >
> > > This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> > > instead of just the map.
> > 
> > True, and I did consider this.
> > The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
> > would quickly became a bigger burden due to the presence of many
> > more maps.  So for consistency, I kept it the same in both drivers.
> > An initialization macro might make it more manageable, though.
> 
> Something along the line of the following ?
> 
> struct clk_map_in_entry {
> 	int dt_id;		/* DT binding clock ID or -1 sentinel */
> 	u32 fw_id;		/* SCMI firmware clock ID or FIXED_CLK() ID */
> };
> 
> struct clk_map_in {
> 	const struct clk_map_in_entry *entries;
> 	unsigned int size;
> };
> 
> #define CPG_MAP_INIT(_entries) {	\
> 	.entries = _entries,		\
> 	.size = ARRAY_SIZE(_entries),	\
> }
> 
> struct cpg_data {
> 	const struct clk_map_in *default_map;
> 	const struct clk_map_in *fw_map;
> };
> 
> ...
> 
> static const struct clk_map_in_entries r8a78000_cpg_fw_entries[] = {
> 	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	1661 },
> 	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	1662 },
> 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	1663 },
> 	{ R8A78000_CPG_MSO_SCP_MAIN,		1459 },
> 	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
> };
> 
> static const clk_map_in r8a78000_cpg_fw = CPG_MAP_INIT(r8a78000_cpg_fw_entries);
> 
> static const struct cpg_data r8a78000_cpg_data = {
> 	.default_map = r8a78000_cpg_default,
> 	.fw_map = r8a78000_cpg_fw,
> };
> 
> > > > +
> > > > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > > > +     if (!map)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     for (i = 0; ; i++) {
> > > > +             map[i].dt_id = map_in[i].dt_id;
> > > > +             if (map[i].dt_id < 0)
> > > > +                     break;
> > > > +
> > > > +             map[i].fw_id = map_in[i].fw_id;
> > > > +             map[i].hw = fixed_hws[map[i].fw_id];
> > > > +     }
> > > > +
> > > > +     devm_kfree(dev, fixed_hws);
> > >
> > > Why not plain kcalloc/kfree ?
> > 
> > To avoid having to free it manually at multiple (three) locations,
> > both in the error paths and the success path?
> 
> Isn't __free() your friend ?
> 
> > >
> > > > +     return map;
> > > >  }

-- 
Regards,

Laurent Pinchart

