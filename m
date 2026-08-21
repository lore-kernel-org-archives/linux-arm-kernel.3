Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115EC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGz7L6wkoxdGySJbwjAgF/GHfHEphRhuL8YSgMKm+ZY=; b=Rl5rkwXpZtOUVq
	hvWCCiv3jpXcOY0z5lmVPeOacB5RcR/HF03sISU9q82TvoOf896fCFbBVYEPOcTqLHu0DA643+O1w
	CoFsKgvgIi9Y0H3d/BBf0Z+oB1s45Deq/mILiTG1ukptmJQAh1Ne6KSqZcUoxWPdXWKPzJBwdYSzF
	Wv0eiIssex0OBAH4P4Fy3NS0ixf4gXcVQVjzZT8mI9E/fN/9UcIDGu73SKjWZH78n15NC0YNrSjzD
	M2TVOBHsTZVJijunaBbcgM1rrISoPgOs2tcMgoJfEPwm0BGfWmEods67q1Yc+Yimf11q+ic/yma5u
	Y6eMScrQ5aSpHDuRd8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRRG-0000000DiQy-1mSE;
	Fri, 21 Aug 2026 15:45:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRRD-0000000DiPd-2xYa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D707261126;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84860C19425;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787327146;
	bh=Co3rtpcICbG7MUsR5ETBefuCQJYk/RF+cMq9PmdIX1c=;
	h=From:Subject:Date:To:Cc:From;
	b=EsW0d08BK3tO/pkeuFSan4xgyf8lg3zwZ4FeyaUDuSHoNqpqtn+us4AimuvEdHYEw
	 0qIbO+e/f44ipw8Vi1U3JhlW5u+XwpujzmElHw9Ph8oMdB8xFlZLFoHAFWyx/bES3k
	 p4wDgiHAvQv7ahSZxDeXm0vEasvCmCTd9rdHQdGVyyVOxtX8dMGiDMs1q5a63IKGRe
	 wi/Zi5uqCJjzey4Cn0qoOlPE6paNqLdGZrh1Jfd4DNyKx/ULRAIOkKJiP614ZjfqUV
	 VnZ5OAF2T61Sim/LBCr8lK9F3Tng5ClevYJ0M0Hh5rKrZidM052G2uYw1nrK+Gij5D
	 GqTlfb6Mkh8jQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ED5C5DF93;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH v2 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Fri, 21 Aug 2026 17:44:53 +0200
Message-Id: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhCGxFX3sOwaGGAUUPJFImG9
 O4WXLt8yfvvrxBImAJcshWEFg7sxwTFIYNmsGNPyG1iKFRxUmdVoTPYsEehQDNaqzunjLNtRZA
 mk1DH7z13q38cXu5Ozbw1NmPgMHv57H9Lvnl/0kuOCk2ndVmWbeWMuz5IRnoevfRQxxi/58YnK
 LsAAAA=
X-Change-ID: 20260809-b4-cio-reset-aa3fb04bad9e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Co3rtpcICbG7MUsR5ETBefuCQJYk/RF+cMq9PmdIX1c=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH0eJJ158ufD1h7UJG9u4HT4z0ndbf7vB+Jxz+T03Be
 7/KAoF9HaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJvJvOyPDqdOYOpn26Tx6X
 dPK1v9pUr3Zx+pY9irVsvVZz5fImdR5hZPjqf66mLs3z+1Jx1ZUpdwItFvn7bnw7dVe11yYL/aS
 5M9kB
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
reset inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 and t8112 each port comes with a
dedicated register page while t600x and t602x use a single register
with one request bit per port shared by all ports of a die in the
middle of the PMGR MMIO region.

The first patch adds the dt-binding, the second one the driver and the
last one the device tree nodes for all SoCs. This will be used by the
upcoming USB4/Thunderbolt series to start the host routers before
booting their co-processors.

Best,

Sven

---
Changes in v2:
- dt-bindings: move the t600x example with the PMGR sub-node over to the
  PMGR binding itself where it can use the correct number of address
  cells such that the unit address matches reg again (Conor)
- bail out of probe when no match data is available (Joshua, sashiko)
- explain why neither a read-modify-write nor a delay before polling
  is required for the shared t600x register (sashiko)
- fix a copy/paste error for the M2 MMIO region in the dts change
- Link to v1: https://patch.msgid.link/20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sven Peter (3):
      dt-bindings: reset: Add Apple SoC CIO reset
      reset: Add Apple SoC CIO reset driver
      arm64: dts: apple: Add CIO reset controllers

 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |  12 ++
 .../bindings/reset/apple,t8103-cio-reset.yaml      |  61 +++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-apple-cio.c                    | 200 +++++++++++++++++++++
 10 files changed, 312 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260809-b4-cio-reset-aa3fb04bad9e

Best regards,
--  
Sven Peter <sven@kernel.org>



