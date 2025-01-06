Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F678E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giG6Xr6qKpnwxFJ2rgydlTUajc1DsU8QvRnJMssmFGk=; b=FyJAQ2tRqcURWe4RXejnvB0i2q
	Qey6M+H33eWTHSJhuNAj8CdmEcecgmUC8GZ8VriN+lM32txIpeaoIZhgcNZFsFuZlCVycb5N6E85N
	foIu+2xwYZHhgSdf9h9oQoJ/pCkzEo7OxOLO6cUlWMfREbXG8AFwHsfPUDPKYPv5L9Kg4FxjIQpCk
	6bckAFiAqpvrQ9WuLXTxJV+SK228HjdiACRPynCb2Eyr+q5bdmhfcXZqJXy3zI2HVXRjLYX8UuOnT
	wdGip7oeV5Rbi8YS7O3iS3tHp6WhNjH1OHVo1+qQpS6KYDtEvrZDtvHnVjzJ2rGik5ClfdO6wj7Hl
	5Nz1UtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu9v-00000002f48-48aZ;
	Mon, 06 Jan 2025 20:57:11 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu5a-00000002e5w-3h4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:52:44 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d92cd1e811so134526256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736196761; x=1736801561; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=giG6Xr6qKpnwxFJ2rgydlTUajc1DsU8QvRnJMssmFGk=;
        b=GROd7M1Z4KrF0e72/99D7pCvAeZC9CeH3pZ/pVap3NFvL8pxinSwFQmbGut3u7yNcX
         KQ4PCkk12MquHt2tNLVRccFQ6tUHz9BsBivbL2GbNQoJpZH66rDsfZHR2lXxvgDxAeku
         XjJj0FO7nSVcCMP6M2efh0NVoyby/2dTjYhKK9w4cYPx3jviB2JjRf300Y1iO0JgbT8U
         U6fkeGUygDnPcIxApKT82hlz1KOfxX3Dkd3oQHs4nPJ/oqUQsnSNldo7c3fNUADanCzr
         IYOqAI8kDfXO7MSM/foPHo8kIRqMFIkMH9fSQ3fJxxijKigc0W50bN7eJnAASNYoAZ2m
         zd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196761; x=1736801561;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giG6Xr6qKpnwxFJ2rgydlTUajc1DsU8QvRnJMssmFGk=;
        b=ZRZHRDLDtEJXAX16rHvyyNWPYvtsQ6q8YFXzMAFBf2l2i2furV3NWnMqZF8PRpCP5i
         nAQGo0p0vNyFBdCQFxueCKrBHSbDTmOArgw9vAJV4OQ3s8YVLkApafIukFtgKFjRqLi0
         iL5MyR/k+3Yb7FnMz84UH/AWBiw3gmfj+kGar0VsjlOgZI1Wgk4RJf4OHINn/YpVGKEa
         cjrlNAHx3EPNkpfL+mGqA/Ys6oFVtwIg26jkJA9didH+gopdYgk9sEEUea1tJzEZUHP1
         WrFDco+YR0fdfX6AmbWsoMkXpiuMo/D29uxOmh3rGr/PwhLh4qs+qaj/NFsjpwtH8EEV
         BNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXleoZBrlLSyTfpXpXwQXg82ET+ZWy8NInJ/FVHxMZiyknCUXNu1zDmXJzowDR8Gu8ZmfXK8e4QuT1eHdolLF3F@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8DKN3qhYng4+/urozwKxLnoXSWU913CK4oyOgLrYsfGRakM+
	Ii7J6yoXZySBSvT0kk9pk7e5TVr6GfvyK8Yzzd0FgsaHq6MXuFwDWYrHgTihfoU=
X-Gm-Gg: ASbGncszITr8s7man/oHj13iWC3DgNPaJIX6IX3R993xicyKmkxegkqy1E1TRHKmoSl
	XvndbVDUcX23o26klqbFAuhzNzAOR8JLfo5yeDwok8Pph04mzZ1aV2gN75OAO+LltlXVS8O/5/j
	i7fT/w8X11+4vWXZMPVoyHxGA+mVZKPFlK8mJmq7r3l2M14FK2bJmSHltLihrcRoblzC5rujZD2
	NHAKfvdJSVlyk970TA+f6RuWsS7FQ5nvxA6ez/Buk6SXbDnKz/30LOoKg==
