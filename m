Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1376510D14AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TByERsmYq3UKDGghRHo3im56DTYD/6D/50fPpvvvnRA=; b=xvlP5STKotYvcP66ugASqIwkCy
	5HR5ZBZQW8kDo+UlL3O2pmYLeyl8VTlPUWAO0UNSHJ9Rn2xSC2tivAsaQx3V7N9sAHC+qUBOlpNSa
	u5z9hY7AY6SYpGRh56WuBXzSYDFoUgA66+8Y8W890ICe0+osCRmNN0m55/36fxxQHy2Ln6Gpk+rM3
	Fdrj0hGi/s5oxTviSXFs49jrdGiku5SDZfK+QPO6slPfgVX+97P5elCNhGtUDn5rhRxeW/MMrW98S
	0dwWu7e7OkfnaD99lolGe4M2uF4yceRRQe6nAqxhNtMEh01U1kNQ2qhS7USI9T8WupqLe6rvq1ZeI
	keUZSTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YKj-0000000Cwid-0sIy;
	Tue, 31 Mar 2026 12:36:37 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YKg-0000000CwgW-19zc;
	Tue, 31 Mar 2026 12:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TByERsmYq3UKDGghRHo3im56DTYD/6D/50fPpvvvnRA=; b=YrxNVgHyEGIYvlQ43ZaFjRG5+e
	wsZiTRw7hHEVdK5ZFGiCzmRngqcqNyP+GxdGD7zspc/wAx1hvKj+0i4xUFT4ywR5+pkNsRK84Qw9R
	28Vsmm5DQnyHqHRGCOen6acg9MEgsmXE9Dp8cjbCtyloNRrViWDiSo9gKTizexSHbygIroOnSCEqK
	kkogev0AhnmHV8eu3UrnxsGRWtxdz1LxStYHED5YB8iEO6sRgWLa26NdZBC5/CoGdwDCSnyTSx1py
	uu+MNlPHaJ2ygKAJJQDcq3qTyAoE1J1OdtRcl7vMW4Ql0KByX861l3hPRf+6+0qwKb3vfF8Of8/0f
	oHgpkD1Q==;
Received: from [189.7.87.169] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w7YKS-009RtV-9z; Tue, 31 Mar 2026 14:36:20 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 31 Mar 2026 09:35:51 -0300
Subject: [PATCH v9 1/3] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-v3d-power-management-v9-1-f52ff87bfd36@igalia.com>
References: <20260331-v3d-power-management-v9-0-f52ff87bfd36@igalia.com>
In-Reply-To: <20260331-v3d-power-management-v9-0-f52ff87bfd36@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=4Bf839gx3pn8EdFQCv6NNgakuj219NXfDhA7p4aTPm0=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpy7+8L7kd/KwFtyueDOxa47dgDW5JZt6cVhu/3
 0CL8tEcDbKJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCacu/vAAKCRA/8w6Kdoj6
 qgmGB/4s6NU6FGzQvzOPGc9NCLg/OmPIE4WeaskBUIXAJ2fsQ7MOO9MvNWqpg2ni/NFqM5WQCws
 Y6Fw6L3amrjvSuhNfwn8cKjCGBuhPKQEipJzgyHJBM8GHJPoxZKRBaPGGdhWE2UKv+g2zw36MIr
 U+DumnR5B9CzF+4dpr+nTXD/Oxs54nCduYEXK8ghorSgrIJbDzvwimgmGwzrzKFt7lm7qvOtHF8
 uAgFYpY/++PAhHLT/ikATQRhLlH+vlgw37w0g7apynCEaiOizLy/11XsDx63bAxQ0faiR50W3ot
 VM3K85h6POe4TL0XWUrb1zvS1rItRxxxy6wlZ8iSPdUlncwQ
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_053634_631918_D9B1BA41 
X-CRM114-Status: UNSURE (   8.05  )
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

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 4b441afcb602de08bd193d57649121e44ab31f2a..c5e7c778ec7a1a39d81155f7ed2a7ba811b5e3aa 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -401,18 +401,17 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	v3d_perfmon_init(v3d);
 
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
+		ret = dev_err_probe(dev, PTR_ERR(v3d->reset),
+				    "Failed to get reset control\n");
+		goto clk_disable;
+	}
 
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
+	if (!v3d->reset) {
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
+			dev_err(dev, "Failed to get bridge registers\n");
 			goto clk_disable;
 		}
 	}

-- 
2.53.0


