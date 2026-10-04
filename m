Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B97CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gMc178loumsMJ2fyhcP0L7Qn5VoTNXOEWwEnxYnAdM=; b=JGDC97S4e/tBr8mbu2BkRUEuM/
	G6QtuWoFXWACABsU24fsXqHmixLPZhC2aRlNJklwii5ODVUxKJ2AaawUIHZQigYFUsP50EMPMlbi2
	9/rV4jZmZTp+OD3OEilrdeq0Tr5x1sGz8jg4DBET8eOgvhnhjvXPdBtbTAGzStqn55x68RNEm+vQQ
	4OQ+u1ksqhAVzv1+CPiKi3wggsNn1D0F0Vl2PGOn7ojP9KURVpVFGxu8j3laimyEEwx2q5rbcNMFJ
	9UaUw3WFIy/y23KVV4CHGCyJXggebWq6vrLWhIxAw9/eAGTgbtI04Feo+rOHngZRLggCVlzm2/n4+
	TxvqPDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK2K-0000000Ehjl-0vky;
	Sun, 04 Oct 2026 11:05:44 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK2B-0000000EhiP-1GVr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:05:42 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887840c529so232208f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791111933; x=1791716733; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gMc178loumsMJ2fyhcP0L7Qn5VoTNXOEWwEnxYnAdM=;
        b=BGxt0DhtT0sUk0TXbpxhrGObhcvQpUzW2I+FdNRYcyXY+h/Mvp5A4QZVhPRV1t/qB4
         JuVQAhbkgKEsC/xZhG+mnJOkaRBOy3Zl4S29Pw2YGLqRh6MK5ymemiGoX+N72KDVFbe4
         AhAkrJHqe3Aqub94nO7qxX0wVimlCmdKg20q8CWMVGZPQcOen7AATjRxoA1E8pLDX3R7
         ZWWKZifQZXR0aEzilpMPnNDKW2YYDojzHUowgvPsL55q0BEogctDVhj3SKOo76Z24jL2
         vOQeJXVaWiRZUps96UXU0/u7t6T6i5+U+GXtKGoTZZ7sNnQz0mwj6t1aCKmUSi7f1wf9
         iJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111933; x=1791716733;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gMc178loumsMJ2fyhcP0L7Qn5VoTNXOEWwEnxYnAdM=;
        b=SsJOx8rtwMOMOzDv+HhRUBxT8XR4+/4YNf/bH+Q3K3YlobSOl3HX1rpewxxduCqGhg
         2OzomaoI/XUGzLL2k03A4AL/Af4ijyKaaVKzrBLAjSXVMS7Ggw7FDJm1HLVEpYb1ZrMI
         QN01u5bxevVD6eaIahI59WmUYWt2l9CRQ40SYQSIoWbF4wQAlL8wpVAq3XZZxPQma4PR
         zn9rPehg6WWFcnvSfTAP1FN1rTL8386/RhKUIJlPL7L4wp5/aIusCdde9qjc+Yj1HXw9
         PsjkvkWZbO9wJ38/4fMs+4BByWRuqIwlDNQXU62+2/N2KxML37EpqlvjRJQIRWyfg2Ba
         0fdg==
X-Forwarded-Encrypted: i=1; AKwUvBzf4NrNpM2kXAj/lsTYmvOeML5zO1+Xnr+QX0pMC924jkhw6yVMLxIyOkJ1w0sih/LFOuO2Paz2ioQVOj1pAErQ@lists.infradead.org
X-Gm-Message-State: AFuF++n0yU4jYn/qCO/JWLHei/hZsrd6sIbwz+4xeaRm5PhUvT1z9yoC
	UkxzvkZtbwki8U4qgBuiXiy5aI+wizUboFyIBaC9DZgSJ6bs6ZR/t5eC0sDWBoW6zIM=
