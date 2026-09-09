Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F77EC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HXZNtQEXxXivLDZuDsoOJhopUImeLEuwQx8qhYkImJ8=; b=s3EY6DH6ftoIRxjqJMIbbHRwmu
	MnBsH/1dQ/s3Np/qYf1FomLovbAF1tEwiaQx9APIB+9awjel8InKDqpXJOdiJVtAF+tv2+UyoL9zd
	nm43RZMkb2rMTovMSQOu0HfzP2vCt0adEK6uqeU1JrYNtkCht/jDR1hK0+L+XaVHtUVBv36uxxlFM
	pmHBTHsU8sOL+n6h2SKxTcOKdY7aEz2WWlSv2ghukEJ8BtEtC0BHtjEtpVroi+q201FSvhvIySUII
	XiM3jZs5jB2RtXmfS/aOvUbhmsMO6J5Caca7DwCbdI38KIkE+vMjGfmsUzrlsvfLyzU94MY6bBG5a
	3MhPRe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7Z-0000000CjQb-0Q6j;
	Wed, 09 Sep 2026 19:38:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7X-0000000CjOD-47vv;
	Wed, 09 Sep 2026 19:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19647600CB;
	Wed,  9 Sep 2026 19:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF663C2BCB9;
	Wed,  9 Sep 2026 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788982690;
	bh=pMj4eriQj048JYuAolqQ2BmBgq01CBfNFGOisnU/HrM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bMOR8lLpHtD7HbSdu4VWkfPOifZVJaBYHtj0/9TGge4QdaIJzMlDSQAE27UF/gKhC
	 MYE6346OghNVaX7cnp0bOooaz31/oUAIEk7wb2YBQF4LN8HaR1BuZb/5+PGxljEilZ
	 SZhnRNTet9UJrP4HNFcReB9YzlK2dPSoXu0ChjCumbzP4oKV4uLfvmDznIwqoZLL+u
	 K2rCfReIOQjYo204e6ttTiMXS/wVfO3OO/7WBxmWopZPDW/YTjv6JYGzd0NZL9ydzL
	 NURGQ4gt3mbjXSonTzamY5ryC91f/fPdVug/WVsGfHqRcIJxcVtE+eh9TMFEvQJH75
	 B0KPxZIomzeLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C68C79FB9;
	Wed,  9 Sep 2026 19:38:10 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Subject: [PATCH v4 0/4] ARM: Basic support for Amazon ford tablet (MT8127)
Date: Wed, 09 Sep 2026 21:37:59 +0200
Message-Id: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NywrCMBCF4VeRrI0kU5M0rnwPcZHLRAO2KUkpX
 ui7GwURBMXlf2C+uZGCOWIhm8WNZJxiiamvsV4uiDua/oA0+toEGEgmuaTd2HJQ1HTmmnoaUvb
 UmhId5YJpr5iAoJDU8yFjiOcnvdvXPsYypnx5fpr4Y32h6js6ccqoZ2A8F8Y1Qm+HnMbUrzokD
 3SCfyGokGyFRtCowLSfUPOGNGt/QE2FgltLG7iVzsK2M/Fk03mV8oHs53m+AwTj+CVUAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788982689; l=1745;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=pMj4eriQj048JYuAolqQ2BmBgq01CBfNFGOisnU/HrM=;
 b=3djYBaIYQoGZVRB5rjyMwbmJ3dsc+RI9A249z9PnHsJX2afhiZVx+YvyFZDoDdV5s4f0wekqe
 A6b+mtA2iwcAJdmhGNUWaZvDRibAwbWEcbKVqkshp9vHmgYwVxiA9wL
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



