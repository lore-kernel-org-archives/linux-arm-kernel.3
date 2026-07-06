Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccOyiC2jznVKxZDvjoV8BnZRBXz549AenKEwOQZucvI=; b=oV93qZ4bu+d8nHmivEdqOBekZw
	bSUQ/i4GruoSmgheljBN8/U6HAHDOjAJr86kz1FtMOa1O08KgYcZMvJjQGUbo/JbEPSveK7FL1AKG
	FqZTMWYp2SNedoRQSO65EdBNY+VPswOGF+KguqB1eOt+0+NH17wOxV5pXyNswaoILvEEK73dfwPnF
	fQ0C6yPC2MmjDQ6/tB5LnirlAHye9/Ermq1lt18my7BvY7Whlt7sPXzm06A7/XEyOYWP1cZlb7PGP
	OZ8yEFTa8njQjWj/POPQCYedZ/5zVTOBxIP39PdSfzmn5ntzyQVN05gzc/RQo+gRDxvo94iumjTDE
	bysMboGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglhm-0000000CyAw-2mne;
	Mon, 06 Jul 2026 15:57:58 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglhj-0000000CyAD-2jQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:57:57 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e5d6f35c1so279286785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783353474; x=1783958274; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ccOyiC2jznVKxZDvjoV8BnZRBXz549AenKEwOQZucvI=;
        b=WuprgSA2RWdt2aiEkTbzPFh9kNXf7FMxHbGxkRGjz2cO8+HSQce//odkrrc14SZyFf
         erkQLI3NxUW0VI9yeBJw6x8nnH9NQNNTagxbMgf/XF51W7x7D3XaQQUrL8/e+9cWb52K
         ihOTn0Bzlc0SqU4q7tq+qhOljPvMOxMVAt0UvwEh3wbl1LW/QDp7umWCEkwK147ulMHz
         aFzHOxWh/MfBhJ+TVBZ51z90OGamU06Ejq80vbQgB+d9UI/oG0qVb3O1s3SU0NwbQIw3
         RnKnYtNkaA8K/QAnWQvmL/ob1ydwboq8xXzoCJTpM/j5tCvLIBVPUo2AEfLvwOB+yFKY
         /Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353474; x=1783958274;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccOyiC2jznVKxZDvjoV8BnZRBXz549AenKEwOQZucvI=;
        b=qoKxxEGrHC2ZJM0DD0PIiuD5Yz95JwsiC0qmGwZhNmfSrftK37GYBWygABEQkL6hJi
         rJJtnwuh9peErDJ5mlAmwJzXlicuLramCALj62EOPi91VChrxQCV3pSzXct8eRNhfDlB
         9w8Qvn2URAT5wvgfggOJU8Tlc6nvlypV97ibkPwYA4Yq6A9+JVLniXoyCNP4qefnRhxc
         DuysmfrJdAP5O2AKp7yBcsxbrJWOPj0HG13eBzBh1+9aVVLda0Y9yD6qot/677QE16OA
         9gyKbEuUTUFeMgBys9Q295WCw8AvgFvtRL45JbxJifC9Pgu2aKIWPGf+F8/v7KRwZDFp
         q9Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrxJggVzjn5urp2bIChS7goXGIWXyGCyfDVfNBRuKLdS4Sv4p1/mklJp4n8ZEIrbLJfZi7PIO4s7EPTtaNIlMzv@lists.infradead.org
X-Gm-Message-State: AOJu0YyscSh+mo38b1qiwcCIkn0Jzj5ff1d34aQjFJyuAyjm9a/7n3qZ
	rulVfPhIeLX2aHoVRDA+nRlRtfFZTjrzLTtdh8LnUlF0apiHS3l2wrmnr1zmRZKFxtw=
