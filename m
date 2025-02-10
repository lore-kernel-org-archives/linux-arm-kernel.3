Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF32C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dK/BtXiEDvWm0pigTCDTnLxycfOnIYLDZ82rzRezuBE=; b=0oUF4AGclwHTI0/8DIK52YQLkl
	2q6XHGb3TmJTrcdEWypVn/KKmvPIPChQe7QySnVY71aEMMLaMH4X3iYy8jLx29Ei1C0wUX2/iV8u2
	yFbBWwonwyfVVRKHTpWWNcAbOCAXsuKZHorLjsZpBjhFGdh8yp5AZBm7SlOavLrN9RyYwGMbCILsB
	6cXx5DfNshVDKr1CNTpSmt8twOcmGUoFWFgPMuOVUy0ts8Gav8oREYMxr0WwtImpejSeD5KFZASVO
	qGiBLLFRsAiWNWjJmk7M1jaONqKGurkFe82mlc0Y/SS8uEr3nxFxIzZ9ISXN6JiGljnrOzkQBeyqf
	s/dhGbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPqY-0000000GmWs-2qff;
	Mon, 10 Feb 2025 09:12:54 +0000
Received: from mail-koreacentralazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c40f::5] helo=SEVP216CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPlj-0000000GlWW-1B6A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGtUEpigxLqgO9D9HYEIMwLi/EoCesf02wtCJOD9wD1g0NY6rjRSLErmVwYFI1JDdcHItXlYZNVU7RguS92YYWD4rOx0Xw1z/fKhCndMK639icnHZDeS93IPeUHKAZ0l+JSYwbiXrciAKMztcsvAo2pPGrwvyRguywvyO0+72KZZy6fVZcXYXWLbywESqAA4LdAYf0y2kOPoLUfmFLcAFbavvOtgtnEMVMi7dRDH5geTnhU9xhf4qiNtcm0+bkBCwH1OcBfpHtHCNcLFc0nAuAbVdRA8P4PGflV5f05QP92CvCUkyirA+cAhVb9beA7TwquyjW5luDWQS11/XmHelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dK/BtXiEDvWm0pigTCDTnLxycfOnIYLDZ82rzRezuBE=;
 b=ejd7R4v5XWgH4JKDTOIwulQ3+DzccAHjAZK7IfrsxRKsYhAGq8VIi8cX3IdKaOk+2Y18U36WjhK7mNTmaNSjtz/PixSMzZy+aIqj9hQtknI7Lx8n8smwoBmQy7mewasRYBCkY+CvVHLq45Lj4dVlG+Ct9SPr+fEgP5bBIFcgTYvMt5F0JFaaGZpdghQc96tJB2h1+F//u9vOl/42D2QBhMpiE6ab3McCYtyIJOop7tr5CMn8cpR40gxmXVfewNpnUciPjyH8Opkt5Ke6+U5WussijOWAoBpEo1HQxQ1Ij5CLSFWnp3vcUzVDY3NIISudPakhAeksFDrqOppjYM8C2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dK/BtXiEDvWm0pigTCDTnLxycfOnIYLDZ82rzRezuBE=;
 b=XLQbkgmKQMAudsDDZdvRriT+Q/pVN9JsE7vFV8knyQ+wmfsYnebZID7ArZRykkp/ND/uisvbH2tOb7Nw2/KuP/pM426B2a6sCv1mxFeQ95o6crJTMkCXA6GI/HJ8muStx3gOLRg465L8BdmWrrx5QYjeVNft/k+LM0JEATA3bRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:34 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:34 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 1/8] media: platform: chips-media: wave5: Rename Kconfig parameter
