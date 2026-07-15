Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26CEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 04:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhV16gqpVKx9Wp/VXssbwKaXyAVIqitrKzGQE5dfCHE=; b=tGHYVzWM43R+lkaCTdFLZHz/y3
	mtx/TnIhjNIpk98rKH547+yyk3AZW71wWAvysi2jZIdsCghMKITL8iGPvhZDrKK0AxCIaOb27pZBA
	4t97Cvd7esVUbCYKElcZzIwdNoBgo2LqhM9AIjIx7siDPnUlHSRpciUKtxjtnnUrZbHlX1DlR+1jF
	Hpj4zHzCr+3FfPlAarsZXJNBFxyKl//uVZ3QiAbf5UBRRTgHbJ2dgNy4XcGpNvwY5XvxA6sZjAoln
	XYCahDtBywYf2JBYAa0OACktZa1A11rLxtkZGdn+7Ux3pZP07khmMRADRQ0n8PcWHbkfl+Kc5FrkV
	N1hvzpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjr44-0000000DjEv-2O4m;
	Wed, 15 Jul 2026 04:17:44 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjr41-0000000DjDy-2n8v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 04:17:43 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3k0174027574;
	Tue, 14 Jul 2026 23:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EhV16gqpVKx9Wp/VXssbwKaXyAVIqitrKzGQE5dfC
	HE=; b=Fv5UvlKahyVZne+tZLGEI4tNIKKfqB4j6S5uLWNyg14tdLabeCdlNoqYH
	JxRoefh2p9NFSaM1lEKMtRI5XzxuiG0YivB6vPOt/d2OyIx61TabvHXVDIbeYFhI
	tA3Hzp8YsReWk1z6PRbjKmmrw6WUIJ9LCG2bfgGraCdSxHJnrSp59MsueCGEXZFA
	xQzh8B1GdPoxU/tGwhpL1HdLUk3Pw28kTNZ4TBcsdEmHHtqkQPqxJIlpGal0Nk+9
	Jq/CO57nVd4vbaGOTUCAsSDVBQIYhxvsfzuOrHDF/zu0YNgE80fBkH1+KjIY68cb
	KRMXpU196lVHRntoXIeFWKIkyFUcw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdmg34xnk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 23:17:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwarCQiaOV+ejxPutG46T4qtf5mfefLOjH/Az8SfacUARD2ToDgzG2RNMY+ZPWr0YfOveWFh1ygtbLgGn3LpWJxJnY/tUbKIGaPD+2D7QwEmG/CFQRv39amZX2z5dmBH6s8sq3px6Av1/B2OB4ViHvV1XFkSgnod56w4gxHWpGuyR6OYlVN2KIKImUq10Z/Z7YDxA3Leg8j6+YISDDrr9VEXQggP01HngQS+MJZ7bQJifqeKQcUeGqJcf/rLpFvvVsLBrOpUEb9Sj5UrwATPQrG9f2gisK4FO60KPmihHifiVc0soFyV9pir0ZxtHaYjegK67qOovyhlFQiEyQF4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhV16gqpVKx9Wp/VXssbwKaXyAVIqitrKzGQE5dfCHE=;
 b=Auzw+AgXzwBJn0mXY+NNxorvMGqkRsWTrHx7jlPTTBk+WXZibDTlhQTj3m2FTW+kp2fQCrnEyEjm8WkasAA3am3rR2aIQsxS6hv5jBF+UxkebeCJdZLaNSfOEVm36T7MKy54v1ebTKQol2pm6i39EQYik8bEZBGa+3f4jo9eVBR1ZPB8J2KP7gjMpTVYN5Cve+xXu8DQt6MICh7ESFVkL1cH3iuOH63bfYnqCSZuTntlczpG7TuW2YwpIUzVL+50s1BQMS/+vG3zOW7OQG8DDtsiSarYhLk7ZPE29DKajGhLldaQDLKzxOe8N81ED4nrwzDCaMorO37Kth10pavyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhV16gqpVKx9Wp/VXssbwKaXyAVIqitrKzGQE5dfCHE=;
 b=U6V93XwjiG+IT8HNdItpmsLVe7/jVhZI8IFYRSmfxG1MikpR7BVigxXj9yXYtyOlyAj7EkHIu/mSJLk15vgYzDIXHiuKtMMKUPFD4GGuLOzc5TUSte8C6bsSbJ0ynj/2xsauLOOWh22C6emb4ZwN2VM2WS1u7joeWCjluA6iCyE=
