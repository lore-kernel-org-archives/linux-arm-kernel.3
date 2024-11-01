Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CCFE6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XBkSLP9LtYBQe/ReJbA8BHRcOvR7hWGeE6QYCdYe8w=; b=rsbC5eFQG2Vl6IODBRu53A48+Q
	tcRUzm4XqUaMFXM4gHwqIPHvcJW3WABhp3MWiOaK0/iSXwGnNBOhz8MJ65Akwx4MHz1kOMgEhffl4
	Y/Lyp3xP3iG/+O+b5vV3D6qgPnN7A1uDSva4wSEiYoYOIKY1e+SN8+ZFKT09gqZD1OSXOyKy/Rb+9
	OQyqgegRKckbwWtS2zP23XvoBwLby6k0Fy9bFwoBj9dj9qBxfIWSGsOHO9ChRbx7i/dSjc0aGseOx
	rmtqlzRi/19V6J+TfZzuEsgUkURgX5OGK0AMg7CL8ZWHKcTiGn69MPNat03NakhKYMg1rYgGZh9lR
	NIaK9OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sgF-00000007LiZ-16eg;
	Fri, 01 Nov 2024 14:31:15 +0000
Received: from mail-am7eur03on20704.outbound.protection.outlook.com ([2a01:111:f403:260e::704] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rUH-000000078UW-25dV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjQv/iwG/qRr2keBHEmqfNiSBjWuM2ZH1WQxTCcsT3XWqEHt8HO0t6rFPFr9a0tuklAt21lPkO3S1lOlJheJ5NRXmeRSlU40ledCHQhf1OaE5i4MBWdhdEsHzekh2JqJm+dgh9RgtU8PpDWJ0w+CaCOFt9aQYedpaQaLWlwl5fVgyZorPTdDOe/ZddOa9kll2dMlj/ndmTLViFFPrPg1t+UHi5TpuFwH/l6rvdHwFH46uL0MBJR9g4FRrdhIIqPjM3cXYbKnSCeIyGRA5oNVDKWbi8BIn5EKCB4Doi40H7IBoDffLRC5wgYYL3wV3rj/UHtKwV0NzJrc0ocewaW1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XBkSLP9LtYBQe/ReJbA8BHRcOvR7hWGeE6QYCdYe8w=;
 b=uTrZMAfk1sd0mr7OJF8ObfkEMTbWh7NJBKiA2mWwu/o29HXtCvonWmhn+LotJo3xXRmewpmNBU6EYfPDEzCK3HmE6YRydyXfg9741vTCeWjI8HDoUCRrZmueaf8osebYtMWsKttHnD2fYZy6TEHea3hYk0pnstdUvvEMvWZAuurc3zReQ8MnRJ9DFARR4//B2BQENo8sC8g+SB4b+dSqM/W/UEYhCP7TF0prAqSsLQdRz4HEmqKyN56oDnrj8FVxc5lRZ3Hw6Xz7RgLZXtSa1xzpd2JQITWDrRGV52h7P3RZDPEHLcXePbBR7lcQXU9fWTrhUuCMx7EYCppSHE+7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=none
 action=none header.from=phytec.de; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XBkSLP9LtYBQe/ReJbA8BHRcOvR7hWGeE6QYCdYe8w=;
 b=KUmqK69H61cdo8bAIBKO36gybJIjq5U1NVev7fxbJzMdj9txK9mhG5lt3hsgM456TDUmgWql5GWexVHu8/QXyhQQPIIu84m9JoE/6pNTllBs5YFeJZ/Z42zWThSy1pGWfIlLh4i3mDrzrkcPx7AsDURIeNCVMZDGL4JKMdyq73Q=
Received: from DUZP191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::29)
 by AS2P195MB2152.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:558::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Fri, 1 Nov
 2024 13:14:42 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::d4) by DUZP191CA0019.outlook.office365.com
 (2603:10a6:10:4f9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Fri, 1 Nov 2024 13:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 13:14:42 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <upstream@lists.phytec.de>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] arm64: dts: ti: am62-phyboard-lyra: Provide a vcc-supply for the I2C EEPROM
