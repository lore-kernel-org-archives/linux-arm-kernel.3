Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9BACDE00F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFJV56hXInqnRwFDGzytKZCSzruqzGhUqz4HcAaz0eU=; b=xDdJuiYN5/yt0JTNAmY9vAYpNO
	y44eAP1RYNnOjW3x48ye5P9/PEzqd9pgL1bGuSB2V6IZrMhDqyST7IPf7k7Enn2N4ZJyQZpa+it8I
	QE4x8IBNgrx0zEwcBuNGvF1tN3Ri6/a4CM/fqpKUikZ99xyY4DckkyuYmqwzivCJFdpDKlsWQQ8LE
	eLB2nwLuHigC/TKEDpCa5aUfdItAtUzTFV4aB0aMc98zA/wCkG0VJvT2pFQlrQKsjuyRbwgIDEY2I
	GObzeJXepTcro82NONMmBwHD9Cw8pBPP3sVWA7rUo3HaZp3rsXdp3MssPBZNakw6P6b47yKFnB8hv
	4LGm0dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4Y-00000009bAw-1E27;
	Thu, 25 Jun 2026 17:41:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3L-00000009ZZR-1pzX;
	Thu, 25 Jun 2026 17:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=lIQrXHPEduipW6Hj0T0PV2Fyg/ObQ+nENmNrinpT9h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8de5XsWer9oUd6umhLmk5yEh0HXekHqmiKO+s8GOpxtNhGFDm4Au0QxQWLraTN+D
	 j1QdUtLHv7ItwGL6JW/PtFpx+vj4lFz06blKVIqgY0tmmgACpw9+jxHtO3ZTnF1sMd
	 hrjRFj6rydm7eGZNEVr5qhje62srS/mn41CvMTuIqW9muouc62t0/4lkUX7rlkhTSb
	 d8io/ThmcKXoLsx2NlQVDrvoR4Ap70T3lrBqPviAdMttVY0W/b7+0CGXDiv+ffPaZD
	 0NnjzGev0l44uEc5oMcXE4NjP4FDrnEHhRGE/woYVwaGqwEUoL0llJsJfFak5fChUb
	 /lCleGd6NesdA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1760217E1583;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 166A4480065; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:47 +0200
Subject: [PATCH v7 20/27] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-20-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lIQrXHPEduipW6Hj0T0PV2Fyg/ObQ+nENmNrinpT9h4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sJsCL2392xBrNchxTuWnPtN4NWuagWe
 ZdNCPBoAC+xrIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaPZ4P/0pP9pYtctzhJxHBThODKf8uG++izvpF4nMDI7QJ7Ey0lS/JIvWUykqVTRG/2MihNZl
 Bp7URr5YlCENF2eTxI6Gfr38RMI3eE8hyEUK5UbQcdht7MdO+cI67eab6C62dcAsh96f5mFUYnp
 th/1VfcAbOlufFuUuG+RKSe7l3xw/c43A5QoTpRaKiMMQ9Rhp8qSJAx6wifo1AO/mQKfDst+bWb
 hdTKEqG/Gi8WAoKzGGO+icyMrQXlNucsCoVHTdtb/4z08641ew/kSO1elSLq2soV+ZT838zjjmU
 AS8NbvSmJVIC46FO1isxoIsAvWR3dTtVmP9lc1aLMDfwd8zZHKqZoIjzdP85c6VkCfNJX86VH7H
 +raGXj8Jj5a8HV57RGmcQ7LpeiG4ZfwbVxBQE+/1vs0dYfs07DWUjBqW4R/m/u5seHm4R309I+e
 kslA1jtBWRvToHiMbH4E9timQXD5NkYE0RlghMmrGRYNGmvP3o4MjZ2x4gSSWqrkG7VKCeWeb/Y
 w+PNro3S7z84Sk6ZQv4gVYdxUTDgphXUIiot/i5UIfbRXqcF1fl6qsp6K0sgHjTI6nlxgtOnfbi
 fkp1AJxo0FrUrWGSNgHfDBrDz15x+SX9FhnLEfBf6xZ1CiODcS/G/HdtlEc5WQSbyj9blcf54Q7
 Pw3t+32j0xAjuf4+OHEctqg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103951_671913_381B7098 
X-CRM114-Status: GOOD (  10.43  )
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

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b08f0c142b0d..3fa97a8c2555 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -625,6 +625,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -636,7 +637,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0


