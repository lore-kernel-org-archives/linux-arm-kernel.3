Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D652C3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u/9AHjxuF+fL9JbBpUA4QHUKtPHQadXuBIe95ASyiM=; b=MMrcLQyLctI67Bk35IhdEoMVIM
	46WkEzV2wL4zPcoL3Mo8BnTx5/fdfvSIh9+xLddzWp5EIUKGeQHgyrTD1s8FwHcBcWLi0RwH7Z8HL
	UHCfH4YJGZIBIUWpqOne/a5CiRE5TZXaNaUEglGtu+K977dMN3gaLb77Rg7yTCtZlp0V7zs/nXNaB
	U5eFn99CSHUXQCSl07fmxqo22mJroetkjmMe2k8G+V6Op0hPoy85SeeVSsVCOIuRDWMckOFMjTtIR
	4J3gAWPj4W0otBXHb5IVYRsVzF6i7ynZrV0SgTody8G9REPC+eJl40npErPLxQYJ0rFjl1uDk6qKd
	8CAZFYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU89-00000004jRx-3Ikr;
	Fri, 09 May 2025 20:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPbf-000000044gU-0FbA;
	Fri, 09 May 2025 15:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1u/9AHjxuF+fL9JbBpUA4QHUKtPHQadXuBIe95ASyiM=; b=H1Ac4YzDwwc7Rsy+4pi8/x0KMf
	yRqkpwb7gEdn6AK8X+AmvI/ZhYSFD6Rn6g/IuKNLQ0Ammv59VKJC0nye4kvXGmjNtW3BScLZTnUIU
	7REiAD8fGLsy0ro34s1P6uEVq4I6zGlg1FPcoCFYBwQ3O5uCHZHHBFManD12Jg5mxUko6OOqUz8Sf
	Q8SNty50gZ/9rhiCGsKvoobzpxfspmypfSQqJah6qAYH5FW8hUUTumz6NVZSSZ7YP5H2a4HeFGOki
	WEuCRZnKMPOBJvJtgKaHfWuxAv7SslJUKL3rsXootV4oXXitOH3WmWtfgYmKlpI4M97qKP+5i13W+
	YtLZgdfg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDPbb-0000000GIvH-21Fg;
	Fri, 09 May 2025 15:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1u/9AHjxuF+fL9JbBpUA4QHUKtPHQadXuBIe95ASyiM=; b=QQOy5EUQ6mrW4Y7NTOI6eWoBZW
	IUrjR9PqGw7X/GJFgcjIYFP+xX1rG8LtZShgCsq93xF9eB00VSxzrgdvhPda2/s2MWlMvuSDKikGE
	8x+zH4WWBdkCzISTDGavK0qJ3ENnpFeGvd8I4HTz7Qm8Ln5Y++0gn509TNNHWtTlu3KKAcRNqnb93
	5GkFDOl0oFfMhBtUkPBye/n2CF+i/ICZ0VG6TrfsXWz08NFiDZqs3lFiv0/9iMRLAbPsWiuMgG3/h
	DMTaXJDguzHf6J2cgwiY0uU0rfDoyovICZLN0iRQu0YaLfxRx0oMedCjjfjAhlxLIRTO006rKRwTa
	byJNEomA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDPba-0007vv-RI; Fri, 09 May 2025 17:25:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Add RADXA ROCK 5T support
Date: Fri, 09 May 2025 17:25:41 +0200
Message-ID: <116456515.nniJfEyVGO@diego>
In-Reply-To: <174679985488.3369444.8126092781297328766.robh@kernel.org>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
 <174679985488.3369444.8126092781297328766.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_162543_686716_A69E3DE4 
X-CRM114-Status: GOOD (  25.59  )
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

Am Freitag, 9. Mai 2025, 16:17:07 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Rob Herring (Arm):
>=20
> On Fri, 09 May 2025 14:31:40 +0200, Nicolas Frattaroli wrote:
> > This is a small series, depending on Sebastian Reichel's ROCK 5B+
> > series[1], to also add support for the ROCK 5T.
> >=20
> > The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
> > share as much DT boilerplate between them as we can, this series
> > reorganises things a bit and then adds the ROCK 5T .dts.
> >=20
> > Link: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstr=
eam-v2-0-677033cc1ac2@kernel.org/T/ [1]
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> > Nicolas Frattaroli (3):
> >       dt-bindings: arm: rockchip: add RADXA ROCK 5T
> >       arm64: dts: rockchip: reorganise common rock5* nodes
> >       arm64: dts: rockchip: add ROCK 5T device tree
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
> >  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
> >  .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 1012 ++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1012 +-----------=
=2D-------
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  105 ++
> >  5 files changed, 1131 insertions(+), 1004 deletions(-)
> > ---
> > base-commit: 19c541fe872387798a25df947f56a26212aa9a97
> > change-id: 20250509-add-rock5t-fde5927de36b
> > prerequisite-message-id: <20250508-rock5bp-for-upstream-v2-0-677033cc1a=
c2@kernel.org>
> > prerequisite-patch-id: 02bf159533bb53d2cb1b6c8c7caf1d3fcfbfa4ea
> > prerequisite-patch-id: fc153d1d48f19d63520086a6eaadfec2db960470
> > prerequisite-patch-id: f445b893edf31ccf3311e146a53e5d24861c2475
> > prerequisite-patch-id: 5dc410a438ad5a7aa8962e380d2733782f5d7d18
> > prerequisite-patch-id: c70ae0e30be2a3385d2f2a09f474ff2b76293843
> >=20
> > Best regards,
> > --
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 19c541fe872387798a25df947f56a26212aa9a=
97
>  Deps: looking for dependencies matching 5 patch-ids
>  Deps: Applying prerequisite patch: [PATCH v2 1/5] arm64: dts: rockchip: =
move rock 5b to include file
>  Deps: Applying prerequisite patch: [PATCH v2 2/5] arm64: dts: rockchip: =
move rock 5b to include file
>  Deps: Applying prerequisite patch: [PATCH v2 3/5] dt-bindings: arm: rock=
chip: Add Radxa ROCK 5B+
>  Deps: Applying prerequisite patch: [PATCH v2 4/5] arm64: dts: rockchip: =
add Rock 5B+
>  Deps: Applying prerequisite patch: [PATCH v2 5/5] arm64: dts: rockchip: =
add USB-C support for ROCK 5B+
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250509-add-rock5t-v1-0-cff1de74eced@collabora.com:
>=20
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockc=
hip,rk3588-edp): clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip=
,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,r=
k3588-edp): clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip=
,analogix-dp.yaml#

=46ixed that in
https://lore.kernel.org/all/20250509152329.2004073-1-heiko@sntech.de/

(edp0 node was correct, edp1 node contained a clock named spdif, that
probably came from the vendor-tree)






