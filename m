Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A5AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/I2DTgQAxOgxPI9wEVMOM0VoFWJdzYjw+yI+ro0Jfo=; b=kQ64ZDWsl1LprP
	xjMgoLv7uRKxXQ1Bi5qHTOOaUFjUV6j+RGoAltnxHL6Ltd64GsFMaQyKKCFjNozZ/k2giuydZxsyi
	QKXkIv/gI71CV57S5NW+bWUtbNMQGLnGHe2dCC8rLlQZtXcfRgqqqvMAzmLB9KHSdPMpnkA93stvE
	QtCcQ899ZibCZpNla4OZlC0+Xsc7HddjMmX5l+yhmqDemzqK5FAI2nKwYgYcaYiSnbnYj3unwQO9y
	eBSzDKzB6NrynBvHOa5fk600yHT2p61a2vFuTJSG/pYV85xkDyeOasxPxVZ2Az3ZEdnUO7ftYEpdL
	Ntxkvaqbp/JmJVtZ1taw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ljv-0000000BXo1-1yle;
	Tue, 01 Sep 2026 10:29:15 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ljs-0000000BXlT-1ehQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:29:14 +0000
Received: by chaosmail.tech (Postfix) id 313F41C8852;
	Tue, 01 Sep 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788258545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P/I2DTgQAxOgxPI9wEVMOM0VoFWJdzYjw+yI+ro0Jfo=;
	b=b31zg8TqI5YV+yz7n4qucxmGK8MIKQYzMifv6+PR/LjD49WDQLYWyha25qAgxFMaCbv9op
	rXbaUL+n/9RBBmL0ffupKRS91FEtTKn2zJ1jiZEFwy4P5DEDMJE5O58GldpjLG0hF4DK8W
	szicpUEK21fsgvYZwIUfyKev+aOfPug=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v9 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Tue, 01 Sep 2026 12:28:59 +0200
Message-Id: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Qy07DMBAF0F+pvMbIbzus+A/Ewo8xMaJNFYeoq
 Mq/44QFNng50px7R3NHGeYEGT2d7miGNeU0XcowPJyQH+3lDXAKZUaMMEU0k3hRhN9wvp4T1kJ
 x4iJ1xBJUwHWGmG5H2Mvrz5w/3Tv4ZU/YN8aUl2n+OtpWuu91g1eKCQZq2RB9YIGb53LLlM82f
 Twu4Ee0p6+s9qbxrPgoOMhICUjDu57/ekN443nxnmoniQoDtbTrRe3b+8XhpaUsDFaHvpe1b++
 XxUvJvbSeRcp116vKU9V4tfdL64y2Vgjtul7Xvu3XxQcbwYECrfnQ9abyf/5vitfEBBEoAxLDP
 79t2zc6tWAfewIAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788258545; l=2577;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=H8mZX7id9FvtDTJIogqkS54qI9UOB7o+m0z4PCa/pKY=;
 b=bJyo2vYcPBaQI5zv88nbTYSowC5dNA8b/kwBl3MmVlMfx07syGDedKa+CyK/kfesCQHDcwm5N
 +XXtNSh084qAj/9YJ3iTcIDjHB81kNez+hO8TSycPmTHTH5h7u6aKYN
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_032912_939487_92A62D0D 
X-CRM114-Status: UNSURE (   9.38  )
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
Changes in v9:
- more dt-binding fixes
- Link to v8: https://patch.msgid.link/20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech

Changes in v8:
- dt-binding style fixes per review
- Link to v7: https://patch.msgid.link/20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech

Changes in v7:
- Require interrupt support on M3+
- Link to v6: https://patch.msgid.link/20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech

Changes in v6:
- Fix interrupt controller teardown
- Link to v5: https://patch.msgid.link/20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech

Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

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
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  29 ++++++++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 389 insertions(+), 32 deletions(-)
---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


