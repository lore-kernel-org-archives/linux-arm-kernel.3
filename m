Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F76CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARDFzRcSX9tlNYnz3QhLpND0+k4nm4lAwCr2NId5MtI=; b=woNOZeJriJOdlRVrdPNjCM76SA
	RhsBJ+Dsrs/eK+L++BguD9G1U5pTwdX1lNfo4Ei3h7W+KGmS9ZRbVPNgCmUocU+0gu4KOjifbUgam
	h0jUNfoLwn3ihmS8O5Df7R1R/EjPcP3wvsXQmGSK1XJFSzaMBu9d/OnmEO7BIKsitmqbaWD4wbowX
	lS+5zb5tbW5q3MY8/T7aBt7+zF3NCYVL3nAovVSHxkv3NEZb8yG2rz4835e0gtXgyGToqWO7HOFrp
	fYkJgZccQr5L9jDoHUCN5wuGXEpMaFZ4k8PeYUVJQnuqH6l3ozf5LPGkg1d1XH+xdYOOEyeC4fmdK
	mu8gncyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHLp-0000000AjHr-2cjV;
	Mon, 12 Oct 2026 14:50:07 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHLm-0000000AjHM-2GMK;
	Mon, 12 Oct 2026 14:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791816584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dgXdmKngHhM318qjfVMYC74gMXGc+fVdLti7iaDwNAcMcB3a5zwQJOik7Wp4aFMi4tacvl3UURXkM4e7Oc26MTPZ+Z00w4QDK3KjHrV+wqi7dHrh/s8S/W27DQsrM+TIiWwaGxOcf66YwJl+ToXBCOGPIBvxUzzeez/ktRUtpbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ARDFzRcSX9tlNYnz3QhLpND0+k4nm4lAwCr2NId5MtI=; 
	b=b9u5Bca9K9oBoLiH5naAS8C3AXYHMV1+15EqYHygDl1zAOhsDmtwBUSG59FApnANcBkioBS7/4QZGZj519i5BBInp+Eh4NcRC0bV0IcIMNzgN8xOMNihrnH2t18yvvuMUJUyAYLaWrc5cNFsFiJ7bfa8+7ANkfSPPyi1uL8qe/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816584;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ARDFzRcSX9tlNYnz3QhLpND0+k4nm4lAwCr2NId5MtI=;
	b=T7Vc/dRGYaDXRQGVuvc+Y/eeiZjc1MZXWW4dkOriDDZ02Sw7GyWfNjW35slqbLh/
	A2JtRd4QzJhJVsPNv/CtTeV+L1EOzG/LoB9KlqZedk5xmEmidSfR+MaHT1lEV3xNliY
	31rcXmI4FFYUwcYwPrGTEHMMFQQMwFOmx6rrmjcOPS3NnJ55PnfuFXRVIMbUzkFtjYi
	LSq1TNSKSgtAZpTEk4d2+eFP0QLrwJuMY+SX4C8467MmHI0tkCaZmIug/eqp2uHm4oU
	karVUVAD+hUcefpumZT43yTtV8myiwOCm7nkvTHPzlI0fp8DijqnI5F5MrFUS56oKj+
	WiFC5qA8xA==
Received: by smtp.zohomail.com with SMTPS id 1791816582175167.0189182002764;
	Mon, 12 Oct 2026 07:49:42 -0700 (PDT)
Message-ID: <6b6b99fcd1c5f032a0b20d928bf7fa2e59ac5c87.camel@icenowy.me>
Subject: Re: [PATCH 0/2] Add SPI display support for UNIHIKER M10 V1.2
From: Icenowy Zheng <uwu@icenowy.me>
To: Miotsuki Mizuno <founder@crepuse.com>, "heiko@sntech.de"
 <heiko@sntech.de>,  "neil.armstrong@linaro.org"	 <neil.armstrong@linaro.org>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "conor+dt@kernel.org"	
 <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,  "dri-devel@lists.freedesktop.org"	
 <dri-devel@lists.freedesktop.org>, "jesszhan0024@gmail.com"	
 <jesszhan0024@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"	
 <linux-rockchip@lists.infradead.org>, "maarten.lankhorst@linux.intel.com"	
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>,  "noralf@tronnes.org"	 <noralf@tronnes.org>,
 "robh@kernel.org" <robh@kernel.org>, "simona@ffwll.ch"	 <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Date: Mon, 12 Oct 2026 22:49:34 +0800
