Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A23C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNSuuSfon4v/pI6IqbQjhOGu6PQA9a2GdCCeTthXBQE=; b=emOFFt1i9XOJ18OlIY2vwFylOl
	fKawiwK+pIweNQelQ+co1ezX4uFjoIoS/opiJjcFVsbxNVkOIdfsMuKPrhIxZ0ylpXXnD2a6kRITe
	FId8ujEYpP1PqnwBoTAQ5wL5XcYp4zxjsN3+gZJ2HsBxMgz3gRsqDYuNwPOeHoGQA5ZIKVyP9jYye
	sWKsU2aeNKkdehMMeyThM0ubh2r3/uDfvzkCMEFNFmEVFuylO4XTHylHDi28TifXwqfzM66Up3SAm
	GePrQ4qy8q7vJUb2Dksm7SdnJOCk/+HTylz7RRNuFUNjfC9tB/qFBght6f/qnSbabMIU5oebFqIts
	45tN1uBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuu9-0000000Acio-2ab3;
	Wed, 18 Jun 2025 15:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtFl-0000000AN3P-0n9s
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NNSuuSfon4v/pI6IqbQjhOGu6PQA9a2GdCCeTthXBQE=; b=gPK0zV2vjj0ZMzRlHhXN4aGvIG
	ePfZWIYrRUdTxbfgWNe8mSJR5+mXNPk0NtGlWFUO50BJXMutf36Jc6IapnUW1w26BH4G9wAFIU7Cb
	zKYs5mZ/1PFbwLAmCxYEGkYY0hkQY5wuzibQVffaZsUuVdNrwi4dQBaI14wOq0ijQO03m522k3eiA
	IEwS1i32v3b1Ot7GmKBKUAXYS8kGb7SateXPcvhI7BELspxQiDWugW17uyRTDTCGCZECme0q9iSEV
	SmTdie7jPn+6lO/kRk01Pikd/dUKZmZo4/oYW678l/jV+4JMiWER6qweeyZWS2jXqkcfj7v/1ofwD
	S+jLvekQ==;
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtFi-000000044jC-3WUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:55:00 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750254885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NNSuuSfon4v/pI6IqbQjhOGu6PQA9a2GdCCeTthXBQE=;
	b=KwN4nI+sPvrR3Atnz9e4RDMD/yXXMZ5uKrzyu8qawrYeXE4EZaNPQt2z/rZSdMMeWoJRMw
	o7rGNEoRHx5S57NlsH3aLFtvfacb/J3RIALrpa7Edf57l+6tb2F9WmASv7+Ec4lWcPEyvp
	9MCY5GyWR2OTXLMVI8fS1feNwH7qQcWCN4eD77RSjpa4r7aTXyHioxIjW71h8JOVUg3uaX
	jqItFNw3k/ynTUaa3yiI42cOap8vFqXaWf6L1f/tIIumxf5gh+HVPLrdukPL8YEDYZA+PZ
	ia7tcVeiyFcAaF+eJEmW54IQqBzOsn1QD+Yg6XL164FZDSRjsEjXDC0Et+v4Ag==
Content-Type: multipart/signed;
 boundary=9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Jun 2025 15:54:42 +0200
Message-Id: <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Fix the panel compatible for
 the PinePhone Pro
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_145459_029957_C8E37CEB 
X-CRM114-Status: GOOD (  15.57  )
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

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
> As documented in its bindings, the compatible for the Himax HX8394
> MIPI-DSI LCD panel controller is in 2 parts.
> The PinePhone Pro DTS currently only specifies the first part of the
> compatible, generating a warning.
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..5ebc380a24df86ba7172b0950=
b89cac56b61c507 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -479,7 +479,7 @@ mipi_out_panel: endpoint {
>  	};
> =20
>  	panel@0 {
> -		compatible =3D "hannstar,hsd060bhw4";
> +		compatible =3D "hannstar,hsd060bhw4", "himax,hx8394";
>  		reg =3D <0>;
>  		backlight =3D <&backlight>;
>  		reset-gpios =3D <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;

Reviewed-by: Diederik de Haas <didi.debian@cknow.org>

But I'd actually suggest to combine it with patch 3 and use that
opportunity to also fix the property sorting, so you'd get 1 patch which
fixes all of the panel issues.

Cheers,
  Diederik

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFLFJQAKCRDXblvOeH7b
btb2AQCP2M61/SnTc3rFJb6VZ5pU6CwVut533jHFQU+h+sbrNwEAqNoB84+3F5h/
FBJ6x+MXFLlxBAsVt7NKd1cgWc86cAo=
=S//c
-----END PGP SIGNATURE-----

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120--

