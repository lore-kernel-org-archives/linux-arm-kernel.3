Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD79606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJ7iVgqw;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mS31Dw1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpU4pmX+9zma9b0HMHe9OtZavzpqVSsVuDamqHfqBOM=; b=pJ7iVgqwz+lwNDhG4nAbSe6ZK4
	Tsd/7Rb2earnuq8TLq8Y6y8fk7d8mjUEb1bbGCwlDQ7WcDiWR6n0C2F2b8HHDMZ7mynY3c5QrHzsr
	ljKv+4wcem0fN6zlXgNtNYBrVGCaAIsRb7GN5klmqrK8e7Mo/RiPW75YbgvIkDwxRuJzZjv+tLLGN
	09AaHrbbz70GtiQbJfVZfIJvRI/oecUV/9xnVThqDq6e48m7MTA56R3WxQ/UnxDfc4I2D1gAfdz6T
	0sXqt2zgVU9o2TcuhAYVvtj4KLLRQdVdSn+Ctx/vjKrdGs2kecYBDB0cYSIKBn868MAvfgABb0oDI
	Slyn29jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6I6-00000009Igw-30qK;
	Tue, 20 Oct 2026 09:37:54 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6I4-00000009Ig3-0rvC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bp
	U4pmX+9zma9b0HMHe9OtZavzpqVSsVuDamqHfqBOM=; b=mS31Dw1N3PrN7zkDWi
	XwyomNptkrkBuly/amAqP+WmRRjI0TWr6DiJCqezSo/4vO5krC5Hr14I+iaRjKZK
	8QUVvFId3VA5yksxyZaF7ownrnZOx5VlX3RQovkSrw7Dr3GEqQFTWeF31QyQJ63m
	tFyyo8v6sP8oRkT6BduT0JPvY=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S4;
	Tue, 20 Oct 2026 17:36:42 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Huang Shijie <b32955@freescale.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/3] bus: imx-weim: reject devices without match data
Date: Tue, 20 Oct 2026 17:36:34 +0800
Message-Id: <20261020093637.1654161-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020093637.1654161-1-yaojiale02@163.com>
References: <20261020093637.1654161-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3_4ImNtdqupV5Aw--.29320S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw13XryrKw4DWF43GFWUXFb_yoW8JFy8pF
	40gFy3tryUWw47Gw1UAr4UZFy5uFs2k3yDKFy8uwnY9r95tFyDXryFq345u3WFkrZY9a13
	tF4ktFy8Wa4UWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzmhrUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AsoYmrXNis04wAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023752_590462_AD1E2005 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platform driver_override can bind a device to this driver without a
matching OF entry. In that case, device_get_match_data() returns NULL
and weim_parse_dt() dereferences it while configuring the controller.

Reject devices without match data before parsing the device tree.

Fixes: 85bf6d4e4b10 ("drivers: bus: add a new driver for WEIM")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/bus/imx-weim.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 87070155b057..3ecad0e453cc 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -205,13 +205,17 @@ static int weim_timing_setup(struct device *dev, struct device_node *np,
 
 static int weim_parse_dt(struct platform_device *pdev)
 {
-	const struct imx_weim_devtype *devtype = device_get_match_data(&pdev->dev);
+	const struct imx_weim_devtype *devtype;
 	int ret = 0, have_child = 0;
 	struct device_node *child;
 	struct weim_priv *priv;
 	void __iomem *base;
 	u32 reg;
 
+	devtype = device_get_match_data(&pdev->dev);
+	if (!devtype)
+		return -ENODATA;
+
 	if (devtype == &imx50_weim_devtype) {
 		ret = imx_weim_gpr_setup(pdev);
 		if (ret)
-- 
2.34.1


