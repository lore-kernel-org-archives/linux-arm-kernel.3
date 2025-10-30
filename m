Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4413ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=; b=W6ksGl66M3DOHrALBSI1f0puGG
	yk9ZKODPpDPS5vjmzmJCGi+Y0If4FlwnWkfcUV4SkuyuxK5tUEYsgNcz2PPIFA5IIRpaYGGuz619V
	3WZUNlHtei+7rDoiktLlqsAAanuD+V49TI1sLy2CxeD3IkIW7Q5QMTHKlhOtbynFEfVoTn1xkFCnA
	bywkbg+pYfzAzArXm7XsugibhhLOsS/6vfIfLw2AjH25D/KuMmdFfRnZrn0fk/XaqY9lKe0uRmf8N
	c2ZJt9TFlXp69f+2lUbhEEH2NTlVyrkx1w92KNo6jy0qb4YB9ihCS7Qr4DoDZruQlx/UH8iFfRX4N
	2r5GUzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENur-00000003gay-0U3V;
	Thu, 30 Oct 2025 08:21:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENun-00000003gYP-2b2a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:21:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-586883eb9fbso912475e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761812508; x=1762417308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=j0C54z0yN6E41IRVObCHh8LsNGXAxkuczNNjudn9qqtaukAsv7cHmxLcmR27czSNWA
         jdKUI90vssHcYPHZ3+0ovw60Vx9lEZZicBxAlDrKdJNNA0BLotCDxfNsKR4QXbmYd3NB
         QTFpvtKGxpgP2sjiVtOKCUQwr+nOnfosJ97HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812508; x=1762417308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=ktVaRTLb9ZVzi8hR0ma91ILSXEgj8Do6FB22t5qbV07vnH5JvkxEoaQFSMBI3+wdnF
         6ALqVRA3LcrIFxXa3m4ehPjUg071bD3j12k6CShvOy8lIUE7t/sloLrrn9iYOJmVpbcZ
         hRMVHUKwYovXbJNTytyrB+nLz1DkV2PBeRxEKUMJniIslZKH4u8KJjNLzxMXza/uGZii
         3QkaCPTl/Q0v72IwRNh6mERfP7B2MfK+pj6GiZyzdXAInCLsTHbinEOEabzi112wLAOd
         8pBWBtoExyOd1GvqAS1HgszOzH48wB/WoBP9O4ereTSjn/GIk4/BJWac3qI7+DDauSnX
         0eEw==
X-Forwarded-Encrypted: i=1; AJvYcCXCxFYHVk31BzOYAeRKPT1EznTLCNSXDNXqdAZHxLBglVfDuwP8agFk+lTB4xKbbTM+Oo2cqB03+/STDbrZtB4E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6euu9cInwbpx7NpMMdIMHYH9Ksd4+3t2MAd3f1b96MPrK1CPu
	Y5c1gYYh38cOeWIphIWWk2f0CcbTw6nw8mpn0QSngWZoidIMN0mDZ0So7sUMdo+CzO+4E8ss+ng
	EIh3CT0gS1qxX3lM0Yu7nrTIQFsJQwrJNCwK/9dww
X-Gm-Gg: ASbGncu6CuAKxvq9E3PKR3x5+eOL9ZZFDZ5WKXCJ4GAMBpjG9oSM7ql7X/xQkW9cnBM
	MWKjQx7KpB94eosDSX6+O33PuRqmTp7JOVeVeU1Z4N4eGsmuh/v6CVbSolWyPdbVK3eRhPc/5Vj
	uJFzOLHrCfSlS3GUZMnBpnLqxqfgP1GJe7bWDSOouPY4AFl4y2QfmAYASqAyn1e21B8tFGOhRmk
	ZBhXfY7MI/7MVbuiJrT6uUv8/cVdQvJHL34RVgSkt1RdsMqzHoCFRI6OY32dPHHJICdGtrTii+7
	swdQbbbQ71kfmpE=
X-Google-Smtp-Source: AGHT+IFU82eFD7KyMUajMtRnh3g0OAFBir+9otZR0HYwHlQYMDmXZxQQJ8cv/9zylVMsVzxv/6PO4ARJDSX3YbcKhTo=
X-Received: by 2002:a05:6512:ad6:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-594128655a1mr1896419e87.7.1761812507765; Thu, 30 Oct 2025
 01:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com> <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
In-Reply-To: <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Oct 2025 16:21:35 +0800
X-Gm-Features: AWmQ_bmkpHdrIvgnJ7LYrPcYtpiVGscoJE_DrNSX0WTZVJCZr-WNnyLSiVAsWFM
Message-ID: <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	arnd@arndb.de, andersson@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_012149_697871_3BB1B7FC 
X-CRM114-Status: GOOD (  35.68  )
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

On Wed, Oct 29, 2025 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/10/25 10:14, Chen-Yu Tsai ha scritto:
> > On Wed, Oct 15, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> After a reply on the mailing lists [1] it emerged that the DT
> >> property "firmware-name" should not be relied on because of
> >> possible issues with firmware versions.
> >> For MediaTek SCP, there has never been any firmware version vs
> >> driver version desync issue but, regardless, the firmwares are
> >> always using the same name and they're always located in a path
> >> with a specific pattern.
> >>
> >> Instead of unconditionally always relying on the firmware-name
> >> devicetree property to get a path to the SCP FW file, drivers
> >> should construct a name based on what firmware it knows and
> >> what hardware it is running on.
> >>
> >> In order to do that, add a `scp_get_default_fw_path()` function
> >> that constructs the path and filename based on two of the infos
> >> that the driver can get:
> >>   1. The compatible string with the highest priority (so, the
> >>      first one at index 0); and
> >>   2. The type of SCP HW - single-core or multi-core.
> >>
> >> This means that the default firmware path is generated as:
> >>   - Single core SCP: mediatek/(soc_model)/scp.img
> >>     for example:     mediatek/mt8183/scp.img;
> >>
> >>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
> >>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
> >>                      mediatek/mt8188/scp_c1.img for Core 1.
> >
> > I know this patch has been applied, but this scheme doesn't actually
> > follow what is already in the linux-firmware repository.
> >
> > For all the supported platforms, the first core, even for multi core SC=
P,
> > already have their firmware uploaded as just "scp.img". Multicore SCP
> > is seen in MT8195 and MT8188.
>
> The only one that is affected is MT8188, which needs a rename or a symlin=
k in
> linux-firmware.
>
> MT8195 is not affected by this change, because the SCP is used as single-=
core,
> hence this code will look for scp.img and not for scp_c0.img.
>
> >
> > I guess I can send a followup patch?
>
> The only followup patch that I deem to be necessary is one adding a symli=
nk
> or renaming for MT8188's SCP and nothing else.

The firmware was uploaded in March of 2025, and is packaged in Debian
Trixie, and was also backported to Bookworm. Either adding a symlink or
renaming it won't trickle down to users for some time. So this seems
like a possible ABI break, where the ABI is the file name.

Or maybe you don't consider it as such because SCP hasn't been enabled
in the kernel in any release yet?

> Please remember that some of those SoCs (including MT8195) allow the SCP =
to be
> configured as *either* single-core *or* dual-core - and usually firmwares=
 for
> single-core configurations are not compatible with dual-core ones, becaus=
e of
> the SRAM carveout/usage.

For MT8188, whether the current blob is dual core compatible needs to be
checked. The blob upstreamed to linux-firmware was built locally by
MediaTek engineers and is not what we ship with ChromeOS devices.


ChenYu

