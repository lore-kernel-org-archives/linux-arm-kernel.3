Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79336C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jse+VYQ8TYxb1XPAXBCrKBajEh45PLS4tiiV1Reziyc=; b=JF13Y6tjZetJrrUmjjwX1Q9c8f
	241DpzQurGtBCaMutsXFEqFf13S/YmxfGx0VTrriLOIN2HcMU4mf/4dSOTO/Rte5oscKGlL3gb2zU
	xoRdRMlBnLLNbR1o0ebADcLzmpYb5KUFB+BSQ8vgm+ci7M+xJRUGMHr0Bmxaltr7MtHu6aHyX8Xu6
	NB49qL6qSGCUzuYq/Zy12ikYPorfqyWHcrgQmSEVypo9doEyN8QkuJ0t6yQeRGHgfPIBOlM9FMl2X
	683CSpWWYFr4vfccUMSeINKGX9y8h+KiJLdsZiG9es/h6hFwtLonFyO5+0FuZ4yOhD0lTh/xsY7Fc
	Y4zkMVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qz-0000000AM1w-3npn;
	Tue, 08 Sep 2026 21:59:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qq-0000000ALva-3fii;
	Tue, 08 Sep 2026 21:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76D3A601F7;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0383BC2BCB8;
	Tue,  8 Sep 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788904774;
	bh=KnsYHCmJhO3Vb0bLFDF1cM26DZtWJ5D4q1xH4ulpGn0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QOL02IlnfHWD7jGXeQEASELSMujAXpwiJTTHcP/DqM0fI60llhoUXT1+upwn5Ky2P
	 tXa92RBQlknBdonNcJuqva+Y2QK/HyzRk80D6/0wXmbPU/MYNr7B95TySsAdl8FVPv
	 oFvOnA9j29ysAN4eVMwTuMHwz2iuouU68whdPedRKtDf0La/vGG9ct0qq9BqlD6LrD
	 N0iPyeFhaXrZVQia1QKpRCDR651QBhpSEwe1MPRxiIAjQCy3aYUNYv+styFw6SjsdL
	 aiys/iiJJGHu/GnuqZ/SQXTxI92XYGSk1naAoDtCdSaH5m2Ri17kVQg/2fGXN+KKlk
	 gpBLzuwbsySKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A2DC79F99;
	Tue,  8 Sep 2026 21:59:33 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Subject: [PATCH v3 0/4] ARM: Basic support for Amazon ford tablet (MT8127)
Date: Tue, 08 Sep 2026 23:59:13 +0200
Message-Id: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQrCMBCF4auUrB1JpiRpXHkPcRGbqc2iTUlKU
 EvvbloQ3Agu/wfzzcISRU+JnaqFRco++TCWqA8Va3s73gm8K82Qo+JKKBjmRqAGO9hXGKEL0cH
 NJt+CkNw4zSV2mlg5nyJ1/rHTl2vp3qc5xOf+KYtt/aD6N5oFcHAcrRPStrU05ymGOYzHgdiGZ
 vwXwgKpRhpCQxpt8w2t6/oGHgY0NwkBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788904772; l=1494;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=KnsYHCmJhO3Vb0bLFDF1cM26DZtWJ5D4q1xH4ulpGn0=;
 b=wrrDEg/RMfwoGw7IQo/YXTUhAqbjbcfqBFbr/zOT7u3RChwi/3PRQxILrH055zw5uAUdY7mjA
 ZbasiXzxO5KDxEJ9qYEoQv2vVcwiE+MWi0qA5TCLd+qeeCBsqQkbRV0
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
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts  | 46 ++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |  7 ++++
 5 files changed, 56 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260616-mt8127-amazon-ford-basic-1509d7052f7e

Best regards,
--  
Zakariya Hadrami <zkh@mailbox.org>



