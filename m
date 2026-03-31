Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A2FF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6NUmA4qkRY/wUZ93SuhH+Y5gV/K7uEqrf1r9MuqcTE=; b=tIZ5MbpjVgOHmQKfwEzxuUksBo
	+kQ4vDP8HvBXJYEMtlb+tQVaPes7AhydOvoa3S9F66bn3qqVf9MndClGUbHu5z562HvZs+sAsRwmq
	RG4iXh25L5sv/Yz2M2yV62p0Ybso1wg8+hDNlOPO4N5t7STh7mUzbvEmA0wW1hgOjH6yQT1TBf37M
	9EzqSKDp36kda6btuYyylD/Dqw/EH3hC82HfabIu2NbLwK6pqe4qQwcCPqtWzflCc5ozZ6lHfB89u
	1gDA2ROiDa71wiyEqj6peABYdBxPmKLipI6ieZA5FYyEmuwaQq7jRyw9yRTkrbxXX9WZ1/OcmjcaN
	/jCW3qFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TTU-0000000CTgF-1QPy;
	Tue, 31 Mar 2026 07:25:20 +0000
Received: from mail-northeuropeazon11012054.outbound.protection.outlook.com ([52.101.66.54] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TTM-0000000CTc3-1fyp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:25:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8V/ybwK4anaStLs4dm+4xufYtFr9bDBcDnwn6eg1DNSP/7igjdI5AhnntMXqsahIZh09Mlgq818nW9ltJ8Cx9z5BDrK0Vurv5h72BzSSe2+h2ObmZaHyb7pMGjCYSCopItZteFiTDdQqBaTagIGw7rPG6nLNgZaSK/VDu1a8shREwWBF70q+N+MhyQLm13VtpBxAeTWbEzvqUIBuN1sebDaGlhHuc28yzDYT2+SPWVvDsFgMway1wHNIv4AZILCLrnYsXDFJnmqmMsJBVML80Owp+zTuOKNhrL24mKzTIA6QvGgpUt1X2pYMvBTLDADAOFga+Rr8vJC05k/znjnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6NUmA4qkRY/wUZ93SuhH+Y5gV/K7uEqrf1r9MuqcTE=;
 b=p2vy1UBuOOesC2902ElGrx/Gv72mo9xeGsl6Fa/6S4bAEk5RjHlzJXymz5qHVuZBkbt/wXTnMb9wxxajCyWAoMTzVczTd6ONu0AIM1soRNnZNS3BN6Hy4c5CR8eCLjgTkLW8YRd4vfG6foR1y5OG3QvytKy9zmWBb7LJNIDntUurZjDG3cwm4lnaRZ+87QzvqLMVxS8rglx+0f5TzDWxaph/PnonZ2I/x9nJ5Cubtrf7uXmCQjycp4S0XHmZpH05/VqH+2sw6d4LzK9o4KxeQ9YId3Rb3CM2cYVAuhMIuk3FOa5cPa1PEdseQj85YWMgjo8pA0gcArvvf+qjiCtaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6NUmA4qkRY/wUZ93SuhH+Y5gV/K7uEqrf1r9MuqcTE=;
 b=EjwXkK21+z0CJgThcCxdz8G+U0MuTQ0xL2EvdVf75qlBaZZ2ZuVmVaWzdnS3i7WWJNKmblrJKf4MWRecbnid1HLthYdRfZyrYD8Nc6NW5qEuTVx+qnLYW4inTyOFU/e1VeGr3QSjQujilDNZgyYjvn+dy1dQbFWmIo1qS3Z0JUBZFfZ8E60WB7MPeQFzFXmZFQQkHXAoJ+dZQJtU+JqHk4f0HkK5Kvo4a35P2MvDRg6BApqbDrnIamcygfFYRcLpOFbPTUz92jfC202dIxmSX2TfDmRCacXBYvmBOtqkMVmjlVq5dh+0CLiWno7wy3NC4p5bekCvD3FkLb+ehWQOcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:25:07 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:07 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 2/7] docs: media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE control
