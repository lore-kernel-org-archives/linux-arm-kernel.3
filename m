Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9808C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a0XeLVwc+8gt4CWlvRNYzlpZgVZAhYK/YrFTGewRVg=; b=Lr7VCAABo0sPYM/1s9UZedK6TW
	nIgLo9pgedUVcPB0JE2ONU10KIdDJAy6zmCfAQcw/Dn9DuNdwzbwN6mpdqSrQeOrj2ngRc2Mz80sb
	QCPf19VkNzZMkPPXU442tjXi886J3LkEH0twHBo9ux8S9ye6CT0lukOSy6z7Wr9vONpZ3+9/SaMPh
	owMZvkeUIQayn/pXz20ojson8QDCm53tmFbR1hljlZ9dHQJKDengqn+s31HIgTSJt234PPyQawoGI
	0A/u+0J9462Cg4j7wPbdk+lPcmGVAQ5lPguCD0gYc8+03m15PFl7ayrOof2WjmBhI6MVRotxbbm4p
	wGUQ9x7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th67X-0000000EnPn-1xet;
	Sun, 09 Feb 2025 12:09:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th668-0000000EnCU-3pDl;
	Sun, 09 Feb 2025 12:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9A25A40254;
	Sun,  9 Feb 2025 12:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A959EC4CEDD;
	Sun,  9 Feb 2025 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102859;
	bh=mrQhDEUAy9bpBI7w32R9V55ZsjnRFLW0WmEVeb+BEVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXUPYhJyPMN1QBehL4R85/FZdnTscVQylL76tGS8317rddXUB6kVfhb5XXWT3F177
	 b3bY0TxIHpsXwOcXH8d21UsAXu0b1aZvSmAmf8ShGFeP7heWKT+6lgM5lXnC8sjJ/3
	 rSeqzs27+UwRuD+rquEAZYoHUL/7HYD+9cLz4RQ4xF+y9ECohD85N9dHujBUdLNuxE
	 fnTYniz8UIfIq03ex1/fPHXV2gL6U99/DO/ZiuR2PKuvcjEeDFE64xJ8s1D9YTGzKz
	 HYu9E8djCwJU9y1k9FClbDV2EXzjp+vYjBgVV2LUclmfbhIiAmbIqfS3/sRy/WtVs6
	 zk0GfTbI6BTuA==
Date: Sun, 9 Feb 2025 13:07:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH net-next v2 00/15] Introduce flowtable hw offloading in
 airoha_eth driver
Message-ID: <Z6iaiHVft8B-mAb4@lore-desk>
References: <20250207-airoha-en7581-flowtable-offload-v2-0-3a2239692a67@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jJ2SWV1szSy2UBu3"
Content-Disposition: inline
In-Reply-To: <20250207-airoha-en7581-flowtable-offload-v2-0-3a2239692a67@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040741_077471_8B4BCDE6 
X-CRM114-Status: GOOD (  19.13  )
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


--jJ2SWV1szSy2UBu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce netfilter flowtable integration in airoha_eth driver to
> offload 5-tuple flower rules learned by the PPE module if the user
> accelerates them using a nft configuration similar to the one reported
> below:
>=20
> table inet filter {
> 	flowtable ft {
> 		hook ingress priority filter
> 		devices =3D { lan1, lan2, lan3, lan4, eth1 }
> 		flags offload;
> 	}
> 	chain forward {
> 		type filter hook forward priority filter; policy accept;
> 		meta l4proto { tcp, udp } flow add @ft
> 	}
> }
>=20
> Packet Processor Engine (PPE) module available on EN7581 SoC populates
> the PPE table with 5-tuples flower rules learned from traffic forwarded
> between the GDM ports connected to the Packet Switch Engine (PSE) module.
> airoha_eth driver configures and collects data from the PPE module via a
> Network Processor Unit (NPU) RISC-V module available on the EN7581 SoC.
> Move airoha_eth driver in a dedicated folder
> (drivers/net/ethernet/airoha).

Please ignore this series, I spotted a couple of issues. I will post v3 soo=
n.

Regards,
Lorenzo

>=20
> ---
> Changes in v2:
> - Add airoha-npu document binding
> - Enable Rx SPTAG on MT7530 dsa switch for EN7581 SoC.
> - Fix warnings in airoha_npu_run_firmware()
> - Fix sparse warnings
> - Link to v1: https://lore.kernel.org/r/20250205-airoha-en7581-flowtable-=
offload-v1-0-d362cfa97b01@kernel.org
>=20
> ---
> Lorenzo Bianconi (15):
>       net: airoha: Move airoha_eth driver in a dedicated folder
>       net: airoha: Move definitions in airoha_eth.h
>       net: airoha: Move reg/write utility routines in airoha_eth.h
>       net: airoha: Move register definitions in airoha_regs.h
>       net: airoha: Move DSA tag in DMA descriptor
>       net: dsa: mt7530: Enable Rx sptag for EN7581 SoC
>       net: airoha: Enable support for multiple net_devices
>       net: airoha: Move REG_GDM_FWD_CFG() initialization in airoha_dev_in=
it()
>       net: airoha: Rename airoha_set_gdm_port_fwd_cfg() in airoha_set_vip=
_for_gdm_port()
>       dt-bindings: arm: airoha: Add the NPU node for EN7581 SoC
>       dt-bindings: net: airoha: Add airoha,npu phandle property
>       net: airoha: Introduce PPE initialization via NPU
>       net: airoha: Introduce flowtable offload support
>       net: airoha: Add loopback support for GDM2
>       net: airoha: Introduce PPE debugfs support
>=20
>  .../devicetree/bindings/arm/airoha,en7581-npu.yaml |   71 ++
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml |   10 +
>  drivers/net/dsa/mt7530.c                           |    5 +
>  drivers/net/dsa/mt7530.h                           |    4 +
>  drivers/net/ethernet/Kconfig                       |    2 +
>  drivers/net/ethernet/Makefile                      |    1 +
>  drivers/net/ethernet/airoha/Kconfig                |   23 +
>  drivers/net/ethernet/airoha/Makefile               |    9 +
>  .../net/ethernet/{mediatek =3D> airoha}/airoha_eth.c | 1261 +++++-------=
--------
>  drivers/net/ethernet/airoha/airoha_eth.h           |  626 ++++++++++
>  drivers/net/ethernet/airoha/airoha_npu.c           |  501 ++++++++
>  drivers/net/ethernet/airoha/airoha_ppe.c           |  823 +++++++++++++
>  drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |  175 +++
>  drivers/net/ethernet/airoha/airoha_regs.h          |  793 ++++++++++++
>  drivers/net/ethernet/mediatek/Kconfig              |    8 -
>  drivers/net/ethernet/mediatek/Makefile             |    1 -
>  16 files changed, 3310 insertions(+), 1003 deletions(-)
> ---
> base-commit: 26db4dbb747813b5946aff31485873f071a10332
> change-id: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--jJ2SWV1szSy2UBu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6iaiAAKCRA6cBh0uS2t
rN4LAQDAr1GunH8bnfpjyai7bUPg8oqhBHj/K2KEpB2QdnUciAD/QS/hHVoQ1hGf
SDi+CTuc9POv4dc6J0FYmcxb9/Vu5AA=
=wIQ6
-----END PGP SIGNATURE-----

--jJ2SWV1szSy2UBu3--

