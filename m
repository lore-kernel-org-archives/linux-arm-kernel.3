Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A1C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJxP9IRcZLDkD6egno92CC8rTp7kO0Iu0E0qgYpJ2ow=; b=lY/G4OEiyA2Cs8
	6Ab8YhwuLqdRmzqIR1MDSJjC8RxDsEvTzvKQpx9mnI3FOKzt3ooYnx3Ob2Vgzjf+Apgt8DJ/CMZ/r
	WZUZcUQ7TtXcxCbBd/FSeprphp5pA9N8MzVLgNKv/rQU5JrEvoyODS/hfD2pVHz0s05xnIkU0hD+L
	SgwxaMrP9w4t5q+jJvnFxIXxmcXclmKTMbFNkkRQqrVocD9zz4Cf+8MeWzcf9R7Cyvidi+qV1NvvL
	SF2Xg6wO2fbAhp/wNcpCY0XZht33ENF90j8oHRdGVDRM/+A6KgOvee7ekniTPxlZJbQSQpy/wbTaQ
	71zO7I8Kqpi/Zk4qDb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6q-00000004olW-078W;
	Tue, 28 Jul 2026 09:28:24 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6m-00000004ojJ-3IgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:28:22 +0000
Received: by chaosmail.tech (Postfix) id 569D51C9733;
	Tue, 28 Jul 2026 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iJxP9IRcZLDkD6egno92CC8rTp7kO0Iu0E0qgYpJ2ow=;
	b=Rc+0irYf3q5xc2x4/NUhRJahvBipgcx/tfcxEZKqahYRuIzaoMT5PXol3YyWZ4vWxi9msG
	xow/uSg0+2iuHuwWB7qJvLXFxgSyRhi6BO7AvYF0X5oa0hhxHUZTaVo8K9f+RLLfLwxFij
	X1sdR8UmuRlWg2eeiG75WKyuHYgHpe0=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/7] spmi: apple: Additional commands and interrupt
 support.
Date: Tue, 28 Jul 2026 11:28:06 +0200
Message-Id: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBCEX4Xs2ZptUVBOvofhUMoia+Qn3Uowh
 He34NXjl8x8MwsIeSaBIlnA08TCQx/BHBJwre0fpLiODAZNhrk5q5BhOisZO1b5KUuxanSFFiE
 WRk8Nz7vsXv5Y3tWTXNgMW6JlCYP/7GuT3nJ/xZNWqEhbc21cber0cotfBuksv46BXAvluq5fV
 tpc4bsAAAA=
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1547;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=CB6/xbkMbmzfgAWtMWkK2Cc9Vq1Ar8BpRmf28+xWHck=;
 b=/EIfb2ojZPHuzD3BxGf1/5IkT8GR7QKQRxhUML5ascs1ZsK98OKtyGrwop3My6MqHLwczsdlG
 gqWe3uET3ZHAQQZJYwZUZ9i3jwQqJphEAGpsSfZUHo3rNC3Y4yEIQPk
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_022821_315687_2FC6C70A 
X-CRM114-Status: UNSURE (   8.78  )
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
Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (6):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: use IRQ for RX FIFO if possible
      spmi: apple: interrupt controller functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  14 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 362 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 349 insertions(+), 30 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


