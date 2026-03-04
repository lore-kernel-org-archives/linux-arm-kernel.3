Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF4FEB7ED4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q3VYBJzfd7KKMEeJHRSdYBNjf2jCJkZzR3CCCu9lN8=; b=2M3MP51ilTry0yvSSYwZYajD0h
	x3vTfgzDfgBIIikpyDycPSuUT4+bGCJkCPMY5MTGMWeQsFZtHLeKgUsEwZugT+aOhmYr0RemwrrGE
	owMJaRflYZ2hEeyuBWR9ROZeffU3z9Z/KlX6JIj8NNn7H8ruSGuqrJO7huFurs1g6AvGvZT1Y66SA
	WdNn4aGyNrd+KgwWpsGiOVtFq2q07z2oQCyP02DiCjHPJn6iDMkcSt1AriqsLA390M3gRSmapvke7
	IaZusFDIym6DZ00JYMhrthXMHF0wB+zbMLc7+Kulbkeoym+g2H/XAXsKqRDsLA7D1DR5eRzRuDIcn
	Om+reymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIP-0000000H4eB-2xYD;
	Wed, 04 Mar 2026 11:21:41 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkIN-0000000H4bA-0hQY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:21:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mB04GG/M+ZxpYrrT7GAYXmZqOdh0DBQu4zj3i2RqY3kTaDhVfHBx30r7nEUKoJCSDM7iqg2bmNccZtqKkKqZ94C2TQtuDHA5EnJQ4SHS+kY3++ydV5fvbjhINiHdDowRGwDaJ8xjebYUJfvlwXtp5/Bjo/s8jdk2kKIue8AIbRMMP8sZWFCUxKpE/oAd9spd8J5krM5mTq9dr5OkJtE8Rck3kdD3XiJ+k35oKvAvL4vEG055Vm+vZGR1GzRwGEMNzrhBUvDXT51M99onQ7JzHwG1tE1g2sQur8vgATGpRKPsqU6Y4GDyOlYLQZKVf7ua7cku/9I6MhAFkh4ICUhagg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q3VYBJzfd7KKMEeJHRSdYBNjf2jCJkZzR3CCCu9lN8=;
 b=YWGZo9VD2pGVF+/bd6LLpgpwb74n4bdGo0N/iwnm83hE0TPaXMkI9D3PmkytRDznX38mdTdRVg06pxvh7kuIh/ZZcNfTCcX79nXOqSmmHbKhBFD6RPRBqB1WgvxNp0HLZE1iIeo2YVhuaaVZVBrkMbsIL32qrkKEEPBW246pJWa7vab4X8zRJJw5317tzOxyt4L3l8bZQKT478t3EqajrLvgRKRP5VTrnRnAkmNMU3e2wo5oVnvfBSsfsRfeCfOIwF1wqd1cmXgJ4rfNOEGdEL0LhJ846lRS901GEj++s5m8pJIousUJ7bJrSpQSiR0yapRnLJxyqkorsoSSfyyn4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q3VYBJzfd7KKMEeJHRSdYBNjf2jCJkZzR3CCCu9lN8=;
 b=SiR7+lzDahI3raiGykLBDRUpVCMP9UxNe9AudNsZzcUB8cvBZL44RXmECjlqGfOZsi2Ttp1Az3JYomsGw2AoepnR+LLVG57UxTfzJbwJZrDFV9nCF/EBIAPUPmkjdi2li92bJspEpuJdS76Wz7IAiQLutlkf3iFukSkl88hPSu4=
