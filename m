Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC35C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/1ITjMwUAAcUzbY5RSpObofmW185rHSqiBJeL2Ra+0=; b=BGFLM6F+/XdKcQR+SHgrk3Qwjg
	6m+JirKVb1ORIF/+8QmIerM/CuARcSAafQyctOJYiplu4bqmOySPA4P4ZjDoCbERXa8DEaF6YoFiT
	Mm1+gTZl/gL1AuTNbHkcINO+/85HV4eO6X/0yO8qow35/DBVZ+iyvVJLoUFA1Twzo2qji+1faFJxE
	5w6eSL4y2uTP+/lNq78Ah4RGSA3BUmsNJMgoUB0mKoSalXoCBzeYGgQMzZZDAT0KU/qtlS2HqR5eR
	lrHxnDo/dFbMLijqAjsz4l17sB3cCPmmYohdp7JyxOihuAu/RuV1Zfrwu7ekkmeSu+5mR0wuvbu8R
	0tiY3FXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSIk-0000000EeVM-1Fet;
	Fri, 20 Jun 2025 03:20:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSEZ-0000000Ee15-42HR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 03:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVnqoFfQrNthhzMXDp+kii3Q2qzv5t6KFGLQQ3i3Q5/N3fmGEBZkeKHAI4E3Re23dUAcXIX6pSkB7+ioef+TTyXXr/HB0uYlyrt/+lPTIaGPgsHIT8SiA8J7+dlZ9IixzwWh+C3g9BLptJX92cOt+9Ev0tomOLhUe8+JJkyxAepd5TwkRwaUNp3BnezSagFMpzjiEuAkQQ/xRK5fNkPF01pGdYq1abwcEb69PgKraqU9YrPgmLxV5IfFo5+84L7sZMWy7Fz8tPkXkHAjBt5EDt2XQCmmkwwBeWORC6VLtc0UcUQ6/cHWk8AyVbVaNtD+lZCH6ywKRWX6p6tKnMuJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/1ITjMwUAAcUzbY5RSpObofmW185rHSqiBJeL2Ra+0=;
 b=obA/EfeJJ6nzvUxdxFawykVwFhc+rXbc4wFT6evcZbu86ej+FBYAvboiSFGq2rdjHJ84jsH5bmhZkxcRql3xHJ67rQ4tUJ+FPTBIDL0miomw1JIY/TazMRIDythqxY3XSOLNtkVeLRidP11zpoyRX0HTQx7z/JXN3nVmcjtZGBmiO/pdqAc9lryId91bVz5QBXLkHwqrbHEjCuMZ6d/3NpcmzLIdXmS3KP4U5UY+428wMlErY6B8XfkgsuaGHdFMLfSrZVmmrWRe1JuYwljNfncy8TRlNsPO5fRtIwBt9DETWG4mu7yuCwQKNtz7WR7giWcL3ZZipSLakXneGtSEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/1ITjMwUAAcUzbY5RSpObofmW185rHSqiBJeL2Ra+0=;
 b=OV3OA0ChdEOm3IQn6b+MB0n3ZOsNnrmatCnUvT+cZkZllG//D1sPVNXLf2NW07AfLIB5PqsHlQBvng1Z6Yaf3GcpdIH54UVHJqWDNiz/Pjd1LUuXuwlLvKuP89GCP7ygpPDwd8h0CEXrdWVHjXKpzQfgB5iroyPUBM13LtAEA9fBvoanEy2Ys/AXXKXIO6009iYATWUYOIPEELSrDk6ofnR+2YkZJnNNRBOe6W5Rz9U3PrTSR5Z4GKF0oONT2VFN1TqX+qh80k4YC3d+QpVBsDIG1mAHvbcTAh2eBAe529eQUHKqjnR7red4AlJQj+UF1J+FdUITVqnJZaKUTGNO0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 03:16:04 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 03:16:04 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] dt-binding: pci-imx6: Add external reference clock mode support
