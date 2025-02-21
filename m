Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A11C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/qv5nltLguhf8VP0j0Yf25MMoJWeRS1AwCTGtAbKQeI=; b=nZEMG406ov+Wta3tJQpbucgPr1
	JyIavQlrsLxRG5D2aj9EfY7PfZbkPsPFZkzOoGnUDdn18DOXWimHrCA5X/fzSwXcJ9DuR8+iVfX98
	OJly+IQ2Ls1/6vbVTfrPEansB75+Tq7Jil3qdNyLRyQQqyanI0u+g+b09EWeW17fDya3keC9vXRoY
	dV1z9TZj6vg+OHuXVu0VloolrpwHWbwBr1yUJytgeMqOaqBgYrFY0J4oCC7skxTASL4NTozvBV1e/
	w9RNhN5ryzcThvAtmrWsJ71a3Dj69GWKkUg8RPBxoTNl6tkAD6BXF7FXCz5ZFIXmvnfPD/Vrj5JxZ
	CBgNp8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSak-00000005Wv8-47Ql;
	Fri, 21 Feb 2025 12:57:18 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSZG-00000005WkS-439e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 12:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwDKK2RGX0e8a9lYzJtiUludL5w9czkluJnkjcBHzo1LO+5Z0ttU7SgQrZsh0wVufE2YWxk5tgWEt+qFCZAx9tk+b8PM10kqAJO2gzDRahAysvvdUqH+Z0I2Y/m9/YLS5uQpRQtOa3g59nT75vAgOe88Cxr/8xVM159NUq+d1qLh+Vpe4nRkUkMHq695IF3dMST0NyJTJr8wjhJ6U6CL1Fl5kKZpzKyOZcJ6h/EkCFOaEkRs+o2jwkFrA64+hGNorPwQGgwQCJxeeQC1XS++ZdZnkMx8qxyY/uHExhNiuygj85H7/Z7r979XKtE3xy2a4uCxFoHWpmVwoXNJkBWkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qv5nltLguhf8VP0j0Yf25MMoJWeRS1AwCTGtAbKQeI=;
 b=ojxblQcgesr+i89MkS8sjxZYRjM9R60TkJkoInPD+V/OL5mhONJUp38CUVnHNbTXCzwuuNp55ewTwMe6SnYPIHloN2sPUiBpDfgzJsE4sny2uflryYVijTY5zxLGFjy+TD0EohkoG6L5JIrIen8J+752qyVgdLsuoCaYXcaom4ZLpH4rQV8y1JdQASmA+PmJSZcKGR4B8D9o0kC0wDx44MYVFlFM2rKo1qdzwGyWfgVRLbHOR4JzLPlwAeeS534SK+1mcRgAv1XOVfnu+4Es/m7bZivzY4mBp7qgkKipLY/YCCtVZamT/cWu6yQ+knWRUkdF+rDfmbIIUhNk4R3Nhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qv5nltLguhf8VP0j0Yf25MMoJWeRS1AwCTGtAbKQeI=;
 b=b/RMm9StC/WfWzK2WL5ovIiaX0C/kYEh19j9Nzb7JAEYLTR+ScQAeb32JGZbTGAdo7fivEImG6VlIAcBFoyZ+Od4jbV/ylX5QvyjpaJawGZuI2sNv0nwBHpX7SRF5O7eiJLWJ3MTWrPyo38uqnTwTXc+czKAj3qQSuLkOgN/HFo=
