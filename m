Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA694C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 04:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJt33rGfTjmFGwZ17ZhOF51exB4rGltLhYdx1EQidRs=; b=cpPfTMOoZx2yC6yVijwerhymkg
	ZAh/RN7TICCJL4sqCrJPKktL+oRGF3d0tTaMIgbK4b9LekiamOxQqenzmOwXSDWH2hWa+KPf1SFY3
	dzPAyjmhJ1qbXbIyLhExsBBQOnxDBlc2ltyC0RQMfne5pnYswtI974xmLvRycadQNQPJKIGt293nY
	pmjX17sZh6y07eSakhLFxaL3uAU0oYeqLQh4QZzZH2QuKcH12B3vD2EjUW+2uH2WdoSG7crpSjfwu
	D2iwX+SWraYQb564ljP5IndYIF0xzKEEJz+ZCZnBNNyKfvRnRqVxsEvmNA4GNeG/+hI2yFAs8n+KZ
	wPv7Wjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZuF-0000000A2jt-3fHk;
	Thu, 13 Mar 2025 04:10:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZsb-0000000A2ea-2djM;
	Thu, 13 Mar 2025 04:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741838946;
	bh=j7zpBJEhB8SicI9BKDz1KSrdQOhg5JL4HopKFTPur5k=;
	h=From:To:Cc:Subject:Date:From;
	b=SX4lGM0MJqbfxx/mmhRW/n7CDZtvZE7XoQBSAsi7njweboGy54o2bj3TW1FZSnXb1
	 VqOdVU5io0S7jhRC6EjGGIZR7FWHaohcv6kOeFGKwoeW97j64l1lt+Mcmm4XRnsZre
	 H86YgGn8p64XJlpt30ggZ4qMRlyKnuxg0TuM9cqIaQ17iSHHqYffjgK9WTz70LupPd
	 oeu0zu9ysPLG1JM+ISSmuPoa8hpXWENiyrIvZ5MnBRzR48J7MjJv0ZpMAc6tYaREqc
	 MSBJ2rMh+XcQwHHOC76pnLhX1GpwN2WmIrxH6/FTqvgRknBKV88aOctfb/3sjOyTjZ
	 vpADPxWWOmW5g==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CE6417E023F;
	Thu, 13 Mar 2025 05:09:01 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	daniels@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	arnd@kernel.org,
	ck.hu@mediatek.com,
	laura.nao@collabora.com,
	matthias.bgg@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	lumag@kernel.org,
	ville.syrjala@linux.intel.com,
	jani.nikula@intel.com,
	arnd@arndb.de,
	geert+renesas@glider.be,
	wenst@chromium.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: defconfig: mediatek: enable PHY drivers
Date: Thu, 13 Mar 2025 09:38:24 +0530
Message-ID: <20250313040855.62259-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_210909_858509_E6287A1B 
X-CRM114-Status: UNSURE (   8.62  )
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

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Commit [1] stopped selecting the MediaTek PHY drivers, requiring them
to be explicitly enabled in defconfig.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=m for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
- CONFIG_PHY_MTK_DP=m for DP display

[1] commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")

Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Include board details in the commit message.  
  - Sort newly added PHY configs in defconfig.

v3:
  - Use defconfig/savedefconfig to get the correct configs ordering.
  - Removed PHY_MTK_XSPHY since it is not required for probing display driver.
  - Add the commit details which deselected the MediaTek PHY drivers and
    added a Fixes tag.
  - Enabled CONFIG_PHY_MTK_DP, which was previously deselected.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..fa8ee7070b37 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_HDMI=m
+CONFIG_PHY_MTK_MIPI_DSI=m
+CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2


