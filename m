Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F37C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=; b=IFQnTzlSJC2pYlK2p9rpa0A6gI
	xXM7o0KaN7Ml7dCRQ2v/x0iL3ndsfDMB7/eqFBjsaMe9rnVLm3tVZ4D+4mMQxsoIporWd9mgepTv3
	cdKaBqCSB/WGNXm4H7KGA/bxKhkqkztul4fmRAqfThRjWuMI0EbyuAAEl+qJad7MbVGGpDkCpxEiF
	oawEAREzkZI2EsOogXkfWeV0nmmN8iMTpi0CT6LLqJR36L2RWtcw/7KElR6ynU2Y+YXlVPABcpyXK
	kE4NVz5zV9ivATmytI8ocYZG686yeKcZgXJjQE1wMOFcDGzdafwcDY+3pLV1gb4zb3qDGsSoLAJ/y
	TVhbW0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqcB-00000009XWQ-2wZ2;
	Fri, 28 Feb 2025 03:00:39 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqac-00000009XOt-1SuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:59:04 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-471f16f4b73so15940681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740711541; x=1741316341; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=;
        b=qcJF4eDjIBQhK6ZsahaBlHFawLR4fVYbHxy94Kysl4CQ+xXK1DDtDTyCG4txJxtvd5
         9j4oyr8+c4bRIvGoQ004YPC9OkCTRuWVOR/zKh2BnwTLgVe+dFd+XWBP4tOnos8CALHl
         J1vLo/ehSW8V8VkX6e/FS17jp+JMYg1epiqr27vD6iaqiNx+TWfIBjX/4iJ4s3fQBsoy
         bQYFaVyzjMqWYRcZzxY6cXa8AUHpLu2/QEDhKvch78d3GZINKwpKKgozEwZM59UsOnUG
         vEF4Pk6mwHrSj4LUiqu0b6Yu/sEpCJt6oPL8gJ/zwo+j2ceXaXgeNngqebhdDeecx+DI
         JE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740711541; x=1741316341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSBTER3/6mKcsokqpGzyM31jx70vagZLM9xlfjyEBPw=;
        b=iMqJFiQXxuIMrbXoMRWNfGUF5VhbjwQC1Htbx7tnLiYgjtUszvBaRtBKo6UrebUcev
         GSCR66X+FctxJY1vqGB9MmhyvD1yHZnZqyACA3+tH2hRDcDzhy+QjmL+pNw2VZpcs5Gg
         g1Tl540vYq/VqwwGgQ42QuGfMRgAUNrsZ/YThpjDriRRMpJJrD18Q5GV3v2kzTqGZW+S
         zEZ6dq3wVy0clz45y+9KguKa9Pae/iE1tKkboFofziu45Jzfy7mMh2w72cJIZh+Hexs5
         wgAnf7GZdPC/6oLk5yvTEKsEOjHFnrRHfPE3akWgA9bBQKZXghzLCpmLuyGBNmIZETnR
         j2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXklc+VLZGAkSb/z8+ujMx0zFrmMlYh3wThisoGEZKc3YhBttKPFXeNu7zjxDF4ZtlEziFUEf4dYyiQM785JHl3@lists.infradead.org
X-Gm-Message-State: AOJu0Yynz1ZNn4jHSXWVWReEG9SUxNKDd1R8E9Q6oKRPob26cdwOyB5I
	r9BizWudyrZpKMmbj20+dmwY9RZlWFNn+lj7qDjzDPajHZbUUXMKwNGvH/pqc5w=
X-Gm-Gg: ASbGncu1vrCqs4f53hZ25WusZ/DWotUJfY2jxOnETnGSDZ/IGsPYm6Bp1mnKA7zxc4n
	pouLKXuvdYxaycTg6XVRMFX6qzf02kkzRUkhV1zkBlCbO/devwU+8L/Qu1/huxwAZ7Qvj8f23SQ
	lqOduF6DH9oxjDmJG/O8vXoueYE1U7JdHDA6nrPwcTPU4IwnfWS2gtyxfRwlzPd37RLCSpwR6W8
	SyHkCMTNwOWMRAXt0+DsTcIOsJStRyz3ZuUZ87KiYnFJS3GljBhdR3m8HXvRZ5MSvNROayHXDzP
	zhniLAkwwgnnCM5nL+wiQzip+5JGkpQ=
