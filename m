Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F91C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSE72j0SNs2YdssgXe6AioRwUrcZ2Obo/8OapfT7NEg=; b=oBU2sAMMjlStMP3/ucOY06Mz1a
	FvRXzKYpTx63AkVZHdb5ZuMeFGe4gBkZ2LB5vuXIKD4DLOBe9mRIQELqmwDbJkDYcLgMJVI2Y1ICW
	J9B7wWyoCkFYznexf20/37GWO6PrY52W6DQgXJcewTaW1pMsE8Qv9JeIhwzYwSUOZ7vGkL14QLbCW
	ng07GGCidsRJXbnYtJztYd6rXSucI/uys7pZJAN/4stW1LDPX3DL1SbMtVyE1qjRQ/uR2F/iQwZPi
	/PQWc8RyxYEUt7GLcOE2aUwDgshvd+1aHfFW5Y1lSiQkqy2I6OxEPgGpd69rB+YkS60ObVeg2VBDR
	dHeKzNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwx-0000000CGlm-2v24;
	Thu, 20 Aug 2026 22:09:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAww-0000000CGkh-2Sv3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Aug 2026 22:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HSE72j0SNs2YdssgXe6AioRwUrcZ2Obo/8OapfT7NEg=; b=a0srpuiEOtzYQwR/5sl2KfKqJ5
	T4r1NLjqZRv+e5iwLEs6hSe94utRJ3mUiqloSW7eHPix6GdNnHB5XMlUW1FFS/qhoCUzMEFbwmwdF
	hvZ9drIR7ZmFJd6edXl7zNXvZ9gKGXxwprElH+b8MYcT58LeftwxydOXrP2zqDp7Ombc0U0yfrOtB
	1GP5KWY6aSACULKpU4ualPEuCW8gjbKbuiSb3SbIeygPEis1EQc7692pIvHOWk5DRQnhtLa2+7eQd
	SCBAcsUHF8bB3lvieXlDHlnWZsa2iWnH4kGLfdMzv1AeOy3vux2II5vjkAMeiPhmQbM0+UqM/nVWs
	lSBoFfXA==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxAwl-00000003Ngl-2IHQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:09:22 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KK6cB91414519;
	Thu, 20 Aug 2026 17:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HSE72j0SNs2YdssgXe6AioRwUrcZ2Obo/8OapfT7N
	Eg=; b=aOTTPMC2C0NseXfldGwukhUnvoe544jdL3BChEMMIKbEyMajfgh4MjHqm
	OcxNR1g27zJoATN3C2kY5dUgTLNZLp8VvFd3sFfe2JQzUC4dsR3yvPmy6sFvQylh
	1mC6s/IoL1fbBLPe369La8grwpVA0ARywIK1rnbkaOeqdnCpmBPDMGAFSnE1Hg7R
	0v4kxW3BnWnxyEvjnLz9pH3iVNfajgkQi9lp89GQeTyP13ZHWRL7TrZg5Z6EIIQv
	6a0Nx12DC7Y2ilWRQUFWnPdqXP2WsPlQZiQ6CWMaysfSZveRUSsljRmK/6sp9cKH
	DMvXdFtfosh57a9Es/RD8ifl0T32A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrxbrr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 17:09:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TazS7SHFmajYwIojlHahIz3MR3glT2cbwmJ58EytscVQv1Es5xpaTv5zjOAUX51NxJ1bZFwyHNNee4AN7lErEysW/P7uV7410qJm4Y0bVzCiq9TUNnI9voEBqOZ54nYQHpt2Ip77jPKK921XRgxYjwxDbukQ6k+mzgtvQgJQiUbWiaHHQA30WwtUJ4LvXxDw2jNgeyJChR0vpPoTMPwU3qdjokIPgKojhUBqEHrN10JE1uk1fR+RbBqwRy4o3JpNqsiEq/3b1L4tcwcPTSm4GQSrW3DeF+7fy0/tO92MwhAHGx7NHN0BIsVM1HWCWXuF2hvA2gsaoq1EU2dOKv+odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSE72j0SNs2YdssgXe6AioRwUrcZ2Obo/8OapfT7NEg=;
 b=P/bZl+S9T2bjyAvx0zNhhXn6qi4PboF8ak+Ev1quv+jdFHR+by3IHFa90qF7IzCydb+IE9QioMHg4gHL2Gxj4my3WYMptv5BKUxtx05VwOQcFEYYg+UHX/Xk/9MxNxbXzRHXlw+k0UHZJ59MA0McubfNsAiJhXGGvOK5HgeMqmVKDy2sn4XORrLHn6bu9s3wSwpo3E3Q78WX4ZxsHYmzM1WwRm6vbBjRz63gRf8gHN8HS/IK8nP+AAVeM5PXNA/5MsaNvXhN+o1+N5Pbmoz0b3BvwV96jQvWwkF3flUtdIPtTZ3cbos1QylMWEZiAYC0eL6YRR1dcc0q2iXu0mlGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSE72j0SNs2YdssgXe6AioRwUrcZ2Obo/8OapfT7NEg=;
 b=EYqPL/8LqpdXPptQw9YCGSlmSMYSm0Kd4fYyUsSIGog++LgQeaVzA1Zd68EtGsVvaerYP0+J+M5S1hwd3diKncstKWFtL3DOfc7rcZHnPpHxoopEfwzTm+yaltA2Mrrn5Fh8gN6x15u+/2kZ8cmtg9/TpZQQAaisA55luQZlgng=
