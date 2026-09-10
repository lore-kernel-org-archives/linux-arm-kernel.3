Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04915C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kQkb6gWom8B8sf7tnCB4kepo3gvA1Kc1t11RUjin2x4=; b=2TQlaages1wkiq
	+6u3l8Ckf87/NntgiiRksYUxQsSCQ8p4ZItTkclEFMJNoLIX56F5vicg4tL9j5Ekj8DJ6l1YjbUAP
	0cL1IVuI6m6xK5n2AHb4s81rrt0WUKDVEpUNHJUA45ACIPJfADzM1leiQsuzeDNwNZp2zOhJphiF8
	8VVKlnExxy8PuSa8wWdGTT0VQyq1ysmp9n4eRLfipBDgO+rSFUl4flAH1ruqWFx3b+2iwdrqeXJG+
	hX2Ky5cdotb/rRUz+aBBxkuTEKcYBBIevgZZ0vgew6yaD+0N72RImFtQFELg1ZDKALLjg8Kt6I24n
	edOJB2iZeCFtNiQ1hlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hr1-0000000Eypd-2Sfo;
	Thu, 10 Sep 2026 16:42:27 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hqu-0000000Eymx-3ENg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:42:22 +0000
Received: by chaosmail.tech (Postfix) id DEA251C8DA7;
	Thu, 10 Sep 2026 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1789058533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kQkb6gWom8B8sf7tnCB4kepo3gvA1Kc1t11RUjin2x4=;
	b=NWqSmn84480UeJF9J6RCN9GKGbS33Grcs27E+i19Kw1VbjZtWRQEi1wSOX5Y/huA0s8Blf
	z8deKig/ajq2YwDrBfCFMI/NG5/+bOLbz+BwNamVzoFScZB9l/f2eXdN5ejik0T9tUHgwT
	wGoDvCUvXLS3aoh3+EFh/of4iBcpr24=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v7 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Thu, 10 Sep 2026 18:42:06 +0200
Message-Id: <20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PQW7DIBAF0KtErEsFDAMmq96jygLDUFO1cWQcq
 1XkuxenixLVyy/m/RlurNCUqbDj4cYmWnLJ47kG+3RgYfDnN+I51syUUEZYhXzOl8h9IODCiT6
 hFZTQsTp/mSjlr3vX6+k3l2v/TmHeCraJIZd5nL7vyxa5ze31LpILbqG+RDASOv9SLxnLp88fz
 zOFgW3li2q5bbmqXIJGh7aPBnCXwx/vhGx5/RjvAFRSFLxOYZfrlpuW6+141yH2EoWTepdjw9X
 DdqwclNYUoY8B0i43LX/YbionJ10C5x149Y+v6/oDBOIR8vQBAAA=
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789058532; l=2883;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=eORlhWAwiRfJuTnuq0ulVuM+TiRnVArI9BkOr1FpWOg=;
 b=2LzfSqo02MCBOz0gkLaY17VVxskwg1QQyN/q26jTLpgnzGtzxlwXRbkt9dnWiPwicudjM16cD
 XSqz99084LIB/X+2Cq0ISLj32Wj/QTksz6ZIBr78378mYW6L0JMm4tw
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_094221_301795_4AE5762C 
X-CRM114-Status: GOOD (  11.00  )
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: bbed88f72dbbb960080282de3b90ca0933fa6226
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


