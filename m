Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM/m42YV0DYfcWZUaLfc/6VVkEiM0W5A4O/mwmE2L9A=; b=QV47a7IYY7rxrMaEI/yYUEkgj3
	vvO9l1Oy90leLETYjsAo2vodfh1A1rYpGSwFHBlb3nVub3MYnzNv19oriqTXTPFiqt7azz0Jd3kcN
	0VPwakWBYeiGKkoLsA++SL98DAxK2FISiDV8Njt6VI+RSYDEZOG+80JHHuRCmY5dmSDfw6d8M1i43
	osCJef2zmrJzy6wBvSgHSKZFrXNE14bwKOsTA+IDUnXmsmRUVx6wJW3lH7HdlHQL8uZMegWui4tKS
	1PKIaGqse1qtGCTbe59tldTQnAfqxqdvTwGOEoblhxB5C4emXi4DROWGAi7TqFEyuY+6VN2sF0w8A
	wcyVoIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Av-00000004n5V-0ZD5;
	Fri, 10 Jul 2026 11:13:45 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Aq-00000004n4k-3586
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:13:43 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAjuZh3678619;
	Fri, 10 Jul 2026 06:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kM/m42YV0DYfcWZUaLfc/6VVkEiM0W5A4O/mwmE2L
	9A=; b=qpsDBXHWAQww8/zMHTm7o5ewhgO8PSWL5kAVhEl0cDvgU+oInQJNZqdR7
	x0d5ERu663DaGAM4TecTLX7KQfjI0Jn4yVEn+US0zW7aPJWCJQdkjPDwjPoMbJ2m
	0YCWnuGokeJYnmVZnWES5AU76VXePtrKkaUw+PXyqpbGOFTD65h1t0P8iDTOLfkO
	3r/jQsaTiVQkAYWr/Qrv0I7mwYuy7oJMXecC5UYhHeU/9HWOiq8SfqrXONPXDfDh
	oKuaEM9vLO0XVKB1EM0X9VmM0n2hXmGWxVFFVya62y7NSzVmNX8ML/SBZJYmHM+v
	9/3UTK7/4+2cY0Ypg4L9U3hWhNTdw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4faskvhtx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 06:13:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AInp0CfG1ooJMVde9Xm1zhvZpXeMeAAc8urSKhh6lgEXc/WHG+05BAQK8PAEHcYlhn5j5P0B3WdCTkOsu9PrkJSrlssVSWnYQEA6OZ5HZfgrp9Hrn8N/i29aFHURbiX1MhEgMgGFeCpoxKOBBvtrPpL6BfT3WroZ9f4EwVRz9oMps6Q4Tma2oWTP65x9CDR072V61rTv2N8QKL+v76TPscUDlWlBd/o+CSwUsJxISvYKnpvI4lYtz57A2nPYD+pWotrpxu2OJ/KDtcnzaqRXtUQUgsOesqrlehdRuUEOFbp9GSnaDH8T0u11HpYuJNavMXLD2B2wzS5jWfPsrW87rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM/m42YV0DYfcWZUaLfc/6VVkEiM0W5A4O/mwmE2L9A=;
 b=tA+YvK3NvsTB3pggr/hPOM7yENSZY1xw0oOMLMfK7rfkEIcHIN7mTjBAzDaPxF0mGrJ/Ql1fNWqWORmjeWqvpdFvpZyTslUM3vJSQwonbNeArIppmbAtg+Ohx885FDBqH0jXWobNoxjs4UvgvEk22pnAIoLWBITegd84vUXZef0fuEJQjEpk8NpeSWK2YaSefrf4Mb7FYb+9MAbRrC0gXuJLbPyyr9ocBkc3Mt0eZ4cbBsq6QP5CcAX51xjIrUvvKDnaVNHDXAZ9QhpuMosv/c015R02EYq4OlalgPo76uM0zRcBnrtmj58ViCQxopC/76hQij6o5Avk4imfIfhmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM/m42YV0DYfcWZUaLfc/6VVkEiM0W5A4O/mwmE2L9A=;
 b=h8WWADm+nXVy8gUBACB+mZbJX0jZEmvmhEyHrINVo/NK6iotEzP4PEhKW+DxOO63lyoZcVEacom5eok+eO7zMGn+z+L0xJlaRMt00SloQWNCELKcoL1xjVZUkrWG4lLyR9nHdl/TTBo8Bc3kLH8Xy+7854GrqfjEdMOVKX195iw=
