Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjvQ0Y2wDLw0xqmGXFSS+HW6g6BXTyRkNvhjuVe+g54=; b=4db5e1VQSjq5zohDC+abk++6gv
	HkycdZsd2igwNRhG37Ffs7pyzUmRsE0D1uyEaZIBkd7G9N1m0I28NZcuUlxH2VyPXKTjoX5/FQ1fD
	xlWEjU6DT7FKMIvti+40FK1Cze9jM4okTf+eREZs9JwthDhOdolvbjE1CHD0iwM0PLFGyYoBAQg8B
	0dQ4rSG41ol19/yJP2R3pim9LRV8mLd3KOGc04hi70Iaj9pEzD8YSbS5NpDJeLjNMNs1n7iPEXjXq
	hDi3C8n/i7t2N46bqYJZGvnnQ30WxyjYdIsdPTb7/wcLbuLWskNG+HY7PJjD3GsVr+op6+922gDBU
	V6iJZVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucVC-00000001bOR-2fwD;
	Thu, 13 Aug 2026 20:58:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUs-00000001azi-1SDp;
	Thu, 13 Aug 2026 20:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=4I/nYNbSBwqR4UPf/C1MQgR84isl/q6WvT1mIrlZxnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eme0p+mdC3qx2Djf8+kr7/jp2HqVd3fXwKK0hUAhPzC5EEqtILfP5guvtQq1cJ6tK
	 o8Ye2fl0h4S6R8GsxRuNsyPtFTO7hMz3EeDN3bv+arKvt56+RdagDwI8HtxLrhtztr
	 9T6u+61a9H8XLvw/w1CsC+k2TNzTNGywPcEZ2x7sKh2I+zImZUhGo9Ls5qaiV8jXz2
	 fl/cBBMHKxDheGAEh15RvVFQywQXlfbqykhN4o9sdTGnr34S7c2apXRAm6EmXhOZkk
	 D9kJ9gRGWPUxSAuE5FmCT2dokjw/WnAL5nsEfdd+aIdIO8ta2t5IUCV0Wi2gYzYBnI
	 r6rtoyhuT8FGA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB77F17E12B0;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B0136480064; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:01 +0200
Subject: [PATCH v14 18/38] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-18-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4I/nYNbSBwqR4UPf/C1MQgR84isl/q6WvT1mIrlZxnI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmRj4NQns2wOlVtTC9vLogTQsdqUoj3fK
 CItthm7xJRQO4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaZNoP/ifkQCH29/VmqwfqFNsVXShIzlMFVAgwWxI1wCg11sQ5n/u2lAwdT5SbA5tzmv3ANYW
 CW0rDNee3QvKbcGFb4LzoEU6n07UZC02yRu2rv/i9+5LuBOkuJ0sBc4R5FgZYoQHe0UHPjT8ZqT
 h+upPO0Bsq4z95pB0doILascrEPfjWztuq+v446vMhMQ0KU+aUq3qv6YUXProLEVk0jtQhf5NOn
 1+Emw0yqddZRZVwQlM0vrS07Xpf5L8PHPupqcfZH14LN68UKLYihC92qlX1srt2VBSs4DeYi5Q6
 YszYr4affZ3es68u9m9gWxClX5lRaqNmP3NZ73/o4JzTSZAMamGa6rxU9sBEFG2y9G5v2iirWlp
 qLGarKDQwfqkUwj4CEvG6dG9z/daJfscV11JEVXYcDn6sft5Kq1iRMgRMQ8XtoYfOAmJJtf6a8/
 iPEFhbb9jipk3suiQef5IlwTSDt2q3q0p+dCtJ9DRrRf19Dg95Rl4jrkH69ShQoGVOjPqa3U9g7
 b7M4RxwAbBqGDgVUceaVDyO/UDE6bbAF+bfOfNet8EtTcgMpDrmBE5PUfKF7R+ZQ/wtqF4hUHCo
 x0/qffehAq6vrSmf5k4jXuP4q2kBnmAQemwXhugH4Q9CKyGIwYGxkFrLo8lUnz2hgivRUe2Mf24
 sL/HlnlXMDrF2slBv5tEs0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135754_684860_A6084D92 
X-CRM114-Status: GOOD (  14.74  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


