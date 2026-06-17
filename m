Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B3CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXfOBh8NR/db5ms+ajokLKcgX2kw6Gqbq9cimOG23bE=; b=tAKSRTEcSV+KZCAb6UvF51Kd4u
	2YeZyuSGbDU+c7h2Oydz/umWtq+GXQt9++tEHolN98R4fi/Gx378baUCjzt2+iUwccXP+Ckvi3wlJ
	LVK6L7vcuuUC278b5enmnuOOXUahtLUZ1fj9LcABI+aHzSHRLen/TbtM0z38RdDFwXKTviF6f00pG
	4F9Z7fLfA7Q35zSY2h6uXMhOYNWkN/VznFU43pXo5bCr3Pi8PDB5rYcojML0qpJgr5BX613nk5a6x
	W0VD5cRTp33Jrt18coTMGnMd3/6Qvb6+IiC35hhGFsCuWRNVhER1TdEShJFiTjUvhPNpI4R/Eeonz
	wSAViNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfty-0000000GUqw-2YM0;
	Wed, 17 Jun 2026 02:21:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftx-0000000GUq0-12Yq;
	Wed, 17 Jun 2026 02:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D46D600BB;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAECCC2BCB7;
	Wed, 17 Jun 2026 02:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781662872;
	bh=GFQoPV3WSoQdmzXdEnr9RQpM8gwotYzPgFgNyL8Njlg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BaQK9fZaFmJE2OjjOLm4+VByg39mrYEs9yyoCTwXXKrbqZBKw/f5hBSlAEFnoVMdr
	 HOx7IIDn8jm50JpLoezW6Sj3pGuP6dEWIfDcIJB2I+ujhOZBN7a9ttYMnWnLfQcwi7
	 IAGAp/hhXLi4gQaQPadZFaxazwdPM5Hxfao3BOGe2Fv0jC8QJnTW3JLbhUUfq+OecU
	 tNBor4x9TDdTDNniND7ADg3BdHhuxAB9wE1upAYehIaKFp2gwJWVxfMUBJpmuBlfNX
	 oN+BJkeS1vi6Ji1OPXg4Q8GkHPm/szadrg3b2YNgANJ2VwenqjNAkkPzdENHNWwmvQ
	 uhg8zUDq6NB2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A7DCD98F0;
	Wed, 17 Jun 2026 02:21:11 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Subject: [PATCH 0/5] ARM: Basic support for Amazon ford tablet (MT8127)
Date: Wed, 17 Jun 2026 11:20:09 +0900
Message-Id: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQIa2uEi0sx5pFGhoRRXdPW
 r7F/w9kSkwZ+uqBRCdnjqFA1hXMqw0LIbtiUEJpoaXG7WilMmg3e8eAPiaHk808o2xE54xolDc
 EJd8Teb7+9TC+7wekhZpNagAAAA==
X-Change-ID: 20260616-mt8127-amazon-ford-basic-1509d7052f7e
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781662870; l=1062;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=GFQoPV3WSoQdmzXdEnr9RQpM8gwotYzPgFgNyL8Njlg=;
 b=Lnn0C+XMaDV70G3zD+InDGE4e36gL4nUCacmUuRTqeWQ759q9hdycCmbbi/Bn4/ihasRdRfq/
 H/uL66rDQj8D8WO1ljPLaBjdd5oU40qoLdSsUmCuPD1JLcNh22QZ0zf
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series of patches adds basic support for MT8127 SoC based Amazon ford
tablet and fixes a small indentation error in the dtsi file.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
Zakariya Hadrami (5):
      ARM: dts: mediatek: mt8127: Fix indentation error
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      dt-bindings: watchdog: mediatek: Add MT8127

 .../devicetree/bindings/arm/mediatek.yaml          |  4 ++
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |  1 +
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts  | 46 ++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |  9 ++++-
 5 files changed, 60 insertions(+), 1 deletion(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260616-mt8127-amazon-ford-basic-1509d7052f7e

Best regards,
-- 
Zakariya Hadrami <zkh1@proton.me>



