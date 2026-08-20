Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E662EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ3BIMyY1xyE2QVcEU4vcCsz/Mhx2FfakQaVmADvrZU=; b=wDorGULHBioUU1eqGSQYD2KDcs
	nRzBOKeHHcYAlQ98AwYNh9BczsOMLfHV+M2zzGf0A0r/St3mAemFeOTW1hpbHUR0WtodDhu3w9U4w
	dT46YNF+PjvQj2K+5Rmgh9/ip4o86xeXMBZHguelS7ydxNGViPwRt/noa5KGv4KCqOX9565jtwjpM
	vnTt2xazLVXnWbRNW6zZasJDMhd9rLJprf2+liHcMsAodV6JrOYR8zjYAXacObLswqZY01M2EyFP7
	aBE0zax1oTFGLYdLWqxNsMld9wfwurUM2IPIHR5GojAMMYrTzAiazplMGQLF2CPIcMOepY6gJMyxB
	wjLOMJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8S3-0000000C7Eg-0yIL;
	Thu, 20 Aug 2026 19:29:23 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8S0-0000000C7Dz-3Qzv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:29:22 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIKTRx1335977;
	Thu, 20 Aug 2026 14:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BQ3BIMyY1xyE2QVcEU4vcCsz/Mhx2FfakQaVmADvr
	ZU=; b=kOhHNSijB7gQKwNbVb00sr7hV32OHsaxEQprku3Q95sYuRqoMscwQOfjx
	JoTxUNx7PaFFi4Tuks37/MwuWTTzsA+93s5y2quNXndfSBZbFARPGSpb4krB/Wg0
	5eMJevR226Ti7zaS3mL7f2yoiYCp76KRFDkf2kMiCZ3rYsR+QhDXDztBjlPhYDBX
	vLLb9Vxfp0jSmoZkOv1ev72oXBLABBrLro6oPq93Mq0VMXSNvBDwjIvNZfmnMvec
	zL4AHLhtkUHyn7psPYn8zpZJHludZmhNka9k+k0qBFcExZDTeeOyb50u7LCGfv9Q
	/qybFLqTp5tcFFEi8ARx2mLePMxoQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkduew-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:29:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ09cA3nBQY1ve5/gxqlP/gN3FxTLFBpqY0QjiKUVsy7XIPvsawoCrI9G3dRyLcaIFzJ+uk29ujzmkTqIoTmVYwX9zzLvQyzT5v8OtKSphP7Ma6YREcsckXlrSm6JlLolhPoft+mSmDHjovxgt8Ebqj+9E6viku591q6M+71PSXj+JvbLAQ+9UiUgNsQ36l8TuEPiFqdhDcfMEpXk8q0bKh7VbL3fDi7lBtnXVOEd8HCFSMcIP4UxoigmuEv26zdbFrICZje0kWXhD4rGGzHFYEESTe4kbszMwLwFefTVmZl8BNLnjlqgGrCvdFqCZZGsbA1XB2apCIsxIm5Rn5Psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ3BIMyY1xyE2QVcEU4vcCsz/Mhx2FfakQaVmADvrZU=;
 b=Giqkxkw7RkmIOLUMZNgYwUj+31d0YdfEDCvHebCpmhAD1jfnT0sYL43TT4czVfZl9uME/U7mitd1NMc6MkHLbuxEW1wXupLQv2nnlBS8eeIf44SXEHBswJ1eqD7uRFtuRU8f3ZaLQaYCfRWS54+jQ2jw+fF3DSW8Rhq5thw4TCV96ng6XuGx2q6pW5F0IHMiwYH5ZdHcG91W6Zg+d+2CV0uuoHIpJRgal9854FrND46NvB/gnj1aszoGqR2TOBtyDn2DcqA0VcnO3o3uIYt8OuiphvJLyNXrs9xE6y4MQOIzhd7bXz8xLVHExw0b5v1TIpNbDMC/mBnfY3cKFJ1PDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ3BIMyY1xyE2QVcEU4vcCsz/Mhx2FfakQaVmADvrZU=;
 b=o30OunQNHbEVogiQDcTaTcI+bXbJ+IOH9RvdG1/Ay5kl+Bh/pUd/HkrL9kjgY2kpOW/9y6nLoaNwd2w89pf2e8Mpjb6dAI0hltbrTxOXNhzXI8iTja0xzEEaDzFW9fz/LEBUTTBqVsUAsXMmkfR5+gYRa56ohO4F+P3g21rL8fQ=
