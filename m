Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C1DC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=; b=oIaiR66oKPvu2ca8z2P+VfKBQP
	dOKuNz0+dmvBP24p3tDByl08ElKDQVpjEqQYBFiogHg7wfhXbsFpevrnT7AJA0RbV2aAtgFnvm21q
	sDF4qcJSqZgs0P2iMpdqq4pr3xDD1wD/whwk+yuwm+64v89RlmpAD8GQ2P4/gr7rd0+dGY0WSxJdf
	ruryWZqET/LKVxYX7Q/aVYOcMKJjiEjApyrkR2hL1pobq84TVYoxTbL5PexCeVW5CoBFbUmrlpAaJ
	WNpkfIiec38dR/IDBhElmjbMyw/rgwfxI3hxFCOf14YAZuqRC32Fa9oxynpY8CKulUXYzrcXpoXa8
	nAPWt2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMGd-00000009tPH-3bGd;
	Thu, 30 Jul 2026 08:37:27 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMGa-00000009tO3-1Zc0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:37:26 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-667b0ced2d3so2717109d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785400643; cv=none;
        d=google.com; s=arc-20260327;
        b=oeLWYK6yl8utCFvEujPh+SvZAVx7IruuMXkyeSF5ilhb9haTCcA1T2iQo75dwe7yxL
         Ac/BQC+7pDPVQ7cZiyXcZ/vgx8fRgaGBS6zUIJx5qkkQiTJdleqWnDOpGdKP/iS6Ebz8
         YrrdKzS8zv37WaR7pliZr5OllrrqyyZBPAc6trG09fkBdixgUiKNiUy31IczF9oBxV6D
         Mn3TU6GDJ6ClHeWKCpbuaCCrkY2pjD1qjo0lqPLcAKMEuVo+JKuNYK+mU6cfUEed4f1o
         DjUuJv53Glz+ZmPKV4SwquxRLe1JQAnDNekrWmXt1PQFC0hjRNNTCaf6OF4N/R45ZQlS
         Wang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        fh=rJPk+pjwteiy1keP7v0Wsmd8aC4gINlVgW4C9PM0AbU=;
        b=KOYBn9g+D1BI5QYiCWWD+nuaCf1bff5VxUZy4phJ01r1JJSFQCMCxYoYNpLzvaCiu/
         XsPODyyzhidXVCbaYMSoWqxgf1BciOuXsBlUH73T9/4ltUD2l/bDA3gH6IDuMrq3FMQs
         4jzsRUYCVEfu2UHv47KULSyvv9c10dC9bUl1zMl4SScyLxWyzr+pwsnDtPCdx9MnAHD1
         hC5fWfBZi7vn42IUXKrLHc+RBnDunV+s6ZyiF4NIROH3RV3sp3l4p5MKs5wzKyqDkvqi
         iab0yBMYSzMYnYqb36DfAM4838gIQgmQ5c/dM1fVyhkzxz0lsznV6PkIoPpwH8k2PUyh
         twAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785400643; x=1786005443; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        b=DyKHeKg3+OQa3iZ8oY2CWX5XV6BuDpd1kY9Jl7CNwz0I6adVSGKcdudpZ0QtBmfrEF
         Vm5QR/qiFfyUHzkFx7AOmu5vJ+uioUALiVcodPZ+P4NRQst18rWRyl02Lb+MinYhNlOv
         MyUPqltn/aqfvMnLXaVHX7PXhjZpE0vny847s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400643; x=1786005443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        b=rfbwGirdJ7UChXBpPQdOMDgaxeMjFs8vu8gcDeqnOKFP9vNUpKPe94wWlam8ZPZWcC
         o+afHMxKww/c2vQRVsYqH8cjKlI7f0SF2kOh7azSo5n5gdHrzp6VzUGYR1Dh21TK0mat
         vnfJSYwHuWhzhLxF8GCwX3198teB8Xj7Q+jV3ANtB4J7VyNSTzq3InKTUc6Wz86XHlO4
         nN2O5eCbWU8XdJHRw0h4YUKQqD7J9XUFXHMjAcmrPp2KXtmJ6e1D+tgKXNvgsAWf8o+Y
         F+7EDCix2maWYbypYgmfnVSdia1QKpFuumTRs45uiUV+XTfApHyFSZuUtRhLq7r+HBEG
         Hyzg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Nh4ChMfXpBFhJlDpoFUUDHTe9P9mfjiTwrm/rOnu/0OvqRkAFu5pVUpRDSJCcYENPDZYw3JF6N+kX2OQRc7c@lists.infradead.org