X-Gm-Gg: AYBFou33oa1DFaWbi+omGAFYHUFKnhRCbH84CdYhiDAP1DVGcbfg4hT1iTVjQ4LgqoH
	iJ0EDIiVR8TllxRcy5Av47tfxltlTsL28piAhIl74YidlNF5Mvjv6NsYB4IdPXhCtilP/1ICfJL
	XnT3BRig0ASnuugOH46upsQwBFzPgLHY+eU+X6x0//7oRd+XzHPsYJwYO9dko8i3uSaSVjv/y1U
	hODFbqlmefgY4HRYam3zfciCsyf8d2U0Vg+TETSKIZbjnRXT/xWAoYLrR2SMFT7hQGk4TBGWaDP
	yORRvPAOVfexwJnjImz+DFOaqVgErNCe5Ye/+SDrGNVMcATXWboVp6Y6JCxw7gn6gLLbBNq9SyP
	k16+gqW5VMWKPIxLMspoRRLSjil0USY5naG3IyJeJntoAlbDBjrXqENBq4orXgPQ+LLy6jdg0FF
	rHNp14S+AcVndfnSOZCCoYgSMK80JAOYf86c3yCrDrJRrIDSXnHALsf+IGiOMY7/GFD1PYNFXam
	gX+z7SgB4nieXPE5Yin+msjD7w5h2AicwgVw3JgF+PW1Zz6VaRaXMjYkSXMnlVrqGuLySCzttSt
	EfByo6oDgq08kfdLZ6aOUOC5205Kr119TDdp7rrc
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr125807085e9.5.1791111932983;
        Sun, 04 Oct 2026 04:05:32 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03048abc9sm100142955e9.0.2026.10.04.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:05:31 -0700 (PDT)
Message-ID: <d166bd7190c1a71921a1eaff3359ffcd8b825afb.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: jpeg: Avoid context access after job
 finish
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kazuki Hanai <hnkz.64@gmail.com>, Bin Liu <bin.liu@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>,  Tomasz Figa <tfiga@chromium.org>, Xia Jiang
 <xia.jiang@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Sun, 04 Oct 2026 07:05:30 -0400
In-Reply-To: <e7aef28efd9860e80b8be8865dd04268ee2fd786.camel@ndufresne.ca>
References: <20260902112230.452176-1-hnkz.64@gmail.com>
	 <e7aef28efd9860e80b8be8865dd04268ee2fd786.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-Xzpp1i9yhFiY86lHCQIK"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_040535_373713_D2C5F054 
X-CRM114-Status: GOOD (  19.40  )
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


--=-Xzpp1i9yhFiY86lHCQIK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 09:26 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> Le mercredi 02 septembre 2026 =C3=A0 20:22 +0900, Kazuki Hanai a =C3=A9cr=
it=C2=A0:
> > v4l2_m2m_job_finish() publishes job completion and wakes waiters
> > before it returns. A concurrent file release can therefore finish
> > v4l2_m2m_ctx_release() and free the context while the single-core IRQ
> > handler continues with its tail.
> >=20
> > Both handlers only need the device for the matching runtime PM put.
> > Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
> > completion has been published. This preserves the get/put pairing and
> > removes the post-completion context access.
> >=20
> > Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
> > Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off f=
low")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5
> > Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Also applied to my tree now, ty

>=20
> > ---
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index d147ec4830811..9010e7b1108fa 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_j=
peg_dev *jpeg)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > -	pm_runtime_put(ctx->jpeg->dev);
> > +	pm_runtime_put(jpeg->dev);
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > @@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void=
 *priv)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > -	pm_runtime_put(ctx->jpeg->dev);
> > +	pm_runtime_put(jpeg->dev);
> >  	return IRQ_HANDLED;
> >  }
> > =20

--=-Xzpp1i9yhFiY86lHCQIK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasIy+gAKCRDZQZRRKWBy
9O1/AP0Ub/AIchVgAs3Ts4yTOsB4mOEvnEYHlNzN5kVNk8UUrAEAtPaya56szHHG
qpbxCFdG4wfkrMMaiqEo5qcevW0q1QM=
=L2sR
-----END PGP SIGNATURE-----

--=-Xzpp1i9yhFiY86lHCQIK--

