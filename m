Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1952C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=; b=lVJJuz8xZ71lgflWgLRo12FA/Y
	XZfN5zlWjM3N1gQvczSvaJVcK85l04uN6/d5Ju+1h7gIupomHIlX5hO4Zvl8hDh5uK1vRbgru6yxG
	sUV6zDBm2nClifHcjJUlbAuNSCSAJleSHqBLNtcS5589j8m7SEHAtY+o+61iO6t/qoqsLA8TT5TMk
	Vmx2oJRzjgbJyMcaEAKn5BqoUbB5FsSG+8HB3y3bHqRnZRozTiU0AzyKlhGjJA96Nva68DYXp76Ps
	ZdF8wNKLS84iROVAYRBESyNuoMck6yzGxXS+/pBrLfqLjJLn6e7Gn1WEcWNh4ZpjZtME0nx/YrAJZ
	dNPh8X5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow46-00000006r5e-3NFD;
	Wed, 29 Jul 2026 04:38:46 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow42-00000006r4Z-2VHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:38:44 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-49fa951b2c6so290842b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 21:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785299921; cv=none;
        d=google.com; s=arc-20260327;
        b=AzlAlq4sZjLtPAF34ZCEcduWPqKbxGyWglw4Hd2nuqzweUPV+LdaCGKeHQ4Mx6OM3O
         ZQG8UCCPVcRIFSUN7EMBulsZqsJnnFPGCFLNmOVbmm6DfZHK8LD1ssec/ZiLYT4N5FDO
         4qthLL0pBM+jDXd79exejF0Ud56F6VugJUCakQtvl/evtZZjsl3gSBiFy49L6ywduLZr
         xMACoB4uwIBA1t8FhWiBubXeKRbxmQykY4ZBJb9ctuNqMqh18KNx0NVr5snKbMyUENet
         CZa4lJkEfX176X3co1lcnx65e39B+ybl4D3nden+kF5wMZIjj26NuUVtFvxFYZa6ovGF
         xR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        fh=PwSxGBdzKzP21UmILvA5RVdvwJl1EeH9cjryCHVzSFo=;
        b=dcJnalK/TUUMzknYL/SEgfS2nsEU1QStV/rT+lH+Jx+0gT3PxDS8zxs5MDjRI/y9jS
         TqrDibHs5ec03KS2wVefr7DH5/so+jP15hQCjxCeIn5ZBU2V1WlAZCokzSySUKs0eHic
         ipHMwROCO2QgcJDEpJOE1QZGvaPtTyFzp8Xy4n9yEgryOs1kGz5nzlod+H2FgPld68hU
         tUKLuiM1AU8w0TA8pHgfOIhf3zgxnkDW8s+gD0DAlfBy2vp1U+61DTG6brAXR3KJ9x6W
         VioWt2g8nZaXqAaHB5qBmhlBRSm3/EbPDR1OHopOtRGiETGzG4UUoj9tUTtVT7hf3wtp
         yZDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785299921; x=1785904721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=L6weF52fjBZ4nMn81XRRyi6k+a9BRHTPoUrUMklbZRpSHJXnTG3ugY61OSnVVaCFLy
         1Wh2MGeoEXOzkISbY3Sq6REdk8rct+DWBXKJnoVRDuvdlEAZ9CQ39D5c6vLetvj1ueHq
         XGdQ0z5Jus9HXYFoDJGw1ZJAW9BrrM+Gq22gG5y3bxmq6bmhFUc8WibsFBd1KVa7j52E
         5QOT3YxA/mGgMPonY5RE7oDS2dbyKxbme2dGlJpBf8h5GLvQgcpQKmbfzR+1Wrep6DxX
         I9XfM2a/Bp02Rnp5i7mBCnQkPsyq07dOagj7kTQbvm6llAVi6ZqU8AAAkWgzyiicfSj0
         fEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785299921; x=1785904721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=TPTJIncdyRUvER+S7LB2CTRK4DOzWrHRQHN/MGqfkacdC8qO/dY2+qrd15R8WQdT17
         +Wm2v4j2xHBb1ZZMDNCZmSfm3GizcJhirINV8CbIO/DOz9zFUXeDowm0RNOyEUjhUPbO
         t5XPX2XebWir1pMtIKJRxVD9FEdG9tYz8EFVAHOmV+mEVNISq/C6eI5jTe18TPpRYxfS
         22q6MMPLJKXDffg79u3nHDq2itk8zhAAXo3Knz9EopE3XoVu3m7tFEc+8U/lvUEvPiXR
         z/J1eak/GYnPPlF0+Qo9y9aXA/uFzX9MYrNxcqJq4y2VxsnUHM+ic9BodBb9etIa0pDN
         tEZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpycjMpP4xyBz2yX+86g4EX8U285uU0PPtd7WhDFQh//XzspP8zvaVGGQvX9olEFjzGO/KQeEuWGAuv6Xd7Gy+f@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ8h4hOGbBtrj4IZf91kVakys7+jAR/qKuO0cGy++v2ws196T1
	9Lg8yWPyDTzb7ii1aJWjjM+YbAS02W5lDv2LTqGkpyPcZcVCWGdi1VHcuGlgURGpBryYKMtREoP
	ENUSjYyuhW1v3dMHG3bSlozNfefZ9aFo=
