Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9998CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eqq/UtuM1FXxwCNIKab2GAR5FnHQAqDXK4GEMF/9WcY=; b=iJwz9sztNZkH0u9tQPWqJaV+GE
	QnDLt/Tqq3kI8BjlRVoiQvdcU1E1FifClLZcbnVmgmxCNZ44Bmrcr4CZ1IJX9pEbHCuNKHsG68Y9G
	ij/owznhruPrPZCfUwaMwPN2Imf20Jf6O5J4GByL896GIzr+20ralpBsNlSTKFGYMXNsQYZCQRWp+
	/2nNJgQGOW6S/ex9YCJ392sO8DbFSgsBnTt6mwC2otUVduDuo9t/HY747W7FQ8zcyGrPRSpaSQwQs
	x+2xXK0s1oUgYCz0F5T4Ki6xs/tSvPgsE6BsFsiUFl8cJvtJ7BxY2wmPrpbp6uNYel85aT8a3P8AK
	SBLfnJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLnb-0000000CjIZ-226y;
	Mon, 11 May 2026 08:15:35 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLnY-0000000CjHD-1NTj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:15:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sq8tuTdTQ95PSwgczcUowhNAaW0ohKWHhiPE8cbKDwO7Q7tCx8YNlmTPTz87QCp4frjiTbLqn6BucSvXYcA4GIYQ+koCJ+1C+oI2OOYTsUpqCAdR5AyPAYReh7CggN/QUbfyHgi9bpNfSrXpNnozVmX2nD+oSXP3PTT7b7hQU7v+6PS+jCWq0FG8+CS7vFBknF3PAnaTPGiDHP2Fh0Mry9Msd1a6h6y1ncWQ+xiYZQPO4G3u/yjDyhTqEoFgLTgC+6vJymbHJ2NaZ0ad7FtuTG7L7ZI6lfNMTUhAFbst7u10fHJjIr/uNHFhZfF/ArQM3Mri6lgj2nQcRhMIxdHH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqq/UtuM1FXxwCNIKab2GAR5FnHQAqDXK4GEMF/9WcY=;
 b=ZKvt0IGhhYDRxfUrd3jHINK7YyB9CzvnNKQnewmtWfJYZnBrBg7MfzKJRxeQvrDDWsPhVdFmXeXL6vJSqj5smHXgqZJRwNe6HnCSKBy8NYYW/qoGvQkHRBiUksTXSk1f6tBuCBZKSzJJPhGH7XXEe6DRSaypxwYjanH3oI7hjqaWaRKt/Ub5gwOHaxeDXPckkl7Daxa84PFeBERbnM8FpjhDoh0L01TFYuWdGHOhIsxkJ9f6cZA3qDKeAfSeeQ3Ajjurgn+AoPTQBt4VnSQwfmURTnZlMQx2u6PVyAtBu+7QVYe2d5HJAxdP6vZi7CPNvAsbTi/x3xG/0JJSDmrIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqq/UtuM1FXxwCNIKab2GAR5FnHQAqDXK4GEMF/9WcY=;
 b=rXDY+VK7eoXt955Gs9dvD7LkxbjoNBH5G7QaGJab5+RAOQQUgItWaiekyckG/k1GtnLWbYQB+afO/A35B0FhXYvpt7gd/xlAKv2/4UbHhOc68y7Mkmzh99eNg1+wNEqGVsZoZ7Pg5PUzwIWPTd8ljCG0hp/4sp53zR4Oq+HWa+AlorPwh3MmCq6rHtUW9fT1wDQwf0wGmMQhcq5io56IpFQf29V4UfN2cUcDyF2VONKvPWmrGuPDlchpJzVLkmsGAHMpCLvFb7nX9zdApSLDFtuV8uiGZdHbDdIRRH4ZPzpzxqjZZ/C4HMl/bXxz25mZEff+wJ1d9+ZSVnOD8pvPBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BY5PR03MB4949.namprd03.prod.outlook.com (2603:10b6:a03:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Mon, 11 May
 2026 08:15:21 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:15:21 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size
Date: Mon, 11 May 2026 01:15:19 -0700
Message-ID: <20260511081520.20247-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BY5PR03MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: b94e5c54-f505-4ad0-772f-08deaf357203
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: yC5p+QTIpcJfRZpIWUcwmlcCzovzczrdJaVzg0XfqtGGMWOWptbj6IyBltYAS9qNsKXlhaIZtdW4MmvaJZHxDxtNGwaQGNPpYysGDlKM0AfUZCRtJXjjNh1rHWrdyQxXca5jsCn/z0DV3mqan7F3jFcsp3zI9i2Kr792nOkDRT4t3pWjLoOrZprBPadWPaJJSCI5hLA9bnjYjCu58Br5C7pyUfkqdvUTtIxccUqeffeXuwNhISQY50xV2J8VDHhW16WnqCWAaJelkAPMDBwV/F/RQIsW81m5fgQuVY2XSTxM1j38WeaOIg1FfxiR0d4T5fBtAMxskW/JQnmxh2CibCBGJIdPK6ZetVD3Ta1pxFSBFgSk5Nyq0SSSfofL8gRrtxWScY6NEsEhJ9CLCC4uA7fMbOydiK2v2FdqGofeFMU5bfliLqA7mMcAhgH2EVZ2/2Lv8se6p9g4fy+QlPBKzAejQcIfYW5jJUtubnESAI8TDm4Yiz0/KECBjztzFwUbDGc4I5XSLUN/kanP/cSPqEic09dQBB2CkdR4l/VNZQP35n2Aqsj4ziPOaO2OnwXpjvieVHeMMSzOIZDktw2jEQfIhzBsYMD05DvFzzzyrOpEVPhOE2Z+95jl1bJJFxf8hL6aGBgwJ8agNB13/GRlaWYO3d9LaWp/u/TTCHbGq1CShrna5kLsMj34EPtdIRvs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZaiZs0G8XUrBD/WDnFrLK7NK82IVwyu98gQbOfkPvIQXDL39tGN3qQec0w3F?=
 =?us-ascii?Q?ktlpGun3ru+9eyuunCqQ+gidzNRjsP6o5MjXUXeEjPUG57bBHtO0V/XlylzF?=
 =?us-ascii?Q?1a/8WRzvH7uwIpmkc01SxQQ28X/oU4hwUUYnji41wUG1BvPftQQ9m3ueZPa0?=
 =?us-ascii?Q?NbRRiHBmFve78FIYS1po1PAAYSXi9abePBktuLr/Oifmh9i0m4V+OJYs087/?=
 =?us-ascii?Q?QpVLu5tijQPNvRrOp4Pg1qc7RN1wppoyN2H0Hajkp4hQ00wsmEhuqQaGPrQF?=
 =?us-ascii?Q?1Y0EYQTUemHSi5g7CJIPQwHwaYlU8HZR7eCLrMhV9sCoglpn79vuCaQiB6sK?=
 =?us-ascii?Q?2dU2iWBE3FNozTfcQ8EUBKyO8Y99+fWE5uLsVb2J07ToCaJy4QDxtUcAmkEM?=
 =?us-ascii?Q?Fo+SZlqVKR2TJngVvOVSarc2LCrloank79Szuu7mCa90L9ZWwjVfW6h5sp2A?=
 =?us-ascii?Q?bKCd4oQI4lCADOwZcjC0NxfFZslP+AdnYzPf5ChY5j1QO2GdaEBjHQmkwT5/?=
 =?us-ascii?Q?GfPLnqGQtJ8S7eFIH/RMOYZZmvuF3MqhVfE5qUtAz2Plv+Nj1GRtBB3aW/bX?=
 =?us-ascii?Q?JEesqzRU0AWbFSZECtc9NCmnT2Rj+WSq4SeMzGBP/2EubaUH013O+jySOQZv?=
 =?us-ascii?Q?bnkOTKxMt5D4YET3COYRKekEn54N7GwmfeFOKGPjIA2Fa3rR51wGvIYybd7H?=
 =?us-ascii?Q?g6v8MUys7z97HOrA83fvKcJeU0nWYXZg+zy8nggcxhwdAkOuEMeWabZrGSwX?=
 =?us-ascii?Q?JZlmlY3jZ+itR/CbtIBwwJZWJH7OIGAKJw9+6yd8XGPVkzGx1SjWTMhw/lNN?=
 =?us-ascii?Q?gBm2nUsBozOgBOels2zxPmlO581s5bdwCHeMkROlXyWmQVPGaiImVzwaF+4t?=
 =?us-ascii?Q?qIgt5fNL8RWF01LUZZSFu+fLJ8cCi+TM/7CaL3TkW/vZn6YCcigR71xUtUQJ?=
 =?us-ascii?Q?C1vSeiIV5FkI02F7GcaTUNeVFV8B6Tmwf26W10aipm+04lki3vTWu6r8gi3n?=
 =?us-ascii?Q?9nCpwhSOu4VsFi2rcqradqFNoISzCBZExNfBu/Vu+8h6Q84OlaqCNKzc7PdM?=
 =?us-ascii?Q?kHlwTHZrIMt2TXQQvohk4sawnWUJKdXQjrq3NBs4ceKlMWQ/wvaQwB0kYGam?=
 =?us-ascii?Q?jgaHCzFGY2U4Ajgv2vPYcvL+0Qwl6s2zogbofoUMaj+CDutpoBDP7K4SL/wB?=
 =?us-ascii?Q?64MTHp56v2nNa9Pd+00ni0wribUh+60DXcoZQlEd9PqjS67O/CzFkqQ/TV4r?=
 =?us-ascii?Q?5n9679pVDSWeXOvLk0g5FVBPUJykl0GZiai21NkOmV5uYqzfJx3fu7D+vJwB?=
 =?us-ascii?Q?PdQR7hJOkkvOwFlNWfEzdL4gptMWqihuOmNTf/ION76mbQvP2DtEwhj9CgqF?=
 =?us-ascii?Q?af+9pEIPMFKsOleG1ceNnrv0X9s4Jzi4xuVh3RomU63Rm2/E8JOA1PDLZcTO?=
 =?us-ascii?Q?hFEMu2dLMYEfmFLwHRCVV2B9eKm1bRhgiO+c3+6kxXgvM3t2ai1nGTFKrr7g?=
 =?us-ascii?Q?qfWE2xxwX67C78cJS78F6Pd28fJHhqfOq90RE13saV42hDyFvu1UmQTLt6I3?=
 =?us-ascii?Q?DPnmH8vMI+hDBShaghiaMccNrRd+3PoWCBlwIiJe1I74Q9PqSoNJ/syMfM+K?=
 =?us-ascii?Q?a56mibeWzcjQlogW9wZd8T6w3kQvE4NiZjYkbXa5WYCHjLrk3Ix4hQUmo5uL?=
 =?us-ascii?Q?LART3cgE4mnTm2V33qIyQCdofNen6J2d6Jy/AAjxYqZ44UjsuNJ51Kc3Wp90?=
 =?us-ascii?Q?KDu0O8ipKwcgbtSJrElxisxJAp0SIeiwJx3jeTSDEWFGdHSU224gajbyyUFA?=
X-MS-Exchange-AntiSpam-MessageData-1: yLfdnTbkCFCCsw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94e5c54-f505-4ad0-772f-08deaf357203
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:15:21.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCsZDBLWIeAebudhgEAgH48NXiam9te9l+bolTJlESaouU4K+XMxTeHKcBcm9cQ+mBDSD9oBn0bdAIXL0IImoFbfeAhFUUPjwvmUzv/z167kVtVQw6HHxOtA9wRGznUFXoFPlqUh39FL4mO6XqpUmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_011533_634776_51B42AFE 
X-CRM114-Status: GOOD (  10.59  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>

Increase the JFFS2 partition size to support larger root filesystem.
Also fix the partition label to match the actual start address.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 .../arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
index a662df319a84..5f9b98b0b393 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
@@ -18,9 +18,9 @@ partition@0 {
 			label = "Boot and fpga data";
 			reg = <0x0 0x02500000>;
 		};
-		partition@1c00000 {
+		partition@2500000 {
 			label = "Root Filesystem - JFFS2";
-			reg = <0x02500000 0x05500000>;
+			reg = <0x02500000 0x3db00000>;
 		};
 	};
 };
-- 
2.43.7


