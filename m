Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718D5C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdsuGqxBAztncnYM8VPnOWhHlK9xoquvTJmX4Amft9o=; b=C0+9pRgSXopeH6KFinytEhxt3W
	6YOFHlOnVIxcgDmyhJyKo2nq8EetuExyiUCjQnOlD0n3A1yzxIe8Dk8E8+12ZYqiOEFgXrl0pYEeI
	MLjIB+iMRLsWj6IzzLoSJ0aUtMZdRW9nYrZwm9jOoDa5hkdBLzibqJ91F301cPri4b3tEjhCPK6sF
	iKrpkmyeaaYGprVbW0kU5QLniZ/i8zsiLycF4SowSjmI75q/u2QyG4694ks8qNVje7cMNfFrqnsa1
	38WhS689WW4bb7zstTHy8QA/BLEVJ8THaVnFM3TvGzH30QW0egtEwBoq9aQjBWsMqDWAfKEJENQNc
	U6WyodCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfhF-0000000DO83-0JZ9;
	Tue, 11 Aug 2026 06:10:45 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfh9-0000000DO6G-1ZRv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:10:42 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B5VAg5027881;
	Tue, 11 Aug 2026 01:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YdsuGqxBAztncnYM8VPnOWhHlK9xoquvTJmX4Amft
	9o=; b=YZS4t6z/We9i7lqiKu3V41ZIF1pitbBGh+DPYsjmWgqG5NCpxe/iO+4/s
	M9t4nHNYOcq/0fPOgM3om5Rn1Nlf/DK7htG05DZkdHfN0ZkM+ZkCA/sZ2mWtICR+
	51C/B8JqUHGALas1eJ6RqsLNwwryuL6ZFqqq8g7ZouBnE+5Y93GX46lBcs9bnj8l
	PT4F2s07/zylMFJv4ylzbP28WrZF1nRcgY5qcUi0C1K5deEbBCo543C4a7VzfDcg
	kmI2P/8REHwRlSu4HgTtf4syRHnefq/DOfGnVHZvW0/iGrjm/bhxbbgk3UHUI2hI
	6SRrKb4fH9k586lHEj7gZdFssWQQg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fyk0pm48q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 01:10:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML+CRqOJ28thQv4TVrPJChFktYrZoOz314Stz9LmH6S/5clUNdCRKxNvu8M2jlKjPyJp6ef+4cUG1BYoedm002TS7aDm4nclCko6Mt2xRTxoObcT7vYgi5kJq0oClTpNog25ZXvQi1uG7h2yfU0Zc8NYXI7E6GKNFoXdknLH9KTC7OEqvkSXkkZcCcXc9XGFsNcLY2LJw4Iac5CBNs32lhZszx9c0tZ7LeRvGuRa6DKaY3cys5W5XR3pwLcZJVAS1Q0ff+Zlm3pRp6xpfp9Wf7Dm/v75GpGwH+8uz+r+K2ndo8T+HL01hU3jbXNHORUNl6ChVusk70Q3VEMKZlwn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdsuGqxBAztncnYM8VPnOWhHlK9xoquvTJmX4Amft9o=;
 b=y3QfW2UC5XycL3xsBm6NGLOaMVgn/SMFvZfq/BOd8EIcmJRuCWVGh8YZ9yyW9lOAD6ZRAYw3qBggGZ5uV7c0nj6jigbXOlvPISJlO4cESmPzprPDRIMHOJ17FHSyi1lIKsc6JhSk65NFuUH/PGfCscPMHbqrx+9etjsOCQLtuSwhx3yN1RXdh1TgSQF/x8rKMgZtS1qESXzjcBW8MnfA2iI6vOUKHi9jdV+pPT5FinoELe4vNVWT91NVwVHQi0LFFQf9rsGkVxuDOR94JgysOXAYu/J1WJaTZzoDxczTtf4bk28sOZPNHOclBY7zODHxC5F6rUiYclfYDChp5LlLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdsuGqxBAztncnYM8VPnOWhHlK9xoquvTJmX4Amft9o=;
 b=kfnLZIyqfa0yI93BJKKsIyNrwTwj9HWQMImE6ZI9o59oFjQgaICNkVq6SCTTpTiIKCpd7wXqoQ+dT/QlSciONFNTszef+Wjb5kEDMLFsAVq+f0Fg7UueLUYGI3TuXd6wBgZJHPXYPIKuU7oMq173TY4FTqGIScFhIN41TeTMvuU=
