Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C29EC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MA43Yy5/+z1blpg6olERItA168PY/1u0xfecuYv6VAc=; b=V7OJNoQxRSEfwHYa9+WUNfWKb+
	vXZRvcqd2e0gvE0EPoWQH7JID7g0lCfSBAmFjaUKA5fjB1pnEoLbcM0QOcCredYRx9fXrySRTKKWh
	V+EVfHqSc2dNW4pFM9srEEvowg2jKmKf1KDT4WYlWotmPLD60yBhpQdfTpem2CJbfalm7UcSxLzfC
	SxbwG8i17nvi8Zuvhmj0obfovnrtiVfc9oAn/K+/wB1Ufv2hkUWQSpsJRdrnVCQ7catZUfozalgbV
	YxURPmr8wxJ3RAAg+04MBYAxAeKjUF3EwTckWMag5QymX+trVm/TILP+oe5/T5P+zbawLEPtL5ba0
	y8CUlAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erO-0000000ET8x-1bJF;
	Thu, 10 Sep 2026 13:30:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erC-0000000ET04-2cLM;
	Thu, 10 Sep 2026 13:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF01A6022D;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 583CBC2BCC7;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789047025;
	bh=4N1efCu5ZtlV4h/A83Fgt8jcju0DFf1l13o1JN2/L8Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R2jhBx23vSV3/J/q7bgjVRtPHgFfQ7RkGzaKNEoMKcaQVCRA7eW3H26avUrvaaVaD
	 uhCt/uMPI3lzBecNKQd35qChxVSUR5y1H8hVayF2pTwuM4P/d+yt6iJgRwe//OgjOt
	 w0S2/0MURQlp3Zw0bIs4R+l4aoa5VnxEhDp+6j4lhsijAsCQfc+ueaM+QWCruSG2E5
	 QqR//rxds/WIfjRqkDaCMyRj3ELeux8sNoRgv9MKNND5aNB04mLKEMIlJkhaxTkowg
	 wQ+4mP9hsCz8t7xZzqJNe+s5qpMqAM+L3z0dF1zuRcMh4hWFyEgjIO7SZXWLVbZOrB
	 cAxiukj8gskaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A172C79FBF;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Subject: [PATCH v5 0/4] ARM: Basic support for Amazon ford tablet (MT8127)
Date: Thu, 10 Sep 2026 15:29:11 +0200
Message-Id: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43N3WoDIRCG4VsJHtegs6uuPcp9lB6MOiZCdw26L
 GnC3ntMSukPNPTw/WCeubBKJVFlz5sLK7SkmvLUQj1tmD/gtCeeQmsGArTQUvNxHiQYjiOe88R
 jLoE7rMlzqYQNRiiIhlg7PxaK6XSnX15bH1Kdc3m/f1rkbf1Ezd/oIrngQQAGqdB3yu6OJc952
 o7EbugC/4WgQXpQlsCSARx+Q90XZMXwAOoaFH2vXZROewe7EdOby6dtLvsPqv9O2QdU3yiyGJX
 vQaCTP6l1Xa8+oKtznwEAAA==
X-Change-ID: 20260616-mt8127-amazon-ford-basic-1509d7052f7e
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789047024; l=1949;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=4N1efCu5ZtlV4h/A83Fgt8jcju0DFf1l13o1JN2/L8Y=;
 b=Fh5JXea12ls0o+Uis/B94T8muFwAgqfQepvZ/GXnF1UlWZSgbywDDwWXl6VlUxnD4Ci7N8orM
 FUSxVd4UqyBBjWfrYRPtoej32dt1Lz7Ws5hjdnXefgjZOtQu7hCWez0
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series of patches adds basic support for MT8127 SoC based Amazon ford
tablet.

Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
Changes in v5:
- Fix model value in dts.
- Fix missing space in watchdog's compatible in dtsi.
- Link to v4: https://patch.msgid.link/20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org

Changes in v4:
- Add chassis-type property to dts.
- Add missing #address-cells, #size-cells and ranges properties to dts
  (sashiko report).
- Link to v3: https://patch.msgid.link/20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org

Changes in v3:
- Rebase onto v7.3-rc1.
- Drop [PATCH v2 3/5] as it was superseded by upstream changes.
- Link to v2: https://lore.kernel.org/r/20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me

Changes in v2:
- Move amazon ford compatible string to existing enum.
- Fix watchdog node not sorted in unit address ascending order (sashiko report).
- Move bindings documentation patches before patches implementing the bindings.
- Link to v1: https://lore.kernel.org/r/20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me

---
Zakariya Hadrami (4):
      dt-bindings: watchdog: mediatek: Add MT8127
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board

 .../devicetree/bindings/arm/mediatek.yaml          |  1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |  1 +
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts  | 54 ++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |  7 +++
 5 files changed, 64 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260616-mt8127-amazon-ford-basic-1509d7052f7e

Best regards,
--  
Zakariya Hadrami <zkh@mailbox.org>



