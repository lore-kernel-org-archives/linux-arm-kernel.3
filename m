Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I/8nGZ3kme0kRjU0reoPml5u6qqgUq5INVuMdCZUNFE=; b=XVlqO/qiuS8ZKL
	D9doVwqnvTj5eYmTaqAx1Z6GUk2O9EXf6JYKIYdR/j+M9dUZ6bWWDyey5kDPHqKIHDxc7kZQXn76x
	Mm0SbvnN9t8jFIjgjabwLAVEA+mEQTgU+WCHoW+QxiILvHznPK3HJ/tfudDQp+5jz5P+t2T7AnXVU
	rrWayYiziz7ll7x5mphkjZT9f6YBkX9qV0hP5KKAvfNP+TtJxPFt5SulvOANWJ4833m/NpIqr4tYC
	MtPvqEZ+M0dVZlsx4IXqRd/es16UZ6KpwJk5F3W96jLnarAJtd0D/dvWFbx6XATuzeVeurRE/mj09
	z1QXy+dV/uLREb3jY4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjl-00000000OnU-1Ebm;
	Sat, 25 Jul 2026 13:48:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjc-00000000Ok1-3ST6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:48:15 +0000
Received: by chaosmail.tech (Postfix) id 9E89A1C867B;
	Sat, 25 Jul 2026 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I/8nGZ3kme0kRjU0reoPml5u6qqgUq5INVuMdCZUNFE=;
	b=KQff2g4/5xB2tuH9oBhaH9B2LVNEBaJWelgAD5T7FLHKibSLXWHSsgaPzzZHLwHMlVPB4W
	WnaNEcJSJ6eAou7oCFQRDvRx/h0gIZUnGVZ7NHGv+/q15yOoOf3ANz8C1SUEz/dTn4CAXW
	dQE0T/71GptZRfOwmL3/rfoaSLyGjas=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/7] spmi: apple: Additional commands and interrupt
 support.
Date: Sat, 25 Jul 2026 15:47:57 +0200
Message-Id: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUZRSWuIhYtg5H4SQeRiLsrl
 t/ivQuEPJNAGV3g6WDhZQ5I4giawc49KW6DQaM2WOhcbQbTU8k6sSoyk6LrEocWIQSrp47Pb1b
 Vv2V3IzXbe4D7fgCVwv6tbgAAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1323;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=JcVhJYDXJ29DM6q/DGhCD0k1FkRv5FLa1IeNLYu00uU=;
 b=GmINXHiFj9rrwrh8pxjnL6ytD060L+MXm5s/38fjKXFIk14Vv3FqSUm3tp5H5N3onvPa8/nPc
 Lwqk8dW+tIhCu0obO8IiD8b8nC7HIe8EuGKMEy2vktg2xCDnnvv5i+1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_064813_334285_F049C911 
X-CRM114-Status: UNSURE (   7.86  )
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
 drivers/spmi/Kconfig                                   |   1 +
 drivers/spmi/spmi-apple-controller.c                   | 367 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 353 insertions(+), 29 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


