Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ECBCFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPRjWKgQK4GbWHhYLu5IMziL3gmxX8Lp65S1Ri/lXtw=; b=UtZZ8ZqOUl1u478ln0wAykwfdd
	ubIcJ7KFZRJKhhn+aWwh9PidqwZ0mCjXhFhR/QB5IvnijQYneClbAZjEgzsHWSxrNHNptrM9Un00I
	RlosUuI9H+Uf6oYGx8Y3Ogammd92COueEGGZNwnk+n9PUFhgebypZuyztmEJrYf4+DFpHHhAhUKlH
	xPPDgzPQrhz89UXb6/vVWLkcynXwKFHNRx4KDVZZv8IXXic3eMXdvMhbCewwclUNL+FzaYqqL9nDH
	2tPUGwVl+qhtvcTWhrgZrMY1QtS9fo7ysukXoYHmYIPut2pJPNPv8Re14hIAp3FnUBCviPomdAwAQ
	zR0PRVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRdW-00000008TmV-45Pw;
	Fri, 21 Nov 2025 13:57:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRdV-00000008TkX-2ZUY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lPRjWKgQK4GbWHhYLu5IMziL3gmxX8Lp65S1Ri/lXtw=; b=ntryvJ7MBO4iM9e9NQRlpw2gHE
	eJUZgPBwhzATmqpgQf/25/oa9EAa0RqZzcWupDJ91aiZSJ9aoUPD/YUitz7nK8BMo2UMXKxO/6Np0
	/+mlQITtU8HT+Hn2uQRB/hZQrLaLORa8mz1UdWYvuKlnDCuwf4BO4lhTowre5lEEfi5haOltQJHqP
	9754xgHt89NGaVgFQjMNZ8q5nGakZEJYUm02OWtQ3COKvv+BfDd/FiDRDlCDVp0mDzxNAzdRlJNtH
	ek0aog8JGQjVwlWOT9TAcv12fvUuAukC8PJTW03iz5NMOEt1AQgoSawQtTEb6p0BvulBWZWdah6T9
	Lc4YqLxg==;
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQln-0000000Gu74-3CCr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVTubdl2bHhz14l25bEUgscFn/NnC7QqDP1Mg4pXQ1COOrsCyLA1+PTpc60XwmCiRFoIZCZE9o+YOlbiFrkbCFmT8kgU991PeZw7RLHjo9Exqs+aotSs6pSu1ylmYjg4DtkzgsXA14Fgj9/c9kiogIR94OIAKqFJ7PlQQRLHiFY+Xp9vt2MlJ91YY7fAfyOzY5WZMEva4OFl5TMXmlvHpRNOhrdUnTNYA/JxLFGLE+VzrmiwNN27qcIpRUEKZhGYr/yEe9/An2pAY6xYwGuPzw52yxoyWzOOH835oWR9V0XXR+3hRwBA+Nb2rJp3oK+QQzbXGXtUl+P/IzjmJFGYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPRjWKgQK4GbWHhYLu5IMziL3gmxX8Lp65S1Ri/lXtw=;
 b=Jz4eYHRJmoLfYmac1Tlp/S7hPlcYrbzKQQkMYHMLDK0Ngfs6iznxhQY/0FpI2Bj5exZxdJUsRl8MsaNA7Rr2IUCV2t5OQXNXKvUjIhyibOw0m0KJyuJ+fVqhRQJJQpzonNzuwzbhh/AamE+pLJCLa4tFTyFKGqlxHj/WTyCP3ga6T67c3QfELLmA9TzlGyEWsy+j+4jRnt81d3YSgu2dOVXuItyKbbrwC1z7BzLVKj6TzV135sM58Q5cWeLVYvFnURHJGBxC71ShQkF7Z+TliD/ZUme6xlz1ZEZILw459nt3OtuKYmS89QRF7Su9QXd7HrzxDdNfsIaycaZ1TXCp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPRjWKgQK4GbWHhYLu5IMziL3gmxX8Lp65S1Ri/lXtw=;
 b=PsfSjX8BlZ8I/+bHYgPzFp/ucZzAkjBbb2iDtJBcv0uYPB3EsSMlwplgauMCVZ91CNL/FsJOrWRj81Mzc2vKAynxkSHtoQDmlE0TbSJrbFagyTBkHxMzw7shu7wc8Wds9B06uK+ZfqIaWV7qdmbPlIMLKturnDXbOBGm74Et9UA=
