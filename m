Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BwHyoYlW;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=bu88LMKg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6dok8n5LL6c4MopDmaxFHK/PDv9PBQ1ve5ozQwWb2E=; b=BwHyoYlWlkiKIk4E/8yJT5tOAB
	dJD2Ie4t+alExZNos68o1XQDDtnZYccSWYNzhA2F+f64bsQZ4kD7DeH3IHEfxjCWvntgreCRdGwqy
	3SfjtjwmuTVN+1nuoE2d638yb6AixD9bjzBuM8MqWqDQlST17GQHOk08SmvOTKXVE6klLvTUaWeU0
	b4AuX52a6k1NtCp6KuT70R/5qE/St+6jidn4fwhC+XqMCWVzFz+DevN3QPc5Zqv+8ujDyHHtpEg0Q
	9sSnA6pPHbiF0hvsBCWT73Etd3JVWMl2L/Ys3Q2T1FPoZVo9fOf7L1yKGQiMeIvWdtHcaOx0I9KS+
	9OEFRxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTSQ-0000000Bb13-3h4G;
	Wed, 21 Oct 2026 10:22:06 +0000
Received: from out-124.mta0.migadu.com ([2001:41d0:1004:224b::7c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTSN-0000000BazB-0caO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:22:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=M7vQgWT3GoO7sduxULKgRFfbTcBneeSPs/0sueXAB60=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792578120; v=1; x=1793182920;
 b=bu88LMKgSTxv6LpzEV6zMT1oIN3YbHyyI+rZ2+bUVkAJ/4StqocrlrDPhTm5hKgGmg9jYwez
 wGddRvL7ngAQN2LsBuVpNloKuGP30jP0rM/YCAJnLTobxrxRtXnq30voD4jZ0Krxj+325L0Alyq
 gypcDQfhvLjKR2gdfO6wi8V0UyrB6m/BkKxmIEvMXI5KN/6SfU/ZkpoKylkAUzx4QLzrYcOHH9v
 cHM+Zow1zBBUGUWsy6LkvnmzF9v5cLW2mebefqkJ9pnzhRrUv6Cz609SY1uBvy3B1U1B8b25UQq
 QjfPHYZ2unoeFmabW+4O/0cZ7ExkIEvZ0pf15NVlBI5Pw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id adc20fdeee7e491e;
	Wed, 21 Oct 2026 10:22:00 +0000
X-Mizu-Trace-ID: adc20fdeee7e491e
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
Date: Wed, 21 Oct 2026 12:21:20 +0200
Message-ID: <20261021102155.609575-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_032203_315027_A7C8BD63 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The devm_request_threaded_irq() function already automatically logs
detailed error messages on failure since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
So remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0a8a22e7aa9c 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1183,10 +1183,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 						rockchip_usb2phy_linestate_irq,
 						IRQF_ONESHOT,
 						"rockchip_usb2phy", rport);
-		if (ret) {
-			dev_err(rphy->dev, "failed to request linestate irq handle\n");
+		if (ret)
 			return ret;
-		}
 		break;
 	case USB2PHY_PORT_OTG:
 		/*
@@ -1202,11 +1200,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_otg",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-mux irq handle\n");
+			if (ret)
 				return ret;
-			}
 		} else {
 			rport->bvalid_irq = of_irq_get_byname(child_np, "otg-bvalid");
 			if (rport->bvalid_irq < 0) {
@@ -1221,11 +1216,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_bvalid",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-bvalid irq handle\n");
+			if (ret)
 				return ret;
-			}
 
 			rport->id_irq = of_irq_get_byname(child_np, "otg-id");
 			if (rport->id_irq < 0) {
@@ -1240,11 +1232,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_id",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-id irq handle\n");
+			if (ret)
 				return ret;
-			}
 		}
 		break;
 	default:
@@ -1491,10 +1480,8 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 						IRQF_ONESHOT,
 						"rockchip_usb2phy",
 						rphy);
-		if (ret) {
-			dev_err_probe(rphy->dev, ret, "failed to request usb2phy irq handle\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return PTR_ERR_OR_ZERO(provider);
-- 
2.55.0


