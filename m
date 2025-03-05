Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35002C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK4b3HyJgM3hGDfJ0A/txTzVctgiGO140h7Vyc0X/Ho=; b=MFkAnM0cWAGAhL3AWnG4t4YfUm
	dniTqWCFW+fSl6ctfw75QwC281M/ltY2LgLnjLxJQa9p1PN18BgkXzjrVkLZcCAYjfCa4j1OkFTh1
	R/p+Jy98uVSavmZNAkN/geQ353SGwS0p4gk1ABH94dK6FmTC6Q5V6am6K8y/R6HXwhHziUvY2iNor
	D3E9623nY61HpfSOJktt1tFu2VvIs7D8KabP6QkBLYb0zsRbxifACBptvMaUSia1HPg808kMKugzi
	7DH8FVfMV6c6xjpB17rMwXJ8k3DuxvGRwiYYpWjz9rsOGoNFKU++odp7EFoycpe1d1+p0kvFncnuQ
	Hz1cUclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvU1-00000009Euu-2L1c;
	Wed, 05 Mar 2025 20:36:49 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpur9-000000098xm-3I70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:56:41 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso3350505ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741204599; x=1741809399; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK4b3HyJgM3hGDfJ0A/txTzVctgiGO140h7Vyc0X/Ho=;
        b=Osbs3XHpEXtnw2WgJ5Z0esqHSJbzJVLQMm+4Ca+p47o6wYH1ZsN0/U/ZgWrGGRwXKf
         yfJDUvf8/zUXe+ZF2wYxMpIFnLBnzSZ/NYoHDr2C2PrkBkwi1X1pHbgGa4zelBiKUYGy
         JrrF7lW4F53ZV4VToBOmIj5HCb2NwGEaSgNQSeoOxTFyy21JovydFxO/DnK55A8vuF4b
         o+5rYZ2V2szYH8zi9M1lmyO/WYeo5TtHW6EMYjTkBSK5zfVRXbGPvuHE7AbaoD7EbZ8O
         ds6xrCjr5A0cknWh+AG9jYnYrSJPERyIg0fQ0XvneFpktTd1IBsKcZAAZ489sWmpOqNO
         mwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741204599; x=1741809399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK4b3HyJgM3hGDfJ0A/txTzVctgiGO140h7Vyc0X/Ho=;
        b=RI/dOzi5EAcpYJtxMXZyTFRVm6WuRCtdVgbBezTwYYNzH6eeiGl5q+pz/waErgZbL6
         cPeQZG9fZBSILXBoQCJ0BxHXjUSKuTrQMA/t0ctRqEcj7RqTHhWJH3vjEUw6vdbiHdRn
         pEH4qA6E7/zkxLHldOTkamHAc6JhLCO2LYSmxBPnc9PUmrRR++S2lv7n7v8m0Ojcp0WY
         gW0/XHYJvsfkuFmYsRWiaEchSyZmfbA9TXbTDwo/XCT4ECEoIwSF2zHEa+261vKgsrhK
         f40cTjgPhPAoJ9AV6k9s5QHiyyDCBoi37RD0cAVD/eAPy9IsWcaP+9XG60QPlymoDoZ9
         hbOA==
X-Forwarded-Encrypted: i=1; AJvYcCVPo3PNpuODVXxIeB6dN1iHJNcBQOB+gZ9P/Nt2pytW9/QoHwPLAEvI8E+fOxeB8auwOesa1qs3oGiSWN1VJDNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1WsrM7K17PFRHIiFEDibTmYjBOyGpQztJn5zaDIFNGGRIoZef
	raJtRjg27FsxtKE1mTCeWCK6KreAAZkKQpus680v7KfigVTrE8zoMgjiHr1eh5UDud+FydQ+QIa
	K9BL6EUp4VS4LaNQoW5Elg0JZPMQ=
