Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZyWZUq5Z;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=dPmpj/Gh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oZCv3BLFiwyhWSLzcKkJNHbX0W0rZqJRdfbk2LsVS0A=; b=ZyWZUq5ZTa50EZynlKrphB/K/1
	/ghEHTDmaYm6QWXjmZXQh1JcETkQUnrKS7bo9wJzohxD2Zsxe3yk4qZxWHulE4wxAhIcyCUh0bBel
	vu3EW3n87Qh/i/8/gTvx/ASfJGShxqfzEQFTTnXcZwmQPSWDBkerw3WN+dJIKBULKsRlC7AxewDYG
	y5eQn/lWvCrqdTNiHF+175rQm5FPB235poFPZR2tsRm4e041KqUg4BYd0d2Ch56m/v5A2AZVCAEVL
	4sNUjY7kfrx/BDAXJ5Whhr9N4oQ0mHu8lXqznqi+9I1LcGbV0RcxGdhTakGCiZ6iEeR/gYFhVTGyy
	TpZqIBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONDM-00000003siP-45lh;
	Tue, 03 Nov 2026 22:42:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONDK-00000003shh-3osa;
	Tue, 03 Nov 2026 22:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oZCv3BLFiwyhWSLzcKkJNHbX0W0rZqJRdfbk2LsVS0A=; b=dPmpj/GhuifNakB/0LT3M8p6i6
	7sr/YzfhbS90hVlA/r3eJiIoF2WK0qoCLS3orNC+tgWMikIvDs+MHoz6drDRROpUZb+pmitlEsRZd
	PXwZgU4Qnyp2dK5DwFUYXEAePs/0TBfHX0BEbR0MuLi7wTDVjQBj5FqL5CrFHwQnoeK4O4goGXljp
	U1XSBbX+Y2xr7CU/Q7vTgeINEQPIG/ftwufX/zsYbhyn3HwZcRGwKacJRZU/2rZ2S9QxmJU7BHCrh
	rgiPxVoPS+I4jrjeIl+bvONYjNomvic+0VFURXNS4oJrn0vJ37MY1R+qGmZphUQZgMXGi7jZ+2tao
	Wuah6C3g==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v15 01/15] accel/rocket: request the core clocks by name
Date: Tue, 03 Nov 2026 23:42:19 +0100
Message-ID: <3188623.WAvfycf1tz@diego>
In-Reply-To: <20261101082307.151957-2-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-2-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_144246_974089_DAF86AE6 
X-CRM114-Status: GOOD (  21.13  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 09:22:53 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> From: Igor Paunovic <royalnet026@gmail.com>
>=20
> rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
> setting the .id members. The rocket_core array is allocated with
> devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
> .rdev, .dev and .index, so all four clk_bulk_data entries are requested
> with a NULL con_id (unlike core->resets, whose ids are set a few lines
> above).
>=20
> clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
> of_parse_clkspec() only consults "clock-names" when a name was passed, so
> the index stays 0 for all four entries. Every entry therefore ends up
> holding a handle to the *first* clock of the DT "clocks" property, i.e.
> ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
> four different clocks.
>=20
> The consequence is that rocket_device_runtime_resume() prepares and enabl=
es
> the AXI clock four times, while hclk, pclk and - most importantly - the N=
PU
> compute clock ("npu", SCMI_CLK_NPU on RK3588) are never prepared or enabl=
ed
> by this driver at all. The NPU still works only because the Rockchip
> power-domain driver sets GENPD_FLAG_PM_CLK and its attach_dev() callback
> walks the device node with of_clk_get() and adds every clock to the pm_clk
> list, so genpd happens to keep the remaining clocks running. The bug is
> therefore latent today, but it means the driver holds no reference to the
> clock that actually feeds the NPU, which stands in the way of any future
> frequency scaling (OPP/devfreq) work.
>=20
> Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
> /sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
> handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other t=
wo
> cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
> "fdab0000.npu" consumer at all - their only consumers are the
> "npu@fdab0000" handles created by the power-domain driver via of_clk_get(=
).
>=20
> Set the ids explicitly, in the order mandated by the binding
> (Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
> aclk, hclk, npu, pclk. After the change the driver holds one handle per
> distinct clock and clk_bulk_prepare_enable() covers all four.
>=20
> Note that this is a user-visible tightening for out-of-tree DTs: the old
> NULL-id requests resolved by index and succeeded no matter what
> "clock-names" contained, while the named requests fail probe with -ENOENT
> when one of the four names is missing. That is the right outcome for
> in-tree users - the binding requires exactly these four clock-names and
> rk3588-base.dtsi carries them on all three cores - but a DT that relied on
> the permissive lookup goes from silently running on the wrong clock handl=
es
> to not probing at all, so record the change here where git log will find
> it.
>=20
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, N=
anoPC-T6 Plus
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

nit: the commit description could be way shorter, for that small change.



