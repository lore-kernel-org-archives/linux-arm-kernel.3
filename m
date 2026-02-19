Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE06E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgcOTqa29ZMQo+D8UTPL9TIh7TnC4cQgVFnMC2xEOrg=; b=DI56UJZPtSzSTeZGewDQYPvwW/
	/xE9/1fCquCPd2vhsD5xPlnpZvusKq1H/tsSgR9bmkhEZ36ru2htB4LY5qrhYd+NQYussIpIRmN4v
	4K0DecljCTWGug/8UriVOZct/5FVe7/IZ5AEi3CyEbpjAO6jXd8t1sVa7XcbpLbyMW6BKrGqVTeJJ
	G6+2QpLn2lGw6GCbpcLNHnpLK3Cw0nUL8Wldc6hwP/jEtAO/14fV8rOPs5p4o+i9mfVkdxhDw9N3G
	+frvIR8K+ae/AVzwcD2V89z+hPUS3Uj5l5SqyhfQLTfLDTcO41jOuz4GESVpP9SMXHNSFLUIslreq
	eE/aGg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2yR-0000000BKGC-0y6z;
	Thu, 19 Feb 2026 12:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2yO-0000000BKFl-2k4N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77870406EA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591C0C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771503455;
	bh=C4KzRkTcBH31IsqtKSX383Oj11njptac/ptWZhF+oPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pO5Pbf8lZEFQSWb+CuA2qbCMJbv06jp2hX3tQoPBGo/xp5r5GpXDeXhqGZooAu4wf
	 v72vftxbLJ4uVEgBgw9Z5x2Srm7NRcKNFNT+fw+uIv7TobVIXXFvTex9Ko9vh8mimq
	 7ERFTJ9VoHEYwhLzjGID2AFLTCAl81ceC/1K+2DaUmOE7gWgrk8iHyOoMo8VY/zMyU
	 3yxdcc8/8/2ykhJZkk5B/d+q1ntRPNTXpTuGmtPUP9yiHAJz+mouCFAkI8H2v663GG
	 3gTNfG2p3gMC4TX4VsZLem2KXCZ6Fmj+IrsssE56K4fonFLn6ZOfjRDusSbxxyYX4W
	 64txl0spE5KQg==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-66307e10d1dso454559eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 04:17:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyQiRsngaGqm/qckXg2JRhB7zSVZZtL/v26naimg0iNpaMo10eM0OMGC91sc919cZ271YJHbAqP2Kq7u1cCiNF@lists.infradead.org
X-Gm-Message-State: AOJu0YyPiPF8H7ynQgH7mRaB2F9EewPrMvku5rPwoljHYoIkQH2yWKWR
	cOdV/+mqTxYsiM+i0qgtElkQqrAYJ4zJ7No1iWTZctS+NlLXAPoROUjx2m8zrRRcQ7QTDAPE2D1
	i6zCfk7LsIxAuY/rKEqKbE6RJZacBDwE=
X-Received: by 2002:a05:6820:3081:b0:662:b70c:a414 with SMTP id
 006d021491bc7-679aeebd4acmr1400578eaf.14.1771503454360; Thu, 19 Feb 2026
 04:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20260209124757.554032-1-ulf.hansson@linaro.org>
In-Reply-To: <20260209124757.554032-1-ulf.hansson@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 19 Feb 2026 13:17:21 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iZ0YS+JTMWAzmdUihgO3C5VT6Ch0UwzftskzaUqkzQ6Q@mail.gmail.com>
X-Gm-Features: AaiRm51677YHs6izjDM-jQfipCbwSf4hwjJ-gqyFq210a2M4TZy38ftFhPxZ6UE
Message-ID: <CAJZ5v0iZ0YS+JTMWAzmdUihgO3C5VT6Ch0UwzftskzaUqkzQ6Q@mail.gmail.com>
Subject: Re: [GIT PULL] pmdomain updates for v7.0
To: Ulf Hansson <ulf.hansson@linaro.org>, Linus <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_041736_750961_638E7D96 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, Feb 9, 2026 at 1:48=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> Hi Linus,
>
> Here's the pull-request with pmdomain updates for v7.0. Details about the
> highlights are as usual found in the signed tag.
>
> Please pull this in!

This hasn't been merged so far AFAICS, so I'm wondering if it has
fallen through cracks.

My particular vested interest in it is that it updates the last piece
of code preventing pm_runtime_put() from being turned into a void
function.

