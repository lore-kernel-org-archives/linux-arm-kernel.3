Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idgKL0bcfzfEA3IXIQslIy0+nGmXH2PBJA36k/5yGew=; b=AxTK2mG44eweWBrNMUo/quF1f4
	t8MhAwpc0cVxaz75LJ/lGbyf7oSSOJsoqAQ8A6fYgPqp7N2RjgE2Kiw2tHRRdzqwudSJo5gHby4H2
	jy90Z3P0IKT34XkbTJ9FK0s6RPoX4FeSbuXB3KS/rsevFgac8vJWvI+hyhKnLr0diLtgLy7eX2jln
	4cSGmSu/r5P8mCz8DDifiU/sfYJYPtmYwDdNKLEuZ6QGLOHRVy2mTWLT38tYr4SLHBTQD+ONwAQ4C
	nC1Z7UWcYTBmelrqLaFVPYtCInIe5frHOF4biKq7FYo0roj9ObcVA1NOTHz6adAq0EPJvqoC3V3dy
	niE8M5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcg2-0000000C0Zp-11Hn;
	Tue, 14 Jul 2026 12:55:58 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcfy-0000000C0YS-0b6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:55:56 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBPrkx695628;
	Tue, 14 Jul 2026 07:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=idgKL0bcfzfEA3IXIQslIy0+nGmXH2PBJA36k/5yG
	ew=; b=JRjQ0tK25WOdZxGd0U52hUWINQih5N5FAZeru0qOemgFrfdqbtvvH5RKr
	0nlFM9i0sgRCwoybnVcVUTu9n9IGlT0tdI1lS5PctQ3P752V5dgGMezb1xsGlDFj
	WtUN+O3gN5R3G0aiu8Mw4Rw0WOsMpWRtm3ar2Exm7DZf/mns5gPFn3qLFfAfOmDv
	ZXynjnZ4Ynu6FjPH8e/LgrE8msmkVJ7ZnqnbOZ2t0v2/DQn5kt7zEzbi79Gk6JFA
	VuDVDkjDm5yX4a04lYYKl6Py8av9vWN8IviLJU22TJoX3zbSjCJfE2KVlouuEhvx
	mbtU8fJzWo/HXybsgV4SnfYFdGFJw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dgdv2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:55:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLq2iud991HrR1GslObJNxGEZzyFcSZrPxjhc0+RHNCR1t51TAXzDC8fl7KOMtv6JVU8jRFVeq87mgrnrN2fxyl3yLKPRiD7JSjqgVudQK2I+/Pm31TuXyJHAyHvOfBfubxv0SCxnJE0bMW2sWju0BF38Bhpzciv0Cf4eO0vYeZGb35J+n8p2D0xu0f3ybXR9ZJJ03fgAWE8pv+r1HhkMP+b4D4nLkh2T+yGCaOvCbZJ5Bdb5sfgF9BcC8P9vuyFmdnEVI+5hxigIEgGHKNddWit1TGyDRAeCI9E9Lul0MtsNeXgQXSuPkq9kOVdAihkTxu/dstGcYW31WZIExB3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idgKL0bcfzfEA3IXIQslIy0+nGmXH2PBJA36k/5yGew=;
 b=gBLBInsnBC4XVbFnLlzaVTRQkJw9LFzCMqgNqjyPRfAFlPAC8TktsAt95J3zfRNOfhVZVAxBfl6aaM+kIyKf5GTeKwEyDCp55p/9r6qDkHhGI6JC1jAjX7xBdlxJ3Kw1Oj39pHkyA99qerX/+gv5+eY9w9rKencNI/JmTASLhl9mlcCA+eGVm2Y53XRcUGR5pXtif4pgwdz1znYnOm5Z2qrVOdR7GEdQOAjOUflUy6w0B/r3A/+N5OW6/LddaeiJJ+bEQzRbZ848w6Mi3KeAeBdRWojGJFtdlYsm5QHYJOU8vmhqP+WtgjWcwJr5AQ7KaRGGXmHQanhSX5/3C6tOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idgKL0bcfzfEA3IXIQslIy0+nGmXH2PBJA36k/5yGew=;
 b=YzE7b4lYeQ4du1iKeAvL33G7s/ydJ+8K1IEip2xG7avK2DiywhO17YV01NEQyS/NyYOhBuagBSSOOvwDN+R9G5ckzdjaZIcYg3PWRPAlAi/dAaVFGemNQLX/hgBb1gA2wlxl9NhAkqP3RUxpZyKqW5oKpvIxJbaYZD8ZXmlJ1TA=
