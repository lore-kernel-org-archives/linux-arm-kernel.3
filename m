Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02476C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK5nORSKpp+Q+yRq/n1QoAIyGdJGibF1L7VW7YqjKpg=; b=3QNBthcl6PIQSuBaMLJtS4s9Nx
	jFgcP8yhdT1DMy1zPmsxKAGtpc2w58OeROB9ehDsMmksyBcyaLHqj0kf390k+L51z/VK79QnozapT
	ccK071fPppI1N9FOqwq7nJvezwVi3BxVqJngaNgbAIbsPONwk1stqlXJo6Wgf4b85LbiRfk7vJtKa
	lU1kP9XOL7SiYA/GqShX1m3K0r0XIa1ZSbc7f5Yg6STLUQ9UhhlPFAsF16tOngHc3i9+OThTeG0T4
	MgOEOAR7lcAmSXN4cAZBII5yUv/FdrZJ3eJSZZSwL2sDQDO2F9PrL2RHhktdo3IQ0LjFUNd/vcluV
	2yMkMrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYy8-00000006gcg-2GbN;
	Fri, 21 Feb 2025 19:45:52 +0000
Received: from mail-vi1eur05on2062b.outbound.protection.outlook.com ([2a01:111:f403:2613::62b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYwf-00000006gOd-2GQp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhgDE+iOZsOQTJVLnZ5AAljqddhguVaNVqApv5W0EIiAqzza0d+HR4D0v+R3bebmRcwfGc44jckKiBMr1qj8cR2nxvC8O0SxLKX1yUYQzaHN18Q89kJ+9UA9yDbweGQpiUNkLqRZ4Bfgn0RvQWMkRX1LSDja0BLFwBShqLLvAHt1ORFB1tVsFbVaycQKhsHAF8MBn4aPJYkc7Puxdvy58GZLhA+fE0/ARnhCSRl3xMPvVeBR/nbGwPsWy/U1UXKAxJuApQ4nq1T9F8W+ruFq2gTezzvR/JTpBlDcfHIj/MjcFMFb72LAas6yOe0fCJ6nylY9Ssl2E7Q7xF06WUqySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK5nORSKpp+Q+yRq/n1QoAIyGdJGibF1L7VW7YqjKpg=;
 b=RWRjtxSuxQhBzEY3JQ/TY5N/d+/HbYaOerDpQjdZNf1FeB02tGdSeHj4t5AOqXbLak2jAM+OnRkCH51VJQ4NcwiEMdfupuAx8+x0Q/TL7sZZn2yIhVtHYkUb2yefQ/vkyF7KScT+6j4CRoJ6cSlxz5oglQNMtqIcNFt90mKPIhfRbruFiMlQO+LGYAaGQZ/ZlulE7Joy/kCEvniTVRryk/D7k13qZ4h2exyclnUpcEchlvCrImMHoox6wHt7ROVxbDpQdfsgRFVq6W2x5mbGN3rgzAHhtCMb2Suz4CVKmX9AOGSVf3XnGn9zalbH84lohIKCGFnvcaoq9AJIpLUf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK5nORSKpp+Q+yRq/n1QoAIyGdJGibF1L7VW7YqjKpg=;
 b=VXp4I+pF7MQRM+e7BshYQ/zqhlgkGlMHuUxiYZGpimYsTiSGM37zTh87I7oexxML5fSKexz2Hrom9i+sRKQl9TI5pSZ+ON4M6zexbfw0YROfwWpyytOE675KfRmKopx4fyBi0UbK949M48byWxbAYTbRSmqgV3yLS1R4pD5iRuD6vVhckO2mmDgLP/OtpmDTlB04FC7Lc6pCE7i4sA5tcizSAVFiBNghfGwBfuvfEodFuDxnkzh/WT5iRD8zdy/uhKzmoFp1YPVXM33kevptky/Yb9oiX3A26d4rYdgqDnO9LVSDQTTRprp7B8VxXV31kYryeenOXVLiB0qEqBYIkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10905.eurprd04.prod.outlook.com (2603:10a6:800:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 19:44:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 19:44:16 +0000
Date: Fri, 21 Feb 2025 14:44:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Message-ID: <Z7jXiCSicgBS5wsy@lizhi-Precision-Tower-5810>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10905:EE_
X-MS-Office365-Filtering-Correlation-Id: e40cb35c-01f3-419d-b07e-08dd52b02046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EA5hB1WTakHeYru/4xeIy8Y0hdTwqMjQJbqFTKdk17hhIyww59WfJScjo5oO?=
 =?us-ascii?Q?fyQh9fAHfrZSoi29FNxD5A8GsGl20rJDMSvboPC0UbkGVSJtwnLQX9B1Jsz0?=
 =?us-ascii?Q?OQydiZPR4xR+apOHEV3V6WBKKqMa5MWWwsJ7EDd/3C16iUQx94TJ1tgEc+Se?=
 =?us-ascii?Q?mQcmfMTfwIUz3ztky37pvCJV6Kg8PEvIf311Gkf8YJpQ0Lov69Ezo2GD+ozr?=
 =?us-ascii?Q?UIA2ZWUcL4X+0TKLnOaadNNSy6FquIoVFcVjtfiwyv54zWCT5228DAtj3nU1?=
 =?us-ascii?Q?SySlkyb9eaQtjTnaGElRfxVb9EpT5K6ebzBuBix1Zn9V6Lclf3Iv9OEJSQfk?=
 =?us-ascii?Q?xzOurxjVtAJ/p4DiZp0DqpJVclda91FTLD1AcG20XvzDtZWnX444gVUQXBVp?=
 =?us-ascii?Q?n2PTQ3mEHQynbxsQ6ThF4OvAFXo7rq0eMY2N3RUSGY5/8Giec9HGbNZf+oU+?=
 =?us-ascii?Q?4poGGEA/2y3I1iQnfOPVRkrWZvHqMS4/vWN4N75KnOWYEyKkC2Zoa0tdOxiF?=
 =?us-ascii?Q?Dyk4pRryDBUP10UpvdFNgBdbGBl/8EhhO7eximYgc1ozS5TA+pzQ6jfDwWMG?=
 =?us-ascii?Q?plf6J9UaFtGCpxy7q8Ho8IDjA1Txy0WecFco2MQCyF8mlC61iGXQROVhunDl?=
 =?us-ascii?Q?H7tRCQr0dDbRWEvU+s7SXFrr+kKfMtjyGKpCDKjPNlT9B3Sa1TZwBvglvXu0?=
 =?us-ascii?Q?ShUkGKBtNcqVHYrzG4POTlADl30bUX+soarp+7QiqoSAXZk21Ic6uL3Cnmo5?=
 =?us-ascii?Q?BlKSzQwTa/ZKlzmyj+esYHlulvWu/p7RMzR12znT8QFM+3r12I1JaWMyZjvZ?=
 =?us-ascii?Q?gXMBTRPU87OPx/OrebUKTYZkj2SOzPxuKiy5Pq2DIww+42o88Eh25rNDePQn?=
 =?us-ascii?Q?QBAA499y0eDnMsh1aTrjgibOAD95r+N/+NEsnsBZWpb24YdyIp5HQ/VCpIWb?=
 =?us-ascii?Q?Km5a8oXlGlu7fuvoqLnNsmvWGtvWnwiEQb/96pn1nGTK+02coj5x9MA3XOK1?=
 =?us-ascii?Q?7Cl0Fiihr/7gHc+mII/ok+z5oe1neyJ85KtdIEdA1FFxLYsLO5pC4AlpMp+s?=
 =?us-ascii?Q?wAUNLu/YItv9X1X1ICob67iCnxjHyr3wlPKJLp9g0cWiSD10dr0pwoSMAbd1?=
 =?us-ascii?Q?Djg1mEB59JuezY/LlXrsoFXHBBKy0o0t1O7vxGZfqDDwNU8ZT8ArV8Kfpnr/?=
 =?us-ascii?Q?OSlHIyVB6s7dS4U7CrVMFlqAoxEyg8u+Pu/GouWG41eEB80xdmecGrHJH18K?=
 =?us-ascii?Q?Q4KwrT/2DRijOlmuT859Ox+y+Ha+pfHPsJh7W0dLVF7STEgdrOybCHnCgcVS?=
 =?us-ascii?Q?phqvPRWGWca6PP41ucQPrxfd22HtvUQ7lPzsUyVudmBf2XsTDGtQJ1uJ+Y21?=
 =?us-ascii?Q?BIfIeFzQnSCReP7hUIo0Tsg7+fehm19L14DiQI7Av67ynsnGtJpQs9SRgABI?=
 =?us-ascii?Q?BICDenrV1qIdVP0F5hVjR5c9TocV/RO1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q79k2uI8QJB1Iyvju7b2G5FIQI/2zq72S2XBkZu0A/j3MGDUIctVtFGY8Ogb?=
 =?us-ascii?Q?0RPcBdE9vPjanpNx6cQq3T+2r3uglHhq7Bxd3kq9xqTVQv9MFT/pju9sF0zt?=
 =?us-ascii?Q?lDIzEAzR3X9Gfrh2YDzZNWfnaJunMtd6X2KgR5DjT0mT8/38IYRoEPjgJp9v?=
 =?us-ascii?Q?gyGVXhK+M8pAMpQUFLVC01msIJclfaTNjt1SsHo6GE9KhW3BCOlhHlEL9ZSN?=
 =?us-ascii?Q?OxtlaRN4QFtDDcxWUuH1BvAM0x+BXys22eTtrZk9hfpbtu3Rd5KHm1bfdoST?=
 =?us-ascii?Q?339E3dHQS+ET1yxFekmsWZPk2xFvqKl/t/at4erttzyqVmCFBbs2PEAimHPy?=
 =?us-ascii?Q?V+flbrnr7SmqaepLmXbhf1uVBjzjOMMjOhc25XGtUES9TnXXCiukHHk29gTf?=
 =?us-ascii?Q?YGgIEbSuwAgQT8BHHn4f8HapAQCT59D45EX0QWYeoxnuurzvPSeOFcfZt8+S?=
 =?us-ascii?Q?0hXyEhS7wU6Q17QdqlcCg2zptDDbuAWNfEaYAo3ca7ivNqVUdoS8yjmKzm/B?=
 =?us-ascii?Q?grHR4VCtk4D0XuQcpvleJQIEszmSprKkDKgQAunBv41LpApZcX2wAJEzwxrO?=
 =?us-ascii?Q?A2qXYiNWZ8zYeYzO5uYKF39ktEaHOO2Ph7q68HsZypBuBD8YK9+5CzaDflAL?=
 =?us-ascii?Q?DF2qOkn9QDuaFWzR26i6QcpMQDBDUAGG1Wrj2jyO54uL52xpMCQgTI01B9gP?=
 =?us-ascii?Q?EJo5wgN4nQT+JzKovZ44YG7Up2xBOChtxHgVI4UolLI4IIVFDSqwUUyxTIZ0?=
 =?us-ascii?Q?p6B7rcRbkCB9BmrxvQp0HNYTKEY7EAC1Y0ppB1irV6f80HjBHxiAuP6y3TcH?=
 =?us-ascii?Q?fgSdGTkyPs6R4MwsftdPBcZSAhrbQVr+HxHaQW6BMQ/p19RcCEDs05yWjEyA?=
 =?us-ascii?Q?l10/zwwfcawikgtvh5y6RB0SFbC6yVc7ZsIqlGWyqqmzJC2EB9V0TrJnG5Ml?=
 =?us-ascii?Q?JOeCVDc2r+nuKiAzL4TTA7Es6oCPbWq+feP3LXtG0ON/Yd7t+c7Wi5jtpxMG?=
 =?us-ascii?Q?Zw3IHmIQrgyNBIFXS0a5fhCql3faOeSUovyKdHbQ2UA7CKN4vDdF52VaL8Jd?=
 =?us-ascii?Q?HtbNEpOGShsKVlA9bt3BnmKW6qOS2Y2/RpSRcx4fN6mTSb+FSc+XxkL7aWw1?=
 =?us-ascii?Q?cuDdYUT4mJcq4uVfg5UrkbunJfqKSUSAzxBqb3u4Ss4hUdfEmYIGanurwq5m?=
 =?us-ascii?Q?kp4Xdqp2mUEPXdSqZ/r/vuZa+qWbYkrxJS2brW/tTuopucGRaPlaFlIH5my6?=
 =?us-ascii?Q?+HrNfRCAUVP8X/MhvaxvJalbSuxMaP6S0wxj10imReFG1IOa/Lv3aeGmjyFn?=
 =?us-ascii?Q?+KsQeRmYTzu6yMleiz0Dn6ngSn+P0Q3zNlfbzvgVDXkEcmSobctOTNJ3FL6M?=
 =?us-ascii?Q?AbAnotMwmvsHipjDgl1cu6TLcNBwuEHLyaOEWNsY+Iblz0bliFgYxRElthY3?=
 =?us-ascii?Q?Vyws7iqXJs8AIDRsS534me6Q9ho/Ag5hIJhv5FspdkWU+raW33CgBcWLido3?=
 =?us-ascii?Q?T5eWeiQ//KVW3rm43+/b8zsayceDyedEcFYAaZ5nJZk/+HrG4lLWGAdSsJa1?=
 =?us-ascii?Q?z1VHJBk1X6nKyRfxAcjNBNKe8JjGRdmV1cMqIMSL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40cb35c-01f3-419d-b07e-08dd52b02046
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 19:44:16.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwhRxVua7CK54wGVtUWJbHmxoBCY68D9XQZWhJ0bVjib+9L0IdzqVga205PidgAdaYHed+aiv35spjpnn6RTlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_114421_581376_C29EB017 
X-CRM114-Status: GOOD (  35.27  )
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

On Fri, Feb 21, 2025 at 02:19:07PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
> configurations meant to restrict access to certain peripherals.
> Some of the configurations include:
>
> 	1) Marking masters as trusted for R/W. Based on this
> 	(and the configuration of the accessed peripheral), the bridge
> 	may choose to abort the R/W transactions issued by certain
> 	masters.
>
> 	2) Allowing/disallowing write accesses to peripherals.
>
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.
>
> Note that some instances of this IP may be tied to a power domain and may

Can you talk about detail which instance will lost power?

> lose their configuration when the domain is powered off. This is why the
> configuration has to be restored when the domain is powered on.
>
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/bus/Kconfig      |  6 +++
>  drivers/bus/Makefile     |  1 +
>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 drivers/bus/imx-aipstz.c
>
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..fe7600283e70 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -87,6 +87,12 @@ config HISILICON_LPC
>  	  Driver to enable I/O access to devices attached to the Low Pin
>  	  Count bus on the HiSilicon Hip06/7 SoC.
>
> +config IMX_AIPSTZ
> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
> +	depends on ARCH_MXC
> +	help
> +	  Enable support for IMX AIPSTZ bridge.
> +
>  config IMX_WEIM
>  	bool "Freescale EIM DRIVER"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..8e693fe8a03a 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
>
>  obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
>  obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
> +obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
>  obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
>  obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> new file mode 100644
> index 000000000000..75696eac8ba2
> --- /dev/null
> +++ b/drivers/bus/imx-aipstz.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define IMX_AIPSTZ_MPR0 0x0
> +
> +struct imx_aipstz_config {
> +	u32 mpr0;
> +};
> +
> +static void imx_aipstz_apply_default(void __iomem *base,
> +				     const struct imx_aipstz_config *default_cfg)
> +{
> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
> +}
> +
> +static int imx_aipstz_probe(struct platform_device *pdev)
> +{
> +	void __iomem *base;
> +	const struct imx_aipstz_config *default_cfg;

try keep reverse christmas order.

> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				     "failed to get/ioremap memory\n");
> +
> +	default_cfg = of_device_get_match_data(&pdev->dev);
> +
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	dev_set_drvdata(&pdev->dev, base);
> +
> +	pm_runtime_set_active(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static int imx_aipstz_runtime_resume(struct device *dev)
> +{
> +	void __iomem *base;
> +	const struct imx_aipstz_config *default_cfg;
> +
> +	base = dev_get_drvdata(dev);
> +	default_cfg = of_device_get_match_data(dev);
> +
> +	/* restore potentially lost configuration during domain power-off */
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx_aipstz_pm_ops = {
> +	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +/*
> + * following configuration is equivalent to:
> + *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
> + */
> +static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
> +	.mpr0 = 0x77777777,
> +};
> +
> +static const struct of_device_id imx_aipstz_of_ids[] = {
> +	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
> +
> +static struct platform_driver imx_aipstz_of_driver = {
> +	.probe = imx_aipstz_probe,
> +	.driver = {
> +		.name = "imx-aipstz",
> +		.of_match_table = imx_aipstz_of_ids,
> +		.pm = pm_ptr(&imx_aipstz_pm_ops),
> +	},
> +};
> +module_platform_driver(imx_aipstz_of_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
> --
> 2.34.1
>

