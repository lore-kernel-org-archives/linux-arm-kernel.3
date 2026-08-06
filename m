Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4FC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEiLeNSmDuSWob7eBD8E47XbgcYmB6Gyff6AAlO8e9Q=; b=QYrBRlwWtgOsyZdQgESQ4URyqB
	J5AS5FSbGig0UMI7ZY5uuEUziqgXjbxEnDdfJPelIjAGffMdTtQhswEHj8FwTHMtnoDXaXwxf/PxU
	4lUx7f2goAWK1mSczR4nHydCZm6sObQmixGaFznkUXx+WDsga8FgqTIKM6LpQ3D5eaxRXXuhel4rb
	MIzoogvl7NzN6TGdrBrczshWvyJpQJQUiZLUO8UT7Bcpg9s0ESLj6nQxbZuiiz3y/cTcIRg11Icsg
	aBn2IVaixnYvGq9J5XYsrXWgT/CdiXlGfIxHJnE0Y5R9I1tVFtktJU2N+EDD426/Qxiy7AqZbmqpr
	xD7CTL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4aZ-00000006eEi-2a9C;
	Thu, 06 Aug 2026 20:21:15 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4aW-00000006eEH-3cmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:21:14 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676ICH02594062;
	Thu, 6 Aug 2026 15:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=gEiLeNSmDuSWo
	b7eBD8E47XbgcYmB6Gyff6AAlO8e9Q=; b=kRTKElHRkgtm+PSCgXCRN21cxyVvw
	OMAqv+a9UW+Oawh7XQpfGi/a/Wt7NhhUBK6rqLdq6cj+eBKu5CsROVHMLJw2Duoc
	MWWbAPnMAtIupNGXOFz+bLO+n8PtNIrC+CX30awBroyHhLl/F0GAzOIjjZ042Eu6
	TQy/CNZgDIfdtZ5RUCsZlFCTsizhXyVMDbqugOp5I3eQLQPWKAr7jLE5UoK+QLMj
	52ghmmst2vVG0yPHLs2naGth5dY6h23f3KnDWCOAA1lU3lRcxZwVtzSqQRqJC5AP
	GTLQe1Z1B5rDCDvWVNklw9yYeIOTGCouzE2F++7B2e9VOjwLJIrWs+uiw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73c99e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 15:21:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx6XHuAufGO9v1pFxyfoOTrwXwR4vdhcBZ9nlzuldBLEN6cqbu1GV83GdmxY2KX+qBgRRrK8je5wzXq2eUitK0mY/vv8I6VCKveWucIF5NJ+wh65sKUXyJbN5LL20V/i/LM94ZBEaM1Jkq+FYbmJFSEjlQGy5aPQMYppv9WG6SC5d24CjXsP24CvtgEw+BtkQaUs3JvtgxwKmVqeqtGZpUHPw1KswWeyymKW7fP+Oj3piK2e34p8FjxdPJXDu5YXuemWED3ZeATCDYltdzo7JItknKBY1o79nShcWx4yA4leppQ3cJwGceN5A5F7p0lGYWZ+56sRh4BnLA2G0qajgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEiLeNSmDuSWob7eBD8E47XbgcYmB6Gyff6AAlO8e9Q=;
 b=rV+YQlyCZCssCyqzpQYS/b5+/6hZ/e36k6H1ydPZwBZ5do67fH8L26xkRuLWfHQ0anRZ8F/1j9jT4dZw+qPiqHxWTYTi8rgnSsKeNMKDI+ZCf6qONAtynWr/TJsPLJIRQD6Yb1YwT8jbZ0eYNAYwTFIQ0p0fDhzY/a9+U1uCmHFGhyFpCSrv5ivcX+v4aU4Le7gnaIr/YODHNtWxJNyN/gkSdtHhIYkZXVcLp6e+hpKDefx2efQNB3gmk32QRG63CfeFVEeG5C3myA4c9Dyi3rLVWnQ87oBKxvRUFwZgktj2Cv54E+6bs5uQBQa0NrYpHzh8qapPiJc4niLKD3hyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEiLeNSmDuSWob7eBD8E47XbgcYmB6Gyff6AAlO8e9Q=;
 b=Wfl4G0vQjT510G0zfIPT173UWwO6nw1D7n/1TlWF9pYcl1t53YATCewRS/mFCn3ZbGf8srEWj9zWuhRp305ccU6Bm/xO/ThRt//x/tAX18lmiIyQOvK+DB+8T+2pRQZp2Taix+nCRC9Mw4U2shly8raSZS4CQt5mlniCnCYNUo0=
