Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA3C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku3uTlcU3+slq8eyYb3I2vaPU9xUB8K+yF35OsHRHyM=; b=YMvhXPGX4NtywcgLx7UKfHH1eu
	fbC0EI+5/HGmCi6raijTVzHo2PPPmx2IqCPWb3z5Nwn41wy/6HS/MCeXigcUPRgSvK9ZdSXrcZ11d
	if6mnzAItjgDcppaAMgqyrfmoEEsJLCZvPUqfz8OCKbgv2LF0CwcK5xq0by7wh8ft+P5sUhStAhY3
	9d0nKbr5bzVmcUaGIRF8zJpdDuULbvnUqgzCbWJ8WNVwA62rStcvJHjSmXZ7gNxExLpAt/ft4Vzib
	S007W3ED/QnZGIgkIQ9gnmhNoDXrUaBmI2nZJOr937FexX/LYUUOYpbrP5Kq8FYRQ3jYRBOYyH79j
	G67/HNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUa-0000000BRPb-0FuE;
	Thu, 17 Sep 2026 13:49:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUO-0000000BRIr-3oXX;
	Thu, 17 Sep 2026 13:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652961;
	bh=UNAUWNTqDPEuEuXC9mWoAT2pgMMEmi++BoO2+4ivAP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QWtL5Hv64RSxvsWPTnFge8bSBeiW7EN9/oozxPtun3Kl0YtP1o69BpM3NYl/+XIuX
	 fuPVXt5eUbwlXp8GX4/2eRNuC6RuD/guFJF8xGSf8XEyVfXSMQse//35ODOi9+LV/j
	 PNbYM5zLPhmmENuQKahj6FbE/bBdeUyuRPGdU5mJQBuX6ns8RWm+9FExgLS3Jx+YmD
	 xRaJtDMuIKaNaXM0q6QHdecBYOcN01+QP6UUI7Sh1Xpuq7TnqAq7OU6YDFxnN29Ve/
	 tdTlMlYkBHDZ2RO+XCZZRQ6o/Vuj2Y3JpKYqsNW+9Mt6xpxhufGtH2BR2tpJOmV50e
	 vTQWC5moqS/Lw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4EC717E01C5;
	Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7B372480029; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:13 +0200
Subject: [PATCH 1/8] dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-1-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=C8FVn7J52GHndEtJHzBBi/WU5EQNwPsmo9I3eNfLHLk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+G5gRT1Y4SWiCAXtzY+PZrOUVvQFThyX
 3ZOnEBDhOdfyokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qavMYP/AzsS7ugEUE3K3xXEw6TD5yZa8uBWSquhlmiqN5Auuyx7WMZR7HIeQU9Af+oDbqsDC2
 UXrIuELVmKvxF3F9Sv4+f2zmLKnHIrbvf3Oh8uCeEPHcdnkudRDcSLWg+2Lv0dUY12kSgiZcDtv
 USUDx7WRjKSIvE+YsbDk2NtRU9DidmeWVej7Q8PvLsBGGfyola+lczebuEtXGy0n1CMvyUGLtkt
 QXRz3elKmfN7wXLnsNWN3SKjC/CF/9+2vSyIFMMMXwOR4s2+CsUKYa4XgMci7wO5W0E69gMWVim
 bx2AuSOKFt4mJgC//ARlzq06jEkPd0cRghW27LkxLbidVkV+qZIgezz2I4tN+Ca1QoP5dqSlWME
 vInOIo6gYPC6QPp9xSNjRB7UE3GCRybgdsVu5Zm9Cla42FyCawaHm2Hs3a4Z82uB9pgK9kmNvP/
 DDi1rJrk6RFK80U6tzYweqPeA2nPJTqn5hHZXfyhmriUtpl7eevmcaoKnFBu654dajaD2xCoxlb
 KifHY7ABV09ioBEeIWoNckhHUXN7Zj0E6wc9bBsVftPnXz28shCDyDBRTS1IaUfqkOyXf80hqgN
 bH8PFnHB9vINmMI9fJskWnt/aI3XogEB5MdEWI+AFBciiP1r6BLK+2YU5TbLF1UN1+3vvr8rr/Q
 bMc/s/Ix26Gbo/6DQrTkn5g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064925_101387_C112A59B 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On RK3588, each memory channel has its own DDR bandwidth monitor
silicon, and each instance of that has its own clock gate that drives
the monitor logic.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 7528034cff56..6ea25019ebb4 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -738,6 +738,10 @@
 #define I2S1_8CH_MCLKOUT_TO_IO		723
 #define I2S2_2CH_MCLKOUT_TO_IO		724
 #define I2S3_2CH_MCLKOUT_TO_IO		725
+#define PCLK_DDR_MON_CH0		726
+#define PCLK_DDR_MON_CH1		727
+#define PCLK_DDR_MON_CH2		728
+#define PCLK_DDR_MON_CH3		729
 
 /* scmi-clocks indices */
 

-- 
2.53.0


