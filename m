Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5248DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS8fKRlxENGZp6Jw9imKiVuwNcVOcgSahMEwhS0LGzQ=; b=Nw/1Z8IVvKxlRGHc4B9wtXc0sg
	Hk3FcC32V12xmYHY/ApPN5VVIYAldHCAiyIAyo93zvv3E85wkX4z+Ip8IAG/CxAZSjNP32kmtJaZw
	YBGvnZqY2k0lgFQsAmcinNKEegV/5NZHX6VwVYUy3XTneHFsf6x4hEWzPsSxYmZjujmTkga0hYFsk
	zgBH8mYKLcxOINFfmR8TrrNDH/UP3FjF9qr3Hpn3BXk3Q8bxYNggAr5l7u/rz128PM3P8GgHM2iK5
	I8Rm3okBkaWtwi1Wszi1ZaKR3EnPEwkGLsTM+IYKfXCEtcPC/8HiLE+FpIex3RvwhuuuAJBDXtC43
	uQUPg3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDnv-000000042VQ-3DhK;
	Thu, 02 Jul 2026 09:33:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDnu-000000042Uj-0Zuo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Jul 2026 09:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iS8fKRlxENGZp6Jw9imKiVuwNcVOcgSahMEwhS0LGzQ=; b=dcUlCoriL6/7mOR3wFAY7FM1He
	bw3QiNqan12n8xc+kFjKn+GrdpsaJiWMk/lzCWJaWaEhW2bMp3wbkbbxv93E/QJ+AYjolJcftr7I/
	vAx5Uymp/r/+G3r2kDO91SmSpinsCuw0X6R5alSSZIcSP4vGH3Lryy0xo+WHw9aYdYCuPJ0a5yPdA
	OQDtM5gdftLVf4bLG9pLiEddyQEqQ4Twy1rHGIBz9NceuGQswKDOBXzdgNZ8NcscIs1cKfz0G/XdY
	9c0eyd93z/ts8immZkp8lzn0hpnl/Cr1vR2dRhTfpIq98QKqbHM3v1YV+ZH5zNZ4k3v/yyIfBpyWT
	bSLH260w==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfDnp-00000003cPj-2bRl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:33:53 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6626WKh5659064;
	Thu, 2 Jul 2026 04:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iS8fKRlxENGZp6Jw9imKiVuwNcVOcgSahMEwhS0LG
	zQ=; b=O/NL0Y4OplQX0Nw0eVyy+N1D/TAW0iFDbd9ocq7W6F5S1ZGazNh1wkfOt
	rdo95e3nNzwAGOuvK1RuwG115U08assLsuhegxuSw1E1QmupdLTK4HXFPdiLHRPS
	7CA6IpN8qiPWstSDcWrW5h9ooNHSR4SRciIwJmsWXewuBOl1RZAE095AYO7vkAFE
	AwP6j4lz0KGR8OPfK8StmAAip9SjLneevx7DVLDD/ivaGVkbFCPrc2lPv+PtV4Fz
	ccQQFiMYbeANX7IGM1j+Phqwp8dR+kHBpKb/aAM4r7G7kKGsNmWULxm/4+fpufCL
	2t8Kc+LHIKlPMtf42p/DusWK96BTQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240y89n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy2kW+7SqULqiMT/3Ix9aiag+23WahXKnq2TxeJap1nlR+AAFrI1DWoJCVnSLCy/Hjb/bm8jEwMT+MRi7m20qphfdOOkueHNU0xxuJYftdvl37zCL9GPasFgfZHdbm+U3d1TvYDr8GCdn4Cu1g3JQcqrwXUdmAOCAv2ZriTTXIDVdU3dNKdi1xao+jHpSjGjYyuLQTEVRABcK5VI+8rUHG2fjdi6zZ3eBP6FOLPAW1fcx+Mu0JxyF/d+VFLgHTc7lHjSQ0kx+ep8HJqb3uylyokUO5Zeg179DpdbkhugQfMKlN3w8at+Xdzn4/zL55kd//SiVvG5oqIc7RIIqjtLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS8fKRlxENGZp6Jw9imKiVuwNcVOcgSahMEwhS0LGzQ=;
 b=rfKZyK3P1QPj5dw3OQ3QdE+m01wJ+Z4gT583pqaeVV+W0OsKmVKm6z8gO5TrCGlxxlYtDLdfooWrY/DcpeyBYZ2G+ekeRuijY+UPeDgVf/72auPyJxEVULb1O3b6edsmqWFWv8kqEX9ZSmQ1yr3/cE9Q8EMbVwXa6itBqsFI1ziXNpUbBkqAEbXIpR2ui5hNQ0T35NFQcLNvi17jikUqs68i6D+orv71fPixjxfcnwOIEzqSUUxxYvcUUpHha3PnGlZIGJzjMv689cF35O7Pa+CPJ66OQmENHIEeZyuXagY1bYIrdH5D5hD9hUoO7avepiUjbL5wRYV2n8KpPNZi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS8fKRlxENGZp6Jw9imKiVuwNcVOcgSahMEwhS0LGzQ=;
 b=vFjaBUeH9TlIt+tFcMABv4MvTl+q7F2ubE5NXlqNcH5jIPaLecI02f0IGiEPmBRAlTm527I3KJdkcoTzqHV2PGIHvW2P3K1+D5R2YoOXc4YEMOT9edghNv+RzoqZ7UmhLt8prKHWqqnww71C46afPIl59snEQZQdsStOOYmZyBE=
