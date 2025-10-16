Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110E6CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7b9xvQJvn+z4iQPtGIceLHSQFuSSr5cVrsso6sCoFc=; b=sdUati2Rk6BpqXvRtS/JFC65WZ
	JdmlwothFYQH90h2mCtaNhSdb3PwEak+aEJ5F28bq7tISgtisTjGzJFpvqJSzn4F88povFl75Uyg1
	cfnl9WB2ArDrE4KswzTnlzr4SU+F9SsNLRLGd18XDlj21/lhI+nEGkOCsG7lYXwYsgnb097aA2Okt
	XuooIZSZkxOmdDT0rX9wl0Y5rouDHDXu6y83/8NZRCMZuzKtqw9Z62AOgpIBhaPbFMg4O67fO+ciH
	cZZURcu5CBKz9x9DS9ccyQh1bZkfrlVRG5zwXcDt9vaCBna8olOMYcxw+XNVnjZ3wgIAl82JFSqzj
	FMJ0pDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PuW-00000005C09-0s68;
	Thu, 16 Oct 2025 15:29:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PuU-00000005BzW-1r0e;
	Thu, 16 Oct 2025 15:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC66A6401E;
	Thu, 16 Oct 2025 15:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06B8C4CEF1;
	Thu, 16 Oct 2025 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760628537;
	bh=I7b9xvQJvn+z4iQPtGIceLHSQFuSSr5cVrsso6sCoFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALpMVbPjjZ7Jz7UCmo6R+Dkwa3Vhis6i3heFLOQbe2U6RH+FkxJ1EufLHcPy0e5Qd
	 W2vXueItqFTsdPnmvv5Z0wepsXRpYHjFC1+mzt9+Z2zP2L+o54HzLOeM7kuE3HkJbw
	 sem59TFWEHReDfHLxnzrww9mrRKyBWVWsli8LIeUMQezfhYArj4hQeYE6KJ28LYWhb
	 IVrE9ozACc48Z3gEzDve2IrcosHk6btmX5GgG78Vk1iz7umIQXjIgHKc8PPLaf6OIk
	 cnM0Bx5EyKpjOmqkr8hXdIkX8XOzHk9+rRfBAHs+Lp+mpy7kBXs9Qku7p87DX2Pyxg
	 yYZjCq5G581hw==
Date: Thu, 16 Oct 2025 16:28:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 05/15] dt-bindings: pci: mediatek-pcie-gen3: Add MT7981
 PCIe compatible
Message-ID: <20251016-alright-faceless-d108b4404f18@spud>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-5-de259719b6f2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7sD/UBKvAzBhEk0V"
Content-Disposition: inline
In-Reply-To: <20251016-openwrt-one-network-v1-5-de259719b6f2@collabora.com>
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


--7sD/UBKvAzBhEk0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7sD/UBKvAzBhEk0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEPMQAKCRB4tDGHoIJi
0irWAP922D9ouq+yqqXAkNPlJfn+p96a/IZunktRHa3vfn1+hQEAvfRsy3Kv/Eya
nlym3bc2N0JsAhT6vmFgMrTqkn2B6A4=
=FZjQ
-----END PGP SIGNATURE-----

--7sD/UBKvAzBhEk0V--

