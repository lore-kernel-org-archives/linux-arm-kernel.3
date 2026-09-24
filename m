Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605C5C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rAy/Ib71cxCFjOBwLWXyeNvTMAtqNfN/PxSqBk6dpA=; b=2NRRC7GbGpNo08Vt4eAm0VyE/l
	k13/SLqn/rLmq/3KBY+4e5CFQYvG2xkQM+oIsLmSCeM0TGOlnFuiZpOomlH+ZQsRxzGn/mLk6D/kn
	+CsgDKXiYaYUMDL9j0PSAsucmLx3deANNnSNCCl29gfRIl0Nf5SAFlr5NqD4UntOJ4SXqw1H9Btik
	PaMQad/FfB10kzC/DjpHtJHkCr6b7SeBM+m+/W0j/R0uF+rpSk+muZoA0xpsphj4Ui/XNbifHt7U0
	Wt3njkZPHSheyt573Emc1MVHiOWOzpQLylMqgavgUD3dehUuadE+gqxqn2Mbs9w5Ply1zoDv6JTjR
	LPaJ/v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fvB-0000000AbGy-2ZMR;
	Thu, 24 Sep 2026 09:39:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fv9-0000000AbFY-3fZr;
	Thu, 24 Sep 2026 09:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4C61432EF;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE73CC2BCB3;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=BItCEenS77Babwk7FdI0aiZat5GdjxabdmfKPHmohbg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gUUy54yiht6ovJrErNoshPUnWLJuCPHrChQp8tD0Jtuxm+TF94sST2UkjztHgHlT/
	 yatGpH+5gHuesiQhUbuFETr9bKiCJzuLOLON+3ljLp4WNMDZK5XPdl+qS5wSw1xqQY
	 FSHlkulEORw8+zs/qBLNgE1+kCS27jbTEcg3BJYuwZgvhK7ZemedhbW4tu+OQSaiYh
	 EEQnj8Uh8zdnGIX/y3soLmO+FI6aCqiW/dW7sCz2rvhxPZ+DCkCJk9Iy9fDy5zXX5D
	 7Pnf8xLsXM7KEImT2OLkkYsBaU1uM9m882IEs7JDlqN1ss+O430lhe/uh6QtlI7LJs
	 po1A2mnxc483A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F931C98314;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Thu, 24 Sep 2026 12:38:29 +0300
Message-Id: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNTQ7CIBgFr9KwFgO09MeV9zAuKHxYjC0NVNQ0v
 btQY1LjcpI382bkwRnw6JDNyEEw3tghQr7LkOzEcAFsVGTECCtJRRkuecXw+HBixIVsKC9zqRX
 LURRGB9o819jp/GF/b68gp1RIi874ybrX+hZo2n3DxTYcKCZY1cBF3khdgT6Ozk526IW57aXtU
 aoHtvX5j8+i34KgqiZU1rT985dleQN/f1yA+wAAAA==
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=1470;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=BItCEenS77Babwk7FdI0aiZat5GdjxabdmfKPHmohbg=;
 b=85oFbEvDe4vV3r2mPSajBfrNLyAj50bzIGY1b8+RbttbVD/f6eiu+iE1y0q+6FnzcFCPNS4m+
 oD9+GRbzwhyA3/LofjXlns7Jkb/khAkoVRPQpUAH8TZNenSkCn4j7Yc
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v3:
- Pick up Krzysztof's tag
- No other changes, resend
- Link to v2: https://patch.msgid.link/20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com

Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



