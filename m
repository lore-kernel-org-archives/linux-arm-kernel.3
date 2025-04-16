Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0461AC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYysYNvW4xBxYtJ0cZW+I2zSbUdKX2VX8ZfL34ovqXc=; b=WzxciEYe2zmpDjKIeVuijDnd3S
	dcy/MuXLsYwv10weLVwHv+VwTzzAIehPkSnyczzj997oO00wAXo8gSSGhXF3USK1jZlCXJUYBBSC3
	pr27hW6H9HU7ewAv6YkuBhp01NvyuL1TaYSiJCh0VYOwWE7ljUTaGy1kMYgvpma53Mkj7pXmbDCa/
	LAG0zsduuV8XgVWOlSzEuVvCcb2+Sey536i0v0ACvuA3siVZqD/Cswsa5VY6TLPkD0Dgi1qjhSH5r
	st+Z/IOUVLROp5BdTNmVQ1D6CQTyVY5I15cdATIjVCzdTGhIaRRPWPQ/mVhaewj5E5fqBGBeP1aJw
	e/7O1FTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xcV-00000008i49-3MYt;
	Wed, 16 Apr 2025 07:55:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xae-00000008hhO-28c3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:53:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E469E439D0;
	Wed, 16 Apr 2025 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744790025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYysYNvW4xBxYtJ0cZW+I2zSbUdKX2VX8ZfL34ovqXc=;
	b=HkmqumojpybMw5iScleZTo43oCUbS92VaWrzAmfEvsj+uYced/Qv7NBvTiCIGOmNeZa7ZH
	nMr8MozrHCV8aSIKGpBMj9dxtv2ajO9zKReqI5Pge/wOFEiof0Z+qudA+PxfM7FMwRS9Vk
	2+akg2dmvQVh+u1eV13iiP6sOwGFr1GHRJ0hx5zVLT01zomHdobZBnKoaPj7rn4EODwl26
	2wfwiWrjJ04G5yC5vJAYsmz8JGgBBObThGVuPraeIAPxKtAfKsgyF3aDEMRKMQ5qpfx4hu
	XAPLdcx3TFyQrmSVdu5n+oEtCTdNypX/dSnSsH75wgRQ8QAxycimtR/T85LxqQ==
Date: Wed, 16 Apr 2025 09:53:43 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/5] net: stmmac: socfpga: fix init ordering
 and cleanups
Message-ID: <20250416095343.1820272f@fedora.home>
In-Reply-To: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiveeghefgkeegtdelvdelueeileehgeeiffdtuefhledvudefleehgeetveegnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_005349_164759_0BDEC9B4 
X-CRM114-Status: GOOD (  28.45  )
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

Hello Russell,

On Tue, 15 Apr 2025 17:29:28 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi,
>=20
> This series fixes the init ordering of the socfpga probe function.
> The standard rule is to do all setup before publishing any device,
> and socfpga violates that. I can see no reason for this, but these
> patches have not been tested on hardware.
>=20
> Address this by moving the initialisation of dwmac->stmmac_rst
> along with all the other dwmac initialisers - there's no reason
> for this to be late as plat_dat->stmmac_rst has already been
> populated.
>=20
> Next, replace the call to ops->set_phy_mode() with an init function
> socfpga_dwmac_init() which will then be linked in to plat_dat->init.
>=20
> Then, add this to plat_dat->init, and switch to stmmac_pltfr_pm_ops
> from the private ops. The runtime suspend/resume socfpga implementations
> are identical to the platform ones, but misses the noirq versions
> which this will add.
>=20
> Next, swap the order of socfpga_dwmac_init() and stmmac_dvr_probe().

I've given this a try and unfortunately :

