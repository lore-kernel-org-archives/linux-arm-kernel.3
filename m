Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34601F46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+lQ3UMGEmSVPIolXgNgOu9XRCtVf1fK9RjoJaMgZkY=; b=4zBvEGNqhr0dIl+wnCcrrOwm+q
	Fg07suxH78V7Fs4DdlZe6ntiybd1n16T15bvNGWirbRbekkhn+8D1I+wgzNm4AdP2I1IR67QHWsg/
	Jd8KO5sD5rj9OqLdz/DjC5y5zccFRDFDhxR9jk4WbEqStkM4QlfgXvqnqBbrikfc9lQvpiC4pYoVb
	TVKYyd75dPB1lxk7Z43wMOmGsbU+PjTNzQDshBHgQT1dwX7QOPb25uyKS11vHw4DR1kVRtuQtiVvw
	z0TQv+e3Gh9hX3DlESxw2xjt9QX8REs0NDs93js/BMzxRvxMLDkYYUcMEfddogA6eTuL9q0h1qp09
	/oCSezxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4et9-0000000Gjnq-2qxw;
	Mon, 23 Mar 2026 13:00:11 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4et7-0000000GjnS-1Jsh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=E+lQ3UMGEmSVPIolXgNgOu9XRCtVf1fK9RjoJaMgZkY=; b=QX7VVrBYq2qK6WXc7sUB/4ygB/
	AlQ6sc9ElDGRL0KnG3q8A41jH/skcTi1rgKlttf0Ji9nlSsKd5dCzkhtrVmGhPew+wRd/5F9DR6aF
	g1j9lMEVGqCGrAi/VTNYF8pN9UYVlYEK9sUQE2/NR4g5kc0xJmOQjctQYQ2bJ+5135CC23rC0dbPc
	F4ZSIdERPsLlkDClYgRDMi4Q21RSEl2x08TZHApUhJ9G6KK/2lEGingYro/X9ZqRaFHXhiJytofXf
	EBPELlwSxSCAoPytD0teQJ2DCizDVJRoI6dYpz0wHeZxWZIBWrxjeoKbHiRqoBJMy6y2cg8uORDUz
	rYNPrV3Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4et4-000Jj9-2e;
	Mon, 23 Mar 2026 14:00:06 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4et4-000KoI-0F;
	Mon, 23 Mar 2026 14:00:06 +0100
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
Subject: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add vcc supply for BT device
Date: Mon, 23 Mar 2026 13:59:50 +0100
Message-ID: <20260323125951.611042-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27949/Mon Mar 23 07:24:47 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_060009_521392_CA94BF79 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the vcc power supply for the BT device. Fixes the warning:
btnxpuart serial0-0: supply vcc not found, using dummy regulator

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 94e2a7df35560..90d6b5ae215fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -587,6 +587,7 @@ &uart2 {
 
 	bluetooth {
 		compatible = "nxp,88w8987-bt";
+		vcc-supply = <&reg_vcc_3v3>;
 	};
 };
 
-- 
2.43.0


