Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6CAE64A87
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/jA4+syt73xHRzh3CLLPIf2LQnHDc6Mp3Wfo7HZ894=; b=3Fqk4/lyU91k9HN+uCrRiyKaIF
	Z9Uko/lgqJQUucCBKBIRhDovdDiriEtu4FqqV8mdcipK7mc86G6vBWBLPTmdhu/ABLwiL8IOZ4+pz
	TxOqemJFNzeRiZdm5AjaDcz87NmSkAnJ1PBjBFl3IBWHpH8Em8vVaRd/x2Od83V7i/+1tnQAEP7BV
	IU7jIdNhRhRJJAhQf/uCfXU8axDzjobihw+Puz4CECJ0ey0/ui1GYma/c/GnvVM9zQrBO8K4stO3B
	0sfRwk1pfqD3mM0K/PV95hWBkisT5SKxuA0+XPigp6cR3ecui+VV7A7rv9XauAPo5+ninujnbZYw2
	0D1lzY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIS9K-00000009RwY-05B3;
	Tue, 03 Dec 2024 12:37:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIS8I-00000009RnN-3sLJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733229360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/jA4+syt73xHRzh3CLLPIf2LQnHDc6Mp3Wfo7HZ894=;
	b=RgUCoKUpW/Sr13PnAbpZJk3crQyOYUAPbQvJSMYkKnuCtdESKatdVd1mwjtTv949tIc6Gx
	aAxVJodO3K9+ZBqjmOOVHe2nc/Wui6kuCRA9QQ4HYi2f68hkW4cvHUAZdYn0tsFto1XwB/
	ptxdyRvzTtHLo3aEQ3J342lr8AtONzQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-CYG0f6JqNE21i8UvEzyAuw-1; Tue, 03 Dec 2024 07:35:57 -0500
X-MC-Unique: CYG0f6JqNE21i8UvEzyAuw-1
X-Mimecast-MFC-AGG-ID: CYG0f6JqNE21i8UvEzyAuw
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5ec1c46df37so621851eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229356; x=1733834156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/jA4+syt73xHRzh3CLLPIf2LQnHDc6Mp3Wfo7HZ894=;
        b=Gjs5txzhE9t9R91NxmhSM0AYkHt+decVS086PKuLiXjK57FEycXxxN6w2gZ9vbHPWt
         DUkZIwCQAiDAwOAkMXdGf7VfDJIGn5C/XqNmaTfCUa32IjC5ZO7DMhW7zRBXrQz8Z4lk
         h9jRHhl8j6hM6tHATX+wy+n2r4Z2bnaE2WKRDKugnqWO0tu0Xmr107DYYuxVwREb9nia
         BCE3GHE8i/eU4nYlFQeVGHQi1FveccwPJb9ewhYOhy3MhR04FTdRLCN6bTzUfIxGXU+Y
         yx5mb+xBXR4eUq6BWUARz6nPiyxe6d09/ZE6WUtvf6ICfcnfvHqrq7A8gr/dRCjhgg74
         6KSw==
X-Forwarded-Encrypted: i=1; AJvYcCUyZw3oU7iWXGzXX8fbmLmEg5Cq94cXud0Ixr7BRjC77jPji5EbwgRvmbnW4HfDuWLNCjE4AZm1RWMiXx6yrocO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/26pn9sRFELssF8bofMtwbyGV0bcxhmg9/ABeacdht8BU39p2
	MHSPWv0Z/NuMorykf7ziNZdSvmSLeEx/gkCjSl/VS+JoI4YdpxSvFPlsrh9puskAxq4bKPPkzS1
	q3JDQ6WMP3yG1e+jhZKasvrPEAARagzdCl1GCoU6cc1vRM9nz4HChcC/JLy3I8SPobYyMyExps8
	JD43FWyCXSLjiNNlAIEoXBzPBnBkGS4nGuhFNgCnuDz9+xOA8=
X-Gm-Gg: ASbGncvsnzrj6wMP1f5ze7iiXBPGtMIOIPI+641eZilxJy8/xzP5BZcg0xlUpkaNhdu
	7+jn/g70VJcs+eckqNmMaNILdaHIMfC3a
X-Received: by 2002:a05:6830:3c87:b0:71a:20da:f85f with SMTP id 46e09a7af769-71dad717461mr580409a34.7.1733229356361;
        Tue, 03 Dec 2024 04:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzevS3kCzYIexPOiCGrpWFJcklXeddetaq+wX1lpF3svUb/DPOth1TMgPRMkwfxsBqPiCmaSW4NFvRKKtkrK4=
