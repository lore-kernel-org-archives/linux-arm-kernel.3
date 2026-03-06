Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CCCF513F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 05:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=; b=VaU94XPZrkK+ZZ4Mcpi8HICe36
	pmm7HU55jdtbIPg81IpaMNqXX+cdCpjj9awHlxzQfDJRi+sDfPJEKhUKmJFgRnFIFVTKByWS3fPBh
	vfeWejtDTr+gl5vKoLxrZJ/YPVmq+/rrnlQbuTCBAg/qFv/U/k/llbnnbmux/s59bI7kWFXzwGyFg
	PmpyWm42RYk7hDVGf/4VnQj7/V9+uJKMWLzfCIAwROFbFxoBc38326kNMz4LKBPziUbWFy5k747I9
	vKoAaqshPhxEkmtSxX4IBCHEIzdEIDS1hvwj9HNe15MvJ2uSIbLd18c0cgvdepGno+mD9Cc/xE1kK
	2WdyHkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNTa-000000031uL-1CIZ;
	Fri, 06 Mar 2026 05:11:50 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNTW-000000031tg-1JQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 05:11:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trlOvZZMCD2T8k476KhWP9JnNlbr2Y7cwRlG+yis5IEhNPZJCKUGWeV9Lxv0bJAp+swFMokB9snr23HEM0yoXDHy++gv+D/ZoHRLKhRG9lPk3IjZaDnT0TipY1RwZpMkUuie+Lle3GDBSPicOkI3ZoxtZN9OxL7NNuOOWr1BfjgHT78VYpVLDDZvY70Tvdsutt45a5X0LVGmAkS8gMvrqEhq0ui0sWx49qm07iFJ5oYIKY0Os8Ip43pj+uoggVQSMXQ9/UojvK97mPdRwwUI7ciVY4mTZqGDwd/pQTTNMUNTVN17eLt6OhrxqlDHSfPpcOH0hbTZPQLzyjBn1KPvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=;
 b=MFddHI3iYwlnPNNSVEcXrCgLkF1mPL2tv03S03z12AtEiff/u85ep4jj/22lDDdiLOpOqcbpg/u3Rs8CHUsnIBUUanzGe/Nr/T6aoCjW3jv6RVqIrFmc3+4JzxuhihvyilsOkr+IsseqSv9e/JVtrqPJri7yugGcD8JyVkTuhiYfFVA9STSGPOyOpVqhFJChRtDgQ8S9BRWo/9XQ2cZbHqB0kRYK2V6KFh6Wb+OVav9lzZSDYp01O9kqHmLvju5+V7srParvXMT9dvEO27aMMC/RepK1efUFr/BYhLWhZPfuE8Ewp6a6XVXJ73CgxMNPvbj4GY7ooYJRy0YpjoFxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcEYRZH2RMrrW3PNhsBqGbCri+MpM4umzULhC0iQRkg=;
 b=KIUzFp++W9ae9CcK+6I3QGRAs4yq2v0XM0epuAMZY2P+zk0q9RU8V75frxMxSNjsbar5JCezdclprBOC4qqunGRXwKNawD4okxbBP+FPf9K5+FlwrC/rKPGEL9z7LduD2Kc+z2Ct7wBXlPoeqUjBMVkRm2EpO0+nexbWdRvOyN6U1titdcHVfJ19KltW9Bbjj+Y2jb5ZHDK/ZHNESZ4wiY65YsihC/B8cV1upgqecjGYLFDJNdop8Dc4fXXXrKFI5xgWEW0pwsNmlDHclTLOznguzKoJ6Y0xmgEQhsWj8lFkIQo1k6ZrXVW+etJ38ADdhjbfCldaKe0FDeW1d6N4Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 05:11:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 05:11:41 +0000
