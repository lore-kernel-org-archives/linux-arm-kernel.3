Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B21C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=; b=VbZmcc2Dmru5ZwCuvgv1a0YPNM
	01CpGeaUQQfkYKz/Jva9HsgCQRmAxWt0KL09tgOvP8CSrABP9lBU4wqC/C/orDrRWr0W+Qzxvxl5L
	8FDu8FlzikPF9cTTeO0MOi0qmPGf7SRzhzcEVnALsKbzsYTG/BN+D7zQ+JSGC64gN+9RoYnWLlkp4
	W9XAZWELxbjAI/vJmHqudbP0NUufi7DF7+1ctReJ9WCLBu4nYqboGxgyQMNrIjzyNEeqFA3bZHzD7
	lrZ8RUgKEQcsjZcoqueo0IW4rEgxZxcE5lVS5dffTrQGQXBSKbrp5bM7NScdqmlxYMy3yXsXR2zV+
	URSsDSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4gS-0000000CB5h-3Wvj;
	Wed, 15 Jan 2025 14:47:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4fA-0000000CAt3-1VGH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:46:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab34a170526so197873966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736952390; x=1737557190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=;
        b=GD9z24kgC6iyxWum2enN5H3hMGOYqSU8EhgTTAfw6sP2HcqRO9rFiO/yZ22gR/9Et+
         GJhZt9nefanOPEa6hLYQcFaWHCCTfaVXkFCMEP/v8lmNK9PMWoN3lj5Cn/dBcc+QXwkI
         btHeLdsqN457NXoUsTPQxjCe/mqT48EWjDFHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952390; x=1737557190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=;
        b=et70ujqtNEQWo9imCumTnfwqeijKA2+KQv8PQ+1oGngNPdGtcIcBR564lT0GuOKP/A
         a344diEtPQNHpReQw0fCh0ArkiwNNRLqzYUO/Uklt/daF1FY75HBCdQyrPdJ7QyhLnJB
         vICrQ0QGFle2HnwpnrJ1XcodeYlIWMAVYG226LbWbZYSKIvNa+5QxKSBWTRmV2YzFN/+
         936Wu0heO9lsL+yxy8xqxisssagjs0/jyBWIDc0Kv2rOhjU2lsInjWft6D66prJPqD0b
         NbmyoNtAU5ej+5Yfcbx8r+LJHcipOETMuV9bg0HNT6NVFhopK8QLCixWOTRa2nw6FCj4
         jl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsJeVv+iFedBIZql/5i939AtlO/pY+OwxHfQ9pQwuxnrO5HzxizhGwojsAjaNvSHPeqRA09qnq1+qMaCGWaZ0m@lists.infradead.org
X-Gm-Message-State: AOJu0YwqNtQhw1oy184thOpgQyZCr4vhdAvlnwbinUFr5fOuRZtT6eXX
	aI9NKtWgxLrEQlg3WrsKXNr083hRyyfLwTC3GWJZ6h1Ko9ljSVAfPMIuP4yKq2kVR++LNRu2E0z
	g8bgm
X-Gm-Gg: ASbGncu9tUswRr4RgVXee6Z5JgfM+RDzKDWfKm6hxuOdkSqv7BwjECPIA6gLSShPOo6
	Pk7uOGg+S5Pxs7bAWOSBPgYuhZ27cF+ZMoJFaZbRaSW4fWczd8yIDSLG+DZEPxVKAHj1bMBODqf
	cJfp2p5uYBdcjs0/HqOcYHSClbMI5A7CDaS8wdd1mZq8dQ8W+g8es61MQx+pokdNmU+UXPLV9l2
	ITrgFBReRlj3vmukzKIvIfsy4CeNdE20jX/x66cKaZoIfwJB4PROjlRG4jrz4n9TBNp42+ow96G
	ds8FoE7g22DdOTd1
