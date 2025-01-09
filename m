Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2A8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 06:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=; b=NAHahL74UTR/r1QBTVGX288sQR
	V+Cq+RF8SeQgPTawpH+4d17bK+Uit+fapFkU5jRNPedII8L7Oh1nvjUiRy5Xl1ZMq2zNVeGR5AixM
	+Oww7S/3m6PW9U+Zl6bdc3XpgOw8XTn+Le3tENEbRLJdKXmHJkkAuRxxZsvKyRNkcSPVLhvw8mKYA
	h3Cjs3ctjA121vTWeLgepwWYd7wp0wo9q4mQmAvsjbiN8I8eKH/kGl677FbEkwV3cyES5mgTAlcEI
	X5kBel/9DwHk6RH/yX0cGkgFbONyUrnbDcKbTkaVmhFg7IcYx8KnQwm9vDjBFRQAW1xJvteTTTPqI
	sIduKqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlkL-0000000Atgz-09Ia;
	Thu, 09 Jan 2025 06:10:21 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlj5-0000000AtYY-3Xuo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 06:09:05 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so175235137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 22:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736402942; x=1737007742; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
        b=MCymv7VnMdkfyAEh9aVJTG27SszAEfboF/unIToM5LT50CDQrWelgCOhzMpHZ5phFw
         zY1lOcrapn6NWq0W8mGLVoF443bDJMY4YdDzx+9LKQZz81yyRe+MeNAcFTQTUtMbPVkb
         2LaA/+SzLKtaGfWQK9lXPXj5/JfUBJUDaLTZFQQMWzpogYQRpbE4HE5UTeNryZBgb9ge
         vnesfCZ/CNFyioKbBN+BVpGirL1fp6tMp5+iDs3RrGU3eyeLyTawBBvk5/a3evn8D3ts
         9H93ujieeSJrNt6GdL1vU6AchQSV2u7r4YKM/F40OXP8/cZbDXS/5DBUZHDKrbIofJWC
         6NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736402942; x=1737007742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
        b=Mzpwpek5/lFeXBIhOi9oJChB+ZThwH7aEbEqVUW68HOSZF6OePLYOoNZYZGHbmuF7M
         LOEYmewxTJReecWtYqDOdD/NIPcJgahICJhwyxvSg6vk4rFQgyycRKxc9+rhyA4vKyQj
         tJdvdGAlGf32lou6LFBFWDLTndiC0QJOK/pd2RNitBCMC6MwvnmP2f/Wz5KmMzcRnIAF
         sXuQmuJtcS1udaRdHpW4n7vqVJj2awmg2Up3p59n87tg0Wzjm6t4PC/gGhSgsc086It7
         gfS5KzVSFCRwnTBRVFaBVL/xzeC2S16VJhS18exxLP595QhpESTZBMsiRCg992Ag1OSu
         UYUg==
X-Forwarded-Encrypted: i=1; AJvYcCWGLDYKlnl/8RTf9Nfpjd9016EXPKPnnjvZTZtYKtnw/FF8p/9R4yeCWH3uCl8HSUDcnUckQuJXibpI+nE2cXEw@lists.infradead.org
X-Gm-Message-State: AOJu0YzkKereFNNcsW1gTiNiu+4Z8PHcjH6/5Ww3L/1P1namFX6EbR5j
	PD8Hd+g8YDTixpIE/PydSKURJZhFTMo+FUjl/A4jK7ysmDFPfAADfahShUhnxxLSDcxwckVt+l1
	8PGUPW9E2wgnWbHvTLvghbfYZB4EYIo9RWEU/gGvRdKW+b9EGL1Y=
X-Gm-Gg: ASbGnctd97/59awcDV4lkaD4SrKnQxIiW211bVXnV4JhmM1hkr08XZWyid02TWoBgss
	9jU1vgY+QIX1HCbP/orIZnzthVz8V6kUfMSmEGYx0
X-Google-Smtp-Source: AGHT+IFkDZGBtCpO5FflLFvbdwmJ3sWoUbJtvuojzOG7I1CBRhorYbwloT2u1hpJHzN4tOBjlfcQFIZrLZuRC0Ec89I=
X-Received: by 2002:a05:6102:c8b:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4b3d0fb1764mr3879731137.21.1736402941990; Wed, 08 Jan 2025
 22:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local> <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
In-Reply-To: <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 9 Jan 2025 11:38:50 +0530
X-Gm-Features: AbW1kvZpkNiFcSMyeI-DgMLrpBLgsFpc30qEZPbPGQ78luMHwy5kGq6PCahL58k
Message-ID: <CAFA6WYPXxUQYe9TF3PB9C0NwCz1eceCdYNa1yoKpv320M20qDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: simona.vetter@ffwll.ch
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_220903_942829_B578DA1F 
X-CRM114-Status: GOOD (  59.02  )
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

