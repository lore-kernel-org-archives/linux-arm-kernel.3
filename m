Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=; b=U9qiMeE9jJBCfM1hh/FWIfo4ZM
	PSa9Hq0+Ev/P2yYOCac0SzNoLxsqjX6cxkVN8l2hbgrhejoHfeRb3uZy9Z8E/x2G2oOm1bsl486Cx
	mTou28NLWRQjevdLL1dLN+LO0OwNDBpsEtc/cVvopOSrl8SJwwUbbQeGTCcfd6bsA4zBHEZYSidX4
	XJWGBVy+kC4360fXHszwBcQCGgWDTtsLwukmP0MlMgUh+9LVvAKzDPyRq4PN9a96TsJcvMjx6yHeL
	Ki8XpcrCnFFSnvVrVL6/CiudINNLqqJ1Ebu/6A3cxnKgepRvmMLpSmFrTjQlj50g4cBkyIkw16xCY
	jzEdlFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkk38-0000000Cvh4-0DJk;
	Wed, 19 Feb 2025 13:23:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkk1d-0000000CvFx-1zib
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 13:22:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so24338535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739971323; x=1740576123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
        b=BkFXb/kIdY+3NqRTwdCsuLX6QSpGUx4NrGbL67y9P3ltBzIDycEYWGavJtFwoICWJe
         hpFV0hVviVrYZfFy3lCGM3zKgN/C7dlltEVDZj1U/Bl23I/likyZlqO0PqNXwo/S3/Po
         eabZHk71HssiENE53cnhjxhJiLCa7c1eXNUGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971323; x=1740576123;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
        b=s3mKBXpSYQLEb7XU1vqcgSejJ8eFzeA09rvGd0pKDQfAo8HgzsxlixnCyy0Ehl1S/F
         yXkFJbVfYomu3zLHtGsXlNQoiM7gRfQL4s23/y2xpXXULTIsIbtDI36rem4mYs4nh5jk
         /OPIEXV2kWnIOv31JSRSD+gJWxnul0ag33ZJlr6KLuk4Hoosl0rej7suX2SHjMvy27tT
         QJVdEYuwJPLnAB3CRVDCk6UdsYpHj8OqOe2XcB7QiyITfMWBQyx1MncXHAFoSFWJcQTD
         XOCGtdpy3fWz1m5GK9e+0nCL4UgKCvuvCNcIetpqm/J+Eyonp8yRb3tWw6daF+BsBzQH
         SiaA==
X-Forwarded-Encrypted: i=1; AJvYcCWtSUopNNge9T9NaSfRabtfq6gIUwtT8mU/NaSknpp1Q4AarHPX4uawR2jGRMNy+lkqPPJgsnR60FEcevj8DtAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZd1ZYmn2t/182FGvum9fYi1fs9Ers4yyQMlcO1CWX2Ektnd6
	Vqa1F2+Crc/LvPMKptd7F29KFHj8bdCP1AMW/qOdW9PUBp500oJuLwKg4LaoEhc=
X-Gm-Gg: ASbGncvlsHFQ4LbOEjEKl5uI5aSc0oolbtKwMgU74f9X2T9TLS/xIPAr+a9k46KNxsl
	MLeT4HH8D/8mxoyB6PD6bdOrJ9ndKUpdI0RanwMvEL7XNyj0uMS2XVwx0z7dIzs/uO8d/d7npj8
	m3ZFqFdWCuYtj3mNFuZU8PM1+u4EzI0Gy71FxG65xIIf6LZJDPInx9qdvT2k71Jev45WbHybU4q
	Y/5Jih9gE4VOZMT24BT+1Js8tKo7I3cwjOAKOli/NrKBKOnobSSX9sTR5zDHeNwUzsTXuDevBfQ
	LzXJk57aMIFexczaeW3gOMqZZCk=
X-Google-Smtp-Source: AGHT+IFOilwBJ5aoh97zcLA4mj4xU/YMSCmbCjCXU9wojxNHTeliFqqcujswwLdduRHkO4EdT9IN9A==
X-Received: by 2002:a05:600c:1c18:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-43999da3ac7mr40722565e9.14.1739971323224;
        Wed, 19 Feb 2025 05:22:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm17846401f8f.76.2025.02.19.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:22:02 -0800 (PST)
Date: Wed, 19 Feb 2025 14:22:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z7Xa-K0aOqcndICH@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Florent Tomasin <florent.tomasin@arm.com>
References: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_052205_519207_936286D1 
X-CRM114-Status: GOOD (  60.86  )
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

