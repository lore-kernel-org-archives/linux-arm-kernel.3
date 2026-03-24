Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7C6E9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4js7O76MsTFkhaT3iH5t3A/Vo4elsaJoenAnkOohqXI=; b=pYmWiKzLU/WGYbe/7HuEpRIbQb
	YFXwlWE1hCcGfoByP1TXSsPQvxRu4QAN69nDdNewSwB6dKkM75gfwiTrtPKNwPET8Lr18A/uN+FQw
	V7gcmDiLAqdzp/GIJXgkysB7mcdQr4VTt2N3GF4i1I/td0r8lsD9ZzEdUk4/KZJvf31nWgL7AKumu
	vJEngUraPteUMqB4nVmJ6QXsBm11aX32UwFXmZKSq1rC3nEdbGXJlhwTsBTetNVP6h+YS8tK2IGQF
	pqYrrY1Rzl0LKjf9ueTxXebPbsB9amQt9SgVGNYj/yYvtDgGvRVDa7JtA98a1DIU6Y/XOGSf3Ffup
	ZcCDjkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514r-00000001OwL-1gEs;
	Tue, 24 Mar 2026 12:41:45 +0000
Received: from mail-francesouthazon11021089.outbound.protection.outlook.com ([40.107.130.89] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514j-00000001OrD-1EN6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:38 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kV8I+r1uklsUPbcsOb6/hORQLL99H+6W+TnJZomPlSf13MibZ5Fbh6w6BvA8V4hltHGYY7OpzB6tciDupD2iFpzl3qL3wwlY9aqcwGWy+EmhXRTD3UCo0yg7q/rWeozfmfjqFwVUi5Ow0LQDUZhQFfr0d0BM2LphAq2t2PHum1tzDsLX6MbMB6zA6TKIN/0bDu/TL17wvSjQfAJYwcigtYysOQCFuD2jwBKVIy8yUkQxFAQBPPdgXcROVmOhUm1q0H9rgUer1Je2Td2VMYhHRbGt+DpxfuxgUW6kt4aE/kYkTVg5He8hCHAwHkF2n5zsf2bxo37hv0dWSVlPujmbSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4js7O76MsTFkhaT3iH5t3A/Vo4elsaJoenAnkOohqXI=;
 b=Gd/0iHgB4/wfdhaYUgKvVEOzTNLJnaibfUkYDsbltzW7ujPGkCwXQ6xJDSyMLgSz5tls64ZnhI2zRQp/ct2bEONuZBAx13EEOepOC0X62c3tuWlKQSvUzBOtukjNAY0a0mnmCeVgmW7GeXLyzY/D/UtFYbJkTgyfUt/NYAmGd1xoVB5jPRYiQsHjoEm/vy8szPgcYm2sEgNtHp96C1jyYG3HQqN3WWfkxUTzIRvo1uXUKFSufWakuGYxdyGGZp5VByC0mFacxXBIFAYreemLaxAACsYDTe1wVuWtU26XyxsF7cLT34UDj7j/0nU65yPuYXujPfcj1fgRfpnSsyz5OA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4js7O76MsTFkhaT3iH5t3A/Vo4elsaJoenAnkOohqXI=;
 b=XkLedxM1LfoxWvQWuWX0wc9RkzbA8A5bc16Oc+w6otMc8LDlhTuj5g6FreHUHlyj0GE+3GPb3xGwt1TLYRlx3w7rV7URqI+Pw39eTILSxEmptkvwPoyLjlurNF3ddE728CgDprngMGgyoQqBwfYDmqe3yU20qLMA/aJbREc6Bkw=
Received: from AS4PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::11)
 by DU4PR04MB11435.eurprd04.prod.outlook.com (2603:10a6:10:5ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:01 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::8c) by AS4PR09CA0005.outlook.office365.com
 (2603:10a6:20b:5e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:31 +0000
Received: from emails-8946962-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EBD5380731;
	Tue, 24 Mar 2026 12:41:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:24 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCLGJXfDoc1Ez0rUuPhY88L1AgCyx47iI8uD7UbvyCfmx2AhQuApP0pMbhMkteBpypLeCb6fD3YPd8kv5MwBKOu97waQ+njg5nq+/Iu+oHuvlvYVLJVK2X9ywZo93VzaI8e3KZPzZVNTFRDJMTxi2GkdcekJNw5cUw0AmcfTqbk7rMP4JQHC+TyfpJ6nZmU8+fIXwIMxLVDNfUTcIjnDANzMgLcyL7FB62Zik5f3aKcjixR8ynkbU59y6Q+tFAyN1iEtN0VUaAo5uReqoaBDyTEPg2zdFhkUErEz5eXv/K1kk58I+kJ74KKoIfTWtqfaS2ox8kBoRN7FIo4HzTh9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4js7O76MsTFkhaT3iH5t3A/Vo4elsaJoenAnkOohqXI=;
 b=lmNK4tAYE2UNBct/3TY/eX06hDvfDfz4nXu0tG2SWHk1n46BqMcgqCxvvq1FXia7fKeDU0ADDmkSRiL4bybn9ILAgRLotKVGSzWTdecVU7YOdc9BxT2oqHd57muRJTzOL5VK5Udzv147v+0LzSKMeCiuLnsDiqtwof21pWSSqplyJa4WqScIOypulKeSK8SEOGb0TOLWWsbVsbnVNqpMX7yFOf/OIdNR+yBgSHn+qvxI2PihqLGwa62LSie2gC1mTl7lBagazgb8HPRZ3/YSxXUripDOK2BuxB8J9Ce6K96Ukd5BdOkSnnLG0853XP3gpR1tIQ4DQL543r+vjW+IQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4js7O76MsTFkhaT3iH5t3A/Vo4elsaJoenAnkOohqXI=;
 b=XkLedxM1LfoxWvQWuWX0wc9RkzbA8A5bc16Oc+w6otMc8LDlhTuj5g6FreHUHlyj0GE+3GPb3xGwt1TLYRlx3w7rV7URqI+Pw39eTILSxEmptkvwPoyLjlurNF3ddE728CgDprngMGgyoQqBwfYDmqe3yU20qLMA/aJbREc6Bkw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:11 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:01 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:40:58 +0100
Subject: [PATCH v6 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-4-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM8PR04MB7905:EE_|AMS1EPF0000004B:EE_|DU4PR04MB11435:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b6261a-27b3-4176-abac-08de89a2acf8
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: M3h8Ek8uQRzskH60pbgsozzxe9MCJzeaWNCVQHPrgJ32Cprtuk+vN8nKNqmPZixz7x76g6Vp6NTx0dt4NDiQzlOntfWWHdHoyv9/GR+/NP/NHUTX2gz8YY6o/EAHJxJLxhD8+R5ZrLCCsnFIpE9iqYnU4/6748KrM+ULGPcCxZcn6zgewYiwlZ8eIvig5peXD0SGqO0er3NRshe9tqn3gDP2E7FvzDCpPWUFnCoDaM5wg42QIXIY4vrnnGJC7xWNlxKbqV6xMIddYK1IHjYUbt3A28DKgP53cY7nVYFgnEYo9CXY456leVhuCyFDz/AGQ3E6pU4iQ2xnSI3NuStcYvhbD4QCsaTRN7ghEPLmioeS+BE3jjkJqAxJrxVjiqgCnBB/GYCzkl5UCYMnhr6x+BV4ujiLMGEPbBY/vURA/4xuR405ktHZnLXpshKalR11jyq8Ecoqq98G+SKIt/SOocthHF6q/7x5w9gHK88rNWAJKxRxjiHUk/5qlsfBY5UU+5u41f0vxJ98lm3aj4M8mxOVxfCakuDhUASy7MflPtDw7OwnKrXCjRTNnpzUoDSqZ6wqxTUvwnq97Q1zL8jTSxn+te/AXXzSkrfpZbCOqxygXV4hMzLG9YKpXrZ5Fh8hkKnq84xzllDma7JLAN101htiHz6EvNxNE0Ze+DcJ8keBROC+XlbFtVuFO2kWRa9KzQsKObMN/TMR9OBBhj1b1bCHyNb7raThGDjhG7261KIMGwUApdb0qiZdpf7NRQ5N0AzI8riNM7VkrpPICYMP6gPbs74F2uMeAhLPdP8lB1Y=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: qmpDn/Xj4cNChDCrasTJxM/cVqnmOUh0Kou7TrVejl6t3yFck/xVcgQQK9gbestpIZJvn0EDKK2IbRMTKpvuR+hLnf4lKZ0rmMw99f+i9Bn5VcTrGOdbae9qJLRAEKCmntb0S8drpYNkN0/DLvKzSRxaCi4OY22uoHsn72djGXu2PEHe5HBSkSFsOezORK58+GFZgdMqY1IWALD8GAaGON1HtLr14lblCTYKz16sKmvK5qkf8T/CPlVpmgkqgp1+lKQ4PqxEaNf1gA/rq9zZUc1bEHO8FNCCbxw9IvavtSq5icwgTi0CEx3e59yQo7of3J/4YDdXVfHAcB4qTCICsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3cc3b0c0e1154cd29e2555b5636f3525:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2ad6cc6e-aada-4ce0-9006-08de89a29b3b
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|35042699022|14060799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: hfyAGLmQodz0hmoUYpqZY1BijenvV3rk1Bi6WSU0VGdBrDVyHI5G3NqR57fU6Dw+ERp9zkeuURZl6G2/YUhuQosVdIK/ccfcC+SrrK5HIBQfeBt2d2gcWPjTgCHqxZNCq9OMtLn0zhmUiZKjCOlx2MN7rAdWgdbjTOWH1vC3BZ66odZ6sVut45sFhkQAOAxUvD1X8ruq/9aUELj+oqLrdzC8z4Ryw/stYSYPhePjcQdTk/nXEgs6NovSUFXWyr4RORdHUB8OUESY3KW4iC/agHKlzg9BfsX8sLtN3s96e+E8ibl3r5ZGBzkGmARb09n8DPeMui2mH2Q/ZPN2Gw8yEY2/EWwas8ajUmsUCrJtetdyP73tej+gA6g/Kl33PuqpQp4g9E1JAZnG6gwgpHP09ieNSsIsf4GopX2Ev+Fudfm8YUGNRQ+CqsexAVJYfmNvOF3KNeL1Q4kMDDVMgo8CR5Dag2VjDYbSsgb2j7Mw9A+oss/YrjuWzjsmsHU0viLFQGXUYKwoJnZKQ9bYKO/Ci+wAXFkdZopEmhgGzGGXdWTItWi83OPVnOQSjmhG3SAfHPZitN+AdNIM9J8tBFXKtzTyEAB+2x6Tb7RKQhu0UiCHeAgfDdlMP/aImW3Vwj9Uw8q0aW+MnbhOXwvjbjbscNZ4NAeVU4G/+eP/igBPVznYumZDxVEsprHlAPKZYDspT5lqt52zCPa+UpxEX9SBqFxpAwO7MW2u66451sVtfY93yKkXzdRpB31CIBHlAeyvlFBJpY2M+q3XMF+/pn6L8A==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(35042699022)(14060799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jDAmDLTAEV9/4Yph9Yb18SGLjrCgZk1oH+/GqV+As0Z7j946tk9KYMxS1eiHpemcyuKsAO93RwNAiqoIsCxqewK6Y6xSLHvMKjFSHekD7EHYOfY2V2mw5OsZWLGwffrJz1jLPZx1f2NkMwLSPfJcjNBZQHGzaSOoZTG4HJ1DcsM7QA7jxA8dN2xS5i+F/BKbJweXa/OHefwmGuhkTV8CFjLe0OagSIxuQ8grCu8qgFbL5vkGYGfLaeNmysOU5Bwy7K3YvOO1tJdDkpvbe57LQytFPeLdgShGAKa+rigyBAhkM+nuwfnTMMqTqThiFYMkIZfXuaA449hb1KTQG3gfv62OIClLwDH2Khyj/GCzKMvoe0gjJDhZNX7+VJRkiJdTjnxlC/laFg/uQmAepxPO1P1Vp0Sqj3ZpOvsEuDDeYIpRe4zD9q+DrZvlxV3Thepw
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:31.2058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b6261a-27b3-4176-abac-08de89a2acf8
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054137_497891_884796C8 
X-CRM114-Status: UNSURE (   9.24  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

Each group of pins is named in the reference manual after a primary
function using soc-specific naming, e.g. IIC1 (for i2c0).

Hardware block numbering starts from zero in device-tree but one in the
reference manual.

Rename the already defined pinmux nodes originally added for changing
i2c pins between i2c and gpio functions reflecting the reference manual
name (IIC) in the node name, and the device-tree name (i2c, gpio) in the
label.

Specifically, drop the "_scl" suffix from the I2C labels because the
nodes actually configure both SDA and SCL pins together. Instead add
"_pins" suffix to avoid conflicts with I2C controller labels.

For GPIO functions, include the specific controller and pin numbers in
the label to clarify they are generic GPIOs and help spot mistakes.

No functional change intended.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 64 +++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 41c9b4253f4a5..28500e8873909 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -750,8 +750,8 @@ i2c0: i2c@2000000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c0_scl>;
-			pinctrl-1 = <&i2c0_scl_gpio>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-1 = <&gpio0_3_2_pins>;
 			scl-gpios = <&gpio0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -766,8 +766,8 @@ i2c1: i2c@2010000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c1_scl>;
-			pinctrl-1 = <&i2c1_scl_gpio>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-1 = <&gpio0_31_30_pins>;
 			scl-gpios = <&gpio0 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -782,8 +782,8 @@ i2c2: i2c@2020000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c2_scl>;
-			pinctrl-1 = <&i2c2_scl_gpio>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-1 = <&gpio0_29_28_pins>;
 			scl-gpios = <&gpio0 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -798,8 +798,8 @@ i2c3: i2c@2030000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c3_scl>;
-			pinctrl-1 = <&i2c3_scl_gpio>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-1 = <&gpio0_27_26_pins>;
 			scl-gpios = <&gpio0 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -814,8 +814,8 @@ i2c4: i2c@2040000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c4_scl>;
-			pinctrl-1 = <&i2c4_scl_gpio>;
+			pinctrl-0 = <&i2c4_pins>;
+			pinctrl-1 = <&gpio0_25_24_pins>;
 			scl-gpios = <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -830,8 +830,8 @@ i2c5: i2c@2050000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c5_scl>;
-			pinctrl-1 = <&i2c5_scl_gpio>;
+			pinctrl-0 = <&i2c5_pins>;
+			pinctrl-1 = <&gpio0_23_22_pins>;
 			scl-gpios = <&gpio0 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -846,8 +846,8 @@ i2c6: i2c@2060000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c6_scl>;
-			pinctrl-1 = <&i2c6_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -862,8 +862,8 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c6_scl>;
-			pinctrl-1 = <&i2c6_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -1713,11 +1713,11 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
-			i2c1_scl: i2c1-scl-pins {
+			i2c1_pins: iic2-i2c-pins {
 				pinctrl-single,bits = <0x0 0 0x7>;
 			};
 
-			i2c1_scl_gpio: i2c1-scl-gpio-pins {
+			gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
@@ -1725,35 +1725,35 @@ esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
 
-			i2c2_scl: i2c2-scl-pins {
+			i2c2_pins: iic3-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
 			};
 
-			i2c2_scl_gpio: i2c2-scl-gpio-pins {
+			gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
-			i2c3_scl: i2c3-scl-pins {
+			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
 			};
 
-			i2c3_scl_gpio: i2c3-scl-gpio-pins {
+			gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
-			i2c4_scl: i2c4-scl-pins {
+			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
 			};
 
-			i2c4_scl_gpio: i2c4-scl-gpio-pins {
+			gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
-			i2c5_scl: i2c5-scl-pins {
+			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
 			};
 
-			i2c5_scl_gpio: i2c5-scl-gpio-pins {
+			gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
@@ -1777,19 +1777,19 @@ gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
-			i2c6_scl: i2c6-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
+			gpio1_18_15_pins: iic8-iic7-gpio-pins {
+				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c6_scl_gpio: i2c6-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
+			i2c6_i2c7_pins: iic8-iic7-i2c-pins {
+				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
-			i2c0_scl: i2c0-scl-pins {
+			i2c0_pins: iic1-i2c-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};
 
-			i2c0_scl_gpio: i2c0-scl-gpio-pins {
+			gpio0_3_2_pins: iic1-gpio-pins {
 				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
 			};
 		};

-- 
2.51.0