Received: from BN9PR03CA0946.namprd03.prod.outlook.com (2603:10b6:408:108::21)
 by IA3PR10MB8371.namprd10.prod.outlook.com (2603:10b6:208:576::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 22:09:01 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::3e) by BN9PR03CA0946.outlook.office365.com
 (2603:10b6:408:108::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 22:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 22:09:00 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 17:08:52 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KM8pf2933246;
	Thu, 20 Aug 2026 17:08:52 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 17:08:52 -0500
Subject: [PATCH 2/4] arm64: dts: ti: k3-am62a7-sk: add out-band-wakeup
 property to m_can devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-smth-v1-2-e1738a38d58e@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787263731; l=1285;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=Y52Kds7f76tZ0CsNhUUhSSkiBwwpnlGftc3+CwQeJyw=;
 b=61bXlQpTFWMi2dZ0kaoaTr5etHFe8gfINdKq75G5GY+D1e6xShDPywzc7GQB/2d1XjzV3JFBO
 PorPomi2R6GCASQmTWLmhyN3hoPf/ZUQqOfrjhVOLzNdYQzvu+bqtVw
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|IA3PR10MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: e59206a4-ba3e-4884-5b6d-08deff07a360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: VEqbwJLv2Jm/dHuyqbeXdPWSEU14zPALqxNQ7jrX/9TUtiUpQ8uIdd3BGc7OH5nUjGmjNBgHGHxMZpXFUL0RCMyi9OzyQf7mAtDuQhj1BMOkyT+b1djmZKViXrTKy4BfTu/6gUDM51bjKhvUJuLrEv+3CjFVA2Alk15mSvRVDbEMaxBWS+GLtFNO9YIxYIxgMBxCMCmRBYLTKq2knh4w2IipUyMQie1C/WikUA1fInpK5oD6yGPk/e68aCBb/fknSUbGVVkaFq7j63POFxXuUN1steLyCNrAQ7GIqwYoYnrHl3jxoC8hif1BGA0uyeS4Hvfd1HEvfdNjX0+ioGaKw1Hxl7W12MWXxzF1+TtRLtCUOiMCSfVJm7Gw6ah7gpuRMzqjBdMPjkxt4B/5eE1CsxjLwFTlmLvasFOee868cAIJXKTE94lxaEnm+r3AEY+XSO2+36Z6B/+qjZiAgkTVlYxhyaQELuIMnmt+7GeD/z11uy6pqFvg3V6SXE1ruhQ5qDt/e5s2hfK9baStn167sa/+Szikj/bEWF/wO8u5XXMUwhN5rMUX/5xo8DFPKXZ0jITq9kjQX+ofSBnQldOXVlTODfosDEPPtjKTq9qMkwoKMKWJbcZoxc1aZzhBgGkRnxRTsGdyVdX50OJxq8zPETyDU/z5ES1ibLZlA5j3xIuG/sX831lNU/5ded4G9RkRdS+B1Sz5Hie/jzi8IT4UGw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q0Gu1XszawXnxUSyMZhTkXFDFQ+qHSHTV39yeZOZg/HBiDT/Y19MN6nJWoXDF+nCWcc6T9TavWi2FqLNiVw/zpSN6NSmoPKTtuVw2/oSJSmcI1jolnoo9vALSFd9zNJ+ISLbmdxXvco65W4Sbu77AvS8YM31SVOnHLoD6S/lu77jsa7Kss+ttLn9dUc4Vdr/ypXt/FYFUye4Q4DxubTxcMyofdGTP4GuIU7sjj/TULj7Vry0r14SwjYBCqU0D9mMKiBsrZFprnt74ZX/CMAVy9yUZAzwINEeWTce3KQgdFeG/VOheyR1YOyxg+6wpPPaccOfX9uTi0jqAoU7MaNnuUJ6EgfiEER9NfdL+/xJaey2chzjOraK7Hr+bd4oMOwGBZzCiVNfTSrkZSXmvQNg/v3m2bgiNkx9mxHDpP5xlUw67R+cTtiFtPwHb4RfGorv
X-Exchange-RoutingPolicyChecked: mt/PHR14w2ZXLUbnZDPcS/S7M+uttKmPscj9wAm3iB+hx+adNsIeoL1o5sqSAknP5NFEPFkZtwgtzMSU1eUO9v4FG7aDwSiO3nvCbIdWhaPPAuYmBDCWWs6VY+ZOoc5T3OQxzVuY69uWMkSqFOt4vRrifn2aM/dVHS67QDr5+L++tb8p5E0S3ceJJYAWI6RYmCMMZAtZVCRqKhm3YqY2quAjH7dxzju7WUI5E8j7Nco0HByxOqLU0Yg0fyqnZ0FMpVDo56HloBd8DRPcjoXvObZhrVWSbwo49jO434ZXgDWJ9C0TrsvVplgIPI1v11CkCWC9wM9XJlvc5jINHl8+0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:09:00.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59206a4-ba3e-4884-5b6d-08deff07a360
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8371
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfXzV3Vk2o63nF3
 TVsAdeCX8Gvi5WsV5tNmFSxYshhLPnD9UkxfJrYATPPRzBZpLXq+C1YL44CLZqjO9hs4FlmI5io
 X9XReAxdLoBsQ+XIPNKvi9k09qPW+ug=
X-Proofpoint-GUID: 0zr9JZ69dmws_acs_uS0OyUkChqMn6sR
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a877b05 cx=c_pps
 a=85i0V4ggiSMiQM2jsTwpvQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=bxB0l6Dc154J7LgZEWMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NCBTYWx0ZWRfX5wP7baJ2VePr
 e/YPAlDQokeqmDRbrlVjgh0Tt7l08DhCH2Yu+QCVPwtG1yq1BVcjCpqdBVTSWWcn5Pfo7U4nd/J
 xYPwjkd2AvyKOXx+IeJvhenEiW5O4A/emYdsIpz3KoOja9UTPHRT7U3wD1OwJm5VeBrqJwUbMbr
 3wXa6x067Zbzh8eMO5gR8qBCYigDvFtjiVM6OV/+QqOiIDhGj05O9xbrsDANjvP+xzAHo5nowwi
 jX1VMKJFq633syWlKj11tSlEyahkCqqTq5EJzpASUInNOQbe0p3orUToNph1vz4RJ5DhnhTUbXS
 7q/sIbwrAbqI2F7Z16v5izgcB0ycstQcSZmiVT08R8+HZ3XUuBgYZpgWuwWNPmgKXWjVb3QDASH
 cEyYzLSJbwZ0cnEs48kk37stKVc3vE1Pm/bKBqpsTDxzJzV426DiW42Ocabl8v0rhKS1bUEpp0A
 EQTDfMJwh8+IHmZ9pBg==
X-Proofpoint-ORIG-GUID: 0zr9JZ69dmws_acs_uS0OyUkChqMn6sR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_230919_917370_C18D67E3 
X-CRM114-Status: GOOD (  11.95  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d42091d4ad0e68d8769b49c115bcd..27ab51a6f261b32d5d1c3ef3175bd6c5347efd4c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -906,6 +906,7 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
 };
 
 &mcu_mcan0 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
@@ -917,6 +918,7 @@ &mcu_mcan0 {
 };
 
 &mcu_mcan1 {
+	out-band-wakeup;
 	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
 	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

-- 
2.34.1


