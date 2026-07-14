Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aNKYFFh0sfpyeX4aXD5/2leD+ppwGJLIy8VCiUgCXw=; b=iT8KoPht6W0RbR6F2kE2oDvi9W
	Pn12H6RbaQ9w3JX6vSUjljoSypLcBe8lZdD7Yxua7yjeZ0iUhsnvMXLWHJSMN7i/uUd3xe8J2ncpO
	Gpw/U+YDWU7FVOgag70tDJ2Q67/uDpnFPu+3aJDXfVSiVQklmcXHdxhp/Jlps/7EFj6u7w45BlThV
	THpv8t10ZQStMiV46rjuQtYUFfyzzjO6CVH/3O59lWt4QrrqxAv3BYaQHwy2ame0ckuE36Gi8qxMM
	7XOn3NR0bvIXF6dZoxFOc8gMf2KFyi3WCb7+yhnYO3nZFxxStIQVgSanTZHcvt8sVwMVFRwjU5O21
	7PWAbiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcga-0000000C0ye-1efk;
	Tue, 14 Jul 2026 12:56:32 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgV-0000000C0uT-1rga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:28 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBhq182165577;
	Tue, 14 Jul 2026 07:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4aNKYFFh0sfpyeX4aXD5/2leD+ppwGJLIy8VCiUgC
	Xw=; b=goip7ug7AjPWaP9RpiuZAJ0d+UG5UCMSdUsTt4JdPf+0RtP91+vvW0yJf
	3baX7zjd+5PRz+lF/S4uqiGolJmv1ujPkDW1RLGHkPoO/WMO5g7sXo8APMwvkCHY
	wWcppIEvTiUx5zGPyl6sxk3sUKghSvoc/KQSa1XHAxI7B3k+p+7Y3tI96BAvBacF
	AiauR1G1bKzaqiPgOPQvPO9fZ2KgcX7Rt9OaQnlj4DqSoSKg/kf5lauDT6KPWTPn
	PVhT+/KuMHiqTZ8Mw3p1dLZlTna+60oipnNxcWXxub+Kls9vXgCXqHHQG/NfjSIU
	7UTKY+j4LZmFz7J+VISaiZ1CDW85A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdmgcgbgg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNY0rEWqoAStNYCqV+FaGdbYDJOp7hMHFVo6JHt8D5tdzZLeTB9JL0w9PbfJpJinjPZ7YV0dDJWfsbFvpbU9hXSw4x28QXprZMkOYQU2JJtB5YKiXZG293Vl08gLRXptZeNxpnM9baaAGKm+MsmVnS4tpsfrwQvxSyEPrkPXWWPXViUyk2sBiPexNO4R1xOyAs1mzkH/wdOgFI9VMx1wXuSc9FDSV/++qyNH/K8Zre2rOrB+hKdvfW5r6GB5idNwrdRJWPk39sCkDLhRgHHzYVWv6gJQ3jVpKB8IYyPxJS/UuVbuy+rwXzEAFYxbSzrp7r1PThI3ca63wuxoi2nKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aNKYFFh0sfpyeX4aXD5/2leD+ppwGJLIy8VCiUgCXw=;
 b=sNpPlkxGS9+TwbQc5xScz5xCvfQep8gu9JqyT4KeZu9ihJxOIz751vIjwUb0EpeqRITyhWtqtJv+fMaSAKv3cK/IZQUluN6nM0F93Is57UxzmMCWUzgoqcxhO1GZZIjcPilrWlGjqnkWm4IQGjEaeWqL1J38JMaBi3MaprfFYZHXvmnxaEtv+VdGJwxLaYlOfBRAfHBRnSYJoheTbsSSeDl270njePuQWUq38VKjNRHhmzW3LYjLUwtIoD7woYL+gBPJIkJ3ctbnJzMQ3KNtdDEbCHckQGwuDp9UAhp3dRmt6U1Dlsg7PzK3mPfgq0zq4jHcbYtRJ3oFzfPwqjz8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aNKYFFh0sfpyeX4aXD5/2leD+ppwGJLIy8VCiUgCXw=;
 b=d945IQeDyT9TQmxwqppAR2tzlcw3hDcbokRIgRpYlvvLqecXnEwsroM7eTqsP+LGj2lxbzgm4qodTuOqK5BPEPe0Ls325YWu3sUNEFRbxpooEscfY5WbMzaImkSqeNN1vdHw4euF0Inun9LcOAO3QbhOvznF7F625ykJ9mFeZMs=
Received: from CY8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:930:4e::19)
 by SA1PR10MB5783.namprd10.prod.outlook.com (2603:10b6:806:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Tue, 14 Jul
 2026 12:56:19 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::5d) by CY8PR12CA0017.outlook.office365.com
 (2603:10b6:930:4e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:18 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:18 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:18 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fW546300;
	Tue, 14 Jul 2026 07:56:15 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 11/22] arm64: dts: ti: k3-j721s2-main: Add DDR nodes for J721S2