X-Received: by 2002:a05:6830:3c87:b0:71a:20da:f85f with SMTP id
 46e09a7af769-71dad717461mr580399a34.7.1733229356086; Tue, 03 Dec 2024
 04:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20241127-defer-dma-request-chan-v1-1-203db7baf470@redhat.com>
 <4dd1caa7-4b95-4e06-a5ac-e2d33ce88d04@arm.com> <ffccf100-469f-4e5b-a32c-5c06e196aacd@ti.com>
In-Reply-To: <ffccf100-469f-4e5b-a32c-5c06e196aacd@ti.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 3 Dec 2024 13:35:44 +0100
Message-ID: <CALE0LRt9W41Gr0dvDXpt3fV-=jMvrD1X6e4bS9+EMy8J-Qv14w@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: dma_request_chan_by_mask() defer probing unconditionally
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	u-kumar1@ti.com, nm@ti.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: stZlZt2v2QCFOnpXbLksVMeQqXIGR2d9lGZHImFfEKk_1733229356
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_043603_036310_1EC29667 
X-CRM114-Status: GOOD (  30.63  )
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

On Tue, Dec 3, 2024 at 5:35=E2=80=AFAM Vignesh Raghavendra <vigneshr@ti.com=
> wrote:
>
> Hi Enric,
>
> On 29/11/24 22:14, Robin Murphy wrote:
> > On 2024-11-27 8:23 am, Enric Balletbo i Serra wrote:
> >> Having no DMA devices registered is not a guarantee that the device
> >> doesn't exist, it could be that is not registered yet, so return
> >> EPROBE_DEFER unconditionally so the caller can wait for the required
> >> DMA device registered.
> >>
> >> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> >> ---
> >> This patch fixes the following error on TI AM69-SK
> >>
> >> [    2.854501] cadence-qspi 47040000.spi: error -ENODEV: No Rx DMA
> >> available
> >>
> >> The DMA device is probed after cadence-qspi driver, so deferring it
> >> solves the problem.
> >
> > Conversely, though, it does carry some risk that if there really is no
> > DMA device/driver, other callers (e.g. spi-ti-qspi) may now get stuck
> > deferring forever where the -ENODEV would have let them proceed with a
> > fallback to non-DMA operation. driver_deferred_probe_check_state() is
> > typically a good tool for these situations, but I guess it's a bit
> > tricky in a context where we don't actually have the dependent device t=
o
> > hand :/
>
>
> +1. There is no explicit dependency that can be modeled (via DT or
> otherwise) for memcpy DMA channels. And the IP (cadence-qspi) is not
> specific to TI platforms. Its very much possible that a non TI platform
> may not have memcpy DMA channel at all. Wont this end up breaking such
> platforms wrt using SPI flash using CPU bound IO?
>

To be honest, I didn't take into account this, so yes, this patch will
break such platforms. But isn't it already broken in such cases? If I
understand correctly, if there are no dma devices at all, we're
already deferring the probe [1].

        if (list_empty(&dma_device_list))
             chan =3D ERR_PTR(-EPROBE_DEFER);

[1] https://elixir.bootlin.com/linux/v6.13-rc1/source/drivers/dma/dmaengine=
.c#L892

Thanks,
   Enric

> >
> > Thanks,
> > Robin.
> >
> >> ---
> >>   drivers/dma/dmaengine.c | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> >> index
> >> c1357d7f3dc6ca7899c4d68a039567e73b0f089d..57f07b477a5d9ad8f2656584b8c0=
d6dffb2ab469 100644
> >> --- a/drivers/dma/dmaengine.c
> >> +++ b/drivers/dma/dmaengine.c
> >> @@ -889,10 +889,10 @@ struct dma_chan *dma_request_chan_by_mask(const
> >> dma_cap_mask_t *mask)
> >>       chan =3D __dma_request_channel(mask, NULL, NULL, NULL);
> >>       if (!chan) {
> >>           mutex_lock(&dma_list_mutex);
> >> -        if (list_empty(&dma_device_list))
> >> -            chan =3D ERR_PTR(-EPROBE_DEFER);
> >> -        else
> >> -            chan =3D ERR_PTR(-ENODEV);
> >> +        /* If the required DMA device is not registered yet,
> >> +         * return EPROBE_DEFER
> >> +         */
> >> +        chan =3D ERR_PTR(-EPROBE_DEFER);
> >>           mutex_unlock(&dma_list_mutex);
> >>       }
> >>
> >> ---
> >> base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
> >> change-id: 20241127-defer-dma-request-chan-4f26c62c8691
> >>
> >> Best regards,
> >
>
> --
> Regards
> Vignesh
> https://ti.com/opensource
>


