Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C36CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WGqm1vuYzHEBlHp/h/pCaC3YP6K1f63I3x2yNkSZ08=; b=EQB6cn9P2Idp4A
	G9tWFbPfBdf1s80YlgpEYUfGF5ynOPgs6esR3yp2yI9Bt/3a7zT4YjfeIOSAKuTxibLv9+hKxLxqE
	6nw6My+OCJDoej/e3RNldRBf5xGr6eyStJF3/8e7pr5g25BhGAUUeUHUOJqPkBgKNSWuQ/B8YtVVP
	hDWVl0ZrbNdLU/+rULiKwcbt+jg/i7ZdL9vJGTrPfO+JjrL5OwiD6x4s5v9TkENetQSlFVWicJSVr
	waaEZCAl1JWbPQZBOmlhBuAyctPzv7ndd3Md8812fhHUr7kZjl/Zfu9z28oH4eWEIy9S0XJaMQvJ0
	uEcAU6XnY+Bcc8ZEcQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNNA-0000000A9Zo-3d55;
	Thu, 01 Oct 2026 20:27:20 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMy-0000000A9Tv-1Drq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:27:10 +0000
Received: by chaosmail.tech (Postfix) id 3FC061C885F;
	Thu, 01 Oct 2026 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1790886421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WGqm1vuYzHEBlHp/h/pCaC3YP6K1f63I3x2yNkSZ08=;
	b=RtS44OAbyQAwJoMGywm/ryiDWf7YFcdG4mEQAyEYfNj+jqSvZmhUP0jYVIUGQ4aZmQvsuV
	2xEZq32IFwDu5/VK9P3FoV5quwANCF8x5DtBYltvA5J7Axlrw0bznYaERMbQZPYr0iZseA
	diwj/wYBPieQV9g4GpYwWOUBnRjUEAE=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v10 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Thu, 01 Oct 2026 22:26:55 +0200
Message-Id: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23RS04DMQwG4KtUs2aQnXdYcQ/EIg+HBkFbTYZRU
 dW7kymLTiBLR/5+W85lKDRlKsPT7jJMtOSSj4daIDzshrB3hzcac6wPAwOmQDM5zgr4eSynzzx
 qoTj4hB4cDBWcJkr5fEt7ef2ty5d/pzCvCWvHPpf5OH3fxi249nWDFxxhJHTMphBZ5Oa57nIsn
 y5/PM4U9sOavrCtN41n1SfBSSYEkoZ3Pb97A7zxvPqA2ktQ0aLDrhdb3+4vbl46ZNE6Hftebn2
 7v6xeSh6kCywh112vNh5V49U6XzpvtHNCaN/1euvb+br66BJ5UqQ1t11vNv7P/U31GkwUERlBi
 l1v794CNt5WD5Y0MOIe5f//u16vP7yIe0G8AgAA
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790886421; l=2735;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s/CySsdC5G6TeidNg99K1zBN/eh7iI0dzxg8QUI8iao=;
 b=XnOueGpokl4+aoo+aeeh7eR9DVzAVy33ChysJ30ovSlgrXfbDmRmRbVUhpP1x69+uMOeHRbp6
 w48tnIqnFVvDfA+uH2z0F/7qESasPm8NrXD6wjZ1eXlQxac2ZpAZoFg
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_132708_895901_95CF456D 
X-CRM114-Status: UNSURE (   8.81  )
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
Changes in v10:
- Just collecting tags, effectively a resend
- Link to v9: https://patch.msgid.link/20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech

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