Date: Tue, 14 Jul 2026 18:26:02 +0530
Message-ID: <20260714125607.3304375-3-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA1PR10MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c043dc3-e056-4430-e7ac-08dee1a74c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: jtUh4+gzA4tI5I5SXIS3uc8Bbj0Ylx81FJNCY2MeX48qRSfYsTD4nW6Bi3IHZpuN9UYh7n67977KKx3QmCVRftqf4VMoH6xGZ0+PMDORccgZsYMSNr73XLlKfBkqkjJ4ENDYrlXgDvSTqUjBQWYrssgG0jIBE2jmJlZ8gAsWIaiSok/b+c88h1qOgqbB0mxd0508BlbvT9igfkqFHpLnQ9ygk0Mtp4VQch5BRul+l+s2qrdSxHW7T+zPYAWw/uEKOIuohvT0XobfXbPMFy6wlrPY6feOhfiySP+L7wST6MPGIYerel9avhufPirN7RhPxzZNJ5ntTmy2MxxyFg5FFAENPFPm1Yps8BeEc0Bc61KIISZOfLDru3J33n0GBZ5AV3yba8lL75Zc4yWIwAJwK4yRDRXWkNxA5TOFMVW4EgrfhzIZajnNmhgxEfRcpy96v6HWjVClXbXv9HaRra/KBrkYeAQG/XCi014wd8D8sVW+ODqaHBRWr/IXrSABKgX0lAVMU7w9PD4G8GYak31fH0Ygx24V4oaeV2ig4fQs9NnFqQeJ4xCB208qgSZVwtOdOd8zxmsPvjIxgvVqfJExWLig3TfM+wOtn62G/XoUEFgFi1Y+wLGKCm+nondez73DyKDKTFZQsCf5jUwavIMV583h2sHwTb+MZBHmcDWDOn/9zxJtPCPWkyutsOKb+J51fzJpw/T58xH6Tq8/LocfWw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TDf3QF23h4RaoUkwe7yxIuUSvPw9lPMhfApZ+ZK3qWS8+ScPEgKXksIAk5xazgWMUca0JGgbGKlSJ/8LYsgda4QzVGLqQ3yAt50TMETGgj7tCkG2CjZ4gxM3X655yDPDWUNz8XNKt9d1XiKXTlp/OvsACyjnuyJpoO27TMRgHdwerxQDYHAhBMyTU6DII/rOEoewSg2zKib9Zbj3AxCqAi94f42GdHKq0j7fkMTqvBR+6CCGqQm8IgWVnCN8hmdv4E0kCgkKoBPWDjsKrpGO+eO1/5ZW/ZJWFnG8VKk27b4G7RuRB7+5D3YLRFb+a5c0gAG1wJjf0NQ3A1YWj78caaknbsPUx5TZx5Fk+MxiXL1RDSYb4uuyisGnaMZvLtJ0pjAr3SxQ/dIKjCUm5EsC1dCrdctG+R+mP5kMiyn5GsmRifowr4a6cuByPAlc0iU+
X-Exchange-RoutingPolicyChecked: FZ+3ATUOtw5+Q4ay0R/Cflq5b0YYViOyIHhQ114tEpJc7MI+3945BKWJoV/VRlw2BokBdU+XFukKo6A3G61c4P9uygkGJJsFxB0x6U3cPZJDaMuywEKRd/I9U6VrJHNdtYB8hT70Ko7GkdZIdxT7Q5Koyc/A8oyw8RaTgBNqR7QCBvePk1012r9DJFYBp0pMAMu6qwrrSBOXgZAoFWrhHAA2WCNgE48yottD0IfgTc0M84QeAxR+vuJBo4dDKbDj8KN6Vv5qRESrBhWi9NQloUBScEETc+EZvEe1dD2R4J9fQKDLa6r1a8S7vSeMsTtOa3Vku/JIOCb27Jrv+fWMMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:18.9346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c043dc3-e056-4430-e7ac-08dee1a74c5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5783
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX9aOQzKU+E5us
 vCzvAU9puMyc/lU/IvKU9JeMNuiPRgNmf7nYfJO2eYwn8PpAlx8MwEptCln0OnFttMXM3bHJPPv
 VptEYQ3uTmRB8nsoWOrcw1QFAaFr4Qk=
