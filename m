Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A69CC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Pm30ub44zTKGHxE0aPbrv2bgoiSldqz6oJY5L9MJCI=; b=145XWFFp9nmy8rv2Au7tohq8km
	DIOC7LvH5qCCMIxc4J7gs5ySKkcTqATZpO6wakJjfzkbBAnHMq+LyWQo9lyVRp1WCLsfAdLekcA7o
	bGzOoHAKt9fbUf57EMBNpm947TpV9q9rDm+wnHEgcgvyxitN68pYPYotAKpjB7+ymw+rDGZqi2C5K
	Q7k6KRXAzmhPH2M1BDp/UbRaKDuYj+HbItbhsRHWHYqerfJDZXBxgAzPOhoK5+ZWnJxn7vfkosjiA
	rp4xVchqE1t4Jmlgw22EtJkb5StvdaUGQQos8d7s9vzbY2WuXsghXirxKW1FNidNGZkq1p++0mIl0
	Vag5jHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1nY-0000000G6C7-0cA3;
	Fri, 14 Feb 2025 19:56:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07R-0000000Fp4O-38Dd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0Pm30ub44zTKGHxE0aPbrv2bgoiSldqz6oJY5L9MJCI=; b=Gp5IlEuEusw4I5Pboe+weLb/ev
	nITpoQclukyaTiwq0gpT0LGjPyfLmlh1aCZBwJ8r1AEB3C1KqNy9ysZubOef6MUFlatWU11v1Hyk2
	CspD7DoRmAUC8+0qJ+v5yIMPli6g55Q13nl8CRl7Lx+5ba0u5p9CPY41yziF2W89acWBavhWCNezr
	xBCoZHMA8O3qx5/n74b4Gri/lTFi9WHObDF1kq38leic3L4T5qUDpgEWmSn/668cd3k3XjuEK8Y3s
	rE4ooho+5donkCMsFNLWvtx3v7/X20sTtZrHZvXDRgUXlvqYYa7Jm1RYnsl9KdOnLXK1IZb5h35x3
	1CnrjvDA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07N-00000001J3T-2bGM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556530; x=1771092530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qPQso1ZYtWTmJIC7QhndAu/PixzdR+a209Sd11Fb4Ig=;
  b=O1QQ9WrTWeV3ado1zb+9ciGnXGCEzFzvw7Gd9UsOPIlyLbbxkszuqJDu
   pjt0crWNXTfa3j53Jonm5OiTqVnpl02XWtTtz3iRUJN/7qRui5aC/BMsw
   3hD1/jUK8mdabRZuJx8sH5D3948AJD+k0JvNzrA2YYAW0zNHQJhNza6JB
   XjrkzDAix0yXOgVDOvvnNR52zvSiKm6mpjMe7gz4o70vCPwYaGKoiiQsw
   2JFDv3938JaKqp6ZSMPhJJ8qaAxe7M9Zf3COYqNuXQGsVjl8ZP2NbQ3FB
   7MyDxvaZ3L/cLn5CXd2W4RMDMpy7qGP9D7te3/n0KCpexQ+Y8fV1a+MTk
   A==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: 2IsM7achQlmES/jyjdqu2w==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700928"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 4/8] ARM: at91: Add Support in SoC driver for SAMA7D65
Date: Fri, 14 Feb 2025 11:08:17 -0700
Message-ID: <84b4a7ec0025741bc3ab647671fd4e880b2ed1d5.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180850_070368_6984F29E 
X-CRM114-Status: GOOD (  11.69  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add support for SAMA7D65 SoC in the SoC driver.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/soc/atmel/soc.c | 5 +++++
 drivers/soc/atmel/soc.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 298b542dd1c06..68f20024dcebb 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -246,6 +246,9 @@ static const struct at91_soc socs[] __initconst = {
 		 "samv70q19", "samv7"),
 #endif
 #ifdef CONFIG_SOC_SAMA7
+	AT91_SOC(SAMA7D65_CIDR_MATCH, AT91_CIDR_MASK_SAMA7G5,
+		 AT91_CIDR_VERSION_MASK_SAMA7G5, SAMA7D65_EXID_MATCH,
+		 "sama7d65", "sama7d6"),
 	AT91_SOC(SAMA7G5_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
 		 AT91_CIDR_VERSION_MASK_SAMA7G5, SAMA7G51_EXID_MATCH,
 		 "sama7g51", "sama7g5"),
@@ -305,6 +308,7 @@ static int __init at91_get_cidr_exid_from_chipid(u32 *cidr, u32 *exid)
 	void __iomem *regs;
 	static const struct of_device_id chipids[] = {
 		{ .compatible = "atmel,sama5d2-chipid" },
+		{ .compatible = "microchip,sama7d65-chipid"},
 		{ .compatible = "microchip,sama7g5-chipid" },
 		{ },
 	};
@@ -393,6 +397,7 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 	{ .compatible = "atmel,at91sam9", },
 	{ .compatible = "atmel,sama5", },
 	{ .compatible = "atmel,samv7", },
+	{ .compatible = "microchip,sama7d65",},
 	{ .compatible = "microchip,sama7g5", },
 	{ }
 };
diff --git a/drivers/soc/atmel/soc.h b/drivers/soc/atmel/soc.h
index 2c78e54255f7f..66a74017d9a3e 100644
--- a/drivers/soc/atmel/soc.h
+++ b/drivers/soc/atmel/soc.h
@@ -45,6 +45,7 @@ at91_soc_init(const struct at91_soc *socs);
 #define AT91SAM9N12_CIDR_MATCH		0x019a07a0
 #define SAM9X60_CIDR_MATCH		0x019b35a0
 #define SAM9X7_CIDR_MATCH		0x09750020
+#define SAMA7D65_CIDR_MATCH		0x00262100
 #define SAMA7G5_CIDR_MATCH		0x00162100
 
 #define AT91SAM9M11_EXID_MATCH		0x00000001
@@ -75,6 +76,8 @@ at91_soc_init(const struct at91_soc *socs);
 #define SAM9X75_D5M_EXID_MATCH		0x00000010
 #define SAM9X75_EXID_MATCH		0x00000000
 
+#define SAMA7D65_EXID_MATCH		0x00000080
+
 #define SAMA7G51_EXID_MATCH		0x3
 #define SAMA7G52_EXID_MATCH		0x2
 #define SAMA7G53_EXID_MATCH		0x1
-- 
2.43.0


