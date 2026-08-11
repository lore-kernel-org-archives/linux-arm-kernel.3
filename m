Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C64CC5B569
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85uvlcA1PnOs6wl0AfVxrBBmgA1OothwU8Qpmlm5Fa8=; b=Kyo2658cuq7Hj0f2Gx3gAzZ55X
	h7H7tEH51iOpyNL1DgpP182B4kYGGYRnw+AfE3U+DVQMZSHDE3+Zp0PZDCbhXFRTfJ/GIbIby3nJ7
	u1E0/jC1cb5yi0N2MuPCyPCgH2jzsjukVljR+mxIYPly43BMVKCz3OfA+CHBtrzH1RYLP9V3eah+O
	WKhd7wU9VsCz0dW5lYawHmcO6jmjCqNC9SZ2wZW0BNwKRvEJY4eqSU72k8LT355ELFRR+YJzn8q+/
	Eksz/U2eFUaZMko+xTcehtRt+z2VHB9ELivQnfCUfZpRdnD9L1TOBsKfrwgmhD7a9z274GEWvSLF3
	/GFjH/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfh6-0000000DO4u-2zdc;
	Tue, 11 Aug 2026 06:10:36 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfh1-0000000DO37-1R1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:10:35 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B58aws027801;
	Tue, 11 Aug 2026 01:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=85uvlcA1PnOs6wl0AfVxrBBmgA1OothwU8Qpmlm5F
	a8=; b=qdV8EM8ICZq148SRVTq7JYVraD02rPGNASh5+1t55E7dMIdSNGnrXnNyC
	EvA0gnnLS/Rm9sNyJlA/TB2tTpzERkyE0GuBuWrNi81ZceqiO91aocLDb731xd7a
	w7uSCfBMdti3XKuOk2eBp+QSpnHhvYMIFMM2v+c8E0OvLw7ywGmKNAbPnlB/rac1
	saBq3eF3iqGJXw7aEES4oil+Cl7je4wrU1zuavZxlA90jVGoEVdQyGW5ceu5AMpN
	IcJusJFEq8urQA/EciYmqdEEsYHaA3qWHa50fcPsPp6BYRzOQUgrrtlR1qk3OFfV
	Ydvv5DRN3W6bsyYkSfoMTp+p2tP3Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fyk0pm485-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 01:10:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwNp93kI9Vw1zqsm/NoHOH1+83YxlKNCIGmEkGsYqG6+shTq0LHjl/I/GBX/wl1XZuMrzEC0MhAvsFFrNmTIYiLYJ1360ofJUQoeXrpBkFM/W1H5cjOobQa+njORcJrcbg4Ot1KCYgIxB/UOeL66N9rL5A0fZzSVrV1zOwJH/ZzQiu0XiXgVStZzdLYYEMPMnbqjEdMaq/TW0S+G00pqvHGVMshyA0FBhIvAEg0W49OH+0CSO0QRcdO8pbRTAONsDwudXiMoQjafVANygy8JUbYDX7VZKCgvlSJiRClAQZUXv5KdoUAoJ76rVsrydLfv6oyAjACO4rHalz7eJSY+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85uvlcA1PnOs6wl0AfVxrBBmgA1OothwU8Qpmlm5Fa8=;
 b=MFaa3gkJ+cf4xbNsIwnbk4fItS4p4rJessuePt3jco6RMvEILvbY89IKVOPdQF5lCxatFrgmVg/hJkRwk45CfAs1hdC1VlQru3Rl41AdHzcvN81gJKuDZeVvZPcdgXd2vytdBeS8MTUL4bNSqEvOQXcXfsEIuGbVXsgH5TgsXgm/wrpp+E5yg4M0NNGlSVVi1arn//GxVPQ4I0Ght8iUDQzq75UWqwK13iHdyg74i0h3ZhgZJeeuStQ8Fn3j4z3CpqusRWMaRWhBwFPleUzDCFJW+OzlrHxrCqJA9VjWqT3xz5nn5+Ma23QCO85+PLJNPljmUQnYxgoKm2jxld8RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85uvlcA1PnOs6wl0AfVxrBBmgA1OothwU8Qpmlm5Fa8=;
 b=TBZQT2Ni0R/dzURtDmVKtWwyu4cGi12vB/bgFURg6svvsI0xF8T/0tQFfpUrIaIUFuvHQyEzM7GO+LtGDBs7XR4gLbWGvO52Gcm+O/kVHAQbYxFn7J6U17lt/bPadVfGjy+ltYyApXJhWRV7gvrpAww62C5bH+/R429shbTgSNY=
