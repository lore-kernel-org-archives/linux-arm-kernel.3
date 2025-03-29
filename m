Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D65C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 23:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nmdLuCAm1CAJ4jEnyOVq/bYPb1GgUEH4akc+65VyZ94=; b=NJXPH8CYJ6fBgFbIrrnFePoGNU
	B1xpMLGTQGGl1nutubZeZyh0nAmDTubv30RYyGe/AE7pAcGNg7X1hXGZ/mM5kaQwRUOssti4QHrsL
	INOTcE+RPyokW2cxWnuPbVi5eUype84r6Xn+i25cqsKtx6X7R+z8yPnvxVNLYandrIEPQSk4qITkb
	Rf3UHh3ZXqRwZMq3SwOiPnYEdGAclR8wyccq8ROdFdwxEOYOQl6p1UsM9wTEAWRzntnHYzuOe6j0U
	RXWm8HuIuqiy38CIyLB2wV8aHZ0iyD63ZXTRIHF+GTvEXanM59nqxGkxMgxxkzOMQEhZ8A1CJHVGh
	+W2Z75CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyg5O-0000000FegL-0n0g;
	Sat, 29 Mar 2025 23:59:34 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyg3e-0000000FeaQ-47hL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 23:57:48 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-602224af11bso1825230eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Mar 2025 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743292665; x=1743897465; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nmdLuCAm1CAJ4jEnyOVq/bYPb1GgUEH4akc+65VyZ94=;
        b=Gb8UTVPoADmBj4yIPLALSnXPOT7DOrwDVsr29HdHxge1qRP6Z4hXjarLCIBQ2Wdh42
         hW9W9dLT0eGu8o5eYqALXBg48P6NHFM2VRlr/2TFOvBRQ1uOsNSxYHkplBIHb3U8KtJi
         nLAqng9dRTRMPhuXRDLMuwi0gizkgC+j9JrrsUq+Ut+kq2O1QztA3U7Y3d2hNMr2deA5
         pa4VQ7dSQIb+oJ48LeOfTV8EX1Y89KBc56TgBQ6HcT+gLoNY9jmmduyCBFaXTeeEUBWx
         PQFGmwrpDgR/0/vBlNdFfH6FNEroysqRIELgSI0RkYyzErkDNW/8w/CvBhzp6Bl+h6tN
         uJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743292665; x=1743897465;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmdLuCAm1CAJ4jEnyOVq/bYPb1GgUEH4akc+65VyZ94=;
        b=tM363scwwDPjrSJ75jc1dwu5vCO4p1OAGb59mwqav0qJqONnIm6XAEjH5Yv5p+no14
         tD9tCHoJPN2kMbfR1AVcrbqnmVdHf5pTGzsSl6wrgEeSheIrOiUynlAo7U/tt5rxRZtH
         J+8tf0aAkTA00z2IveRkVwy3df8waVIEZlzzqcb1d2+fPu9Jl4FsQETyZcPHwPWOnyi7
         DxrIBYVUq0fSqTyPFFu1PO+sm4IngiPgRUp8mYhrPFhtArcjxPL6SzW/DV01mHaswClP
         rJZvHCNnx5EKFvvmfyn/NyXVWWdFpz0tU1aUsinSwRxR13e4yFCotFKjC0Vo1SUdf2Su
         PoVw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZ3/F8m9pXfo/r6Oxnb0c5bF7iiI01nxFlHBMs/k4GMMId3dG3la0r186EzdeimUkvJvwqJAzGix0LVudNgEc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXkETfOfyM5pGSa0gthoIwIJ22upAAM8NFo3fY0AFjlWmYKOKV
	ioJKsGbLJ0ppckLdJoHTr4vPQTZJTGG0gIebrB98qdczWb6Fmk+4JVEngQ7sl2IGeptn5g8FB13
	sHgtl/0Ek+OQEuZX3ibDEqoqnDNE=
X-Gm-Gg: ASbGncvgv0w1omaaBUgOqMt3HCxIUqeSBxZUaZsSY+5RcPz6y7TC57wlo04g4jGHI/p
	wD3z9I9tc8B5853iACIvTOJ5nCkrleem+N0NDBrq3JPHZasD25LXHsmJ+Tr8dNUPgW2csJwMddm
	PdWOz9yHOpCrQh5cVIK2KITCmzUmg=
