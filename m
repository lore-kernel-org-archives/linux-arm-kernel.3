Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A7C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXjgWoYM5yLRvHw6p4AZW2Tr6Hu5WyVowGNfLEc6J8s=; b=BuZ5fhTb6D+MyjvPoEJyKi9qJe
	fd2PCh9xeav3M6KnJVM44bKXlQbg8b2k2a0yfRl5lTcNVuM/4hZKZAJmHj1zXLF3/alUMfDtUNVEY
	qrHqooatgEnh4YyX79FZ2qiH14z0uF3g5CGp+RjTpjMv0e2MgVHanvT/rEVDYt/iTzKIHJRKg0ilz
	R27ljagpnEoIUBFcKW/LOV2+nFAkoWaGhlsByrKi3BhhfeWBf5knjSJjeo08dWRmyVHi5TG79gzeH
	J0dNVIl2noVPDzwuE7TVWDVcxxP1w1pa45mTPpKoXY+iCXtXWDlVTDTieROTjxgrDdXD7bAEvKmoB
	9XbtVt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5u5-0000000DPyP-1JJM;
	Fri, 25 Sep 2026 13:23:53 +0000
Received: from mail-vs2-x0b.google.com ([2a00:1450:4864:3a::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5u2-0000000DPxg-2K0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:23:52 +0000
Received: by mail-vs2-x0b.google.com with SMTP id ada2fe7eead31-78fb3801712so1017451137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790342629; x=1790947429; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXjgWoYM5yLRvHw6p4AZW2Tr6Hu5WyVowGNfLEc6J8s=;
        b=fuJ3IKwOkAWyeTom4aM5g1DICtfy2CBKQcd7CVNT0t5QFbQNDXwEHf4ChgOr2fvb/U
         OQR8z8kPop15fMIEeSqlu5cjzWsfzcqKoaPVaK2KNHaQ31Ez81dcVKPwwBkQOT0DQTLz
         i8nbtO+JhrhA/zyy8AcrsENoHOmU2w5vW/S/2YeuD2yzt+scp3a05TfswQZYH8H8J/HU
         NIZ74HshPdZlvkDNTsDF1tGe7fs3K5zrwWlnsDBM34dYHNTOP23nf8TGrV3wXhTfGQ1E
         xS0XbFJCllfMCGYM0zh3MpQx93j9SXwmuGEePD1vONy4tiGxbalu8+BaxQZI3v4DgCLr
         WbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342629; x=1790947429;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXjgWoYM5yLRvHw6p4AZW2Tr6Hu5WyVowGNfLEc6J8s=;
        b=lyxzjiEY6/mXIO0CdFhYJVPTNIaj+mMs+eK5v7K2Gjp39Sm893KuCmGjPRnAa318uV
         +wNkIGlvBp+IDkKaxFS8hY4mCjOYLqwqpKGCmq2Af46d/zOVciyu651YctCflANvHT/o
         SRvdM6dBVGkHbsllFpirX1bgm7kGrAdMdolHYf/L5NEzviPYu5u+XGRJtT46AOHh1n2M
         NGUE8EMFG9X4WqyJV/NyrFPbvb0q6/4F3ZZemMjenpx7X6fO9p50yYRX/ms9/cgKBBRn
         gSGI7oi9jCMQfiPf8pJbcpdEQZBBTtm3sEbjEUD9C/lkIUyXyad433HrkULL3WDA35l3
         B/Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwY0ycodPRxjY4I1l0I/qYAmB8hvq2pkU270z7Djt9metxSIS7ml7nlB3avFnfHMP9O4Zy9PVEt29uDT4dDAFM2@lists.infradead.org
X-Gm-Message-State: AFuF++m/Trmk5RJyz8SXvrHznsdQJRsRB7m+YcCfkfrw0CFZ7ZH8qUOX
	BmvDnlnNbK6SzDpkNcro7tLQmwWP9rUY6PedIAwg5CV+8SVd79M0zQHuaE4njksGrh8=
X-Gm-Gg: AYBFou0ljMjW8+uUMST3LZQRgfAqYk9++JCVq17pz5Mchs3mHqdDUCwjqiSYqh4aGyo
	NuLoWwgzZ49GuCJoUXIuxjKIQLopZ7vT9LfatLyTjS6MhuKnliMVAoMPEF46vHE3TE6EAKya4ue
	r6+ZM7HTUREwdAsRCw5SNFllG4PnI2iF8ZidPUh1urRXFC+QlEzlZy5WuuiePASv6f+qggOhtnN
	JDFFsuq1X4Zn2J3oCybimZOruNQQ+55K7RhyKME30p/hsFG3hVVxgtn5w/x/1KIXchy5Wkuofta
	P5Nw9PUYCpUNDf9m4oSr/KF2jdvkXcDRgoPaN2WynhinJWnDrEb1/CCrVAmAPpTszKhYtNybNK2
	xi9zNL31oe4yryd04VW6q7eDIlll//qTxMck8aCAnaAozcWq7l7FeoP/Ocldi9Os7rIpbbKHedI
	uRmo0Q0he1vc2+d9m5B+VoW6+Ya13UQXEgoo27ZGYsoEByPFj+wpM0JiywjYeUaX5pRucCXkCSI
	n08NVNg3WujnQ==
X-Received: by 2002:a05:6102:38ce:b0:7a3:3d26:5c67 with SMTP id ada2fe7eead31-7af1e4f2ddamr2548068137.24.1790342628512;
        Fri, 25 Sep 2026 06:23:48 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9860de80b19sm2585556241.1.2026.09.25.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:23:47 -0700 (PDT)
Message-ID: <7505fe152db1f5e0794f9618aa617ce8379bf0d4.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/4] media: dt-bindings: Add Rockchip JPEG decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:23:46 -0400
In-Reply-To: <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
	 <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oDsWKzBqRCet+Qvriej0"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_062350_875979_A51394A9 
X-CRM114-Status: GOOD (  30.32  )
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


--=-oDsWKzBqRCet+Qvriej0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 25 septembre 2026 =C3=A0 13:45 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> integrates into a number of its SoCs.  Documents the single register
> window (task registers plus the LLP link-table block at offset 0x300),
> the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
> the power domain.
>=20
> The core is not tied to one SoC.  Downstream it is known as the VDPU720
> and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
> RV1126B, with only the clocks, the resets and the power domain differing,
> none of which this schema constrains.  A compatible per SoC is all it
> takes to cover them; the RK3568 and the RK3588 are the two that have been
> tested and are enabled here.
>=20
> The resets and the power domain are required.  The block cannot be
> reached with its domain off, and the driver falls back to pulsing the
> reset lines when a frame times out and the in-block soft reset does not
> complete, which a node without them would leave with no way to recover.
>=20
> The IOMMU stays optional.  The driver never refers to it, it is a platfor=
m
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on these SoCs either.
>=20
> Assisted-by: Claude:claude-opus-5

nit: Apparently the guidelines are to abstract the model, just lurned that
today.

  Assisted-by: LLM

[1] https://docs.kernel.org/process/coding-assistants.html#attribution

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 100 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpeg=
d.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> new file mode 100644
> index 0000000000000..27d85f17922ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip JPEG Decoder
> +
> +maintainers:
> +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description:
> +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as t=
he
> +  VDPU720.  The same core is integrated into a number of Rockchip SoCs, =
which
> +  differ only in the clocks, resets and power domain they are wired to. =
 A
> +  dedicated Link List Processor (LLP) register block, located at offset =
0x300
> +  within the same register window, allows the hardware to decode a chain=
 of
> +  frames autonomously ("link mode").
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-jpegd
> +      - rockchip,rk3588-jpegd
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The decoder register window.  It covers both the task (function)
> +      registers at offset 0x000 and the LLP (link table) registers at
> +      offset 0x300.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  resets:
> +    items:
> +      - description: AXI reset line
> +      - description: AHB reset line
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    video-codec@fdb90000 {
> +        compatible =3D "rockchip,rk3588-jpegd";
> +        reg =3D <0xfdb90000 0x400>;
> +        interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
> +        clock-names =3D "axi", "ahb";
> +        resets =3D <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER=
>;
> +        reset-names =3D "axi", "ahb";
> +        iommus =3D <&jpegd_mmu>;
> +        power-domains =3D <&power RK3588_PD_VDPU>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b3..290c3a1452ea0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23699,6 +23699,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt=
-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
> =20
> +ROCKCHIP JPEG DECODER DRIVER
> +M:	Lucas Sinn <lucas.sinn@wolfvision.net>
> +M:	Sascha Hauer <s.hauer@pengutronix.de>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>

--=-oDsWKzBqRCet+Qvriej0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarZ14gAKCRDZQZRRKWBy
9DtgAQDKorbZ3yVoy1keHMtODtaPz7ukHI2vc/aP4LDE1Ag8CgEAxqNFjwQPXKNx
1eI8N4euRZt0b9/sLPQ+Ez6vqDQQ/QY=
=kQh1
-----END PGP SIGNATURE-----

--=-oDsWKzBqRCet+Qvriej0--

