Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3FBCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMAQ2Ix3QgyDqVbt9aR2ni6uTgGtueQYhU6I2JuwKhA=; b=rmlko06ehZ16scQSSKB+70W8fU
	IWOxdDam/s974a/o1DBDJuJP2N1z4yUiy8KKVOneTrFGqJK3fr8pGtTw0Dl+DXrXX+NJkNClI97hI
	lG6TMKg4CqDfxiiMGLUDT2T6B4zXj81lj7TLqTtvlXR7B11MDwf2kHO1oojz+aXvqvsjGalkurDGF
	YoAbIdLK+HSrLkRX+wzdxYnDsZ1mR9xenuWzhWsYG9Hn5z93ERdolZjSFSfXKznkAWtdjWqmNjOyQ
	F7NxMBIsNrohePN9toQSj2YoMsru40C07s6IjSHE2GGoMLbOCDLyDIXVvbSKSPv3w3DupkI3vItyt
	dCDBuVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlNl-00000001Axu-0YBT;
	Tue, 26 May 2026 06:35:17 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlNh-00000001AwM-3y4T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 06:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=iMAQ2Ix3QgyDqVbt9aR2ni6uTgGtueQYhU6I2JuwKhA=; b=dZbanJMn1AcH2bnvtD/EO4+2Yv
	uewuVCipuGcTTpSKtXl8cXg0QhR3A5gvsXk7kqwpDUYTrXOoaZAVp0+EcabfYs9+TWZYgUVJ16Y1E
	FcGrS6+tY6kBF2WvuW3ymbLHQCoDQqmENmY6//r8TO/vkCdxvqCWhAEhbPjf3xwVNdU0RbU5FVZI/
	w7AuUOy81AlkXcrRmki3MELqJ8jWzbLa17jqdDG7tgwcgB+1CldM8FejAi473MWOw7yHWyOivp1Jx
	dSO6ENU3MfJmkHkqS55bb0grWB7CQRqYJecum/7QNgV3+ji5t+P/HIPf3qgxrBnz2qhe4R3oKtBVK
	bwHUMlLg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRlNa-000Dvm-2J;
	Tue, 26 May 2026 08:35:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRlNZ-000M6u-1f;
	Tue, 26 May 2026 08:35:06 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: mxc: fix irq_high handling
Date: Tue, 26 May 2026 08:35:01 +0200
Message-ID: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28011/Mon May 25 08:24:46 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_233514_091405_5A4F861B 
X-CRM114-Status: GOOD (  13.58  )
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

If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
enable_irq_wake() is called with -1 which is wrong.

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
I don't have hardware to test. I just noticed this by code review.

Changes in v2:
* Collected Frank's R-b

 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 647b6f4861b74..12f11a6c96653 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -469,7 +469,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		 * the handler is needed only once, but doing it for every port
 		 * is more robust and easier.
 		 */
-		port->irq_high = -1;
+		port->irq_high = 0;
 		port->mx_irq_handler = mx2_gpio_irq_handler;
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
-- 
2.43.0