Received: from DS3P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::9) by
 CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9; Tue, 14 Jul 2026 12:55:47 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:8:45e:cafe::4b) by DS3P221CA0003.outlook.office365.com
 (2603:10b6:8:45e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:55:45 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:45 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:55:45 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECtciT4164266;
	Tue, 14 Jul 2026 07:55:42 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 02/22] dt-bindings: memory: ti,j7-ddrss: Add TI K3 DDRSS wrapper binding
Date: Tue, 14 Jul 2026 18:25:36 +0530
Message-ID: <20260714125537.3304217-2-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125537.3304217-1-v-mannuru@ti.com>
References: <20260714125537.3304217-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CY8PR10MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 953d766d-d347-487c-8bc6-08dee1a738b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|3023799007|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 20+DUxp3CTiuc0n2Qdx3/cdFjCwjC2e7uqXLtXqMVV/rDZF0RdmJPhhYzhBGWO7i7CvScdeduoK4HN+Xc+YMs1UhrvE/QkKvlEpSUJiTzs8/gkDYi5q3vS9ymSjh9uqXTrgPbP/4/NWstsk3xCLYl7khNQ2L7POIeiVpQtOP/cdF3nvLHHLh/VoWRQwHWYYTulfPux9++5+hTP3Z4y8OWkFZEfErHEHjEQRcZAjA/1LioYRgGpOJOOoHu7JzsoqwlArIQo2CHE3ArODLIdyQ7Ls8bt/dNJonaR4Vq/u/LHOb9vkblh7VmEpZUk3FZy+mE9Yo0C9Paq6m5+aaP+xkiZCfSHnk1K1IrNU1ufpI+q+7AiA895qL2X+0m/XzFgFK6XkAkbcjmkFH+qYiVNDBACQrVh2Xk4Dqdr46cHYOObROkxQFBhcLJFMigaBeZMwN6oZvBQTNBTLZYFl/xHO9r3oOgBvABxG/0Q1vdMtEdsB51MlVrBrreUYOIY7XECxhIsBZY6IsguFj6MdUGK/zQXRBfjU6A9/bXY4cMzttNSh2NkoqkVNGvjUMf4fHePhSFo/CjU1uBZ4bL5LnOS1PwUSh9myDQ8GwLIBJoyga9MAO1fpYMfwv8epoob5iy9EnvfoCNVWi9WsqwgbX6/df5A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(3023799007)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l0YyC5A6vCtneo0xM+IKr+iEm23omFw/7L1Li7CbUX2j9soigLyKIrJZGsNfzEr6684VQEfwRs9vU9l1oZfxBMbfl3mivgdU2Q1kUPK8IyrCsg5hFwU7qfkV+WrVnqdqaYERI6yzasRKesCiU4K9/YGiEI/3ClOwkTOHztgla/J/LUiYUCAgOlOyCORStTqcjCOky7p51Kx7DbfsgCBpVRfUoSocmnubaatkhwvXJiM1agVrvDK1AfS536n7WN35NWIDWLsCQvt2p2N1JPmyDofngnbKtkpMHgjfjpFOmRK3BJObTm1pYN5xhcH2ABySsNs0OGFh/zExg7wrZszDiNU4nq6blTI0h5D/BzomrDnPCso9c6TXnRDO93suhA/8DNq7m+Z8UDj6zIQOc2rwf8buSdojPV3gQEe29UazmpjcMNaCqI/Rtm0YFmkJT33l
X-Exchange-RoutingPolicyChecked: r3TNeXlHfpVjQ3rZq7ed5OQx4LZzOSaIRPt4BuXj3a/MCMzadYrnf2kZusnUwpTdEkbAqYycOv5lGWDyZXtSaIrrw8JMpoM4PXDawPfJeQ2zS3hmNMNotBWWVjxZ/WLln6XR4TICAqEFxel4rk/3bCKQyfs0CRM3G5UNw3MxH8lnz1jqIaPOPHqkcohqpzde9+JTTC9ZIhf5pzzqDUztIklZl99GprOLEVwx4TNicVYoypsTOFfccA1F/OauSqRCM5FA6YS5BQch0BT6x/KFJaILXcXmhjuYzNzkSVRcxIpFPrgObOoPp/3j7g4eT3gSopG/8QGC8LNbgIMVUz3VxA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:55:45.9450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953d766d-d347-487c-8bc6-08dee1a738b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXyhkOFeKgMqqj
 2ZWJmK5UTMhClsIkm49CK6JgqtMpVzEWwPDK3zW7YbpoZh0yxi/GQPjpUi3+GyqMZX/wpy4O/TP
 Al5OpqLvu5O1LWiPv3BIFS3x0Hk04Bk=
