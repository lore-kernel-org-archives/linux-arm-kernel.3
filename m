Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34904606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=esUeR+Qp;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YZT/nQ4v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=; b=esUeR+QpQYNPtQ
	JKbvQzAnyGWKXmV2JUB6y4TrSzqHnl7PmT7tX5hBfw1E38mg1TjIkS6DbjqHxk48xC5y9/wjq1WuV
	jxlPkU4RdYbA5mVYbr3dDAa0RJZ9vhWcuZEydQaiESx6/rs3AdToQwj55p63Xz1KUKjr35iGgQ6cC
	AtAWF3bxv07Yvwkj/LSRi9pvtkdBq1Ysx3kvA1MXB0H6UKzbrZNTn9atz/G9ooG+x2UUHpllPuy++
	jC62SLgMkkq86AuAZ/dAl+ixmpdSL5Wl0jIhjtVjLVR4Kfb4Ct05a4v1MLcFMvsZg3GC3sqc/7eoZ
	/E89xogcPsiaenVjp30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5U-00000007DYu-1d1A;
	Wed, 04 Nov 2026 23:08:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5Q-00000007DUr-1fHH;
	Wed, 04 Nov 2026 23:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YZT/nQ4v1gyi8Z6mtVBUmC3+KietQShgOVaVssbv5Yvue/oEaCsHUZpj5hzAgkfdp
	 hoguJ/BBI2DHDIe+dKhV8QpNvOkKhKmFE9u+drrLFXJnhNWM92ew9X/8RfzCQREfP0
	 BYb22g7f/FSZn45CVN49UeRSbD6EdGgOkuNCmTwT6l+4DbFnJH9iCLFGrm7X5d1r6S
	 DjQ+dNURm8oM8+xWY5X4mBFmIvFSe+K11ab6ZCTc9R0EQafPNu4tq7V9x73GyM2nlk
	 V2OqX7tlSYz4Bb8mY5ORN3G/9F3sm4vBYkePuLuuwQpwiEoroZky58VCZaQe2vzLBU
	 S6dmqI6QDj4zA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96BBE17E0CE8;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5882D480029; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:57 +0100
Subject: [PATCH v3 1/4] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-1-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutUbh9IY5cnv682AX8XX0t3vUjOvK8LHq
 BDCNIU5Dap7pIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qa0PUP/0EfAg63VdePvgZE4PteYOgoRD/CUvjR/9lFi2uMH+FhWbHtAQJH9AUBOlbFfVj26ld
 Ksb+woS0FhgMDHmHpPZP22cPU7D8WlC1gwxPwbVY83HYn33XTAHsdIIlZ9zqVeiH52Ulg0nMn0O
 05OSMTwHVzn3PUNeZtnp0s7DcX8369dfIEfnxuRAq4EaVo6OSHx77W8+EPgeXSQqh0xoj8AI2+b
 V8hsDRpGWgAC91h6dWcSfxbMTTYpRsHUXz6WB2h4cBoRhd4KSnTIwXTFDoGpXTPyyVKdmREKbBM
 Umt1H9de0PiJRuFCMU80HxvltaLrDRToPuTmAAJmlQbTp9G6NVSMfG+76Z6OlJHPuR/0Bh/Hf/j
 5JA6sxPwRd+9pOTI4uG1iz4hHut8dCkF1XMK3manGF0+blHl0Rzx/1BBwywO4jHSE2V5EtjPVSc
 HSBHZEnifOR4TDjs7BJmZyLrCkIaYcYa/FPCw7r5oKRL2FsPs/31/4pZNNL5rtDGI1MWdMduS1V
 Qi9RNqlmlPlL87RMrqmLB1vOu3j8loBlnAXgenrabwh++PSO8ccwDuGsVyBpRSAbVPOQtZ2zcll
 m+LUihTXaNt4iszDZ72/Ddk9vgHJhkU3lS5iRz7G7c2r4JBRq4zHPZbwR1KudUMOi32mgl39Otj
 U924whOP6r2Wd1HfbL7o0Ug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_150808_645786_397677AF 
X-CRM114-Status: GOOD (  11.15  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add debug message for init/exit in addition to power_on/power_off and
avoid the useless extra dereference in the existing power_on/power_off
to make the prints consistent.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0b61f152eb3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -508,6 +508,8 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret = 0;
 
+	dev_dbg(&phy->dev, "phy port init\n");
+
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
@@ -592,7 +594,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power on\n");
+	dev_dbg(&phy->dev, "port power on\n");
 
 	if (!rport->suspended)
 		return 0;
@@ -632,7 +634,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power off\n");
+	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
@@ -651,6 +653,8 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 
+	dev_dbg(&phy->dev, "phy port exit\n");
+
 	if (rport->port_id == USB2PHY_PORT_OTG &&
 	    rport->mode != USB_DR_MODE_HOST &&
 	    rport->mode != USB_DR_MODE_UNKNOWN) {

-- 
2.53.0