Received: from BL1P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::20)
 by SJ0PR10MB4415.namprd10.prod.outlook.com (2603:10b6:a03:2dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 13:57:02 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::37) by BL1P221CA0019.outlook.office365.com
 (2603:10b6:208:2c5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 13:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 13:57:01 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 07:56:57 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 07:56:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 07:56:56 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALDurVV1323598;
	Fri, 21 Nov 2025 07:56:54 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: sa67: add build time dtb for overlays
Date: Fri, 21 Nov 2025 19:26:51 +0530
Message-ID: <176373265676.739386.15498422901678738455.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120080138.2397851-1-mwalle@kernel.org>
References: <20251120080138.2397851-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ0PR10MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: a37e8bd5-4507-48ba-d341-08de2905d88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUFJV0JRNEtWTExNaHRFMHpnN3A4Y3pEa0xlMVNxZFlGc3B3cmNZMU1LTHIw?=
 =?utf-8?B?NW83UEhHZk5LNy9oRDBoVVkzaStvMjROUlNidkdyR3hkWThKZmRHSzlWQnZO?=
 =?utf-8?B?TFd3Y0N4QVQ2ZlhPTjlVc01wbWwyWURkM1IyOVNOM3ViRzRuakhoc2wreVlZ?=
 =?utf-8?B?ZTBlWVQ3cjZsb1dVVkh0aGZFSXN1K1N3V1IydW55QUE3aFZmd1IwMXZKcXg4?=
 =?utf-8?B?YUhYNnB1bldqa1NBR3p2K3dFeFFyUS8zWGhmNW1uVTZTdnpyMTdCcmJ6Qk9F?=
 =?utf-8?B?UlZLMmF1RXZDZThRUHpmMEVOKzRPWEtUVlFSV0Y5bnROTU9iVitBOGx1eHM1?=
 =?utf-8?B?Q2ZNU1dUaVlNK0tmZzdJT0RzMmRMbmJHVU9LcTE2YmI4aU1MZGRFenZtUDVT?=
 =?utf-8?B?TDExKzlYcy9xNGpIdlVPZ2tuL3YySWkrbmk5Wk9odmdIMXZOYWpSMnFUTGFK?=
 =?utf-8?B?dFAwNjRxbGliZlVWNEVML1NrTkVuMTdmZXRyckg0bUF4MHQrK3VkcjBjWE5p?=
 =?utf-8?B?a0lmSDVRaVNIR0xMU0VTOS9lVHRqOXpzZUxnK05qYVZLQVRPNXRFWkFXV3Ny?=
 =?utf-8?B?bTJsdldFRSszRXNPMVY0L0ZxREpudjF5aDlxKzNYbEpDUU5vOUd5Ulg3Z29x?=
 =?utf-8?B?bEJLZDNYRlJDdktVN2p5MVFFbnA3c0EvaXVXWlNHVVpvNnZUUmN5bW5TbFhS?=
 =?utf-8?B?RUNMVWxrWUdTSEJBY1BJcXRSaUJETFBpMTZ5djhMSnl6dnM0cFZKeXpXVis2?=
 =?utf-8?B?RWhMSXhyNEU1dnBuZU5HcXN1UHA3THcrcmkrd0JnOEQ2MzRMYXpGdVNVWjg0?=
 =?utf-8?B?bUxobjdjbHcvbUJtemRRNHpIM1RKWUNxcVVCRlpMQ29TZUVDOEdYUURwNS93?=
 =?utf-8?B?Z3Q1akRsNnRLYTZZK0kwbnJGUWFvN2VTb3JHR3lxazg2TTZDMUNGaGlUVnJ4?=
 =?utf-8?B?ZXVmTFIxbEF1OGhyK1N0ZWpmSDdpdG9ZZTdJK2ZsenlJa0xQcVZjSStBbmhS?=
 =?utf-8?B?S2ZJb2FxQVJBUE03aEh3MzBlU3RibHlKdTA1eWtPN2hQUlZvbFJDT09zZjhP?=
 =?utf-8?B?VDdqSzFxQnp1dUdLRXkrMlhpdXVYajdSaGh4QS9MZkdFbEdQem0xZXAyTGJH?=
 =?utf-8?B?TmJLbzd5MGMyWXhiK2VybTJOdHB0Mk1oR2s2UHl4andJWjdTM3YxK01FY3hR?=
 =?utf-8?B?cndUYmNER2pBV0pFa2xFUERjTldzd3JudDFIYWpQMWl0OS9sMFNIb2lSZWtL?=
 =?utf-8?B?ZTZNVCtldmFCOUFKdFp1WStneExNaUlacHEyTWNOTkZYNitHeFVNbTdZeGJk?=
 =?utf-8?B?SVVwTnlOM1NnbVVnNk1QOVlWMlJCN0o5WkhJY2J0TTQ0Sy9RS00vTEovYk50?=
 =?utf-8?B?b2xacEhKWCswQUt1NjkrZWpGdlczcnRIYVRXYkh5eGVIUDlDdW1DMUdaRVBs?=
 =?utf-8?B?aGNVeEFxVUFvZS9HRTdrNy9DRW1qRlJWZlBpK0VNY0xlaFRSSGxBOFVwS29N?=
 =?utf-8?B?RkZ2TVBzUXNNTW1aMWVRWngzam1VRFJuT0t5OURhSWZzcVU1V05UOER3RHo0?=
 =?utf-8?B?SVdyZGtxbHQ4ZVZ1Uk1SYUI0Sm9mVEVEMWQ4VlYrR3QrNi9USUlXYVB4MW5z?=
 =?utf-8?B?MXRLb0F5UGx6bnF6ZVlRc1pLSXQ5dlJJd25ON1hBMVp6N3BKSEh1ZWxjWmJW?=
 =?utf-8?B?MjJqYjBiMGRMUmZ3UzFDTUpvU3FWWkVtdnhnWE52K1I0NERmODI3MlFBZWpQ?=
 =?utf-8?B?VjNKMGRSbVFmN3FzUHdwSzlBM3hOVXJKRkJGb082R3VvV2JScEFabDJydU01?=
 =?utf-8?B?cUZwb1E5bkl2b2Q4VVBCZUh5aXlXKzQwS21mbnNLd3hjTTdzdXVBQm1jVHFC?=
 =?utf-8?B?NUpUQWszK2E1RXN5cS9xUUJ3Q0hpQ3lFRnRMdFNvRzM2M3dGOW9sVXA2Sldq?=
 =?utf-8?B?UFBaU3I3RXVvTVU3RTNtOGh3OXVFZEszbzh1cmYzODBoWmp1VnpFc25ZNGVv?=
 =?utf-8?B?Q20wL0lMenRjNHA3N2oyUjhEb09IbmZUK3FUMXZVckgwR25aNG83R0RaMFdR?=
 =?utf-8?B?RmN6dUhpaE11aVF6RTNzZjJyL3UrSVpaOHFVQ1VyVEFEYW42Q0JLYUw2Q2dN?=
 =?utf-8?Q?22MA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:57:01.6833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37e8bd5-4507-48ba-d341-08de2905d88e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_130147_848644_5A82977C 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Michael Walle,

On Thu, 20 Nov 2025 09:01:22 +0100, Michael Walle wrote:
> Since commit d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to
> a base .dtb") kbuild will throw a warning for any stray overlays. Add a
> new .dtb which will only be build if CONFIG_OF_ALL_DTBS is enabled.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: sa67: add build time dtb for overlays
      commit: 4ba96cd38f22b24d72eb3f7c76a0e1cd0af1039d

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


