Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD4EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=; b=DhHXunHzOWgSLbleVUZELA+qL0
	u7ixlpvIIthJg3eXzqsQS9v8PA/FI7PYm82lRHnm/1sSBcgTpSHMyBxxTiYTK5TGUofwmNpDi5MKp
	TsZ/Re3cBU5GSLPI8I796M5uptgk6fc9Zy9WM8/PGaBSwqOfMOTD/UVZn0uUOBMTevE2CW09vCKBf
	rM1km922oEafrlX72ddmDoxxWC6NXrEB2xmySgfEuXRBj2mu19MvXjes9cAdgPqL/a3Ol7ev4wpvO
	cI5OAwuuf45UuHDjo3ZdWxyOoBDqIzpV2wUYcCItbZkrHJUlMH8funIgww75Pnv2zqXNU6p+a5eOj
	TYjtiWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjwB-00000004Dqt-3FvT;
	Wed, 05 Feb 2025 18:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjup-00000004DiC-3kmF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 18:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=; b=mk3/nVYJahNXGJzUAQQDzv2lTR
	MQikx5nl6xI49w3P3dianGQX+NtLQEfQs/4WjE8/11Vt4Mf+PGlG6a6LExwGicIMJQRjSWNcUnfjl
	k1TK+2KcHRt6kK/h5il641HMoGil6jFg9zmFqTsOiXEp7w4XM36NNAlEIHEKKg7lk2mryZHylMSpu
	TCVR0u8uek9+hZ7SQmox6cE3vByUr1vwF3UB8hsy7B0jue+bGOSfs7FvPAkq6xtZJYehSl4BW9X1f
	q5FsIyfvvVmlkZ3jqMZGvu9PvsyDU6K7aFq7PAeDaNsl+W3ehZRvlHbJSmABY9RwjI6LLkvSy50Wf
	6nEsyOvg==;
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjum-0000000Gkcy-2u22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:14:22 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7be6fdeee35so656985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 10:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738779256; x=1739384056; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
        b=vcBCyiiD+OghxCIuXCUf9Zh2ExO5bpjkIh2q9GBZS3nTHXcxIj3Twky2Fh5cxS/DKg
         bugp7xIO0AMAUQG12bSQxvQ+6hD2WsENy4zAZsqiEJDqxKGu1hJVlrE04YZAbBc5XN/q
         E9vi213rRabEHDdEPgSrPXIadpGEajW8Ao/PFJ5/zNQb6MLmisr71BIXKKX7k9Do0x5i
         68cMSCgHi7NO8xcuBlsFN93e2xo4tiDqiQtaQE8549BujHWyvrPHaeNbtLaSxRkx3sRQ
         qUaf5Ctexzv1pORykeeCbLCraRD3GphvaISkWSid/lEDCkaMOPyFwZcqek0KnV4TV6sG
         X1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738779256; x=1739384056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
        b=ptS/x05+YAz/Gp0SGT1smGJeu3bzEIAAe2Vnd4S3CPjuSPEH3KVft1Dq+0Lu9tLoHB
         dKI1GDVBAPYO7EtjCmLUU+5no+/ALiFrVa/TTDT+y7StrGR9v01qXvmHKiRQmiPQXD89
         RK/KoXftRoG3gv7aMtXCixnJUTOJJJKBX5AgMWJiJyOtWIPJ7MCecI5xxrR4O1yuBp5y
         8LBX5s9p2hVq0B68LcCXtNQE6dh1prmAGLDmJHATLXJyyAX3l7d8vDAmIvMUfGulweB7
         ew3OEalTu9FGsg2Eeqja1l+joiOFNu4nKs81+oZYqSXE5OFkjmZANfGJZhRRCLWeWmof
         ld4A==
X-Forwarded-Encrypted: i=1; AJvYcCVeBaEuhKhbNqkumFrLA2P+KbldzdDIwSI0yjuUbx4lmgpe3jfEKwOZh9V4irYzFE8Ef32bf0d9ldq9Z8PuZ68T@lists.infradead.org
X-Gm-Message-State: AOJu0YzFkuD9bl3LdrHlBfWzCJDS2mT+O7uR+E8TEurzr9r8iYYpMZYe
	n8Gfey7+KcGidHEqwqLd+VUbYWSQAFM+ufzFmRDPIVDq5uNt6vCZXQmU23p2w9I=
X-Gm-Gg: ASbGnctxmeESCI5EMoMNah0UhsLqyxPNUP6TzPIItiR2JYQ6Bmguu/QKqFOdg07m2R9
	HwN8lI3B3JrI9KMfB9DiWkL5zFgL8y/ABl+HmexbpVxAPqHPyhjBV8EjGitJMO6BVmiEr+m+Dd6
	swytcd/44Cis7rBJpiCP/UC9ENQiE8jVz3PIs7WZbfT48HNxkVFMUnUzWZrSTGqN/Nhv2vp6cm0
	N/4/ss+aYB6m2RrbXo/f8fcf4j5fEK/cULOfJZQ8TFzwdJXWf3ObvuZqmOAnoV2uWm61Px0d/XH
	UOZG/vDw7f0uhLd5
