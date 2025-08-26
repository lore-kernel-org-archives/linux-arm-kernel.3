Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DB4CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmNYXzb8/DDy9mVC5KWS7OwwA+q2tx/MnG+z9udMRGw=; b=4B5/W482915VXN
	0P4xQNEavDNKvcoH/hY/MlL2JdCyilhjr9j6oXj+wqz268UJXkGf03zB/blvP7OFoBW7yeQ+VMEBM
	fzEMVdEDM4KVIbdvlHODtJUI/ECxi6TuTSLsacMckvc5VcwVbpy+AeLEWakCfL1wwyoi6/7DGogx0
	R65zIE7T88mujliaqTSy+jSj71tvxvVxhi7LcwgmXu3W25nYHqGcAFOc9u3W0Aa8zbYncJmVevGGQ
	qr3qrRutqlBGsMXHHs0zRvR9T3QBoLmeDngFAWwZM2aS9oCGQjG2MF2dbJIZJLR/cQMSwtXZ70OMY
	7s1FiLkxXmj31Zp8bGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqufn-0000000CGg5-2V9B;
	Tue, 26 Aug 2025 14:29:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquFI-0000000CBaL-0Psb;
	Tue, 26 Aug 2025 14:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216914;
	bh=QSwZwlauNJhLnv67cXc1P1WfebF0M6T+dK0F4Qjpt7o=;
	h=From:Subject:Date:To:Cc:From;
	b=ay+vpxBbFjwyWssKYyrA5ZtEkmCQBG9gG041eMidGHduCgWD/IgCjKUSsHX27TvxO
	 UegeJPR3aBd4WxtDv7NQz8bessr+E4BawfRRgd+f2mcJAVJf1gcYg9iwMA4zLPvyu8
	 yiC2TopvL3GJjlznD/ZMs/+ZuAg5QGbFAPTF4S+P0zb3vEF2k5chs5VPBbv/JbXnaI
	 HqvHoEUFoYIh7WmndyG1j/e25dRLUjr0JzglmmJYYJrLT8qh/4hfKO+GCB78cFDvPM
	 WKGy8W/EleKml6769jYyrYeiBk5wmm2b8c2C5wqYLwtRP3PdY05GESYo2QbaTvaKHc
	 YOrDiSQgqasFw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9976C17E046C;
	Tue, 26 Aug 2025 16:01:53 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Tue, 26 Aug 2025 16:01:51 +0200
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC+rWgC/32NQQqDMBBFryKz7pTJaCB01XsUF2kSdcAaSUqwi
 Hdv6gG6++/Df3+HHJKEDLdmhxSKZIlLBb404Ca7jAHFVwYm1mRIYbJ+s7hIRMU447jWpLuByTj
 WbdtCXa4pDLKd1kdfeZL8julznhT1a//7ikJCT6ajwWjPztxdnGf7jMleXXxBfxzHF3tF1Fi6A
 AAA
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
X-CRM114-CacheID: sfid-20250826_070156_287534_2B72364E 
X-CRM114-Status: UNSURE (   9.84  )
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

This patchset adds support for the GPIO-connected red and blue LEDs,
as well as the various hardware buttons present on the Radxa NIO 12L
board.

It also includes a fix for the missing release (key-up) interrupt
handling for PMIC-managed GPIO keys.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
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

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 67 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


