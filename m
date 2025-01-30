Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C50C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vrukcyab91NQAAPHSNd07R2nM2xtss7X+LvbFgz2NCI=; b=XNxNbSgMNJfKHCfWrAvahppiji
	tJD3jI+ZFCMv6wuu97cbKqHeJ8ysK1I0fd2qHRTbOpm8RvaYEoZbjR3qHlPy3+ysYXTPLtRc6WKZJ
	MFACDm4R5oWZ37CwYUb0GPLh8c55JKMwMr7bV4/m1D4b3i2k7MIOPePBjLjZ7nJRfLNiPnl/nO4UR
	Row0PhwpDg4nXfeSZ27grzuPhqHjmdWY20uZJgn0qCXSsuvu97jYW691fCWtNM5jMTLleEUYAZ4Z5
	D/FMCiL1TnK7nU/Wbn52SRGx74QCIoqvA9tH9FNaQIL/KH3jun6o7yeAT+pFg75c36aSOCK3Y8+B/
	fVjme67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWyp-000000096k2-1C7y;
	Thu, 30 Jan 2025 16:01:23 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWxT-000000096Up-3bxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 16:00:01 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b702c3c021so93052585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 07:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738252798; x=1738857598; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vrukcyab91NQAAPHSNd07R2nM2xtss7X+LvbFgz2NCI=;
        b=rEDjnuk8crLE59MGcpjvsh7VjLS4gVgczVT/Np2KeJCpXFv+SUl4nvslw9t87rP5Du
         Ik3cH/Ic/+tDlwKlYRLF0hOGZWZQybTMIfApHO2H4Lsum4E/Fqam1Cz8WXkFGtaKi6HD
         gjHD4HRdtO1hK48zwxuwSnEvps2A1J/4Mu3QMeECfDBLteuc5lBiiGtR37EEQp5ulx9Z
         4Mbu3zAf+pGcArEMaeBKA7WKpNN6dRaY3g5/RhidabdKaUg5uWFwLzbhlIRdQQYjlWKg
         L7Awb7irrqxiXVmd/YFVchYtHKCqk8W6HZ4bPzo6hHvAwPvqCff40lrV6tvAelQFJF4+
         TCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252798; x=1738857598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vrukcyab91NQAAPHSNd07R2nM2xtss7X+LvbFgz2NCI=;
        b=MLuXRWVaTo3AyufBUeBO1dH37lrdoDIDiy7OvU5qHLC9W8d5+Gfk/XBtngb4UBraWQ
         n2oFSOSPcK5SQcag/gBNGSYBVryiNzQyZZGoP6obKxBp11DKmCmEaVRtLRWEAq+KgxLt
         AR6vDAWtJSJF8htp3Aai+B4rL6AWWlEVI560IEWOgcdXVpvSc4bd4PeLN3XPPlMSVJMM
         afNC/FWSBV6wqJrTAdAUWn8aTkOtZ+9MJOKWcqpyRZk2bcuR84NdOGt6NfLnUaL9vyy+
         6Gq0hkOXcz6GE1FaSXqvfiRsin/otN1ia/ZndrRssU0kE6lVYVm1vhEAw9NifeayHi9k
         QAEA==
X-Forwarded-Encrypted: i=1; AJvYcCUqAcQ1zgV5Afx+HpKaIILucLg2kZaZOpncfwiOUDOljRv8twngBDkTSSXvJb2Be/dGeBKzaLyhuCVl+oCZBmg1@lists.infradead.org
X-Gm-Message-State: AOJu0YxldOFsm4G8Xwha8W0YyW+Bvicc3PNFhP8FB+gYdiCfyD9sn2GK
	G+L3x9KuP4Wvu1KviltHxbDerH+fR3qEaUcdKd/5DEI7FUANucW10i9BudrKqkA=
X-Gm-Gg: ASbGncv7unXs/EbkZjOWXASbDZVBplI+66W1eSrYJhAiyvTjOX679w2UWo85NzuVjZR
	rZceaN8Rrh/7Vp5LBZPc7U030uxOKkJyidMMb7at9i2GOfY1r25FQsRfiTBvfS63dGb1rALQjev
	LKJiiua7RVXRWJqIcBDgCiuUTGYFSgu9cElKqJ9guLsvsJDx+imChLlE/AnHlJ7JUsysbpUPJws
	Y5hNp1TlMzViazsPOZchPBnlQzIJ1WpPeS2xtJoecQ2YD8kZrR9YluJNO6SOoYrOUu8574E/RI+
	IYfQDUCAUIEIPIQ2
X-Google-Smtp-Source: AGHT+IHjdyr1ZGxcyMCqDyCVkI8EVFcDwH70UC+E+hsL30A1qjTpY04odV1a3HSLhMUSwyh/u08bDw==
X-Received: by 2002:a05:620a:44ca:b0:7b7:342:a0a5 with SMTP id af79cd13be357-7bffcda883bmr1361614185a.55.1738252798246;
        Thu, 30 Jan 2025 07:59:58 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d14asm85504285a.104.2025.01.30.07.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:59:57 -0800 (PST)
Message-ID: <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>, Florent Tomasin
	 <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey	
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Date: Thu, 30 Jan 2025 10:59:56 -0500
In-Reply-To: <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_080000_161899_219D0538 
X-CRM114-Status: GOOD (  28.39  )
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

Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> I started to review it, but it's probably best to discuss it here.
>=20
> On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > Hi,
> >=20
> > This is a patch series covering the support for protected mode executio=
n in
> > Mali Panthor CSF kernel driver.
> >=20
> > The Mali CSF GPUs come with the support for protected mode execution at=
 the
> > HW level. This feature requires two main changes in the kernel driver:
> >=20
> > 1) Configure the GPU with a protected buffer. The system must provide a=
 DMA
> >    heap from which the driver can allocate a protected buffer.
> >    It can be a carved-out memory or dynamically allocated protected mem=
ory region.
> >    Some system includes a trusted FW which is in charge of the protecte=
d memory.
> >    Since this problem is integration specific, the Mali Panthor CSF ker=
nel
> >    driver must import the protected memory from a device specific expor=
ter.
>=20
> Why do you need a heap for it in the first place? My understanding of
> your series is that you have a carved out memory region somewhere, and
> you want to allocate from that carved out memory region your buffers.
>=20
> How is that any different from using a reserved-memory region, adding
> the reserved-memory property to the GPU device and doing all your
> allocation through the usual dma_alloc_* API?

How do you then multiplex this region so it can be shared between
GPU/Camera/Display/Codec drivers and also userspace ? Also, how the secure
memory is allocted / obtained is a process that can vary a lot between SoC,=
 so
implementation details assumption should not be coded in the driver.

Nicolas

>=20
> Or do you expect to have another dma-buf heap that would call into the
> firmware to perform the allocations?
>=20
> The semantics of the CMA heap allocations is a concern too.
>=20
> Another question is how would you expect something like a secure
> video-playback pipeline to operate with that kind of interface. Assuming
> you have a secure codec, you would likely get that protected buffer from
> the codec, right? So the most likely scenario would be to then import
> that dma-buf into the GPU driver, but not allocate the buffer from it.
>=20
> Overall, I think a better abstraction would be to have a heap indeed to
> allocate your protected buffers from, and then import them in the
> devices that need them. The responsibility would be on the userspace to
> do so, but it already kind of does with your design anyway.
>=20
> Maxime


