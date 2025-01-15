Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15978C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=; b=kA5kwVfNwaTHuyXyZcweQWxYm6
	ng/1O1PorlEtrG9UCev7KmVAqn6FqEyQMPHFRGQREn4aDfIT/xVlNlrHshqGAO3/n38OnwcA7U+sw
	GExX/8r11nRyUEOvTKHOL8XmZBwGr3WuVvkbk8ud8reZLLf+9RcV+3W5+zfMlyglH7RX+Qe/0fXQ+
	Rvd2k22w22VuOPefpQfHm4w++6RAcyF066xYlFuzngl3alcoXf1Nkcr8YGKT77DeMRZ8l8SXlopNR
	Fy2QxLa5tDOtnPAcT4r9uHnabwuZxbmYFO/8MdJ/I/otKTvstiCFbXhn/u/lInIB4khHOoCeK41Ma
	GP/HhH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8rJ-0000000Cs7C-3bZD;
	Wed, 15 Jan 2025 19:15:21 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8pW-0000000CrkN-08uk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 19:13:31 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso4537285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 11:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736968408; x=1737573208; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=;
        b=DurtkCyvqP4VpfW3e5g3y/dXp6jRwPnNGZe2LAhGiBqSMBvrHejn/r3v6YkhCcwFlf
         vY5wmkMxebkLcFOyLDD3yFN+khqGzCnmIx8WAE4E41Ir/3+VXzOj77zpYAskOVL8B1fo
         nLnujlTB7j8xw0ybijIgQZ6/QD2r0WAgENnwnKcHSmCKM+T5GdGc2I11VeTm0VYUOzBn
         IyOUPzeBhMLohO2r+1ivL+/EXx7pcUCHXkXQTtxWg7sPHp9UePD+1pODaHn19fu0btj5
         ELL0dxi+lmeHo9n9Vb3G6nJxTvp87Nk2QMUPoy+zyWQglWgCK60NQJGn786kti5IYh6v
         ok3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968408; x=1737573208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLPSjMEctNCr0CfmUH65A3G8flj6/XxbgTXl0MggbIs=;
        b=xA/zQzBA3Mzhj7gNhGBkvCbJpwSe269zpvAdwxv5+093fXmu4wyFct8EUYi2xKW2t/
         Mrng/gl4X7gjZIPYRK7dAsBHO3vO56+1a+4CClxYuxIp5o0QGYEUeJF90yptsyStoX6T
         V6rNsMqekw0IbA0lRz4CfS3RHHD7g45d84lsHygvxObIOmAGAYN+fkqKLs2RZ+sH4Trl
         zeQY9/9QW7R0GQ1jxnGiZbOFOU5Hy/XRl2h60FWXR/0lFwIpdcRzTQXNhuQRd+Wbpb7/
         AywvL75TP6nQ4mpAI9hLxQW/xnktvnsKdJJtDOcEiMxY96t1fXvjPzz8jm5k/LGmhuau
         poYg==
X-Forwarded-Encrypted: i=1; AJvYcCXdEyoxHEl7hcUdzZx4VeErg6JTM3d+mw2pplR5cvNJww8hx/VgZ9FkI+z2cH/PFps0Zv5yupLcyh1YoAu5uM9C@lists.infradead.org
X-Gm-Message-State: AOJu0Yxln6Z93pBCRs74KejfJzJE0Ta3kzo7Wh7ypGx/rv504d7vPfTt
	fdZKYPMMnJpSrCon0JoZORFHSHe13a0oavuAjrOE64uU61LwtP1AnjBfZPbSGcc=
X-Gm-Gg: ASbGncv68BnzZFWsrUy3vdDoR1+seJw6P1b/al1xOOVtn3dTr++fmHb/mjBCJ+t7u1C
	PlIydfMf5P5w51KQcXoecBmrolM7XAs2LIhi4ghGiLXiiys+rHlL+EadIa4/oXPL4yqE8g7kjNf
	lgzSpqt9apBZT+Q56LWXqKX19AAVoCQivUZ2FXu9xnNmGFK7FwdwfXHGVvxdpts6y/fWc7qYXQD
	c0ysK+70p79rRJLV4XSQj/SBPMhN4FaILyP0yNMGihu8NoG9kSmELwD+w==
X-Google-Smtp-Source: AGHT+IFnsoiKe7uegsgPWYDB1RCuZQrLk0csHxrvV++7dz72d6AHNX8tJjks7RFtVLA5aLi/FpTAFQ==
X-Received: by 2002:a05:6214:5192:b0:6d8:8f14:2f5b with SMTP id 6a1803df08f44-6df9b240540mr547388736d6.19.1736968408422;
        Wed, 15 Jan 2025 11:13:28 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade900c6sm67775316d6.111.2025.01.15.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:13:28 -0800 (PST)
Message-ID: <4eaae50515b46545de4ff399bc2365a3c4f9c44f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 14:13:27 -0500
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
	 <20250103152326.GP554@pendragon.ideasonboard.com>
	 <87bjw9s4s3.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111330_068355_0D5CFA3A 
X-CRM114-Status: GOOD (  23.65  )
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

Le mardi 14 janvier 2025 =C3=A0 19:00 +0300, Mikhail Rudenko a =C3=A9crit=
=C2=A0:
> Hi Laurent,
>=20
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>=20
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > Currently, the rkisp1 driver always uses coherent DMA allocations for
> > > video capture buffers. However, on some platforms, using non-coherent
> > > buffers can improve performance, especially when CPU processing of
> > > MMAP'ed video buffers is required.
> > >=20
> > > For example, on the Rockchip RK3399 running at maximum CPU frequency,
> > > the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> > > malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> > > non-coherent DMA allocation. CPU usage also decreases accordingly.
> >=20
> > What's the time taken by the cache management operations ?
>=20
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>=20
> When capturing using Yavta with MMAP buffers under the conditions mention=
ed
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>=20
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>=20
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. =
:)


The manual coherency hints are not implemented for DMABuf, and libcamera on=
ly do
dmabuf. Someone will have to look into that. This is also why this API have=
 very
low adoption, its breaks easily.

>=20
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>=20
> --
> Best regards,
> Mikhail Rudenko
>=20


