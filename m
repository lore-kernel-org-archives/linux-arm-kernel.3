Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0ACDC165
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNNjtns5vh+jwtLWP+8nWUsBn+0F9LWxxqYU1BIxeLU=; b=d5nWS8zu+uPQVcEClr+SLcOJl0
	v1zsmXPBq2Xh7TPCRBsF6auSI9isWV2lar5S9hypVD143+sCgxB5T3z5GBpul93tFy+nYF68ScdFU
	B6tzw7c51Azm07EwN9uYcxF6qNpVDaoSjXL+xyUg0BJUAvz1dtdXclKG0O62MLrul5bwOXJtW3eEc
	kzhbrr+S0yLS8pvPnsK6kmgc1LXGCqMWqzqLSF6Q1Bzz5XDkDIczb2UzES708okg700EDlWeFeoMF
	F0lGGJWPKsRJwrhn31XSHtRyoL+LbJL5vjyHHQA8gSyFKTdEsvJAhJXz0oKmYESKbbyq18fSa04Iz
	J/xawEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Zl-0000000CvBe-0ttc;
	Tue, 06 Jan 2026 11:50:13 +0000
Received: from mail-northeuropeazon11011054.outbound.protection.outlook.com ([52.101.65.54] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Zg-0000000CvB3-1IKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBf55Oy/12j6XiFpgPr90vMoIlPNkR2QepmI09YXtbIXtu2moRKMg1BQ6UNA5zmE8ncgyqtT0+0b3CnifGAmfJDBVLZW5iqsKYC8+XiTaD2elr6Ner/yRxivX1UTcHZlh9QgmCkT153Q7uL9nv8D89IyQBfcTUSyM1ElqV2DspStbfmlVB/ZAqmk02hpHgm2HRVAr2N38ibef/aAX/4J9TvDur+owUwP+i3VXGyZtusLY+7da+upWNku2eY1N7q29JXhkM3jDSe2Hyp2tgfltaH4h/bCGJAFmtqE76gxWANZgqoHmCbNSN501puAB9XVl2pc8ZlkEak7OeCpPG/Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNNjtns5vh+jwtLWP+8nWUsBn+0F9LWxxqYU1BIxeLU=;
 b=VgK5pSWesHrCemZZ9HIafOSZct8lxTP/v70kYwZWzxG3tDqNqziXMrNIvfhISvSP1rl+72cdthmGmq/pbNx766F8P16C5OPkM3KSmYlbRUWTffxq2XQ1ZOteZra3xvbyypA6mtaH+NnMDe+DoJdV2w82YZtGKL09dsHhBPD17x+eUvuAZGprqGHLyQzUcysULkKsFDsAwJ+ItnhB6stDZpLq6iwkTYiTHNF+IB/F6MmIr+Ks8Ys5XdnTirKghMf58c0tcaPz9siArJsLd/jS9I9dusYFZMQRcM+tF0DcCL5+xrY47f9dPH+fSO+KVLczp38qscUxQf/c5Y8c/GdvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNNjtns5vh+jwtLWP+8nWUsBn+0F9LWxxqYU1BIxeLU=;
 b=bFhHJ6dr6tmuakxeLnI3ey6jFXHVoLW12FnNaVFGJUSRFUVS7Op/PyYP1aGhld66CY2aQ8xkSyy5PGbHzrjJvW5vaSegHSI55GCJvu/XCJBcNIiVfMwx8bFZSpQEanw0PDWrqItyw3WjtB7QZykYEhaclkM1kTQyVIrVIv+od1k1a5SbRm0nZJzdDWco3SS4/QqBwapDmCjUVBo18vi8IemQhWhhrhDbGyLymiw6OwSIzbFuRIRHUoBySPENs7gqxp64dk8P1Gc9BbezokotuPG3Eqfm37RuDAaCgp4supf5aCWeJ+pC/SD00zyVJzArGXncy2RhMMJoWUTESqYKTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB9001.eurprd04.prod.outlook.com (2603:10a6:20b:408::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:50:02 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:50:02 +0000
Date: Tue, 6 Jan 2026 19:51:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
Message-ID: <aVz3Q34/nchMuqVX@shlinux89>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-3-nandor.han@gehealthcare.com>
X-ClientProxiedBy: SG2PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:4:7c::14) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: d3522232-df82-4e47-fe28-08de4d19b9c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QLMWn0SoSLr7P6Omdu1Z59h7WWhbd+pcXeDTHbHBACZssZzeyd/mkSqQmYS2?=
 =?us-ascii?Q?M57rD85xT49R+XuC7DYVNQAIdiBnp5kGMJepr9tvCLBEmO8LQrRNf8l0qAQp?=
 =?us-ascii?Q?Ya4NendRHWfCdVt1rikkZzd96ITj5e0EfxnXwdlp48iOcKqzGHunRBj9/5TI?=
 =?us-ascii?Q?2hCBFH0doqsmB/553T8Eb5t+E9wlH6oux4b/L251qPXFHrkFPWmq2OHA/cgQ?=
 =?us-ascii?Q?8zg8x6DQNrP6HI+R0uVckcjHgTEmDztBnw5VlqqiNq5JybQbH3E8JL3nUp7u?=
 =?us-ascii?Q?/7+gDWwxcVw7GmhJ256MrllSGO+IpXV6jL3T6OKZa/D9jaFUSUxJSKKFyVyS?=
 =?us-ascii?Q?4duCWpW/e1llymmucIitoWBfb24VMdh49PmmIYvXRQ8edSELy7a0rZtZUzVO?=
 =?us-ascii?Q?h7j+7s52Cb7Y46ZSuxw7lZAFyzlOufqNSFhEAoUk3IyT2hh7asdW6sC3erI5?=
 =?us-ascii?Q?OSjJs029lWRIRo4RwKcu5TS8vjw+bQFScJ5ZR/m9nO76T2gzyRgZZ2hgQ2Hx?=
 =?us-ascii?Q?mfwnCCObOhs6/9by8zX9AFeW1m5zweWZMdWbCYPZz32gsgMxd30ougUJayOW?=
 =?us-ascii?Q?H8bLHRWI4psCuHwPsZvAzHfxBtsYo2G8GrZlIEJM3dKRqntBLgg8ELwTKVtv?=
 =?us-ascii?Q?22Wdo7Z5JrfNwYJg+4jvI0Bnyl4zDy6uqCglhNaKV57I+gNsKfeT6+j5upUr?=
 =?us-ascii?Q?lZoyKKsyOPQbMbczz1ESQE7u6l2LvhQchDdp45a88Nwlf7HyY5zCjv+HqVWL?=
 =?us-ascii?Q?yakSNzPHEYIYO3BWTAL0hlUeOWVW8Kr7I8mU9GoOhEgFk/7DMVFFf8Vnst78?=
 =?us-ascii?Q?h1PbZ8pTcZEUH38eGuEkpq2sO53J5vINwj3QwXUlMDrt4uRKB90aoHdz0Nus?=
 =?us-ascii?Q?5k8t+dn766iLJAxivOgoNfpsc/qEkmdU37/2AQsxMyAkRksUv1qWrJuhwDKo?=
 =?us-ascii?Q?nEiAV1wK+7voDLRMoA7RQQR7HiUX+U/Qw1NLK5SAEGG9K5Aw5aoWPDmk+Zoa?=
 =?us-ascii?Q?ZYoMqgPwykeOe8T66/rlHbr6lAlYDtaeCHbkKSAt1e3m2eu5AjAPaX1CsUG8?=
 =?us-ascii?Q?o7Eq3B42pmYcT/Iy2d8fgSnDtlhMeIRGQOxSgee4MEJGYQ1iGNZ8R6ebS4qw?=
 =?us-ascii?Q?H/czc/HFtL2GvdUwVNxouf8Jb/qiqB1fYMMPHiGaTAGyr2nVUFQGqB/HcPBa?=
 =?us-ascii?Q?eUzWPCf3a8V6+0xiorvq1/ijAlfIWWTj4iCNzOOfL4DPc7aqz+NIppwCWirf?=
 =?us-ascii?Q?/ROhFpjsK+ZMFq1P7AyE8Ym3yE06dZy5HrydBat5DVIjd7d7sqOWEZvryNTq?=
 =?us-ascii?Q?XSfVI36y6P/BqHdoDx7I0mkF8juomGs3eo4zj6vUM2zNq4PrOb5e1PGMc0qJ?=
 =?us-ascii?Q?2IfmwF4MWNflenPJyIdKW0fOeDPi5B7tApgK8CvK1x39v3xxCwjCL9lh9fpG?=
 =?us-ascii?Q?NU+We8X6yWK93yY+yOAMK+P3w5MqFfmyPpbKDNR42GqCRYH6w4flInZ8Tp1T?=
 =?us-ascii?Q?nAeCU2bT1ACEOQC4dWvIOuxQL9Vu7yxqeoK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b+E3v7owQnfuLNa7B5d+crKDw76Wd3xQWR6giy4Wkp5NBZqUdeto4UasoFvt?=
 =?us-ascii?Q?zsCkdbg4En5Hqv85/JibG9+u5qoP4yS3PUxM0bsrP7acDBNZ1/8TM+1NDGcA?=
 =?us-ascii?Q?j2K9FWX02qE6aBsI0QJlqnnxqWneHFj5lYTQlBusSJbLuFsriA5fLbjNSP43?=
 =?us-ascii?Q?QX1EFw6Zo7lK5I503uvaWmz7ZigXtIfM93bUKol4r+ncAu2qe2HqXQ8uKaJx?=
 =?us-ascii?Q?ZP+X+upyjJC09yLDqnj2Q972CH/lp7MJTVme3K6coxlr+UhbYUakA7ph1fWm?=
 =?us-ascii?Q?lneK8VMKzCK6F2N519eChgk81mIphcrF/C7Je2mchctHNSB+cvlIlYfF9akP?=
 =?us-ascii?Q?mlSdio+hUGPuQ06U8dLFA5aoGf4hwk5rVQLFcCgCia/vWevCfxiewVWs1M5W?=
 =?us-ascii?Q?9Y7JAU1l+gsxn1GUvydga7iHv9NYpBvTAZAnXWT9K6v49+98ziAoIqhf4n1p?=
 =?us-ascii?Q?HbfjXgG9FCuPdr30XG/mxmAZbbHfYami8QeOGkyHx5hSDIoSOoTfH3RjpCZK?=
 =?us-ascii?Q?VS6W8wDCDYE7CoBRR0Z1FvkBqEQOq8w4cXzbT6CPC0fvShg5OuzCYkQHb/oo?=
 =?us-ascii?Q?3GOgzybj25INjNS6ggEzYgaoaIMGqT5O94HqH0K2pfpBcQOKh7AfFa1SyJqO?=
 =?us-ascii?Q?gjQsaoVmZweqHrguEIEef2o+RePYarxS2G5SMXX7KcYxpTOgI86mfiXMO761?=
 =?us-ascii?Q?3zdYJNwj5CMJnw7s/3yalIoikSzeF1L1SnULyZ2C/esYfIWkdOxxPjbdWt1W?=
 =?us-ascii?Q?4rKgpWddSc60FvG2G3PuLmQuGDYjpNc/y/CY6d9hltTgF0WRNfY7ec/yI9oc?=
 =?us-ascii?Q?+SRV6qthQmnXHOImyd5494LhqJTX9Ljuguv0tlK+uDA0Ewc0pbSSHGYr1w2l?=
 =?us-ascii?Q?8mffjDcUTRw8u0fcxWjn6u8eaffBrdZvJCxTOjF3Fx1SZ1pYMDrMjU0m84zG?=
 =?us-ascii?Q?IDBmUrJh61yCG2c6FwYXFZ/4wnnL/R/lDonFszxwYn9BGBhmYZgF1D4WimQY?=
 =?us-ascii?Q?d4VxEFEeVkQQKGJCkszyLtrw2Xwd6t8J5Ma5r2xxDzFAQVod4sFIBPlX5Dc2?=
 =?us-ascii?Q?QzGNlRcqWesiyaOrLXiib7rppPxyKx+CF8ilSy8oy3l7M/db4CiTRibhvc4t?=
 =?us-ascii?Q?UYJI8mkB5PZeleT792/VorwAKUys9C7FHNtRHkLui3QCa0IQ97+7jKaiaRSV?=
 =?us-ascii?Q?nBw57D0NhYv4kPzYm8QstDvbAT2diU6Pybs2UP7lZcAWlFDe/QfAEI6K5XMB?=
 =?us-ascii?Q?c2GFixz2v8edKdmjPhTsU8UE5kUsIzQt1bRIj2zXn//6ZdjOK/AqnGk9alqj?=
 =?us-ascii?Q?tkcvzbsb0K8JY56cu7WRxHSRNl5wvatuiXroJCbreEpxeKYVlIkRzy8RpB1A?=
 =?us-ascii?Q?/t5jpAcnYuRc174BEPOo2n2TBCPX9ee6AzOMir3WUbZ0ZSEwkcLbfwdyw0e6?=
 =?us-ascii?Q?fNrTTwk4tcVsA/gsgGj6MLH5iwP4fhTJVXGcOLxFGqOymuOucfgxql6mdmZi?=
 =?us-ascii?Q?AT5pSmuhowTGpFSP5YUpJ8UYx0gfXNDyWTzdX5Kbjr85JNV6DdNzJGRO0JX0?=
 =?us-ascii?Q?Gi+pzQnXrMiHeT4gG80MdMqGI6H19jBE9/Mu1+vmjka0MRwLgEXbtK10gjyE?=
 =?us-ascii?Q?MK2RCbfTGwn2fwCvo/1Bs5tafHffqHC+6V4XKg66uujOBwf9GzWLozO84N/s?=
 =?us-ascii?Q?OjMnOuy/HLTtJRrktTMtlfOamL0TKMwi9Qkm8RwYMzDXj9i7alEkCjWkT1K3?=
 =?us-ascii?Q?WgY/wlPPgA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3522232-df82-4e47-fe28-08de4d19b9c5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:50:02.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUkVdx6A7gK4Ir5j0rsAI4EyX8SyWEsrE6Qc7SnsmZN6gvAsg/T5hb8StTfRMZAo+C3Vq0xG4vThfy4JTGaA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035008_355344_E7A9E76A 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Nandor,

On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>running in low power modes (STOP and DOZE). By default, the watchdog is
>suspended in these modes. This property provides the option to keep the
>watchdog active during low power states when needed.

From the cover letter, I see that system should reset if runs into
low power mode. So your system are not allowed to run into low power mode.

If my understanding is correct, DT property should not be used.
You may need to use sysfs or module_parameter for your case.

Regards,
Peng

>
>Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
>---
> Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>index 34951783a633..4dd9cc81c926 100644
>--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>@@ -64,6 +64,12 @@ properties:
>       If present, the watchdog device is suspended in WAIT mode
>       (Suspend-to-Idle). Only supported on certain devices.
> 
>+  fsl,wdt-continue-in-low-power:
>+    $ref: /schemas/types.yaml#/definitions/flag
>+    description: |
>+      If present, the watchdog device continues to run in low power modes
>+      (STOP and DOZE). By default, the watchdog is suspended in these modes.
>+
> required:
>   - compatible
>   - interrupts
>-- 
>2.39.5
>

