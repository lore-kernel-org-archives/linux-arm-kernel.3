Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C307CD637D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4AELFpU1THdwARc02Y1V5uIhLUDaIBDQWmAVMQD+KI=; b=aEeepPkCmAiP6j7qonlCOvSL2z
	yHOoZviUosjE4uFNBm4PVYJPAzp+bDvkMsmsDMsmYVQHihCn2ArCSqufH+jamoM/Rb0E8WYdbpXhr
	Jx7wD20O6RoA387POhCTr+KUUJPMcCfYootVDVNa8ZrD2MjX7XrVMRXg85fLqRlKcjWbf131Bz1wk
	/8Cl3JLBxFXxeEPO4fnH/CpwZNhrNxRdnRVmG8jXSX8Dar3GjPhU5pNC5w8JLh0ZfrTwHW/q+EKWY
	owmjfNPByugdTjOcoPrr1nRQgPM5C8dbBa/PJeDNOJe8k6azPEwioprYDvztNtowzBDP//ArulKvF
	i079Ku5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcmo-00000005qxp-2pej;
	Tue, 16 Dec 2025 21:40:50 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcml-00000005qwi-2VwD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:40:49 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-88a379ca088so26265196d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921246; x=1766526046; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O4AELFpU1THdwARc02Y1V5uIhLUDaIBDQWmAVMQD+KI=;
        b=lreOUviPvD8KY5LXHg6hw+41EjZMK9g1q7+joBN4G66mXbcv6zoPB2AVLcLEM04fSE
         FsS1z/titv9lyugINL7k4/t7AfFc4xktCcPs9LUhjw8NjL31Ltohn0yfq+9oeHR3TQCG
         piZ68No8PwAucLxdVKFU3z6qsqLgzVwVYbz1g6DufZqYx3yHvqPxvwvzpOUbNHaObJk3
         ZznBFDcHI0m2Vmycjb/72dU0zpGPdAxRHKZfGNI+EBCjkUqZTzK0+3tdhecSIwAWKmiC
         5Pn8/Tx0K/DdlObCDVnxV0Bkcp/nqiqoVNUPQnUdTF2Ef4MEVxjyrqkaTt/WpAYjsIwY
         I3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921246; x=1766526046;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4AELFpU1THdwARc02Y1V5uIhLUDaIBDQWmAVMQD+KI=;
        b=YiATNLjiSMdm0KvxFdCDc8Z5uXMLWn9Sz76DG3cZ9n3/ld4r99WDlVRf8+3kzI3dAs
         vdzKUmheDAAqfJ2QZO3XLG0LNfB1L0tqXTuIY6tCzJTZ1Xh9ZRpXxYa2FdcxeGCOcKRD
         B9X/CLUyHNj5x/tIwLUkii8csd50zds04SlcUtbKO84CXXO3BSIQUh2GaG3VrV8yDQBE
         SOEPt0DlZLYkyvnAqOamnqHGXcELtA1B6BAWYS8sIyoxfOMVeaR0TER2Ijw8/mz5hcre
         Myur4GxQw0HD4mdRTkABC6rwx4PnLjW5MGDQOe3x+ZGiPG/L8h2bygQNNlhgpsxzH/Ko
         RgCg==
X-Forwarded-Encrypted: i=1; AJvYcCXvJ007oRSZUPkQXo43HvM6u3HgIq+5YkUiuUzYp+IMOKZKOXDKzJFHbPtrQGAlwKGDhOPd6RudzeYuL599ogsR@lists.infradead.org
X-Gm-Message-State: AOJu0YxUYiM8++c4rRKoPQ5sscJnsocYzwMyCxSRKRaF1WbKuCjOxcCR
	sDr+8p2ro2ELF/SejoJCLQVAyyNBZRkAtojzssMLwEETcKmmRg+k8ycbm6kkLHMnFd0=
