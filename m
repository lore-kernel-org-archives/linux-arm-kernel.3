Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5751DC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6iwixzuWsBHAU0XzSR5aDaBYMBG+V1KpFBcHvYDWRA=; b=hbb9q9b3F1Ex3tRy2SEn7+P2ki
	ALOjpkadPTJx3P9u1WA7nUuaKfTniNy+eDz4WY0UemIgjYsAQBHIpnHPYHpwWYcMJN2tCaPiKp5uf
	2OugbB2fozUxgiMauMjUbUJ7E3wE1G5K3buosccZN6j6YCW+rZCZbVDcfWpU0ypN80MYMpuyMK6Oa
	3fRcJXkhtAvs0N8ZIvEMK1FWO6OEzOmgTA45QMkikHCEOAfB4+oxvVGscWjiSHiokZIdLfWaNQny4
	SKF4TBf0QnEW3TpHdNQ+bP1layNPpR9qoV5VwMx6cmqCUzm3xjiGpwTf+O0j/6lkaVC1zUT9xyrED
	EhTS5Q3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XIv-00000002pNB-1DS0;
	Fri, 04 Sep 2026 17:02:17 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XIs-00000002pMU-2PGJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:02:16 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684FtqiC106183;
	Fri, 4 Sep 2026 12:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=y6iwixzuWsBHAU0XzSR5aDaBYMBG+V1KpFBcHvYDW
	RA=; b=f/eSreGyL3tj6qJugnevgrpIie7ouBZ6uukdYgZUyLaDDbxOuw1av/Vuf
	9tsuEIS8pO+LJbKpbh8CUhwpGEsNRSrm1bj2La3mdkDB9IjzGGs73rSyJrAwEn5o
	a0IXCKaj+JbdWq6iCT92zvDjSQabjW+taI6SOxcO84NrN8PCDMTo/vK3lv6Tjeyi
	m/yjOmfooQpCgqQKm7xPQDhyYP3fp7kqUnLEpu7elGQ+CNjZ6YHrsUWk0Zp4LU73
	WDOlrK/L41RKcC8Q6s3tQa8c2VN1280KoLesOfMj5Kb8zShrtUzIB1S8xvnIKSLs
	z3tjdz+5wxTS53IHBqMfCe6eQEzZA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq165x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 12:02:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+XORta3WpqsdxISpjF1pKdWWqGGf2+k998Bb5yzblCl651pviBGMGeGok6tMNfIkyKnXth0iwWPELf3pLrahuPKgis+xq1pLtvwaYghXPop2q6lrzKZ5k8Gi/2e0by+HUYr+cXyZx9DNcCxL06B1pjAlINmwJZSIoN0wIfJVeXQRW2OE/Pl6KOch6t6FaEWNcM6uCpPPuSDu+bDHjE1zB0kvSv8uf1kw5FSjp7qLLWITGX2klSuzrAUZTVTpAqiAwKKk1M50TBDJEJzswQcAEwyVSAWoB3T5CNfMjnIcl6sYzdkPBCpP48iJ28eWN2zDuURPsjgtihUHC8muC/Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6iwixzuWsBHAU0XzSR5aDaBYMBG+V1KpFBcHvYDWRA=;
 b=gcNMPOwtMsnn1XopTYyLDu2OzDFQfTUr7/ZkMyc5+knyHmKE4umNb5xikr7tVz5+iNmC1wJA0MyA2h4JMfGMIIApC7PPdVt970IXe6uRw2o8ISz78T+lZkt3zzxdeEVoac8Ri8n53E9+DKD3ixb+ydPNGxO6/4KxRzqHvRdll63Nsam51MEuez2/3J00JG2+dbtArua+puCTL766QV0/WzNYmTf8Ke6fjJ0aEeEVjHhYmgKoRP+1TVtdXh22GhPE1Wz5aL3xzYPC55QmD+pBa6KDNHDVuuKHh6tvdL+LyuJ1kRXlr9T5JrS8UVkP4lZCzjHkRENQPbzbrckwNksdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6iwixzuWsBHAU0XzSR5aDaBYMBG+V1KpFBcHvYDWRA=;
 b=g7cNi3TEBUK4k3MFw8G9MgWgJg2fYRz4KP84K9aBn/7BzxPjS4qfQWmaOrNazxd8iCouSZqtDJUxle1yn5Chrl/9pv+NH6NlBjS0dP+MrKNRJavQ5M4RenwW++bBO6IfXad6fcAdbPJfOVsnB1AFWLq+Of39NyymTp0ZNtJAceI=