X-Gm-Gg: ASbGncsePpjMR34/4akxlQWZ0opadr0wNlPIQkul57nMQzc7O6Jz4r45BJHyydNx/wJ
	g0a7Q37vFqG2lqZTXGKoqu+w8DJEUxAMt7JczNgn63CbzI+LNbQaf6FwzGtVY3XO3sp7VdLMoCR
	nPs6y1zTiDZS1eErL++31guBj6KA==
X-Google-Smtp-Source: AGHT+IEvt+UeE/beJRdg2VM3BUepDP4RJEo89AbGQ5rVgDSPcu2ds6I3XEN68wZm8UcUBUrYG/0mZAlqvUDAOGYFzYg=
X-Received: by 2002:a05:6e02:216d:b0:3d1:9999:4f62 with SMTP id
 e9e14a558f8ab-3d42b873b43mr55740585ab.2.1741204598734; Wed, 05 Mar 2025
 11:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-5-be14be37f4c3@gmail.com>
 <CAF6AEGufRP9NuqC1gYy6jrQ9z+XqGFd7KNsbQw8C8NscSOJnJQ@mail.gmail.com> <CACu1E7FPO253T+EvdJdaBuqh3kb7H_r7WhBE+bVxSHMPq6ixEg@mail.gmail.com>
In-Reply-To: <CACu1E7FPO253T+EvdJdaBuqh3kb7H_r7WhBE+bVxSHMPq6ixEg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:56:27 -0800
X-Gm-Features: AQ5f1Jo3pnEpBqQToA3LD72hOF_KzihlX-Y2K6yNJMcq_UDDF0AT1ChF9aDzUjw
Message-ID: <CAF6AEGu+eHBzSu-4vsGJEcJtDhOV=LnDM1xMZJVK3=1o71B0KQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm: Temporarily disable stall-on-fault after
 a page fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_115639_854455_2E703E50 
X-CRM114-Status: GOOD (  50.19  )
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

On Wed, Mar 5, 2025 at 11:38=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Wed, Mar 5, 2025 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
> >
> > On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.c=
om> wrote:
> > >
> > > When things go wrong, the GPU is capable of quickly generating millio=
ns
> > > of faulting translation requests per second. When that happens, in th=
e
> > > stall-on-fault model each access will stall until it wins the race to
> > > signal the fault and then the RESUME register is written. This slows
> > > processing page faults to a crawl as the GPU can generate faults much
> > > faster than the CPU can acknowledge them. It also means that all
> > > available resources in the SMMU are saturated waiting for the stalled
> > > transactions, so that other transactions such as transactions generat=
ed
> > > by the GMU, which shares a context bank with the GPU, cannot proceed.
> >
> > Nit, the GMU does not actually share a cb.. looking on x1e80100.dtsi,
> > the GMU has cb 5 and gpu has 0 and 1.  (Currently we just use the
> > first, but I guess the 2nd would be used if we supported protected
> > content?)
>
> Yeah, I realized after writing this that's the case. But I guess the
> QoS issues happen even with separate context banks due to the way they
> allocate translation units?

Right, however resources are allocated to track pending translations
seems to be shared across CBs

BR,
-R