X-Proofpoint-ORIG-GUID: TvJCl8gy1ZFW54FNrk0IxREvDsPjq9k7
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a5631d7 cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=O-CeqXx36oDLqbiOyZgA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: TvJCl8gy1ZFW54FNrk0IxREvDsPjq9k7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXz5+0gFTL6YoO
 opiFbggo1XA+alz77Rsi/dcezHskczf8oZzPXj22V1oVw8NQNAcEMHkg7jOZGJffcMJnkOlSeQb
 4MTdcG8HQgbtcgEQqZLRl6h6y46VoQke/JXcaHMR3VgIrSdWSkxAYTlhJtbkC+HT43Xa0nvFI2A
 fUYv05pzYTetp2nlfP5NJVsVoBna3aNwqhx5FeWaBo6QdyvOCgjbzVe+xvN8VSiSsKoyGvrL2/D
 czFKMmDICgY0ynqr8LXUueGGiaUpM0wmIgVyJhRRj/J8Zu0opsQzKs2oCgJWAILHYjcUr0pt/Fc
 4/MF8OQe39+0Ha8ewRMg799rYYuWbKLSVMxYKrDXJ3KzR4fiMzKBGQUm554f3FeREz8PNAewBZA
 YJOnu2SM4hdnMiUV5ig5VbwAltYT1iasatFt8vYPvoTBa0aGDB/15QnId/Be/1KBR1rUQZ99PJ4
 q16hmKZKFbrWlebcDkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055554_200366_0347228A 
X-CRM114-Status: GOOD (  17.01  )
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

