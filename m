Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF1C3ABD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1JB9K4r8jkVlXVZKzGWm/5UsgKDt6EvNi3sM2DXudZ4=; b=lGxbpaY/c+VdeWtfzO32DUJoD9
	vvmnFmEWWPlvd+RhlPrPowcfgR8teFva+DIANyOZvRcpPNazGv7IhYcSmq/L6pQOl260r2C1EyaGk
	Yz5rIVWXh3CFaly7H1WWStWNbBOr29gWSdZ7BOpsEQ0+ax0/JBtpxRlvd1JVL0aguZBgpQr2Z4Jur
	xs64Vh5i+wUveNuIcndf4NQ5/DowJqynVUpdcbWs3bn+PBtZ99ur0o6yYRlAtBiQvvGLNHk43ztgd
	h6Yxj8ScXHlog5nX9vjEAAaN/h/6fqaX8D5KKwMGpzeOhpfxZYlJfdBVx3mB/9RpiJRh+HDW6nMTr
	xthjzc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETls-00000009f9I-2PuE;
	Mon, 12 May 2025 14:04:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET4d-00000009WNS-28zY;
	Mon, 12 May 2025 13:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747056000;
	bh=jinzHh8xi+fx37r1ofVleQRYSR+JY3hlDNStqMHq3y0=;
	h=From:To:Cc:Subject:Date:From;
	b=UtUT6dK7tpGM5fxIaF2b2VAh4HRClxDxliuyRP53xmN8NiE226GZ2W3nCfu/6gs2Y
	 +LMne1OwXzCPQFsNBumVKhjjVoIizCfKNaN9occhd8q4AoZjKEY+RUwK/sXIHo2kOp
	 8wVKDzg5cxUU6kIrPSYdJcc6izlQVvoTWw8bvOF1K3Ozj21omW98R/84yWpHku1+v/
	 b0TegTLeYu2Z+tcb0XoqK1pV3XYzIah69PLX+NJQk5kf7wPCRSqJvFKH/3F+rMoTIt
	 H0a4Vkiuf2d9a8CP+C79h+75tqVQnAciZ2j5UfX0lQ67iWxqx49qI0ELJhWomXr6vK
	 L/6A7tI0HAQYQ==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C58D17E0FBA;
	Mon, 12 May 2025 15:19:54 +0200 (CEST)
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
Subject: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
Date: Mon, 12 May 2025 18:49:24 +0530
Message-ID: <20250512131933.1247830-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_062003_728175_834E7FDF 
X-CRM114-Status: UNSURE (   9.60  )
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

Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
stopped selecting the MediaTek PHY drivers, requiring them to be
explicitly enabled in defconfig.

Enable the following PHY drivers for MediaTek platforms:
CONFIG_PHY_MTK_HDMI=m for HDMI display
CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
CONFIG_PHY_MTK_DP=m for DP display

Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
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

v4:
  - Reword commit message.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..fa973f6328df 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1587,6 +1587,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
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