Received: from BL1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:208:256::7)
 by PH3PPF517B7003F.namprd10.prod.outlook.com (2603:10b6:518:1::79d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 04:17:35 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::50) by BL1PR13CA0002.outlook.office365.com
 (2603:10b6:208:256::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 04:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 04:17:34 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:17:33 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:17:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 23:17:33 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F4HPrj1562938;
	Tue, 14 Jul 2026 23:17:30 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-verdin: Reserve UART_4
 for Cortex-R5F
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vitor
 Soares" <vitor.soares@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260602141311.1366818-7-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
 <20260602141311.1366818-7-ivitro@gmail.com>
Date: Wed, 15 Jul 2026 09:47:24 +0530
Message-ID: <178408904493.1082634.1111398751432883626.b4-reply@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=lbnrvHU82MJEsBlNvY1buqIRbxijruIIPHnq2/bsR5E=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhqxwzqtKnXNbt52K99N3LPFouNBuW2+w5ubEZ6Iny79/D
 ik4/IS/o5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgImIdzL8s5QQeGez/1dWd/Un
 A31HhZqit2+OR3NtFDG/H3iXPelNNiPD56PHjuwImRdwYPXyIwXZeod+HtC6GLj1G89qKxPV+Zv
 v8AEA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|PH3PPF517B7003F:EE_
X-MS-Office365-Filtering-Correlation-Id: eef8777a-cec3-4145-7da5-08dee227ff12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vTH+kVLnZInjDZBlJk4PwJJ7jkh+NGk4BwN/BJO7TcAcRtO2kMw6g6/Scj6CGboZSxYVVv8FEaDuMbCNk3X/G9WJj/fKPyYgRNxW1D6Brov5BBE19ibjrIh5hmmbIMcljyEW48APHqyHCWXyKwIg4G8881yLheJZskQZG7YFfqFCtiAfwKKwq4PBGBlyYTH03b0brYPbvKDnUZU5cpOhLT0MXGqjanxFmLmcp3W7sgKST3gq8apZwhuiMs8XYShITx7fYYfBBcMuAm0TavwFgaSLIErGJczn/IGxOJ+CR3vjrYiFdHVqCsye5EIVRdHQC9ZY+tUwEekYr+UdrB4oLQ1sr0ML4fseaXdp7hxeY4Va2IJMiq2RJc2A8Bfl2N1MdnzoQoGk9qOR1LCXgJO/1mMsShnfGwx5OMV/diD9nyWz7wL1MLClK7p9pBxO8Yyhb/PyVWMjLaNUFtZVabLGrDSYeD1ijo2SqqYYgEdfwQNmnq1/QQ3jMezbAy9kvmSWlUfKQc4tLGN/NDwZ8KJvpv6vLwAKHs8OYCVlQ0yLOzHseM/Xn/mkVFpjIyFFmidjfsN3H4Xua6WrFRdN/tgcVQ3kfejSY3PoPUX3yCIeOvAZHo9JDV3K2rIK+f7ASjF9FB+0UxwWWa4WtMcGzh9OtaMvPhybpKzqpXVGEAQZMcmdf3MT69bIjc1vX+2Jr1LO
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 91XYekpgkskNQGQqjivEvt0yHaEBuL69n50oO148cdUwhodBfhzNPaNJx9uCkuqMj9SlL6g9988se4ESY83gASg2dTUVv+pfEmv/MZDpzmq7HXieccsXBI28yvkJYN7mWNfZ+syYzZ4sUxn0ofCGCcMaBBAXrPwBakRI+0ykA7OJ4gTczpL+enRQC0cJAnwUF5C7hRY9fNm1zNmBsGfQLL6cvFD8Ek1SsWbFtwqnSkhYwl89xbm0LXHdnCweUnlLznzN/+bmHaVcdRLhFg/C0ZaUQoQfugk8UB+zxanXcZydG8bFPfvINxMH2CFX/4PbmbkWI/pPutrRIpgGKjtMG3QfJtuUIT7coVhfVcPsltb6++buG9HXXagxQSErz5xL2iKNLDyA2n1Yq20RsgtPr26fKWQ6EjQfhFMWR0SCcgdV6aJBF1dCBYqgUJ76v15D
X-Exchange-RoutingPolicyChecked: MZh7Ig0TJndKV83wPY4x8Wu7ARznJWxTaNA6T8QSlq5beFU+py6BJQUlZw83Fpg1n9xBqLq0bqiuSirzQHbNas9A9br6HByGGst6E0UeF0KGDfkDRP0WBiDw7Jgvbb5KOixiP7Lj0uPGTz0Q7EFLMAk9ijf44fLQsMI8iRomclw3fC3J7Md/eNCkVzhFnWF8SQ44RcqUFHzMokqY6b/TDH3cci/Q+VyXc6j02ehpgXxp3CkLivfohuY8ZuUhyBoVhYQUOSd48oppOtYBMOL2UsI9xebYRtW2b4a9VIpxV5A3IKQFiuCpjBykZ4aG1+D/J4o+zBEVA2V0FeB3Qk50wg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:17:34.3008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef8777a-cec3-4145-7da5-08dee227ff12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF517B7003F
X-Proofpoint-GUID: ef6dyG6FMCwFYhKhypQfxbvvM8rQZX8k
X-Proofpoint-ORIG-GUID: ef6dyG6FMCwFYhKhypQfxbvvM8rQZX8k
X-Authority-Analysis: v=2.4 cv=EMg2FVZC c=1 sm=1 tr=0 ts=6a5709e1 cx=c_pps
 a=J5CYyyHZZtesdUd/yj239g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=m8ToADvmAAAA:8
 a=5cAq5RwRjd7aeXs46lgA:9 a=QEXdDO2ut3YA:10 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfX3Z/OhYoPPz34
 1lqzM8LSPOubyKsSTDIgNOwGKiw8DkTw7G+7yB4ASrdbjhUkA8dI4uEwLzko74mpxJdkNKjYvbr
 uGGUaeA11afSMD2JfchG/ykExATjKVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfX/uS6zNelVXau
 uMNGmHm1vsXQpgqLfO926FoQoTTIYFQXFqIAHb9s3uXS14rJKRD+qGxrDAu6UwVD/AZYv3VYUKU
 0p8plewM73gKbjaCXkf7/Ga5CQbremXoAHRwoWmqEtCPyj7drdAOnddva19RzSVI/ZO1u12u8nq
 09yLwL9K9QIlfBcLPt9ZhRgmhclBGASXzft9LGb6M9HhSXpk7WSz1wMrbBp+TH7STP7JspE9ESl
 tA1lYuEYzJizZ34pdTL6MHeZHsuxj3tCVKurn/Abu42idkRDBRifC02fzI7jUVMSXeNCn3OSBjD
 LLWyiXkX0Qbx1e2OFQx5AR/Jo/Kz8BS06Xoyv0/bVPBp+jsvBWXDylqAg5BieJXLINkH0z5zrVX
 EMceC6M0l0dyVKtLB3u/wx8x+BJy99VOljXub9hj+CpsMsYUI4CkbaaR6xjElj06Lz+CJ3Jb426
 SbcFM+we3YyGPsuMPaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_211741_826396_9B44B636 
X-CRM114-Status: GOOD (  17.86  )
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

On 2026-06-02 15:13 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add a device tree overlay reserving AM62P MCU_UART0 (Verdin UART_4) for
> use by the Cortex-R5F co-processor.
> 

Can we please reuse k3-am625-verdin-uart4-mcu.dtso (if required, rename
as generic one to be used across K3 verdin boards)? Else, we end up
having dtso for every peripheral that different remoteproc firmware.

> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
>  .../boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso     | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f2db3c878993..27a56abb1d7f 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -84,6 +84,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-uart4-mcu.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
> @@ -277,6 +278,8 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
>  	k3-am62x-sk-csi2-tevi-ov5640.dtbo
>  k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
>  	k3-am62p5-verdin-dev-nau8822-btl.dtbo
> +k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
> +	k3-am62p5-verdin-uart4-mcu.dtbo
>  k3-am642-evm-icssg0-dtbs := \
>  	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
>  k3-am642-evm-icssg1-dualemac-dtbs := \
> @@ -376,6 +379,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am62p5-sk-csi2-ov5640.dtb \
>  	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
>  	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
> +	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
>  	k3-am642-evm-icssg0.dtb \
>  	k3-am642-evm-icssg1-dualemac.dtb \
>  	k3-am642-evm-icssg1-dualemac-mii.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
> new file mode 100644
> index 000000000000..ad5d6a5c17c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Verdin AM62P Cortex-R5F UART
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&mcu_uart0 {
> +	status = "reserved";
> +};
> -- 
> 2.54.0
> 
> 