X-Google-Smtp-Source: AGHT+IEN9ri4NNzxdAwWhRSVLn6ETNFssswS6n+6PwM1KVPz+WDUTrXQMAuxNg13KGdjXV2CDWoxRA==
X-Received: by 2002:a17:907:9622:b0:aa5:4982:abc8 with SMTP id a640c23a62f3a-ab2ab70b387mr2535704266b.22.1736952390019;
        Wed, 15 Jan 2025 06:46:30 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b29aesm760347966b.156.2025.01.15.06.46.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:46:29 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so18709a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzgwUhWp8HTwSvA0OaGviwcIefr37CspWK5y56Qf3qQfnfCbc6XeegwbYNCw579NckW9KuY0XVFtvlY8WZZWOH@lists.infradead.org
X-Received: by 2002:aa7:da0c:0:b0:5d0:84a6:f1a1 with SMTP id
 4fb4d7f45d1cf-5da0c33b80emr97185a12.6.1736952388478; Wed, 15 Jan 2025
 06:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com> <877c6wryqn.fsf@gmail.com>
In-Reply-To: <877c6wryqn.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jan 2025 23:46:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
X-Gm-Features: AbW1kvZL1qQQyr3bOi9vf1QLnv5SEz_sbYFAD3t65ooPIchi1WTeTxOdFsa8n5U
Message-ID: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250115_064632_412643_2B683633 
X-CRM114-Status: GOOD (  34.10  )
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

On Wed, Jan 15, 2025 at 10:30=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmai=
l.com> wrote:
>
> Hi Tomasz,
>
> On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:
>
> > Hi Mikhail and Laurent,
> >
> > On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@g=
mail.com> wrote:
> >>
> >>
> >> Hi Laurent,
> >>
> >> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideason=
board.com> wrote:
> >>
> >> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> >> Currently, the rkisp1 driver always uses coherent DMA allocations f=
or
> >> >> video capture buffers. However, on some platforms, using non-cohere=
nt
> >> >> buffers can improve performance, especially when CPU processing of
> >> >> MMAP'ed video buffers is required.
> >> >>
> >> >> For example, on the Rockchip RK3399 running at maximum CPU frequenc=
y,
> >> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to=
 a
> >> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when usi=
ng
> >> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >> >
> >> > What's the time taken by the cache management operations ?
> >>
> >> Sorry for the late reply, your question turned out a little more
> >> interesting than I expected initially. :)
> >>
> >> When capturing using Yavta with MMAP buffers under the conditions ment=
ioned
> >> in the commit message, ftrace gives 437.6 +- 1.1 us for
> >> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> >> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> >> buffers in this case is more CPU-efficient even when considering cache
> >> management overhead.
> >>
> >> When trying to do the same measurements with libcamera, I failed. In a
> >> typical libcamera use case when MMAP buffers are allocated from a
> >> device, exported as dmabufs and then used for capture on the same devi=
ce
> >> with DMABUF memory type, cache management in kernel is skipped [1]
> >> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> >> DMA_BUF_IOCTL_SYNC from userspace does not work either.
> >
> > Oops, so I believe this is a bug. When an MMAP buffer is allocated in
> > the non-coherent mode, those ops should perform proper cache
> > maintenance.
>
> Thanks for pointing this out!
>
> > Let me send a patch to fix this in a couple of days unless someone
> > does it earlier.
>
> Now that we know that this is a bug, not an API misuse from my side, I
> can fix this myself and send a v2. Would this be okay for you?

I'd be more than happy :)

>
> > Best regards,
> > Tomasz
> >
> >>
> >> So it looks like to make this change really useful, the above issue of
> >> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> >> solved. I'm not an expert in this area, so any advice is kindly welcom=
e. :)
> >>
> >> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> >> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> >> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n4=
26
> >>
> >> --
> >> Best regards,
> >> Mikhail Rudenko
> >>
>
>
> --
> Best regards,
> Mikhail Rudenko

