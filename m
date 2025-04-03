Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09220C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=93NFwUcA6Vek59lEvx/wAojtyxbhMP87zKqqcQ+hP3U=; b=Uhe73XiryGd29w
	9pAwPBczGnkVi/9mQc830moZJnbiSaJFLbPa1ftf0dq5Cp9J84iHnF5CWkNM7VHzfh9+7roXyjeTr
	8WuNr0CUwtcjUI8FtcomozD29k2GbDdk+aLuqe5CzHvnDjAdMbyax6TfuKwjv3BESMnWT9mQHa9m3
	TFn1Dc52Q9WM5HyrwrfC/0EgmPncqjm98LPSYvRDln8gvT846gPzfxEuD0gWRbdLPMU6jd/KWtKde
	NJlzKMxrGvQiOHqdq42dgqJmbWGHIW7JwZRwLsSmZlbcJj30WBk/TSmcsKWtFnN/KlsVOmNl5V++e
	NPto3k5BvX6rYM2SC8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ipc-00000008ist-0cAe;
	Thu, 03 Apr 2025 11:34:00 +0000
Received: from mail-vi1eur03on2070e.outbound.protection.outlook.com ([2a01:111:f403:260c::70e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ilz-00000008i8M-2Kp7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 11:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3h/kuKg9sF18kGz2KK8UnOenIA49FtoMfhDjdcONK+He5tHeE/HXyzxZfssr6HvarbBnKIz0/JlsVXD8X0PS67yzUIKqWJ2hwPensyXRzcHSz8jvgevyimuhWfgqXkpY2X5joNz2JgckezQ2mQP0LXQT+oGe3GCZ7JiFX3mo1cWptol66N0mYArKyL0jPmsdNXT3ZI9r9zJIIVoZnJ7CGo9zpihr+gUfbk7t59ZVx1e/5bhmbqzEmThLA9uaaolW4GDsIAlmswmgVlPPpg+VnpAeL31hgVpqM+erYjj1JcEUyJliILFe9CV9nxAHe4o4oFlmF1GvQUZkzuxio0rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93NFwUcA6Vek59lEvx/wAojtyxbhMP87zKqqcQ+hP3U=;
 b=cFEYEV5+Uk4KEAjgAxo3/lp96/k1SEJEQi4dB3W3Up/08UhefR1cj5Qvj3rU8kc9vZnXeI49BUs4XdBV4ok9TeCMV7NQDwYtS7edbiFaQymOfULmbat8rmDVN+W9fUiwea/VvgHAIVX6RbnIysiswraSQvacHaNmdaecY+k0Y0HWWYekrEXZSdQCBxmo9H8SPmh5ehRHs2GLun5NsKiqxvJE0OAPm98a7q3P2mVax6dZiyCguU+ae3SZrGsGg64NWk4vI2AODg0sXVvSYChsld55NPaArO6OcD9JrLNi5NGJtG9dM629N1+P0eCHy4ckndF54SLAFNM5nG0eVQxT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93NFwUcA6Vek59lEvx/wAojtyxbhMP87zKqqcQ+hP3U=;
 b=M4lqDWVuUxnhfktaGsgmWZ91Sn3du7zpz3oDBO687vGqGHj4sk9mB2Y5kFV9P9beVYMmfalkAAINPqv7HhVI4pCmTi5A2TYuRgBTd9CSeWH2rC492ajEwftPQ8xVwpGr+mhZQsxT4DOq3IIulW2suZG9JxPbeB0djxRmHV2D1m8hE4ufX9BwALXNIDTe5oAdSxmGE0OOKXhiWcBoYM7jC5SVOQSs/YeijgS6DRXg2bXKQYnEbI3yH2vMVmVRxuwVOY64QCEjJxmHBS54NRXb20mPOx64b44psOMcsXxR25KkeyvQ34k8RJ3gbcv1wWeumVP9JZatLziPDJtopHTDbA==
Received: from PAZP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::21)
 by PA2P195MB2520.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 11:30:08 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::be) by PAZP264CA0039.outlook.office365.com
 (2603:10a6:102:1fc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 11:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 11:30:08 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:07 +0200
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:07 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH v2 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
Date: Thu, 3 Apr 2025 13:29:26 +0200
Message-ID: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZx7mcC/5WNvQ6CMBRGX8V09pr28ledfA/DgOUWOkCbliCE8
 O62uDjqeL58OWdjgbyhwG6njXmaTTB2jIDnE1N9M3YEpo3MkGMuUHB4GQcrDNZ24Pp1IgVt/Ay
 LHFwalPUE2gUFCquMY1FK1MiiznnSZjlSjzpyb8Jk/XqUZ5HWFCm4EPnvkVkAh4Jzap9XQaqk+
 +d/aSk1D2GG8k8hygxzVWkpdPMlrPd9fwNlIoh2MQEAAA==
X-Change-ID: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|PA2P195MB2520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcda1d9-3039-4ef0-f239-08dd72a2e379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0NsdVZ4VHhlMmFUZCsySnZqOXVkM0cwcXdOdGppL1FlNTJ1NklpaHZRUjU4?=
 =?utf-8?B?TENzRCtpZmsyTW5JWitpN1NvZ0FGU0tCUTN3UGhKQTIrcDZ0citocnF3Y0No?=
 =?utf-8?B?d1NDZkRpcmZaOWRDSTErc2lwUUNUWnJlOFFwNk50UytZR1o1RS9hNFNvbDJm?=
 =?utf-8?B?WGludklRQkh6T1h6em1KZS8yNytCQ0NWV1FERFhaZUJaT0RjWmUxUmh6eVNU?=
 =?utf-8?B?VFZIRGJyM0gvMWxtUmRZdjE4L0JQQWNMd2RPOHhLNnFXbGJpOEgrMkhlekMy?=
 =?utf-8?B?K200bHBRTklRQ1gxbit4YVpoQ1VZbytrakZIWGpPNHVlbEhJTFZNNERlOFpG?=
 =?utf-8?B?M3VqR3o0eEY5UU9KN3M3dm1aMjU4L2QrQ2djUFp0Q2M3YlF5SCtBUnhjdnBC?=
 =?utf-8?B?WTU2NlpUMktYTnczenhDMjZ3c2E3SFZWaitPekRDWW9yaGZ1NXluQXN1cjNE?=
 =?utf-8?B?clQ3ZkVlbE9nalBsU2YyaExwbE9BSDJSZjN2bG1OVlQ3djBaR1ZCdGFhOWkx?=
 =?utf-8?B?QXE3bGQ1MXhtUTRLbzJpRGluUlYyOU5Ya3VHWXBHNVkxSERGWWw0MlEvRkds?=
 =?utf-8?B?SE1ZSUhNUHR5N0QrVjczWlBIdTEvNERseXpLbHhaUDJXRjA3ZG1NcGZ3cFh0?=
 =?utf-8?B?SXltdTF6eGgxbmcwdDhXa252M3V5eHpDREpYMHVyNXhQT1ZUYkdEWk9oa0tP?=
 =?utf-8?B?QktSc1hYNFdPTTBiK05oblNJWHE4cktWWVNOQ2pJWjRzTjdnMXRpaTFVZnIv?=
 =?utf-8?B?NDZva1Y4M1dRN0t3a2NRaG1rdzdIcmxSU1dQWmVlS2diUFcxcm9Cc2s3L09r?=
 =?utf-8?B?M09XU0xEYWhGc3BKSngxcE1LcENLMzluMzFNd3Yxelg4c0FWRjFmNXdFNzFX?=
 =?utf-8?B?QWFtaVlyK09JempLQUVHMlNPcjJNVGtjVmtWbXFhN2dpR0w0Nys0KzRVK2g0?=
 =?utf-8?B?ckZTd3cxTitzeUVDaFFkallKdzhmUXhPdnhpT2Z6Zit4VDZTQUR0MWdCN2xL?=
 =?utf-8?B?VUNSV2J1ZCtmUlhUdjRES1ZtWmk4NjNRT2hnbkR4YzJ0SGo4dlQybDlqRE41?=
 =?utf-8?B?eFBVb0dsZmVyMzJISHUvNlgxSnBjUXZmLzV4dGxzWVoxRWRSdjd0UWNOU2hk?=
 =?utf-8?B?M2xiK3B5TjJ2bVI1U050V1RVVjhtUC9kZGZhMGhTb2ZlRW5wOTNTSHh0bmNp?=
 =?utf-8?B?MFV1OHE3d29mSDA2dWtoZ0p5K0FDL3RINjFuZnEydjZMaVFCVzZUY3dVcThJ?=
 =?utf-8?B?UWxTYzBsZ0VuUXVmWXJuUkJ0SU1EYlJpcVhCM1FWRTM1b1RCbkFvWFBtc0hu?=
 =?utf-8?B?eUFnOXh5QWZiMkNDazJ1WUlWL3g3MkFpSndqeS8zSm85bEhFcEFRMFRXaENk?=
 =?utf-8?B?T01xQlBTMUNVZW05bS9ydDdyd0tsaVpueFhFY1FrSk93K0ZuSDZ4S0Jsb0ZU?=
 =?utf-8?B?UlhZSXQ4bkxpV2xZS2JEY3BHQmsxRldQTUhGSDE0amlPakZyaDlZeWNkZHFC?=
 =?utf-8?B?cmlZT0J4cExwYzJzNEdJb1ZPeU83cncrcVBGWUZvM25oWWZhZml4dEZLVHI3?=
 =?utf-8?B?ODNKbmpoWit3M0h4d3NJNXZ6djlHWTE4cDB0ZTdLa3BSOW1tTm1NQ1d1ak5k?=
 =?utf-8?B?b3R5WTI3MTJJb0ZNLytVQ1p2V0ptenlNbC9PamtQR3BkUGlhY1FHMElqb21I?=
 =?utf-8?B?WjlYNEtLZUNqc0xZSnJ4d1hMcVhtSVg4b2JKcU1rUnBwaXBYUG11T1BtUndi?=
 =?utf-8?B?ZkVBV1dhM1dkaG5NVkZ0a0hIMXdlOWs2cUsxbmIwNmw5TXNROWNpeVdqc2RZ?=
 =?utf-8?B?N0N1V25WNXJOa3IwN3pJM1FZM1Y1amVBejlRSHZrZGwxMWd4cGJHZjZCTTIx?=
 =?utf-8?B?QkNyYjdRYWxQRGh0NC9DamZrd0l5QzhmeGMxVGlLdFNxQlVickJvOU9GMGNr?=
 =?utf-8?B?d09ZZmtEK3NyZmtEZHc4K0M1ek15a0tsQkxwY1piSkR2c0JPN1RHaWd4a0xm?=
 =?utf-8?Q?ocnZ18qkb3aAv4MjmepIDBaRhM6N1U=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 11:30:08.2854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcda1d9-3039-4ef0-f239-08dd72a2e379
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043015_873111_B10E1398 
X-CRM114-Status: UNSURE (   7.99  )
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

The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
and the phyCORE i.MX 8M Plus FPSC SoM.
This series adds its binding and device trees.
In addition add an overlay for an LVDS display that may optionally be
connected to the Libra board.

---
Changes in v2:
- reorder device tree nodes of SoM and board device trees according to https://github.com/lznuaa/dt-format
- fix typo in reg: regulator-12v0 -> regulator-vdd-12v0
- add to binding commit description the difference between phycore-som and phycore-fpsc
- Link to v1: https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de

---
Yannic Moog (3):
      dt-bindings: add imx8mp-libra-rdk-fpsc
      arm64: dts: add imx8mp-libra-rdk-fpsc board
      arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
 5 files changed, 1140 insertions(+)
---
base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


