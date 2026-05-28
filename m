Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108C0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+phZfXHAAOWSe43jY4iEDeIVY0auY/gXg2dprHrXHY=; b=KSKqSFddzV7nHhyY9dkDnGWu8D
	1FWQVAhMtRws/SUpPcVGVFq6DRlZXkIDnYLZnUG4kJe6Vfxj7gppN60IbZHowQDP5EmiMWTaZAftA
	MeHJxIPlcEqIEs3sSd3r1ba39Q3bwlkqHm8DaeJf7cJy16uLHKm2Eex0Z18ml8xve/4QbikqMRbtN
	K1Zrn8ACJRk1jLMtWahUmAlkUHjfAXl1kUBS0iAqIKlcH20KxjraQBR01MQaY7S/ImpC5H5uEucRV
	iyoBTUJa6IBufXVyNCEDNah8i5f8CGu1yG5qOi4IPqOEnal1bUSPZIcFRHQSAAotFTdEL1HvEu9DG
	LNZgV8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWPk-00000005R1d-3FKD;
	Thu, 28 May 2026 08:48:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWPh-00000005R0p-3kr2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:48:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43045403C1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D761F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779958105;
	bh=6+phZfXHAAOWSe43jY4iEDeIVY0auY/gXg2dprHrXHY=;
	h=From:Date:Subject:To:Cc;
	b=QdMpBHCgV3zBSc4CYi0AvkmqhfL5trfwzCVmnb+gReek/lD/Q87OfHeiOhSRvNDu1
	 Ht03cZGnYqH8kqFZe+kC8HJ+m6aeU/9CjqJpaCtHoSYDZSKHrETHQOtIXHos9rPe6K
	 P80y/jcsReNrqKMfV3ALdfi/L+RqYu4XZu2aqSXRA+2wKgNEqoQv/JgUJaTBmkiKWz
	 8dCh7mqAgVbx4ENNUBvD+9iZdQrOiBEdtw3XK7ARVod6IVM2Xo5tQobAleVHM9uzIM
	 IfBCBHpSAfZoR9wD4szhG+Uw/7sc+HWFP7Ji/E2le6/0ZesTAuqNFNpzCHL8PSmo2L
	 xj4zTAbL6yrSg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa2691db86so12980735e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:48:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJGHJtFjUtsnWO497JGand8OyYVARec5wWAnI6Ml8fTE765Ijf
	mS+4jJV5PxNuCZLaffYnhEt/K6usRZdZqeIN3bPBk/Ols5qvw6TFWGYY00bNXBTwk/NDsgRzKXl
	KxRRAClPHsD/qRZ347/h3S2m5zi9iwrM=
X-Received: by 2002:a05:6512:159b:b0:5aa:2a6b:c0ed with SMTP id
 2adb3069b0e04-5aa3237096emr7698159e87.10.1779958103957; Thu, 28 May 2026
 01:48:23 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 10:48:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
X-Gm-Features: AVHnY4LYV0NVvQ3b1yFPz2ZhtORvQzKWhrCgwYSUKdkOvBfUgossOMgOPO5x4Vk
Message-ID: <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v7.2
To: soc@kernel.org
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_014825_976051_0F97A483 
X-CRM114-Status: GOOD (  14.45  )
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

Hi SoC folks,

sorry for late pull request for these DTS changes. Had too much to do.

The changes were posted to LAKML here:
https://lore.kernel.org/linux-arm-kernel/20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org/

This pull request is rebased on v7.1-rc1 and ACKs picked up,
otherwise it's the same patches.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/gemini-for-v7.2

for you to fetch changes up to dce8e0cb88fb12d068459b75f299ff2242172257:

  ARM: dts: gemini: Correct the RUT1xx (2026-05-28 10:38:45 +0200)

----------------------------------------------------------------
Gemini device tree updates:

- Add two new devices: the Verbatim Gigabit NAS and the
  Raidsonic IB-4210-B, including ACKed binding updates.

- Fix up boot device for the SQ201.

- Use the right LED trigger for disk activity.

- Add the SSP/SPI block to the SoC.

- Fix up the RUT1xx device tree.

----------------------------------------------------------------
Linus Walleij (8):
      ARM: dts: gemini: iTian SQ201 need to boot from mtdblock3
      ARM: dts: gemini: Tag disk led for disk-activity
      ARM: dts: gemini: Add SSP/SPI block
      dt-bindings: vendor-prefixes: Add Verbatim Corporation
      dt-bindings: arm: Add two missing Gemini devices
      ARM: dts: Add a Verbatim Gigabit NAS DTS
      ARM: dts: Add a Raidsonic IB-4210-B DTS
      ARM: dts: gemini: Correct the RUT1xx

 Documentation/devicetree/bindings/arm/gemini.yaml  |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/gemini/Makefile                  |   2 +
 arch/arm/boot/dts/gemini/gemini-nas4210b.dts       | 205 +++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini-nas4220b.dts       |   1 +
 arch/arm/boot/dts/gemini/gemini-rut1xx.dts         |  18 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts          |   2 +-
 .../dts/gemini/gemini-verbatim-s08v1901-d1.dts     | 225 +++++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini.dtsi               |  17 ++
 9 files changed, 470 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini/gemini-nas4210b.dts
 create mode 100644 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dts

