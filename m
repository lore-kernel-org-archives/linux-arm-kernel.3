Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F532C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC4dFXUpiK7zo3TrhWTdwBiKShgDT9biBtzPE0SQoS0=; b=vli8Dh+M00WtAj9SO+GfnspJqe
	Auvs8jWbdPupwwgKN2aKvoX2+YMRlAtVmhdTfERNgJbkQAEHT/hKGONobdRDN2Q2cUyBiCGxaFqB9
	JCbi0TapcT6BTFbcEeEj3cJEn3n2n44UxOrEPeIG9zhNsagda/NpktJEve/x69rr1lBuXYsH1w7jl
	ZhSdr73/5HW8dES0WnXBgYiMNgy0BpE3qQi2TmmDOCVefVWyj6KGkGQhd+3WX0wCLLQ4vKk6A4jrJ
	+NNEOxTO9bR4h0M77NyWSmzXy/jZhMfGk3QHJWMIUVp+AYNZ+CzJyPUk3Rp8ONtpuhYJfd27pfqH8
	RPbluMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBK-00000003CCz-1str;
	Thu, 09 Jul 2026 18:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBJ-00000003CCf-1Qo0;
	Thu, 09 Jul 2026 18:09:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E187E43A0B;
	Thu,  9 Jul 2026 18:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080291F000E9;
	Thu,  9 Jul 2026 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620544;
	bh=RC4dFXUpiK7zo3TrhWTdwBiKShgDT9biBtzPE0SQoS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1ctp/7uUgVHK4GnPdbF3/RieOXaOo1Zr1igsC3U6kzQmvjKIKE2UnyVfmvxp10+H
	 SneULOk8gyZSZWiRixeVCLjxHEWD9zV/fxW2OAvRlORrnOYVaybPS9BIWNqpfpH4kS
	 R++6auaejUqPx5rgnb4oTf70S76Qc+pcEfi4EZ3+oTJkV9fA1qEJtM1P5QPLSB9pHn
	 BcCOSBm1zp7tPgr5Psmi4K/C0bqAQTy4NDGOKo1oLuh3eGPr1n70w5iZyHqxNzvndQ
	 KjuaAcHpvP8LAb8OP2LrIIxGDsWInBpjTT8aGMcFkb4LXjvqkCqtnla3nJ6QxDRxMq
	 DXBH+/EISyGuA==
Date: Thu, 9 Jul 2026 19:08:59 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 02/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8192
Message-ID: <20260709-shredding-grazing-4e1d286bf757@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-2-2926da3db6cf@collabora.com>
 <ff0f6f05-8445-459e-9c21-13f3dd57c4c4@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="139Ku04gQspMY2P7"
Content-Disposition: inline
In-Reply-To: <ff0f6f05-8445-459e-9c21-13f3dd57c4c4@collabora.com>
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

--139Ku04gQspMY2P7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--139Ku04gQspMY2P7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/jugAKCRB4tDGHoIJi
0qVEAQD57WGPBqOiosO7weHjwHkaqI0Dl9kkt3RNV2IFULp7uwEApE1cVKg3j75f
LEWZkuD49qkWJDZD71eq8F2VvSLPVg4=
=hKj3
-----END PGP SIGNATURE-----

--139Ku04gQspMY2P7--

