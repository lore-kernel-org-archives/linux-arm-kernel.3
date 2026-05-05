Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 05:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ+/DcyS/sCFYJPcmZLwMT+i2GSiUHXCjea+zEbIWnE=; b=z5fLAdJ5RSxf80h4I3L90Tvdza
	YK4DIcFtjLhJEqFPSpBbTHqwgLRkMpmlXoQ78k4DdwYB4y+9b57JZU8J2Ou7KbN595c/iPj4JSwYB
	SntjW4QbuDvGbOQhJK53KYTAc83MDYZ6DUrQMM33IIdipcaGJBexFt6E96NVAaHsn6zi5LWShyhyO
	F11C9PjRjVcfAlkG4eDbpoMBN32vkUpeY0KElk5fzpNuuRnwFh2ufcGVe5u5xSvZGhzmURA6k/Kk5
	I/exuMDcfJNycun49dzh3PxHDYPzDtRXtYObY+1rDxRRU8/y+AretBVYNg4hddhLcVwJ6YJa4QAwE
	wBzweL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7zU-0000000F9xw-2OVv;
	Tue, 05 May 2026 05:06:40 +0000
Received: from mail-westus3azon11011033.outbound.protection.outlook.com ([40.107.208.33] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7zR-0000000F9x1-2WF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 05:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJ/DJa8h5uweJuUB6ZYEW4nehmMJIDEvF5c9o24mz9mj7S6fo3NOXjvarkZMrhdVtYLhc0nChOUntERyDAOp/3opzLnVEUwbCekTVMjPKpKKY1tXRqaEqkizqGzFVnD/GBqMneZjaB9zNzRFoOP1EdlapIWYsEqvnWutCG5UkfrsUgNsDKk5BGnWy/OszxBOkrZB6Rfm28iXGZqakalKCFI+8vwZSXjVlo1d1xpJHQKVADKlzc3CbqSdDsKktx9IP5KJLqQgbrMrMQ0P4GTRWaya6sThVdRMXTztAPJ7ZSUmQ69cew4TYHL6f5RLF3a6L2tgQ0UZEsgI60ua2a/2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ+/DcyS/sCFYJPcmZLwMT+i2GSiUHXCjea+zEbIWnE=;
 b=ZBjLhSfGx2mx8bJGukFZoXRevYPdugsBoKuQTc/TdIGJ6N8oRwJ5ms4MOAv3D8DCzA56B7fKN/sPfdS6EbOgztpsr6ePuEVXlW0Bj2d0tr3thzziMbZOLa+Lpq4mmdmf47NoSKz7QgqFXLRA88/fRAscvufYxeE/kkoBjTmTvn9YIi+wnh5P0LjmeVUSKASwblF43ZJYLmItqTzh5VAqJZw/s3S+v3Kg+zx0W1xjn722tLEgTvEYdIP2kJhUwOW4fivw9cPkVyJ1Vl0rfR1SUMAkreOwiLu30SE0eyqzjCXXdiqQR8nFJKZDl2cK1yIjaRDJpdmn+SthAUCT0rkArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ+/DcyS/sCFYJPcmZLwMT+i2GSiUHXCjea+zEbIWnE=;
 b=HegHfLG6u0ZkOcifYZ/AAYWF5AJQ4fi+B+80XiMRTUv41CLUzccf+IqPmBvmlEhyMMXfOe4ghSJkHh8fyrXwEZl+g8DVc+FPQM2rWE44BX+FVpas+MS1FQSj2enu5s8inr/6ae0k0KT8eZnq4YhBPzGnPoBiXH8nZSty539oUEaMiLuiYdzGuQW2+/OFiWJPZp/IxObXfo0nqLT7Bd+JRl7ryn8ZKgYYyNFlLw5/72gkGrye/4dcXPazsVJx+msy4TNErEysiDXu2AxMuhdBgJupUHiqYErw1b8w5OMN1d+owigvL9njaegX9iKsbCRWC+Vi9l9K0xcGlrF+lkTb3w==
Received: from SJ0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:a03:33e::10)
 by LVUPR12MB999161.namprd12.prod.outlook.com (2603:10b6:408:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:06:31 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::cf) by SJ0PR03CA0035.outlook.office365.com
 (2603:10b6:a03:33e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 05:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 05:06:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 22:06:06 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 22:06:03 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Andrew Lunn
	<andrew@lunn.ch>, Marc Olberding <molberding@nvidia.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
Subject: [PATCH 1/1] ARM: dts: aspeed: msx4: enable BMC networking via MAC0
Date: Tue, 5 May 2026 14:05:41 +0900
Message-ID: <20260505050541.3031447-2-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505050541.3031447-1-andhsieh@nvidia.com>
References: <20260505050541.3031447-1-andhsieh@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|LVUPR12MB999161:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dfb283-c59d-4586-f2c9-08deaa6411b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: //LhQG1yaydd2RE/tO2ct3jZOyj2mBP/1RltpDdJuNCiLfA7cGgQZK65sWhube1boOQpXPQn8Vd7JKrGB+JL9OQqeexTGs4+AHN5PUMcEaNnm21s/NmqWBiC5Whf8EViF7XoEM3Lppy353EFWfzDW45g2zky9+XFcWjg6PdPxFOyL2JUIRou6gYIcf1x0bKw2LiMVYmWM+KqGrHTm7KYO1xpbQ72uZ/VBzBGhjQAwPEYOGEBF3F+EhEBWuoXf7ZLEh2GMYPnkNfJaYl0VixPVRucqUzZWKgLo8NFNXErlTmyC4fIYGuZa9oBZnGf8eXm5SDz5NZ8Ic8/p/4mLJwgQgvtLVTYY9Yj88FjAqUMhPggI8+slowUG/U3J1MfjWN5Wntt7GHxF9Sm9EnV7dFj/KdLbejcHkuO5voDFUPawTJFD80Bvq7Ni0Korr50ar97fq8oDVf1YP/mniaMPWx2PhVcCnhLODfCrazmBVPDRUcQrLmFBSbwZ/HsXa4O6LTcXXD5SIwvSLDXr/S1uoJ+/UP7ivQMykAug0iv1Ts0wC9SJS7AugRpveGSAhm8FIVbGtXM8EnyOUdGerDfWXdxnp7yF2LM3XRyo0PpdkQCXOh0FA8lyb5+OruHe9xcHevlJZSa8c+vsMIM0Gfnn2Qko4e8yyU5WAZ7t0Wvk1NTyXvkMIexUUOyq2+9/TrtG7b5KCC+v1PTq7KlgwoDWiWQCToftzWBcfsFdwEkuFbPn64=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G7dMUtXQO3bCOtK9qzzZ5kSpRyQFH61GVsJ8af6z9U77uOHLcotXvAxJivSdhgiVh65lFYtF8IIZJ8NKSE/XKuzQOrlZXYFRnJjgTG2mnFULQEBrrtUsMhdr4KRDnCkQfatALIvSkClrwKQ2w3sBzdOb/2lbISqbZDZwd8T/LLYu6Xt0F8Po0qDX/qAb9zhkS+AACcIICfefxInH8x7XnpX3u2xVMIkER546l81ucStFtFUDW6RKxWYiPJQwt9Z+Ghb4U7HZsx0kmEO4OzvI1dr2ncq94mLcysXVMXPlGYszjUqnpF59XCAoI1wKms7aWHVH7up6wtgqTYZfD2ZXGjlWYhabLkAvYRpDRWUXFajBRqjhz9dhxQ92CBy8bYA9QFVu1hIFxhdbSx8Pd98Z7ejRpq12F3O0drkyors6UXepHj+ZRfRVrzgY5yRzK3LI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:06:30.3020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dfb283-c59d-4586-f2c9-08deaa6411b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_220637_647477_15E3F4C2 
X-CRM114-Status: GOOD (  11.88  )
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

Add &mac0, &mdio3, and the ethphy3 PHY node to enable BMC networking
on the AST2600-based NVIDIA MSX4 board. The PHY is attached to MDIO3
at address 2 and uses RGMII with PHY-internal delays.

These nodes were intentionally omitted in commit f28674fab34f ("ARM:
dts: aspeed: Add NVIDIA MSX4 HPM") at Andrew Lunn's request, pending
clarification of the RGMII delay handling. Following his guidance on
linux-aspeed, the bootloader has been modified to stop enabling MAC
clock delays on the SoC side, so phy-mode = "rgmii-id" correctly
results in the PHY adding the required ~2ns delay without any
double-delay from the MAC controller.

The corresponding U-Boot change has been submitted to openbmc/u-boot.

Link: https://patch.msgid.link/eac09481-0ba1-4ac2-ad8c-d859822ff0d5@lunn.ch
Link: https://patch.msgid.link/20260504044702.2613879-1-andhsieh@nvidia.com
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Marc Olberding <molberding@nvidia.com>
Signed-off-by: Ender Hsieh <andhsieh@nvidia.com>
---
 .../dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
index a12d4164de4a..29f56176e2ca 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
@@ -208,6 +208,21 @@ &lpc_reset {
 	status = "okay";
 };
 
+&mac0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy3>;
+	status = "okay";
+};
+
+&mdio3 {
+	status = "okay";
+
+	ethphy3: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.34.1


