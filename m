Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22286C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AxdqLesKS42uFwWs3OHig0Jrav4u43ryPuPo8/PUbo=; b=32bpgyc6+zcIBypmOjaM6c4PLZ
	YmNU2vYgYl5nyAxtFi1cZ/lFOfrP5UC/c86jGw38+YtFl4RhLt4E7hNzobRGX2NN9tuDHnVHdU6jJ
	bs2HuE6fZkyDSZ60INrAvW2/mmYtpTWroh45L1K8UDuiA2le6zTIniFPxgr+sVTolHdfi9w5cBTkv
	HQ0DWHrVl/4IMfKMveW/sa/R24470hcdHgmx7zzoJ3vfHRS/3P+3n5e2YO4Y9CFYuKhUKEGBa6cHM
	YZWuxlHrARqNxemUdeOF0iP0tcLWq3GcfegITeZ0hjHcub8QkfBmW/K2k+S885xjt5yzoQVtPIba3
	i8UxEwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Zi-00000008PFt-04MP;
	Tue, 21 Jul 2026 04:59:26 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Zf-00000008PFS-15YK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 04:59:24 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNC6sq3420216;
	Mon, 20 Jul 2026 23:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5AxdqLesKS42uFwWs3OHig0Jrav4u43ryPuPo8/PU
	bo=; b=Xv9u1v1De+hi3heNHHfHo7lAIoxV4vK6eBqOiRpFDR5xx2mPlY4KTotBm
	97x3Fv1thUQTLbcsxshKNzDXbvuEQubfTMDUxpJElqhxkplnT184FW7JqRi2+OWs
	dsw8kVCp/XlUkNd8tOxRnBmtJznyI7ee+ye6Z8UXN7+mmESFW4JVZnCyciygB9ym
	YjCk4UX/KQN5sy4eBQbKbD+OUwXL45ox65Y4eENOP/POdhvBGr5qjNxQILfIT1Sc
	YlnVg4ErNIC8kcx0KPjL0WCU6/FpPwwBau1gbrb/VcZHZZMQVCgUtiUOsGv/oz06
	lEDwv/q0LEDZgNIVq+w/q/0oWQuSQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhk19de5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 23:59:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgLOPORW0d6JcDDlW8eYiQJaoKEkyhmLYUFduiR23AK76vQHgEaHdMpCUIeUGkwoHPAzgvRjFeaKX+MPWWbmN+eTcpTgWexCrfP9Lwtn2zTD/Ldnj2ETnqiL42Mbwm10cFibP7c8TEk0TkmFOoMXAt+VUh83pwJaFYCKIJgbQ1o9GzDUikSc2l5lPzNJWu+IMq5WM263TYBHKA69Hj0GAU0W8rs6q2qSIjX0kWx3hUTHzE/PZ6Q84dm4+0haB8nwRhba+JV4BK5cb0FG61+CAHXSivoYLPoK7MMajs8SEA8ZmetiZSKoJ3XN/zKqL0umZBo5RG3AhuWU2dJXBGiEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AxdqLesKS42uFwWs3OHig0Jrav4u43ryPuPo8/PUbo=;
 b=gYi6GrVMUjmBdPdNvItS0dDbafwwy2UKgoongJI0lU4DMcG6Gftag8ytKB8fcke1ppU2DzDeyKhSpUp8Nq7Onny5DZ5gTUBGYHuO9LNarypPJoDNRpDjqHICLiQlKcyc6gdEpbq94oOYp94M0CXOoO1nP06ogMGOESA2EWq7Zvvi9OLWf7fPazVYnkI6THZmZE+ZZIKXv9dzMY38FIfJJWTc5DAR2mkk6kXFkOd7W9r+Rq0AiOJwiJTP7YPrfVVR/tGL14+CCA4hsFTZHYQSTHYVRvHahsL4CR5bTWvHuiFNpeZOeL8yeFkB5XW/gT64d6Jzg5xdZwlkRQfoycBFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AxdqLesKS42uFwWs3OHig0Jrav4u43ryPuPo8/PUbo=;
 b=kYXr/HCRGaeQQwgWD9dYDcsKptlMYlP4KNu0zqwJ+8y/zHePtU5CCpkxu2itWQKnNHPUvLmHgeZZqxqoFqcVC2SMlEX0R8dNR3B6S9vbA3IfrFYiwAvZl1oHufIUuDIgd5O/T6GMgA5NoCEGJvU85vQhLQY1hck0E9eEw29gueQ=
