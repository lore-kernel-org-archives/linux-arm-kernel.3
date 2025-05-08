Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6780C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Af0bp2evNij1je9YYiz/Azkf+P9YDdjL5MyUDCQJcc4=; b=XwT46pRd6bZGm65tdDg+PqLvou
	AEsB9eApYkTSOv+Jq4ZkxwMafugF2aSfhzxWFbTAy7V8JgmfCLNsHZ3oawa/bd3ttYWGWxj8Sgatv
	a7647PzFOjM7f3mtfD1c51Gx2KfjNRazAE0N3PNn4MV8oITJ+XzOQicoOt0fnbxPY6QISBRcd8mjW
	EuBFjdQDJ3ygJXIy3+XsD36BnU/na0xOdlLQIzeLp3QxQ3DEuM/j3XQYHmoQET1EVDMG4ycWOclDF
	qDTOZGJtS2IudqCZpAIwRN/LuCQZQ45XwcrQriWTSKGpE5uAeQe7nzU1lVb43bFtbQhmDRTnag9Sq
	ytsvCOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD32s-000000016yJ-3zf7;
	Thu, 08 May 2025 15:20:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2QV-00000000xlZ-2zrt;
	Thu, 08 May 2025 14:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 401E6629DF;
	Thu,  8 May 2025 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A725C4CEE7;
	Thu,  8 May 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715241;
	bh=OPLdpdXnFg1EEql9UQ1QOjqCfF/Fv3byRUuUihhireI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNSG6AiPbVqEvOBkAdqaTDFy/d5EH5LlicjtO/KDj261y3ToJZKm17q5e5lERjZXk
	 YGCUwkxNWd/gq7INc0K7lX22GJb6OYtvEFXKkAzdmqzsdIlqxvsY3PMyz5yeHYIO0m
	 gGuwgbnHeiXXRozzwgTlMG/dEij4LRQeKDZ58tSXy855l/CL1RjxhZ6cYxc8pgFrOV
	 +xn68RQ/13ESXfksbJdGI7oK2pXIggKOXnQT52qivcJtw7DzCk/Nea7jqEEawreEz6
	 XVaAfde867eL/MsR2+xRdMKmppjsrizdax57r15uTtiCCupIsmqmPEphw0EhJDwvew
	 Qy9NqFXSn68Sg==
Date: Thu, 8 May 2025 15:40:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF
 syscon
Message-ID: <20250508-battering-uncured-476f83a5acce@spud>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aDgo01QbuFP+4Uz9"
Content-Disposition: inline
In-Reply-To: <20250508134332.14668-3-ziyao@disroot.org>
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


--aDgo01QbuFP+4Uz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 01:43:29PM +0000, Yao Zi wrote:
> Add compatible string for pipe-phy GRF found on RK3528 SoC, which
> controls misc settings for the integrated naneng-combphy.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Do=
cumentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2f61c1b95fea..7e9321999435 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -16,6 +16,7 @@ properties:
>            - enum:
>                - rockchip,rk3288-sgrf
>                - rockchip,rk3528-ioc-grf
> +              - rockchip,rk3528-pipe-phy-grf
>                - rockchip,rk3528-vo-grf
>                - rockchip,rk3528-vpu-grf
>                - rockchip,rk3566-pipe-grf
> --=20
> 2.49.0
>=20

--aDgo01QbuFP+4Uz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzCZAAKCRB4tDGHoIJi
0hUzAP9/lnZJfUnl5iV9let8e9oK6Y6itm+MEsM7dfEwvDCRAAD6Amozg0CiO/vr
K6wE/F+QimWIw4q3EHCAHrhp3YSxVAU=
=axYG
-----END PGP SIGNATURE-----

--aDgo01QbuFP+4Uz9--

