Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A0810FC443
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYisYVKIgGGZp3/zTu7AGT0ZWouISUGwxKducl0azG8=; b=o1vXC12L48zUC/8Jpe7735isED
	g4lE/Ll7AY+F2K5CbluvkPePjnhjxXvbN5BVP5XHVXTG2sNQQRt9Se7ubWWZu8xwCdIVYBtZ2VOf5
	Aq6FcpQ4D0nCs2252KdosuE0FCC9WPS2gaJfv1+WW3wgvk6LTlM25FGEmjHBNf1VgrC/KpvF49b4G
	/kTPjdgOeRj8SL3CEtsqC1WZjnKz6n+F+KudK9aDQBikINw9gW0pMt2seYgIepcSyiDqcgnL7TB6z
	/uO3DfJMkKXUXA9lbiaY27yQspOstFQlKQT4gYjpB8hn2I6h+p4FngYx1OeILD6CQgKm1K9Wwvr5x
	dmRn5rkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaBi-00000009Q6m-2UsV;
	Wed, 08 Apr 2026 21:11:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaBf-00000009Q66-28q7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 21:11:48 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-50bbc41677dso2872171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775682706; x=1776287506; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TYisYVKIgGGZp3/zTu7AGT0ZWouISUGwxKducl0azG8=;
        b=iCS0dprN4sne6LSRLjVlZrsmhaxVbae1NXKHzeTdC9YpIXZtslmP5ENtiB/iwzRNqt
         Ly8K55TTASHYDPTj+Q81qQnrRi03dgrI/u67Zv5zR9bwWUOaB0f+NCQXluf3r7gk/MKp
         vA77IEiHd4TeCT5QLJbyD7FR+JAN8ixKdWVegCH5ahngBGvtwIg+pFY1Q4MGFhULch5s
         18CyZ0Y8s2duuYae0d09CD0lHIGEA1eFTmYiE+ld0VJF3SHVcxrWYcl9OSrusWgwZjiF
         aKOaBI0f1nQYIEomMFFRHTy16AEt03XxXUaZi3IQ8J4iJtp2EcoO7HyztXIFwSG+7yqe
         T+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775682706; x=1776287506;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYisYVKIgGGZp3/zTu7AGT0ZWouISUGwxKducl0azG8=;
        b=Z5J1NfWw+IHNnPObPRCDo0pXnoGxl6y/OKBmk1WfugBFpQmGBJQuO7YIt0Y3+37MOn
         hsTEoluKqR5/uo/Cue3JWV9zoXehEeTIkmriz5va4YxOydR8Cx+tNk/3jkVDncdxUPG/
         6eIigHR5+eGCjNlBgTMuvt0I4uyX5z5+GBSwu/ivgIjB2fE9YHKkwbfEB4fUlK7mWoqo
         z6BqkZLej/PTmnUTGsPdSm0KxI1AXdo2NfgHOQbZ0NkPZVbRnJO9N4k4Nf7X9xg6K3v9
         Pm1FtEO1lkWXsBebdaTxFVA7DwSHOYzKdOGWLxTa0TRHpwL8QXvrekN1Po7QoOfsySsr
         hMHw==
X-Forwarded-Encrypted: i=1; AJvYcCXmsbcF/Vmb6YCib74kYg19zXwmfC2r6KB2vD1NW5tEWtDB5YANtfGdIXVsb+dBhJOHMrHfd2lYMWGl1ODikNLi@lists.infradead.org
X-Gm-Message-State: AOJu0YwTrqKrbmQ5vX7q8UHfKU6azcNKBGtlX2AtbUb7LlS/sc/VxjrZ
	Nv4aJjpj6cQ6iF0I2Aqsp/xZ4G1eGSE8nHkEHFR7vq36PE1G9Rpa+RMJag558nVi+7E=
X-Gm-Gg: AeBDiev/Daq6FZkPPC8Qu6hOe4CprPdYq2sjWPIkKjl7M5qRul8tAolgx9jHjo9mSrk
	Qvb8cRvsVdQqpauuioC5170So9zefcgquBqiRqSV3KQDB+mThaSYgKADuYa07uqDENdA+diBAgv
	X3G9m2gtDfV+pC4D6/c5RE+Qs6ujOunqpdBXyJVmy0cgKFD+WNo88Wgl35r0nGUCeHYTI/iseA1
	AOVJv+E1gAU3BK0HoYi8KqcoYqR6VLp80biBS5rV1e2rVKShBu7PkK96Rd6QkRCVCnXMQy4p0bY
	GBU7a3JGc0Qwt5xOhNJPZfWh0OwzqlCgjmbCnZF40zXvoG10c1g5yKBU6rWZ5DSWXljkhtKrQCU
	7k1Yg+y7SN3P3vbr9FIaqLhdDrSJwvhZZ8i2lAqUuJjLFU/zydUjQgvlSA5QHh50DnwWm4Lgl7K
	0RPBWJHn2VATgFHzhwFy/aKlum+1BzlBZnJOklWVo=
X-Received: by 2002:a05:622a:5a9a:b0:50d:7135:5631 with SMTP id d75a77b69052e-50dc21086b5mr14502351cf.6.1775682706003;
        Wed, 08 Apr 2026 14:11:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b885b69sm170660741cf.22.2026.04.08.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:11:45 -0700 (PDT)
Message-ID: <8911674f2f86a4b75e1f44d6e9b66a28f6e74e56.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Apr 2026 17:11:44 -0400
In-Reply-To: <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
	 <20260331072347.253-2-ming.qian@oss.nxp.com>
	 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
	 <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
	 <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
	 <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-GjVrQf050XDh72y8B2Co"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_141147_572964_AC74F8A5 