Received: from SJ0PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:33f::14)
 by BLAPR10MB4996.namprd10.prod.outlook.com (2603:10b6:208:30c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 4 Sep 2026
 17:02:04 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::aa) by SJ0PR05CA0039.outlook.office365.com
 (2603:10b6:a03:33f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Fri, 4
 Sep 2026 17:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 17:02:02 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 12:01:31 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 12:01:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 12:01:30 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684H1Qh63875739;
	Fri, 4 Sep 2026 12:01:26 -0500
Message-ID: <92825c41-3238-4186-9106-d08c3da2029d@ti.com>
Date: Fri, 4 Sep 2026 22:31:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
To: Michael Walle <mwalle@kernel.org>, <a-christidis@ti.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
 <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>
 <DL6LZOVDBDTD.DQNNUKIU3P3H@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <DL6LZOVDBDTD.DQNNUKIU3P3H@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|BLAPR10MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: b74cac71-ddaa-4cde-1865-08df0aa63dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BMB0F6DHoYp8zAyAN+VIukZzWfjBsiXDX++LKBQzBF4XCC0S/Uj+iLrknwaXuzS0Aq3quWN6MP6lLpRbN5c2csxdqk1FpXrua2c55QdE2QbRDeZjXV/i0lvlgqszE4usjCBdcLMSFRuSngolUsa2NTAGwvw85cqmcJd6C6h/G7JNnoWIm4wlsLRSZK/mdEFq0fnxBYivytCwJF0KM9J9cjoKHebcoPBdc6zPyudNu0v2lrhUA+qRChlVoorkON4KFShS8aNUlfDMEH1HDEG9V1hSV0Qo3aIXvDBM38fUh0+NReqFdxg7ZlCxxuXn+M8cF4CS9TKfNdEw2P9POu7+QQy1wknmOQoU/vidFnx886aUJXM8XIXxOlMCDbmUUfZH6uesrEOxh85x3UA4L7OjqjcR6xE7w2sh6kaMEq84acFF1y37GxIOVrWrNW8znXV+tOU1R6XIG9aHccuxL7gYFvNKOJqGTX3RJZNZQmoBYlne1EfaaHgvu+PHQWGDISeYH9Pqpi9sDq82pDrnLpc1IYIfkNVa4HokbAsUs6vwvNjMVSIUv/8VnoMWvXrvg6OmmrEhwJRtFvdsS+JT8PafyYx3Pz+ISW0DVHfmNQHbpx36kJJVjjZnW/lXQibDuPb75JgtfFH7uzP6suHaXksuyHS9XYN/zpQhtnmTPKoxGn6K+xsMMBfzwUp1wqPxETgWXeHz7UbFNNk62Y3lNghHnQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tGaP1vUjrlnenYe2WeRetfzb682bfqR66AAL3LSoEubUlx/lmYS4JOiS4l+F5+qeog5at0jHbE5DsX7pKqoZvjpFYYifhpUT40YuZMU+UFicBiBcnNWwa/zz0CCdOgl8IFHAxm6pGhE3mKwa3YyzBQxZvlQceh9TJQdmv0JExaExjR+ECsqEmZXCxSGEZZ+OtcSDECqPLG3OB4obY42dTmGqqH/u9TyyQIN4TBjLDJxekUHFkq33NxSJF7iXCjESQR2YsAl3tt832Cey1z7aJEpQRZYUK8jNG3oDJJZZUyhQrgerCC/A68RudIjxHuODQ3csgQoiVWc1ieM0t14xpU2d64kRdItZlllThxMx+f5GCk+IBpHjbLbQfQvAihryIAXHpMjxAU2dh9jXY4hF+XpSdz0Mv+n3pRPHyrqscMBMBp+CFMiuUdpKT+5qGkA+
X-Exchange-RoutingPolicyChecked: jMoywewx+ZcdUb12in9Y09t8K9OoO50UXcSIq5FkcntTuRTUZwFbOLYSMlLXqpcUapCCveO3vQbn71kgQgfuAY4utkMUEgKreKp7AjP8uWqmsKXqn9DfiBirFEKq0zRpJXIpZ87eQ4VTo9e4qY1NszAfztdT8e1GgSAGDMkq9Jf06U8gYddROcxsQSKTpPiaP8wqNvHWGuZEz+xVPmQozATfxxW169NH0Nw1mUMNzHaK+bq4ugulm5b+nOKVE6+my+J9fmJvnGtGjgwwNCHUXzubZvCqB7lMffbg/s7X2Y0MlIVgVrWE2dlKR8ENWKMnlDP+8yj2Ne6G1+FAy7xZww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:02:02.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b74cac71-ddaa-4cde-1865-08df0aa63dc4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4996
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NCBTYWx0ZWRfX6kxbewHQir43
 FfOtSK1nvRKDkUBMs7w149vg3XzueUTNYfBNkIuDVYHiJGDD8XLDCKCnenz716wK/dyk0IhG7W5
 LeEb2t425woX7o0wKOBl5wGilG+6dQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NCBTYWx0ZWRfX4V8SJuLKTa5o
 5qxYUSu02JnVNwOdecx3JT/v8EtFDrl+oCku0DQPiGBzoPeCaw0OXfDRBEyOXGgDwr1BC+JQ6Pl
 MCtaWqQSF6Alss95VCVabxaiorxqo99FMKRcIFv2Feho6C2ddYmxcQWMR8aa5+xOtZ8iEMPO6EA
 uDSxwUDfHH3q1f8n8qbS1ICTcuRiRvNSqZ0BKV4PzGr40Q6KTGmdYT18jJ+45WKp5HuvF6GQhXj
 zkAv896omYE/SnjIPbfOOBNZhZDzrod2Bnkp7vxQbwesrsEuEi0VyflKOlULYP0FExFjSYPAbP2
 8+R0s+eBJi0mbw9TRTlyoQzIjaq1ze6OjazHVyKP49sKUkkuxtZzKiJXL/2cbAYzo5roHOWqrKZ
 HX5Kj2tM5VSDwAUuFN3X00W9q7uqj60vW+z4GGywiCO2xNQClDOdlHmcfqSKjpQ0UuZxN+YLqyJ
 Dj82x0uluL1BC80PqMQ==
X-Proofpoint-ORIG-GUID: kq7pjMJVa7P6MZIjBW_PcEi4_GiSHEsr
X-Proofpoint-GUID: kq7pjMJVa7P6MZIjBW_PcEi4_GiSHEsr
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a9af991 cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=JpOgYbDp-MII7aiqTGwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_100214_755807_B505754E 
X-CRM114-Status: GOOD (  10.37  )
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



On 9/4/2026 8:11 PM, Michael Walle wrote:
> Hi,
> 
> On Fri Sep 4, 2026 at 4:27 PM CEST, Udit Kumar wrote:
>>> +	gpu: gpu@fd80000 {
>>> +		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
>>> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
>>> +		clocks = <&k3_clks 237 3>;
>>> +		clock-names = "core";
>>> +		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
>>> +		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
>>> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>>> +		power-domain-names = "a", "b";
>>> +	};
>>
>> Could you check once, if you don't need some assigned-clock-freq.
>> and good with default freq ?
> 
> See
> https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

Ok thanks

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> 
> -michael


