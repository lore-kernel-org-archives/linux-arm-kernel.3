Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54327C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rXI3ClDmBMPb/nTHq47U3JbT34v5Vk5CODpFCMD7go=; b=YVNP9ccx5mKqBQW3JzzGC3sPmo
	wBJcCtxyTCdjxja57/M5kKDzp6rN/fqhJwaRx5ASzO8CZMs//6Fk0PVFFSbTLdVAjiVIphEoqbPlZ
	ewMemTtCasZt5OZAukk2z1ItEeP2ECD4fFmoyqpNSMmItf1qyUUBwPQdwarwLgsKKy9+207Y92QBg
	toPjhLlil+MUGM6RMv4Vy8Jja4mGLJileAGMXWciTOkC89Pk9BS0LWog1onduEAt9+o8KLmjIYQnY
	ynhdtnrQ6nqMQTW66Jf8YsG1LgmRyz4tHVVJ+0Ug/EHzRRDnCOnwruuGPC38rMP8ilHApeGjibCFR
	cBN2XzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxIh-0000000AWAO-2XmH;
	Fri, 28 Feb 2025 10:08:59 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxBH-0000000AUET-2v4e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:01:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abf42913e95so9814866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740736878; x=1741341678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rXI3ClDmBMPb/nTHq47U3JbT34v5Vk5CODpFCMD7go=;
        b=SCY/uZ9rmLn7eS28G6PgwF+R1MjmlcGEPSwhmreY+4kzJRP7znF7HXKz3vI/mpRqOr
         JhsfhMR+UvpcKTVcmgToX2OkQ9bSHRyI4zgFGS/I0H3Y5TImwg8gmjI7I3ogjHQOX92X
         k2FgZaYd5cqJTKG9QnYv2qOw2OrmNYkY1tGDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736878; x=1741341678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rXI3ClDmBMPb/nTHq47U3JbT34v5Vk5CODpFCMD7go=;
        b=SfE/iwuw2n7kdfuNf6tSRPNFz9gC2cHGdQCk/W7OSOCoodX7TYBZ/65Z5mZDTm9Hef
         bm0c/DOsZqp09ncml9pG9rhEVElud2qhiEMWMdtpe85nTFG3tbMSZjp0OsURDNS6g3XV
         0smChdT4QoTczHbTDfwbgEY+AKip7vO/NJQTsF2SPS3ZLpu4OihXLGejqGvOlVgO/q6w
         2wFLm/nc5mQAozD2GTPIGTBCn91odGM9VG+ZmJtBTho0xSdmTZqSF9NguRCkhJ+BTeK1
         9xxoEdgM3w53lbqC+OFR8q5IbBuWGTO6+5qpfPXqOxyGd5ACAzaOl8cg57UoePKfbNpr
         YnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2DontHnU4mgbQDM/9iJeLCqd9Pn1pc5Iisx2maRzKGkmDb3xqcIybHF3QoRLsSWS2UsIjxZfYHl9tyxPvYHz5@lists.infradead.org
X-Gm-Message-State: AOJu0YwN24Mc8insp8xVvZ1NzZQPmCqLyi2+jkI2uu/FcMCxEso5RFG9
	bp68PQUDFBxN4iuC+MLFZfW7AEgx0YOX/adWHgTqIaE9Eke65Ht8XZfrgzrxWOE309NM8vbR+dU
	=
X-Gm-Gg: ASbGncunEabEmtvUaYhAOyDXgKvtluU0N1lf3CLgky2cM0ljRObX97oOnTrUW30sqIv
	tX44QcC4eJKVvwy+Fj0WAlbKo/gNKVt96fmOxXg416zEhEHYm+9YvGs4lH6eE8Fqmzdnp3SqlhD
	D9KvkRV8YxB0NizLw/6BkMOxo//soD1syjbCdsp8DK0joultdm6tmjBw9Yd/sTTL8c76EfFt5C3
	OXJBbPKzIOjwN0zx9V5BoyVBKOtDXkfA1TYMzq2OakdFW6mw9EWAa6PICpOMIr0c82KPjHIAyqk
	XKx/zP5ei/QcGTNIeVNo1Ui+1kcrOIW1yh1hkS+y6OhpkmTmQ4HfyMSSesMXIg==