> The following changes since commit e2c4c5b2bbd4f688a0f9f6da26cdf6d723c534=
78:
>
>   pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wake=
up (2026-02-05 11:33:30 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pm=
domain-v7.0
>
> for you to fetch changes up to 1fca2a4426aac222a724770a56c71e6bb3cf96f2:
>
>   pmdomain: Merge branch fixes into next (2026-02-05 11:52:19 +0100)
>
> ----------------------------------------------------------------
> pmdomain core:
>  - Extend debugfs support for domain idle states
>
> pmdomain providers:
>  - imx: Add suppport for child nodes for imx93-blk-ctrl power domains
>  - marvell: Add support for the audio power island for Marvell PXA1908
>  - mediatek: Add support for the MT7622 audio power domain
>  - mediatek: Expose shader_present as nvmem cell for mt8196-gpufreq
>  - mediatek: Add support for the the MT8189 SoC
>  - ti: Handle wakeup constraint for out-of-band wakeup for ti_sci domains
>
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (2):
>       dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
>       pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy=
 driver
>
> Dmitry Baryshkov (1):
>       pmdomain: de-constify fields struct dev_pm_domain_attach_data
>
> Felix Gu (2):
>       pmdomain: ti: omap_prm: Fix a reference leak on device node
>       pmdomain: imx: scu-pd: Fix device_node reference leak during ->prob=
e()
>
> Gabor Juhos (1):
>       pmdomain: qcom: rpmpd: drop stray semicolon
>
> Irving-CH Lin (3):
>       dt-bindings: power: Add MediaTek MT8189 power domain
>       pmdomain: mediatek: Add bus protect control flow for MT8189
>       pmdomain: mediatek: Add power domain driver for MT8189 SoC
>
> Karel Balej (2):
>       dt-bindings: power: define ID for Marvell PXA1908 audio domain
>       pmdomain: add audio power island for Marvell PXA1908 SoC
>
> Kendall Willis (1):
>       pmdomain: ti_sci: handle wakeup constraint for out-of-band wakeup
>
> Krzysztof Kozlowski (1):
>       pmdomain: mediatek: Simplify with scoped for each OF child loop
>
> Marco Felsch (3):
>       pmdomain: imx93-blk-ctrl: cleanup error path
>       pmdomain: imx93-blk-ctrl: convert to devm_* only
>       pmdomain: imx93-blk-ctrl: add support for optional subnodes
>
> Nicolas Frattaroli (2):
>       dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
>       pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell
>
> Rafael J. Wysocki (1):
>       pmdomain: imx: gpcv2: Discard pm_runtime_put() return value
>
> Ulf Hansson (13):
>       pmdomain: Merge branch dt into next
>       pmdomain: Merge branch fixes into next
>       pmdomain: Merge branch fixes into next
>       pmdomain: Merge branch fixes into next
>       pmdomain: Merge branch dt into next
>       pmdomain: core: Restructure domain idle states data for genpd in de=
bugfs
>       pmdomain: core: Show latency/residency for domain idle states in de=
bugfs
>       pmdomain: core: Extend statistics for domain idle states with s2idl=
e data
>       pmdomain: Merge branch fixes into next
>       pmdomain: Merge branch fixes into next
>       pmdomain: Merge branch dt into next
>       pmdomain: Merge branch core into next
>       pmdomain: Merge branch fixes into next
>
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    |  13 +
>  .../bindings/power/mediatek,power-controller.yaml  |   1 +
>  drivers/pmdomain/core.c                            |  59 ++-
>  drivers/pmdomain/imx/gpcv2.c                       |   4 +-
>  drivers/pmdomain/imx/imx93-blk-ctrl.c              |  77 ++--
>  drivers/pmdomain/imx/scu-pd.c                      |   1 +
>  .../pmdomain/marvell/pxa1908-power-controller.c    |  39 +-
>  drivers/pmdomain/mediatek/mt8189-pm-domains.h      | 485 +++++++++++++++=
++++++
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       |  59 +++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c         |  44 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h         |   5 +
>  drivers/pmdomain/mediatek/mtk-scpsys.c             |  10 +
>  drivers/pmdomain/qcom/rpmpd.c                      |   2 +-
>  drivers/pmdomain/ti/omap_prm.c                     |   1 +
>  drivers/pmdomain/ti/ti_sci_pm_domains.c            |   5 +-
>  include/dt-bindings/power/marvell,pxa1908-power.h  |   1 +
>  include/dt-bindings/power/mediatek,mt8189-power.h  |  38 ++
>  include/dt-bindings/power/mt7622-power.h           |   1 +
>  include/linux/pm_domain.h                          |   5 +-
>  19 files changed, 779 insertions(+), 71 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
>