X-Gm-Gg: AR+sD13oAknBPEhb4T18Xgk+VE9JUqTml7eTOco/eIYPg0Oz/+5/+yMJdam7VtzSv+o
	0u2TshwibPmpmRY7pkGzcuXYLxD+D8+He6u6XV3jmyztFrrDenmTdZaxUFDDGU2LzCtwBoYExov
	2Pnv5V4jzZ17a4NFTJFGymDagugJ1+aXx4395+v1zcQLLCr2kFUWyOJZEQLGIRShW5ZX4wCrLfR
	RaoxVf3z7bTlWVbXI3vC5oweVZt57ugSK7s8Utqv0Y/ume/gQgd4e9wERa0Clk0ItYOaRftO1FC
	Elct7Uv62dF6rl5WtuhBoaflOcOLasqOf/JzkGu44Zu3sxNdlVi+InlnPc0HuOSPLKlusjriyj6
	8ow==
X-Received: by 2002:a05:6808:1527:b0:4a3:2bd1:5216 with SMTP id
 5614622812f47-4ad5ba77288mr2918774b6e.43.1785299921220; Tue, 28 Jul 2026
 21:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
In-Reply-To: <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 13:38:27 +0900
X-Gm-Features: AUfX_mxR_oGunwLpbAK7Vqbf4uXNzZjhDaRd7Jvp95pR-HEJXbf9urH4ed-uYIk
Message-ID: <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20260728_213842_786178_3953E3E5 
X-CRM114-Status: GOOD (  54.93  )
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

Hi Chen-Yu,

Thank you. Updating the firmware fixed the issue.

I replaced my previous firmware blob with the official v1.1 firmware:

  FW version v1.1 (build 6976702 OS)

  SHA256:
  e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44

After rebooting, the driver loaded the new firmware successfully:

  powervr 13000000.gpu: [drm] loaded firmware
  powervr/rogue_4.40.2.51_v1.fw
  powervr 13000000.gpu: [drm] FW version v1.1
  (build 6976702 OS)

I then ran:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

This now completes successfully and detects the PowerVR Rogue GX6250.
The previous "GPU device lost" error no longer occurs.

So the issue was caused by the older, non-official firmware blob I was
using, rather than the v4 kernel series or my kernel configuration.

Thank you for pointing this out, and sorry for the noise.

Tested-by: YoungJoon Lee <getfeus@gmail.com>

Best regards,
YoungJoon

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.com>=
 wrote:
