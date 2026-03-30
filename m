Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D111410D14A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cweVRh+5HmADshRJkv63zho58GEyi97qRMGsP59NF0s=; b=X2IOC45sm1maw0zYXMJUXSjhyh
	xpJ72LJr35wKrLUcCb7P4DymlILh0NeTXJOZTfg1wfykqGzDGP19Bv0YHrJUMZLlorzzYovnApqXD
	ugI5cqwiiJdY17mdDQAxl1INsl21z/siUxR4vQIx+QJx+AxgjqeeOwIE/vdqM3WrFhrgQNDp/UGjr
	RzLS0TjVpST4kReoyWt+hxe3s6o9jmPGhwU+rJlF9USpbzq2e+bNhDzgt771Ew4CKjjsTyLvKyb9B
	sH9Th1mRrmGYFbSVPWSVH46rF9kKM38ONF4fbgtl9uncYqO072R7p7mO1hq9InZ1kTos6HFooBJXg
	3/CRLFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJA-0000000BCct-0Yz4;
	Mon, 30 Mar 2026 12:01:28 +0000
Received: from mail-westus2azon11010038.outbound.protection.outlook.com ([52.101.46.38] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJ6-0000000BCbk-0t4e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLoFr2zCJB9XvCR4DVcqql0MJKLCegJbiCdpAYuHs6zn0by5+V77nfCuKIyEwdCzuxx69KPPZoBEMBn3uFTibFgpqTLZV/1f0ENCs/aFYe88hGZZD1qtAqhNtKCPcYbtxBpqSsT/6pvZr6ICU1cgicJTMYXe5vmlWkFu3F/jv5A9VK13Xb/+Sv2Ikc8p2hSQp3JMr2gVrFxjnDCZ1t50JN+PDmNQM8BvRGoZjBp32imXxoJWrivpowYWRC0XnDag1+3LEVYgk2sUjfyXf1w9YAQSZyLo9VmbMJtLLp9nevHNMQJt5JjSCbRLPLIhKCEK0E1lkk99gTSO20bHaAKTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cweVRh+5HmADshRJkv63zho58GEyi97qRMGsP59NF0s=;
 b=iqfvfwS1pcC0ybTDjhgL+dAOYt79V9CEUfLCKdRyYym7wSyV+uM4xgPAEPbBNKKwOgd0tik+JieZF3rt6W1uKNLn4qJ3OjgWPIxltJDBGrJ8t/dcZgtUuOlG9pfEdodaHZGqv5z0YO1kJaAcSqJhhwyD+wcBsTVsQN+EGxQ9kSOlr/UvvoYCM8rGnS6Vd0NMRemr42IjMMa5Sy5yQXbcKD2hbC7Ss7+Id8ryU3eFDNuCoWaMoY41k/bOI3xF3TFfpltvcxIn6g7KiVp+7E6skVAT+RLYlNxklQ4xnWmXmRKtSrzUE09sg/flYtQLjFHbEAOEf31WC+VyVYydIR6O+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cweVRh+5HmADshRJkv63zho58GEyi97qRMGsP59NF0s=;
 b=Y6h+oTTCNbntBEhCjXn9eKJYCJ9AbIvWgEU82Xiqdjv4IP5aBlIcef8LugoeRaUsd64KfR924UEuEUUO3XJjdlGqmVuJ0rIxoy+eBrdj/43/fglAZLNVh6qJiuJVZUzKdxJ9zC9tPjGI0WVucZd2/QypXEZmQCm503KojazTaoI=
Received: from SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46) by
 SA6PR10MB8086.namprd10.prod.outlook.com (2603:10b6:806:446::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 12:01:18 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::d3) by SN6PR01CA0033.outlook.office365.com
 (2603:10b6:805:b6::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 12:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 12:01:17 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:13 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 07:01:13 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UC18tC242506;
	Mon, 30 Mar 2026 07:01:08 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH 0/5] cpufreq: ti: Fix probe ordering and add device link support for K3 SoCs
