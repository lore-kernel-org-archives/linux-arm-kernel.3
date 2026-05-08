Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED67CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEzQxhdIrgs8qVdjonR+CtIhh7E7By7r+yqbMW6WaoE=; b=tsUjT1UxkZhCUUEqdkxYaoKksp
	AKaaJrQYRd+BovdPS85pTsXlQsCjeE2bo6Y4q+lpOUw6XCpo8vYMUCyM2eplg7crJeLE40grZeDkz
	vPfOVbmTQk3jON+LpwIh7hwvy7wh+MbEWxbnjY54MfsU/znKULg1zGwUamaIbSHBvIslaT0/74Q9l
	3lFfWkkisa+JhOHH1V1nNK1J9ftczEgwKki5hb3ozunAXBlh/nUS0jayJyvXB51MlZSuLcBwAiqO3
	6WZIy5zM7QfgJSsC6+RU0/OYsClw71Y2IC7LuxvqTOO6ZQN4tSPimcdW2h4zsvuBhGxhGRvzgxIiR
	a7uU3Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPTX-00000007DFf-0GTI;
	Fri, 08 May 2026 17:58:59 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPTT-00000007DEi-3oZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:58:57 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-8ee62a19730so264919085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778263134; x=1778867934; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IEzQxhdIrgs8qVdjonR+CtIhh7E7By7r+yqbMW6WaoE=;
        b=s99CYpbahZAyMbidwQaz3dQsUayIQIL7kLiKC1tQ4XSU1b4gTUX1TxH1EhfOCPeY/Y
         LPVivZ65VZ1xTil4c9vdUpqa4XJsFfYZkavSNoEuXQfvk17WSbFr2vpSfetvlPJGZTZF
         EnQoISBN1/veUkpMpOaC3XxWGkN9UFVCTtfsqIFX0V0eBx+0bqc9pjGfS5IRFz+2ARU5
         x3mYftXDBgPnKFBET5VDoMzbZ8uUYgBXFXXGy3qDLuu2dOz65rS3vCPdmnuleOA9KJNa
         isSBA4H1XsyFarJqdmGhEY2mX9Ov8do/endqbNT4kqWu3/p3UDCklTpPeshJDBIGXSbg
         R3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778263134; x=1778867934;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEzQxhdIrgs8qVdjonR+CtIhh7E7By7r+yqbMW6WaoE=;
        b=nrFavlmLDAZxYaYmDCpn5kQ6YL/X8Orzk75dv4dDSsmYpg+DxvHSdiCbZ5EV/V7iLt
         bXdWlp65wCilk4kNWEDEeRfXxWVVSYhJlTTTVawbObYHcfcmTbvZC9X90zSgGXsOFsJX
         meS/LJ3u6Fq61ij4nKuwhgxk0ESLEyRf75yrXk7FvLT248NLZplk9g6k/0M92jYzoGRx
         dCD1zuZNCh+8lOoXOg0+mgtBmqfmM0GE6AqYi3NjSnaFWqMNz7y9hZSi1FwkA9DH9bok
         OWD5xzUlBmMQZ7i2srtBuB/r2TM4ivq1gKdUuGGzADp/RzohqEXZRenPp8N54yPNclAH
         cLLA==
X-Forwarded-Encrypted: i=1; AFNElJ8Gk1sMPv2TNaX98ChbCKVZvb3/ONhSMkQglnQu2n40bx0ld/wbG4tGixWnhGwc5d9tZQ8ZbazRaUCqbkZ8A4lj@lists.infradead.org
X-Gm-Message-State: AOJu0YySErXwh3+v5FVymKlL9SYUlmOufSH3A1bZXzljJOYWu5x34C9e
	XJkxi8gZzx8W1Q+PnjLDcIitVbIl1bdVIsVJ3IagSbocGfXO1cVDPRv6+BOxJhZmK4g=
X-Gm-Gg: AeBDievYmtRaUYUuE8CF2DZ7ModDLD+vl9MJY0QMNCpp0YPCCSkA2BgIkQFiboExxtp
	ntYX8MQhzPGvPQWyo5u3kbafln//eAZzLuV3WdHuAbiECAlcjWJ5Tf8afvpeND+9in5XQgEI/PP
	Q2X0xIz09nTwodS0+PSTb89M6Ix9ntu1mOMphgOCTXdnv5yvch1RWWiSFbGkRgrnlRqBT/+B2zE
	jtEeUkyekwuspz3YZetSlIGdKLtqcCyrPZgvgHis+bu0YcS835cb3jXQti141g6+F+V5NFefHHE
	erLe5+YvVdRuecPH1Pwh/QIfg//ZihcRkVyvBL6xDdXE3cABUBj8ot9vgJL6vDgpRr84R9tLVfL
	wK39OJoZVSWkk6Ssk4116WiuMQL+Roik5y1AGMVzfYYD5E4+AfWzA3+Os9P+khtNQT98p/YDVd5
	K9e0Y4Ne9yuBwuEnhJuU1sw/G6OyCJ
X-Received: by 2002:a05:620a:2584:b0:8f8:d217:f46a with SMTP id af79cd13be357-904d3fa500bmr1997866885a.8.1778263133866;
        Fri, 08 May 2026 10:58:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm270004885a.19.2026.05.08.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:58:53 -0700 (PDT)
