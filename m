Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FF3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=; b=jxkkkvt9K7ihBL1xRUKXzvOX49
	9aNA6tp7yyFI/WZOYAoqPpRrw+iEOinLOh9aGELUhXcLpVsN5qptaeloig0xue1sYEFpas7yKP1QM
	BypavBNXJPTvfx5noAJhrIF6INByC2FGV/MXrfPSUZWk57btPoZSUgUFN056P+w+cGxnEStVlmJj5
	Idf5XmRws4o6Ay+tD1QYwZjQ0SynVVcbGt01MGFKdvIwiwKWzrXQWKGltcY2I+R+jYYwSE2ZMebvE
	KNA7OJ3Can/UbtYgfC4febRq2yohx61ogVimJhEvX0KLpA+9nyQOx0dupOEglsrs3iTxs9Yf+Q/lr
	dlBnbsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8L0-0000000AdwI-25k2;
	Mon, 19 May 2025 21:47:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Ir-0000000AdDZ-27PG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:45:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad560321ed9so250607666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691144; x=1748295944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
        b=TAlLdgP/D5WIpa+wdBQ2kjLP2rc8d0cxcnwyOSyM/hdZz1d4a9T+wfFxiKIid7Js5G
         /lgfmXW9MxhZx4OCrtUo98nPAT+ekAXIx6ko+6DqvOcOHhwPS1GhshlkQ3KzK6zF40H8
         hiNWi3GrgaFxAThg0fpVgq9ahPj06Oe2x35whYxf117KLg8iJ6y7mOtipsB5W3j4oGKp
         2uWF48nGy9Cm91jBFbEdJkrLll/B8m/g1ipFJG5e6r1nzu6PAoGHiN2OOrpALm2rUMbT
         ChyLpGF94NkYa46peF3pjRplCvbTTh8lfiSNpxrvkd7ydCEk7TYHEj8IgJJ4HhJrZkPc
         +V0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691144; x=1748295944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
        b=pAEmLaLNop19Ky/6ezitlXetFept7PzLFc0P1qKSeLDywZMwVYttitYTW6Ig26uqAa
         JIuxJWj3KGKkEVacXNHemd/CstIIUxvhpACMc0hhDrrx/cyiFyiHolHIk+KzWM5CmKat
         wtig+VHmtaups0l7jw0etw+1gPB/7YRILogfjjIsUbJ7FYhTvepzMmnarhx33vJMiHkO
         ohQj0xp7pt9lzMARR4k5ceMqrCaMOWrnVIkc5bDp50R2FutU/GMZj1V2XzwsgTyAhQcB
         BDuaPQC7d+D3NMwcECn9+FfPiDqOvJtRHgdEesAoyTYS61nY/SMaVKpgsOAHkFErfvEf
         wHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhbMn0pWDX4n4xT5iEAbAEswxDcxIDKJxX/4eL+Y+Bt6qRZ5TW05qUha7K47IFsKkuAiw/ZhmOVeaZoLSRqfgd@lists.infradead.org
X-Gm-Message-State: AOJu0YxKZjwSReEQW2EJNRCl3ha4Ek4Ng+yj1DqpIT71Ypyf3/k2I+jv
	6twdk9Pk219i6zM6A3iogxb7iGWUJvdg1o2vYrfN6G7l3fFAbwuThowniStPz/dw+au5BoJl/xR
	Bu3GRsFjNV36WOh8GAwhdofFyKaPr0wI=
X-Gm-Gg: ASbGncuNuok8H8dqFMmaxwVV2isMqkEfvRxM9ls+oV4AOdZ/BKe9Q7v5BbOiMkaS1zS
	Rteb/dZmlf1vx21n98Hu+qpImJ4eoeuuIOAuYXUVygp9Yl/xseUpxjRJ289kmou7rdmmzAZFHUs
	LzMwQiqK2idtJWzF7ZUgyPFHoWKiAJdM4=
X-Google-Smtp-Source: AGHT+IGi6092BG38fgC8XNqiOOL5230Qmrls9fUA/vdLAMqijhah9L16wARI5KlQBQHVpTG9u4i5MttpQIJ/uhwrqx8=
X-Received: by 2002:a17:907:3342:b0:ad5:465d:8855 with SMTP id
 a640c23a62f3a-ad5465d9f5amr870659766b.36.1747691143715; Mon, 19 May 2025
 14:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 May 2025 07:45:31 +1000
X-Gm-Features: AX0GCFtlQu6thz2-DodB9_hvAiBP83MybA9d3wKL9euWSYgx05ywhuPOmKRAvxs
Message-ID: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
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
X-CRM114-CacheID: sfid-20250519_144545_545163_361C1C0A 
X-CRM114-Status: GOOD (  25.66  )
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

On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sp=
arse
> > > Memory[2] in the form of:
> > >
> > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_M=
AP/
> > >    MAP_NULL/UNMAP commands
> > >
> > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > >
> > > I did not implement support for synchronous VM_BIND commands.  Since
> > > userspace could just immediately wait for the `SUBMIT` to complete, I=
 don't
> > > think we need this extra complexity in the kernel.  Synchronous/immed=
iate
> > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueu=
e.
> >
> > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > synchronous, you are adding an extra ioctl to wait, or do you manage
> > these via a different mechanism?
>
> Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> the binds happen before cmd execution
>
> When it comes to UAPI, it's easier to add something later, than to
> take something away, so I don't see a problem adding synchronous binds
> later if that proves to be needed.  But I don't think it is.

I'm not 100% sure that is conformant behaviour to the vulkan spec,

Two questions come to mind:
1. where is this out fence stored? vulkan being explicit with no
guarantee of threads doing things, seems like you'd need to use a lock
in the vulkan driver to store it, esp if multiple threads bind memory.

2. If it's fine to lazy bind on the hw side, do you also handle the
case where something is bound and immediately freed, where does the
fence go then, do you wait for the fence before destroying things?

Dave.


Dave.

