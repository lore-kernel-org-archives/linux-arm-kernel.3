Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=; b=rfM9ApnN2Xt4tBsMhMo43IZE6R
	9eBe5qi3UIRqVTYJkLVgIylwGG5lgPSYv65ZzjN9gcckZyOPGekYWMjdXy41My8NTQecX6Z4eFoEk
	MjMdRQ9CyIZEuWjWgj1rwYgsWh+POhp7lf7zJv66vKQAMXSCJtquuGDWQRXuxapx9NTQdWMnCj2Vj
	trGblgvJfiqJGxuQvlQer8WvDVUPkJHRxb/MxwjIOgNoXS1sy3aucpnd3V9LS1BCjQLeN8+jEQBJJ
	SimDVLxt1/O4dqu72jaCV8kGZKtK+XbzRngFdGUPrDP0/nHwpM9Uy5h14nUaKmvcGNkp+rWFerYlZ
	RL0gU8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lDP-0000000G8JI-1dQF;
	Fri, 18 Apr 2025 12:53:07 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5l9g-0000000G7nZ-27SF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:49:17 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c5aecec8f3so269298785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980555; x=1745585355; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=DgSX6JG6sRW5rm+EKf9FJ9FDlNAuy22NKmyHGu/WrA3ryO0fERtzH3WWl50RwbyexI
         wrXPugSjzA/rRdK9Uut+KHvj5mHHfDF3rNZsd0CWtjY8wAyJorgu5H9xq+ujbYKdJjTk
         yS92REllnlQYk+pMCKN/pL6RXoB3rvkX0MIjN4DQAHRhlDy2qSqvoSj67U8ARjSRKxsA
         5SFJ/NEAqkk8vewMGBOZ9FpNiaV05+d4lpztr+0Xgdzgde6K+INGC3CEoWNAl2hIweKc
         t7CqTmDJg4ps3jOEFKb0BrvUnlb42Ix9VFARMjJEI4dBFaLD6Kihl2WAQPISF9fGLEXX
         CKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980555; x=1745585355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=CXDj5OjV/yYr5iaI+Yxlouo/yf0H1b14a+VIehXf1JQinDokM1/WL7NIJJNBfsHFyn
         FHmThpChO/1C+Ref/+RvifVMCJfeX/1htaQ6E6Wfs5F32X4suixnu4ypLjeJyfS8vfX2
         PIJjLPss0ZcGiJwd+AOWr0wJ9oIAIQ7uO0RuO95qoBMP4YytbNZZZP5njRnfRV0J5UsR
         YfyLkmjjbyMqh+nVQbnWl/DDnK8DW1lt0BIsYx/M/ZBMcFcZ0hI54yaXjJoDZ8SsEhFW
         coJyRBzNrq7gQSUsB+EMR/wQHI0U+dnXp0VKJNRJ4gVDKiEHLpdoQUwqk/8UT+eWBfuT
         9jWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJmFpUQpMblS8WyVxh3X6WQ7BHXtml3z9cNqfWGHNu+AFboMmMVLj4sskHp4r1MhRgFbAeg5xdGXFYS0DCQ1EM@lists.infradead.org
X-Gm-Message-State: AOJu0Yymp8dHKiAXv8jEifcXA00DG+KsZncAK21BsxtCFtKYB4d0qX/y
	hzLcY/xm1WejtJ0G+l4lWNFHT/z2a5atlfu/kXgzn0hvLYzrp0VwCTZSx77TyH0=
X-Gm-Gg: ASbGncv8lJsLAPR73sVhzg+gebj2rL1rr0PyWYDAOUazPl+pFZ9vlBXoNg3CrC8M+vF
	9K0l8BpbjWhVoOtp0maD00CUqshzxZBgTltpSNjWJO6tp1OOPwEGw0U2+KtShWF4XjqjnwnxHTS
	BhEdHrD9N1YABTYvKh9vXazmH/R6OJECMvHjLAg11u0PnWhqMzhHuT7HDnnhJXkfYolN9zEYn1c
	IH7rT+dEHOlwqJPPxwGyMDWrspvOh/Fls3nUCHmtB7xX/H8JayU0ZAJOpUqM5PxmmJgLLRyypFF
	kHJosfdJLhZXlk/PYqYxZ6F5/Zh8G0HuK3PkhMZvtJC5Aw==
X-Google-Smtp-Source: AGHT+IGynna9oqlUfCvK4A2bAh3MndEe6O6J5Dk7XbTAN7GvFRmVsTQUL/cmbo1DTdHEkCI6hkR5wg==
X-Received: by 2002:a05:620a:bc8:b0:7c7:b59d:a6f2 with SMTP id af79cd13be357-7c927f59337mr381802985a.10.1744980555401;
        Fri, 18 Apr 2025 05:49:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm103702685a.37.2025.04.18.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:14 -0700 (PDT)
Message-ID: <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when
 free data
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:49:13 -0400
In-Reply-To: <20250418070826.141-3-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_054916_544146_16E9226D 
X-CRM114-Status: GOOD (  13.95  )
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

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To make the function mxc_jpeg_alloc_slot_data() and
> mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
> the slot data pointers are reset to NULL and handles are set to 0 after
> freeing the coherent memory.

Perhaps:

   media: imx-jpeg: Reset slot data pointers when freed


   Ensure that the slot data pointers are reset to NULL and handles are
   set to 0 after freeing the coherent memory. This makes he function
   mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
   called multiple times.

>=20
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Enc=
oder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v5
> - Make a single patch to reset the slot data pointers when free data
>=20
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 2f7ee5dfa93d..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.desc,
> =C2=A0			=C2=A0 jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc =3D NULL;
> +	jpeg->slot_data.desc_handle =3D 0;
> =C2=A0
> =C2=A0	/* free descriptor for encoder configuration phase / decoder DHT *=
/
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle =3D 0;
> +	jpeg->slot_data.cfg_desc =3D NULL;
> =C2=A0
> =C2=A0	/* free configuration stream */
> =C2=A0	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> +	jpeg->slot_data.cfg_stream_handle =3D 0;
> =C2=A0
> =C2=A0	jpeg->slot_data.used =3D false;
> =C2=A0}

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