Received: from DUZPR01CA0138.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::14) by DU4PR04MB11984.eurprd04.prod.outlook.com
 (2603:10a6:10:61b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:34 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::4f) by DUZPR01CA0138.outlook.office365.com
 (2603:10a6:10:4bc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 11:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Wed, 4 Mar 2026 11:21:33 +0000
Received: from emails-6196780-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-166.eu-west-1.compute.internal [10.20.5.166])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DA09280619;
	Wed,  4 Mar 2026 11:21:33 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Mar  4 11:21:26 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRbcn0GZmzSbZlOQBXfh+FMCAT6OFZQCxkjr4Ty/h6XD3YTY7VIsCnibPL382xJXqrG41ebg3j9suk9Tfe2YyyHaBfaq1zd1ppBq+Ww6nuBPRXvyYjod6zeJTK7Fa4rSkPI3ly82LR+X+z9n7a2vmDrdnctfFzywaYM+h7IyexVadSGh3aR/2GuG57H022ZZoMvpELNCzPL1yAdmgkWPWQn6HwcRse4crAKYtNIydn0szs5CVekXK1WmfonhrNbxQBKQXbkYofgIs7r0xkjddm6b6TtMoeF9kDOG7VASNtD/EqG5EcG1dB0mW2e/QctnAGab3XzsgdnoHZo3vwN8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q3VYBJzfd7KKMEeJHRSdYBNjf2jCJkZzR3CCCu9lN8=;
 b=GRul3Y8nleIBVB+KIla5cxbvgTipyD8VNTmXFGbYTM3GmLtzhYUuJaHMA3hYu8GyKxO29/JvhLf+/YJ1E6/etTIWhDTf52awgGEast6f0GfG6BqitWRjY7j3ZnwmJSDAZXWyr27Hd5qA4UcgOnR0ue42/I7ZfY0nnKrwQ5vxJkBElhNbtdYNi2fKB1pzEUIYyggISb8r/J78qSRbrNECra82R/jc/wm/HVPzj/Ht+CNheRYXfS5dD19IISa0I7IzINrG2eMryV7YU1mpVcSeU5zXrog0Nw3d91T+MSLjYApTck6acBOeshoYm3ZBT4wcaciJmBm89oqepYi1S8naQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q3VYBJzfd7KKMEeJHRSdYBNjf2jCJkZzR3CCCu9lN8=;
 b=SiR7+lzDahI3raiGykLBDRUpVCMP9UxNe9AudNsZzcUB8cvBZL44RXmECjlqGfOZsi2Ttp1Az3JYomsGw2AoepnR+LLVG57UxTfzJbwJZrDFV9nCF/EBIAPUPmkjdi2li92bJspEpuJdS76Wz7IAiQLutlkf3iFukSkl88hPSu4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:21:21 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:21:19 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 04 Mar 2026 12:21:15 +0100
