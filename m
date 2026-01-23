Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA774D6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=; b=Q3IwN+8fYEyKtvxpJGIB+3vbol
	lqUkyc1JJkBVcxdez+iwMHQ/PgEnyxa//UVnHF3toECmhJO7kIa/n2njrKBPBFT31d8wbEI6Lith3
	SFlXxyh1PfgUNnDEicdB7uviVaYgv8CbbDj3FE+rwP/qB3iJtWqddO/bPhm7+sa/hLg6Po4yn/oTc
	mCcGtX2fbhRCVfz8IAOF9V6jNcVhfNF5LHCayZV6EzI2mkBOVn0xGYazET4jQSvivcReZjNsyRFyt
	andDYlswSGK4TFjlT6j1mpurHoTNGdTgT2iGGCKkLq9J6XsmPvsv4mWY4v7zOxlH1wKltkpBvr6JH
	SiL+osaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7uL-0000000880w-3lux;
	Fri, 23 Jan 2026 03:32:25 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7uJ-000000087zT-2Wq7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:32:24 +0000
Received: from VI2PR04MB10716.eurprd04.prod.outlook.com (2603:10a6:800:270::6)
 by AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 03:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQsvXZ69kYRbKCsY/ogLCNyEogTRuJ4Z+Ue19SDO4r/upcZU4Iogoj4u5skUV2TyBklBtfs+YNRI5D0JvbGqm5VUqFSfYmD0d4+wKCAi1KWDJValfWPKrl6X/fprgmxCmY5kGlqKLOUvsOFuia0ljHZIoE2/1H7gzfPyeY6g9seaVMPK4KMiTiF3zYkjfGG7m1kyoi+W3pM2cNV9wfNtiFx0Fc2AuMeCoVb7eZlSsk4GXMSLHZyqr3O9ZPMmyuw56PNR9yA9/Pp74XIFfjG6SnYRFHsEDf/5YaLZorORqQqRSGpS3i3kK+NOfgzpfc/HVH6N1A+DEfCvrARxhQS5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=rfe52f8lN0zs/UP6ilZKFzXkjDzNffhd1GsWmp3BSh1xarLlJ+ovctTt9hQvxikAsdJrUDyryY7u9VvOF9qSjKe4MK/LRZMhx7WfRBIxOUhgkhMWqFYVWbJ4gyNiKl/K3H5VKAskYvtlxngpAgaV5DihwtDczrrY80i1iZUwgjYNQdWO7KDljGU8PzlrdCILw0cYHbsAmoyvQiu/JRGOBIENKsslFB3bQL4eDTe9dF/cdCfqGHxsM5HIOimGNCOK/NZou8/dW/DBhMjpPTM3/VW/lEukXoPETn0qQzQiXrLy4YMJvaqzc9VUqxM8plk3w8PaR+5clXYvZVjBD4ffLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=cbgAuUabNILrMMsZphGB1nJ9uCsVVMnmVkOmYurE9uKr6qewDPVc+hrnCbYrleKFTp7XHzpNNl5zD1oVMZgscU7+SqbmvmH7EgdRFbQLbR82Cnqgp9UF8/8hv168nQOLSMUjlYGLz3r5KjTlFmI9/oPhEghVEbd533DTS+ZW41Z+gPyJNP7/S5SoVZm2Q6h0aZwEqPT483DmeI7FTr2JMVx4go0tYbE1HMka+x0RicywOIxHEk39V9WKfcBM5e+W3ZiTviHICMu+/5TB3Ms1TTpDykp9bMVlf81vh5I6sXgGTBRPgJNwJq69pvzZYYCHKMMVamYga/jl93+VG/i5/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB10716.eurprd04.prod.outlook.com
 (2603:10a6:800:270::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 02:15:54 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 02:15:54 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/10] arm64: dts: imx8mm: Add Root Port node and PERST property
