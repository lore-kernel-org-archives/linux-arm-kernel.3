Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBAC3600D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wqROT16cmOcLwkLe4j47wYUaikGjifvx/AJdlKi3JY=; b=O2rmsm+pdWpRhoLYB/WcspNLP/
	7DBsQygOMe0ngozt/yWFq8WTcNb3daTLUpTYIfF7NgDbKmuUuWYYPT0OUgqYp0KfpMBXreNayM/6m
	rbcgKWhSRJ7bjvEBVRa989iTm1qSAikLN6GrylOzrfDkXkSr5XAdJqUJk5PaxMCR90dAk63iB6FAX
	CRNdjEejUPtw0D/OxBOd6YQFGFr3iJafYwK1LkKhZcG/WGoH1J4u3t+4p7yh2CMaDRwIk1ef6MqGj
	Uc9uhZDlX06RnddOS1fVT4K6ThIUe9GMYSAkt1+R/GkbfJdPIrSjESVgYcsD6FjknE6JMCIpce4ZZ
	6G3LXhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLnW-00000007sQj-1sJK;
	Wed, 26 Mar 2025 08:07:38 +0000
Received: from mail-am0eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2606::601] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLgl-00000007r5w-3A5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKPdAEnQw+7mM3aH5JHVimHfOosHjPAaE2aZFCd4FCiq8PbHMVgYGLeEIFq/17ZcVBbuua9AJGNkgqAfPkw75aC8sA2kdbA9I5ul1MkZZOXCykTQlVYU3gM7ogGO2N3PXyzkXjS6/kmGCx6IacPfwyajinog1iYWOWYCa8ORF98b/82OHZAwNRAK4YM7/XXTG5RilLf1h5lnb0ZkZDStjqpbsnUJoVhHvkAV+wS3wkNWn2cFhKNqC0YdogAPoQaJ97AhmBOlTDDCSHEsL5oyKof2Uou9S0PylMrMJlpgkh6CiPbUnmpSsSknT7/TBQ1XxyAEOaRZk5xzXxNDNYU64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wqROT16cmOcLwkLe4j47wYUaikGjifvx/AJdlKi3JY=;
 b=o3r6Ox6jiuAw8dm90qH5k2EHSv+oUJxF7sPSzBhNIi6hO84LC0cRoLWCkfc6DMQABqadgRdvGKEmY70EfVizcgdTEC3UeDXFgGyv3i0hAhElWgwf+gGc/if/70VOxJN6SB5n8PuVYTZPCjqKthuHnekDX2icqosjAra847wHh/+Nzw2Z2AHy6bgxFU4ZEhyf+xcwJSLSwZ+qEY279UlBYKIRsAnBbZQuvANfIb+6PAbyrNbRfXiFi3NEBSB760vGlbgtQ5JfGyEDQ69OR0WCQ9gcyZpha7KYT/N7E/majDojQMlojqM0IJ5s063FPmvBkB73d/wdI4PQ8zHqSmg8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wqROT16cmOcLwkLe4j47wYUaikGjifvx/AJdlKi3JY=;
 b=lda86WL/8WQVxVje7a9mBTrXBS5Qf9U8G2YobdeqEJhJVef2UxZKixx7/hCM35GM0iVLdl4/YA06uXJhQrHArrC8KJz8tJ/LQNRSV6PzauPeXn62PTG1apI+tXuWfwiAWx4wPBXTLMb5jkOi99zRtqeuRknhoN/oOtagw7VlTC5UEVCcmFqTN/G5pweYNAFQvp9Omhpb4TaXamlVYBdlqPbfDcBiWHvIs0mZiiUhtpzsz4xOWtzcJuUsEJY9g0kiGR6sHMTz/mF75y4iUWhArKmPuEgOwlhH0qomMGv+I0W0FSfotImZlfTTKkaDHWoxEyfKaFLf6oHXM0Avgj1Vqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 08:00:36 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 08:00:36 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
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
Subject: [PATCH v2 1/6] PCI: imx6: Start link directly when workaround is not required
Date: Wed, 26 Mar 2025 15:59:10 +0800
Message-Id: <20250326075915.4073725-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250326075915.4073725-1-hongxing.zhu@nxp.com>
References: <20250326075915.4073725-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: b34225ae-03b9-43f1-ee9a-08dd6c3c4a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TnbkZ4FBMZNPrvkkQgoe0S5zudCTKmCbgM51jvTn0Ur2H309DwmaY5IZ6LJ7?=
 =?us-ascii?Q?SK3HFu7GJ4llIEH2jxO+DVwmcPrZgNZbhYSzFEtRseeLhrcLeiLSDVVjDYKT?=
 =?us-ascii?Q?Q0Tyf9gfenuvWrZZ4GZtjLMbIM4XOUq3mhnkJxFAJMjTGpjljiHyEbDeisvk?=
 =?us-ascii?Q?OPQUiRc7+ct2wNtuMgsHXIlBb72zv+jEHqAusTLnyGCpue+MBC6+XaKiL4DR?=
 =?us-ascii?Q?pZ4qlN4yL+Yps1IyLHc0mWac2xoRfapMGsVP993y4weAmIeNQv85HFyP14SM?=
 =?us-ascii?Q?5acvumTmpjLIP2Zf7mW7HlUUVqYbZ/iulexw9WidZNtq0sjhRRxgXuBvd/aT?=
 =?us-ascii?Q?iO8+1FlvBNJ7L6/744XaKz1/Njzxpq14pWuYI0ZyyaWwSSuLUqHqTvO46im8?=
 =?us-ascii?Q?T3wrI03xb735iTO8BhysqtQEfhBNuexjHAnrtBmESwIrH1ZXxKlZrcV0xhU6?=
 =?us-ascii?Q?vEXHDjvtO279THHJSHdY/Rgj9BxfAp0JFAVQsp2skOyUAyJRm1C+qlBs406r?=
 =?us-ascii?Q?jbPy0mD6E6PsAZ88i21zXWJl4Z0xWEl5dlw+ENMI7mem6jPw9Je+lw/75U8b?=
 =?us-ascii?Q?mUjGe5JUB8aScgeXo6XvX/rwqGQb1EBtAR1+qZv5uKalByqB8rxPJW4eLwIM?=
 =?us-ascii?Q?SBReKqkEUR5wAjo03IOUe+uZB4Jp6x+8XnN4lQvQwWGvaIXxgn6bUm8FgfEc?=
 =?us-ascii?Q?2fIn78+aOn02a4zE0PYx5s0l5uIMT1j385Qo3St8aqvaZtBfSplyCMkGlpRt?=
 =?us-ascii?Q?FVLA+266SkMAc4n+Z9pSE58z/7HCGo4pzblIXY5hv8uBf48CCnOeFUGUXmRx?=
 =?us-ascii?Q?t7tSHNFxuhARE6ORe3tQKcjYd6flpeSWJ8nzz91egX3mloVS8ujriHrmGGd2?=
 =?us-ascii?Q?LPeXneFA2RONMrRHf0MUudoAUUE/UfjHmxw5Lj8xrH+wjBGgPkp3JYub81Er?=
 =?us-ascii?Q?areR/5LMARaegrRNQbiUsSVtmcI7mggmlrR3xMBW9QhattTbGVuKl6iWplOT?=
 =?us-ascii?Q?KPwZrihyHptIyifcSRKRaYDwPGiBmstQ7gTLQOP1QGpbLjhMLGQnYITHBhXQ?=
 =?us-ascii?Q?RO054zhjq+kdL4PrD8rjvq7677fFVeCS3+otEzAdj/BmiX8bYwzI0T3zy53S?=
 =?us-ascii?Q?sMdP3IPGm9H0j4DxVjZlbTIpDF6GjXN9fgfA8FvOhJZq2lNmQuvTbiOffIXw?=
 =?us-ascii?Q?SiCm48WkUtbzwIqr5gS25Wn+r6fvgTBx3JU05k2iNM+i9V7C0COIhCYBwAeJ?=
 =?us-ascii?Q?fKO6r/OEORVDhM3u+DABaTZ7D0hHmB9aQ9wvJrzW2aNYiLgMDa/sWOqwi3pZ?=
 =?us-ascii?Q?C759EWylpxRS6BwRdHugynmu14Prb1G1lTK/MdJITmEkzyYVmsDWQVsB44qn?=
 =?us-ascii?Q?tirqigktyjMGHLM/6T8ub2zoL5iaOUJzKEoBJKnvakff1NdIYRKgTtI4krLT?=
 =?us-ascii?Q?+5QY/MCg5BcSiyAEkeSXMrqReR/y4rPqFwSzJ8TT9HFO8CtZD8YdEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lBXgUlvs8wLlusazkxw+773EMuNJI0zGIMnVaBTPAsrK7XbLEzjfIJs49ONR?=
 =?us-ascii?Q?Np1SoLpNoEcF3ycvhZXrpe0crmQBBcTf6SCjs3lcbImQwy4psdav3MWb8B29?=
 =?us-ascii?Q?gvMGvHjiNmH41/cJdU22qFlrd0RqqOPT4/xxcDaOsO7jc8qkS2z4QRjxuPkZ?=
 =?us-ascii?Q?09PoZ4i6pRSxF81yHIuLn2ZPxmzFb76Fy8vklm7jPQExEd+Uei9hxZzaIptn?=
 =?us-ascii?Q?QkZPuUuogHgjQXtpHSsgb3Bn2NYNsXLpuS1YqdWvfkHKG482s390FL6e4Gpr?=
 =?us-ascii?Q?vNohXODZCIu52KyWhsrnSQdpcL33uiHgpRRlsB3M5KkoezTBa5lr3CJZqiLi?=
 =?us-ascii?Q?YNMaOtkJ8nEtjUJwznRP1kkP/NoJMwAv6LeHAeEAXwBxa8jQlbKINT9HiAUL?=
 =?us-ascii?Q?pSqk1bm5fLFWkBXjhONA+V9aT72ZNWi8kwnuqaw6sXHyyTW00xFOUu75u7LS?=
 =?us-ascii?Q?n4fH0rrI8BtLk1IzR8QPxcyp3roUbXJj/jDVM3oO3jy+8Bjb2vKwZ5CA5gg0?=
 =?us-ascii?Q?lIPoEYDbRezkfzmick45vva3bW8rLKA4btN0kkQvu4WsDMwq1nT9ljlWop6R?=
 =?us-ascii?Q?8kuKWvNVF5NjH3eI0NQhYPpucJL1UtfkSIxaNEYL3bb112jKkvSTkcNAVBfx?=
 =?us-ascii?Q?2VFKWZQ+JHUlZBh3BstsoE9RlIYOmgOUOuhCUNBI7rhMBeD4M/99ttJT/UAR?=
 =?us-ascii?Q?Bm/1m2xa87r8SM7oF+eRHTJhGIoXmjAap7O0yJ04Qu5RqXL9n6680qBqGzfv?=
 =?us-ascii?Q?xCa56Vt5v6twt074FawyEOJaAxdo7QoLY86Acds3bHh0zZ0LQkGz3STPGzIx?=
 =?us-ascii?Q?iL25bQqZBPEPSbfejRxUOjM+PXt63iedetPcTpV9q8m8fYOo0chhXnzzNm4O?=
 =?us-ascii?Q?99tytgW9db0PKHnVyzyGUhjeQvpXMQ/A8ScCh21vJ8q7XCbrgzJ8t14Kc1OO?=
 =?us-ascii?Q?FSybMXId9/Ktj353yXwWo6MZOJogL0L1WhPjNuWKC8Z9o2x77PQosWY49/CW?=
 =?us-ascii?Q?95KX5pBubgzQLbdBqKdXltnNQvCp4FblS+fF/qF4QV2KweY0Sg9GzQ5Jj64d?=
 =?us-ascii?Q?qgfZe4ktv+DBzFT/hYNZySKQTAl41yuus+3D9+/PZgd6F2De3AJCf8KVFKS8?=
 =?us-ascii?Q?u3A/mwMyCnSSEBE4WHFL6EfVld++qF5J73Hz6HPRXM+eZwNIuajG3CRXkn8X?=
 =?us-ascii?Q?tqPBlcF+fldpbfOxsmD4uxZV2mkVEBr1pFgjMkyzNpljHat73xHOJiUmG89t?=
 =?us-ascii?Q?CSSytWMtqx9sS59WO0GL7HYErTNOM+zA6UnsxQkTqLAoC0opFJqa8pjKbFw0?=
 =?us-ascii?Q?G+FdreLhRYeCG6xAkeQkJTO6k7/W+04tc624wih2ctYJyUsWnzbUODD1GkYV?=
 =?us-ascii?Q?l1o1r2gosaRT5ZM+Keu7khPalTgUgNcijKbGv00IUqmTJjNpfbSU2PoiLpc0?=
 =?us-ascii?Q?AmhmdMrNB6mTsOHmQPcALN119N4x1jN22zb8SPaQ5Usax1yeF6phYtMOdJjc?=
 =?us-ascii?Q?AM3HUTCHGlmeYTAczBhdzU2I44YoqIlIRbos57YWyvJtucdY+BXECP7w8/p4?=
 =?us-ascii?Q?BGO0SDqRkKPrPKzyoWInc9/WF7EGZPJ6IsHC7R1m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34225ae-03b9-43f1-ee9a-08dd6c3c4a52
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 08:00:35.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAZdZYOKRwrFMRs5ShWB3j7AeT/GdedZ594s0CV1ryqTWzyb+FhkLYK8qrmohME17/Tac0o1cHR0p6CD22WwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_010039_826895_7D3FB765 
X-CRM114-Status: GOOD (  19.59  )
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

