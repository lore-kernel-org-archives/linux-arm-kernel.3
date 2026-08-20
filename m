Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBeAuUXllv4vdlYATEBG2F0vslovKKbbSrFmqCsRptg=; b=ucQ3uOf8Zotm0C4Ff2rzR/1qP/
	Fgj52TUZJJURgP3E2YeGfzUkoCTq2+0oXQS+nedqjqyvIBj3ABaujine0/q53ykuSTjiamc70d3/2
	2Q/weVOhvyu6EUJa+nD1TlWCdDIA4pLetFFPQs1zYI7uo7txfUIhuXEQQKGhIMG7MHoSbjPYMkFnT
	GEIromFclpJ1Iti/z7XqOC5/2ViFSzHL6jfImdCLjk7w9MwhqZfvvsish5Xn7R8xzJ6fAaRGuRSx2
	m+1hiCCKXeq+j9RhDZTNyczeqhEtiOZ/BcI1fL7P23edVtrsiEepzZzw3DXJrUsnqAJzAJFjf0DRD
	gQMmPg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwb-0000000CGcX-29GR;
	Thu, 20 Aug 2026 22:09:05 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwY-0000000CGc9-1oHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:09:03 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KK6uxU1741261;
	Thu, 20 Aug 2026 17:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RBeAuUXllv4vdlYATEBG2F0vslovKKbbSrFmqCsRp
	tg=; b=Lpa6OWjrgaXmyHcT/RdSu7ZSiO3A7y9LEn+C56GBVEXWzpDN3gjQp8KG/
	cBJcKZ91UTUE3KX97eOSbEp7KW3+O3BzrfYv3vVTokmoVHp0KZODisuk9F+xMCNn
	QQtMSuskj+6KkLJERC3qpBYHgoqKf6ZOEgPSxlCLq+3zz1Ovutcjc9JKafvsRvgk
	3HfZa/JB1dRh2Ml8e4z+GRFDTAgVGF8qH+9eO2AAYPH/EKIWwsKLxhYkDk2V5LdM
	amJIg4GDknhHoRMXdB4r123vN0FtViV4Jp2YUMTdBNQOo+WEDFimcjJpJ/f5Hlsy
	0dnR4ZdPSJl+xCmAsFocouPfjfdJQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g5m2uqu1s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 17:09:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOmWZtGpiDH9+uaGaRhpuRcGSkXIWHRK80FliGzXJXYUX3+K9xUs04LudIGta6wuzGZTHGacFjmWy9UalOh8XeoQwjGXJCKyHMgiCpJog5bJNijxXWj/eKpyRcz2gMEOOcvVqpN3E2Wl+FnzsASsAjQD2ioqhSFN5c7s5PumY3majeQg7Ws02dXIciv8FMjH+L/V2zq48SHlS7kYI7aKCf0hJU5aKQp4UdbCjpkcHUrU4uu1XAa4hSVlelkrPfijk2totMI7GulN1XaiO8919VNaOTs0iNPxodY1IZB2EdZgBHVZAq2WG6Oj7q161y1Hk5JI3O52kpp2i8VtVZYLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBeAuUXllv4vdlYATEBG2F0vslovKKbbSrFmqCsRptg=;
 b=vhF75QXX+qwGI+N3mWmmuRK8aD2o7xjFP8640rSshZTlk3IqHneIF+oKSj3j8us5I4lG4se4w4mt4krB4bLuxVqCrHJhLOX/J3xD1LoC+rpbmOBLITEWYp+tw+7jVAASTQieAhhtre5ooonnmAuMdmIwz/Ha/qdLcSq0s39aVi3W3ho9qcfvzQC0f9MigXBkwCXaJ1nfiISYu6gK7Zj2h+TAEX4jeZ+ufWVAtkulUwowFmqE30w6Az/NrdMZExnZtydFl6dEjetGXlSOHEoR/ywfMkNvFG8PX6QgB61DV0Lnz/KVtj3d8hDwz5usg6oYM/8wGNVJGH8nQo6+MQw91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBeAuUXllv4vdlYATEBG2F0vslovKKbbSrFmqCsRptg=;
 b=q96OXMmVYQhmUI4OA1m/iNQv4aOs2eK4Mw0fssR089+bI4dM00YRDK5jr3IRmEdp5/pJTIEmPLgEDiFpZ3h8XfS1PqHsTekSEYAznqWfjfDoO+8qDKkXc+xsp7nqXPHbwcktqnY6IoskrVuzeYJMOze9TX9NNLHoZfhUhYNQcWQ=
