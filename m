Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D8ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 01:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqoE63KIYeBu+gfBqDGaRh0NS4TOeyDJ7WB8oeFvrcY=; b=BIRic8/oQqE5Bcvj2Ctc8U0boR
	fnNda3BLVaY+oS8C/fvy4DjX+PGPAcVKtTlOIJgFSDfYmmC6FrlDzR87c2aHHslwFiKT3eiQ0suM2
	fmdNEbio7HmTc0xXX+P5cvq1T/XEdJzxcjqTdB0Vp+NvjUGzJ01k52WXchEQo0iD5iv/AZDMWz4vd
	5KUNh79eruAfXK0krMrLklLW9guJHY0DZOBCrukDzyslQmqmIwdshEs7ScBnPMjwvrJPd5jgLXe8j
	DgiCuWPpKAodsTZ0AlDOdrPS9Dhvp9iioWdKS5f4iNtnTVUHqHtkkO0teh4mj1bGYgP0nb36J6/aG
	eRq9brdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9CTe-00000003C84-0Snr;
	Thu, 16 Oct 2025 01:08:22 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9CTb-00000003C71-1GCQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 01:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmvqXM9VnAu2SV6JAHB2EkBfjgm4+nkoxE8AXnQ+Xt1TP/GWa5RAEz+kGwIHV3Vy4BL5vK+M/9jlItiuR/yTam/g36HhlfCmgUekTlwUnLvIJyvO5N1gZsWmqJ9mupeedy5cl1zldmAGkVS8e+9TkfMN99dV9Ad2S0f4tbzkCjbiP+OUp0ls6faNzQFAv/LtwvEP1xeL2K+orgRiUbj+gM5hj96edpMqJy9en+dKvjnZTIfRIxm1V19eYURwkVhTGv0kxER5zkUKwTQE9KiAEx0ciaoa1cZLLQUC2wLvWZk3kHT1hnud3uXnyubDeVt3flCBbJ1Wo6GD6xPLt45v7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqoE63KIYeBu+gfBqDGaRh0NS4TOeyDJ7WB8oeFvrcY=;
 b=RycfwwhNvIqOnAxP2WYSvoDqmHzVPNSA951maTsfjb9r5VrXBHngN8ESj5wv5+NbITqWncM3U3Nmj+Z5wJ3Fhhpmnj2aJhNy84ZlRMmQvO5dBxZ/AnxaUYVwMdHlUEsq0xP8HTDqVCwpOzdob0Re7YwTIziwERRCXbXApqK/Rs4n+026J7VyCyXYhvFoh1bcOD1OibLcNpjuOSoQLwJoJiqYh7tgj30LQCPt9fyItuSvs8syqz41M5ZfYg6SMcNZYMgFyqJ8Z/EOKTSYFmFTwDcj8VPlhMUYQzVuF61IgUds9I/cWDTbdUO11dFersbH93hG3k1OFz6/dDzgIKppXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqoE63KIYeBu+gfBqDGaRh0NS4TOeyDJ7WB8oeFvrcY=;
 b=U8Ao2cxE6LRXYeCUxrASGuh2H85gZl89eLLJ1TFIpDgGAh3tzlSByJg2R3IPNYW/J2MkdCdlOh49n21X+d8W52b3STr8YOcpZVurRzqxvN2gqttqDW9N6QhmBmSwAR5RJ5dlFTG2yCSFXjZ23t8iZTVsra4JwZgU+XpH7sJ4IDu8Fm1uOq/ZPPsdnVPkJ52mb0HM7o2t7Z/SEeTg9io62p+RuvEFwX0ZzCB/exRvtHVHAFnJ2r9WQZpuJ89kZ6IjFwHEsJRsMpEpxph+nIh1yEOnLQI7ZnuH809qYgFrYjoXiPqkVtSGzpkLlWrtf7GXD24bmlVQ7I3O+8xDm+huNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 01:08:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 01:08:10 +0000
