Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573561091917
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=; b=O6GPdDpFnrjmx/PnZWAWALRG8y
	J9nWNrOJ8icGRUZYyr9f6HTLIKan7Wu16DQBoq3hNjbLQ02g4/3W0ma9c8ANxiDzAaiFaRYB3BMFO
	+eLfW/1Eg0zF2MaIDtQS3HAsLJC7dXUVJ+9mdHlKJ9H2682KmG0zlS94AKeiSFOtCep9THCtau0v+
	CExJyX3U9fPXECfwr1+sYHU7To2GIpLqRXm+jy+QavVJjOPPReDudCu1CUDMHq7rORIGJoBc8qi+D
	LNvYr3xnSedx3Wb8NQdOVcrSuJfF8N/7qr+uiIN21fAA1zR4SVanI/XVo4saJ4lZ/Z80v1xj16itx
	mhR2TsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K5N-0000000BXlf-3AGn;
	Thu, 19 Mar 2026 20:35:17 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K5K-0000000BXku-1NLp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 20:35:16 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50b2b289925so8536291cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773952513; x=1774557313; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=F98fAygWZbF+QWdIrf4f4olqinrxD9LQlIxlY2LwRrwPSvrZudSqshU6iAYmFJP/I9
         K6HdAQZidaFQkubRlvGwz5Aiunj7dyJBKd9Ck5g13NYKDAgNExvs13qEfRnuhjeFPSMP
         2hHQX+oLW4uI4iiw7M0ZklZKigJsvMm9KubcWO0iXPFGlBEW2ubCR1QoiuSRB+l4Aeu8
         LAePvwgfgg2lX23LslHghZES1wBnJW6TeQ2MVpO4mA7JFwbXTHZS0GFtnhwecFeX7iqV
         XTd9D9Ckio//R07nSGrHPDq6a7052UOURr4qxjfEoy8Ki+Oo+ryC5vaFamibXpc4ynLz
         rCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952513; x=1774557313;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=FaE+t9FB7NHe7NL4azsXTYaBsD96i+uJm6oVqFrg2FQdPendMhfm9cSjuPqhbOWdOv
         In+zQUHQ/3AAcooj+hsokwubTQqwT0N3B8dcKcDSZmG0BRyQVwyzT11IUbJvc0QyGC6h
         jPWLUN8FipGpaxEbvkKBzEXiuk2vJs3XVv8q7s148jk3SNrNppvLyt3CebcBjtBEpvJB
         XVHi2ZtNVxoeY4hlzVf4shtQYcxWJDIioJjwnM/ydfXNwDvfc/FCsC1zdoF5KsEsFwRf
         Ws9ZpVoFrUwJxr5mY0sB9nkh+H6KeXMzjVKGuidIcukHKzuYSA3XOzdG3B9IyiPrRr8x
         2gBA==
X-Forwarded-Encrypted: i=1; AJvYcCVRJipSrq0BShFYXFiAuG3FBYljl+p7BN5nJtKeWzCSVfssRKZJTefjCyQHl20p107cThkrC4MxyWAI6fKl0SUO@lists.infradead.org
X-Gm-Message-State: AOJu0YyaJq9WIT0+wY36Q2mCXD/zRZtIx5utu0dtLo3CUPAC3KDqUL3F
	tMoo0Nhgh+P0oQRqcf6gGB5Q2XQ1zZ3eG6blJ9gYToMeC7HsTB/GkQKF/vu+1qOyOqg=
X-Gm-Gg: ATEYQzz7RQV94UJQJZemOhSpR2G5r7c/mbPH0nH/mYTi9Q/yEuSnawneS5zVq/kMJi7
	u4Mp+tv86p5Kg9rGMfZS93bnYmvpaD5rwppzxAfUZ1fBKt6Jd9VjUJ3/VQoDAgszxIAnEXeCVWN
	ZbKzHq71ypwK59nVytXYCEyTs50RMUxg47//zfUQ65p6T0xNntyRAFegupf0lxHm3Bplb4ik0iI
	aj4YZkDoOfQ/XgmR5iB9lmhnNyMBuTdlMXlzRWdV8S+RVlMFwcn5JJC/bSZ/W6HXEu1Ss7tFZxE
	qpU3UQZemfBqlqQb+AS1CCnEppdq5/jKhW/z/2RcbAOhZUYGbr5l/htdgVZNOvBYs0ogvPkEoiR
	jCAqdc1qLzHbb6OVfjN7WMgpSOxsdqtZPdoARFDn64Fu3iXgjskQvMiruZ8yidZdqE4/XERVkMg
	ZsRB7Iat37UYuuE/fPRksdC3zNJH6g
X-Received: by 2002:a05:622a:4c0b:b0:509:2d05:6979 with SMTP id d75a77b69052e-50b3748dfabmr9614041cf.26.1773952512773;
        Thu, 19 Mar 2026 13:35:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb3c91sm5393191cf.4.2026.03.19.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:35:11 -0700 (PDT)
Message-ID: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of
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
Date: Thu, 19 Mar 2026 16:35:10 -0400
In-Reply-To: <20260304100557.126488-1-linux.amoon@gmail.com>
References: <20260304100557.126488-1-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-cIsShmpVIGkp2hMkk7aV"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_133514_369292_E50F2135 
X-CRM114-Status: GOOD (  18.10  )
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


--=-cIsShmpVIGkp2hMkk7aV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit=C2=A0:
> If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> during vdec_open fails, the control handler allocated for the session
> is not released. This causes a memory leak of the v4l2_ctrl_handler
> and its associated control objects.
>=20
> Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> path to ensure resources are properly reclaimed.
>=20
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
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 4b77ec1af5a7..a5ab0c2390f5 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_m2m_release:

This goto is used twice. The second time is when vdec_init_ctrls() fails, a=
nd in
that case the v4l2_m2m_ctx is leaded. Can you add the missing label and cal=
l
v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit again=
.

regards,
Nicolas

> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> =C2=A0err_free_sess:
> =C2=A0	kfree(sess);
> @@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_fh_del(&sess->fh, file);
> =C2=A0	v4l2_fh_exit(&sess->fh);
> =C2=A0
>=20
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af

--=-cIsShmpVIGkp2hMkk7aV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxd/gAKCRDZQZRRKWBy
9PaoAP9PoxyrdYiXm0RCBS8FInF86DoW/B9AvzEmZ/gHCIdlSQD/dYT0Q3twNY80
YmxdwR1+9TJyEj0XviEmd4JDTuYSxQQ=
=SUeq
-----END PGP SIGNATURE-----

--=-cIsShmpVIGkp2hMkk7aV--