X-Proofpoint-GUID: 8aPolu1Ie0Yarcs9cL3SZkaR2r7QsU_C
X-Proofpoint-ORIG-GUID: 8aPolu1Ie0Yarcs9cL3SZkaR2r7QsU_C
X-Authority-Analysis: v=2.4 cv=GLo41ONK c=1 sm=1 tr=0 ts=6a5631f9 cx=c_pps
 a=9JMNuyHA4Bc1wrbCcMLwMw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=AS69CzyKzSJwK2AMOrUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX+CiC3gPjI41d
 DGEtieTunek0/7A0642xeCvjUx4+K9MyFcuh5xWO9Y0PfFYnaNPc8HMXxnVhZ3j1wYpHJLdEa0O
 xwM3CcpQWI1MKkS/C9vkC37x1glU/hTzmurYvB8qODA+zQxoj7m7A9jhuDSLsOOW6SgkS4HagMN
 mWX6uJc+zf0P7sEI1+sosENRRcoS83e/StvjILwfqhouo0Rqeg3JNqDW4/TUayZaJnxNORwt6bs
 eFsOQutcRdPyUf645GAiIouZmUDKKZoL7klxMDGbQzJ8BZozd/D1LVn9B90oHAMe4HDZ7YSN+Tb
 JlgNBy2tdX8kdW2jh00rKdwK7pG7ME4wF2ZKm9fPWIO2EtPMBbFOeaR1Ey/wMrq3VNlxRLtyFXV
 gtDSh23r33vj9xu0H3HNCQPkdEXo1oss9EU+wqX/8NmXZ2tK+oYzBpFJnh9d2rONr4z27aXrLGH
 RmOiXZGQk5bnyX4iRAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055627_505532_04AB82D1 
X-CRM114-Status: GOOD (  10.56  )
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

From: Neha Malcom Francis <n-francis@ti.com>

Add DT nodes for the 2 DDR controllers on the J721S2 device. These define
the memory controller with its register regions, interrupts, power
domains, and clock requirements.

This allows for DDR controller temperature monitoring.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..c8de5b74b97b6 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -37,6 +37,89 @@ l3cache-sram@200000 {
 		};
 	};
 
+	msmc0: msmc {
+		compatible = "ti,j721s2-msmc", "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		intrlv-gran = <0>;
+		intrlv-size = <0>;
+		ecc-enable  = <0>;
+		emif-config = <0>;
+		emif-active = <0>;
+		bootph-pre-ram;
+
+		memorycontroller0: memorycontroller@2980000 {
+			compatible = "ti,j721s2-ddrss";
+			reg = <0x0 0x02990000 0x0 0x4000>,
+			      <0x0 0x0114000 0x0 0x100>,
+			      <0x0 0x02980000 0x0 0x200>;
+			reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+			power-domains = <&k3_pds 138 TI_SCI_PD_SHARED>,
+					<&k3_pds 96 TI_SCI_PD_SHARED>;
+			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+			ti,ddr-freq0   = <0>;
+			ti,ddr-freq1   = <0>;
+			ti,ddr-freq2   = <0>;
+			ti,ddr-fhs-cnt = <0>;
+			clocks = <&k3_clks 138 0>, <&k3_clks 43 2>;
+			instance = <0>;
+			bootph-pre-ram;
+
+			ddr0: ddr@0 {
+				compatible = "cdns,k3-ddr";
+				reg = <0x00 0x0000 0x00 0x72c>,
+				      <0x00 0x2000 0x00 0x4b0>,
+				      <0x00 0x4000 0x00 0x163c>;
+				reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+				bootph-pre-ram;
+			};
+
+			ddr_pmu0: ddr-pmu@100 {
+				compatible = "ti,k3-ddr-pmu";
+				reg = <0x00 0x100 0x00 0x14>;
+			};
+		};
+
+		memorycontroller1: memorycontroller@29a0000 {
+			compatible = "ti,j721s2-ddrss";
+			reg = <0x0 0x029b0000 0x0 0x4000>,
+			      <0x0 0x0114000 0x0 0x100>,
+			      <0x0 0x029a0000 0x0 0x200>;
+			reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+			power-domains = <&k3_pds 139 TI_SCI_PD_SHARED>,
+					<&k3_pds 97 TI_SCI_PD_SHARED>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x0000 0x00 0x029b0000 0x00 0x4000>;
+			ti,ddr-freq0   = <0>;
+			ti,ddr-freq1   = <0>;
+			ti,ddr-freq2   = <0>;
+			ti,ddr-fhs-cnt = <0>;
+			clocks = <&k3_clks 139 0>, <&k3_clks 43 2>;
+			instance = <1>;
+			bootph-pre-ram;
+
+			ddr1: ddr@0 {
+				compatible = "cdns,k3-ddr";
+				reg = <0x00 0x0000 0x00 0x72c>,
+				      <0x00 0x2000 0x00 0x4b0>,
+				      <0x00 0x4000 0x00 0x163c>;
+				reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+				bootph-pre-ram;
+			};
+
+			ddr_pmu1: ddr-pmu@100 {
+				compatible = "ti,k3-ddr-pmu";
+				reg = <0x00 0x100 0x00 0x14>;
+			};
+		};
+	};
+
 	scm_conf: bus@104000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -2247,4 +2330,5 @@ mcasp4: mcasp@2b40000 {
 		power-domains = <&k3_pds 213 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
+
 };
-- 
2.34.1


