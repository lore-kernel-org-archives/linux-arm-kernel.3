Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8130BCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 03:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTTrqX+HkaCVoRz1MJzRcAXhetddL9bhs8lFzjR+Law=; b=cNWj3LKqOHosug2Fm5zfp/UeQt
	42o1+NHAsfdyhQxCxDnfd2DLqaRWJWiY3CRrg+2pGNeV82r96iW8K58mxH4v7PPV6URD3MkOWGx9L
	r2ZRPO/czAdYaMr3J/rrAMDxxlwUgEZgkBwJWKhow32r+4LAyCfUNu5jyWpBFdCAANFJy4TJSYfUF
	V/nOO9lAgRY7RGJ+2UNX5+M1fylQxTwX0Hs3CAKX6jec+dPxpnoURkcukccrA3Qundy4cQ/UxDiF0
	MxD3A8IBeBVUhQ2esEH+7Z4WCCIqatUEMRdAedGg8NFjaz5uPVd/mOX+XCgHsdgT81Wn2SocC6vdo
	uwqreAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Ia-0000000G7yP-1eiO;
	Thu, 18 Sep 2025 03:27:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5IY-0000000G7wb-2vIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 03:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzHSakqKT8ecDqVgaJEAJXanlW+/Kuhv+rP1Kn6575ghsp0z+zvQ1zHhSPoU07EUYmvnvArkEA66+u0cY+JgXug1gfLD76s3CRLeTBW/oVN2PHjbYqrfqs+RQQ77jhFvo3hBBRMaKOwbAnWDVcE2BUZMynQmVoneqtp9L8+MYhq51+Nmu77Ejr2tdtmMCVWkq+sVrNOHQZev2ZvpNo5vsPMmR9ClfJhRbwgmZLxZyNUIRbj+CXpkZsgwdWmLVJx/kO+omn5PPh35exnEIcRKd6OPNaqs0O9N4TlwGPmH4EOgoUdygFtPulf9xytiN6kR5v/xDnbQ3KOIB+X2izvTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTTrqX+HkaCVoRz1MJzRcAXhetddL9bhs8lFzjR+Law=;
 b=VholOx3IsYNK3nuWOc+kPGxNot/OqQQMrbwJsDIOPcwZDuZdMJsWhO4mTJ0NpEGDV+YF8D5PfCRD2o30FmskAa+VqJIPMSCBeSeaWSpOgmOnxElgohwpksniXIBpk0dx5pdA1JfI5NjpMquU98r7oKygA2Kn8yNChadJb6wWDaPHcjZOIZODWUhqS/1aK3vgou9MJUxEZJB5H7HnU1Qclk8SJ8AGkPXrSOCAMdQFVzCySgjg2IPqlJdHjLohzRBb6TgQjA6ziBFiscpiOsB/Uty2rjI5l51bCLGm1VS1Hg0Yhd7xI5sGHpXfBCl3cWU5kkYLm6BbogYtLmZ+fonSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTTrqX+HkaCVoRz1MJzRcAXhetddL9bhs8lFzjR+Law=;
 b=EY+MlRGKZPh0Y6wFS0RvERT1WDZONrwcxYsfm4L+GRZnehYv/Ug9s5yiKuXZ0yZwMytuMTboX5Gm3mWfnYkLNZ40PHTkYgovhE3lg1tO9SA3Vii3vvbE2YeMTx9DWJO5p05hJMq+gB1Pv9rxrenc8SmL8q7HxHcd2WACxAix+rxCb5LfOlGG8KsQo+CnO9mCPUZ3QZ7LfqtLJMqmjopwUgrhgnZ8TqHgwtCIV6T6Ky96XNrE7E7ynI8hUdO9IHgP/yWwyVGVo+9zHPi1i2rS+U6580///4STY7OUzQNpGI6xUXWxiYPjh7GFZJhSJTf8tKpT+CKCN2fWape4p/Dacw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 03:26:57 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 03:26:57 +0000
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
Subject: [PATCH v7 2/3] dt-bindings: PCI: pci-imx6: Add external reference clock input
Date: Thu, 18 Sep 2025 11:25:54 +0800
Message-Id: <20250918032555.3987157-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
References: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b91dce-b73f-4ba6-9db7-08ddf66338dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rV9r3OZaNCvwpd7OMMgHtAVKBaWIU36Ri2Ue2tgpaLA4Vu76CfhVF0jFivKS?=
 =?us-ascii?Q?RTK/xG/XP4frO4Ez4zfPTKErxSbnfZfNtBhC7/ROWBS5Fcnmo2ZiQ98cceg4?=
 =?us-ascii?Q?jXhMwYDI4zc5Dthh+vsAqUxT5kDIKvFWA3KvF0L4c5PsL0qtSJcNbbq2OYtX?=
 =?us-ascii?Q?+sz7SusQrWItdgJ/LGqkuji5OR55Cn5arR5UoN6neNHWl3jXVB9FxXyFvQHo?=
 =?us-ascii?Q?WTLf7udaPc40dI3BZ086DAfowX45nxKHkDoj4odRruYfKaBBLoegIfj7D5iO?=
 =?us-ascii?Q?R1jdvp3ONrfwDDklXzeRMSfBgDJEvrbwyqVsYTS6Bf7KIjtNWA9anRgVg7th?=
 =?us-ascii?Q?zBcBpYmZDN9HdQ+Fix7NIAI/Y0iH+edUEiYng+Yi6SguGCPRe1S48w1jKU3x?=
 =?us-ascii?Q?b9+Tmz7Hnj/Z5qAIS9GEHsjKHFDYYTKgmh4uyddmdwTYrG/dHOIrytC9fd1z?=
 =?us-ascii?Q?yQI6FrELibXHfezeS4XvqAGPtK0PkWYqrVLGVFlrQZrKMJHDCSQ+INVWJhQ7?=
 =?us-ascii?Q?JIynHCtgKSs+JRb54w5QMIhTIzVIpO9hHnIUF4rC9Lzf3qFfEP0+m8nW2FU8?=
 =?us-ascii?Q?E4RvpWtoJH2PsulGhK0FYGK5E2gyXEjqck7JWA5F91HxEkjJLYKND1vGKzgj?=
 =?us-ascii?Q?dxLA5v/jSgaHdcGXkYB56mIDZi3B73U4625bMecEMgRc/BqZi3TxeRCphLkw?=
 =?us-ascii?Q?qQO1MqW8oGJp3UK028Zs+WgzolJ2hCdPDhAx+irxFqh+j/Oyr8JyEYsdlSaB?=
 =?us-ascii?Q?nn+9UbXjz9tuyHh24RdaNcomaEG1rHMkmAjOWg7/l3TiVA6bHa28gky0hqTC?=
 =?us-ascii?Q?ihMvqbs472JAke8XrMiJ4IA9Igm1l1weczI6K6nYMWNMz9nKef0criwguB2o?=
 =?us-ascii?Q?xcq7O67MGcdbxvK6I2LgLEGPxwm/0M8JcKUNCG70B3Z7mqHKdJ+7u8qNTJxg?=
 =?us-ascii?Q?VbqCpetjYbCgRIiERih6/dsMi1GNUZ6J+i4qq8ZdNX5/GWpprujSWQtbC/Fb?=
 =?us-ascii?Q?n/wDzfCz64erYA9k7qLfjnoNQ541ibZqP9/UnbJKMupTVVMVweC0rVTeQ7UR?=
 =?us-ascii?Q?xmLlfpR1KGf8VMmUXNRRJhyt/YNDXluZfb62HsPus8ScJZuYiHPJ0n5SOdAf?=
 =?us-ascii?Q?l+U3iYXa7TSQ0b5ZXgorzr/KzPsVaIaymAQ4qVuCpe0VWGK8f9fEgX+PRmiz?=
 =?us-ascii?Q?CckaOMHi67TS56pZ5BOIhpUXx+MZ/0VSX3VjVyIe4h86Ijq1oa2CBjlGBEei?=
 =?us-ascii?Q?b4NfJMRikeB5Vd7qRzeyvUSPRcE5j4MPVxIZJOMxxXL4hrpzCr+Qlb4GymEw?=
 =?us-ascii?Q?lRUy6tfElq9yS6oaQHqPeVNP/rxPOqJCpLy7NZgfvsxT1YBfjX8DFCq3P+Vo?=
 =?us-ascii?Q?eppmdWlKRBmzVlvuB5fwJauNXlgd+jXQXwWBXRxTMzSStAmZT65yjGeBajGh?=
 =?us-ascii?Q?E6OADhwKxbfRk6CjSH2OcSBkI4ZWrGtuooxx33BDUCC/SSWIJtZJ4+Z6fXt4?=
 =?us-ascii?Q?BFiptsi7iQow9kA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hKj69zFnJr1mKrE+nj5lCl0z2XLLl7rGYSFkEeMKeU08eidOuGEc8gTGBaHH?=
 =?us-ascii?Q?0dN2VwMujW3GlO7xwbBNGBB/ThvBXSaeEQ/gbyTaSdl9UDd+9BDKTS/H15p/?=
 =?us-ascii?Q?f/+zhhUYZJG5p3XHrEclLJ4gz5gApwK6R5iUx7P3ob//DV27Wxky1pcbfghD?=
 =?us-ascii?Q?zSCRberonZopRTwqqB7AE7NZ+YN2S9cJ9itOpMcC+Z4LzdR4wDYpCghpXqgy?=
 =?us-ascii?Q?xA1b8BTGfrwObm4Jug6lexLigwXpj77+j1bkB+Nq90rtzQbCUXLOFoSGSzLM?=
 =?us-ascii?Q?Q09CGP2hbJkOEeAEzCZ0AgrELEgev0jDLZqirl9SG3K9muDhhPirIDq4hYuN?=
 =?us-ascii?Q?9FDx4HO0D+LCwFRYMzWU2+ig8yOd2LRlpFPuv/z/BvWwnyn8t28ZEK7vGce+?=
 =?us-ascii?Q?FBpcmSHPPGDmR3RuB4b/JIpMnnuLciE+Gd7t2yZisRxjqndAc7Bm+hTAMBRX?=
 =?us-ascii?Q?YKwU0SqFpru493ampm2um51Hytr3mXuv9HGVjsIAjU40cgyl6mI2K0pq91Y7?=
 =?us-ascii?Q?GP/rrWJeNK2m84GJ3f9H52LUvrj0DL+zY3Dt8NbMO7P3HSiMaLlkL9zEvRne?=
 =?us-ascii?Q?2d9qoGs9WHPIZB0ByBcoK3oqsdW0u3Y84RtIdGm+i4zXBqlYZbmbg6F9TYSo?=
 =?us-ascii?Q?6zQfIxmFKUj3ctBlemhGLPiLCvL+vXBOzIPcXo2yaeunUn4GjfXLeF5fJYgM?=
 =?us-ascii?Q?CcY+VBNWMqpGsnKsIxL5S3fv2rp2n41h57Ms/tO8VHVrI1e6MTXs64FNMU1T?=
 =?us-ascii?Q?/rYaBRvRkqEdJoofBpIAP1LLTNZwurUteUDpN702HZFbGqlGTw7F/GDfOjj9?=
 =?us-ascii?Q?meCxzGmX1nwmHc9Rmg2tpwO0qOwSEoGg6ERa06uHnSfs/+MLz3oGglPE22r+?=
 =?us-ascii?Q?/HFIi00fsmhvBSDRRCHxvtcDOwICfzpCVp0I3pLnbbPrHDE6PC8bzMkshh63?=
 =?us-ascii?Q?S35wBXa+qhVn1j5U/kXQUHT3McqR6Vt9aH7cp56TdJl9AHtkBHdjyB0eg+iR?=
 =?us-ascii?Q?IPYgD5dYpP4hxIHwS9mlQBBb/UmDh/IPYQoZK+XuP7BJvNeEKY8MJq3mXKG0?=
 =?us-ascii?Q?eq2WW7TDKqtFlBT41uh7rKQYua7MI4RWeDSrDfL69GZw9h3uE0OD6mgrdBfa?=
 =?us-ascii?Q?34qkY03cIgnfnFCfyvAaFp9al0C8Cpjs0fKvTimu8t74tLc9Fomto1v7pUP6?=
 =?us-ascii?Q?4uDP6+EA38DpUT/wqh0cPBCVqwUgMeBFQHh+nla7cy3lSNihARvICyFdAYtw?=
 =?us-ascii?Q?jh0cy78iDdWqT5gP1ynvfiRWCqouPddJLNU0nVXHw6hcT8K9A/lFoHu6EWZN?=
 =?us-ascii?Q?yHgLK6yAIbwpS1AEzzcmM13edLaGLC3V6/T0Z/IfHKdc5SOaGl0UWqVBMyPD?=
 =?us-ascii?Q?SJiXV9NPKjwGj21t5Xl6jc2SNWdjC6R82FW2ZwKaEfoOAKkYmsm4SwMG4dvf?=
 =?us-ascii?Q?wKGp+nFmQfaoR1mo6FeVp8eQMmDSeQBz3KieQv88mQ/P+hbX8/XmKpLH++j0?=
 =?us-ascii?Q?6JsTI3ueVNjZy6PI+YLs/iSnAPMb5dokxBUhEOMiRR7GiEUovF3WW3j9a71X?=
 =?us-ascii?Q?KivCN3xnqRtGPnS0o8ytrA2uWGbPMvd3iaOn6jmK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b91dce-b73f-4ba6-9db7-08ddf66338dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 03:26:57.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI/wfg+deVqB1BZVl0xp9nNYav499wZOz8lExwpHsXhlNu+hrNj0dlNfldoaVesR/R+8nZ6qvrqDJY+9W9qL1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_202706_741733_91CCA196 
X-CRM114-Status: UNSURE (   9.13  )
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
index ca5f2970f217..b4c40d0573dc 100644
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


