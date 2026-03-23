Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750F4D58CD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 05:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjNY22Y/8hNHCZ5VFyIsKgg19S/rx8lZJn565MVKw7Q=; b=ih+CgbkU3sPkO3fSKt3O69SiMr
	VPLZzUexE1bt+aIMu6CCdDV+D8YKM4Cg2UUVRwJrjFv33YGFySzrEiYzy6y1sYYONCt+up+johy4j
	/8lcsU5H14g+evEHXZZzkhNus8DVZ1Wp27+JHbQJlZzXpJJjIMU8pc7Xd6yvyQf8oqrOCKxiqddpx
	vXPcY0xNwqu2IXSpYXBMa0aQkLFEGMEwuiMt4OStd1n2jKujRdPPBqGjTpYB8nX+3pLnr4hd0WWdB
	r/n45bypsubAULsYfMhGHMS3a8VKFO+W4qw4spX9CvwhA1ax52GPzNmR0b4442hwY3P0bC9krR5Rd
	t+/DbtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4XP6-0000000G2cl-3LC7;
	Mon, 23 Mar 2026 05:00:40 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4XP3-0000000G2cO-2PzT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 05:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTP+cqqxc/g1B2KFAEWy4Zier0VLM3z0tLx0+99upvl/+nEtC5e/7ViIqZggojhFhRMucE01nuK51BzPexUICMdTYEEraRNmyJUf1cA8PuEkr7EbOyZICwT1SZCwmvSMrJFNCHxFsKBpFerBxkSpVIZaWQ5YeH6Cpvowwy7872j+wczjcnk7P4ckZ+19nvDiqL3Jmer7bTLbpLpG+rCRi0PNo5u75c2Br0ZIOByfEd8+47ysZOBOliQvSC3Xlny8xLY523+SoWVZoKEAGCpVEASvT7B9Qtc0E1dFQqDNYYsLODOmCUDHC2/PgTuxt9B3nJetNmE9v/JTiIQ1OH1Xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjNY22Y/8hNHCZ5VFyIsKgg19S/rx8lZJn565MVKw7Q=;
 b=RhXP9+uI+tIAq1fTUcHOshVOwP2Dhzd6+O3dUAysX+rfZS2x97I5SG3swEZgX8cYDSKuwNGwxvhFGc1Z7PVtA6Zt3/79U+XGdn6lq7dhnglMfB3gjL06OvQLDH/YFRXUbetbS0+6DunV9t/YtauBEWEr0F7nHGtJXJzvHlrCAg3VwkRF5bq7iSFBYGEnD+TunqD5pkJHVoONIfZx0NDXMibr+TZq0IGh8e9Db2qEdrgbouJ3SbgrcHqxCeNFEknHuOIAkWwSF6Sth47gIjjd1dBNW3ELcujA7II9OVKadiGMI0vPQDukxwy7XHPbJsUwWLC8xZ0r6K+x9CBeHB5kDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjNY22Y/8hNHCZ5VFyIsKgg19S/rx8lZJn565MVKw7Q=;
 b=TAKsmdVEP1fW451zpwNYpSBTD2V/rvcZrNS2yGGYn7PTWdED88YQ48oXpN3w7BMm/6cm6Uy7pJ1RmJIHaCBdFTZL+OL3IE6GMLhXYOWf3hExf2pbJ0iG2Gql5fW5qcEKHxhiqM5pm3glSHIvvmIH5pdE8IntL4iK2vk82SqnJRk=
