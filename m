Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730BCCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+zUpBjzrV3mGC/Qjzinul6Ul1DhAX4pHbNGlwJHB0M=; b=zvM7Bb1ar/C8oXRbx1NsxefQNa
	/YUPE7083v2AjzqcYEJp/ju5iIRL+wb88zciLq/s/ckJ+GMz27Tg3dzQXaDUzVK9yzQpyMhKj9Ba6
	cUXhKi0+ZYumIRHKZXyV9rqgSH+zW5KIPUOK7o4ETHh3Jw6fyFW+6XR4200UbsQHfxQzlwDUfyK5Q
	YNVtoW5VzJCx/s5cb8PRzDX1GJTDygTBTuRRQEvoFSvW9bCEADCGc8YdAGNtmPMcA90PAs0gf/DSP
	Dbh/2whFpIur6KGcpQfpQ2ez9jZ/fecJk+by/bSIEjl4LqQqVGewTKBlm0mq4oH2EHXZ0hShSpTkf
	1RGl+5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqzo-00000009olX-0gE6;
	Thu, 25 Jun 2026 20:48:24 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqzk-00000009okz-3Bkp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 20:48:22 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PHiTQt3933544;
	Thu, 25 Jun 2026 15:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d+zUpBjzrV3mGC/Qjzinul6Ul1DhAX4pHbNGlwJHB
	0M=; b=Nai2br75Bu7SK7/CT/Tn4LzBLhrsPRz0zpxswgrT2blJyEAhFjxq96v5l
	CDcgN2YjPJOszJZcDgg9oX7y8SrvHBne5C3/Hoqrmp4NQ/Ku1qy3O7RQQyrjO8mC
	JgRBnE13GW8Hps9IsModvzC3HvQoOGYWthNb5cT4eftgYlibnffAYXgU5ubPgcGq
	DfkB6gd4Caaaw10J+pMqY7OB4JOWW7yHN4BLFt/pAxtCXQLuvwnUT5ecyLuBxNfj
	2iPJ20GIH37bDOtxiMRv4rup7TIYZXnqWYDYgID9ZYWW9/95SoRXXwyJUk/q+crc
	gofQsejtABawwjnDv1Ey8on/Yimpg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0ug2k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 15:48:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGHaKNpT3kFrCkcnx6K4QYDWXvssHYN0G7egZdoEiPF9Yh6CM2zHwJk9Wdpg5Pg5549lNdwNJhqjzeQQo7oMZcAjGsqxjuacGPXR9tOSkzmodbJJBU/NraqkNYv2PqYFh7BI8eRE811X7C7rt5pVZzsoQMM15kz6Rh2IzA+UNOfcbs3XteSQ7+jMqzZ34oZq4LCfXk+mDbrNglxU08UomiH80W3aYnavDOrcso6p0rMMj07PLC09oXFOYgvmHXsWpr0u2EmVbSYM8fujAdTOpe284TV43yk4phNHliXQiBBiARZHMH/Xlbxb/agajSY9bD65AYq9NgtX7q8Oz6f/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+zUpBjzrV3mGC/Qjzinul6Ul1DhAX4pHbNGlwJHB0M=;
 b=JF0kSY2p+PZo1EAb9BbXc+/rxKFDlsIN6615AsOqv+APF4vbLz4mom5M/dY35l42jhYOW7nNrY1fj6+rPP5HrUF2hhXpjhyrd+nrTp+6X5IeDxl7LT2+r8NNerOSf7c+a6wRxj7FJw71JYabf3GGY4YkoRwftwK6AB8E+1YCdZiaMQZZs0OmDVJCGpg3YPzyNcoEoJJMVBnWdLmHP/Q7UW/BkTupVwEnFm/2GhKSGgb9PAwxfXfUf5znnxlYgmQ4vvsh9Ut2YcGgpV/Ezt80h+S6/PkP9wL5JeNynAunF9zzHpav+ZVLAllku7CLnqebZoPXk2pa2z3CEi1Une4ybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+zUpBjzrV3mGC/Qjzinul6Ul1DhAX4pHbNGlwJHB0M=;
 b=EwRKQvp/WkWpZVI4nWxw8//dxeEJ7SY/4YGPHIgxnLcJqAQ3lft/DvA+dUYEAl2vE/1Gxdwz+Ou2nDW1HG44bBP96ifSzCF/etz78RvGukZTzjjgnb0G8x3sabNnIxKR2V+1kL0DyEfuSpvEib3bZs9eGyHOFqKuAiCPYm0Qn9g=
