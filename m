Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9402C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=064EnW6wRsuwC06D16WrR/6NcuvmzEHImkz3kDIRc2g=; b=oqJVsGEZ0CCho3+BgHFpAo8hVs
	WliOKL6hotYmEQjPNgP4R3XjN+gmMPcag+oeKKWfmW+VbKFZfdWwY+5364TLG+65pG67P5dOaiMzU
	MHNyxNI5P7nuK3DyN2kew1JAjVwk+xe/nfNJCQlPO5HszCC1d5VwBXVYJ5lllUVohBF9jK5QBPa7/
	T/VWMvO3AfuaGN6h9uWcxW4YoPn88AeKLSo6BXozCGZ7MqgQPa9T/dANbOiE13qkp6ThipcBx+7Mt
	5c7FYMdLZpPWg3hTmg7xcYOyVDeZzgHEhHjRCVnMmJVnA2B2i9c+fLfDwywwuqT6iMOUFoohQfBkV
	cTkfzH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivlG-0000000Abo9-3dSj;
	Mon, 04 Aug 2025 14:01:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivIs-0000000AXk7-0E81;
	Mon, 04 Aug 2025 13:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754314356;
	bh=apsk0n9LP0pfN4KmEcA5GNt1BPZ+Gwl5lIX8tFwQFk4=;
	h=From:To:Cc:Subject:Date:From;
	b=pl0Ry/jvdhKA/z/wi+zcPJ7W8w6g3k+avsURYBivl533nXCMujcmRiHWBJRpCxrh7
	 MqLonjRjl9oGgI4Oa0/Ers4XMlLAAf06hkL8CfVnt1l1XM1KGNCBFiDCONMSzguAoz
	 JnZ6NrAmMNR8Ci+DsAGwPzfqeSjqj6FUFirqOOFULtQKCZx7Ps76k0MBmAiCZpgd4Y
	 U2QTMPcLKHKP5hBCWeifawBtbBT2R2xRpED14vYao4zL7yQXZF+9S76zms9AZTCXAF
	 nAPt6HpzwsXVbKHpxTbVJD4j68UqixEaYyA1ReAujlf3tvwkl5gW6NIdOFiaGj5nAW
	 iT3CvEG6jIpbg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:865e:547d:4830:837d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A9DD17E0258;
	Mon,  4 Aug 2025 15:32:34 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v3 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Mon,  4 Aug 2025 15:30:26 +0200
Message-Id: <20250804133035.309990-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063238_244688_8C77668B 
X-CRM114-Status: GOOD (  10.67  )
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

This patch series extends the MediaTek LVTS thermal driver to support the
MT8196 SoC.

MT8196 requires a different implementation of the lvts_temp_to_raw()
function.

To support this, the series introduces:

- A new struct lvts_platform_ops to allow platform-specific
  conversion logic between raw sensor values and temperature
- A variant of the lvts_temp_to_raw() implementation
- Platform data and controller definitions for MT8196

Link to v2: https://lore.kernel.org/all/20250730152128.311109-1-laura.nao@collabora.com/

Changes in v3:
- Make ops in struct lvts_data a pointer to const struct lvts_platform_ops
- Changed mediatek,mt8188-efuse const entry in eFuse binding to an enum
with mediatek,mt8196-efuse and mediatek,mt8188-efuse, dropped mediatek,mt8196-efuse
const entry

Laura Nao (9):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller support
    for MT8196
  thermal/drivers/mediatek/lvts: Make number of calibration offsets
    configurable
  thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
    lvts_raw_to_temp
  thermal: mediatek: lvts: Add platform ops to support alternative
    conversion logic
  thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
  thermal/drivers/mediatek/lvts: Add support for ATP mode
  thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
    calibration data
  thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
  dt-bindings: nvmem: mediatek: efuse: Add support for MT8196

 .../bindings/nvmem/mediatek,efuse.yaml        |   4 +-
 .../thermal/mediatek,lvts-thermal.yaml        |   2 +
 drivers/thermal/mediatek/lvts_thermal.c       | 305 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 4 files changed, 314 insertions(+), 23 deletions(-)

-- 
2.39.5


