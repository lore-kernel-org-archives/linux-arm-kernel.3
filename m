Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFEAD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; b=wXhGkB5jLoqhHJsuB8PQ4EXkgT
	ENoKEShQ3X55kHgG6e7+3h0YTCR/ZcAIs86oCSfpjE4f5/40GKtlRnCPbAzqSFQIfW3g+0ignlaDL
	SNLWrZLfpK9hcFI7he1A5GdkkBvEeB3knsqgrzY+50w779n1vwMywsxJHxoISvpxMMjuqbvMj3m8X
	RyCP7i/KmKWxcsEl+/mQlk2Qtf+InQPtd8G68steCv8MudNl6mLtj51IVz5r5sacLGV3T//jEb//A
	h3oRiu0u45AsM4ff/vu00uCGUKoXbSYsgjx3opfvp1z5mjf1pjqzPkDdK0UToCJsO4qHimvHcvCLo
	QDGDPXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM3-0000000E89K-0MJ4;
	Tue, 09 Dec 2025 10:54:03 +0000
Received: from mx-relay20-hz1.antispameurope.com ([94.100.132.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLt-0000000E84q-1xkt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate20-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277623;
 b=f4r9qAQEpD6xBZ9AidpZTO0Ub5sm73UI53fODm4HEpBwf3I2+kXhUQrUB/gEaOpcKGTaKg/X
 LUbrx/eyYP1OV3oTAs1cXUfksEd3c32rRwzLDM72sBJjXgzn2OB2JuS5/tKRmRVpCLMcYGjtusn
 Vg30AvGMHK2B/f8dzNApxUxFaVVBxEzMocLd9JOQ5q70PjMJefGH6EZEuJyTRTvtEEsbdG6cTQE
 MzG3rp+/3zdv6dGzTRJ0YAXMGvrt5cjWa0tn6ny9TKwSwgC5Sr5nSoVcTS3xrRPP4y0/0GWOeZh
 fb3H+4elpXSMFEU48N4eoJ6mp7sSMYroTzzWdxYBvfmxw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277623;
 b=RSwzaXIJ0TFuKoPt9z54+w9ReS9xS/woHsqxdeqfQpi9HqHFrSuvXO4Vz7qp/mr1qw6sRj9K
 MbpTdRdnkXhUg796gCCnhmpTxum1JhanY7c7y10mbPSMl6yd604cnLYwN2K86SjBM+4NvhRvI+0
 e43qauyFrASrThnjjRGGrqVo/lo55bwaSfa7Ck5JbCpbhmQOPSuuiRccX6RGwTwecMU0ulUvafY
 pM9ulRn5BrNKbVtTaPCErfqpiz/XKRg6YI4h7JYInxavvr5jHqzgHbv0HCWQhgKgiWPiC9Csi9O
 nQfLPDni3XCLde4FpSh1ZeTtWds1k5DAIJdZZJS+/nN/g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay20-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:43 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0FEE7CC0E8B;
	Tue,  9 Dec 2025 11:53:30 +0100 (CET)
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
Subject: [PATCH v2 8/8] arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
Date: Tue,  9 Dec 2025 11:53:14 +0100
Message-ID: <20251209105318.977102-9-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay20-hz1.antispameurope.com with 4dQbLL55ZWz1FXT7
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: cf2a083042aff1afc5f4aa02c5603dcb
X-cloud-security: scantime:1.605
DKIM-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277622; v=1;
 b=Sb/iyC8KAt7Yi4QJ9rvzFy+spYxoF4Gpmb/hRR94SAuRs5q+IYC7uH/c7qrYZ9Ll1Z7vJejv
 Aa2SFLe1sY8G9vi59N2KPjoZvGpgGsiucc0PB5I0lP6bk4ScxGI5Hc8xr2wmff6RVxpZ2+KtyR5
 1FO0vn0zT91TrbksfOi00ONcMotOpP/b7khwJH3lgygMGrAtRJua3LkmKuOR1akryrJa9L/qFTi
 aP7wUygo/N9WxxnoXi0qUeg4QGwOZyJAFTKErpMuMwmcsi/bSLCsuEZX5HaqQ9nh3Xr0bHobhNC
 KgeXf/7rbegtvMEH6757sVpw1qaELcSkNIgB04p0DPCow==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025353_640717_085EC808 
X-CRM114-Status: GOOD (  10.73  )
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

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 30f0e81c4be00..6e927ff1e967a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -159,6 +159,17 @@ sound {
 			"Headphone Jack", "HPL",
 			"Headphone Jack", "HPR";
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
 };
 
 &ecspi3 {
@@ -335,6 +346,10 @@ &gpt3 {
 	status = "disabled";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0


