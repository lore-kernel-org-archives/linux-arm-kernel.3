Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBwS1/OKanmyHQVkO3wU6a1RKMb2lcefnYN4owJXhWk=; b=OZdQKLgo9VRnOncc0pCcR114Ou
	k2S8ZeoJtSl+UuaPTZuydP66vfQ85YO/APUcH/C950x8IrZzwpoEyqHZl5IgylYGpCKWE5ZxerTNs
	daCHjZTd2aLDDjmRC/XhN60P5V8DaVDAL+Wvpm46zLygCBYJn2P+Io3O5cIuGw/8SyfdqpB1U11xf
	pQWx/cJAMv3BsQWBqSyoJz1H4JjIkzOOB2EvsFPtEEXasL2iDd3gMiDsn8zvOsA8gsWt2lxB7GlmH
	Lf06PStN+/xRUyEkakEh+9sUamphLT8HzNlnp4tiryBQJMlJkHmdst/d5UhMC2Opj/UcGKES6ucSk
	cCRmh4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiys-00000008rUe-2cZf;
	Wed, 18 Jun 2025 02:56:54 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRim5-00000008ptC-3VEC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqzRkdUvEb6IsezPT7dGv55nuo3F+FOduKu/H6KLQNXTYo3JUpfQuLuK4s1Mq90aG29b0AYXpB9YDawvcpmVmNdLyK/A/TnvoG56h8MnqsFKeR2KkvbZjmsVN+xMzgL4aR1QWGCq16CqBmN9hhVQrIvQhxV1AANvTNK2uev98JYlib3b9L8JkOvZe3EE/ZND9dcji6NkDJ47PNoF81YMCf5eJLHsCW26YO1vKm7+tYwcKiSqgbb3l0h5RCSCt9pB6XMBI4jdsYE1xS2c4HcTvSKTuZ9lc8hsFuIwlR2sfHJNU24MhMxCgoEYK/BdK/Fo5YKQl5z6VzOq/gCUJld8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBwS1/OKanmyHQVkO3wU6a1RKMb2lcefnYN4owJXhWk=;
 b=FnJO6iw32ZIaMqSQ4vD7UUoP7Ioahlqcf5M7LiuOeCCXwvlvS2htlAQyLQIfT2HRJbBf0FbkcHOBUP1JLgCSxDslnUcMhqdYahnp0C0/7Mdqg4qaMTI10pc5jC/v4FRxUo3QLZed+nH5TkiZ4FkVGJ/ePyXmwhwFus9XNrOuhkI4XYsA+kFuPTKWunDWsTTsebzaX22seAFv+wLBsmXeWi5EQQ0dw03LqHcXnJx7KmlQe0a+WtAwD/hQRMwVvZWpvMZpFaqQbKBMzRkTNZ6K+28AsQsPhJLB5c8lWGfeKkyhwNNXPP8aVGBHifnV/NthvGRmiMDMzSG3810N2eSriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBwS1/OKanmyHQVkO3wU6a1RKMb2lcefnYN4owJXhWk=;
 b=E1pWvYeSLnIa1AK3Zb4PMdFRGj9s9I0W7FBKW2EIRV+q/G1RRsSEBjtGoAjGr+Bn+n0i02EbHxqiblPeIxO3xjxpKBIonP1rGIx1XD+FzrbO69QzqvChbclpIsOji9LHIaNVva/C4mA42ryT9WvL/gbrpuwLgJ5GRFUbDmrAqH23jBrDzb3CXI14YftijFgOsrIU3CuxvcBHv/zh/+Qv9f+BagWsG9zwIBHSMI1ghAur6uhFTuHDttesTlEAqnf/wNYmDPzeni73f3iSjxcBz1z/Hf15xOW8JZ06T4Ge+rtz9hnaMkY4w/MmJXqc6QhoBHjsJtH84a8X/P4va0cQOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DU4PR04MB10960.eurprd04.prod.outlook.com (2603:10a6:10:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 02:43:39 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 02:43:39 +0000
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
Subject: [PATCH v2 5/5] PCI: dwc: Don't return error when wait for link up
Date: Wed, 18 Jun 2025 10:41:16 +0800
Message-Id: <20250618024116.3704579-6-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250618024116.3704579-1-hongxing.zhu@nxp.com>
References: <20250618024116.3704579-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DU4PR04MB10960:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9faf74-5068-407a-4430-08ddae11ee58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dikeFtMvBzrXkVlKlosHxVMX/fEqPaDH3fTfp0nU3M3Oi3PQB6SDavL7dsTl?=
 =?us-ascii?Q?Sa5UaqVUTlCvJk85mFieMQY88p9eBY3K/l6vhgwqBT1RLz49rX6VdGPYSToj?=
 =?us-ascii?Q?mbQzuDqHu6NXvxTabSA9c2/w59FYNo8xLzycEs5AJxO97gZsNdRAVjYN5p3U?=
 =?us-ascii?Q?rheuyT0M+d7Gbuz9qUxpD3BoulOIx67WVmMHAl5VAqKLBLjPa+o0+Caasvad?=
 =?us-ascii?Q?hMzg21DPku+zTbE9kaoJPNn2/h3M7A2KmeKnmTbquW2JFz4Ekaa9EdfWIKh5?=
 =?us-ascii?Q?rZAWC3LMuYo93D/u6s9qRo9dFKCLZmZQO9SioIUC6OHXebQiEgYSeq09EWOD?=
 =?us-ascii?Q?h2V+btwFasDvVP5hiRj4gkCyei1pzdsuhIXFcOupqt8hjANCIeOYnJc5Ffr/?=
 =?us-ascii?Q?LaxYxI/uPx3EhuKJVYnFJMuSnPyxEAHSyMvMevwacbVb5qzmdqNyuqh38KKu?=
 =?us-ascii?Q?PfNbHhR1eDWdIQYMB/PJjkvBwL0zrt9ZbAISg3R/VqwFqliwVHgJ+EEgDkJY?=
 =?us-ascii?Q?e15CpWQUts7GdDvNhDHsyED47kdh281MlBZezLFBp7G4/QMklNSxMUSSUpAE?=
 =?us-ascii?Q?NOXpMkWyUuTpWgtEE3i+DlfqgFBV8/XU8hUegHijv6ETX/324rSRuS7oKdf7?=
 =?us-ascii?Q?T5KR/QyHvB5QEfbUQOrZtdW//0slCIDJqDIPsjRiAFl9gIKqWMNO9VGyeGEo?=
 =?us-ascii?Q?YRNywenrQINQIiyXvaappbys9KFPikJK1SAByW+QBPreMjSBKvB3u1l3NdkD?=
 =?us-ascii?Q?FjhpWkZB1rSYhdXy6gqWZnZqL92zB7P06o5lNNxguiYULVIqfEl3StSnVFcC?=
 =?us-ascii?Q?iDrBarQ3uCYVpR50mNFuVkL4Zpc25FXMq+pbkL/cwWHek/8RWYvM9V8eeyBb?=
 =?us-ascii?Q?u0u3qeLMgApAMNXoTzAQYxJYwGfnURD8ql+M5flqjTMxc/58AX7lcLYUxtwO?=
 =?us-ascii?Q?/2GobA9B7NYKnozqeO8gZQkBsw2Uvgi3PQK4YstjkQclREyJWOYNSWTFvgvQ?=
 =?us-ascii?Q?wWDCvj72CbnHsxOZVQr+mfbAtyuRuTIhXLwUOdiybtrhA1+ziLIrPZOwKz4N?=
 =?us-ascii?Q?DiQqKUXwXGOQ7DvbVq4LwLjfQHA+mS+Ut7/Osh6i/aAW3PN52FTJ7Sv9W+1n?=
 =?us-ascii?Q?jOYVUprsQbYoF5s58gqcBCewzFtITMGeNhegXKj6eeRQCPFvtPQPd31Rx0EL?=
 =?us-ascii?Q?UVJ/QkDB6XOTS09SUaFHRXxMfeg97lS/BU9BBgEgohR+x5mlQ8s8AF3GayHJ?=
 =?us-ascii?Q?72puhLXAbOVtEUZx2h01iUc4t2MAA+ijijWqKTOdbW98GMOXIZ67ZNKEUpsf?=
 =?us-ascii?Q?1vSOxVYGQD6nfyjvXBYTW6wPX0RTXFMGkA4qWZTzhz06r/IDnCd4Vfv1NjhB?=
 =?us-ascii?Q?rGvHeSqzkc5ZGUZp/eyuN+TGkCmaDr4pEL1XlxKQY6VVTyXczVlPOXqTJurq?=
 =?us-ascii?Q?Bd4KVIJ4HdG+RTs7doiPR+4LxX7JS+1f53Hbsst8qlWzlBRumcAT6J7+B2yb?=
 =?us-ascii?Q?JAQ5qkrPbml1KyY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iIL5AKJVTHb46dBGVSweSfydHTUHTB8PSAC4AEIUpeQOmAta8wKEG+mmku94?=
 =?us-ascii?Q?PEZ6aVdZtkCrsqlKXH/jzqVU/WhzxRwwEzGhB0PBLE/PxQohsd9u74YOWYUC?=
 =?us-ascii?Q?AqhrVMR41qh9PBqCm/mK41SZAxmbT4XLgfO27Qk/VvpoNrfbyFPUL0oBObQX?=
 =?us-ascii?Q?yKkYwhIhwasLhqubiBvQkQP2NqhejRfOCck4Z8AHle35ci+GJNTyMqyUOUUX?=
 =?us-ascii?Q?eQHQGnQX/kTYLKJL8ntnoazFKDGSjNx1VKqWmTucviA+MAMrUpaiVRRrMsbg?=
 =?us-ascii?Q?EUa6nPXweP6zQdeEgC8rHNIjcX5LnKFjrwsOJ35aEBjbfCWrEwfuPcrqh+fZ?=
 =?us-ascii?Q?luQ4ftLzydibLDsm6PA1HCRTV8MlKjaNgpcv+jYXDbloDM/6aKCNrrmm82mZ?=
 =?us-ascii?Q?BOmUgFnN3f1aAOtlj8RPco5Yhy8QE+syNDySNAdPfQST6AG0qwANqR7FvuVw?=
 =?us-ascii?Q?Z0Itqz/1fWZCkuCN1H+DA8cWKkcQYWtWmgXNpkdJYz7mcZwYbTadIhvdwlsu?=
 =?us-ascii?Q?b9yOlLd6vzzgWQ4GR6phJypBAeH7vzLgn0qjuEk7kpU7BHz1S+P+io9WI42v?=
 =?us-ascii?Q?rGUhCtBGvlD0apQ4D0sUZcuNBKjtuRhFGIe2pDWNCSTInBxiLec0zV/PNGPQ?=
 =?us-ascii?Q?LPkoTW92HbTMNDCUDIJkppzc44YzRRPpKOIZQbK5sHMbgsHp6/8kHNogalal?=
 =?us-ascii?Q?lB80PZaPspG4k0AqkNTj2FglioJx0YRDlZENLnJPuyIIrmNVcFs2Rkq6N+il?=
 =?us-ascii?Q?zEWnk70Z5pwWGrUvovPVXhKKwrr1tsLvHGDg7v0F/fZ4eYeHtuV6hgW6HBS7?=
 =?us-ascii?Q?75hATZ7fQ/49JasA/sKR9hU1dE7JViEAyFno5G0cOm2DHjDRQkrZZYGNK3Pz?=
 =?us-ascii?Q?Hn3CxhQ/bjSn4KPRr62O80oFnZuwT+b2PNk9kqNSZmJx0lb525Fx0rxDgdQO?=
 =?us-ascii?Q?irUwNT/uDmgW11qBzDfwXPja1dzDJ1rQ7lh45lbzR7wf6y8LEWOxgtofCjZ5?=
 =?us-ascii?Q?fVnFj2F7efwvScIT+aI8B/dzsib5FojWvjDPbjHi5WL43Ue1Jv+8JJFYgLYK?=
 =?us-ascii?Q?ORqAUvkHS+woi1KmFuvLBwO7A1pdBFvaBkRojFKY1cwQCdn2qakitM1nBtwb?=
 =?us-ascii?Q?syXESwOPdNb6qGkNGrCJ/kr430m7H81dMGaYyzvy5OaowNU1rYzF/7qLDTd0?=
 =?us-ascii?Q?J/TWtrGLvhRAFDZ9I98WD7sWsxnqaAlvypuTulvn6GhF23hFXuSVorvT5l/Y?=
 =?us-ascii?Q?NTJXLoBc0qPCIq6aGD/pEiMze3bfX7+OtRjCKJUWuJuSJN8nk/92G3IqQFQB?=
 =?us-ascii?Q?UNGm5fIgvM3YzccpNLawzB3iJnpXbmUE6R2+H8LbzdA3fUf7FFS36GKy3d47?=
 =?us-ascii?Q?2gq0sPTm1rGD11zkJl8RG2xgDnqOddlzmlR3jto0/vum6a016Nc0oe5Xeqjv?=
 =?us-ascii?Q?/PL/hEHXsTX9N9gARw+4G9Y2CzQ8zpF4ihKngrC/aw2YRDV5KGInYdr+Y4g/?=
 =?us-ascii?Q?jI74d2WpyoavGajv/F/q/Cuuav9Vh9YuZ7tOw1tkbOl1fqa0yg0MQvZAAMPJ?=
 =?us-ascii?Q?PKE6HAS0NJP/3r8o6MxUVgQWU6wqlqxs2Pemi0++?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9faf74-5068-407a-4430-08ddae11ee58
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:43:39.6107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf4sFRARyQ8HUtIlfME41AnIsfHEgVRn1x9skp7VuX4tjW0hGfvpZosLBuR78hcIt7LGQDyr2aowueq8YamyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_194341_875287_13E8E944 
X-CRM114-Status: GOOD (  10.22  )
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

When wait for link up, both the link up and link down are normal
results, not mistakes.
Don't return error, since the results had been notified.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 228484e3ea4a..fe6997c9c1d5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1108,9 +1108,7 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_wait_for_link(pci);
-	if (ret)
-		return ret;
+	dw_pcie_wait_for_link(pci);
 
 	return ret;
 }
-- 
2.37.1


