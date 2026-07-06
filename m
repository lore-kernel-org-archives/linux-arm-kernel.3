Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99178C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVNfxXIhfRbzejobq0Bw+fm1oMgBFxUSiDv+/DvkLmA=; b=fjmKTc3Clh0UnOYukMdsC7cFqM
	QHuVZtgSg+b0mwyyBpYe91H1U0p3Cn7hQslMI02l1jKktgmo3uk7xSuSRE3AnoVIqjwGTRLX1N4am
	lPL5rfy1cDYM27vy9MWwd+W/lQueRhYPBKs9bx7UxQDVxztVJ6lfcUImY/4dcXbrmAGYLIXcHpPwf
	HD0mUEKwTU1qyE4Pf4rIrj/QvFJNMXT/Kpt1Ncsqd5y6dFoP8uEclCNDvdhuCqRzZ1gk9qQDW6MUg
	+QYwp1HhxTOfnu0fPO71gGonq1ojrTwxpZ09yIAiO8DgEUka5Pp4NWrLIqsKAIkH9MPPNENdR33r3
	CTq4mgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkDb-0000000Ck2n-0XU5;
	Mon, 06 Jul 2026 14:22:43 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkDX-0000000Ck0H-1PAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:22:42 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5bc4a1130adso635912e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783347757; x=1783952557; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MVNfxXIhfRbzejobq0Bw+fm1oMgBFxUSiDv+/DvkLmA=;
        b=oYb44oVrA+PcwQTqnJJZ9Se4zjoTAEOb4TOFhfzvonAfzBfLxPEbW2ESvlDyL5zINz
         cOk6gE5Wxng6HXmRka9tNv0cHI+Jr4ZV98KKgj3Da0arLxjUtZmdiXauXn+driXvG+RQ
         LOFEzMRI7Ns/OTKH34FSKY5k59YCtK0UQeHnM3a103yXa7xGUN6MtQVYsnSoWWRuytSp
         nnyXDAfgBrjN5DGdWDoAoS9XRhYDob11DblaH3AI0wdm0PNQfzO9VN1YI/Og2KA3I4pE
         BWz+CQ8+Rg081xg0a1i4eWw2rgAa0UwFmEnYb4gu9eW9ymC+hRt0yRJucxMFelRUw7Fs
         P46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347757; x=1783952557;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVNfxXIhfRbzejobq0Bw+fm1oMgBFxUSiDv+/DvkLmA=;
        b=MmVR5OFl2ihMPQFHecFk+P+/XjpilPaRy8T7Hq5LAGIyi7yswsoHFDNYTcm+G3F3kh
         XU2QKifXHhYBbPLfaPMmtBz1OcGbQ+Jbde43O8X+C64JeTONZC8wg+TKV3QlsoRRy9Hp
         fWCLbiKygL3NSFcuXOhx7Yx2bfQLX/EGvHULDV/ZQGZ6JDF8PX9s4/dyeONBwEzuVlOc
         p9X3LRrxn5haCzAxHZCq1i71nJoZTQGQPAldHGdc3MzWARCPvrZpSnkYa/3BNIEDt5xX
         pm5FLbeh5bX1Q2rfIBGQz++6RFDw5XyPywGy4sO+HxeM5Ul9qdWpcQJuz2gMylh4eb6j
         18Jw==
X-Forwarded-Encrypted: i=1; AHgh+RrA5duL+a+b57a22WQE0Ll08/hmZ1S8LLyvbrebWAXBjF5anR0d6BReUooCXtzAdM4Ampp4h3qmLzn7bNLzm2g+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb6j+g8i9T18TyK9pFBJw31Z2hHbiEyWvJaZE07ZTn12EiA9+k
	mTPSGi51zC6PsAECFos8yan4HUyyp+RohLrcJxxj57WkUn6+/uZ47JFvXpZeTKyRrCs=
