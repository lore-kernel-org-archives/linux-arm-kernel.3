Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfIml/GWxEsZm0NpaVbjbKNfBZtmD00u78N6+zE2OWk=; b=scnsOLvB+DoYnFA0imBiKz791V
	B4GFhUNeLAjxhMUW6MRt/y7Y8PPwHCVkuHqJ9f92CN6sd1PCL/dQAQm5ke9AHqMTuTvDH0aIemyH9
	bRPX+SYlAIotGNBUmBOEEObv3ptC242Sh5FrSslordHjKjhq40FFHV5sS+e8agakyCe/O5SBbNibF
	LCjEZlaMwdOsB0mfNtyK7ALy8XcGtepOwBYt0NszffUllkv989sATUQ8tw6h2IW65wdrhAGXTz5Tq
	abGirtuaLR4qURV9zOQS3DAOL8ZyJU5Cdd20PLpzmNe7WpDDBlxxm7u/vLbSZ0iEbsOUd26th85+X
	bD23t88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOP4-000000064Bv-3Sjp;
	Mon, 13 Jan 2025 17:39:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXONr-000000063tT-1uFo;
	Mon, 13 Jan 2025 17:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nfIml/GWxEsZm0NpaVbjbKNfBZtmD00u78N6+zE2OWk=; b=lUQo3GShJsI3XG0RttPTE+3duR
	j8aZhW/Rldn6/mTwZwsUbCKLnQShsexG5IBa4fPPz7fYX6aLCN46uUVGSndvKzMFUNLm4WCj5maph
	fqUmlQfL3wlJk/r2Hr7Pudu2cwx2ycFLhWQKc+YqTc6L45cxJjy86Zgw2faR+Q/7iAsS7mMZbrSDK
	PVJr7hDPKFxzNDdLYf+jeivZoPlV6HFEZGJXIwFlQqzSMc8Ue9V7cePsUhrXRlNNZfSHTZTeavIq3
	hULWSB2Wjmbn7gV/N2VCgu6wrQGZS954bHiiGp4ItkXIkWbOutS9fxBKt+b1bEotisWZyeFL2A5EW
	Kirwnzmg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXONo-0000000AKJL-1R28;
	Mon, 13 Jan 2025 17:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA004A41272;
	Mon, 13 Jan 2025 17:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DABC4CEEE;
	Mon, 13 Jan 2025 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736789864;
	bh=nfIml/GWxEsZm0NpaVbjbKNfBZtmD00u78N6+zE2OWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FumxbJgQ71kYmQkug7xA2BOvkp9Uq19JqUckCrQngg8pIz7gfiQ8tHxNC8jN3Mmsa
	 03YDC69Plg4fxc21wEzIkGOWPT9cSOmYc5HSxafS/s15bBKOa5VR8U7YKaNVl2ZSMI
	 PNKK/fmoEO9pq1X4RHTD4aIeZW/8HN5rP7WQjnTN+d1ABvEu05PHkykdWUtqYlVfm4
	 Qe3R/n40ETrlSw6bj5zcJNBE1vQrPzmP+R/yiepJiKa/LZ9VMIoNmkm6EiTEzB+uTT
	 aN2RIq2XsmBRCoqxIAogTmLncrnSUuX4GuFigGNj77gFzbJ3MZoOKaUuDgYwakmax9
	 eMakHZ9M5EXYQ==
Date: Mon, 13 Jan 2025 17:37:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <20250113-aftermost-whole-18401dc54137@spud>
References: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z1X8w3KbdPQChHSz"
Content-Disposition: inline
In-Reply-To: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_173748_704861_2C4228CE 
X-CRM114-Status: GOOD (  28.90  )
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


--z1X8w3KbdPQChHSz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 01:55:05AM +0100, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
>=20
> ---
> Dear ARM, RISCV, DT maintainers, I'd like to ask your opinion on the
> below patch, which I plan as a base for ARM64 BSP for dual-arch (RISCV or
> ARM64) Cvitek SoC SG2000. The main motivation for ARM64 support is the
> ARCH support in the upstream gcc, which is not that mature for RISCV.
>=20
> I believe it's the first time we already have quite some base in the
> tree for a SoC, so it would be advantageous to re-use it and not
> duplicate the same SoC structures in two places, especially having
> in mind that Cvitek/Sophgo are still working on upstreaming and by
> far not all HW blocks are populated in the SoC DTs. They focus primarely
> on RISCV, so ARM64 would be dragging behind in this case if it would be
> forked.
>=20
> On the other hand, including SoC dtsi from RISCV into ARM64 poses
> some technical challenges by itself, obviously CPU cores have to be
> deleted, same is true for interrupt controller. And the interrupt
> numbers are of course difference for ARM GIC, so they have to be
> overwritten.
>=20
> Alternatively I can split existing .dtsi included below into their
> RISCV-specific and generic parts, so that both ARM64 and RISCV would
> include generic part and their corresponding ARCH-specific parts
> bringing CPU cores + interrupt controller + IRQ numbers for each and
> every device separately.
>=20
> The below example isactually booting (being included into board-level
> DT), so it's a real example I'd be ready to submit if there will be
> no objections of the cross-ARCH include approach in general.
>=20
> What are your thoughts?
>=20
> =A0arch/arm64/boot/dts/sophgo/sg2000.dtsi | 164 +++++++++++++++++++++++++
> =A01 file changed, 164 insertions(+)
> =A0create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts=
/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..96afd342bde5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "../../../../riscv/boot/dts/sophgo/cv18xx.dtsi"
> +#include "../../../../riscv/boot/dts/sophgo/cv181x.dtsi"

FWIW, this can just be #include <riscv/sophgo/<whatever>, /should/ be a
symlink for that, as there is for arm64. At the very least, I did see a
patch adding that link in the past. Check out what the RZ/Five is doing
(that's the riscv renesas chip) for an example of how this already has
been done - I think it's doing what your "Alternatively I can..."
paragraph describes.

--z1X8w3KbdPQChHSz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VPYwAKCRB4tDGHoIJi
0tPdAP92+UcHJCss0o1ICZL++iZWw/z31s3IyurwEC7rC33EMQEA4xiVuLT7bFTc
b7Xyw1nOCCorNKX2WrA3s8zMRWo1LA4=
=34ET
-----END PGP SIGNATURE-----

--z1X8w3KbdPQChHSz--