Received: from PH8PR20CA0023.namprd20.prod.outlook.com (2603:10b6:510:23c::29)
 by CH3PR10MB7457.namprd10.prod.outlook.com (2603:10b6:610:159::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:33:29 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::81) by PH8PR20CA0023.outlook.office365.com
 (2603:10b6:510:23c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:28 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:28 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:28 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb63611021;
	Thu, 2 Jul 2026 04:33:21 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 13/18] arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Thu, 2 Jul 2026 15:01:18 +0530
Message-ID: <20260702093123.1048575-14-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|CH3PR10MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 968db1e1-5758-4fc2-3457-08ded81cf976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|13003099007|56012099006|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: YvYPL5RTKPe3M+Ve5TV0Q5glbmgXWBjFS4IPBEOi410boINPX2fPXzpG/UsfP93lHXu/PZDE1Q3KEu/dk3qVCuvWzVQGXCm28xjA4ZygAQZwG4wOg+06Y32PHHVKBAvzV8PgsW8xqIL/Vc0o8UGd886HCuX4qcjzVYwqeXkCUHui7/rOeNFYqxcIrtL4nFUFPH0jGu7DkNQsueao8f5vrHzRSxQh66Rf5EpZTKq5XPveJMqhrgep5LD0wy3RmOaqBXuEqGoJjwJIuDcij4sKbXrGeGh71QeRvV2o2Sz3hf8jjS31kFBKFwEfAGhAO72Xdhk0IqqMzcSMBt+4tN/d1u0HvgN4Xgc1cXWxkkRnSidPFnucxpXKiJ9hzg/zdO+ptX0uj8W235zvzYi0TfzHSpWuCw+ZohIrydUhzufsTUn+hiOxJK1REg/UkJ7HJqUCF0yGn4JvgpFHcIIhrvfDPOm0r6qoMkA0pq6PxyT9kY/bp0sUsp2es65UuZKjf3N/O/AIktzlp+MTORoVzxeWNoSs5LaJ9t9mLhUZ4oYL++qimGAYlljhjBTbZIoQwjCcVE8j7gwZoL/bG6oM/a/543OVGUK86KtciQImFTJRGFHAm9Zn0C6dz+vpw1yW+aGBweiMZEIN2pz26tcq+u3V9A==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(13003099007)(56012099006)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4oMXcpwNieTC5GBRxf4Ry4tTs1xKFeday90S3VlrV2R+i1F8/6ltI7NLVCtwhbt3UrCtjhsvtiMY0L5m+OP5wfPRysNm0tcSvEkJcBsm8kRRTBLJck+2DAFJb+Ps/Mf9w29zHspInZQr1w6t0IrX2D2rI15qHdjBN9ko74M5sybwArOdoUVbcWwvbrghDDfBZdUVtie5U3qEyKNyDzbA26rdkWpeXZtI9vivzrYrsLYx6uqfmmrUnYS/L+LWvefWLIAdeaPy8uN81zZSjOCqen/TYkB6noS3Pahmd9dfYwg2b5p+JEYnpQD1Z0bnL1Fh0z/qWOm0CYNvWodO3NI8/+04PJCqkAwfZE8EXC4f9CqquZCHDvsuBGWN1/XQE0t2Vs5qjGb0ZWXRMaz/plxGXqfRxn43Unyrtp5kmS4kohrw50CUFTMvwp3EjoPzDYWx
X-Exchange-RoutingPolicyChecked: qYs31io++1Qsh1i0nW39bycUxoGWwSeEuIxRl6/hWurgI2mQhYliM+wyD4IJzoKdwOeNJHcEN3zWNfS92PQRgRFTWMKcDRRPLwmH3/Pr6O/0hdHg4aAZQuljazJPDzNmoBOc4LmbPq/zk0fZ9JkYgZSB+ms7we1NcK9xxe6mIDrDnxy2cH1Xl9TyljIGzvsqtJjO/EaytqeCV2t+j85Cph7TjOv0FCWtRGv04IcLxdM0pzlbVnF87oGl7ij0LXvutLe74yvAMU7jHmy4aknsGMI/I8jyWdcZ2I5MmyDlb3uAIrmlFFi4aJg4uBwMWXRazGjgf0Oh9VgtuIAi80tOLg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:28.8319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 968db1e1-5758-4fc2-3457-08ded81cf976
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7457
X-Proofpoint-GUID: LcU4XJEzskUQzVtW6SLH95GSwijOrGNN
X-Proofpoint-ORIG-GUID: LcU4XJEzskUQzVtW6SLH95GSwijOrGNN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX9VdI2dKFZwDL
 /K+BgfiUoU9SwXAb8NqxE6Nmw7H7e5ctqXAMv/3jVYc0sfaMII6v+TRKbU6p9w55aQ+GeQgfBZw
 Ccgm8cCpVefHl9G/ixjJLC7S7Povi+0=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a463071 cx=c_pps
 a=SpR4UuZ//oCsNj7RudjQzw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=I3gn05AaVm_Ch417H9oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX3XY2mmLcKTFq
 ahjmS4Kab7xsGlLanOSt129WXc7BVO+0wFaOTIebFKtV7+JYeE20lSikqXZlcT+nmsYPAj6XM7h
 SzF9EfGdQYW7o9L4uDLtD47KZTZsOBhPyJeG3VWc958a4o4qipjh+ibCAz/HdJAGE36tic3bVcU
 oUTJHDKMKkuPxAJfeV7oWI6yk2DFgK+ndECRv+ZbF5UgV9dim7CXY1ro7hWNJLHDY1bpBygW3Na
 jrZ0R8wd7/a2vCTADwod0Y3qsvwS6BLI8NQAMZzktR+AaB9fEXpknS3KypINX+cJJnOPTkdLkHT
 opVIsGqxjrwGp1d1pqIfMCA6gQatOpR+UVLXtS3Z9LZIpX/Xr7o9lpQsADjT3/n/orhDciW+jcx
 5ea4XQnXkLumUok0D2CPmCJxbO9Fkatf6jbInIkTITbqTtkdgdDkUAxdAltGSPEfd4M4tOrAYa1
 Y6PC67GqdolFTiaYAbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103350_220772_C4C36C15 
X-CRM114-Status: GOOD (  16.12  )
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

From: Vaishnav Achath <vaishnav.a@ti.com>

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J784S4-EVM.

EVM schematics and design files : https://www.ti.com/tool/J7EXPA01EVM

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 281 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 0741f9c16034..7da84197402e 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
@@ -318,6 +319,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
+k3-j784s4-evm-fpdlink-iv-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -391,6 +394,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..9f4479a03856
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for FPDLink IV UB9702 Deserializer on J784S4 EVM
+ * https://www.ti.com/tool/J7EXPA01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&exp5 {
+	p0-hog{
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_EXP_RSTZ";
+	};
+};
+
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@30 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x30>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@32 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x32>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x6a 0x6b 0x6c 0x6d 0x6e 0x6f>;
+
+		deserializer_2_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_2_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy2>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_2_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy0: endpoint {
+				remote-endpoint = <&ds90ub970_0_csi_out>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy1: endpoint {
+				remote-endpoint = <&ds90ub970_1_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi2_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy2: endpoint {
+				remote-endpoint = <&ds90ub970_2_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
-- 
2.34.1


