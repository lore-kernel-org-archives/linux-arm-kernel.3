Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FC4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=; b=TFEoiUxeIOP2gPSIPQh9dfjBFu
	C3JKPaBWkxRc86m/af6+8v13Vggr/KDXfnwB0o9egCj9lFz7xH/o1s7hW3cv4mJ6816g58f48H2gz
	YHsD5+R1SO1mycTt17hW7Uz5VwaPaXF5SWrF2Ji/9qHa1DUzvtPRerfRCIKeCOHtWx+1JIaeu5OZ7
	fr3ziFAhQKehMTkL221eN3dGslRI+4X3B1UGuUhWYySki1xe4okr3ySiLQMgPyaKq7N6O89T3MwhA
	5zP0TNDLxrsZiapX86Zf91MfLbT18FQ1ha1gRoYqNKa6V72/ODGzkvoJn46ItLSIQpIzAw+Q9oqN8
	2Y+C2hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3JSe-0000000Efgz-3A3W;
	Fri, 11 Apr 2025 18:50:44 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3JPo-0000000EfNj-2fJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 18:47:50 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5b2472969so237197785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744397267; x=1745002067; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=TvxSdG0DRAhQj+dirzIZZvIahosL2weANunZ1bA1tXnrJhLx+f9mNW7gGbyACgL7Cw
         CzXEVKxIM0qJ1AtFQVmij0UBxeACW2nCeG5Qud0WUp/qRU72DYW7TE3rDqwBYLCSaxCK
         YN9h29clRMBQqzxbGlpugGLUsAUVFP3QADIe/ung/5+jTeRD1TO5JvCkxX0ehcBsaLpe
         cCpQlhhU00DHCzPY1PikqZ6FewJY6x0I1cL8z8teAvZKgVSjD51hh/hVReDAUwSbOzH1
         KjbIS3KbhkB/+wlwQUgSYzTey1oQ9I6ZF+uPefuEl7v1Sw0riqFxl/KMyFzIVQJqY1+O
         CLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397267; x=1745002067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=mS/omn63c5qDIZSuZHTLGhsRWGUZYnv0L/uw3y1bGeNb7sEVaOatibX14pXy3MUSkd
         zTpshZjmUg8QcCOpiD4cHYofTFnDay4R2YYkR+YPw7OjKcGtFzj4ZWlKrwMSMcmOGsG7
         KqqclALhagXcRd4m6fmgvWRTFoXnJtVbc+Do++YYavebe+V0b3J2WvkEZCYEDsDuZrsy
         0wQ7hGXgGAE2pftvho+dNUb85E0TyzzBtstlEXstJMSdTgJfMimzQaTCzTDwJJ/CwxtJ
         y/sSIUIGxRBvjAt/78BIDNJDg8Bu6WZoydSqma8hphCi1iVA7kvqNHUpy/uBB/MTRFU/
         CQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO0p0h+K99YF/v/h2oknFqkkUDNpGX/uhotMvq6nRpj4gLeHq8/inBLK+1/ZKttyfHjBOvloIHhzL3t2WVN5cH@lists.infradead.org
X-Gm-Message-State: AOJu0YyddK75WWLZnbzd+S9K1SiS2KHxIjdQgNge7NsfRaLmEhBA2BqA
	mflPs3PYuT9sbWknURly3lJjgM3FcfUIHgRWlF1sbWFBaY078lLQX9uIZO89i1o=
X-Gm-Gg: ASbGncsUAjBF7u8fDFSQSGaLHx+qq3A3QCY36AWfG1XDp3x15ACLPydTf/IGZWL4KmC
	c/YF7YRbEmJe2XzxiXgrnMBTATAiJja0vG4k7k6uvFV6OjQZVNRSud2kDBU1fNd3NrSZfBzEser
	zVazH89y6YOEM2GxAnTGXTNL+HV1xArqRRSq8E5X2Sus0PB7yKCsYUEYEkGJAAcaJKKMy9t6C+e
	jz2Fg5UlO8XUouG55pauACrVm1sHflyXq8QozP9CQ5Z240dJDRLtrBwaeekwb17GA/KdaRS/eBa
	Q9jNTnq5SsHPLGosW4As5jQVINxk981wGTn+4UpicxdDNQ==
X-Google-Smtp-Source: AGHT+IFtKnV9+w0FwXGSzvq+4jUfFCuVoEptoZcv67KhNBh18LEdtioKg5wo6qZbIxlKb9n37yn5ZQ==
X-Received: by 2002:a05:620a:17a9:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c7af1328a8mr627352285a.22.1744397266859;
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951969sm298592885a.45.2025.04.11.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Message-ID: <588eb09a61dea0c07e02c8b474972c6ca9b3b3e8.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 mirela.rabulea@oss.nxp.com, 	shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, 	festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, 	imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 11 Apr 2025 14:47:44 -0400
In-Reply-To: <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
	 <20250411074347.809-2-ming.qian@oss.nxp.com>
	 <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_114748_674225_45E53BFD 
X-CRM114-Status: GOOD (  18.36  )
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

Le vendredi 11 avril 2025 =C3=A0 10:36 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Fri, Apr 11, 2025 at 03:43:40PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data(=
)
> > allowing to call that function during allocation failures.
> > No functional changes are made.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> > =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 46=
 +++++++++++--------
> > =C2=A01 file changed, 26 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/m=
edia/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index 0e6ee997284b..b2f7e9ad1885 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_=
data *slot_data)
> > =C2=A0	return -1;
> > =C2=A0}
> >=20
> > +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > +{
> > +	/* free descriptor for decoding/encoding phase */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.desc,
> > +			=C2=A0 jpeg->slot_data.desc_handle);
> > +	jpeg->slot_data.desc =3D NULL;
> > +	jpeg->slot_data.desc_handle =3D 0;
>=20
> You add above two lines, it is not simple move function. Move above two
> line change to next patch.

What about just making this its own commit, give you the chance to
write down that your making that function safe to be called multiple
times ?

Nicolas

>=20
> Frank
>=20
> > +
> > +	/* free descriptor for encoder configuration phase / decoder DHT */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.cfg_desc,
> > +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > +	jpeg->slot_data.cfg_desc_handle =3D 0;
> > +	jpeg->slot_data.cfg_desc =3D NULL;
>=20
> The same here.
>=20
> > +
> > +	/* free configuration stream */
> > +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> > +	jpeg->slot_data.cfg_stream_handle =3D 0;
>=20
> The same here.
>=20
> > +
> > +	jpeg->slot_data.used =3D false;
> > +}
> > +
> > =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> > =C2=A0{
> > =C2=A0	struct mxc_jpeg_desc *desc;
> > @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jp=
eg_dev *jpeg)
> > =C2=A0	return false;
> > =C2=A0}
> >=20
> > -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > -{
> > -	/* free descriptor for decoding/encoding phase */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.desc,
> > -			=C2=A0 jpeg->slot_data.desc_handle);
> > -
> > -	/* free descriptor for encoder configuration phase / decoder DHT */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.cfg_desc,
> > -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > -
> > -	/* free configuration stream */
> > -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > -
> > -	jpeg->slot_data.used =3D false;
> > -}
> > -
> > =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ct=
x *ctx,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*src_buf,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*dst_buf)
> > --
> > 2.43.0-rc1
> >=20