X-Gm-Message-State: AOJu0YwEjM1azbMmWoGwdf4leutyq+7hVSeMYPhQ56re+MXNrBdFnQIN
	LRVlP702TT/o8SH8DlZu+DCU1FJy4scTVKtTLvBedinW68eX0KQFnKxG8TglRWNJuY98FNqXyRF
	1pwuY3QTm/cmF+KKxxRYacyCzi//gCaRtoh3zxvzV
X-Gm-Gg: AR+sD10s7dH05nMbh7pOt7XN125gwCset0V3UfVJBiAilgY7AnxIygzaXZgxiV2s8X/
	kVY8fk7j3yX0Qyrtg9wqWXbnS5PmJ/wp64zH2jn7IbTPrLdGFRB5UWpiNSUPx0JKE0XhK6sREAY
	SIXVyCIK/smzDg6tdCZJR2B0qZ7uxxfVPooIpz/AOfwkGNsHQqW+6jn3Rhb4taN7X+XiJ3T52Lk
	VGfcLa1tG6sDDeKc8UgEm+b9WZZqu+PIs/D/wlPa8Ci6Gos/edrs9OEEa/v14QqwAYqfjUr6UDa
	j/R38rbtZEd9w4Gf65jc3BgnPa1sYQ9kvskr/FGBwG62WG2W0n/sRl70Mj512xA4ZMDxOpwrAkU
	=
X-Received: by 2002:a05:690c:ecb:b0:814:608a:a2f7 with SMTP id
 00721157ae682-81fb89bd682mr11853577b3.25.1785400643037; Thu, 30 Jul 2026
 01:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
 <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com> <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com>
In-Reply-To: <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 16:37:12 +0800
X-Gm-Features: AUfX_mz9ndgpKU1aVx4ZJqOpOdAsme5iiSGANxBR0WVL0ps6zyho2cMcn1ou8yE
Message-ID: <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: YoungJoon Lee <getfeus@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wens@kernel.org, 
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_013724_521113_5838FA77 
X-CRM114-Status: GOOD (  52.97  )
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

On Wed, Jul 29, 2026 at 5:35=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com> w=
rote:
>
> Hi Chen-Yu,
>
> A follow-up to my previous email.
>
> The official v1.1 firmware did fix the original "GPU device lost"
> problem.
>
> The following now works correctly:
>
>     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
>
> The driver initializes successfully and detects the PowerVR Rogue
> GX6250.
>
> However, while testing actual rendering, I found another issue which
> appears to be unrelated to the firmware.
>
> Kernel:
>
>     Linux 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
>
> Board:
>
>     Google Elm (Acer Chromebook R13 / MT8173)
>
> Mesa:
>
>     mesa 26.1.5
>     vulkan-powervr 26.1.5
>
> Firmware:
>
>     rogue_4.40.2.51_v1.fw
>     FW version v1.1 (build 6976702 OS)
>
> Kernel command line:
>
>     powervr.exp_hw_support=3D1
>
> Test command:
>
>     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
>
> Renderer:
>
>     GL_RENDERER:
>     zink Vulkan 1.2
>     (PowerVR Rogue GX6250)
>
> The benchmark progresses normally:
>
>     build (VBO off)          212 FPS
>     build (VBO on)           216 FPS
>     texture nearest          174 FPS
>     texture linear           173 FPS
>     texture mipmap           174 FPS
>     shading gouraud          165 FPS
>     shading blinn-phong      135 FPS
>     shading phong             99 FPS
>
> It consistently hangs at:
>
>     shading=3Dcel
>
> Immediately afterwards the kernel reports:
>
>     refcount_t: underflow; use-after-free
>
> The first warning is:
>
>     pvr_free_list_put()
>       -> pvr_hwrt_dataset_release()
>       -> pvr_hwrt_dataset_put()
>       -> pvr_ioctl_destroy_hwrt_dataset()
>
> followed by:
>
>     refcount_warn_saturate()
>
> Shortly afterwards another kernel Oops occurs:
>
>     Unable to handle kernel NULL pointer dereference
>
> The second backtrace shows:
>
>     pvr_gem_object_create()
>       -> pvr_fw_object_create()
>       -> pvr_hwrt_dataset_create()
>       -> pvr_ioctl_create_hwrt_dataset()
>
> The glmark2 process remains as:
>
>     glmark2-es2-drm <defunct>

