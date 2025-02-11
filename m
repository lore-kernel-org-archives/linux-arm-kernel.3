Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A18FC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2HO1ToWfLOBrHdxLGmqitpQWzJ6khmroR/88qsX9BY=; b=UGmz2BMbSGgbtdIpbHDFOzXY5z
	xdYUM2k0ZJcFS0kuIDtQR2R4E1j1VkAtlPg4yH9M1b9RH/u8++aggD3i5z41n7tcZ8IGonWLXMEN+
	2Y8SV1sfd0Kut9z+vxRRw7co4WQJfoqvsVRoeyj18keNqW2HLX5gbgMnHFO7qRumAx2HbUPZvEieT
	1NFek7TXoEZ33VNz7NT+SgVFePoTeclxVbHEAqE2M9dtdLeCEYV1rSH2hAPi73Ck+2tQ5aNL8Wldr
	t1tGbp+mudDgbuJuahrSA/EJ6Rd3tvXebirEMB30xRYdNKEmCFSDmFnpjp20Zx0dlYJ82H5RNLG8T
	uUUo6YYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuUJ-00000004laf-0p2l;
	Tue, 11 Feb 2025 17:55:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtAF-00000004WNL-0uNZ;
	Tue, 11 Feb 2025 16:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 812065C4848;
	Tue, 11 Feb 2025 16:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D06C4CEDD;
	Tue, 11 Feb 2025 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291469;
	bh=oNhS/OBG05YZ+KCQ5QX2hfKKhn/P9r6dBgmu5lyTEck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG70fRgbr/NArbeLI4XwktHJ14RVRgAUMRyVVKt+VVJiehyoI0RrETiIRDzicTvhl
	 7HjgRml0wM+6lKDGa6BXOM7L8qIWhOAqfaVspzZ38BqQ1Qw0xb2ZpLtNFIK+am5ueC
	 6c2Wcuh35njecJWyK7aQ/EurXnODJK/rnDQqhNxZCHIHpv8/MV8FdigUeT8rWM/wnX
	 lQ2Jv2RtNT51wUtYvb/iCO8JcoVQt16Axa1JF4j8SP+N8uLsH/prWoBASkF5K976Ec
	 q5jF8l5dZbCoT9/kBQNjt3QyQ0zWviXDPHbN15b5cWVKkL78nVe6K1s2UgWufupyDP
	 ntm5IEEZzgMng==
Date: Tue, 11 Feb 2025 17:31:06 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v3 13/16] net: airoha: Introduce PPE
 initialization via NPU
Message-ID: <Z6t7SuFurbGwJjt_@lore-desk>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-13-dba60e755563@kernel.org>
 <20250211-fanatic-smoky-wren-f0dcc9@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g2jqDdovRQTl6Nrb"
Content-Disposition: inline
In-Reply-To: <20250211-fanatic-smoky-wren-f0dcc9@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083111_346964_84D1D4EF 
X-CRM114-Status: GOOD (  30.35  )
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


