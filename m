Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EC1D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EdOKfzZ01O67SP5Ml+fXS/xdGTFEoMvJNRoq1JoWc4=; b=VGRRyVwY5akvoj8JFQTLuPR2eR
	sKowYOrwHXbpWYTLl1bvDj8QgwXUd4IMAC5Wgb5Sq6GqQTpFQwIph8ImSL4wUhXJ9zvcWNQ2xFseL
	FF10DciuFvyd3UNAwhEY8oR9obKBw6pTnnOY0QtX88JhA6QIdzRDQ9HntiJR0hFdlucGw+bV9xdgO
	LOUgIOaLe65UB2Hsu6b7IFPaPJ7nDnMcT3qezYOwNWCc/iV3HaqBB6c5o9b6okHMedDE63VpBfTPC
	+KheFiaqTdSmSjz0d5X3+kvxgYZww8Jj52a0wNaQxpDzNczy/q29WjfhByZf2F+4w9c3PbKKcJNNT
	/UOtfcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM4-0000000E8Ag-0eyO;
	Tue, 09 Dec 2025 10:54:04 +0000
Received: from mx-relay93-hz2.antispameurope.com ([94.100.136.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLv-0000000E860-1NlN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6EdOKfzZ01O67SP5Ml+fXS/xdGTFEoMvJNRoq1JoWc4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277624;
 b=ULXjXSQOSBwzYf/9XyI15/OD8JERgS5WKL60+NF7ohCmyGmGIbSwUbnvtIeAnw4Jw41TggI4
 JaRR5FF9wrT35W8xTnoCO8ancJSxxG4Ns63vlnOBbJRB5O8xv5nJ01Z5RyeEWJWyWs0Sg1ERPnD
 ZZ6TXlUm5Rgsd/P98lM3p454B32cYcg4LSP7UeJGiNSaX5jLKKES4FRKEDT83fDbsXdPQUkZlnr
 6Q7tvqhEvdVQlfSxwCArpV4V9fMcRICDjBDR11mIvPLlTSzKG1flMwDk/+0A0n8xzE0xqsllPvm
 wiAZwk24VwzjJQvftSYSBQeAOBKrUeGq4oqTRoWOwh4VA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277624;
 b=A+CljQHRzwo85YpJL4HyvdXtTJ8TtV8ilnEMF3/UqUt1/ckw51QrR9a7Kajje1ZHc5BFOtZO
 zV4Hjue34SMLJ4pHNoIX2vnrnobxzjjGypySUblKemYx+Yys/dqsdR55Hd/ygTZYbp284ej9iWS
 Hxx67ANe7fIbc8wkZxdmbUFev8xgLlQCyF2QHfDGbE1U3KthC3qC/rJHXquqUxKZKpT/wq3gR9P
 Qio73o3heqmVUYuAXOc+cOZ/G5ATLWRI+K5lJQgaHQstysjnPSxe387/gd/ItZdv5h9csn1QTsl
 H8FjR4CN6zggk6yjnZVj83gLE0SWhExGtSFKkKClOjDfw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:43 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D3D6DCC0E95;
	Tue,  9 Dec 2025 11:53:28 +0100 (CET)
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
Subject: [PATCH v2 7/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
Date: Tue,  9 Dec 2025 11:53:13 +0100
Message-ID: <20251209105318.977102-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-body-digest: e54c6801c37c73ffbc98dcd4d28a370f
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dQbLK45Kmz4QZMg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 357d07ff5100462428c8535adff74f8f
X-cloud-security: scantime:1.955
DKIM-Signature: a=rsa-sha256;
 bh=6EdOKfzZ01O67SP5Ml+fXS/xdGTFEoMvJNRoq1JoWc4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277623; v=1;
 b=YvGlvbDEOYJi7+LsME/oTTXXR0XAN0fOgBhFnwUUwMdZFKDretE3WdvkoH0Ka/zfNncRMR0w
 +Y3m+/+ciSABTz4DmS01a2x+3x6BhfxfjDYsd5xcwfPa5vKgdv82u1avTdX/M5L+WPTF3c4UrGW
 epcn1l0KnHh67ZTSKjF2eNpL0bBtPkOBx64xMTcxMMwnluUKIFN8x/UO2G8qaAVhEseiAmsWqaX
 DbFMoBlDqeHLeHpRu/zlgAWVM3YbsHIdKA5kkUyHW7OtALqyZXfmcf5DzlGV4blSMWC2rcyzArC
 hleWfMOIn3WiRyWjb86pwSbNRFdnBf7aYWREpyXz0PAaw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025355_534945_4BFFE6DA 
X-CRM114-Status: GOOD (  12.38  )
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

As per datasheet of the HDMI protection IC the CEC_IC pin has been
configured as open-drain.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 67fe1f63fd93c..30f0e81c4be00 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -704,7 +704,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000154>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_gpt1: gpt1grp {
-- 
2.43.0


