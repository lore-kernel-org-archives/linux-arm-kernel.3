Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE217CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CocstRRSzAohJcoaTSBgtYSwdX5wTjwztL33/hiTn8=; b=qtwqvJ9eJ7wiS/dLdSzy97OUTU
	dhyur3YGmc0OCluB8zSG/17L/SoeWz1KjaER1xeCw0TZkYbeBtS9TFeKluBYH6vujZIQNSB1IlUj4
	zKsyPXTtF5mcZEqRzwUT8KTKWrudf4tAUv7SaWNwYWg9Q/JEco42blgH+p1xWmCrrb+j1p+XEq6dY
	DFqZqQz5px+IUoBv6XXmL56+qaHGwBo0ETQsukvC0s5ZRIHHhmlqQ7PZqtinwQZN6XZHjc2BGGOaa
	uoLDFMV8y5JTa/SITqIuRZWPMbQXw6036xjwzd77FCfKqktdAAKi4tBjPKmSg3RwWBPR30DSDeMzm
	TLkjhBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjCQ-00000005jzz-419E;
	Wed, 03 Sep 2025 08:50:39 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiHN-00000005H65-30ue
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:51:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21AB9443C6;
	Wed,  3 Sep 2025 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1756885897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CocstRRSzAohJcoaTSBgtYSwdX5wTjwztL33/hiTn8=;
	b=Yb+FWuiZlCkgr2nRaszUaQz4ELaVNBGTsxOosPE6Q6tYRI2SXHtayquSFRCfbiBJUrFHLq
	tNZFqqRZ8jmTNiI45G2qnZGjzKLjr6QVWOyIjW3yg5kip6htopHu2w+YZIpmKfYhLTarKZ
	6e8bdKV5SKGu8EbftKNbuPw+yKbrHYR4KJCuPm08jPQpIKCOWCY0F/Fm8bHKxkdFBZyln+
	juU/jrxerJxET4fr7aRgfOZ4woEULhwE3jH96u7HJGQaeZn7qJhcyU9C+YuKwEVmpQblNS
	lvO96WpzRTURd+mAWHaSgRFK8NptcEBOCOAgMSqapLxrqUeYV+xYPQ1rMhCV9Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6217165.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrthhthhgvfidrghgvrhhlrggthhesrghlthgvrhgrrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_005142_407795_623056FC 
X-CRM114-Status: GOOD (  16.09  )
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

--nextPart6217165.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tuesday, 2 September 2025 17:40:53 CEST Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml index
> d9a8d586e260..16dd7a2631ab 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -30,6 +30,15 @@ properties:
>        - const: renesas,rzn1-gmac
>        - const: snps,dwmac
> 
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +
>    pcs-handle:
>      description:
>        phandle pointing to a PCS sub-node compatible with


LGTM.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart6217165.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmi3834ACgkQKCYAIARz
eA7RNg//V4dk6mgmH97uD+XYikoAmRYpNxcP1tF4TPEBmM8inft958wcps+BK+oj
rBOtT+EpaiI13HpLUFzOX6TSgY6L0DacsWoAJAbFJr7OuS/MuJjignny1UCNEm9R
ZFFCzMr0E3AlyPQ8WxgksOvop/ZzRKIodKsUMq4u0v6Y7inbV+UVJre1egV+ReDf
YSGjgS4HibKWrUbZCF4HjD8qglzueQ35C6eCpcDBU2+4mTBnVKwH32ZEg2ehJ+Cd
ohKKI9Jtg13/QqWZZsccjzdMNaOqMtRyhs9qFrHk9+ddgoGtD2ANJ2Ka56OQwvb0
Y02hNnji+IPla0tiioZf9ARG/yfV/zH02o4JAEXAbMXpv7ZPRa9ektGDDImYPahL
i7+NyCgDSOA0R6b0m0bToaZyIFf/VWPkoo8Z8AmrgiQo2d6flhfd5ce71GuIPQfC
WfhDHjQYDmB0wonkXg/HcSOc1R2WL/nf33jEVvr2q8lvikohEbYQHi848DEhZX4N
4LcIzz28RC/hiDRhKBhxkHGHjYoBcTsNjeD3Xk0IIqr2bEenInwNPnhFuSzlo1Zc
u616y3AZbqeu0tQHPDeMtBGP4/omxeVR7WalyXS5WdhrOJDsQdWJm5jmoodDCAeQ
1Zogcm8As8XDF5BZ91YvI/W5ojzJ/5gIJ8UcJZxheHO5i4bppU0=
=22P1
-----END PGP SIGNATURE-----

--nextPart6217165.DvuYhMxLoT--




