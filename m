Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4ACCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 03:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HWj/cWsNdIvzzvsKgp1kCu22d71A5UrVVhMiP7B0f0M=; b=TyRByLTw6snOOWEY49ajF4a7sY
	X/2VMDWDONcYFJqclidqYGKybqnEdvamVskdTF+WYyCDaxRDM+NWomR06mfFuw6f0tJcCkM64A/7c
	AbY4+A2f3Bpgi1R5Aw9jcqEDTncnqg4qsCgx3i4UrY4hb9f5n0vnvSrtdCOF4DckCnTarIrd0RMQ6
	lelOyNtz1qN+KCknoQ9l1XkedS+Rpav+IEbFbEC328UlXxNr5uzgPPAskv0j2oTerLFcb/3lotnGi
	BzErjoSTFzfNb61/eTn74vYDQISdUzONHByFLf3H0Z1PPM7iAZzKjNPYoTXIP9/YxLD5RaZl68Tqg
	PaSnKEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGS9-00000009dOm-0voC;
	Fri, 22 May 2026 03:21:37 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGS5-00000009dNf-05jr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 03:21:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laHzmI4xSR7AL6JvmqdVE+/ZJSjv4LyUAXcjRwNvDCurgO3t9U1gDOxg+v+gdGG+v6x08Q74oHyZwiRK177Z3qGlGwy8IDPo/N/C7nYF3jtk3rCQgIeDwrE8pCaXjK9kmR1/GawRniVBa1tzVWyjI6cPMHTx26eM9f6f7+wd8Xhw2JSJWWXp0LImL58ORkdjTvthTWOno2zJJpXW364CBokXsj03s6LIzCCujRvBpyh9uiY75kaUYCsLE5TLQSPmE0HhNvID7DiAR+NDrYGOw2PC8IozQH/4/bqy2XY1LkHbtyEukRKBhDqgDIuANxvaRHyIYqi2spSVhbOB3RtJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWj/cWsNdIvzzvsKgp1kCu22d71A5UrVVhMiP7B0f0M=;
 b=Ow+gmuXUsWFAtbfYxD52u1QjE0di2eW9LPaTucFoNMPpSIvWO/bWKJpvTU1inDqAw9G3i2n8mqc/fgetD02miIT8B47DuvwS0tAEMef1Awv6Hm7CdSvh5IAdISLl6HoX0SDgr6YWg6BDgSsNagLWrZBHzbScogJ0HHSO9L8j9J/vLXEHAxVZX0c3tz/dUa2qcBzT3vPsZF8qpJFNiWmqfUijDAUByVw/rOM2wD8oYfZiS0lBIZ3q/BR9vSWjbJ/v73vbo96Hq4NeNBverBVRJQb+TX/Ei7JLtFSDMA3UNfIyDaQF9PHpvOlB5R9Hvv1n1QjB+d4107E/lTpbdcoOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS0PR01CA0173.jpnprd01.prod.outlook.com (2603:1096:604:26::24)
 by KUZPR06MB8059.apcprd06.prod.outlook.com (2603:1096:d10:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 03:21:10 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:26:cafe::2d) by OS0PR01CA0173.outlook.office365.com
 (2603:1096:604:26::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 03:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 03:21:09 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D1CAB40A5A13;
	Fri, 22 May 2026 11:21:08 +0800 (CST)
Date: Fri, 22 May 2026 11:21:07 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org, soc@lists.linux.dev
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX dts changes for v7.2-rc1
Message-ID: <ag/Lo+ss9sSnBSLU@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KUZPR06MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: f040cdad-906c-47ce-3bcf-08deb7b12b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: s9HHU3wON0jIgWp1f0BXyTJ+pDeo7Eipjb1pDSS/vExnlayFxjU5wSqUngmrNqOOZbEBJHrdciEmcvGvy8OGzjEbibvwTDmFlnHqIrww77SepX7CAB+zOebuaoib0iPQ6CBE+vhFJUMqhnMJU1w+wREU84I9PebrH5Mb6GEzVlUiy/Bn5dl1fGiMZsiRRiIyQP7546dfK+aCmIZ8XSDf7gCp8DDHaP1rss557YjTH0t/sppBpazLqyYg9y0b4nIMgg8ZBZk12tUCexNSK2pO0mtJ9wynpSBThvokT9d8HCezSH0h7sWrtzSSjq8gogiuPhqzTubIIgokOeY2GuxZONgxsBPMwWuo+1QbULT8klL32ufL9mXP/tLiuUW5f78m4ZAycLQxyT/EtOG8RCFoYqZN4rV7X/hKPujFRu4nhMgWgrjnxlmOWy1ijWrsjhiRskvvJjbx9N+Pbw9wu8IFdC94wYPQC1yawUp9PgXl1hy/qpivSvjHffyUH5eS/DTtZSavJdSh1q4BG8KFBjdsB/EBgoWhQbhTe4qfUWyZFl08YulcIKne9Ssz9/i7XW2k1hwqmogDITmQDxLuDVoFPG5khbBvJKWGomhicF8uCCOpx1lw8sSyyz8kimFiPaWTVWuVCOAObsjLRStDqNN2Zg/GAoI/cOD1Fv6w/L6T3A+q6425YKzBHRORieqC0ZXm+D6RfBNs1WfO7yFkQL57jbVFE6te9cSMtBlZaQmVREs=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +nd0xL2tyJbhCkMsGBa064b3Hk8lzAYErYOEZiv+patFNsGIDf1dPQzraSfCcoOXdOYUpFjI60d8MhjExd7Qrt5lWIXLfOMb/LIRGQWaBHKPIuXtXJKQKK2li9SjjBF3NYaRRJJ3+oNgaDZAYrKOuiJQNZCNLK/Y2j8xKcAhZXiVGu1S+TrW47A1GoQyXli+SKFVt+b1f0t9YWHj0oVxV6tfynTNkJuEu1e+iOklEs4uGEOqzS4jJT370Kp+kQiYSslxom/oa2UXburpzMIU7dfgxvFx0/1jNxslEQkPFv+KYRfbF2kmw2ug+lz8bRASlwCumzc/+DYcAWLpHTFYkzBaA6jg3PUopSgE9pqDk3eu8/P5ZJCrvlu28FwhWYs9vAUdplzHXLSeRbxhTRrWSQMEU+3cejn8e7Jo1js8cj3c6MHMsTKnALiNbZDfRSpN
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 03:21:09.6592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f040cdad-906c-47ce-3bcf-08deb7b12b6f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_202133_060796_79B009A5 
X-CRM114-Status: UNSURE (   7.07  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v7.2-rc1

for you to fetch changes up to 89d0ad7f3a60d3076da2d90ece8d78d0eb60bb91:

  arm64: dts: cix: Add CPU idle states for Sky1 (2026-05-11 11:36:40 +0800)

----------------------------------------------------------------
- Add cpuidle and cpufreq support for Sky1

----------------------------------------------------------------
Devin Li (2):
      arm64: dts: cix: Add SCMI performance domains for CPUFreq on Sky1
      arm64: dts: cix: Add CPU idle states for Sky1

 arch/arm64/boot/dts/cix/sky1-power.h | 13 +++++++
 arch/arm64/boot/dts/cix/sky1.dtsi    | 70 ++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

-- 

Best regards,
Peter

