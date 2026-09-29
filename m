Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371CDCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xU2IbXhE/z5ABDUOgveshtAzBWv4hsn4Hu2VpZqugQ=; b=LNhKBW3lMaH8tRamB4/sv4T8Fk
	/hDVYN19CiU+l+ZfPkw0OVqTBLQ6elta9bx19hO6qGwO3cf2rHnNCSBVoon3uFc1SvCukbZI+W35O
	z37QAFZ3AphwrP2zMDRugMFT039b3M0qjM5hLpQ+ojSXkUehz+267WN0vY+KNPOKVFvC2JVZLVaEX
	5CUjIs8mco9zYFQaSTFiDQS1Ckx07WILAXf3DplfKs2ANXGZ0EKnO2N4fhASV67mCz90oLxBGQj4i
	DQO4UaUe9rXwsJwLniMVv8Qb8UyhlRqc3Mlmv58LPcoaLa1bSbx1b/VELzKBjldevXd+wyXUB4eTh
	j9oU4ScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcmp-00000004IlX-38RJ;
	Tue, 29 Sep 2026 18:42:43 +0000
Received: from mail-ua2-f42.google.com ([74.125.226.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcmn-00000004Ikj-20To
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 18:42:42 +0000
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986df7ac62dso2351426241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790707360; x=1791312160; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xU2IbXhE/z5ABDUOgveshtAzBWv4hsn4Hu2VpZqugQ=;
        b=OiFmvGzVRwNZfZ/u0NrFPt25WHZiBIWKvxX1Ph5wHWppS5rekPX8hDAVJgHxnJQYml
         xQIQ+HREqvXNFZBYBEuqTMeJld7Jd9J157Q+s/g1HVdTBmVxb47ubJn1BptPuMHOgcxM
         QgsXKdyHzFwhDpTVA6lxJlcg7cdeVbTcySOh3uJfFAj0minYtM9SwOzohAh7KYpBMsdw
         xM0ZtfX2VW8CdkbFqZYB2yCfJwAQ22KShcLI+MS6fd3wpQ4J4fk9pnZpnDaflfjLQjJ/
         FGF8hqUHhQjg2OIRMGbdzfcsbAvWD074AyS+FHeFXfSG7CzhF2GdxGm72FxQBO3fQfmH
         j63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707360; x=1791312160;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xU2IbXhE/z5ABDUOgveshtAzBWv4hsn4Hu2VpZqugQ=;
        b=gSB2nbImiaV9nui2TpswdPWzpmNLflLP6cqymZbNmais/zkD2rZXTMGzk9vgREHhDw
         ccrTcGtOjOWwNsxUgZ7+2MR14/Ksz3wRjl/gbHFVFYqioECGz79NieYhvpM3qEKyAhdv
         9k0u8pA/428SA1sG5qU9l0wS5wByY62NhgiomtAQWAQrAVp/BKpFlt5NyyRlr6Jzc/PU
         BSxYxn4taycSRJTTGOeD+p3D9IEZppXHnMoG6ONXjhdPuMygnMw4KK1K0fv5ozZ+I2wj
         /tnqa5zHz8M+3AsZaua5yn17D97PbQax0Pux1O6tWIw04sBlo/N3p9R2COvw9OB4zVbG
         4dXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJJDlytiKBff6I8B/LDQYsj0RzKMb+S3TeM9pWM+ymHd4mFTuypjIDqNYtwpRXOSUL5VG2pXMZKI+5mcxZNREg@lists.infradead.org
X-Gm-Message-State: AFq9FYL4mAtPGk1O3NHZcLEtl83YM8xoih/MmvUx2O57RF72hJ07l0gW
	eUQ9oyLAj/oZfmnXzdJPyu4oL9wkH5Dc/BuRfWcFDwjQJz6UVfZvodGwq5so9GLK3HY=
X-Gm-Gg: AYBFou0ykkdG1ozCRDwP7ohoT0A/cRv2gr9bzI6DaHj/Rc4Fv8/lin2HxUrdf9sj877
	1RG+39RwwP+FOfR+fSYDIshJif2c8Ilj0971pC0esP/jj9surHhcuGVy9DIf6I3GfaJdgOu5Egg
	Fuy2XKF+nwWfrhwxiNSaoZKSLTTWb1DzdK4ggtNvmNCDTB5/qProQon0lIxT0ekd8D6YgsKeIWf
	VNUTYJnfXn4xEHWR0KhJbufNSt6f0Ob3IB0Sam785zQiIg7wiKxYnNj35dlu8BmZxlfwW1kqKci
	MzS0UcBJ9EXQn4aKU/9LpoIEYMNTsK/IbQG7avOPyj5tUADEEN4c6OlCyMldmdHEDntpL3PkLHF
	sFiMeBGmsnJc0+kaaMVyVzbcgLiGF2s5pzurB3wXrKkPtE0SzWYr3ix9h5f3+re2egvstZd0N09
	4z6/1ipPbDlM0OyKqWSkgWCtno5jPjt2JlWv5JRsvqTU8fPIaVY8NnOZp10zWhpTq2WAdGkCnx/
	3jwrmO4AIARDg==
X-Received: by 2002:a05:6102:3e96:b0:7a8:2a34:433a with SMTP id ada2fe7eead31-7bc3c0968b9mr194936137.9.1790707359677;
        Tue, 29 Sep 2026 11:42:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7bc7de014a3sm373692137.11.2026.09.29.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:42:38 -0700 (PDT)
Message-ID: <6cbde49a7440bb59faa9eab91dfb8e99947be993.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: rockchip: rga: fix rotation on rev0 hardware
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: John Keeping <jkeeping@inmusicbrands.com>, linux-media@vger.kernel.org
Cc: Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 14:42:36 -0400
In-Reply-To: <20260929094142.928758-1-jkeeping@inmusicbrands.com>
References: <20260929094142.928758-1-jkeeping@inmusicbrands.com>
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
	protocol="application/pgp-signature"; boundary="=-ILpt8SK1pUoNPTw2qXEH"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_114241_526387_1BCFFBD3 
X-CRM114-Status: GOOD (  25.90  )
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


--=-ILpt8SK1pUoNPTw2qXEH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 29 septembre 2026 =C3=A0 10:41 +0100, John Keeping a =C3=A9crit=C2=
=A0:
> On RK3288 where the RGA reports version zero [1], rotating a buffer
> gives corrupt output where one edge will be truncated.  This is a result
> of some adjustment done specifically for hardware revision zero.  But it
> seems this is not necessary and there is no evidence for why this
> adjustment should be applied on these hardware revisions.
>=20
> Comparing the TRMs between RK3288 with revision zero and RK3588 with
> revision 3.2 there is evidence of new features supported by later
> hardware, but nothing indicating any difference in behaviour for
> rotation which is supported by all hardware revisions.
>=20
> The logic here looks wrong anyway, since it's bizarre that minor
> revision zero would need the adjustment for _all_ major revisions.  This
> was added with the initial version of the driver in commit f7e7b48e6d796
> ("[media] rockchip/rga: v4l2 m2m support") so there is no detail in the
> Git history to indicate why this special-case might be needed.
>=20
> [1] Comparing with the vendor code, it seems this is actually 1.3 with
>     the hardware reporting zero more by coincidence than design since the
>     version register is not defined for RK3288.
>=20
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Fixes: f7e7b48e6d796 ("[media] rockchip/rga: v4l2 m2m support")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> base-commit: 2579cbe68005f46fc7f8f95364f6b101b07b9d1c
>=20
> v3:
> - Rebase on media-committers/fixes and add base-commit to hopefully make
>   CI happy (patch content is completely unchanged)
> v2:
> - Remove variable that is unused after this change
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index be1bc8ddbd03b..2e7ec8b7c20f7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -158,7 +158,6 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx,=
 dma_addr_t dma_addr)
> =20
>  static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  {
> -	struct rockchip_rga *rga =3D ctx->rga;
>  	u32 *dest =3D ctx->cmdbuf_virt;
>  	unsigned int scale_dst_w, scale_dst_h;
>  	unsigned int src_h, src_w, dst_h, dst_w;
> @@ -251,13 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *c=
tx)
>  	 */
>  	if (src_info.data.rot_mode =3D=3D RGA_SRC_ROT_MODE_90_DEGREE ||
>  	    src_info.data.rot_mode =3D=3D RGA_SRC_ROT_MODE_270_DEGREE) {
> -		if (rga->version.major =3D=3D 0 || rga->version.minor =3D=3D 0) {
> -			if (dst_w =3D=3D src_h)
> -				src_h -=3D 8;
> -			if (abs(src_w - dst_h) < 16)
> -				src_w -=3D 16;
> -		}
> -
>  		scale_dst_h =3D dst_w;
>  		scale_dst_w =3D dst_h;
>  	} else {

--=-ILpt8SK1pUoNPTw2qXEH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwGnQAKCRDZQZRRKWBy
9I5zAQDENsSWZWYp+AVmTDcFYwYqOZBs5vG6vPbEM8JLE0qmywD+L4sImLRB2DW8
3eXQUNCT5EOVLkntXGgixskKFIem2ww=
=3GCb
-----END PGP SIGNATURE-----

--=-ILpt8SK1pUoNPTw2qXEH--

