Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7340C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGTOBosP6BkHgQzqvNnZ2wHG2DKbIMtndO4MLD8yoeQ=; b=X4fgUb8gVKOuVxTPiXO33rKxAs
	MxqfkVGEe1bpxGTgVzRjK4K8xmAEe/NT5fISeR3ULftiQLX26W6Mja724TLodAR39fV25Ewe81ktz
	bZlEDTFhfooLXOCkJm1Riwyo7lhxr6HzpdG0XReiUxnCkqxXwkq7kynhra/K+XLcFhsyCPfli0yJx
	fNbqVzA+ZvqPrQmQYfG3GRJGKuYdsTiEfWBQ5i04We8Vk77crpbJYm4I7LjrX2enZYJfdqDpHC3TE
	j70invoMK548/pgLlixAdR4/otnp8nDctkObh+siNpWvluzOQ4P5OcFiyWNpR9Od6biafTj+vH+tv
	FP2EOyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcg2-0000000C0a7-1TkG;
	Tue, 14 Jul 2026 12:55:58 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcfz-0000000C0Yo-1Ec1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:55:56 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBQArU2106434;
	Tue, 14 Jul 2026 07:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VGTOBosP6BkHgQzqvNnZ2wHG2DKbIMtndO4MLD8yo
	eQ=; b=S9bmRsiWV9X9mCwWLTE84F0YqY2dFI+tah9VXkBoM1ohJD/Osar9wAhA/
	9s0P6DrSd05PbGG1pMu6ZvmNEgKONVpd/JpSK9G1msG2Yf0euwlgRys9AJjoWmak
	T2OjlD0j//A8vwJhpNs9CJF6c7Og6ma3MpImPKIvVLiL0Ky7QWyfhTnkywFSvUVH
	8Ayq8/WxH81dayWJNAToe4ZsKzPO3JZQvpjrPu3LIAgnfKtv+xNzNU/ygvoVGYAT
	KYgk5KNY/MXqfN+2auj+cXKyW49K4dtAsXEoWd9iJ/nkoOoUnl0C+hS8QCxSaKwH
	c20DMnQW5F4Bpq1jXyB7NxBFx1+tg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tgdxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:55:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b915azT2YfzDYdTB1y+RzPxq3tCJwU5R3ZDuNDspnkDAi8dujTTKnAvKhR+mIv5ItNKmhuNukwP3hMeMBge9emiPC4YCkbrpoxZ3vYwDN0pMmodnDdEVyPJrFl9dWKQZIIs0WBpiZOpNPyBSRrEvHb/TXqdEhfd+GJIwFmDX3UcA0NOiVNglcP15ZilZKDJi+xP+XQbwF18CRAczCkDO+UFAoZ5z1920cuUyRdqo0V2dDozaRdmz2NaQl0CeGTujHolMoB/XyBiZKWcEXwuTsgJBVgA/FEO4uuqAtBOfuaxp2QYuWK3JN3411Pn/pMBWH7FCX7KJtrTEt9+o2eEkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGTOBosP6BkHgQzqvNnZ2wHG2DKbIMtndO4MLD8yoeQ=;
 b=ToONsaKw3Qt/Wy4dynezi7ecd2G5F8SyS/gZm2TXUY4wtQj2OJpNw6x/h5wvT9E2lD0OyBNNPTG6OiKJ1eXmHSEiqypq9fpGpccfpXQ7RjOKVM94Cxcj9V/fGKSPidS1XvAEvCXo+09Xk1I7NFk8gN+dvm9Vi6Mlqnz4reRJnD17GblshgKx9NnaE8UiWnZSXfStMuKB9hcy5DWRSukN4DV0Egdanq+KguSrWJWCnu8m+UwIdQOfwDpKouOOB/QPE08EjdrFGmEw4d2zx2jOZ61BPM4iml1aCV5LG+vd4JjZcoH5eSX0SRrFIwsqiGjp03qkekYno+YeqwnFANJykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGTOBosP6BkHgQzqvNnZ2wHG2DKbIMtndO4MLD8yoeQ=;
 b=ulQzxsRdVdke0RzV9kcQ3WWAH6VL8dd14zD0s0BGfkHuPWcHYagImuTsxkKlAAI6f25Et57wssKctRB6JDJip88ZXxfEbtZ1zykSvRssrzagez+PjHhpI4XSstu8u//7hI3ekA/Ka2YkDY5TzviKpQ12/lNzQxodarszcYY6jpA=
Received: from CYXPR03CA0076.namprd03.prod.outlook.com (2603:10b6:930:d3::20)
 by PH5PR10MB997709.namprd10.prod.outlook.com (2603:10b6:510:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Tue, 14 Jul
 2026 12:55:49 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::a9) by CYXPR03CA0076.outlook.office365.com
 (2603:10b6:930:d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:55:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:55:48 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECtciU4164266;
	Tue, 14 Jul 2026 07:55:45 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 03/22] dt-bindings: memory: ti,j721s2-msmc: Add TI K3 MSMC binding
