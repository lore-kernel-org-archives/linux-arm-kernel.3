Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A257C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 22:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=; b=Y6ePrJuWzfAS+caTdgV0AEHnYg
	OLXH1mXux/TEW2WKTGaqmHSea76z41PC1dTVTY5Y5cczsxzqy7huHwa9gbKwKX9hhcucExTHPaGPx
	7g5emFS8XV/5QcJhOXaL3xJ1OKqFvk/2XIW1gzrUs07VSsTt9mqBgrqaIMh5bPol1Gtu71Pja3FHX
	0JEDBBYApYoPnszAp0G57uZPcV6LYUm9f93GsWJt1CRvveDtlkhVPn5y2bAudj0Y32qM+r7KhXVF8
	1xlCbVVombNAcDx6CsohP0naTMSMJjROtPDNSmIDknJYufvh9mqI7XqCBrWpC0iLUlDGfpHZcCG/r
	fBUdHjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8vE-0000000AjYh-3OHM;
	Mon, 19 May 2025 22:25:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8t7-0000000AjJb-09ri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 22:23:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30e930e00a0so755023a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747693392; x=1748298192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
        b=agWQZswSovG54Pv+igAJ9HOa+0h1zu47+75JRgtORxqTrTNHGPsmXrLAkH91F7P16U
         9A0djYkAyEZrDelxv0azNaZYpZEPqP6O3voRDk+0r93RRkdyBgAlhTu4t/+W3FFCdKLv
         HRF0KQE4ECtJLgswUSJf6SywJffOEGJXe0dF/LPawXK0M6tXHxLL1/b3Ar/4HpgPYtyh
         uenEAqG28fmIhQz8+IyZ1bKo+rQtF6Tl/h77ZDi1LkMqcRb6IbLO91UoCpswkbnyiZeG
         trr9o7OqjCGoIuy5gG/UqsSJJksDYpBENBASOvhuq1wSCYrnGTD/Oq/sJpS0NAVHlGhl
         4kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747693392; x=1748298192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
        b=lUoP5BhTazXjlXcAq10nWewwTAVE3RrJwc1tmKMEL0TwgRYZL/go7zGvuQgy5B2atM
         vtjBsr2r2/JX3pGIvnvkU5BAJfOaXGP9UqQiPH6o7AV4WNoDMVXyjDsboPkojaGtawmE
         2Yw8yV5te3hw2jAJqriR2dRGzLotJO2w9k6a+zMSDaIyPIeoTUGHYmArPvKY5l0lhdaF
         qX9i0Bww5NUyzvDAaNVEpcU93DvZ3LaBwKf5bc62oQxvVM6ma2XMY6edmsOP6ITCVQhZ
         SNA7Sc/3YhuxigxUoHyT4MbcHEl3yTyLL7nB53HmkzlYfsSI8laP5tX2s+cGzuFDhD0g
         GKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgvglmO1KQTde1M44R+gyJpmrbZFgpYy9yAzQ2Wx+q4mZxhffCfqVo6hiOKli6dcBV0kplr7lb7N4laVMe8+Sq@lists.infradead.org
X-Gm-Message-State: AOJu0YwhIwYDykED0/OOVOvSkVFwwlsKHjaIx1NgEtSmL5yScnAyxXE6
	T2CUwiUXqWNrN1SsY4vObyTXkdLLO61o6+SW3IhorhS9Su0zjhayXOR5ne3vqXcYnQrFqiU5z9v
	mwwD0qZdYBLzua3S2WzrmGPdWfqOuH/I=
X-Gm-Gg: ASbGnctKyQsQPg9W+G9/DnNwbBP0OS4uaz2SrwGiOgeRcLGCleCRBYJmXh/zYFu3y/N
	6bs9+bGCLOJX7x0Yl8BBF0reZVKJlq9zrZz/i8ENB64p2yagIEr3WdXtQ4ZgmG4ZQyQqpuxfCp+
	nGZulEq8RIUA81ppD6cPVvYuS/DwrsekBc
X-Google-Smtp-Source: AGHT+IHzzYJdNjGnggVED+WkMWpZnSPWu15906SWYLh7fgSNgz1VKnuTByR3QO+KIJPYuFChXuYVwQZLc03eivgxOW4=
X-Received: by 2002:a17:90b:3e8b:b0:30e:7127:644c with SMTP id
 98e67ed59e1d1-30e7d622f13mr8368159a91.6.1747693391512; Mon, 19 May 2025
 15:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
 <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com> <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
In-Reply-To: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 19 May 2025 18:23:00 -0400
X-Gm-Features: AX0GCFuLTqHkTFoflT1PTGQWqYxrqs7RNvsrTX0PlbvFOcOu3Zb_RqPfkkrC9DU
Message-ID: <CACu1E7EJp1fvQZV0=qeAqH97qaeoiaybHqxfYa7hFmi9P048kw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Christopher Snowhill <chris@kode54.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>, 
	"m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_152313_078765_3DD662BC 
X-CRM114-Status: GOOD (  36.55  )
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

On Mon, May 19, 2025 at 5:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.co=
m> wrote:
> > > >
> > > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote=
:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulka=
n Sparse
> > > > > Memory[2] in the form of:
> > > > >
> > > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_=
OP_MAP/
> > > > >    MAP_NULL/UNMAP commands
> > > > >
> > > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > > >
> > > > > I did not implement support for synchronous VM_BIND commands.  Si=
nce
> > > > > userspace could just immediately wait for the `SUBMIT` to complet=
e, I don't
> > > > > think we need this extra complexity in the kernel.  Synchronous/i=
mmediate
> > > > > VM_BIND operations could be implemented with a 2nd VM_BIND submit=
queue.
> > > >
> > > > This seems suboptimal for Vulkan userspaces. non-sparse binds are a=
ll
> > > > synchronous, you are adding an extra ioctl to wait, or do you manag=
e
> > > > these via a different mechanism?
> > >
> > > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > > the binds happen before cmd execution
> > >
> > > When it comes to UAPI, it's easier to add something later, than to
> > > take something away, so I don't see a problem adding synchronous bind=
s
> > > later if that proves to be needed.  But I don't think it is.
> >
> > I'm not 100% sure that is conformant behaviour to the vulkan spec,
> >
> > Two questions come to mind:
> > 1. where is this out fence stored? vulkan being explicit with no
> > guarantee of threads doing things, seems like you'd need to use a lock
> > in the vulkan driver to store it, esp if multiple threads bind memory.
>
> turnip is protected dev->vm_bind_fence_fd with a u_rwlock

To add to that, it doesn't really matter the exact order the fence
gets updated because a Vulkan app can't use anything in a submit until
after we return from the turnip function that allocates + binds the BO
and then the Vulkan-level object is returned to the user. We just have
to make sure that the fence is "new enough" when we return the BO. It
doesn't matter if multiple threads are creating/destroying objects,
the thread doing the VkQueueSubmit() must have observed the creation
of all resources used in the submit and will therefore see a new
enough fence.

>
> > 2. If it's fine to lazy bind on the hw side, do you also handle the
> > case where something is bound and immediately freed, where does the
> > fence go then, do you wait for the fence before destroying things?
>
> right no turnip is just relying on the UNMAP/unbind going thru the
> same queue.. but I guess it could also use vm_bind_fence_fd as an
> in-fence.
>
> BR,
> -R

Yeah, we always submit all non-sparse map/unmap on the same queue so
they're always synchronized wrt each other. We destroy the GEM object
right away after submitting the final unmap and rely on the kernel to
hold a reference to the BO in the unmap job.

Connor