Message-ID: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of
 vdec_open
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan
 <mjourdan@baylibre.com>, Hans Verkuil	 <hverkuil@kernel.org>, "open
 list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, "open list:STAGING
 SUBSYSTEM"	 <linux-staging@lists.linux.dev>, "moderated list:ARM/Amlogic
 Meson SoC support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Fri, 08 May 2026 13:58:51 -0400
In-Reply-To: <20260321065408.209723-1-linux.amoon@gmail.com>
References: <20260321065408.209723-1-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-3VX71bn7qLKjvDPsQYLL"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_105856_236926_6D3C3EAC 
X-CRM114-Status: GOOD (  20.95  )
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


--=-3VX71bn7qLKjvDPsQYLL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

sorry I missed your patch, catching up now.


Le samedi 21 mars 2026 =C3=A0 12:24 +0530, Anand Moon a =C3=A9crit=C2=A0:
> The vdec_open and vdec_close functions in the Meson VDEC driver failed
> to release several resources, leading to memory leaks and potential
> use-after-free scenarios.
>=20
> This patch addresses:
> - Missing v4l2_ctrl_handler_free() in both the close path and error
> =C2=A0 exit of the open path, preventing control memory leaks.
> - A leak of the M2M context if vdec_init_ctrls() failed.
>=20
> The error labels in vdec_open() have been reordered to ensure a proper
> Last-In-First-Out (LIFO) teardown of all initialized resources.
>=20
> This was identified via kmemleak:
> unreferenced object 0xffff0000205d6878 (size 8):
> =C2=A0 comm "v4l_id", pid 5289, jiffies 4294938580
> =C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0 40 d2 49 18 00 00 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @.I.....
> =C2=A0 backtrace (crc d3204599):
> =C2=A0=C2=A0=C2=A0 kmemleak_alloc+0xc8/0xf0
> =C2=A0=C2=A0=C2=A0 __kvmalloc_node_noprof+0x60c/0x850
> =C2=A0=C2=A0=C2=A0 v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> =C2=A0=C2=A0=C2=A0 vdec_open+0x1f4/0x788 [meson_vdec]
> =C2=A0=C2=A0=C2=A0 v4l2_open+0x144/0x460 [videodev]
> =C2=A0=C2=A0=C2=A0 chrdev_open+0x1ac/0x500
> =C2=A0=C2=A0=C2=A0 do_dentry_open+0x3f0/0xfe8
> =C2=A0=C2=A0=C2=A0 vfs_open+0x68/0x320
> =C2=A0=C2=A0=C2=A0 do_open+0x2d8/0x9a8
> =C2=A0=C2=A0=C2=A0 path_openat+0x1d0/0x4f0
> =C2=A0=C2=A0=C2=A0 do_filp_open+0x190/0x380
> =C2=A0=C2=A0=C2=A0 do_sys_openat2+0xf8/0x1b0
> =C2=A0=C2=A0=C2=A0 __arm64_sys_openat+0x13c/0x1e8
> =C2=A0=C2=A0=C2=A0 invoke_syscall+0xdc/0x268
> =C2=A0=C2=A0=C2=A0 el0_svc_common.constprop.0+0x178/0x258
> =C2=A0=C2=A0=C2=A0 do_el0_svc+0x4c/0x70
>=20
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail=
.com/
> =C2=A0=C2=A0 tried to address the issue reported by Nicolas
> =C2=A0=C2=A0 improve the commit message.
> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
> =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a76..3a5e4ebe0b34c 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
> =C2=A0	if (IS_ERR(sess->m2m_dev)) {
> =C2=A0		dev_err(dev, "Fail to v4l2_m2m_init\n");
> =C2=A0		ret =3D PTR_ERR(sess->m2m_dev);
> -		goto err_free_sess;
> +		goto err_m2m_release;

If m2m_dev creation failed, why do you want to call v4l2_m2m_release() ?

> =C2=A0	}
> =C2=A0
> =C2=A0	sess->m2m_ctx =3D v4l2_m2m_ctx_init(sess->m2m_dev, sess,
> m2m_queue_init);
> @@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
> =C2=A0
> =C2=A0	ret =3D vdec_init_ctrls(sess);
> =C2=A0	if (ret)
> -		goto err_m2m_release;
> +		goto err_m2m_ctx_release;
> =C2=A0
> =C2=A0	sess->pixfmt_cap =3D formats[0].pixfmts_cap[0];
> =C2=A0	sess->fmt_out =3D &formats[0];
> @@ -913,9 +913,11 @@ static int vdec_open(struct file *file)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_m2m_ctx_release:
> +	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0err_m2m_release:
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> -err_free_sess:
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	kfree(sess);
> =C2=A0	return ret;
> =C2=A0}
> @@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_fh_del(&sess->fh, file);
> =C2=A0	v4l2_fh_exit(&sess->fh);
> =C2=A0
>=20
> base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7

--=-3VX71bn7qLKjvDPsQYLL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf4kWwAKCRDZQZRRKWBy
9B5rAP9MVO41rRXQ4VKCwIshF3QfT75K/0d2qKK2EUMjAEW/SwEA2/UqAeSY68BC
VhnK/FFYRn0PpC4HYZLbmtXFz58mBwE=
=4xTS
-----END PGP SIGNATURE-----

--=-3VX71bn7qLKjvDPsQYLL--