--g2jqDdovRQTl6Nrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, Feb 09, 2025 at 01:09:06PM +0100, Lorenzo Bianconi wrote:
> > +static irqreturn_t airoha_npu_wdt_handler(int irq, void *core_instance)
> > +{
> > +	struct airoha_npu_core *core =3D core_instance;
> > +	struct airoha_npu *npu =3D core->npu;
> > +	int c =3D core - &npu->cores[0];
> > +	u32 val;
> > +
> > +	airoha_npu_rmw(npu, REG_WDT_TIMER_CTRL(c), 0, WDT_INTR_MASK);
> > +	val =3D airoha_npu_rr(npu, REG_WDT_TIMER_CTRL(c));
> > +	if (FIELD_GET(WDT_EN_MASK, val))
> > +		schedule_work(&core->wdt_work);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +struct airoha_npu *airoha_npu_init(struct airoha_eth *eth)
> > +{
> > +	struct reserved_mem *rmem;
> > +	int i, irq, err =3D -ENODEV;
> > +	struct airoha_npu *npu;
> > +	struct device_node *np;
> > +
> > +	npu =3D devm_kzalloc(eth->dev, sizeof(*npu), GFP_KERNEL);
> > +	if (!npu)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	npu->np =3D of_parse_phandle(eth->dev->of_node, "airoha,npu", 0);
> > +	if (!npu->np)
> > +		return ERR_PTR(-ENODEV);
>=20
> Why? The property is not required, so how can missing property fail the
> probe?

similar to mtk_wed device, airoha_npu is not modeled as a standalone driver,
but it is part of the airoha_eth driver. If you think it is better, I can
rework it implementing a dedicated driver for it. What do you think?

>=20
> This is also still unnecessary ABI break without explanation/reasoning.

At the moment if airoha_npu_init() fails (e.g. if the npu node is not prese=
nt),
it will not cause any failure in airoha_hw_init() (so in the core ethernet
driver probing).

>=20
> > +
> > +	npu->pdev =3D of_find_device_by_node(npu->np);
> > +	if (!npu->pdev)
> > +		goto error_of_node_put;
>=20
> You should also add device link and probably try_module_get. See
> qcom,ice (patch for missing try_module_get is on the lists).

thx for the pointer, I will take a look to it.

>=20
> > +
> > +	get_device(&npu->pdev->dev);
>=20
> Why? of_find_device_by_node() does it.

ack, I will fix it.

>=20
> > +
> > +	npu->base =3D devm_platform_ioremap_resource(npu->pdev, 0);
> > +	if (IS_ERR(npu->base))
> > +		goto error_put_dev;
> > +
> > +	np =3D of_parse_phandle(npu->np, "memory-region", 0);
> > +	if (!np)
> > +		goto error_put_dev;
> > +
> > +	rmem =3D of_reserved_mem_lookup(np);
> > +	of_node_put(np);
> > +
> > +	if (!rmem)
> > +		goto error_put_dev;
> > +
> > +	irq =3D platform_get_irq(npu->pdev, 0);
> > +	if (irq < 0) {
> > +		err =3D irq;
> > +		goto error_put_dev;
> > +	}
> > +
> > +	err =3D devm_request_irq(&npu->pdev->dev, irq, airoha_npu_mbox_handle=
r,
> > +			       IRQF_SHARED, "airoha-npu-mbox", npu);
> > +	if (err)
> > +		goto error_put_dev;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++) {
> > +		struct airoha_npu_core *core =3D &npu->cores[i];
> > +
> > +		spin_lock_init(&core->lock);
> > +		core->npu =3D npu;
> > +
> > +		irq =3D platform_get_irq(npu->pdev, i + 1);
> > +		if (irq < 0) {
> > +			err =3D irq;
> > +			goto error_put_dev;
> > +		}
>=20
> This is all confusing. Why are you requesting IRQs for other - the npu -
> device? That device driver is responsible for its interrupts, not you
> here. This breaks encapsulation. And what do you do if the other device
> starts handling interrupts on its own? This is really unexpected to see
> here.

As pointed out above, there is no other driver for airoha_npu at the moment,
but I am fine to implement it.

Regards,
Lorenzo

>=20
> > +
> > +		err =3D devm_request_irq(&npu->pdev->dev, irq,
> > +				       airoha_npu_wdt_handler, IRQF_SHARED,
> > +				       "airoha-npu-wdt", core);
> > +		if (err)
> > +			goto error_put_dev;
> > +
> > +		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
> > +	}
> > +
> > +	if (dma_set_coherent_mask(&npu->pdev->dev, 0xbfffffff))
> > +		dev_err(&npu->pdev->dev,
> > +			"failed coherent DMA configuration\n");
> > +
> > +	err =3D airoha_npu_run_firmware(npu, rmem);
> > +	if (err)
> > +		goto error_put_dev;
> > +
> > +	airoha_npu_wr(npu, REG_CR_NPU_MIB(10),
> > +		      rmem->base + NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
> > +	airoha_npu_wr(npu, REG_CR_NPU_MIB(11), 0x40000); /* SRAM 256K */
> > +	airoha_npu_wr(npu, REG_CR_NPU_MIB(12), 0);
> > +	airoha_npu_wr(npu, REG_CR_NPU_MIB(21), 1);
> > +	msleep(100);
> > +
> > +	/* setting booting address */
> > +	for (i =3D 0; i < AIROHA_NPU_NUM_CORES; i++)
> > +		airoha_npu_wr(npu, REG_CR_BOOT_BASE(i), rmem->base);
> > +	usleep_range(1000, 2000);
> > +
> > +	/* enable NPU cores */
> > +	/* do not start core3 since it is used for WiFi offloading */
> > +	airoha_npu_wr(npu, REG_CR_BOOT_CONFIG, 0xf7);
> > +	airoha_npu_wr(npu, REG_CR_BOOT_TRIGGER, 0x1);
> > +	msleep(100);
> > +
> > +	return npu;
> > +
> > +error_put_dev:
> > +	put_device(&npu->pdev->dev);
>=20
> Missing platform_device_put()
>=20
> > +error_of_node_put:
> > +	of_node_put(npu->np);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +void airoha_npu_deinit(struct airoha_npu *npu)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++)
> > +		cancel_work_sync(&npu->cores[i].wdt_work);
> > +
>=20
> Leaking device put.
>=20
> > +	put_device(&npu->pdev->dev);
> > +	of_node_put(npu->np);
>=20
> Best regards,
> Krzysztof
>=20

--g2jqDdovRQTl6Nrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6t7SgAKCRA6cBh0uS2t
rGOSAP9ajQ5bBXTGIXJFOaDlhfq5P0lEKUu7Bq7as0Wrb/CiHwD+MjobPeqtgWPG
gTwY8bZNqtz2FbpzlvqWNUyz/50ToAo=
=svVA
-----END PGP SIGNATURE-----

--g2jqDdovRQTl6Nrb--