X-Gm-Gg: AfdE7cmiujo4oPbjb9WeVf30RZ/Kc7Ix6ATSCseekhbvdudXQlYpbkmajTIjqrRfEmJ
	c3R0h8G2R8hDQIq0+OoXyJ224ZweuPgR/Po5qBPRZDLWA9cwSiMY3GaZ5oXu12cLTJDMwnhax7y
	Xf3sObL7IRZmnmgSYLT9BhkGYEkJ/7/TC3jnHwQtJYcMU0JNcT5I6w4snfZ3fuQdeI5nd7L/ZZM
	8HUFxtftlaE/0SDjFP2b1z416VAo3vJG02N1KS+40trVGiRpPQgtdXZ3VtMs/ndvCntgLDSoeax
	ZA63+Hd7M4QtCRClbc6LW5xPMsNjktY9TOScVGvUjYIIwIy0ojB3KUGXKndDSTw8+DyywLPXpeS
	+1h9uongmfeEvNyAM3Fm3z7Wqtw+VOTw7tWvo9JfERKuXEiOoURPnqVTjEBruob1/iG880Gu6tf
	zrl54saGJLEYDgVBSe6A==
X-Received: by 2002:a05:6122:3386:b0:5bd:a214:c933 with SMTP id 71dfb90a1353d-5be909062cfmr455408e0c.14.1783347757252;
        Mon, 06 Jul 2026 07:22:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838c1449sm5287075241.5.2026.07.06.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:22:36 -0700 (PDT)
Message-ID: <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, jacob-chen@iotwrt.com, 
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 06 Jul 2026 10:22:34 -0400
In-Reply-To: <20260704022853.77291-1-fanwu01@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-IuzSpdkevxjAGzKTKZh1"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_072239_537861_22204F0B 
X-CRM114-Status: GOOD (  22.37  )
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


--=-IuzSpdkevxjAGzKTKZh1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit=C2=A0:
> rga_probe() requests the interrupt with devm_request_irq(), so devres
> does not release the IRQ until after rga_remove() returns. rga_remove()
> currently releases rga->m2m_dev before that point.
>=20
> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
> leaving a window where an interrupt can run after the m2m device has been
> released.

I have a doubt that this can really happen for this type of hardware. Its n=
ot a
free-running HW that emits IRQ randomly, plus we have the abort sequence th=
at
ensure all jobs are completed before we pull it down.

>=20
> Unregister the video device first to stop new userspace submissions, then
> free the devm-managed IRQ explicitly before releasing the m2m device. Mov=
e
> the command buffer release after the IRQ teardown as well, so it is not
> released while a completion interrupt can still arrive.
>=20
> Store the IRQ number in struct rockchip_rga so rga_remove() can free the
> IRQ without looking it up again.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>=20
> ---
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d..118887a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> +	rga->irq =3D irq;
> +
> =C2=A0	ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(rga->dev), rga);
> =C2=A0	if (ret < 0) {
> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device *pdev=
)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> -
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =C2=A0
> -	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0	video_unregister_device(rga->vfd);
> +
> +	/*
> +	 * The IRQ was requested with devm_request_irq() and is freed by devm
> +	 * only after this function returns. Free it explicitly here, after the
> +	 * video device is unregistered, but before v4l2_m2m_release() frees
> +	 * rga->m2m_dev, which rga_isr() dereferences via v4l2_m2m_job_finish()=
.
> +	 */
> +	devm_free_irq(rga->dev, rga->irq, rga);

I'm not saying we cannot do that, but its quite verbose for something that
probably can't happen in practice.

Nicolas

> +
> +	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> =C2=A0
> =C2=A0	pm_runtime_disable(rga->dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b1..f76c45b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -81,6 +81,7 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> +	int irq;
> =C2=A0	struct clk *sclk;
> =C2=A0	struct clk *aclk;
> =C2=A0	struct clk *hclk;
>=20

--=-IuzSpdkevxjAGzKTKZh1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaku6KgAKCRDZQZRRKWBy
9JZSAQC1dbw91+G7+3PPOBNBtgKbdRlVtvIxd5JJz6bxqWFUcAD8D8YnicY3DZw9
ETebtopePbd1jSVCQw+7hxWTjoNzVw8=
=N0fp
-----END PGP SIGNATURE-----

--=-IuzSpdkevxjAGzKTKZh1--

