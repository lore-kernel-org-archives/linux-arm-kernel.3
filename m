Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E43C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsfdUyH3zrjTycztjPtzayYh5FQ+lsz4U78oE1AJhhQ=; b=Tg5q1TlEUD5qTrGOkSxT+fNAiG
	BgdsYG/oAlF1qJoom7lacsj1CoAACwoTFrcgPsHdtcwiSBM629EWTKf41PAuWn1s3FbDLo5NE4Hob
	B2jXCvVy0X6yn8aR+veP3kdP2VOTklbe3Dh9GF+t1Um7LcOo/XJ1CpZIN0MHhvJCFeisODcdXAHDY
	hMWMIM2FFD+8MaPYxaHWXIjm41yFUidGY74uyonLO/KCzvCLB2o/ju/otJ75/Ej4sLTW/i+w/4Ro0
	A9HKvC4TfkRA/W5WTsJyu24Bwra4SpI/FUawC3MfzIfHrrB0Lwi2i322gqqa9OMHft7husWJK4num
	bVyL11iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYtL-00000001yX5-42Qh;
	Mon, 10 Mar 2025 08:53:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYrj-00000001yM7-1lsh;
	Mon, 10 Mar 2025 08:52:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5499659e669so2760852e87.3;
        Mon, 10 Mar 2025 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741596721; x=1742201521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsfdUyH3zrjTycztjPtzayYh5FQ+lsz4U78oE1AJhhQ=;
        b=hFpWUUFlhUBqzU/xLjMJnZII4nrRH+1Ed2t/KU4cZ0ZfL3wSGZCMhJp0mouy8ygKhF
         rGamw3wPuEeqcT5bLGXwDk+hvs+EVSbdNLLojmHwsJuzj2eIiKzkYfQPY55aNsqdzIbU
         4xnesGpZnYfzQHYb1cQf7mJmo1VGpTFElR/F9mvZnyOTZ6wRlKy/Fv2UR5GfByoZpKRB
         yuqPEo8Ig/aZbwoLfDuJiGq1iiXos7+C9KoNXpaSI+WDiuxjLTZCHYIm8A0lHyJ9Jsdl
         D3qLD6WFzVf5nA58adlnhGMs1XFsiBtP1qSEpLRzhRCa1zlKZBlG1Y9qi09z0ulknGxm
         bDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741596721; x=1742201521;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsfdUyH3zrjTycztjPtzayYh5FQ+lsz4U78oE1AJhhQ=;
        b=bivriglGU8//5SibqpjPX+pRCq/AxrkCswieIhXG38A60wxkox4LoNgfJaSb7zq/gd
         abC6+wJvcxt2xWo6l+agYjC+48D1fe3VxdkRFyp8ebJkRfNKE6/9oZsRpCjdMXt/L/Et
         5qm85JYd2BSv2NyRZfMJkj4nEZK6D7eX+Yu0W2Lh9cwwctBX4YM+lUdT6bJHQFuUhM0M
         sWGZwAHqDo8P+OdULx/QRHbcSxMCBqLteIAgofScGiUuehgrKekGu8KM8X3KvANcO7A0
         MlpZgpOMYcvY/UFkmMqKjre0vVWm8B8oSLtI2wUGCxm17wOuzpoUKIzQ9v/Yf1DaGBbM
         gP7w==
X-Forwarded-Encrypted: i=1; AJvYcCWpK2V0WM6ZHf92etCE6B3mRcnFCt1t9JqgrWaU+zaqKbCCRrGp+unARlXUhboXBiKkuriKpD3wFkrWEflQhlA5@lists.infradead.org, AJvYcCXFkkobfx3BKavcd4lKBuE8K/5KvGYGGtU3AE8AmIFOOyuirJ9QmH0seDyYOaw49FWjX/a6K3+B2ufbcEmaV5I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwT6Jwe5+dxqEWtKrek+6I/yUeUbU67X+eaf+KoDDfXste3MLs/
	WmZJImh6Qn+/qHfcq0NRYDk7yXnegCkArE+8gCLKKMFIJLagGE3B
X-Gm-Gg: ASbGncuHuNQ67UlBfYCyFxv/SZI9MZs4zj1bVwUG9P09+f/aIlI19wCTJAMPuw/lJHl
	3ys+PEuW1d/kmTjZS3LLod+6XezuPJDVZnqe1WzIH1GyriHPFyL6YP5tOEMGRC+g6Pa4K17ylvh
	W6VMsj7CP4dYcF/azgKBd5Ma51GIeWCh/1aV7QypUmoOIn7m+WsFEEWvxZIHVkU2ulXosJZjNfj
	Kr3XHlBTBWEGU9OEVBi+QoncEgXQTj77jJzpCZgyi5WRhiXjBhX2l38inF5Pq0w9ej5VaffziKx
	+ybh6tMRPd7XNIKkzjrzO1z/2wzM+u7kVDbsw+PJkIbKATkTDOdB6dO4T0pa5HfcatSC6Mmv6Er
	6y9RHvYWkaIUDjufYA5KNyYYSMUY1nYHR
X-Google-Smtp-Source: AGHT+IFDQsKgJjn1vFKF2s3Fxd3y5bXHQKgGDaupCdFC2qHxM/nNEqPRZZXYMIGlgyqsvYZzWa3pXA==
X-Received: by 2002:a05:6512:3da4:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-54990e5d442mr4212084e87.18.1741596720469;
        Mon, 10 Mar 2025 01:52:00 -0700 (PDT)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc48dsm1369280e87.187.2025.03.10.01.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:51:59 -0700 (PDT)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey  Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro  Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Sun, 09 Mar 2025 23:18:50 +0300
In-reply-to: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
Message-ID: <87wmcxs1xw.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_015203_461991_A9678CC4 
X-CRM114-Status: GOOD (  17.51  )
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


Hi Nicolas, Tomasz,

On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit=C2=
=A0:
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated
>> by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> {flush,invalidate}_kernel_vmap_range calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>> =C2=A0.../media/common/videobuf2/videobuf2-dma-contig.c=C2=A0 | 22
>> ++++++++++++++++++++++
>> =C2=A01 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index
>> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
>> bc888a84a95d5 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				=C2=A0=C2=A0 enum dma_data_direction
>> direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.
>

I have re-run my tests on RK3399, with 1280x720 XRGB capture buffers (1
plane, 3686400 bytes). Capture process was pinned to "big" cores running
at fixed frequency of 1.8 GHz. Libcamera was modified to request buffers
with V4L2_MEMORY_FLAG_NON_COHERENT flag. DMA_BUF_IOCTL_SYNC ioctls were
used as appropriate. For kernel mapping effect test, vb2_plane_vaddr
call was inserted into rkisp1_vb2_buf_init.

The timings are as following:

- memcpy coherent buffer: 7570 +/- 63 us
- memcpy non-coherent buffer: 1120 +/- 34 us

without kernel mapping:

- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): 42=
8 +/- 15 us
- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 422 =
+/- 28 us

with kernel mapping:

- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): 52=
6 +/- 13 us
- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 519 =
+/- 38 us

So, even with kernel mapping enabled, speedup is 7570 / (1120 + 526 + 519) =
=3D 3.5,
and the use of noncoherent buffers is justified -- at least on this platfor=
m.

--
Best regards,
Mikhail Rudenko