X-Gm-Gg: AfdE7cnHt2jIoOag/pxh9c7/cIWgMYGkOSHGW8GdPCGY2MOAES9jvfypFJMWgT9GPq4
	Ex99lq0wKJIMaeZZ6bLQ7bgtKY432so06FoKl9velQ13JUtcw69I5UqH7tevKMpFCtsuwhQ3TFT
	O0M8apCXCgjOe8Krzg1Vllb8UPYDXLzS2hLxKJV16ZLgaj1jmzaaxjMBbIKxsTqQ6+9W95ASm2+
	8mHxpFNZT0X/cUQFBzYq7DQsAnIZlcBJVfzmpO8HX09IUs2gBOt6Tg7mLYZwWMpDQbNJPGo8l8K
	6qk9kKoioefday+aHcHNxGIn0Z43Iv8c2/JOLx3YiQcxv70QTeSxY6Koyr07d64wDUpMk3PtRZ+
	3jJpYLxNFkOjIxzsQ8kH7NDSzijyK/lyZW9qGdstdk3QtPTLmZcP3ChHdMNIo8GkdFrqDExsOIC
	uJ4Fed8haVH2Q7msdZLQ==
X-Received: by 2002:a05:620a:17a5:b0:92e:7e4f:eaf8 with SMTP id af79cd13be357-92ebb4d8ad6mr158283285a.23.1783353474136;
        Mon, 06 Jul 2026 08:57:54 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba7e62sm979531685a.13.2026.07.06.08.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:57:53 -0700 (PDT)
Message-ID: <06f42aae24e2e441b04549bf5be2825cf1f8e2df.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <12321260@zju.edu.cn>
Cc: Fan Wu <fanwu01@zju.edu.cn>, jacob-chen@iotwrt.com, 
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, heiko@sntech.de, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 06 Jul 2026 11:57:51 -0400
In-Reply-To: <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
	 <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
	 <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-E7tq3eJKSti7xqM09Bs/"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_085755_812282_ED212B92 
X-CRM114-Status: GOOD (  42.20  )
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


--=-E7tq3eJKSti7xqM09Bs/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 06 juillet 2026 =C3=A0 23:27 +0800, Fan Wu a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> Thanks, that is a fair point that RGA is not a free-running IRQ source;
> the interrupt should only be raised for job completion.
>=20
> I looked again for the abort/drain path, though, and I could not find one
> in the RGA teardown path. `v4l2_m2m_release()` only frees the m2m device.
> RGA does not provide a `.job_abort` callback, and `rga_remove()` does not
> reset the engine or disable the IRQ before releasing the m2m state. The
> driver also leaves the devm-managed IRQ installed until devres cleanup
> after remove returns.
>=20
> So unless I am missing another path, teardown does not actively abort an
> in-flight RGA job; it relies on there being no in-flight job by the time
> remove gets there. In the normal case that is probably true, since the
> hardware is not free-running and the submitted job has normally completed
> already. The case I was trying to cover is the narrower one where
> unbind/remove races with a still-running job.

I've never looked very deep into that, and so this report isn't a bad thing=
 at
all. With the m2m frame work, we have m2m_dev (which is in fact the schedul=
er)
and m2m_ctx, which are the instanced. The second are found to open/release,=
 the
first is probe/remove.

I don't know by which mechanism, so I'll try and learn that, but we expect
platform remove() to only be called once all the file ops release() have be=
en
called. If that is broken, we should certainly do something about it.

Now, about not having RGA specific code to abort, this is fine. What the m2=
m
framework do, in the default ctx_release() impelemtation is to call
v4l2_m2m_cancel_job(). That function optionally call job_abort(), for drive=
rs
that requires it, but otherwise, it will just wait for running jobs to fini=
sh.
Since most m2m, specially the simple case like RGA finishes quickly, the de=
lay
isn't a problem. After this, no more jobs will be scheduled, and no more IR=
Q are
expected. Meaning protection against late IRQ is defensive. We've seen some=
 HW
bugs with other drivers, so its not generally wrong to do so.

>=20
> That said, I agree the explicit irq field, `devm_free_irq()` and the long
> comment may be too much for a defensive corner-case fix without a
> reproducer. I can drop this patch, or respin it as a smaller ordering
> cleanup if you think that is useful.

What I meant is that a hardening patch based on quite hypothetical case sho=
uld
come with matching wording. Reading your submission, it felt nearly critica=
l
(and it could have been for sure). Let's investigate the remaining bits abo=
ve.
Then you can either reword or drop.

Nicolas

