Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB5C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2ZE6duZ93MiuA1yEJdlPf4WZTVnuP0qhMWuOBo3WSQ=; b=DZ3cBoeergJnZRp/EmXC3taigJ
	P8YbddGXThIcOuno0Xr5y7Eil9t/bIhb7qzTuYYesuOKTph6OLiK5DGKPs7qxD7QpMwil9lw8Rhpx
	u3nzAcCgP8t1pOkv1w1IADkY3hTIcSdxDhnYHFx3ySjfRvq9ydXbwMrgODADjPpTNGLJFMih73ELo
	x3sU6UGSVgnJT5D2c4tTioO1+0WlwJK0a0dtTwUks3X5j7eUVF1XBKQNllT7Qz5EbpEiN+eFtNpb8
	k8sQ/KORTmW45MmEwOaM5EzPIDmz3vzCWG00tCDZ7D0LS+z318TGvLCCUuYbfzK41IuEc3FFDOCza
	N0P/CxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEgi-00000006Tac-3hEY;
	Tue, 08 Jul 2025 20:13:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE7e-00000006M5p-1vHu;
	Tue, 08 Jul 2025 19:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003416;
	bh=DZ07FftUuUFoLz4dKR+5e4A2hHQAYJ90Yq5kFNKzni8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OTNtPggKXTdERxFhH4lMVJsacxQUgadDNNhkPIxUrp54Es9Ygo+Ju2DzkDW/3hl/n
	 OXpSL026NPDjW1S2N1Z/zmN2a7bGBwk0nAcCLm0V+F3XBAjvL/zwW8Sy3lAXh4+RL1
	 Xj32FGjTJJerinQegcP/ZEF2R032B6ikWEFJfcX/HO+KXUgB1m4ZoX0M1najg5TFtd
	 96P/9UXbypxjZkZMLU3qQZYZVmknqbrTWqEI/Hyfi1CIrKIuqQ0Klw6MTip9nCCYH3
	 ZmBUjV7okgCe2r6wlFJ9s5uobRdfYqS1neB8QT049AfPVKbxBhcIStXUcT8gf7dLbh
	 TAc1/7T9Mc92w==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6670D17E0FB8;
	Tue,  8 Jul 2025 21:36:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 08 Jul 2025 22:35:42 +0300
Subject: [PATCH 01/12] phy: hdmi: Add HDMI 2.1 FRL configuration options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-phy-hdptx-frl-v1-1-cfe096e224f4@collabora.com>
References: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
In-Reply-To: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123658_646060_2837CFC2 
X-CRM114-Status: GOOD (  11.69  )
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


