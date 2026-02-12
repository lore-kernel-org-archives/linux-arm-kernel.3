Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D32DEB48F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=; b=BhzwcBEkRUELeg9nTM6jgtYRid
	Z80qfKDoVVILZYhXhU86P+9OGNCL2QPfoK8EGevnc11AaKPkrGQaPUVG/6wQ8BHHsikXk7TPxlOc3
	6zhAaCUZlJuSSfBkYJJZEft4rH0lbq26s79645b9+PuVZoIBMIBpNYlSVSN5VEBwhBS7xSlGMB9Vd
	gtZiW171sBfpof+nG7I+vv+PbmEjfG2CeWV13SEDOh3XMhSKQlBNUMA327CyIB6NnMQiv5wOzirdC
	VJFpp3Am3obzt0KIv337W/G6IxWyMt3xGq1/xYKsgETKp5i2r5oKQ3P/BcU6ElG6p9dHgS+k4/7yX
	izqdd/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTgn-00000001v7m-2rRd;
	Thu, 12 Feb 2026 10:12:49 +0000
Received: from mail-norwayeastazon11013066.outbound.protection.outlook.com ([40.107.159.66] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTgl-00000001v5Q-0CH3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqx83QVDj1+60b1zv+HnLOoovINkYbQ1VE/tDNYHk2f54FXwkSVJG//mSRGjZSLCypOpDmhxCQhI15J0SkXUTqeGpD/j1v64VQD4dnepIhBzVW5dOiP55T67o41q3tTHSpdS4+Otjh9SVi6rg2FwFkYfyiVOvlmyqy4YZsF7QJGtTLYj1NPqFHS2zJDgyRFqPN68rCNFrpiZDVeODdKfiAtX92gdA0MGBmHjbBStp15kRVUI/cnW/GfByyPA0Q2eOk47LuSCkchdILVQ76PsAJ+k7mmdjJDmAzGZaHjP59bvWK81NBhB5kq0yGVWxZ5RZLZipmZCeT0cekBMS5nVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=hG/9Px7B8v6MgySmJinzRR9IQfKGAHUrSnUKcTDJjgs0wvK80ggx3QzN8UF3dEfg6Xey6f6El/OQRY8Bx2rpglmrtsQKKa7Zhrrw3Q9TwipWa5lSgxpivntq6MGTtmgfCYBXxtTk5QkAjcZ2QgGH3Zd0SlXuR4UZNrUcyLgVIIAZA04IUQbgz64dVqQJjU+X8FhkF9IMGFi3wPWKECA0VHQ2DjUXdL/C0RMgN7BSl5Le9+n/Ag4P/LliJDkzNkP8edOjnHVWP2kJA7dJ9JeaSN+Szdcv1lvHw9bC16DAhMLRytOwSmU5tQlNWr50hZwBbY2WPt0qXyoNZratY25XOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=ZS0WFVgwJu0hh3blPQ3SMJAPReWwwa1z8yiIXHnuZOIY6UE071RLuKnuuNqm/2uJXjj5NJBAoSo1mCwJdsvLBPDVA6i6a7fAvmqfCx8X+d+eZh2+z6xSb5Oabr3T+cnIS1Y+sdhOyZTOtk/aU67zLhq/NmcTaK0uCp9U0ryH0jfxrqhZwdn+CNfqCfS7Kjeoij/5aKz1eBzJF0Nr0sVNkQU+DPCQDbSRhfKasacmJTJKyKuRgqGpkCGjETCrBenGUgoV4qzjTnkE5/yaRVMveO5KVTL7AQkNT/LTxoW4V7naoqo7v+VKiY7zjwkHdC+Qsb6VupMufmN/2Am2Fa7t2Q==
Received: from PAZP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::7)
 by AM7PR10MB3319.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:101::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:12:42 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:122:cafe::16) by PAZP264CA0020.outlook.office365.com
 (2603:10a6:102:122::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 10:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 10:12:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:33 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:41 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:36 +0100
Subject: [PATCH v2 7/9] arm64: dts: st: enable all RISAB instances on the
 stm32mp257f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-7-02ef2859b596@foss.st.com>
References: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
In-Reply-To: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AM7PR10MB3319:EE_
X-MS-Office365-Filtering-Correlation-Id: e846e8f9-4d9e-4f0a-6cbb-08de6a1f4222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K28vVHArUll3S2VDaXBvN1dBMVVzSDhXcExaNUczL3ltNFI4bDZDekRsNDc1?=
 =?utf-8?B?QytVOE1aZWhSUTE3RTQ3eVg4MGhLWW9iR1gvUEVmN2FDM2lyYTVOTkxFN1Qv?=
 =?utf-8?B?bEVXVlFFNjJaUmZpVDVVeFZSdEVGbUw5QjlXeHEwWFpmdUJOVzRkamlsQUVN?=
 =?utf-8?B?ejhKS0prOXIxdW9KV0liK25VV2s4SS9yMGhNbzBkVXZVdnBOTFczTlRKOUk3?=
 =?utf-8?B?dXNkSkROcUNWSytZYUl1aDFHSit2Ry9vNzQzVTRRMzNvWjF0TVFsVVV4eDNQ?=
 =?utf-8?B?RkZ5dVQzSWtKWEZVbFcvNVRIdTNJY09zeXZ1R2dqbWRBTlBpL2EwRWNScldT?=
 =?utf-8?B?UTBDRy9HM2czeW1pWnpySnZ5aG1hRVFlSStKZkxVaHRjZnpqd01kRnpRY2dl?=
 =?utf-8?B?a2VMVmluV3RrZlhZaEwxS2R1cWZGSHdMSTJvQXNQUzR3ckFyZldtN3JrcUJt?=
 =?utf-8?B?WkhmYytzY1A1ZERGbEdKVHVBbkllVWJ1VGhjSGpFK1dCbkFVc29SOXBSc29N?=
 =?utf-8?B?dEZUMmgvbk1zNlZPdVRJTHJRcDBucCtPM3E0RjFwc0ZkQ1Q5RVQ4c2ptdEVI?=
 =?utf-8?B?VlZyUEN1R3lnZGpIYWJQdmxhYlgzOWxoR0ZKR1J0N0I3RXM4N1dQS2NTVmYw?=
 =?utf-8?B?ZTNNRi9mblhlT0xENjFjWkdQWStpbHl1T1NUbUpyZGdSZGdJYWtGVzBCZ05O?=
 =?utf-8?B?cmJTdmdmL2ZWNGJBZEo3bGkzNDVMb3Rrbzl3YzBhaVJnRmhkTUdUZ2ZrMUdM?=
 =?utf-8?B?STM5cUhDaSsxcVdsbzhVaUtGdGxUemM4S2kxZ0pnUENma05Oemt0ck5nVWhY?=
 =?utf-8?B?SnNsbEFOOUNuci82VjdOdFRBUjJxaXZOTWhyQnRSVm1EWkF4N3ZkMWtzd2Ix?=
 =?utf-8?B?UWlkWThSdEpHNmxjdW5hWkRZTzhqNGdPYng3YkdVbVptUStnZkM3MnhYTUd6?=
 =?utf-8?B?K2VmOFBxMVRaRzNzOS8yQ1NCSmw1R0d2UENxZUhtR09MZWRQRjFmQWxKa1FK?=
 =?utf-8?B?VFB0UzdGNW10QW1nWGxSU1gxSTlNTEN6RFRxUFEvZ00wdklnUnhPVUJObW1V?=
 =?utf-8?B?OUZiYVdNcTlOSzFua254Z3llb0pLUnlsVWt6a3hCeWJtSW1GKzQ5Ym5uWWI3?=
 =?utf-8?B?SjltVUYvSjJyTER3bTNzWUpvMUJla0RZSTBVaVFxN3NudndCbXQxRmJlUlFl?=
 =?utf-8?B?WXkyam44ZFNKaGMydjFnNStWOFJVdGNYM1l5b3NTbi8zckcrUy84bHNsZzE5?=
 =?utf-8?B?V25GUjMxVjJLT2xjM2lER0p4TVlMaUhTY2d0Y25uKzBOUEdxdHgyNEx3MGoz?=
 =?utf-8?B?UlNEK2I4Q1BhVE9XWXZieEJkc0hSMkNLOGJFV0tNb0swTFN3MG5POFV1Tm1w?=
 =?utf-8?B?RDAyWW5JbjcrZUczcXdoYnV4Y0x1dVRWRnF4YXlreXdPazF3WXVFN1FHSytk?=
 =?utf-8?B?TkVjMzRiMjFGYXM5V0wwWHZ4ZjRuZHNLYmpJMFNrMjdUdXZzOEtTNXlMNnVq?=
 =?utf-8?B?YjFBbFVzNDlaV0ZOZCs2WGpUaGNGYXZPUzZxNnI4dmpOUVp2OHJYallJQUJ2?=
 =?utf-8?B?QldWcU9Hajc5eGF1THY2UW43Szd0TCtDblRRcHpuMUFSVE5LNGU3OS9NWnNT?=
 =?utf-8?B?NXU2L2EzU2RyLytkSXo3RTNhdUkrT3JMeEFoNjVjNXFMdU9zM2wrekxHWWo0?=
 =?utf-8?B?WWN6ZTZvQk54ekNtRXV2elNTYnN2K2hqTXVQVlI1M3hVRnpmS2t1akprVDZ2?=
 =?utf-8?B?ellVcnVmVTQ3RDNjTUxiY3FONktld3VEeHpNM0MwOW5wVXhlWXczbTExMENI?=
 =?utf-8?B?dEY4VytNb2d5RlRBU1FkcnFkRnNZZjk4ekpWdW11Q1o4anozek1RV0k5dWxH?=
 =?utf-8?B?UU96U2JDMGlmUWQwNWZ3bGdaVGtlYllYSDAwbWVGN0dTeWczbkI1eEt3YlBQ?=
 =?utf-8?B?VjhRRXRKS0YyZ3RtaW5LbStZSzlqdUgxWjk3STlVaWtPYThic2lYcW1ZeTRW?=
 =?utf-8?B?T09UTlpOaTY0QnA3WFlDMUdva0IzcGpzemNkTXFkY0VmcGdqRmNZOWFDbmVC?=
 =?utf-8?B?V214dmsvWmhCZlFOdkpYSnlBMmp6YWttRnd1b1R3aFRFdlJST0R0cmtIMFR2?=
 =?utf-8?B?TDcveGxxMm1WTVR4QlluWHlOaHVMTEpKVmFFNmZYYlZSNmpMQUtaR001RlpB?=
 =?utf-8?B?WE5QWldLWnk3c1JXMVErQW5pSVBOYWs4V21yTXZKa005V09vdmNQWVM5SHp1?=
 =?utf-8?B?dndKMms1QmU5Yit6VDhNeEhMalVnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5WSTM7PkLeI3tZSp17MH91RX6bM3s9ujFRgmaRax/LRdfq8y192Em/9NHBo7SRwoQNdfZjOewZDIbaBcEFAGtrXIt3HDzEesCn5J98AbUpXvSCKt/HfkSzC8m3FRyYZjHyilaiA7Y/rCph7cXEaZ8cVAf9LWbbWrBhxMG+TB5IRvaq3oLyAFp98JnZoWJBZoFpsj9uiW7p4gIjBBpg4G2JiCzh55N39/zoOEA8EenLEax768WZc1tLJ5X38V6V3nvsPvX1WqQtx6bkB1kur20ZhjatgsuBHt3ejWck4cbA35Zw3xsXPbEGnOniR6DggaHIORW+hcYzq63RQxl3gAG1W58kGXbBEc2RjZIk+jwi+pRA2XgLQsal+vSzqrHVPuBAJfO2FcfcHVj9/ydBeG6Y4rS8i5dmSM9stcQOSY+ptba4QDJfxV6kBonL+MVP9w
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:41.8364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e846e8f9-4d9e-4f0a-6cbb-08de6a1f4222
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_021247_083913_26F5A785 
X-CRM114-Status: UNSURE (   6.73  )
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

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..42894ba954cc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -100,6 +100,30 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


