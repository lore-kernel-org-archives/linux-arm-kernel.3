Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF20C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V9KiaqIE2kZ8tUorevF8S25fszFbrGeBV5a4/fMO0ww=; b=njqIfRuRgb6YEns9ZTZ7H8+9yt
	SAb0swu+9i0o0LBLrrEgPouNPek9Q3+mqisf8nzsiAWq3Rec3wFDRpq+FD2yZ0Iq8VgZIq69jKGEI
	QHzD6GbSkiQQcH3XnxKCjCriXgliguMYO4xLLEYJmhdgqUukYFwTfOAzvus60H/fh4VPIajC3UD1M
	w7D3Z5jMD11xV3AhtWAT40mwcd3zSgLBwwB52tjN7aMDp0LP1l8M/Yrn561ZCzwB4+Gt+Jbfmp5Vy
	JdpYVW7VXmxUw+z4LjIqUWdX80VgobbJ7I7kH+g8bjmjSJzoVCrIV2cbaxJUfjHyP/rlUzycThoGL
	SdfGMmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGq3M-00000007pT6-44QB;
	Mon, 19 May 2025 02:16:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGq11-00000007pHy-1HXj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 02:14:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so672250166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 19:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1747620845; x=1748225645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9KiaqIE2kZ8tUorevF8S25fszFbrGeBV5a4/fMO0ww=;
        b=TWZ45VYR+duHh9YE9xFZJhVcM0gP/Q+WV88+BIXMRzkdW2I/pocc1r8S1JbCfxorFj
         6cnmV+ewo/iwcQpto1vQ4vHiFqnKsX5PDuwG1WeaXISyflITRGyC6DiywezPhr5y1b6y
         mch4Fjo71X+VfgNcKxuIc2Mwsp1eO6xmDQ/Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620845; x=1748225645;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9KiaqIE2kZ8tUorevF8S25fszFbrGeBV5a4/fMO0ww=;
        b=sfv9dJIAwxDaZBcWFspAN80J4nLjAZlYa888ifzYca9ZO9TvseNHysBxVTFT4G+3rh
         H09snzLbRqYOMTWH4jEUou8iTswR6A8hgVkoCiAgwNZLNvLPCQPNPT9hCVCd+VNJcI4Q
         TkD1IIUZTn6bPa+JULWQWCVqO3LeQPmmYdODXV6tl7KNFa2dUvZ08db0gb0R7Frq1jGM
         1BimqM/D3974pLcDXtu48sPKzZiOFS4Jb8+T7dWQmTKhFzFDtfh5tyqdHCbsPDj5vcoA
         Rmd0a3ZUF/x50BBxIDIj2wGHSHrBz78VOC/aYf82fJfXC1jPFJ6/ZAYXVbNP1W05i3uJ
         QpcA==
X-Gm-Message-State: AOJu0YzuGyAM9dFSP2hTfo7kjnLM1v8IYSIvTrHPsomk70NANu2kICG4
	na/jYMvBPOzDrHJbSyYBZyhBeLz9iiaTFWwfvSv0Fv5BQTqmgw48YiRgcBAlffQj8PMfgM9v40B
	7FRKPM1jNuCAZkODQYlX63GKX7RjfJWw=
X-Gm-Gg: ASbGncs2U+amNu8YuTbLPSc8Sic+rIojkMe2z9hpxRw1ATtYeKD0U4Us84Ydzyf7waK
	LVQuQM9HKSKwdd+JTOYo308VJX/mvm9mpktpTOoN2y72dYDqnTJiSS3i2aADNGS1mFZTGiAi8cr
	rOZKnB/c9e4RA8YCwwZF3fwu/BaFXtqukN
X-Google-Smtp-Source: AGHT+IHcXZRPApdD/mdAKFv4vQL1CkTYBUUPaeCGWfYuku4UTJAUPIBrCltTcsJicRUaDh2+x3T816AElhch/rnZxT4=
X-Received: by 2002:a17:907:3f1c:b0:ad5:5b2e:655b with SMTP id
 a640c23a62f3a-ad55b2e7968mr400215466b.25.1747620845390; Sun, 18 May 2025
 19:14:05 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 May 2025 11:43:53 +0930
X-Gm-Features: AX0GCFv8wkXV3Qs9a1kPtAmOB7n3fcMkhgCOuZ6hZZjhSaUdY799d7N4FvECxgg
Message-ID: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_191407_363779_B8FF020F 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

Hello Arnd,

Here's the Nuvoton 32 bit arm pull request for 6.16. Andrew has prepared the
patches and created the tag, so all credit goes to him.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
tags/nuvoton-arm-6.16-devicetree

for you to fetch changes up to 7efb8b92165fea427a03df87e14d519b8acf57f8:

  ARM: dts: nuvoton: Add MMC Nodes (2025-04-08 11:29:38 +0930)

----------------------------------------------------------------
Nuvoton ARM devicetree updates for v6.16

- MMC, OHCI, UDC and EDAC blocks added to the NPCM7XX DTSI
- Fixes for GPIO hog names in the NPCM730 and RunBMC Olympus platforms

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: nuvoton: Align GPIO hog name with bindings

William A. Kennington III (4):
      ARM: dts: nuvoton: Add EDAC node
      ARM: dts: nuvoton: Add UDC nodes
      ARM: dts: nuvoton: Add OHCI node
      ARM: dts: nuvoton: Add MMC Nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 108 +++++++++++++++++++
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |  12 +--
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 120 ++++++++++-----------
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi     |  65 +++++++++++
 4 files changed, 239 insertions(+), 66 deletions(-)

