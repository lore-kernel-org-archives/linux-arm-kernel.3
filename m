Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D39ACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8NjjCeXReyzcgLbvsACK7P63HLhNpR34lPrzMuu3eQ=; b=M14KaZcuR3yK0Q64zfMFKGD0Fc
	uG26wgUiKmBq5CHELHU3lK2D7YjPO5jMI7JCbS8e1NxofouJKjGl4DgaBDnwFPdflFpC2KJ7mb7BG
	rosXAm9bBX9ZMxJyOM/YlytQah3FuOxI8UMkiBvt0XDTfETT1fNWqYJJ1L7sTPdmRj16eCPfvaRdn
	3HBYzf+4GUxyRUjzzOFV6i8Nr1i4FuIn4meavW4MJre5swMHydI/HG9+9BcSh/zbQ0NrJYoDFNCZ0
	BQew6OitFeOSDB9bl/zpFpMURNA1kyRhheHbGx/BvFofL9UkemakujgwmuUJ9Nd+6vzAK0Xz2TK8/
	+1APWO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVV-00000005RLO-2jSI;
	Sat, 06 Sep 2025 00:10:17 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZpb-00000003Kf4-1pT8;
	Fri, 05 Sep 2025 17:02:36 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71d60150590so21554227b3.0;
        Fri, 05 Sep 2025 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757091754; x=1757696554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8NjjCeXReyzcgLbvsACK7P63HLhNpR34lPrzMuu3eQ=;
        b=nTlzj2CgElMKklfx/byFKPFJDuz6djPFX0aVxwy+D15vYHjLZZ8H/VN+858EqTv9vb
         K66RFg/uP8bor/bZfOxjMef8ZPruWAkOO4L9EjTMlOwHYcuPDOxP2rk2WLsT9JXDYw14
         6J5Ehw0/Eg1yjxn6sG/33WFoOtRO+r//MgKQ1qCVPbjSoQoc2FQWDLk3coPUdKkUbb5o
         D2SUAERBQ8QwGxUEgVvP57lNBcTvNtBu9sreU0zKrPM//VRZvPnX+tPajwnBUr4NFIbP
         z00B6o522f3EyQNCHqUJ3dTWn4BLv+bCqS9Xshw44bCOaSyO0N2B8u7TO/LK9EJORxyc
         HqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757091754; x=1757696554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8NjjCeXReyzcgLbvsACK7P63HLhNpR34lPrzMuu3eQ=;
        b=s0iCZqcOSBaWd5ccgf2WTvMNCjTV7ZexCizOUK6JxBwsQ+WQrfIS/5h8jy/RAf2eK8
         ERbA7ZlbfqEbDWEb22Lh2NxPMGIk8GF/YiPMP+UJwi0faX6FJeKZFR8Q+QMcFDjo1E14
         n5rxX6+uIuuLGbCxoTqe6loSjd+uNmxN28D2xL2Vg17unDw5g0i1VTMFv/vk+wnL4DLl
         NuCUsNwP5e7iV47OsFDihJ5SxikWjtYqO/cvbjf10hKMU7Kb6tNSDBv+Sdd8NT9JXoy/
         JGJbERMhJ8ALAkhX3rDpMNkH4j9kTg/bNhDiIj5yOCtgdSpXE6KBYb7Ox3CPBHYpGXIO
         Twpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUGxvpNpKy6WRkQkBhkdbpw/w1VIBObmTbKytSihmX+5egxHUGp0T8ix/Jz0hfZD5g+QLcQJjtI3uW5w0Wr46F@lists.infradead.org, AJvYcCWABmM3QMdrGvLIEuNO58+Cbl3S7ssVijcP7Od10IL1mpIFry+iV7scTnUy1j3SaiA3H4ghyz4+v7NuB4LABdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/dDuz+qJenCVdPLnTrxwCEbJhhHx0hMd+lmzR6d8oF6jhHdIQ
	hEtGczHxvY2Qi+o8Kb/mP6wIikIZg6fuTiK4/ykhH65UUNV3REczyyLKM6Kk8kTq96ZRSobYj5M
	RwsY+/sc8fNidmMJX7vbFp1pMbv8QJlo=
X-Gm-Gg: ASbGncucZbhpt6noEIwdCGHvmLvDQ3e2d5nINYAbIdw9WG//9HFGJxgwS1BE693Sx0S
	C0QceC9VK+MsMmlgMDp3eFGzZ496cl5ErVdzqm7/+EFrk3IGaNP3xAdXCnoHNgf/i5UhCzU3mHj
	Qr2Dh72HooQsotTgKmKQNHbyBpuSF/YxRdbU+KHsTbOf7ImS1d88hp/hKjNcL4pyES6E3cNBqIt
	9nsI5oEbFm3QNOLKU0RmOyhntdW8vXS7Kf1WFOK0Fdb7HC4Mwprv3URSAEd7wUAWoOMRJHo5opu
	bEZ6Yg==