X-Google-Smtp-Source: AGHT+IFnnl9J6glnO7ave49R6IT/Ma233dmOTJ29e9pjZONK8+NxUm972OtvZRgYYQ8KwgzNcY3a5Q==
X-Received: by 2002:a05:620a:d8c:b0:7be:3d2f:16fc with SMTP id af79cd13be357-7c03a029359mr549685385a.51.1738779255841;
        Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a9047eesm781781685a.72.2025.02.05.10.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Message-ID: <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
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
Date: Wed, 05 Feb 2025 13:14:14 -0500
In-Reply-To: <20250205-amorphous-nano-agouti-b5baba@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
	 <20250205-amorphous-nano-agouti-b5baba@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_181421_022192_E777090D 
X-CRM114-Status: GOOD (  50.39  )
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:52 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote:
> > Hi Maxime, Nicolas
> >=20
> > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9cr=
it=C2=A0:
> > > > Hi Nicolas,
> > > >=20
> > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=
=A9crit=C2=A0:
> > > > > > Hi,
> > > > > >=20
> > > > > > I started to review it, but it's probably best to discuss it he=
re.
> > > > > >=20
> > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote=
:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > This is a patch series covering the support for protected mod=
e execution in
> > > > > > > Mali Panthor CSF kernel driver.
> > > > > > >=20
> > > > > > > The Mali CSF GPUs come with the support for protected mode ex=
ecution at the
> > > > > > > HW level. This feature requires two main changes in the kerne=
l driver:
> > > > > > >=20
> > > > > > > 1) Configure the GPU with a protected buffer. The system must=
 provide a DMA
> > > > > > >    heap from which the driver can allocate a protected buffer=
.
> > > > > > >    It can be a carved-out memory or dynamically allocated pro=
tected memory region.
> > > > > > >    Some system includes a trusted FW which is in charge of th=
e protected memory.
> > > > > > >    Since this problem is integration specific, the Mali Panth=
or CSF kernel
> > > > > > >    driver must import the protected memory from a device spec=
ific exporter.
> > > > > >=20
> > > > > > Why do you need a heap for it in the first place? My understand=
ing of
> > > > > > your series is that you have a carved out memory region somewhe=
re, and
> > > > > > you want to allocate from that carved out memory region your bu=
ffers.
> > > > > >=20
> > > > > > How is that any different from using a reserved-memory region, =
adding
> > > > > > the reserved-memory property to the GPU device and doing all yo=
ur
> > > > > > allocation through the usual dma_alloc_* API?
> > > > >=20
> > > > > How do you then multiplex this region so it can be shared between
> > > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > > >=20
> > > > You could point all the devices to the same reserved memory region,=
 and
> > > > they would all allocate from there, including for their userspace-f=
acing
> > > > allocations.
> > >=20
> > > I get that using memory region is somewhat more of an HW description,=
 and
> > > aligned with what a DT is supposed to describe. One of the challenge =
is that
> > > Mediatek heap proposal endup calling into their TEE, meaning knowing =
the region
> > > is not that useful. You actually need the TEE APP guid and its IPC pr=
otocol. If
> > > we can dell drivers to use a head instead, we can abstract that SoC s=
pecific
> > > complexity. I believe each allocated addressed has to be mapped to a =
zone, and
> > > that can only be done in the secure application. I can imagine simila=
r needs
> > > when the protection is done using some sort of a VM / hypervisor.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > The idea in this design is to abstract the heap management from the
> > Panthor kernel driver (which consumes a DMA buffer from it).
> >=20
> > In a system, an integrator would have implemented a secure heap driver,
> > and could be based on TEE or a carved-out memory with restricted access=
,
> > or else. This heap driver would be responsible of implementing the
> > logic to: allocate, free, refcount, etc.
> >=20
> > The heap would be retrieved by the Panthor kernel driver in order to
> > allocate protected memory to load the FW and allow the GPU to enter/exi=
t
> > protected mode. This memory would not belong to a user space process.
> > The driver allocates it at the time of loading the FW and initializatio=
n
> > of the GPU HW. This is a device globally owned protected memory.
>=20
> The thing is, it's really not clear why you absolutely need to have the
> Panthor driver involved there. It won't be transparent to userspace,
> since you'd need an extra flag at allocation time, and the buffers
> behave differently. If userspace has to be aware of it, what's the
> advantage to your approach compared to just exposing a heap for those
> secure buffers, and letting userspace allocate its buffers from there?

Unless I'm mistaken, the Panthor driver loads its own firmware. Since loadi=
ng
the firmware requires placing the data in a protected memory region, and th=
at
this aspect has no exposure to userspace, how can Panthor not be implicated=
 ?

>=20
> > When I came across this patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> > I found it could help abstract the interface between the secure heap an=
d
> > the integration of protected memory in Panthor.
> >=20
> > A kernel driver would have to find the heap: `dma_heap_find()`, then
> > request allocation of a DMA buffer from it. The heap driver would deal
> > with the specifities of the protected memory on the system.
>=20
> Sure, but we still have to address *why* it would be a good idea for the
> driver to do it in the first place. The mediatek series had the same
> feedback.

Which got pretty clear replies iirc. The drivers needs scratch buffers and
secondary buffers to be protected, and these are not visible to userspace. =
No
one have made a proper counter argument yet. In MTK, the remote-proc driver=
 for
the SCP (a multi-purpose multimedia co-processor) will also need to place t=
he
firmware data into a protected buffer (with the help of the tee to copy the=
 data
into it of course).

Nicolas

>=20
> Maxime


