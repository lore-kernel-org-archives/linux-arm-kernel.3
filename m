Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE65BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8uxwQIe6bRvM6cvwN2pL7gAjjRtVdJS55yKCij0W8o=; b=Kn9EDssXymdiLkPAe87FdAP8qQ
	YNTXwLbfBuWBWMSDjkTYOCCJFOU3zIm/v8vJxOYH9teTDrwIwamhpdyL/SPKRcX5Mme77kjljlW3w
	6tGrfnBB7rddJ4Q+Ix9yFEbIVvMbcUTBWaZTTiqwQ2ugWrr3TVWEJgvUiN9w4ExxrcAdlAdazDGD4
	TFaWD4sRELBugbgEmw7pDt6k1FeYdk3f4fRXxdYLEph9RSce+LnQwSCKMGcoikkjldBG+ZYuYqcJF
	ShZGToEGmlf/rF0LndzO6/WXwd7JMPcqQS9XAxiZNvd92kovU3xFJjXvms/zPOAtGcFlExK6uDexU
	sp0my8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8U-0000000GWo6-1nFB;
	Wed, 12 Aug 2026 15:44:58 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8R-0000000GWnT-0tUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:44:56 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDZCvu134291;
	Wed, 12 Aug 2026 10:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k8uxwQIe6bRvM6cvwN2pL7gAjjRtVdJS55yKCij0W
	8o=; b=G9cxIKaqxqiJNmmc/nwSXXkWG5rg/WK1a7t0X1DE1ZbKgGVvzA/RY2mNk
	NNpH3TQBXp3qIaxODN0MYsc9/TdoJR5r0Z7dV+Fec7rIkekE3oI6Vx4V38Gemv+P
	FYBErUamllW4th6Pwd6i1vk5p9NWGushhIhBoUQsVK8yXV+rjNZCOZbZ/KCWxDcW
	g86hH7C+2U8LsfbhRQ3ki+Cz65hbDO0vJnRkGtPvIgQb/fqu7xeQ5mKAZIooyjQC
	6+9rXpqkrKIxikKvFit5tHyida+fvU2Y/a/9W2DwmavbhKbZuaOxIOewWJ+milll
	H28smLCeweF9Xdv9LrgK1BLgZUz4A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g09c2692f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 10:44:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR2Txtcid58Z0NlrkvAuAet9x71C99x9kCDELtT9OJIwUcr4U15RYcVj2iJD8bcXza2Vhfz9CkFe8R5a2QTL4lNYK9p08xmshfPkW1Qw5TJknQyZqoTSaJDANbShe7BbNmwQzSwPaae9+Mu2/jZGOIm/6rXg/ezXrVV4GF8P7fGyVrSy6ZUw6RgEGhqGIeQIjDezf9lnplOKEeVOYNhO5DwL/Gv9paNyvdaLmulTS9qNkGU9WDvSD6yl5DxWxorzETmnT6vJqMZeYHKDk+uzk20oFWpMQGb5nwjNKvWHERWwnaqPwW7LXmDnE9qIejn+x/wUo51na8WvzNfJF9Dw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8uxwQIe6bRvM6cvwN2pL7gAjjRtVdJS55yKCij0W8o=;
 b=Wo/Q9b9kagRLzJZrkwb08ci8EJBIbMlD2ssQ4aQfTw4fhM0sPMHdRVP6c788E1uvcaYphrSJz6loQ9xAqIPgGk89pcuX/v/ammyuUx68Nt1273l8Co3KYi8q6qml8KO+PazH8PY2epcc7TOPNxZOORY7FI5SaN72NDEUYSN3+g+Ns12QLtJEqqPMSNDJtB6tVAx90y1+EBKQuOWp0tcSPs6wftZl2ikFbsPxICOevCLX6uLb8BaSzkrZ/EYXT/XuZNMEBdF9Gpdil3EwegXnxbQV7/aj+Kfq0HhPGWl1aD/3UXfK0hYhNQIKkcFbAP8OirP8tYB9ifcseLT2LwaBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8uxwQIe6bRvM6cvwN2pL7gAjjRtVdJS55yKCij0W8o=;
 b=e5gxnd8Xh4SX5s/AGwaRfSYjegbYhPYjfHRwtb1evdSt0VCFWs3pVHEOupFTsjZxayUtT8vNBaX3P492E0P9EL9CSjMnqgMbK2PDmLzAccq2dRVDWwEZFntTdx3X7OFan/RtiWYfZXSGA9+MwAf4Ph5EutMIGF+DyVcRaQwDk88=
