Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3900EC5AC81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7a6WfPSpSGt+4a6+q38EsZfeWsqAC+mE89HqWTZQHgs=; b=Qq430LX0uzqnh8cHGiN9mwce3Q
	TDIX4pRcGQwC0OTv54R8e6SGisBwqROOEcczxBoCXkG62OLTSLoCjtLgOjGgAa3im1i8bStMH4dnO
	6dZCSipwtOJeNn83pAmyIyNa8nqzBLeUzqpJSkql4H5/cyjDTC7wna/DLmxBUjGr+raE8SSAzrmHS
	NG71YQnk4U6eGGyo1GHkH1Y9gRU5RQqemIsIM4DsWWCUPLL7o54M7053cp4UAXnrri0NKrEZtb2rP
	sKdML4Rjj90NazL+wj/7ctuT9TbklljOBLjj22OXAo2LBdgVU+bGJGJJHf+ZN17DT0KedNfFfBE+G
	MC2ry9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws49F-00000006al5-0Zl4;
	Thu, 06 Aug 2026 19:53:01 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws49A-00000006ajL-1HBy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:52:57 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676ICFCt594052;
	Thu, 6 Aug 2026 14:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=7a6WfPSpSGt+4
	a6+q38EsZfeWsqAC+mE89HqWTZQHgs=; b=JNFHEa74AMMZ8SpRa/xwXY9nnm0dJ
	8fbV/C0Dw0Bb4XYwVxhgDNEnNtfBjtbnS7rSy/OxK+16BxCs+DagTwrdPkY+OnAe
	QdCltwEweR/eKp1bSum2Z0k6OLmdueO8QI+r8y9sK4d4lVuY9IM3fQG/osnBN6lO
	qpynUcmeSi+vGDVvJrDBmRhvIabLzPfBvWIyKfplCO15iUHcx4StcTM6wQ9IYH31
	946jWFo1VeWAC6s1FWCKWr83Dx1OkfqqaZ9IVjMi/37wtU3apN784Mkn6etADS/Z
	BXDRHG4JjS6+wDndF2LE2nSQPgmcF71WykbHd1qpyiLZpfoWeDU4hMHbQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73c36g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 14:52:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSkVV/n6uu6hZM0LJGJ9g+MDCUOzzAN9WuJhMNJgtHgZIseM1UzqOc/Kxn1cnsUSV1F3joMA384+dTSyFW6RbYtEFcUSgC/X17i21aUUGC1AXazmIBACA7FGJpHWYRIUx+ODb7qFriklHVJ/IMTB5IdSj+49s92RaW+q+w4cjMGrB1K8oRey/c6pmQ2Y9vZ9EHsbP7IcjuO66JgoVSnu/nva4ICDXCThLII/QCCS7bDLThes4hZuoMa1SET3ca6kvrUJTnzRZcKnsW0st/vc7Q/rwP3w/OJvn39JI5prNmDFQEoIpdCeQJZdpEHr2GAT4YhHvgr0mRjd+JV95SG87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a6WfPSpSGt+4a6+q38EsZfeWsqAC+mE89HqWTZQHgs=;
 b=spiCb64JcBARvDrwPKJ0is2hRfTR4RvbDKUBfNfyz729eKp3wsmiF8vAoePLvtSmGJtsTWYVdA+CT6XcQVXSadvdUAhZ+hxl9eZTkGz4Fq68wGdJgklWgiDCvrFtPSat0V5Z2dxNRBrPt2iVh7qWzat5oynT2pWjP5+eoRGgIyqWjsLxLAXIQR/hmhaEIv2hPyPxgx7etO42Ftti1O9c46fPTuQ5FuSgfFbxy76vVk2Q/0htvJ/UfxUt/seiVXQeiK8eVQgIWtym5f69qHAK+F4uZSEQOlukwPZqBS1CTLzQ1pksYGv3/W8o7g2o1lrOANManYDgUW59YrraNnAgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a6WfPSpSGt+4a6+q38EsZfeWsqAC+mE89HqWTZQHgs=;
 b=hTjWh3hQBtUJo8fnC38adYEyaKOkdvS2qPEVntsANrYv8KExAGFGmKeflXCLW9syJZ4kWI6GzYAicU3KUt+GbIjzYWrSRB3HLqEJMpJ/7qqpap4EdQskfvXR589q4dkOudvDK6W9TYg5oamdTPZM9KE9Bgzt13AQn+2rhGpAciQ=
