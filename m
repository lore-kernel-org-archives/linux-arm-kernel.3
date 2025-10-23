Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F360ACCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=; b=ysZEpWGSEjbWN8YDsP/E+9xmbC
	yXIE0oAkReIJyu0yaX9GOqY54+dyYJESsk2X6iamg0vtgytyXzvKnWOtSCo0xtRkjur1WfTlDAMcY
	7Vubn5QibDjVbUPFcboySW/JBxN2yJRqwABlv4mnS+1yiamMQLovheLbeJJujqI3rVD6RnFD1VYrl
	lT1hPC/RPrTw3aZpmcTwQakFWFgItt4gI5gd4MRDY7OCfP7RvzRTrj65400oa3UelvT2VJ8ql/7tl
	TW6cBQ44pXTGs8Qod13JxtqJjl+OUBmVsxLEiYYRzW7Ie6NXZ8tXR0K0/VaP8OGzb5hbrK5Ju3h9v
	qujOMZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PH-00000007Hxt-4883;
	Thu, 23 Oct 2025 18:51:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PG-00000007Hwk-0xLB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=; b=p+K5PKEJwkAkdZAdOdC1TUSc7O
	nAqDso2KymWX6RV8BQq8hv4AfnsNP3zZ3OpAHF11y7OUjCwfqTh4K/b1IufRT/ietadbGsAjm/3PC
	ytAX1FxUL8w7Gdeom54g2Zs1nP+/YZVDLGhwoy0bRx+1bssW7M/eDjKY4VduI0QzMqnfzJu3lzlOt
	Yf7qth6OVNisD+uupEdlqqO1WAE+HbbwXG+s4IhLTGmgYt44Pg+4KcXRjEbcjrsnGT2pRnTRiAFDw
	cUX+SCYbfG9FUsLt2cuEMSSZdc/cCYBBgEiAnQgich83XISlGOg+9Oj7RM+qdrdlKpbZ61GIdzEGd
	lzMTEnww==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzXY-00000001d34-1SXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE60E4AE28;
	Thu, 23 Oct 2025 18:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DBAC4CEE7;
	Thu, 23 Oct 2025 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245480;
	bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unAoiFqnIfbe471o7fJlWt0tAhvCj1MoRL5WGN0y+nI2rEaYyl92d3lqSkOBPLkJx
	 E4v2EsiffVLRvDCUEm+PuXMOmN1Smby4jg9/3GF86ibNDRSwTDQ1TtgTFSBmJXFBNj
	 BgCZ425F7QZN3aXLjcR6zgHXO1Po3s6/D/i0sXb0JZBX9RIL1PNaSHt0BEg9u9Mskd
	 /rvqTOF/RDjTM0YEFtro72z1H4VVp5EMcJuwFMxsSs+zlVzqNm2zp+HHrczfMBNL1S
	 Zs7wmGYy8OhMe+l1QE5dybFJYUhqwvZt8YX6z+GqiDxJUoBUD61Lq3O4cLO9qr0ZhK
	 CwTBrW9V5bKFg==
Date: Thu, 23 Oct 2025 19:51:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put-ps'
Message-ID: <20251023-gab-applause-77043d499529@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-5-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0BViuTcQBVHwGVl"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185556_674305_FDCC5EEB 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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


--T0BViuTcQBVHwGVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:52PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T0BViuTcQBVHwGVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5IwAKCRB4tDGHoIJi
0pkRAQCj7Ijye/ExnUsIE49cWonr9m6YS7a4wxdPBucoJ2MlggD/cPri8HMwGWK7
GGWHxrCWdfLHkTbJxCga1sVo8V4lJgU=
=q/g5
-----END PGP SIGNATURE-----

--T0BViuTcQBVHwGVl--

