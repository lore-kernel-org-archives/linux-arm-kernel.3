Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8DC106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+lgryQn6hO/fMLEw5GgeSMGeHBtiYWTjuzMrnJ2+n0=; b=WDCOX87Y1yNcLl01Ozi8x1pQFD
	EbGUzJiEtgp456RkN0c7mm73MQo3X5CUX/hlK3aQGph4bBkrFQEnxmuFwNfA4fcFqBTVchrEIFprR
	9E4yHfsNjXtmaMoH9etxOV/alTgroixOLbiULGM9EflUIviM3d31p0YyFrmwWSB5Vntjb+PITjQ0R
	+M7H8krZiAMOW8aPK5XNtVW1IlqultRpC62FHhf5zvk29JXRimrU67AnhXTVbc715jdQYz8xuSAsT
	y9YZ2fLhY+GwIogFmjuOTfS1X8LaYZ2hJvr/BUOqjL2WwpdIU+N279rmQH3QJHUEjMu67pr1jBlkj
	tX040kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xxk-0000000HGZ4-0a2v;
	Fri, 13 Mar 2026 08:33:40 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xxf-0000000HGVr-42Rw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LenU/Vkl4kbzjjHT8hoSpzor6GXSbm0hHx+taZwOygiW4x/H1ZToq8jVftYuwO/wubNAYCO1MnCaR9ISQ32RlAreK/3HangEx8EUrZxX79D06Tz+gICG+LqY6cKdCkCjVp06nXvOeZekLpmU95GWVlABIsDCfzo0tRNrZ0KFTvymQzqtTOjGltGT6mNuk5ygNrDr6W0IbbqwlXIv9fP5p9jvQJ7fH/txWQFcq8DKXLNuiY/uLOEaTXD6VB7MN11ODfdwNOXgrq7Ro1JRTxp+m/yUp/Z/B4t/eLvcEG2rxX8NxgUlj71f0vGLcgUTGqg/ebZ6dTGmgrjTGHlLlL1Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+lgryQn6hO/fMLEw5GgeSMGeHBtiYWTjuzMrnJ2+n0=;
 b=rBJw/dBhe9+JdEctdW6CA7bjeRmWMgmKlihUmUvXkx95mcnu+3So3ejFl1lZzlZIG0Dxx5vShfMexx1IvIR9c2mgYRoVFWiZX+4N0am7YiDVXEoT/E8xmqdal3kPgFuzHyM4GbE6YT9i84gxZMCKRxME61mAmJQNDZC7DmVXMw0pV7vN6qv4rL+gwN1sfwX4dj7MOi0AqZSaLji73ToUfd/nhnotZ6zFoIq7lulx2+Tbs060JEAE2bPwKhwu/69PikAzJ4CsDz4Gw3Ik3EuJ8yoe6le9acS3pLiOUe9WQxMMZ8IiTAQy2Kxw0K6NR2LkfTT3HTlR99nM60MUsgNZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+lgryQn6hO/fMLEw5GgeSMGeHBtiYWTjuzMrnJ2+n0=;
 b=Y/WAgDqG5xydqGeqjxRF4wxASDX2yMJInlYVaefql9vwu//Z9hD45mqWRlGRRzgNEtVhwES12jW3fx8dRf92NckVmd1bqLOOl91MftDvvmRC5vBx6evgTcGvTJooVkal/b9sBs2w5RUPDKCkSHAysTa+4sorPMsghqV8w/HCfxSJqA6fTOdE8h09uAiab6o9tOFpEP8l73/6ptzXVc8ouKeAJr/mBAK4PsX7a3n14z5YXwmVYDLbt/T//z1Biv7dqt9HZw6IpCZN006Zr6Vhf+QeV78Q24RMD9CT6t/eoCTLUp/ZGgzj2DyP7dJWatH+Wem+hMqZ1Vvrvvkp1R7Lng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 08:33:24 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 08:33:21 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/5] dt-bindings: PCI: imx6q-pcie: Change maxItems of clocks and clock-names to 6
