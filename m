Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p2UEs0LI;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GoAtWKhI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5NgGtSrDL6xzCswDYaRWwi+bXBJ29klM0xRwGKRqsL0=; b=p2UEs0LIlODgqOIvHyf2esVEpo
	qh8IfagbxLiBMeijpYtCzAU9+i9jtYKh9sP+hIDKg4tCNKLUNYYnK9TBT5xrQMwh8Oc8uvMM2IbDD
	r6+k2HhlSg1N58VNxzbpLtf+uTgiQtV6hls8LEheemrXS9AEaeQj4da3OtwnMw9XzmhkOkC2AZJHn
	W40uLgXpRkSfygZL18XLUw7M5LXbwQrNegp5H3AxgftHV9FOBHcPXOmYP880i8vwnK/uh+p/b7nbE
	29pc2by00YI6LOlBJxKJxoktzfqdmiKuwEPhhud4IhgZN8v4lslWcHFb4Sgw5S9BwyIflWFtQJ3kv
	45RQSTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMm2l-0000000BhZc-06kf;
	Fri, 30 Oct 2026 12:49:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMm2h-0000000BhZ2-3CPA;
	Fri, 30 Oct 2026 12:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793364547;
	bh=KlAsEMUoh8SqMK535dsRdRC/2BXgKedTejkSjok4NIg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GoAtWKhIvjsma323nTKdjX9UTokJbCgbQ7d9/UT5FOB/SFdzkpNgXp2n2f/d2p4lk
	 oGcgZ66mcU5aQJEhRGToUuHU16bJwxF53mH176R0q9mKFWRI2FRbyknQ3ZIlXFl/kP
	 AIi8buKDKTPluHT5GMgrObmLB6lYfrGffyIu/KixOTt6IakJtqT7M5uHlk6XdlkMTr
	 myL7SY6Cd6LTPIw1vDQqIREACm5cUGhhu1L3KEOzNtL3bh2gjasTEo6IfuR3AKiO5g
	 3C3Oh8bahCDoQjDcZoG24Rigzu3QeTRzWpv5dkqTedmki6Iid9ObxkczGlFFYBfXlj
	 t7Oj80WlqF5Pg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 884DB17E0053;
	Fri, 30 Oct 2026 13:49:05 +0100 (CET)
Message-ID: <76e2e993fa5a8fd054bad97505907d3c4e88e11c.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Do not keep the clocks enabled from probe
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: iav@iav.lv, Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Diederik de Haas	
 <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>, Francesco
 Saverio Pavone <pavone.lawyer@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 30 Oct 2026 08:49:03 -0400
In-Reply-To: <20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv>
References: <20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ruCLDIpENIOKgPK2wLA7"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_054911_968292_F71B5413 
X-CRM114-Status: GOOD (  28.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-ruCLDIpENIOKgPK2wLA7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 30 octobre 2026 =C3=A0 03:33 +0200, Igor Velkov via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Igor Velkov <iav@iav.lv>
>=20
> Since commit 6a846f7d72c7 ("media: rkvdec: Enable all clocks without
> naming them") the clocks are fetched with devm_clk_bulk_get_all_enabled()=
,
> which keeps them enabled from probe until unbind. rkvdec_runtime_suspend(=
)
> disables them on top of that, so their enable count never drops to zero
> and the clock gates stay open while the decoder is idle.
>=20
> On RK3399 this also breaks restore from hibernation when the boot kernel
> has not enabled these clocks, for example with rkvdec built as a module:
> the gates are closed when the restored kernel takes over, while it still
> counts the clocks as enabled. Powering on the vdu power domain then finds
> the count at 1 and leaves the gates closed, and the first QoS register
> write of the domain never returns.
>=20
> Get the clocks without enabling them and let runtime PM enable them while
> the decoder is in use, as before that commit.
>=20
> Fixes: 6a846f7d72c7 ("media: rkvdec: Enable all clocks without naming the=
m")
> Cc: stable@vger.kernel.org # v7.0+
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ROCK Pi 4A (RK3399) with v7.3, rkvdec and panfrost built as
> modules, panfrost not loaded:
> - idle decoder: the vdu clocks have enable_count 0 (1 without the patch);
> - hibernate, power cycle, restore: 3 of 3 (0 of 3 without the patch, the
>   restored kernel stops after bringing the secondary CPUs up);
> - H.264 decode with GStreamer v4l2slh264dec, 300 frames of 720p High
>   profile: output identical to avdec_h264 (md5 of all frames).
> The QoS hang was traced with debug prints in rockchip_pd_power() on a
> 7.3-based kernel.
>=20
> This is separate from the unbind leak in Jonas's patch that Francesco
> posted [1]: here the extra enable comes from probe.
>=20
> [1] https://lore.kernel.org/all/20260717154505.83935-1-pavone.lawyer@gmai=
l.com/
> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..45c541ae3029 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1788,7 +1788,7 @@ static int rkvdec_probe(struct platform_device *pde=
v)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &rkvdec->clocks);

With the explanation above, it seems pretty clear we have an issue. Now, th=
e
problem with this is that PM ops are set with:

  #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))

So if CONFIG_PM is not set, the initial resume will never occur, and first =
mmio
access will likely hang the CPU. We need a clean pattern to handle this, an=
d
perhaps review other similar drivers while at it.

Nicolas

>  	if (ret < 0)
>  		return ret;
> =20
>=20
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261030-rkvdec-runtime-pm-clocks-41adcf141271
>=20
> Best regards,

--=-ruCLDIpENIOKgPK2wLA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauSSPwAKCRDZQZRRKWBy
9LLJAP9JGmJUIntmEuLPCbktfBqHUFX1/7ZfGaC/KbjrAiMyawEAo53JgFggAOMr
y8Uub/MI2Wlho7axDbJbc7ZVrOuyVw0=
=+8na
-----END PGP SIGNATURE-----

--=-ruCLDIpENIOKgPK2wLA7--

