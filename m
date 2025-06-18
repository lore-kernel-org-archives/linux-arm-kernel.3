Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JDf15+ngiMm+cJ0DBsedfeRD5Ab4Q01vKu08D4Rn5fk=; b=aQb7kNZ8lXN/ej4Pz4fNBiAnhO
	uWOhJEc4ZOpb/RiHxc2SwVYgtvb7UW4D2BUoQjn7s7lfCRhR8+ILH9+nS17hIzXCkC0MbxgJFiPYy
	1iOxo+3ussBfHJkw+txf1HcPwSmSLEC1CLTbPp8cHJ24+Fw59JAHXyHc093KviLuw3bHaTl70c9F9
	ya9qt6Y99DQw1q3lt6d/jg2ICbS7gmPcrdnJKB8GJNxgLwmsmUcbpWrfjJjsNzvIGMv3iPB1S4P+6
	eyVenDVo/CiQJRm7b4Rt4/6+aIBqdafhoPv5uPDFS7WAJroPEYEpTM7iDu5YumO9IIvwdfoGPzHQl
	VCMnYVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRniE-00000009M3w-2iEg;
	Wed, 18 Jun 2025 08:00:02 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnZM-00000009Kjs-34pg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 07:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iavpu7wEiT0lDOyCrEH9LZPETSTv78C+0bc7iRQSJ+tcI1f4DgbDVjy1Txz1S3FvZGTZ3uhnVUfXSPo7wzoudh25WfiaC2lhfXBncyhuCYpzyBgvNbCBbG0SyAGEAgwZ7S4/DhWn2HEdsK8A/DihbXlRB6Wdey9Syzx/RmZp2voC8vHXp1v3LqasKQSNGWSPTR4k6v94E7I4NwEMlvEnEilQ1omEokONFRvf4Au28ciC4g0tHtAsKABTm7b8dnVlVzBS5cFR2fMiU8CfnUHhTKrYN/ZBROe5+1LYMew4uKpeDyO5kC3sdTBrdvG1WMhCqrPPqsHDtujqvxWPzNqUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDf15+ngiMm+cJ0DBsedfeRD5Ab4Q01vKu08D4Rn5fk=;
 b=iBlYoIXKihfwBPOSmbI7C1qLwRmx753o3dqr+ksvt6vYTU/APJp8lzPo1CHX1sS+ycc9QGWkfqtU2J1qZSdu0uBYU4bHCRfo4daHTXM7R4iLC8vaTnhXL97Ev4r18ivlo2H1onyYD700MKmUlaBoHyz7sCXpyiLMA2EttNAenbVkV88FfdDPCxjAKoF3mu1zMIFgACa0Q9+FXrYQcom6Dt5krF+XGFGusZuUv74tCPjZDC7G/0PH22lnymrRWDkAuLSOthatL/qP+PTecqTV13baPu8f2H0VJtkWjqvLORXQYUAXJyyGY+77ASt7navsTsYi+R0C9AWF6VsiPt/NJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDf15+ngiMm+cJ0DBsedfeRD5Ab4Q01vKu08D4Rn5fk=;
 b=GHiJgNRZPPVPijss4NniRw5uK8wTqJZ27kDHpbL/iw77gXyvQhr2M5SW+IEz8T2sDGtG5XeSu+9hPjwTXEX/PWh4Vls3Maj0IuYjrU3CNp0whhP5i0J6JS+ByxE/ZaazVJWd7+t9/LHZlI/c2nNb2Re9T7Y2ZXNrVWqRHMSR7KbDjcDTimUVvhw3yht+11cvY1RN1VX9bdOMF6r1EYVoCklwXnM4esoGaUYHaejfp2NvN6EQrAW0Ih9ux/mAz4m5Xon9EBR0ZDFS0sP2ghjQu5e9y81y8gf8lQu47PEXfx4unZzDK7pE4m3PM6NyHt+NYem9VzkMzaH/nd5AYi470w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 07:50:42 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:50:42 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 1/2] dt-binding: pci-imx6: Add external reference clock mode support