[    1.005290] 8<--- cut here ---
[    1.008378] Unable to handle kernel paging request at virtual address 00=
003c40 when read
[    1.016449] [00003c40] *pgd=3D00000000
[    1.020057] Internal error: Oops: 5 [#1] SMP ARM
[    1.024668] Modules linked in:
[    1.027726] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-=
00379-g4552d2fc04f5-dirty #304 PREEMPT=20
[    1.037790] Hardware name: Altera SOCFPGA
[    1.041790] PC is at socfpga_gen5_set_phy_mode+0x44/0x338
[    1.047189] LR is at stmmac_pltfr_probe+0x24/0x6c
[    1.051893] pc : [<c010b82c>]    lr : [<c0611680>]    psr: a0000013
[    1.058142] sp : f0831d58  ip : 00000001  fp : 00000000
[    1.063353] r10: c0b4a508  r9 : 00000000  r8 : c093a170
[    1.068563] r7 : 00000060  r6 : c1880c00  r5 : c191a040  r4 : c203e9c0
[    1.075071] r3 : 00003000  r2 : 00000119  r1 : c0939ed0  r0 : c0a45f70
[    1.081579] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    1.088697] Control: 10c5387d  Table: 0000404a  DAC: 00000051
[    1.094424] Register r0 information: non-slab/vmalloc memory
[    1.100075] Register r1 information: non-slab/vmalloc memory
[    1.105723] Register r2 information: non-paged memory
[    1.110765] Register r3 information: non-paged memory
[    1.115807] Register r4 information: slab kmalloc-128 start c203e980 poi=
nter offset 64 size 128
[    1.124508] Register r5 information: slab kmalloc-1k start c191a000 poin=
ter offset 64 size 1024
[    1.133207] Register r6 information: slab kmalloc-512 start c1880c00 poi=
nter offset 0 size 512
[    1.141816] Register r7 information: non-paged memory
[    1.146858] Register r8 information: non-slab/vmalloc memory
[    1.152506] Register r9 information: NULL pointer
[    1.157202] Register r10 information: non-slab/vmalloc memory
[    1.162937] Register r11 information: NULL pointer
[    1.167719] Register r12 information: non-paged memory
[    1.172848] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
[    1.178840] Stack: (0xf0831d58 to 0xf0832000)
[    1.183192] 1d40:                                                       =
c0508cfc c050a250
[    1.191348] 1d60: c203e9c0 fb79b606 c18f6010 00000000 c191a040 f0831db0 =
c18f6000 c093a170
[    1.199504] 1d80: c203e9c0 c0611680 00000000 c18f6000 c18f6010 c191a040 =
c093a170 c0611918
[    1.207658] 1da0: 00000000 c18f6000 c18f6010 c061309c f0960000 00000000 =
00000000 0000001e
[    1.215811] 1dc0: fffffffa 0000001e fffffffa 00000000 00000000 00000000 =
00000000 00000000
[    1.223963] 1de0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.232117] 1e00: 00000000 00000000 00000000 00000000 00000000 fb79b606 =
c18f6010 00000000
[    1.240270] 1e20: c18f6010 c173b5b4 00000000 c203a1b8 c0b3f858 c0551410 =
c18f6010 00000000
[    1.248425] 1e40: c173b5b4 c054ed84 c18f6010 c173b5b4 c18f6010 00000000 =
c203a1b8 c054f008
[    1.256580] 1e60: 60000013 c0b3f858 c176b75c c173b5b4 c18f6010 00000000 =
c203a1b8 c054f1e8
[    1.264733] 1e80: c18f6010 c173b5b4 c18f6054 c1833600 c203a1b8 c054f3cc =
00000000 c173b5b4
[    1.272888] 1ea0: c054f33c c054cdc0 c174b000 c1833658 c19b9f34 fb79b606 =
c1833600 c173b5b4
[    1.281041] 1ec0: c203a180 00000000 c1833600 c054e164 c0a46214 00000006 =
c173b5b4 c18b3600
[    1.289193] 1ee0: 00000006 00000000 c174b000 c05500c8 c0b25bd4 c18b3600 =
00000006 c010d244
[    1.297346] 1f00: c19a8bc6 c19a8bcc 00000000 00000000 000000e4 c19a8bcc =
c19a8be3 c014a2a0
[    1.305499] 1f20: c0aa4490 c0a46d70 00000000 00000000 00000006 00000006 =
00000064 c19a8bcc
[    1.313653] 1f40: c19a8bd1 fb79b606 c0b4a064 fb79b606 00000064 c19a8b80 =
00000064 00000006
[    1.321806] 1f60: c0b3f834 c0a62760 c0b3f858 c0b01340 00000006 00000006 =
00000000 c0b004d0
[    1.329958] 1f80: c1703e40 c08c3d08 00000000 00000000 00000000 00000000 =
00000000 c08c3d24
[    1.338113] 1fa0: 00000000 c08c3d08 00000000 c010014c 00000000 00000000 =
00000000 00000000
[    1.346266] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    1.354420] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
00000000 00000000
[    1.362568] Call trace:=20
[    1.362581]  socfpga_gen5_set_phy_mode from stmmac_pltfr_probe+0x24/0x6c
[    1.371804]  stmmac_pltfr_probe from devm_stmmac_pltfr_probe+0xc/0x78
[    1.378243]  devm_stmmac_pltfr_probe from socfpga_dwmac_probe+0x144/0x19c
[    1.385027]  socfpga_dwmac_probe from platform_probe+0x5c/0xb0
[    1.390868]  platform_probe from really_probe+0xb8/0x2b4
[    1.396184]  really_probe from __driver_probe_device+0x88/0x1a0
[    1.402100]  __driver_probe_device from driver_probe_device+0x30/0xc0
[    1.408536]  driver_probe_device from __driver_attach+0x90/0x13c
[    1.414539]  __driver_attach from bus_for_each_dev+0x70/0xc0
[    1.420194]  bus_for_each_dev from bus_add_driver+0xcc/0x1ec
[    1.425848]  bus_add_driver from driver_register+0x7c/0x114
[    1.431418]  driver_register from do_one_initcall+0x44/0x270
[    1.437080]  do_one_initcall from kernel_init_freeable+0x208/0x260
[    1.443258]  kernel_init_freeable from kernel_init+0x1c/0x12c
[    1.449000]  kernel_init from ret_from_fork+0x14/0x28

