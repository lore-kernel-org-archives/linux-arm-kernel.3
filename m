Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32011C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLcUjx5TLo8FLuRo5+LrCHl3qmcYVmp8at9UsvIT57U=; b=kykBKgg9asj6g1JxQCULb2wiat
	yrBQYIlV4MT0uLj9YzwO+JN5QbJbs0b2zUS3J/uueQV2jJO06uEMcUtr0lN14gVllodggtdNtJpYc
	b9Ym3m7anRLxCNscYxWZA8k7vymJTd1JFgGRhuj1lYnjdWOtvQxI9bWpCEtxHgtaP56MPLoQ/zJmn
	nqbMrLEOjf5+WWq3BHCR+//va16XHkMQJdzYoufF85rTDAaPghJTLR86NVGJFYOahoutM6gUceESx
	zEth33ic1l1QOWcm+eP4hEB6gojJ5s8YbwNtCTBIRHLgfbG5dnLUdVd96Md6hq8sjFqFBd9L+XZOJ
	5l3mGzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqce-0000000E1Pz-1rwf;
	Thu, 23 Jul 2026 10:25:48 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqca-0000000E1OY-2Jm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:25:45 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9JkoK2008565;
	Thu, 23 Jul 2026 05:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rLcUjx5TLo8FLuRo5+LrCHl3qmcYVmp8at9UsvIT5
	7U=; b=QzA83DR59dd2F/cIK81rdgx1CR+Y1gcDbApnOTjCs+fSkDPmInc/DqzyA
	D/ai4CKgAG93RFH6Sc2/HmlTvaplb2/+RtVU5MmgqdqmunK09PF4mbDM5dN/F/iF
	FcljxrQ60Zv0JphmNZMLE9XjFWBhNHZarmcJ5pcZOtXTkhy56vONSStKhK9ysQVg
	hAGyHLO8235L3HTHwVbdT6dXnSrAz7RbAbmG+Gi/bYCMuVfw582I09NMOV0XH8tr
	Qtmg2SVFNkFCvqPUOXa7oYmi4xonx4Xv/jzSKxaovIdAQyXqfLvMq8QlxbW2w638
	pHqgbh9jtJCWDGV9yF6o/oPVMgc2Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkg7ug80r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:25:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MatTvLBfhY5cryD99xPPET6OZfQEHeVHEG13hZc8t5gDvAURu7DX5Gp9WGynUIb4D1bcWuQDeZjO0LREEZHKpq89YaAWqwxRu8jyfRmQUmUHJFPn5gjTeoUE6BTGOsBE6pQavjlqjjIltBQ1MA8/At20wh6es/fKqev/I/2ZrFq0SX94REKbOBa4hiB3rdA2Z2NHu1lcN/+dNSxXUHPzjBQOw5DY3ugUg74WdjuknI7EziqTjy9U49Zfn7unh4AM1u1xyOVlWKwqlQMR6qcBgFCe4hgpEZil3j7ywXD/hEWHu8gyTC+UzWAJiNGkm6cNEgGS6sLMUS9kL3V1DKGsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLcUjx5TLo8FLuRo5+LrCHl3qmcYVmp8at9UsvIT57U=;
 b=HTRgiBo6XPTPIEBRQoFEg2F/vlhkoVGr48787ZmEaVa+ms3iyvR4IIZrzI90okAmLxrkuC9OW6QR78JCCQPL74v0tlkq5j2xYh2rHcWSO0jJVPzQUyTBZQi+7aS7y0vX2jIhr8dbYgLDllw1ikC/oqtugIF/rSK4DYhgSeIM0ej1p26vlMPt7bUm1ICOvJzUmL1ingxhZFzTogeKWhhXMRQwnLW5dKGyYZbJ1j7JQIkl1zj01H85OYi/AlxLgPewVEUWuFefDoCNHZSNHe96iLcp9NBzkKirJn/cNxq666BJkYEgjlJPoSI2Jh7B5IP1dXzMAfdRQ6VVMvbNL75b8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLcUjx5TLo8FLuRo5+LrCHl3qmcYVmp8at9UsvIT57U=;
 b=Np/W/WmOnJI1KTLQMuWiF094EnY3h1eIjbFB7YNgYp8XtzAbuq/IzeK8Wv7t3O3q+0wKcAoOJWAlbS7JuI/pDWrQ3zTvrl5CmD+HWFOyGMQBFtvN9EcEuFpRIl1rUa9DGU7ot8RWT1aCX0T0b1g9RDbOxSjTNYpANGx7dmLWIgs=