Received: from SJ0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:a03:3a1::6)
 by DS7PR10MB7298.namprd10.prod.outlook.com (2603:10b6:8:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 05:00:31 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::72) by SJ0PR03CA0361.outlook.office365.com
 (2603:10b6:a03:3a1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 23 Mar 2026 05:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 05:00:31 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 00:00:15 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 00:00:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 00:00:15 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62N50BfW3800621;
	Mon, 23 Mar 2026 00:00:12 -0500
Message-ID: <403a92bc-0b10-4047-b51d-7da5a19408f2@ti.com>
Date: Mon, 23 Mar 2026 10:30:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s: add I2C4 node and range
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux@ew.tq-group.com>
References: <20260318115144.7702-1-nora.schiffer@ew.tq-group.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260318115144.7702-1-nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DS7PR10MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e5348a-2905-45d2-14ee-08de88991bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: VpKp6UMTrelMI3g9FefCynlYdsPIINaIfr0bEUUSgigG8QowddzBcVdNs5zHdLF3DXz7ytKdEJrbl1Dho5B6zoe7YxB8Nr72jddk2WYaAqOMu632uGo0E4Ne7AUjVPuvC0b/X68+zLcc3ngFPgmSAAqNOHXIUasrrQmR9IM940MnMYbIPZc6L3wlzfKfuE3nDDNeIZPwXuwGUdDvF63/ilYccydm+s89vdyHB1yaHOu9XXTcuR0BLa2mBIxR/WouHAPo4knsfYjADdbjOL9Ifpxj8tL4I6Xj+LvrbTjiWGux8CbUvnHMHV1Hs8fLG84o2Vna8u7jTh2TeX9yCTFEYVA6PGcd8aiBJGMwYncodn/4ibv+dgSbrPuXKrGgn2S+mH2GoPGaGFzfLYgevrmgX7EmNG5LliVaVfGoOYtH6PAsyRJGU2DmBtV9STMpnj4Am1Unbq532OuBddWaaofJO8d7b0uaHCAO4ELfXmtPR+gYU2S3Jatb0X+HXPg16PS3c77TISUwQyC3/xwC2ZdMCtcE0FVCpjCdlP8Clzh1AUWgQBYdJtN0faPXL15tQkJLLTo0E3712euOhXuXNzGrjWv/t1rsj/jAaXNQ0g6Tt+jZywqrQCpjHxI/Ep4mqD4pzT1a0toS3i07la8T/CS/j8lU1Mva9Xm4Hk8RDFyL7kGehFwAJCIOAvAtO/b8wxC+SpKYGHbAS2xgh7hpO2PDiqWr8aIZImb3WERxgym2G/aNAZbhj2DDRWDEgJxn46ZTlVrCvBN1DzVa8527nPtIsCW1DZNP3IB0iDHc02uj148=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /wpU2RxffRNfdeRYRvBxtAAuzuD2zJ7wWQ+Iz7I09dYS7R6WcblE0285m/TIp/znv5wxzgSOrWaZwYR0mtpjlNVq117N59nKt+nm0nekYfpVw9G6RY/nIXTowTS+TMRw4cLTrP3zbr+6aBdEPpx1e4Ki2xJ+0ypurziQEpoERTJRMu0PaBghDTSPY2h/BvpNtrAre3J6NYgDRYtMUfTD+GzmOzvGcdUZkrcuQ4Nv3Kwc9QV2LmST5Rvd2uzDO52wRlqLEc7UYY5V+shQj5VeI6RhCWVy4TNkM4/V1UgPHTMYPfStOEFp14qUiD9ActsFxN+8DaJy7tQceHjzJlvFK5Wg0c7q61fcXVKiEjmCdwi1aV3yxK/4zZVZE6gxc1Lz26PT4865gjl53vAnRGY5kN+THAZAR8GiAb93mnmfL6qgQxvZqHT1L1pgltyqstu/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 05:00:31.0602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e5348a-2905-45d2-14ee-08de88991bd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_220037_645866_48D10143 
X-CRM114-Status: GOOD (  10.81  )
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

Hi,

On 18/03/26 17:21, Nora Schiffer wrote:
> I2C 0..3 are common to the AM62P and J722S, and are thus defined in
> k3-am62p-j722s-common-main.dtsi. The J722S has an additional I2C
> controller I2C4 that does not exist on AM62P; add it to
> k3-j722s-main.dtsi.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> 
> Prerequisite for one of the RPi-compatible MIPI-CSI camera interfaces
> found on the TQ-Systems MBa67xx baseboard for the TQMa67xx SoM (will be
> submitted separately once the other prerequisites for the board have
> been accepted).
> 

There is already a patch from Aniket at [0] which seems more complete. 
Please Test / Review the same ?

[0] https://lore.kernel.org/r/20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com


[...]

-- 
Regards
Vignesh
https://ti.com/opensource


