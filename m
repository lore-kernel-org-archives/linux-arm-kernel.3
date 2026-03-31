Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF782109B481
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=; b=tuWuV6n4yEXM2JUVAbM4eYSms1
	6r8IcMpLF1ufSgo+ojX8qBxC0joAxAbZx+MlX6HrMSrP/KxX1BYje0Q5EpmZZ0OMlGIRHX/JZYKKj
	J/q8gK7qZonNofxMrJVyts+jEYS9RA2Injr96MQyeeRR2I/Lo48/7iRx4bid6fJ3aEEmVmZ7n1nZ7
	oK2Cz8qU6LqaDlxT1tosGAoG+44nlk1OqJiGqoEo9lwJ1qW+z1FFf0rpuKpGwApCgjOV5G0L7wT09
	eBIMFTW+1pjQHuVxNmyB46WqSC3cHCLJ/zg1owudrVy4Co77SWu9dBv8sECFlo28GRezCXV/DTYaS
	yvk/9dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aTq-0000000D81Z-36NP;
	Tue, 31 Mar 2026 14:54:10 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aTo-0000000D80o-0HcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:54:09 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-899a9f445cbso66173296d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774968846; x=1775573646; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=13t7APTKaIaku8hXtmBWpwm3ldTvkcZSxpUC60F8wvLISAWIW+EZKQoj+qBl4I5/rS
         2+uwamjsmIKfTaezt1rJvkMUkpQOMQap+139ExOelSJhgb4iC8GH0Ccu6EsUGmHcv3cz
         22AqcDxpaFNyPcqeB3YLZ9ZKIiXm6927MRnNIdknZdiu72isWSz1K9BOIs9XZzhYai21
         Kb9PT528sUhygU2y5hIj70rn6qOYk5AwXXh9EHW1Gf0uwZwojemKeyYbMvAwigc9XepB
         ZzRq9/+ckXhplc934b9ci6JRLNaNl1Mg4XQ/TkR6ry3ORJO+finSjCmrB/3uGjj1aqHO
         epxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968846; x=1775573646;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=WWRh5we87iv8Pna5ekuWdA5oPO84Ga+kG3g/W7MlVuCPnoETYL3xULPH4RVrSOMihP
         jIt1THslpFF6DqQ8HOwloyfSeyA4wUTUdgsaaCTi1vJappbRbLAWBN0HRKHYMn/HM/fU
         eTfWssf2Gk0TBEo0Z1PCQgGSN68G5RVua16CYx7eQmqSyi3ZpIrm/dMGK5sPMBohybJw
         WD0mjLGx3sk2+7svTqQVadjNo4Ltd/yBRmTxBuJA8IKHDxffqGDDqce/L6zcgCJ41rPn
         MdqFFvbLTlvllq3HI0miBRHO65BWb2v68j8KYIdlAs23q6jc31uIQHNwXWBTN9GM7Fr6
         kEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYoDIUptst0E+KjUwu6PB1rGpMPGOv6ZnwUPXHi8Jk1a1shizJzO+QzDb9Pxvi+z1bue86uJZUvbH6VnbVW28@lists.infradead.org
X-Gm-Message-State: AOJu0YzuCgA4Kydn40iRNU+jbRKXLCWFA7LPG0Qmm3IvE9Oy4snOP2zw
	5VEcrR6+N/emdGp670y+bS+EGF+lroffQzsAUWjJRliFWZSrrd8RPE0H60C3yBHb8JI=
