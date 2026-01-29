Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A63AD358D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdXxpTOVBtykbKcH7XnuXO6ZiaeJOHSgeW9ujvARUUE=; b=13fiBgtP7Z0wxNFn93ybhwFHO/
	MN5y61bsZbSjoskU9m+1JJ+c7rwHTFqEel2swdsFLsBXwHFbxujBm8ozj3tJR91XbdOLRo32FRaY1
	Vz/vE3wsix6Ti9q1LxBdu/4UyoU6M64dEBVFTp6NMVTI2zVTsoxvSXWJ+ecmjDWDms3joFF4eyqQ8
	FF2BqRmU9FDQegA2JvQ7ze5MG9Lew0saVKyGHtCwxR0SkKp0G+zIZNsnxyAYLbMDFpRX8zZzIkOpt
	jlPvAXKVeRozTks+CiUQ8KLwioDP2L9JRE7mcxwkNuQAAyUtUBISfUU3J6TWiwXBVeitNZpFOZNqe
	yRDDQsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMzT-0000000HQ3A-1Iwq;
	Thu, 29 Jan 2026 08:02:59 +0000
Received: from mail-westeuropeazon11013006.outbound.protection.outlook.com ([52.101.72.6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMzK-0000000HQ0l-0lwU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 08:02:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov8rTNWXJbZHiprccqcRSEo8Yk7leLheEHqsL4c+32dHdawkOD8nA2hjz/9r9ZsJHlETfbQe20I7TNgCApRzl+0/IxfajvwGWoHKfE4J6DPtXIScskQmNNPWEDlkfTpDrmeLRD1hg62iuXnnNNv1W0HlDaKWvR8R7EkIiCB/kvXh4L5E27YHoxJcc1WLlieoqGBkgVhuI/pmRHcDvEstZWjHk42jMB0ZZ/fD39W36tGZjLfgeut+RysU2Oj2S4malnGZbcUUe/IjY4DUUXpO9bVhcRvpJnSO4sbvYIhSwAwbLcGm07exXMcczSh+uyZEDlcGQh/x/umdiTg4EfTHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdXxpTOVBtykbKcH7XnuXO6ZiaeJOHSgeW9ujvARUUE=;
 b=JsVKjkmvWXi2T173LMOurnSpnWZAEgUiVmCHt0xZYNybGJ/0OTtEri2wDhxcUpIO5qOp6IPTi2Jra4gSBDXr0Qy74SzMhV6ZRifn3jafzpliGBNm0/L6KOfuFZ3nctIFeTSSpt1eb/ZzHSKBU5+yBbnA8c8hesnhPwrW66yIsQg2G/rsilzBK3jVIhz9hQm+xcmFZSIwG80TuxclHTWdhP7Qimccrjx3sQJ7cA2h25aBWUjOCKM/H7+kvsx7JGM6qpufwP/rQWEOqGqcJcovfLOU5kcuzhYrq7+mzxG5CrD30mDl2ZsD9eu7NeUa8n3m709hsUFR22tppk3H+mEpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdXxpTOVBtykbKcH7XnuXO6ZiaeJOHSgeW9ujvARUUE=;
 b=NclK0fFuMYAMyzH5+B4CBgxPPfBXerVaEcjO66QuZnz5PsfRWOe7Da63gvoL3CXQEpIbR/prkbmfqQ2WEFLHSDYWUHAhXgcD9+/R3ztlHpIcDoVceSY/b7uW3dw3xvv3qktg56Le2isuhG4qmZzhD564KzK2D3TmSZuvE70LKYcHXdSz1k3+BGVSPSaqdKJxYkrqKumBUj8Dct6fjP1llfup48VjUzVf6LY57iHP3t4uOckQgfaZ+mFydrHnYone4mNq+X87QX3y1JdiTAsCi3XN9XmmPME6axh2vrrvOZ56iLZ6tfMAgDRSeX2GcuIKzL125Hqlobu3zxMD/LQhJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DB9PR04MB11693.eurprd04.prod.outlook.com (2603:10a6:10:60b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:02:47 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Thu, 29 Jan 2026
 08:02:47 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Thu, 29 Jan 2026 16:04:39 +0800
Message-Id: <20260129080439.2910727-3-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
References: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::11) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DB9PR04MB11693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfefb11-cd4f-4fa1-def2-08de5f0cca46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X+cFaHOgxAfv41x6swWJmuTjXFjv6Np+7hFMxHMHeFjMGsOgBTHS0RujJY0A?=
 =?us-ascii?Q?y3Ip1XxZ6WdNeVVKVg/7UZqi6WF3AFMV4VokHgR0rur1K2BJ4v7gN2MqRjRF?=
 =?us-ascii?Q?Ddkwdcs1LzxuBOvqTAepy0+Qw/B2PlpKuPdRpjaikGg1hpw0ZfPkFRYVUygk?=
 =?us-ascii?Q?6x9PlYpZPaJ6KEOMS10KrsFNivumWjUVIVmU4w8t4Ezga+XACSfSXdh95ALw?=
 =?us-ascii?Q?zb9GQgeME9EceQwPwIi51NgRK39FfAxNxqak6dtZ2ZablXrOuQfl1OxrXynn?=
 =?us-ascii?Q?xPfzLwyYkGBYYjO10aN7JS8Tj4uNak3LeOe1b4kZrOi+Wux758tdupysIdqd?=
 =?us-ascii?Q?Nwei9DX7Gd+uLbRrD2rrMMNJBxu+J/fvLWdOaJF9a+/mtZUBRQ3K5HbesYO8?=
 =?us-ascii?Q?I8W0uGVVwOldpYYJkPSK4Atyp91XMVAM9fOwZ0yddoEo5VW8CKhH9tGjOr3d?=
 =?us-ascii?Q?sdJiuffQ+jzmzGxYIwCkbgla3sk2sIyxt6PUrcgAh+10fqrFGfCfFGliPz+G?=
 =?us-ascii?Q?ScBaKaYG4yDrVZQTtRiQy8JI0P94QQbcJu03PaUHeGWGFepJwLxLq4lgvn5K?=
 =?us-ascii?Q?ftfo32L11frfi/Tq1KFJJdmswhxBWu8qAvkQLcUUC2/YdhbHvXNV/XU+qmkG?=
 =?us-ascii?Q?Al3FfpciBz4z7WeARliGAIobwjy3U4eL8MrqWgCdK09VFTRpi/0FQW3rZ3SN?=
 =?us-ascii?Q?vz8LMN33ARqQ1wNsflwAbGOm/DDZj/b0/Ha3qN3XSrkp4AsQ50UUuXpF2iDT?=
 =?us-ascii?Q?RnMoVgxot0is69v0umz+S379g8TEW/84rZ2HCIf8I1PI0IC+La6oX+SlimZb?=
 =?us-ascii?Q?8uuf1eABgXUuOfzrvL5JdzQAyltxiZQnmWJMTq4rOfsY05yqD1p/nwYnhgsC?=
 =?us-ascii?Q?2gC0CYRHAtt4P93JATyZQSnb21xxypeDlRnWPTbZgKijNYb3E/XX9p8Knpyx?=
 =?us-ascii?Q?cQsYCh9/mm+zKUWoL36DtJwvQN4EkwT3vdUU8Km8w8B7XkGpVvUJurubqx+h?=
 =?us-ascii?Q?c86ER7RVqHlvI1Dwr/CWzfBk4AdbuaTisysUvSGX2mBwRFsgdRsiLE1npYuI?=
 =?us-ascii?Q?ENUB15Kg6Je3Z4fcs7woy9KAZOIWu2RoDGL1xqcvR9vADcsf1FKMepYEM7Qx?=
 =?us-ascii?Q?XLdP/JYPU/3zCgVTl04OVipz4QOYlOR75DCWy6s8yG3Fbp9PAYtlJn/57iQc?=
 =?us-ascii?Q?HTbB/0hveDRIB3BoOzcea1aUNx8s01gvcKkQQYcL1E+EFP91FmOYpYouhJnK?=
 =?us-ascii?Q?ko1iqrZgXqXLd7vQcqCVyccw/oCIV8hXVMjWqu5+tEH5BOu98/3FE3bnNapJ?=
 =?us-ascii?Q?XdJzOYZ7+iDqSiQmlACG4zvMpplVm6dhz+wsW8tQ6T5kEgJTeiSfXTo2M/3P?=
 =?us-ascii?Q?2Y0IsrRKqfeEm4ktqpPvN6zK7+Vok2ulLM1Pt5FhHS4j0QtReO89R2mXHmaw?=
 =?us-ascii?Q?scyt0Y/3lmuy+jozqw9oqQ8zVmOBAwuGRWAoG2ENKRAnmFOeyV3ewh6JapzD?=
 =?us-ascii?Q?RcztxvsvgWhvmiV4Wmwha+GDR/5A6JnKY9X/xL+oMjfl8S428AiBdq4dia5I?=
 =?us-ascii?Q?dC5UXiAlTnur1841Q52Eh0LWTqHuRKQ3dQhLksl/NRcWm0+LNEYz3ZeQ6N4p?=
 =?us-ascii?Q?VnlUSszrhbXaVy7/guQjU0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CEXRwWheOavZU1N+8Ed8cP77ZCAf+I3DC3Cqnro4CkHHshs7+O88TDR6iGyh?=
 =?us-ascii?Q?LPsQ+Sxjd5+rZUw1cZp0SgquvIjaBFcE/26y3JoIKwKHKIxKEabs2JdzjORR?=
 =?us-ascii?Q?XPNbov3cLMCx++c0hesH0iPG5c1QGXnIqAvAeosYLckimrxKoUnerrNFk0CU?=
 =?us-ascii?Q?ycRBA8L22KlurDdC3I8ezLCQyfllJYKoFfNsoAug25sh8a2qZ2eHyBL5aeBd?=
 =?us-ascii?Q?s/27o0lYvwt+Hd68mvAhYEr8wVFCDqGkkiHxFWTBaqkoObXjmn8O5P/+TZkL?=
 =?us-ascii?Q?QKKwKv3s8Z0UpKta4MlC9DwffbBESdfOs7S6wg9ytzbUQOs/O8pXaWUln631?=
 =?us-ascii?Q?typCvPN45oelOmbriw/QfpDVvy+xM5nQJlw544w7/uRDYcMlotAn97eYFWFb?=
 =?us-ascii?Q?WbRD6qr9awNI7Yre4qK7Lq5USUQObhDJ+3zmJi6yzWPFttnCug8WVBmGHB26?=
 =?us-ascii?Q?/4v1zNknk3mkdVmH7CDMu3Vli6N//NZ4xmrrZs11TuF1NouMIiJxlUorUhpc?=
 =?us-ascii?Q?3DOxBS0qBQUWNwrUW7aGvDixxKtzqWUyaIgkxx91TKM0Ts/OQOj3ERSQAC7x?=
 =?us-ascii?Q?ljhCPyvEtTM6d/3VfU7w/9VGoDxh0YVSo166I/U4zXoClog/s7kqkYMAJeyD?=
 =?us-ascii?Q?tjgoXVohsX4rVVpUeNt2LGIhoPVmbFbOru3XCvkl6r2XXNSkKwn0pVkU+JTZ?=
 =?us-ascii?Q?7gXmnZTEgoTYAvf3qHqEkvJ6DULhFIiBcSnXAVEwNFTFnBEn7L6tXDvgUG2O?=
 =?us-ascii?Q?LhZ94j6ynReJ5A41CsZWtnAcZAuMPYk4hs7Fz93fEBF2aBopFoTsTE4L05aC?=
 =?us-ascii?Q?C391JbQL2OXH8sEoRDPWRc9MrEbs/1STmatlsR/kKg/uZcUzZiDKiUWLaJIB?=
 =?us-ascii?Q?JpLSKukHkZQB49lfwsMhCugS9uJow05/FLj2Kc/NSmRb7Y/qBvYN5i8T59Ij?=
 =?us-ascii?Q?ChDgs0yLKnsTxUSyIBmAX9w+MhCE+KhWvocvlgUtIpXfXTiutGiIYWZSnXWl?=
 =?us-ascii?Q?jcIjcwi0sqTkd4pBIy1tqNiKdXEncNSLQXAsAFBnCn6yZpEAME8rclR794zB?=
 =?us-ascii?Q?qkY95aYOwK/82r9CAYhL/NOtyNcXh+fVmRCGCcvd6+vnKeLdP7gP+IBR1K9C?=
 =?us-ascii?Q?5W8AiKDAWoOELL5lBPmDYkaQhCv8+F0/FVQA8w5NIxnBOpduCl93jy6bLt92?=
 =?us-ascii?Q?Ue23eBrshEgXYYhLetBvZl4/+TUbhJNnQ0aSjvLsQE/QuJJpU0nDJ9AAgjDE?=
 =?us-ascii?Q?zN91YfJuxNL6D9B8IeDAD1SAalXD36UuM4W7byU5Zf5Jre4PH/p+IojWn1bQ?=
 =?us-ascii?Q?NaYxbLPqwkkUoaT34WjSeU28rSCmp8cJ8++pmDaELvQSWo2F2oTC4TCzsoZ6?=
 =?us-ascii?Q?XEa/EwmTIT54fKhgFk8YsXGA+GqUlbmxkoT9+o3vapD0bHhyyYW0DYrMEEfM?=
 =?us-ascii?Q?OpOm2U5R5Dv0i+nZxlz0YYq2nLP+232KeWOEoo8m0gRcNvAB2mF3UWo1Q6Uq?=
 =?us-ascii?Q?fS83kYKiThlp0v3QwHYDmsrJbqR1fHYhCg5+CtRWzJt0l07FzUzdvaGaH4Ud?=
 =?us-ascii?Q?e53PZfU2u8g82xGjC+iZHJtSSyc+Z3XrxbcqBlTHJjm3MFGO+VpSGo8YCxB5?=
 =?us-ascii?Q?jUrufWurmgpn1AmVPiOnsArw70tWHxJEjp8g53Itr4OKUkCUw50n+7ZdWE7H?=
 =?us-ascii?Q?MK/ScLBi3dG/PqFYp35day2+wz+QcX5eZA4CYzFCSYjBYB5I1NVzjCBD17Fo?=
 =?us-ascii?Q?3HIbtc9qFw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfefb11-cd4f-4fa1-def2-08de5f0cca46
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:02:47.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8EYlGQ+EsIwVsMHzWNYyGc+IXGMgV1ePVt4P2VeZqfP2KuP1tZuay1YlLVOj18LiFdK4SGJhYSjV9c3LCBpOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_000250_232858_7AD0F934 
X-CRM114-Status: GOOD (  13.49  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

During system resume, the following errors occurred:

  [  430.638625] mmc1: error -84 writing Cache Enable bit
  [  430.643618] mmc1: error -84 doing runtime resume

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a wrong delay cell near the gap to be selected.

Set the tuning step to 1 to avoid selecting the wrong delay cell.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index aca78768dbd4..4164d9e4e0fd 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -415,6 +415,7 @@ &usdhc1 {
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -429,6 +430,7 @@ &usdhc2 {
 	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1