In-Reply-To: <20261010232857.26950-1-founder@crepuse.com>
References: <20261010232857.26950-1-founder@crepuse.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_075002_663843_6759E835 
X-CRM114-Status: GOOD (  17.78  )
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

=E5=9C=A8 2026-10-10=E5=85=AD=E7=9A=84 23:28 +0000=EF=BC=8CMiotsuki Mizuno=
=E5=86=99=E9=81=93=EF=BC=9A
> Describe the onboard 240x320 RGB565 display with panel-mipi-dbi.
> The series adds the panel compatible and enables SPI2, GPIO reset/D-C
> and the PWM1 backlight. It uses the existing DRM and SPI drivers.
>=20
> This series is based on the separate board I2C2 preparation commit.
> The prerequisite board patch was submitted separately:
> https://lore.kernel.org/r/20261010232831.26908-1-founder@crepuse.com
> It does not depend on the pending NS2009 driver or binding.

I just came across here via mailing list.

It seems that NS2009 is designed to be mostly compatible with TI
TSC2007, and the TSC2007 driver should be able to made work with
minimal effort.

Thanks,
Icenowy

>=20
> The 132-byte initialization firmware is available from:
> https://github.com/mio-tsuki/panel-mipi-dbi-firmware/releases/tag/v1.0.0
> Required filename: dfrobot,unihiker-m10-display.bin
> SHA256:
> 50412ae6d29c5bbfb7fac585528a761fb249d7944011a1b19c5e0f80a0418e5f
> The test kernel embeds it with CONFIG_EXTRA_FIRMWARE. Public release
> does not imply linux-firmware acceptance.
>=20
> The nominal active area is 43.2 x 57.6 mm, represented as 43 x 58 mm.
> The published V1.3 schematic is not used as evidence for V1.2 supply
> connections; optional power/io supply properties are omitted.
>=20
> SPI2 input is assigned 100 MHz. Active transfer register readback
> showed BAUDR=3D2, corresponding to 50 MHz. No oscilloscope measurement
> is claimed. GPIO_ACTIVE_HIGH reset matches the existing DRM helper
> and leaves the physical reset pin HIGH after initialization.
>=20
> Built against Rockchip v7.4-armsoc/dts64, commit
> ae965b9856f033145e292b0c29082a26bcc45efd. Target DTS/schema, binding
> examples and strict checkpatch checks passed.=20
> The exact display DTS booted through normal U-Boot three times in
> this
> retest with the original test kernel, without pstore instrumentation,
> clk_ignore_unused or regulator_ignore_unused. Physical corner
> patterns
> were confirmed; full and partial updates and five DRM disable/enable
> cycles completed. The exact display/touch combination also booted and
> its physical output was confirmed.
>=20
> Earlier boots reset during early userspace; one partial USB log
> recorded
> an instruction abort. This was not reproduced in the latest retest.
> The resets may have resulted from accidental contact with a loose
> jumper wire during reboot. The cause has not been established, and no
> software fix is claimed.
> Exact-DTS cold boot and deep suspend/resume have not been tested.
>=20
> Mizuno Miotsuki (2):
> =C2=A0 dt-bindings: display: panel-mipi-dbi-spi: Add UNIHIKER M10 display
> =C2=A0 arm64: dts: rockchip: Enable display on UNIHIKER M10 V1.2
>=20
> =C2=A0.../display/panel/panel-mipi-dbi-spi.yaml=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0.../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 53
> +++++++++++++++++++
> =C2=A02 files changed, 54 insertions(+)
>=20
>=20
> base-commit: f4f7ecd2e0e8debcbab4789717cc79d570d665e3

