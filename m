Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B13CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVrp19hgKD6fn901dtJIwIEFWrRkipQPPUAVv1GRELc=; b=N+kJRmisuGMAatmsBCB0d/nMXj
	SHRBRSs75VfgtewNK4C3BzrZKu0e3S6pYlh2RQNAd9XtmoJIYqP6wfBi7QdAEsLbOR6AWscbTO057
	E/dtmiSGlpWJcCVylyRDfS/ct0wUZgQnNKAyYbkLYYecXYLT7oMShQ7EmQ9zqDZbFhW/hjw6VdQPv
	/hYEDSKChlxe7b0b9N1h3Z8Ij7MLi4M16Ao/tF+c5flaLg2SDln0sHQB7nf2En/7aoW2LVbN9IlnS
	Ohi8GlIkOQixitgX+SSwAywewprvcxUofpJchsafb46+uAlkxXu+0kSgtOvlSL0BG6gvD8/9mtgLG
	Pns9oKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPMW-0000000065j-1BAI;
	Fri, 07 Nov 2025 16:30:56 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPMS-00000000651-3RKD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:30:54 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8b1f2fbaed7so92587685a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762533051; x=1763137851; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AVrp19hgKD6fn901dtJIwIEFWrRkipQPPUAVv1GRELc=;
        b=Mp1kMw9PuSXLBTozW+ZFvtz947SMqIbkOBtLNm2/V1dZF/NVhAY8PrXnB1uRX/TPo2
         PCWa3IIOzQOXjUxwH39fENRHXTXdKYSwAavovMY5w+AtjqgwEYXhi+d/uB07yYzp9xJv
         SLoXUwbyLz1U5gFkTInZGgnnVKMdAiwsF9rF64V/P2mHqs7orZ9q3TY8kruNkLrL8dyJ
         zXV8bjiwiUE7NS455mOa8kDRqKuLptN9opylGxE/QxvG0/upFIY9WCyVlbVr39MT0q4l
         ioProjQxSbceMUOfwlsraT9cchpNIeof6PWwMORYOp5MuPj0sIqlNvJrZVQdNHJKMyAN
         6W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762533051; x=1763137851;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AVrp19hgKD6fn901dtJIwIEFWrRkipQPPUAVv1GRELc=;
        b=moXI8xgtSL701UB5AjslP0Vzr45ZrWAw9n4i0RWXnaE36pcHiTSraqhN6iGJONHsX9
         8fZXOSCv9z0ExJW2D8HHloP8hwHrHc8csRnyh6JZuUc+/MyW+QiuBHWl8km3Q9nkm7SR
         a6gFzlVHLvfbPPrGE8G8LzR79Y5IB1m71rRES5QTQtNzDvnRSnbptwWlMgLsPDRUy34J
         gq8FoNWm4M168u+KCInPaY1FoNSGQanrPJUppyslFc45MvHUbUbJS+z9CSVDCdE/7CtH
         p+BOFPgbRj05JsJx1Oe9/8wLHyTYGRbjlljhkF5ZbNk9m0SF1ZKZwfTvm12uQhCCpeek
         9AMA==
X-Forwarded-Encrypted: i=1; AJvYcCWdc7r59fPYzoTEz00+OOKjdTnpZYbgWSoUG9BLELs/fPGYk/pG1GK6TDRnS9zrgOZ5FHFxAGcS43+K4YezjkJi@lists.infradead.org
X-Gm-Message-State: AOJu0YxeivnpJGIzgT7kO1ykMGNXAqvW/dzKD3X5n8PT3y04IpyLs7uk
	wxBr1oJzP29aoF5NzKEwfuUa6OmouEuyRijna+xulngcyKh6uEPzwqVOYb7OWk+eUMg=