>=20
> Thanks,
> Fan
>=20
> > On Jul 6, 2026, at 22:22, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
> >=20
> > Hi,
> >=20
> > Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit :
> > > rga_probe() requests the interrupt with devm_request_irq(), so devres
> > > does not release the IRQ until after rga_remove() returns. rga_remove=
()
> > > currently releases rga->m2m_dev before that point.
> > >=20
> > > rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
> > > leaving a window where an interrupt can run after the m2m device has =
been
> > > released.
> >=20
> > I have a doubt that this can really happen for this type of hardware. I=
ts
> > not a
> > free-running HW that emits IRQ randomly, plus we have the abort sequenc=
e
> > that
> > ensure all jobs are completed before we pull it down.
> >=20
> > >=20
> > > Unregister the video device first to stop new userspace submissions, =
then
> > > free the devm-managed IRQ explicitly before releasing the m2m device.=
 Move
> > > the command buffer release after the IRQ teardown as well, so it is n=
ot
> > > released while a completion interrupt can still arrive.
> > >=20
> > > Store the IRQ number in struct rockchip_rga so rga_remove() can free =
the
> > > IRQ without looking it up again.
> > >=20
> > > Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> > >=20
> > > ---
> > > diff --git a/drivers/media/platform/rockchip/rga/rga.c
> > > b/drivers/media/platform/rockchip/rga/rga.c
> > > index 43f6a8d..118887a 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > > @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device *pdev=
)
> > > =C2=A0 goto err_put_clk;
> > > =C2=A0 }
> > > =C2=A0
> > > + rga->irq =3D irq;
> > > +
> > > =C2=A0 ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(rga->dev), =
rga);
> > > =C2=A0 if (ret < 0) {
> > > @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device *=
pdev)
> > > =C2=A0{
> > > =C2=A0 struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> > > =C2=A0
> > > - dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR=
_WRITE_COMBINE);
> > > -
> > > =C2=A0 v4l2_info(&rga->v4l2_dev, "Removing\n");
> > > =C2=A0
> > > - v4l2_m2m_release(rga->m2m_dev);
> > > =C2=A0 video_unregister_device(rga->vfd);
> > > +
> > > + /*
> > > + * The IRQ was requested with devm_request_irq() and is freed by dev=
m
> > > + * only after this function returns. Free it explicitly here, after =
the
> > > + * video device is unregistered, but before v4l2_m2m_release() frees
> > > + * rga->m2m_dev, which rga_isr() dereferences via v4l2_m2m_job_finis=
h().
> > > + */
> > > + devm_free_irq(rga->dev, rga->irq, rga);
> >=20
> > I'm not saying we cannot do that, but its quite verbose for something t=
hat
> > probably can't happen in practice.
> >=20
> > Nicolas
> >=20
> > > +
> > > + dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR=
_WRITE_COMBINE);
> > > + v4l2_m2m_release(rga->m2m_dev);
> > > =C2=A0 v4l2_device_unregister(&rga->v4l2_dev);
> > > =C2=A0
> > > =C2=A0 pm_runtime_disable(rga->dev);
> > > diff --git a/drivers/media/platform/rockchip/rga/rga.h
> > > b/drivers/media/platform/rockchip/rga/rga.h
> > > index 72a28b1..f76c45b 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga.h
> > > +++ b/drivers/media/platform/rockchip/rga/rga.h
> > > @@ -81,6 +81,7 @@ struct rockchip_rga {
> > > =C2=A0 struct device *dev;
> > > =C2=A0 struct regmap *grf;
> > > =C2=A0 void __iomem *regs;
> > > + int irq;
> > > =C2=A0 struct clk *sclk;
> > > =C2=A0 struct clk *aclk;
> > > =C2=A0 struct clk *hclk;
> > >=20

--=-E7tq3eJKSti7xqM09Bs/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCakvQfwAKCRDZQZRRKWBy
9OVfAP94FHLtll5BlcbiiLMERXWh7DIgX6IEnNzCIlpoODQfiAEA6nGpiFHNTGzm
fvKnFRG59nQFWkLb0cCxj2cuEXoyogQ=
=jDV3
-----END PGP SIGNATURE-----

--=-E7tq3eJKSti7xqM09Bs/--