Received: from SJ0PR05CA0085.namprd05.prod.outlook.com (2603:10b6:a03:332::30)
 by LV8PR10MB7942.namprd10.prod.outlook.com (2603:10b6:408:209::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Wed, 12 Aug
 2026 15:44:46 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::87) by SJ0PR05CA0085.outlook.office365.com
 (2603:10b6:a03:332::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Wed,
 12 Aug 2026 15:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 15:44:45 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 10:44:43 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CFighI2343963;
	Wed, 12 Aug 2026 10:44:43 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Wed, 12 Aug 2026 10:44:42 -0500
Message-ID: <20260812154442.3379851-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812154442.3379851-1-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV8PR10MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: baaf6379-3858-4d29-36d0-08def888a296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: DiT+vIY+ZP89nwn0RgNZ1bkvM1m+HT7rUSZG3/1XWwdjXhyg+E1BFQKAcQBYgkBrHDH9qKQFL2c5Ohoch18MkfugO5QiagvJPyWjCeyZKJAjYWr54IM4Rm2ED43kROSZlUJYoVAdrPfL7KzTijDMu8CGINCCzn6zMxGG3wWPamBem1L/0nT14S8rHdlNmxwKsOjoslzsZHJ02q51KfWeO1huUQxcuaYCx4itH2zdLvcDQM5zeTKuQ2P4QUm0MqyLTFmfA9VB8d5gsgOnFbowif4fHGsf4M7JBTxkip9GmkcABiTh6I/Z2GzrGuwkukPnjzFDiQBPd3ekBXKXu10n2ir74mqxbR1lOe9VerRIpKSpwOS7eTeFjMsqCNRPBNjJH0Lzk6bTbPspegYNqS756GOOP1NGL0qQPnucnrZvasvKRKzXdNfreoOBaz/rnb6UGasH7yDgtLWNyFwQB7eLUnsR5lE94qe/3rM4sY6HEzRJVVW7J8800R5tQJ3QE2Ksmg45OQG2RbhaoWypNXPr2FxJ5fU0A8A0yhNAiVdccqP+CpW3m7ylSd9CXwROTBpW7F/H3BkN6x04OkPZ5HO8lu6JRyWUabMmFLuBYP/1kPhz2N2WeHwWUZuOgLDKRO5DhZhzWLoaMZw55xirCBDqScV83DmIdVMX4q12FyT1LXjRIa42vooqIjfTZsPvKSdMO/0nDrh7qX8sC13/OOtg0g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fhf6DjjOnOPUch31yEgFvmUhwcYQoQ+AGf57LFac2qEklX2AAnJFMBrg07LSmNVm8qU7ZsIBhKIhuHDx4W3c1RLWEJ6lVnun2X6r6OXzYZ/d7uSxMGVsYcz8wcAFhG/0e5Casl/c3iGUc6hvzJV/WzhgepJyP2ocUKy9/o9WL8U1dPFfISLGPedieXfI8rxrKV65DxcUodBGzP5T8+H+RhxaBKiU/mBr4wB7JuhFqKbFhSTQ6iUBVsRd8vDQMJVJZecvl/bDiePfsRZYwq+bx2kukzXvzigquLkd/erRyBDFcB7ahmFRWAvpQw49aXXkSTefPX/XizsyOFAFIILz0LXRV8NuQ9ZDMYRuqcUWsYM7MLMyfLczxB43/DQit6jc4LaIgn1NEIlyFolqNL+orKXgfZdJBaFp3OkQO71+ErZvObNTr0anLdTsNTx3pG22
X-Exchange-RoutingPolicyChecked: MI0p9nL028hSQ85oBCW0uWh7xxnexDAOgJ07VfqujLr9v7R4+Qcz2uhl3yML6muhx4k9gCO78f4p8Q/FCptQnEHIwMPDusTP8MOYOFIVQpPjbYmOwZceoqOaXC/yRYn80jyyZweQyJg+/NvdXkTv2Bjr/mZBOoeBYip0y3vuQd6MaczBDmjy15dvE+2zJ0mRUzJQUR7eNMIl7NqbezSW+Ak+mpR1Dh8lWvPmJibVTZoSnYxIsT490xPmAbuEwIHvH2EjkOF8/eUZS+NMowIEGjABO8Qj/XcgXMacraNHBBH1MKVkpEnEW51kFwBBts+GuN0uWUAEVysX54AmmSPhPg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:44:45.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baaf6379-3858-4d29-36d0-08def888a296
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7942
X-Proofpoint-GUID: ttXtMHi1ak4LecpCpF3kaHrbCQSlcX7W
X-Proofpoint-ORIG-GUID: ttXtMHi1ak4LecpCpF3kaHrbCQSlcX7W
X-Authority-Analysis: v=2.4 cv=PrCjqQM3 c=1 sm=1 tr=0 ts=6a7c94f2 cx=c_pps
 a=U2ki1QFzN2iGT7kcnsve6g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZeIETjE35kWDaaLuBhwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX2B4Y+Y05Vl0f
 diyRBJPNp6+c0Yx5WFZmQAcb/SGWtrwZYK3u7HG0anHayhOUD3+HKZ3Rm7cDL97yffYgNe3vcDV
 EoXtPuEnb0Sp7tDnkJ8XH3TFsEIVGw4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfXy2TEzTwHQL0G
 prGex7kk0X5sPtz+ELwAGKO/GwnW1qYlz/AP8dd4Qv5FGqlvJRvhH9o1xn70w/SFyh/9jpBnVew
 YDG0NoykW0g2xE4arYhH6i6lQlaX3Cn2fqZlHbJFeBC4w8oP9WwBOXHIixDsA6nzbisGXdLRju2
 VEpiujbQZcEGnN45J20Yh2IRaynPH3/A8d/nF7naq2Kb14fEDgawVnCLizrC2KlXqMNV8esDo9i
 saj0SymrQ1FbwdJB0lskAoCczSj3JLReIUswv08mWr0hK2ba7PKq4u18J8xrCC3gmkmzoJkPCeJ
 4PXSsv1wVfUUtbWocDcK+EJew1S8kQ6u7s/C2JI5a4QhAv4SGHI/y5e/QX6th51eFGtDc3FK5R4
 cABN54WIjBdlFxG024/2a914KEa1u9Cz+iUVMzWzJT4FJ48DYUq3Y0nP95E2dJ3epKwWWoTG5gn
 HQkvR0seokdvpCnkgGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_084455_530215_4A544E7D 
X-CRM114-Status: GOOD (  12.04  )
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

Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
nvmem provider to supply silicon revision information from GP_SW
efuse registers on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/nvmem/uniphier-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
index 85f9372fb97ca..d0953b99d7e18 100644
--- a/drivers/nvmem/uniphier-efuse.c
+++ b/drivers/nvmem/uniphier-efuse.c
@@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_efuse_of_match[] = {
 	{ .compatible = "socionext,uniphier-efuse",},
+	{ .compatible = "ti,am62p-efuse",},
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);
-- 
2.54.0


