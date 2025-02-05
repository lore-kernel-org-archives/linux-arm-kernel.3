Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA551C02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=; b=Sw8r0DjKU8YYT8WevfqGEHr2U1
	CJoDIkR6AR4+g6Zr/CpmyNuVSPvh7JPHA5TggNIckNN67YX8CyssGpep62gfExwFWVUP51AhcYGGE
	MRNjUDDWleZbBGV8Y92T9tRDWdTXdUh3ycRA3YQMRRC6bpCS+eP5f8g+xn33NIV3Lr2t8R9RTOD/t
	xsmFwd1F3KheHaLOrvt+5FCe4c52wvGAdxj1CxDnss4Ql2UWw0CW6fQeYkZf5HSGa8k22jFiBxB8R
	+Dmd/7zHdlhFLnayScR8OipbMH+Skfq0QkJEUb4oqjSgGCVMTmxIcmvZYfVG/JUBOm918r6stbRf5
	MDjQo2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjpY-00000004D5d-3fsK;
	Wed, 05 Feb 2025 18:08:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjoD-00000004CqX-0xoe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 18:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=; b=lpxgO4ujJ5ng1X/p+zuZAZ9z/m
	P4104yjpA69RYsQVfSaNGGjKJ9qB0p8f5RXYKlZDhnZ52/h2MPFW6it2J4XqtDi9PBFKjkx1O2nE4
	uUONDjN4K/+SJ5JQE/NT9SvEkxr1bDkal1THvfdgh2F45+tfKcGa39TL73Pa4kXfHfqAV4AuHGjkD
	gkgOgOIcgxWaOucQcp7bvsuzV+yZVpbThz8pFvUerp1hYAF4ZEzXwAVxbiqEAj/50C1PbCNVqDrqQ
	TRhD1TDkhFZi3OY95BG24AfLm7UKHFI2VA6zF8Fz4MN5Jtqe1cT3JdO528OL/xP2ReIvx1WTmo3Kt
	mS/axS+w==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjoA-0000000GkPV-1Gty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:07:32 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-46fa7678ef3so978861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738778848; x=1739383648; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=;
        b=0IhYr9aPOiHtvVL9+/kuPdkEUoe3orM4mw4anpPG9qthGGYb217hmENWu2iRpHqjl3
         1Zwy5vxe34P4L758Y3iEPzkgG+jl+INqfTwKMST/EIRURyWzNqk1erSxJuzP0SYH9sbP
         Xo8gRIHmio68aGEJmHmeHOTWrgdQVSubKj1+s1ivrUTUcB1Y6ZgL8aTFalidrzHv6mxo
         r8dY9kHQERImFl9PYANFLZLtkgA9kib567TXYObD3l9m9NyRmaTvhLz8sDj59kRT//8g
         UgW6Uc/6/ENoORCWXFl1zvvZffcvEhZI9+l8trq1opYmRViRtxrjcKPtY5+rWNEzegqx
         ku0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778848; x=1739383648;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=;
        b=tBSmNxhEh6Z+aElKgkyb7cWrNrZpFngYR1Eq8hZSnvbUZjj20el/MOIjzmBKhScC+P
         hzuTAiAhKTL10LB/+OoBrAmgsT6s7FEwprEUXiptB7/1KClV1XZICdOmMs48h8agpyJt
         d8xEtksugvIak3AUFsEkL79SX3Ql+lgvVI4k+tPiiZbIc3DLjIl/jDLxMx3Dqo+o5RO6
         e+qzd9EzC71yTRoVjkmvCu6KNF4EwZBgR1tq6jMggwRkEVFRu/KlRi0um2Gc5ux2NY2j
         Fkm4Fk9GdXoAmxshLSOUuQvaFc97zhPsUZI5AxLWGDk3aoEi8eSXqVUV/S3votMUt06+
         3xMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOSGr+GYGfh8eLYbm98WPcrBzjigSSiSBx8Fdk5LaiufTJDWoaMDQLUWp9JMdR0Oq5gvjiTZ6GhGivUvs9eg30@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8SmicQeo/lDxArqhwbbGY7kY3seO/P5oCw53olcRICZiJ90Xv
	Tcey3i7dGiTrzWj8Y0VW+SllwrWHUyJ8Y/+W29A8Has7cvYZO7qqSlumuzBZ8PM=
X-Gm-Gg: ASbGncta5FLgMXIwvJfJirFJlfSo9tuCXQzDJdwjV2A+OlzDQ5Wnd+A0ccHicUuVknZ
	O7/xj18SM05KXA6+4xj8Etem0bSUMZWP8ytSNcC6OCpOA24KOvB6dVsqHh90cVR/U05Gme/DkMg
	C1mmcVNF7DkVHNKTXwQlUZZ6r8p/+j692w30gJhOxD4B/nAvpDr8VozEV8oPNKGyTy+5NMtSkAq
	yDaD2D7+8FielC7bFvgEm9rPeNinseB3kxyNVYCslYxISLpOyNTwS0icFBoGiFCyWcMCfRixuzs
	Yi9nnuCltGTPtcoC
X-Google-Smtp-Source: AGHT+IEo4hXzx1g4KENBMeo2s9vL7H7kP3tcfvoRUkgZj0tj3tMn7WAB4E53kizdrimAnj8XyGNu6g==
X-Received: by 2002:ac8:7e93:0:b0:467:6833:e30c with SMTP id d75a77b69052e-470281e8607mr53959051cf.30.1738778847693;
        Wed, 05 Feb 2025 10:07:27 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4702c56c62bsm7919921cf.28.2025.02.05.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:07:27 -0800 (PST)