Received: from CY5PR15CA0093.namprd15.prod.outlook.com (2603:10b6:930:7::21)
 by CH3PR10MB7929.namprd10.prod.outlook.com (2603:10b6:610:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:25:35 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::47) by CY5PR15CA0093.outlook.office365.com
 (2603:10b6:930:7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 10:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 10:25:33 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:33 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:25:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 05:25:32 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NAPKNh1518375;
	Thu, 23 Jul 2026 05:25:29 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Date: Thu, 23 Jul 2026 15:55:19 +0530
Message-ID: <20260723102519.3581762-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723102519.3581762-1-s-jain1@ti.com>
References: <20260723102519.3581762-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CH3PR10MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 024819e7-9d16-42b2-22ff-08dee8a4ba8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: LRbBbCoEOfnpn21zMgBfTDE0Y2AvLq6d1n36oKdoUZn0nArQbFuvk5w2eR2ei0Vg8YKQJxvpl309ErXkVCJbA2CMoeh7810C1wXgSyL0zLKDhjwF7GMVeP/WKBYUcGwMm9rsN7O0kIjR6mtK49uFdH9LYWfEjoYq2qlOePmsIyaUQJZy/h9/RsnZ/ek8/FRRLuumXXvQWYtZP0l7tbl/riAx/QZw1wqTvD7lp/r++M2ZfbocorUgRtyxslhbCCk0hzr6oy4JmYQdCWtxh8AYwLgnt26O6XyoCndODL+qWSMru1M0/5CBYzYXt7CUcLVBc0x4HoGVeWo6T0V+EoiZ7k/7UBJsihQEW0Fd35wRROYJSsrxogTiqgW7rReHJ5ZLL8qK1sY7rehmpp+NZjWwTwJnDea14OXFB0o97jyBOTc8XepTsXUf4ca4Sgpl3beoJIsPjU95Lpgg9UrZ1k/plZpY45wcNRVu32xcOgtUyQQ67mxtqRdvcf2nr71W+q2f67dOG5RWnECXtSOwnBYVvALmZc/pOztKto1xvntD0hyj6dq0+KM0IN60YfrVqNuh2rBBMWyOi63YDc14LFoUmpRreYK1q6M14KqsfUobofM2xe91H+BxNYDETTqRdYYnFgAUke976MYGu1teJG6hNntHYOSiUvXPcAsLKwp4zYIRyfeValOH6VVelSrnjOvdHrhO2MaCFZ7HLNii2RcP2g==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VgV8V91of3H3EgSV3GyCzwzQ3zoxgi0oemChbm1XDubCfMc5bz6mRh2s3gsXPaWOlJt0vtdtjYQTioMd5q7zujRODNE3tk+8qM2DIITB8CLXC03x0Xq2t8aVivQoPopb/sIKYLoDutNvsR8VBKA8BNDVu0CMHNy2kMANMVhNcw4oyYmLuG9xTneYFS5/t8DkhD6cdnKm1hhqBDRgKathzUT77fcmV1ljuBDJOpCtsAepqlgxe+GYJ71M9EL4e3PfMuBoVBOFvmW4c0EWefK1UVQ/EzbQ/dUI1V5BHpK5uKrowQfNIFktILTcl0zgLPuv58PJPcloLiwiXWLdYzyigeWzb3KVDLHq6w6rYLlboNtZjYT9+EVAyjHdEBqGmP5u+AVmzTLPY7vxEt/EBvwOFPLWzI+KfjqrfrPKLdgSDLOvPHxANMJAf7DOrF3M1sv7
X-Exchange-RoutingPolicyChecked: HON6ZFSFnYoszjftZbzifi/PXUIModfHRC5c6QyZ4iJrMxdq0joG5arg4Pn/7IXhgQUJgLUni03sOFC7OgZpKaE2uTkxZLn4LwOPBwnEf8Z6GtpLKCPlVdufpo4rtLa8rvVCVuzN9u03WvwahgwDnhpjeTO2iG7LUqfqdqUldd4QoK0TfPOaNISXa4SJXxrGM51QaCImy2hH2qQYC2WEQDzn2XIlstMhLMA3tqo8D4omI/f39PsUdPtienCAnYh+zRja+wexT66YZ+taZh+HfJ65LECiOzHkgWZO3mP6FHBNd/NML36w2Vt52234I7K3abGHsWP+P3/wdbniRMiN4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:25:33.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024819e7-9d16-42b2-22ff-08dee8a4ba8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7929
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfXyALj1gJbnsf5
 +4mv/hWJxJscH12DImrQArlv1FBuBRLD0BZnqqc6K9261+BL2ICnCax1VgO/Qb7GL2+zQWjK4hL
 eTyDLEp9f7c4Qr1vIVGuGTSgE+DuhoTDwdA9ek7jsvHWosowCfK/vceIElC2UuCvPOWfyzgdWZP
 jvXhE1gRbPC439hQocw/PK035zKyDkLp4cK9wQqNSBHUfpj0Uiy+LNkN4n5Gg1F2ttG12UCXdpn
 Wro4bqWFauMVqYo89Uydm0izopwNVj5F/lG3QP54V0IozvL0ptaH9h1jisUHxnA2JvE7BNu4F4P
 HYqXEwqu1c2VRzTaUyYPHGpswmHRbYqnF47kxkBCd0hynUR8ZLtwsyLeJaLDAkpeBuP54IQylxj
 VJmlw66QWXFToWkLzNZlY6LjZEFXVxQBz9Zle8DrgfR+wt+XdrJXJXPVHmv5LRJjN4oiQu70OFJ
 rX8JjxLo9crpuMnV5iQ==
X-Proofpoint-ORIG-GUID: s73gxrcgaAiaocZ4UqcQ4GhqVK8tXcw5
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a61ec24 cx=c_pps
 a=JJOFz727VvkGy7wKLfv01w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=t5kY5Wq1TILCC35NKeUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfXyY8qA8BBV2Er
 o4KzrfPp6rqzNacYVd1oJVqWuqL1vj4kXZHEsr7uKKwT4DnhAZeBBtn5Y9p4f1kEBVxQ2/KODTm
 wzq3ts2xQHCAhbnkwiCOTpysPX4Oggo=
X-Proofpoint-GUID: s73gxrcgaAiaocZ4UqcQ4GhqVK8tXcw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032544_719512_60863DF7 
X-CRM114-Status: GOOD (  12.65  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 95 ++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196..2982a05f6082 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -44,6 +44,18 @@ usr: button-usr {
 		};
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -192,6 +204,38 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dpi_pins_default>;
+		bootph-all;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +265,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -321,6 +400,22 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
 	};
 };
 
+&dss {
+	status = "okay";
+	bootph-all;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	pinctrl-names = "default";