Subject: [PATCH v3 3/5] arm64: dts: fsl-lx2160a-cex7: add rtc alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-lx2160-sd-cd-v3-3-dee4523600ef@solid-run.com>
References: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
In-Reply-To: <20260304-lx2160-sd-cd-v3-0-dee4523600ef@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI2PR04MB10979:EE_|DB5PEPF00014B8F:EE_|DU4PR04MB11984:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b23c078-d142-4801-bd87-08de79e03150
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: CjYSt0+XJP2c6gq/x+W8gSbGu1BeINn6A9JzcM1KzBl6x9mOS8hNOP6daDlJS7FJS+D4NgajfltVAqv6Hs25gggWScuy2IexH7gIDqJZ6vT23Ng1XFYml+P92fkz2fUAnCP/wq1XrqBTHyCfVbftcwmzPYU2aL4sf+L0Xtx1MWD7hzUO6tysOEnScAcJVT7yflpHwMLOHdRx/EYflheCfu0GKUw9oZ/mFoNSCDkFdt4+OJICM4raNwY95NIY9fCEmvf8RBpndIXTzUtqg5ERqVyLDf6+FYCG58rlxMUvGaEndD8OIgWoe6Mot6324P+gR/JTC/owbWzlYqeoWAsSitnW9rtsQoQjwWod37CxBzjAplYSyjJ/1ffBtQqQccxxv9BiciGmYIsaOYw17dJHjngnti0Fc9p5OGY6dXxHD1hOSv8X6OMPL9eB+vfYbsvKt2lEY5SVBV4mWSXoKDRVYvr1pE9R1lw0Tp5U1co2L/EgzFMlPTxosIdM2Dw1VQ8dmI3RdJX+dwshytRpgZsAZB9Cg34XSN5MTDMrmKj8fq1RqDtqaCqPKFu9Ds1EtfJ0osUAyqtEyWmDW4fiF1a2MNQXGCIamtnKV37HeU9k62W+knNdjhhFhUbv4PEGBv6HuYd2cG3STn0spQ55uJsJG+em2y3TKciCkEJzl4GQ0gbSXhE75VuMAsTR/O0tFw6P8k6ZhQHg1pw1m6nyffrRmX0zFAbZoHSPW/QgUk3iailUxGQJCy3JGauOeHNGQs7RChCzKyxlkg6BeETNsschca37wt3jbnXmv31Vt3Z4IWc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5af6cd55a45a411d9178373856b57101:solidrun,office365_emails,sent,inline:24fbdaf47b4eead4bec4b5d78012f82e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f765700c-b066-40e3-ae0b-08de79e028d3
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|1800799024|376014|14060799003|36860700016;
X-Microsoft-Antispam-Message-Info: yB/ZXn1MyhSFHIY2iPBfEF7Eah+e27z78iy5gHi2WxEbEeaTAHKoPYEiM3S+uWMyVTNT83UzJOpKXCv5vvOJKg5EhDmDA23Tj3vWtLknd7J+CN62OqhjlYLIzXFLu/YWqaGwwF5nmH2YXuSNvCR67KJfyULj92djy4xynzJDp/BFN4H1Ckm9z1hyZc092htTEKZllFiv0n5Yr46E8tQxqxXylcLNmZmNSUnOR5E7CU9VvfXIMnoC8tNXyDz6YOPHFTVK4oaVlPaimlweEfDxjxXC2yyILz0qYLNiXNoxdtCpwQy7d1FQNL60PmYx7PBqdJJuqCge+cKuS6q0M16THtl95FY5JJB9gq2LHYTzWoALgjgd1TTyTFdp+hRHIkhWKHthjE6ILrSASamzCG2exGJT5PPTYyt3iiO8BKmm1wDIPGWro5BQiuzM8BPMANTj1b2N8ypWc9gcnxSpijF6yyEVCkmHp2Go+IiqnBjz5XhlVrov/JKFhtu+d2H28Zlwm8PRgwgNlsITt+W7TR5kE/S7dGxnXux/rvJ6NR9Ld9M53UdndWWm6a2BZyZDBboSXDHx3Qe83boGKNN6DCS6j5AvKBN9nIKYNZr5b5IpwqK2EtdlKbQoEv55EoeaWUxTDu8+rvvAOxEN3362x/kOjsaMNcsvVDV8irZQYqo/w3s7px0tKd0YbfU2XHVBpbXgF/LwwPx7RJADE2qciws91IJ7dV1IaksF7ljMJgyhz7omtCdgq5RRRTWCWOScSqKDCju1zirBt2wSYY/YDV3m8w==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(14060799003)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZjvMqPkeWyOAej7lSMIY+xdsX0MRE+uYq2Ko3HuhPUgkVaoAIhEZRzdw6KnVl4YrT50Ve5+692rAFHMl2WS3Mjt6JcTbfZd41HGvSY2kFhJMK19ql+Z7I623ikDeug4vW+43nAQiO273Q7uWXJGw7CwE1NklCN2vz20FC/9qNY1RN0/l4Tbzj3jIWeIf0ES3mnO0w3c+12rIPh8nqzKyUYNQTSucMyWU6rVKTWLPmZesGshruLIf50B5H96jkQowsVbgnkIEmP8AqMrMKgvOQn0+Z9rUpOKAICqhjTuoWR1SsfCgr8QUsBCp4qsIy2JSImTpo5WTMJHzFJZw21UqCMFBXuCIAS3G55T5HcrqbTTpRAoCk7XwEztK1AnssoULPldJahgjjdDUIYwflanyvVFDIMCnpyYpFGWlA5Mi9fbfRgxNDg5bnkkI9qxJSSzn
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:21:33.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b23c078-d142-4801-bd87-08de79e03150
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_032139_235419_6D40F30F 
X-CRM114-Status: GOOD (  11.21  )
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

Add aliase for rtc ensuring that on-com rtc is assigned first index.

Note that fsl-lx2160a.dtsi already defines an alias for rtc1 which
implicitly achieved the same result.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7f6e39e27ce5c..90956ffb8ea9a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		crypto = &crypto;
+		rtc0 = &com_rtc;
 	};
 
 	sb_3v3: regulator-sb3v3 {
@@ -154,7 +155,7 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	rtc@51 {
+	com_rtc: rtc@51 {
 		compatible = "nxp,pcf2129";
 		reg = <0x51>;
 		interrupts-extended = <&gpio2 8 IRQ_TYPE_LEVEL_LOW>;

-- 
2.51.0


