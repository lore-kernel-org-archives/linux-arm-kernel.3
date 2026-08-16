Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FCC5DF77
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DowHBzYBeYhj8nTjDDpRI3Jvmvggcy6l9lhFppTjGSM=; b=TRFu8u2KOaewOg
	vfenQbhAqzMzdgOee2VtVA8Jd1CZhEXZAeCiWATmxuidIm3Swmacj/6C07lCkZVHmh/mfcp2Z/t4B
	LZZZhyG+Fbk0/55CvVgODeznxNbciqpSw1UEEtTsYY26IYvBKaGFzb3W7NRQHEiMZiC/66QlZWkEp
	Vtzs8nf3pTemOdIkXNeYxdt8kem3E23UEzBlafQD+X4QV/ha4hqtBAFmGstckZfDwfIl0zIdytPSw
	fIwwqcNploTZi1xeT1k2DAvsH5Htwwo7JRjGtEaQpIvF2EjukXL7d5bUIszeWA+h1VcWKaFcEQOhv
	rWIldba3y2xtgUzGzDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJf-00000004eZ6-1xt7;
	Sun, 16 Aug 2026 10:42:11 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJc-00000004eX0-18az
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 10:42:10 +0000
Received: by chaosmail.tech (Postfix) id C52BB1C867F;
	Sun, 16 Aug 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786875993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DowHBzYBeYhj8nTjDDpRI3Jvmvggcy6l9lhFppTjGSM=;
	b=HY3d1FyuTBr1lSqaZpRGN5jywrz0NtmwR6pwsxKkH79jt9CdfW2r+zqDEkSNL0d5NxGhqz
	TtGufr1FSN6ZPWSqRPa5yOniFbT0Q9fOVpsKQpWsGHvSQat6CGPLhR9jiOEsPyDpFoaScK
	F9/dwBc2N9xnrTnknkh4wu/3Ih9BQV4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v6 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Sun, 16 Aug 2026 12:26:20 +0200
Message-Id: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQW6DMBAF0KtEXtfVjAfbkFXvUXVh7HFx1YQIU
 5Qq4u41dFFQWX5p3p//EJmHxFmcTw8x8JRy6q8lmKeT8J27vrNMoWShQBmwSsvRAN1lvl2StJU
 haCO24EAUcBs4pvta9vr2m/NX+8F+XBqWiy7lsR++128TLneHxRNKkIxONdEHFah+KVv6fHHp8
 3lk34mlfVJbX++8Kj5WxDoisK7p0NOfr4F2nor3aFsNJjTo8NBXW7/fX61eO1ShcTYce731+/2
 6eK3Ja+dVRLL//DzPP/Uhu7G7AQAA
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786875992; l=2141;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=OLyoVPhzaNfTGeXib5DDiwu6l7kkMfxH08pJ8wWb1Ng=;
 b=U0TjqGf0leFO8TPJiqPRrrmUp4br2fyJs6ax/NFVXnMkOPbCYgO/wn1LHcj//ORIlfSAkPxwP
 yfhjiJ/G7lSB4P4B6VOX79P+Sz5jWqbyb8l3aaJp/ZQ28R+JNsY3wWQ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_034208_498645_73E8B5CE 
X-CRM114-Status: UNSURE (   8.79  )
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

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  15 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 375 insertions(+), 32 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


