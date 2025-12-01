Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594BFD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JC23zVwyQUFnU/DZDDvT60Vkv1LHZkSJ5XqNGQ1Yuos=; b=TFMiGJZlUfOY3ApkuW5wm4sJiN
	A+Kz4HYDCSvQkk/SOIYAj2UEqlDLOxMsQz56yz7N6nGdWifIR7zd6bep8TvFPcmf2+ds/sKGnVbka
	/cVEOHrBGhMefIxAXcptVOjMHiHyQjWd02q7wZjkz2T//qyHDy9wmW7QUUgxKSJVrQ+Z5gir2aGWq
	xKC1ZPSp7WaCIhyIRAasqVLbIlx+I3uFZ0sKUmHHH2QsgBYdB8a7NX61hhE0cS1dN1KiL7jbyTOa/
	D05dpKaleymcncmIbuvpmeoShqEpn1w2djF3LMXcQtt3Wr2+k2XhWEvt0JhMh+3TBKc51TZul/h+6
	xhX3Dk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0dr-00000003FkK-3H9E;
	Mon, 01 Dec 2025 09:56:23 +0000
Received: from mail-eastusazon11011046.outbound.protection.outlook.com ([52.101.52.46] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0dp-00000003Fjp-3w4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:56:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0W8Jzc1tFfO6tvBO9Wl6HIuTLAViS7qMx7UpfgTF85XFyn7LZK6/b11kxCS8JXAYuMn5CnYZsYqw54mFr0b+0/dODbfJk2BZk1s4ueS5YAyQ/12pdnUt51UhMN8LPAB9XTPZYdjdbaPaKhK5Ed+TDlFCe0nUAWbffxjQufdSQbbEsx2qZMTy/wsou5m4kX6cB0kW/td2Ca2LGTRvIMUpNM/99X/BVZ8Y3/ri1uSTpcfFR0gBZVc7J9NDosL2d1FfXFbt24OVaSmvyfVwJv12TuqyVVdXJQmAzt56cOARC/wQzI3pKshv5hAaQGMmIJ/dILOJa4jGnKJUa9sVXOpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC23zVwyQUFnU/DZDDvT60Vkv1LHZkSJ5XqNGQ1Yuos=;
 b=G0WGfhh/45KtMIoZ9JQda7DYM7rDAhftelmZUQzxuL1k2sp1SKcGXQd9GlFYDXS9pCd83wGcTXy7IsZkqZ8ZQrjKkIbBXlWMp1U6PY62ieQbzoTY8EaMJ7VDqnAwZw7oQzBWCJtoQ++GF9XWgC91COcCF4MhyvdmoLH2mh5ISwv8rM1KfxUqMNWvGsbwr+UqEy3zK9CTrvdFfqvEI5VRUnL9BiITgROLsQFvVkc+4eY2lhF2b/wD+DBLYghFtmMrSswe1x+/EtRu2cqFC6mWVqEoqffv2IFX1dQ0vBRYfXaceUtkrBvdNe904GekKbVMW9voWVMhlQqfL8r67FYimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC23zVwyQUFnU/DZDDvT60Vkv1LHZkSJ5XqNGQ1Yuos=;
 b=qvthXgS+Vu9JF0t0KOCrkV9Txj26OLQkZ8MJiGPQr8L7ln83qrykzBpaEzNHBh5tro8qLzHxfosX5jbb0bMZLp8qhjDrSOMWhl9VI4xJXyW+W9Z7gyDrAoNFspcPn5f2UKhJK1+1vQEELaKK+PekaVuDLZ16a0t7TKZPx+Epp+kuwIITP7XNx0+inOiOkYgW05Mn+YcAVy9MeKKzcqSIsE7kU5YI1nzSwIbQRFH+IDsHlW92HY90E/b+S/SSP9DzB5T5x+cRu3dUCewpj3BlbFv84WIzoJYiO8NnPnzC1qdq+c5vlKfSZDxj9jocm9Z35wtpLd/tM69OjR48B6PKpA==
Received: from SJ0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:a03:3a0::31)
 by SJ2PR22MB5072.namprd22.prod.outlook.com (2603:10b6:a03:589::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:56:16 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::71) by SJ0PR03CA0266.outlook.office365.com
 (2603:10b6:a03:3a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 09:56:15 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A9C0DDBCE9;
	Mon,  1 Dec 2025 11:56:11 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Waters <justin.waters@timesys.com>,
	Akshay Bhat <akshay.bhat@timesys.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6q-ba16: fix RTC interrupt level
Date: Mon,  1 Dec 2025 11:56:05 +0200
Message-ID: <20251201095606.990-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SJ2PR22MB5072:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8713e6b5-f257-445f-4f12-08de30bfddf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kdZ4ozca7qVo/wVGVeJ2WbDd8UDChl5tuUc8ncXDEZM2bSWusogoJxxIMzSl?=
 =?us-ascii?Q?slBsb1Mcj3n7sjMwjBp4q0A/8DxicZc8P1aenWnSeRokENyITUbPzanqplAk?=
 =?us-ascii?Q?c9zLfxxpRxg+VOowiogggu0zEzw1Q+8QjA7eRlJx/fSZhdpD7UfgZKR8VBQk?=
 =?us-ascii?Q?QbvmqPwmMj0qeH7dQggOjDV7DE8CgZ1Jqsgarb9SJxFBH2I5KkBhQ/Uv6+gI?=
 =?us-ascii?Q?VC7CeEsS94g3LzO9lMdXP6y/5dmQ+hPMLCWr1zpqEJGh1mlHKLrgFEFO1b0q?=
 =?us-ascii?Q?0Xg5KOPJfbqmZx1ZbWDdjISmFh6IKcZ7je6vYhc9nVUysQ7wvVnjegllDf1D?=
 =?us-ascii?Q?TcSUQdeftficCfUyfJx1sqsDu1BW+7q+2Zd1wTm8rHcidoUgnKtFcURUXIyT?=
 =?us-ascii?Q?Ox3jp8QcMML4I4xT3N0oIrNBx4i77bEZOfxadvdPpTIxazFGAAsXBmhRTYoH?=
 =?us-ascii?Q?f89tvVB1lxSnOM4JCRJQTHwiP9UQ19G0CcQkfn98cKiIlX1c017m8RIgpj7G?=
 =?us-ascii?Q?dt6Jk22clFlQS5AYhNb0/f8ml5tpql/306EwqXcSnuex+vXqJ3Lf5jgMlsb7?=
 =?us-ascii?Q?GiHPO6jzm56LP893SQ/pJ51NGSeXPu/lWqLv9OjlEPFU5Z89SOcI9MnOwPE1?=
 =?us-ascii?Q?CXmeWuydU6Qjl75nK5EV/rmhYVBkGqDUt/2blZ3wejv3g6aM1nAcitkqJqxl?=
 =?us-ascii?Q?0VO6CtpCqKlKYqwo8538E28qN2EwlkZmSxXzLiHQssaELE/wZuJYW5jrC/kl?=
 =?us-ascii?Q?F073dDRO4icELhJ/navhFrYC2naNm/0/SuoQwHDmS3kCmy9zQjDo6IkYR1fJ?=
 =?us-ascii?Q?k7Mgg21q/h0rCJ66cOH8phJpG2vT1V0GJ/LXBkv9q4P7c1M79FekYsCx1lz5?=
 =?us-ascii?Q?jDS9Oou9nh24N5Z7DtK0y62K0GeT9OV8gR118h4tRMCR/5Ozy7kCj9szHxx+?=
 =?us-ascii?Q?rg6y/+zLdqeATlqUWx9s9L/2BmeiYVHzahcN5ttfco5Hjgm7bJ0QHc29NayD?=
 =?us-ascii?Q?XAA5CcXvoZE7b8u+IjQ3Iow3hLH/IXei7KRaPQNu48T3YVfgUoJBHLlYrvwb?=
 =?us-ascii?Q?x0OREavhLpd/UpZ6UMU703C0JX9c5NV3Qy/vVpwvCCyLnGUm9OW4hZNEIxXG?=
 =?us-ascii?Q?YvRssnrugmMoeIxDj71FHhJ2CKmKnJVoZ3cMOJRa92GWSYCV8EU8UmwTMdz5?=
 =?us-ascii?Q?IAtYiRGziz6agvWiJtq59qXAPIKj5/NaX8Qs2zQnsT4JTqBu+/PtpsqGiE8w?=
 =?us-ascii?Q?jyAymElIrLe5lUKBKK6nP0YxzQyzdSVydY/bL+UOkARA+LZb7RWHGHNItmPb?=
 =?us-ascii?Q?vbwBzrURjFutPQpM5ysEYQNsFtd/hVZj9GE2EoZq1UTPDqqHPyfh3s84gZ8j?=
 =?us-ascii?Q?2svIh4ZI5eM1WIa1vGQbm3K7U1qBZnsfEDBoszlz7KLYAVq7RAXFe/sd/ZwQ?=
 =?us-ascii?Q?YQjQOUbJlhfITgC9uylImu5ZgqY1afMs6BxCtK9/gRxnPKpVWduzOFYSCvjv?=
 =?us-ascii?Q?+dAY1subaMUjjto87oOs51mueSp2sqwosLfOe2Ki7Du4imV78voafTQG4etj?=
 =?us-ascii?Q?PTCjX0IWtau1mzyQTb8=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:56:15.1423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8713e6b5-f257-445f-4f12-08de30bfddf2
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_015621_986080_798AE769 
X-CRM114-Status: UNSURE (   9.73  )
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

RTC interrupt level should be set to "LOW". This was revealed by the
introduction of commit:

  f181987ef477 ("rtc: m41t80: use IRQ flags obtained from fwnode")

which changed the way IRQ type is obtained.

Fixes: 56c27310c1b4 ("ARM: dts: imx: Add Advantech BA-16 Qseven module")
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 53013b12c2ec..02d66523668d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -337,7 +337,7 @@ rtc@32 {
 		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x32>;
 		interrupt-parent = <&gpio4>;
-		interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.47.3