Date: Mon, 10 Feb 2025 18:07:18 +0900
Message-Id: <20250210090725.4580-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3ccc61-a884-4b0e-275d-08dd49b25b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BiCIi0uF72IaipvwkPt8mF3R220N9CXRnDSAGHNnqWYVvpOeEkWFtSzbNN+E?=
 =?us-ascii?Q?1s0fmXpqnIp9tbvQAu3swNeNzc5t+MVcm8xhkHZFYriQsdA6mXCqoZAmL1zC?=
 =?us-ascii?Q?VSNRCfshjlW9Di3dDYd7L89vW+wnaY15opJ/cyTqCEjywV5dQpJqtKDZbCoM?=
 =?us-ascii?Q?mb+fMWORxbaGPmw8wxNeKMUiOiLPcq31l3j5ydTQQJakVYNDvVwWTuboxWff?=
 =?us-ascii?Q?52gGBl7kV82GeixBn171Gh2hN0QaQIK9RDLXNk893qkt6z4IRJ1niLLBt5Cq?=
 =?us-ascii?Q?eDOsCtyIu7NTceBz8eRE4vBmJPQD4jGYs5bhU8DrHhnszb2yZOjgqUGTT2tI?=
 =?us-ascii?Q?I18ihZtVrsv7h6StdCdukuQEOcMOyiWq8eS4K0ME3t257otrJvjbZ3ShswH2?=
 =?us-ascii?Q?6uNFDxRIgsw003srv0MewrrqiEEtB2hBQJvuAWAs2FNbSTjHJQYLBKfp0TOe?=
 =?us-ascii?Q?fqYV+lsndBDbO7H0AgCPLX2rzpbGkrkGITQVkJaV7z1s60vPxPwMLMOvuSLZ?=
 =?us-ascii?Q?QIftZnE6T7g4nYFk7+jflXVF6ygaOVOcfw1xxzCNWzvgqfj1qtX42smWoefo?=
 =?us-ascii?Q?JdAcpzgj1dx/6UfRXZkChmx9og/TUexnUINKKxdZirZZ+zLNhWId0r4HTgsV?=
 =?us-ascii?Q?McrmPZHddcV5hN/9ezUv3yiTJzq61yjJs92EU3pgAR2i5S6geiznGmylLq/m?=
 =?us-ascii?Q?Zy+UbYGxxTv3iFlYgm54KwuAWR4QeJGXgK6IEsbjexf79znqr+NfMTWOfiA4?=
 =?us-ascii?Q?lIHZ0xVeFMfOMYFmFDle4HzPCrrMnhewEqjUWdd6Rz8aS31X72wUT52z64Xc?=
 =?us-ascii?Q?P6RXvgkyshZ7eruOlH38x2aKdVagtuwvYhP4HC6QWNGTZ6EAbosyWZTE+825?=
 =?us-ascii?Q?E7y0sSXc2LDIt5+tboyGozu6UdP06mN1wswCeTH+iAsEpa3saa07Sab2xKHh?=
 =?us-ascii?Q?hK4jeibxdk6fVnbOXbJBPhFDOdP4yCxw73ZnlNRGNlgCRmDm+xZjnv7sMBR3?=
 =?us-ascii?Q?etShRQPWSNw/TfF9Flz+e09Qr8V5rpiTdSFd4qqyKA/V4vq8IYzI81aXjw7G?=
 =?us-ascii?Q?WJjR6Nqdqm4Q4s9qodCxyXfa7RdxcbW1yGwfmc2B5TSExj+YqvtTjwZOj7xs?=
 =?us-ascii?Q?JmHjsuD4Ivaz5d6Z0rLM0AO9cUan3tbnMMlGcOgH2QQEPeYYIaaBT+IbWckp?=
 =?us-ascii?Q?MNxZe2xJ+DINAVszV4tnkEfswWNT1kh4qw3WqmJztQq9QXxssQvBKC7WoEce?=
 =?us-ascii?Q?xJT72iaMd6uEs/4eJR0VN+//4l5g25QM0RG2o+onYx3PQ3aqGViQXkzbICxV?=
 =?us-ascii?Q?UkxlkUpW89hDZu15QkKPIkmrelBc+q91Jef0u504k/JJWwBHekQWInak7uYO?=
 =?us-ascii?Q?CRurBuB7XqLhRKzkRRmyIUgDMCnOdLkVIvoe5GSk5AfivEDftxB91VWBJNy6?=
 =?us-ascii?Q?henmCeSQiSy9gWynDy7MCGHg5XETCgD3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sd3MNbeyE1+1YDj7BZBw1BB1W1VPeAgs82kO91gsvhuShDnBTHBPOvXyJIHr?=
 =?us-ascii?Q?21h2UFtoUsrPtBjfey15PzX9m5RxKMyKmUlUZRjz0IS7Cs3YeqQVMBTjFEiA?=
 =?us-ascii?Q?BhcxD+em3uM7VvMmK3YkOZEWasBMo9HmeswaDYTbOnApcSM4RxocX62sXH+F?=
 =?us-ascii?Q?tcfeOOsvC+L/DwNtFvIOFjcKBLZBmM8lj20gUKYug9hogj17hsUscXMlNXGI?=
 =?us-ascii?Q?dVi8AJzeDtgjBTAtCTpmE0qsRqKhZUr4FUaXFiTEhmCfIALQfYDj/YQKLwmb?=
 =?us-ascii?Q?JUNmB8gawFSIls5bU7QNIl/8cJRh/kxiL/i1p7z9p2Gh7akMLHeu9p4ALXHD?=
 =?us-ascii?Q?FTR6uEB9/LWIpRG81UQir/hGVSzg5PxwJspbEBERtdpSTGir7apbAozOjM9d?=
 =?us-ascii?Q?ogeB5dWIgNo0BkB7wWFl6eVP0noBk6lQhysyeeo/qZ+2UPQnXtNhodSxYopR?=
 =?us-ascii?Q?SbhDnN+xNHzS1xI95Mtyq21KW1m8aH0bF112+efzddDZdX+ij5pJvDdVvGYP?=
 =?us-ascii?Q?MwndSSRL+ptxpk9Nq02PrgiIASeotQOrek5JPOu9U+FhkN1TYnMlNXo4mOzW?=
 =?us-ascii?Q?ZqyVJvHCTpVe1hBT1Q/EyTAhnA2BnfOqMT/uK4egwC38ddK32zoGrWyyUuMs?=
 =?us-ascii?Q?YJ732mcCbbj/Qve+Ome9sDzS1qH4h9iLcQHm61ybauZ5M2U0SeRNKCdfgPPR?=
 =?us-ascii?Q?pCVHakM5+8aN2r/1anlPYHUsi60+COhfTVT2kVFWZbxkzp4YUoOQh35puYbs?=
 =?us-ascii?Q?POjldQdbw2hq319KkluaT8mCnmcNqbLpw3rY7UAvnuZAFJ5tLzfxAq17Hzto?=
 =?us-ascii?Q?/dcZaBTm7tYX9MQkWRtZyRGailUqncBdTgYocsd6zAi8MwcRKRU7SBHEu8wm?=
 =?us-ascii?Q?PZYv9sLCSvAeZgTnhK86/uc2pvjxPcfKnC8TCC+gNdAXZB3FJLqv7KhoaWxY?=
 =?us-ascii?Q?s0a0D+LGg+JlbXyoO60cxAZWnGf3YZE7r34RAXu1ukbf8lp0pP8hU3nPz0Ue?=
 =?us-ascii?Q?UXXchpqJ4HxwTd0FongKO4flBv/zsKjNwwGIPiIsH3iZThzHmVSUKTRA3afR?=
 =?us-ascii?Q?v6WBAafh1+bIPQalX9UTOozPvNcx8fxb6I0fjkgJA2qA6oFsfGTADtL1XJsJ?=
 =?us-ascii?Q?s36F5dFFHpo5GvS0gnanVdbZZ16Crb2p6HdUOmhJPV9cIU64aw0BiH4uY2VD?=
 =?us-ascii?Q?4UhmXuVD3daTnoW1TY17v5wKajR8xEROZu0ZTm3DiN8I0IM1JTUjnh/C9oS6?=
 =?us-ascii?Q?CdsVWCRgYtz+1q/DcjHMMuthPfIvvspqr5HpzWGSCwUYajLN3dnHJ+caDb9c?=
 =?us-ascii?Q?3hYtqM2QgapQ9G92XV2elicvm+VcMEEWUK5NvV2MIXNvmLQoKt4zWFwgep4p?=
 =?us-ascii?Q?rNtzupbFlF6ApEefzdT9wEOfrAg22WRh4eMIQMeiTXO8la80hpYhUrpgFHxg?=
 =?us-ascii?Q?fHyx+sQrzjcKM/MGvx7ABNVJs/kkS1XimViHq9QIA6JbXEwAhV+CWTFvTgFk?=
 =?us-ascii?Q?4GdbO786/ojvFcCeRb4QwQEAxCDK6IC0k/VN9pJqt1BYfH9L3dLDzpjMPOHI?=
 =?us-ascii?Q?01BtxUqMGrFqBI570caMMaWLf2oJ/5FVl9+LVbKqqfI/TXa8agphipkJy5wB?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3ccc61-a884-4b0e-275d-08dd49b25b9a
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:34.7737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH/zslY8cXNJDapQpWpKtgAT7wVFM3TSrhzrMH/zCIMPoR7aFjFHs1m7G8mr52KdSOq3Ent0sJJBLXLGKujo5ZguTog0Ic4Mh4/K5l7xbpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_010755_312973_1ED17D19 
X-CRM114-Status: GOOD (  11.96  )
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