X-CRM114-Status: GOOD (  36.49  )
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


--=-GjVrQf050XDh72y8B2Co
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 11:14 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 4/1/2026 10:23 AM, Ming Qian(OSS) wrote:
> > Hi Nicolas,
> >=20
> > On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
> > > Le mardi 31 mars 2026 =C3=A0 10:33 -0400, Frank Li a =C3=A9crit :
> > > > On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com=C2=
=A0wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >=20
> > > > > Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> > > > > applications to query the total amount of memory currently used
> > > > > by a device instance.
> > > > >=20
> > > > > This control reports the memory consumption in bytes, including
> > > > > internal buffers, intermediate processing data, and other
> > > > > driver-managed allocations. Applications can use this information
> > > > > for debugging, resource monitoring, or making informed decisions
> > > > > about buffer allocation strategies.
> > > > >=20
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > >=20
> > > > Not sure why not export these information by debugfs, or any benefi=
t vs
> > > > debugfs?
> > >=20
> > > There is also a on-going proposal that uses fdinfo.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > Thanks for the reminder about the ongoing fdinfo proposal.
> >=20
> > Just to confirm, you are referring to Detlev=E2=80=99s ongoing fdinfo p=
roposal,
> > specifically this series:
> > https://lore.kernel.org/lkml/20260212162328.192217-1-=20
> > detlev.casanova@collabora.com/
> >=20
> > I will align my work with it and switch to using fdinfo.
> > Once the show_fdinfo support from that series is merged, I will prepare
> > the next revision of my patch accordingly.
> >=20
> > Regards,
> > Ming
> >=20
>=20
> Regarding the discussion about using fdinfo instead of a V4L2 control, I
> have two questions:
>=20
> 	1. Key consistency in fdinfo
> 	fdinfo uses key=E2=80=93value pairs, which is flexible, but if multiple
> 	drivers want to expose the same =E2=80=9Cmemory usage=E2=80=9D informati=
on,
> 	they need to agree on a common key name and meaning. Otherwise
> 	user=E2=80=91space must handle each driver differently. A V4L2 control
> 	naturally provides a unified interface without this coordination
> 	effort.
>=20
>=20
> 	2. Lack of notification in fdinfo
> 	With a control, user=E2=80=91space can subscribe to control events and
> 	receive notifications when the memory usage changes. fdinfo does
> 	not have a built=E2=80=91in event mechanism, so users must either poll
> 	or rely on additional eventfd=E2=80=91like or custom event mechanisms.
>=20
> Do you have any suggestions or existing practices to address these two
> issues when using fdinfo?
>=20
> Thanks again for your time and comments.

Added Detlev in CC. You can also refer to his work through:

https://lore.kernel.org/all/20260212162328.192217-1-detlev.casanova@collabo=
ra.com/

Nicolas

>=20
> Regards,
> Ming
>=20
> > > >=20
> > > > Generanlly document should be first patch, then driver change.
> > > >=20
> > > > Frank
> > > >=20
> > > > > =C2=A0 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
> > > > > =C2=A0 include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 4 +++-
> > > > > =C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/=
=20
> > > > > media/v4l2-core/v4l2-ctrls-defs.c
> > > > > index 551426c4cd01..053db78ff661 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > > @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_ALPHA_COMPONENT:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Alpha Component";
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_COLORFX_CBCR:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Color Effects, CbCr";
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_COLORFX_RGB:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn "Color Effects,=20
> > > > > RGB";
> > > > > +=C2=A0=C2=A0=C2=A0 case V4L2_CID_MEMORY_USAGE:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return "Memory Usage";
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Codec controls
> > > > > @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char=20
> > > > > **name, enum v4l2_ctrl_type *type,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *min =3D 0=
;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *max =3D 0=
xffff;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0 case V4L2_CID_MEMORY_USAGE:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *type =3D V4L2_CTRL_T=
YPE_INTEGER64;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *flags |=3D V4L2_CTRL=
_FLAG_READ_ONLY;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *min =3D 0;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *max =3D S64_MAX;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *step =3D 1;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_FLASH_FAULT:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_JPEG_ACTIVE_MARKER:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_CID_3A_LOCK:
> > > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/=
=20
> > > > > linux/v4l2-controls.h
> > > > > index 68dd0c4e47b2..02c6f960d38e 100644
> > > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > > @@ -110,8 +110,10 @@ enum v4l2_colorfx {
> > > > > =C2=A0 #define V4L2_CID_COLORFX_CBCR=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+42)
> > > > > =C2=A0 #define V4L2_CID_COLORFX_RGB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+43)
> > > > >=20
> > > > > +#define V4L2_CID_MEMORY_USAGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > > > > +
> > > > > =C2=A0 /* last CID + 1 */
> > > > > -#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > > > > +#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+45)
> > > > >=20
> > > > > =C2=A0 /* USER-class private control IDs */
> > > > >=20
> > > > > --=20
> > > > > 2.53.0
> > > > >=20
> >=20

--=-GjVrQf050XDh72y8B2Co
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadbEkAAKCRDZQZRRKWBy
9IqwAP4yeegqeo+AHSiM1jVlhyqY9eqH63qFPvFTBJmnvaPAbwEA5Z5akB+DPZtG
ORNAuAa1vDoUmjl3VtozF6mFzAZBxgM=
=Xjjv
-----END PGP SIGNATURE-----

--=-GjVrQf050XDh72y8B2Co--

