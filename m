Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF1F3381E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkcKCZYotbOsY6gWuui4XL63+crO9p5VFMgkclrb6P8=; b=SBfDQFk1F+VS8DlqUB8QD2yYe6
	M7ornsvsrrwtw102sow3dc50s0BN1NUNzsPY3/8VQ0gdzSbM84HyHO1nrdC0YqjHujdOi16isxgqp
	H7BkIlbyRx1VMqYm6/KKJf2DwPUJ6sQnTa9U5YJfbhFyfO3zCxScj0VtOKkdAP1sza+NNbGXgZHiU
	VXfVIBDFkKoNsEA3C8NZoKZsIcZyRS0fWK7Zn9DKS6AdABbZwyI2gUmHtF5v6p2WqmkfVrxBqgdaN
	hyZZzYfE6pKnmGNo/hcY5kgyjr2SXVbHeZPbr0BL2bsabLvB/OfELx/ryM4fZUxm2AqqHym6j508P
	jwahqJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPS-00000005noo-08oQ;
	Tue, 17 Mar 2026 09:08:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPN-00000005nki-1oIh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DkcKCZYotbOsY6gWuui4XL63+crO9p5VFMgkclrb6P8=; b=giPdXAff6pnhXdGf7+mo0UZZCg
	2fqX2YfPzqnji+wQPHC1wn/ACYUIf14qVKxgEbPZN/EpLdMI++wdBmQhTzJAESf5A+8MoB4seZyDu
	zA0HOw3/BVFldrUxRP75Q1xZqRXXFW9N8ocINzFoGMN9LDYOKXz/vH3T5mqSZPGt7AZdcCmP5zaU6
	JiMmNZkfzvrJvH4vkn+Z6CVR/RYvTluRa/ZeGM6M+WQ6/J/3vdF0ZlQe9NMXn+N5cjaX6v9jlrYyM
	h+3GJbFBz3D0l/0favVqndOcpVkIcvhZ+EGfoqcqEzJy68NCalMfC/rPnn0P2kw0v/4fPPfuNJiCr
	HE9Y1eYA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPJ-00000008UYj-3hxw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DkcKCZYotbOsY6gWuui4XL63+crO9p5VFMgkclrb6P8=; b=WeOCzI9HAmajHpVuCHa+Ibh0RM
	4hSCWuIjEGIyuivMpM1kf8J1TTHRCyWVyoQ+JHcoF/1LojBD2xbOqFr4PY2UpFr6PiCO9Vw3jFF9L
	PoTnkNjQWNlzgCmrR/a4DJhW1SVKaUOS2YJZi+/vI+pNK+/6WwlPnIjKXKvJ4k/vyHhj2yGCpdDI7
	DeTJyKv9UxD3xPAf2W6kTisNNVyzXYJQ7GNMn4708dWOuIw+CLWD8VjsJX8+zSU3R3S6J86FlkliZ
	77kDAAtzLopQb4oduXVcc3XiL1mklk4JgF17TZlO6x7xVhVcoZW2FL+2ngV88gObm+bsVKUaQrGfv
	vqzq1g4g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2QPG-0009Re-2Z;
	Tue, 17 Mar 2026 10:08:06 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2QPF-000PiB-38;
	Tue, 17 Mar 2026 10:08:06 +0100
Message-ID: <6e34ecefae8e2f187c5ecfdfd343fb717711c21d.camel@ew.tq-group.com>
Subject: Re: [PATCH v6 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>,  "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Tue, 17 Mar 2026 10:08:05 +0100
In-Reply-To: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
References: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_090810_085016_86426100 
X-CRM114-Status: GOOD (  18.00  )
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

On Mon, 2026-03-02 at 11:14 +0100, Nora Schiffer wrote:
> This adds Device Trees for our AM62x-based SoM TQMa62xx and its
> reference carrier board MBa62xx.
>=20
> Not yet included are overlays to enable LVDS display output and MIPI-CSI
> camera input.

Hi Nishanth,

do you have any further comments on these patches? Can we get the series in=
to
v7.1?

Best,
Nora




>=20
> Changed in v6:
> - Update author information following name change
> - Rebase onto latest ti-k3-dts-next
> - Disable incomplete panel node
> - Add various comments to explain why nodes are disabled
> - Extend comment explaining disabled 1400MHz OPP
> - Use consistent comment style for pinmux
>=20
> Changes in v5:
> - Rebase onto latest ti-k3-dts-next
>=20
> Changes in v4:
> - Rebase onto latest ti-k3-dts-next
> - Reorder boot phase tags after other standard DT properties
> - Add missing supply regulators in SPI-NOR flash and USB hub
> - Set status =3D "okay" in &cpsw3g, as it is disabled in k3-am62-main.dts=
i
>   now
> - Add disabled 1400MHz OPP entry (will be enabled by bootloader if
>   supported by PMIC configuration)
> - Update copyright years in new files
>=20
> Changes in v3:
> - Rebased onto ti-k3-dt-for-v6.18
> - 3 of the 5 patches in v2 have been applied already and are dropped
> - Include k3-am62-ti-ipc-firmware.dtsi, drop now redundant configuration
> - Change node name for MCU reserved memory to 'memory'
> - Use rgmii-id PHY mode
> - Drop now redundant ti,rx-internal-delay
> - Update simple-audio-card,name to match other TQ SOMs with compatible
>   configuration
> - Reference dss_pins in dss node (actual display support will be added
>   in a follow-up patch series)
> - Consistently use GPIO_ACTIVE_HIGH define
> - Drop unneeded usb0 quirk flags
> - Add boot phase tags
>=20
> Changes in v2:
> - Collected acks and reviews
> - Rebased onto v6.13-rc1
>=20
>=20
> Nora Schiffer (2):
>   dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
>     family and carrier board
>   arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
>     Device Trees
>=20
>  .../devicetree/bindings/arm/ti/k3.yaml        |    7 +
>  arch/arm64/boot/dts/ti/Makefile               |    1 +
>  .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 1034 +++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi |  360 ++++++
>  4 files changed, 1402 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