Date: Fri, 13 Mar 2026 16:34:39 +0800
Message-Id: <20260313083443.2391254-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313083443.2391254-1-hongxing.zhu@nxp.com>
References: <20260313083443.2391254-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DU2PR04MB8840.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c0fdd2-4c35-4e6f-9989-08de80db2f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8DA7DW57KmIYJ+4oNCLYsZt4GUPB4eXYqPUtGw1KLf2DDUtePAWErBd+1V1M2sl+iW+8ykVVPFvkbCDPYt4VOVgImcsJ5SvVoEbFJ+F5xRBx5Q7TKlql73DKfdp9kURAReYVOEglu7jLavcdCXoMTG8hgH6O5Sd8xAoRv17YAVTfIl/4gnK8oyXVkX0lXs5ySXlHgeedOG33SWx/T64HQ9fABkLDbX4cEg88MYA8KonH9214TrGA2VRf36mZB4N0wkHYbVsDQhKou/26QvcVw93VD5dGM1WrwmnicUJXT7Xauf/BOwVkgMJ7XD6ISPsyOaY5VzfDnYf5iFSGyDN3WCqbhVWHJTf3Cxmh1t/lXGjnSboheO5WZMzDLlNXfx2N7wMsUxS8aHQUiJQH6Q8eRqp3v4Ls2sf6WYqYk/KWl1UiO99MHFWfZU/qLa1EleqXMeGHNsO4mResOyBI/ZUkgZ16ZHqQMSeFGYWQiG2oSimnCLEOSnOrEGjKTqEWX6RGUOlFEmjE7gvfWgypXidm7Y4IrnfxCJjDHi0uAugTy7m0MrAFTl3ZG7Q0rptrUF4PTec5I7rJkkfx+f2q09biLKwKhP5Ef9/7mb1A7L8KhHjGC4Y9wPGXf+4Sm89eMJ2Ycyx6FPs/pFvYkqXmoiOnhn9AN7tDvFJu4ERuqhSQQDSmgNXRFrJFerVXlCaDHwtLmkvijz1pS+x1J+WkBi11aE23JBtLCgBP9gc1PC8GSL27nNKbK56L6s12+MSeXfqDDEuTvnC7YvQPminaLoDpFKxpCsG/JYytF7CPWVSBNVtFoCzQAqnNz0k4IMEf9L3g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bHXS6Qpff/hu1oQCldiHsS0Z86RSWR6tcwgdfIknU5CGfFKtqVbDeUFewq/J?=
 =?us-ascii?Q?XNe/mJu/APjLrzTAEI37GE8GIIciM/Dtd+rOrzKwDpHOQLYPrwGTT/+JFcpo?=
 =?us-ascii?Q?8GJUtNXCkJhCf+Sx9Kq/+Ki9EJW6cHh3HPl+ErmpiyqmpS2PdjnOjCMXLfqd?=
 =?us-ascii?Q?dTs3hyNYACAjE9awjrC5eOYbB1wI1KYVL9ev0IE2AasAhV7dmd0SB/R1ayjv?=
 =?us-ascii?Q?qWXHrpLoU8+iIib6hj1feAAw4wySp5zhgjD6SeShiGZibsKDWIBU/m0RLm//?=
 =?us-ascii?Q?glmK/16PRXIt7gIsfUcYWsjfVekDGbdePwL0RtRNSNDh8Zrl7lQJoJV3btbp?=
 =?us-ascii?Q?EV3KfdhAd9snnOADORGGvW1cBAm1lXG6OkjA3m3TbwZ/t3C7P5+oBgvF0t7X?=
 =?us-ascii?Q?xOiVeikV72v+kMD0IgnZBDnOiILQoeL/yWyNjEseum6OECvSgOR7CF3WUwTK?=
 =?us-ascii?Q?bs7uDDRAsv4R2dyt7+COhpT2xAB6QgUWu96Ie41ensJMLEMraQ//35XodnZ0?=
 =?us-ascii?Q?v4hiLDDwYzbOuttXRkixwKjGzp/WxMDueOwu4b0Im1KsOCUgwE2oN3g7InsM?=
 =?us-ascii?Q?FeoHn0bM/bZgKQv97s62UkcD3jocSm+l6x/8hpFAWuK80ZF5zAD7050m4YlW?=
 =?us-ascii?Q?4fUxYkaPi4Uoj2QSH5hbPsB6HEDcA3H9NmtQItzNJIvh+dow5eiEigK37fD0?=
 =?us-ascii?Q?Ox0n/0+u2fiuTlShzkIHvUOIzgSIdpCOnGu87Bk3+ryyYbzEdwM+C1KWzTEi?=
 =?us-ascii?Q?0l8507Ir7VFxD9/hEWN+ax3rzWS//psyfy68jihWmIRS58/waZmQ8NfyRDdf?=
 =?us-ascii?Q?HexDRaUMs0I1OOZINZ9kL2vucuVwKTlrTgSFjzeLSr+OFNhxRwB+71IOu3Jh?=
 =?us-ascii?Q?V6LWrrgOYyd2TptgZHvgvaMuel1xOs7pE911Z9KECp1cclAdrP9rVb1R6d+B?=
 =?us-ascii?Q?phBEoB+GEIc4MLNcBZg2W6dkTaRHRB8G761QURPoFmWWBvRnhSIIxn6WQMxJ?=
 =?us-ascii?Q?QHfH55zws9CZTrjeyiHcyON3XApX+SJrkwSofLKHycx58XJSWjcYoIkDgyB+?=
 =?us-ascii?Q?AAzn8VPDhvNSZAQHr9/4s1crDV560O70zoJRZhzC6y1r6EH3kO+uYpY7/ddv?=
 =?us-ascii?Q?8/VwtYZZDmAptYq5hdyz2uZu4oQDJbpS/BimL9hm4xhdudHGxDhNTLy2qu1D?=
 =?us-ascii?Q?HNJLw7pqZrDiRKVaKbGpJgBbIxQ5AbnZoRJ2GjOCszLUYUAY/cschD9hFXIS?=
 =?us-ascii?Q?HdlPvrRDKPkaSW9vWjEbEERYy4B3UM1E6a5Ag4QFeaCGmkfE0bqu+gvbksTA?=
 =?us-ascii?Q?CmFEIFP3ZZYwE4hVxaKY9Vna6Cghxy4Ey3oIlkG/j/WjbF66BWwenUDmUl2f?=
 =?us-ascii?Q?DJaViI4bL0GW3TtQ5RMJdVam5G6B1komahDAsONzXNSQAu/d8fJ8csyXrAPm?=
 =?us-ascii?Q?QCcp9cek9joAAbo3G6GfL/4oQFfjcMNG6DoWq4lj1ApRquQhhZvoBZYb3dPr?=
 =?us-ascii?Q?MC8gaHPKzOejZ8yRqMorDxmde5SDHIa7QSxgt7C/PAuz4YaPBjhDfybN/f3Q?=
 =?us-ascii?Q?xLs8YUr/cXhNeWw27jv4po6axui9+u+qMR5wqkkZaOWv/LDc/vZYOExmUX/I?=
 =?us-ascii?Q?6NbcqQprqQOqf0MHObsDAh6otynCL0ZjPf2XrGv664JToIznzulP6DL6t88s?=
 =?us-ascii?Q?th71Erjc5lBZfOkkVK5sduv71x+pw7aFi/qSKStQpuqV+jwemAX+hiqcHO36?=
 =?us-ascii?Q?9mrG2hDIxA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c0fdd2-4c35-4e6f-9989-08de80db2f0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 08:33:21.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cINFp04k4glxNNJ5lnsf5usI7E4a28j/ca8Fz10+fQpphpQxO/q5j6W3hsGjDKoOcMPZY37+krKaWI0s8FebjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_013335_999926_A146B474 
X-CRM114-Status: GOOD (  10.95  )
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

Previous commit 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external
reference clock input") was incomplete.

The constraints for "clocks" and "clock-names" still enforce an incorrect
number of items. Update maxItems for both properties to 6 to match the
actual hardware configuration.

Fixes: 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external reference clock input")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml        | 4 ++--
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
index cddbe21f99f2..0488c942092d 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
@@ -17,11 +17,11 @@ description:
 properties:
   clocks:
     minItems: 3
-    maxItems: 5
+    maxItems: 6
 
   clock-names:
     minItems: 3
-    maxItems: 5
+    maxItems: 6
 
   num-lanes:
     const: 1
diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..21dda8066014 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -40,7 +40,8 @@ properties:
       - description: PCIe PHY clock.
       - description: Additional required clock entry for imx6sx-pcie,
            imx6sx-pcie-ep, imx8mq-pcie, imx8mq-pcie-ep.
-      - description: PCIe reference clock.
+      - description: PCIe internal reference clock.
+      - description: PCIe additional external reference clock.
 
   clock-names:
     minItems: 3
-- 
2.37.1