Date: Thu, 16 Oct 2025 10:20:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v19 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <20251016022021.GA4629@nxa18884-linux.ap.freescale.net>
References: <20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 37450d80-fb89-4084-6ed4-08de0c50795d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IDwSt2xfDoLB7izH7LitUrkiEQsgvs/Ipj+0OSog0QHV1Im+aVUExUv7UlIJ?=
 =?us-ascii?Q?u1KdY/DgBnKOJHINtpk9yybLu4cntjJDvGzZKj8inX+qXPBfwdlvEVptnXdO?=
 =?us-ascii?Q?JD0dLb8yZR6Pqnj8pCrkJYvohpK/ZpfThKffaQAZ/azbzKdecme18NYeL2tN?=
 =?us-ascii?Q?5SAH3g8FDAblepNWxt2PnXoxJe3IJ+LCOtvDmm6BewgCY935cv01OcqqfC5f?=
 =?us-ascii?Q?8TcWfPZFZQSAjEi2kNLQRDA6xl9jyXiBrIqT0fyqjnX1hCnJltr7EQ2b4hPi?=
 =?us-ascii?Q?IEugLqkJO7RD0XSLQIONE6sPslDgIE4QRl692O+yNwHQdX1p2Ed7BMnCPY23?=
 =?us-ascii?Q?se8b6d5shFVXtn1kgbF3ZbaDp8LUu3A6R05PwFql/3L7ii6gBijjIk5jxjMY?=
 =?us-ascii?Q?MPvexXM8+cdyoQ4C8GuCLlAhqI587MrcgnwkWK3zCUVKU13x1JhRTsZ8NolD?=
 =?us-ascii?Q?g0l6npWiB7h2OhhDg1R+mchV4PQLIfGWXJwOBg6u6BkLqjBLXJS6PpsTaYQ1?=
 =?us-ascii?Q?Cuxm6niGqreT3NUd5R2sFC82w9CGQuDKerRTfZn7miEnBft/OO1nLWyvpSwq?=
 =?us-ascii?Q?RefLOd48mvXTmnANlY4oqevTmOuf/FdjaIslEjk0v5Oe74YmlZc7w+fhczQN?=
 =?us-ascii?Q?DagwlpkZV04Gl2lp9XMSgR86djQZ+ee91Hxg0E5PPCJbunqt0k+VOWBw3egM?=
 =?us-ascii?Q?RozqZOs7ct9SlcfRtrWh5GB9Ah/TfzkD+wEBppQwn5xksiam9uLS3DVcxVoJ?=
 =?us-ascii?Q?rDUvTxtO4JDQwU/N3MA0Q+T7G9kTL9nXxdgYiWyzvC36RSkXZrHbJDGpiwH9?=
 =?us-ascii?Q?rKGbqDPIDdLmWCpP4zJSKEsDSmzQvFU1qDIi0CAwwo232P9aHLCFFuvjZM6u?=
 =?us-ascii?Q?GtiJPUSg63q4pR5+wsH49HHe1ajBqAZeyDDdA/iCFVqytibra6uDdt7EEmzA?=
 =?us-ascii?Q?Ib8Xl7j+9II18/+1OLsGRWhNLtnliVO3UAP8qrY+62NMf8bjOXcZyv7dNS6Q?=
 =?us-ascii?Q?NNWB7EpPb/B6qM21Ku9WvQse0F3N1nMKmyKB/6WkcC6Mx7swzNtmUUpykili?=
 =?us-ascii?Q?S29KbhZyClBDc2di/H7aeSOBqAaQBCqTsOzAYZSbAUVsI9YL+qGRk2Av0mgs?=
 =?us-ascii?Q?J4lEVvRvZXcKzfyN8JawQ+TnN81NQOshbHMUZCpuKE7rZDuzk074oamgKFkD?=
 =?us-ascii?Q?DGWvKg2Pr6wBJ7f7yi4L1pP/0fYBQyy66xqxm52aTyMQFn/ROyfpmgT6hRfG?=
 =?us-ascii?Q?6sEKXWCiU1i5SnwYHYf1kEC2aQKgPPY3eF3pzyhqhE5IDdbrl1w3rDP+0ZZP?=
 =?us-ascii?Q?YSU3/FcISKgqDMA8bbrYN6/gcTKxzrnmOU7owjc2ojVjQLc8R+VZPqD9coip?=
 =?us-ascii?Q?GjGZcJmn9te6Yue5HR3+FXIC5Qn79bSGfsxfH4K46nf7RSa4pjOWXDRFfqQa?=
 =?us-ascii?Q?GXo37clJUHDE/bMfewz8laPNhoWPDhW3ZM2K+l/94Aw7r0Mw7AH8cxZOaz5a?=
 =?us-ascii?Q?96fp+zNs+CULaD/CtYnHvWyMSGatBKpzdSmO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMbg2VBJr5hTHcaCGvGoZoYcQycYUyd8qgHtBx2KXCAZdK8v4okfHAaqmpss?=
 =?us-ascii?Q?YgYA6jk4cdN3hm5hC/VPv6bv1XlNOmpXIYSZ62wBquP50mB4eJ/q2ovfCUsM?=
 =?us-ascii?Q?/SIBDVUJXk5MCqEIrQWVUOPMzIZ31mJTF+8FIJHIhnKskOXYpTq0fxe9u9zk?=
 =?us-ascii?Q?KyxjyyZ82fthCwEdXGAFf+XFZWEseJulNxuax8OiP0yIS4Cn1rjygK8983Om?=
 =?us-ascii?Q?7hVLM+KEolLw9R6FdmAXLWUe0ettZvyGzceaXSmRo88shSfZlI8qgS4KYfnj?=
 =?us-ascii?Q?elVnv8riIS77JyVqu2MxwRKN9kJYOv/TzJWPRoEOLgKNxt0OYapJPAUKr8gp?=
 =?us-ascii?Q?Li06cq5Oqh7tD6nJNXS//NQOmhkpYLXWbVvFTeCclBJ3XV1rAtI+mku1wrnp?=
 =?us-ascii?Q?l6m2g0muolL2/vUHWO2vAfpiUvhvMAkfv6FRSlhi2vd0ziMssCw1k1Ny7Wgi?=
 =?us-ascii?Q?KitMduE6R2nbK+mK6teH+giSZiO/acemO9EEpL68dl+IbkU1YdVzAqpA14OO?=
 =?us-ascii?Q?HU9yB6AocCC8YGSY0Az/UBukAMmrUnqAqlKsghCjc6kgVvE1CLGoYYG1FTZR?=
 =?us-ascii?Q?8EPQ8EtNSgce3MtVqps0usADkil+j/aoe/SW/2OzkzZB6ZmIsaJ+7m8rhulS?=
 =?us-ascii?Q?HezLqZmTK3pXiwBc8Nj6RpQXMmsj65BDBhtmY6GdcQ16eIncxxaZcLFU7gQy?=
 =?us-ascii?Q?wSKErNqZbQznv/XQ4v3AIDU4BebwobhFt4XidaHWgfKtlv0hQibkcXZovkFw?=
 =?us-ascii?Q?Xksr54Bd7fAEMvHrv0hnFIZ4iSTe1C5aMLkCVnDG0Mt0prsoxq4mUdMXHqHv?=
 =?us-ascii?Q?CM4WO4Jn13Up2NvaXCUrdZDzYpZeTw32IhMshzWhsbFUjdtQU3I5BGJVZJ3N?=
 =?us-ascii?Q?2aLW6Tgm5SYeaw1lmqvhfAZ02Nj3mBgYVb+jQA/s7fLbGgpItutEkpd5bpZR?=
 =?us-ascii?Q?Bt3Ek5Y4p5Fhq0n5XaDxPoy9CQ5IywEP2cQAgXQ/YZgYBfl0RWWj0IqK3Gxa?=
 =?us-ascii?Q?EXDPFkgEMWuTYNd4/CY+8Vyk7bh45p5X3DOSlZNm96uw+hMegNRTkq2IwIk+?=
 =?us-ascii?Q?g2AB/bYDtG30NOJ2qfZySXrluVgkvv6cb6Zntc+rHvH6Xabzj0+mJ92QgT25?=
 =?us-ascii?Q?VJpHWamBxmY2qSSN91jIAhbC3zAEhQaT0M2DGP6Cmm9ga19XLcsne7kHodC2?=
 =?us-ascii?Q?Wr9k4tCpUM5FKHUA1TkSSKNA6YiM9Iw+jY+Qa377F1CqXFGWKW1Kh3N+dLTy?=
 =?us-ascii?Q?K1hR5snc+BbdlTkdidlSY7heLWRbc5WT6+upg6GpG1lmRoC10krdMYUW7tVY?=
 =?us-ascii?Q?p1jMg0eCj9FO90SHPozZn3TJU6rhloTjOxvj3NkVKDr/TfVscgeeVk1f51Pi?=
 =?us-ascii?Q?vVbHRkyPQg5AupiHYKY+FVs2EuZTrLngZGCmPaGaTGCpfRwoYkIsGxjHpByf?=
 =?us-ascii?Q?jcpSlhFIt5LTM5NPlDrMvKJZizRr54nIlUtSsJ65Cq5n8acPn8jGDPVmS5qk?=
 =?us-ascii?Q?VGJegYCQW6cjXomt7US3nE6NDJ48pQjw6tNJ1Nf6mjtHw25ZJXPnd0jwPOTy?=
 =?us-ascii?Q?nZX0qb0B6t/lqkHhYZ+P7uAQUvWOR1kO2Ba0QywJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37450d80-fb89-4084-6ed4-08de0c50795d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:08:10.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJM0wBrvfUCngEhcPs/xTIDQK4wt7mx9eIHbquWQB+s0RqYq5ArnRZf4PMwZrMHTa/7j6w58Y5acSb9eOojTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_180819_362061_C2370C02 
X-CRM114-Status: UNSURE (   6.92  )
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

On Sat, Sep 27, 2025 at 02:39:30AM +0530, Pankaj Gupta wrote:
>
>---
>Pankaj Gupta (7):
>      Documentation/firmware: add imx/se to other_interfaces
>      dt-bindings: arm: fsl: add imx-se-fw binding doc
>      firmware: imx: add driver for NXP EdgeLock Enclave
>      firmware: imx: device context dedicated to priv
>      firmware: drivers: imx: adds miscdev
>      arm64: dts: imx8ulp: add secure enclave node
>      arm64: dts: imx8ulp-evk: add reserved memory property
>

Tested-by: Peng Fan <peng.fan@nxp.com>

