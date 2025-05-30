Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A4C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=; b=3pdpq7l/4/wGx3TNoBsnw7Er8W
	oBzBoxqf5UHnXbaG8fS1EEoc03IVxE/XnZFwCk7e+i6SnZcWVaydm3s8Pkw5XTNq+gWAxOT+P0CKP
	VfLdYUGoj/8PxV/3aReNUkpvGeyCvOptt1uRAsULcuXpACeJ5dBgErNpKS/Fxc5RWpt+vAJffuxgS
	n0aRddZhf6IT2KRsKpFDE+M8Mo3lrpw3djS7tHMkHiMFdNvirieItZW2sMqG67nVCXyR267qxYVjZ
	VEP6/hFi9Wf2OzzbB9/t/lALvnwMgRFourwVxJALf6QNncdd830CdA8j9FQVa1ho7uIWpNY9MysGF
	B0eVnr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3hl-00000001QGc-1qXo;
	Fri, 30 May 2025 17:39:41 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3cV-00000001Pfa-0fRn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:34:16 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4769aef457bso28391401cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626453; x=1749231253; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=IlLSXh49SkNUft/uho6V1C5EiaUVQvV7E9HTFlMXdjrxuHUN7aaRG5/P926TWFy5v8
         wLQsVVrOYtQbD3SsDx+lF9PMtAYedHDSZ7Z7tnSjm03uXAYhLeLCozNTpSStqBcZNicW
         tbnqwWFdeQ8M5Xx9gVny+rU0cnpgvgX04D7eT8ajF2AqL5TnkC7bUlURRD950dYy4DC6
         fxwOz9jfSMtak4X7iaH+ero5puO2znnsSYonnoQheVTPyk9iHzLOlodbHOjFW2lSumXD
         W9DJlfQKSsqQ0n9M7kaiRfNFewTtBdhJWidLnFQz4uanopPCdr9D5rfCLfajfgMP9bJg
         gPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626453; x=1749231253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=h7GpgmZ3p5w/O1ZvD1GxSP4BT8Lb9nW24ZMGy4Iv3uNWmq80EDBFwnsgB2S3D5nlsc
         smERrqlQO+dPmiHaPdGf7B7BwDFInTUKbhnGpi38sIIxVbVaqzYEgg0PECE6Cnx9OV6W
         D8t/Hz7nXngpXiR9EcmENDzrDp1DSDkEklmIo+OQw+XUwc6iPJfU9BNO0XR/jAL51scN
         OZClpET1gFPqcnntYz6G6EcLhwqUWSlUarrybcs7+nLuUss+CWAC0CmnPOEFf5gsImT/
         A1bjIT7pVrwMaJMONhajgCDL/TLuCshaiisKfE3ClqtTxCQqD+aMrQgViENBg111NX94
         yUSA==
X-Forwarded-Encrypted: i=1; AJvYcCVuCmGKzqrx88QqMHmwB2zxQiEq+10thhm7B+ZzwBahW410MxI3t59A6YpWV0lv22RGD1NdZjC/WgNBMKRS5uET@lists.infradead.org
X-Gm-Message-State: AOJu0YxoIET1KAOqOJ+Y/d4W05ExAh2Sa5FpkQ8bLiYNbgTU5iMPSZGx
	s51xSlv7HaokOB1SicOTaFfMP5clAS6Agtu8COKudZqd+8uhJV/wgnii7wivAgLFJUQB57HNlP4
	fYQe66cI=
X-Gm-Gg: ASbGncv/XCxF7otvbsTq4S7lkXzKpqCSgCgQ/nsR/A583m8A8Ik4imuVpd0CTMFL9vJ
	QEHT/esSBW95vNgI04+1vizrkUX9mC4bYtYYWTrVRns9MJsFxOfibuhBUZ/PMBMD3T1UQ5dsqzW
	i7NaXQCLMvyg4CDkFZ8m12BnjfczKQmlG+FfxCuLW6U/1Rmp9YvEa1JlUrsm+b7Kjvat8Fbpx6N
	2OziLR/bHK0swhyslalSW3G5Z6QXq47N14nBPMU+o0bOYEGq9p+lASISLkWrWVx8jMAGTHsWyI+
	vhjeXa28rGhIlT6BKTnIr3jhaWEtRmlG0PYZFSPK7fHlZgHIWAtcgKmUhsiLeU0wlHmKvmebfwC
	kZw==
X-Google-Smtp-Source: AGHT+IHjLHOAn3d1xA8OLMjNNh0KseItAA4qflnmZwhssThdabG4QAR2XR2GIUqKvALq3wp6IsH/tg==
X-Received: by 2002:a05:622a:260a:b0:4a3:d015:38b9 with SMTP id d75a77b69052e-4a4400c18cdmr80240681cf.39.1748626441532;
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a633c8sm23319031cf.70.2025.05.30.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Message-ID: <ac655c582609b7887381e1b68ed99f6b128fd794.camel@ndufresne.ca>
Subject: Re: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer
 payload setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:33:58 -0400
In-Reply-To: <20250530074537.26338-7-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_103415_193849_9F35E514 
X-CRM114-Status: GOOD (  19.51  )
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

Hi Kyrie,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. for multi-core jpegdec:
> =C2=A0=C2=A0 core0: |<-------- decoding buffer0 and resolution changed to=
 smaller
> =C2=A0=C2=A0 core1:=C2=A0 |<-------- decoding buffer1
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0 |<- handling resolution changing
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0=C2=A0 |<- vb2_set_plane_payload
> 2. the payload size is changed on the step of set format. Because core1
> is running and streaming has not been stopped, the format cannot be
> set again, resulting in no change in the payload size.
> 3. at this time, the payload size is bigger than buffer length,
> it will print a warnning call trace
> 4. set payload size must less than buffer length

You'll have to rework the text in this commit message, I must admit I don't
understand from this text what exactly the problem is, make it really hard =
to
review your solution.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0=C2=A0 =
| 18 +++++++++++++++---
> =C2=A01 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0074d1edb534..52d59bb5c9ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -720,10 +720,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =C2=A0		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> =C2=A0		if (ctx->enable_exif &&
> =C2=A0		=C2=A0=C2=A0=C2=A0 q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			if (vb->planes[i].length > (plane_fmt.sizeimage +
> +			=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE))
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage +
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);
> +
> =C2=A0		else
> -			vb2_set_plane_payload(vb, i,=C2=A0 plane_fmt.sizeimage);
> +			if (vb->planes[i].length > plane_fmt.sizeimage)
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);

Is this the same as ?

		unsigned long max_size =3D plane_fmt.sizeimage;

		if (ctx->enable_exif && q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;

		vb2_set_plane_payload(vb, i, MIN(vb->planes[i].length, max_size));

It is unclear to me how this isn't just a workaround though, looking forwar=
d
your reworked commit message.

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

