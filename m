Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA5AC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hMBZPRTvAiFGpApHDxYY/NKstZx3j51GlZqgdgBLWyI=; b=HAuHyfxvVsP9BhPud3vUda4Yej
	ukBGhP56K4Xe6lszoA7D1+sYqcCNVL2VgABVzCpOSkydo8bz2lzqi2EPNq5KD1P090EvkquI+2qN5
	pjzTrq09CacUB6kpTsz80pXwJB7r+DJ1ytFZPYrt6a5ysJE0sLjuLKKkPdGA6C/XPYoqAA/vdjnYj
	/gJhH1Yh6rf1zbvOl1RtdMikcqvMW1k4CMrbKUU6YQqEGB6Oe2dyWALQN9pNDUh0OJuHRnNUD7Jws
	dIdBnYLm49Jfo2Om1mD+DnsKSSz8MfsXUSvQY4VbMfG6AZ8j4Efhx5z77sl/gq7QQoDY0vsu/yQY2
	058BACvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRbm-0000000C98N-2j88;
	Mon, 10 Aug 2026 15:08:10 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRbi-0000000C973-1BLF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU9R1DP4owD4WqrSSD3F4kDWV5sRt3jM2EIgQDVQAsLZ8C+wde4cwnigU9ACfBABQacKESwE6KJau+x11e0gLA5FRRJPkDftRwMMcAfhKWzC8alpjnrD5IhdhHKYRAQNGmb82mzyGwhdUAGvYlLfjZCf3lZ2pahQq047rovZ0BugdFmAyxwLQVvpW1geUbTiRqI1p+tPAnfe4ki7ocv5WxCX8xXQIiNMJLiYMa1R0lUZtcnZnE/p/3RG+v25s9mP34CxTFe4Xq4VQK21yFPMROGk+dof6d8v25ZKM1jJ6cFvLCmmDawI1fdClWkWABHE3uBBKz5zyvGOLP6WbL2PlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMBZPRTvAiFGpApHDxYY/NKstZx3j51GlZqgdgBLWyI=;
 b=iMZBHb6hMH2O8Evz0G/FbcffOF/cWTvqNelVDj06YDOAKA9JgQgEhL6gVUhbU+2rIjQRNbVoWG6QHt1RqCuzFNBhN0fRC9ae3203U+nvdDkukT3r9Gx8RufdeKzppIs8blVfXVABUw1dCVlsi6hYzT34lk+sdeu0k7yazFG+V9oe4gZ+RyOa7RbmXEaACXKFHCqrKu5NmJA8nbCcI1fsj44MoZxFRyYZEflKiVTMNgU4zl1oRxZhoefGLqMBfy/mirQej5a+UxQ7JMacYvkj550tNsnFo82HKsqliRWNZX0d/vb7PI07LVa0HQjXgcQzhXMfBVfazCKCEZEpVvk0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMBZPRTvAiFGpApHDxYY/NKstZx3j51GlZqgdgBLWyI=;
 b=E5WEOfSzqyJlEQcRcpcfC6XLOsGGUYUbNNdrHqyntoFmMr8lhMxEyW+5drsy2uEGZQv0Hqsik1cBcL+0Sbyf0EbO+tPFujmNpFOHhLI60kRZhaZ7APEGvkTeC2mRh0I9syc8pgokdVQWeaJ2HN8FkX9OCSGHu1R7F8CUhlue7U3KRHT032Dbqa9oOyoXvCEm0MJKcKIPMiWlYZdVOWTKuGnL5bM1rLf2i8iVoFvxvvGE/FAO9OSTffQs8VpNXFqL8TsAKzIffaV9sra2viQlcIfN/O3oVO328/QWJP7eRGhyTH/6qL/7p1pqwFTSTSs8/+BHIlQY0qy17qEaf/RlKA==
