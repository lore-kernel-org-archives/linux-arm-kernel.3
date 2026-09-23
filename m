Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A92C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X3Dz7N7QGHbQwYa5WsCw9yQmpC/vJhoS5WH6xkTIDi0=; b=fQRR2J+09JfbmPjQ6nvQClg8M7
	IOySfARFwtEtnKJbnE+KueZaXdxsY1kU0SWqlzMfPRF31GzicBv0eIprs44zas92aNYkXoC7TvkOK
	Ec3AgVVXdrAOluV4U5pPl5P0Xbs2se+WAGRca6VSJ+Yz05yBbW0fjMqZ23jvn9tJUvbfx8Rmu+weS
	WI6FsAhW8Xzv1gGLgEfZcgNkr+A6XoJgVqAN9eM9FcFH38nXPE+wPuT+jlmnESnXLJrQfv7TZ2Lsr
	vSP9bRhvoIKPGkp5kvjWAbRLW1HmxTkgvawOj5IrNd068JoALMmUp/aX/6IN+mlTAOFKu7QI+jkim
	5Vyx2nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qvt-000000094XG-3eTA;
	Wed, 23 Sep 2026 17:39:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qvr-000000094Wh-3xCH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:39:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5433640A79
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D231F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185139;
	bh=X3Dz7N7QGHbQwYa5WsCw9yQmpC/vJhoS5WH6xkTIDi0=;
	h=From:Date:Subject:To:Cc;
	b=KxECRYFeQk0mtr3IwnYW8h2AGOyQOTAZkrsJHeSIZYYLmi7q97DUGkVinv+Zgi/VQ
	 q2d/i/QLf78Ksxn0ol5iV6P2n/lzFZDwTvgvtwZrGECcP2kb1w+pJTq9+6Kn1elmKX
	 MQE87bNBrjlIIPimvDyfA4LZmml9ZrgFKKntsYIcHS79ceGNu0QkR1HJRRGGAccQxf
	 YTX0j46Wtle6cnQvxbUdG0hD7iHuJW56kTwEhZXH3eX/8nxqJVuMP89H44iLl6mPhd
	 h4g5jLEBn5XJgPVblL4AHjKg4YW+nwRw2FJEJPeqDgDfKyz29q39lBAxtuQhnKvlsd
	 fz+39Y6Hp2/bw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so1025064e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:38:59 -0700 (PDT)
X-Gm-Message-State: AFuF++nh8Af6w0R1NiNjUEr2BKdwa2MoR5VbwdjkBw6o4BrnE4V/vNfo
	psuYqVtR8XSiUxN5wjTR64PaTGWZZUUUTiWUxy+BvfKrSyvVtp+vsktDh0OymYyVDchTQWQ+g5/
	EyIih+Jx5YALo5IgcyCXAY3nzWXuJ4EY=
X-Received: by 2002:a05:6512:686:b0:5b6:421:a8fe with SMTP id
 2adb3069b0e04-5b8d89879abmr1148004e87.30.1790185137896; Wed, 23 Sep 2026
 10:38:57 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:38:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
X-Gm-Features: AclHuK-PElKFo5r6uKqq1C1ypD1sqrRiCmOg_F9a7RVZb_GNAFVamkjOTfqm4PQ
Message-ID: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi SoC maintainers,

please pull these DTS changes for Ux500 for the v7.4 kernel
cycle.

Yours,
Linus Walleij

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-7.4

for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

  ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)

----------------------------------------------------------------
Ux500 DTS changed for the v7.4 kernel:

- Make panel regulators have unique names, duplicates found
  when trying to use the DTS with U-Boot.

- Harmonize the GPIO key names, as U-Boot want to have a
  device-neutral key name to look for.

- Add the Imagis ISA haptic feedback to the Gavini and
  Janice DTS files.

- Add proper regulator defines found when working on the
  proper power domains. (Bindings are in the regulator
  tree.)

- Switch the audio to using the generic audio-graph-card2
  binding and drop the old custom binding. (Binding patches
  are ACKed and will get merged to ASoC and MFD trees.)

----------------------------------------------------------------
Linus Walleij (9):
      ARM: dts: ux500: Make panel regulators have unique names
      ARM: dts: ux500: Harmonize GPIO key names
      ARM: dts: ux500: Add the Imagis ISA to Janice DTS
      ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
      ARM: dts: ux500: Add new AB8500/AB8505 regulators
      ARM: dts: ux500: Fix up regulator assignments
      ARM: dts: ux500: Add sound DAI provider cells
      ARM: dts: ux500: Convert HREF audio to audio-graph-card2
      ARM: dts: ux500: Add Samsung phone audio graphs

 arch/arm/boot/dts/st/ste-ab8500.dtsi               |  35 ++++--
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |  35 ++++--
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |   9 +-
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi          | 104 ++++++++++++++++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi          | 118 ++++++++++++++++-----
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           |   8 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   |  14 +--
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   |  10 +-
 arch/arm/boot/dts/st/ste-href.dtsi                 |   2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |  10 +-
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  25 ++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  61 ++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  11 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  59 ++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |   5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |   5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        |  77 ++++++++++++++
 18 files changed, 506 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi

