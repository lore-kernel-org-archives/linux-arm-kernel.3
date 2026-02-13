Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF3EF48CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 05:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=heZmo6aA9aKlebHJSn4JDKai8Wk8CblYl9xak6qAoT8=; b=wS3FY8cggytCfkk1ebda4P198l
	GzzQ+7tq026AY1qZ1EgvK+icYYKMPZhdmnfKFSlxl113rqlTpoV1WpBMe/UGoGLD0zGZKyjbc9LcC
	nmmUGSjMa6dhKTUc4lc15ihZbM56Od8H0S19kUKBZM+GBBLHlYW2meDAd+lxZn4Db2hdXNZQo77z8
	GiOCvPpxUPc8X/Y6kItB21LeVwzNp2HcTKpfK1lVgeqvlkZBHGeldqdWTsn0opgjAIlxlS8eqGm9R
	5ilFsO4zb6yr6aYRzrOtuVPCgayJ5k0rO+xf+kTfgJ38BJ2DW1d/eWTIWkH95gFJ6dbCZSbLKuUL7
	AZUPGNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlsn-000000031NN-0Ywy;
	Fri, 13 Feb 2026 05:38:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlsk-000000031Mx-0CHc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 05:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdMaMMfFs4EsGHxihq2csI9VfWbjrXljI28K5C4ezIeun14HndbkiDwnDbYYhPgfrvCL7yCm2rD7kZgbr/pUfBSt7jL9y/xDSR6OTJmBOCS6Ol9dV1ND2rjD+fbISTavIKsvxJoL5a98+jFByaCMfzzLSIZuYIDMNylFS/tghyI5wKfxCsVaGhP6LyxrkRSV4qcUoogmUxJXRjNnTt2021C9ABSfSciSAWA8xYG/lDUsHehZxWKHqmhuifAldmR1QOPNwnlhY6Pny8UoslE4H/rfXphc3FaXUY+EZvSPSS6wbOVUdTaZ30Kh3vpr8eBEf0leFK7H/Kds0IVnWt/q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heZmo6aA9aKlebHJSn4JDKai8Wk8CblYl9xak6qAoT8=;
 b=Xv16zYqsvh/zCKyOItAw12BQzeoSIq7NfM6u01MD3bsMMCQzvDj/wC/nHcHQRZVnQDZY/x0L+M5Ayr/GaL2DA5XVKnbMuKRbvJFyxIZjDcSvSNquAvgO/unzLE2dib1hbtXkwekKlmVqfb8Nke927khlcoZ0raxJjreIdGrwk0aCy57HuK7JWYNZ5qK/60B2MlzbnLP+guub3DsyKxHKLbRWkYBhgOLt1qzzQ7ogZcd0IBrEgFWuU/WXNitL2I9NAR00lShSTTurCwkpP8qwLZOedaDBvAa54ai88/dwFcZkeBnAg9znX6JKTzvVF9XOk+SwtjETy1BWWnNdPqvnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heZmo6aA9aKlebHJSn4JDKai8Wk8CblYl9xak6qAoT8=;
 b=lHftERZDibp6uQ7qpv+fWXMp6C31U/jkoyPR0tpGibv+PcTy6S9UFmg7NYyf+uhZYSSv14h/veKCzAXUIaMJKvsfNaYJQNQwVZQnaSQ5YA1hHvFo2B3grDmjIopIpCO68d8x0i5v1hm7xgp5nXd7VMyHTa2ncn6lJvLUwHJ+oEB1IF5AEOxOChoVkXoArPxEntzu4ojHGj1Ep9CGYBqXTrdcUjzKXdS8ZPsZVUhwDv3ZjUxLFvmxyHL1v+4qTTpbVfnV7gO3EB6FLYSsFvrcxhvcVa6aEB1OGpswr8kqQjK1+O+uarryI38X+bDEwZyiODK2joX+wgCz8zhKsMTqVw==
