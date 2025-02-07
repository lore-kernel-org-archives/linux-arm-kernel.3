Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4820C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OO7oKCeD9B5tOjK9Kxt/Ezp8Yld7p+uTMkHIvw15z74=; b=RfA9Cc1OLvHCgcF4NgXuAZWcG4
	GTvkL/Xwd7lKHm/SYH6cu0uhee11EPIv7nDHmiP3lNahVvs9T16Dw1alFcQctCNMFRjjvuh+EUjG/
	dZrdWskKqgChmfiKXqE63CJ1Vi08w7pWhIOxumdEKGlw5Cbj4iVui8LPaHv0ddTu2xFfrTnCS1+Y1
	oJZbObNiu65okF0QlpcYqEzqHlQ5o9SqpeT6jRSU0WnvG6MCUh5TA+TifUSAZHy6iLJGhjiO617yE
	2g3+62iEZcL8lcM3hyNkvgeDQrmd9R9symHs4U3Q3UuuqhYb8+3F9ZZUk+7MVRWH1YvIvKKEDRe93
	xdijhB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRoJ-0000000AQ0f-2mmY;
	Fri, 07 Feb 2025 17:06:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRR1-0000000AKgd-3ahz;
	Fri, 07 Feb 2025 16:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738946549;
	bh=wivoohQzKrQd6Be3GRYjXHheHFpcjocBVpQVFCpY0Ec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JsF37aokdx/VKD2OChBl+6YAwAPlldoBXBYUSA+zWCQUQO0TULDAbYdKuTpLievR9
	 p8u2i6k5JBa1CVdhWrfvbUKD2SQQPB6zsS/chtMlexq5qFP9VxTZXWC3oIQ0kHEsUn
	 vRji0Xzyws/+zfMIObwdpqszyufOsXlcDGvd9w50r0nsUxD/QsrDlR9H0UfECpuqXV
	 86OM57DXsbGKb4j1DP1e7PvgsxDd3usY08tnC0CQyu8cb01J9EWh3qby1nKPYzkxk1
	 MaLYTausCuz+KTyFflyFsEorb+02AxZvCBvdx39TadnHX4wWdHQemz25pW6xM/Hy/F
	 I/U065c1qnlQw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97EBD17E0858;
	Fri,  7 Feb 2025 17:42:28 +0100 (CET)
Date: Fri, 7 Feb 2025 17:42:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Maxime Ripard <mripard@kernel.org>, Florent Tomasin	
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau	
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
Message-ID: <20250207174221.2decc154@collabora.com>
In-Reply-To: <2cef75795cf3eb1c224f3562134d2ed887dbff60.camel@ndufresne.ca>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	<3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	<1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	<ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	<9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	<1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
	<20250205-amorphous-nano-agouti-b5baba@houat>
	<2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
	<20250207160253.42551fb1@collabora.com>
	<2cef75795cf3eb1c224f3562134d2ed887dbff60.camel@ndufresne.ca>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084232_048251_FA6F0D49 
X-CRM114-Status: GOOD (  62.99  )
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

On Fri, 07 Feb 2025 11:32:18 -0500
Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Le vendredi 07 f=C3=A9vrier 2025 =C3=A0 16:02 +0100, Boris Brezillon a =
=C3=A9crit=C2=A0:
> > Sorry for joining the party late, a couple of comments to back Akash
> > and Nicolas' concerns.
> >=20
> > On Wed, 05 Feb 2025 13:14:14 -0500
> > Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> >  =20
> > > Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:52 +0100, Maxime Ripard a =
=C3=A9crit=C2=A0: =20
> > > > On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote:   =
=20
> > > > > Hi Maxime, Nicolas
> > > > >=20
> > > > > On 30/01/2025 17:47, Nicolas Dufresne wrote:   =20
> > > > > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =
=C3=A9crit=C2=A0:   =20
> > > > > > > Hi Nicolas,
> > > > > > >=20
> > > > > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wr=
ote:   =20
> > > > > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard =
a =C3=A9crit=C2=A0:   =20
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > I started to review it, but it's probably best to discuss=
 it here.
> > > > > > > > >=20
> > > > > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin=
 wrote:   =20
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > This is a patch series covering the support for protect=
ed mode execution in
> > > > > > > > > > Mali Panthor CSF kernel driver.
> > > > > > > > > >=20
> > > > > > > > > > The Mali CSF GPUs come with the support for protected m=
ode execution at the
> > > > > > > > > > HW level. This feature requires two main changes in the=
 kernel driver:
> > > > > > > > > >=20
> > > > > > > > > > 1) Configure the GPU with a protected buffer. The syste=
m must provide a DMA
> > > > > > > > > >    heap from which the driver can allocate a protected =
buffer.
> > > > > > > > > >    It can be a carved-out memory or dynamically allocat=
ed protected memory region.
> > > > > > > > > >    Some system includes a trusted FW which is in charge=
 of the protected memory.
> > > > > > > > > >    Since this problem is integration specific, the Mali=
 Panthor CSF kernel