I think this is more related to the unsupported nature of the GX6250,
and not specific to MT8173. Maybe someone else on the Imagination or
DRM mailing lists has a better idea of what's going on.


ChenYu

> The system is otherwise still reachable through SSH.
>
> I collected additional diagnostics, including:
>
>     - complete dmesg
>     - complete kernel journal
>     - kernel configuration
>     - PowerVR module information
>     - userspace package versions
>     - process/thread state
>     - runtime PM state
>     - running Device Tree
>
> I can send any of these if they would help.
>
> Also, please disregard my previous Tested-by tag for now, since this
> rendering issue was discovered afterwards.
>
> Thank you again for your help.
>
> Best regards,
>
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 13:38 YoungJoon Lee <getfeu=
s@gmail.com>:
> >
> > Hi Chen-Yu,
> >
> > Thank you. Updating the firmware fixed the issue.
> >
> > I replaced my previous firmware blob with the official v1.1 firmware:
> >
> >   FW version v1.1 (build 6976702 OS)
> >
> >   SHA256:
> >   e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
> >
> > After rebooting, the driver loaded the new firmware successfully:
> >
> >   powervr 13000000.gpu: [drm] loaded firmware
> >   powervr/rogue_4.40.2.51_v1.fw
> >   powervr 13000000.gpu: [drm] FW version v1.1
> >   (build 6976702 OS)
> >
> > I then ran:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > This now completes successfully and detects the PowerVR Rogue GX6250.
> > The previous "GPU device lost" error no longer occurs.
> >
> > So the issue was caused by the older, non-official firmware blob I was
> > using, rather than the v4 kernel series or my kernel configuration.
> >
> > Thank you for pointing this out, and sorry for the noise.
> >
> > Tested-by: YoungJoon Lee <getfeus@gmail.com>
> >
> > Best regards,
> > YoungJoon
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst=
@chromium.org>:
> > >
> > > On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.=
com> wrote:
> > > >
> > > > Hi Chen-Yu,
> > > >
> > > > Thank you for posting the v4 series.
> > > >
> > > > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > > > seeing a GPU device loss as soon as Mesa initializes the Vulkan dev=
ice.
> > > >
> > > > My current setup is:
> > > >
> > > >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> > > >   Kernel:
> > > >     linux-next next-20260727
> > > >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> > > >     (next-20260727-5-g33d6e5134c70)
> > > >
> > > >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> > > >
> > > >   Mesa: 26.1.5
> > > >   vulkan-powervr: 26.1.5
> > > >   Firmware:
> > > >     rogue_4.40.2.51_v1.fw
> > > >     SHA256:
> > > >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f=
2
> > >
> > > My firmware blob is different from yours:
> > >
> > > powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v=
1.fw
> > > powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
> > >
> > > SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323=
e4a
> > >
> > > Funny thing is neither of ours match the official firmware blobs rele=
ased
> > > by Imagination [1].
> > >
> > > The latest version is "FW version v1.1 (build 6976702 OS)" with
> > > SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1=
c44
> > >
> > > This version also works for me.
> > >
> > > The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> > > SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d2=
2f2
> > >
> > > And this version also works.
> > >
> > > It seems your firmware build is even older than mine. I suggest you
> > > update it and try again?
> > >
> > > [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/=
powervr/powervr/rogue_4.40.2.51_v1.fw
> > >
> > >
> > > > All five patches applied cleanly. The PowerVR driver probes, loads =
the
> > > > firmware, and creates the DRM render node successfully.
> > > >
> > > > However, when I run the following from an SSH session without GDM o=
r
> > > > another graphical session running:
> > > >
> > > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > > >
> > > > Mesa prints the expected GX6250 warnings:
> > > >
> > > >   Missing reset support for brn51764
> > > >   Missing reset support for brn58839
> > > >   Missing support for brn62269
> > > >
> > > > The command then hangs, and the kernel reports:
> > > >
> > > >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > > >
> > > > There are no additional timeout, MMU fault, firmware, clock, or run=
time
> > > > PM messages immediately before the device-lost message.
> > > >
> > > > I originally also observed the same failure when GDM started GNOME
> > > > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > > > session indicates that this is not specific to Mutter or GNOME.
> > > >
> > > > Since your cover letter reports that vkmark and glmark2-es2-drm wor=
k
> > > > with Mesa 26.1.5, I suspect that there may be a difference in the
> > > > kernel configuration or another part of the test environment.
> > > >
> > > > Could you please share the following details from your working setu=
p?
> > > >
> > > >   1. The exact Chromebook board/model used for testing
> > >
> > > The codename is "telesu", which is basically a hana in a different ca=
se.
> > >
> > > >   2. The exact kernel base commit
> > >
> > > I have a whole bunch of patches on top of next-20260727, but none
> > > that should affect this.
> > >
> > > >   3. The kernel configuration, or at least the relevant DRM, PM,
> > > >      generic power-domain, IOMMU, and MediaTek clock options
> > >
> > > All relevant options are built-in.
> > >
> > > >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
> > >
> > > Module.
> > >
> > > >   5. The firmware SHA256
> > >
> > > See above.
> > >
> > > >   6. The kernel command line and bootloader used
> > >
> > > Chromebook's builtin bootloader.
> > >
> > > cmdline:
> > >
> > >     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31=
A
> > >     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debu=
g=3D0x106
> > >     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
> > >
> > > AFAICT nothing special.
> > >
> > > >   7. Whether `vulkaninfo --summary` also completes successfully
> > > >
> > > > My current relevant configuration includes:
> > > >
> > > > CONFIG_PM_SLEEP=3Dy
> > > > CONFIG_PM=3Dy
> > > > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > > > CONFIG_MODULES=3Dy
> > > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > > CONFIG_DRM_POWERVR=3Dm
> > > > CONFIG_DRM_MEDIATEK=3Dy
> > > > CONFIG_SYNC_FILE=3Dy
> > > > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > > > CONFIG_IOMMU_SUPPORT=3Dy
> > > > CONFIG_ARM_SMMU=3Dy
> > > > CONFIG_MTK_IOMMU=3Dy
> > > >
> > > > I would be happy to test additional patches or provide any further
> > > > logs, kernel configuration, or debugging information if that would
> > > > help.
> > >
> > > As mentioned above, please try updating your firmware blob. Your
> > > version is even older than mine, and neither of ours is the "official=
"
> > > release.
> > >
> > >
> > > Thanks
> > > ChenYu
> > >
> > >
> > > > Thanks,
> > > > YoungJoon Lee
> > > >
> > > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino=
 Del Regno
> > > > <angelogioacchino.delregno@collabora.com>:
> > > > >
> > > > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del R=
egno
> > > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > >>
> > > > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney=
@redhat.com> wrote:
> > > > > >>>>
> > > > > >>>> Hi Chen-Yu,
> > > > > >>>>
> > > > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote=
:
> > > > > >>>>> Hi everyone,
> > > > > >>>>>
> > > > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > > > >>>>>
> > > > > >>>>> This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > > > >>>>>
> > > > > >>>>> Changes since v3 (all in the clk driver patch):
> > > > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > >>>>> - Added missing of_node_put() in remove function
> > > > > >>>>>
> > > > > >>>>> Changes since v2 (all in the clk driver patch):
> > > > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > >>>>>     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > >>>>>       domain library, which also depends on PM
> > > > > >>>>>     - Fixes build breakage (kernel test robot)
> > > > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > >>>>> - Dropped unused mfg_desc (Brian)
> > > > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > >>>>>
> > > > > >>>>> Changes since v1:
> > > > > >>>>> - Adapted to changed DT bindings
> > > > > >>>>> - Dropped driver change
> > > > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > > > >>>>>
> > > > > >>>>>
> > > > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > >>>>> some Chromebooks.
> > > > > >>>>
> > > > > >>>> I'm making a pull for Stephen for the clk changes. Should pa=
tches 1,2,4
> > > > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree=
?
> > > > > >>>
> > > > > >>> Only patches 1 and 2 should go through the clock tree.
> > > > > >>>
> > > > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants=
 to pick up
> > > > > >>> DT binding patches. Otherwise I can push patch 3 through drm-=
misc.
> > > > > >>>
> > > > > >>
> > > > > >> Not sure if I can really take the DRM bindings patch through s=
oc.
> > > > > >>
> > > > > >> I will take the devicetree ones exactly right now, even though=
 it's going to
> > > > > >> give warnings.
> > > > > >>
> > > > > >> I trust that you'll make the binding get into linux-next befor=
e it's too late.
> > > > > >
> > > > > > Rob beat me to it. :D
> > > > >
> > > > > Love it!
> > > > >
> > > > > Thanks Rob :-D
> > > > >
> > > > > Cheers,
> > > > > Angelo