Received: from AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::14)
 by AM8P195MB2729.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:32d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 05:38:14 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::5e) by AS4PR10CA0025.outlook.office365.com
 (2603:10a6:20b:5d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 05:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 05:38:13 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 13 Feb
 2026 06:38:13 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am62-phycore-som: Add 128MiB of global CMA
Date: Fri, 13 Feb 2026 06:38:06 +0100
Message-ID: <20260213053806.219495-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|AM8P195MB2729:EE_
X-MS-Office365-Filtering-Correlation-Id: b002d050-4d36-414d-7f05-08de6ac214a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rsycGlD4Dla/thd8pPiokAutu0CUkfU4WNEtp29Fz8a8503/FbDcac7xrWm6?=
 =?us-ascii?Q?J5VurT3lQHv03zp7C+TqEPaA6wYg0iwCPp8T2xlt1DOF1j8Ver6qL1SAMejj?=
 =?us-ascii?Q?2IFyaZv/QHhOhOYKE4KyBiABJKv0wVYN0Dn/gLkheER9quMcTjPTc87MtFXi?=
 =?us-ascii?Q?GltLwAK1ox74xSl4pf0SsgiVIS+N46qGjqfGwJ09kImwnzbbROAX9sRPMPF/?=
 =?us-ascii?Q?LIZVV/E1VkbUXPDLtD+n4XUuLJcP+BWnKj6PsKEqOS0ICa9HgA4aYZoRxhD0?=
 =?us-ascii?Q?NSLTlgGy8sRT9UO+QZZyKWdAVrW7hTgmHaYH+xEQc7dw7c8CmXwAsXk48z4A?=
 =?us-ascii?Q?SiX5LXcanOn9hVodWSSSWizCpEoKCy1/+lMdFncWCuldmAzkOPfM5Rr/pS/I?=
 =?us-ascii?Q?IdLrv2oLAFG1LYUBqwfTdGNKKG+o5ci6fuyi2NXdpXV/6HTOicbCRZtGbdLH?=
 =?us-ascii?Q?IUSeNWEkBNjXPtH/QRvs3EX/CW+N5nR9mrt+pPCFc5TQXmXVnLg5TJgNSj+M?=
 =?us-ascii?Q?SurUx5q14GxtpfKeWSIC7l9lOGMKRkTQaOPlhgEc3oQspurffX5dNxhX6V/o?=
 =?us-ascii?Q?CDLrsmpPD/QJR8fgzRGverYUDeNs9BMskgPu5rk4ReBW0VSo/QSTzP6pg4IW?=
 =?us-ascii?Q?cRH0JJvUI9I+T66NErqrlieyO552Z6chuYDlCRda4Zwyf7fuLaehFsIaLxvU?=
 =?us-ascii?Q?l1+07ibMzqti1XFTW839pEprWRb/DCUJc+Uqo1XvwBSXojhI3An5fETDTlvT?=
 =?us-ascii?Q?B3sfT1M2kzAH4Nf5r9G7KBtx8vuYV8nSUDuC3B8VczcC7rk1NceqF4zssG3q?=
 =?us-ascii?Q?3TQoebOeO1pyLnwDT1nD6k8pERgrvvLO4AcgaD6nm6Y34qzPNysYAlP2vJWd?=
 =?us-ascii?Q?zWL52tgW4ram2/Hn9PXg5F0VELlxhl1zlmBoUOD4LsXOhnjZVbIIFAspmkYU?=
 =?us-ascii?Q?yOg2thtJ8wVlSfU1hPeKDuybfMcvYUb/PboPWxqQPmsKuU5O19HH/A0IburM?=
 =?us-ascii?Q?ZXcSj9TJ65yl/Tf3T7gkkapg/CJRztxZiRexyw+4FzJ6sIexbxC8/wbuq6pm?=
 =?us-ascii?Q?0nCgtRqpBapk2V6I+0wN2i7FB4VLFRmc54pOEbbOagbRH5/iSvqUco/uafLR?=
 =?us-ascii?Q?8toBFGC/PNiKomXS6cYS7p4MdkdSfrjarr3NeO0Igzq2Cf16i8pfbI5NKZ0s?=
 =?us-ascii?Q?G0EljF+PJGQjajX5fnrUubQ9RUzHDAQLJTQRQeFh6IqkNs3+taMPJvlWeJyM?=
 =?us-ascii?Q?r9hzyL1ghT3aC3t6guOmvjBL4+JrhgjdbG+9DCMhacudVP6khPc3pC6Go1SA?=
 =?us-ascii?Q?xepwFaXtk7Qcz32SKim0DmS6iPZfjit3QaCmcsdjEoyKxkU1xDnYLowYkV/i?=
 =?us-ascii?Q?F7/IxHPbaNJwzqEdSwW/UfQlbiVgIN58XJzkghFvbx74mOl3pxIOP0vWHiFj?=
 =?us-ascii?Q?bG/ldAYgErC4qmjfQ9kuPKC3UhptJFY5/9ZXQSYoEvGURbXG4MLOKDts5RaW?=
 =?us-ascii?Q?wu16BcvLyV5/8vQPc0UeIW8Mq+cBqpm6irJOjrB1QnjBqZMHzbbGgMmHeDAS?=
 =?us-ascii?Q?KUfsI/LxtJANQp1Qg4gInjaW7yFL17K1g2Tl0uS0tEhdfVCDnq+JTLVnYYqx?=
 =?us-ascii?Q?4AK6mEP6MZQ44wew85kYtE51ink7WfbvEItMS0+0i7IVEOaKFmSaGa2r+OUU?=
 =?us-ascii?Q?+AUWtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8ExpMPnNvYPRwCVlYpA41yXvHh8tAzP3NYEHvf1F3X+oHOKO/697QRLEF2xy2IlUUPfzVND4GmQggOQyawLOH1eqqZjGH537MHMDEK6pctHlwalhkiUvMtVxcSpJSfRZOCvpvYAOHo1X6mgI6dftfs/MV05dm0uiL1XlWygZqKpmE8iUmNlrr52zN52XtDHop4VH0tshQEo9mDlVC+U4M3uL4vHoZB1aBSTzvKrUFa1O/rox1zsjrUGg1nMpVIG9MLT8xm4mZufyeSMViHCuqVtuPgXKN8vI5ZbjufK5QKNK1uoXm3mIuoxvgAPmaUlBKBXfLZ2keHC3BPxik01ruCIuBVRHN5//MrHwp1ESVvVqjgQd+tBg7VSgJTPZXtY1IYbgjprU6/1RjjM1uu1Ux+oNPiqwPkva48t09CkNUG9H8CYxQbm2y6mw84H+CwNR
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 05:38:13.5325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b002d050-4d36-414d-7f05-08de6ac214a5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB2729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_213822_394890_55A113EB 
X-CRM114-Status: UNSURE (   8.45  )
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

Reserve 128MiB of global CMA which is also marked as re-usable
so that OS can also use the same if peripheral drivers are not using
the same.

Based on the use case described in commit c43dd2fe5316 ("arm64: dts: ti:
k3-am62x-sk-common: Reserve 128MiB of global CMA").

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index e15da771bc07..3baa653257bb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -37,6 +37,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
 		ramoops@9c700000 {
 			compatible = "ramoops";
 			reg = <0x00 0x9c700000 0x00 0x00100000>;
-- 
2.48.1