Received: from SJ0PR13CA0094.namprd13.prod.outlook.com (2603:10b6:a03:2c5::9)
 by SJ1PR10MB5979.namprd10.prod.outlook.com (2603:10b6:a03:45e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 19:29:12 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::15) by SJ0PR13CA0094.outlook.office365.com
 (2603:10b6:a03:2c5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 19:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:29:09 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:28:51 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJSpvF1779937;
	Thu, 20 Aug 2026 14:28:51 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 14:28:44 -0500
Subject: [PATCH 1/3] arm64: dts: ti: k3-am625: add standby cpu idle state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
In-Reply-To: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787254131; l=1731;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=WHMD4RgFSz4i2IchaPdo11MLwjxERDj2KerMlzCLwi4=;
 b=DyyhDaTk7JmOGiZyWUIAo69BUJHpdMJeA2eMOEHaGhK1qEKSmSqbCsFVzZTdk5Pt16LIjgON5
 ad+95/dZgFmA7iEJkAL21t0oc5GTQpgzyvxGt4yJsA9W06UWQlGSLd3
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SJ1PR10MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: f578bc8a-6b08-48f0-90d9-08defef14efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: F423kzLxDRG+hNr3p8j/Oqy05uDukjI/Jjd52qSh7LfGj/KgB0cMW03SMG+pHSWFKgc6T6pqmEeJZNv6HLDaZahHeHraD+IhKvkXBL2Yeb3f81ry2Axt9n+1cyam5XtkqGqi7Q28mXI40h/buBOUm/RRZunA1qlrEcUaaoSwYJrcBlXODVlVFSfly2WWV8lvHq1MeZHjpc2kwQDO/kZ2IPdUrC6L0x2dRsK5KJP9sSr3L3bkwSBXQcLixKLPmxzlSHp5ER4BmkV0QQ+Tm9b/GtSR2aeSXbNbcx7uczqprNdL0feFM7EGv6yThjvQ8K09YkxqImxH3y6azvWSnxMAxn6duoV5OU1lqjEkDH8xG+bhlwAWMDaVjjWWj8/ikU4E/59MZheq3hgRiqcFBTmFiiN/N76HNlI4E4fQuEnhHEvbBEoaJqcHmAGUv/dh8G4KKzCuT1fFV3j49m5qeTS5ZEL33w6bp+bp4zaIf+guFg83i0VLEUJeLyXE1kVDhQm42bxUi1AYhLqRjjg82Xqef59x8heA7jtqq+j4yw+EXfKKZuWxdBA1EUGEwJqWBlX/lPpDo4re1PU0aSMTejSt/bnJ8LukHwJoigq+01Nk89eLvcEpT901UnS4I4xatgsWgRBu3cbi7I6U0BAaUtugRqrT5wJvkroEswCo+W5OBpsdzQHl+m6pcm6cPQxmgSX9EXK+3fbv59dtCKSY+zBiqQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hpkOMjhQ8XlFmQ63yb/gYyLmfKbYUuM7RSt9+ev262wOMMCwxLKxh1PsgRXjQR/ngJD2+of4R5usCOS+iKtOhRuhaE0qKEJi9EKGjwyMy2PxdXJOYcWEZ8reMWkOUEgBuqRixzT7atIlYUm2FgeKF4UlvQuFeY7eFU8yfI7KfKsTMwLTLa7B3LhChLO+6gG6HxEHUbZ0r0dDirVS3OnjSvPqh0crbzK+FCweh4iCvOZfGdFEecg15Y1QYSIU+7gPf8MTfUbcxAnh+S0WnjT9stfWbwLkhCzUCvWOWNQ0BCA/60vas3TGNNPEvX4f0fZGySf0loq7Q/sszZdCyUuBvQY83l8/Xi6IhO9TCVrVXKbfL53YrqznCHoNuQlpqKKZ6JM8bNc2h/dwIaebOqEOBBQ6Th7++bRmPmMtKcZysb/CmSuYrdPSQ/ETBijgCisz
X-Exchange-RoutingPolicyChecked: EbORQ6wJStFHLhfV9CL374z2bLWAJycwhEYGdkEk2Tzr+1+oRTrZqEeyyQFhGrLrkfpopvgPUvW7qEi9e/LFJTKThVAZg2MfTmEQjKgqOByGzHUYVfrm+zs7EXS47d2c33J+bHGLXqV3w+VNeHe9NUMWhUs0k4uhE8ikrqkg4CbJf0gV4pQkdpS9T1/EHs7dc1sIZYdMjy6UGmxI6H3aFT6hXMDP1qC8w2WVdK/SFosi2IhkZZMAczGb7a/pkaawOaJ9tk45vARxjvKWprFhIHzYOnWOVlfF471pvBsD0+WYq9FlddtUtAQzD3NrxVBEGQ7BfSFvo5x4EGjhcRKAow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:29:09.7704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f578bc8a-6b08-48f0-90d9-08defef14efc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5979
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfXzS3D3/qx0VjL
 PRTKhY4Czut45LL/WxrtUdv+3gLijlD4jjAOSL4MvApXp5hDlF2Oq8ATIQBYpDT6odZA4+7vPS3
 uESl0VhUldtgQVKe7dpeiRRnXwygzsIeBxVA0adpmTMgeulOWiKVvhwC9b6CGnBNxqeH7DPfLFd
 AOhNe6S0qMAzj4qtYHjLOfhdR+z5FF8KhgB5UOaiAilbQ+pER+X7Ff7c2orqFKldhbWasEW0b3P
 FUQI50ZmbPAkYxd3moloDgaVlrpNXInWpDjz9lCGXXTAdVbWsjC4CTgOeLAsUyjqkjtUlPH4JX2
 pYkNSiXWm533r4WGCoGDqNfg9B6QtXKawp3FWYld/GOEuDvCs9L4A6NtxMHCuEnuIiajQ0m2Wir
 hpiZPgP2vDzTI95FcO0YrPRJxDrsrAKCfD/XNU+mX2IVNVoi2WxWuch/Jmc3PxKtFvawN6CHzcG
 r7oHuLESzRhGJ0LXfVQ==
X-Proofpoint-GUID: B4RqdX1JMq9_injCP4m13PHYyKDpWec7
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a87558e cx=c_pps
 a=OmH7RzXgq2BZ7BLjxN5ZDg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=WyU4J2K2-ejNuzxdJsgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: B4RqdX1JMq9_injCP4m13PHYyKDpWec7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfXw289a3uns766
 oWkXNPKjjcI9ILXaUIeF3aD4lAP4J5p54sVOA48HaR1/jNSlHyAQp1fsfLYJUhOMfk+wEYC9s1k
 bY+IS96jh2A3WHgkXHSLUSvtIYDcbow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_122920_979895_875A72B1 
X-CRM114-Status: GOOD (  10.26  )
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

Allow the A53 cores to enter standby mode on the AM62x SoC.
The standby idle state enables the CPU cores to enter WFI through the
CPUIdle framework.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625.dtsi b/arch/arm64/boot/dts/ti/k3-am625.dtsi
index c249883a8a8d846aa21092c4c341fd443cfcec15..7ba339d5875926717896fc92fb2fa6d2b8d0026a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625.dtsi
@@ -51,6 +51,7 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu1: cpu@1 {
@@ -68,6 +69,7 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu2: cpu@2 {
@@ -85,6 +87,7 @@ cpu2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +105,20 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
+		};
+
+		cpu_idle_states: idle-states {
+			entry-method = "psci";
+
+			CPU_STANDBY: cpu-standby {
+				compatible = "arm,idle-state";
+				entry-latency-us = <100>;
+				exit-latency-us = <50>;
+				idle-state-name = "standby";
+				min-residency-us = <500>;
+				arm,psci-suspend-param = <0x00000001>;
+			};
 		};
 	};
 

-- 
2.34.1


