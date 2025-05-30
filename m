Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4AAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XJgKivtCt5LJoQcbBThiFJZHfZb7pmb6uFcMoblf8Q=; b=HQ968R4IBV+FIuHhQ5DX0QEsL5
	6bxaV2k3ffZEVeWTGsS93zZZtQ6q52dPzWy0PPCLqCx89YCy4YXiGpxoWMcw9yVKfzdr9ftTkfQRb
	EidPAqQXpIhDYtBLxCdbE+oTldbGF2OTqJnF6mjOq04qkb5X9ZxJwVIPnZQZRZ8zUMCwht/+x4pWk
	+/eEclVSAsnKMDQztz59QLrl2Zqcbf7rB24YrNg0onWQgLZGrMqLhj0ta+JNKMYA02n2Fl9qHqLQZ
	uicA/qVVeQdWJPcj8CIj0TAxYjy03FnSkxyIjlULg8CRmXElcLUjlKQElfhb4h9RhT0+R8HC9CR5u
	IgyKGI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3jr-00000001QdJ-2JZn;
	Fri, 30 May 2025 17:41:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3gP-00000001Q3D-3ZZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:38:19 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso13496096d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626696; x=1749231496; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4XJgKivtCt5LJoQcbBThiFJZHfZb7pmb6uFcMoblf8Q=;
        b=ybocLm3In3sB6Cz/UZ+MiRCADIZHqkh1hHqbhfdXf6og40a9fRWOh2yR34DO8sqJpw
         rbEO0WZBYTJfwrLdJn1kmyAnyJIkRg3qv+olHlW0NrWNRaDLhGKi486BghmdXE9kmXq5
         g+uxkjpiS2G22rGhN9H0mEjSxbKklf0qJngNqSLg2xvbkhYqNx3UxD6avJ5pUBpx3CzB
         G5+LYMgGXhWCW74gMp4ZpeNl92hi/k0ueOizhKeJ8jzHlRPELq3mOOFUAOB7ppXwRZVh
         kM3xA4AmKGnzAUsxSRxQWQUAbkWKm4JV76dP9RAVzjE2o/osCenMXHc6gG9nU30IPWyK
         vqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626696; x=1749231496;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XJgKivtCt5LJoQcbBThiFJZHfZb7pmb6uFcMoblf8Q=;
        b=BDfKE6L/IoUHEW3oiY4C7xL5XchlmW18/isDSPP7EYep1EM32vgg8QY3pwTdDp/gQJ
         iKoz/rrEa0C4Yq4PSFe+ghZlVlLOHM4b1TsfOpgR22JZecAk7zlhrBrKnmQhmW3LY2x7
         u4J/CU88vEDj7YjKuNZmQrTrQ733LaJOI6RGVOclaZrBs1h/yExmkd6+lU7vV6AJc+PE
         hbHJ+LRQz2uz16UFItrSnILy1zfH5HeCIbX9poQqcB6+Q5MhIZI5T8QLj6X6LjHcOlyM
         UqESfqWjERKjUerUNZNMQa1T3CEHSjP5rtghZUy1ORlV4K16dwFKvrQyFr7WTpVVR81t
         foeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpQSXWxT9MoneCr3l3/CnFuAPlxGY08nOQZ4GiXnSblTlsCmERBV0BrLZPW7t5fFZFep/u8lvTna1TharJYPEv@lists.infradead.org
X-Gm-Message-State: AOJu0YxeUx0JFao9Z2khqMTI7zZ4UhThOfot6HZTsJHbTsQCe86DUeR5
	ah2AE5oYUKkcXG08pt77VYGOJtoep39cLJAiydZq3NxiPizAvhV3Lqtyzc+ENsI/P+g=
X-Gm-Gg: ASbGnctMIPkClB6QLgNn/Eruq3/sKe1gS1EePgrteUfw96RaChTy72EaF4Olo4PX5Rv
	SzbeC2dcup5W+0hs0Isd9ycm8RD9NMN5AE9oz4HYFVuE1V3onk7XL8zMaR/7fwhPkw+jQlRHSWU
	TfukY4QM8UaYNwjWAxh50e5LtrfM/Ul7avY+ZB6norV43pKH1HOJjUVaeGdrEBfHKM2qgN+s4xX
	7Mb/QK31XUPD4i2H8nWWAJI8pVKB8pgmy84NhpmBONK4cnKoIAKjY+wC3BIT/kS3kzg8NSxakJX
	5wpPpScK5aJv+JSOwjhICu7o23gKT2GBai0obl5nhuAtPl2zWJ0iRjdDLVl1q2d8SY0=
X-Google-Smtp-Source: AGHT+IEm6WRR1loVcMiU2DqaH+dlvJGnjKbEYabizfJDoQi11LUDznGgxwtmSqdbcL6beHmdAwv8gA==
X-Received: by 2002:a05:6214:2524:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6facebdbb1amr58096746d6.11.1748626696550;
        Fri, 30 May 2025 10:38:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a90esm26195946d6.105.2025.05.30.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:38:16 -0700 (PDT)
Message-ID: <8eadc152c3542c30fb31bb67093087f2bb0a6c31.camel@ndufresne.ca>
Subject: Re: [PATCH v5 07/12] media: mediatek: jpeg: refactor jpeg dst
 buffer layout
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
Date: Fri, 30 May 2025 13:38:14 -0400
In-Reply-To: <20250530074537.26338-8-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_103817_895387_80C872E2 
X-CRM114-Status: GOOD (  20.63  )
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

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. change dst buffer size to same as struct mtk_jpeg_src_buf
> to make sure all params of mtk_jpeg_src_buf could get a memory.
> 2. For memory alloc operation:
> the v4l2 framework malloc a memory, the base addr is vb2_buffer and
> the size is sizeof(struct mtk_jpeg_src_buf), mtk_jpeg_src_buf could get
> itself addr by container_of like that:
> vb2_buffer -> vb2_v4l2_buffer -> mtk_jpeg_src_buf.
> vb2_v4l2_buffer must keep on the top of mtk_jpeg_src_buf.

The subject imply a refactoring, but the most important change in your
patch is to fix the wrong buf strut size. Can you rework the subject
and message to state what you are fixing please.

Add a Fixes tag, and moved it at the start of the series to show this
isn't a problem you have introduced in previous patch.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 52d59bb5c9ad..7e3509be6f69 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1103,7 +1103,7 @@ static int mtk_jpeg_queue_init(void *priv, struct v=
b2_queue *src_vq,
> =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 655dc9c3280c..186cd1862028 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -96,10 +96,10 @@ struct mtk_jpeg_variant {
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> -	u32 frame_num;
> =C2=A0	struct vb2_v4l2_buffer b;
> =C2=A0	struct list_head list;
> =C2=A0	u32 bs_size;
> +	u32 frame_num;

This "refactoring" should be split, it does not fix anything.

Nicolas

> =C2=A0	struct mtk_jpeg_dec_param dec_param;
> =C2=A0
> =C2=A0	struct mtk_jpeg_ctx *curr_ctx;

