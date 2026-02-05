Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AD3ECD9AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83LLaWI4nvP43ZuSD+xZcE4d6TH7dZSlprk9pVcO6SM=; b=DMYdEpyrfYeK82moE74Ni1TsMJ
	7BPihJqyQmF0PXK6BlFhF9UsMYztGSKbtCX3lxS4BY+6NgD/Eb571d3IOOdT6pkMJY8j/pnCGOKpa
	GQm5lRWxz0pv1equV5tCvOjjKTkfI47sJkvEspxyGbYJcyVOk3X9qWM3nLjlmX6myosChxuA2lsp8
	oiHZV+u0X0NqT9WhFBgZxs8yH6fZ5WrOvro9gA2ewNtX79c/GfEweWu2Zb6Sow/a+5x9UoCZHIqt0
	tCtVWtGETesS9UbQ10b3mdb85gPiLyhLZU5b8hCpZR+fJSb2j+RCyI58OArxwhlg5tQTTpfzKYRX4
	JKrFzlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lX-0000000AV3z-2NmX;
	Thu, 05 Feb 2026 21:19:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lV-0000000AV2E-0j5l;
	Thu, 05 Feb 2026 21:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=83LLaWI4nvP43ZuSD+xZcE4d6TH7dZSlprk9pVcO6SM=; b=jAG+wxtWyf/aIzCpe9BmYMSGMo
	YyQrSVg4rt3t2I3QEbgeE2od7J5aDY25Q1nnZAY4l8iaXezOGlEJMIx6L/souB2FEyXn5qgUvriEi
	VaZEfbRoaOsvnFwwmvfMxQA9nr7Ol+HEVxz8snH+IbYbhwpBQfbxNxn3wWGhJuBP9JOrZkXaaRd8d
	i17kk2gsFfvzgg8+A4UPq+6aAya2yUXsJnV3zqane9zyYCsFyXo/qk+P5Zv9Z4hxMgbrlVHcXLvNG
	3wRYS45lo4xENy/jYW9iRXG/EAiF2R0cWwawqdgSLlojyp4VZ98qmqMiS+CCCSUUUcM44UO2skBsw
	NF2AZeVQ==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lP-007GGK-9G; Thu, 05 Feb 2026 22:19:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 4/6] nvmem: rockchip-otp: Add support for RK3568
Date: Thu,  5 Feb 2026 22:18:59 +0100
Message-ID: <20260205211901.490181-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_131953_276911_1E182098 
X-CRM114-Status: GOOD (  16.13  )
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

From: Finley Xiao <finley.xiao@rock-chips.com>

This adds the necessary data for handling otp the rk3568.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 45bbb6147fb7..cfb69bc58869 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -27,6 +27,7 @@
 #define OTPC_USER_CTRL			0x0100
 #define OTPC_USER_ADDR			0x0104
 #define OTPC_USER_ENABLE		0x0108
+#define OTPC_USER_QP			0x0120
 #define OTPC_USER_Q			0x0124
 #define OTPC_INT_STATUS			0x0304
 #define OTPC_SBPI_CMD0_OFFSET		0x1000
@@ -184,6 +185,58 @@ static int px30_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+static int rk3568_otp_read(void *context, unsigned int offset, void *val,
+			   size_t count)
+{
+	struct rockchip_otp *otp = context;
+	u16 *buf = val;
+	u32 otp_qp;
+	int ret;
+
+	ret = rockchip_otp_reset(otp);
+	if (ret) {
+		dev_err(otp->dev, "failed to reset otp phy\n");
+		return ret;
+	}
+
+	ret = rockchip_otp_ecc_enable(otp, true);
+	if (ret) {
+		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
+		return ret;
+	}
+
+	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+	udelay(5);
+
+	while (count--) {
+		writel(offset++ | OTPC_USER_ADDR_MASK,
+		       otp->base + OTPC_USER_ADDR);
+		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
+		       otp->base + OTPC_USER_ENABLE);
+
+		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
+					       OTPC_USER_DONE);
+		if (ret) {
+			dev_err(otp->dev, "timeout during read setup\n");
+			goto read_end;
+		}
+
+		otp_qp = readl(otp->base + OTPC_USER_QP);
+		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
+			ret = -EIO;
+			dev_err(otp->dev, "ecc check error during read setup\n");
+			goto read_end;
+		}
+
+		*buf++ = readl(otp->base + OTPC_USER_Q);
+	}
+
+read_end:
+	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+
+	return ret;
+}
+
 static int rk3588_otp_read(void *context, unsigned int offset,
 			   void *val, size_t count)
 {
@@ -280,6 +333,18 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const char * const rk3568_otp_clocks[] = {
+	"otp", "apb_pclk", "phy", "sbpi",
+};
+
+static const struct rockchip_data rk3568_data = {
+	.size = 0x80,
+	.word_size = sizeof(u16),
+	.clks = rk3568_otp_clocks,
+	.num_clks = ARRAY_SIZE(rk3568_otp_clocks),
+	.reg_read = rk3568_otp_read,
+};
+
 static const struct rockchip_data rk3576_data = {
 	.size = 0x100,
 	.read_offset = 0x700,
@@ -311,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3568-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3576-otp",
 		.data = &rk3576_data,
-- 
2.47.2


