Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B512DC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gN0/bd6Sn1EIvPdiEhBeq7f490IM4mcVZo4ID9nNfo=; b=IwIh07aOKnz9CyiA12LDFYTgY3
	UaoZJ9rMwvXzdWC8imPItvmhiIerlAK/d4yF0bO6mqHxgFyeok2BT+xG4EMi7SYtBySm5gkr8oZdR
	d3xMP7kT0Zspe/uwI2NhyxUK0FxrqhLQhP0FzM4uX9ctuC9qejl9dC576CE7w/DV4JCF8kzAwsuf7
	Oe7+E1d/GN3Qw0jyuEfoXwjxQW8Q8sfC8EAGGRbLaqI3bQqDltGhzCzaqZrKGueiz02wnDIDoeXjD
	t7R3hLFG6PoKAmC2hkqixEjPfoVOD/X2Y68G0T6MnhY2VKpQ5L907RGNBDSxCbROit53NfJ3N3+Yw
	m6K+7z0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3lA-00000007oEN-2dZS;
	Tue, 10 Jun 2025 18:31:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0p7-00000007IEm-474z;
	Tue, 10 Jun 2025 15:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AE4C629FC;
	Tue, 10 Jun 2025 15:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBF9C4CEED;
	Tue, 10 Jun 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569017;
	bh=GdC3hbu2lBWJrq1c5FNhywQS8uf44LJI+yaHMwNtUZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTpMfumv//WkKeU1pjfa4/ARYTp4er7sYZcbWH7Qgd06JSTvoaaIHYhvfyV+OsRxe
	 KlD8ovmvs9jUneKVjEbQDT47TlVjrD+OWWBAXgl/QLAhgxu8jpyrQgIYSNb/AYIfVo
	 j9kLNX5UZ4TTUVtAn9cBmjIK4UTTWyT6FbUjk7eodk0Hmks8lKuGonOfGsOotLGu9J
	 4Ch1Rc44Zy/t9sG0UhEZ5Sjqoc9R33EQ5+n9c0p6RuhlUZ+jylbx/+TgiM5Xv33iPO
	 WhT/r9Ntl0xzsZVZUR2PCoYdHhCLAdkUAFJZlAflyHLada9PrrTsc7zQNzdTumIozf
	 1fPqbyu51psrQ==
Date: Tue, 10 Jun 2025 16:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt bindings: PCI: brcmstb: Include cable-modem SoCs
Message-ID: <20250610-satin-wages-2ae29a2a3520@spud>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
 <20250609221710.10315-2-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZDyAQUps/4oIxyh6"
Content-Disposition: inline
In-Reply-To: <20250609221710.10315-2-james.quinlan@broadcom.com>
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


--ZDyAQUps/4oIxyh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 06:17:04PM -0400, Jim Quinlan wrote:
> Add four Broadcom Cable Modem SoCs to the compatibility list.

In your commit messages, you should mention why these devices are not
capable of using fallbacks.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/D=
ocumentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index c4f9674e8695..5a7b0ed9464d 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -15,6 +15,9 @@ properties:
>        - enum:
>            - brcm,bcm2711-pcie # The Raspberry Pi 4
>            - brcm,bcm2712-pcie # Raspberry Pi 5
> +          - brcm,bcm3162-pcie # Broadcom DOCSIS 4.0 CMTS w/ 64b ARM
> +          - brcm,bcm3390-pcie # Broadcom DOCSIS 3.1 CM w/ 32b ARM
> +          - brcm,bcm3392-pcie # Broadcom DOCSIS 3.1 CM w/ 64b ARM
>            - brcm,bcm4908-pcie
>            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
>            - brcm,bcm7216-pcie # Broadcom 7216 Arm
> @@ -23,6 +26,7 @@ properties:
>            - brcm,bcm7435-pcie # Broadcom 7435 MIPs
>            - brcm,bcm7445-pcie # Broadcom 7445 Arm
>            - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
> +          - brcm,bcm33940-pcie # Broadcom DOCSIS 4.0 CM w/ 64b ARM
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.43.0
>=20

--ZDyAQUps/4oIxyh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhN8wAKCRB4tDGHoIJi
0tmAAQDHXwi683jRmX1Bx3NVDFjzYk9W0gkH+7s8QG2OnV8LrAEA133Af6pObKAg
bs044xuxHkN8aohFLG72Xi6Q3IdYyQ0=
=Bkpe
-----END PGP SIGNATURE-----

--ZDyAQUps/4oIxyh6--

