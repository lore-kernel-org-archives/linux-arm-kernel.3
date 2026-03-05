Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEF7F3D331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ngiLaVCA85hGhw8n+Td0yCrIRvJxsFDKHVUsZ1Svyg=; b=Ho3gu6f6ATKqUwdnRhVDa5lFE3
	rRdkwVgct3UIF5Ri20clMbcUviTM2EYwRJ4JHq2BDdXZslVM0ZfU/YSPUJZXJk5gz8yIJenxgM97X
	vFX5X4A9HMbF+7kqYd/2XUMDpCikFuQNdknCMBrh73QPbsIJEETajDI4bddvH05aWKlQpDiuu53Wh
	MvV5XwyYrJ8Q5HatNMlFligFszuSnysOhmwZgBuxN3yD5wQ2ezjz0aVx+aVBYF0VHsZR34PFlcOSb
	oCcaUslv1DpRdogfU6oMgSqmhssHlEQDsTL5UQAnLAp26S3EETAukVGEpzOf+ZrdAnmEYlJpQI/Mt
	2BGX73ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBpr-00000002EFE-49UA;
	Thu, 05 Mar 2026 16:46:03 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBpp-00000002EE5-2dwX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:46:02 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8ngiLaVCA85hGhw8n+Td0yCrIRvJxsFDKHVUsZ1Svyg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772729153;
 b=O6OCmWcfKwpY6MtvYTZEyf72s0VRusBRrChxj9/YJJyxrzRr8U6mYMFT5pClMzjSS9y4IGtR
 rlkG3U2ML4deJpHpBR6yWE1kGW594NLZvMAX9yfDolGDQSt4zvwWVhXsu+ggHX8Z8TEo9hRa8Uk
 ZV/Xt6ix66xsm6xVYmwGszF3BBYf8VxpcXmEsUlBuqdXkOsRuttrqrnmdRFifOVyL3xICgTGkiB
 z23dRbljTA0Yfsr+8N905w1VnnHiDelMciMoHeKcczU2LYCOeHsOzjetQ4Ovn9ClIL4lBBl0bjs
 cOAj+CAX5Lp8lhdxGBsLl0KHPvDVmz25n8CHjJvo/EYEQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772729153;
 b=ewxLHM6df5uSW9ExVPkGYvRSlzKBNaeUbRdc6gcLKgJXeav3djtrlRKVfApBukVHaHuV7MD0
 B8hnXLSDEi75JCUwgmrAjMX90ZOFhfxy8NAzgDx1EIM6a3qQxdzv2UxuCm1d92hV/yN4dsgZvhI
 mrFq2Eq0WKYUeaC7GJUYlH/B3d7VhFHuoViK9ejI1Lm40+9NgcRd949rALH2wRdn1clqqPM9162
 /7wYr8rWK4ddm/B6u2zgO19CCIUvzVl1n+Kz5o7+YInymD1y3c7ToC57JpsJIENCnB3/a4HZmEG
 rSEXrwRR7wv6mv08BqWG53hDS7bFfI3QeL0ESwXPE46/w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:45:53 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E957CA407E8;
	Thu,  5 Mar 2026 17:45:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tqma9352-mba91xxca: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
Date: Thu,  5 Mar 2026 17:45:34 +0100
Message-ID: <20260305164535.2653745-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
References: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fRb4y4zlgz4MYsQ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2cfb841dcaefcfe296d25fd5cf87c6d3
X-cloud-security: scantime:2.057
DKIM-Signature: a=rsa-sha256;
 bh=8ngiLaVCA85hGhw8n+Td0yCrIRvJxsFDKHVUsZ1Svyg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772729153; v=1;
 b=qxt4BwHjieyfS6FqWY014MVB8DIbes7pjdskhoDhTy5uy2Ya+tqENEHZ1mptPwgVZKHEECwh
 /rTkgvwWr12S7KWR3Clv3lIk+rfK+nuRZjysy+2VyXhsz/o5zeYObfZ0jFxCk9ZR3bublvmk7RI
 MwjrMfzobMZEdQqbIikE2UdItX6WHHSn5hugdK9WXUEIv2uJAKIOJDyPp3q7CtN6gSLXqbYBEb3
 NnPtWBYErVF6F/e0+zj+s+UtuAgUaTVtofyO/ilTgKqYN8f19cEIZY7Dv8TmkOnENeQX+zjyWuk
 oN0/CI4EjLsw2lsyTcNGa+j0n90cdkBuQlsAoPjpMrBuw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_084601_815318_88FF1EFE 
X-CRM114-Status: GOOD (  12.78  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Adjusted the subject

 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 2673d9dccbf4b..737326ba1b2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -232,7 +232,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -265,7 +265,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
-- 
2.43.0


