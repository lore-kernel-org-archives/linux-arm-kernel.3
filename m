Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE862C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=; b=tdPQg3W4s4jeVhvLopai9ZbG6U
	lmLeMFp1mx4FVUspig6fhVZ1bFO+UmRa5RVSz+xJlIQNtzRb0zARpx8Y1zZJCoS/k+bZ2CJPf2LCL
	u4HQ5npGGogfl8yqpztBV47tHevtDIPD9hQc0tqU9k8gQAsd3qgflr5mxOTodVlC8qfakV1ELQUt1
	W7Pc3lv2ITaMEygjdqvcGZO4LLsVRLEz2bo6531A6FksmXb56ACEVDmD47SzyAxm4GIkfRoewh3vN
	EhsoG4i6MB1USYhxVQlt9oWEJSLDfHc0FhLCwwz32B4ZKkpfqJ4hEQL4QX/WE5lTejmjf/RAE3enR
	OKLTN4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5GV-0000000EyEb-3n9f;
	Thu, 05 Jun 2025 07:43:55 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5EF-0000000Ey0L-084w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 07:41:37 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e7db5c13088so636000276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749109293; x=1749714093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
        b=M9SZW+u31bG85OzuBKQ03hiuk1+MrDdlhbWrDfcKuz+Rdj+w3sxuJwbxSxRMEnWUPd
         9AY6esEIK2W9q/omFyb34s7laCt0Etdr9TcngqzH78HrXBkvaItGwatLRFGNtl/WFDcB
         dXM/0MOITwlkifuXMnzbt7XQJHB3mKGKiG5Ez525I4M2dJy4b6GQDPmA+ksXgWnV1deU
         AmTrXg1Ts/ekZ4hkkNIy1/eg0yt02cXJ/vqK4XLyKv06zUsFTFkDZOPnekDVpGMAzA1q
         JR2Ry/U1jHIqzO2gFO40fr15TZG4Et8ZLrFjfTN7IF2hPZAGsk6gYE/xMLPXxRKlxVp0
         2USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109293; x=1749714093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
        b=soz34FzV7x5zHL1UzdEKucRdl8bNxouyXU45QtBBYLWrDSvGWas4vpt9zkhFb1NRLs
         C/I9e5H3A1GVXsf3UY2UkZNtz5Eyj+qX2zTlNwL+yYJxYBv5ssChxqXp/KMHElauAJP+
         dx+qsRuhXhLMvTW0bXFmP2xgwo9Uowetn0yKN2WtBHbKl/z65T+FNVyq0V/i53PP6puZ
         Nvm0yP4vqWwa1esrbE+CvJ0NIkyJFF21A+iLdhdFWoeY11ugQi2YQWFv4meZ7DYjJOu6
         jUU6zswzxeHLOtzBO7M5vAPBYXJ/7eFCtPg61TX1RKYzVZyl+bAFZv8tD0h24zeR5p0J
         EZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVDtPjsjkItvo5TUYvWq1du+p7M3uBpr40OSgbKxBjVEd2177taHS82C8l9jj2FQDdMGlxxDDQ72gb6d03MZAEW@lists.infradead.org
X-Gm-Message-State: AOJu0YwFBHYvTcUlG9pFSDSDF7uGNOShWgF2hVxkco6kuhrfujkSQyir
	OwQdhPvCYPV3hYrKJf7XXwM+avVV3hnMmUzBkzh4pkWVrSSWao+UAyk3q/rbumbFnXmLjkQiu9E
	tleOqZgAaog==
X-Gm-Gg: ASbGncsTdDE13dynVyajrhFH+wKlwYGnzbBRCaGlKBCSZJoT0tbeLq3WhvqlzFmzHCc
	HtWEcuGSND7/eXkgcfmND35QlBHb7H3vDREAHziqx9bdLVMMEZv99np5PdJZAdfSv9QyVxwTseV
	p16dW8bPUAtifSmPEPquOAERxp105ip5W9pDevVhEI5taLOzPGB2sL0Ga3DCpHZSkAQKrs3SRW6
	YZWjvAFLZUvTEagx6w2l4UHQRkLnMPZCNK+Zk+pqTxY58lSUpg+RDqWw0ZXCmqF3clEM9XFwG26
	etp41B1zELscA0qfJYFsxEIYPfsGfvw64JOSlvCbyPhrEyzeJwfY69ea5z1dtyY/ONxGdZAlX3L
	lnQFV8hwLCROrXrBBacJqDoW0sBG8uQ==
X-Google-Smtp-Source: AGHT+IF9YLdGWUisnnJTaPXHEt5Oljpn80lVxWlOHVaxC+brcGwAFaBwD/IVDLOJ9PSEod7f1F9TPw==
X-Received: by 2002:a05:6902:1026:b0:e7b:95eb:be9b with SMTP id 3f1490d57ef6-e81882370c3mr3450203276.5.1749109293110;
        Thu, 05 Jun 2025 00:41:33 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81831fecd3sm501664276.36.2025.06.05.00.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7db5c13088so635979276.1;
        Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK1RwjsgNHb+aR9hqZAGBiSOq6bajdHcsEEAophUPCmJdWWc+GDFSBbGEuj6RC8Mqkmj0x98tz1WsFSZGaBT8=@lists.infradead.org, AJvYcCXsNUn9JmsKCXexaiLi69QS8yd7vQT+SYKyTHhS1mLU12O1JliLVMrYb+YGEdvCZFphgTNgaGvEwJAiQZIIGfIY@lists.infradead.org
