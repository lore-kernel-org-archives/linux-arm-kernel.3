Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F822CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMK/a6cWnmvDlye2LBu5j5oGE2wSUys+6jVH5716V10=; b=Pmu589T/7RDIaAE7s8qgZ+W2/B
	38vv/fNCMG6ibz4+GvVTNg8UEeIIpfm5dNDqepZqnZ1Luydwmz48AyN5HcvkBvWXxVCxyXi2eShKx
	RlizsC3MDg+42s31MDwP6SIEV/PeOGxFd5mgExTUayKOJf60jfgctC2gVniLsM63u7MJzmbdRR0RG
	U+N/qtouN5JNYu3LNmYgjZRMcg4cnqqL/RNWMnHbdqO6/o+3Sj+rS755dU73DAxkv9N6ETT9LzLgn
	3tMFI+tu45tq5Q9BzwlZ8zsoqgSnNm6SDFQ1a27VoIMbK0ZLHGHVjPkBu0oLXlVVz6w3NZizrCuz7
	1zV9h4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg6z-0000000GCkf-0Wzz;
	Mon, 05 Oct 2026 10:40:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg6x-0000000GCkB-3xB1;
	Mon, 05 Oct 2026 10:40:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32EDC60A86;
	Mon,  5 Oct 2026 10:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710861F00893;
	Mon,  5 Oct 2026 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196798;
	bh=nMK/a6cWnmvDlye2LBu5j5oGE2wSUys+6jVH5716V10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKuSy4G0Mnv9EWI5RFrLWNfQpP55o5UjiR6eXzW0p3HIBnTQA77MkfxfahjlLm+Tw
	 Y30HMkEAMQpbTnDrLrYyE87XglxHbjT7zEGWZsDLDYuzeX23zyadDlR2OumCEvhqkC
	 Bp+U81p5OGw+hK3jlGLdOrQ6frStfbM7zGAA539h0DKLyVEn9UtpMjUJbGDnGfBZMV
	 uPuAermznBjYpKdkzCopmYhX6B1Xt7ryCR+XS+XzJzFL2CSm0/ebe4LEIh4O81v634
	 mHlj6YiA5rRKlRlhfvUQ0iOi2CdY41/fO8qhn9eLS28gNm2XsPYLHnierVaQwM++d3
	 +JYL699chO7ow==
Date: Mon, 5 Oct 2026 11:39:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: net: amlogic,meson-dwmac: spell out
 the compatible combinations
Message-ID: <asN-d_p6RUFfVHdE@squawk>
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-2-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ATxczT9S6yADiUYP"
Content-Disposition: inline
In-Reply-To: <20261004144046.391444-2-tanure@linux.com>
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

--ATxczT9S6yADiUYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ATxczT9S6yADiUYP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasN+dwAKCRB4tDGHoIJi
0kGKAPkBwMPVmHK5gi5+GGmq50tiKHRI64sQpVCtLBiim0uKvwEA+im/zIRf96O+
sVDm/6scRn1Ei8lICBXZw/R/5hf23A4=
=Ico9
-----END PGP SIGNATURE-----

--ATxczT9S6yADiUYP--