X-Google-Smtp-Source: AGHT+IHlmHYcYowccW6oMzhl/5F1nvmS0h6Fr8h9oiJzFfTp+G2Z6/HSCK7vqLoUyP0oP4vUaAgFIA==
X-Received: by 2002:a05:622a:130f:b0:474:b7b3:1409 with SMTP id d75a77b69052e-474bc0e8807mr21017291cf.40.1740711541046;
        Thu, 27 Feb 2025 18:59:01 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474691a45d3sm18957301cf.8.2025.02.27.18.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:58:59 -0800 (PST)
Message-ID: <2b0bbccdbbc30c8587f2e3b2ee7bb0a4a1225e20.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2025 21:58:58 -0500
In-Reply-To: <87ldtraz5v.fsf@gmail.com>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
	 <20250103152326.GP554@pendragon.ideasonboard.com>
	 <87bjw9s4s3.fsf@gmail.com>
	 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
	 <87ldtraz5v.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_185902_389918_F9770EEE 
X-CRM114-Status: GOOD (  38.95  )
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

Le jeudi 27 f=C3=A9vrier 2025 =C3=A0 23:46 +0300, Mikhail Rudenko a =C3=A9c=
rit=C2=A0:
> Hi Jacopo,
>=20
> On 2025-02-27 at 18:05 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> =
wrote:
>=20
> > Hi Mikhail
> >=20
> > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > >=20
> > > Hi Laurent,
> > >=20
> > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideaso=
nboard.com> wrote:
> > >=20
> > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > > > Currently, the rkisp1 driver always uses coherent DMA allocations=
 for
> > > > > video capture buffers. However, on some platforms, using non-cohe=
rent
> > > > > buffers can improve performance, especially when CPU processing o=
f
> > > > > MMAP'ed video buffers is required.
> > > > >=20
> > > > > For example, on the Rockchip RK3399 running at maximum CPU freque=
ncy,
> > > > > the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer =
to a
> > > > > malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when u=
sing
> > > > > non-coherent DMA allocation. CPU usage also decreases accordingly=
.
> > > >=20
> > > > What's the time taken by the cache management operations ?
> > >=20
> > > Sorry for the late reply, your question turned out a little more
> > > interesting than I expected initially. :)
> > >=20
> > > When capturing using Yavta with MMAP buffers under the conditions men=
tioned
> > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > > buffers in this case is more CPU-efficient even when considering cach=
e
> > > management overhead.
> > >=20
> > > When trying to do the same measurements with libcamera, I failed. In =
a
> > > typical libcamera use case when MMAP buffers are allocated from a
> > > device, exported as dmabufs and then used for capture on the same dev=
ice
> > > with DMABUF memory type, cache management in kernel is skipped [1]
> > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], s=
o
> > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > >=20
> > > So it looks like to make this change really useful, the above issue o=
f
> > > cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> > > solved. I'm not an expert in this area, so any advice is kindly welco=
me. :)
> >=20
> > It would be shame if we let this discussion drop dead.. cache
> > management policies are relevant for performances, specifically for
> > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
> >=20
> > >=20
> > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> >=20
> > I would like to know from Hans if the decision to disallow cache-hints
> > for dmabuf importers is a design choice or is deeply rooted in other
> > reasons I might be missing.
> >=20
> > I'm asking because the idea is for libcamera to act solely as dma-buf
> > importer, the current alloc-export-then-import trick is an helper for
> > applications to work around the absence of a system allocator.
> >=20
> > If the requirement to disable cache-hints for importers cannot be
> > lifted, for libcamera it means we would not be able to use it.
>=20
> Meanwhile, I have posted a patch, which re-enables cache management ops
> for non-coherent dmabufs exported from dma-contig allocator [1]. It is
> currently waiting for review.
>=20
> [1] https://lore.kernel.org/all/20250128-b4-rkisp-noncoherent-v3-1-baf39c=
997d2a@gmail.com/

Thanks for you work, this matches what I was referring to missing in my
previous reply.

I don't think there is any intention to block or deprecate it, but
partially enabling leads to problems. Do we need something in the SG
allocator to ?

Nicolas

>=20
> >=20
> > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/video=
buf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
426
> > >=20
> > > --
> > > Best regards,
> > > Mikhail Rudenko
> > >=20
>=20
>=20
> --
> Best regards,
> Mikhail Rudenko
>=20


