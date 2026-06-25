Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52C7CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNzuVDAOTwRs8474PYmhanCrEB4JSmP/LXLAaEZQdyg=; b=DZlhjOOzyBin4zutjCsZQXeJuk
	9MCpm+hJv2slHC4wuAcm+8LfaYoC18+eE5mhKeA59+9P5zOusA73JfhEYAwEuyA3Pn0p2OFrazQfq
	X8i00/sXfgHDbeR/Dta43BVulf3Uu09XjpU7/beKHo3nMyrHVHSFV+Ein+nyWobaEpiksoC284VMi
	f22bjhMDUecFP4FGtb9qMmYeD0QWKdQyVEYxhilC7dxw/ttMXqFCWoogNtOeRTBxkyvBUiANKhwuF
	gvFbYO+SAwrlVs2fTp6C58Z9DI0ML/L+kO0cu1OPfG834RAWPNda4+IzoHTkUa1UsJ0nYCSg+OYNC
	gtBaW+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciK3-000000096Kc-0rXf;
	Thu, 25 Jun 2026 11:32:43 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciK1-000000096Jg-0ttd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:32:42 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PANJ7f1093328;
	Thu, 25 Jun 2026 06:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MNzuVDAOTwRs8
	474PYmhanCrEB4JSmP/LXLAaEZQdyg=; b=XptdySUcjyPnon/dQxnkDPrTKYvn9
	o7Q4x8PY46iX64EKJTSUsJne2lqXY6sUkI/2jh/9yydQbW86GaymjLFi/uDllvc6
	x9iVcUzs/mcGwoEvKoBhv2Y0yut0VJCg75L2oxBrIpbgYrbuKEDTccGhS49CdQgP
	DQQO4Crtb9ZHc2f2HuZWrYNnyVK27OuY6EnhqfgInW82FrXatUZ1zsJyKdGJ+4VC
	ZvVnA1HkC+tEBWnsPO29XmFPRndrFsH+AMNCfvx6QGof82US2LnvGI3zoRh4MDNw
	7airNVv8VP6i5610aUV+IgzVBv0JPbNEDGmzc/KpriUtK8UEbb6yFXlow==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013051.outbound.protection.outlook.com [40.107.201.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f12hfra5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 06:32:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCEQWFOfCSWz6rpl2pnpMqedtssG5ljNiUEJ/505P68CwjrRyf1lEG0xnpjHO/fYQPg5W3hVfu0PYdQzZNEpp8lAkwgjhvJt0jqvsT/FmYwVROzrpogJClW4T/GcH8JFYdTqX1aO0/3QvGUsLR+y4lG/2olOQsg5dZqiqc/CXdQqd6wK0xAFDJ/yPxNG804arWNmmO4XXkJP4+5JjohdJE6jf0TAFTMQHva6Y6F8mNTvPMp6bXMnqTWtCtoYVpt33T6+WL2hoZHTSjkMsM7BSTXaEfyepVMaViusQMDORlk7jdv5nmoDYfchMQ5g4Ajzhd23TnZpbVmChrewQ3yX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNzuVDAOTwRs8474PYmhanCrEB4JSmP/LXLAaEZQdyg=;
 b=xLaccluk0LWZDjqoRSVvRKBRT1rDo5ax7V1stlXV6dOuj5iiyoqLnnTC1MHlu3p7LJ7yw58404N/T73Xhkus+kOv5QREKC+OjZUDFJqWhxn1RgXAvJP30FIUt2GTvT1R+3JwJMTPk6HzQbtHgK92LFsZyoegH+e+frQk30WbhGGO2oTUx3cOQlTqlivTgsb+pg0zsUuXKMKYmcON6CZ5s8mvodsrq6UwK5vznQmsks1fABEFxMprl2Lz/fO+NmM/YiEaR0La1swl4nqgk1Wm9QnZ+f3K22LFkmAaDxNWwSuy7XEp1tCqmLvYChLfOOgaaa8jOwZ8cLo457k2TB++fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNzuVDAOTwRs8474PYmhanCrEB4JSmP/LXLAaEZQdyg=;
 b=PfFBshdhrNoXnL2L7A2jm75e9BzWNmu7yFrVnx6fcXP67SluQMDXKw2HPII8QtHH/GVdUUNcBEcahx9QoS9g3iupmfMimK7XlGjay3DtvN79ip1ra3iYwiI2OrsJgkq5W9Vd2mhd7E8IABhkJvCE0q6P+xEYBxVbAX4aWAzB1Ew=
Received: from DS7PR05CA0079.namprd05.prod.outlook.com (2603:10b6:8:57::9) by
 SA1PR10MB7593.namprd10.prod.outlook.com (2603:10b6:806:385::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Thu, 25 Jun 2026 11:32:28 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::89) by DS7PR05CA0079.outlook.office365.com
 (2603:10b6:8:57::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.7 via Frontend Transport; Thu, 25
 Jun 2026 11:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 11:32:27 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 06:32:26 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 06:32:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 06:32:26 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PBWOUZ2630457;
	Thu, 25 Jun 2026 06:32:25 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in cpsw_mac_syscon node
Date: Thu, 25 Jun 2026 17:02:23 +0530
Message-ID: <20260625113223.1711052-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SA1PR10MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa6fd4a-1beb-4dda-06a0-08ded2ad6f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QyPwP+1xiUVxK2Gg6Q7E55ymhWHIebcTI59grs2E27wNXrqkCgBGp+PX66VV+OpF1nEpdE+RdHGirLLCW84cY5rKau7xCw9TVTxYDQhlzNcaamcWIzazkV3SN8oEjIUg7Vwe4lDy8z2nBAGSmA36QtJnnVCHISujSwplQenY5O/5BCS3CVd6KHcxCyLQ9RvxGyT8zqUEk8BnaTHGjQsBadnoQnJwd7zfJgfPdYYat5VLviCBVgXfbwu4ZTuEMCnfcy8nGBTs7NDeZ1qkfP5F7u4Gz5vgRRwDzZjJQaGui/VJFAWZqi4zNMZ62qlBvGHuC8c24UBAa+Rf5NBeauorDyGm7jnJO5prRa8v4PtnQXsHs+GnitDXU4jW6ykHrdt7Mq3ni/RKLow6WVTOoQoY7MB823o9p+PKlHXmncl0rJDREnJvrx6KrwRd0m2MuvwZJZf2EYYNwMkpzR1C2GEYaMas34gRevm++Fo0GGpHVfFzXSyKnU4hl6ykYTVc49R1136aH579zCLVgBXp5/nDtyCWVrdIpbSXyOFGWHL5YHN1H3uSzfsaA2Yyv3JQZUN/nvZxohOyNFm4BKwdcx7+OvkuWWDOUGnBb7ASrhPHIgSn5h145CPEVUIQLEZ2sA0Qpo+NaIXFq+rcWwuIJrkRvjC55i/BcnMgNmxEkglpUzORKDfAIIsc3cKDtTlMA1Cv0QZmnrAtJIdE2dz7zzdAXA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FNIDT4LTNUQUi64KIsQnX3cG0Cijf+86OSO8B5l2AY7T9J2dC0TwQLxkzm/a/i5HHraF5+QK0H0P2XibR8YUB5yM4zF+Uwb+2lsPADxYokmOZORuExcsH3krGsQKoAT19oNbkisyczqBZKTfFagFMhL5jPSrI0b2LssHRU1LPfSdIzNWVhjmZ/nvSh4CXMvu5aFH6z3jVlpl6+tsZn/8icMQv0Ox7M6hy601+jbQ5q2j3EHAaa1SCfcoidSEHW1y3pC0MEO7CjrJZ/7mv14rtux+OsgP4AvjgurEVIfaDJFBiF4gHTEqyoYHT6GxgclOV1F+e6G+wOK6yF6FnHy0pwGMediso+rRAYIE46zDLfso56nSXd96b8AXWO1P0To9hw2Ov3Yu60Z/iZiV6PSpCL4K+R5gSGmD+9VwBD9uCziDxKF84qSY6aCT8wll0Jnk
X-Exchange-RoutingPolicyChecked: mpF67SbgpMyz52n0T5SMrL1qxgXomhT8KoNhnF4at/mvwi9Cg3bHBzQo3m/Sn5VZkLm86yeZ7XQbQOBBg4TFR+rl9ikrKt67YddvDvWd1wARecSluIlyw/iYQFqLTHc+XlODzzbEa2yX6lKDlBOH2ahUMIN2NlP/0AStDrW4ViMynUyNeWSN4LC0vjFs8xd66DAzKhrgJW29TrK2WUEQx7wv3c2JPeYyYwzhbQd2oKVHnB9cNi9sV1K3Irim+IZXx1tKyqF+nBJUUkm+gmHNT1g4NjO0wLpu4B8wgjxUAmbtKGT18hwuAWn0m+eR4uJAU7yXPj5ntcLoQjWVHlPbsQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:32:27.1415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa6fd4a-1beb-4dda-06a0-08ded2ad6f54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7593
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX0Wzh46F8Uxnj
 ctSNw2fh1CvGrnzUlK2YaXKOPCGcqcuuDAl5dQIDPp+k6dBpRfV1Zj6J74qAEmS1K9JOjTsb35W
 GTkjAq/W7Gp1EtxgWpJH2k5+0VCJuZb2icNErhGkfjLSIGFkkhTTf3FejryLCW8sTUPYJXVK9N3
 2zJOhbfr/DARo7HsiL0f3E8BBT4WPyW+KQQ0ZYNXOaZ0qbQaBCowLLvr8SjJG32DRy0+toWp1jo
 kWEcuDrrnBKLOGhA1AcXwVwdxAQquqqdvrcLzX86RZ83ulqWr/fGlBEvMQIFsLilafZLwW8nVy5
 bxN1Ql0IMRPnJ3keiNxWCbTL8MHEMY7E5Y0htP1sMvLxj6uDZXZJSRsBIUJ1KLaJXKQSde6EUM9
 aFwbCeLIQC4VpP79tP1F/WE7ZMB+0yh2UpeWCknj8XIEiC7qqlIwY/Yg6iJG916RaEG/Haxk/zc
 88lIlAmg8zBq7fZQVNg==
X-Authority-Analysis: v=2.4 cv=YeqNIQRf c=1 sm=1 tr=0 ts=6a3d11d0 cx=c_pps
 a=N1HVof6comP8M0nYzgPe2A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=IT7HSp9ZRdQulJQJ_IkA:9
X-Proofpoint-ORIG-GUID: Z4iViQAKHql6CuIQSHEeZsjlgibUecBP
X-Proofpoint-GUID: Z4iViQAKHql6CuIQSHEeZsjlgibUecBP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX4AdGwhoG53Fg
 JuRCrMZTPJWQkvuaAerNtYwWc455E/N0BBwzB8AXnRKdJmxjE/FbswQsLMkwx90DHVOEph5zWMk
 1CxMd3WNja7c/ALahN5W/XSPMZQE58A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_043241_389399_78CAD51D 
X-CRM114-Status: GOOD (  11.08  )
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

Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
Add "bootph-all" property in CPSW MAC's eFuse node "cpsw_mac_syscon" to
enable this node during SPL stage along with later boot stage so that CPSW
port will get static MAC address.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Hello All,

This patch is based on linux-next tagged next-20260623.

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d..d3b3675e7a8f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
 /* WKUP UART0 is used for DM firmware logs */
 &wkup_uart0 {
 	pinctrl-names = "default";
-- 
2.34.1


