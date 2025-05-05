Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F17AC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=; b=njOE8jjbdcDvnOfUpSFex8kepb
	g6+EvaLwHcYvrP24q9yCDXcUX/Rg8WB7UTCFhZL3Q5ImffiCF0IGCvbyzH5GL1HcKv50a9+X437HD
	sKyKQe6KEQnMycEiVoGtRhxw7ilvCnGnr8JddRyZ06TUmjmpoYK9bIhccUVzpT41HXIodWAAZsp+K
	0/zQwVSQzkjJ5Xfqyk5gp+DJpbc9q9+P8cJz1Rdrak+wLxTott7dMhgpcETW0PjkLnGwsJqSibvHv
	egMsEn67aoEpuZOb1sLMtqJInQ1x8bz4s34JoKaaPjNb9DZQvk6yFTsOr4xge+T7h3iaWIsgXWF4y
	1hivDwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBsg9-000000070kD-2Ngf;
	Mon, 05 May 2025 10:04:05 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBscd-000000070Fk-1MYB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 10:00:28 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-72bb9725de1so822838a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746439226; x=1747044026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
        b=AW5kXvFyk+9oYFPWaC5x+grtNFzv+2LbK4aZAPOH8IpsGIiIrht4RH4nnq8pRocXVW
         Mri7rQxBN3j859i3BeDMR9FFN7s31Sqc/StINkxYkkFJI5ux94lQyybxfphFRLXe9CFU
         0szVLXCdeGKVCoYJRkxK3cNFG4wUhhhcv/MNqHSDIFShsr+xqBRqUEH6dMn7h8beLfm/
         YwsCKgufm8VeG59F+nKFXHMXrNUqc38i+zS+SYNKjVmp1sq2L5f1FxLoYN5EIC06Uidc
         6GWPTKriAz2zBrSU45DvUb0x8xC4jIzFhYYZEco4q7S91XdrbnjhWdt1EjtGJcgQAh9i
         hldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746439226; x=1747044026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUO+n2qCCkVBKkF0xc34yA7zFKP1PRXVjAuF6gNjM7w=;
        b=mse4TCS9fzXlWXQooKP13XtvmqpVxxQNsVPvphaEEfhEpkltNPflgTf2shBTPJukif
         9HICaxg4vDlaSlCMzp3i3UeIhF9cTvZ+DOoTu381GKmp8PRHgDkm8GUO7Li3UWVRwtna
         K2GMfpwiWZlh42ZG06z7DFnTS4hWCCjvPPIbMh3SxmCau1c1Y16871GDtOc156jYU8cn
         pdAVg5krAQ1az3SxwLGWTOtmpasRpHQs874qZQuRloEqsCYi0WEWCdhrO+8Gm7aOKXzR
         4WeH1Kjh0MbqgE6t68hpMXzKJR7khiYm6yfCBWjC90r9PcPYrgGOgV4Fymp/WOQW0T0i
         IovA==
X-Forwarded-Encrypted: i=1; AJvYcCURvq3zlqgCEv7y6nsWmOGtkx7LjzvUWvHKy5yBSnTnMP1fKjQKfv/S08ed02zSFObez2gDmv7uoQ9Lv/1PfHy0@lists.infradead.org
X-Gm-Message-State: AOJu0YwFM2CyFzEvujs/xnlAJscKnKCx4/x8yAsQ6/2Vwv5EOckchLuO
	wAhkj71ZQZ8qhPWzIyyfVyzCV5uVez33vSx/b5B4sPjnEUr1qCLZVL8TJ1NZvJPU3UEJi3cbvkT
	zP1niTWyJEW3vvL7TMehtCBgXsQns00/g7m7Xlg==
X-Gm-Gg: ASbGncs0WvYpvY4q9c/TLC3RYZaP7wEn3N16E1S8PWP044v+KMFnpbUu3o9wMeWIHmD
	6M2PxUaGNQCijvVuL1yELZwoBDw8X4xgx03G85iKh8jeZG42RCbxyFeMHfFMeFgJUP34HGKyICy
	6j8+KS2OKtVLklkCR0y+KDI6o=
X-Google-Smtp-Source: AGHT+IEfTkbjK5JWEDIXSUVf0w92h26obU5oYSgxTn7TbvfY+I0Zkozng+KfK0iBSmGp52i/r+Q8MQct9dxWARB5Up4=
X-Received: by 2002:a05:6870:972c:b0:2d5:230f:b34d with SMTP id
 586e51a60fabf-2dae82cc070mr3868126fac.1.1746439225695; Mon, 05 May 2025
 03:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-11-jens.wiklander@linaro.org> <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
In-Reply-To: <43e85d6a-ef99-4d61-910e-1d62814fd9ed@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 12:00:12 +0200
X-Gm-Features: ATxdqUFPin2MFa6t0S3tPjOQfIF3WcjTWu_QNb2z1h_FFrZyFMNu2bu0GEdtH9Y
Message-ID: <CAHUa44GC-HRUNGkta-EfMD00VzPBvqcVqU4Zj7kvW8CPnahdMg@mail.gmail.com>
Subject: Re: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_030027_372236_6DC63E0F 
X-CRM114-Status: GOOD (  15.91  )
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

On Fri, May 2, 2025 at 3:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Export the global variable dma_contiguous_default_area so
> > dev_get_cma_area() can be called a module.
>
> What dma_map_ops implementation is in a module? Without any other
> context, I can't help thinking this smells of something sketchy.

I see that you found the rest of the patch set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: iommu@lists.linux.dev
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   kernel/dma/contiguous.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 8df0dfaaca18..eb361794a9c5 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -53,6 +53,7 @@
> >   #endif
> >
> >   struct cma *dma_contiguous_default_area;
> > +EXPORT_SYMBOL(dma_contiguous_default_area);
> >
> >   /*
> >    * Default global CMA area size can be defined in kernel's .config.