X-Google-Smtp-Source: AGHT+IHqV8s7u/gMm8e8T5OVb1+2lpSpU6gKPsZXfcRfbCdMQe3sy75wOj/QBNZIdintoDq0GMgoSv3igicKxfByJtQ=
X-Received: by 2002:a05:690c:3383:b0:726:3f4b:8ee6 with SMTP id
 00721157ae682-7263f4b992emr26133807b3.45.1757091753895; Fri, 05 Sep 2025
 10:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <20250903225504.542268-3-olvaffe@gmail.com>
 <20250904080239.779b5e24@fedora> <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
 <39d3363d-dd49-43a3-b42e-a434ab6c347e@arm.com>
In-Reply-To: <39d3363d-dd49-43a3-b42e-a434ab6c347e@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 5 Sep 2025 10:02:23 -0700
X-Gm-Features: Ac12FXy0j2cggFX5ZVGDIXj0e4sNH-RhuO4KH_5mCNlFv0UkwEqWaYYEDOfSPLs
Message-ID: <CAPaKu7SU5P-SkJj6aHi3ERekM4nnrv1p1joi1ZZ-pq0ZxytP8w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_100235_482672_DFE686F2 
X-CRM114-Status: GOOD (  36.89  )
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

On Fri, Sep 5, 2025 at 2:18=E2=80=AFAM Florent Tomasin <florent.tomasin@arm=
.com> wrote:
>
>
>
> On 05/09/2025 00:06, Chia-I Wu wrote:
> > On Wed, Sep 3, 2025 at 11:02=E2=80=AFPM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> >>
> >> On Wed,  3 Sep 2025 15:55:04 -0700
> >> Chia-I Wu <olvaffe@gmail.com> wrote:
> >>
> >>> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panth=
or/Makefile
> >>> index 02db21748c125..75e92c461304b 100644
> >>> --- a/drivers/gpu/drm/panthor/Makefile
> >>> +++ b/drivers/gpu/drm/panthor/Makefile
> >>> @@ -12,4 +12,6 @@ panthor-y :=3D \
> >>>       panthor_mmu.o \
> >>>       panthor_sched.o
> >>>
> >>> +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) +=3D panthor_soc_mt8196.o
> >>
> >> Based on the stuff you describe (ASN hash, core mask read from an nvme=
m
> >> cell, extra clks/regulators?), I don't think we need per-soc source
> >> files and per-soc config options. If it becomes too HW specific (no
> >> abstraction to make it SoC-agnostic), we can reconsider the per-SoC
> >> file approach, but I believe it can all live in panthor_drv.c for now.
> > That's about right except no extra clk/regulator is needed.
> >
> > gpueb on mt8196 is yet another mcu running on its own fw.  It can
> > provide clk/regulator to panthor and no change is needed from panthor.
> > But it can also do dvfs autonomously, in which case panthor needs to
> > be modified to make clk/regulator/devfreq optional.  I think the
> > latter is where Nicolas Frattaroli is going and requires more invasive
> > integration.
>
> Hi Chia-I Wu,
>
> I beleive the changes your are proposing need to be treated as 3
> different features:
>
> 1. Handling of ASN hash
> 2. clk/regulator registration
> 3. Core Mask control in Panthor
>
> * For 1. since it is a GPU HW property, have you considered
> handling it in the DTB as HW quirk?
>
> Pass the value of the register from the DTB, then Panthor
> driver applies a mask to filter the bits and then configre the HW regs
It is a soc-specific quirk and was suggested to be dealt with using
compatible string

  https://lore.kernel.org/lkml/ac4838eb-7613-4642-a007-577a9f665984@arm.com=
/

>
> > The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> > be cleaned up and upstreamed separately.
>
> * For 2. Have you considered making the GPUEB MTK driver act as
> a clock/regulator supplier?
That's what the linked commit does

  https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54=
b32872c59cf5c77779

>
> Without a clocks, the driver won't be able to support
> instrumenation.
>
> And without a regulator or clock, how will system/runtime PM
> suspend/resume be handled in the driver?
>
> * For 3. I think this is a more complex topic and other vendors may
> have different needs.
>
> At first glance, `panthor_soc_data` does not seem to be sufficient
> to cope with other vendors.
>
> What would be the protocole used to communicate wth MCU?
> Can the MCU update the core mask on its own?
> Will the core mask change at runtime?
>
> If the core mask is static, what about adding a DTB entry?
AFAICT, gpueb reads the shader core mask from efuse and writes it to
an memory address (together with other info) specified by the gpueb
driver.  How the gpueb driver makes the mask available to panthor is
tbd, but it should be a very small change to panthor (unless we want
the gpueb driver to be a part of pantor).

I was told by the vendor that the shader core mask does not change
after boot, but can vary in unspecified ways.


>
> Kind regards,
> Florent

