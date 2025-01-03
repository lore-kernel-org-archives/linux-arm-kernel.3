Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B93BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vZY9QBDIw9SLda/aU8ktbQZleMpQBxO190s9ONrMcM=; b=yKxiBjVEwub8M/U395rvKSO/Wn
	wWruXN6/yVXCLEMtyMkXpuHxzMbaBclOS87F12auk0KQdbVIimVA8wurqNw8SxZCRtk0F7odHps3p
	fmPtJXE6ga/nrHLFmvkB7hloUBBfyAhj1htTtahl0LXjsbe6ulAL02rEg3A9QnYyZ1PcfgJCGiETl
	A1irZ3/cFREQrOjwwa1qc3cChNrYjdumrLqyLRYg3nio1dPklES1OY3Ue1oRh3XXb9Q5FWh7RNWnX
	K4Sn48Q7H1fESH6JmoCp7WZ/4QygvHnRXcjNT5FkW5m38dPp4oAOQIya5vCFebM4NJxNHqgGaNL11
	pYzDUo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWNS-0000000BpOX-3bAo;
	Fri, 03 Jan 2025 01:21:26 +0000
Received: from mail-mw2nam12on2071f.outbound.protection.outlook.com ([2a01:111:f403:200a::71f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWL9-0000000Bp2l-03Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 01:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkws4OkZ3W7LxFODY/THzFPXHYTDDRjJtugONPj5pvM+igznxVsOotawlu9pgLzAfG9tADYW7gUuO7CG6HABOHW677iVPoxMhoWx38X5+Jh23sTuIzvZr53XGnSVy/ucdnD7wCD9OlNZb6NigkClySRSw8KATLNo6Cldx9eDbaQJiCZj3WbDx0FjqoYDKS/r2YtJhQe/Y+J4L7Zl5f3BxztMnWDdo2N4AFukjgUQbB+KpwVoie7Vs8LgJunKF5DAazPMKuTFrWErV15yL2T2gitV84eCG+yI+ts93daA3kqooMWNpMzCIqxESH1xW3wHzUXc9vSU7+TIDaWJBhZzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vZY9QBDIw9SLda/aU8ktbQZleMpQBxO190s9ONrMcM=;
 b=fUe921asePbxfV1AN1GFbdZs8PnjxW8jOsCZowNyO72UbF+mt/SVt88+tlzTSXajezXNRMALp6tF/DPThKBz58zx2Y4iEsrN2lJz7ZrnZf7esupmOaIDfayhfuzUvxfaDYF2TWDTEfrz0EUtk7oijeTVv1QXHxa5Ashbo4XSyRW4mKIFOJJjIv5eL2mVEP3AiNiXWa/57QTPg/QUDXCx/3SvGvyQKhftjbGYSju85WfrmipbKxYoAV9rd9dJSEmtpvES6bDsWD9LpRng6WImUl96EMcQmINQbdTRGOyL/ZGc4Qtks9uwAy4xvnoODOwFSDggyWr6Ka2/HYcB9+KZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vZY9QBDIw9SLda/aU8ktbQZleMpQBxO190s9ONrMcM=;
 b=qLMDMXfBfpgclyN8qPK9Ga/8k5TUtJtLWR7trhGfJkmWEwMmD2R+NmXPIq8LD4QsKDXyOSlKn3KzBOwU4WihYB4fNP60Ke/e0NWW30lCDmg9BZzNQvrchgTEvhwgVtt/UfluP5upqvNu44q47hL7gKa6XeycCWmk5vYCy7NU9D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MW4PR01MB6164.prod.exchangelabs.com (2603:10b6:303:72::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.8; Fri, 3 Jan 2025 01:18:45 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8335.003; Fri, 3 Jan 2025
 01:18:45 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: cl@gentwo.org,
	scott@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v2 PATCH 1/2] arm64: cpufeature: detect FEAT_BBM level 2
Date: Thu,  2 Jan 2025 17:17:09 -0800
Message-ID: <20250103011822.1257189-2-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103011822.1257189-1-yang@os.amperecomputing.com>
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MW4PR01MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: d3921a5c-e0f8-4da0-dbd5-08dd2b94903d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DMxNraHdBVVMvIa/+jw6s65zfeS+5Yu1yaTb8fddUhKpocX84BXoCOTHV4ij?=
 =?us-ascii?Q?sLHJEt9eUL8lVMiQyIci1962l5TKsg5GQJwqoAGBkO2539PRiKBxWSsnUJwk?=
 =?us-ascii?Q?qcBmZHprEhrPcJpdPBSahVn7pP1jgKsUm4j5XTcWr2YF0MNk+yH19cyhEd4G?=
 =?us-ascii?Q?VEC0nOBQYeyvr/ctPUdpFgPF7elhWQ3B208vNAvbS8WUSPxIhdh538cbJRm9?=
 =?us-ascii?Q?qpsBK5lBWjvCmF2wfRAzw3X1FuMpdnyJEdRDdw93tSzgZZah/exH8/qhNvgd?=
 =?us-ascii?Q?aWd0uZ/yAYjzaVpJ34+vke9SBq311YZp1Ivztj3mIwxuV0PeJMqiKKjW/FwX?=
 =?us-ascii?Q?TeTaHz5pLu+s1rHeHoY2nI2l/Rl735nPxr/Qt0/mN+SemorYrVXx84LPesIn?=
 =?us-ascii?Q?v2gVmkA2QhgaAH1gUeJCeZfh46kqK2b7B6vvBKae+jE0QmATt17zlSEB8o0T?=
 =?us-ascii?Q?VhJeeDuTHAkka3NGyQD6NjrrybOmG4BG5CfM8OroLSoBX9whAk2fY7vwISe4?=
 =?us-ascii?Q?QHeyGDh2IDVkAApuB68SLwepxOwTNou9dKAfvg4hSTOKIzBGyTabdB528IVc?=
 =?us-ascii?Q?GogLz2vUjBginmFbrGirf3CvqF1025Enk3VRdKWDxTxxZ49eww/aHSxFm2Uc?=
 =?us-ascii?Q?BYPB7hhJbEBTaSs0wqbGryj1SgkadYAwW6joZqHnwE7kZ7H4f4IGxKQDD4Op?=
 =?us-ascii?Q?CCbxJ2OqYnewa8CLkQ9FNzzDsMhI5JZC8EE8lQCk6aMns8cr8E1s/mxgfyBo?=
 =?us-ascii?Q?8vEnYOIJlgYdMPSasLza1eU4SEpVwFR0RFTW+m1dBaqodpRXxENaeCOpZCJa?=
 =?us-ascii?Q?rNBKtrEp6B5eu2KzqsDgSQwJTM+ck8zCzhLoBzpLPDFQHZTUZ2Rx6Ylq/t41?=
 =?us-ascii?Q?9npZLRWMHx4RhdACGkEAVuBIR+2JkZuBXuUQiPuzEP5pJvY/n7IkJ0I2CCno?=
 =?us-ascii?Q?O8ZCSYocv0NcxpDptPyecjT6J7G0tGlnP1T9WwUch6XIBZis+OMI1Ga9XlVR?=
 =?us-ascii?Q?CoT9qONM36dTKFWmA1gblVFL4xgO9F+qo9l29LVVRPKywVQf07mtuHwL8y/0?=
 =?us-ascii?Q?Min2T0xtfMmGiJkt/HS3RuA7M3x3LvR6USSFxqY+k1XwDz5SnL9qAmNE0c9B?=
 =?us-ascii?Q?LuhFr8AONuMCzypUKqj0aisf0lZ8jk8dmF0cnD0A8WiL1V/zbxQFN+hR3GpK?=
 =?us-ascii?Q?f06nwx285hHdIMhiGkwlcuNI6VdesZP8zYXHHauaSNv2f7+k7DFpbI8iaqgz?=
 =?us-ascii?Q?8Qr09yiqXh9ApE+Hjo2giURwNKFNXPnRVx0+T/1DfO+bTgft0Td1Szf5T6xr?=
 =?us-ascii?Q?VqeSwAhDcEYfgoxUtLCBtp6i+wKjE7KeG08gC533nTE+Zj5lJPwVUpNTB6kZ?=
 =?us-ascii?Q?ONwpehGRxWQ6J4xjPlsqR/2iqW3xOf6s95solz0E9MBSwQMO7YKLzL4U98HQ?=
 =?us-ascii?Q?Rq/93JoUOaVjQd6f2xCmH07V7KbY2DTC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2tIk3QBXmXKnlvBN1zCtipNIZU2h+9zqWbVGSw+MZmXgF8Dcs0Ga+56chL9L?=
 =?us-ascii?Q?E5hZ8+icUQ7SUduLtgra4/UQG+Zuyr+RGp3JQynoZ1rNdkAmAopWBBeiX78D?=
 =?us-ascii?Q?7jNSv3Q88hBd+kwWA+0cjMt5wPuQYEADu5GxFQBGqHLFFDo5zbrpLLg4pW9t?=
 =?us-ascii?Q?SSQk1g6V8Dk6Fi2ZkfwXqqLUE2dhK77KdDDYU70Pwq8m4JBEgWplujvJtO2i?=
 =?us-ascii?Q?O2HyUaXnpRXiLT/VMDqmp4MbR9HNrgp6C7bNYOujFEo+3mvhfimjA7+1j51s?=
 =?us-ascii?Q?wXs9yVJbn2RShfkjnf4v/Gy5TP37FO5j6Q/Qb35YHzGz7jFD/jIbS2oi+/gw?=
 =?us-ascii?Q?r40bo8tg/3NnTuIMAvCrHGLUdryaN2abx7SMVNZe9+YvnC6sMzp/IOht9Mpv?=
 =?us-ascii?Q?cmC8hCrhLIcrMS0VUIhezRaeMGJOzuuZV4jVg0K4MtsuowXQ8ZwFc463w292?=
 =?us-ascii?Q?LRA0dB3fLjWo9I8UHJ5qyh4HokerxrBD4d75/xtfMJKZZure57o27JAxll1b?=
 =?us-ascii?Q?oUM6LCxdIGeYM45Ox9EpCdBPrBxorlzImipbWuUzxNdGoPp9sZigHW1cIt8M?=
 =?us-ascii?Q?PmZkXmxkYL9obLuqdDPMT7vFsPtkw5ujqb7MqM7SWRGJVmmvvCDoXI4i4mt1?=
 =?us-ascii?Q?Ls6b1Api+cT0RscMWI6eK6s4BTka4ciGatxG2MZ6+aU0VJY//KSE5Z60zrv1?=
 =?us-ascii?Q?uRiMTnZ4s9J52iBDxegLcG5AvT+aX+tZXIy0kicAg5Nln8TsT5YGZIs7tZKu?=
 =?us-ascii?Q?wMomrqyw//s+bW+gMty9Hrqr8JqcmD2QyNaOYH++Hz90jaPQ4OeIdKHh8d5d?=
 =?us-ascii?Q?4mPkb+wv79TTTaBvXwdZCRLM7Ii1CugMBiZ9Q8i7Di7whqn807y7w/dxk/Ad?=
 =?us-ascii?Q?yEGNfFmAVVVWXqKWwzEFYUMf/fpWIL1NniNM8cTZnuzM5PsUZgPMXWdEO3mo?=
 =?us-ascii?Q?0P6SjMJ14XiBx5LJmU7Muc1CYzqCT4Zd9Lb0uFFb+mt1rvjcuSxtBOd5Pqxf?=
 =?us-ascii?Q?mSHni6vsxnU1ja49RkZCVbI99NF7xFVvZE/W9atRuaZiz3xOJd5dlh7oh8Ja?=
 =?us-ascii?Q?4/4xmzlCXQdRx9zKdixmAl+Qmhp/Fy5wbi7z7AKaYaUgX2RRb3K9MTG1c0au?=
 =?us-ascii?Q?4cRGmMZiHz+QpsLmtewqanoLkB2T7p/J2bzKQKZLSgwSYLLlQyIWpRdzzJgy?=
 =?us-ascii?Q?OQptLJZhl6SCNyp9S2s05K+HfxYk/klJImL/al9I4xI1QI0kofG9m/c8PYli?=
 =?us-ascii?Q?CoUiJH7wd+umTxb7K/8Panp0rRWfyyD7OwhTNJvriK8zK4NgawKdVIrb7EKl?=
 =?us-ascii?Q?19mGvsCWYMgY6XIHcxub6xLnEuKiYb2UWKBaKCQINylSJLBMBt9i1KPwWMPl?=
 =?us-ascii?Q?m3+ZYVVr1YwBiStKWeiDG5mzhoy/bjrjOEml44bvZW7ucbYihUQiLHsHCJY8?=
 =?us-ascii?Q?+pSfJ1icFiDkEIdMlpL8MjNyyKXmxeWqAJQkNCB0itsvpJcljnRu67UnUpRe?=
 =?us-ascii?Q?1G7A4jMQ0V4+WihaLaVKDdwteTsIrIiNvTFeLDUxOmaojeYS0bQegvvM5QbT?=
 =?us-ascii?Q?szndLBDwv1tfDVGDY007wDlCUJ0yoK12naCf3avGwNIS9jmjuMOhVyskLNjo?=
 =?us-ascii?Q?o8UuGHK9AUQRrI4ehtslSsE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3921a5c-e0f8-4da0-dbd5-08dd2b94903d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 01:18:43.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rP02mxafRCFEqAurY0LN3ocKet8+96g+TZwlZBGPxLNqnD6qXXVp+MZyHc8K2OFDvRelebVd7WsO8o9SLVdH8CGpaRmh5NOtCG5AxDglUKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_171903_053735_86973747 
X-CRM114-Status: GOOD (  11.13  )
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

FEAT_BBM level 2 allow changing block size of a translation with relaxed
TLB flushing.  But it may incur TLB conflict abort.  We can handle the
abort in kernel, however it is hard to guarantee the recuesive TLB
conflct will never happen in the handling itself.

Some implementations can handle TLB conflict gracefully without fault
handler in kernel so FEAT_BBM level 2 can be enabled on those
implementations safely.

Look up MIDR to filter out those CPUs.  AmpereOne is one of them.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/cpufeature.h | 19 +++++++++++++++++++
 arch/arm64/kernel/cpufeature.c      | 11 +++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8b4e5a3cd24c..33ca9db42741 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -866,6 +866,25 @@ static __always_inline bool system_supports_mpam_hcr(void)
 	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
 }
 
+static inline bool system_supports_bbmlv2(void)
+{
+	return cpus_have_final_boot_cap(ARM64_HAS_BBMLV2);
+}
+
+static inline bool bbmlv2_available(void)
+{
+	static const struct midr_range support_bbmlv2[] = {
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		{}
+	};
+
+	if (is_midr_in_range_list(read_cpuid_id(), support_bbmlv2))
+		return true;
+
+	return false;
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed8..a60d5fa04828 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1889,6 +1889,11 @@ static bool has_lpa2(const struct arm64_cpu_capabilities *entry, int scope)
 }
 #endif
 
+static bool has_bbmlv2(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	return bbmlv2_available();
+}
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
 
@@ -2990,6 +2995,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
 	},
 #endif
+	{
+		.desc = "BBM Level 2",
+		.capability = ARM64_HAS_BBMLV2,
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.matches = has_bbmlv2,
+	},
 	{},
 };
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eb17f59e543c..287bdede53f5 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -14,6 +14,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
 HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
+HAS_BBMLV2
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.45.2