X-Received: by 2002:a05:6902:1387:b0:e7d:c621:33d1 with SMTP id
 3f1490d57ef6-e81882c7d19mr3544074276.14.1749109291936; Thu, 05 Jun 2025
 00:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
In-Reply-To: <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 09:41:21 +0200
X-Gmail-Original-Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
X-Gm-Features: AX0GCFucQ_FiqAlA0rjsUQpt2JT7jK-lOTeRvMqo5HOGrCT-6j2Gn-ED1Jn3Rvg
Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_004135_176244_EEC90E7A 
X-CRM114-Status: GOOD (  45.23  )
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

On Wed, Jun 4, 2025 at 7:03=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2025-06-04 5:18 pm, Daniel Stone wrote:
> > Hi Tomeu,
> > I have some bad news ...
> >
> > On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote=
:
> >> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct=
 drm_file *file)
> >> +{
> >> +       [...]
> >> +
> >> +       /* This will map the pages to the IOMMU linked to core 0 */
> >> +       sgt =3D drm_gem_shmem_get_pages_sgt(shmem_obj);
> >> +       if (IS_ERR(sgt)) {
> >> +               ret =3D PTR_ERR(sgt);
> >> +               goto err;
> >> +       }
> >> +
> >> +       /* Map the pages to the IOMMUs linked to the other cores, so a=
ll cores can access this BO */
> >
> > So, uh, this is not great.
> >
> > We only have a single IOMMU context (well, one per core, but one
> > effective VMA) for the whole device. Every BO that gets created, gets
> > mapped into the IOMMU until it's been destroyed. Given that there is
> > no client isolation and no CS validation, that means that every client
> > has RW access to every BO created by any other client, for the
> > lifetime of that BO.
> >
> > I really don't think that this is tractable, given that anyone with
> > access to the device can exfiltrate anything that anyone else has
> > provided to the device.
> >
> > I also don't think that CS validation is tractable tbh.
> >
> > So I guess that leaves us with the third option: enforcing context
> > separation within the kernel driver.
> >
> > The least preferable option I can think of is that rkt sets up and
> > tears down MMU mappings for each job, according to the BO list
> > provided for it. This seems like way too much overhead - especially
> > with RK IOMMU ops having been slow enough within DRM that we expended
> > a lot of effort in Weston doing caching of DRM BOs to avoid doing this
> > unless completely necessary. It also seems risky wrt allocating memory
> > in drm_sched paths to ensure forward progress.
> >
> > Slightly more preferable than this would be that rkt kept a
> > per-context list of BOs and their VA mappings, and when switching
> > between different contexts, would tear down all MMU mappings from the
> > old context and set up mappings from the new. But this has the same
> > issues with drm_sched.
> >
> > The most preferable option from where I sit is that we could have an
> > explicit notion of driver-managed IOMMU contexts, such that rkt could
> > prepare the IOMMU for each context, and then switching contexts at
> > job-run time would be a matter of changing the root DTE pointer and
> > issuing a flush. But I don't see that anywhere in the user-facing
> > IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
> > why it's not possible ...
>
> On the contrary, it's called iommu_attach_group() :)
>
> In fact this is precisely the usage model I would suggest for this sort
> of thing, and IIRC I had a similar conversation with the Ethos driver
> folks a few years back. Running your own IOMMU domain is no biggie, see
> several other DRM drivers (including rockchip). As long as you have a
> separate struct device per NPU core then indeed it should be perfectly
> straightforward to maintain distinct IOMMU domains per job, and
> attach/detach them as part of scheduling the jobs on and off the cores.
> Looks like rockchip-iommu supports cross-instance attach, so if
> necessary you should already be OK to have multiple cores working on the
> same job at once, without needing extra work at the IOMMU end.

Ok, so if I understood it correctly, the plan would be for each DRM
client to have one IOMMU domain per each core (each core has its own
IOMMU), and map all its buffers in all these domains.

Then when a job is about to be scheduled on a given core, make sure
that the IOMMU for that core uses the domain for the client that
submitted the job.

Did I get that right?

> > Either way, I wonder if we have fully per-context mappings, userspace
> > should not manage IOVAs in the VM_BIND style common to newer drivers,
> > rather than relying on the kernel to do VA allocation and inform
> > userspace of them?
>
> Indeed if you're using the IOMMU API directly then you need to do your
> own address space management either way, so matching bits of process VA
> space is pretty simple to put on the table.

My impression was that the VM_BIND facility is intended for SVM as in
OpenCL and maybe Vulkan?

Guess my question is, what would such an accelerator driver win by
letting userspace manage the address space?

Thanks,

Tomeu