X-Gm-Gg: ATEYQzxifvHzVQm6s6zTVIRB0b6y7Eggu0qUANKojwW3vgXXl2WEZTgvy6ucMSeGMXk
	PsqvGIRjxWXCNWA7ggk8URfb+dFV6Z+L1VnM5eAJaGVfzNBX+bKqJPEBJkNhk3R9Vi6Nm5w5NKm
	3akiAk5/5BBoc7DUdsjKyc8XaSpU3blbEPre/8d7XhLPCK6C2SRnCQ+9M0rO6w2y3NXs00Dd6tG
	NXkkICYYhq9Gi0HUuHrgVsuM/jBxP8gTqFbEkwBOOfFyLDflZREdMvrz/aN4qNs2P3EqDSBqD53
	z1V5s2OCiVOIZ8gLzuSnBEYDtVyOwytcWs2Iirn+trIc/Rk8j5ETRyGyPcvCdr72trfgoqp1q8H
	NlvrejG/KZzcVk7iXQjSCx+DkmfG4BGZ5lhM69McTKcsjzHWqvJ3ytKeDT/2qZ1/3qCZgCtgXJQ
	FNt6EjkvOcWXSIg7+Q51MZrnXCe6/N
X-Received: by 2002:a05:6214:27cb:b0:89c:ca30:6b92 with SMTP id 6a1803df08f44-89ce8f8d2fcmr240762806d6.56.1774968846090;
        Tue, 31 Mar 2026 07:54:06 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb14bsm89054306d6.1.2026.03.31.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:54:05 -0700 (PDT)
Message-ID: <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 31 Mar 2026 10:54:03 -0400
In-Reply-To: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
	 <20260331072347.253-2-ming.qian@oss.nxp.com>
	 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-L4QS/jCTQxYv029Nq/FW"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_075408_398068_F0FBC8DD 
X-CRM114-Status: GOOD (  22.25  )
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


--=-L4QS/jCTQxYv029Nq/FW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 31 mars 2026 =C3=A0 10:33 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> > applications to query the total amount of memory currently used
> > by a device instance.
> >=20
> > This control reports the memory consumption in bytes, including
> > internal buffers, intermediate processing data, and other
> > driver-managed allocations. Applications can use this information
> > for debugging, resource monitoring, or making informed decisions
> > about buffer allocation strategies.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
>=20
> Not sure why not export these information by debugfs, or any benefit vs
> debugfs?

There is also a on-going proposal that uses fdinfo.

Nicolas

>=20
> Generanlly document should be first patch, then driver change.
>=20
> Frank
>=20
> > =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
> > =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 +++-
> > =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 551426c4cd01..053db78ff661 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > =C2=A0	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
> > =C2=A0	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> > =C2=A0	case V4L2_CID_COLORFX_RGB:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Color Effects, RGB";
> > +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
> >=20
> > =C2=A0	/*
> > =C2=A0	 * Codec controls
> > @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> > =C2=A0		*min =3D 0;
> > =C2=A0		*max =3D 0xffff;
> > =C2=A0		break;
> > +	case V4L2_CID_MEMORY_USAGE:
> > +		*type =3D V4L2_CTRL_TYPE_INTEGER64;
> > +		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +		*min =3D 0;
> > +		*max =3D S64_MAX;
> > +		*step =3D 1;
> > +		break;
> > =C2=A0	case V4L2_CID_FLASH_FAULT:
> > =C2=A0	case V4L2_CID_JPEG_ACTIVE_MARKER:
> > =C2=A0	case V4L2_CID_3A_LOCK:
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 68dd0c4e47b2..02c6f960d38e 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -110,8 +110,10 @@ enum v4l2_colorfx {
> > =C2=A0#define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
> > =C2=A0#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
> >=20
> > +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
> > +
> > =C2=A0/* last CID + 1 */
> > -#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > +#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+45)
> >=20
> > =C2=A0/* USER-class private control IDs */
> >=20
> > --
> > 2.53.0
> >=20

--=-L4QS/jCTQxYv029Nq/FW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacvgCwAKCRDZQZRRKWBy
9HhiAP9pxmgO01Tw2u1jmX3JDGf0HUlwoJFHITjsspschCXhGwEA2CLSZfwaGF3P
FBjvjpv8iG0M2472UaZ+ET35dRy4DwA=
=NB0B
-----END PGP SIGNATURE-----

--=-L4QS/jCTQxYv029Nq/FW--

