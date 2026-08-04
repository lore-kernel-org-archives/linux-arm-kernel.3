Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E51BC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzbqHx5pUr7Us92HsCm0hkte77PMwqUoJXZiYqqaVP4=; b=Hw23qIj1zVp4jBfEcVzaTTqN8f
	fAQ6sb4zvIbWyFlGFhppBzRW8ogwy1U/j21jihCa8KL5hcGhIF8GG1z2KE8RqkdBoZqrjBRjim1ZY
	nE24MnQmSIKAEgdSB23p8z9FOUstNO4CNTFAiBoNvRxzyK1lOJyZ4YsfEpnjVdFGo8c7gYcRjMIZs
	tcdVBvOxT3By/eFXR7+AIh/rupLZFVyIyV7rnPA4d+XNKjPAYPGBrEgoUyqazE8zjGbokjfLsZEkw
	ysIJf1G1sA5gGhq5Xfzk5rmygMyOklWnHTIeqqh8MpgP6ljg8LhCCcOmrtDZxra7tyweRyw4ND6bs
	DtQBwNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7MD-000000011EQ-3ktr;
	Tue, 04 Aug 2026 05:06:29 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7MB-000000011E5-1kIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:06:28 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674190o31209132;
	Tue, 4 Aug 2026 00:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pzbqHx5pUr7Us92HsCm0hkte77PMwqUoJXZiYqqaV
	P4=; b=hAAplfyN5cc95S1ukZAeVOwGJRYXB4R9tgFDD5Y1Kk7Aqi+IyPldsagGz
	ygAeYk8r2os5XQtDQeZWC0hU7xAEGWS2MU85iA/z8Xl5ce1bxz5N8eCCCrEH6pn8
	mQ+6I5nUa4NN7xokRoTxewXXdofkC1oTNwjRDWhSxzAYGPtDn6WeJrqeJJGKp2zh
	5bXfY7fe74YRutrAQQcgtIAm06nW2rYO3ByLlEX4woAuOxDiYrIvDQqXotFA/lTW
	CQ0nDKcUk9YvUMQz5exYxew/kqKHlBCkN9OdP9LxPn3Gro0dUJ8rlzJ2JuSfF0Yr
	MIudNbH9QxKXZ1FpNskILpgB0mFaw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpqmyf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:06:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uI9fv4YJPY6LpjBl3H9VPWTKwq2idmOmrmBJGYSu/3T/yfljf2BP3juGVrVo8zV9DJmkqE7K9nlYjXl0nBoNKjQVqaKQLRk4yAkPwWQKEedv4xFGi5iH5lBBs0RXDxlcNoaW4gWWbFyqvjjXsPY4XRvxrSWjxt7pl89hsXgz8v2vX5tuEmN79Tm2IJcwMgi7ks/svf2y2PdbRPO8/Ij6VpXThdnTvpW0MG+8q62Jl6FNAdN9VCv4BZgaKs4zYfwpGlRS7MstAP5lUxjy4rVr152Jlng3DDSBE+jrkfwhj0/3leGSYokU1FAWldaaDwO71c+wJIxpk+MASvy65OEFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzbqHx5pUr7Us92HsCm0hkte77PMwqUoJXZiYqqaVP4=;
 b=KJVSowglJxygaZlgZLrF1LSWkjI/6nmLL8btjMZNKu2/U+DgMRZAlcuLL3KmshLnzGb3FMRpE2HrWf5mmPl67oiXuVgJVGhdC7RXxuDZPufDmJlg8qId7Sypabq7VygYRyUX9AJbQ/O9mnn8PcbI6FI9d1KtAB8wsihCmLv1xG/SHfb2FtFZXu0ymJ6BFB6aeZK3Y3VD2r1l5fR4CG1uFLbu0WUFvLIFHc2XJJVDfNW+7CYri4dz9H5h3uTiINsFtnditTjhX6F54gsak3/jKztGQjZTXEVOnnmMoYZtT8V+gcwk/WjIim9nVHEwEjG6IsbSLF6OsWz1+6NzIYrrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzbqHx5pUr7Us92HsCm0hkte77PMwqUoJXZiYqqaVP4=;
 b=pBRntB1vyvu2XmQ0Q4QpSvvmTyxCeQsmf2v5vVD+osYO6ogUB1fKnR1VoNQC279tjPn0SFRLmguh8q5B9sKpY8gaeO5rAJ3I0JxGiiVuouc+kG+CJyC/9ObXA4W4COK6rMZCI74l07fPMfLYil+wnz+DTgxVdS5ver+Dzkv4AvY=