Date: Tue, 31 Mar 2026 15:23:12 +0800
Message-ID: <20260331072347.253-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a0fccb-ff38-4284-05b6-08de8ef6a2ad
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: LY1F7OlDZCAmdB6fv0ndJEWmMJ0IThJUwGAnJMvKQNmpK9pjVmF9Aet3qbINZ5hpaGEKjTWpgtnHoX4EbSuQAaRKIRo2cShZ1tiE6iPRXcDp8qQJivqKOsajWSeYan4pVH1GkGDMA4IXzRMOFzgka9Zk+3/zN12HV1tlSW+XGxiuu0G1zPxAV2xHBAOxUAVT3xjA0/v3Udz/mH2Ks6H3Rf2mVnUiGOn+KfWLERD0cA0er3qkObraIWawXUvMbQu3eJX6Phb05t9JxFV+MQPKZXE/tDOeP5y2s+2SQpTDyrHwAvJZFIx+F1YPBY0v+CKG/QNJR/Qbv8Gw8T6sh7N6qoZT/ngusyAVV8avF7dr0MySv0QsZKeMqUdGZI3HsoJcFEh111GzzuTYCs8V+Nug3tT71lGCBWfWcuMUDqz8+GrJLxCaAQ1PwJghXV40Y7/VJHaadgWDl69HbGQKKDQb5ykK31VSDZkUZjN1tS8DFIQrcd0bMh2nVerUsCXNxlogMsP6craJSDsb819hHRBJcjSmKxttnLme70uf2pDLplbQYvXBbBaqU/fS/KkjrDtG3GnM6eMnW0N9CYPPBsIDiuCtJoOiCgLLHqQZ5LCw2NauPdsnJXeYKFys9DdLLcv9V1JPdKFuK6f+1h8ud5CjxAopnucKvG4qTMc/cV+qWzxVzKA59x2BKapNKCLXuxxh3rxxrwCRK5EDJU5CvMv2P+p0bUA6IeJfPFnFQtDA5lUFAgo5ZWqd2XlGJsJRq4ACVPyuMvZMwptRpNaWJna/h1RlSXSL3yZaUxRcne3eQuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HnV8ISG44Ta4yoHE55NM0hbD/D9WnWE1yC8DYVeWRpHn/IPatVMOQLm1p8Bx?=
 =?us-ascii?Q?PpL6qZY2oLv1J0oFiOPYKZfQQtzYBIO1n0x49GMc5QUjGTngqK6FqeCXGp3J?=
 =?us-ascii?Q?YokxLvYpmmhfLU9v1PAXYkd35iI5H48HPDZBFqYkw04ZrRhin6NhFYgtn73J?=
 =?us-ascii?Q?zAAKaUnRRBbhT/AXJsN/RiCKU9fLVjfjZDqgmaiQj0ZSYQvDvhyhOLTS2gx5?=
 =?us-ascii?Q?FkDPZYiFdEL3zhKfgrnZqozYyvGRwXbxEBc0E5H3Wn3meb1Oilq7sE3gq6lx?=
 =?us-ascii?Q?DqIRhTWegv9k8Ocz0UJFkNFXZEuYbc0uStI6ZgWwSouxwOq3bKBujhqbRMpg?=
 =?us-ascii?Q?H5JpG1mYQ307J+ds2voErOhN++NR8Igmdm5o2zej+jLcgGfgc+uMST9BIOaD?=
 =?us-ascii?Q?bGKk+U7ussMOKIHpJbwwsFHSjbKT/5mxfpeLgFLFstM2xIMSF2DgffsOO2lh?=
 =?us-ascii?Q?6rlPRFFAg7qmup9dJ2eeTlgi4WivtpffiQ+cmNyMTDu/KyMBS346cpv1xFAo?=
 =?us-ascii?Q?mC8II1iN7CdWSl2eFMLiH+ETJwKCYDoulIxTMcuOi83QuOCtijDiGwKdnVEW?=
 =?us-ascii?Q?LWiR2Efk/MrnwQGfzoNLGhjxb9Zc8gaie2zYvVWDqGjmphCnZ/FRnee5Hfop?=
 =?us-ascii?Q?LPsNT17oegSQUtMYcnAcMNtdI0d6vlI7k5OXPb8owLMNiwieKLJRVtJf26b3?=
 =?us-ascii?Q?QJkYxFEWqp0FCjmlllS2GCrvRFLxwJ8RwgpDyH5QiqxMyXkA0yFCjmdvdX3i?=
 =?us-ascii?Q?Mohg3IEWMF1WolzBdy/dGkvUwaYVJUCelqKCLVwghAxCE/QHSM+ellGziLmH?=
 =?us-ascii?Q?2ZsF0mC3tGCp8Xg++qAXGsEVAyfrowUKHv2zLQKR2q3sy3dpCPfhTTk7Q9Qy?=
 =?us-ascii?Q?aAMXgBQbkT12vpFb1MJkWmOwXl+KdHx3Gf/LsTdwUeTNKOP1F1t/FmOZHABt?=
 =?us-ascii?Q?RNqc8sRYuy1rBE/29rAqgaLKIf6iVkc4OaUHkv0bzauyLcJtVdbPtcMJ65/n?=
 =?us-ascii?Q?0A0mg3oV0qX/IFpiNhawgKAqk3JYOEo87IDZ26zp3ZiCDLmb/m3bkKcArXoA?=
 =?us-ascii?Q?62CG8+nSgCqZcXparrutlycLg06KPLAIqlJFSF2tNAz68AtJogVUhln8DKf4?=
 =?us-ascii?Q?/V7ZT1q5YIsBmf9Pp7GDe+fdgdGZY+YZuzDfKme8bAS/jDP4Cg5zqH/QNyt6?=
 =?us-ascii?Q?JoQMFsJEJ06trrm1L5EXv9ufjfQEnaCei4Sc5QbZ/Wd3FzEMjL4NGo7VLXG6?=
 =?us-ascii?Q?sgaPOScHIWVx4yKHEKUT13gMi8TLvkRr7myvadqEIkq1JF1oMjp3Tc7dH5Gx?=
 =?us-ascii?Q?gOW2uk0ZRLhsHgOjBhDsn5APkIljdM/AebNjEfY+dsaOKNDFK8GukHVV+9yp?=
 =?us-ascii?Q?wTi3Uh4G8c1QJjNESpXYiAsusFFgUW0nzRsV7EUridM7kLpPjuEZhEWkStKy?=
 =?us-ascii?Q?r1PIqNF942Nf1QqXpuNayIynMRRoprXEOBXcC8kdCjdporIZ8A+SJW03yq3G?=
 =?us-ascii?Q?VzNhMDOjOeFADnAiiTrThZpJFNIltUgovfQWSwQCw4uoFHjPjEKRZz9QRKoa?=
 =?us-ascii?Q?wP4O6qVcVkT4cmxWojJZiESQ7cvU3f9O3PtkQn7DsbW7uj8SaZAOX8pdrDF+?=
 =?us-ascii?Q?tIU8Ea5nJva7JFbjWZOXFz8yGxdwIOhpZVUsIrny9u+dEZ4AbfUpCqhgz/vj?=
 =?us-ascii?Q?riFyAptToOTpklg7k2/xFJuS85d68P3hQQIhRmWhOmXXK1ZkODT2w97tcon4?=
 =?us-ascii?Q?HL+1qt1Bqg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a0fccb-ff38-4284-05b6-08de8ef6a2ad
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:07.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vI6/grQU25kBrP1HTciMoh69kjWMA2wemTkHk5v1ehtRPmpAcBq43HBU0fQcJ1zVCT1CNeUSFmjV8pGkkIp2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_002512_465184_2858CCC6 
X-CRM114-Status: GOOD (  13.75  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

Add documentation for the V4L2_CID_MEMORY_USAGE control in the
userspace API documentation. This read-only control allows applications
to query the total amount of memory currently used by a device instance.

The documentation explains:
- The control reports memory usage in bytes for driver-managed allocations
- It includes internal buffers, intermediate processing data, and other
  driver allocations associated with the instance
- Applications can use it for debugging, resource monitoring, and making
  informed buffer allocation decisions
- The value may change dynamically during device operation
- It only reports driver-managed memory, not application-allocated buffers

Update V4L2_CID_LASTP1 definition to reflect the new control as the
last predefined control ID.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../userspace-api/media/v4l/control.rst       | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index 19372bb32c4b..6904c5bdbf37 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -316,9 +316,29 @@ Control IDs
     set the alpha component value of all pixels for further processing
     in the device.
 
+``V4L2_CID_MEMORY_USAGE`` ``(integer64)``
+    This is an optional read-only control that reports the total amount of
+    memory, in bytes, currently allocated and used by this device instance.
+    This includes memory used for internal buffers, intermediate processing
+    data, and any other driver-managed allocations associated with the
+    instance.
+
+    Applications can use this control to monitor memory consumption for
+    debugging purposes, resource management, or to make informed decisions
+    about buffer allocation strategies. The value may change dynamically
+    as the device operates, for example when buffers are allocated or
+    released during streaming.
+
+    Note that this control only reports memory managed by the driver for
+    this specific instance; it does not include memory allocated by the
+    application itself (e.g., userspace buffers passed to the driver).
+
+    Not all drivers support this control. Applications should query for
+    its availability before use.
+
 ``V4L2_CID_LASTP1``
     End of the predefined control IDs (currently
-    ``V4L2_CID_ALPHA_COMPONENT`` + 1).
+    ``V4L2_CID_MEMORY_USAGE`` + 1).
 
 ``V4L2_CID_PRIVATE_BASE``
     ID of the first custom (driver specific) control. Applications
-- 
2.53.0


