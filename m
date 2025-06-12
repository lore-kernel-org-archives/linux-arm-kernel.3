Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F67C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34LXSms52EcDAPbDIX43gXGGTkLlXp631kPdvEle+oA=; b=CGSRtd46j5a0nDh4payRWOSq8E
	/MzzJQGDIYA5zuZy6CAKhhQalbg2PXUVpqyR8rhVdjAzuqPBwv2kI09KjW7QNQXTHAuFDRc8915ZW
	j8qumuQiOjWxk58AOjeJpPBo3TdyqjULxOZdJkgGdACmXxkNJp2JHelTvb74uMgRog9Eo4n14UJKq
	U3dvdGltgzdJXnx01jjevvaT6bFtUl8P7Hf9I2WvLOfltj9k1N+R66TinbyTOJ4UReM7Jqf7yHadG
	+d6vu3JCBtIQRnY6IZBncqXJsnrZqMsliskQvfk0cvcu5JcvKnCbESSWNbiWvk8r76ZShhieQSt4O
	nSxCB6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY2W-0000000C1bU-1OH0;
	Thu, 12 Jun 2025 02:51:40 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXhO-0000000ByKv-39lT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 02:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVlaxTvtU7E68XLCAPVbtQckQVQ240T8Vxjs5Tqhq82S9pJ5l/rtaQjZZHmUWhIBReDBngVHIaUTYSsM1lioW2ABXTnLeYONNwgXRgFxluKU1YFqsM/OkSAXDDSoZWk1Cx8dKlfMMy3rocB4+CZxtQ5L6zXc50qiXcg5etbyWTsFPsxUeB/BiSfcyB2qgYKMEn/3MK6PSvl3ShbCn9nUxGckDzFwMaR8Ewuw05rt8EG3lk2omiyZDrcwua+89gdCO8K9y2JBRzgGYMjeOSPA19xagNcG2Z6aRcnZAyHwnjBLgpmw7ymk3FMtWUMySd1YGYBWqaHj2hqLu2gCOc3z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34LXSms52EcDAPbDIX43gXGGTkLlXp631kPdvEle+oA=;
 b=RhsVKiKtjObsP13sXlu3ygO151YTbzQoUMP5n3wYekL6TmQTvRGsYBDx+z6rTk2YL9jDDcKYPF47VtORmd0xBOTJksKj9FFRAADgK0OEiSogOqgQHbrL/GQ3fWCVXiUD+1l9SMR73DeoiLooJ/qpmktV0DvO7c/6Kdzv38yaJDRI7M9d8d4w3+jl1j+OgLNcRLj48i/Zt5L3C+eMC5yE9w53K+TOZMqWty5vSVHCZtumSqbm2YWn0heXjHH/JCVfi+ffh5GdVyZhLhToDrn8PGNTEj5DS8S/6FJi13Jv1mJtaAPbazRcWH982PyECR7WdVeg2QFeVJ43wHW4VgY3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34LXSms52EcDAPbDIX43gXGGTkLlXp631kPdvEle+oA=;
 b=gNndhnrSIFaBNQAtvAjeQU0opMjFxR4NNMXkbAVhIZYHxBTlpru+qIvFU6B/EXA6etocoFiS4Z/WAP/gMbTYpljQkOhl5+wyouKrm1P7YMFXwkWajHY7jjecCIzMBNEk8OTwO4ix3lN2z7dVMDs3io5QhFddh23e2PIjayiYgdCJKg7nI7DDdgRnzC1JGqkMgUk1QqjFUTg1OxbBcHESIHFKqJXZnBtbpBefakLkvPJ5KVn9+LSQNtFVRvtb6sHBIkEbZtzAl3kfwPYrf16hBsSZZ61r5G6l766FNEW3LmcznRC2zqG1GwOkQMcuYBAElNZ+zOy6srevcN1Vxl51vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 02:29:41 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 02:29:41 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: tharvey@gateworks.com,
	frank.li@nxp.com,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PCI: imx6: Refine apps_reset and EP link behavior