Received: from DM6PR02CA0143.namprd02.prod.outlook.com (2603:10b6:5:332::10)
 by LV8PR10MB7800.namprd10.prod.outlook.com (2603:10b6:408:1f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:10:26 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::34) by DM6PR02CA0143.outlook.office365.com
 (2603:10b6:5:332::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 06:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 06:10:25 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:25 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 01:10:25 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B6AHI4580944;
	Tue, 11 Aug 2026 01:10:21 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62a7-sk: Add ethernet alias
Date: Tue, 11 Aug 2026 11:43:40 +0530
Message-ID: <20260811061351.2538688-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260811061351.2538688-1-s-vadapalli@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV8PR10MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f838454-8348-44eb-6cc1-08def76f3c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: y5jvhzBOgsfKfOclHIGy48xBWb7MtzjSlUg3GM82KDaQ4o0lBtvZxZtQj0UBKdFyLWl4Q5cEn4o+RGMx2FbfkhjHxZgaZDfQInujmt6ZZ8yaV5wNNpxWv5zLoG9CmaYiRtKcL5dsR7+mP4ZrMcgVrgRqyHg+cQOnZvC4KRtgGYzNUe815ch5ibk2YEvAdAefdQCja5aqH22U8EYJNoi+I+QkAhhSQ2dZNvheoVEHhUMgW8dszJInHO1KYOwzPt8/Ce+EubCVfcYKfvoV/19qkEgmEfly2RN/IzvhNiGNFioqYqCEnc2ZXS3x+rt0IMrx4o1OZ4P5fx8zD3gibfcBGUJHVO4dc3uM5/WB/7Dx9zjdYXR28vcJ3vCzpfvyqM8EYk5UeyikKq2GW9p0CJpm2gOl/pqKT1Kw9ni36cd34n9wGhVqzNh166M+42i1Re3+pGsB6fcYlQHeMT4odwPkS6IHe/zu7NB5Y51ag+Bl/Ah27IeL17fP+Al+P+Fa5pXWxW4UTmsNaTX1C4bOIQtHEpbsNy4/yVvtedeoq/9/I6EGGVXJZgWfO67zBpx6mqMqaqt66cUEBX2p4zXZl2JJBFc7gmCCkJm2fmyTV/0rQsM7NVIWQSgxDPazO+huqLSyHQ9aNVEzRZFYNxdNMiahYMSsHCSkdMSDIFVM0BGE7IRagEuBTvYdy4KNXoGfw9pekfDCeZnd79lc2rmtwe7MDQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t6KRkPT3xZdjJskHeyL5iZNHLo8x68HdOvTaJZFSwYMzXP6FiuyrEMkHW4+3EMqsdm5ECtjdUeXs8A9oQjmYmtozmBm3+KSWVXmE2sqa5x8nfZFcRpy4iIaHB1uYV8d5D7XdbnoGce1E7lW3IPRKmVFhvHt9hY9ROKP5X66IwwkKDvRb1Z6s9vuO6vgnhEwjSKFRfNxQCOGt/tAdgLYnBbvc+BC5cvAG2XB6xM4p4ZuTJD/fFR5PzbQIMNrQxoPiyA+mRG8SGRWqJu6bT5V2WwyNAT1iI9sQX1Lgzw7dN3W1F25BZm+dv9MDc7FrCVhZwzwYbMisRfWyP4xdLdZGiRttus1XNzZCnLGyH+gaaxpmTh4bwR7WQrgnm7yr4dr4ogy3PWUp5hFDNg/ESm2Z6+GgnSnDT0A8NgcQwoyoj2A8uC0OiA+xS9Cj1UR7STBc
X-Exchange-RoutingPolicyChecked: FPTnd8HLF9NdGIjjTfL23TBt3AzbJshqlM0vbWObovorZ1KVBjNafyNPXOWSNbYEc+6R3mcqj/SZfE4iE05DqAqAcHte1BQGavkVmejetJNib8Z/gG7xRZsAKWBEC2GzLN2vK1YOFyQ591fKSfd0QPKLeJ/pRkWOmScQPlNjbKsCoFxBm2Pu/QCCEdsBH1fQ17u7mDIXfYvcj+teJ5r3fb3sg4LuLUYf7fV52OKxckr3bC6Ou8g+PJKROaQrKpZm9azFFTrTMOk6oOGFM69eyhDZrTZ7uAOJ1SxCFieob4RTAlhomi9xEz1+gk9rObHObTwWaI4MX2wzBTu5YwuTlQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:10:25.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f838454-8348-44eb-6cc1-08def76f3c40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7800
X-Proofpoint-GUID: TbWMdIlhvR77uC1izzlHJ-29FLzapwdd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX/PUSZd+4i+aL
 SJ3/YVtROSou7A2qORLP1MstVoFBb0rbRdeI3YBwlNcx+wkw/N9y6NNTKQAtcyacm/mtJ6CHgml
 1IoA4BKkipk/BQ80amnra/7gfgjXMFQ=
X-Proofpoint-ORIG-GUID: TbWMdIlhvR77uC1izzlHJ-29FLzapwdd
X-Authority-Analysis: v=2.4 cv=MLhQXsZl c=1 sm=1 tr=0 ts=6a7abcd4 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=R1RnWXuzQcguIhTFKrgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX1EyQsK8z7nC8
 GhYkYHPcT7kW6DnlBlgArOSR8tHvwOq8SgV17+eMUBu9Eb0CXCBAF7VLepZiOWdEFW7tzxx2lIC
 RzVNG+9DvJSeNFirNWay3oMMYi7Su9u06Jwp9GqbuCVbRcTI0ROPjJV1GKD/RNYReBm/Mtow0I+
 8sq4JOI0o2Nq9gNqZTFS+ZXRv3fOBrNGZWXOI8KiQo4HdQkuYpK+AlGADxhtuY7xDZDB+CrlpOn
 Xpam1mPdijBuoz/RTxelbgXU7xce+AwYnXoR0i9Jg+QBlIe2dKWrCAmo1vpEJeUfcM8l9z0IeUc
 XxaINZPlUCEAZp/ywKLaPLt+SP7wLsVMLeb14IelReyXUBDhKvb541HFP6CY6EfNJA9LGgFJQ0o
 GgMjaZjoq/5OHAjitvV6o83awUohZEq0+kA7kT7wYQfO1sDJ2ClbBroA3hltedK7NzD8ViIQGlW
 KvY9e3UmPz5zAOr/SHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231031_516349_526B37EA 
X-CRM114-Status: GOOD (  10.96  )
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

Add the 'ethernet0' alias for the Ethernet interface corresponding to the
CPSW3G instance of the CPSW Ethernet Switch on the AM62A7 Starter Kit.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..cc07c4b3afa7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -25,6 +25,7 @@ aliases {
 		mmc1 = &sdhci1;
 		rtc0 = &wkup_rtc0;
 		rtc1 = &tps659312;
+		ethernet0 = &cpsw_port1;
 	};
 
 	chosen {
-- 
2.51.1