X-Google-Smtp-Source: AGHT+IHun+H7WFPlKCwkbZmr48Ry4kBTHVoSBceNootkXSTXeWa/xWKLJ9WlUHvRVxHSm9sMcNguBCc9GExdVj5PNQE=
X-Received: by 2002:a05:6820:2710:b0:600:29ec:7619 with SMTP id
 006d021491bc7-60290e5821cmr2130089eaf.2.1743292665379; Sat, 29 Mar 2025
 16:57:45 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 29 Mar 2025 18:57:34 -0500
X-Gm-Features: AQ5f1JoYZOgXhh_ZakSNYcgqU00butGrTYEuoZM0qK0JvlcozMWOWi-dvPiJAnU
Message-ID: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_165747_024382_7B17B914 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Linus,

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.15

for you to fetch changes up to 1ec12fd31ecc38e2a81a137be7eec5df51894bcc:

  mailbox: Remove unneeded semicolon (2025-03-26 20:58:26 -0500)

----------------------------------------------------------------
misc: Constify amba_id table
pcc: cleanup and refactoring of shmem and irq handling
qcom: add MSM8226 compatible
fsl,mu: add i.MX94 compatible
core: misc rejig of header includes
  minor const fixes
mediatek: remove cl in struct cmdq_pkt
tegra: define dimensioning masks in SoC data

----------------------------------------------------------------
Chen Ni (1):
      mailbox: Remove unneeded semicolon

Chun-Kuang Hu (1):
      mailbox: mtk-cmdq: remove cl in struct cmdq_pkt

Frank Li (1):
      dt-bindings: mailbox: fsl,mu: Add i.MX94 compatible

Huisong Li (1):
      mailbox: pcc: Fix the possible race in updation of chan_in_use flag

Jason-JH Lin (1):
      dt-bindings: mailbox: mediatek: Add support for MT8196 GCE mailbox

Kartik Rajput (1):
      mailbox: tegra-hsp: Define dimensioning masks in SoC data

Krzysztof Kozlowski (5):
      mailbox: pl320-ipc: Drop unused xxx_destination functions
      mailbox: pl320-ipc: Constify amba_id table
      mailbox: arm_mhu: Constify amba_id table
      mailbox: arm_mhu_db: Constify amba_id table
      mailbox: arm_mhuv2: Constify amba_id table

Luca Weiss (1):
      dt-bindings: mailbox: qcom: add compatible for MSM8226 SoC

Sudeep Holla (7):
      mailbox: pcc: Always clear the platform ack interrupt first
      mailbox: pcc: Drop unnecessary endianness conversion of pcc_hdr.flags
      mailbox: pcc: Return early if no GAS register from
pcc_mbox_cmd_complete_check
      mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
      mailbox: pcc: Refactor error handling in irq handler into
separate function
      mailbox: pcc: Always map the shared memory communication address
      mailbox: pcc: Refactor and simplify check_and_ack()

Tudor Ambarus (6):
      mailbox: use error ret code of of_parse_phandle_with_args()
      mailbox: don't protect of_parse_phandle_with_args with con_mutex
      mailbox: sort headers alphabetically
      mailbox: explicitly include <linux/bits.h>
      mailbox: remove unused header files
      MAINTAINERS: add mailbox API's tree type and location

 .../devicetree/bindings/mailbox/fsl,mu.yaml        |   7 +-
 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |   4 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 MAINTAINERS                                        |   1 +
 drivers/mailbox/arm_mhu.c                          |   2 +-
 drivers/mailbox/arm_mhu_db.c                       |   2 +-
 drivers/mailbox/arm_mhuv2.c                        |   2 +-
 drivers/mailbox/exynos-mailbox.c                   |   2 +-
 drivers/mailbox/mailbox.c                          |  23 ++---
 drivers/mailbox/mailbox.h                          |   2 +
 drivers/mailbox/pcc.c                              | 113 ++++++++++-----------
 drivers/mailbox/pl320-ipc.c                        |  14 +--
 drivers/mailbox/tegra-hsp.c                        |  72 ++++++++++---
 include/acpi/pcc.h                                 |   6 --
 include/linux/mailbox/mtk-cmdq-mailbox.h           |   1 -
 include/linux/mailbox_client.h                     |   2 +-
 include/linux/mailbox_controller.h                 |   6 +-
 17 files changed, 149 insertions(+), 111 deletions(-)

