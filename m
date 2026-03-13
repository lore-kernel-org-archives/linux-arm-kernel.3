Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0B106FD8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=90fNp47ognxeUGeFye4NvjKTcsTUL1RSo4zhTe/DsRg=; b=Jl2/ekY9xmJaAP3iDXKKGV7Egs
	kgw6ZkAdIAx39Lwjfn5dkRXuIGQ4nDylWij7HNoAHDHsp2wRdFDe8YwLQHQtnZFHc4jmCI48CdJgw
	Pi47MtMYotBpfYMvsFDduHESkpmZFbGAproiYj8mhMBunlo36onwfW9/Pvl4oTyfqDnUltq8bkVyh
	QDhFW8axWznAYq//mTZoDYElD9wtQ1EVA8e14lwo65W5nND7WghaUL/mWkY5ZXM9yTzpTg9CSYHBu
	rCgUgvKTrgp3xwOeLn3urHGsgf8eUCYKgd9Dzd4/iPWKAOjYaORE5zFZJOCYqTbs991VzkK+WoVH9
	wIRlwWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wJx-0000000GuNh-0aLn;
	Fri, 13 Mar 2026 06:48:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wJv-0000000GuN7-2Xc2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 06:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=90fNp47ognxeUGeFye4NvjKTcsTUL1RSo4zhTe/DsRg=; b=VSF72yZZ7IQdJug/DX5BYKPNw+
	6fekCLwJ4pXCRpiCvpoLevq+LC1/A5yfE5AHBKARhgkKQ/rEfnW7uHVHTMuqmexaXI/RiBFllxKWf
	6V2W/oaD4cMWA+WQ179u4X9yYyyagOsuc9gGA3+LFSYJUaoLlyKNWguVdVydSuk0f8E4mXRmfKleP
	8oPuW/Zeuk6RNwX3gj4058QDFCGWVLNqzv0t2ImwFunEIQRgdZHkAnTiulRrmv83GBtaI3mFiz27z
	5Id5PPuNPUl7hqIidi1gsVVGXUbebeddvt/KkW1BLQ6Qt5PXU2m1+KaM9iTpwkVA2qB++LgHQ0jit
	6e8DJ0fA==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wJi-00000002hHX-3iT8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW6ipnZ3rPOVrS0A82h1ECYkXawcjzzKnIXxUjrCa0E8D2vFeFvJL3h1pHj82KvPWT2NEkII7nc6eqWYHfYZvPxPZg2IRwdRDHGJidGaZ3zpdSO7JENlHd5Tqrj2EuAy8TktTZL72weR6S5knUwTsHCjUS9vqqb2Dnxt/rNTob1zprBg0MzWaaY8yzIjCgxvXswLY9n6MgvDyv01WU2lWvqj52W2HcYHUI/p4b4d8qmMfnlDtfceWtB6ZdW6d1V5fK54936E8qsSXLDObhpDfGyqjkPKpJE6tfTxjjCsOIUrHCiP8byDb6m/v25yefcTUa+urPZfPw4OhkVkf+Mbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90fNp47ognxeUGeFye4NvjKTcsTUL1RSo4zhTe/DsRg=;
 b=o/Ae+TgcvAIca3lDeAPttFc+1CKMSuhQIHyEqWHn/Uho99lmedTAJJB9TAwMjkNsyVYTnwmu6MbmvyNyGu8HPqjrfnBTI4XSbu6e4amYZbYz+Jza674IS8SyZpKaqw6lvXZloPJBwg4gIc0KGW8az4D6uFx+pSyGPjWVOMQB8ZoEVUIu1kk05ahB0rN8MhujtJiwCcoSNX9Wyj//D2HTYvybJY2p8ELetYZkQspIxTw0qLb/DYE9yr/L53paGqGHLRkeKRmti3d1Q0Nch2ywifH045LguppwN4iiqXrFDDRYSQ7XoTrMUh6LC07ZagP6Te/WAlaj9KEITHr2KXl4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90fNp47ognxeUGeFye4NvjKTcsTUL1RSo4zhTe/DsRg=;
 b=BfKWCG9ZgqaiEpKcwNuMZ9SG/2ITxVguJ0wdFf4EoLDYh8muAWhVyP2AL0jE4XVZ+dvFWE9HP49RfxjdaKKil0Hx1BMaYR60ECMqOxc+WbUo3+60YpwxlAKNnx+76AF8f+C3G/RHmUvy4xCrnXvJSwdAXzVPKZnNDA+FPY0DYuqJT0auUoQ7MgdEL7MEK6tiRCG472mCVhVG8zUvCZQyMfvmma2foBs0S7t5uino+7FdWXIjdiwtdSQRHszXqcZDKBfPtyMgwCx02x6UYNVIBkR89dlpz6Sb2VD78r4xWIWTxgATslLVcbGZ+JVmKs9DXOzFVtfcNCglAmKeF7/VCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by GV4PR04MB11377.eurprd04.prod.outlook.com (2603:10a6:150:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 06:47:56 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 06:47:57 +0000
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
Subject: [PATCH v1] PCI: imx6: Don't remove MSI capability For i.MX7D/i.MX8M
Date: Fri, 13 Mar 2026 14:49:27 +0800
Message-Id: <20260313064927.2092800-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To DU2PR04MB8840.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:EE_|GV4PR04MB11377:EE_
X-MS-Office365-Filtering-Correlation-Id: 68429082-df3e-4436-6871-08de80cc75ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|366016|19092799006|1800799024|376014|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: eSbaVKPwoXlMgufqPCzsncmrpxVrxYKfuWlYRlwwsWxvcR7MTTbmywiXPWXAnFumYgffrJs6PEPRZclPZET+TQqVUsc5okhvRYdcUdZK1vnKljAMSlTn3zJN6Pl6/rJqgjw/lJSysPMEfo7zkPc+ozGKHgPXMB51+JayUGLKNMNE8brCL+rnKf1+ObMlO9qU446lkVmNSBRG4C+z0d/gqlZNAIJGwZMIGPaDiWmJMjGx2oyLLZYQ/twvx1adSrySRjnbqv0yKNmjd5huX0KbgAsvzoQrsO+gaIp7dEk+6aRLdyf5/LAYYZTwny7adk7Xt9rugUl/DgKHj5dQOYjZrOs59pXc2d8nV1fytidNfBRDkZrlcX7ag44sm8GT9sW9CRgOwqgz+x2c61EaCppC0GGljulQu2sCdfgo/xwJUt/8jg1qV72AtMgrJxAOZRnS+7y67qfIsBPOWCRBEEnAPZRsvxtuQUStV9YJkvZGoaBp0Q1t2g0fOnf0bFw0b0GiSmaVnoRvjeL/A3di8AePK1MF3RP9WtIAzrtGtqU31eRoFJRPbt5+g0orXZEZKCQBXcKRK62TuxSNSG9X0rraebtgmNkwM45DYEiIk/NNrUTCeGrwaxmTq/L6GVqU7kx32luoiww0uO9R1wldBV9frDAdFhK5+bSY/t1Zy7OSDbYxv5GXm3FyWR2QMUihiouPMdE3tpkXxGpfbW+ojbX4vvu5VJy70kbQzC+AV8/MgHCU7tGv5+sFXuSSdNyQFunQ19DLfKmNxoqsYtPdt/Bb/TixZxuOEiTxwdP50PGOjNOUWekcrJ8OyqQVymw+wT3Y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(19092799006)(1800799024)(376014)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2t67TA+LKqziKhrKLeZjclGy1v3U3c9IfDewTgDjOuPjwR5KjX2JTXYfBvoy?=
 =?us-ascii?Q?x/Q3CFkgTXRNfyf72nbKDofntln5s5PWwrW+KX1wBusx0pRdWAoijAw9x3Xn?=
 =?us-ascii?Q?KHASe7xffLmb1ieGveMY4sp4iF7OXM8NNAcJc+GUhcPjS/7BPSItrKZUSLNM?=
 =?us-ascii?Q?zF5NzAoAfcCwPSptn+2L9eVvzww6ffZcAt0KFL2scR9/HxhYfqOg6RY+vpu7?=
 =?us-ascii?Q?NPLDuGfrTjnX1o4qgfQAzEXzummn+1R053Dy4DGHrqpG9Bum1vDxuiNpMv3Z?=
 =?us-ascii?Q?t8Ez02VRiughGKkISkKRt3HVfU+MwAcV3U85OEd+cVq/+7SQfMNGy4s6P39J?=
 =?us-ascii?Q?zoajUoz+3ZLDOUbd5QvUhXrOTBAZmCv2TbbKZ08NGKqzfHgvUxaqoitYTKC9?=
 =?us-ascii?Q?7JMUEQErTqrTI763SB5bWS090+FlyheQvbG/yRBoj/n7RIk/YnfokKJnqSw/?=
 =?us-ascii?Q?g0OQumJ3sUvp4pdXNBsrEFeVtMlTIcym2HNEzvWZhr0xOwbzcD3zxhQw/nmf?=
 =?us-ascii?Q?VC9SY8PXaBwT3N57dQkeG9vmtgYc++m2gRLIRec6uPLnjydRXfvh0Kj2wP9i?=
 =?us-ascii?Q?yHmZ2s7Nrw7oe7j7aAcKDA0RbNFcxZDv5yTaczKGZf3WFZzHQv41+Ij51rJj?=
 =?us-ascii?Q?J0frQablLmFbQm9+cbb/1bQAI4JvtnfkNbzIyOW0EVJKfDqYPJe8H55a5BOi?=
 =?us-ascii?Q?FDZwC67MdMcS4pXmZaO6K/dxBEJYv91UvH76vt3nTGOdJVQj0SEYdIS9VIuU?=
 =?us-ascii?Q?G4ojPEhrci6hWbYYaLxEI+oKh8b91x2jJfd6KcpVkwCJVcelksDx4RP5YjxX?=
 =?us-ascii?Q?msG2J4XHPSLJmZqNd0WidGLeWztx8/PYje6Q5sfInnWkSJE1ud4qw4lGNOgl?=
 =?us-ascii?Q?HeO4mrCejDk9gHrdVxWy4CKLVcDPRIerpTyr10uM2Vz6nSKhHFKSymsJtH6I?=
 =?us-ascii?Q?mbkkZ5k1SPxQctrGCTK8CcECbXE2TkzVqqvBBZChSg6fEVBfYaMEXryNscE8?=
 =?us-ascii?Q?yMs3uTos+eXulvRbNNwOlf+x6H9vOdNRg2ennNkOnwDSk6bh709rZtapQX+D?=
 =?us-ascii?Q?WH+1rAZ+7JkJzGaEkFktnFkRee3Y8d088u/eQ0iLxkRRN8Nr2tL/tKOw9Y6P?=
 =?us-ascii?Q?/y92UmuUFtpV5g+VO5Xx4rUvMJjEJtX6rHLku6qS8HvSrVdT5TvEk+AmKTcq?=
 =?us-ascii?Q?Jf8S/7mHrmPPcf3vFwu3ndTdR4+OgEk6JnhPG5ZkZGZWpWEvuAyvDwcfdmNO?=
 =?us-ascii?Q?8e3mrGATJWs/m//dXySdPTDAiuULhEevBuckwVq1nSXW+u2bo9sWTQ8wertH?=
 =?us-ascii?Q?gv+n2vkRVvdcyb+5RUFpTD5HYswU+7+QB4XcmwBW++Bgcqb7juY0W67CxKfD?=
 =?us-ascii?Q?tOA3I8BGcljdpW71Rk0V5hv8k1+ZaCqmueJ77bfgUDgw/sV0AFgZfb6IPjgL?=
 =?us-ascii?Q?XTot7FCyVf216lfS1LtANyl5jrGCaUUqXetGRGZoz0ZjsLrCaY/At2RNOBPR?=
 =?us-ascii?Q?TJTH0pcXuRmNX6mcc3vCPxI6EJiWlQEi4QnnMED85bJtfumRjumCNqvjgUYy?=
 =?us-ascii?Q?bcP8PWod1zY4nmbn7cXKsQDbv24at4pxUleTpxchz3ubn3VWM9o50W2B+Pi/?=
 =?us-ascii?Q?GrFccE0JfzCmMB0OW8uMM0euhteAgRi8bRRjZY51yLYVqZup2TEGTb8ChvkJ?=
 =?us-ascii?Q?I9xjPMqCJX73v/isIZoIQG9I1EMYGmF03NVytgsRIpR2LAYgRRZ2+ELVTbOB?=
 =?us-ascii?Q?hH7H0jVRuQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68429082-df3e-4436-6871-08de80cc75ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:47:57.6803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MI6p7LQtmHBhZjC7swQ3X6zSIBByIFgc348PMihoXq0WzpWLmhikmWApM7w2um4FjVP4jxkt0L5NPqNSRao8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064820_424405_E85FC8DA 
X-CRM114-Status: GOOD (  14.85  )
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

The MSI trigger mechanism for endpoint devices connected to i.MX7D,
i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
capability register settings in the root complex. Removing the MSI
capability breaks MSI functionality for these endpoints.

Preserve the MSI capability for i.MX7D/i.MX8M PCIe root complex to
maintain MSI functionality.

Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 81a7093494c8..b86d22db4a13 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -41,6 +41,7 @@
 #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
 #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
 #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
+#define IMX8MM_PCIE_MSI_CAP_OFFSET		0x50
 
 #define IMX95_PCIE_PHY_GEN_CTRL			0x0
 #define IMX95_PCIE_REF_USE_PAD			BIT(17)
@@ -117,6 +118,7 @@ enum imx_pcie_variants {
 #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
 #define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
 #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
+#define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
 
 #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
 
@@ -976,10 +978,17 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 {
 	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
 	struct device *dev = pci->dev;
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset;
 	u32 tmp;
 	int ret;
 
+	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_KEEP_MSI_CAP) {
+		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_PM);
+		dw_pcie_dbi_ro_wr_en(pci);
+		dw_pcie_writeb_dbi(pci, offset + 1, IMX8MM_PCIE_MSI_CAP_OFFSET);
+		dw_pcie_dbi_ro_wr_dis(pci);
+	}
+
 	if (!(imx_pcie->drvdata->flags &
 	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
 		imx_pcie_ltssm_enable(dev);
@@ -991,6 +1000,7 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 	 * started in Gen2 mode, there is a possibility the devices on the
 	 * bus will not be detected at all.  This happens with PCIe switches.
 	 */
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	dw_pcie_dbi_ro_wr_en(pci);
 	tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	tmp &= ~PCI_EXP_LNKCAP_SLS;
@@ -1907,6 +1917,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX7D] = {
 		.variant = IMX7D,
 		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
+			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
 			 IMX_PCIE_FLAG_HAS_APP_RESET |
 			 IMX_PCIE_FLAG_SKIP_L23_READY |
 			 IMX_PCIE_FLAG_HAS_PHY_RESET,
@@ -1919,6 +1930,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
 		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
+			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
 			 IMX_PCIE_FLAG_HAS_PHY_RESET |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx8mq-iomuxc-gpr",
@@ -1933,6 +1945,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX8MM] = {
 		.variant = IMX8MM,
 		.flags = IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
+			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
 			 IMX_PCIE_FLAG_HAS_PHYDRV |
 			 IMX_PCIE_FLAG_HAS_APP_RESET,
 		.gpr = "fsl,imx8mm-iomuxc-gpr",
-- 
2.37.1