Received: from SJ0PR13CA0164.namprd13.prod.outlook.com (2603:10b6:a03:2c7::19)
 by DS0PR10MB7067.namprd10.prod.outlook.com (2603:10b6:8:145::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:10:33 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::9a) by SJ0PR13CA0164.outlook.office365.com
 (2603:10b6:a03:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 06:10:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 06:10:32 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 01:10:32 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B6AHI6580944;
	Tue, 11 Aug 2026 01:10:29 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-j721s2-common-proc-board: Add ethernet alias
Date: Tue, 11 Aug 2026 11:43:42 +0530
Message-ID: <20260811061351.2538688-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260811061351.2538688-1-s-vadapalli@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DS0PR10MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce8eb04-ca1e-4d7f-2295-08def76f407f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: pMI6rQ1jAcRVmFeyijgiUbgbHxGl6MYrYfVLoW+Gbu7kj+f6S9Be0AvFgNbPMUspsi4kH80g3YtvoqOmvbSgo9WZ1sOuY/eYzJPllBCwDHCilXtaKr+huh1zu4rbSv3C94bU8szN3RhI2oiMap63jtNPdvKRxua6pjAjlSThVtL+s5CaE57A8G4xSISR2uzB1BLrLZ3S0DM6m/8ZGmYxNUGCLNyxmtfqEfczIyUQTOspFUB+EtbXG7/CxlNrVdi77tj2f0Ft9ADDI/Wxol/cU/l9Ky98iyOsyK1hHIRWTT+kEQmcqZ56gP7Si2d82aGO6x/2+VtrHSO6Prpu4sqKS/bNF7QGS/FHZVYbvVyuZjthfCMQ11JEIs/i1mdpCJRytI4dnT1TC9kvgGot+qN+y44zIqRa+Pdj8wvLlYJmVb3PoOPWFwPoXZ2Loa6ORakLx+J9GuOnt1vuhrRdgW7UAvVpMs5Cx3VWqtYwugAZvhDpt0hTpXXcXw9TvMMKvO1aHG4b7W1BPdlcnFB1TFvmbioBSM/ryaqCHcCEUoBpeWuZgDHLz12ZrBifrSPlzN7uE+Bq8V5LCbj5BTD3X3dDZHH+2rvKrS65XfiE7n7avSBNJPlDNJpE2iwmat9Gifsu16uyBpEQiwbfd8hhc+zt/+/49W+i3fbeuN6e9HAZ4jCpz4xrJXNqfrFatZ3r9pkF8mPqQJmWInhP6ycMd8uKfA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FHnCJox8+arojzdlncLS5jU6q7jbMYQCuXcty/40sE4fzRksXJkARVv4hQIegQuGqtX0XB7Hi1vv99JfiBojOQ8zrdoVSIQrPCn0kMkrmUlqLIKh/kj+mFIvoC38eORBWdLkN33rzcGy5AMJ6AVYL5DI69bcMxTWBjjYruoqfguUKQpYixUNwxMPl1qUWzFP7e8DYi8E0dX6lHIMrUjVDtY26Ce4Z5Apq7Abj/T2UuuAmWBBU/5RMiJ707ccCmpN1736mFqhRJXb45f1tVl00zSIv5VJuXTzVn8HA49G7zzOJ96UGjglEhQBdjUhTdKn7CGsCyyA/de6z8UjlT+88CpGV8ql9N7ZKyrhEr1ry9gPkQB1ml5aUpfzBJmqUszXmV3SsJjW0n9qocjB712eVlRc0XmzLb4xTVMhU+ko08LuvBkex0vCG1lWhcE2Id7p
X-Exchange-RoutingPolicyChecked: Zqn9s9/f5Kctn/Y9wZF+/YogYtKmf6ggLN1nDrpNDOU+gTW04R5IN2NzN81qxeIY0Vezd/2eap8NC9GRurucbUuQaIkQIspb0lXifbWwtwn4DZx3L2V1qFfRc+bM1aueX9KeOlmOBzOaipYvAEbSX3VJIYgec1h1rdNP+Z/vSknuw9s7J6Y2IBFdDalip7lKT6i5UUEgmlOYUJd/nXRNMaA7WhIJkUClnVmqWv+ITXSPS5LckEZ3W0Fl0+lvRCX0/YFrSyiH4TGMfL2WwqH8odMpbJHxCKeIxiMhmJXSfSWmg9GTaxKrIKVfkYehkU0NDl9eEibIGwZxdyW3QVogdQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:10:32.7428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce8eb04-ca1e-4d7f-2295-08def76f407f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7067
X-Proofpoint-GUID: 1i-USqX8jJYbxYYVhHinxg6ENqplpyW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX1h5HkKi69UIj
 105vYAy6KDfAffvTICxquuGirPfexZILpgM7nAV2rgtWG+nZ8nDwKXkWDP+m6Jj85x+oXnFccsG
 Q6ClOYcSJC6CXv2kWGWvsxqc30ofrC4=
X-Proofpoint-ORIG-GUID: 1i-USqX8jJYbxYYVhHinxg6ENqplpyW5
X-Authority-Analysis: v=2.4 cv=MLhQXsZl c=1 sm=1 tr=0 ts=6a7abcdc cx=c_pps
 a=7iDNbrykdXu3VEpdGPV71A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=A3FP4H1XbVXvBausaqIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX7jojltnzETE7
 DUn8nJk/seh7eHR8cJ6QZCfssFK3TNNq3L2xmgEZIDTbtngx4oWRRCZOIqV2+9rfCxTWH2s/wF+
 0Bv/dye9T/o4y1RVaynEKx5zjBnZJ1rYWoi8G3+QEuO8g/JRswXxdRBk0kb9QW6ULzZ3dAoYhMc
 blce5H19oQRepDhbjV/zl7JtzK1U6q5XYCQa0ef0jHCoaFxX34DPOifbyNYOm5PP053tn+xzxrX
 lLso594pLwcGC8Q2NhevEWx/VaVNO7axfxFqHtIGCM47S5q6ZGWA3h5iU+iNO8Wnla41qQaPIEd
 l5Y2NzFlnLx5YLtnCUtTr/JM5cYH6Wy4sqNZ5EGScn9LND/2lbVlvSr10s+ChdluWJn/EN+FawZ
 M1xY+iVNseBzlhijSspB7zCxLpTgjZq3saVXnjk+htwKWeb6nmoTNLRykr9NbBCF3L/pdfYfWME
 /0jSiiHoeF9N54otsYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231039_532800_0C1E2115 
X-CRM114-Status: GOOD (  10.74  )
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

Add the 'ethernet0' alias for the Ethernet interface corresponding to the
MCU CPSW2G instance of the CPSW Ethernet Switch on the J721S2 Common
Processor Board.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 19c5157510b2..a4a180bbca12 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -32,6 +32,7 @@ aliases {
 		can2 = &mcu_mcan1;
 		can3 = &main_mcan3;
 		can4 = &main_mcan5;
+		ethernet0 = &cpsw_port1;
 	};
 
 	evm_12v0: fixedregulator-evm12v0 {
-- 
2.51.1