Received: from CH2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:610:50::15)
 by IA1PR10MB7334.namprd10.prod.outlook.com (2603:10b6:208:3fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 20:48:14 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::6b) by CH2PR16CA0005.outlook.office365.com
 (2603:10b6:610:50::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 20:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 20:48:13 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:48:13 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:48:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 15:48:13 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PKmCpB4133033;
	Thu, 25 Jun 2026 15:48:12 -0500
Message-ID: <6eeecfb3-6d88-469c-b087-a4c87ade65a3@ti.com>
Date: Thu, 25 Jun 2026 15:48:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in
 cpsw_mac_syscon node
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, "Tero Kristo" <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260625113223.1711052-1-c-vankar@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260625113223.1711052-1-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|IA1PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: e43e4319-e6ba-4116-06ad-08ded2fb139c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: fPJaLKTmVtXu5+f4x8AGBMdwUYHTgSJHpVZIVTKJpDfScmoqm32/VU0b7JvODpriNYwKRVSd0QpuJTCPiTDl/g5Yr1YEzcSYvaJT7VjA0OpGyWVTSjN7Tp5ryuTgsuYXwSoxKQg/U+SNZJfrIb1URZ3g2uVRaYBuOAVfLUsdaPKxtwYKiB2YkcEdBuJljAEmCESjcFT2I/Ba1nJijPSf1v76RCHoLPIiT/Y8A3pN5VdU3W0ioqAzeEJvugRLORtPMyq2rhdKBVnD2nZxqHaSwUJK/d3e50WOMAxdax6jzOPWXzzwJ2bLe9XYmfKIVb6V3JyxS4KHOM4pUjFfm9TLoY9u47b3HeUi9S6AINGQkp3jsqUe+Gm/R1wf6GVA7j7NGAttov56+ZMZNjvt5IqW3limYQpRfX1k58CcIi6vHEipMJc89gfIFZG0eB7FXDHrwSiyXblQUiUVuvO+/8nCtV/Pzgx+x3T29KSWCcG3ByTHjd5pRZRl+H0bwSy+c8BX8qer3dIYHzs07siHQN7spXDbrbClLoa5XxiXnBjha4C16FOUDFNQAo9IMjUkvEtWWy+Ypq9ZntLhEMkcSqSY+x0nIjSz0PYTtfaKXiF3P9Bggdl8RFCRsrJ0N9/PAwTWvUVntbR1jhjtiB6SUK+YR50gwM0Zsu2SBAkkzvmRd9AkTIExeeKB1eqv53haRPs8JylTES0h+5gYN9flpxa1og==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o+/jt01JxQvIQXcQepfb10DVp6VqXPyYaZBL0cdEhAYU+3A8IAaabCQNOYL+JxLnAC00MHiMMzBBsGK8krhmXgthXYAu8Z0yTikY3GD6D7vNj4NwYKLxWoUsA3/QKTjUvOfQuFnVmszr54cjHDuuZKQD9MNDql1nXqze/XNYICYBjP6r/Zon/7oZF9uBLTiGL5pdclie1I97nWZIyEqWuNLEiAnTBwYgZ6qB6o0gw1yY8hWmnuxejcJWXGUxaJqmVrhNFskBRbu8fLQD4gkIpZwRI7iLgLmQnclL0t+IbJBnnHmtEFcqYromWm5/3mMD4+2LAqr1B5fpG536BtaKZWTXg4sFcGz4n4cZdQY0iA5/gY/dlvrlmmV25z/yT2HP73itlHcw0l9H4i2bnO31aHoSFSBetAcUBPAc6ot06EA5pVJ8xwgjZJ1UigrS6hOc
X-Exchange-RoutingPolicyChecked: D7eZUBybxUluxc2+DiDahTOPitaWj9/RsPeX34G1yVAd3zPF3mMAFnv0pQmFL3L8cfRUuZXrFGM/DvvYffhXs6jpvhK29kTJ/gK1q1HpTliN+48tQHCBnRjUXdwycAhsIeyHOd1T0qjy3RGWh8jxNwqpntD7K/L4L2mIXD8cghFEjbmpvK2p1q74u504ugUhA4goZ5O+iHqg676D0usLpPAa6i1WKIXhplTnXnbPEOeIvsNM4BP/Cg6sl9IjM5GeD1sQ5kThgMBhWWWk3QGbgMv413cyv38Opu4hz/UTi41h34TUg9IXGbGIt6W1USkjxQQi2agtCxhIZwHwgwqoEw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:48:13.9809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e43e4319-e6ba-4116-06ad-08ded2fb139c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7334
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d9411 cx=c_pps
 a=n8CZQ1v8Y1OZ9xNCwzzv5Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=eLZqF03l_r-QDe5qrpkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1Pd1HQefAazhK7v4a3taMsqpu810-OhD
X-Proofpoint-GUID: 1Pd1HQefAazhK7v4a3taMsqpu810-OhD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX7+26vR3U7uge
 l3Bb+bVf+vCzykFliOYUi1qeCyYCivIcdEV8HBWEsk2jJ2+5KpZ2m0XAXEkZ8gOuksL8Ha0EVe7
 OtodOCuPujpVgIPy2RsWrWSPczb6No4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX5Jr5/GQYKVM+
 VQMibUjqXqzjG9qKryjdGJ1U4S+C7LDp0crgxYQdT8UERmvBuWEscSxYxMGnH2LnlSza5+VPZBD
 i/rra+JIxuKfnyEul6LTM0wySQZbeCoLI3bmV8E6w1nYKsH4YnYkqHolOVvB1KRt1olTLu4Iwcx
 3qkuM6+BSNRPBMq+3/GyJi6ORFc6kF28jf2ML+uQwYtB1qhbmSR9ilzYpWjfOpyErZPkwPuE8UA
 CVz5vcxdoTFUoJGWZYV7amiCgAxiubF7OWZRqYvQjzwPQuK3Qlt4xriAbObJQtv11L5vA6Ysois
 8CZyOUGuPbItBJtjBMcc2viglP/kMijER5t06tnOjEGZDLGQkS7V4D/dtX3AyUE/R7GILYrEwm5
 H2aDEMwaMtq7n/j4as1QpQcMKTZDiTEdC0tLEX9ESbA1JTPXSlM7c2MJr2BJHFPyZJETWD+Se8o
 hFRjM6bZS55UFyflpIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_134820_950534_3CC48E7B 
X-CRM114-Status: GOOD (  16.47  )
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

On 6/25/26 6:32 AM, Chintan Vankar wrote:
> Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
> Add "bootph-all" property in CPSW MAC's eFuse node "cpsw_mac_syscon" to
> enable this node during SPL stage along with later boot stage so that CPSW
> port will get static MAC address.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> Hello All,
> 
> This patch is based on linux-next tagged next-20260623.
> 
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 821a9705bb7d..d3b3675e7a8f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>   	};
>   };
>   
> +&cpsw_mac_syscon {
> +	bootph-all;

Seems you need this because cpsw_port1 uses it though a phandle reference.
cpsw_port1 has bootph-all, why is this property not transitive though
phandles? Would not having that cause missing references when the phandles
are resolved to nodes that get dropped for some given boot stage?

Andrew

> +};
> +
>   /* WKUP UART0 is used for DM firmware logs */
>   &wkup_uart0 {
>   	pinctrl-names = "default";


