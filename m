Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC4DD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hIhL8RJ/z77P2KQp75yB7VRWRm9noOARAm3Ee+Ycsw=; b=OCCommqGo3KTk9Xsb/25vAPq7s
	C9PM3ApPL1/elF+hBPC3vjTNyUKhwKH/hRataqz3ypBa7vEOTi5le4uHtGY+3lCtFs7G/Ks0a7Nvz
	2UreRnOIDChbDuCoppwphpSxw11Sghv/gmGqdc54O5iFJBm++U0Jf1QuYJ2nLcv8AlUmw3bb1OrtW
	RQWZ8HWq211aThS3gcc+Dr/rKlcbnViDksrLhTaGVLr1Lulz6XZe2Bm2YXl1oIJ1ZFKT66an86G/T
	JsBSzlLnGQLvzU7eikbKVjiClwATD52plRUD4NBm++RWO8daJIGD94BEftBo+3LqBOQ0tN4TQC1De
	losP4YzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHdg-0000000BupB-0DYn;
	Thu, 15 Jan 2026 07:19:28 +0000
Received: from mail-norwayeastazon11013062.outbound.protection.outlook.com ([40.107.159.62] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHde-0000000Buot-11eY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPc+1VYtJdBLlxu0D2BCN8z8A8+ZbpSwbH02R1/VAnR4roezlueKec2Xw2Cv8WRniYPQt26H0QcXJka3beRD3imwEdoX9GngpZuFyBeQqmi5/KehMtRvrb/6JvkbIhHzrAGAX3Qk7AOh9wfcN/kkK6pPqH14goMMWdkTxnscappJ3HwndkNaOcSQC1xVIAblWxO9dI1vlCvY6v1pXM/1kiH+H00TG+2tq3jpR7RkhLUa0/fsEMikg2W6qi01yYXyftAUhhHePS7cZgEHEmTooEZUitYDNQ/XFTIoydHW78ZIZWgzHb2Jh3SyvyJjbkZg3l4HQu0vPmbQ5Up2TS5Ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hIhL8RJ/z77P2KQp75yB7VRWRm9noOARAm3Ee+Ycsw=;
 b=B9c8YpQAmmXA+e2vTUsN5zt4MdMJUksVmjNzS6tgVBOLFiLR2xD1Vcj3c7EaVcTA/TKG+qwpxzztmKGKvFmMrQyM1YnvhD5PLHeJFnBo2CcJVBoNEdC6A4BTnZSVsz0oT9NP0JLaxAJSCbWOAADz2VrT+yueetLOKmPsrZvi9IW+pLeN4d8arzdU0cMQuZiA0y8Y6WFrWD3CWZBWbiBX5BDc/mM2SQmA05EJHPj2FO1s+x5BSDNNPgo7bqAZTxZ0jRMwMz05AL4/8BCJZVwUMeBD2tAc7ir71UBSCawOjkskgCe2IbDffPFzb6BQPsedBUqYN8fp5PEkjyBpFO6jNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hIhL8RJ/z77P2KQp75yB7VRWRm9noOARAm3Ee+Ycsw=;
 b=aXfFuQMMeuJSF/VSiQ1pm80LXGYJOBl5UqZoOAeKECdfj4y3J687s43DqBF3kSh4dMyILp7jC4FKR7e7S13JUB1MrGn6qDFr9OIYy1GXfsWxx1l4pCp/M/5j44zQeXE+p8AvHSooToVDkkzOYdoG/wppYduXT+3wS4OkhCx53SUFisfsiQbPfYEdYs1E3jg8khpba9G6xyxxIusKTFqpmv06LNuGSCBbPGVej4D+wINMY1lCvQaJm1BnGbsCFARAX7r3w63toSUKGoYrawKKr9UExW54FHvTmb8RQev+oMrkBSguB4RGlHleHFhIS5hsbvR3eThJuq0YDGWro5wlKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7322.eurprd04.prod.outlook.com
 (2603:10a6:102:8e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:19:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:19:17 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kwilczynski@kernel.org,
	mani@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated "reset-gpio-active-high" property
Date: Thu, 15 Jan 2026 15:18:13 +0800
Message-Id: <20260115071816.115798-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a6eda9-b7dc-487c-2cef-08de54066507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJxI5zlfTbAZEOSyTeMAZDxewBKgF3vvXOwnWVA8LwvrvAU2HBeztjTbDkme?=
 =?us-ascii?Q?m3RsaZMw1vk6sMlE1yPYMSEqjAhyWIc47XtBk6FteTAoKHu/M/RH229DPkj8?=
 =?us-ascii?Q?H2ErAgUiqdenCkIGWJJ5mar/FJL/IL7nt1DOXC+yoVebFcZ+/HcnIX/rRK9d?=
 =?us-ascii?Q?mLO91LtPHMOGaWFEvQUZOLVlz4B9gX/VZI+IcylVTIND8uX5p99+K1QeUyZE?=
 =?us-ascii?Q?KoUiZtkB9tPXQ5JmVVMSDcUNOZwRqKlsPZeLkE910HT4BFvZOX9bEdLQdT8D?=
 =?us-ascii?Q?ncMWofgTzWuY5VkRqEdu40JKZg3sqoqo+Z2Qehitv5SFJK6ooIdrYDc7FW9E?=
 =?us-ascii?Q?rDHHPF0vqzRBgA+n56iDCr6v+O3mlHLwE3AbjX3WPXUb9yRPz9hZJXJHc81f?=
 =?us-ascii?Q?5wLnaqyP45IbZPy6lpOng8MJ8nrFtAaQHVm1faQvC+Hm843P/ls+VdPFS/Ci?=
 =?us-ascii?Q?2bw1dBN8/xEu4GTer6f2y/4QsZFzvXxnv5V25feLj7SQWK1vEgR/5/OI4mpY?=
 =?us-ascii?Q?TDHG2rg7DVjN0yJru1tpIvIhafdf1miobGkOlN8kjbtwIpUjMEVH3Snn3Oyg?=
 =?us-ascii?Q?e73SQ+gW9itupfNBvJpmx/2WMaz1Yy2HlS/JhV146SmMlfLRLbBdFdyXIS+J?=
 =?us-ascii?Q?Z24WZ96T6jRKRwlIo0uuiYuRuybw2BCpIitHBD32LQKioBLlJuEz9A1D4ZdB?=
 =?us-ascii?Q?po9fTOoJj5NhIopRFd4hKuK+MdSPguWZE3UVu29jJxilj3o00N6IMH6N0wvo?=
 =?us-ascii?Q?80/pMnt5iXQ0WN8bgUQI0aRUQvsTv2vzYKMh5BN8lWlxldxQeI32Z/iTj9Fb?=
 =?us-ascii?Q?HKSs1/Z7D0hmbuJXVf0L6Sra8YDpEwFzG1et2FQlTYcNLirLFh6yGnGSl/Gv?=
 =?us-ascii?Q?ZFKaZGk3iBR2U88O5jGZZtKHj29TPZ09NksPqAGUKwuoUs9IEJRwdh96BYtT?=
 =?us-ascii?Q?TQpf7GgKw9JMB8Mi7nWYMOaJ7MC8VCDPOr9Y5PFyM2F2mssKlpNp+eEWafz9?=
 =?us-ascii?Q?O6TImd+jAwH3Hdc8kGomLB+ACqBgMNbyUKID4/uRzcdsD6oeKYA27Tg9sod2?=
 =?us-ascii?Q?WyMou8hls8gCLtlQd9Z6Y9gFjrFj93mF0Sb9luBDFajlXFJ1+94tSiRvcqeA?=
 =?us-ascii?Q?yI38eElwzgeiXvprySaoQ83oLhb9iPo0qYMAcCt7pZWXXxkAD9CfVrty5i70?=
 =?us-ascii?Q?SYw6bdv9ctVRd79UwXASLh61XNVQBRz7kkcuyoew63hQ+pxfvLUjAR2Z86R+?=
 =?us-ascii?Q?ftweRjDdpYMtiq9EItItFwD50peWJYIuoZMpg+7T8spPdLsT4nOrw8Lj2fGS?=
 =?us-ascii?Q?YYLBCW2MOGNnXFURajKywo+kQgm72tURbN5pSAJA99CchuAEw9mjqPAuTB+h?=
 =?us-ascii?Q?isuqyyk02kifWVee0Esz761dXdfsydtnJY7ERadmi1MBhMuUUMIh4NQScnzt?=
 =?us-ascii?Q?6F0HAMozfkx2q8Rkdo9h2X4chdXhHJxFs6V7GQsx2V6Pw4nwXjJhwMQy9SNb?=
 =?us-ascii?Q?2acjW6dTMKPFGyAckIUT0ffeJ7TYnt5UFXEq6BGLqizZcjRZPMOj84pjc9Sl?=
 =?us-ascii?Q?WEbA0By5clBtKicLzfhWWCHlI2suYyXMndgXsX3mEDMhV6nMw+xZKfqdBXco?=
 =?us-ascii?Q?uCAxtzAYMRTHumtbwby6wjjFNSTFyRQMb7eFiWMpLe4A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BdZEYTTW3T6D2p3BUmixTBn/MKeUh0ue6iyKkC2Iu+56RG9/WnmZY9N1SSd0?=
 =?us-ascii?Q?tjusDZjxg4GTVLnKljH0bu0NaBv6D9ECLuRdI6w6xntGhTWidKSBLfsHanfm?=
 =?us-ascii?Q?/oTBgAPSc7xXA9pxhG6P3iCLCrQzBEEnqAamEqlXSEUafqL12+qsOOOzKljB?=
 =?us-ascii?Q?+KAlq1i2f5AHdPjVwisdN1rQn+XSQreJr/VGdPW9GwlmFEG1MW+x9FP5YgLN?=
 =?us-ascii?Q?p3UKxyRCPpb+Qkn6EYXX00cTW49/KwuEjF7ZUHRPzboCOr6iSTWPHzgPWkGd?=
 =?us-ascii?Q?YK9trEEIG2VW6uJTUua1t1Mb3hSrGw21pVRf0GEQdx7uhR7SXn28rG/rfjoI?=
 =?us-ascii?Q?j/bkwb8Vil3HhuINs0OIi0umjeGrEL/j8/gx4f7XJ5ec+GXnbbNtznLFtBnk?=
 =?us-ascii?Q?UzB7TnvbWSA4T+nAp6NXW4nDuLnZ4bkTfQuGocIm+OykmSZ2vIZVwcBKy8+u?=
 =?us-ascii?Q?/nkXH+viNU5vEfUE18rpbPKee8QTNRz7WAOiCYxNOv6+GrTMUbpeRMcks/rC?=
 =?us-ascii?Q?ehauU6nRPHY99ajYq1AUH5KzUJWOGxp7qEPd2J1VefHefgTyhgiEkUspNnjG?=
 =?us-ascii?Q?4RTTwyfFcs/L9TCaw06T622Hi5Thzef5Lz0J8SDmX6TRg1T7fAZNDKsuvjR/?=
 =?us-ascii?Q?myidMVUepA72s02+Dr7fKggT77Bn/3daVrhwT4Lvnq4DX74bbpnq7gigXBQS?=
 =?us-ascii?Q?XZ5xRUNCw6y5J4Edme2tLbUF2iRYsbfj88P+jUxfoBX90qrHJpWUMHUtdWO/?=
 =?us-ascii?Q?5RP5VJq1fuJcnzhGTN2Tnl0imKS+Q+gurUrYxCFQ4+Nkh+jnJ1cDo457NeET?=
 =?us-ascii?Q?+WsmdfrrjTSyR0Gm2lSOudq9Q7fqyxW35cmveN08Izzck8e1cX0AEsRYn8Wm?=
 =?us-ascii?Q?wPLMeLjCXZ2ndmLcgnxOsK9SN+YiQiqYGxH5u0dNhShS3htxFbjJ1g3g+k3h?=
 =?us-ascii?Q?KIOnLsLuiAcJIkW26MVk5fCQZHJWF4l38vo1SmqUNmmFTigLVtfalBgWet1/?=
 =?us-ascii?Q?dL344fIVzQpEwqbRVa6c5hJSIFzOrgbjXWb5J1IQdKyLaNqIOujkbs0oP3YL?=
 =?us-ascii?Q?sURe/jxi6XoKCn6nL8Cgn0AATXcXvzZV4824oAKbAF0MM5Qhu7Kx2ocdUBys?=
 =?us-ascii?Q?LDI34UudygEC0DzAiSEe3S7pRaiKi0MoCDtXC4a74OzeoQ9oiefpyAqw2l+C?=
 =?us-ascii?Q?XxJTb42Q7yj3CrtVG79TSQ4QIh4L3DBLyTg70kb/tCrj/CS2bPKbU2/w9/ju?=
 =?us-ascii?Q?Uu2SLWk1ZC3VQnPOfPekkwk+HLbZ4tknlm6mu4BZq1e6jV3uZGh+el9BKB5Y?=
 =?us-ascii?Q?YprO5QwQX3k6Wzpzm5gjd1s4xEvYfMSghj0y4tWENPb0LoBp/KqAMYMaoEPR?=
 =?us-ascii?Q?TnQj6vnAKTFVKnwp3mQzpvTkN5WZOpcRq/PmNmVrbv0BXEcLV7dLvDrVgouZ?=
 =?us-ascii?Q?FGhm/gZD8FygMNMnQ4FI4ek5Lovz3OkgeyVU5UahUEQWXQbjhd6Mp1ZAvBOi?=
 =?us-ascii?Q?0fSBfqq3gdBS+CD1ls1wtzw2w7v+X3MtJGrSPzu/W9RZaoGDVXvZurRky4mi?=
 =?us-ascii?Q?5srPMouUrCymIvALGsla0b9NxnofpJV791jOxovPc/YIL/KCJYQnyyAIk9Xq?=
 =?us-ascii?Q?UwkkDqqc+EMFr6yI8bNL6N7R+lX9QVCYMYuO2MLc5t15pwDse1OviXDzjr5G?=
 =?us-ascii?Q?vdgJpXJcrxsRnV+QvaK7h86etCIOMisSemDrDbnyTHHAWfGu1KOAgJ+82XtD?=
 =?us-ascii?Q?JV4OqXMhhw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a6eda9-b7dc-487c-2cef-08de54066507
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:19:17.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuFBzuVMjDb4KCnSQIJHnHJZeU3thZaejWhPWp/CR7fxJICQSpeODy2aDBAw59iRcqw8MvxFKpgY9xOFf1kT7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_231926_319723_7056826F 
X-CRM114-Status: UNSURE (   8.12  )
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

Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
deleted the "gpio_active_high" flag in pci-imx6 driver, so currently
the imx6 PCIe driver doesn't support "reset-gpio-active-high" property.

Let's remove this deprecated property in imx6* dts and the
corresponding dt-binding.

Sherry Sun (3):
  ARM: dts: imx6q-apalis: Remove the deprecated "reset-gpio-active-high"
    property
  ARM: dts: imx6sx-softing-vining-2000: Remove the deprecated
    "reset-gpio-active-high" property
  dt-bindings: PCI: fsl,imx6q-pcie: Remove the deprecated
    "reset-gpio-active-high" property

 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ------
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi          | 1 -
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts     | 1 -
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts          | 1 -
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts  | 1 -
 5 files changed, 10 deletions(-)

-- 
2.37.1


