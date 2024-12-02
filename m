Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF59D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJCF6u9wmsGGL1HlWysKRP9xUlakLUGKtnCwf31e46U=; b=TRC+07una/PfNC1pf3j5HL7hqZ
	XojdgQ99S3KjWKx5RpFPFF5xHOTsIhnle8KxxdY50nZK56zapL/1XOcBmNBcOjnr9Sw4RTidRISHA
	17K5YpYCVY/JxuRMRn7UFh7jMD/YTdXgtM5e5+E1GSKwuIC2bzMgOOO80G1b+9Jkl5kiNXzzIXFsF
	JC79imp4RvSu9k6YqR7pw6w2HYNHhWSV1pslZkiNsZVNxwuEkzlqYkvww2zOi/Gdy71X5TrGl4tHR
	jKdWT6AJUB0BkMjdqwDfz3JYR0liRNui323bzltkAxDDbH0lmj8mxuJatW3syVjRU4DM3kArRGe3O
	9EcynpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0o4-00000005HUw-0HAS;
	Mon, 02 Dec 2024 07:25:20 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0k9-00000005GOR-2FXH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dJCF6u9wmsGGL1HlWysKRP9xUlakLUGKtnCwf31e46U=; b=iDmF/s5NGg+nYBMMYP+uLupgxy
	O/r2QoBPik5twG77UUbKUGb0+1R0NGODqhpCUX6BZ0pWEJDzYxxhyMgV5kel7GaM/4Kz+PRCfHw8Y
	pVseIn0zeGe7JYziouh3b2BfYp6IQo4qHVvlWhqQLS076HFWH5xmwxS4EL+5eB7Rc+AjjxSd42BBB
	1kh//I+4gOBokTPRraBjxxKjRxGc7EZiJlf5uSpLecJXuCqsx5PZe+3IVUcce6nbxgtupJOVuESg8
	hAWmiG/K+BImtpJZlGjxzvjgdOYirdanItvPIDa7oT+Zj5q7XR8AcsEiAegM9EQT1bCPNTGLfT/wH
	+RA6U6Iw==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0k4-007Bva-30;
	Mon, 02 Dec 2024 08:21:12 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 02/15] arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
Date: Mon,  2 Dec 2024 08:20:39 +0100
Message-Id: <20241202072052.2195283-3-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232118_042590_F03B8AA3 
X-CRM114-Status: UNSURE (   6.95  )
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

Not using pull-up on the host wake-up line triggers the wake up
immediately after device enters suspend. Fix this by enabling internal
pull-up and setting interrupt triggering on the falling edge.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Teresa Remmet <t.remmet@phytec.de>
---
Changes in v2:
 - added Teresa's Reviewed-by tag.
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 5eacbd9611ee..31d5c57d3c24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -255,7 +255,7 @@ bluetooth {
 		device-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 		interrupt-names = "host-wakeup";
 		interrupt-parent = <&gpio2>;
-		interrupts = <9 IRQ_TYPE_EDGE_BOTH>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 		max-speed = <2000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt>;
@@ -332,7 +332,7 @@ pinctrl_bt: btgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x00
 			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x00
-			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x00
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x140
 		>;
 	};
 
-- 
2.34.1