Date: Fri, 1 Nov 2024 14:14:27 +0100
Message-ID: <20241101131427.3815341-4-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241101131427.3815341-1-w.egorov@phytec.de>
References: <20241101131427.3815341-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|AS2P195MB2152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a54260d-221d-474b-79da-08dcfa7725e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2xNUFUU60IYh4ovUVYTbFdvxgNV2yX8bwVCy+EB7i6/zmz6AA9dK/bs8pWjT?=
 =?us-ascii?Q?SO75S5ZJQp8FanL1Xog4NX20c9WJP8QxGendnexYpuAzIMPJB6S/4feDqmuY?=
 =?us-ascii?Q?uOgQn7BTtg0h9rIBDXzVCgiOZjbR6LOAwWWnrIVvl/feY8Q8k90bdJA5Wsvq?=
 =?us-ascii?Q?jNvXH1LupPpm6l6MHsSFNWoJV92rcIhdj+ZLpWiFP+QjE3ZWR/yhnjj5wk5C?=
 =?us-ascii?Q?bT90lBxbNd9uLGtUnxZz4BSUSPJpW7H7psqXRlnP5QLUWSwjp4mIAT08fO2V?=
 =?us-ascii?Q?ECo0GwAe9UmTg7Qv1ZsfTJwqLHZBSf1/+YcYeXlyhNKdw84Fmm6EQs+apZ9W?=
 =?us-ascii?Q?ifZ9MoBoMEToZia4zdTfPd2+nzS3CA4hs/RMQaVens7cvhA1ehO1xJRgAUfS?=
 =?us-ascii?Q?jwaZdkSnyz5p7VxE9VypXqVHS6LOJ7WjS3/Bn6D9c0wgnjqogbs5k7oqWf6C?=
 =?us-ascii?Q?hWcer6kVbfz6D+3MlZPq9TDgupvC8ifHF/XJGiIGtAI20XhvntZGzSLBeKyd?=
 =?us-ascii?Q?JJfJ4tbPcc1IuxLz3czo5KcWhQYiaePWcnUvFQ76eC8QSmg33KvIf3CRyxPl?=
 =?us-ascii?Q?01vJr/lnHiJJDDMOao29avLz7+xhC+v8btqE/lpITRctj0KOmMWw7u9E8roS?=
 =?us-ascii?Q?p2rO+7udpBdXjeV4krwdNjIxuQSMLzpLAA2zsI2HRAoA03TS22uHO9CxNVvL?=
 =?us-ascii?Q?3VK8CK64kSsAiuVVDiZUHktTujzXA7XFRJy4gH5duIE4D7MNNwc4gfwjEfVS?=
 =?us-ascii?Q?mizjsui41UB677Nj+pzyri6c8YdZf9/2KEFXAUMj1Pt5gnTzp4ro0e8N8oOa?=
 =?us-ascii?Q?sS3Q/Mu3+mXzq4C+XO/Dh5JVwfgIFiSOMqsdsJlQ3XA5IcpXqPDpzKOuTbGz?=
 =?us-ascii?Q?icg+LH6ltqR+4o7hKbJNDY9c/jUuZ+jC56X/YFPJjzYtpzlF1WNQaS7dwhqh?=
 =?us-ascii?Q?3wEklUsW9mQzAIFqDPZhvKb9I8ZApZWWeMh0/Oc4dY7xEJcTF70Jos7G1qzR?=
 =?us-ascii?Q?hC9OdYqQt5StfPW/L+xvf7XIDLJXVC/CRs8BAdFyq0xnow+lZQ+RNltlVIny?=
 =?us-ascii?Q?85j5V1fGqrUXXg+pQW4YmsL3GGtHg6oqOCQuWBMgcehXUJPHovW9pfsnJwPT?=
 =?us-ascii?Q?X5gt+oTpz3nGAUzTVLzZGdq1NxT98JEe6bOT+HTJh5Tem20DzJ/ulOvYlbvv?=
 =?us-ascii?Q?piM88YkKECD/tnTFGqx3Yb+TaUTAzy0i1POYDCbjsY9DKxB4AGysfTzgGkXS?=
 =?us-ascii?Q?0kGyD8XxY7295VqAyoo8efRnWUE0LSReWDWHtQqjPOsE8ON7eeoU5X2qciz0?=
 =?us-ascii?Q?1yyVbKk2oUX53kLoyAhSnk08Xg6yzOiWGYeKtE8XAqIXcHALwm9cnixuRu1r?=
 =?us-ascii?Q?NjNr0S6C5SlSSRU5m4hRJeleqRpdBgisRyY0UpqccYeudrDBww=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:14:42.2925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a54260d-221d-474b-79da-08dcfa7725e4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_061449_562140_89DB125F 
X-CRM114-Status: UNSURE (   8.64  )
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

Add the missing vcc-supply property to the EEPROM node which resolves
the following warning:

  at24 1-0051: supply vcc not found, using dummy regulator

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
index 04fa2bffca79..9c0949c7ae34 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
@@ -416,6 +416,7 @@ eeprom@51 {
 		compatible = "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x51>;
+		vcc-supply = <&vcc_3v3_mmc>;
 	};
 };
 
-- 
2.34.1