The existing Kconfig parameter VIDEO_WAVE_VPU is ambiguous,
as it does not clearly indicate that it is specific to the Wave5 IP.

Rename VIDEO_WAVE_VPU to VIDEO_WAVE5_VPU to make it explicit
that the parameter is specific to the Wave5 IP.

No functional changes, only the parameter name is updated.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 arch/arm64/configs/defconfig                      | 2 +-
 drivers/media/platform/chips-media/wave5/Kconfig  | 6 +++---
 drivers/media/platform/chips-media/wave5/Makefile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..d904d4dc4f0d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -837,7 +837,7 @@ CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
-CONFIG_VIDEO_WAVE_VPU=m
+CONFIG_VIDEO_WAVE5_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m
 CONFIG_VIDEO_IMX7_CSI=m
 CONFIG_VIDEO_IMX_MIPI_CSIS=m
diff --git a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
index f1bcef5177bd..914720a35de8 100644
--- a/drivers/media/platform/chips-media/wave5/Kconfig
+++ b/drivers/media/platform/chips-media/wave5/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-config VIDEO_WAVE_VPU
-	tristate "Chips&Media Wave Codec Driver"
+config VIDEO_WAVE5_VPU
+	tristate "Chips&Media Wave5 Codec Driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && OF
 	depends on ARCH_K3 || COMPILE_TEST
@@ -9,7 +9,7 @@ config VIDEO_WAVE_VPU
 	select V4L2_MEM2MEM_DEV
 	select GENERIC_ALLOCATOR
 	help
-	  Chips&Media stateful encoder and decoder driver.
+	  Chips&Media Wave5 stateful encoder and decoder driver.
 	  The driver supports HEVC and H264 formats.
 	  To compile this driver as modules, choose M here: the
 	  modules will be called wave5.
diff --git a/drivers/media/platform/chips-media/wave5/Makefile b/drivers/media/platform/chips-media/wave5/Makefile
index 3d738a03bd8e..81be0e1dcebd 100644
--- a/drivers/media/platform/chips-media/wave5/Makefile
+++ b/drivers/media/platform/chips-media/wave5/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_VIDEO_WAVE_VPU) += wave5.o
+obj-$(CONFIG_VIDEO_WAVE5_VPU) += wave5.o
 wave5-objs +=  	wave5-hw.o \
 		wave5-vpuapi.o \
 		wave5-vdi.o \
-- 
2.31.1