Message-ID: <9b5104631f827fe44ad1030c971c72fba9a8ac90.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul
 <vkoul@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau	 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
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
Date: Wed, 05 Feb 2025 13:07:25 -0500
In-Reply-To: <20250205-robust-tall-parrot-69baf7@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
	 <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
	 <20250205-robust-tall-parrot-69baf7@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_180730_524835_B9CA619A 
X-CRM114-Status: GOOD (  48.53  )
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:53 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> On Tue, Feb 04, 2025 at 01:22:58PM -0500, Nicolas Dufresne wrote:
> > Le lundi 03 f=C3=A9vrier 2025 =C3=A0 16:43 +0000, Florent Tomasin a =C3=
=A9crit=C2=A0:
> > > Hi Maxime, Nicolas
> > >=20
> > > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> > > > > Hi Nicolas,
> > > > >=20
> > > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =
=C3=A9crit=C2=A0:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > I started to review it, but it's probably best to discuss it =
here.
> > > > > > >=20
> > > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wro=
te:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > This is a patch series covering the support for protected m=
ode execution in
> > > > > > > > Mali Panthor CSF kernel driver.
> > > > > > > >=20
> > > > > > > > The Mali CSF GPUs come with the support for protected mode =
execution at the
> > > > > > > > HW level. This feature requires two main changes in the ker=
nel driver:
> > > > > > > >=20
> > > > > > > > 1) Configure the GPU with a protected buffer. The system mu=
st provide a DMA
> > > > > > > >    heap from which the driver can allocate a protected buff=
er.
> > > > > > > >    It can be a carved-out memory or dynamically allocated p=
rotected memory region.
> > > > > > > >    Some system includes a trusted FW which is in charge of =
the protected memory.
> > > > > > > >    Since this problem is integration specific, the Mali Pan=
thor CSF kernel
> > > > > > > >    driver must import the protected memory from a device sp=
ecific exporter.
> > > > > > >=20
> > > > > > > Why do you need a heap for it in the first place? My understa=
nding of
> > > > > > > your series is that you have a carved out memory region somew=
here, and
> > > > > > > you want to allocate from that carved out memory region your =
buffers.
> > > > > > >=20
> > > > > > > How is that any different from using a reserved-memory region=
, adding
> > > > > > > the reserved-memory property to the GPU device and doing all =
your
> > > > > > > allocation through the usual dma_alloc_* API?
> > > > > >=20
> > > > > > How do you then multiplex this region so it can be shared betwe=
en
> > > > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > > > >=20
> > > > > You could point all the devices to the same reserved memory regio=
n, and
> > > > > they would all allocate from there, including for their userspace=
-facing
> > > > > allocations.
> > > >=20
> > > > I get that using memory region is somewhat more of an HW descriptio=
n, and
> > > > aligned with what a DT is supposed to describe. One of the challeng=
e is that
> > > > Mediatek heap proposal endup calling into their TEE, meaning knowin=
g the region
> > > > is not that useful. You actually need the TEE APP guid and its IPC =
protocol. If
> > > > we can dell drivers to use a head instead, we can abstract that SoC=
 specific
> > > > complexity. I believe each allocated addressed has to be mapped to =
a zone, and
> > > > that can only be done in the secure application. I can imagine simi=
lar needs
> > > > when the protection is done using some sort of a VM / hypervisor.
> > > >=20
> > > > Nicolas
> > > >=20
> > >=20
> > > The idea in this design is to abstract the heap management from the
> > > Panthor kernel driver (which consumes a DMA buffer from it).
> > >=20
> > > In a system, an integrator would have implemented a secure heap drive=
r,
> > > and could be based on TEE or a carved-out memory with restricted acce=
ss,
> > > or else. This heap driver would be responsible of implementing the
> > > logic to: allocate, free, refcount, etc.
> > >=20
> > > The heap would be retrieved by the Panthor kernel driver in order to
> > > allocate protected memory to load the FW and allow the GPU to enter/e=
xit
> > > protected mode. This memory would not belong to a user space process.
> > > The driver allocates it at the time of loading the FW and initializat=
ion
> > > of the GPU HW. This is a device globally owned protected memory.
> >=20
> > This use case also applies well for codec. The Mediatek SCP firmware ne=
eds to be
> > loaded with a restricted memory too, its a very similar scenario, plus =
Mediatek
> > chips often include a Mali. On top of that, V4L2 codecs (in general) do=
 need to
> > allocate internal scratch buffer for the IP to write to for things like=
 motion
> > vectors, reconstruction frames, entropy statistics, etc. The IP will on=
ly be
> > able to write if the memory is restricted.
>=20
> BTW, in such a case, do the scratch buffers need to be
> protected/secure/whatever too, or would codecs be able to use any buffer
> as a scratch buffer?

They need to be protected yes. Its not very fine grained on the platform I =
work
on. When that protection is enabled, the decoder can only read and write fr=
om
protected memory. I know there is platform were it can read from both, but
generally all IOs regardless what they are used for endup with the same
restriction.

Nicolas

p.s. since Khronos seems to have adopted "protected", perhaps it will be ad=
vised
to go for that in the end.

>=20
> Maxime


