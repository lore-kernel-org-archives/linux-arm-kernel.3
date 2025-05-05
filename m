Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D3C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=; b=da2kYCFybal2K8TUjkcJuexF2w
	GMaiVA1xs5q9xA6Gx4e3Zb/mRdmvUcH3IqlgsgcH5w52xoAPYaZuOI7whTiAB9EH9gojR5jRG8lfV
	zTbhl0JYuAaWzlXTmmatG5v4cMM96vZQ49XgZGF13N7ZFfw90AUhQuTxPdfyMGfZcxOXZoZe126ou
	IUpRzOb+pjt+Q9zt3PmBtL5xfvQYhE/JIHho6r1XfdJkC8Lu49lz8hHks8YpwoK6UKRq6KkDWkBLS
	n658bgQnU8iRrsdWLYOS9yYMNUNVMOgJp0zyGk1tJy2BOLkOItD936/4pMbBOrcp3B7O9TfkenZR6
	Ja/kXiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBugQ-00000007Gvo-1sgk;
	Mon, 05 May 2025 12:12:30 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBueO-00000007Ghp-40KI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:10:26 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2d5e5e21b92so2952191fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746447024; x=1747051824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
        b=QbE6A+TIMqIDfE5m2TcCBTqkRETvP+pdd3Vew+oRfB7M5SqyvhjSkO7TuEc2qxnHr4
         as1a2xVOEdHoZp4s65Hzip5QFXj1+pLJoAi9/8+8B3AEftpf1YzQQ4jZbYXxMCfMKdmV
         seGq8vbfQB9VHsj/5RBUgKdmwottwGhbD8bj5qqohgz+RuitA3NM5fxC+NIBnCgmes+3
         Srp8lMSht9gRN4H1Og3R5eVNXP+A9HeFU+vzSZlw4uhTM5vic2G7UE5DLeioY0yEH1+C
         yWQ4lVbH3oV9Id/MQJ4b8lSiy5rj2Ed9rkG1NVTVRTiXlnhzjRDhT+b+mCfClcSe1r+r
         azog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447024; x=1747051824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
        b=ETv4fCrMtYCjif5TMtjmi1qcmVrgvmglZ9IMmE8bojkXMrg52LBsv0g/ydd29g8iaj
         StSif7ixCIJzvAoEGK65G8z9yN9BAa7XC72FI0xEXIDCwaROSpNmpLaaiadT6/W5WHBW
         2ODfFW0wGuPqNnKCeCadPwbvgVzobSrXsp7Wgw4cp/eEdqWZtOyZJAOOYvYGV6/zxUj9
         I1I/XNuVu1r5mUJw43HY7PtBrbb/BGwdHeAFtLAmFQ7bwdqjurgQ32oqBik6xkMwWD4x
         Ak6QDvVbosp0jHQ3CwZsdiF5oQIHD4lSQT70sJHRGiyYdm0csql5OiZpuuh7L3vXPW4n
         Y+jw==
X-Forwarded-Encrypted: i=1; AJvYcCXUQn/j0c1+Qv/zNKKjZNiIQSt+dWCgQOKAZWtQhxvY2sWQmLWLRApZuO/eEVU30uXSKroqCHi0LwuVWvNGV3/I@lists.infradead.org
X-Gm-Message-State: AOJu0YzW86EDoOHvl4fLxY1AmcyJaPQV3y2iTBra4yk6/GJs56NzGYsg
	tg4jgXI6ZVmFFWUBEhXlAqjDojPvx6aA78PqeMgVIb38cf4Lu+JVX74u1ioNgImTmTFTd9iLMoe
	if+0LZ+allUKQhc6uoeG/86xhoDB1w9a6cVtmCg==
X-Gm-Gg: ASbGnctlM5TNeAZv9FDueH/PageDJsdz0bBdPA5H7bKp0Eo6dhhWPlDL/GURhdQ2A6q
	eGZNtiz/gEUdOKKvUpz4tEzMS4gB3Uw5+U0GCNCmK57aeRcmrBQr/w0ARIPv6xeIBhRqxEBrUla
	2+oWmLKv7rQft4uCtP4CUCKKE=
X-Google-Smtp-Source: AGHT+IGrfUH9MPAdQwNS2twFxhlagwaLPCfCXznz+rgBdFwPjZ3ioiuEo3A9Gk0YdclatuJ1Za+bseaIMHaboEvs7gU=
X-Received: by 2002:a05:6870:7196:b0:2d5:230f:b352 with SMTP id
 586e51a60fabf-2dae8619680mr3755206fac.27.1746447023762; Mon, 05 May 2025
 05:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-2-jens.wiklander@linaro.org> <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
In-Reply-To: <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 14:10:11 +0200
X-Gm-Features: ATxdqUFEAD2cD1D5jQOZdhIhdxiPr-7TKi7md7xZJRysmAHd6QQOFGSu_VWfcD0
Message-ID: <CAHUa44EhdHZofZHRWQ8SJUn4OcAuMwzxxdfjhLQuXQXx4KEaUA@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from
 parent device
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_051025_014034_1C211DE6 
X-CRM114-Status: GOOD (  24.99  )
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

On Fri, May 2, 2025 at 3:36=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> > field into the new device. This avoids future warnings when mapping a
> > DMA-buf for the device.
>
> That also sounds dodgy. If the parent device is the hardware device
> physically performing the DMA, then that is the device which should be
> passed to the DMA API. Trying to copy random bits of one device's
> configuration to another device and hoping it will work is not robust -
> not only is DMA-relevant information all over the place, including in
> archdata and/or bus/IOMMU driver-private data, but it can also opens up
> a whole can of subtle lifecycle issues...

We have a reference to the parent device until the teedev goes away.
The dma_maks needed by tee_shm_register_fd() in
https://lore.kernel.org/lkml/20250502100049.1746335-9-jens.wiklander@linaro=
.org/
to be able to extract the PA from a DMA-buf allocated from another DMA
heap. We can drop this patch and support for unrelated DMA heaps in
tee_shm_register_fd() without losing critical features from the patch
set if we can't handle dma_mask in this way.

>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
> > ---
> >   drivers/tee/tee_core.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index d113679b1e2d..685afcaa3ea1 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct te=
e_desc *teedesc,
> >       teedev->dev.class =3D &tee_class;
> >       teedev->dev.release =3D tee_release_device;
> >       teedev->dev.parent =3D dev;
> > +     if (dev)
> > +             teedev->dev.dma_mask =3D dev->dma_mask;
>
> ...for instance, I don't see any obvious guarantee that "dev" can't go
> away during the lifetime of "teedev" and leave this pointer dangling.

A successful call to tee_device_alloc() must be followed by a call to
tee_device_register() or tee_device_unregister(). The former calls
cdev_device_add(), which results in a call to device_add() and an
increased reference to teedev->dev.parent, "dev" in question.

Thanks,
Jens

>
> Thanks,
> Robin.
>
> >
> >       teedev->dev.devt =3D MKDEV(MAJOR(tee_devt), teedev->id);
> >

