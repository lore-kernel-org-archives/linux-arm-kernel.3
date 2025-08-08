Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEaDix6sRcJYV60mLIJzttVw+UOcvD2uRUGstNWoWWE=; b=ysNyOpvw/Fkj9+VKaMvg2lazRl
	kq/XEipfYow4SyDQnLCi8Z71ZXzkk0gKC0lj2Mmr9PR6mvhGK6e015wOzuTVN9nZA4FwD4fz4IVMo
	I8ayrdXoW2DJt5mJj4bTb6aICzgTt2mAuVcvjlgH2s8ZjLlU6q8Euvr74rwoRBdoW4XL0rYo5Z9JA
	Cjmh6uTdKTOB6Xgt1PFb/bcBLSkOtsWp36ffxpguL4lBop6lHF/c10Xu1ynA8KR2KOaVBNFNWQ6VB
	BPt3Kc18Mnc60zH3h2QIKt9O3XQmplCn1Qd8JT2C3Pq7k4D1/HXLXOLLyzDyRu1eowPR6Rihfbo2p
	KEzYXXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPnN-00000003Is5-3h3Z;
	Fri, 08 Aug 2025 16:18:17 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPkp-00000003IjN-4ARm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 16:15:41 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-433f984820dso1569384b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754669739; x=1755274539; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEaDix6sRcJYV60mLIJzttVw+UOcvD2uRUGstNWoWWE=;
        b=B//iv9haKu0TE6ImN86jAEfKtkntzx6+YoYxdtGV/D4x8n9TL/Fr92U7A7RRRVH2di
         Zv7hjqBGni9L9kV2oiEnSlYep/CJP2RsBAclTcArPMMidTV09f5UxPirGQuKHubWDgUC
         kS5zzxGGa4hdKN3px4Z33Razr1+lUdWkzexHPsOo0Q5XCXw6oz3wDB4tY4QeDjRUD5gM
         OXhM8JGKdmaD5xIlKpq/lwPff/UlCqb6adazyGcl8UT4dpOgZeIkWHE5nQ988sefqaod
         Ggu85kzSNfApsreE29l4u55oEJUjQIx7QZfV0jDE3VWkAZEmUdLzM3S/RTQV7D263MrG
         ZmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754669739; x=1755274539;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEaDix6sRcJYV60mLIJzttVw+UOcvD2uRUGstNWoWWE=;
        b=llV/zCuFsgiBDSHC1zB7oPzUuGfHk+Lo5SHinxi7MMr32kmg1RkDc4u9Y2v+ifznUT
         lvYcf79uSA1C93SEi5KCrkGzlhu6843CXvtnMf89ztvmN8G8OZt1Q2gyPi2y6YrB+SB6
         t6Z7OqAKrvDr6Xpahb/M4y2RDx04KuxI/cMJXtQDaktTOP5S3a/aTQoKVl3FgnBMY5AO
         3gZr2ZumQnDM+LwVWz/qA3v6qW4m4hBerxNyQswi1vRXVAsFkxXUJ+W+CfZAoAFPz+mt
         sGz0Sv67IxvK3Jk+OLKUemWKgXUeKpGTcb/S3l+sqBFj0/SfQrdCQ2eDSeQ+6dnt8Rn/
         eadQ==
X-Gm-Message-State: AOJu0YxCBFq9OfoxqdgdnmEI5RGAD8PePnWg5Vpwu92f1o5tRxJvxGho
	rlnS7dqc21xBtjmMmTZrJ0zFyHLPxHlc5SP+7GYVtUVfHRTK8IEhKuhCR0wCeOn2i0ffxcvJOjo
	e8J5YghWuR5zHOJfYrxZgTbaabnDjvFs=
X-Gm-Gg: ASbGncsdU1+fAy4tT8HYpBvymXHTKzJXYCQk+dIAXvTBCzE0waW0xaaxk9qDUy08VhW
	R4w6sAt4AzBt3XC1/wVLLJ4wNRP5/e8WgZ+2OsiK1wPe6ABENfuTOFyauBuS/dZmSURyMnu1+CT
	wjNbLb1UieB3YU2TxDr7+FTuSbzed4gYScM1QXakmuq/Jn1MrdOy3oeW8t58CmAeyn1jDKFFnUm
	iAJVRRM
