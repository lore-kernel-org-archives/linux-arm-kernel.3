Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4ACF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7ULkiovZ3xsrXZkQ4i7QUJmnicg9p+/+HyOiaAuPjU=; b=ZtdEl2jrrsPoHtLi4yYSQ7Zxpu
	fUkbvl0MfAq7NVylQWGlOBUzKIaOkibDlnZlVhjCEKBB7Nx0mfh/sdt/AevuEle+us5A+MyRqo55G
	8LBU392iCa2RJRDHtl8GbndQM9oNrO6xiohHl96/j1ZyPTq++OgdinYXCX/2dp8m+BUAzn231QyAj
	aSI8drvDSO4HccnYqYpF58qkxgy/IxkVIjPlN8PZCYuTcjj8nXnyZ54iqre4HeMwBsvp2fb9jBaRO
	GvBlw74G3pOOX2VANSb5i+jB2uv/Gt8NM6Q55llN7VS0Z1xMiAmAQ40AQYqkbBD2KKQuXZzgIsnd7
	dKNnGO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJZd-0000000E5f3-3dzC;
	Wed, 07 Jan 2026 02:47:01 +0000
Received: from mail-northeuropeazon11011027.outbound.protection.outlook.com ([52.101.65.27] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJZa-0000000E5dT-3oOn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 02:47:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEZfxOsrrm4CUEkqocbycu+3o/mE7fOih52jYyc9tNEXE1fHw+qz3AFiHhbczvopKDq+huinq12ZwOwrHhlv/n5fqI8oV3t07AUJmtZY1aS3T/h9k2Vl3edXLENQJg4pLelRqN0/zLLfjipGI5ZJ0r4y9VPH5bKKtw0Y0aYhi9SPqd2+IDapsmirgF7jFhqhYgZAbe0bHq1LRRaIEHLxhvLj3eFjIJva6jzJ9f2EhAyOSSRkHICQjGIl5seIEDEDB9DAB5gbNtKPwAKAFOR2YgqeKDgXw3ux7lSi9xw969m0Fa7dXpem4BiacF2cOzXDpi4BUKZQJjuqFL9KhfqSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7ULkiovZ3xsrXZkQ4i7QUJmnicg9p+/+HyOiaAuPjU=;
 b=CRFi/4koPuNRZ50nfMMu15Yc6zUp8gocI1YRgfRuNU5URt/+DdBKBCvho8kv0o44NJw1sv0qKZnpevbTIVRHInJv62EFCjnI5Bw3dKQAQrcjHfuA+bSSNE2THNi+hrib8MtG46c8dq2i5n2y0fPDlykBLGnOYVSJMeMA03lwSbvBxFchYpvcZ72kFiH75hOzLoDkNqa16jO+8S1nxPc1a6/ZaHKm9WS5Y2XacN4Y7dC7HRfUgeayjHiL9LcRv8zgOKIZnwmHWPKi1ap60o/lB8MHvzNAkYEDQeI/78ztvKhx41Udv3rO+Yqt3iY1rBjLYrGT0gAnHYo253bJ0c0M7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7ULkiovZ3xsrXZkQ4i7QUJmnicg9p+/+HyOiaAuPjU=;
 b=E0Tx9NShKC7BCVu6wyfjXpODcA3mZsE+7oRbzABG5CXRd3Pw8eXaRsrgMVPT3+oUETm25TPsU/7fBBmsq/5F1Q298TQstWSqpqaRCHjcao0aJ3qZwuks3u9xHH4f5nsSHlU+HSGBT3WxVq5EcGA51MAG/7V38KU2VLGkc+1qK5TR/iOTxVaYmV5J/gQlYNfzxZ52iBejOXIWMrNyllw4GnH87p4C5qzAU5TRlQb0G2d9ec1B9st+c3KeNHv3L1SW8pv2ZEC4N9N70ftcSvU1pCaSYtxbZwpaPYX5D3DHZSAc1XTirtlNCC7YCv6b+QbXUCoMidtBq3w+uQyn9ejemA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GV1PR04MB10332.eurprd04.prod.outlook.com (2603:10a6:150:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:46:54 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 02:46:54 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
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
	Richard Zhu <hongxing.zhu@nxp.com>,
	stable@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v8 2/2] PCI: dwc: Don't return error when wait for link up in dw_pcie_resume_noirq()
Date: Wed,  7 Jan 2026 10:45:53 +0800
Message-Id: <20260107024553.3307205-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260107024553.3307205-1-hongxing.zhu@nxp.com>
References: <20260107024553.3307205-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GV1PR04MB10332:EE_
X-MS-Office365-Filtering-Correlation-Id: e38b10f7-dff1-493d-0b36-08de4d970471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dXGRZ2OqRKpt9bdEG8/jxdSBw/7rAco+pv3zVq/hA95pxWcR3G0na/Cn2XS+?=
 =?us-ascii?Q?DKCGuNF5W2rmNdIWvZyVMcZ7IhDFieTjeOJ7bhtILEFQtb6V4Vv6QIP9A4Hf?=
 =?us-ascii?Q?DF/TL25tk1fGKf8+B84ppIEzMiH4MWZOHJLQQ1YoSZom8NJgdLmYZtmlBBY5?=
 =?us-ascii?Q?BuXuJ3HnmzM927wY9WcwSzqinxEAkfEthZq3D09iKx4LE9cpZWZyU8NXJDgw?=
 =?us-ascii?Q?i0fVWjXVx5QrRUcsSyv1CCyqA45XzHbieBvLYQobRwOSy26OGf72HuzhM8Uz?=
 =?us-ascii?Q?gRFgucU268tZSBIgbFu3JiRSHcCarzLPv7ORkUNJugkBNiNjrEkWFk4xmG1w?=
 =?us-ascii?Q?B218+Mw8Ljf35Mghtk/9WKQSgCMPRYG9hWoZQkk6c30ZaQ77C10hX0+KGubm?=
 =?us-ascii?Q?6kCywUPL1VgUxRnD+QhHQw5JGynHcBbryg2ylW2jmy6gHY9jkvMmd5hVj76K?=
 =?us-ascii?Q?UyVLY9RAVtJlmc1KpSJ+IfCD9mPCVV1rNdRBEK7ApY0IwhUwmNKrk1vWDpHF?=
 =?us-ascii?Q?WrLaqaADnpCVnl0zN8ramAmaCUqCuAC+j/7B3bVQOyrbb6NGB6WlL4ommEQU?=
 =?us-ascii?Q?XmsTbQgSTHsST0kOp2WldZbaWh0VSQdw2IyT7PPwXuYRyhPLvvNsZq3zHJ4p?=
 =?us-ascii?Q?fmP5BXB9HkEySSJh215n8KVIFE25PHSHoG66kk/+y3j2H02q/NlN2LaJgyBY?=
 =?us-ascii?Q?wqJMqhFSBh7P+vDitNTto5+7GonnwcRJWXBb33xvOI9aLRwcSkOFo+axD/7y?=
 =?us-ascii?Q?bASlsKR4guObmumsOoFGieZ/+uIc9dSmrBFS7eDxVWQuJ345gxXs17Aqk0kX?=
 =?us-ascii?Q?E2Y1DgFxitIPwJjls+lsL+YaYHmQjAnbv0uzTRks6L1scqAdVqLZnLB5EsUw?=
 =?us-ascii?Q?Ay9KEFpTNGvwqYDx72OycoDqAsCsoM/p1FrL3d0wyvUCLNejhJp2ErBD/+mS?=
 =?us-ascii?Q?RWchYYxmNirqhrJKIYt1DwmtN4yYfep6tCfkwOofBzfDCG5zT3Ks6XO7iUoK?=
 =?us-ascii?Q?GHbitGAcTmA0PU+UVpfzY8HE9b9PYZgQ8COCuAiPLFBKYXdtHO9LlT9siNOq?=
 =?us-ascii?Q?hPDs0A1TP9ad66wysrn0+pegzhMD/cZijYE2N/1knypIpKbRSGyV5K06nMd6?=
 =?us-ascii?Q?y5lzC873L5YB+4wwiDD7KHQKz52Szitm8rDG2fd3JuDnBlywwjG0jU2uXOj6?=
 =?us-ascii?Q?DLR/wvbfPvJAInDaCnmdOalM5j/tGMuPSpM8kTlJU7hvgOe7bIxhlataUF3r?=
 =?us-ascii?Q?CvvihSVX00O8ntjL4s4c9L1682Ua8x+SGMI2apsmVNJR1E5iPlP3qL80ffB6?=
 =?us-ascii?Q?iCY5VzUBP8QDYsahFyvkDtxeTGWMPkLmLspxyw9vuz7Bc+RikjlmVP+5dNNg?=
 =?us-ascii?Q?n0tZyWc6T/banA9/+hX1phVH7xU2GwGyd3/Mrq4x3nj5rxMsj6sfXpF6585Q?=
 =?us-ascii?Q?Ap+rqqTLH+icdS82/3u6hb3pnV6/FQSl4SBSRmt3bEx4CX1nYthJHbLPuoh+?=
 =?us-ascii?Q?uM4esMsvz6un4WXtwCt3J4NN3H/dMYy9X12nYRrieGa2sHUdrDTter5rOQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?331CK+SRlvwXTUpIxdJxWHnCo0iwgnNe5c70AYYMlIj9LC3lLJdKKCml/8BU?=
 =?us-ascii?Q?p1YYtdZIAXTWPLMm1cx98uZKX0ptcSt0R0edmdU3GsiFimIKNVIFNLc7tTTd?=
 =?us-ascii?Q?yVfemZFSvjQZCNIhAHB4l4bsg3YBFR5j+I7ETeVs2hvJ+DBxgXFs8PetFxBF?=
 =?us-ascii?Q?Pm3ukBrr8PaPcc4wuHqLayNmYAn+WdWwWVIkkkNpUNaxj9eoZksm97f1qpVN?=
 =?us-ascii?Q?7n4tAoMaPpr3OvbcEKlLO8c4G6zBEVr5PXHzOhsZPBIO71gia9Y/3vpxMuXX?=
 =?us-ascii?Q?yF1FaNKEiGE29Q6es24y47nPwpfSGAY2DVcU6ibq3ZW5NwqnBbTDAtYnZXw0?=
 =?us-ascii?Q?P4AWFQ1qUbw72eZjxVgPLvxu5Ps2oQY/weJhZ2zKbSwl5nw3UwVke/QRTjRn?=
 =?us-ascii?Q?nO2BzX68aZsVwdQcOD++xX3QUNxO3WvesSH71pa+TolfSdz/ifCbaIzd/KHv?=
 =?us-ascii?Q?tNPWbaCGdDF/YuoyvSgIfWJbuc6mr+vpPpNmFirObBfjmggBQZ9ql+bHZIKC?=
 =?us-ascii?Q?jQJ3GNPwiROsBpugAB2ZkvywDlEVJiGqMDas6rBukVxydiM9xNjJCrGS0IEs?=
 =?us-ascii?Q?DRJa6PrnJpxYIEK1jqCHXPl4v1JgGZ/eqVTffZrB0U1qDeD8dojSUQMxTVsm?=
 =?us-ascii?Q?ekFpD7GwcrGbAIBlHgWRSdEHfEHZPAIhV8xguUFbuGxnWkgIMfazjXOFhHx7?=
 =?us-ascii?Q?zpNNL8U2fWaJw7zItFu/y5lNHE0dFPG9AnuK/tLuBMoQRMko1qxl5zNWFHPO?=
 =?us-ascii?Q?Q8ygLTkRrGQNNwhBuPmTiFcewApSvN6NtRkKOIOYfY7zYmsC+nfiohZBPNzK?=
 =?us-ascii?Q?kdwwc3s5raI/rVZRIKdXg+l5CTQctOEGdt6w53T5XXkloHA11T1HVHw5ed8b?=
 =?us-ascii?Q?caT7kqk5G9WJ5RP75vsOjGADvf97XQSYsVrCW3+DlAYKrdZUuMsdwspv0zAj?=
 =?us-ascii?Q?hM88PwIdBHOTERyPXbFwh57QJpTQ0pIA6BQ20to+kbxI2u1cnPFC7rKzmSQH?=
 =?us-ascii?Q?7eNsmGqDG6OgaKLXILUfcu6jt6VBKv2A/eIWsx+uzWDhIo8jXPXIFRX68skx?=
 =?us-ascii?Q?Ylk0jEeVW3RWoXipslIpSNXPkCw4gDZ+LsvguexDJSb5YQnmmCp4uV7nPRYd?=
 =?us-ascii?Q?q+Js5DXT6JgKTo4rynXLQKPX36er0/qu63kUvJpHclryV+fkccTi2KRPhpvt?=
 =?us-ascii?Q?2VObBcrv3azJ8zMHFT60tYwwrw+XieFKEGrQU8LAeNIIK+aEZntERFP8RY+G?=
 =?us-ascii?Q?mML5yBBKbXEr5C1YoFFByDqTV0gWEO2DsPDwyeQgqM/MvmbOttYQNpzSOVVw?=
 =?us-ascii?Q?KHbCwADJSGcL2HvNSatOUnN8m49xYLMnsP59NgKalBAekh/kbSjt+vMsJhuP?=
 =?us-ascii?Q?hTniSJgdMJl4sB436AFL2HS2mMccwOvLVfkRNlT7FIU+aGCSe2HynyiEEcnE?=
 =?us-ascii?Q?XjQ/EP8Trkf8/oR6ZzGeEhmD1IYZsa2nF9jntuyEMh/zQPMeMrSB6JyWtTGv?=
 =?us-ascii?Q?t1XjU5YnSoE3uqyEd9vf8JYRGJEJUFzzsCmktf+eDgIjQPpYVcIkYcgZq84U?=
 =?us-ascii?Q?vNBe4zYw9CS+G1sXKw2MfxhTHVbE40lfrmERsLl22nFWy5/LFpYyAZTD4f+T?=
 =?us-ascii?Q?KCuK/TeQ51/gsivSOYy4R1nn7pYBgAIDmJscNS4xQueNz/wSqw5+20gbhow1?=
 =?us-ascii?Q?ub+jk5nh+r80kVBnRX2HHVeDEGT4pnyxKIZIoUKsWBbq1OuS9plKfUOeYRLv?=
 =?us-ascii?Q?+Dp2gOkGcQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38b10f7-dff1-493d-0b36-08de4d970471
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:46:54.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akeT6vqC8fpyXvDBEWFdJgk0/2DELclCWnxHyESUbotPmuxCTPu2amng+W+gyHRVluiAW6RuBsa51dHPGLuNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_184658_952840_0282DFFC 
X-CRM114-Status: GOOD (  12.66  )
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

When waiting for the PCIe link to come up, both link up and link down
are valid results depending on the device state.

Since the link may come up later and to get rid of the following
mis-reported PM errors. Do not return an -ETIMEDOUT error, as the
outcome has already been reported in dw_pcie_wait_for_link().

PM error logs introduced by the -ETIMEDOUT error return.
imx6q-pcie 33800000.pcie: Phy link never came up
imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110

Cc: stable@vger.kernel.org
Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06cbfd9e1f1e..025e11ebd571 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1245,10 +1245,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_wait_for_link(pci);
-	if (ret)
-		return ret;
+	/* Ignore errors, the link may come up later */
+	dw_pcie_wait_for_link(pci);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
-- 
2.37.1