Received: from AM0PR02CA0186.eurprd02.prod.outlook.com (2603:10a6:20b:28e::23)
 by DU0PR10MB7285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:447::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:08:01 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ab) by AM0PR02CA0186.outlook.office365.com
 (2603:10a6:20b:28e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:08:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 17:12:55 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 17:08:00 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [net-next,PATCH 0/1] Fix pm_runtime for stmac_main
Date: Mon, 10 Aug 2026 17:07:48 +0200
Message-ID: <20260810150749.458682-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|DU0PR10MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db7aa34-266e-4539-1ed3-08def6f12ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|13003099007|921020|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 5nj6s8qc+IKyLfM95O97ymA2EOlhQlTRukTcJJ/oXFy43/RVpGWTEoEHerOhtcPi+xgYGdzpU21jshOkl+a1yItmURsd5wgJPhkNWgbKYj4ZaaPmvWw9sFs0W3p68o47pbc/NgNt9qxHp0s82GEKybzzHvqqNhzN/pNvLlh6d7n4tHQfiQRkYUD6As8bHbn26/RIVAs0Aw7d3ZUzJbeL90Xzw3NzwEziOw/J8nA4nKBFrq2BNFWYTSgxJodaTxF7PpKgvs5ZpegRE0lws3xqTeKeTUVJXh7Jweff/+knXnajYRPA/23C/O1nba3RvX69M5T3roQewQ03p9OHOZOOWYAQr4N97CresYK0vYp6KLdPT6+Q2b6WdMEKvcV0efHgYSiJwurapvbH+UTo+cNRedcMSogJj+b3XyYS8dQV3t1pN1QZIPYmKkpOFra5keKVaaFyZfaRy8pgS9b7QwS7nbaQ9bCmou8hxWnCBmJ9eTIw2OOpnBiNgnlM3mFpjtf2I4NnNBUYCmAGeaXvgzdjGPzKQDrKxVbOT7G2LLMBw0f2QJlTEdDGwQyW74+MbklWSH88IxPid6NoWsA4gnUeVu+EzSqYZDD9+YINHX0wNDZOiugtQN1uBgO9CieerhJrANHVFTMguAX/kKGR3hleuSbL6YN1nkI/wvqlHsjc/y5cLqUg6zTqH6o6ndXOi4avRVjoBa7p/IDkSGi6pO4U7NO9ptGHdoi7UUyr5kD8GJ1btBc/wQgYos1h7IwGBFaS
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(13003099007)(921020)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4lCh28OTdWhxc1PCtMvudT4csGz7vIb0rfuwUSRmTE3jcQz7zyQ4cHHpFLEzkp44JMcCnWiFdntiaxZj7Dzhk81LtP9fllyCilUnJ2oiQxZFMkTsOaPGap/WhCSixRtgUh0kKzMOxgVy1Ew7J/ao7zyALHYQaDJnP4pElmNtMFYbApaY0X4QMVCkqh/JTwZxDqOx2UaInYW4AdfATpnpVx94HUOTtAxNRYiT0/P73OadfQZL2Nyr5RIwOYXCTAkT89PpBkoxBoCPkmATLmjTBr2rjTmA/TlssCYnrLjXBl/nSc1VU8V1E6/863SfStS1lLI+arBeJQuLLQ9MDAx2r/rctQPImDBFH2Msmug94TUiQ9IZgRb/fSCaTJJxfmT/TOqglKDLcZ9rdIIGKXrX/YOeYsD/loJr7LLrHQTzGTxk7Q20l29E2dadsUCKm2cR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:08:01.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db7aa34-266e-4539-1ed3-08def6f12ba7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_080808_055834_D7CD1EBD 
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

Fix an error during ethernet probe (deferred because IOExpander used for
Reset Ethernet of STM32MP13-DK is not ready).
The pb is the Ethernet probe initialize pm-runtime but when error occur 
and exit from probe there is no deinit of pm-runtime so when the reprobe
is called (after init of IOExpander) pm-runtime is already enable and
the balance between "put" and "get" is not symmetric, so Ethernet genpd
is always active. 

Already review on series pushed on :
18/02/2026 https://lkml.iu.edu/2602.2/02822.html, 
and 04/08/2026 https://lkml.iu.edu/2608.0/08550.html

Christophe Roullier (1):
  net: stmmac: Fix manage error case during stmmac_dvr_probe

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0


