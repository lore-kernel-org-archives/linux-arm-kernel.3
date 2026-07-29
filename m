Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1106C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=; b=POJSpzus6ivnvCuilHh5RKPDHN
	goG7VaSzhMiGcIemVzOQOJwu4i4vkjlFVLDHNceRSFAtxR0f0fTfO5hIbR5QRC2Lrc39gqn1jhlKF
	3pP0nn+nfVbaOX9sgfWmuilH9ScgK/9tFIbK83o/UlK08VfzXA8A3X2043WbJCjLxsNMGYGNAyB3s
	qpP3LnqUdr32bRKDMEcKEEfAGihDK7dH65nIO+rjBGuPcCPosaY1XvJlTyLr6Ynm6yeTwpi1Pv8At
	3cXXILtxZ2mLlvOunw67nbHikmlIkWG1j7oPldFMZkovHcQo4jUCkI6qUq2A48eVMjv6UmU/opDAn
	qRJyAarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worr0-00000006VLo-0YyC;
	Wed, 29 Jul 2026 00:08:58 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worqw-00000006VKp-3pRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:08:56 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4a427e628a9so148763b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785283733; cv=none;
        d=google.com; s=arc-20260327;
        b=PmFeFR8/28W7aqFxDx9mMIxAyrOA5XQgqN/lGIp1atKl+o9Wpkz8yIXhJLj5bzGoHf
         SlFUL2r/ZCB+rSDFDZ2x/raJOCdSqzufzXOeNjC3Jo7kRWntHQjDUtZky/lz8L/cfVMD
         EzfSnO7pJJxOhhQtmk5Qy/bi4o/8CQBEClylxPiQ7/j6G5Z9PjcceAROFHYt7+kzxuqm
         O8jksZfmaWGjJ+sR7tw53fgTYFFOwxpegfN42A6vkohloZZUQFCECB/oSXpm7w9qmmR3
         fZ+gsmw6sBDhkCZeuc+EF+F37NFnJRi9TQaN+xlMWI3/8aX377qzHplQOy6HFGaKTHFf
         dJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        fh=RiWV3YOFj92pmiryQgO/dQ3GBEY9zy9JcSBF5J1Keek=;
        b=napsEvw3s8U19SH1X7FPgMTAlHYy5hF/M5YSnJBWVgSDkKkFnI+TYEN5BEkfxRy4wV
         6MMV6FGpHqpcwYxE24f4U4eAmcKWdH5Ia2Ue6L2kEm5aNaRbaggSA/v00VTXTSpYYfeU
         r8hkxg9DUmy1ldvKeVaFa/YlcUhbPe18oXIbKPycia4c6EwUCG9Y+rgOqSXVymuFoBTM
         vjXEKVJ31a8OhGpVMeUFk6uL9euKjQ4AFokKRdwpMEvuOHdaP/u53fVY7Rs6hbD3pfkA
         6VVKz9VS3jTnKVTP5Rn0qE8rEWmViqO8OErsjUf55/+u5TwIkYfsEn5byoqpHD+3wnWa
         Mq9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785283733; x=1785888533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=Z/RBCAFlO/R7umNx8sl43wW2qSp4maIqsqbVUdavY1yhXp3PVY/qhFYZ3rx2TtX++f
         3+u2m9fyKAQhLsmF2ll4/vBtpFaZqwFZsqsDbp1OC/aUp1rjPzmMpe9h11u+CiaT80xm
         U+rb7DFvLvXnAJz8Ti0AsmtoYYF1EPaD9AAcZkhRg8ENPMkJ1/sIeuN9kxh2RkIW7e/5
         UUnuAhaSZqicLmL/qGz7u1stH57UeMo+YP3+9gbf+15yVrHZNNXMBg0Xza4WY/qTYKrr
         psEOq//IxC5GjGxuhRla8aYbkY66LQUM5ThZ17UOXhUgc9sN+oTW9dTLXlmozHgdADpz
         savA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283733; x=1785888533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=nhtxev9pLc/E98P9e+OPFfIYwo4EF5Q07ABfAiY3jaAIlstVIs7sE1uF9q8EtCdLSt
         M61iDxd6CK4Ud3TGigk0va9gWVhsM3FiY/ok9h0LG3QouFKASKUYanOo52d6Tg/d0iH8
         EW8cbYcqD+RlrJm68rtViKvWcQTJTDb4lTAF91/eW5NtQn2ICZixRZC7gTK/cp1/CPpf
         B0+9oM2XWwV8CYQrxydb1Xns203cpgZzrSdiNogJafwX2Lo2iz1gXVsDzAJ3HR+onYwh
         iWYEjh0dot2d9ZLR0hFIGuLL+t/SqQiQEvk9XnKonoYvwJpdX9WgkQOIaHVOhDiN+bja
         3SHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8ngGCS/TpWwNlCbJyOtLgHQS6Pg05bNIYwyKHo088JPzqxD5EZ7fgRHdv06tYXznPFIdjP5qXc5kRCxslGkfj@lists.infradead.org