Received: from DS7PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:3b5::35)
 by CH4PR10MB8026.namprd10.prod.outlook.com (2603:10b6:610:243::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Thu, 6 Aug
 2026 20:21:07 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::49) by DS7PR03CA0060.outlook.office365.com
 (2603:10b6:5:3b5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 20:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 20:21:07 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 15:21:06 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 15:21:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 15:21:06 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676KL65h3935192;
	Thu, 6 Aug 2026 15:21:06 -0500
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
Subject: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add non-removable flag for eMMC
Date: Thu, 6 Aug 2026 15:21:06 -0500
Message-ID: <20260806202106.671328-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CH4PR10MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 146d0d1d-d694-4164-279b-08def3f83f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: USNDmBFOxx9kRm4AEKxZO5AwDU0w+58c42clr1mGDXDYTfscQ3ks1OLFsMTkEwHGsi57iC8erEgdEPoLd/DgnN1KLoMDzuXmPA/wef5YC4ViviuFvzxmDyb5bdS3sgxuQar11vbDqzbLsijHXod5LFOYzd9PWsSwTzUijpbwxW0kzuh5aDSMXy4+cEmBrGM5Yvkcpm/QGGIoJ+hw7gSG2rkHDR1KSVoXlHlNot1Gw7KZGj24wphiBspoP3PCqh8d5XoUuDw8K5cdlbdfDuKSXdDohJnQ1Epi3XgisO4JYDLRilVLX+VwsO9sILReMwVVCn7ozaEwYe9qZRjPpl5H7ChubdmxVCNSHFe/RVo58Ns/2bQa2L6sYh8JZtlir1CgIqYdZSnxeD6WYek6IeKgfxBxlkDzs2BMBaUkXg3nhMP27CMx83m34xXzZMIfK694D7J5xsgd1NjrDLFjB25BDyu2bZU0pnog8KsV+zOeGEdDXVOD6S8ZASFPesneUKTmerSmhaeOVoC8L2GcNr87SjfIbC9DNqlg7C1Oreg5Z6VLUgUme/9RZ7wB07HKdxXgl6Z2mmm7woH1wwX5CGoYshXvJq5owgYO4fq7WUXVEzZy8BXcX0hmFPQxKpDu/08U0mvtyA5RMKiCZcPkd8G/y+VprWjZi6v8rVVDMEarYNcvVNWJiKTapyJfo8BMfL0noUMRHyLJxu8AoTThdyj8iQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AnsUp44FjfmHC7oYXzl9ytayGqSvVYNqiCZaWTWJX8/9dViWghBiF/XSTMtmhdLcJLJ1CqfdlS3EoN+jJ7K+vWli0B/e4Dq9uL+4F4rkCedz1oMsAn6k1wfOq5DRx8BNALSeyQU3UbsLbIrrYaqGtpwmEORqszMigYkYKWVuLvk6H151nsOhUCdLQ7oPwdnNR11kBnjAS0VdC5jHLh3PjC/xGbQvM9NZ9nMEQj8gTOX9upHU+ibhHhXiAvUZL7dkeBSArMUHIdIpd29srtzm02vxIvf0mvq6JEtYo73XrUSJC07+EiVAP2x5FUJaFQdxXFuxWLZGlMF9WmH+Hd7xD2qa5wbj2xGw3qoRL9l5OsbRSaXuzTinK07SCzztYj2k3dDbuDL6TAB4ir1gzQQuq1a93eCC6VCyFjGJab1scCCae2rOwQQ9tbN2Gv0+y5J5
X-Exchange-RoutingPolicyChecked: bUOgc4jBQROONofnonOHn0sr1LzKtYZlyO8n2vO0uxju27cfsrW4aNEio2FPCh3Nf4/+aUNz5WxWhcN/tcf3nvLNrRA6HXC+Xja5PdcUXVzxh7YdIRQpV82UbzbIQf73+5FFZioLJuE735YIN2TmbqfO2pxZVF7xapiU39Ia31iOvZqchptXNaQxD96n2d7Wq8fP64TzhuqkbB1h+QupHpMqiLorYshdqVpaHJaDLvmXezuVJASdDhYQRQ6O4dLdKcImWXCkuzIrBZEg9TuFS3heTi4I5vaE3cYAFXYzfoqKZAGTEglcx09b90QlU7hyR/OQhCThYepaUYslEBUlgw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:21:07.3225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146d0d1d-d694-4164-279b-08def3f83f64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE1OCBTYWx0ZWRfX6QNOyMlpz4vg
 3gyMiNfrHHDT9jXxu2HYq0xl4nq1TGk5oCm3brGc942VR0AyZBNHizb1oVfDHTe9X647mTX9Ewv
 2fZGbKJcSs8I8XIflkmquaMwSSDG3+Yt34SGFwQ+NcEUCwi1OA2o6DIKU6ZHb5YnJDZ2itWS4U5
 EBDw5CPnsBn5iDyoXlN8hPqX+a1NDx4eA93/AyxSihHM9gePg/ldZ7rSzqAxQW3vGeFY5AxvZMd
 0CImFICdoLxUyCI5WiG4VYPKFcGI5WXXy1UFdEBo108u89Eg543dxnESz/yCEe0Bq3O38O2BOzs
 +IhDV4g+t8QG1X08a/sa1a14DoFAy4pivuROi2gVsGGfzGH36PexpSz/UUPpBj2YflKJGLH3h+g
 tr6flWoJLRLif1M+59BbWspE6HIB4b55pjzRw+Xf7sq1xAFC8GzQShMECTbFE+pQwQNGlrAT8c2
 qgqosMrT8udt1F3CW9A==
X-Proofpoint-ORIG-GUID: UrumdemOo4tUhvqTKZgkaS70Y_Ev_a4w
X-Proofpoint-GUID: UrumdemOo4tUhvqTKZgkaS70Y_Ev_a4w
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a74ecb6 cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=kmX2IPWXSwEZUPUYmQgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE1OCBTYWx0ZWRfX/9b4WoguwIXr
 nP4iOmgGEHA9hy+JMX36GlX/hmqleyooETpQGmnKJut9HG2fxOQDjCvTi358HxvzHZjmlJwXlPt
 8iu5WKLq1+21YepdHCGp6nydcg/Fpd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_132113_016522_A0334551 
X-CRM114-Status: UNSURE (   9.07  )
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

eMMC is soldered on to AM625 SK and AM625 SIP SK boards, add non-removable
flag to prevent kernel from attempting hot-plug detection.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 9c83626826453..a5922bd746d86 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -198,6 +198,7 @@ exp1: gpio@22 {
 
 &sdhci0 {
 	bootph-all;
+	non-removable;
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-- 
2.54.0


