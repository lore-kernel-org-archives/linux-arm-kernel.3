Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9020AC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjXMgQyDFOilO3Xu47Ib173LdeZX8gmPYDyKndrcKnk=; b=cP0g6rbmubYuFfL7Q77FyQKmu2
	lUEa36CMX8oH7al1oylfIgfB6629ttX7kfZBKBWo/bGtm8C5inDtnwKjIFou+1vEo7qP58arysl/N
	uSNfRPqOiUmnSYhmNGWC58P/c1l8YopJVA329518jzBHDmtvimOSI4dGAqD95f7cMUpvdqOvLUyO4
	rBgvu6Pf+8mtWiLQJa3q4t+uWaaN6gZFggRUZ/shq/Vg2X4k31XN6C4KjWV5NyafSMOGHNPYwCSyY
	Ymh1SkjmPSdBi1DPknd8loA4cq+l4bTOVLJB1P4wbKeQuYFuXn+Q4XTyFdSwujoIgBMtfswEPDPQn
	+X4tzqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQSJ-00000008yDJ-28EC;
	Tue, 18 Feb 2025 16:28:19 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQMc-00000008wYw-0DG2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:22:28 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c04df48a5bso484571885a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739895743; x=1740500543; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjXMgQyDFOilO3Xu47Ib173LdeZX8gmPYDyKndrcKnk=;
        b=fcfGtww5R1e2af8JXqeytHaqWdIMOraIR5Uvk1+j40Z5wcEuFi5eUUsov7eB9V8dqA
         nPnxIvYp+umROeFc4AdBsI16hjjKPoH0Y/EuYbZj3MJON6n+4LNnJIFOB2dF1rYkz+zt
         yzpqOU1KZoO1hoTHf5tbsdVjcbMKAlibEee3NpFGdz0RFLdc9u+t2t6fZSMtqAFo/5FY
         pBil3fL7c4i4PyN1TulKzcw0PFvb6gs3nXpNziro7B8m9tKVl5JUGf/bg2DO9+8mytRd
         jPRjXvpledQZUHIDHax4xjYfMkt4H/VClLCfK4lkMLTsTOHMyh2gGpg5YiRyCQljYFwc
         lnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895743; x=1740500543;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjXMgQyDFOilO3Xu47Ib173LdeZX8gmPYDyKndrcKnk=;
        b=a/riWYB435bavwHUKe9Tt2Kr1zlZvri/bQFvkqPUKvvDOWxGtWmNJwWlxZyYRi9V8K
         p3bT+1qbhAM1Kh5CUu8aNF42q+GAPTA9Vl/7NDfCHhlZGLVc3eRv/bNFA9J9EKz10QU8
         FawR1Fg/yZnJvM6zzZ8jQySDlUPD7apfH/HVN4WsyDrDjR9bd0IrWHJW+jldgn3I8hHC
         0misqVjmlbNDp+NBBSMpctoCbQVg3pV5SJZhKj+4g/D8uM4VASJ/fL+O1qz5bb1p/FdW
         4xIxdOeddLTC7lOtEKBkB2QQYIX4VGjgBpDhjBHvAyiZzUsVMVY0iRfEa+C8DUM4YUBF
         kKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi+5Bn0UoxUFFhB7d224xmvXJ3QBBo/JTo0qoBDGmfyIymofk2jlMPwpThxEjVj6UmF7B6KXvzWyK9P/fFy2i5@lists.infradead.org
X-Gm-Message-State: AOJu0YykqJ70bjmMvkL3831lEc2NfEk9GGVCc1ZW+TPaQsJsbcgzBGz/
	O5iQ09oX0n285pZWb8afIfn/e7RMrY0DEy8AQmIBlkFd7KLP6aT4dtZm440P/zISSk4CwHFagyM
	Jp0lzvTpmJCSihhFIaqWEXlgYIX9DnPnCKr32lw==
X-Gm-Gg: ASbGncvYVFmb7Fxt2zwzhdgAB7WgLVRtKlR/2qiYpuF66XXaOmMYT5Lf+sJ2jBuhdjJ
	pMu4n7jkC7tClKq1E5xRkPK+rWhYuyv0BEaQMyURRuy092HyQznrD7+OnY6JFRj0q/kUVGw==
X-Google-Smtp-Source: AGHT+IEbV3293ASWpwU6KwIQOOU1vJS5NgcKsmd6eL12KHdOz9KO5J5HKfrJx309aUhi1VkMOaqfdyrVi2QFW0IL94s=
X-Received: by 2002:a05:620a:1905:b0:7c0:7303:8d78 with SMTP id
 af79cd13be357-7c0b534e90cmr15243285a.44.1739895742877; Tue, 18 Feb 2025
 08:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com> <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
In-Reply-To: <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 Feb 2025 16:22:10 +0000
X-Gm-Features: AWEUYZm4DmHXwV4iRPDNo2H2j8DSqPPY_t2q4WxWwnT6ATyeMsQki0rC9akhuRA
Message-ID: <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_082226_207834_3101EBCD 
X-CRM114-Status: GOOD (  42.61  )
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