X-Gm-Gg: ASbGnctWGRy9Vr4/bFCn1LidVZJ39icLhFAuVyzrwxIuexf7twQ4WdZTSSxSXeKECxu
	jT0z9fAMZVDlLUfnd1mIRXNU8D9Iw47qaVtA4PXaX+64NRb1I1Yzt9KBtdRQP5sQy8nSL0pEr8f
	EDXIy/QPcPwIHonpOove20LH9jC1+V1etbw2E2KrX0cnrZH77IBakzFE6DAu+2/rss3POwEIhGe
	BQiLr8nAaoXPg5Q0eAKZHKJpyPP3qFKToyn821CQVCU8cM612s+8lEElr9dGentYRWdSjEhjmuz
	hn9MPoFMecgvs85ML+lSsXk2CPIPX0VJ95v46AtjBFQuvHu8Ej0QAVb5uF1GiwW9JDLnytnHRyb
	nUkQC1Zzo4uT0/m2d2lZoqobzZpjQ3IQZjlSdCBhPhcWXFAnfo2kZPij7Naa+emGg6rm4IrVTGH
	Ukl8hGhw==
X-Google-Smtp-Source: AGHT+IFz/UlnV0OMfhq87mlorD8XvK8vi/cdNG2hzp5O044mKb/ma/Fx+Ie3hyppzhpm+e9TfHmw3g==
X-Received: by 2002:a05:620a:1a23:b0:89e:72fa:ba8b with SMTP id af79cd13be357-8b24529f1f3mr550636985a.34.1762533051280;
        Fri, 07 Nov 2025 08:30:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b23580b649sm435035985a.48.2025.11.07.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:30:50 -0800 (PST)
Message-ID: <e99ff4f12d52eee03075f911e6b904290b47a961.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/5] media: ioctl: Add pixel formats NV12MT_COL128
 and NV12MT_10_COL128
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 07 Nov 2025 11:30:48 -0500
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
	 <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Q5o4lQgKYevCwoTHFi6w"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_083052_963215_D4F6A85A 
X-CRM114-Status: GOOD (  17.05  )
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


--=-Q5o4lQgKYevCwoTHFi6w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

sorry for the long delay.

Le mardi 01 juillet 2025 =C3=A0 17:01 +0100, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 4 ++++
> =C2=A02 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 650dc1956f73..3bdcbb12bb30 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1381,7 +1381,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0	case V4L2_PIX_FMT_NV16M:	descr =3D "Y/UV 4:2:2 (N-C)"; break;
> =C2=A0	case V4L2_PIX_FMT_NV61M:	descr =3D "Y/VU 4:2:2 (N-C)"; break;
> =C2=A0	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; =
break;
> +	case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols)"; =
break;
> =C2=A0	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (16x16 MB, N=
-C)"; break;
> +	case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (128=
b cols)"; break;
> =C2=A0	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N-C)"; brea=
k;
> =C2=A0	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (N-C)"; bre=
ak;
> =C2=A0	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (N-C)"; bre=
ak;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 9e3b366d5fc7..f0934d647d75 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -697,6 +697,10 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /=
* 12=C2=A0 Y/CbCr 4:2:0 16x16 tiles */
> =C2=A0#define V4L2_PIX_FMT_NV12M_8L128=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2=
_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
> =C2=A0#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1',=
 '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12=
=C2=A0 Y/CbCr 4:2:0 128 pixel wide column */
> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
> +			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pix=
el wide column */
> +

Nothing to report here, it looks good. I can't remember, was there a reason=
 not
to add this format to ./drivers/media/v4l2-core/v4l2-common.c ?

Nicolas

> =C2=A0
> =C2=A0/* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.ht=
m=C2=A0*/
> =C2=A0#define V4L2_PIX_FMT_SBGGR8=C2=A0 v4l2_fourcc('B', 'A', '8', '1') /=
*=C2=A0 8=C2=A0 BGBG.. GRGR.. */

--=-Q5o4lQgKYevCwoTHFi6w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQ4euAAKCRDZQZRRKWBy
9LGvAQCRyeU868ClTZ8TOWAm+66FB54e7PZmn1fgF9EQ0WmVqgD+OzrEF4eJkgtd
36v1rz7DSr3XtmcoiIfkHMDBuatl4wA=
=KmUC
-----END PGP SIGNATURE-----

--=-Q5o4lQgKYevCwoTHFi6w--

