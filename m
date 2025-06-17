Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pnlmn8Lzqxdh9sPxgTMxZddcdk8Ng+ng6Sm09cUpkbc=; b=I+uFLRprJJ7jvQ1tqSzoXo2FYW
	922SUYIkg87bhP/v2Mu4IO2MKyqngUMoJcByzzycBYmO7cz4bH+mrAFU+yxm6z6MRpadmFV8jSqP3
	aa7eXKs9hd3kOVKmN6RPU1rym+gBUbCXykKkfA6HZVpR9CpXUA/u+7Dwk3JABJTih3BU5/YKzQS5Y
	xX1HDyRCgDP7iHoRAZU3ERFdjhO6TMw87uSmEYgMhIGzFAidmItYEFWUnKVc+M80jy1cChdy9yRRG
	Ri+dfLK38qEWstEddC+H0DoEUoN9x7r3L41XRBHu4GsDT9RLl+D2fo4fHgPKyKJ2v1L6MDpENdRvq
	lNklO9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWxl-00000007UES-0sBr;
	Tue, 17 Jun 2025 14:06:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWcd-00000007P47-3js7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so45728405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167906; x=1750772706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pnlmn8Lzqxdh9sPxgTMxZddcdk8Ng+ng6Sm09cUpkbc=;
        b=ESGeYXrzQwzVVC5uUrGyQfwpTWaapSyF0ttow7Nr3TnKG3G0+u64z+Q1sN8W06Stop
         6cbNxSUF4v2vffWyndypbTCmOkTtxHK+WrQC161sSlXrBStOkMQ/WvIY3EDvXfNC2LHC
         9lTyCM9VYkIfq/YM+vcSrVxahl2eleNbdWs/1z0fQLvzwAHXOiMl1UqV4KoHuhmCU7uf
         92xIu/+Fxe1jWlY1ly90ZL0XDeJ2ecrRfL0DavXAkOjWReOQw4YkQwcpWDICYIegU94l
         V9t2Mdyf/s1oZ/NJrBjEttYY3Iwoby9TRNZ6ayUgWdqR+fk2KPDYHu6dQlDmcOEoKwx3
         xxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167906; x=1750772706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pnlmn8Lzqxdh9sPxgTMxZddcdk8Ng+ng6Sm09cUpkbc=;
        b=INsTORVnmEnboHmN3FIji6pyzOUq74NBs0OBU4S5NvUUbhpey/68FAIPFml5NRBzfo
         Rzx2LPPi5VP/nK0/+MVB4017gfAN9Vs0pNPLpgKPLGvSwglDks+eqXuQSp9O8DhvflY1
         tyRt99b+/DGMa955zouQhWhyH4ygIofOBWU9AOCJ0KEu0LeKNc4j09kyXgq56RYroD8H
         C8tSvPLyRDKezn8iq/2i+IGU24Z+q43bfxFj5Xxyt5P9i4VhFhKcQi7z0p/8xaQeib+5
         shbqgruQkCrOznrgveLCWw0uY9pXWo49NOsI1pzWmYEXLo2dqBzqVPpIp2zmOO9k9l/H
         z1MQ==
X-Gm-Message-State: AOJu0Yzg0/Zd0/mn7Kcx7jdz/B02VA43noZkTKLwzhk9RKDq9fKcO6ZG
	s46fxp/6oNYMbFE78rAbyqApTGAeB6FMRkBFectW4RJ1OYjt3fMlrIue29GcdXetb6Y=
X-Gm-Gg: ASbGnctbPRQ/UnAso7N90hfBdYxEUyyeW99mgFVEtG6ICKConAFYVon8hyqIpWHvluT
	rTE8F4kAatd9SV3LkOMLVi6jQ23KNEzsX1vu6Ba4AqAHejLni4Njbi9rnPr/a+KGYP59sOZed/Z
	2gVk/ndOH5khKGHXoKK8ZK/sXmEZFgmN93q8WAqWvoLBSesPbkZ3xphhZ4DGqR4POd+2m2VzXNP
	qvnERc1KO3Iy6v3VShO5E23TCJPBJmlp4RW7LcpZpiUGeFWZVRF94HyrgiGJTsNECVaCBK7vN8f
	W5aNCkaaiO6nISHmOXmHa8LZWoGLBAlujTqsmrs/vZywWiMlf1GY436qmPZAbpAtRAE6SA4032m
	Qa/v349YZ/YY=
X-Google-Smtp-Source: AGHT+IHCtEFS8GzQ9Jzl6qP9zWaGOsHpYn8vtBkAqczxW1urVL0oMFvqxpp+QY6AejM1vZ2do47qRg==
X-Received: by 2002:a05:600c:a01:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4533c8ce774mr133642045e9.5.1750167905615;
        Tue, 17 Jun 2025 06:45:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 0/7] Add support for RSCI driver
Date: Tue, 17 Jun 2025 14:44:57 +0100
Message-ID: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064507_929765_29D335A0 
X-CRM114-Status: GOOD (  17.47  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for Renesas RSCI driver for RZ/N2H and
RZ/T2H SoCs.

Note
- This patch series is split up from the series [1] to make it
  easier to review and test.
- patch 03/12 was sent out individually [2] and is now merged
  into the series for convenience.
[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/
[2] https://lore.kernel.org/all/20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v11->v12:
- Rebased on latest linux-next.
- Added defconfig patch to enable RSCI driver.
- Added RZ/N2H support to the dt-bindings
- Used port ops callbacks in sci_shutdown() to allow RSCI driver
  to reuse the core shutdown logic.
- Added reviewed-by tags.

v10->v11:
- Rebased on latest linux-next.
- Added a new patch to update the dt-bindings maintainer entry.
- Added a new patch to use port ops callbacks.
- Implemented shutdown_complete callback
- Added reviewed-by tags.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: serial: rsci: Update maintainer entry
  dt-bindings: serial: renesas,rsci: Document RZ/N2H support
  serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in
    sci_shutdown()

Thierry Bultel (4):
  dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 .../bindings/serial/renesas,rsci.yaml         |  27 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 477 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  10 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 210 +++++---
 8 files changed, 652 insertions(+), 89 deletions(-)
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h

-- 
2.49.0