X-Google-Smtp-Source: AGHT+IEpeRAuk2wCxgOOFdmTJjyABLlp5XczBoIkeu+DEPsdquhpgfjPcmdos6zoUCgHB+SCx7ggRQ==
X-Received: by 2002:a17:907:7ba2:b0:ab7:f096:61d0 with SMTP id a640c23a62f3a-abf2687c2a8mr243264966b.45.1740736876869;
        Fri, 28 Feb 2025 02:01:16 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf15b178b0sm237698866b.58.2025.02.28.02.01.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:01:16 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded4a3bf0bso9292a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:01:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfQv4j2ctNOj7sKvdOELom44OO1HAcFpOq4AAmXr5LCcSassYlrt2S4GfSjZvKgw73VTsiVp4Le8gKgB128PSe@lists.infradead.org
X-Received: by 2002:a50:ee06:0:b0:5e5:7c1:43bd with SMTP id
 4fb4d7f45d1cf-5e507c1454bmr6895a12.1.1740736875259; Fri, 28 Feb 2025 02:01:15
 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com> <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
In-Reply-To: <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 19:00:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>
X-Gm-Features: AQ5f1JocdLsXSFHYJ8IXhWDm1nRVG8G1TcpnZe42kpdJDZJxd7C4Oq_p5gzB7_w
Message-ID: <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_020119_730625_AA3F870B 
X-CRM114-Status: GOOD (  36.34  )
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

Hi Jacopo,

On Fri, Feb 28, 2025 at 2:11=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Mikhail
>
> On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> >
> > Hi Laurent,
> >
> > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonb=
oard.com> wrote:
> >
> > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > >> Currently, the rkisp1 driver always uses coherent DMA allocations fo=
r
> > >> video capture buffers. However, on some platforms, using non-coheren=
t
> > >> buffers can improve performance, especially when CPU processing of
> > >> MMAP'ed video buffers is required.
> > >>
> > >> For example, on the Rockchip RK3399 running at maximum CPU frequency=
,
> > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to =
a
> > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when usin=
g
> > >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> > >
> > > What's the time taken by the cache management operations ?
> >
> > Sorry for the late reply, your question turned out a little more
> > interesting than I expected initially. :)
> >
> > When capturing using Yavta with MMAP buffers under the conditions menti=
oned
> > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > buffers in this case is more CPU-efficient even when considering cache
> > management overhead.
> >
> > When trying to do the same measurements with libcamera, I failed. In a
> > typical libcamera use case when MMAP buffers are allocated from a
> > device, exported as dmabufs and then used for capture on the same devic=
e
> > with DMABUF memory type, cache management in kernel is skipped [1]
> > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> >
> > So it looks like to make this change really useful, the above issue of
> > cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> > solved. I'm not an expert in this area, so any advice is kindly welcome=
. :)
>
> It would be shame if we let this discussion drop dead.. cache
> management policies are relevant for performances, specifically for
> cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
>
> >
> > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobu=
f2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>
> I would like to know from Hans if the decision to disallow cache-hints
> for dmabuf importers is a design choice or is deeply rooted in other
> reasons I might be missing.

When DMA-buf is used, the responsibility for cache management is
solely on the CPU users' side, so cache-hints don't really apply. It's
the exporter (=3Dallocator) who determines the mapping policy of the
buffer and provides necessary DMA_BUF_SYNC operations (can be no-op if
the buffer is coherent).

Best regards,
Tomasz

>
> I'm asking because the idea is for libcamera to act solely as dma-buf
> importer, the current alloc-export-then-import trick is an helper for
> applications to work around the absence of a system allocator.
>
> If the requirement to disable cache-hints for importers cannot be
> lifted, for libcamera it means we would not be able to use it.
>
>
> > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobu=
f2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobu=
f2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n42=
6
> >
> > --
> > Best regards,
> > Mikhail Rudenko
> >
>

