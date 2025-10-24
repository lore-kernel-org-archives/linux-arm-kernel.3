Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7203CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 02:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iW9AQFiihBGqLVHDGXpdS0UbBMUPSl5T0RPdsMHN68=; b=LX+no0UrbbVH2AJ/7Q9TmtWPIF
	yT6BnqybWheeAjZG/4VYI0aEhRHbLYgz4bz2jhLVE6Izz28ULcbhOKnYrL/Ee83sR+C4m4OCpOz/U
	2paFfd6ZcLBUe08KwVxJrn2UxQ14u9eKrHPqh56u5nqtXIbeYE4fWbehg2fwfsC5YQkGDQZNYmAJH
	4UDfgeMt/E8INceF3TriHJi3QVwO9n/ntsosmGBLbfFqg9WGnkPbcyKzQfdO/BnyUg8/PTY/JI07i
	HpthVCBWwdwJUVzb1NScflrklE9mZIcoWmnVXq5X7tknHHT/T1JPs147A3vDUabmyzoS/oWptx3TN
	RwbNBc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7k5-000000083fZ-2idY;
	Fri, 24 Oct 2025 02:41:25 +0000
Received: from mail-northeuropeazon11012006.outbound.protection.outlook.com ([52.101.66.6] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7k2-000000083dG-1THw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 02:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUbTKTltc4t3LPBG9oMDWYVpohRZI0DzVJQTpvTcZTzA7tqe3Lk84YilnBrFzHJO1GRA+O/MMB3tyA7mEIHnFA5Ef/U4KzXK7JdscwDuKOiKxERqDzjrk/+bBYKk5APhHQ8XUF5ajG6hDti/UOC52BlO9TAX6SA4n9HkgSureU3ixkA06lqvb9SNtjbSgDNIxM5BdxYOGcpwoeh2RnIrhIaWn64W/azL8e67DL7C5M30zC2MC4XCc/uiG3KvjJuDbY4PhHWmM5g7a8BwP34Y4ynYuJEmlf/ehe+VksK0VguwdMJzNFRKzp39NZbJypEWVyGFAizjnELcdqbZincnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iW9AQFiihBGqLVHDGXpdS0UbBMUPSl5T0RPdsMHN68=;
 b=ZrQCWI69jAtcSx6nzoyQG+yOT8u2wnspQWL/hfrwlfjT43xE3miH/QEGr/iCbprl8hT7hVIlR2stTFPwFt/Mto+h7XP43iruQimOx68WP5Qd0Vf9eiseVdp3CUS1YtDzgPkRh++2bkqUzaVExnd2ZRAsJfNRAz2dFfACykz9P6kSbDQY9ZJpTAJFbLnDxX0AeZIXh7HnmPUe2T/mcQiFTBxhebKV9GOJHXYt72XKeOo1Ywxdpg7Sy/p8Kf5WMMl/Fmif6HGDjDQwgGblRYo2Z9nntf8SPE79WMUwYLfX8LJthneM4Kk9jt8hXN8hVBZ8+hmcJlrP8ACdaotf9+C2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iW9AQFiihBGqLVHDGXpdS0UbBMUPSl5T0RPdsMHN68=;
 b=D9X6GgTBVJY4EtBGtb26qYJe6ZY5QAJie1lMV6dcI4ewrQgAdnA4q1JUFDa4xnXvppS3YW1utHTZ4p9POQ1Au8vSqxDG17wjVuz2oqDj7jySiA70oN3T3sqsw76F8HORE4fAmx9g5xMFP5L4yTX28qw5NAJBOslJbM8gO2+oazR8VCEDVCg7nwMuCBvvIjm63ZnJ6GMunCqRUU8CAePYeaD3r7a/PNLFdKyPoiogD7QhP/z1ioYSJ3Je9jJa6k6OsABYLXCuk/VuArcaNt0iIZRCp019O6Hd0I3eX3oGZVnZBcRZbxWvQvn3w2jH+3bNdDYBKYLwIsF5AwLbQG1Pbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DU4PR04MB10624.eurprd04.prod.outlook.com (2603:10a6:10:592::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:41:19 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:41:19 +0000
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
Subject: [PATCH v8 2/3] dt-bindings: PCI: pci-imx6: Add external reference clock input
Date: Fri, 24 Oct 2025 10:40:12 +0800
Message-Id: <20251024024013.775836-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251024024013.775836-1-hongxing.zhu@nxp.com>
References: <20251024024013.775836-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DU4PR04MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: 469b823b-47f2-47b4-853b-08de12a6cf17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KGddMG2pLwhkRKpAro8jkNU3msf5tfay04wayHc0yLt7gOqfUgV/A4zT3x+q?=
 =?us-ascii?Q?QGv6/X9VxdPKD7D4H2zJnfZhAWSCXE7oBoOazO5+qWE4TO3ClEWZXj9OqZIW?=
 =?us-ascii?Q?StKuiv15yQroireN3KkBrzoFNImTH+bCvnjGC4oh7FKVa6P3fRbZBkGVfqRO?=
 =?us-ascii?Q?2WuaViirgCgkkTLY6tjzHm/QU21Mu0QMHF6TuEM30gqmco9NX9lVcb+rfVoj?=
 =?us-ascii?Q?aSbEcn+p5QYFuRTdNum27GXHXnbf3cL6GnIecx4PJekHx1dELt0VB+eDOaFt?=
 =?us-ascii?Q?wRt84jnWHjytAcAl2oZUS1WKY1om6b8pmvsAmTv5F/eQgfPpTiBLF+TslIKU?=
 =?us-ascii?Q?NCHPBaR2DXJUKiP+WpPwLWawatbhDWdxcCA/nC1e3IZk1816X/evjuYhQCTj?=
 =?us-ascii?Q?+HOu0HRJ1vrXSrXudiRPCluT2vZCP6pYI2G8Amtyrwm6TUCmcYJQtV4QCRSB?=
 =?us-ascii?Q?vRQMErjs08IX/4hByNNsdPA6zBFolZfqM8mQHhWSI/Hc7+F7oZe6H/mxYxkd?=
 =?us-ascii?Q?DVCTvRXXwpPr/mzMBFjK+svH2wqn0kAgFFOPbLOYuXU/y3Kzvv3zGrS+p8zL?=
 =?us-ascii?Q?iI3xldhQn0Q8rwFkqj46YZxhCu/IYMQnDiJEXDelVIzrWAwEqa07ct8KoPFW?=
 =?us-ascii?Q?++fJT0fdrKIMYeDS3UfjqRfyrbpjpf0T7Dgb3BR9x3ZTvGKe7SsIuo8t4g0n?=
 =?us-ascii?Q?nNrrAM92NZPzf4M/+9GUBiA836RXl/xhR12xV/U8PNF2X4b21dZmjbGbG2Um?=
 =?us-ascii?Q?enSHqH88eIyvhRsh3QRqnJudR6PM0kDP7YaLIU/Y6NYmRXSAmgrOA9j3elDp?=
 =?us-ascii?Q?PHnC7QEO41pw7PKntmY64WskGTzQXGYyoBLuAWBxR4dQSNe6umxjr9hcIcAI?=
 =?us-ascii?Q?3QlOqGFThusB6oZ++LV8p0F5chVzqyQKQFdS6HLNhxdoxQ/OOh3Vy+JD/qJw?=
 =?us-ascii?Q?6nwjhyDW8qVNy+lEajn5jMdhtcK2IKrYEgBn8x8JnYwYFGGBF+gDcxaCl+Rx?=
 =?us-ascii?Q?PA1DiGjY6c21RZ46Bj0qWPsDROszp6xOCPk/Bji3h8MiJuk/onW/ZyW0i1y7?=
 =?us-ascii?Q?LO2syFNnif33VQ+9clNgY2NJnYQirxs+UZ17AX7FNcczrrnFcnZYuJHkIjJt?=
 =?us-ascii?Q?uyTJqlwJufa5ld0hXQW/LepMI77E14r0OTDj1ypW4DC93J4Jm+U7J9FJyiR4?=
 =?us-ascii?Q?Y3q6dbdU3wGLQ8ySSEtkzHRMjO8Q61YarovQIDcwbhhM4yM9s32dFKEZD4Ty?=
 =?us-ascii?Q?cCDAY7cennhc2WzGapcO95r/sTx+COcPBLXB4C3RMKAdoOt8+NKO6X+yf2R6?=
 =?us-ascii?Q?CzYRkRrVTFQ0+WpaRsCuay5na5VdQQSLTc6WGj5PANG40la51JTchd0sJhbN?=
 =?us-ascii?Q?Qpu2NmYXbOqiCx9PsnPQcYNrVizXJWvhr/XodoCDT30LAO/GODbukg19nfv5?=
 =?us-ascii?Q?/UDUnyGCrdue/Lf4diFfnggA+419igpjSo51l8G+EcLK/RwrSLBiZm1rUPhB?=
 =?us-ascii?Q?CMld4ggI2KYoNsgRIbXb/w2BiNOvEX/NTqJ3cMBlwVBKdCvCkFmAYq76zg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hlgx4rhOAh6LlGiBy4kEMcYWSo4tsar4AfRDcc0PurfZEy9t8kIQiMuy1UGU?=
 =?us-ascii?Q?cuvw+TFcw3fGR0b6EFqsa04O7aAtsHwW3DOgF0lp0rJrPbU2JH6+2urpaBUB?=
 =?us-ascii?Q?mpbooM+qVrH+VIQ96htaWK8a9AIivbHYXz1O8aUcNPOtx0Dl5G03IJY0ohai?=
 =?us-ascii?Q?/kdLdmOD9ta91w18MoX49UvR+7Y4aeO0QzWkHd41pZUEkM36gcwcX/3qYh3u?=
 =?us-ascii?Q?Jojuq3riw/yMgv6618D4C+opyPeB0IbdFHDGjp8DFX4xSvQIpxu+oXG7fdxf?=
 =?us-ascii?Q?uRQCvE7IF2unGsbr0MkODDSq9RRuB1QXSxP4/0olnkd91L5tfNPU2/6QJzkN?=
 =?us-ascii?Q?QM7Vq6HJDovltIw6DIHm9OfQLxtlKiNjcqKKTqxzs1ZZjI3JqnqOoCbmuWME?=
 =?us-ascii?Q?G4m6OOdWxIbRWYRLb7X3uzi3zkf/+b/7ZcD24cyg8f1LMnlOYN7nJ3LfSX0Z?=
 =?us-ascii?Q?Pkk5lHYdgtqlV8XZQHrJXidlf5GIeR6ER5BlwovMf4uCUWzyXGRSHA7jc1MB?=
 =?us-ascii?Q?Y0Mk++yO1Ecb33OlJpnW87CsdUNR5cRux3p8npo4rylauTYF6NAzlCNG1vvg?=
 =?us-ascii?Q?lFgIj/Jymdjxlqhar6WXrwT4LDwdmoTEq5HJUuYIZ+0Av2awPaIwbfVtKpH5?=
 =?us-ascii?Q?j92NERb4yuotxBxSrRwNw1ZkSoZI+ItDlc6MSkNK+YZlORUYRsmEwDob6JGq?=
 =?us-ascii?Q?Ruvd05664pOTqqhXC0Vjj43R3R3fSQazYuUwVBOQA4bDYOrV1WFJIYZdTOpK?=
 =?us-ascii?Q?jw8NdA7Knk5dNOp1nYXVGa7ls1u77C0tcxbmHcjSSARZkKxs+d5r0VExUKVV?=
 =?us-ascii?Q?EaJ8oR0A74yqIroiEz7/TI48y5i0W8Q9dmfpzJID1sr1PAs7pMR/plB+ja8r?=
 =?us-ascii?Q?nCawKxv1AsOaKWhHuIUukLxVlnBPXnm8JvOWfOyncUnI1RpSQknd0JWQCCq0?=
 =?us-ascii?Q?g9H2FQjb3QmuuH0gMj4I/1N87Xa6TH5BR5C72nEIxl4bRpRUg0CnkQBd9EKh?=
 =?us-ascii?Q?nQGrnqEXTZyB72aXlKIrcP1zEueMjiUkKx48JZI+gNlPJpliEFa02hIFLDHl?=
 =?us-ascii?Q?CoeJzE/luDmC/VEYiODy86VaNnqTfz7CskEkoUCCtlXIrQ+iA1TyDvsinGoO?=
 =?us-ascii?Q?MVAB36f1QEiy0jBhCuQRJoJcZl7vcE8G7bFzenTNJGcu55R4Bj6QuHNxOgzK?=
 =?us-ascii?Q?ovCm5CSCSuuC+1om4hoLPr0zUaAFI6/5C0mvmSN0HJkt4A46UGizZ5jf+mal?=
 =?us-ascii?Q?NdDzFEGvAde1O6Vm9dQureJr7O6vHnJB4lcEKG0CMKFkPbbkYiC+DVMD4hM9?=
 =?us-ascii?Q?K1xQt2Lcq1TlpPUjzVl7hDvVa55d8BGZhofLASDvC374YrU54GF22aL3vsWq?=
 =?us-ascii?Q?2rpi/Ms9sLaXFZUQGgjdW4FimMNhAyCoZQ5ctODfkRKrR0I9wRv9+NCytayP?=
 =?us-ascii?Q?y1sO57xkN4/brT2NKgStO2ulNbeFSL93HUdGZcf1wh4k2abRTBlWMc/V6oDa?=
 =?us-ascii?Q?RXk2Od+JfWxVJ1BXHhd3ktt/0b4Sm2TOIAyhORoC6pmKb+oZ0sTm1+xyELs0?=
 =?us-ascii?Q?/tv2ZBzRPoEwc3SsyPQdIZ7Jvf4i43ObCTpCEe6c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469b823b-47f2-47b4-853b-08de12a6cf17
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:41:19.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh+R15jC41Hd3i/lF9t0C7y3tg9rJ84tt4vANUrp3ghfJY5yK/ThvyVwHIMYJfwO156DKOpGzLhhsp8z0ve/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_194122_392036_A404F38D 
X-CRM114-Status: UNSURE (   9.12  )
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

i.MX95 PCIes have two reference clock inputs: one from internal PLL, the
other from off chip crystal oscillator. The "extref" clock refers to a
reference clock from an external crystal oscillator.

Add external reference clock input for i.MX95 PCIes.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index ca5f2970f217c..b4c40d0573dce 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -212,14 +212,17 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 5
         clock-names:
+          minItems: 4
           items:
             - const: pcie
             - const: pcie_bus
             - const: pcie_phy
             - const: pcie_aux
             - const: ref
+            - const: extref  # Optional
 
 unevaluatedProperties: false
 
-- 
2.37.1


