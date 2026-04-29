Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25269CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuK4zv0/R3PG4vD9wKQwrN6XMQ++mkKE0h7mGEJhMWo=; b=m82H7c4zikGKkJTpYBN2lD2Nc0
	UVgWbrEVMIo+6jeO9rl65amPVCI8/jnryoyn/9/TyJzAG0rqHiF6/tf8ormnL0WJjOwowO4qEGL75
	a0YMZwub8SWV+DV70N55ZEhPyPgWoN+n9NyjLAYbzO03zXqGN+ttYygkQfARC78NCDL0iNV9sfsbg
	6YrVO1gvttpnl6mP8qyXIAeSpOfDAsY8WsBdocmKHn6csiJPTHa5hlOv4i/dJaiOpOKv7aDiueJm1
	iQ/W5DpE9Vo49v+gaO+vM+8b0IkQwGwmpDW1m7f+1OAzsAFt9YcSuv3T36Y66siSqBSCB7GlP8O1K
	PNO2RxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ6-000000031KT-1q3E;
	Wed, 29 Apr 2026 06:38:32 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyZ1-000000031B6-0iTY;
	Wed, 29 Apr 2026 06:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqj6ubh9wQA8pzwGmkUlmKi3SPH1GDlniD+5CDtUhdUXHavjpHC0KR2L+1WXPOm8cRWYqydfnBIb/OcSVUBSXyikCmczzXJrWZL0sxMNwH9MSD/yULdsaZvJhBnv9Z9qjYm5ti6wPcMbbYcVFvvRia7KQ79YZUoMnGv1ySfr5hbdY9GeBOeeNK/gvB8jjfAq/F30S79X+73AmdFwZTvBGXILBtuUW0Q/2zFeoH/d34JaIrMkcMh10w4H8Fh2F5ISbVTq8lClno7MVAPn3c76UiOE4suBlghtc2IEWunP7BHYeY5nbjoox64IQtiyLtbRYXdYnrTG+80kFofReb0P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuK4zv0/R3PG4vD9wKQwrN6XMQ++mkKE0h7mGEJhMWo=;
 b=KWGe3qbf0P9W373PHcKcrmsFuTDLnshjChl5Ia28g83oa5h8oEgCu8USPtjyeiDJmQh6oKF2yhZaZgy+5+rTX1cuMh520rrDKHCQHo3+EzwvLe4scv3W8Wnq9HyxfOhViF6CXZKKXBSVm3ngk8czE9sEklpwbUeuanq8VeJp9qQQPa34l8+QpUO/XN5i+ahhMaDKTnlDV+5S0Z3Hli0k1IguI1fmy0uAoQyptDasXpYysG8ujQT8WepjuzwxAPknYe9fl9neccYraYz1+NwalbqQ5s9v4rK6Pukz1lWROqdpLb+wUg0H7fHxWFgeEGroAl88X8N6bmMrXroqVmPe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:14 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:14 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 4/7] arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:09 +0800