X-Google-Smtp-Source: AGHT+IEIInkPocHyFdCklKrx/YmrGw+uUM4krY58O8WCdt8yNm1sL3igRegISVWjyVZhUSTTP71cpw==
X-Received: by 2002:a05:6214:3b8a:b0:6d8:8a0b:db25 with SMTP id 6a1803df08f44-6df8e8be44bmr11681446d6.21.1736196761471;
        Mon, 06 Jan 2025 12:52:41 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d5aabsm174516886d6.108.2025.01.06.12.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:52:41 -0800 (PST)
Message-ID: <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Robert Mader
	 <robert.mader@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jan 2025 15:52:40 -0500
In-Reply-To: <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
	 <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
	 <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125242_929289_D05635E3 
X-CRM114-Status: GOOD (  27.10  )
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

Le jeudi 02 janvier 2025 =C3=A0 12:52 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Hi Robert
>=20
> Resending this reply as replying from my phone before the Christmas
> break sent it as HTML :-(
>=20
> On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com> w=
rote:
> >=20
> > Hi, thanks for the patch.
> >=20
> > On 20.12.24 17:21, Dave Stevenson wrote:
> >=20
> > Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> > to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >  include/uapi/linux/videodev2.h       | 5 +++++
> >  2 files changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 0304daa8471d..e510e375a871 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >   case V4L2_PIX_FMT_NV16M: descr =3D "Y/UV 4:2:2 (N-C)"; break;
> >   case V4L2_PIX_FMT_NV61M: descr =3D "Y/VU 4:2:2 (N-C)"; break;
> >   case V4L2_PIX_FMT_NV12MT: descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; bre=
ak;
> > + case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols)"=
; break;
> >   case V4L2_PIX_FMT_NV12MT_16X16: descr =3D "Y/UV 4:2:0 (16x16 MB, N-C)=
"; break;
> > + case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (1=
28b cols)"; break;
> >   case V4L2_PIX_FMT_P012M: descr =3D "12-bit Y/UV 4:2:0 (N-C)"; break;
> >   case V4L2_PIX_FMT_YUV420M: descr =3D "Planar YUV 4:2:0 (N-C)"; break;
> >   case V4L2_PIX_FMT_YVU420M: descr =3D "Planar YVU 4:2:0 (N-C)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index e7c4dce39007..f8f97aa6a616 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -687,6 +687,11 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 1=
2  Y/CbCr 4:2:0 16x16 tiles */
> >  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') =
/* Y/CbCr 4:2:0 8x128 tiles */
> >  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2=
') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* =
12  Y/CbCr 4:2:0 128 pixel wide column */
> > +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
> >=20
> > Should these be upper-case Cs instead? So they compatible with the prev=
iously used downstream values?
>=20
> No, this is deliberate.
>=20
> Downstream was using a single planar format, with extra complexity for
> determining the chroma offset per column, and weird handling required
> on bytesperline.
> Having had discussions, switching to a multiplanar format (hence MT in
> the name) removes those complexities and means we don't need to do
> anything weird in the v4l2 format definitions.
>=20
> Reusing NC12 and NC30 fourccs will give us grief over backwards
> compatibility, hence lower case for the new version.
>=20
> I have a patch on [1] that adds back in NC12 and NC30 for downstream
> just so we don't break existing users, but see no point in upstreaming
> that.

Yes, I think its fair to avoid incompatibility there. Are there matching Me=
sa
patches coming, since without that we are back to square one, where the for=
mat
remains unusable. NC12 have a matching (mainline) DRM_FORMAT_NV12=20
DRM_FORMAT_MOD_BROADCOM_SAND128 pair. I believe a new modifier is needed an=
d
will serve both Nc12/30.

Nicolas

>=20
> > P.S.: Coincidentally Gstreamer just landed support for NC12 in https://=
gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and there =
is also a link to experimental NC30 patches. So happy to see this series ap=
pear upstream :)
>=20
> Ooh, nice. I'll give it a test when I'm back in the office.
>=20
> Dave
>=20
> [1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/
>=20
> > + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> > + * a 128 bytes / 96 pixel wide column */
> > +
> >=20
> >  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm *=
/
> >  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BG=
BG.. GRGR.. */
> >=20
>=20


