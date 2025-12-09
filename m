Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F51D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; b=S4oy6qMvQoCPD7eueTdadcSvuy
	uXQvmfnYvhSxreVkNPjZtWo7ni8w1uBcu6Wl4JZ5I+ZCrMic8tZZQimjAF5IFD7Jz1L/v6OsF3pdp
	bY67AT3ZRxQu8Id1pACiVze/Y/xtDizfSHSlQXOW9Z1JCfHxVmX8Dvz2glzC+iFpgEK3P34+bQVYH
	z6W97rJgfD/uTrJe9uMrbwPKBNNSU2q+pskPh/u4m97rD70tZfg/x5Z1wx5kyzDFqLjkSQD8VWLi0
	48XulL43jBhtlB8Nzl/NevMzLfZuwO04H53U6AGAOV97RHVg9OtXyW5E+bA4YUmv2LCyId1XrjWfb
	qO0/07nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM3-0000000E8A6-3SBE;
	Tue, 09 Dec 2025 10:54:03 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLs-0000000E84O-3XN1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277620;
 b=n2VsvrhHTDaHYLccxeTv5Z3DMxgKf3Nmxsxsie2zlhuQ1r83FwFOEV94bP/6QWF+Os2ELYOp
 9eAGSRl8fXA0dtRtVQGwentjkF5VsNWZOaGxye4Ln2jDmkhtrrcMygvm6+ikhCnnQQUuCOVXTmg
 WmsIB+cnCRq315n1gw4QNSH87J3tHHLvGcMNgz1PYDq6hEoMY797yB7CacuLD0CiA2noe1dVms0
 RlX3kKLLQLfA5pqzhCWG2N0g9f/MlwS/yqWNfAJIt/Pq9FsXsyvtE2dQQVqyU4aGPgHt+Pi9ljy
 N07lc5HUtVWqC+dx3CIokcGAWWtYqQ7vOYs+/RqqGP6+g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277620;
 b=nMcH5OX+lwa+3ZIN82Pmy2zHDd46BnfFYOdgCoWVRu4Igv5Kqren7DpSxTWjvKq9qVuheO5s
 KW1V8Tn634qPq7/1cuBgmKtN9OQ9V5xZoxkcZpgsZ4+EujGAw3W71pj5PdkqK4LiInCJ1ORNmz0
 3M5lwS5piPbdBrrPt93qYH/iVJgTo7jVRmK7MWqygmNApmFF0Y492DT8mFU3IlRaAo4V23nnAht
 eM4SYrH0EUprhtArHxhs4p6pYGbKDK3OpW6dM7rfayEdFd+aqyx5kfkyrvdWMu2IjOVVUBV+HHg
 c5e0XTNxvCdkiaKuqvYedSV4UxmXH3rxbsUqpYw2ZMmZA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5A481CC0CCB;
	Tue,  9 Dec 2025 11:53:25 +0100 (CET)
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
Subject: [PATCH v2 4/8] arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
Date: Tue,  9 Dec 2025 11:53:10 +0100
Message-ID: <20251209105318.977102-5-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLG0GZzz1kNh54
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f72542e298952ecd7d6a450cc7cae500
X-cloud-security: scantime:1.806
DKIM-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277619; v=1;
 b=aHSNWECoe9MshSmTrn1LUhfelCfBcL7sZ/8w8ul0AVH6nsjB8cvgwD89Oc59g/Tc4vy01lIm
 etCyQ/ePWWel48cDlbBE1c4QYHIYucttZ/0qul41PJTAaN43TqFnrYY3FxSjHZOa9//vsXOQzaz
 eri+Fk7WKPZQvADuBsF3MvDFCy1HzIBgo72rNQ96/LxwcKxQ26/p/fbnLQj15+rYT7CY9YwtLWK
 BDMtQydT5juw1H+kDpATMBR7VjLl+o6urztmDmHz6tSL8DnMv1LaTMEC6EkvL8Z/Y77oUsfS2n7
 DoXMTNA/M6n8oYXNcpvjAEFFq7rUinXeR2ol6a+6GzxYw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025353_022450_02720A17 
X-CRM114-Status: GOOD (  10.88  )
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
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 03b75d4cf699a..ac889a69da69a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -248,6 +248,13 @@ sound {
 			"Line Out Jack", "LOR";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -290,6 +297,10 @@ map3 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -486,6 +497,10 @@ &gpio5 {
 			  "", "", "", "";
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


