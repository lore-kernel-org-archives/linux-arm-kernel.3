Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EBDC54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=; b=Y6Iy4wqykjH+BotyIeyMn0XDTK
	vyzLGaexBpSPrw5uzWnQBKdGoOhp/ybyLudtRQhNPpMAdKuBYQw7YB8mateUrGKAC0tMVUZ/02UNz
	0kMPc0cozW9prumvtvgH5FncHwjm76ZNIjE8YeO/Owlsm6Q93BQfDYghPdCnzM8rLRGbUXBEwn8lA
	FGdZpT4ijz3iyfyvVxN7BW5v+O6n28bYDE1AXFr/7MugjyMgP14KQlwQORiHPWvoxKGhT3dN8jzd8
	t0UNusGILdbWLu5SFwaKJK9rzlvzLSyL/lVMhqyILlGT5eBo9Xt3lY2afQem4hMtpNo3o/naVxylC
	uYGEZThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Qd-0000000Af1Z-28NH;
	Mon, 19 May 2025 21:53:47 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8OV-0000000AekB-1g5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:51:36 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso465542639f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691494; x=1748296294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
        b=HPsbOE2yRLGy9BVFXdkfetMUvsz9dQvluYvbUe86X2GpuZHXoTn6YWKVX1I/8HtLPi
         qxs4Y7rT1Dm/rWVfjIybNasu76hPN4GYdyjZJIXxTUXQOGYKafRECStxegLnGyzXmE4X
         xAnVk+zbOzRYDVsF5ewVIdwCuz5P7BzVAfYKw5c/XOfIlnWxFsuzag9F9A3WQ2WIWjRt
         ts/fWk6CyQ97Dh/Txil6ti0Esvm7t6MndHGnRq+S/ZEpr8jCGjip8COH6sebPU7/LMF1
         Pv5II9w7DyJlqnoWND1KzJMVd/ukVtDPJOy0sd/KZzz/d3aVcIEbtJsdc1XuFdvS3OjR
         mp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691494; x=1748296294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
        b=Z/h4AwUaXVq1wmhYrMl7z/X6ZUOBv8kmxvdJ7Lt9yus1XjXnmTNbqpjRwnb1INwpKe
         YfO+Q4Jy9yDcglXcPM63CsgeE3Aein3LzhFdOOSFTHJcLH8Lyw3f3EhiZtzOwl4NLcAC
         YnWeE8tRfutxIoJGtkeWUh5ewGjrqU59uOCDT2DmSK5B31PAsk0f3mqX3ZflmxWqApVO
         gnKIT+ZKATQ8uYc+3xr2OenRHFqLTbQiRqyhc0O6USO099Tz6B5YlE3tcmbkBY9LYkga
         vxQidiM7Onw2PTWndrCVm8BL7cYz7EOyJSMhaUTwwKlYSipepomDtAXD0ZeIjrQ8Rail
         K1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVv8hJ68po40z1CdWcCcyG9fLB6K8a0CGJkn8qGb8OkGL3CYuRf2nZXJVQGdgt1pzegwl93Ojd/R4CwJqs16Ybv@lists.infradead.org
X-Gm-Message-State: AOJu0YzjCA+0CcKmcKlPgD0HuWBw+4BYAAvN7P7WVVlTRgyN+0pzyRQc
	QliGuKhGLFFlD7sBrky0qFrLpkqQTdhprfQSFok4GnuYt31aDTC+LlNC3YnfxnVNmCjRNileE9b
	THXqVsSUy5EPDE3NE6g4oEUpTzvNZdAI=
X-Gm-Gg: ASbGncu5cRhVS0IVds9lXMjg99M1/e0xTF2IkPttno6UK7oKokb+3JrUl88y9fOhMup
	r4nFN0mOL7TpfbaRn3P3QXeqKDH9pL+Sf+treyU6vLMRzUxCXpka8zzCegn6m0hYY0obm6kf81s
	sjYBh4q4lH62vQ4sKVV9pTKxaD6orQBt0BA/l8fWmAXYJ4z0RFgDAdEB4zhR1NTQuhmsmrewV19
	2WAdw==
X-Google-Smtp-Source: AGHT+IH7GskHnBBBnN3dCWe5+4wA68V6kn1SwK+BKY5czWCCWv4gMQRXKFVR4ovK9isr0sjORC+Rjt5sK8DipW7Cf4U=
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1968076439f.1.1747691494249; Mon, 19 May 2025
 14:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com> <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
In-Reply-To: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:51:20 -0700
X-Gm-Features: AX0GCFvmTvCANqDHHj2TPhXNkmFs3wC8dEXWRCEtBjip_pfclRDeM3uxGEixFZM
Message-ID: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250519_145135_442067_483A9DF1 
X-CRM114-Status: GOOD (  30.75  )
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

On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan =
Sparse
> > > > Memory[2] in the form of:
> > > >
> > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP=
_MAP/
> > > >    MAP_NULL/UNMAP commands
> > > >
> > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > >
> > > > I did not implement support for synchronous VM_BIND commands.  Sinc=
e
> > > > userspace could just immediately wait for the `SUBMIT` to complete,=
 I don't
> > > > think we need this extra complexity in the kernel.  Synchronous/imm=
ediate
> > > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqu=
eue.
> > >
> > > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > > synchronous, you are adding an extra ioctl to wait, or do you manage
> > > these via a different mechanism?
> >
> > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > the binds happen before cmd execution
> >
> > When it comes to UAPI, it's easier to add something later, than to
> > take something away, so I don't see a problem adding synchronous binds
> > later if that proves to be needed.  But I don't think it is.
>
> I'm not 100% sure that is conformant behaviour to the vulkan spec,
>
> Two questions come to mind:
> 1. where is this out fence stored? vulkan being explicit with no
> guarantee of threads doing things, seems like you'd need to use a lock
> in the vulkan driver to store it, esp if multiple threads bind memory.

turnip is protected dev->vm_bind_fence_fd with a u_rwlock

> 2. If it's fine to lazy bind on the hw side, do you also handle the
> case where something is bound and immediately freed, where does the
> fence go then, do you wait for the fence before destroying things?

right no turnip is just relying on the UNMAP/unbind going thru the
same queue.. but I guess it could also use vm_bind_fence_fd as an
in-fence.

BR,
-R