The current link setup procedure is more like one workaround to detect
the device behind PCIe switches on some i.MX6 platforms.

To describe more accurately, change the flag name from
IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.

Then, start PCIe link directly when this flag is not set on i.MX7 or
later paltforms to simple and speed up link training.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index c1f7904e3600..57aa777231ae 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -91,7 +91,7 @@ enum imx_pcie_variants {
 };
 
 #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
-#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
+#define IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND	BIT(1)
 #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
 #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
 #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
@@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 	u32 tmp;
 	int ret;
 
+	if (!(imx_pcie->drvdata->flags &
+	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
+		imx_pcie_ltssm_enable(dev);
+		return 0;
+	}
+
 	/*
 	 * Force Gen1 operation when starting the link.  In case the link is
 	 * started in Gen2 mode, there is a possibility the devices on the
@@ -896,22 +902,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
 		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
 		dw_pcie_dbi_ro_wr_dis(pci);
 
-		if (imx_pcie->drvdata->flags &
-		    IMX_PCIE_FLAG_IMX_SPEED_CHANGE) {
-
-			/*
-			 * On i.MX7, DIRECT_SPEED_CHANGE behaves differently
-			 * from i.MX6 family when no link speed transition
-			 * occurs and we go Gen1 -> yep, Gen1. The difference
-			 * is that, in such case, it will not be cleared by HW
-			 * which will cause the following code to report false
-			 * failure.
-			 */
-			ret = imx_pcie_wait_for_speed_change(imx_pcie);
-			if (ret) {
-				dev_err(dev, "Failed to bring link up!\n");
-				goto err_reset_phy;
-			}
+		ret = imx_pcie_wait_for_speed_change(imx_pcie);
+		if (ret) {
+			dev_err(dev, "Failed to bring link up!\n");
+			goto err_reset_phy;
 		}
 
 		/* Make sure link training is finished as well! */
@@ -1665,7 +1659,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
 		.variant = IMX6Q,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
 			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
@@ -1681,7 +1675,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6SX] = {
 		.variant = IMX6SX,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.ltssm_off = IOMUXC_GPR12,
@@ -1696,7 +1690,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6QP] = {
 		.variant = IMX6QP,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
 			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
-- 
2.37.1