Date: Wed, 18 Jun 2025 15:48:47 +0800
Message-Id: <20250618074848.3898532-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: d74470b0-2ebf-49eb-218d-08ddae3cd336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fmUk0Mwwa7N6vkBs6gXQaRKJ9xxZzUBbSFbybjZB1z59G1H28/nJBSKsP7P6?=
 =?us-ascii?Q?CWVaNcE/Dqqd5DoeQmar33WtwVRmnfzTaCM4C+Mky4HKo1IaVAQKp+W7Bix/?=
 =?us-ascii?Q?xvUI6z/bxawo6f7K4VBm1kjDA1/3Rb+Fqc1OKq/YoV8nKzgb2Y/Mn0oWxJ9w?=
 =?us-ascii?Q?irSvJZ8ME5af1K73GkjbsUKv1+HaWRwzLvYqFiovlNeAYSNaJZLsUWKbcIIL?=
 =?us-ascii?Q?tYGrSRd5ABCol9Gkw2UJbvQlDXQHmmfELxKSaLbshppfMHt677T5Puy0iMDR?=
 =?us-ascii?Q?avyMbRbCCMaxTWkrnv65ZXYFDDotL+rax8QeFBfw4v1VPJt4vzorxbeu9Ltc?=
 =?us-ascii?Q?mPPESr+gzqAvpdmjUlG/Wv75l6lEkDqx5dyBfi/TT4UqOWA3ye1DRHMNyBf0?=
 =?us-ascii?Q?1YhTsKU96IKygnUraSdUjeJc84rWtwisBlXC2/kBB8AdCloM9OUINRBseaxk?=
 =?us-ascii?Q?l8PIT7xjLE93FuglMsAUJDZ910DCL6r6Jih+ECc675jduDHHk/uW8+8p9mqU?=
 =?us-ascii?Q?g96FotCpHE9SKYt72he2NpxLWJXstrPaTQr1kq5AqPRerjyrz2w+F0yDKbGE?=
 =?us-ascii?Q?kLJoDetUUDVYgvmF9o1UIXwUzeyafNuHJc8k20IfV4aCqQMU18owKDxqFXZ2?=
 =?us-ascii?Q?oWT8NbavKuKJCU6HAW3QrQg9JVEBEFIpUFKWH60lc6LpoiT9R/1fots9pQHV?=
 =?us-ascii?Q?wMx3dEPMWP3jMhu2vPqGeqv4u1NWpCJoI9qIbIsQrsnGBsdd3mGUrpKrxFYq?=
 =?us-ascii?Q?ZtxfDDJbM97O/3I8yaSBs4eNiyrLdwvF2HoPQcM6ldQo/PQrocvBLohZ80uR?=
 =?us-ascii?Q?VbEdHwQarvVmK6j0PhGEEWHrSFMLwVi/ipJAZBr+7+A1vV+VOutMQP6sWzNV?=
 =?us-ascii?Q?3sOmK9AVpPpKj50qkc9sjO4DhW5gou/7lG/NXUrRmFrVQJ9AE/0uFnFIk7NA?=
 =?us-ascii?Q?93a+56K9OXpSLrOVcSrH0Kcm3F+0aAf1bj8ES3zT5OU7ADIa4dFC7Ge2k+i8?=
 =?us-ascii?Q?OvgIgZClXZMMdZKgy6J3n/xKgRnuoPb81bIKvZH+J7oxjIRu+NCP66CKYe7U?=
 =?us-ascii?Q?BHGb4/BLkVzw+5h1ubyvNm0ZLXaIwS7GScQt08QGFNIvr+nJoe3EDAiUSCyx?=
 =?us-ascii?Q?c3Afi3wkeGJ30QglWG8zJAlFVAFPqDv8bAZ8uLcZ4jnDqmCr+8X8H+LFDTIH?=
 =?us-ascii?Q?WfZzL7q0Bc3BpmEQNnklAnGNiK08KFOAh+4lwIMoO+nYAhc+y93LMSdsTR3+?=
 =?us-ascii?Q?xV0FxrbQXEFaqsq0eg3LAVrTDGa2dM5xo5TriKRE6M8HCyPkAvqTbe+DolO9?=
 =?us-ascii?Q?vmVF+e7DmG5P6nq3DQxM48HczQwRkGxqBCEpYzhkKLt7tw5Qiz4bQb8+lzSp?=
 =?us-ascii?Q?kPjR+EAM053N5rv6nB18eVVpySPngpfqxuIk+NmcXtKyYYI1a8zbdyZ4n3Di?=
 =?us-ascii?Q?alZr7qN6Y+8yy7a6kktVt1W+CtLgg/qf13JpwlC+NE7afoaRUqfVvssYVBXi?=
 =?us-ascii?Q?telEvBb7eixZcFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3WYRdAoZsL6nAlxxdG60a+MyAfizYX72KspBsUn/UjLq29F3cCj58V5nU14l?=
 =?us-ascii?Q?Al5/z3iV7Imyd/fCMK5aM6kLpFIOQg2YDdRcRqe1gr/9Btx0VQMQ+oflnlQY?=
 =?us-ascii?Q?hx5s+x2nAAhz04I95+YEuAuGL1FN5BTJHcsPWMeFMAaHSO/zISj4p3A0SCV5?=
 =?us-ascii?Q?ZApcW3P1+PfjJUVM7l1lpi0jMiyJYGSzgOckWtrL3cEh5lp0DLYe2mDip2fA?=
 =?us-ascii?Q?k8t97N7LXHx9hXlmAUSpRlPDCL6BbpSircNgr4K7aOiFGjzfb6k9owLULANX?=
 =?us-ascii?Q?ORg4yi/FGKDsM8PEdtXGD/sjTyYqepw9e5tHilOBfErPttSfEkphFu8ZNkIl?=
 =?us-ascii?Q?KR1H/FitB3HKG2299DO9EgVuvgeNAUF1TY2no4Ibd33D4Oc/Oa4mv53IAFmf?=
 =?us-ascii?Q?qbF2EKcBnS+mBOpVy/4nDiDtHvOY+af7ObNw/KZUg8onHTqliD2JLEHgu0ma?=
 =?us-ascii?Q?cCUBNskEuXOKXMNLn6sP/yYgvbvg3CDEl1tckbmeJ7FWTT6XhbIHSCaj5BFv?=
 =?us-ascii?Q?METwmnPJ5ZIF8/gXwZqrx/F3OtXYIoMG5vrvcnImD2Gqkpj2VuG7Fr814cmS?=
 =?us-ascii?Q?RsMcGm/Q1c9XfssOswEQHl2a+ZSwnYpIH9d4Ci2wt9l2pnYEJ3gR9pPaw05e?=
 =?us-ascii?Q?HcUGudhkHLEvqP6Ftv1GrJSR80wyRLSrFAcl9sGVDT5lTkT1WOLMVkpVu5WF?=
 =?us-ascii?Q?fzHO7B1XmuC2NYsqB5edBYa2uImtckWnag1xCRhmC8rgMAB8IW47pGAOcDlv?=
 =?us-ascii?Q?bAfZvgVJ87J7yv0XbTRp8S6BmXcZvHu+ZTKN7vievX+1L6sWf7kboSWY08Y3?=
 =?us-ascii?Q?zZtgY/Bb/MLDYXr1MPBmJvMzVzUgciIolTNRW6fnKd4rrf8/Qk9sQdOnFXFS?=
 =?us-ascii?Q?mVKOFezxbcw8LVn3YocWcxJGZnfi00BhIBQu4gv0nLyk6HNsAWc3uViaYQ/6?=
 =?us-ascii?Q?jwoonxNVM1jZ4t+WNTIiKFq6kja2G1W0VcVhyE8mQVYJmgJ08+TmJTfC1Ml1?=
 =?us-ascii?Q?PbiNQioYARlKNT127UlU2NLCxcXSOPBOQzpsy0798HgdXYNxhLYGTux8KPkA?=
 =?us-ascii?Q?GuFnKBOc5YZf8jgJVCrpCRWsqjf/ePdgoRvhKb0i5VQngrjQ2umuCTcZUVlI?=
 =?us-ascii?Q?GFVCKTdUKWmfcwmdg+xQvgGUhtIYNQs0NIWiCm8bJhLLtKN1374YF2IHOsrg?=
 =?us-ascii?Q?hefwVyMja5KgcsUxDdNQm8GhhmnuQNIA2M3Kk3EKFHYPnyecMwXZbme2Kj3J?=
 =?us-ascii?Q?K+3aafzdbieZ9rWqFh0mTzyJvqe7s4FYVwIj6hiUSwzNiZMcPnPesI4YmhL6?=
 =?us-ascii?Q?mwOPG2xjY15Kjj1LzKnNFzIVkcX8gBth6BmCZLSVHhDeBG4P3cqXms4oSFw/?=
 =?us-ascii?Q?m6cEZ7InlQJYjhgn/9GwqbyiKPn9RK+7xBVxya9/wzZ+IXv6ivTZ6MW6f4Z+?=
 =?us-ascii?Q?DbgbwnrYD3kXAHRyWJhdPxmznLhyR8tQoOfxftUpNavCloAk4PIpi81fLDP6?=
 =?us-ascii?Q?LSniO2j7LQcvt5osxs9GHsBDw9dJzwdA2iHDvcflPHWfzS0xSHtti2QT2WWO?=
 =?us-ascii?Q?YT9/I5nMPYOI0ocT4pc+krNNmo0kRwivvvljAIP/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74470b0-2ebf-49eb-218d-08ddae3cd336
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:50:42.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrcySPPs1FIxkjUExFKJc5Y8DmfQjuCoMjDqsm+b7S6iD6O3TmanqbfGmMuLdKXsp+Y7W1P5nkxjJXosz8Y3vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_005052_781236_0529EC06 
X-CRM114-Status: UNSURE (   9.25  )
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
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index ca5f2970f217..4b99fa8e7a25 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -219,7 +219,12 @@ allOf:
             - const: pcie_bus
             - const: pcie_phy
             - const: pcie_aux
-            - const: ref
+            - description: PCIe reference clock.
+              oneOf:
+              - description: The controller might be configured clocking
+                  coming in from either an internal system PLL or an
+                  external clock source.
+              enum: [ref, gio]
 
 unevaluatedProperties: false
 
-- 
2.37.1