Received: from CH0PR03CA0072.namprd03.prod.outlook.com (2603:10b6:610:cc::17)
 by DS0PR10MB998083.namprd10.prod.outlook.com (2603:10b6:8:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 05:06:19 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::6) by CH0PR03CA0072.outlook.office365.com
 (2603:10b6:610:cc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 05:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Tue, 4 Aug 2026 05:06:18 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:06:14 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:06:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:06:14 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674569VJ3780890;
	Tue, 4 Aug 2026 00:06:10 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "David Lechner (TI)" <dlechner@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO improvements
Date: Tue, 4 Aug 2026 10:36:07 +0530
Message-ID: <178581994386.4186382.17476748801821401439.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|DS0PR10MB998083:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5170c8-ae96-4018-d74e-08def1e61e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|18002099003|22082099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 9W4/ZXWb/TjneKiQPxI/EWHLvl2JyeoTni4Mwvju48f+qHGuaKRabADlGoff7o+yQ9poEO/KWStu3cH61uZo73dp1IvGrikw1kkVNiu8zb4Wtf8w+kQiZ1HTI/PMxik2QAE1c1d9g38v6v6RigSeT9H2pNB9GtP74oU6FNoorISkJVajJZvtqz6Kn/ZnWofzryuHPoQdgPu/OYAXhkyVb4n9ppoKLSTXBCUSnYZu1UScYo6d2k3iAzciFqJ1QOqWGYBGx/c6iG3GwD7kY9JrZhnFIRs3tNt6/uIwvWN/NlSM28VI/nOtPsiWmB25LQJKCFp3T4mV1x/sEbSz2eJXWvzT45AIi0CtkEz39cC+hgHV3IO2Qg93k67K5KduUDvuTI2uAzMb9JMzridlKvIAWz5vbzewlXgv2E235EewDgcd4m9WnCp1DdpRj4O3i/zo5f7Y19ZzCEp7FN9wLVHT35BhQ3vodMU4HYHQCR5NyAMfyI3AcNhjwKMckRlhMBPtQoLN+Bzn3ehD5WnGe+CfXiIdt3PtgRbL3DogQx6+JvyEiGL4TegkG4yCp4AvhX0bZm5Y1Zs627Ub9bbB1XyuT96pVtuoJbu7QufKNkeGHFsN9GhAxS6FuONYhaFxFaHOsdQG+Ea63u4hSTmaJb4X98uVmJKGAm9NW3UbyV/ElAA=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZeQXpS5VRw1ZUAfcp9PjxK5NQ4AHWLmjcwSpJVba+KBLP32xvhtSVEZ3ywFlkwzQSNAQ7v70uJrdKVq9/9umoDF3u9W+mzfph4KfU/NFUSCZVs6X4M4TCxbdiAhklxrVgGBCscz8eY4o2PwVbZzuScgrJns0ZilLffwfZ9r3P9s3O1Szaa4q9gL23QxqO58azHuzKMtgmzp4i03GNZptaFUmzjTWu7FQpB8tdBjotYGeDvVixNlm8VF5gWXif90ifVMtq0QNbMVH42MXJUwZVfRQWgeARNy4qUTd+tjoA0v1j6GsLBXwhgnXb6TpYCpOSFLgrFLn0UddYTTIfJdbmvE8xIcXWaTRC3tCKMQ/M6QGsp0u2bmITOYxlULuw9/8j1h2XExrXO4RbLaStY+gFAF7IT76vs4WG04tlRYVDT4M6/1qIYpe95sSAelddRyr
X-Exchange-RoutingPolicyChecked: i019EGSH7OXeuw+0BUI1DpjiijT4pM8tqyNYDA3PzrHHT3GL9IdmpqPXD+NJEFnNJEz26JsKaIsA8MO0WIxxwD31owfNhYCg2lErAijxopzNYejrgAciCkSkNqTsxAXMNgoWE9kODb/nMmowBaeJhGV2v5Iw+IpN5rSbu6Rkt1Mrv2RKOj6QZ7SiYxSh+ARjbi8YQOjeCoBXIwe3V2O3GvHbsCdwr2Evx/9eUrWyXv6TNL0B+5cjmOSDGBhGEqrn+nFavWUxw9AKTv9m1S9SqEVvxY5b//eF5mBAxknTu00Dh/4gIb5mEeXc7EZWh/MB51fyhmCwirPPghRj32F8Cw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:06:18.7767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5170c8-ae96-4018-d74e-08def1e61e72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB998083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfXwkk1nD3nCsF3
 cwfYDLLqX/8Jy+7CqinOsA07GZth4bSvap/7Pkw4QrYX4Kixq9NFozOf77QiScYLf2zjZEPLxoh
 v7JOty7p22nfiwklOdgKlW2tNfGY46zafOIYA+SYSz+1/sx/1Wwk6Uub81xV+/bz9UzyUZBBgZc
 9QfbOiBgAbVRC29s96YnT3a7cM4FZCrrH9A11fu47KZMo2kh20mkAMGqxP8hXCVmueQT+K+txMs
 30BSGCBJE9Vu5Dgc8BNa8E9nGbnIU7b7hcI1dlW/f4bg/zM/jHyFC5lmI9p0rrXS/n5PVZp6yvV
 R63TBcMgGmSrOwRsL1Kj6hOfHvqhV8qZh+jMK8+SXA2Qkr7Gv/mrVChIpKstRJdC2ae23PiDFTN
 RxjipnuZqNCobrCvWCa2oGubNlT6P4vdhRXYqsOGOc6NCrRSG7lg6850/Hc49FIvTetzkTnzpIi
 ubRWr1sjnDN9kZdaJ0g==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a71734e cx=c_pps
 a=7AIX19wKKSH4vG2a64CeWA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=xVOUUHzFAAAA:8
 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
 a=BFkDlhTjP3qpOTzr41qL:22
X-Proofpoint-ORIG-GUID: w0kWlUxl6YSDVItBQQonFfCnCvVcpYsu
X-Proofpoint-GUID: w0kWlUxl6YSDVItBQQonFfCnCvVcpYsu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfX8ITm7j6S+cIt
 yrpSvPYBXUrzwRyeag444ISRaNIYR3k4zWCoHduu/AtF7IGOBXp34px4pD70AKy5e7Z+pA1cicJ
 Q9e6T/NBhAgof1wnvlk0UJbDIThmbMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_220627_461166_BB4D4A22 
X-CRM114-Status: GOOD (  16.22  )
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

Hi David Lechner (TI),

On Tue, 28 Jul 2026 14:44:35 -0500, David Lechner (TI) wrote:
> This is picking up a few downstream changes from [1] to make GPIOs
> easier to use that I missed when using the BeagleY-AI with a mainline
> kernel.
> 
> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names
      commit: 6c76412dd575b57f54b3d9646503b2e9b2e390df

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