Add device tree binding for the TI wrapper module for the Cadence
DDRSS controller in K3 SoCs.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 .../memory-controllers/ti/ti,j7-ddrss.yaml    | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti/ti,j7-ddrss.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/ti,j7-ddrss.yaml b/Documentation/devicetree/bindings/memory-controllers/ti/ti,j7-ddrss.yaml
new file mode 100644
index 0000000000000..f4bebabaeb111
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti/ti,j7-ddrss.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti/ti,j7-ddrss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI wrapper module for the Cadence DDRSS controller
+
+maintainers:
+  - Santhosh Kumar K <s-k6@ti.com>
+  - Neha Malcom Francis <n-francis@ti.com>
+
+description: |
+  The K3 DDR subsystem comprises DDR controller, DDR PHY and wrapper
+  logic to integrate these blocks in the device. The DDR subsystem is
+  used to provide an interface to external SDRAM devices which can be
+  utilized for storing program or data.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,j721s2-ddrss
+          - ti,j721e-ddrss
+          - ti,j7-ddrss
+          - ti,am62-ddrss
+          - ti,am62a-ddrss
+      - items:
+          - const: ti,am64-ddrss
+          - const: ti,am62-ddrss
+      - items:
+          - const: ti,am62p-ddrss
+          - const: ti,am62a-ddrss
+
+  reg:
+    minItems: 1
+    maxItems: 3
+    description: |
+      Register regions for the DDR subsystem wrapper. The number of regions
+      depends on the SoC variant:
+      - 1 region (ss_cfg): am62, am62p legacy layout
+      - 2 regions (cfg, ctrl_mmr_lp4): j7200, j721e
+      - 3 regions (cfg, ctrl_mmr_lp4, ss_cfg): j721s2, j784s4, am62a, am64
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: ss_cfg
+      - items:
+          - const: cfg
+          - const: ctrl_mmr_lp4
+      - items:
+          - const: cfg
+          - const: ctrl_mmr_lp4
+          - const: ss_cfg
+
+  bootph-pre-ram: true
+
+  ranges:
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Interrupt line for the DDR subsystem controller. This interrupt is
+      typically used for temperature monitoring and error reporting.
+
+  power-domains:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Power domains required by the DDR subsystem:
+      - an entry to TISCI DDR CFG device
+      - an entry to TISCI DDR DATA.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+    description: |
+      - An entry to DDRSS clock
+      - An entry to SoC bypass clock
+
+  ti,ddr-freq0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial DDR frequency in Hz before frequency switching. Present on
+      SoCs with three-frequency operation (j721s2, j784s4).
+
+  ti,ddr-freq1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Primary DDR frequency setting in Hz. This value is used for
+      normal operation of the DDR subsystem.
+
+  ti,ddr-freq2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Secondary DDR frequency setting in Hz. This value can be used
+      for power saving or performance modes.
+
+  ti,ddr-fhs-cnt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Frequency handover sequence count. This value defines how many
+      steps to use when switching between frequency settings.
+
+  instance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Zero-based index identifying this DDR subsystem instance. Required on
+      multi-DDR SoCs (j721s2, j784s4) where two or more instances exist.
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+patternProperties:
+  "^ddr@":
+    type: object
+
+  "^ddr-pmu@":
+    type: object
+    properties:
+      compatible:
+        const: ti,k3-ddr-pmu
+      reg:
+        maxItems: 1
+    required:
+      - compatible
+      - reg
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    cbass_main {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      memorycontroller: memorycontroller@2980000 {
+        compatible = "ti,j721e-ddrss";
+        reg = <0x0 0x02990000 0x0 0x4000>,
+              <0x0 0x0114000 0x0 0x100>;
+        reg-names = "cfg", "ctrl_mmr_lp4";
+        power-domains = <&k3_pds 47 TI_SCI_PD_SHARED>,
+                        <&k3_pds 90 TI_SCI_PD_SHARED>;
+        interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+        ti,ddr-freq1 = <0>;
+        ti,ddr-freq2 = <0>;
+        ti,ddr-fhs-cnt = <0>;
+        clocks = <&k3_clks 47 2>, <&k3_clks 30 9>;
+        bootph-pre-ram;
+
+        ddr: ddr@0 {
+          compatible = "cdns,k3-ddr";
+          reg = <0x00 0x0000 0x00 0x72c>,
+                <0x00 0x2000 0x00 0x4b0>,
+                <0x00 0x4000 0x00 0x163c>;
+          reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+          bootph-pre-ram;
+        };
+
+        ddr_pmu0: ddr-pmu@100 {
+          compatible = "ti,k3-ddr-pmu";
+          reg = <0x00 0x100 0x00 0x14>;
+        };
+      };
+    };
-- 
2.34.1