>
> Connor
>
> >
> > fwiw, you can read this from dtsi, ie. in the GMU node, "iommus =3D
> > <&adreno_smmu 5 0x0>;"
> >
> > > This causes a GMU watchdog timeout, which leads to a failed reset
> > > because GX cannot collapse when there is a transaction pending and a
> > > permanently hung GPU.
> > >
> > > On older platforms with qcom,smmu-v2, it seems that when one transact=
ion
> > > is stalled subsequent faulting transactions are terminated, which avo=
ids
> > > this problem, but the MMU-500 follows the spec here.
> > >
> > > To work around these problem, disable stall-on-fault as soon as we ge=
t a
> > > page fault until a cooldown period after pagefaults stop. This allows
> > > the GMU some guaranteed time to continue working. We only use
> > > stall-on-fault to halt the GPU while we collect a devcoredump and we
> > > always terminate the transaction afterward, so it's fine to miss some
> > > subsequent page faults. We also keep it disabled so long as the curre=
nt
> > > devcoredump hasn't been deleted, because in that case we likely won't
> > > capture another one if there's a fault.
> > >
> > > After this commit HFI messages still occasionally time out, because t=
he
> > > crashdump handler doesn't run fast enough to let the GMU resume, but =
the
> > > driver seems to recover from it. This will probably go away after the
> > > HFI timeout is increased.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 +++++++++++++++++++++++=
+++++++++-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 24 +++++++++++++++++++
> > >  drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
> > >  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
> > >  6 files changed, 81 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a5xx_gpu.c
> > > index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..670141531112c9d29cef8=
ef1fd51b74759fdd6d2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > @@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
> > >                 ring->cur_ctx_seqno =3D 0;
> > >                 a5xx_submit_in_rb(gpu, submit);
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..5a34cd2109a2d74c92841=
448a61ccb0d4f34e264 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         a6xx_set_pagetable(a6xx_gpu, ring, submit);
> > >
> > >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
> > > @@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         /*
> > >          * Toggle concurrent binning for pagetable switch and set the=
 thread to
> > >          * BR since only it can execute the pagetable switch packets.
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> > > index 1238f326597808eb28b4c6822cbd41a26e555eb9..bac586101dc0494f46b06=
9a8440a45825dfe9b5e 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -246,16 +246,53 @@ u64 adreno_private_address_space_size(struct ms=
m_gpu *gpu)
> > >         return SZ_4G;
> > >  }
> > >
> > > +void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
> > > +{
> > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > +       unsigned long flags;
> > > +
> > > +       /*
> > > +        * Wait until the cooldown period has passed and we would act=
ually
> > > +        * collect a crashdump to re-enable stall-on-fault.
> > > +        */
> > > +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
> > > +       if (!adreno_gpu->stall_enabled &&
> > > +                       ktime_after(ktime_get(), adreno_gpu->stall_re=
enable_time) &&
> > > +                       !READ_ONCE(gpu->crashstate)) {
> > > +               adreno_gpu->stall_enabled =3D true;
> > > +
> > > +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, =
true);
> > > +       }
> > > +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
> > > +}
> > > +
> > >  #define ARM_SMMU_FSR_TF                 BIT(1)
> > >  #define ARM_SMMU_FSR_PF                        BIT(3)
> > >  #define ARM_SMMU_FSR_EF                        BIT(4)
> > > +#define ARM_SMMU_FSR_SS                        BIT(30)
> > >
> > >  int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, in=
t flags,
> > >                          struct adreno_smmu_fault_info *info, const c=
har *block,
> > >                          u32 scratch[4])
> > >  {
> > > +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >         const char *type =3D "UNKNOWN";
> > > -       bool do_devcoredump =3D info && !READ_ONCE(gpu->crashstate);
> > > +       bool do_devcoredump =3D info && (info->fsr & ARM_SMMU_FSR_SS)=
 &&
> > > +               !READ_ONCE(gpu->crashstate);
> > > +       unsigned long irq_flags;
> > > +
> > > +       /*
> > > +        * In case there is a subsequent storm of pagefaults, disable
> > > +        * stall-on-fault for at least half a second.
> > > +        */
> > > +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
> > > +       if (adreno_gpu->stall_enabled) {
> > > +               adreno_gpu->stall_enabled =3D false;
> > > +
> > > +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, =
false);
> > > +       }
> > > +       adreno_gpu->stall_reenable_time =3D ktime_add_ms(ktime_get(),=
 500);
