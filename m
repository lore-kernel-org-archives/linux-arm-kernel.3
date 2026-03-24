Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B185E9A75D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/3Q/QL+7Xp3J8MCUqP21h+pr0e2Hwnl4ekm9CaW8M4=; b=YF4c2lGUCtlk17y6LPYyLEA6qK
	vu4Th8wWIzCHwtFWdbhsvChamb/Jy6q22DhaTTmkAsZ+pYE9vjpb7RmgIrDsnjsD3Yn+tlZKHSJYU
	x+VMvrEOhtwjasDbsiqNWXGtB66w4cSWkdTQxgkJv1XjB6DdLrCJv4eAJV/wg3ava3BbAQjaYbw3Q
	JQkqozD7W6fOsizK8w9BgOv4tO1ywLT6XGVPjzg0uM4jY4Ir+ZNxms9Unb7eMrjTbG+7PYsEv78Az
	rP528RM8MmxtYcymDNIrlbDlzD5G+F+KFdofDhEKD9P8hwZXbHGQW422Zv7+rcPCyrQKZwnm9NAyC
	AFv8JOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ymz-00000001Bnn-2CIp;
	Tue, 24 Mar 2026 10:15:09 +0000
Received: from mail-northcentralusazon11012069.outbound.protection.outlook.com ([40.107.200.69] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ymn-00000001Bgg-0wBT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVc3V16URqz0J3tWufDNv5T+mCen3IGkjPEKqGzhXg80XVuCXioVxH1G4CChjiw9O1iyH6DJ4zFmCqAMRiouG0xLcSnpUexDKSjMzo/VYtjxWoZ/WN9bEE69H+P7m7vIFg3W/hG7uiDCh+AN6iisrtWuRty8icjg1j+zp97BfkhntnW6b7AiVkcWsbdb+rqZm3lCBE93gaDN9IPmpNPG4c0i7vb1/ErT37DJWb4T6USRpMtepDkz6K1tc9BUlvJAzINqNvCciDDKFK+tElPdbS72q6iYDYWzr0towTnpHWsH9x9BcSmBnmKDcq8x7QcDa//MU6i0WBxGJSMu7RjQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/3Q/QL+7Xp3J8MCUqP21h+pr0e2Hwnl4ekm9CaW8M4=;
 b=O5/W96683p3Q6Fro74Wy/J/WIAPTfm7GEWvG3nevxccMTBeTjQdrUkvZQA8tC+7zXSAZAW+fq7wtRtu/LD7jgS+1B5w4jkJ4kk2yIplR/aPRQUkOC3m6J8ASHbETSKDaPLa+yebL85mNwZJhtYgYAwA6ye6brjOTMgAOX37hMOSgOq2g7rUYp2HAthiX2H9DHZWtoSmm2X24xkAPtnKvApeCAzMI/pJmQPCr5J5RcUMHmCTGytv5bQo64m58YVyXIAlmrOaRGWVyMWnMCVnBqB3S67TgFbHQJZ1k0Sq95kMysXeQQcqWg3HonMoGewAuxKLyPboP/Tbb0WT0rmJSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/3Q/QL+7Xp3J8MCUqP21h+pr0e2Hwnl4ekm9CaW8M4=;
 b=L4rKX2URy6bzY2Y7vwA90+OQiUywMogJztuzY73hIzegkIuZwuT7Vz2qs3TheyeND4A7i3xsdZ+h04JVZBCqUKwpADzvQUr/0A0Wp1GUcU+hsmpNGav3V+annbzFeks1Yxo8IANWsCA+HOjZZJJkmPtGjfdmmwY6dkqNr9oGcjE=
Received: from SJ0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:a03:331::23)
 by DM4PR10MB6862.namprd10.prod.outlook.com (2603:10b6:8:105::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 10:14:49 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::ac) by SJ0PR03CA0078.outlook.office365.com
 (2603:10b6:a03:331::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 10:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 10:14:48 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 05:14:44 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 05:14:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 05:14:43 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OAELRp2446022;
	Tue, 24 Mar 2026 05:14:37 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <lee@kernel.org>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
	<andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
	<tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <s-ramamoorthy@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <d-gole@ti.com>,
	<k-willis@ti.com>, <a-kaur@ti.com>
Subject: [PATCH v2 2/2] mfd: tps65219: Make poweroff handler conditional on system-power-controller
Date: Tue, 24 Mar 2026 15:44:19 +0530
Message-ID: <20260324101419.95616-3-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324101419.95616-1-a-kaur@ti.com>
References: <20260324101419.95616-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|DM4PR10MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b80f936-1209-4487-d640-08de898e2e54
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|82310400026|1800799024|376014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: gU8aaWpX0i1EB2+9PA5ETJmHQfNFVT5OoKxU9QVd7yS5TAIgGIswzKEoyFBN7Nrcki1IbiHH2Va0pzntD/RvEV9qAuiEOof/1Q3bcR6a95JAiZ9LECHOgzSTMvNenUWQiYXVsPwWNHE7E4bT5RiW2j7+p8XBvFyN7/TrhmwzRuLfSnciqytIRgbsk5g5G7aRpdXv7gwncJVltfRYOMrU8GHNEWh/lG85MmUyEPK9/3QoRJKwdCKUeIM6FfSqABx5diGboQQHNRmRyPJT8N8rDQ/BhfT7XPEvhGDh1JOS6ErtIGayedx/yFvsu9enyeLPu7D7bgxUBpGJFk+bkxxfATLk25/VMrkT8Jz37hro8W6tI/QdPlaT1uijHZwQ7hCDUMR0Bs3AtcFvDIs+6jRcT7qKdSVz+mCflrhDQwWNnAq3oPH8j48dY/8atMuWn7BCX8+xViTyytFoGY+7WGLqqFIbk6UY8FXd2jWmAkwOQnV2Jlp6nwAn/OVlwSVSE3DE0ibTFS+qD2rdwy8+3x3/2N/MYNecn7qi61rj8XFuPuGFK/75gBtERMkEjTPDyzmfdmmQoikpiwc0Uh2QaCR/Yy+kOCa6NGXHiTUX/yeMRnlNhU+EC4VJZFhyb3ZqFcEAPid34UvXCF629Vk0+9M0U/gKoIPyV4tuG5+V9UxOsUH6jWMCSe8i7E93q2d8FQymU4GkUFPnA0PoHgFHrWFMH/+0CjZfG8/2+2z6xjV8Un3lEtDUo/FxuymD0U4AoudxtXJpTF0XlxE0F9B/GbDlvY+ItJ1Y0jAK1M2wFLqTF+pWPUrBp7/q7i0ETvGQBcv4
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(1800799024)(376014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0TVkVZqxAlpcmzcgvAhnKUNn9UGeic4VKIoaqYqGHom4b2Y3A/wQ26Y8LFguG2X/mkRAEY32N62KpS9UDfjxiCdGCS3ylf37PA/ujVddpm9ZLAEQPWHxchNmAcJsQlGZ5NLcwnXn1Ov6CQjPd+tDEaV3QjgW72R0rFyRfLk51ZvnnoBEKrNTmCBO6r1M+hwsPhvp1Yo6HlaArk3AvBEXvQeIpFjaBSNxdvqf8fTe5hJ0jSI4th1rfcNohN/tv+DuIgJ9EWFj5zjb/0o2UTXmuGdda/EHCr/cuM9/Ykhsb6JcWGDT0sjxlJQ9kt0inDtYkx86qR73aJr7O0NVghDc1iQSK0lktSaH9vIFKol9/0zPLL5pETYtWM3/dcqwniCZQcECTGu9qXgCHs22bmZO8pSCh8S1M0P9VBKchXREAMFkUSPzItE9KcFUZwqEl2M+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:14:48.7465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b80f936-1209-4487-d640-08de898e2e54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_031457_270485_8C806AA8 
X-CRM114-Status: GOOD (  13.19  )
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

Currently, the TPS65219 driver unconditionally registers a poweroff
handler. This causes issues on systems where a different component
(such as TF-A firmware) should handle system poweroff instead.

Make the poweroff handler registration conditional based on the
"system-power-controller" device tree property. This follows the
standard kernel pattern where only the designated power controller
registers for system poweroff operations.

On systems where the property is absent, the PMIC will not register
a poweroff handler, allowing other poweroff mechanisms to function.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 drivers/mfd/tps65219.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 7275dcdb7c44..6fa202339a0c 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -541,13 +541,15 @@ static int tps65219_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_register_power_off_handler(tps->dev,
-					      tps65219_power_off_handler,
-					      tps);
-	if (ret) {
-		dev_err(tps->dev, "failed to register power-off handler: %d\n", ret);
-		return ret;
+	if (of_device_is_system_power_controller(tps->dev->of_node)) {
+		ret = devm_register_power_off_handler(tps->dev,
+						      tps65219_power_off_handler,
+						      tps);
+		if (ret)
+			return dev_err_probe(tps->dev, ret,
+					"failed to register power-off handler\n");
 	}
+
 	return 0;
 }
 
-- 
2.34.1