Date: Thu, 12 Jun 2025 10:27:45 +0800
Message-Id: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DBAPR04MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 07dcf684-184b-4595-45ce-08dda958fc2a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E59bBprscbBlOy9Z05uMzyfOgYL6qPSHKE9X5maw/9IVYJaoLYXtAmI0Zc8e?=
 =?us-ascii?Q?CoGHckTXK9qQWFX4ZRqvGIx4txuVzIzNIs00BIrzxNYPI1fnRJ6hXqIXh1ox?=
 =?us-ascii?Q?VJG4luHbV1jc7aEQy739VMjWxqZ3069aMKtod7sxz8CFGrf8xws/l0BnM4d6?=
 =?us-ascii?Q?8WeY+MdcemW445N1a8KsMw+jcA33PvaHvFRq/tTEomLlvmYPXRTSzQrrcU9E?=
 =?us-ascii?Q?/d9NjxpOHss/Oot13ktR1I4qTucdLNP308rXyLFsNUnJ5CAgGimjNLIM6rSx?=
 =?us-ascii?Q?LKsEAyMgWEHFdlEZ9rfYIGOIN8ScvZdpea5D/vmRvxwQjmqPeftcPMjMr34R?=
 =?us-ascii?Q?yeMcIiN4juuB0hhYTgJv0sBwbYGhLb10R3KwHAh7mbhyC6vsGk5y62KbM5FT?=
 =?us-ascii?Q?7h9q0kUIhNItfla8qtMi/h1txavR7wdu6jz0+aLj1wewc7JiHh5hH8CLbTbu?=
 =?us-ascii?Q?iCdba/drj6fgVzsRgycHenr0GzzZsj97x7udUupv4SdH1e/FQIlUwb3gc7pu?=
 =?us-ascii?Q?4c3IKyW6pEqLn8ookJyYihKANE9J1v4KvKVr/KWlGs3scIAYbXFLM4AMPg8V?=
 =?us-ascii?Q?mQubx7zrAyzikllzF9sDai3toB/eaMdcqELbyBpQ6H7/BbmGPBr3ww9bPgq3?=
 =?us-ascii?Q?74f0DCgtGKR+X2mr5TC/JQCbsJmnUhfASvmdySGpJYcT5hToMf4hjEV1gtku?=
 =?us-ascii?Q?eHp+rBEF5/tgERfhKZPvL2VUEF2IHLtLK4PG3oF7z6AvpgzXxCtl2Vheaxcj?=
 =?us-ascii?Q?qHkHudLCf0FV7TpsykPY5oftl87aPEsZVHgVeL/hzbdbQoILMi72s+ty6ohh?=
 =?us-ascii?Q?jGyumDTSqwFH1cFsVDJ2NPoPUVghVHUCmkKwj+PtKhTnQVz8/mFqZPTI9iYv?=
 =?us-ascii?Q?8XycucJNLpCA5BhVNf1oP968eMUXyba5DV04eLODuxjbOFcma2jdQ5GLfiku?=
 =?us-ascii?Q?NJ6iSfL32l9LPkTCBXnwHrwImruK/2ebXdT+upQTL2iBBYpFplzuQZXy1JQ/?=
 =?us-ascii?Q?2i4vxIISXuUhymDWLw75jt5EVOiYLhoN2yeyGnlDgzeLblxMUXpvT/iVeEfQ?=
 =?us-ascii?Q?y8J1783gJc2ETp4SAVayG/YsRyExrMWhQNgbIA0xCqGTjF9VZcl+jFi0qZ1h?=
 =?us-ascii?Q?KE0tTqh59nuhWw19tNM3fJ7Zz4XWc7Ywl+DmjUq8bacCmwKrGqWszZbhGEiD?=
 =?us-ascii?Q?iRjWkE9JpApF91a3ZJYjsMTo2OYO3ED4K9OKks5aXD86cD9LU9tK1cnTKJvb?=
 =?us-ascii?Q?Pga5O9IlD6RZhcUfWv6rw+pfF7scr56REmrFKvZoTA+NKGlGQGvkwIrjHGvz?=
 =?us-ascii?Q?XU4PIbyWasBeAbBedxhIpwSSssw8cqrOcrFFVHWbaNiUVl7INQuqGWuEk12E?=
 =?us-ascii?Q?B4NxgSzF1a9EEK6TjKdri+1QuG1vKDsqMBoGeBETf7XDV7XOnfBnUETlQ+Io?=
 =?us-ascii?Q?g9ln1/rMdw+H5IHxygFM38i6Np7TiI6v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XO0K3+yj+cYpWRLzUfNnK9yr324M/hGNnAwuljHHNlYcK2LF5Eq/mD5TK3AV?=
 =?us-ascii?Q?C+FXn2JgkRckuqr1CJ6zZA/ehsH1rkPQj3f5Pwh3/xhVJMA+xnkTd4hBstgn?=
 =?us-ascii?Q?KyZxjZbaFTQRuoPLwJEC4WZAZyGTLU400QAHgK9YEFZeKPwpkgtQbk1eI2TE?=
 =?us-ascii?Q?VompATnM7mkqxJHJc38leSKpibGgByr0tAwPzVlQeMnhFIUX9oYSXsPkJ3vM?=
 =?us-ascii?Q?AAo/ECRxjWO1ji/fw3XqiswqJLOPJQ/qrJbukMqX/o1fQ84qUdpgyPJFguSV?=
 =?us-ascii?Q?z/Y/qoOr+gOnrHEZtjxayk3auDsmdeFV0Xo8Yr8NxUL/0hvwm0hxGwNgKj4q?=
 =?us-ascii?Q?LlKYmUcoyOhIWlL1HfT6ki3JAN+GqkuGVzjM90E/S+CRiuy1MPdeA8ZxBuLO?=
 =?us-ascii?Q?Q+VcOqI+dRkcMY9Y4fLQy5WxTIFZbTEX6u2pG8prNk4noomP20NS6ewXuV6a?=
 =?us-ascii?Q?PUx+3XnPmu7JqgGdJBXgihKpwbSP9+DfMdnfs2kuqQezX5fCx+Tne7RQLkn5?=
 =?us-ascii?Q?BzwUS9A44+WcB3yLTYlQuz8BbkWOq7BQFcUCXW4ucrEYEF4Xf3Dqnk7olZpQ?=
 =?us-ascii?Q?5j6k5qEx0y111wCzETg9+5JzsN3Dh4GKpOIcqZPy5LiUxuyQhxVDurRNGP+x?=
 =?us-ascii?Q?zeLE/mQaGI3G90pPjWb0PIzQROlLaRiKuN4hD/8jLZVoC1gThwA5EUdwxK2r?=
 =?us-ascii?Q?rBsBNpneJ/rOEJNFGzE2wSPgKyb+ObX+GFI5AWg76tKDh1q5aKgid0OlkFm9?=
 =?us-ascii?Q?RS6qzYaSfImlJjI+d0PZqS8e9dX4lD6UHO6gIjwmo3uhibmSExc/6xawkfi3?=
 =?us-ascii?Q?OHMsBzkJZNOz5BLXz6f+4HKg9mSBIHZPq1eFyBq+Wa/Wc5AiwiPWRri81GiG?=
 =?us-ascii?Q?BGuI0Vh6R9Ln7OyZUorHeCMSl2tNXtwtnuLJm5mzvB6eAeFm4n9TRM8cwKGr?=
 =?us-ascii?Q?4/i6UrDCLX3tAxEqCLbKYGLYufHFPvr3ECkKfQ2WQm055GbVJbnIs3eMPGit?=
 =?us-ascii?Q?X85k7bnLo/HiErnFRGcnsoa5TocYkQHrmodYbV/0KH3pAuaZBU3mU+EPJJJP?=
 =?us-ascii?Q?KvfFXtRubM8uoLUtL7qv75scSuwVGfn91U6EKWF4SYmjtLFLmhtRg3Klz8Ni?=
 =?us-ascii?Q?jLu6tyv8dokt6SiCe1uiPwOapWwuZ/6x70qSZZ+aUpeQru6lMJ4p86nZRWf7?=
 =?us-ascii?Q?ANFc+P6cwK+IHzzd71ydsBN4PMZbSkhmFHMiPD1OXICCKL6NK8wps8feP69j?=
 =?us-ascii?Q?Z91U7AdoEskZtH0xDUtrnjbaCEtBTdJ52AvtCr+OyGwXvJ8uIOQWCkwEwd75?=
 =?us-ascii?Q?WH30sznFQBkfvJiWHbQ8jPcdqW62cceL0bGC1Se4m2dd+LWzcKTP1xY4w0qy?=
 =?us-ascii?Q?T5uEF3OdXW2D5gpz89OGJWbYJSmF9wEiRk5ZP1KlX73tsxK4kc9ROYNrpwDk?=
 =?us-ascii?Q?fW8MB6k9oEism13GVzAW0jEOunulFmGBEVlfr6o4L3MCXPF6y+8OUlEnxthR?=
 =?us-ascii?Q?kFnkXVf/ptqUkOPI7Knt20A2ErEjImrvE0VQ++GdFUAKe+wgaRFKRk124xV+?=
 =?us-ascii?Q?1Yu+yF7fxGt3Gmd732C9KpfydpXLAE5YnHFjDFi2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dcf684-184b-4595-45ce-08dda958fc2a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 02:29:41.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVTkp9v7KRvcNyrk20f+foJYbw1Hd/2MFYNB2E2+0q5ZaqeIgwbeExSC9TV3S2g+E4WHMBwixtpaHQTfahaHqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_192950_812061_79DD5F0F 
X-CRM114-Status: UNSURE (   8.02  )
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

apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();

Remove apps_reset toggle in imx_pcie_assert_core_reset() and
imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
and imx_pcie_ltssm_disable() to configure apps_reset directly.

Fix fail[1] to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM,
which reported By Tim.

Main changes in v2:
- Respin "PCI: imx6: Align EP link start behavior with" patch.
- Add the apps_reset refine patch into this patch-set.

[1]https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com/

[PATCH v2 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset
[PATCH v2 2/2] PCI: imx6: Align EP link start behavior with

drivers/pci/controller/dwc/pci-imx6.c | 8 +++-----
1 file changed, 3 insertions(+), 5 deletions(-)