Received: from SJ0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:33a::8)
 by BL3PR10MB6017.namprd10.prod.outlook.com (2603:10b6:208:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 11:13:31 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::4) by SJ0PR03CA0003.outlook.office365.com
 (2603:10b6:a03:33a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 10
 Jul 2026 11:13:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:13:30 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 06:13:30 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 06:13:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 06:13:30 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ABDNtq3551611;
	Fri, 10 Jul 2026 06:13:24 -0500
Message-ID: <a427d796-63c2-4bc9-a3ce-d4b1b527f3c1@ti.com>
Date: Fri, 10 Jul 2026 16:43:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260528133529.3476499-1-s-jain1@ti.com>
 <cb4c1b80-40c0-4e63-bfa8-65a68c577999@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <cb4c1b80-40c0-4e63-bfa8-65a68c577999@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|BL3PR10MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df0a03a-c23c-4a9e-563e-08dede744643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|13003099007|22082099003|18002099003|3023799007|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: VPd2RNJoMW4MkAFLbp98wn1rtD0qMHhf1p/IgWyxwYyHEg+JZWPcvAkpDu6uBtIVdncZQCUxwIaLfH++W6dc3/6M5IP3NLFBa5wVOAIBz0C1mSbmTiz2znvsdFNoaPhB1zNqSnzbB9jXfyl4NOW1lwuKOhAg8GCzXnJCar/awZlv2kMqSeQwCn8cKmYt8mr4jNp9swSZiv7kR9LyQVahcize8MjQSQtEknO/aBcUpvJLT/tpb7zrW1W8wYpWGOC1OQaSil8rWR7aiy/ekCHcl53O51EX3iobSAKnK5YGHnyDHWk+Ir8incjWYrLiSDiQDHzILyl++fANI0NwxJ/Qb3sXW78jc2/LZknZGCMUN3qnBWsnklOhC8bp+Z5yYmgmS/IiN5l8Kkz8rAMeuI74V8fTJMmhsk3iZV9HZzErElv+PZKa22v9l8GMKnBC5BU7WxPkdPZbH82FdFxrd8IWCANpHAeTU9YnPzO5FJftBaBU4MtIZPo/HmEvdQFUCZ6YkFxCkfxodhPZ2D8f3TLajcip5mN/CqPaS/SmO01ecaBO3oNEVm38PaQoubk86eKnGxn2mkQ7NyT9mf9LK4zbuxH9QkOYT0WbQqSzTV/xkEuJnrZY+r4zFDpNDXH+AGCBB1qTl7kXJtMjHeh5TIlXdl3MadHWJmY1dyeCmnZwDGU7yiMhCWVTh0MHSE4xxkSnYtju8e7ucjb0NNZVvJfwqw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(13003099007)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OYaQLIT7QE0NiFcTVimKAZsStBqjZ3f0inlhQwSTqG14Q1Vwsdyacg1H69fvqJzpqwTk5LzJmeIu1bqroMhGkHbhMA2zGZTG0VSF9TgS3gyCGpRiICZZv7Af9Qbb4VhPN2ZspvbFykU/l2+D1llpUveaCmCB2/m8Ke8YhjVhL+6iVQdUzOLHgdnibGJDSpGVpZdL0RSt7QTQyX9bCaOTX6Urfkm8htRcilq/dbsRIBmIrme0lBA95DYLBqJbjgmyXGNegq7WHQjk0vQMVBaLg+2Xu9yeU2CoaUbtKC4UYhRMRAF1DJDczVAlMl8u3W6s8dLtAq3ZCE4uYpRHQbaIaQSOjExKYxIO6evz3ukA8dZyTi09MT0LVhGUSnvHAdheJp3AKEQzHaoiU/BumGIOCy1np7KpxtwjW/Lq4RxN4YBG+NICTjePKPvd0eCwjXgx
X-Exchange-RoutingPolicyChecked: AUXztGU2wMwR/+UlRNE0PlxunISqX6hwj7lzuDKCAadlMdUQYlO9rj/obuslglEdI89K0grB7V9UMi8eF6R65HkNixVu0GJ+1co7OpQE+u0Nn3gZU8tk1vibcR/Pg9mVAhiPJSPkAxXoiBp7mhlUGB5+8Kjv29GNxiB/qOszrYkh1SEDT6ykIqPtonj6xcC730hvaKhzTYWtGHgAx40f95ZtOD6NI+654tUbEHZbvTrpq5XTxSLSvf4Mlmadc9zqWbr22KCrSnFFl9vWQ9udZaJT2yJWXOKEtlHbNMj28gE8lpWaBaI0MXaelAidS2KDeEMSlBGVxchk3jqUyk134Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:13:30.8262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df0a03a-c23c-4a9e-563e-08dede744643
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6017
X-Proofpoint-ORIG-GUID: dA86P8WXtgbLpwiXrFE7-DCQ99y-F91z
X-Authority-Analysis: v=2.4 cv=AeOB2XXG c=1 sm=1 tr=0 ts=6a50d3de cx=c_pps
 a=HD8lxhnvDrzpkXyYnuuseQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=11sOcgTRacJIbtiZYdwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExMSBTYWx0ZWRfX/2Y8XrAlJjzu
 K3s6JkogbZWRMYCZEmMiAQume/uL8NKVvxcChII09Uq5+iyKxYAl+ysIYymqDDKEbTqDtjYBnIc
 5+jwAxDNg5EmsrxVJITB0gnW4CxKecc=
X-Proofpoint-GUID: dA86P8WXtgbLpwiXrFE7-DCQ99y-F91z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExMSBTYWx0ZWRfXy0QQVtMi7tEJ
 sT98bqMmKur3MK+MzAMizqz933yecuozIr2Po8tYAcDT6wcQClY/poPnWiJ6qaKWUH9zvY4ZagU
 QHJGqjHDZGSN/pncxLnJgXXCAXEAtDypoVi+DFsky07nPSwf2dXFlygRKiS1ql0Aca1Tcv4PZxl
 sj348vvFxeOmEw6pJpZfk0T4cR/SbA2Zor8pz4A+P6lYgBJb8TAZljZbldNMHHTn/k/aocuQ0Rd
 xsZ57Bs2KdWaPOkHNRuk2k+TpxX1Nn8NmO3h6BWEjSfWuXXVIc02mJlq+h3pFk1++JV8XbN9T5A
 ubUWF+0ZZ/gwhQc6DLDv1elUy8YE2+gAAIXmaNx6wmdEniy2sPthmJLrbAuPLDD15Wcula3fRYH
 vcxbqEv7faHLL57ixLaILe6u40zylfnywHt8jeim/GfvdovFcwwJryGTn+GxJqgDCUjyVdXYC3Y
 rks5J2Vd1NFzjFy83WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041341_064273_6E80B9EA 
X-CRM114-Status: GOOD (  18.14  )
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

Hi Udit,

On 5/29/26 14:28, Kumar, Udit wrote:
> 
> 
> On 5/28/2026 7:05 PM, Swamil Jain wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> Add DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output
>> on AM62L[1]. The DSS uses parallel DPI interface with pinctrl
>> configuration to drive an external SiI9022 HDMI bridge.
>>
>> DSI and DPHY nodes are added but remain disabled, as the AM62L shares a
>> single video port for DPI and DSI output.
>>
>> DSI functionality can be enabled via overlays when required.
>>
>> [1]: https://www.ti.com/product/AM62L
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>> Changelog:
>> v1->v2:
>> - Update the commit message to elaborate more about the patch.
>> - Add dpi-pinctrl configuration.
>> - Update the interrupt routing index for HDMI interrupt line
>>
>> Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 +++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
>>   2 files changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> index 80615ca1e01a..1d255c9138db 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
>>   			bootph-all;
>>   		};
>>   	};
>> +
>> +	dss: dss@30200000 {
>> +		compatible = "ti,am62l-dss";
>> +		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
>> +		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
>> +		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>> +		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
>> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>> +		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
>> +		power-domains = <&scmi_pds 39>;
>> +		clocks = <&scmi_clk 162>,
>> +			 <&scmi_clk 161>;
>> +		clock-names = "fck", "vp1";
>> +		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>> +		status = "disabled";
>> +
>> +		dss_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +	};
>> +
>> +	dphy_tx0: phy@301c0000 {
>> +		compatible = "ti,j721e-dphy";
>> +		reg = <0x0 0x301c0000 0x0 0x1000>;
>> +		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
>> +		clock-names = "psm", "pll_ref";
>> +		#phy-cells = <0>;
>> +		power-domains = <&scmi_pds 86>;
>> +		assigned-clocks = <&scmi_clk 343>;
>> +		assigned-clock-parents = <&scmi_clk 341>;
>> +		assigned-clock-rates = <25000000>;
>> +		status = "disabled";
>> +	};
>> +
>> +	dsi0: dsi@30500000 {
>> +		compatible = "ti,j721e-dsi";
>> +		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
>> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
>> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
>> +		power-domains = <&scmi_pds 38>;
>> +		interrupt-parent = <&gic500>;
>> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +		phys = <&dphy_tx0>;
>> +		phy-names = "dphy";
>> +		status = "disabled";
> 
> 
> I think you should add port information for dsi as well
> see DSI node in other SOC (J721E, J721S2, J784s4) for reference.
>

Sure, will add ports info. in the next rev.

Regards,
Swamil.


> 
>> +	};
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index a1af4571a815..9b04fa6d2cba 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
>>   		regulator-always-on;
>>   		regulator-boot-on;
>>   	};
>> +
> [..]


