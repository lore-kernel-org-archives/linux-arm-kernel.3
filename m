Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/qmJ4Kk;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=2HPcvgDB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sq72/jE1QWYRdcK1hoiu7bRYxYUswJNBNRjBOWyiKL8=; b=g/qmJ4Kk4rn1EOYHUWodHwhLeE
	Mqw4pZPl5uMfOuQsEXHSSbPg9PbtM+2Ia7nEm9Zg3Q6lvwpPjTvZIVmR53BjbWQfg3tx1MKUeTuBn
	rPH+CLlGp0s89qM9WLrzCjNg0TvIdB6W+QrVPSnl45pBFCcGvLX1X1768BCw754xRqbeTxjQZxqop
	io7K3OiqCpnQrMLMCHjAsfOau+diowlpN9BOSJ1mwH/z9gZL0EN7qs/yolCj7GimK1DYJAFF3EsRi
	vzJR/9BNj8YjvrDoFhrLDKH9Ru8zmMcVaSeyGGvp0zIHvymHaaedLiTPDyACnvujEEZMcKxcpx9ij
	8yxYIaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYuZ-000000057LW-3W0B;
	Wed, 04 Nov 2026 11:12:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYuY-000000057L0-0W4f;
	Wed, 04 Nov 2026 11:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sq72/jE1QWYRdcK1hoiu7bRYxYUswJNBNRjBOWyiKL8=; b=2HPcvgDB89z9MCCbZPrKTjDdSe
	a2iOhzncH45XWbpf9h5Z8prpD2YftEz7/e5hwuvWn+QuCeuR+A985T/5nMETf+5nDv4C/OGiEYWiN
	yHNn/W7mCluK0Avj86ssbgeDhbC5MybjVA9WWWhZe6nnpnYsMAqhE8dncxIx4P5Sw9H0FPt3JwUjA
	V2dW8uAPnS6oH6s/atFbE1YQM3BrqEBVTBRoCa6Px+Gf2R9yjpHPLpIRsFY0/nmSSP+QIih6+Ebkj
	gVyTKzfad0lXgE4JzqsC3FtSmP5P7yTqCtINcMmCiSDl37j6H7J+F/DKy534XRIjzr18Rpw0TYvFZ
	34n1vy7Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v2 05/11] accel/rocket: request the core clocks by name
Date: Wed, 04 Nov 2026 12:11:52 +0100
Message-ID: <13701281.ZYm5mLc6kN@diego>
In-Reply-To: <20260922080114.44662-6-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-6-royalnet026@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_031210_188327_0BC0F3D4 
X-CRM114-Status: GOOD (  30.56  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 22. September 2026, 10:01:08 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
> rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
> setting the .id members. The rocket_core array is allocated with
> devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
> .rdev, .dev and .index, so all four clk_bulk_data entries are requested
> with a NULL con_id (unlike core->resets, whose ids are set a few lines
> above).
>=20
> clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
> of_parse_clkspec() only consults "clock-names" when a name was passed,
> so the index stays 0 for all four entries. Every entry therefore ends up
> holding a handle to the *first* clock of the DT "clocks" property, i.e.
> ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
> four different clocks.
>=20
> The consequence is that rocket_device_runtime_resume() prepares and
> enables the AXI clock four times, while hclk, pclk and - most
> importantly - the NPU compute clock ("npu", SCMI_CLK_NPU on RK3588) are
> never prepared or enabled by this driver at all. The NPU still works
> only because the Rockchip power-domain driver sets GENPD_FLAG_PM_CLK and
> its attach_dev() callback walks the device node with of_clk_get() and
> adds every clock to the pm_clk list, so genpd happens to keep the
> remaining clocks running. The bug is therefore latent today, but it
> means the driver holds no reference to the clock that actually feeds the
> NPU, which stands in the way of any future frequency scaling
> (OPP/devfreq) work.
>=20
> Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
> /sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
> handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other
> two cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
> "fdab0000.npu" consumer at all - their only consumers are the
> "npu@fdab0000" handles created by the power-domain driver via
> of_clk_get().
>=20
> Set the ids explicitly, in the order mandated by the binding
> (Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
> aclk, hclk, npu, pclk. After the change the driver holds one handle per
> distinct clock and clk_bulk_prepare_enable() covers all four.
>=20
> Note that this is a user-visible tightening for out-of-tree DTs: the
> old NULL-id requests resolved by index and succeeded no matter what
> "clock-names" contained, while the named requests fail probe with
> -ENOENT when one of the four names is missing. That is the right
> outcome for in-tree users - the binding requires exactly these four
> clock-names and rk3588-base.dtsi carries them on all three cores - but
> a DT that relied on the permissive lookup goes from silently running on
> the wrong clock handles to not probing at all, so record the change
> here where git log will find it.
>=20
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Assisted-by: LLM sparse checkpatch
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, N=
anoPC-T6 Plus
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
> Same diff and the same message text (his copy re-wraps the lines) as
> 01/14 of Jiaxing Hu's RK3576 series, which carries this patch as well;
> whichever lands first, the other drops it. The trailers differ: Jiaxing
> asked me to drop his Signed-off-by from my own posting of it, as he did
> not pass this copy along, and Assisted-by is added because an LLM helped
> with the checks on this v2.
>=20
>  drivers/accel/rocket/rocket_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index b3b2fa9ba645a..5dd260bacbff6 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to get resets for core %d\n", c=
ore->index);
> =20
> +	core->clks[0].id =3D "aclk";
> +	core->clks[1].id =3D "hclk";
> +	core->clks[2].id =3D "npu";
> +	core->clks[3].id =3D "pclk";

additionally, while reading the followup patches, please introduce some
constants for the indices. ROCKET_CLK_ACLK, ... or some other name.
Because when you access them later by index, that makes things harder
to read and follow (especially in the future)


Heiko



