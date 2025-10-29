Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD057CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALlT+zkeisO87P7wkYqqS/FtyMDkmsnbnHyrmAV3V14=; b=UZfYI5rtu3TiWM/7ZRvPmAaKuT
	3rVzS1nOL8aAUsNf9e8rwS6go3sjEGo9L3pZlDP41gFN26lilxXjyKSZ1qbGi1Ln3dT90Ot9wwKSe
	Jmu3MWwxnZOhP3inU0upVssUDleJiQSk8sSnZcNIZCOnhB2NeT4nS6fxyuwYiGy4Dp3gLGXDiZaYn
	3nKdxs6OW5vEcuit1pK84WekLnlaRJHfY/gyuYIWAapD7HkDGt41ihA6P1KNCYfE87a6RV20r852u
	iB0ZIao4P4kxHqz4nAKsegZ0jMxbi8xxc0C7SreHrFEjKR7hW6HnX2uQIuSiNuuIUD56oyyTE14xw
	IibUIGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA7a-00000002EQg-0GPs;
	Wed, 29 Oct 2025 17:38:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA7Z-00000002EPf-16Dm;
	Wed, 29 Oct 2025 17:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ALlT+zkeisO87P7wkYqqS/FtyMDkmsnbnHyrmAV3V14=; b=hjjarXydw1Fl3C1NFVFuw/2NTs
	ZZAmrzQqFy2wLseockel8TaFEt48QMv5zL2FmBVakbV59iNObfrcctoF78c0lyRDrBqHlDIKRxqAY
	ADMCYpxibGMfVS3F94pFxn/FSG4GrzsyUEi3ozRwtKgFlGmzz5wTDm5pLZMx84s/wBX93cHGlWeQL
	PMQfkIaQhiv1D95wHBaRYnDTtbccT53TPgbVpwkqGOmRjFlNkKbkgiv34Y82xmqFOj69H/tsiwUQu
	H62msNqD8Sh6pkyXd4cb451AqYorlaDP93jX1KXvglg2vYouyYQRUOOvrW/ZE1LYu+4+jgi+KCKyL
	RoqBX2QA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9Fl-00000007TIA-1jg3;
	Wed, 29 Oct 2025 16:42:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D03A48BA8;
	Wed, 29 Oct 2025 17:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41D5C4CEFB;
	Wed, 29 Oct 2025 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759477;
	bh=ALlT+zkeisO87P7wkYqqS/FtyMDkmsnbnHyrmAV3V14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiItvCa7fo01wEAviGksvdstjyxr959lPBEhyXFtCg12lGOj1wUoZ25cEHLXqP/Dn
	 /emFc6ELqr48kBp4UDfkZWJKJkTK238nFmOngie69TzqjJGW9jqWgd9l6hePxci+/q
	 lX0E8qdcjwmaHXfpQUujvKvx88tnZl+TTDKGjIQUjMDXjfLYTcQG8jnjsTANF5PVk8
	 L+zouuyIAf/lMjXkS/j7HdqGC/G3j6Wf40D3z+hIOfEEBiAocxjpALYsWsIOUaru7e
	 35+9teWFlFkNNGKIYRCU2igsM4EUfJVyRnec8c8wq64BHJncHmwBad8p34cf5JfFpS
	 V7GMt9ue0mDoQ==
Date: Wed, 29 Oct 2025 17:37:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: Add compatible for
 MT8189 SoC
Message-ID: <20251029-change-atonable-585dd0397d42@spud>
References: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V7RkbouwCfWtfrQq"
Content-Disposition: inline
In-Reply-To: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_164229_666569_6BCABE63 
X-CRM114-Status: GOOD (  10.68  )
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


--V7RkbouwCfWtfrQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 02:25:57PM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the PWRAP block on MT8189 SoC, which is
> compatible with the one used on MT8195.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--V7RkbouwCfWtfrQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJQ8AAKCRB4tDGHoIJi
0im1AQCeMlTn6wQy1Vjpm/2Ce/v2/7kzcogQnssK6Ik37VGObQD/SA8jiLZITdoo
izfE3AwS2c3v1VeClOFMLRGxwiCy2AY=
=Yrem
-----END PGP SIGNATURE-----

--V7RkbouwCfWtfrQq--

