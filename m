Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548F5C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ITYHWEZV4llnMcUiVSMNsXEeLnscyrkvoWbfw7dBLU=; b=0HYArvA2GnQKbU9Og1SzbmsT23
	TUIVwygJaBtIrmJulxvyBVTF9wAL6meF1HdZttY1GoY8F5CzoyEz0njt0OzDkRn5npnlmkPkzENMm
	6GuV/ji8rUtugxsvQvsI5kStPzfvNa2R3ev6FZ7+EBnj51Ft1nE7PtRKqDLc0qhtMeCU5sbFTgHle
	w9tQMG9XzSKxMPL/2/ejYShPPaBxGF9qumq8wJN0fz68ugbT+ovL3eZrlQ11ngUEz67xQjNdsGe/B
	JRaj5jJH5y8RtVTPAFzF208RVjGPVOlWifI1mXIUOQ9LcDWM2wz8EVmDlLlz58+hoZhLWZd5eKlrP
	7y6fdjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZTg-00000001K6u-04Uy;
	Thu, 13 Aug 2026 17:44:28 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZTc-00000001K6G-1WO9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:44:26 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFV5To3455074;
	Thu, 13 Aug 2026 12:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8ITYHWEZV4llnMcUiVSMNsXEeLnscyrkvoWbfw7dB
	LU=; b=NV822VveaGZ8y5cHoczUFKN1nVcaEzGe53JjER8a9nl5ZgnTX0aOSO7m3
	VBNa2OIZSBAFYyciA7IVIKvkJFulQMKyqPU/5OSih9esH6IwwGBMowbuJpRKJIqc
	8W62uAkzXkOJnC+Lj2r2hBVq2X+Q8LnlUrcFzHOYU6WR3KU3+XvJZwDXujmdkIDq
	ei6bS9/XwrMg+l+1Aad8N9wdMPoIKQpqrqSb/QwG7eaGODDHhpbSOrcMfya0Bsnr
	73BfflModc4KMWedLchfYIYxlGO7oxNKMB7iKVpKK2pYatuy1J5u4wWE5QmqlyzK
	XpOhXpQmn5P6waN3uOY/v7mjnS60Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4b0rf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 12:44:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toTfYG0ZSSmuShgbf1evr/7gV1sWuQQLvH0C3Crk9J7dvwln9xaClncaiSKLmjdKPbOKN5f64EfWSqQp8bJ4IVq4ZocIwrzmZzXmK0IeybZ4Mw+/xAXa+Mr8es1tS4tVeRMIky5Bpv8OCOV36o7n3eyVRaU7YJlRnN/i6G0YqCiLRyjzmfOKdkGtfPkLo9DQRKA1D6E5fB8fd3W9dp5Qmi+7SY0uFVv30chm46abRSsyXNIOevMyNUJCurGNprN+3pYNf6iKxSKdHGOFo4XvxpvHouXaGEFE07mPdS+sJkeob43gUY3GLak8n/7rIz/ObqHx5IoVh5b3i0wRvW5vZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ITYHWEZV4llnMcUiVSMNsXEeLnscyrkvoWbfw7dBLU=;
 b=LpMHfX0nlIKrXLat6OMCaNneCoTrugUvl28+1/OmOMGvcsDdUqVGAeC5L8xS+Jmkv9AVW5iqW7ATPBexqLDhCzZw1stPFc05XUc5LB42VyDAlaScp4/JAX9HucrO5J5mjaSeDZnURTr68cUqoEk0CiAOJtcn8v+00AOUgVOmqlj+iQYLqr/g/0x6TFVh1Uvkyjtk4rgb7vfgOGDI3fjbeVbZjn0z/x1DLsCNvKnhfSzKdULTNsrSlXjOlSX4nDWYisrkWMgBasjB6BQwtENixNKvo4crGADJCo7XAM/sPEaSFkFL6JJenWo2nEtsOMYCeOoIEfqXBiHG7vpVF/7qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ITYHWEZV4llnMcUiVSMNsXEeLnscyrkvoWbfw7dBLU=;
 b=QGs7dH/HDKQw42llZY4UIWrWpRlZs68LRE0aQu0Fq8mziouuBcX9Fd87fUCGkFshLDZaGEaR/0x4G9nAZZsrWzNttvUr/gizb3cMrfJ/QVxl06N32fBKFI2nCnPRcN+yzjJA1PP+NPCfOcJ+QKvtFeZPZAPlbCxXQSgtRXo2hao=
