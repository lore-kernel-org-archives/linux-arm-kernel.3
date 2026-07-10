Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E542C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isACK4Sk2FdOlRcPGSslYL4Bo/9u4naRkkcgO3aixFA=; b=Fffu5YIg3V4wJLbwDG3ZDYHLrg
	PYFCjwi1aGpHD5hIjCo0zMlUgd3guvVV5Y4nF/ZqwMj/3g4zAyCfLyZfsHZsNQIZ0iUiLkJDNbVos
	uTM1M76nghgq2LJBTiPqUPIbM+51T7wrcrt32/iC40RbRVjGI0wwFDcqs1q/6E+G0ka4GX+uAy/At
	0cK3MSmpDfVmOpgxpQdBByGYrLDnxT4vfywMF10Fuz8GZzVK7/Ro/BRrABusk92BqYPz5sgAEE/bm
	AE39RTRRjl0FiD9/OONgsAnG5ytN93z6oV3G3/04/bFYX1VThTqLzCPNygLyEVjgnEysjf/fuzJmD
	2shwR6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENs-00000005KyI-1Bsi;
	Fri, 10 Jul 2026 16:47:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMy-00000005JKV-3P8N;
	Fri, 10 Jul 2026 16:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=BNl2Fn08aUkxOhWB1xQv712EcMXS1inZZsIZsld0Xl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AUqe67x/ZtquKA2YD/Nz6YUwPLO6XcJ8eKOy5OdfOE3NTN9de//boWyPAi2i9InWz
	 fBrqabeJ32F+8fNiLEQs8njWuzoZyDyIpzsMQevQDoLf5oMXoaqoYXnr8YoyaQFpSj
	 dXOT/Xvs5CqEGEGpx3hmCplkt97zbXJrQiojZ2o/p6W1HuoLkzIKRACdL7yITMBCqE
	 LZjpvkNAmnuH9houP59JvLIJ8GczpbVAjQ+2vhpVawOgjZ8t4CPz/lwYytxV5oyJ+s
	 9xRmiVtgepAkIsMmLSCZT4vX91MJq2K2KvgpL6xzOxTVYDmqZToBtVmHNSJ+sqJj7/
	 iTz0Cee9n8PVA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A9F217E14CE;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 18291480076; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:10 +0200
Subject: [PATCH v12 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-32-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BNl2Fn08aUkxOhWB1xQv712EcMXS1inZZsIZsld0Xl0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdmX8P61+Usbf8aM4mZbcdyVTC6ApzP7I
 xNHRYHr+VY8D4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaQBgP/RuOFUVNpwxGF9p6Rx8Da9Z+UP9bowWSo33x/69xr/UdAiipnYENJ+pIZSLtQeno+xa
 jCA6Lqs0xGvJc3T2RotOJx7lP1CK/uosErAnhhD/aOllm9hKIDPn4hXPC13ZyMwxK6Zdg1m3QNr
 DVR9WV4X070/NufJD9obFBnvheaU9kBMlbQcc07pzUv7sjK6kPAf4RTATq01xYUO3aENmmvXgkR
 ZssHt75R6rlYuFy3tsiw8JHopKjgtAs1iVDA54Foz3WCX6AHI49vgRojLx530j6ZMQKN7KWgeDQ
 iSKPOa7HOrCR5WevRsDlzbxW70knVyu5XDgud03s7jVTIKZQnkCe+PhwjaUqv2d/T5Guqz8eYnm
 0cVLxJx93X7KV6ELiHRWppq9l1RH0zOz3+Lhy1r3cqym1/f4Wo57VBngi5luxOhEjCqVXR+3IM7
 9x778iwPY4igO517XjRYG6PcHZYTXCkdwCGeGhdXR02IFCi9OXTUImWZIwsjHGzmz94wn49a9Tq
 +XfPBaAbsPzZHKPtH05q2AlWA8sWSosn7sC6W5/R5/+5dhdeh6uunmNId+xKGm74t+5Yeb5aBM/
 NFlhJoQ6S6i5oQY8wUavQFic5WN01TGZBJu7x54h4sjBQP63hvPmLgS+TEiiK3zf7EKY+h41dpq
 bGpVGUUPgKSRpEm9mLYQ0tw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094633_060027_E0FE3D9B 
X-CRM114-Status: GOOD (  14.76  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its probe routine
marking everything as off and later on does a re-init, which avoids
the problem.

Apart from that rk_udphy_status_check() is called after the probe,
so it should not return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0333e846ce34..cf173276bfc0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0