Date: Fri, 23 Jan 2026 10:14:41 +0800
Message-Id: <20260123021445.3782170-7-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123021445.3782170-1-sherry.sun@nxp.com>
References: <20260123021445.3782170-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB10716:EE_|AM9PR04MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: d04aca81-aba5-4cae-3008-08de5a25566a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|1800799024|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wWoGlaE3Ao0a2RMiwNq8SeYP3kD01J2BbS+r9H6vc4wlQF++2aqBoKkWzM15?=
 =?us-ascii?Q?RZVJXOFDECq5NkS+gYbDgP51L01JgtWi55I8m4Qnum4hxl49BfBQlapeb9Ji?=
 =?us-ascii?Q?8hLSp4X2QVCB2z0WNLOSl7zBE1SukkNyJEqeZIF9eeZtgSk/M4mKhvX2iCK0?=
 =?us-ascii?Q?qm8/WzuvO3t//7CffvUU9JJjBlJ119WiSKVBbCzkH2KwRAoM61L0ONmEZ5jt?=
 =?us-ascii?Q?8lgazzSHT9O5GOSHwmE4iLTdzq9a5zIMAlRdCluj1nxPUFeWOtNegl27HwQG?=
 =?us-ascii?Q?dYFSK6SpJfgxJYRI85GahSYJ5PsAsZXW4E9SlqyxOx6aB/D6vD/LJDM9qmHA?=
 =?us-ascii?Q?GEgyQ5xRph2p11EKWikmOnTmhPkDceTm13d3wyW+v20G2pMYjt6jvWMtVAtE?=
 =?us-ascii?Q?9yMCM/iT0Dla888xanuL2imymqlP1JWmUEoL70guWRUBUbJO+dP1IikpKYRK?=
 =?us-ascii?Q?wwiDihNErlIslpqzjBGzC6VEFkTl0N9UkYkaNRHM3cDCLLdQLbEzSjo7LRTU?=
 =?us-ascii?Q?8Hmxbel8amJN5wYvPQ3eZrNif4+SgUrG1H9smfV2s1BdlupmhhZJLQxBGOVo?=
 =?us-ascii?Q?FQEwjfO9KToa/1fXmYDm8TdLLjZRTVQWhziY9vyLu/GevvbrGOfDc4Xl0yNm?=
 =?us-ascii?Q?zVfzaAjGINwhkeBq7ehHWxC+0Td1yqHeD+EIGCVBnc5A8KzwnYl1gkXO5LNh?=
 =?us-ascii?Q?qQugsFkALyXxIZxkLTQhex6MG4wIEv+rT1QT20qja8qVA733BoBywdlsGhca?=
 =?us-ascii?Q?/5Bz5Jr26aObDLGL0Pfhr/Gv4huPLVRmMfUXGQgpF3HQs9lKpoQZfrsN5UWr?=
 =?us-ascii?Q?y1VGuTfWe28BX9mu4XKqrMiqRApbDBxiy4fNjT34fKqiY37PL/AhH4UqiH9G?=
 =?us-ascii?Q?wkQ9Wc3Xctpm+C8G8e1i3jjhifZSwOfqyuP0ND8SLlOw4AWhDukPylWNJTqp?=
 =?us-ascii?Q?KtwoWMRP2ElnrUDIj2btXb1/t0nX28ZCjvehoakuZ942y90Gz44ucLl3mWLN?=
 =?us-ascii?Q?XvtozMdAE0dOzx/BPYTA6Q4wRQSN/57KYr1BmNgZz/G0jrjv9ITjbYB83bQO?=
 =?us-ascii?Q?3ZMS0S4vdk6wp15zqZrB+qSTFnB3v/epdWu3SDt0TNtsumR7Ody78ttaI80U?=
 =?us-ascii?Q?btMOti2jcGQwYuo2lewh4w3kGkSjEN/X579d2QrpqAPY8zrKa6TwAsqP/8ZW?=
 =?us-ascii?Q?L5uS4muVASWm81Hm60aFPkwC0sMm1wBnh2jD/r/CpP/hEYRRS3SAFuHa6Jo+?=
 =?us-ascii?Q?IIclW4zUqkQj+5ggCACqwlWdwBLNR9nr6pLPNIcvzv61eUW/u8f7suV0mg5V?=
 =?us-ascii?Q?YecBlfmGb9lP8j2wjjprHA0xXLykOlDZJz6aX4BUTRP6PEXtzDyVm8SZOM21?=
 =?us-ascii?Q?xw7jt9T4PhsTaG6ugkBAM6IIFkDoHGH1NkakN4BEhhbEGDsjYyq5B4lGHAkp?=
 =?us-ascii?Q?gQER9OuK7SJ/znQYktVvofGmWUgKktAJf+EhGpJEPaL8nGP+Px6Wj1ot0JZT?=
 =?us-ascii?Q?UYzlo/vAoOhGY8SWNtCd5ldvpSiTYDrVX0lTucsNTG/YQuWmNczuhjtPr1+l?=
 =?us-ascii?Q?pwptx9XL72ZDUqgGA9wwJdURRN9YQNoKnqIGKKpD68VbQ6rhOmkskVHJWrDC?=
 =?us-ascii?Q?tc21gAYCx8a3KLRScfYAl7XiLPfOtQAplw003W4JRPCG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t5bK3Bwuld4h91aB23sAMFbTi46SDgR3DYja/s8M8+/02Z4S5RSp8VdJce3z?=
 =?us-ascii?Q?5VhyJ6zpY06kOaxpTwzzpJiKGh51dIqoBWuqQh7PACWRqdkbdtgp+SJgSYjw?=
 =?us-ascii?Q?vO09MR5QqQFpFEPz2Zj0dxy2IF57Nkzk5e9N+RmG+BhR8io8EgnxO2cB69mq?=
 =?us-ascii?Q?QDzsDW9mybpnuNYaivxB7BwIiL5cby7ldH/+5KRV68rCNT3bG0d/yvV7KWjR?=
 =?us-ascii?Q?Wt0c1KXs3Te4TaEu2lhzhGIbCSAlC3fKG1VcRELkogqOjR/xOD4Z6j13gofU?=
 =?us-ascii?Q?CFJyi6vW5MxoxQYeNAmJiSngMM2p9435b702qjGSKJujIFU71Zs9JlhyudAv?=
 =?us-ascii?Q?2bAXI0iNWs9H5KrZT9F283RGNgTAvtaSPHuUlrEf5EsX+4vFKSZG/VRD3LLn?=
 =?us-ascii?Q?VpRrQ1YdFPZ/Lhk5cfbdyY5mtbIqVWup2d1StOz8CJlGFLaKhPxlCCMB7ug9?=
 =?us-ascii?Q?XS6OgojnyTQ9tPvWvMk++5W9+Ezp2/dNfUp+YKRe1sCVhdxbHkLRYEkUAETw?=
 =?us-ascii?Q?Fixa6N7iGDTtOnwN9nBCerofUiigfUGOQF0//M1wakQYDLtYYfOHqtTTtT6w?=
 =?us-ascii?Q?6XUKeoepw2CLWXLJb3c4PaE13PHMFdcp0gpEbFcy00JBCBKiw1IwNqXq2fUA?=
 =?us-ascii?Q?gw2JQv/CFbLxnX40jEdsbTO7FhMcMObj34EqdyVEiq3NBqOr6qp78GC05MZA?=
 =?us-ascii?Q?bc7icFvfWmzjMp67bJd/w7h950aa9qcfzXnqHY/loWAQ+E/rA4BK8WU1vxoR?=
 =?us-ascii?Q?zHqxPqwBej5j7vKnTglgXh/9hVqKkgBkZGxzwXNaC4mGY+wFh33T7EUFiddB?=
 =?us-ascii?Q?zokw1Ddc7zOhCbWcPfbVPLrQcULEitcDyBJYPvvFb5spjMPYxYgVpLj8Dpkn?=
 =?us-ascii?Q?SLJKacDRMOUuZzvOoWkSmfExlg6rbdEJo2YbL3DfAcNteNYD0oLnXzF1NgEI?=
 =?us-ascii?Q?cFvdgDttN8sNe1B2Zqb0HhjnGWgD9N5lWjyC3rG+BevMA7+lkhqxeecEN8Rt?=
 =?us-ascii?Q?/jEXHr4IHZS/KHEhf6spMqSVAq4Ft0ZSMjeDG+lMRY4kMs40Joku6jsRtcHr?=
 =?us-ascii?Q?m0+068t0fya7t62m2ky+ZqDkMt8zqdN/upjKI7hgK9jhGziC6tRqmt5e1Kds?=
 =?us-ascii?Q?a0u7pMQ6ONu2G1gyanTNf68l7vb1hT+b8MKk1pVo8JET1KOYcoen6PHr5XGj?=
 =?us-ascii?Q?M6pSP+OOGeix7iISISjkk6zNAs48JI6/hl+TPsjLfhadymQwpEKnQHpgosnh?=
 =?us-ascii?Q?0TgVIp56ASWNQ1/iuViGayU95HOK2JInQNGjnMVyo6ndRkiDwpgGepfULSpn?=
 =?us-ascii?Q?isSR7PtP0pXjQ4+mgFKuB/K3CRcfhoBxkN6CQ++uKGzm6kKXYbwwXLPaMGgX?=
 =?us-ascii?Q?7eJQAEJFpvFPNEV32XV+wE/TjUYvsQNDzzz4NekOZ/zIfCweN3ZAKWtVt2sp?=
 =?us-ascii?Q?Y4FRJChX/0sl+G1BGbvbRDvjKHqp873biKSEJqiQOhcDHOUejI4tAZCjizhi?=
 =?us-ascii?Q?VXzDFBYTh7xZ1Zbhn1tkPqi8wePopv9ZQItBkz4CQcaRw5h9VsoYn+i4GfJu?=
 =?us-ascii?Q?Mg9CwuXYGEKi9YnDX8Pa5WabA/C3mYasczywJIHlXyi3WgxNjv6hloSFDQ5f?=
 =?us-ascii?Q?tTu3yOhIlXARaZEW7CBu21PHo6LfafoUQmM8jEIiOFmqcbA3kgEFt2owR+97?=
 =?us-ascii?Q?d5Y9mtaqavtQYOAgdYknzzEgmrpVFLc3+lNgBWnZsznQg7/jdFYGmX1BZwad?=
 =?us-ascii?Q?RNXXvQoo2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d04aca81-aba5-4cae-3008-08de5a25566a
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:15:54.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Df5hbsHlaHGdW+Vp1G2q+stlAanZgir+kLKVl8+NhvUw+jjqQOmiClvOg/Oa7LFWNAbNYJzbCvmXegsnbC9S9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10716
X-OriginatorOrg: nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_193223_647795_28A24385 
X-CRM114-Status: GOOD (  10.42  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001db..060860f24e7a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,6 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
@@ -559,6 +560,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 9f49c0b386d3..1204cc4d3f37 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1369,6 +1369,17 @@ pcie0: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@33800000 {
-- 
2.37.1


