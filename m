Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FA9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rLrrRSbIZTbnZuCVNXXY71qmUVrSQKkrexlZ7DXMPbw=; b=O/D81MipA9Qy6z
	L35O9YlhxtJMupgetAE2+5mDmoi7Uu3f3OswMihpxoy2iqlQ5b4U7zdFj7vIMtcX6KOQDRqjDPgQm
	ucOrizi0ek9pT8lxxtxHVh0sN1Nhd9qfafRdY29QPLaa/vJIgsdeVV7Rf5H4+OvTZ13a2JahdsMhD
	pyniu8WmmSN6KJTvamG7ZXwfjyzvAYLKeFy5FZxH2NADKrOM5ZSh0JWzfGSn4hLdiOzdJHR3YepKT
	w7aGMjtATezBNQwhDmYexXp8NyB03VyO3uF3ytErDAOD5Q6fs1JyVxTmV7eM4SAR0p7Tslo8SQf6M
	NP+ufRHqCU0sExggIrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJm-0000000H6ex-0t8k;
	Mon, 03 Aug 2026 13:02:58 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJi-0000000H6b4-0tE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:02:56 +0000
Received: by chaosmail.tech (Postfix) id 411991C7E15;
	Mon, 03 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rLrrRSbIZTbnZuCVNXXY71qmUVrSQKkrexlZ7DXMPbw=;
	b=cSGJgkeOR67mE7DL/l7KVWKOnfaCNTrLPi8TrwWwQm7w1HhhVydYs04dE+gpMcqrC84PvQ
	ahH8m7mVSJ+a/oGbqbsT4VVpxIb8KjgkgbcPcpqB3zbtFMDUAZu9eZBXUOSie7ELteOGMi
	OaLUz3bcJIcOrgFfc71K6Y9OEKbrLA8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Mon, 03 Aug 2026 15:02:42 +0200
Message-Id: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw7CIBBFf6VhLWaAvnTlfxgXlA4WYx8BJDVN/
 12oG40uT3LPmVmIQ2vQkWO2EIvBODMOEcQuI6qTwxWpaSMTDryEihfUlyBm6qbe0CovBTSaNSC
 BRGGyqM28xc6XN7tHc0PlUyEtOuP8aJ/btcDS7m84MAoUmeQHrVreivoUfxldL81971F1JNUD/
 /TrL59HX+cCC80Ai1r8+Ou6vgChdChw+wAAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1654;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=LbwCq3rIvJpT2sFv6/b31enSKPX5tPmZoKP7DcA0pYE=;
 b=iKa1RbGdrS/AWnDcQiX2em/5eLcNtzFCH1O/4uGxfggKXXGvnjzX4qXZQOZzG6zf08OXPn6ox
 OPTpZaHoX7lBqBmnYOp/41Lsi9H8SeOvWUpedqm0U9W2uqvXC5zbS05
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060254_712080_A9A710A3 
X-CRM114-Status: UNSURE (   8.90  )
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
 drivers/spmi/spmi-apple-controller.c                   | 381 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 367 insertions(+), 32 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