Date: Fri, 6 Mar 2026 00:11:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-hardening@vger.kernel.org, gustavoars@kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
References: <20260306044536.149204-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306044536.149204-1-rosenp@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcdd044-035d-48ad-04c2-08de7b3eda4a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: S8vJ4F/ay5PP9NRFoylOv1N/zcNytpXJMM5N2Y6PndQYft757qkMA4hzh8eAHN+oJxG1v0u8g0o4o7IRw5k/lu52zTCczc+wRgHf7yjeDyYt4igRBj6jezeHZmOxUgQBQScVX4wCIWXj4Us7ps+HBtnZ1llxy1dKildfTWcMe+TGHnp14XB2b8ESIGI5mKF7fhU1PHq/fR3QtjiTggM8RGYMKnYD54eXDetwWUTIUJ6Z5xMg7CvviKBIOSrZuntdrN6YI9+G+Z/Umb+hekGs74+WspcmiAowgjaJMcJKd+DL8FWzLbeTNDFtlsRM5XgtSdIeAGBBhfMu9k6CWEvIG6JSYaws528QzlBeCjN0kN8L0Gj0hBnKnkkNJWY0S1ggJF81nuE1gmclFEEnJ0XokcZlhm3UK0vA4c9qa0JvIK8ZwEMsyLtk/oXV2/rC37jlcy5toUHPjwboWBmXgjEuUbWCbPr2X4NMIFfRVA6S0f933DjX9Pt+QWdJtRDc8vGBHZJzUscDGSUklQirVQ55IEtpVtOy9MffM3n/WTcVd2/R/I/Jzutbz9VYy29o853+4BS9y0vdSpQjth6jdtsM+aMegInPenuJ4HVmGBj4vB/KivYnlNQNo8y1sI+SZ4ETZBnGIhUPSAjmqHCMj3UsTP5TjP50sBF7s6NALRPeKIJYvQvLYf+lZMgGK19+DJQpgNZpnQ/8oMes9aGYFaUFQFIIuZkWdQ+0hsnvFoXGzqm/0p8Px5YEmoAW9aRsIolJ8nSsznCMGEzM9jC5q813Bg4s1yQkQzNVY+TCYNpRsQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IwdraBSgAXj6t/rtmj0jl26R7XtbX8N6ZIZxdjosISx5rj05AatyzE1YMNFB?=
 =?us-ascii?Q?lDIKu4P9WJkUrGr296//rVUM+uXWtKEfB9lsfAN4Hqq9GOazKI+NFkClQV7U?=
 =?us-ascii?Q?cZguhaqnzL1Lwfsd6bxJv6n/k2J0hPbHx+5VGBzJRYL+3LLDUvIMVysF6E3Y?=
 =?us-ascii?Q?WjLuZDpJGTVG1Dg5clLEW9U6d07Dd/NdILZ3mIbh6W5RnIRnAGsL3q5GyWBH?=
 =?us-ascii?Q?rBSq1u0/+or2eHYGBg+z4jc7D+Vxm/qI+41/44syMzq+8YUOa2ck6tuCwQgr?=
 =?us-ascii?Q?GjUePaRWgwx0jQLAlv5uKCLj/N/5Gcb2u3TJjG7oa/q5495a81muB6avAiIg?=
 =?us-ascii?Q?o/npw87aWqNcpmjMHOczYK/K8fBrI9VaRnmCy22bY8DHfTEKCpsnOD6Mxx/I?=
 =?us-ascii?Q?QVMvw67ixQgxgl9Q2vSV9JPrRvJpEMCT8X+bjaRFxfj1F6weD7exOAmt/IcL?=
 =?us-ascii?Q?QkmrBOaJuheYN1Kg2f5nNhfs0JLZP8zOy07eUUaWvsx7xlPE1/yZrTQsn3wi?=
 =?us-ascii?Q?8doPEC9tAsH9Sv10alSATlE4hScs5i6/fWGvp+mmEABbzheSFth0iagHh3YB?=
 =?us-ascii?Q?1JSD0Z1JEJ0xc/d1JDflC7yM6yBNwrvWcMgzXzyZGVUlrPhzwkOMtGKJr/8K?=
 =?us-ascii?Q?xpMXJoSG0yDKXBC3qeZxt+4EKioHNY2LAZDz+rj4vqKGmYQwhtriSkKXiRxm?=
 =?us-ascii?Q?sjna7exKPmyk6vgBwWoKzaJLjykkFZD73sByxyh+p4i9RhCu8ydNghqEN0kI?=
 =?us-ascii?Q?nm1wCUuiRLyJRw3IF1k+C5VK8lFZRHwpnr0gKAkte2PMS6yVPujcEKU2//M2?=
 =?us-ascii?Q?w6JJ3eHuEX/Z9dC5SO4aLRn1GOYAFngzzbJmvevswfwFnDssWv7cJjimRiDV?=
 =?us-ascii?Q?+kO28Guhm8ml9hGdxaMIWhVpMeYfwBKePXCl7nHW+FVIk4UjCPSlb3lwlRI+?=
 =?us-ascii?Q?YP3irPWUWS5obtWTaKuU9lsPW1LS1UQJFQSvGjwhx0MUVCY8go9b/Jo7Zu1K?=
 =?us-ascii?Q?Q//kVR2zXi5MdlHGTrUmRUwEUdlNDVKfTTGQFvlMEGKOQViRT1AqyGLl1U5p?=
 =?us-ascii?Q?PaGi96I0ecYMDmUQxA8N+2UVlZDM+3S/ttlQoGGprGsL5B0KHSqSXf+M1FD0?=
 =?us-ascii?Q?ClULdpdQXn6ajr+r2AvLelIgis2omTcKYBY4xEb0A4KJf15Vfcf20Z7toRRl?=
 =?us-ascii?Q?36Z6CD8+GOONkAsLn9OBBbsAaQI6pD+i25m97FFrpKtUj2zKRb0M9dPaDQHX?=
 =?us-ascii?Q?rsX/3Rt7zXC0xshAi8E+o1hAgwPzeoH9eYLxZWwmaOD83p9Dewc4W6Dg/Roo?=
 =?us-ascii?Q?HwzWpWJy0j8m3HNA5ynkl3jcIymF8sQ+Bwg7IFEgv5KqG1/vEdlf4XoGymSf?=
 =?us-ascii?Q?VlN2H7pmeqa88b9hl83818297X2U6wqsAluOZjzI0bZz1BgGw/6RzNU/ipEJ?=
 =?us-ascii?Q?6BEf4NRpQv93cnyg/tG1jb6Vr3SGCcxA0t2qIZzEQ5QY5e/1C0cxsSsxO+9e?=
 =?us-ascii?Q?zrhBXkvbL4pg+jveBC3PiViqKt6lYvtvMcr1NEFkHVLMwm+qyfuEyx8F8Nlh?=
 =?us-ascii?Q?zNwn4eu2i4ti3rSPUTGaP9fqQ98D7b3K9KHI03BkcphUPP4G80zGSnjW9mtp?=
 =?us-ascii?Q?I6q5mwBLwIHcXk7oQw3QBCpu3CJc1NyuVke1dNqlaAVQHaQVwAZ8jdKZCD+b?=
 =?us-ascii?Q?RPUmfu/j7aGeNzph7Nvy8msPAeVcWD/SyJKSdhOSARX3D16aZufc5f9FX1sC?=
 =?us-ascii?Q?YgotL10GAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcdd044-035d-48ad-04c2-08de7b3eda4a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:11:41.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy3YCuFsa5s/TjVNxb7smKAIwAakUIy7zznKVqyG2S6kQ7HRahEZLCGIBeoNC0RI7kVHG5U/WOdboCZjD0HMDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_211146_366912_DEE82779 
X-CRM114-Status: UNSURE (   7.29  )
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

On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:

Subjest: use flexible array to fix memory leak

> Use a flexible arraay member to combine allocations.

typo arraay
>
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.

Remove "It looks like". The pipes never ...

Because fix memory leak, need fixes tag here.

Frank
>