Received: from BN9PR03CA0497.namprd03.prod.outlook.com (2603:10b6:408:130::22)
 by SJ0PR10MB998059.namprd10.prod.outlook.com (2603:10b6:a03:40b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 17:44:14 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::2e) by BN9PR03CA0497.outlook.office365.com
 (2603:10b6:408:130::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 17:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Thu, 13 Aug 2026 17:44:12 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 12:44:11 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 12:44:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 12:44:11 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DHi7UT1267107;
	Thu, 13 Aug 2026 12:44:08 -0500
Message-ID: <3db98204-002c-4160-a055-d644c4559f33@ti.com>
Date: Thu, 13 Aug 2026 23:14:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase tags
 for pmic
To: Anshul Dalal <anshuld@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ0PR10MB998059:EE_
X-MS-Office365-Filtering-Correlation-Id: 6125280e-55f2-4bb1-176b-08def9627c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|6133799003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HSXfNSXlv4SJfLDzXder1mzUBHv4rIXSQzxyeYM+wpUbXzHi4NgP6woZ0AHWc/Oc0MQ5Yt5auEOcCDf0d9Gr0eV/UVcDj6FYOZvEa2Dkj7/HxPIZJ3gqXTcU8oi8lt5GyAkfebegaI3DPALjEzhFI66mS5cpjFd0Rhzkj5xzI0S7NVu0MXYFpt9T0bqg9m/x63E2FEfAAvgDAUR2+FmaQiDJp5OqIektX8jWOiUvcO3p6rqyTUvcDyFpgGTPhIfFO+DtTp84U/yClRkqrmzGYd0wnUWsa75LfNXHjS05o2oSmLSd79cTiCrEbm10DzKahCIOZD3od1iFhW7R8Vw2nUXDBrrjUYg9GCflEr8Msl+tNkaif7cjZ5k6nNz+2ejeO8GPRrz+OP5tIGorjJ7tfsUiFFBulPaZSHIDWD+vMApfsUrNbB6typuDuWP5HamAOZovVkvO9Xqa+1fi1zZwedAG7Or4i+EwN8PHdgRBsZDlw9TJP50s/BN7JaopdTeUJuO5I3/SAeqdumCyILKSPKanRduc1NNfveh5R7umsGQbAMjDl9RBrhMzpYRZSmgCIS0xtvq+yRof5tWup2dTplcPi5FBpjm7bcdb89Ar7Qxf9JZiiDmhO6164p4Tnj47lY62phpzWaQXME+E+jSrLPolT9iWAbMInuM2unJ74d6aKxNK2DGbT/kenRPJ54W808vjc+EZSIFlx6PMthG+SA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(6133799003)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K+whX3Kd2eQy9tVUHYQo6BhbeJ1tT59UUCuzSdq/ps1BhAA07vxnHPALD0hUhkKPnZxshubJxZe0Y7g9CHMIPgakhJkihBhErzMu5671ii4zthvUwjGE+L/Ig9jtX5eY+hk8rH9pFFOnh3OI2GMBHHW/d1ZZL/B6qPjMF2akYPyzxAiQXHl782Yn0Frdn20lh9yE63aTWM+8ttIgzeKRDwQC7bt/oC/P9LMQ5AiOECjn8+lDLLCqB/bWdRlC4uRT/oWqx3Wy3bXRulvHc7SZcODmKdAmQC0VmNi4H4XKP0nf2689qqemt4OMGnp9oX6GGGM/imWgutELkiJQykr+jgzv0SqwDS0pBGnn4q7pXwH+pQQteWNXptic8ZC+803eX2oeYcxGXH2NgM2hKT7LpY85ILmBF6DQO95n6QFZX6KOVD+xp/K7Fll5+j4pRktl
X-Exchange-RoutingPolicyChecked: qMR8z3CF3XwXhdmKnlLvDS8rgXhJe2doVFQIECQ8TecYHN3ZCiN+j3h+EWsdpG4Xs0/3rJOtjZdA2FE8t3hG+CxesUfuBdMDCs1uZt+WsB8n7VHDztqw6Bklt2AKk2VW8t+vM9gvWqiVbS+8n3elrLq2BW3ryc/eoYZgqPCunvkbajZabh1Gb5ANZgE83m/JxUEoGMBcV66YGIs/RM3mU9NBON+7Yfi1B1L0yDXgSLxwWkKb/uKiP5w0Kz/tbtqgPeLhkR191EcIP2Fgvc5uWdQvpTi0/nlqS0hliRDeh46Nsx9nNne14wiUDKmL/l7qpeFQcNS1o8g1g0cj+BixZA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:44:12.3528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6125280e-55f2-4bb1-176b-08def9627c89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB998059
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyOCBTYWx0ZWRfX6d9aGfTA3B15
 L7Y33okTdCQ0ewvq0nU6MidCrlcWg1irNdVFsHtjStzb2fQaqHvXocuIA1lPjs8TOHBAmzt6Cte
 bP5GwK/69AAd+PyjxMXhWa1QE7db5nI=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7e0273 cx=c_pps
 a=yJkyEzHMNmsTB3XYPV+H7A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=YG64nluAAAAA:20 a=sozttTNsAAAA:8
 a=6O2ah1MgpfOyT9fuG9UA:9 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyOCBTYWx0ZWRfX5cw/+km8QNJP
 1cncsrWi4aZPoXgMc0pg08EEtneKTkUKPsXyJrSJH4z3qkUkSM5CGM1cMvi7fbB8UEJKCqq+oHa
 WKSfVJd6KIzJYh2myujCjLbXGgE/NpwhDCI/rua169nPBeVvjiVcIXUZ4YlklAHvoJxRvKi4Ep+
 LDLb362ILSS0KEp+AA7/Yn8osCacFM3gQuFeND1rsZlDJu2MD9BKVVa8kiZz73BGTrePj4o9T4M
 HOlJI5kf6vbxMzpbeC8b+dBMP14Ch8iyPpPVQwYo2XhrMhNBLIZ19yL3uSX5Qbt5eSz1Wk7vsSQ
 iilBs1jh8GqpiD6SbwwCHpp9RWeh4u3q1yyXtfckfAVhxNmsp1VymQzYeYXAWuw1ai6xORzqWm6
 34WIS63hTM/R9c6daMOKhcXGUjmcrnol2p+dfonnvJZedDWpOzEXo/bmYxPvmCFIc4Le4yQNRAJ
 yZZvGq0rPxf/oTstp9Q==
X-Proofpoint-GUID: 3ZHh0dMYPAGYhsvVKKwlEecVxHWNyGU7
X-Proofpoint-ORIG-GUID: 3ZHh0dMYPAGYhsvVKKwlEecVxHWNyGU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_104424_767128_59358776 
X-CRM114-Status: GOOD (  19.27  )
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

Hello Anshul,

On 8/13/2026 1:58 PM, Anshul Dalal wrote:
> The PMIC regulators for beagleplay are required for booting, therefore
> this patch moves the corresponding 'bootph-all' tag from the parent
> tps65219 node to all the regulator sub-nodes.
> 

Was there any issue with this platform that is triggering this change 
now ? I think we need a fixes tag here below.

> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index c468b9c5fc09a..5f7265c426bbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -681,7 +681,6 @@ rtc: rtc@68 {
>   	};
>   
>   	tps65219: pmic@30 {
> -		bootph-all;

Wouldn't removing this from here prevent the driver from binding at all 
in that phase ? I am not sure if the child tag below would also imply to 
the parent node here, pls check once.

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bootph.yaml

Moreover, k3-am62-pocketbeagle2.dts seems to use the same PMIC. Isn't 
the same change required for this platform ?

Regards,
Hari

>   		compatible = "ti,tps65219";
>   		reg = <0x30>;
>   		buck1-supply = <&vsys_5v0>;
> @@ -709,6 +708,7 @@ buck1_reg: buck1 {
>   				regulator-max-microvolt = <850000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			buck2_reg: buck2 {
> @@ -717,6 +717,7 @@ buck2_reg: buck2 {
>   				regulator-max-microvolt = <1800000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			buck3_reg: buck3 {
> @@ -725,6 +726,7 @@ buck3_reg: buck3 {
>   				regulator-max-microvolt = <1200000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			ldo1_reg: ldo1 {
> @@ -739,6 +741,7 @@ ldo1_reg: ldo1 {
>   				regulator-allow-bypass;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			ldo2_reg: ldo2 {
> @@ -747,6 +750,7 @@ ldo2_reg: ldo2 {
>   				regulator-max-microvolt = <850000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			ldo3_reg: ldo3 {
> @@ -755,6 +759,7 @@ ldo3_reg: ldo3 {
>   				regulator-max-microvolt = <1800000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			ldo4_reg: ldo4 {
> @@ -763,6 +768,7 @@ ldo4_reg: ldo4 {
>   				regulator-max-microvolt = <2500000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   		};
>   	};
> 
> ---
> base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
> change-id: 20260813-beagleplay_pmic_boot_phase_fix-c04b7f55de63
> 
> Best regards,
> --
> Anshul Dalal <anshuld@ti.com>
> 
> 