Received: from DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28)
 by AM9PR07MB7921.eurprd07.prod.outlook.com (2603:10a6:20b:30f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 12:55:28 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::f) by DU2PR04CA0203.outlook.office365.com
 (2603:10a6:10:28d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Fri,
 21 Feb 2025 12:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Fri, 21 Feb 2025 12:55:27 +0000
Received: from N9W6SW14.arri.de (10.30.5.8) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Fri, 21 Feb
 2025 13:55:26 +0100
From: Christian Eggers <ceggers@arri.de>
To: Russell King <linux@armlinux.org.uk>, Yuntao Liu <liuyuntao12@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann
	<arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <ceggers@gmx.de>, Christian Eggers
	<ceggers@arri.de>, <stable@vger.kernel.org>
Subject: [PATCH] ARM: add KEEP() keyword to ARM_VECTORS
Date: Fri, 21 Feb 2025 13:55:20 +0100
Message-ID: <20250221125520.14035-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.30.5.8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|AM9PR07MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dadabbc-ed0f-4d54-3755-08dd527703a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oD7ubDZyQb6ske7mFEo3vP8NJSb/WBdO87/cFFpS+/uPnlKl/q3egHLZWBp6?=
 =?us-ascii?Q?iWjlBzK0lHHKRiNE//6wWNqoOyJloZ4PJmNaH567udOhCE4hKSo+cUBr24LK?=
 =?us-ascii?Q?hM+cNhlaC/F9WwLXvwMYEBOkwj65QKt5BNfbLwN8+3gaafqxsLUmEaqJbXAh?=
 =?us-ascii?Q?qst0PdGuuzpJtgmfP7BxGY/d3/Yx6tdEIoTjn1ltpZrSSUcWY/Q4lBHsDm/7?=
 =?us-ascii?Q?d9t37JmakdKoR0Q66d8OWLrQMxqdzhcSuuo4MiBekg9mAG956mme2rdzDrbh?=
 =?us-ascii?Q?+crFhHV0QWgrHmGf1UoPka2Z+z+sadA/hAdYe1dHvylwg1+5+nme4Jw3QQty?=
 =?us-ascii?Q?AGFPRVclIH+ou/54PlaYqjbpM2Pcc0FB2CwozgOr2hzpuhpWjbmLzWfJNjnO?=
 =?us-ascii?Q?vmk9zr2Vyu7Si95gdpUATKaNy5XVA3MYU77E71i7PvYT+zw1XPoBuZdNdOKJ?=
 =?us-ascii?Q?gJyXiVmgLA9GjULtU//2beko8yhilVMWjFx6Y5vNdUiA6sAE2z60DMM+xVur?=
 =?us-ascii?Q?xuicQI51fR6WshhhgHkXPsqyvCjXZTtrUQffNLVHDdIctM/7QiWXCOjdppJO?=
 =?us-ascii?Q?uWtvFI+PUsQM+YcXmtRJwdiboMXaKdQDYADzatUEkXd7Fs0pl4wO3xScDbAj?=
 =?us-ascii?Q?k5HL2AK1b4Z9pGshcMkFOKmzjGI03Ijv7I1SXncXJ5u3tdNcrRRFnFHKts1y?=
 =?us-ascii?Q?0cWBX7ixiQsF7u0JtGhG5wO8ekR9IWOw+8oncTrfdkMlj9YcFO15RrxHKUS6?=
 =?us-ascii?Q?GCJ/0lqz2Lrgu8wseHXvU7O36GYXAmAm/YkFBEq9lbsDQnWLQqfxxFkG34+j?=
 =?us-ascii?Q?VcRdd3FkM39PGx37OMw7RjdqTObX7Xi/smWYNzz/O14p5mMI50qq04Meo5YE?=
 =?us-ascii?Q?MOz6kgRZiW/XQtKyvm4rf06M8esf0kjaiZukUeQv+Jb5N1uJol6+UARSIUrE?=
 =?us-ascii?Q?JARDiOe1dpn5Vgp4qXxprKdzMC04uMLYfrAo7J7xWA7vTbbYSqjiPUIOv0/R?=
 =?us-ascii?Q?CrD0RhXR9lw8RbfXJwkQPbnJD6cAxvbBE+OCtLvi75MTb1UEsV+4wDwqua1z?=
 =?us-ascii?Q?6DOmnu5o7WySTXuyJxeRmIr3PnLWxudB0WB42PNRFTQ8cwVuxwV4AwEN8PNC?=
 =?us-ascii?Q?mCMsy3rDqWuLJu2MkOIh86o7yatUtEOeYIHGcqGtFVWKl4uXt9omUKlSpkfv?=
 =?us-ascii?Q?agBQ0J3Yyr3A4xrRcVJqRmD1Ab/phXXtYEnzhAyCfAokvDiORxEsINxjeijV?=
 =?us-ascii?Q?XvJzuuhDas1QwwtZqvI4W4cT0rBeyu2b9kR6KQMoRHhJWe+gFoHj9a8h5mFh?=
 =?us-ascii?Q?UkOQrcaDwBukIcZqDVzBnigIlx5n8OfDAsHHUR1r6eq6wTAtA67k8bI9L1Vz?=
 =?us-ascii?Q?c5ChAqtQc8XXdZ7JcfIn2csQDp5RH1xG1qQ8eXZnKNvHrZPsHd4cxiP0JNGX?=
 =?us-ascii?Q?AYp22jcMFuZLKUyeAIW3Pz0ooAIZl1cM+qGknCz2ahaDTK+xEO9YPzqOdWnm?=
 =?us-ascii?Q?gLHBUF/nYW78pZU=3D?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 12:55:27.1638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dadabbc-ed0f-4d54-3755-08dd527703a8
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_045547_087709_39379202 
X-CRM114-Status: GOOD (  10.54  )
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

Without this, the vectors are removed if LD_DEAD_CODE_DATA_ELIMINATION
is enabled.  At startup, the CPU (silently) hangs in the undefined
instruction exception as soon as the first timer interrupt arrives.

On my setup, the system also boots fine without the 2nd and 3rd KEEP()
statements, so I cannot tell whether these are actually required.

Fixes: ed0f94102251 ("ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 arch/arm/include/asm/vmlinux.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/vmlinux.lds.h b/arch/arm/include/asm/vmlinux.lds.h
index d60f6e83a9f7..f2ff79f740ab 100644
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -125,13 +125,13 @@
 	__vectors_lma = .;						\
 	OVERLAY 0xffff0000 : NOCROSSREFS AT(__vectors_lma) {		\
 		.vectors {						\
-			*(.vectors)					\
+			KEEP(*(.vectors))				\
 		}							\
 		.vectors.bhb.loop8 {					\
-			*(.vectors.bhb.loop8)				\
+			KEEP(*(.vectors.bhb.loop8))			\
 		}							\
 		.vectors.bhb.bpiall {					\
-			*(.vectors.bhb.bpiall)				\
+			KEEP(*(.vectors.bhb.bpiall))			\
 		}							\
 	}								\
 	ARM_LMA(__vectors, .vectors);					\
-- 
2.44.1