Message-Id: <20260429063712.2150938-5-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429063712.2150938-1-gray.huang@wesion.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b6b865-449a-4567-b305-08dea5b9e3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: g0z8CsSyp/IZPuvEiaYa1QPCqhBtThXXxWG8UuLTGJPatnQJBXz9Ils7Idm9MZFrWJjjmbMcJ9a1hhhvqg7WonXHcD5ZcaKUvKlCsl3KIG2NfTQZK2c0qllINRNnNm4pgdWfsin9apT90GYlAFimcfaKDI4u/EpjadJyERF+4wDGMKQhb3CGaf3d7KX0GX/Uxp29OdpgegFe9yMPN/S9Ky8ghQxKiZBwuryIhjqh70t9yUFG+k3YJoks4IONwjAt/BPYoO3FV8ASVhFa6aaw/SLleTrFO4sAWePW0udVfs+zgRBMcj2HQKF2yvY4EzZdZ3doDvLF6JLlXlRsEC3xlwcDBHtUVYUvO8rClUiXUVZ26LE01FOldHjpHczInEXYkyKfiuTue90qms7ySvOs7sA3kDQdgiuRWgUEdT5YRHJxJb1FMsWQPI7KsIxagHKRwEjtf0CZS736t6kqwW8s5uh/uPvY99ckKE3ewsk6YeViPK76AxpF7IB7L9pacnpDSHrrnJqiOw33OIX19CpdAHYksRJVuE1bH+F+7YebSMc9FDCTKP1nQZrp343pj0IRIlC6jdJw96OeRtUGTZo/p/yGup0bFMn/x6Gegje1iadvmTEXl1XHthWie5003ZViQO6wKXC+4y+lYTtTFAsRbfdghBgAnfEDpDGMhS7XeCkyd6XD7Pbb/ZOK2A6jqqRtKv2ZkjYbXhT3TiRNOe44oGKGkl51ykLXgCxGRZNCkMA/Lkt6Lruz3A1DXCAyXOPiT07BW6Y614i8VsdBPL9Zfc05Pj8GyAN6MMceVAjnA20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFvhBEveS2KG48sx2wIJsaNdEAZjYggf347lL97exYi6Um/2SJ1ObzU/ZKxe?=
 =?us-ascii?Q?UIG52OoDn7HOYBAlTHqtZM1tBvS3n2BwFU+KzSNz/Ur4G9//p4eYz03ZbFNG?=
 =?us-ascii?Q?t/QqoUAxbYoTRo8uyJOuKbfoN929hEUdnl5xvoWkwZ1GnF0+M1DWWMnp4knX?=
 =?us-ascii?Q?jMVnVLNeJf85P29JrEnRuua90AScLkiu42lUzrxPymubgmy9An132J+ES1XH?=
 =?us-ascii?Q?BYLxc0D31bdr68q8oQH4OiWnf6ORimW5e1ArBikda9FYsTYgmdpQAVPso6Tg?=
 =?us-ascii?Q?kaJinKRU8W+PuyOgUBa9RinsCFjqu2iuzRVa24+4GKxJa1Vg6ZFHnDXFslPS?=
 =?us-ascii?Q?pNDYTjTjAhnldklRfY/UUBHhbD3OWLYQcnBl1jLOxK4CDxovt3uyYxG23lK+?=
 =?us-ascii?Q?DaIFF/cwO/Fcr89XHLWdM9LBDB/SCdS2dTMrcsY9ezDcqQcVxwpsYRBme47S?=
 =?us-ascii?Q?e36rPe1HGIhTlkGOmxthtYhjWx2CziDzZFaIgKkmjRRKtp++Spu6nDZ0H7dk?=
 =?us-ascii?Q?kFHNUMOX/29s6EAQumVksqogAKQiHMTJRQ1P4yXklvD/MKAuXS/BIUdLq/Te?=
 =?us-ascii?Q?owFJE24EEhlPp7xIpv8IgnD3v/+ohZrJysjhqy6dLgNemIha/XuTnn54vKB8?=
 =?us-ascii?Q?sp1aBvBuCT9hp3xJKfN5cSav4CS8khuTgAiUBMx82Al8DkLj448UejBnK0zO?=
 =?us-ascii?Q?Z/sWYIEJqqlzlffQljC0ZS7/nRHdy5f5CcXPncyqM0pUog11AKVV1INM6QpG?=
 =?us-ascii?Q?IG/FZ408ORdgcgRQCHinthtAThAQhkpG09C3tXFHY3jzzTVVSKIPvjlsDGtO?=
 =?us-ascii?Q?7J7YkGz9QRDbcaonbXKCWtyA4lnSTjaNq0m89VCWpeVIPe2uRqxRr+Zho4b5?=
 =?us-ascii?Q?2R6IBQFNhyOKIyu44nR0rAXYqoTbQBLWMmUc0n6+N4OTQiHx0CvYkc/H39yJ?=
 =?us-ascii?Q?Ynw/FSI/U8Ub5BDidk9T56VHorG1l07ZL8iUx0feOOLV9vla/U/LS5Ae/QUy?=
 =?us-ascii?Q?WKrwI872JV290VnA3Zg64thzyinN+MsBhdDc9CI6wKAFcjdBt9++w+UVpdet?=
 =?us-ascii?Q?FCT3VZScUHp9X3WTUCdGure6Uc02xXH7xL4xHdPCjth+eowkOZdLbMgDQskE?=
 =?us-ascii?Q?61Q1igyzDVYUuDDsMN9QJQ5LT8tIaQ/7nbQF4WPEk1iLXzhkWOkHaLWs7h4v?=
 =?us-ascii?Q?pdgxXw3XBX3XpKH2hu78C6+WZJtupBpLoyGBQCKKt2iGkxt43SgjhbbrX5o8?=
 =?us-ascii?Q?n01A9idi6VA2kTBuSMNp4kAZFpfGJ5Qestd7fwPJVbQaWzgjIqcm3VNpsaQk?=
 =?us-ascii?Q?xAl07lKkLcwb09QgAimWAYSQ1u2prH4A7anGWhgMFXD64u0nyJ6FSmmMTL6T?=
 =?us-ascii?Q?8vajD1JlLPHP/7tGKpwFCUgeUvrqHrVJOf3UzjZr0eBImX7VH76f/ANp4hj5?=
 =?us-ascii?Q?QCc5O6cGI8oxnSPXI4TeDdX22n1zaTPKYUROSkJSFFuSP6FYZcvAHpYzfUcd?=
 =?us-ascii?Q?nfqrSPtQ7hKUplHEGOCQ7NOpjSHCwAjBwRZZGIDCe2wX7uFSeHsns5UDpJpj?=
 =?us-ascii?Q?Ng4W8XqJQtzLfiSFyF8eSAgm8RJTnh1cyGLNuAj/lO2LNGmqhp3AxYunIZN7?=
 =?us-ascii?Q?QjngREkbVJ1OfCJMjyukgv5LDkpfgfIZ7YCv3Lnz0JKnNXdnm9khvS55/b29?=
 =?us-ascii?Q?Ty6O6WW2qsqEE/9TALIVYCd/bBmOKQ1GcLHYO7QpSwVF10pvX92ffKARIzIr?=
 =?us-ascii?Q?Nbo/HPnWlg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b6b865-449a-4567-b305-08dea5b9e3a0
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:14.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSWBS0l57Ny+F/ypX3HwTRmBua+hiuw4zZ9M4/JArkfEWoiZXfkZtwdpR01aBIIFNaUagF9OUpTE4G/KGNgqfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_233827_212176_6D6A86E8 
X-CRM114-Status: UNSURE (   8.87  )
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

Enable the Mali GPU node on the Khadas Edge 2L board. Assign the
corresponding regulator to the mali-supply property to ensure
proper power management and dynamic voltage scaling (DVFS).

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 9cabbbbab96f..0bd6b4260427 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -74,6 +74,11 @@ &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
-- 
2.34.1


