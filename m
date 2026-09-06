Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD8FC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEonlGJlAy+zMo5GKVLtMmZqnOC8SeGOjhdn4OEB7Sc=; b=sYlDtVT58mEWQ3x9irPSjv4ELs
	nQZQaCVZ8RIntb8RKC9QTRVmht3hO+T8Rpf0Ku9Nn5umyIDisZY82QEtTMGl5z5elZPYrHkb3vhGf
	1pwhAn/Y8TdT4h+vgvX4LoYRoiPV6VW0ePcf5LDkbBvcEXNGTLz96Np3eqpUO+BdY2rvChWw1kRrj
	xEeEEzLrJb7BxqRL7ifPXhU8J6ymO2KI9dtEwZ4cV0hVg9B8dbxI76OlMmPnDU4n7sUUXOe0yd1Wx
	WobNTjqZOGtzbbhmk1iMrfV8Z2a4NhPFkGootpHq0P2OlAchFJIrxjbAdR3Cn1qNM29NB+g6U5NUG
	BcGrQm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DUb-000000054cX-1Kw6;
	Sun, 06 Sep 2026 14:05:09 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DUY-000000054cD-2cp8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 14:05:08 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6865dtFN3829171;
	Sun, 6 Sep 2026 09:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oEonlGJlAy+zMo5GKVLtMmZqnOC8SeGOjhdn4OEB7
	Sc=; b=AmhcXSvdpSWZwe1KtZuKWEgA7jBjSVbCtdnJVhPjzHhOKoPO/TivNlo1G
	GN44svXvQbG3WT18hx08d6vb+fGXJPF6piqwwpLYee/+qkwMVftqztmcyz0jR5re
	afTXGF8LfT6qX3WWt/X743ImJa9Q4rOFdBINbOs+RUfNtgsQWVKU/6mCUHBIsTY0
	kozGFTbKmxnMxXuAW25HPc7VdIVzfnHOySCR9akTjuf0A4J1vYBaJc96vfm99hTC
	JLvwLx+qk22gPI+R+Xw/6jr+orD0Wt0UJHKgRZdVc69zTsO6k+O0LyDqoEjproW1
	kzXtvu2AXIwblHvX7GhgHU1wNASpw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh27q14f5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 09:05:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+0Fiw1d/mZaZd3OGswnzk1lTGAIOMUZOOVjgoZm9u9u55+fWGQCVmQFX/ryJj7CmrIb/u2pyVdvHdReNOaJg20Kxxz7nHOkGmK+nwt9jhw7QUwx1FJhoYiN+uLp9Sf7siZymMiaNMIoYJ0IY1TBrBqyPwwEAz4snNOqcagGbX0yR/nRTXOatjhxJDHD+NfsOn/GRWzQfGPLznPC6TJXYWypOq9BfBFrR8skEju7qc559No9cHxur3qXgAEiuJWMC/B+oYxDsXzu2mYG1CClq8V/Iij1Acyy5PcgXIWIDth26OUFWr3y8FUy9ZR/3NKb/CYTFKXAoy2tg6V8RcV/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEonlGJlAy+zMo5GKVLtMmZqnOC8SeGOjhdn4OEB7Sc=;
 b=mDwRDDk7eLCA65oY7dVE3EScBQFSnEJRUl3ka5hFAZ9eWRY22T20gKXx+wOFJO2p5MyxsYzEJcdr+GkUAP61UbUd2rRFpQhnLG5G9rUIfAAStOacJgPLJWhUyuZM02oKiM0fyKe3wV96DgLeDYDtoKgM13OvWx2083kEYBXxYx0yEcgju+yKBg/yH0yNCln6pZTC6Xx6vr4OSaD2xIElfd9pEbvtb3QXPX98VUIdI2MkjWgvHaTmxMfbSdgVyqpuEEEmaty7ssH8rHLJCIIDYMgWzkDJlsmHyUDEHlyLhgIz9jSjowmZy81YmgUQN6HHFvoqMADhqb7fdNHI6oioeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEonlGJlAy+zMo5GKVLtMmZqnOC8SeGOjhdn4OEB7Sc=;
 b=AXBXndCCWDwYfkTPv3ss9UsjBXqDfucFbZ9xN+ZxIBlY7HZH4Q2uva2Knfgc0qw5GafLoVOUfuFHuoQH9t8LCloPSnHF2ixzChTVTb5L+1R0gsaxMSG8xRuxTbfcBCEhBBRXodDOK8x2oIpHcmhdEZHMejhAXRpwl+AXlenKi/w=
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by DM6PR10MB4315.namprd10.prod.outlook.com (2603:10b6:5:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 6 Sep
 2026 14:05:00 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::6f) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Sun, 6
 Sep 2026 14:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 14:04:59 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 09:04:20 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 09:04:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 09:04:20 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686E4FEi2950052;
	Sun, 6 Sep 2026 09:04:16 -0500