X-Google-Smtp-Source: AGHT+IGAf6NlWhniXbzEbMshI0yuckGCe6+ALslH3kX5FSyONxwwwXzKSDgVl4Qzic4CM7x7HMcdLe1z47UBtkDDdLI=
X-Received: by 2002:a05:6808:3084:b0:435:6d0b:82c4 with SMTP id
 5614622812f47-435980222dfmr1778053b6e.36.1754669738848; Fri, 08 Aug 2025
 09:15:38 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 8 Aug 2025 11:15:26 -0500
X-Gm-Features: Ac12FXxwrGojS8v0wQNI0vM24r2jg3NrSRyNjV7YrSnlqxupgJhtX96rAGR2OuI
Message-ID: <CABb+yY0+oTn999iv=vy1npF1Bi9=GVqWXBh=iOocVoa2MwW5Vg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.17
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_091540_049333_455A3811 
X-CRM114-Status: GOOD (  12.39  )
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

The following changes since commit 4df9c0a2465a523e399e46a8d3b5866c769b381b:

  Merge tag 'soc-newsoc-6.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2025-07-29
11:17:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.17

for you to fetch changes up to 5378bdf6a611a32500fccf13d14156f219bb0c85:

  mailbox/pcc: support mailbox management of the shared buffer
(2025-08-07 23:49:56 -0500)

----------------------------------------------------------------
aspeed: add driver and bindings for ast2700
broadcom: add driver and bindings for bcm74110
mediatek: fix RPM api usage
qcom: use dev_fwnode
pcc: support shared buffer
misc: dt-bindings cleanup

----------------------------------------------------------------
Adam Young (1):
      mailbox/pcc: support mailbox management of the shared buffer

Colin Ian King (1):
      mailbox: bcm74110: Fix spelling mistake

Jammy Huang (2):
      dt-bindings: mailbox: Add ASPEED AST2700 series SoC
      mailbox: aspeed: add mailbox driver for AST27XX series SoC

Jiapeng Chong (1):
      mailbox: bcm74110: remove unneeded semicolon

Jiri Slaby (SUSE) (1):
      mailbox: Use dev_fwnode()

Justin Chen (2):
      dt-bindings: mailbox: Add support for bcm74110
      mailbox: Add support for bcm74110

Krzysztof Kozlowski (5):
      dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add missing
interrupts maxItems
      dt-bindings: mailbox: ti,secure-proxy: Add missing reg maxItems
      dt-bindings: mailbox: Correct example indentation
      dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic node name
      dt-bindings: mailbox: Drop consumers example DTS

Luca Weiss (1):
      dt-bindings: mailbox: qcom-ipcc: document the Milos
Inter-Processor Communication Controller

Sakari Ailus (1):
      mailbox: mtk-cmdq: Switch to pm_runtime_put_autosuspend()

 .../mailbox/allwinner,sun6i-a31-msgbox.yaml        |  14 +-
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   |  10 +-
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |  16 +-
 .../bindings/mailbox/aspeed,ast2700-mailbox.yaml   |  68 +++
 .../bindings/mailbox/brcm,bcm74110-mbox.yaml       |  64 ++
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |   9 +-
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   9 +-
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |   1 +
 .../bindings/mailbox/ti,omap-mailbox.yaml          |  10 +-
 .../bindings/mailbox/ti,secure-proxy.yaml          |  18 +-
 drivers/mailbox/Kconfig                            |  19 +
 drivers/mailbox/Makefile                           |   4 +
 drivers/mailbox/ast2700-mailbox.c                  | 235 ++++++++
 drivers/mailbox/bcm74110-mailbox.c                 | 656 +++++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  10 +-
 drivers/mailbox/pcc.c                              | 102 +++-
 drivers/mailbox/qcom-ipcc.c                        |   3 +-
 include/acpi/pcc.h                                 |  29 +
 18 files changed, 1214 insertions(+), 63 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
 create mode 100644
Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/ast2700-mailbox.c
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

