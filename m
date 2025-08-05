Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11ECC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2ZE6duZ93MiuA1yEJdlPf4WZTVnuP0qhMWuOBo3WSQ=; b=vqNR6K1ZrIqQnGz1JvdAzGc0iB
	ApMx51tTv5BIbxqMl6qhcvFsqkegq+tvJuaS6dkeNCU7EoeQg9RY3polQX84Jo+VrWI+Csb6j7DFu
	scGCGfG9gzDZ2xyWMnwaG7iMneV78RFtTmflIjQhtmFrCrAHqa/eYWq2B6oNSmm4VRGPYIcfKnFQ9
	tREDzddUJiOh7QmSnIB2v4h7f9ayXJt/HDfbkCB5+fUIjvyHHRYWyKAAzX2QakqXHOykTaQHdEyYA
	Ffh5I9VG7ZiHHA1JA54cQydNmNLkWR2XxWMvzysyHwBB/Z0wKcSYydHZkXFj4fcGnTfisJLN2f8/l
	o0P1R5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGKM-0000000CeL2-1QRP;
	Tue, 05 Aug 2025 11:59:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGHg-0000000Cdd9-3yeU;
	Tue, 05 Aug 2025 11:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395007;
	bh=DZ07FftUuUFoLz4dKR+5e4A2hHQAYJ90Yq5kFNKzni8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c/1oRSWrpeHE60SQo6gv5/qr2h5LhvziJWTrZuyaYoTU5xikn0lfi7c4RkAeemk9+
	 /lI6oa11m0LaN5SfSQl4CMCHYUazAQlt/xhdyP42I1S6P2WX/OALZMsh/5P0y5ffqi
	 m2EvsemH6FLAcDWmH3YgJmEuH7QtycXVsag+POEbveILQu2daJjgPp1Q4xVfuAJFtG
	 1zt4sVEwoX5SAAKzm0qgLVaAczzNkmepTlQBQGnQXZlod8suyMB0so6rYs8jkRbnvW
	 lZgOMRTRx2KJnqUJsVw1BTApJIrKMmZBlfCp/NwxAQMXsFBYYfiwaLjB98ZGhZZShs
	 qeXoMzYmFU8eA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 5FF2A17E04DA;
	Tue,  5 Aug 2025 13:56:47 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 05 Aug 2025 14:56:43 +0300
Subject: [PATCH v2 01/14] phy: hdmi: Add HDMI 2.1 FRL configuration options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-phy-hdptx-frl-v2-1-d118bd4b6e0b@collabora.com>
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
In-Reply-To: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_045649_138864_4E09C128 
X-CRM114-Status: GOOD (  12.09  )
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

Add support for configuring the Fixed Rate Link (FRL) mode for HDMI
PHYs.

For improved clarity, also rename existing HDMI mode to HDMI_TMDS.
Since this mode is currently not being used explicitly, no further
changes are needed.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 14 ++++++++++++--
 include/linux/phy/phy.h      |  3 ++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index f0ec963c6e84f1b7728acafc824dff191c6b873d..0b26472d8defcc9ded142d4283e29861dc2b3746 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -6,16 +6,26 @@
 #ifndef __PHY_HDMI_H_
 #define __PHY_HDMI_H_
 
+#include <linux/types.h>
+
 /**
  * struct phy_configure_opts_hdmi - HDMI configuration set
- * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
  * @bpc: Bits per color channel.
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
+ * @frl.lanes: HDMI FRL lanes count.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
 struct phy_configure_opts_hdmi {
-	unsigned long long tmds_char_rate;
 	unsigned int bpc;
+	union {
+		unsigned long long tmds_char_rate;
+		struct {
+			u8 rate_per_lane;
+			u8 lanes;
+		} frl;
+	};
 };
 
 #endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 13add0c2c40721fe9ca3f0350d13c035cd25af45..04c84c1dbd6dac55fd04c54203cff4f9d939d970 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -44,7 +44,8 @@ enum phy_mode {
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
-	PHY_MODE_HDMI,
+	PHY_MODE_HDMI_TMDS,
+	PHY_MODE_HDMI_FRL,
 };
 
 enum phy_media {

-- 
2.50.0


