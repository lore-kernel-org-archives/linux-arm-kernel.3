Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F77D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; b=bDn79N7wJoRtd2KxmDOuC2QgTi
	rcgylEaE11qKWLdkAQo/C/ESvLsD2W41rj5omgvlOT4++CEIHhMGxglmiXelnJIbzIgJcUVkj42UL
	Ywyp21rtK3DWuwNwhuMTO0Be6dJ6wDhl2sm8sEqQrol14e3sGewbXSoMYx4I3TW2Wtqm5kIOHLO6G
	LgCuwEQHgdXMe9ddSid7I2u7gYf5OvOPl8YydEhaigzN9/Ttkl89c+lx/NGU9PIn/gC6u4dPSXetD
	eAMEehBBr0To/acPZhpumsLph90H0UzquABGcPztCuBl302W5VdQhOKBnQLz6JVX3SdSVXOH2Au7O
	l/EHg2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM2-0000000E88y-30xV;
	Tue, 09 Dec 2025 10:54:02 +0000
Received: from mx-relay06-hz1.antispameurope.com ([94.100.132.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLs-0000000E84P-1sUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:56 +0000
ARC-Authentication-Results: i=1; mx-gate06-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277621;
 b=DNVDRxqErdF4vfOMacBU/FLXqJskTPLXQ2hXPdFiuPHQFUj8+sV43EXm0ULxrmlMnMmCYO2u
 LOGoLjOV0ZRj+f9Z01uoBWmwsyi6npwBCcOivscbbsDQvY20P5vxfgaavy3GYf0uwSpluaOSp0C
 F5Rx+NmyPTaHBqcJviJTranTFa//5F5DO5zPdVA9ZGXAPmtqqjDJWpWJn9vV9kAoc2Cq+iGWnvF
 qPa4+KrbyuhcgSnRWE6QAtvx5pWysROA37tGFJULS8xI/VKP8v0/7Kir6At8agY+1aWXHFf6QXi
 YiGn/uzlC3FjvAWehL1njunsvlYp9VPyAHSumnjqP1/bA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277621;
 b=UJArdKefA8uMNLA60+8WXLUF0bAxX6BbA6RDL5zEACgSc00bTXj6m0wA1EImZjlbPFbsQolU
 QwprhAG0Rl3WyTqknqynVUrN7pzWRSIftggFhGwteou8Lac/7WF1JaTlyryckHx4FKhHruS8hIf
 sNx/NTDPDssQJFO7YltLJo3KkksmypqRVykbhC5sYEs+0cly4jSK5wW2JiHYMgqD2W3OTMB1YFN
 hdDZb/Ry5XpwStIFM65Z26XoAco7RRqZTH5FtB2hJ751n0DmHzblgcx/nXQ4Cewc8NgoEutocc+
 3aJ3fPQXfvLQbTqlBjlYfoISqr01BWKXrLRbh+mmiZUKg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay06-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:41 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 78D3FCC0E92;
	Tue,  9 Dec 2025 11:53:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
Date: Tue,  9 Dec 2025 11:53:11 +0100
Message-ID: <20251209105318.977102-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay06-hz1.antispameurope.com with 4dQbLH1DFbz4PRJ9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fc01c51da6ede21ee2d8c257f7bd177f
X-cloud-security: scantime:1.956
DKIM-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277620; v=1;
 b=YvM+Nl8onkkOjtEdu8LlR579XQdIBSdjovLWPTnOzvs8W+myRoS6a3xsAL6G6NqWQNj1fZ/h
 41TNy4iAhXIyaaSkuQEK6cQX4T6U6MADrwWCJtSdCAvvBo+alhIQf4GA3+Ub1MZNa7tGEQ3D+YQ
 Ib6QWyBhxjCcy7CbnbfpQeZAqQpzANM/GyDosChcg2DzAWIaTsNYkfBM01bLI3T60bVLb8isJI8
 lGeUvXC0Wud/l+omdp2mIc5yy5DrF1z3cQHk6TYnelup6N+FOHj0TPIlIYN9iVXGZE5sVkfPQgt
 +twVudZQ3FpZKrsPMb6gu75LPolYCdxEEgbgpkGYNO1lQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025352_620628_0FB336FC 
X-CRM114-Status: GOOD (  11.62  )
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

The event out signal on channel 2 is available on pad SAI2_RXD0 which is
connected to X63 pin 13.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ac889a69da69a..fdfe246c56407 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -807,7 +807,8 @@ pinctrl_eqos: eqosgrp {
 			   <MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12>,
 			   <MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12>,
 			   <MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x12>,
-			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>;
+			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>,
+			   <MX8MP_IOMUXC_SAI2_RXD0__ENET_QOS_1588_EVENT2_OUT		0x16>;
 	};
 
 	pinctrl_eqos_event: eqosevtgrp {
-- 
2.43.0


