Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4571CC98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/sGmxMd6UsneQdSqKEcH269XBQNFtfv0Nz7iKB6c3U=; b=olSFkpvJK/8dllIGVaySq6We3Y
	YZHeWE5NjLPZt3ufzaKphAWdU2h59UwjaXXKipm3Y4J01cUMgH3jIZUV+C6fiQFTaMJbsWowuMZOs
	+43lkIhP8A5Lm9R+M7U4e8KOt5thunXYuxRtBQDtI5ZpWL0Kx4DFwwi+Pqrbk4NrtU76SoM6PDiih
	ag/fXagzVbbz1Sm0OmisgrtMFRGs1hc1jAd9+cE/FnKD0Bya20I2kvg29qIdSQtz+TaOL5SN1AYMh
	zFLF15EDX/Sj030r+uNlCGDFo/jcVA8HI+xFO2WqvG7O99+oUKUz69nWl7Zn3pdzN+/3Bnln3wpkg
	/joZLJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WP-0000000DWAP-1M0B;
	Fri, 25 Sep 2026 14:03:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WK-0000000DW7k-2aFy;
	Fri, 25 Sep 2026 14:03:27 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-01 (Coremail) with SMTP id qwCowAA3D_P+frZqWmXzCA--.32169S2;
	Fri, 25 Sep 2026 22:02:41 +0800 (CST)
Message-ID: <2a3e3ce8d62805394ef41a2e9f84a5051af30ac2.camel@iscas.ac.cn>
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Jerome Brunet <jbrunet@baylibre.com>, Michal Wilczynski	
 <m.wilczynski@samsung.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda	 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng	
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
 Stuebner <heiko@sntech.de>,  Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
 Belhachemi <db@domibel.de>,  Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>
Date: Fri, 25 Sep 2026 22:02:38 +0800
In-Reply-To: <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
	 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
	 <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3D_P+frZqWmXzCA--.32169S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW5WrW3Kr47uw4UtFWrZrb_yoW5Aw4rpr
	s7Ca4rJFs0qF48Za4xX3WYqFW5Aan2ya45tFn7ZF10vr45Ka1UWw1vkF9xWF97XrZ7Cw13
	Wr4v9F4fuF4DXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUnPl1DUUUUU==
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_070325_015215_B5D89EE9 
X-CRM114-Status: GOOD (  18.89  )
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

=E5=9C=A8 2026-09-25=E4=BA=94=E7=9A=84 14:47 +0200=EF=BC=8CJerome Brunet=E5=
=86=99=E9=81=93=EF=BC=9A
> On ven. 04 sept. 2026 at 15:27, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>=20
> > The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller,
> > and
> > the rate they carry is ultimately produced by the HDMI PHY, which
> > registers hdmitx0_pixelclk as a clock provider.
> >=20
> > Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> > reaches that parent, instead of being clamped to whatever rate the
> > parent already happens to run at.
> >=20
> > Co-developed-by: Dominique Belhachemi <db@domibel.de>
> > Signed-off-by: Dominique Belhachemi <db@domibel.de>
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> > =C2=A0drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> > b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> > index
> > bad20d5d794a72f071b4d547b7304786a8ba9afa..aeba42cd3c44ba205ced52b18
> > 26d2d2de82ad78f 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> > @@ -40,10 +40,12 @@ static const struct jh71x0_clk_data
> > jh7110_voutclk_data[] =3D {
> > =C2=A0	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0,
> > JH7110_VOUTCLK_VOUT_TOP_AXI),
> > =C2=A0	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0,
> > JH7110_VOUTCLK_VOUT_TOP_AXI),
> > =C2=A0	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0,
> > JH7110_VOUTCLK_VOUT_TOP_AHB),
> > -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0,
> > 2,
> > +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0",
> > +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT |
> > CLK_SET_RATE_NO_REPARENT, 2,
>=20
> I see that you've added CLK_SET_RATE_NO_REPARENT following a previous
> sashiko advice.

I think the problem is that the Innosilicon HDMI PHY is designed to be
solely the pixel clock provider when HDMI output is enabled, so manual
clock parent assginment is required when using HDMI to prevent the
general PLL from driving the pixel clock, and for DSI to prevent
abusing the HDMI PHY clock generator.

Thanks,
Icenowy

>=20
> Note that saying it will 'hijack' the parent without it is kind of
> strong. It is fine to let a mux reparent while setting a rate, as
> long
> as you understand the possible consequences for the rest of the tree.
>=20
> Regardless
>=20
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>=20
> > =C2=A0		=C2=A0=C2=A0=C2=A0 JH7110_VOUTCLK_DC8200_PIX,
> > =C2=A0		=C2=A0=C2=A0=C2=A0 JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> > -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0,
> > 2,
> > +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1",
> > +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT |
> > CLK_SET_RATE_NO_REPARENT, 2,
> > =C2=A0		=C2=A0=C2=A0=C2=A0 JH7110_VOUTCLK_DC8200_PIX,
> > =C2=A0		=C2=A0=C2=A0=C2=A0 JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> > =C2=A0	/* LCD */
> >=20
> > --=20
> > 2.34.1
> >=20