On Tue, Feb 18, 2025 at 04:22:10PM +0000, Daniel Stone wrote:
> Hi Sumit,
> 
> On Mon, 17 Feb 2025 at 06:13, Sumit Garg <sumit.garg@linaro.org> wrote:
> > On Fri, 14 Feb 2025 at 21:19, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > I would say one heap per-profile.
> >
> > And then it would have a per vendor multiplication factor as each
> > vendor enforces memory restriction in a platform specific manner which
> > won't scale.
> 
> Yes, they do enforce it in a platform-specific manner, but so does
> TEE. There is no one golden set of semantics which is globally
> applicable between all hardware and all products in a useful manner.
> 
> So, if we define protected,secure-video +
> protected,secure-video-record + protected,trusted-ui heap names, we
> have exactly the same number of axes. The only change is from uint32_t
> to string.
> 
> > > > Christian gave an historical background here [1] as to why that hasn't
> > > > worked in the past with DMA heaps given the scalability issues.
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@gmail.com/
> > >
> > > Hm, I fail to see where Christian dismiss the dma-heaps solution in
> > > this email. He even says:
> > >
> > > > If the memory is not physically attached to any device, but rather just
> > > memory attached to the CPU or a system wide memory controller then
> > > expose the memory as DMA-heap with specific requirements (e.g. certain
> > > sized pages, contiguous, restricted, encrypted, ...).
> >
> > I am not saying Christian dismissed DMA heaps but rather how
> > scalability is an issue. What we are proposing here is a generic
> > interface via TEE to the firmware/Trusted OS which can perform all the
> > platform specific memory restrictions. This solution will scale across
> > vendors.
> 
> I read something completely different into Christian's mail.
> 
> What Christian is saying is that injecting generic constraint solving
> into the kernel doesn't scale. It's not OK to build out generic
> infrastructure in the kernel which queries a bunch of leaf drivers and
> attempts to somehow come up with something which satisfies
> userspace-provided constraints.

Fully agreeing. The one thing we discussed, but haven't implemented yet,
is that we'd add sysfs links from devices to the dma-heaps they support.
Including allowing for priorities and different use-cases on the same
device. We just haven't gotten there yet.

But even with that it's up to userspace to do the constraint solving, not
the kernel.

> But this isn't the same thing as saying 'dma-heaps is wrong'! Again,
> there is no additional complexity in the kernel between a dma-heap
> which bridges over to TEE, and a TEE userspace interface which also
> bridges over to TEE. Both of them are completely fine according to
> what he's said.
>
> > > Honestly, when I look at dma-heap implementations, they seem
> > > to be trivial shells around existing (more complex) allocators, and the
> > > boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> > > implementation, you already have, so we're talking about a hundred
> > > lines of code to maintain, which shouldn't be significantly more than
> > > what you have for the new ioctl() to be honest.
> >
> > It will rather be redundant vendor specific code under DMA heaps
> > calling into firmware/Trusted OS to enforce memory restrictions as you
> > can look into Mediatek example [1]. With TEE subsystem managing that
> > it won't be the case as we will provide a common abstraction for the
> > communication with underlying firmware/Trusted OS.
> 
> Yes, it's common for everyone who uses TEE to implement SVP. It's not
> common for the people who do _not_ use TEE to implement SVP. Which
> means that userspace has to type out both, and what we're asking in
> this thread is: why?
> 
> Why should userspace have to support dma-heap allocation for platforms
> supporting SVP via a static DT-defined carveout as well as supporting
> TEE API allocation for platforms supporting SVP via a dynamic
> carveout? What benefit does it bring to have this surfaced as a
> completely separate uAPI?
> 
> > > And I'll insist on what
> > > Daniel said, it's a small price to pay to have a standard interface to
> > > expose to userspace. If dma-heaps are not used for this kind things, I
> > > honestly wonder what they will be used for...
> >
> > Let's try not to forcefully find a use-case for DMA heaps when there
> > is a better alternative available.
> 
> What makes it better? If you could explain very clearly the benefit
> userspace will gain from asking TEE to allocate $n bytes for
> TEE_IOC_UC_SECURE_VIDEO_PLAY, compared to asking dma-heap to allocate
> $n bytes for protected,secure-video, I think that would really help.
> Right now, I don't understand how it would be better in any way
> whatsoever for userspace. And I think your decision to implement it as
> a separate API is based on a misunderstanding of Christian's position.
> 
> > I am still failing to see why you
> > don't consider following as a standardised user-space interface:
> >
> > "When user-space has to work with restricted memory, ask TEE device to
> > allocate it"
> 
> As far as I can tell, having userspace work with the TEE interface
> brings zero benefit (again, please correct me if I'm wrong and explain
> how it's better). The direct cost - call it a disbenefit - it brings
> is that we have to spend a pile of time typing out support for TEE
> allocation in every media/GPU/display driver/application, and when we
> do any kind of negotiation, we have to have one protocol definition
> for TEE and one for non-TEE.
> 
> dma-heaps was created to solve the problem of having too many
> 'allocate $n bytes from $specialplace' uAPIs. The proliferation was
> painful and making it difficult for userspace to do what it needed to
> do. Userspace doesn't _yet_ make full use of it, but the solution is
> to make userspace make full use of it, not to go create entirely
> separate allocation paths for unclear reasons.
> 
> Besides, I'm writing this from a platform that implements SVP not via
> TEE. I've worked on platforms which implement SVP without any TEE,
> where the TEE implementation would be at best a no-op stub, and at
> worst flat-out impossible.
> 
> So that's 'why not TEE as the single uAPI for SVP'. So, again, let's
> please turn this around: _why_ TEE? Who benefits from exposing this as
> completely separate to the more generic uAPI that we specifically
> designed to handle things like this?

Completely concurring on everything said above. TEE exposed through a
dma-buf heap (or maybe special v4l allocation flag for secure video
playback) and then we prime import that on the display side. Maybe also
through drm render drivers for the EGL/VK protected content extensions.
Same for any other hw means to allocate content protected buffers, TEE is
not special here at all.

Anything else needs seriously good justifications why the entire dma-buf
heap design is busted.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