> > > +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_fla=
gs);
> > >
> > >         /*
> > >          * If we aren't going to be resuming later from fault_worker,=
 then do
> > > @@ -1143,6 +1180,9 @@ int adreno_gpu_init(struct drm_device *drm, str=
uct platform_device *pdev,
> > >                 adreno_gpu->info->inactive_period);
> > >         pm_runtime_use_autosuspend(dev);
> > >
> > > +       spin_lock_init(&adreno_gpu->fault_stall_lock);
> > > +       adreno_gpu->stall_enabled =3D true;
> > > +
> > >         return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->bas=
e,
> > >                         gpu_name, &adreno_gpu_config);
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.h
> > > index dcf454629ce037b2a8274a6699674ad754ce1f07..a528036b46216bd898f6d=
48c5fb0555c4c4b053b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -205,6 +205,28 @@ struct adreno_gpu {
> > >         /* firmware: */
> > >         const struct firmware *fw[ADRENO_FW_MAX];
> > >
> > > +       /**
> > > +        * fault_stall_lock:
> >
> > nit, @fault_stall_lock:  And for
> > fault_stall_reenable_time/stall_enabled, it wouldn't hurt to add
> > something along the lines of "Protected by @fault_stall_lock".  I've
> > been slowly trying to improve the comment docs over time, I have some
> > of that in my vmbind patchset.
> >
> > Anyways, with those nits addressed, r-b
> >
> > BR,
> > -R
> >
> > > +        *
> > > +        * Serialize changes to stall-on-fault state.
> > > +        */
> > > +       spinlock_t fault_stall_lock;
> > > +
> > > +       /**
> > > +        * fault_stall_reenable_time:
> > > +        *
> > > +        * if stall_enabled is false, when to reenable stall-on-fault=
.
> > > +        */
> > > +       ktime_t stall_reenable_time;
> > > +
> > > +       /**
> > > +        * stall_enabled:
> > > +        *
> > > +        * Whether stall-on-fault is currently enabled.
> > > +        */
> > > +       bool stall_enabled;
> > > +
> > > +
> > >         struct {
> > >                 /**
> > >                  * @rgb565_predicator: Unknown, introduced with A650 =
family,
> > > @@ -629,6 +651,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, uns=
igned long iova, int flags,
> > >                          struct adreno_smmu_fault_info *info, const c=
har *block,
> > >                          u32 scratch[4]);
> > >
> > > +void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
> > > +
> > >  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> > >
> > >  /*
> > > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/ms=
m_iommu.c
> > > index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b=
51527bf15748b3ada71 100644
> > > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > > @@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct =
msm_mmu *mmu)
> > >                 adreno_smmu->resume_translation(adreno_smmu->cookie, =
true);
> > >  }
> > >
> > > +static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
> > > +{
> > > +       struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(mmu-=
>dev);
> > > +
> > > +       if (adreno_smmu->set_stall)
> > > +               adreno_smmu->set_stall(adreno_smmu->cookie, enable);
> > > +}
> > > +
> > >  static void msm_iommu_detach(struct msm_mmu *mmu)
> > >  {
> > >         struct msm_iommu *iommu =3D to_msm_iommu(mmu);
> > > @@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs =3D {
> > >                 .unmap =3D msm_iommu_unmap,
> > >                 .destroy =3D msm_iommu_destroy,
> > >                 .resume_translation =3D msm_iommu_resume_translation,
> > > +               .set_stall =3D msm_iommu_set_stall,
> > >  };
> > >
> > >  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quir=
ks)
> > > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_=
mmu.h
> > > index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b7=
67b16ed0cee806406cf 100644
> > > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > > @@ -16,6 +16,7 @@ struct msm_mmu_funcs {
> > >         int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
> > >         void (*destroy)(struct msm_mmu *mmu);
> > >         void (*resume_translation)(struct msm_mmu *mmu);
> > > +       void (*set_stall)(struct msm_mmu *mmu, bool enable);
> > >  };
> > >
> > >  enum msm_mmu_type {
> > >
> > > --
> > > 2.47.1
> > >

