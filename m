Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E4E77168
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obkeEZoGyRhCr1to17evuOANhy/aYFQv/I/nNlDwOLM=; b=q+FePEvBPFSZzrRG/tBJlhrR+2
	qWRPx1EebCp6UKkVQrVKEzczMXBRc4OJOZA8XI/TLG+yJu8PovPhouz5+G/IGLuQXoo4GIK1O0OYo
	Ua6jKXNr5LT2C4VgFclKAzjCqvqPP1WwXEAEs7AXt9uBp9M8UXsqJvLjRN4wGSheBII7isKjSAjpe
	v3iAMQJk8Cu1cXie00/xVCOcYdi+nEUvJWpQQ1DRYe9gxOulc6c8VQFh8TdIFZhKXe84PXQ15/9Xm
	ce9OYocgg5Wjpg8RMJTkZuOio2SVOzE0wyuz+7rSpA00MQFwxl0hjr5nJw7Pcq31rYnoIFNr7AUk3
	gGfhPnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbk2-0000000AxpL-23M5;
	Tue, 03 Dec 2024 22:51:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbj1-0000000Axek-1CDu;
	Tue, 03 Dec 2024 22:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C38C5C62A4;
	Tue,  3 Dec 2024 22:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FA6C4CEDC;
	Tue,  3 Dec 2024 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733266233;
	bh=xpMyFwhRCnmcEjI08hn/SUz/O7fqhnlbsjpYSWl1Yyk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UoF4aw4glikqFASKrgnnQeNUaYaK2nGi+qG3uJhjUbFSmdhPCSOFdMl4VNP0uGqmM
	 AeX4wnePyKZcjYaFJ8o493ncSfpEYtU/1zEfyhDdAl95+lHnSLhLlVJOUMGTbgjvWb
	 QBLcz6e1JlHzT0fvu9CqMMCqNcazkUOOSp1/ooSsCl4A7PJsK58ErCEcyDfpXEJzDi
	 00luS40McWXBhczuJ/a06nHx0BJgVkJCZpJCVdxm3awwX7a84iGD47CUmAuuSjfzZa
	 zK2As/Gl88QPG1lP/w3WMqeHqCG4VrWJGXcSMK9SNv24pHiysPTD9tVAHyJpgR+Ygf
	 ssofq1Ym2x4kg==
Message-ID: <e53adbf9fdf6e3f142083b0d40d074ca.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241128-monstrous-embargo-a665d921410d@wendy>
References: <20241002-private-unequal-33cfa6101338@spud> <20241002-hula-unwashed-1c4ddbadbec2@spud> <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org> <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com> <20241003-tacking-ladylike-dfe2b633e647@spud> <20241106-freefall-slider-db379b05821e@spud> <430bde3b35382e640843e32a9f351326.sboyd@kernel.org> <20241128-monstrous-embargo-a665d921410d@wendy>
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to common code
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 03 Dec 2024 14:50:31 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_145035_406039_27EF5225 
X-CRM114-Status: GOOD (  25.00  )
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

Quoting Conor Dooley (2024-11-28 02:36:16)
> On Thu, Nov 14, 2024 at 05:29:54PM -0800, Stephen Boyd wrote:
> > Quoting Conor Dooley (2024-11-06 04:56:25)
> > > My use case doesn't
> > > actually need the registration code changes either as, currently, onl=
y reg
> > > gets set at runtime, but leaving that out is a level of incomplete I'=
d not
> > > let myself away with.
> > > Obviously shoving the extra members into the clk structs has the down=
side
> > > of taking up a pointer and a offset worth of memory for each clock of
> > > that type registered, but it is substantially easier to support devic=
es
> > > with multiple regmaps that way. Probably moot though since the approa=
ch you
> > > suggested in the thread linked above that implements a clk_hw_get_reg=
map()
> > > has to store a pointer to the regmap's identifier which would take up=
 an
> > > identical amount of memory.
> >=20
> > We don't need to store the regmap identifier in the struct clk. We can
> > store it in the 'struct clk_init_data' with some new field, and only do
> > that when/if we actually need to. We would need to pass the init data to
> > the clk_ops::init() callback though. We currently knock that out during
> > registration so that clk_hw->init is NULL. Probably we can just set that
> > to NULL after the init routine runs in __clk_core_init().
> >=20
> > Long story short, don't add something to 'struct clk_core', 'struct
> > clk', or 'struct clk_hw' for these details. We can have a 'struct
> > clk_regmap_hw' that everyone else can build upon:
> >=20
> >   struct clk_regmap_hw {
> >         struct regmap *regmap;
> >         struct clk_hw hw;
> >   };
>=20
> What's the point of this? I don't understand why you want to do this over
> what clk_divider et al already do, where clk_hw and the iomem pointer
> are in the struct itself.

Can you give an example? I don't understand what you're suggesting. I
prefer a struct clk_regmap_hw like above so that the existing struct
clk_hw in the kernel aren't increased by a pointer. SoC drivers can use
the same struct as a replacement for their struct clk_hw member today.