> >
> > Hi Chen-Yu,
> >
> > Thank you for posting the v4 series.
> >
> > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > seeing a GPU device loss as soon as Mesa initializes the Vulkan device.
> >
> > My current setup is:
> >
> >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> >   Kernel:
> >     linux-next next-20260727
> >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> >     (next-20260727-5-g33d6e5134c70)
> >
> >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> >
> >   Mesa: 26.1.5
> >   vulkan-powervr: 26.1.5
> >   Firmware:
> >     rogue_4.40.2.51_v1.fw
> >     SHA256:
> >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2
>
> My firmware blob is different from yours:
>
> powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
> powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
>
> SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323e4a
>
> Funny thing is neither of ours match the official firmware blobs released
> by Imagination [1].
>
> The latest version is "FW version v1.1 (build 6976702 OS)" with
> SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
>
> This version also works for me.
>
> The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d22f2
>
> And this version also works.
>
> It seems your firmware build is even older than mine. I suggest you
> update it and try again?
>
> [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powe=
rvr/powervr/rogue_4.40.2.51_v1.fw
>
>
> > All five patches applied cleanly. The PowerVR driver probes, loads the
> > firmware, and creates the DRM render node successfully.
> >
> > However, when I run the following from an SSH session without GDM or
> > another graphical session running:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > Mesa prints the expected GX6250 warnings:
> >
> >   Missing reset support for brn51764
> >   Missing reset support for brn58839
> >   Missing support for brn62269
> >
> > The command then hangs, and the kernel reports:
> >
> >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> >
> > There are no additional timeout, MMU fault, firmware, clock, or runtime
> > PM messages immediately before the device-lost message.
> >
> > I originally also observed the same failure when GDM started GNOME
> > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > session indicates that this is not specific to Mutter or GNOME.
> >
> > Since your cover letter reports that vkmark and glmark2-es2-drm work
> > with Mesa 26.1.5, I suspect that there may be a difference in the
> > kernel configuration or another part of the test environment.
> >
> > Could you please share the following details from your working setup?
> >
> >   1. The exact Chromebook board/model used for testing
>
> The codename is "telesu", which is basically a hana in a different case.
>
> >   2. The exact kernel base commit
>
> I have a whole bunch of patches on top of next-20260727, but none
> that should affect this.
>
> >   3. The kernel configuration, or at least the relevant DRM, PM,
> >      generic power-domain, IOMMU, and MediaTek clock options
>
> All relevant options are built-in.
>
> >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
>
> Module.
>
> >   5. The firmware SHA256
>
> See above.
>
> >   6. The kernel command line and bootloader used
>
> Chromebook's builtin bootloader.
>
> cmdline:
>
>     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31A
>     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debug=3D=
0x106
>     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
>
> AFAICT nothing special.
>
> >   7. Whether `vulkaninfo --summary` also completes successfully
> >
> > My current relevant configuration includes:
> >
> > CONFIG_PM_SLEEP=3Dy
> > CONFIG_PM=3Dy
> > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > CONFIG_MODULES=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > CONFIG_DRM_POWERVR=3Dm
> > CONFIG_DRM_MEDIATEK=3Dy
> > CONFIG_SYNC_FILE=3Dy
> > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> > CONFIG_ARM_SMMU=3Dy
> > CONFIG_MTK_IOMMU=3Dy
> >
> > I would be happy to test additional patches or provide any further
> > logs, kernel configuration, or debugging information if that would
> > help.
>
> As mentioned above, please try updating your firmware blob. Your
> version is even older than mine, and neither of ours is the "official"
> release.
>
>
> Thanks
> ChenYu
>
>
> > Thanks,
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del=
 Regno
> > <angelogioacchino.delregno@collabora.com>:
> > >
> > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > >>
> > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@red=
hat.com> wrote:
> > > >>>>
> > > >>>> Hi Chen-Yu,
> > > >>>>
> > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > >>>>> Hi everyone,
> > > >>>>>
> > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > >>>>>
> > > >>>>> This time around Mesa was ready for basic testing, using both v=
ulkanmark
> > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > >>>>>
> > > >>>>> Changes since v3 (all in the clk driver patch):
> > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > >>>>> - Added missing of_node_put() in remove function
> > > >>>>>
> > > >>>>> Changes since v2 (all in the clk driver patch):
> > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > >>>>>     - Needed since the driver implements PM domains using the g=
eneric PM
> > > >>>>>       domain library, which also depends on PM
> > > >>>>>     - Fixes build breakage (kernel test robot)
> > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > >>>>> - Dropped unused mfg_desc (Brian)
> > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > >>>>>
> > > >>>>> Changes since v1:
> > > >>>>> - Adapted to changed DT bindings
> > > >>>>> - Dropped driver change
> > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > >>>>>
> > > >>>>>
> > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, fo=
und in
> > > >>>>> some Chromebooks.
> > > >>>>
> > > >>>> I'm making a pull for Stephen for the clk changes. Should patche=
s 1,2,4
> > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> > > >>>
> > > >>> Only patches 1 and 2 should go through the clock tree.
> > > >>>
> > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to =
pick up
> > > >>> DT binding patches. Otherwise I can push patch 3 through drm-misc=
.
> > > >>>
> > > >>
> > > >> Not sure if I can really take the DRM bindings patch through soc.
> > > >>
> > > >> I will take the devicetree ones exactly right now, even though it'=
s going to
> > > >> give warnings.
> > > >>
> > > >> I trust that you'll make the binding get into linux-next before it=
's too late.
> > > >
> > > > Rob beat me to it. :D
> > >
> > > Love it!
> > >
> > > Thanks Rob :-D
> > >
> > > Cheers,
> > > Angelo

