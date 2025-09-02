Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A2CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY9ACJC4K0nfmbgCO9FI8gLIGI0ocgJ2uGjGHakxZFw=; b=B9nFyxab1MHctyDZYyNwIOalBB
	7Znl2UhCsrwdaNyTUWIZ4HPRmGM1d3gBBCC/V8J0gMUBUycmDkKxuREP+HeZTPNXGXKarqWT1ql58
	uLosKj0wR4/r5bL51aS42WTHyubgANFdjTT3ijNq+8J1tmjLWa3fELaZnAu5x801nA1vw4a68fmJE
	vsn1HNq0zwxLUpjF054nbhBleCMAT1cW+hUFYDOU0DD0qH5OAEWKdDWladtas8Zez9agVZLpxtXCn
	OXVB9WMwRbM02aO+PlHPblzzztaoMaHBTJlNcFAsG6PlUb51WMdtWkjZjFJHziXqQ5VdS+m7I2B1Y
	KuNA2Ofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcU-00000002poc-1VvF;
	Wed, 03 Sep 2025 00:45:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utXs6-00000001xj6-3snr;
	Tue, 02 Sep 2025 20:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756845893;
	bh=uAjAgXeRfa++7TzMQXDYJfWBDuyTpZXti/Fx/3Cs76Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LkMlajey5rMhK3SiLl/e9e1G+zPnjm9acE7YS3qIdCLphhOI7k8+7Kp3zkpwoB4KC
	 RmlMF3Fe5k3wsxRp3Q0ylmVmAZcLAEnYcvz8tRPMWQ1cS8blpWAsLjS6RlRsVnryER
	 YtvjzGCQ9LinZ+F2cp9Ll8XT8Oos2hzpA+gk4Ra6GHbcSat1A/PUYagt7HaCwZ39+7
	 KVt7Vp6cHLRGQVzMUVf9cZ5Rb1G0RRkpH82d3cxIfNDP/pG4qFtr23U1ghSvS4wnWr
	 3cz/EFmi0Y4/cQ5A5jZBZp75CiliaDz4lznTVNgZ8RPSDXsYXcKIfKbiZVxuF/7nbN
	 LxChYZvas5Wxg==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 254AF17E0579;
	Tue,  2 Sep 2025 22:44:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Sep 2025 23:44:36 +0300
Subject: [PATCH v4 01/11] phy: hdmi: Add HDMI 2.1 FRL configuration options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-phy-hdptx-frl-v4-1-7d69176373ce@collabora.com>
References: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
In-Reply-To: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_134455_113051_18FC5D45 
X-CRM114-Status: GOOD (  12.46  )
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

The HDMI 2.1 specification introduced the Fixed Rate Link (FRL) mode,
aiming to replace the older Transition-Minimized Differential Signaling
(TMDS) mode used in previous HDMI versions to support much higher
bandwidths (up to 48 Gbps) for modern video and audio formats.

FRL has been designed to support ultra high resolution formats at high
refresh rates like 8K@60Hz or 4K@120Hz, and eliminates the need for
dynamic bandwidth adjustments, which reduces latency.  It operates with
3 or 4 lanes at different link rates: 3Gbps, 6Gbps, 8Gbps, 10Gbps or
12Gbps.

Add support for configuring the FRL mode for HDMI PHYs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index f0ec963c6e84f1b7728acafc824dff191c6b873d..d4cf4430ee8f3bf0f18a109c5a7640293a4293b1 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -6,16 +6,31 @@
 #ifndef __PHY_HDMI_H_
 #define __PHY_HDMI_H_
 
+#include <linux/types.h>
+
+enum phy_hdmi_mode {
+	PHY_HDMI_MODE_TMDS,
+	PHY_HDMI_MODE_FRL,
+};
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

-- 
2.51.0