Message-ID: <5a62aa0d-c829-422b-b1eb-2b64f20e42d3@ti.com>
Date: Sun, 6 Sep 2026 19:34:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
To: Hari Prasath G E <gehariprasath@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
 <a935ba6a-3623-4fb5-a31b-fc58ea9dda21@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <a935ba6a-3623-4fb5-a31b-fc58ea9dda21@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|DM6PR10MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 487b099c-719d-4442-ab37-08df0c1fd6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|13003099007|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mWEppHawxT1SMDg1ehQdVcdMvdD5eNS39jAYif0uE3eLhaRymLRDMr4xo6LUCQ2tglpoiRDtzglUbwL2sy9oQ/e0ZJCfx+70cvy7uCiV/uZr8kiNq/QGT4BjxdIvTgjMxKLkhttwQshXMTMsqOISVJ7IUihw7+KjP3s7xtviK0vrSbIysCJQ1CmP7CgnXkZhah85IXLSAlkavaKP2cQ9mxXq9EpnD8tgXiveQNGf4yJruoxP0i47kxuzd2kZFTVyqdnpbsO6JI6biybhGmJ0/3SvV9XNnhLSOFYyib2SJdgCkOUAFz33wBxvRHpBUk1L/bTgQvmU2LAfL61ZvxJYiL8Ed5nm6F2dfoqr7YFd229/PpMbg3aYwP51WJ7d5mpgG4Or0yxRrr/LmwgcQfzZ0odqy1U7hqcA1vqpOIEYjaywuNT0xUWJIfsKYN8xq10Jt0rXk+F5+hfMUvpjBKHwmPojhuIk/zZRCg2dwui053he0EEHXbtJI/ovW4gcIezKR2dK5Zp99zn11TgJ2aUY6OSqU31Hhbror0wHFI1jSb+4WK64xstMudXXymUeaUHpBesz+XpfiTcm0f6prUIHCIu+HcxWD/2D2erjpkalJo26pnVTzida/YKxlQYmQkQ/bnesBxNEZgZv0F0sGVXx9q7S87r8CO8UMFrvlMBSZSE=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(13003099007)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /s4tiXaZKXidPqmGop+H7J0hHEBYGCEgWGCU/2rEgV+omZL79nL69aCNDf/0slpjd4mb1DohFXYS5URSptjb6DFH18SsdBHDIsisLPPj+xpL+xQPu6x6746ymXOYxZdWEdibWIh0NphECqAlqwimtN1dlclVqsPT77THowmc2VcxTkJd0DKh75VM3VZeAtNsZvf0rY/ltATAQSjQHdBwC7LR5BK2kf5uv3uXZgFibCcFNOW7IaxOtjMmf8BGBpZ7fM6ncOD0xotInb46xqzT7dYcpCA1cC4wijyO87GXyXr+gSPle+Ml4H2mV7+TA4AtrA9eDL8ZEXzhA9jnxHWHI8GzK6eo0YpXs9naVOXiWjoog8LKbgLw4c5OiEOb8+rV2U1Gwg3o4GrLdcIvwfgEXA+jOgVxfgnRvonQ7Bboo86Oi4UA0vNpBHLp9lCa8qoU