Hi Sumit,

On Mon, 17 Feb 2025 at 06:13, Sumit Garg <sumit.garg@linaro.org> wrote:
> On Fri, 14 Feb 2025 at 21:19, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > I would say one heap per-profile.
>
> And then it would have a per vendor multiplication factor as each
> vendor enforces memory restriction in a platform specific manner which
> won't scale.

Yes, they do enforce it in a platform-specific manner, but so does
TEE. There is no one golden set of semantics which is globally
applicable between all hardware and all products in a useful manner.

So, if we define protected,secure-video +
protected,secure-video-record + protected,trusted-ui heap names, we
have exactly the same number of axes. The only change is from uint32_t
to string.

> > > Christian gave an historical background here [1] as to why that hasn't
> > > worked in the past with DMA heaps given the scalability issues.
> > >
> > > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@gmail.com/
> >
> > Hm, I fail to see where Christian dismiss the dma-heaps solution in
> > this email. He even says:
> >
> > > If the memory is not physically attached to any device, but rather just
> > memory attached to the CPU or a system wide memory controller then
> > expose the memory as DMA-heap with specific requirements (e.g. certain
> > sized pages, contiguous, restricted, encrypted, ...).
>
> I am not saying Christian dismissed DMA heaps but rather how
> scalability is an issue. What we are proposing here is a generic
> interface via TEE to the firmware/Trusted OS which can perform all the
> platform specific memory restrictions. This solution will scale across
> vendors.

I read something completely different into Christian's mail.

What Christian is saying is that injecting generic constraint solving
into the kernel doesn't scale. It's not OK to build out generic
infrastructure in the kernel which queries a bunch of leaf drivers and
attempts to somehow come up with something which satisfies
userspace-provided constraints.

But this isn't the same thing as saying 'dma-heaps is wrong'! Again,
there is no additional complexity in the kernel between a dma-heap
which bridges over to TEE, and a TEE userspace interface which also
bridges over to TEE. Both of them are completely fine according to
what he's said.

> > Honestly, when I look at dma-heap implementations, they seem
> > to be trivial shells around existing (more complex) allocators, and the
> > boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> > implementation, you already have, so we're talking about a hundred
> > lines of code to maintain, which shouldn't be significantly more than
> > what you have for the new ioctl() to be honest.
>
> It will rather be redundant vendor specific code under DMA heaps
> calling into firmware/Trusted OS to enforce memory restrictions as you
> can look into Mediatek example [1]. With TEE subsystem managing that
> it won't be the case as we will provide a common abstraction for the
> communication with underlying firmware/Trusted OS.

Yes, it's common for everyone who uses TEE to implement SVP. It's not
common for the people who do _not_ use TEE to implement SVP. Which
means that userspace has to type out both, and what we're asking in
this thread is: why?

Why should userspace have to support dma-heap allocation for platforms
supporting SVP via a static DT-defined carveout as well as supporting
TEE API allocation for platforms supporting SVP via a dynamic
carveout? What benefit does it bring to have this surfaced as a
completely separate uAPI?

> > And I'll insist on what
> > Daniel said, it's a small price to pay to have a standard interface to
> > expose to userspace. If dma-heaps are not used for this kind things, I
> > honestly wonder what they will be used for...
>
> Let's try not to forcefully find a use-case for DMA heaps when there
> is a better alternative available.

What makes it better? If you could explain very clearly the benefit
userspace will gain from asking TEE to allocate $n bytes for
TEE_IOC_UC_SECURE_VIDEO_PLAY, compared to asking dma-heap to allocate
$n bytes for protected,secure-video, I think that would really help.
Right now, I don't understand how it would be better in any way
whatsoever for userspace. And I think your decision to implement it as
a separate API is based on a misunderstanding of Christian's position.

> I am still failing to see why you
> don't consider following as a standardised user-space interface:
>
> "When user-space has to work with restricted memory, ask TEE device to
> allocate it"

As far as I can tell, having userspace work with the TEE interface
brings zero benefit (again, please correct me if I'm wrong and explain
how it's better). The direct cost - call it a disbenefit - it brings
is that we have to spend a pile of time typing out support for TEE
allocation in every media/GPU/display driver/application, and when we
do any kind of negotiation, we have to have one protocol definition
for TEE and one for non-TEE.

dma-heaps was created to solve the problem of having too many
'allocate $n bytes from $specialplace' uAPIs. The proliferation was
painful and making it difficult for userspace to do what it needed to
do. Userspace doesn't _yet_ make full use of it, but the solution is
to make userspace make full use of it, not to go create entirely
separate allocation paths for unclear reasons.

Besides, I'm writing this from a platform that implements SVP not via
TEE. I've worked on platforms which implement SVP without any TEE,
where the TEE implementation would be at best a no-op stub, and at
worst flat-out impossible.

So that's 'why not TEE as the single uAPI for SVP'. So, again, let's
please turn this around: _why_ TEE? Who benefits from exposing this as
completely separate to the more generic uAPI that we specifically
designed to handle things like this?

Cheers,
Daniel

