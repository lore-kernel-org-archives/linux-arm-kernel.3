Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94109C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=; b=OOZnVjTuVwBPn3vHe4yqAbkvSA
	DEcw84KAH3jJR40VIKgM98ltHsYgfiiDHnjEGGBnrYnPNi6cjYZ5jetx4cmLBUoRN2SwM9yjataX+
	QuqGw0R13EHgq5uTE0Qt9uv68okkrl8/s/e9Yk77d7S+ksoFbHPQ+5Uo2XKgAndRta976gh67Yuz9
	0hVNjkftXtExVfbDk93+fwwlsoSS7S8gY/0Ymi+beLtT2qhTLTDCbM6IfPMytx7D0rvTYyVJIHEyF
	Tjxl3wM8bOZPe5Jbtfp3lpwFnACrfq0tkGHZKac9q2/l0fDqT8chtnFF/IUZel22Q9r9KtT9UMvfb
	1Q+Tyxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyq3-0000000B6dd-07tj;
	Wed, 15 Jan 2025 08:33:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyom-0000000B6Nq-3nEZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:32:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so9440603a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736929923; x=1737534723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=;
        b=Wuj+NA5DMSEZv8DoraEpz6/Rb4Q9U+bITTvivkrRFQu+zkZxtV2qseXZO6W7CRtS5X
         b+oiyu0veGuLEz1VJETlBmIMcmnpTAJrJzcszvba4LWUMJNGS8y9Mg3jrRGSG9Y9QKFe
         1+ueWkWhQ0gh9UvVJEmS2fG3ZFq4JMEvfGa+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929923; x=1737534723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=;
        b=B73CkA6FKZknQejleC/oj/fnoQT4E/pRdDB51Jcogv1AzxNoxESRNi9EszMtjhUFWH
         a8W0qn03lZ8Tc50cbgCOhWDa6ZicqEj2UZnnGDDRR2caYVYDRGOZD/znAGkzRQUZEaXQ
         ZxFUBQMfo5wm4tjCrh3HHndnvVkaGi3CW9WbE3YNIXaHIHCQza7LH1O8cmaMXFMcMieq
         fxzyiXOAjKQV5DyhuA/xJK/WWv7OhiLDB88LfnesLvFLHAUnqOf0DS3Q2oOhj1qOGW/a
         lZo76g70nerQdeWyaoDFAqUa814rZKyAsGs+KeFRTQM5b6MzRQ/NdImaDhWtjwwdu4Zz
         NxBA==
X-Forwarded-Encrypted: i=1; AJvYcCU0r498rFUG95L9MzviHeBqoHW1ABpVS+/0LGTbwMUElSMHxutSQRCLPui4EaF/Y7FX8ENbptb72zeAalix/89h@lists.infradead.org
X-Gm-Message-State: AOJu0YwmWKvDTkJl7+h0vFoaI/kH8Q/NwXEKega0O3IRy5Ep98ReGt1I
	E2xwRmwFf4uwOWgX/ZTrD7KibgQBdZhtEymm0rGtuJYUjX/ZvA476fReFWLmNnTYsyXXTVpDO/q
	t/f/b
X-Gm-Gg: ASbGncvbof6jr+PwHntrxnqX1CNFqxiD+x65OR1OYbsGiNtG0rO1Nhk8/irbE5I30kI
	IkfHxt0M4+9pZkaoHRY/FeLcd9dWhd6YO0KUW5eL+DHZf3BceA+s3HCjHWc+mz+YvYpN9+0cE6Q
	2gPKsLdyWelTh4+GwPAGdcz2hynwKmE8P0p/GN/Kj7nx5kT8C3Vtg12DEv/Evq0RJ8weNAYWMkd
	NouHN83xWrfkaH1rlRGcjMxD7XWH31kM6HMHz4N6T0kKxpruPtnvedopdlCrv4uh/DNwItpBOcV
	ZFm717GrwKbkV9yv
X-Google-Smtp-Source: AGHT+IHKKH031LtgGf/B2NQCG8ODvXvT45EmgBp3zDwEpVAap5VH2l8WLlebg/yOPowKaQVXgVNUTw==
X-Received: by 2002:a05:6402:1eca:b0:5d6:688d:b683 with SMTP id 4fb4d7f45d1cf-5d972e0b18bmr65320161a12.9.1736929921312;
        Wed, 15 Jan 2025 00:32:01 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b299dsm725325266b.160.2025.01.15.00.31.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:31:59 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so15965a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmKrFrpQC8fzcTNI9jKRFB0F18BGgb1BWWP7aIpeAtUEc6swMzNzxxTMgCn/0sf50QWFOVaf4WHdEep+s6n2gb@lists.infradead.org
X-Received: by 2002:a05:6402:4c3:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5da0dd676femr51506a12.1.1736929919103; Wed, 15 Jan 2025
 00:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jan 2025 17:31:42 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
X-Gm-Features: AbW1kvaBA4VZ7jIsEwQbxJoMrVzvOgL53cb9RAbkq1doElWIr6HOcvTWYI_kM7k
Message-ID: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003204_941013_C0814270 
X-CRM114-Status: GOOD (  27.50  )
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

Hi Mikhail and Laurent,

On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
>
> Hi Laurent,
>
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
> >> video capture buffers. However, on some platforms, using non-coherent
> >> buffers can improve performance, especially when CPU processing of
> >> MMAP'ed video buffers is required.
> >>
> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >
> > What's the time taken by the cache management operations ?
>
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>
> When capturing using Yavta with MMAP buffers under the conditions mention=
ed
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.

Oops, so I believe this is a bug. When an MMAP buffer is allocated in
the non-coherent mode, those ops should perform proper cache
maintenance.

Let me send a patch to fix this in a couple of days unless someone
does it earlier.

Best regards,
Tomasz

>
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. =
:)
>
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>
> --
> Best regards,
> Mikhail Rudenko
>

