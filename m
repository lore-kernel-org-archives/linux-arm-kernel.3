Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUHEDGkMN9I7ssaEFo/oqi5+Z6MBCQzWgyFJRASPt48=; b=Qct8+GhjZhqWMTLAL26I0SlAdQ
	e7Mtz2hoPl8hP6FNE27J2bzeuq2gXxrIrr7rPTKqwUjjOjYKN/ACH9bn9+npDiTQgvaV/2RNfKnwu
	8TFPASD5jLnQC1ptZvewazRy1s1Cda4NqLyN6J5ckOEi6xfAyT5NtIMdkG8ND05lakkytJD3YGLpy
	S7IlNtDQ7xCDP19JYqvpYnuoufU2i5ubsrxfmpQPaZbTSTJ7bXosQz/K5LdKrczXgItt3AXVIXtoI
	yh8YgS2KBllAXPArpDAhYNgTrG/2cuk5t/WtkRPIyQagYswp4ZT8xbJhFOet6tZjOP5AqC8G8RgDw
	g9OkxjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1aL-0000000BeXX-17JL;
	Tue, 24 Dec 2024 09:52:17 +0000
Received: from mail-m32118.qiye.163.com ([220.197.32.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1QM-0000000BcgE-3lYP;
	Tue, 24 Dec 2024 09:42:00 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aaa2c23;
	Tue, 24 Dec 2024 17:41:55 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
Date: Tue, 24 Dec 2024 17:41:52 +0800
Message-Id: <20241224094153.3816923-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094153.3816923-1-kever.yang@rock-chips.com>
References: <20241224094153.3816923-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkgfTlZDGh1DSx5JGU4aGR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f80b611903afkunm6aaa2c23
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P0k6Cyo*CDITSUoaSzE6Nwkq
	DhMwFElVSlVKTEhOS0hISEpNTkNIVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIQ0JINwY+
DKIM-Signature: a=rsa-sha256;
	b=R1H4Zub3vqK6hsEktHoXkg0j7i5+FbRcX8MzDknxLgeOEEHx2dzm05yh7SLm8wWaOXiPq8DIrDfij+gCda8RIyCWenpP8mI0iJ36FaJLKDl9qT6PLIaqH2yqZiIJDprMzQ8tvWTc1qF2nBzqjuzSeWoVUVlDIdoM75AWDRCnk+s=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IUHEDGkMN9I7ssaEFo/oqi5+Z6MBCQzWgyFJRASPt48=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014159_121021_3BFDEAF1 
X-CRM114-Status: GOOD (  13.46  )
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

This adds the necessary data for handling efuse on the rk3568.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 drivers/nvmem/rockchip-otp.c | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index ebc3f0b24166..a04bce89ecc8 100644
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
@@ -53,6 +54,8 @@
 #define SBPI_ENABLE_MASK		GENMASK(16, 16)
 
 #define OTPC_TIMEOUT			10000
+#define OTPC_TIMEOUT_PROG		100000
+#define RK3568_NBYTES			2
 
 /* RK3588 Register */
 #define RK3588_OTPC_AUTO_CTRL		0x04
@@ -184,6 +187,70 @@ static int px30_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+static int rk3568_otp_read(void *context, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct rockchip_otp *otp = context;
+	unsigned int addr_start, addr_end, addr_offset, addr_len;
+	unsigned int otp_qp;
+	u32 out_value;
+	u8 *buf;
+	int ret = 0, i = 0;
+
+	addr_start = rounddown(offset, RK3568_NBYTES) / RK3568_NBYTES;
+	addr_end = roundup(offset + bytes, RK3568_NBYTES) / RK3568_NBYTES;
+	addr_offset = offset % RK3568_NBYTES;
+	addr_len = addr_end - addr_start;
+
+	buf = kzalloc(array3_size(addr_len, RK3568_NBYTES, sizeof(*buf)),
+		      GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = rockchip_otp_reset(otp);
+	if (ret) {
+		dev_err(otp->dev, "failed to reset otp phy\n");
+		return ret;
+	}
+
+	ret = rockchip_otp_ecc_enable(otp, true);
+	if (ret < 0) {
+		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
+		return ret;
+	}
+
+	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+	udelay(5);
+	while (addr_len--) {
+		writel(addr_start++ | OTPC_USER_ADDR_MASK,
+		       otp->base + OTPC_USER_ADDR);
+		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
+		       otp->base + OTPC_USER_ENABLE);
+		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS, OTPC_USER_DONE);
+		if (ret < 0) {
+			dev_err(otp->dev, "timeout during read setup\n");
+			goto read_end;
+		}
+		otp_qp = readl(otp->base + OTPC_USER_QP);
+		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
+			ret = -EIO;
+			dev_err(otp->dev, "ecc check error during read setup\n");
+			goto read_end;
+		}
+		out_value = readl(otp->base + OTPC_USER_Q);
+		memcpy(&buf[i], &out_value, RK3568_NBYTES);
+		i += RK3568_NBYTES;
+	}
+
+	memcpy(val, buf + addr_offset, bytes);
+
+read_end:
+	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+	kfree(buf);
+
+	return ret;
+}
+
 static int rk3588_otp_read(void *context, unsigned int offset,
 			   void *val, size_t bytes)
 {
@@ -274,6 +341,17 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const char * const rk3568_otp_clocks[] = {
+	"usr", "sbpi", "apb_pclk", "phy",
+};
+
+static const struct rockchip_data rk3568_data = {
+	.size = 0x80,
+	.clks = rk3568_otp_clocks,
+	.num_clks = ARRAY_SIZE(rk3568_otp_clocks),
+	.reg_read = rk3568_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -294,6 +372,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3568-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.25.1