Received: from MW4PR04CA0211.namprd04.prod.outlook.com (2603:10b6:303:87::6)
 by DS7PR10MB5006.namprd10.prod.outlook.com (2603:10b6:5:3a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 04:59:15 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::6b) by MW4PR04CA0211.outlook.office365.com
 (2603:10b6:303:87::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:59:13 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:59:07 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 23:59:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 23:59:07 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L4x2Jo4081865;
	Mon, 20 Jul 2026 23:59:03 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Judith Mendez <jm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260603192305.1347908-1-jm@ti.com>
References: <20260603192305.1347908-1-jm@ti.com>
Subject: Re: (subset) [PATCH v6 0/3] arm64: dts/bindings: Add support for
 BeagleBadge
Message-ID: <178460990113.873002.10720828634685094588.b4-ty@b4>
Date: Tue, 21 Jul 2026 10:28:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|DS7PR10MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a5b35c-7e00-463b-2612-08dee6e4cee8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|13003099007|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: JmOBV2IJBhbucWK5kJLQ0RVNZUra2lpUEC5Nl+bG7dgeFIURzHZy+MTo25tZ0fYiXgCHfzk41DyZRdkVM2gN4/ZaY3bdSBDFL7LYhZ6gT99X05jXBez8UPRA6OyKm6Nxn2rLAx+Z2uQJ8cNmGfEbTlgsAj3iq9ChYMpN/Av2WL5i/FiBeIDAzEh4C8pcDIG1LEmJ3inkahVS0llBjdMZYQb8bnVN+ZrWLkXoXsjvzbXqUdmqEd4ml5ZHXhUHv36Kmt2laP2Zj2h9z4YjKrS/3Qrc1JcEJY3vnXwPmjrzV+TXcVzPQDCgJKBBHfn6Wpy7H5CEkcFPzsdxPwxwFnSAT8GPXLo4Onq1rWRV9F/stC5ineUh+X6qcd+lBAx+ub9G+/AsyxHVEek4U/S4UT0F9i9saZHdHXGUcNYI7gITKIwIqWIgJUWX5Y2jV2BeceAYPHxZkY0pVKuhg7mjedcuj3t6pgolbljpctLwXWmMh2IxqZh64wqJXIllqf68Zr0FmVKCOXrGWbcilpgG4Lhy3KdFssj8PMhLoL5E30P3K3BW2l/tkd8eIm6/7x39L9jSfa7VJ0lHzDR+GUdtUgyIoltj1ZsFcU2vfAfjc8aUFECPG1BvRoqxG7uXlJUsFMzqLMRB1s0QlDoHn+Z4L9TGew/pp+hHFnKHT6QbmLTrqcHCe82ybhjCfxNjCeOazR7E61++EAz4ueI+ivDLmpFQWg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hSqfui6RAyb8S0sYPe5fXGrGv1EY9lA54eNtkTd17Sk5siLffwVWZMPqZAwcD+S0oRab+inxN9Bg4y0w4+oQdqp6PwM6/bAGA3yJW3CMFJwW0p3RgFoZ6iiEBNakKfTrqhoA8L75uG/jaz+HSMnyWlaQxClpV0lySCmvNmlTtvUqTSPTno/4eDSRYr/eBm6ost7Y0czPx5395zDdusBvgYGs8HIb4UqRb36rb0c2yBlyuh7hXFPYLxiO+tJkwMKRMhfY2JxqGIRWLFLTlNyvjOXHzvfcUe8e+4vN0nEw+bViGpi90g3tLK7LSFbV8EdjzEtaODS3sHVPVgN6ji/3WO7pyhzKtKBtWHd7JeG7LNzuBU9Ns95AfJ28MYKYbCMQqtVQlnwHCaBSxAzTmN1rDPIBLiMzOw4cLWUBwjo+ZTkDFhinrOTkB2RbEFp1bXIv
X-Exchange-RoutingPolicyChecked: q28Rh0b9s4AwlFO/COwAsynyQo1HBNR2MvPPsMZLsA8RajLRLu6xsjGU+gEwPoRmLuIlwu0mUcsBGLhwSfVwG2PvnVxr+/LL1U7rMHeHexhEb6TT3ynO9vpC1mYJRpqtPlI7glV4I3Ueld0LYxSZDpuFVlQRkd9tNyKJIo/rwH8rJ4T9CeLhiR4YG9MZtOMyN3bJUA5EYf2qrIsWUfixGTDFE2JbyNSviDqSlVQWquI6gA+ov/VMqfy2Ah2EmqYsX1oYa5xfYNY/M9uulHOpH3WOEgl74lfpOq+I2pcOJsDozlvEQ5yE0xzP8Ww8fJq4ZdHuO+fXnZ0HLXY/B/+uWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:59:13.0135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a5b35c-7e00-463b-2612-08dee6e4cee8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5006
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OSBTYWx0ZWRfX25pwYbNL6EMS
 jON6R9m3IfY8G4vg9Ryz/dMJK4KzIWJHfz7DdsMjINZjTpHokRs0SP6seeQ6Nu2AfFgw8XLgzmu
 NygLLDUt1UG6utsIRLqNr7NvLUUbnD9kANa7igCl0dRRtP0G/mdrx4i81RNcQ5RU034uw5jC7LP
 hSXgh8JUk5O1OLhXHJRJKbpTqiCkutRXUJXpZ6qjU/AVcS67Fp8LTSWJ9/0+ENLUzdQk7esOxFn
 V7oMPamc6/2DiztYQpAGqz/cj/ZEL4zOB9IrelCWjLAUG0S3LlP1ojwFn1An0gtcj8QVv+zQW37
 /Y9bxpFNGwo/r/xX8p9/kyYZSuMS3RWdJH1gdHbc8Ywjigb12v4dImoQ6S26MhZ4R982gsMKOKd
 oN6js/JAaiUTCwQErYJO1FO/MT61/VnsFel9/zeShKhjiyHcGIerOq1Sq3JHm+SPAWHYTKp6J9f
 FyOQUploZmVjO49dpcA==
X-Authority-Analysis: v=2.4 cv=I4pVgtgg c=1 sm=1 tr=0 ts=6a5efca7 cx=c_pps
 a=0FlYyfQadWprtAtRvkXThA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=fGhLjsSNAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10 a=LYKFdyShAPKLkGq8p7WX:22
X-Proofpoint-ORIG-GUID: ZnBClY1H_KwzbVv-YHiedp5s6lWqblZB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OSBTYWx0ZWRfX5MA8WD6xX+Ie
 8TQWv99Bbsj+s0IgKkq3dntG4/Js936/vm42BM19lcM617PtVngo4lFpegy4xIO0+CBqOrOaYMB
 b70QWPKTbTJIYmH64VzLf4Np8gAZyEo=
X-Proofpoint-GUID: ZnBClY1H_KwzbVv-YHiedp5s6lWqblZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_215923_434599_AEE30695 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Judith Mendez,

On Wed, 03 Jun 2026 14:23:02 -0500, Judith Mendez wrote:
> arm64: dts/bindings: Add support for BeagleBadge
> 
> Hi,
> 
> BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
> hardware [2] single board computer based on the Texas Instruments AM62L3
> SoC designed for IoT and embedded applications. Add base support for
> the same.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
      commit: e2393ed6275732036d8f7c2b05de1319c5c691d6
[2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
      commit: 0c78b72362f4bd90f8a46ea7be385fe05137e06d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



