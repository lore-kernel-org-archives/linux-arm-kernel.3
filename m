Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6650EC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mzTvgz3BDElOsm+jy+Aq5eM7JTmvfKqZMExjbW7h1g=; b=RITqsC4Kkqua+gUw9JtIV7x7yY
	Tr26AQFcJsx/0nB67NwJ+eAaB459koFptocbxZ+MdqSQVjGHiltFQWGTd04MxHu/TyAdYnTTkQIXP
	M6O9YVa142nCuFpJkq2VT/C97gKyofq+CdHyKtpSvyS526+2WX3dcxwateWuFjhOBWgwCMZQ/jchO
	VQW0HG0xB86+Xt0mcUjboyaflixw+QaNFDDTlAO9mHTZ7fEZjySBhNmKh0cjTHFEriDNGVeUOWpD+
	QxvfBEV53r7cJxnvTa14pgipwUCbdPP4mh8IRxTQpGIoOTMO0g+GxmxCfUB2Cp3rGp72uaCeysEg2
	lIQZrx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7oE-000000013Aq-1Q1n;
	Tue, 04 Aug 2026 05:35:26 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7oB-000000013AT-2YXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:35:25 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67418vLp1209079;
	Tue, 4 Aug 2026 00:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9mzTvgz3BDElOsm+jy+Aq5eM7JTmvfKqZMExjbW7h
	1g=; b=bSbsLAzTI2Oux38SD34vRoNB80HlmquVzaqD1oo6mFpNPjWpCA2Dm14oP
	M7Fjt/2Yiiq9O3AtuMb+SVV7Z2YvydmzaYcP+iH0qFNbuN7vLdLwhH8lPPt9ewmH
	FH6lPGHmthNnftGIoFyg6E0EBDUNCyuDQkgIYkNLWKstghf+Vym6JRiQ4Ynqgujo
	SsVlixuvmcA+MFjDNUbF2KS2IurUWFZXRtgSbAmJDhSt/zS2KdPeBYqVdX60Okee
	EjGn3oGLav3FO9mDD+9RZ4kImAJLF33NopFFxr7kBaBgR/QqNdfYTgmz3KfxpMXh
	sfm1HVyRDstBO5XsriRJm8Q6cV7fg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpqtv9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:35:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf4tO8zZ4wtdOk0wFZ1+rfMoBegDB5ci5kckX9vPGOJSAgdLOaECjQ/+vbyKLDohI8T1A7uz9R5UwVITLRZ9Svm2lowSWkg8ZTNm9qHcppH8ndb/2jhLnAbTxcpXS/rUifydbO6WOEwDTXrtrYRr20tWUlI00qb0sn3+vYLvP68YTKy7Ea7kSjqmYVPkkm+DGotISWIcYPwlTXuzI4xwj0GvsDWHVj/emXWsQR2ysjsMqdeAVczogIMNVm/+78AT26gdOiS+WwWuOZgXRqNgTsz/GfMvUnHIiUhHJluFdlRxCr51RrpkfvFmHFQCmIh9LG/Kyr3CyOzqmeq5Ah419A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mzTvgz3BDElOsm+jy+Aq5eM7JTmvfKqZMExjbW7h1g=;
 b=eCgHlN0UlnABawpPboJXPrgL074fo/rVLe+PGK8Jb0UcWff8NGeVYTo2QYWNFdEcOpiaanZ8aivaE7q/Ve8Wl5fSvNCQv5FtT7XB+tjGT22XFW98u1pfl8zLVqOjxXf40sUOwBB/X80sJM1jgkNzoZxloECahh8kKVvurwJ7KJWboMzaksJtEU6+RIEsBuncpvV+P8fbjYPOy7tb26SnzCJNxd3esH9JHsp74LB9WhRpUVEEZLGIwZAFSqiOMtdmRjVUAjspFA14YYSyTssgLnTnQoqS1nt4h7rrQZnwoITM4Ox7AiDVpWnsPC6uacajWzVwEOJLSEbWvZOcoVxKKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mzTvgz3BDElOsm+jy+Aq5eM7JTmvfKqZMExjbW7h1g=;
 b=NlZNzH+vCf+EIUTBtpdL8NaxndNXimzJAUbafXxRU5U55FQxGdHjpitm84OOLM6S3+rvu38d/oA35BkmV44BHYI+JyeAqMG7smmIf9vja6eQXGHM00I3JV7jfm7KwEu0NAA1V7w28G9AxcST64cX90M+BK7+nCU9cTc2ZzxLSQw=
