Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5292C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljDGBtz+ECPARFnAYybal9Xk5SoydAvNr02UpW+gUnU=; b=NolTDBD4nm3xtcQOzZsUhcF6eL
	RIruCrgQCDwNiYv3LwJ+VGScZxRYrnfjpBph0cnZf/T7sKfk5Qo1G0lEM4cOmd30OlMA2RPrihdVl
	ZKNgx7r8HH37URod1PU0B32ZOlhKTrhlGo7xuWIbzAxlj4XGEjDcjSGxjB2I3SFOrBmJWU2OlR5DV
	mfNitQ08d2xGh00yNl5YdTeFmh1LHF20Nh4wI1bGKCN5Y5sGMfPM4/I6tPvcSkJuGwTVAnaETUNkm
	Ou4dY5d1ZG84Jk1RPgyUW94yLj5okDwK1IGY66EsDSrQi96THC5r8EbhSuhMgmN9kq2/kX3eotx+U
	Fxh71syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvn-0000000Bjlm-2ri5;
	Mon, 10 Aug 2026 12:16:39 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvX-0000000BjCB-1qpn;
	Mon, 10 Aug 2026 12:16:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D023AC0519;
	Mon, 10 Aug 2026 15:16:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364181; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ljDGBtz+ECPARFnAYybal9Xk5SoydAvNr02UpW+gUnU=;
	b=N2+uw0YrWpAznT6QUje+zq98tMayjw1+FZqN5pbWXi9R0wli+JgY4WMlGZBfyHcQK4HX/N
	jW3oexTHLs0xyfKuBQCEXvnOPAv3/6XPqV/chabvBcuq7/LQFlMlpaho3TZKhCpjryGJDK
	ZOS09MhJoaE808AOguXunn5CWqhCiWVjK6r7YADwGPi4QSmNuRbg+lTyzyyDSBYaMFRrrc
	HXXY1GVE7RFe6odL+odm1Shz2+kJBVSJmw6qGYqh+edD1dvUD+3Oq4yhwmM7YfLpL1xuLq
	kum8Si7YxSkdfv8FapPG+RfpPMkSuKLFN+THmvQSyDPcn3rS7iLndXjw6QRmFA==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH 18/25] spi: rockchip: Add support for RV1106
Date: Mon, 10 Aug 2026 15:11:09 +0300
Message-ID: <20260810121121.210040-19-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051623_680482_81F9021A 
X-CRM114-Status: GOOD (  11.01  )
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

Add the "rockchip,rv1106-spi" compatible to the match table. No driver
changes are needed beyond that, since the controller behaves like the
other Rockchip variants already handled by the driver.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 drivers/spi/spi-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 231fbcf0e7aa..447e6ff47c53 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -1021,6 +1021,7 @@ static const struct of_device_id rockchip_spi_dt_match[] = {
 	{ .compatible = "rockchip,rk3328-spi", },
 	{ .compatible = "rockchip,rk3368-spi", },
 	{ .compatible = "rockchip,rk3399-spi", },
+	{ .compatible = "rockchip,rv1106-spi", },
 	{ .compatible = "rockchip,rv1108-spi", },
 	{ .compatible = "rockchip,rv1126-spi", },
 	{ },
-- 
2.47.3