X-Gm-Gg: AY/fxX77y52y+20VYmgv542B5l9r4o3esISzcj0gbgE1+TdvcdWUvA7Ovuv/FQbNkYe
	s/w806feZ8AGldJ1LsScLtmWNiygvn9me9OqkJsPIqbsuD//vPz1NamDkSIfRxwVNb9Q7TPPsKG
	TDMWN3CbQDSIPUbAXJ1QxRetatTO9i6NbkXmwPJX/BJIQFcN9THbm/znfGWPrLsxG4L9eonb7GG
	8zSjAkz5pbmbW4q16ubq5B1jxLpb3/2sVhEk4Z68m4CsRForUhBSr8cFhqbotSGH5JXX7JDdURd
	chDgSlB03wyUPhvUGh9aMKdufL4LaT9BUKcPEX66xuEwqe7hbMH5qKj4RAUPJW98fVQoTZNJkbG
	1IA4cB/5FmzA7TlnPjf1Oc7k9EvGizLqeNvTdtYcrva/iale3kWDd2PsIEgGTGSLWQy+uk5FYbD
	n8ckpGvwp7/OiocXCX
X-Google-Smtp-Source: AGHT+IEh3+aMTT+69SVk2qQBnQj0741wIei3uKMlKrQWP8MB9v7jQGSEyVTJ0cWhWW2Caga3ImCEOg==
X-Received: by 2002:a0c:ed42:0:b0:888:8096:a09c with SMTP id 6a1803df08f44-8888096a4f6mr180400916d6.62.1765921246135;
        Tue, 16 Dec 2025 13:40:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b41845sm82007646d6.2.2025.12.16.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:40:45 -0800 (PST)
Message-ID: <41e00b0f4c667ff8e8a8f8b81f64fe1bbca7c001.camel@ndufresne.ca>
Subject: Re: [PATCH v11 07/12] media: mediatek: jpeg: fix decoding
 resolution change operation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:40:44 -0500
In-Reply-To: <20251202094800.6140-8-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-WiTrr4gl+5/mCAw/rMLC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134047_676698_F8BB3758 
X-CRM114-Status: GOOD (  21.25  )
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


--=-WiTrr4gl+5/mCAw/rMLC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> 1.add a judgement for src buffer to avoid kernel crash
> in the stop streaming function;
> 2.When a resolution changing occurs, it needs to set new
> resolution parameter immediately and then report this event.
> Otherwise, if the original software process is maintained,
> the resolution change event is reported firstly, the CPU is
> dispatched to the app to process the event, and the driver
> does not set a new resolution, which will cause parameter errors.
> 3.After a resolution change occurred, decoding should not continue,
> needs to wait until new buffers are ready and the state machine
> changed.

I mention this in other patchset, very often, 3 bullets means 3 distinct
changes. Don't use bullets. Reflow this text, rework this text, there is ma=
ny
syntax error here.

>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 9 +++++++--
> =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 5ffaee4dcd19..9233bbfe2d97 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -887,7 +887,8 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0
> =C2=A0		vb =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> =C2=A0		src_buf =3D mtk_jpeg_vb2_to_srcbuf(&vb->vb2_buf);
> -		mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
> +		if (!IS_ERR_OR_NULL(src_buf))
> +			mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);

The lack of vb2_wait_for_all_buffers() might explains this better, you migh=
t not
need to do random null checks like this.

Nicolas

> =C2=A0		ctx->state =3D MTK_JPEG_RUNNING;
> =C2=A0	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> =C2=A0		ctx->state =3D MTK_JPEG_INIT;
> @@ -1749,11 +1750,15 @@ static void mtk_jpegdec_worker(struct work_struct
> *work)
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
> =C2=A0		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {

--=-WiTrr4gl+5/mCAw/rMLC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHR3AAKCRDZQZRRKWBy
9CwsAQCyuxoAqjtYHse6WiWw9r1vAIqN8RsAZzvbh5RFyVgTgQD/XjRgo9FDnGk4
3bziswMEpYDICcpXmalCD6/v7owEUQs=
=aXJ6
-----END PGP SIGNATURE-----

--=-WiTrr4gl+5/mCAw/rMLC--