X-Gm-Message-State: AOJu0YwfMPsMBQidtgIAFuGWr/PwQNzuBZcF11q7KuWOB1relJrXjkGR
	gYS5/+/fu5ujHQoXWD7pTWYugEfc0e4BgzzkT0idp1cunWqQk9Y8CAKOVbA5J9hHu4idi4UWdzY
	bulbtxwqwkUQmpid1bSnsvmvCqTht3PY=
X-Gm-Gg: AR+sD11ZBBaEaA7VaGLzlZKKpBF9wLxDS5cJKFZbWdxSS0QDA6UsOCA+y7qPDBLIyVA
	97EAIuPXHA3iHRAOSAcMbVjPxLWAOQx1cANQINwn0j8aquOkNyGOWnU33I7PENd+6r/mD0gA6RF
	/Lcxg7wOoubRKOS9Xne7LwVOsEE8BCH2Oldcrk2LAqNDhPWeniFVoboI2kaQBZLrjtAmXjLNBF5
	Z88e6JGpfB8Q40SSUlogF0Q66W3SOJWFObxk30VNVj21gUXPwj3NJOyidHOyXvwHjUyGATa2ae9
	af1nZ911eeS/mpLb6wsy5ysQdz0sEhHsYfoRnnjKO4IWt84JgPn1Bo1A/8plcW5mtDkHXyCUc+l
	RPZz4LWrdVmseCQ==
X-Received: by 2002:a05:6808:220f:b0:496:2b3:ae71 with SMTP id
 5614622812f47-4ad5b9cb9dfmr3003896b6e.18.1785283732989; Tue, 28 Jul 2026
 17:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
In-Reply-To: <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 09:08:40 +0900
X-Gm-Features: AUfX_mxJyiSm31bWY5a0snpvZu7asEtmvztGs1v4_zBGPb9VpXQsQKFqM4tmGnM
Message-ID: <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_170855_325654_2C3B0036 
X-CRM114-Status: GOOD (  31.64  )
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

Thank you for posting the v4 series.

I tested the complete v4 series on my MT8173 Chromebook, but I am
seeing a GPU device loss as soon as Mesa initializes the Vulkan device.

My current setup is:

  Board: Google Elm / Acer Chromebook R13 (CB5-312T)
  Kernel:
    linux-next next-20260727
    commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
    (next-20260727-5-g33d6e5134c70)

  Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+

  Mesa: 26.1.5
  vulkan-powervr: 26.1.5
  Firmware:
    rogue_4.40.2.51_v1.fw
    SHA256:
    f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2

All five patches applied cleanly. The PowerVR driver probes, loads the
firmware, and creates the DRM render node successfully.

However, when I run the following from an SSH session without GDM or
another graphical session running:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

Mesa prints the expected GX6250 warnings:

  Missing reset support for brn51764
  Missing reset support for brn58839
  Missing support for brn62269

The command then hangs, and the kernel reports:

  powervr 13000000.gpu: [drm] *ERROR* GPU device lost

There are no additional timeout, MMU fault, firmware, clock, or runtime
PM messages immediately before the device-lost message.

I originally also observed the same failure when GDM started GNOME
Shell, but reproducing it with vulkaninfo from a non-graphical SSH
session indicates that this is not specific to Mutter or GNOME.

Since your cover letter reports that vkmark and glmark2-es2-drm work
with Mesa 26.1.5, I suspect that there may be a difference in the
kernel configuration or another part of the test environment.

Could you please share the following details from your working setup?

  1. The exact Chromebook board/model used for testing
  2. The exact kernel base commit
  3. The kernel configuration, or at least the relevant DRM, PM,
     generic power-domain, IOMMU, and MediaTek clock options
  4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
  5. The firmware SHA256
  6. The kernel command line and bootloader used
  7. Whether `vulkaninfo --summary` also completes successfully

My current relevant configuration includes:

CONFIG_PM_SLEEP=3Dy
CONFIG_PM=3Dy
CONFIG_PM_GENERIC_DOMAINS=3Dy
CONFIG_MODULES=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
CONFIG_DRM_POWERVR=3Dm
CONFIG_DRM_MEDIATEK=3Dy
CONFIG_SYNC_FILE=3Dy
CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_ARM_SMMU=3Dy
CONFIG_MTK_IOMMU=3Dy

I would be happy to test additional patches or provide any further
logs, kernel configuration, or debugging information if that would
help.

Thanks,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del Reg=
no
<angelogioacchino.delregno@collabora.com>:
>
> On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >>
> >> I trust that you'll make the binding get into linux-next before it's t=
oo late.
> >
> > Rob beat me to it. :D
>
> Love it!
>
> Thanks Rob :-D
>
> Cheers,
> Angelo