Received: from BN9PR03CA0948.namprd03.prod.outlook.com (2603:10b6:408:108::23)
 by PH7PR10MB7087.namprd10.prod.outlook.com (2603:10b6:510:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:08:57 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::7f) by BN9PR03CA0948.outlook.office365.com
 (2603:10b6:408:108::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 22:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 22:08:56 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 17:08:52 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KM8pf1933246;
	Thu, 20 Aug 2026 17:08:51 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 17:08:51 -0500
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup
 property to m_can devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-smth-v1-1-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
In-Reply-To: <20260820-smth-v1-0-e1738a38d58e@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787263731; l=1243;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=ofWEzmf0KZuBF54XaFqYh8rYdLlDFfsLXxn9oXi2uho=;
 b=WEOSL3xDoRx90x8re0qgJFXTg6gdNibDiDhsCgkJRk0nSWqAQz7bAYyIoizRJWBMEzaa3kMQ2
 qSxiJIRR8VhD7j7vpoKb5oZU2r7u93JQL7othf8jDkHn8kh7KTaG/W7
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|PH7PR10MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 418e79fd-58b0-4778-81b7-08deff07a0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: y1V6gFv+MNqLxm3chav+zGT+clwS35fjuMOfjzsonwbnrxMzwAycXB2nhTlX7jxeg+FD0xM9snxRv9BV3dKQ4N2ellTr9MWMiJzfja0zQYI0MotqFtpUE5KsPObBSTBbgggVtkaLRsDtTIkzUcgfhCB6WOBQ/Xgs0sFMVG4HOaqHpJ6pnay4Q3VW3EmtadF6p2stwWh4UjILJ4WPOXS1KTBUJeNBdkixzuSAO5PEswc5hMEkZOAYyGVsDjY4JymB/JY17aASaz+bJi4c3gpj+48PRvcTSjJjgDxPuKyKASoFSH1hEt3osnkqZdFCXRTw2Zm1NbThcHzhuNz4JK3KyVDqa0WQr2GoygMfRHvlFQU7BY8Y4Tf4LhF5pBrnmO7NTqspu6nAehr5HeVJRMgqH3SIrDG0RrmXTgI5HhmeFiO9g4JVx2xUJjD9FesvuDRDezH1dsPi5GFHiI3rbIel4P3Nfa8v7+DuiLvVB2nn4GVxcPTuyDE5IpvRNtDmGtrlDqwciYQEw6JT/NR1tdGEAmiXhsaOXTGg7UUzF+LSHPVNcci241YUUUafIGDXSJ9RFdRTZoLCtiQAf2rakxIFlHToO8BTQ2qNpRGN0q60mQw6ufje/zZpleWVDJebVK39qepXNRx7wr/EIAk4KoIlhchgsngU8v314YBe5r8e3VDW50Ep6oqgSjbURwSi9pP4/FiDbYm+0sRhln2pg99ULg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 17dAkEYnVYJXyGFbENMYS0uc8F2P8sS/ad0jw0F6fPRNfTxKc+V2+xD3v76NN5/KubVRfw2oAhunFeoddMe98s/L2Lf/Hi3LmESH5HaDvndhvZsLHQ9ZIjJZZhEoOOgUWYgOWXV8o82wveKhBwldselBQDeSksJxNIeUS4XanNvPXTO3hI7vLzt3ogBL0v+x6ZFPNzJFvSS2xUy3enyLPRUoc7LFj3gUpWQWvMVnnwTN0zgWXeF+JISXOMSbu2QFcAX2zovqHQxsgx74h2/PI/3vHiMqYz/Ozh6iUEAHuUX9my9mzV4cmDpU+8YGNsDin+qbVMQFGkzyINEGMqnJXLjgpGaEhHm+eDD9RcwQU0zyhnF9pH+/H5BrH9Bnk4DqtgraNcd/S3U/LADF9xGWnh8nDYDR6KG3RG7zsNenxCUO7vyogrwRIDCBa/PAJFv+
X-Exchange-RoutingPolicyChecked: WkXo3n5cgXFXUu43A2ToS+AyU9NWUHw/pAtmYXp1KIuusrP0vsA/FFGROCLulK/97cfrPtBQRZEkUROK8W/MWgVWqgHDpi4UX8LBjJbm5PnjE8lOVOyY1PdPpLhAoSnah58RfHF+G5d0UPRyxxR1YpAPfSz6S5K0jB9pDp4LHmq1koE88UXY4R85n6h/U39DpweNUpimka1PaRSGfa2eJa65YFfnVJ2mfPCr6F+iFVZZhCjZre2nIhX3Kn0gPwt/J1SX6Jx1wsxHJyLRW3ePNsRbvf6JAAsuA91LyzpaC8HFoMO/cKqtKHS7mF2mDR2hxOeebFZk0TASMJgMiX+W0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:08:56.1128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418e79fd-58b0-4778-81b7-08deff07a0e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7087
X-Authority-Analysis: v=2.4 cv=E5H9Y6dl c=1 sm=1 tr=0 ts=6a877afc cx=c_pps
 a=4ayr6ClP8xx6lw6zA/3NoQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=d9d8EDaoARUvRs2V4nMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: trR9W2in-IHT2-4jdR9icZJAPesOpRv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX5uwWc41y7/4Q
 MvDJ9XoxSa4zo7aqHDBHuUmOOIdg+u7gvNnFj50pfgLheTRLtOvnyl/ljR/y1RCXVb2/LoUwjyN
 +N/TKxTEh/wzDM4zdwxsZ3QrBF/XZtOl4PXMVyav6+IlSM1u2WoQK2+togg5CZy/x+TeAZowHw9
 zVQevh85tFBZOKKQmtZ5uRNhTi9P/TuXaER9bFaiN+Ll2ATRkK+rv2LOKfS7dpHDV4gMCHXchaf
 0xiUKOhl4cKgetkDAhlkj3eP92H8UeLNaHckknCmvOYV82UZWIemariNSW2/3KNWCXBkPJNfaWU
 oWNwnsWwLDduiQpg/pXb4WEcQGrapt72Bw1HkMFldqzJlAF2hi8Nk3vortcNeXxPn08YG3kLuqM
 EA99lgmL/e1HqCRDn2llu1gzvhDn4j2gKRxgFo6+M7P9V74qtpj80hQ7Y8pburGYRs5NjH82dkf
 HfU4I6jvd2j0HcMIgxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfXwYiIGEc07nNk
 1VYF6TmmfOOq3sS6MgbeA1DShgtBOCanElDMpvyfAszqa6gojQsQY/sm4rQ1rtBCB9IhQ7MtczJ
 90BomHityZ6LPZ7OYSr1C/wY70AriKM=
X-Proofpoint-ORIG-GUID: trR9W2in-IHT2-4jdR9icZJAPesOpRv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_150902_512140_5DBD4328 
X-CRM114-Status: GOOD (  11.92  )
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

The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power
states. Add the out-band-wakeup property to allow the out_band_wakeup flag
to be enabled during suspend for m_can devices.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index dfd65c00f5b95bca9e3a447f3ca14ad40631e1c2..011f2f37037553d1dd8ef68d2ecad36c4e93b130 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -283,6 +283,7 @@ &gpmc0 {
 };
 
 &mcu_mcan0 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
@@ -294,6 +295,7 @@ &mcu_mcan0 {
 };
 
 &mcu_mcan1 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

-- 
2.34.1