Date: Tue, 14 Jul 2026 18:25:37 +0530
Message-ID: <20260714125537.3304217-3-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125537.3304217-1-v-mannuru@ti.com>
References: <20260714125537.3304217-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|PH5PR10MB997709:EE_
X-MS-Office365-Filtering-Correlation-Id: e112f314-faa3-4c23-e779-08dee1a73a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|56012099006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: zxuBN7czofsmby/zka2FJbNeI5slMne+qBMvGx3NpJwtjII5zH7eBlBkwxtA7eHIvP/U3ROKiswQJ1V0R15pC1sKzvyKNQ+FEJu3U/Z7ISsYMmQSh8b+9xpn5/jPmwi06mp3NBJhqSlgNxGdvXov5zHKB0vMSWNnSJQ1JgfBhMHwCZZDlrkWU7oK6l47n2NhKjTdrQlRz1L6trbim6LSNRC71qXJQ86QlQRLtdj7jrs0GAs/U3EQZFjCpQOdLCx01mO0/arIpyRmUvqI6X+VKqYRXj9PDICpoQQCcFrhs9m4oifLeXFkJZtkljqBVG0Tv6DginayXDQLPYaHXCpiCKuzxCwSnE5P7gVqK7aOzK3G4cvVH0zTFeeMI9tHXHa8L7QhgK+bt2/txQUYcn+rekH5vbQOSYRA8Ul2B5S63Y9WATrQgPz2hhTswtrQcpAUcMr42mKlX91guxvTX1Iobmgls9BR7XL6zqMiIPD1prsRGRPGLVUv4NPnXZGVp5ZUfjzmMS6Ks+NBi2ync5ybPvd1EjRmkR/chMcSiUVeQFQ1W8o27Fm2ik2ZgAbFqITxm8DArHY/eNTfHXpqZzxf4DYnjH/Ev2RoTSO736mkyjkr+Qk69cYfYu1Luf61ydouzxjhSAwclBBG41AqhM8gbw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oxTMTCooiMRtYoJLOTHbYRW0V9Xl7Gg/eFDX6g1ncvOB5zmDxrlFj/TfeUgOMeaLAWTBMt9aTz9NWKD4LwjE7QBJYraxm61zRfsdPYCM+YzF77Tif45W+UcqZNo7laMzEzmIj623W1W7epKADGOxVBKAzWXgd1ZxBBeoo4lCBJbbra+oP3wF13cWDO5dCOTqUP20GiJx/y6fujjXvn8znxRap9Htt69T9OYKdAAMrij1l3cyKwYUFvhSlUCml5MdA6ramrq0427ZtpFhW3aPlYH+iMuzxXQ9orVNcBIlyTTE7dc2eVAr+F2iBlR+zcsBaBdqjDTurpKUePLlcKhv7PQXKpuZlIrj1PMO6Si6Cd6x1zUU3QeAyJiVF+MIvKDbjSwgaPypT2UUm82Im5uSe8sToJOifdAgpuhRlNb+R6fhYQhJgxONUA0P05AqCHNt
X-Exchange-RoutingPolicyChecked: evT1meNCMC5WkU/OC9O9NDOyVqDmMG6ORD/DWVPOxOHmlruinklXG9kCEgx1ecS1ZTmiflcI48C6ZOikiV1AN23K3xstCnIlk8CeUqMasjdn0QgEJoXtGcDe8Z16+iOQMQP1PEAOhe+hJaLmBDd9k1s0Aew+fgs3ZCzT4LnJK7h0rZzKgmvghfJ1gMUyflIjqTVwiSaMqLoQNI1X/A4GwyRS2eQkkTLLxxqQNfsF+GCEBpQT1O/kud0CjJQEIwuDi6xmh940YpSTBUs0V/N4T3xoI29wSMkCTKQm4m+68a3hdKhQf4+w1ABjlS2numXTa0wEAhqIBDW/dMrSEOjpWw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:55:48.7544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e112f314-faa3-4c23-e779-08dee1a73a61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997709
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX3XW3XuxGi2kE
 ydA37wXgcRmtfoWAtWEHsxmpz6WyMy0KXscplGbA7kIBCk3x3CjShnBOmNT7e3pr3TMuhnpblz2
 b0t4g0aFB+G/Z2e5xVfKS12nm/hS+mQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX1IlKy9ubWau3
 3+v0G16ArawubkHDjzJPaJh7EANDEZDjqgfmBCFkZiPZGAMT9ApAcfxxIZ2ddS1pWErKbhGChc2
 E4Sbm0zWz2MiSPCQVNht75gxyqULBadqv4a3uSIWdsvFuWyaHd2vXeZW4yKB+rMSHL0hTDynrMi
 x8QHdsS9umdHa2aOT+UzhuXNvnKyGNTb4L0KvIJOPKVs0AizCFbI2EwvAHcZborGUCo/JWHqcqW
 fCJUAVNkFx1PRFwjb6c7j38lQPWCQZ6a2sco/kH0StJ9V1Bsr5EO07+APdUtA9qGv6bC+sGoizJ
 nTnHbqWGOWzDfrPVOUse8IFESYLaLELWwdlvPSvZ/CfWYzt616RSmB0o5ARt3jkowzY/BrBXix9
 HOnaIxFosx59/6f6XFy3cDnoxo4fMqAxUSHuqboen4qD1gnZZT/QpS+he4tinJlmSru2klIIxgV
 Rfn+vEgcpozNyfpoEcA==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a5631d7 cx=c_pps
 a=aMvkJueGaHUSD5gdo5rTxw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=VjjUa3U9ldGPIZ6btbsA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 2UTpoiHv2ics3ukCQkaze5m1X1bGlin0