On Wed, 8 Jan 2025 at 22:27, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Hi Simona,
> >
> > On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > >
> > > On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > > > Hi,
> > > >
> > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > > >
> > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > restrictions for the memory used for the DMA-bufs.
> > > >
> > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > how to allocate the restricted physical memory.
> > > >
> > > > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > > > a use-case parameter. This is used by the backend TEE driver to decide on
> > > > allocation policy and which devices should be able to access the memory.
> > > >
> > > > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > > > Recording) has been identified so far to serve as examples of what can be
> > > > expected. More use-cases can be added in userspace ABI, but it's up to the
> > > > backend TEE drivers to provide the implementation.
> > > >
> > > > Each use-case has it's own restricted memory pool since different use-cases
> > > > requires isolation from different parts of the system. A restricted memory
> > > > pool can be based on a static carveout instantiated while probing the TEE
> > > > backend driver, or dynamically allocated from CMA and made restricted as
> > > > needed by the TEE.
> > > >
> > > > This can be tested on QEMU with the following steps:
> > > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > > >         -b prototype/sdp-v4
> > > > repo sync -j8
> > > > cd build
> > > > make toolchains -j$(nproc)
> > > > make SPMC_AT_EL=1 all -j$(nproc)
> > > > make SPMC_AT_EL=1 run-only
> > > > # login and at the prompt:
> > > > xtest --sdp-basic
> > > >
> > > > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > > > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > > > without FF-A using the original SMC ABI instead. Please remember to do
> > > > %rm -rf ../trusted-firmware-a/build/qemu
> > > > for TF-A to be rebuilt properly using the new configuration.
> > > >
> > > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > > list dependencies needed to build the above.
> > > >
> > > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > > the secure world can access and manipulate the memory. There are also some
> > > > negative tests for out of bounds buffers etc.
> > >
> > > I think I've dropped this on earlier encrypted dma-buf discussions for
> > > TEE, but can't find one right now ...
> >
> > Thanks for raising this query.
> >
> > >
> > > Do we have some open source userspace for this? To my knowledge we have
> > > two implementations of encrypted/content protected dma-buf in upstream
> > > right now in the amd and intel gpu drivers, and unless I'm mistaken they
> > > both have some minimal userspace supporting EXT_protected_textures:
> >
> > First of all to clarify the support Jens is adding here for allocating
> > restricted shared memory allocation in TEE subsystem is meant to be
> > generic and not specific to only secure media pipeline use-case. Then
> > here we not only have open source test applications but rather open
> > source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
> > core feature where we maintain a stable and extensible ABI among the
> > kernel and the OP-TEE core.
> >
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel. There can be numeric
> > use-cases surrounding that as follows:
> >
> > - Secure media pipeline where the contents gets decrypted and stored
> > in a restricted buffer which are then accessible only to media display
> > pipeline peripherals.
> > - Trusted user interface where a peripheral takes input from the user
> > and stores it in a restricted buffer which then is accessible to TEE
> > implementation only.
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
> >
> > I am sure there will be more use-cases related to this feature but
> > those will only be possible once we provide a stable and extensible
> > restricted memory interface among the Linux user-space and the secure
> > world user-space (normally referred to as Trusted Applications).
> >
> > [1] https://github.com/OP-TEE/optee_os/pull/7159
> >
> > >
> > > https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
> > >
> > > It's not great, but it does just barely clear the bar in my opinion. I
> > > guess something in gstreamer or similar video pipeline framework would
> > > also do the job.
> > >
> > > Especially with the context of the uapi discussion in the v1/RFC thread I
> > > think we need more than a bare-bones testcase to make sure this works in
> > > actual use.
> >
> > Currently the TEE subsystem already supports a stable ABI for shared
> > memory allocator among Linux user-space and secure world user-space
> > here [2]. And the stable ABI for restricted memory is also along the
> > same lines meant to be a vendor neutral abstraction for the user-space
> > access. The current test cases not only test the interface but also
> > perform regression tests too.
> >
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
> >
> > [2] https://docs.kernel.org/userspace-api/tee.html
> > [3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/
>
> We get entire opengl/vulkan driver stacks ready before we merge new drm
> drivers, I really don't think this is too hard from a technical pov. And I
> think the mediatek patches had the same issue of lacking userspace for it,
> so that's not moving things forward.
> -Sima
>

Okay fair enough, I think I get your point. Currently we are missing
at least one peripheral support being the consumer for these
restricted DMA-bufs. So I discussed with Jens offline that we can try
with a crypto peripheral use-case first which can simply be
demonstrated using the current OP-TEE client user-space.

Also, in crypto peripheral use-case we can target the symmetric crypto
use-case first which already has a concept of hardware backed
symmetric key [1]. IOW, we should be able to come up with a generic
symmetric crypto algorithm which can be supported by different crypto
accelerators using a TEE backed restricted key DMA buffer.

[1] https://www.youtube.com/watch?v=GbcpwUBFGDw

-Sumit