Received: from CH2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:610:50::19)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 05:35:19 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::89) by CH2PR16CA0009.outlook.office365.com
 (2603:10b6:610:50::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Tue, 4
 Aug 2026 05:35:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 05:35:18 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:35:18 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:35:18 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6745ZDAF3099747;
	Tue, 4 Aug 2026 00:35:14 -0500
Message-ID: <3beaaf15-f7c7-48d8-a3d1-37c2c5c958ea@ti.com>
Date: Tue, 4 Aug 2026 11:05:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property
 for ethernet boot
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>, <afd@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260716064449.2505650-1-c-vankar@ti.com>
 <178582009758.4187098.13677911190468773934.b4-review@b4>
 <0982bc98-233a-4ef3-86c0-63919b925a14@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <0982bc98-233a-4ef3-86c0-63919b925a14@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1a1054-1164-4755-9663-08def1ea2ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|13003099007|4143699003|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ANuD9u+lAcM7AeLBUgHC+5jNAhHVWrYSmskoIB8c0rb7FeZLy4/VJuMOsJTxPVCzhmlsdY5TzwqNKVIzDJiG20OU9grZM2wDRK/1ccloX5ffxkWjGppmm4eUYrFQfL/goaPJ1M4wjiqilobggpd7GPiLzFxf6UX4xvZWVfLau7i6UCmJ18IhxO6d9HOfSAty/J40vJ3LSm1HLHREWUaMKjjEtRQMSfDE9crZ3xqhDeqo+EVpglbmj6As7V8JzBSEiD+lKBuKkcK4LBYEGm5FkAf1zb76TQA7Q/oXd1ZDXFQ0ntnl8Xo3h+Bx11hi58MX0fgP2U6xmOFTy6lQXgbzkjizAJW4TrQ5TUP7GbUeUHGs7EYDfXhqev7hvssDxjHzeQCb7GR1MHUY15vbeX/0fNpzbPyKRAfsJz3j1WOh7bG764WTm6JKfD90ev6OgOTd1r6qp6so3/N/71NhZI22ewD8ZHdK40w8+F7FVL+lB55qrVNqBpr5mWJu0UiUE6VjvCpJ7GRa6Pl4NiDr4+diaUDmXZgdr/YigDqviuYB3F3lkSPaqgkYTqYLqHD8J00QmHr25zgIEpnzOU1k8clW60sYltKCkVsUDN4HahOv7WgwR3uFtItKebZc0bKaBWRYspPhezWb5JGUQZBtO4Iycx2Kcz5Ohxijg/0dIIZyLL37t13Serb7o0P4unG9BzT93ySLPe+mIJAscscG7D04rw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(13003099007)(4143699003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HShGkOr9oHh3p8OZoSHoOj/QlDPvWaSOEMf6qpF4bfDYb3Vxx4bI6a8Tvav17mTm0bs3BpMyPIYUbog8T2e2m2R3+D6ukWl3XYtcbWzATmi5HqXw2sr/LdeKxCxxFn5scrT0sXy5YMOJK3hJmDwZN7KhPon8+WlQFvkX5fUAdmazqaqNLnmpenrbxY4yKn7+k8A5+5tApWiUsZsENzYtjO6UuAG+ESXh+xNuaOx4OX6CFL/Kbc/hl3NNqHPQ5wh//Xw6+7GTLoToLw+NRSBGOSjbfoG20uyQMCtQwFQjWWJpFTfJmiVn+S/EceWkDczhYJjS1NJwb5nO4vHgbh4zi62w2ppjFkzP0ho7UgEQOZzMyfDe0KyGEoR/LLnOcZ25uBBU4g1r6BDwnjlbV37JOn7WGHQHxvHy+d+p5x23cJ8/yWqNxa6XGB6sJaJw4JO6
X-Exchange-RoutingPolicyChecked: IKSoD17Fq4xbR5CEo0mD6Gr+gr4bO3t3/ro7NZlqnp2E7DtZNoy6cxmdtunOt4ww38KmJcsAqud2cPnBW+DQ+M7DfUH4oizeGO3T9kv4fmhimR3vkKARRodjtszPSQiCyOcwiP1kdndDyh6eo+3V9qgR3VzKWxtqfnzj1a0iBOSMdyrkmdN08v/OUYyxGliZ0JsgjBEN8LAuBOGBQceVmA8rq385clS8VRift1rQPddFj9SIcmzBO2FRYPr2Lv4XFyLvA2HSP32sLa5D7M3ShO4EYQmKxBXE9WLnlxHRd09SPjCVfxL1daDfTk3XBoZyAxSpSzczHalioSwxEZD+yA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:35:18.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1a1054-1164-4755-9663-08def1ea2ba1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0MiBTYWx0ZWRfX9F1sWQv32KEx
 oSHLZSntpX16HMjbMFmFO2if/QltE0P4Bcf2M+SpIAdFLCf04jQld2L5WnIeOcv7n/Knm2Tkj9G
 V+KeAfEXM9FjuVwJwxjFPEuh8C2HhnSyrFz+86LqwRZvG6+YeOiGekzax8sOUqYZQ4Qir9SGiSt
 Hn5LGAaM6MYIb576Q4s/khM98vqe7/FKg3FKlAMs84xq8hR0rf+ZerIktxP12HxfQe2YCyUSejg
 Ij6blmXkdLEu/NDdUMU7y671/gUzlTz4wWMuuXqqF/AAIc0Ycqxy16I1jFspwgv+xvC+UcGQSZQ
 +F/FEt+ypCTIzfsKIXYiZi/NVE6M5DZKlz8y7qV2CnmSqMvmwo5TcOternCplznGwIhZPPT/7Ml
 8VU6lIr8u+3nCuTKaa/tTd7H3EPyyCcI8bjH64TSW6/9OdLH1hQ5Lwa7s+mFcPe6pnpWXvAKjNB
 JdvRFrsUM3XfIB10dNw==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a717a19 cx=c_pps
 a=urLXRHf+rrcNZWEu7FangQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=eSl6dsUoK4fIvMu_kd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 2h0YHrc19uOxb-upHufG5E8GR9l4TcBl
X-Proofpoint-GUID: 2h0YHrc19uOxb-upHufG5E8GR9l4TcBl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0MiBTYWx0ZWRfX5XlO2vJSZaco
 +TiIZC0gse5xYIsjaKTBtuWPYtEvNbJBKuY6hmN9sQyWTrdo1YPPbJSFtO75FpTKS3mWCR7RbUq
 5LR9xEDJNPGjcndJr2G7lrZiBgDgvWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_223523_675707_DBBDEADC 
X-CRM114-Status: GOOD (  12.51  )
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



On 04/08/26 10:49, Chintan Vankar wrote:
> Hello Vignesh,
> 
> On 04/08/26 10:38, Vignesh Raghavendra wrote:
>>> Ethernet boot requires CPSW and PKTDMA nodes to be present starting
>>> from R5 SPL stage. Add "bootph-all" property in CPSW MAC's eFuse node
>>> "cpsw_mac_syscon" and "main_pktdma" to enable these nodes during SPL
>>> stage along with later boot stages so that CPSW port will get static
>>> MAC address and DMA transfers are functional during ethernet boot.
>>>
>>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/
>>> boot/dts/ti/k3-am62a7-sk.dts
>>> index 821a9705bb7d..59cf49a14f61 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8)
>>> WKUP_UART0_RTSn */
>>>       };
>>>   };
>>>   +&cpsw_mac_syscon {
>>> +    bootph-all;
>>> +};
>>> +
>>>   /* WKUP UART0 is used for DM firmware logs */
>>>   &wkup_uart0 {
>>>       pinctrl-names = "default";
>>> @@ -241,6 +245,10 @@ &wkup_uart0 {
>>>       status = "reserved";
>>>   };
>>>   +&main_pktdma {
>>> +    bootph-all;
>>> +};
>>> +
>>
>> I ended up applying v1 as bootph-all for main_pktdma is already present
>> in the k3-am64-main.dtsi making the above redundant.
>>
> 
> You mean k3-am62a-main.dtsi?
> https://elixir.bootlin.com/linux/v7.2-rc5/source/arch/arm64/boot/dts/ti/
> k3-am62a-main.dtsi#L153
> 

Yes, sorry for the typo. I meant to say k3-am62a-main.dtsi

> Regards,
> Chintan.

-- 
Regards
Vignesh
https://ti.com/opensource