Received: from BN9PR03CA0955.namprd03.prod.outlook.com (2603:10b6:408:108::30)
 by CH0PR10MB5147.namprd10.prod.outlook.com (2603:10b6:610:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 19:52:43 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::49) by BN9PR03CA0955.outlook.office365.com
 (2603:10b6:408:108::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Thu, 6
 Aug 2026 19:52:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 19:52:43 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:43 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 14:52:42 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676JqgLN3900552;
	Thu, 6 Aug 2026 14:52:42 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Fix MCU watchdog comments
Date: Thu, 6 Aug 2026 14:52:40 -0500
Message-ID: <20260806195242.669491-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CH0PR10MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: fdec2407-51d6-4633-1b64-08def3f447e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: Gx7tSdh8A9xNhzxPK8sAUVx9YQ2QZGxsa9bujoOWg9Jw1sRq24dOGWqs2QIJmGIHFtfWeUI9eM9vbZG+sNloCQQods277fFdToxn8nfnREI38Usf6q6IjADdD2IN90brnz92wGmbJ6SR8NpXrlcyVTgxSDEXk7VfRMtCSonPE9y5XskkeVvBcY0FCYnh+BBNmCektN+TkaaRWGV9EOsTq7GVHJyB/LVonAjOSXEruoR+s3uoRWRk/mp3QFb09IANQvG6qZliKAhEAWF0SYPPvc3KAcQ5/E/obER49x7Su0368a5/CTP0eSkR1DbXTMVS1pErGnqiazdY5UKmhirMpMJtE5TUxMmIk2bJrP5M+4r1WiIqvQNJs5zf8ZewI9i6Ow06YVGtTp3JoJdu5jGPgR74liPcSBpiDTyNLkk4KoRAqXrDoojn8SywUg1bMr1kC5pJ/lREYCu2A9vOYSq4V3PmI9V1X2mvn86L2Or1PH8n1QHUwcZgzg4g/KZmpxuUiwcm9AAxM0MH2eSQ2IJCzTha1H7UyA8gy6U5gQtjeNihQ9EjOnnF9+dPjGQVYMBug7/gQa5tbnjzmE9x2VmqD082y6LBPMq9/h7KxR889pDD3xIrpzfiLXO4I/10uxv4YjmfOTHqJ3IdxDRKR8/NIE0JFPkVXGjRb/3T38IktMlUyqB3dTYVkehev2rASPKtSJYTweHiNq5YWMLnYR2akQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bPz/pWRpbnpp7Cx5H88+4ErlrHU00m7DyM2x+r0kL+qgMCGqCrq5MWgRX29koeBoN+lQRjvhPg4VOyf8X/tiBQQ/XDVNDQOsYdBg81R4T8hzExRhfyRhUdYKaE/0GZGa86z44fmnRmjlPl8FnAxInvl9m+GYAWpsZw9LZV3rJu5yyg+7L+0eeq4RX/Hj6HCabD4ajmJqg7mNK55W8+bXnYZxkxGhH6RT4krm2G83okXN5p3o0bw0aa2t6KBpWUb4zKlEozScUIniCXPJNSA8NvOCM33rIY9B4C7CUCG+mjnHyJu0W3NdT9u6hR6zD6/esUXyVGornPd3GhZQtq4bhYWE/qWt2ldiiUG0eOB25j3aH0uo8Y50JpuYCVvkDALBDcJP2paM7OSXp3Nr/HUgDUPwdOJh1hYLnAnqh5iEm4KRcOjyM6VYw6A5b4FcopvX
X-Exchange-RoutingPolicyChecked: qGqCUk652XIZs4hEy7vk+Za7kMLoZSNpITbJIf/eqvgLbLZAVjvE46pfFt81H5SYVe/e063LS+Bdwa4zWxPosIOsBiDTAe+hYgdw3VzCrh77PBpwe8mh66zmll8glH/8blZxI28zGt+J0Nc2FQUkhN7IXMmad8S/IHsomHm6GOq6hGffqDO1qW0/LGpLN4ivvUFiq+SLaZTLlyBW0HN9NNAJLrCVjwA+P/Z1QExJIyatQdv9l+vdFT0dJnhfGaXjKscnRezH3tFrZKnrVjuklXcABNnIXtvAkJ1A5367ppc2g7BNqGVZwabfbYZ2vrJVdPuvPkbH+K64f8lV97BihA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:52:43.5535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdec2407-51d6-4633-1b64-08def3f447e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5147
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX/7c3v6xWD415
 80RjIFeo6225VJR3Ve0SraTF+PIvBqYTtaCz2euEY/ClI8wjs9xVDLBsUDEICdq/TkfQvQNVvwn
 6Gio5fdFTziZQP+90E64DsvS1ml9ewQRVZGDf2K5zjleiB7TVbY129BJqnnK06gfgv4AqutHP5K
 aiRXjfr2qfQISTN77l8Z1G3tme01HPeybdOIH7FD7G3PpJoglQTro669QdVslBwZVa2Hi1Yndbc
 l4I+sd9GhD5NtV/paUu7I2ZbnTtt7Gny6jJevjSYyONPUbfC1d0wL9CLO3I5stOARKfMhmdBfSE
 lDs8PggRnpbuC8ULjEKbQNb22M75ndg7mXTcGYwZYq5O51E5JtR4wSdcZrusCY++CG2aGzgr8BX
 qlR/qBDBa3wpdGgvB3Fi9oHH7/QWYZAvWNZRbOpBfBHAz1zy8gbPyNJO8xaY6ONSRoWEpicBZMC
 18FgrUSto1MUZqiVCUQ==
X-Proofpoint-ORIG-GUID: foAe2fTFu4OZeH_mMjdXBvq_eDuYJU2i
X-Proofpoint-GUID: foAe2fTFu4OZeH_mMjdXBvq_eDuYJU2i
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a74e610 cx=c_pps
 a=SPERBzkolnWMWDQhIvzwLw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=WWNFJacJDIQllWfqAOMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX9a0Dx7xgNrSh
 YcQtV5fu0iPdoy+1StwAoQYDOgVGcXEhuc/vcJWv7E+C33G67TpIghRB/81JmcNdDereIbA3FIw
 HLMDSevOwtPD90uhNHx18jlKsnxKEQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_125256_464651_E637574B 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

The MCU watchdog nodes have incorrect comments about being tightly
coupled with M4 cores. There are no M4 cores in the MCU domains for
AM62PX and AM62Ax devices so fix the comment accordingly.

This is a non-functional fix purely, for documentation purposes.

Judith Mendez (2):
  arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
  arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment

 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi              | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.54.0


