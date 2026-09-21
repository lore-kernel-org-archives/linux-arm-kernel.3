Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB3DC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uth8jLMrDUKVI4QHhA4nMI/zotKp/neJmBPWyc9p9/I=; b=CViueU72BU5UjvvnD8oZIcMDXZ
	86g8uHpFG4X6pev9DACRUMbCLtCj2Ky7Ukfi4P0FRX9jjMQDv0SxVJ7cJPGWkiPWlAbTW+l1Obdpl
	FSv1ZCjKKIjfjMa0fKo+EiJo5SbNC32PR5Nc6XwITj+a4W/d2yQxVUc9tRp7o321NJO/tkIzKXaPv
	SGYJPSqAoiGXIvHXwxovGINP3mOvuHdSN4Oc0yBGGHDWWZkDB1EME2hEScjBDJdatlLyKSPqphyhS
	c4p50YUnMNukOgPOegme43BLEn17HyaodClZdsIH7er/p2Q3K7cI200A4WQV2gacRi6aQ1/TgRWFd
	jCgdNtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YnH-00000001G68-2Ylb;
	Mon, 21 Sep 2026 07:50:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YnF-00000001G4w-14dy;
	Mon, 21 Sep 2026 07:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F3E43254;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 787C5C2BCFA;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789977028;
	bh=MN6wjM73jwFJE0BBGgrZ2DP1kz/GNI2gsTbQ6k5QYKg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jy0egReD+8CgpgGNZcEoGc6MnHzSrqY8YQvM5daE5jPaDbqZmre0CW3f7cO4LhJvA
	 6T7lAAfhYUC7Hq1FthIqk4rzdNhD6NT+UN+ybSJ4rT/K11YxTl6IECBYpPsqVcCcgL
	 mBpMw80R97EGB8864NkCzza4eu35YRT7pYvEV+cz8FR+qN7UEVdlK6R45vbMpk93f0
	 to8f2tl1Gown9Ln3k7cq6EhyDDwAjqwmRN88M1eRJkCkQVrQZtPI4frtjXzyHJ7TYm
	 xRJ6VF0cWNBoL6Upj2PzVnVKwOsA+BBubhl/GLPvWNmomHSBSHDRV/mkrc1QaGlKSA
	 HXN15hfdQJbZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E78C982ED;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v5 0/3] nvmem: add support for the MediaTek mt6323 PMIC
Date: Mon, 21 Sep 2026 10:50:01 +0300
Message-Id: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwW7DIAwG4FepOI8KbCDKTnuPaQdCzEpVQgUZa
 lXl3Ue6Q6u2O/7S78/2hRXKgQp731xYphpKSFML+m3D3M5O38TD2DIDAUYYKXmcDQLyqUaKXDi
 trPDgbe9ZGzlm8uF05T6//nL5Gfbk5tVYG7tQ5pTP131Vrr1/6Cq54IMmOfSOtPTwccxpTlO04
 bB1KbLVr3AvdA8CNEF5FITGtivVSwFvQifxQcAmgNAOezCdhdeCugn90xeqCQbMOMpOoxzdk7A
 syy9+Vg4WhQEAAA==
X-Change-ID: 20260611-mt6323-nvmem-0c54a0f2fa9f
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789977026; l=2403;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=MN6wjM73jwFJE0BBGgrZ2DP1kz/GNI2gsTbQ6k5QYKg=;
 b=WfuNkR0MZFTaJPn5Cgdqk4A6l9M4n4AssM/47amKmWilCckA8bhc+0ZqCnazyL3HtApVK61Vh
 bJCgtxCUZ28Abj0eGsH68mAgfNWjTroT7j4ofNoF8QSt1nNO8OXiuad
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

This series adds support for the EFUSE found on the MediaTek mt6323 PMIC.

Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
mt6323.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>

---
Changes in v5:
- Reorder Makefile entries
- Use mt6323_regulators driver pattern for regmap instead of dev->parent->parent
- Link to v4: https://patch.msgid.link/20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com

Changes in v4:
- Rebase onto nvmem/for-next (8f596c13b6b7 ("dt-bindings: nvmem: qfprom: Add compatible for Qualcomm Maili"))
- Drop device-id/of.h header (Andy)
- Mediatek -> MediaTek in Kconfig
- Link to v3: https://patch.msgid.link/20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com

Changes in v3:
- Rebase onto next-20260708
- EFUSE driver: Replace 'mod_devicetable.h' with explicit 'device-id/of.h'
- Drop MFD patch since it's applied
- Link to v2: https://patch.msgid.link/20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com

Changes in v2:
- EFUSE driver: Sort variables in the mt6323_efuse_read (Andy)
- Link to v1: https://patch.msgid.link/20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com

Changes after split:
- EFUSE driver:
    - Remove 'linux/errno.h' header (Andy)
    - Remove explicit cast to u16 in the 'mt6323_efuse_read' (Andy)
    - Reword comment in the 'mt6323_efuse_read'
    - Capitalize MediaTek in the module description
- Link to a previous series: https://patch.msgid.link/20260512-mt6323-v2-0-3efcba579e88@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      nvmem: add mt6323 PMIC EFUSE driver
      ARM: dts: mediatek: mt6323: add EFUSE support

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 21 ++++++
 MAINTAINERS                                        |  5 ++
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |  4 ++
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/mt6323-efuse.c                       | 83 ++++++++++++++++++++++
 6 files changed, 126 insertions(+)
---
base-commit: 8f596c13b6b7fa9fa35091273c37f9b6e3fc2d0f
change-id: 20260611-mt6323-nvmem-0c54a0f2fa9f

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



