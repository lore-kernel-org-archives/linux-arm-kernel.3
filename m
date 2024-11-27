Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294EAD6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKTujO+9f1re05ADax+ozv7MtSPN4e1YJbR8IePIpuc=; b=uv0KkDLAlQty1af8jsX+hb9BlP
	tfdXv1gMJQqZhdalPsNCriVXUumZ73JZAnoD4WsbzSK+eKixqAXHFk9l5HHXJ74bGHqBfK3t1RbZ2
	1rMJY1jV0wCLP9OpXEHvjdmz5z9bnE6gj+5mtlTYaIT5Q5cqbw0ch1SXhNQQXN111yHwl78hD3k0b
	TyiC2f/jl9CCrIf0A2x/4LshpYkzvbS7IEyHHl4TPKFSGm+VJ5o1v+b5Bjb/dw2DhhL2L+JitwwMR
	O2fg1s1mw+S0/Nev1pApRsapiIQjbCm21OQ+UTfx+diR8/pMutrinFzhczyr8XI5yY0rl8t0Wxn6V
	t7JhSISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLV8-0000000Diki-2GeM;
	Wed, 27 Nov 2024 17:06:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKTK-0000000Da3O-297b;
	Wed, 27 Nov 2024 16:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DKTujO+9f1re05ADax+ozv7MtSPN4e1YJbR8IePIpuc=; b=R1r0hUsH+swjmsDANLl7rRQ+au
	NjfI61WaHhbAzORf7JWGw8wPecV140VD2cHgQuQBINnnixYSq1bC7juQF5GQmJtFI/ndH2qzx/FSM
	Yw74+iPdkbupVkOQP5Bhc6dZ5JwowBpzFqQb2jQ25/yI5ouVUFVFu7a0HKGhzwC6MIArVLfTMsrkV
	hxbRNXVvvgdw58VExUPHVTS2CFwpDXjNePgPbeKHf6JFSOZkke4rb0wlIK2Cygcujx3Mo3voFaBcq
	ZKVIMJtBswbfOeBBtCBe1xFHpAoPQBoxo7Tcwitb6LuvHbPiUy1ZmLZ4koBFsRS4eJkInBdyFtDuA
	NacPtOYQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKTH-00000001QwB-21sM;
	Wed, 27 Nov 2024 16:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41E005C54BE;
	Wed, 27 Nov 2024 16:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0396C4CECC;
	Wed, 27 Nov 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723245;
	bh=yF7xcJbfXxYMQO5rvQ21+IZrDicfnlmOQqUSNtru+hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+Nuv89mAx90D/dR6NKNX+bQsT0PIlhoudP/UkDzMlNdtL17CPv9n0j5J5kuPL7OQ
	 CVQIP36y+FGKuuosv74aKMTFUbGp7cKuEyX0vjxise9gNVIY25pPPnSRYrv7BYhO+0
	 L2UXVgZc1xEsnbwiVEYrZgJJ9Sa0qv4oHREY/OhU8X+/4rJZ/stleNW1TMoUA/GyeH
	 vEODU7eQXIohQ6bRj8ilMbbQf2ndl8vyNMbGW3xmBwmwlqTLDtdvtt2a4kjQoJB45v
	 hfZEGcyH3lJqn9coQUm/IGOR6EFnySTcqCnEH0xF73BbXAYrWFcv/qDEfJhfneiQB0
	 ibET4vMft5e4g==
Date: Wed, 27 Nov 2024 16:00:39 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <20241127-majorette-decorated-44dc1e7dd121@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YfeHRpG0fb111QcS"
Content-Disposition: inline
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_160055_864303_9CC06A34 
X-CRM114-Status: GOOD (  18.89  )
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


--YfeHRpG0fb111QcS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=E9 Draszik wrote:
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
>=20
> Update the schema to enforce that by requiring the orientation-switch
> and port properties (on gs101 only).
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>

What is your driver doing if these are not provided? New required
properties are an ABI break after all and I don't see a mention of how
you're handling it here.

> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.y=
aml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 6c17a44718aa..0659fc1ce13e 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -142,6 +142,8 @@ allOf:
> =20
>        required:
>          - reg-names
> +        - orientation-switch
> +        - port
>          - pll-supply
>          - dvdd-usb20-supply
>          - vddh-usb20-supply
>=20
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--YfeHRpG0fb111QcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dCJwAKCRB4tDGHoIJi
0lp7AP9eJ/6d5zdEWP9v2k55ubqTTtGLXjJ3y2n5cdYQK3npIgEA/QzZvHonPznn
Q7ozX444DBEExV0qrgNhQZkg5Szw5QQ=
=Pect
-----END PGP SIGNATURE-----

--YfeHRpG0fb111QcS--

