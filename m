Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CAEF532C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysKeGPLGoMvsSOdA2nFLi64P47/oXrE6wLV5RO4cccg=; b=T0Uquqr5vLDrTm
	OdniUglPZr6GEkUE6C3y2wI72feKleTEjxKfvtL4AWbbF+aX7DX9X2B64EF5XrYbPk6bh0ZbP88DX
	2oGB50mQB/+MrEc3pbIFqRAS+ClAT/g69DNN4Xt4nMnUot3NyahtFKd8PLt7zhSjYlIXNj3jbVBfK
	rMFNxL/Nr48isFlfGiUO6fggfuOrWeyMR4KOH01bY7seGCTpk77VbCvkNpyXVAX0+ANvY+Cre+v9g
	ePUDEW4paqlRpzHTpfc6lFyL8WH+/cAmbpVj7gkChkxreemVzIMyPDcvg9ht6IRSH/A88DpxFvVtU
	47yNAA6yuygAi9VuEF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4r2y-00000000MKm-27f4;
	Tue, 24 Mar 2026 01:59:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4r2x-00000000MJT-0bon
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 01:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ysKeGPLGoMvsSOdA2nFLi64P47/oXrE6wLV5RO4cccg=; b=ZTVDiyGRFjC+B/qmg0fNyAZ/ih
	uitMaGpCBfT7b8g2Ed4iy19S2hGrsv3FoNN4chOq2tub5vgpvKq1J+p4S8xZYB455sr90w8awW//T
	KI9keaUL8kn1eNo519qzs0cse2Ls/QCZulMdf/xYftsOM7lgri0Z+D7044DluQC9nwnA3El+Pse/S
	recrudVsAnyUR41HrJRGIcPK154SZEY9MdCxg5P/QR6YzrPnw7/cW3v1KMWNPwMWrmsFzW7PDfTEH
	mTpogTEhJGt7XK+Duci3MxKC2xKaHs3TMJTgU68PqhiAfq9623UmahzfCAATtdrTIdyYT0gpSyH+7
	clR2Zbtw==;
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4r2t-0000000DDpP-1SM1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:59:05 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Mar
 2026 09:58:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 09:58:50 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v4 0/2] Add AST2700 support for aspeed sdhci
Date: Tue, 24 Mar 2026 09:58:48 +0800
Message-ID: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjvwWkC/22NQQ6CMBBFr0K6tqbTQqGuvIdxQdupdCGQljQaw
 t0tJBqiLt9k3vsziRg8RnIqZhIw+eiHPkN5KIjp2v6G1NvMhDMumQBBo+2Mp1wqK0A5qy2S/Ds
 GdP6xdS7XzJ2P0xCeWzbBev0uJKCMKjDYgjJNK+tzG0dEO6Hpjma4kzWT+F6t3yrPqlAaHJOCS
 dB/VbFT+WdVrKuiqirdOFkC/KjLsrwAX3pCLBUBAAA=
X-Change-ID: 20260313-sdhci-269d319fdbde
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Andrew Jeffery <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774317530; l=1402;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=s+I5YSEbSEp+9lLyO9dsRxjOmbpDSxZpMfJMlwzBGoc=;
 b=a7xnHWdVNI/krXJBx3hH11kYaVE8muKYxv6Wf3hCjTob81jwypfIeCC2h4DsAuZZvkHziOWLU
 Efiylyt6Vn8AmJChl8js8qr093Quify2cGDRzgJ3gCdQC5E6qgICd7V
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_015903_403727_85977717 
X-CRM114-Status: UNSURE (   8.12  )
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

This series add aspeed sdhci support for AST2700. The AST2700 sdhci
requires an reset. This series updates the binding and driver to
support reset requirements.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v4:
- 2/2 rebase git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
  next branch fix the conflit.
- Link to v3: https://lore.kernel.org/r/20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com

Changes in v3:
- 1/2 Add items list const for ast2700 ast2600 compatible
- 1/2 Move if/then/else block after required: (per example-schema)
- Link to v2: https://lore.kernel.org/r/20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com

Changes in v2:
- 1/2 use items for ast2700 compatible.
- 2/2 use devm_reset_control_get_optional_exclusive_deasserted for
  reset.
- Link to v1: https://lore.kernel.org/r/20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com

---
Ryan Chen (2):
      dt-bindings: mmc: sdhci-of-aspeed: Add AST2700 compatible
      mmc: sdhci-of-aspeed: Handle optional controller reset

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml      | 41 +++++++++++++++++-----
 drivers/mmc/host/sdhci-of-aspeed.c                 |  6 ++++
 2 files changed, 39 insertions(+), 8 deletions(-)
---
base-commit: 50d349cb70cdb6db352dec114e6381a31870b4ff
change-id: 20260313-sdhci-269d319fdbde

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