=46rom what I see the issue is :

socfpga_dwmac_init()
  socfpga_gen5_set_phy_mode()
    socfpga_get_plat_phymode() {
      struct net_device *ndev =3D dev_get_drvdata(dwmac->dev);
      [...]
    }

At that moment, the netdev doesn't exist yet as the ->init() is called
before the netdev is created.

This is only to get the phymode, maybe we should do like dwmac_imx
and store a pointer to plat_dat into struct dwmac_socfpga, so that we
can get it back in dwmac_init ? I've tried with the patch below and it
does solve the issue, but maybe you have a better approach.

Maxime

---

=46rom 4cad86cec2023030ae86126b436e4b08b9b99212 Mon Sep 17 00:00:00 2001
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Wed, 16 Apr 2025 09:49:50 +0200
Subject: [PATCH] net: stmmac: socfpga: Don't grab plat_data from netdev_priv
 in init path

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 8e6d780669b9..b866054808d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -43,7 +43,7 @@
=20
 struct socfpga_dwmac;
 struct socfpga_dwmac_ops {
-	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
+	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv, int phymode);
 };
=20
 struct socfpga_dwmac {
@@ -59,6 +59,7 @@ struct socfpga_dwmac {
 	bool f2h_ptp_ref_clk;
 	const struct socfpga_dwmac_ops *ops;
 	struct mdio_device *pcs_mdiodev;
+	struct plat_stmmacenet_data *plat_dat;
 };
=20
 static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned in=
t mode)
@@ -269,10 +270,9 @@ static int socfpga_set_phy_mode_common(int phymode, u3=
2 *val)
 	return 0;
 }
=20
-static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
+static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac, int phym=
ode)
 {
 	struct regmap *sys_mgr_base_addr =3D dwmac->sys_mgr_base_addr;
-	int phymode =3D socfpga_get_plat_phymode(dwmac);
 	u32 reg_offset =3D dwmac->reg_offset;
 	u32 reg_shift =3D dwmac->reg_shift;
 	u32 ctrl, val, module;
@@ -327,10 +327,9 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dw=
mac *dwmac)
 	return 0;
 }
=20
-static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
+static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac, int phy=
mode)
 {
 	struct regmap *sys_mgr_base_addr =3D dwmac->sys_mgr_base_addr;
-	int phymode =3D socfpga_get_plat_phymode(dwmac);
 	u32 reg_offset =3D dwmac->reg_offset;
 	u32 reg_shift =3D dwmac->reg_shift;
 	u32 ctrl, val, module;
@@ -438,8 +437,9 @@ static struct phylink_pcs *socfpga_dwmac_select_pcs(str=
uct stmmac_priv *priv,
 static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
 {
 	struct socfpga_dwmac *dwmac =3D bsp_priv;
+	struct plat_stmmacenet_data *plat_dat =3D dwmac->plat_dat;
=20
-	return dwmac->ops->set_phy_mode(dwmac);
+	return dwmac->ops->set_phy_mode(dwmac, plat_dat->mac_interface);
 }
=20
 static int socfpga_dwmac_probe(struct platform_device *pdev)
@@ -490,6 +490,7 @@ static int socfpga_dwmac_probe(struct platform_device *=
pdev)
 	 */
 	dwmac->stmmac_rst =3D plat_dat->stmmac_rst;
 	dwmac->ops =3D ops;
+	dwmac->plat_dat =3D plat_dat;
=20
 	plat_dat->bsp_priv =3D dwmac;
 	plat_dat->fix_mac_speed =3D socfpga_dwmac_fix_mac_speed;
--=20
2.49.0

