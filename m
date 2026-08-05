Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A80C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VADd9rTXaQfJ0G6QlNI7UmFibQjdB8dxSy+ROikrhP0=; b=3NDomp/reNZjQu
	p4J9EOigC6eXemBN+66mB4msM0yD7RMM/A+cl7V1lmJnDqxZdO0W/xo+39MU2Zw+WWoJeXR1oHFvP
	wt/n+i2Wuc68xyBX1/mQS3FcAkgsj0aXQvCgzwntWIcM6MggmnmLW5niu5KpBAppjrDyktNC/nlpg
	YMlZnCyrtSJPGM6MDwPFs2CYHNQkNf3D32+lcre6HikX3jZQvYp1VFsU2OrvjAKYAKk82Mrcy8h8I
	teKw/kgffR9qLhlY+ol5waKH7hGFk/EA5fVIB/KaDdVtDwHQw4/FIYjwyI3YA9u7i2JDGQoIbUXmy
	FE7bmLPhM0XYXwOV76Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYap-00000003hUF-3MYo;
	Wed, 05 Aug 2026 10:11:23 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYan-00000003hRu-0ipe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:11:23 +0000
Received: by chaosmail.tech (Postfix) id 7E1141C867A;
	Wed, 05 Aug 2026 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785924675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VADd9rTXaQfJ0G6QlNI7UmFibQjdB8dxSy+ROikrhP0=;
	b=TpdFEgNx7krTapvOGiGPfH+p8zfBsTVuDWiq9xFe497Co9KIhPMx3S8klkE/w4XOESPvi4
	o5GgybS76nqQ9V7wa8a4i2N9Ddl0tPDxj7pyJRm3ObLDpj9JDo3RZt3WpO3uRv7aDEH/8Z
	3bCRks+KQxbBOpbl5NCh+ls+dh0JVoc=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v4 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Wed, 05 Aug 2026 12:11:10 +0200
Message-Id: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oyw6CMBAF0F8hXVszbXm68j+Mi7ZMpUYeodhgC
 P9uwYUSWd7knjszEYe9RUdO0UR69NbZtgkhPkREV7K5IbVlyIQDTyHjCR1SECN1XW1pFqcClGE
 KJJAAuh6NHdexy/WT3VPdUQ/LwtKorBva/rVe82zp7Q57RoEik7wwuuSlyM/hl9bV0j6OA+qKL
 Oue//p843nwJhaYGAaY5GLXi6/PQWy8CF6zTCWQlgWT7M/P8/wGmygZmzsBAAA=
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785924674; l=1828;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=MfFlOSgsHc0cVVzhkh9kgd3gjlDIqJygtEE2Js+ylac=;
 b=IoQe+M+gSKevvGe4sZtZA2upYA/Ghoe1I/GJ31IjCNnSJ4/o2HMVmdu+rdyE+kp8okRfkZCxw
 yTNf+PZBF5OALFPBZwYjmyHlxUiQ8smQvVOwc9Djl/iQetAFih+Cdjp
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_031121_685884_1FAE51A8 
X-CRM114-Status: UNSURE (   8.99  )
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

The SPMI bus has grown additional responsibilities in the M3
generation, making the current driver insufficient. Add M3 comatibles,
support for slave-sent interrupts, FIFO interrupts, power management
commands, parity validation, and fix locking.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

Changes in v3:
- Rework interrupt support
- Address review comments
- Link to v2: https://patch.msgid.link/20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech

Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (5):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: Add interrupt functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  15 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 384 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 371 insertions(+), 31 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


