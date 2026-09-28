Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1641CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8gb2EQ4YEQM5mnoy3pmR3dgRg6e0zG6BOgph6Y9a+g=; b=BlNcbFz6wnLObcrPLRILZbed4q
	OEbWl3rtpj9Kx8Ud4kCkVr5jSk6fo2M4TTySOlHHOLgHHKukVhmblaRL2N0ZD3g6i5XWxj3h3Lhz/
	Biv3P/UqLhurOD1kGKU28+t6Q7ow5yRf9q6A0aBAm5s9yeJX7Tn7diJC1+MV6mFaXk51i5NcK9Gg8
	x1uDlbbvpWY0LM2lMc7XfNWq7bQB8Jr6qpj8Y/IFbqoSguEdJAa38HJkCOZN2wfo3gZtXSDSPZSB3
	/Vd3nN3Mxli1NGFiAz+JkmtMgX+/44Kp2uuvgSMBLKQqbu8uH8scsP7JcWD2OkYXYMutZmFe+WfVt
	7sQistLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHnf-00000001YcP-3rGQ;
	Mon, 28 Sep 2026 20:18:11 +0000
Received: from mail-vs2-x2a.google.com ([2a00:1450:4864:3a::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHnd-00000001Ybf-27rZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:18:11 +0000
Received: by mail-vs2-x2a.google.com with SMTP id ada2fe7eead31-7b35eae3076so585661137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790626688; x=1791231488; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8gb2EQ4YEQM5mnoy3pmR3dgRg6e0zG6BOgph6Y9a+g=;
        b=cQBq3D6GwNa9eeZ7qUxoDnoiTusBPzaVos2YRTt2rL9AYX24R/qe2zHO++hS0JfEIP
         78oiwRiR8YXGvW8ON2c+Jy4gWI2bu7uuFei4Slh9308hvNdPwHn6hjwenlDEEo39NCqE
         GyfoxBQTFMkfPRuJ6a/x8m+jYQXbHdu/y26jYoQORMf3qrehoS8bF6s3cJ464NCKWnPc
         0WyvUWxi5d0lPJgyT3dDVB1UPNC6sdNIjwoD0122FDU9Q20fGpnfhxzXCGKqMcu7CQNb
         RdKpBeUnzlx2kMFa1hYVpzaVusxYEsaj69ekWMXmG6CFyhKkhSNuGKxLEpLnWW3C/jar
         gosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626688; x=1791231488;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8gb2EQ4YEQM5mnoy3pmR3dgRg6e0zG6BOgph6Y9a+g=;
        b=e3DnTGculAej6T8M+kF724hAWIvHBGhXEtotgW6yFz2pvTRC5i99guEKo6gJyAbLtx
         yDO2mMcldMI3hfKzbaxd7jtCoMZiN6gY2i1o1xX+VofjZQlHocnWFK6YiDxsBZIAZzP1
         FHSuqW8fmOVUUdPNC2fJ+AE6KxL/SnFyqIstGJGkGW9kEickmlhhqdkhzaSgEWPDLEIP
         tBfoBW2Gtrg0oMH+H/EMG3o4X4VLjTGe1BBF2SpafplObDXiSSUJSXvmdldmynuUJ+NK
         kvAIWjKweNunTtENJxoQzip+vee4Kye1La+/BYOaybnu+pvtz/PWl0PSjlzkEtSl2kRc
         ZXDA==
X-Forwarded-Encrypted: i=1; AKwUvByeeCQYZ+8r9///pC3AkbNYgsN64w6LQhParAVd2W769nvJr85AL1p9zgGXFJj1/Du1xkN2/w4tNk4mrmPumKr8@lists.infradead.org
X-Gm-Message-State: AFq9FYIUm4qve9WzNVsIzxTG80HmpPTO+uJOre9khIqMzHo4jO0HsdZM
	No4iHi1+YN9yjoLP14MplFjHiIm4wE+bWo1LpzGLy+nnWxAvJWvmZEgM5ddeOGzw9p0=
X-Gm-Gg: AYBFou190nBC+gNq09R3sDaLeh06LijpvAemf9Dh8ZWP+10x3m56BALHlpjvTsh5Of9
	q1XbygkYHuK92et81LK5wPli3UV/nb+LrxlBY4+fkaz+TVyTuFHuJFlkGOJvRYd/C8WsMG9i8vt
	1vRZV+84FnYkDpQaOmtl8TTgc5pZFd3/xhCK1NRpxQaCAiGUUf9K+Re74lIOXWovgmYRSh0TyRt
	vSKn4GP+LKCxBbWL/jU394E4b/xCWMfy097zP+06WN60AG53v1IzFU1ACZ/Y4hE4lD85jQAryDh
	0dI0fWajA1h4QBqP18Cqmw8aISlVEo+WRno2wBwsQFzvRn2DGevQHimqniCFDZ35LlQV0waZGH2
	t2IF4JqMzUoSsmvI7BO9HHFeAwzalgUchkOaJUOtvWD8mxw1MNr4X/HeOHTc3EkW6k7evqyC4Kw
	tSFLcMHh/RZolHMVOXSZ1kNUcIf0bNuv4XvcxhW1V03R8Naer03rBKpZspicxPVZ9D1Dmb5YlFb
	Y0y2x2sM/h+LrnCGjBqHehV
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr2719387137.2.1790626687873;
        Mon, 28 Sep 2026 13:18:07 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b6a6272sm10681972137.7.2026.09.28.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:18:07 -0700 (PDT)
Message-ID: <c5bb16dec180576cb7e68221880b5e36b7cb689b.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: rockchip: rga: quiesce IRQ before releasing
 m2m state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, jacob-chen@iotwrt.com, 
	ezequiel@vanguardiasur.com.ar, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 28 Sep 2026 16:18:05 -0400
In-Reply-To: <20260704084659.612221-1-fanwu01@zju.edu.cn>
References: <20260704084659.612221-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-39ovF+b+wtIn04/R/uu7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_131809_566190_281D4724 
X-CRM114-Status: GOOD (  24.69  )
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


--=-39ovF+b+wtIn04/R/uu7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 04 juillet 2026 =C3=A0 08:46 +0000, Fan Wu a =C3=A9crit=C2=A0:
> rga_remove() releases the m2m state before the IRQ is freed. The IRQ is
> devm-managed and is only released once rga_remove() returns, so rga_isr()
> can still run while the m2m device state is being torn down.
>=20
> Store the IRQ number in struct rockchip_rga, unregister the video device
> first, and free the IRQ before releasing the m2m state so the handler
> cannot run against the freed state.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Again, I don't know if this is a real issue, but seems fair.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Picked, ty

>=20
> ---
> Changes in v2:
> - Rebased onto media-committers/fixes (Linux 7.2-rc1) so the Media CI
>   valid-ancestor check passes. The rga driver was rewritten upstream
>   (rga3 support, external IOMMU, clk_bulk, cmdbuf moved to rga_ctx), so
>   this is a re-port rather than a pure rebase: the resource freed during
>   removal is now rga->m2m_dev.
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 4 +++-
>  drivers/media/platform/rockchip/rga/rga.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb86..fbc99462dce2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -797,6 +797,7 @@ static int rga_probe(struct platform_device *pdev)
>  		ret =3D irq;
>  		goto err_put_clk;
>  	}
> +	rga->irq =3D irq;
> =20
>  	ret =3D devm_request_irq(rga->dev, irq, rga_isr,
>  			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
> @@ -876,8 +877,9 @@ static void rga_remove(struct platform_device *pdev)
> =20
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =20
> -	v4l2_m2m_release(rga->m2m_dev);
>  	video_unregister_device(rga->vfd);
> +	devm_free_irq(rga->dev, rga->irq, rga);
> +	v4l2_m2m_release(rga->m2m_dev);
>  	v4l2_device_unregister(&rga->v4l2_dev);
> =20
>  	pm_runtime_disable(rga->dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index bd431534d0d3..7bcdf36c11b4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -73,6 +73,7 @@ struct rockchip_rga {
>  	struct device *dev;
>  	struct regmap *grf;
>  	void __iomem *regs;
> +	int irq;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
>  	struct rockchip_rga_version version;

--=-39ovF+b+wtIn04/R/uu7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrLfQAKCRDZQZRRKWBy
9KCPAPwM1fyw7fD5QEP3/mMmZg+7cHaUSSeU24SoTWd1bUpA9AEA7xkB7orTNjBo
jdc9UGf06pEwlRtqhefYvUSz8x45Rgg=
=QwDi
-----END PGP SIGNATURE-----

--=-39ovF+b+wtIn04/R/uu7--