X-Exchange-RoutingPolicyChecked: cp0/hzyuRCI0MPJVtl8+SJFYp+G+nJ3YFCE6d6f10uzOSxmbLaJhcy0uN5ULbKDKqQvjegGY6rjIKOuZa3Hv7OPdZe6Wezk65JQiYmvz0jw+eCcQqvQUNGpLozVm9/2ATXXqYWgLYO0tFEZfrZ5JfGAlzU4S/zkky7lIj9K0Ms+3akfYKLkcvj6lF4FwR8etZQ0AAUIfmezNKn2qRlAv4XAecqUT2bCTuVz3R5MbidSnJldyaoEyhwuxgi03WyC5YkIlH1FS0uPHwNHT7id96oD9VY82YDMWf8jJLEv3N3jFblaaHmW8C3E4o3Y6F0zIDZHGR16g0lK9MyEtOVdLig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 14:04:59.3187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487b099c-719d-4442-ab37-08df0c1fd6a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4315
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1NyBTYWx0ZWRfXxiIxe1aCcqaZ
 IM4oERuXc3UckmDAubDgADJjCxkf1PmqWHsj3UDg49XGhI0kEh1pxBJZsmK0snaCbCluzsndsVC
 LyV0x4y3zJlB7y4KNef/Q6AfIhWtN9rHTjufBaOATWaZL8MbZgXvu/k5LNGigR1qY21eHnkh7eu
 q23J7qzWFN8rrT7MKL7p8aOZo/skpck2FkwGo2lJv25fv2lue3BRXU8LFcialHCkE/Nee8S/ziX
 j+8Mm4geEixTPgq3JcGcvJwVYNO/teRrE9HDO/ORfhAqu/NZGVf+2OnINRkHZtp6aS3DNzn+RkH
 SZY8A4XCk6k4oF3RUxXN8a8mgWaBqUUh/0xR8v9AGu+OT2x84/OCsVqguRExBkHq5njgRm/1sVR
 8XuvbX7vg8DhIbTg3v6W33dqurmm5CBf2YMl/kDNGh8xYcPp5vEEqhINL2bz+aL4gx1zAj27gJY
 zxQh/9L5W7OHBwT0CIQ==
X-Proofpoint-GUID: 6-kEn7TuzmHZS5OStH4tM0RR9yXcD4p8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1NyBTYWx0ZWRfX8r8Kg8bQ15Q8
 wChdpr8a6EpfTvRDATRhLYtYvNcKevUMN4Cv5YhBT7pztdNTGywphRKPwgRuZ0yI8CLUf/+O63A
 sD2UJ8cmqFc5899YG0Gj/l8czNy/wv4=
X-Authority-Analysis: v=2.4 cv=e/82j6p/ c=1 sm=1 tr=0 ts=6a9d730f cx=c_pps
 a=zZ5onIKbzmoLkk/LR1Usmw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=ssn6smvqovOTPei84U4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6-kEn7TuzmHZS5OStH4tM0RR9yXcD4p8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_070506_783295_E24DD951 
X-CRM114-Status: GOOD (  18.87  )
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



On 9/6/2026 5:48 PM, Hari Prasath G E wrote:
> Hello Udit,
> 
> On 9/6/2026 11:13 AM, Kumar, Udit wrote:
>>
>>
>> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
>>> Add the 'ethernet0' alias for the Ethernet interface corresponding to
>>> the
>>> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
>>> Processor Board.
>>>
>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/
>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> index 54dea36b153b..ac1c1ffe40b7 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> @@ -24,6 +24,7 @@ aliases {
>>>           serial5 = &main_uart3;
>>>           mmc0 = &main_sdhci0;
>>>           mmc1 = &main_sdhci1;
>>> +        ethernet0 = &cpsw_port1;
>>
>> Hello Siddharth,
>> As default only 1 cpsw port is enabled for all boards in this series.
>> So ethernet0 will be cpsw_port1 always, In case you want to enable more
>> port in default config then having aliasing will help.
>>
>> otherwise, you can consider to add aliasing in overlays where you enable
>> more than 1 port.
>>
> 
> The first patch in the series for k3-am62a7-sk has two ports enabled by
> default, so there it's fine to add alias. Also, there are many other TI

May be I am missing something, but i don't see two port are enabled for
am62a7
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts#n796


> K3 platforms which have only one cpsw port enabled but still define
> aliases. So I guess to keep it consistent, we can decide to accept this.
> If future overlays are added, this will just mean reserving eth0 for
> cpsw port1 which is also fine. I am fine to move with accepting this
> series.
> 
> Acked-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>


> 
> Regards,
> Hari
> 
>>>       };
>>>         chosen {
>>
> 