> > > > > > > > > >    driver must import the protected memory from a devic=
e specific exporter.   =20
> > > > > > > > >=20
> > > > > > > > > Why do you need a heap for it in the first place? My unde=
rstanding of
> > > > > > > > > your series is that you have a carved out memory region s=
omewhere, and
> > > > > > > > > you want to allocate from that carved out memory region y=
our buffers.
> > > > > > > > >=20
> > > > > > > > > How is that any different from using a reserved-memory re=
gion, adding
> > > > > > > > > the reserved-memory property to the GPU device and doing =
all your
> > > > > > > > > allocation through the usual dma_alloc_* API?   =20
> > > > > > > >=20
> > > > > > > > How do you then multiplex this region so it can be shared b=
etween
> > > > > > > > GPU/Camera/Display/Codec drivers and also userspace ?   =20
> > > > > > >=20
> > > > > > > You could point all the devices to the same reserved memory r=
egion, and
> > > > > > > they would all allocate from there, including for their users=
pace-facing
> > > > > > > allocations.   =20
> > > > > >=20
> > > > > > I get that using memory region is somewhat more of an HW descri=
ption, and
> > > > > > aligned with what a DT is supposed to describe. One of the chal=
lenge is that
> > > > > > Mediatek heap proposal endup calling into their TEE, meaning kn=
owing the region
> > > > > > is not that useful. You actually need the TEE APP guid and its =
IPC protocol. If
> > > > > > we can dell drivers to use a head instead, we can abstract that=
 SoC specific
> > > > > > complexity. I believe each allocated addressed has to be mapped=
 to a zone, and
> > > > > > that can only be done in the secure application. I can imagine =
similar needs
> > > > > > when the protection is done using some sort of a VM / hyperviso=
r.
> > > > > >=20
> > > > > > Nicolas
> > > > > >    =20
> > > > >=20
> > > > > The idea in this design is to abstract the heap management from t=
he
> > > > > Panthor kernel driver (which consumes a DMA buffer from it).
> > > > >=20
> > > > > In a system, an integrator would have implemented a secure heap d=
river,
> > > > > and could be based on TEE or a carved-out memory with restricted =
access,
> > > > > or else. This heap driver would be responsible of implementing the
> > > > > logic to: allocate, free, refcount, etc.
> > > > >=20
> > > > > The heap would be retrieved by the Panthor kernel driver in order=
 to
> > > > > allocate protected memory to load the FW and allow the GPU to ent=
er/exit
> > > > > protected mode. This memory would not belong to a user space proc=
ess.
> > > > > The driver allocates it at the time of loading the FW and initial=
ization
> > > > > of the GPU HW. This is a device globally owned protected memory. =
  =20
> > > >=20
> > > > The thing is, it's really not clear why you absolutely need to have=
 the
> > > > Panthor driver involved there. It won't be transparent to userspace,
> > > > since you'd need an extra flag at allocation time, and the buffers
> > > > behave differently. If userspace has to be aware of it, what's the
> > > > advantage to your approach compared to just exposing a heap for tho=
se
> > > > secure buffers, and letting userspace allocate its buffers from the=
re?   =20
> > >=20
> > > Unless I'm mistaken, the Panthor driver loads its own firmware. Since=
 loading
> > > the firmware requires placing the data in a protected memory region, =
and that
> > > this aspect has no exposure to userspace, how can Panthor not be impl=
icated ? =20
> >=20
> > Right, the very reason we need protected memory early is because some
> > FW sections need to be allocated from the protected pool, otherwise the
> > TEE will fault as soon at the FW enters the so-called 'protected mode'.
> >=20
> > Now, it's not impossible to work around this limitation. For instance,
> > we could load the FW without this protected section by default (what we
> > do right now), and then provide a DRM_PANTHOR_ENABLE_FW_PROT_MODE
> > ioctl that would take a GEM object imported from a dmabuf allocated
> > from the protected dma-heap by userspace. We can then reset the FW and
> > allow it to operate in protected mode after that point. This approach
> > has two downsides though:
> >=20
> > 1. We have no way of checking that the memory we're passed is actually
> > suitable for FW execution in a protected context. If we're passed
> > random memory, this will likely hang the platform as soon as we enter
> > protected mode.
> >=20
> > 2. If the driver already boot the FW and exposed a DRI node, we might
> > have GPU workloads running, and doing a FW reset might incur a slight
> > delay in GPU jobs execution.
> >=20
> > I think #1 is a more general issue that applies to suspend buffers
> > allocated for GPU contexts too. If we expose ioctls where we take
> > protected memory buffers that can possibly lead to crashes if they are
> > not real protected memory regions, and we have no way to ensure the
> > memory is protected, we probably want to restrict these ioctls/modes to
> > some high-privilege CAP_SYS_.
> >=20
> > For #2, that's probably something we can live with, since it's a
> > one-shot thing. If it becomes an issue, we can even make sure we enable
> > the FW protected-mode before the GPU starts being used for real.
> >=20
> > This being said, I think the problem applies outside Panthor, and it
> > might be that the video codec can't reset the FW/HW block to switch to
> > protected mode as easily as Panthor. =20
>=20
> Overall the reset and reboot method is pretty ugly in my opinion.

Yeah, I'm not entirely sold on this approach either, but I thought it
was good to mention it for completeness.

> But to stick
> with the pure rationale, rebooting the SCP on MTK is much harder, since i=
ts not
> specific to a single HW/driver.
>=20
> Other codecs like Samsung MFC, Venus/Iris, Chips&Media, etc. that approac=
h seams
> plausible, but we still can't trust the buffer, which to me is not accept=
able.

Unfortunately, there's so many ways this can go wrong, because we're
not just talking about FW exec sections, but also data buffers that
have to be dynamically allocated by userspace (suspend buffers for GPU
contexts, textures/framebuffers, decode frames, ...). If there's no
central component kernel-side we can refer to to check correctness, the
only safe guard is privilege-based restriction...