Date: Mon, 30 Mar 2026 17:31:00 +0530
Message-ID: <20260330120105.2985200-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SA6PR10MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: a3995e40-d952-461a-e272-08de8e540cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: fIxB/qjP1ayaVSTU5pNjitxwhoRHi8nSkVO/kjOa62zc2A7F+17wuH2KbVRObkVd96I05BQRfSNcBY0h/2/AHUkMvqPXKgHDOqukMYsai6KMbxN4jBnSwYk/TLDwwsW7nwLV1n0HAu2FyK5y2k0bpItvwRCeGYoK00p8OyJywVQcnSMa3RIMvtrUvH8y2PQ9M5mDDiBNK6j7V6DqA9xVRT5yncrk5cOuYhCfsCPLQLxL4Q6fLcMCjy2OqQ+ixGEPBSw0aEAuB6lQEM7/y/6/I7eKCI8CIX9DOJF2X0IC2xJ6xXkyV/ouX1tchsHQd3/BGYg+ysYzV4ZVoWBr4z9/Ra02QxZo2WqvA34TQ2sLF8q/MdMRGnKnFs+3B6XFOzRC7Bx655SqhSD5erFxLZCoSyuzco8SzEnKKSjyaLrFEglJ9LtX7W2am+51dRnx2tHJwpYLctw8cneHixxt6OUcmbXg6V3wNZv1Igm01xeIhUf8rl+ZX/GrnrWXpfCHaPonLRqJRNgwnHbP4Vv8VBot9hWTkm6FV6Ts7ozRKSJl8Aha6D1+D5q+0ZR5bP6sHl4nPjCED1WKW9oyGUzVRrhpe+o6gAS1KBuP5LmPFWI2GWwQ8qZq6sFCky2Vu7ospBCfoVzHEzEduNOhXOf9J1wJ/50r5oGSL83+R6uAEQTbiZHobKLWEK0JTVGQ085Zs/eCSm/apLlcSrEq3zBlAdo04gJKZOMD3SeDbKwDyAcLn83R0/k5w/1yVWVnvHpGNfEob58hKJc0pIb6hgBO0985r488f272oHbI3CZjrYmH6jUbehigDDsbp0n/cqswzWg5
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4FoJI5SyU3CdGnaXtdoOUNSs9G4EocAw957RtrzVOqFOxgr5pM96LHtgW8U/K9PsV6pL9k0PzKES9N1GB+a2PrkbSW2bY1KWMc15LOFsW6hf3yGRrmtmHl1I1NE9dcDH80jjgXx7qWj0V+kBGVsMOgRvuWh7SKa+fEmODjf0INbljxZzrc8s35bbHVibaQw2YJollJ5zair4r+B4xaOtERqfT7BrEqO7peH9wO+ngQ398d5StO9b/0IGMKF9vMhYl9nlBAiiBFOISkZOdCfnAyjcmbrB2g8KgnngEGx7/p0VxKk9pOv6SQ3+cxy8Sg9cjsmAiztEN6O4IstQhOF0rJzC2pavhFR7Aq0N9+QvztP0YsgTrZ4V6YJp5HY5EWfxjIFR2Zs/wfwjUwuTXfH3P7Z1f7W3xnXMqCsAPpV1XwjOMqgdxb8bqkiwv8RxdbVG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:01:17.5414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3995e40-d952-461a-e272-08de8e540cc8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_050124_334068_FFFFD503 
X-CRM114-Status: UNSURE (   7.61  )
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

For K3 SoCs, ti-cpufreq depends on k3-socinfo to provide SoC revision
information via soc_device_match(). If ti-cpufreq probes before
k3-socinfo, soc_device_match() returns NULL, causing incorrect 
revision detection and OPP table initialization failures.

Add EPROBE_DEFER handling in ti-cpufreq when soc_device_match() fails
for K3 SoCs, ensuring k3-socinfo probes first.

Add device link support via a new DT property "ti,soc-info" in CPU
OPP tables. Device links prevent unbinding k3-socinfo while
ti-cpufreq is using it.

EPROBE_DEFER handles first-boot probe ordering, while device links
provide runtime dependency management.

For backward compatibility, the DT property is optional.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---

Akashdeep Kaur (5):
  cpufreq: ti: Add EPROBE_DEFER for K3 SoCs
  arm64: dts: ti: k3-am625: Add ti,soc-info to OPP table
  arm64: dts: ti: k3-am62a7: Add ti,soc-info to OPP table
  arm64: dts: ti: k3-am62p5: Add ti,soc-info to OPP table
  cpufreq: ti: Add device link to k3-socinfo

 arch/arm64/boot/dts/ti/k3-am625.dtsi  |  1 +
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi |  1 +
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi |  1 +
 drivers/cpufreq/ti-cpufreq.c          | 57 +++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

-- 
2.34.1


