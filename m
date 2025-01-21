Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F46C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X1Gpc6jAmiWt4NOgfOBGl35hiI4zVeXF8FhcZ6Nthb8=; b=Ywc1LPO/g2qm5blNH1rdUvQzCW
	yIoLV1lFJyP5nBRNF2a2SqOEehtnuzm4CoGxWokDfPyy9+Ma2WNmEQa4v+Dt0ivCiEeH0SZGMDj13
	ggAxSv8jOyvC0WSNvX3u1gs6ceAXEAKhtlAUW0tFVUZO8gyHEwnJ1wgvr0XCpAqzbOFAY9DXsx3Vt
	tDhj0M4J0leN0TALuB6fKBvQMnyiFOe5qLJUCCMYBy2/XJquDeQFu/mzvBU5xnXT5spU+C8Nrz2KJ
	K20MjRmBP4/u/vCtgfpkuT1prdwrm4QdowVsAjZN260PAjWsUv4uQn11J2sT/VRE92HYu5VgjOc6t
	4/qURpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBef-00000007cUa-07rf;
	Tue, 21 Jan 2025 10:38:45 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBZR-00000007awe-1BOT;
	Tue, 21 Jan 2025 10:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=X1Gpc
	6jAmiWt4NOgfOBGl35hiI4zVeXF8FhcZ6Nthb8=; b=a1GskRCP3DarDE4hIVCmy
	w6ScFQKVKJ72YF5IYlvMAlhE977vFLWPcRB6WgGHk1q+3FxmFl+cXjtRl99jo9QZ
	FEAVpi2rQjtBUYkRjarPfvb1rRJeuYO/StwtSb3UCFH+S96lgXbN5aDIgz80L/aj
	mowTypxd32jtTZipsFZCas=
Received: from ProDesk.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHkqjYd49nreMjBg--.21590S2;
	Tue, 21 Jan 2025 18:32:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v12 00/13] VOP Support for rk3576
Date: Tue, 21 Jan 2025 18:32:37 +0800
Message-ID: <20250121103254.2528004-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDHkqjYd49nreMjBg--.21590S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1ftr47Xw1kCw48AF47urg_yoWrCr47pa
	95C3sxXrW8GF1jqw4kJw1xCr1Sq3ZIyrWfG34fKw17Ga1qyF42krWa9r1Yvr9xGw1xZrWj
	9F4Sya15KanFvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMv3nUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBPbXmePcy1bhgAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023321_639853_E7811224 
X-CRM114-Status: GOOD (  13.10  )
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

From: Andy Yan <andy.yan@rock-chips.com>


Patches that have already been merged in drm-misc-next are dropped.

PATCH 1~9 are preparations for rk3576 support
PATCH 10~13 are real support for rk376

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on
Linux 6.13-rc6 here[0]

[0]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v10

Links to V11:
https://lore.kernel.org/linux-rockchip/20250111112614.432247-1-andyshrk@163.com/

Changes in v12:
- Split dt-binding patch

Changes in v11:
- Remove redundant min/maxItems constraint
- Remove redundant min/maxItems constraint

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.

Changes in v8:
- Remove redundant blank line before drm_bus_format_enum_list
- Add a blank line before DRM_ENUM_NAME_FN
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v7:
- Fix rk3588 dp+dsi maxclk verification

Changes in v6:
- Add a blank line after hardware version check code
-  More specific explanation about the AXI_BUS_ID register bit of
   cluster window.

Changes in v5:
- Add axi id configuration
- Remove the non-existent CBCR scale register.

Changes in v4:
- Typo fix: selet->select
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add dt bindings
- Add platform specific callback

Andy Yan (12):
  drm/rockchip: vop2: Rename TRANSFORM_OFFSET to TRANSFORM_OFFS
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
  drm/rockchip: vop2: Support for different layer select configuration
    between VPs
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: describe constraint SoC by SoC
  dt-bindings: display: vop2: Add missing rockchip,grf propertie for
    rk3566/8
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

Heiko Stuebner (1):
  drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs

 .../display/rockchip/rockchip-vop2.yaml       |   97 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1473 +++-----------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  275 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 1798 ++++++++++++++++-
 4 files changed, 2377 insertions(+), 1266 deletions(-)

-- 
2.34.1


