Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A04D7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=; b=GR4cPas7rDaTfl8rq4GNHz/bQd
	i5zpgng40oxx5/aywpUSIe+gfKOx823VDnQKXYA1NbABCikT9cBz73Xx7+750z24qKuHqMY7au0u3
	0jbFI5Dslcmw6ZInZjh6mGQ+tT4TFQ1zvb34werZM8Q85ExsCsVmsSqeAYYlFmCDI/3SN/RNTut7W
	CYu1mkLCij/inu8vxl8WjQDvvo566AoAYADZjyU9gytulMtSiR9nwSy309RQNnTaeZENIuuJRFTmX
	PbATfiwWXFzSuG3ueGFHgCi2i1UbITFepQKORinSXbPlUzCWFDur8sHI6enANjgVHw83cTElDHVva
	nNoG0PEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAPB-000000073ND-1nmn;
	Mon, 02 Dec 2024 17:40:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAHy-000000071Y2-3bqH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:32:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-72577d3b026so737970b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160769; x=1733765569; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=B2PFeRXm5xptzzNUV0qk2DzoVXld7M4q2KV4gN4hY4j44H4eURHrA9ElwXSuA7u8gQ
         GBHkNIHbVUke6VgxtH/GeghsOAKThIUYO3ktD2v893FIy1SdG18KGhEMTlEXXEI2dNL/
         Iqu157u4o+QqDjBnpkCe+Yx5gkhVY0Ip3qCPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160769; x=1733765569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=jxSNHs1dk8vZEve7RyAxXEMT55dxFxMcGygDFmZfxIIWnvcUKBzQ9gRfpv1zS/fmuO
         PryqHqbQIC0SyCxyEX1NzBTBZhrcWBMYW6yTBJftOyNlVy2JrGfuaPz1Tseyd2ZQIxSr
         YrFcU4fOXt82hLdZ9fWZJDjATjQRr7bdsqMmAw3s9U2HQZkkxA45Oet8w3yJ6d7Uqaub
         kM8CIiXaP6Gmiq+oVUEXOYNvS14t3EGjUS/iW3RVzcurXg/RS1NhYpGxZYtit23d93a0
         dBIlbhVOYOKh7aG+t1Prfgn3c0AhKmrdBqoXAWYjrVOFSkn2N+GkJ+bQyHHcNQvdi7JN
         JmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtf7G4xZX9A+Rw1WKD7zMIGUP4vr3tiBgxKs812+ZMBCQ4Uiu0erXfyiIbpfnr73cOQXsSRjGN4w+iCXer6hOv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp9wBwYVcBxxYvTWmXLM0GYvUHrwQHvmB2/nYpSAO1CLe4dX9x
	qKzKvzMB6P97G3sdqPGICnuAskUyPKPTi1+FQv7ngtMyL3xXea9N4OAB6CeZlIzXqrY86L1XO2g
	=
X-Gm-Gg: ASbGncsBNzJI6qbfvMRJiB0XnBcFpYSR+iVxL4kYN+QiEUFHe3Aip7KB6rWlTk5HVGQ
	WZTOG2I5zEuEAZmAvDlwv5zn6D2iMYoNw5OWPbJvnBS1p7Am2//50frGeQSZmpZW+whCiPwpQiO
	woN/UUpFlBCUEwryQuRC+UoSybz/iLl9D4V01Bvjj40I469DK3xL35pSEKKgLyxxxAj/RkPsoeb
	Zp9FhmDcPg7Ah9c49Phpu3cljrSxRu2inGms0tMllaBDuLeaT5X6VGtwLZM8EnII/+xdaVhxah3
	TAQlHBr+Ywm7ytcw
X-Google-Smtp-Source: AGHT+IEjUN/ML+K162/xpdhBMgTEQI4aafoM2AtK8SqwrpoRrDwdxXfFMmUoTBU/SEHlExVoYSBCtg==
X-Received: by 2002:a05:6a00:4f88:b0:71e:cc7:c511 with SMTP id d2e1a72fcca58-7253014a11amr34871457b3a.23.1733160769399;
        Mon, 02 Dec 2024 09:32:49 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c31164asm7040426a12.42.2024.12.02.09.32.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:32:48 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2153e642114so30357415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 09:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkKFd8rzvOyWhQl6+QCqPGr+AZ0zXOEkYTjVJmWfglTt3bhaJVsedqLXDVM7b1lYrGEVZM7xMPUJPmvJ1uhSwL@lists.infradead.org
X-Received: by 2002:a17:902:e5d0:b0:215:5a53:eded with SMTP id
 d9443c01a7336-2155a53eff1mr163851165ad.39.1733160379613; Mon, 02 Dec 2024
 09:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org> <20241202162454.GA2848026@thelio-3990X>
In-Reply-To: <20241202162454.GA2848026@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:26:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093250_890618_68A12073 
X-CRM114-Status: GOOD (  27.03  )
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

Hi


On Mon, 2 Dec 2024 at 17:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> > llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> > the same enum type, but their are part of the same ternary operator.
> >
> > vpu_inst.id is of type int, so we can just rewrite a bit the code and
> > avoid the following llvm9 warning:
>
> LLVM 19, not LLVM 9, as the minimum version for building the kernel is
> LLVM 13.
>
> > drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> FYI, Arnd basically sent the same patch October 18 but I guess it has
> not been picked up?
>
> https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/
>
> Hopefully the new media committers model will help patches like that get
> picked up in a more timely manner.

We can take Arnd's patch.

Yeah, this is the kind of patches that the multi committers can really
help with :)

>
> > ---
> >  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > index f8145998fcaf..4786062e879a 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> >
> >  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >  {
> > -     const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
> >       int ret = 0;
> >       struct venc_h264_inst *inst;
> >
> > @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >
> >       inst->ctx = ctx;
> >       inst->vpu_inst.ctx = ctx;
> > -     inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > +     if (MTK_ENC_CTX_IS_EXT(ctx))
> > +             inst->vpu_inst.id = SCP_IPI_VENC_H264;
> > +     else
> > +             inst->vpu_inst.id = IPI_VENC_H264;
> >       inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
> >
> >       ret = vpu_enc_init(&inst->vpu_inst);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--
Ricardo Ribalda

