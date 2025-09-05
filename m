Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s1+ZRgZ8NFWXGjG74F/7TbrdsNHWGEdENKKfbf9kS00=; b=WZcymmuxuPVLF9
	TYm0Qetu5DBLNRnfqmUMMwRWpHY0HBcugS5hWuJogqcBdEuvibHj9pDQNu1HO0b3MlORmxNG1WaZF
	wRv7t82rrQm1F7AaQGQq0P6DHnCI0QreG40S80HtDACmFZaCuq/XelN3BeaIw6ajOjek/7p6HOTIV
	rwqLH/4ZyWj8WLY3bGgRgpewqScZpfKOLVUjgVYLIyBDK6MLnAjus/XS+QxHQ9X5UHa2WBKB/A26I
	Ih6QDRVwhhaA8J1r3ULX//wVR0ModPQcVwzrgwveV+flOKq4cLTwy7O0uNid6GBxUB9BnpidnUynV
	5jIuQB32wc+rbNBaPXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEs-00000002hQD-2MaD;
	Fri, 05 Sep 2025 15:20:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUzA-00000001UiC-1kZg;
	Fri, 05 Sep 2025 11:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757073124;
	bh=dST/8xVStC32ekP6gB7vITv41T5xV6Hei4eA5fX+3yk=;
	h=From:Subject:Date:To:Cc:From;
	b=KoNu/PZBVwQxyJw4U588Dtr1MZVIUtmtJ0zC3OZg2rcIFGvpNpdECWp7wcJgYpP9k
	 e2Pd8w1XmR//tjpTp+D8wHXDsB/ox+1DfSB1VJm01fgXWxdS30Cfaz7SXIZcjoU8/a
	 dlD3vb/uPlMB+pL0/eFx5ocaDodu0Z0VzRR4jOC8a7J76x62xAC220tmVssnkqC4NE
	 UwAgInY549BINS5QjwXywrc7GdGqkCXrHBSNhCXR64TofvGvpwqHA2loICcu1K2RDQ
	 YMYb2rOxGmHqECW3b7bKlno5gKINxEBOp0o/6rRaFBa8BM434PCAQTeY6lpSse2Osl
	 9Egf+jiNiGQaA==
Received: from localhost-live.home (2a01cb0892F2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25A8417E0100;
	Fri,  5 Sep 2025 13:52:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Fri, 05 Sep 2025 13:51:57 +0200
Message-Id: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3OumgC/33NSwrCMBCA4auUrB1JJo0GV95DXKR5tIHalERCp
 eTupl0Jirv5B+ablSQbvU3k0qwk2uyTD1MNfmiIHtTUW/CmNkGKgkrKICqzKJh8AIYwQj/XSbQ
 OqdQoOOekXs7ROr/s6u1ee/DpGeJrf5LZtv3vZQYUDJUtdVIY1PKqwziqLkR11OFBNjPjh4On3
 w5W5+yYdIq7zn07pZQ3mAz0zwIBAAA=
X-Change-ID: 20250801-radxa-nio-12-l-gpio-54f208c25333
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045208_615120_BF09764E 
X-CRM114-Status: GOOD (  10.38  )
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

This patchset adds support for the GPIO-connected red and blue LEDs,
as well as the various hardware buttons present on the Radxa NIO 12L
board.

It also includes a fix for the missing release (key-up) interrupt
handling for PMIC-managed GPIO keys.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v3:
Patch 3/3: drop the deprecated LEDs label property
- Link to v2: https://lore.kernel.org/r/20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com

Changes in v2:
PATCH 1/3
- Add Fixes tag
- Drop Angelo's Reviewed-By since I'm now introducing the
'key_release_irq' member that was missing in v1.
- Link to v1: https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com

---
Julien Massot (3):
      Input: mtk-pmic-keys - MT6359 has a specific release irq
      arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
      arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 65 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


