Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ACDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnZl0kD0NHFixyUuAcDalCU1UJrY0bC/p+e25gYBb4Y=; b=3Qaq13s+Td5S0Son0qusK3BZE3
	s7gu2vhKpgGTk6dM8hlvvDoOaBX47uLqhLhLkQkF4npY65UiEN2dm/9LoUg40NHY1EAEfD2J0Vtji
	DD2OlLOMle1CVC96CHRxiLfF/FY16tNQyx+L89ycYZWAYYOW3gTRdM5ya59pTwWCFyjvddaLqeZm0
	5rA2kg8iSWVJsEBU9g1M1rH99uUlLY+TYFh1bCjEtvAQ9UqSCJgQTB29gXz7KDryFhwhsoJKeNmAU
	nvPPDTFA8ihRXDnJxPN/s4/Fxo8cRK3I8p5n39XaqlMHbaQJ5kXVrc/NEX6d7ZpSU1GJUW+CrpEZi
	4x4sT2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNWu-000000060j8-0fvH;
	Sat, 14 Dec 2024 08:29:40 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMNLI-00000005y7i-0dO1;
	Sat, 14 Dec 2024 08:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=hnZl0
	kD0NHFixyUuAcDalCU1UJrY0bC/p+e25gYBb4Y=; b=QcnFypl/blmPl1YtE+4QU
	EjNX3Qr1Xa3O0OGDgyBaGRXghC78I25jTp/6J2FjAhRzoWfji2kCnj2f8wtBZUMF
	3fSsuV2VD+k1GallxneZl8/NKUDfk8TOnXKRjV5xWbOsAdKbgdfaEOJO5S7DaJfk
	X6MqomFz3LGamsH006l8/c=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3fwEQP11ntNLtAQ--.5686S8;
	Sat, 14 Dec 2024 16:17:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 06/16] drm/rockchip: vop2: Add check for 32 bpp format for rk3588
Date: Sat, 14 Dec 2024 16:17:05 +0800
Message-ID: <20241214081719.3330518-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214081719.3330518-1-andyshrk@163.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fwEQP11ntNLtAQ--.5686S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45Xw1rCw4DKF4DXw4xJFb_yoWkCwb_K3
	47Zw13WrZ7CFn8A3W2qa4fGFZFyan29F4rKayvya4rtF1kZ3WvqayIkry7Was8CFW3KFnr
	Cayjqr1rCF13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0zBT5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQa1XmddM6y0LQAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_001740_499995_9AC81033 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Andy Yan <andy.yan@rock-chips.com>

RK3588 only support DRM_FORMAT_XRGB2101010/XBGR2101010 in afbc mode.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v6:
- Move 32 bpp check to format_mod_supported() hook

Changes in v5:
- Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 94f77faf14d1..85d281edfbfe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -603,6 +603,15 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 		}
 	}
 
+	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
+		if (vop2->data->soc_id == 3588) {
+			if (!rockchip_afbc(plane, modifier)) {
+				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
+				return false;
+			}
+		}
+	}
+
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-- 
2.34.1