Date: Fri, 20 Jun 2025 11:13:49 +0800
Message-Id: <20250620031350.674442-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250620031350.674442-1-hongxing.zhu@nxp.com>
References: <20250620031350.674442-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db5fa68-bbeb-4e09-3c34-08ddafa8ca5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TGJ3cT91g2tmTECVnz5ql0roKVIfPNhCSwMQ8gayUmqe0Ig0Iv37Fh4rRwLw?=
 =?us-ascii?Q?Frx/74lC9MjB9FE806jd9Q1ggkYYMLmGjQmz83kK8T3Z9mg+G8kkmEBs8jCW?=
 =?us-ascii?Q?01yki6LIHEXmyNXXxBMt5gjMzvTZ2A1FmUhUxU5he/UNX3Vgx6VpACqlEDTj?=
 =?us-ascii?Q?2wWRGlM7PaFPUPhLHeRBf9NdvoLJHl0Oil0sHRnqMs3naXueQL6CVGbXeFdk?=
 =?us-ascii?Q?XDySA7hXYdF3ywOlHLoPIu2dWu3r4UKyZ3sM7snGfei0W5KLs7xRVc56MTI5?=
 =?us-ascii?Q?XPn55E/IwQOnnsxHnPZJYB5RKOBCknY8hpcrRd+9Hqg/DHUN46HJ0zOGtYvF?=
 =?us-ascii?Q?beD+pWyQ+8oPrH/82tICYeVPY5pOViKr7k15i0SrlYYV/eeKp5qwPaMyX1H7?=
 =?us-ascii?Q?z8UwoBzrvK1CutT0AniyEplQOOKw04slvHFtHLd1HAA7Pb66GU+PtZIJExvm?=
 =?us-ascii?Q?eMBTKVhYGxBls7fdq6IqXR2+XU97b7J01sKd0WotJe1Y8PAI31juxvRtEqSJ?=
 =?us-ascii?Q?EF1ybTqRQ4CzKagDLP7xMlIWTXXNMJM5FhZJ4kmMgc/JhoV193atSGSIcNhe?=
 =?us-ascii?Q?AQ4YYeVCTqO1kEtrEQGALFjgd2gQD8bjdvWAvms3y1DbE+QJtKrA5VTgDeCR?=
 =?us-ascii?Q?ammZ7DRFKLQjeEL/x4SoTLFqCAt3+HAH1Yfc3O0n28L3KO0n6tbV+Y2EmZZl?=
 =?us-ascii?Q?YBMAAw6jPuXk4jXsVbkdpfmGyDJMZSgq7Xeqr23gSo2eRqj4dXHAj8SKaGJV?=
 =?us-ascii?Q?xGsHqhEYW3vQhn5NHK5OpDRwTcKsfkDX6FNo4jPKQXCM7VoVWnpcPmQswvDn?=
 =?us-ascii?Q?T7oyZjmTqvoodbWTSdHTCqUinRD1i8nuT1vHoPBkByAiWBibEcVLLO8JIIdh?=
 =?us-ascii?Q?K4iWryEZJI72JhJiuMMO7Yby5JIIwXrJf1EqgVl8+ojACD7tMkqS6dt9kOZ3?=
 =?us-ascii?Q?nfV/CV68CJS/tq1sIgFUJvJuCcw74nRUdIbyI8xgRJH5GvwHH10+HPRhZeZn?=
 =?us-ascii?Q?bdQn7/OwNcX4+7sJbryegEsVhkRyob1+HchuQt3PRmUqU4yb6e/k70Kokgnf?=
 =?us-ascii?Q?M2/MJKoV4rt4hNjCIspASCrsfZ8T3Kfse42eN7alZaK0G2RV1VdpE88CwDY4?=
 =?us-ascii?Q?wOmRNAyM/4AcDZH1rFdZydBXCvaxAsawpFWAgrr3eFdsM2ehM20ImY5S0Bw+?=
 =?us-ascii?Q?0xnMLQUw/uEttZFFJfwM/nT2hNRQW/SemKULQX6cFcN8NWuj5q0gKitAFadZ?=
 =?us-ascii?Q?EBNHXNzcq5o9MzUYBJ9wZqaB1/g6LpM/uerUTiSQVr02XaZVvWGSojEN+18B?=
 =?us-ascii?Q?RJ/dS/bNmNgjPQBSGYvdCl9X0/1FJBwIdw5vyRrPJt6ccE5h8+d9j7rwE8uE?=
 =?us-ascii?Q?wjfrRfokVU6mOSDj0LuWSFr6oHRMBUz3DBg+uZfBrB8I7yxioLW+DRfWvQP3?=
 =?us-ascii?Q?HIHk9a77xdwlhY0DZfA41plgz/ibaNgHgFETFL2cIq/3p2tn2tykcamPYUXd?=
 =?us-ascii?Q?X39g66g1L3hGy+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYehh2sx5Ek9ihWAUScM2ajljqWeS1mWY3BdYQ3+rCCgYJFRiKjrN5Z3lCr9?=
 =?us-ascii?Q?Aamho2kagCyeSqVK+7CalIg3MiPFDs+GHs5qiYEG9981Yy95BzDTQKBXtpj7?=
 =?us-ascii?Q?4D2On9Ns2tTc2sVm2pmN6k8iDYha9W7RHlsJS0RoUyooWVuUyPoaDpCZ4+ii?=
 =?us-ascii?Q?L7xNgGuB29JrJpvsPe48Xdyse9jjE/2+BHIDrhismJiPAD+rMJJZzwgVMu5l?=
 =?us-ascii?Q?rrA58cqD+q7iu/EyFO4I5eecJWOHwvXTqmUxN0VQ+pY6t3y6igXL8l+BxgXR?=
 =?us-ascii?Q?7JsGMADl6UNKhHjmhKMwYY1VsdjJ2RI3a6FppSTRYrZJqK+1Td0NBvTiou5P?=
 =?us-ascii?Q?cEdNTYCP3MPVBmIu3h6KUi68n8yVjZbng1oSXZrdNziISXKVSDFNWP+aXosX?=
 =?us-ascii?Q?02wD3BT1DL86Eh0JNQUWnXKQr5ojSfZjeBrOqkwUC2upei9TiCHkk532WJae?=
 =?us-ascii?Q?bd3UB6Tm87SuItVAgMXOLfyhJc5Z5e3DrMAku3Rcui/bSkIq0Lj0DpwSl8sj?=
 =?us-ascii?Q?uwtXVw+LmkTMuKsu2qtlY1Vw13kkZUSPAdnyjk2NaW6oW+OPWdqp1EKR6yfe?=
 =?us-ascii?Q?jnAIX+kTwxXqdf/sBX2YgIZirl3NyhgbEUQr5e1o01dENnSPiczXdUnMVUpm?=
 =?us-ascii?Q?ooDsUiFHg/4qQ4oF0jJyCBvYa4Cs+5GqlPe0fgC8tF3ZfEZCA6mXf7tZ2jrn?=
 =?us-ascii?Q?BQiqJ66TfvOWYa0ydFyhv0A4am54QRlo4AIhof9IvVgAd2xRYhzkOAlO1eeK?=
 =?us-ascii?Q?hHkW8TPPAGguwWERyMGnN4B6SiqLzL2L8QCWa7SIh5uGbrDJguqOWBScY5v7?=
 =?us-ascii?Q?mQB2YMcTThKP86Lnd23u/JDSt/I5H0X4bICCq2Of+r0YBj72cAIFLgqeAEEb?=
 =?us-ascii?Q?iWn46qtvt0PHh/vyZ9qb49GnPVCIRlELZOg+lI3jr5/0MaSRFLzshzIk8z8w?=
 =?us-ascii?Q?V/hfBUMe4JUxdQVuN2omf4QB1n7O8X78AVHMEQNA7HX8bkv7lznbciitQb6x?=
 =?us-ascii?Q?L4S2FGo44T855nAIp27xNiElfNGBxR8J5H5wjJNs7D/kv729TfWyAgYmoRUM?=
 =?us-ascii?Q?FigNZC7PJpkJDRfk91pTVB0WyKmbienF6qYHXuNI0hkNXfT1bfOYjMX27vw+?=
 =?us-ascii?Q?xDaWKh/JDUm0odFn8i2XGXyGWUV20sqlF1TZTYJT/3Q5aCX9MUbDt1Je68so?=
 =?us-ascii?Q?Uq5VV3U2iMum5CDTJL1OGdOblWMyha80/3OG59syPxj4nxbMiZSCayuS2qSD?=
 =?us-ascii?Q?Jv/hbwtcufX6ZeTn3MprFA/anLyGjxDo0Ds1miB6zg8iUnxP9HKuXdca6y2H?=
 =?us-ascii?Q?DEUAPCaA9qNe679XQzKiaFtcrb0hNnQXVSC17ohnjYJlQ7kmJYOXRPIKfQkH?=
 =?us-ascii?Q?qrAUei9f3HPuglMdNUfzCLMcPhI+3Pf8kSldLOlL3hhRaY2Saor+sM/l6svz?=
 =?us-ascii?Q?UHzZV+bJFR27ZgNVu9NwPsZWCJw0rxo6bAlxqSJluMVaGIajn6C/Afcj+lLM?=
 =?us-ascii?Q?EmD4eHCDWBd7lQspavIMJJmZXgYYG4HaiZKYU6A+co1dflf0mRRHNY2zYnXC?=
 =?us-ascii?Q?rjSDrw9QyQrnpP+NHEz1DfGbJQcslOVGjQIhefaY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db5fa68-bbeb-4e09-3c34-08ddafa8ca5e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:16:04.1775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTSwbrUdVhzu69PNd2SOg+oN5OqWPhFB7+/MkhYLopgMlKSJ8umE4iAAXK8xqGT6QD+1qTLoMnVWZ8Da2uMx9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201608_001001_4F930D41 
X-CRM114-Status: UNSURE (   9.17  )
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

On i.MX, the PCIe reference clock might come from either internal
system PLL or external clock source.
Add the external reference clock source for reference clock.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index ca5f2970f217..c472a5daae6e 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -219,7 +219,12 @@ allOf:
             - const: pcie_bus
             - const: pcie_phy
             - const: pcie_aux
-            - const: ref
+            - description: PCIe reference clock.
+              oneOf:
+                - description: The controller might be configured clocking
+                    coming in from either an internal system PLL or an
+                    external clock source.
+                  enum: [ref, gio]
 
 unevaluatedProperties: false
 
-- 
2.37.1