X-Proofpoint-GUID: 2UTpoiHv2ics3ukCQkaze5m1X1bGlin0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055555_474703_DC2FD261 
X-CRM114-Status: GOOD (  14.08  )
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

Add DT binding for the TI K3 MSMC (Multi-Subsystem Memory
Controller) node present on J721S2, J784S4 and J742S2 SoCs. The
MSMC acts as a bus container for multiple DDR subsystem instances
and carries interleave configuration written by the bootloader.

Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 .../memory-controllers/ti/ti,j721s2-msmc.yaml | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti/ti,j721s2-msmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/ti,j721s2-msmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti/ti,j721s2-msmc.yaml
new file mode 100644
index 0000000000000..5ccdc546a121f
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti/ti,j721s2-msmc.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti/ti,j721s2-msmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI K3 Multi-Subsystem Memory Controller (MSMC)
+
+maintainers:
+  - Neha Malcom Francis <n-francis@ti.com>
+
+description:
+  The K3 MSMC node is present on J721S2, J784S4, and J742S2 SoCs. It acts
+  as a bus container for multiple DDR subsystem instances and carries
+  metadata describing how DDR address space is interleaved across those
+  instances. All properties are configured by the bootloader at boot time
+  prior to OS handoff; the OS treats them as read-only.
+
+properties:
+  compatible:
+    items:
+      - const: ti,j721s2-msmc
+      - const: simple-bus
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
+  bootph-pre-ram: true
+
+  intrlv-gran:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DDR address interleaving granularity.
+
+  intrlv-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DDR address interleaving region size.
+
+  ecc-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      ECC enable bitmask across DDR instances.
+
+  emif-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      EMIF hybrid DDR configuration select.
+
+  emif-active:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask of active EMIF instances.
+
+patternProperties:
+  "^memorycontroller@[0-9a-f]+$":
+    type: object
+    description: DDR subsystem child node, see ti,j7-ddrss.yaml.
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    msmc0: msmc {
+        compatible = "ti,j721s2-msmc", "simple-bus";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+        intrlv-gran = <0>;
+        intrlv-size = <0>;
+        ecc-enable  = <0>;
+        emif-config = <0>;
+        emif-active = <0>;
+        bootph-pre-ram;
+
+        memorycontroller0: memorycontroller@2980000 {
+            compatible = "ti,j721s2-ddrss";
+            reg = <0x0 0x02990000 0x0 0x4000>,
+                  <0x0 0x0114000 0x0 0x100>,
+                  <0x0 0x02980000 0x0 0x200>;
+            reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+            power-domains = <&k3_pds 138 TI_SCI_PD_SHARED>,
+                            <&k3_pds 96 TI_SCI_PD_SHARED>;
+            interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+            ti,ddr-freq0   = <0>;
+            ti,ddr-freq1   = <0>;
+            ti,ddr-freq2   = <0>;
+            ti,ddr-fhs-cnt = <0>;
+            clocks = <&k3_clks 138 0>, <&k3_clks 43 2>;
+            instance = <0>;
+            bootph-pre-ram;
+
+            ddr0: ddr@0 {
+                compatible = "cdns,k3-ddr";
+                reg = <0x00 0x0000 0x00 0x72c>,
+                      <0x00 0x2000 0x00 0x4b0>,
+                      <0x00 0x4000 0x00 0x163c>;
+                reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+                bootph-pre-ram;
+            };
+
+            ddr_pmu0: ddr-pmu@100 {
+                compatible = "ti,k3-ddr-pmu";
+                reg = <0x00 0x100 0x00 0x14>;
+            };
+        };
+    };
-- 
2.34.1


