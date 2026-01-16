Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2CEC982C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqKrQ9FUjy+akgPJv02fOIN1m3C0Avr+CqXNDSNzRig=; b=am05vVswwLV/1k8Hz0+m2/l/b1
	pe+Zr9BlEqAlApodOS9h2p38cdpZ/n3igi/WHde3ngr/2jWRckhNg16TZHFGcp+kZF5BXnDQYrYhA
	8BVFdxjrRCHxwR5M5HP5pxd+FfFU4kaPIdldSAoZV1uoPX1VRG/aTycWL/68Dq01TAVZ53WqXwffT
	Juof4arOxIn8n48F4nDeopXssSY+79U3GP/oIChHJGn6ZRG3u2kTO6IcftGP7CITupp1Q6s+Gkgcr
	77JTO7mLu3y6Cmx5rcRSB1ucmAS58MaiaArTV/YOY29xtzf0XHyXP2re2T+BgI/0qufH99r2tIod8
	1fhXuCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkxp-0000000EGtd-0lq3;
	Fri, 16 Jan 2026 14:38:13 +0000
Received: from mail-westusazon11012016.outbound.protection.outlook.com ([52.101.43.16] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkxl-0000000EGsm-1pp8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 14:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ei2yFRWh5yMxCc9Ywl7MrNS7XJ7B0tM/WBgC4yMRuCndPFhUEZS7EdQXbWbZm0TGtUHulB9RWdnQqvby3xzdXqWaN8Act0JZZ2/Rag4ifzgMNBHlHjU3DpdRfxXOf+mnUcGIa2/TmiMBXp0UJUJMkWHIIp12BAjTDTsa1OPJA4axsrsmmNVQXhiyN3ey75MemJFpydB4jzCwWA6XX5SsFt3IaxXocfdVYz44Fa/o21UjvHsRsfeF3xYrIJEXBgOs0cL7tU0noz5N1BaAe42w9JQ9EieqHM34HGLbeWtLLkbAUc826vqhWBn/WK73kyNwgw6dpaO4Nxc0cUwDGVFw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqKrQ9FUjy+akgPJv02fOIN1m3C0Avr+CqXNDSNzRig=;
 b=Bs7iRljJD/cnfcn2qoJMttIdCHXgHkOFd2R03UDWOABy4hO45L6kvhncSw4vP9Vc+hFNZQYP0F5y5NL0U3Hn7NhdnUJest5kYeQDTVYGQ66HcdkuE4Z2Yq4VkjsCYHRtEWIsIX9w9+d9WaVA0mamFHMZ6UYNM8jL7r5Mh93s1XsJALuxSSvTILpaaK6VMuhtqJ6Ixp+CJtk8kSq9VK+4fRXN+hhAuCPeO7nvSI4bWpYoIlAc24MeIZo3ZcHBraOQT63Yfn6zr5HqwNp6Q7Q11AA+EqCp5o4yytGwh2Tj1yTejxVK+tLNnqKyAKlQUb2NtcNgbfy7vXGVoPTdUZsH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqKrQ9FUjy+akgPJv02fOIN1m3C0Avr+CqXNDSNzRig=;
 b=srgtrSxb/Fu9JEMYpPA+kJnEjBqDd/PYmYj9/mdISJWjNE2TsYatiS4FiO31Vca0dWOukVHqp074TMZTrBV4E6hWPFcU18gO8bTxGwUI+tVufQ/Hfcz5yoNlR6zfZ6IqTiIq8rHdm02GI89YUaarVUP3LoJuoRVA3Q6d/95ro4s=
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by DS7PR10MB4830.namprd10.prod.outlook.com (2603:10b6:5:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 14:38:04 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::9f) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 14:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 14:38:03 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:58 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:37:58 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GEbwfl3418269;
	Fri, 16 Jan 2026 08:37:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Some minor fixes for the SMARC-sAM67 board
Date: Fri, 16 Jan 2026 08:37:56 -0600
Message-ID: <176857422934.3703189.11731506795743984633.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260115131431.1521102-1-mwalle@kernel.org>
References: <20260115131431.1521102-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS7PR10MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: bee7537d-919e-4741-2ef3-08de550cdaf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm9ZY1FoZXVlQk9ubDFtbG84WUpRaUptMnhTcEdpYlUwTi80N08xMitabStN?=
 =?utf-8?B?YjNNRDljY0FZMS9WUkZuRmx0b1NGZzF2UVNnenNORGg3bkNUZzRXV1lhYzZi?=
 =?utf-8?B?VGtkanlRS3o4ajEzWGo2QTNGUHh6RXFyS0s0VlZhbUtEMFBBQnVkT2QwMko2?=
 =?utf-8?B?Z1UxZXFKbHp2WjJycisyOXM3eTVkbjhIVUEycjMvMlBxbDN6N1FtYjlIek9n?=
 =?utf-8?B?SG9kaXdPZmgyUzVxVHdVdUwxT0gxM0lMdHFQQWhBQU1FSXVuUXVSVm0xSDdX?=
 =?utf-8?B?OHh5enVvYnZha2tCMEJUU242M2dZSUZwZzJIc2c2SURkTHhyaUl4alpEVDRG?=
 =?utf-8?B?TlVVRUQxVlRMRXNuZHYyM3A5K2hhbGdLMEFSRStYM1ZWei9Sd081YUcvNi9h?=
 =?utf-8?B?SmZHQTVBZm1NMVBydXU5YjRFUTBPclh6ZkVsYkJyZzkvbkdoN3d3ZUpicVVS?=
 =?utf-8?B?a2dDTEdrQ0Z1UzJXTkZPakVMYjJFbkJhem1YN3c0aGlTTkhDMUR1ZWRmbGYr?=
 =?utf-8?B?MXJQQVBSTyt3SHNQeFdHcTArNzlOeXM0ay9xNjE2QW5jRUV4b0s3eCs2OGlN?=
 =?utf-8?B?L01PL1crT01jaDN2VCs4Y0FacnY3dEFEMkZ2V1dZb0FzNFVzMzZqRng0cWx1?=
 =?utf-8?B?a2dUcFpGUTdSUXhWZVBNNzd3SjgxWUpYaXlwWGNNK0dhRGNSMXlvVmRpMmVJ?=
 =?utf-8?B?UlJONE9FVW80RllhaGhmTG1PYjRiVjBaNkU4QzdVVDlIZWZrdyt1aXNYNi8x?=
 =?utf-8?B?V3Qxd2VYQTRQTTVnK0l6Tm8vdW8vMkY1WWhrRVYyeGF0VGErc0hSM1g3WGlp?=
 =?utf-8?B?bXk3ZkdKTnFhdDMvMHc4cktuM25SNm8wd1lFMnNUWFFkdHNxb1Q4UWVucUll?=
 =?utf-8?B?SmJjSEVtc3hTbEpzRitYYzZ2enJQZ2srbVdyNEJnSWlKcVQvR3BSQ2hHQVdL?=
 =?utf-8?B?aVRqQ2RzbjlUenFnQ3BTdG1ieU9kUHovclZpbGJXTFYrZkVmRjYzNUorbDgy?=
 =?utf-8?B?M1dXWnJHbWE1eUFqR2dYOElFay9kZEFaNUprSXptbFF6Z2R5N2I3UlhTM1Jr?=
 =?utf-8?B?ZWJkL3FkVUhLbDhicDNtV0ZQaHlpaFBVQ1YwUGdrUm9KaHNUTG5LVGlQNkhh?=
 =?utf-8?B?OWswanlGS2l0YVhjR0ZyVTJwOVN4S0F3cHFVK1NVWjNGbFBwV3BNQ2VyaEV1?=
 =?utf-8?B?b1lTc0NZSDZxeWRUWkF6bmluaXA5clBWbGVMSTFxTFJSYjJNeWwvL3c5cTBO?=
 =?utf-8?B?eDFhWEFyUmtCdUQ3cHlERmN0ekZFUllTL1NMOHdUMk05Mk5jeW11YkRDdGl5?=
 =?utf-8?B?QkdBeXA2clVHZkR6WlpLZ1E4aExvSHl6aGNSVHdoaXIyZ2tIYmxsVk5WZVI4?=
 =?utf-8?B?a1hGQTNmTXhJOWJPUHZkeGZCcERERGFZRHB5Nk16Y3NXNCtsQXBlc3pUYWo5?=
 =?utf-8?B?UlByQjd3WXRma2k4Y3RuUXRwWHJuNFFlbGJFWHBSWklRenQ3OURYN085a1Nh?=
 =?utf-8?B?NFlqSmlJdEYydEUyNU5tay9DaklPYVBkUDd1cTRmcngyUG1yMFZpZmdvRVBs?=
 =?utf-8?B?NEhiYlJRZEhNcGlReFVERm5jLzNGdXIxRTdPKzJ3RkRONEFyZWVla1ZsbXVE?=
 =?utf-8?B?ZkdKNUphaWZiOXR5SlNiUllGcjh1ZENoWDhoc0FpbGxTZVpnYU1nZnR3SXNu?=
 =?utf-8?B?SVE5WjNmS3FsWHQvN1JZaldQWlZZdWRzVWNwcTVMUHB6WVJaUVJKdGpMNGJF?=
 =?utf-8?B?R3duMzdLR0E3NlNvRWdhaDdTK2w2cGRTZmx5MXF5WlBxNmN5MDYrZ2t2T3R1?=
 =?utf-8?B?eXEybzFWR3ppQTg0THAwd3dsQ2h1cTZIMmI2R2c0WEVCUm9WRjBvYU53eXRH?=
 =?utf-8?B?NzB1ck5xdnc1MUZTNHZ0Y2VFNWdqZkdqeUlQOUdxRmVoWnVON1NoT2lmTGIz?=
 =?utf-8?B?WGwvMHhoYjNtQnNiODBvVW9KTGlrSFdxVGc3LzhRUDR4ajVoZjFBQkFjaVBI?=
 =?utf-8?B?L2grczZNelEzeXhuRlQyTVlidlllVWVOeEY4VkNWelhCVHhFV2dEQS9pd3Zk?=
 =?utf-8?B?SEVwUWhPZnV1SXBKQTNzb1doc3V4L0tOR3JYZkNncCtybzFVOG1idGtQOXNk?=
 =?utf-8?B?dW5lanoyNjI4UmEwbDZGSTV3N2Y2U1gwOUpCdTk5RTdPRnpUQk1jRW1LODg4?=
 =?utf-8?B?WFNIcUE2cS9XODQ5MzhrY3JXOE1tOWJES2ZxTFRvQktRN1UxbkxORzhwYTN3?=
 =?utf-8?Q?mDBosavOXDGJidPH5MMFChq3IXzoKLlOqUKqQIKxV0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:38:03.3632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee7537d-919e-4741-2ef3-08de550cdaf9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_063809_494864_47DB952A 
X-CRM114-Status: GOOD (  16.48  )
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

On Thu, 15 Jan 2026 14:14:17 +0100, Michael Walle wrote:
> This patch series contains two small fixes for the sa67 board. The
> CMA patch will fix larger screen resolutions for accelerated
> graphics for example.
> 
> Michael Walle (2):
>   arm64: dts: ti: sa67: fix CMA node
>   arm64: dts: ti: sa67: fix SD card regulator
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

I had minor cosmetic fixups in the series, do report if i need to
drop the patch series if the changes I have done is not ok.

Thank you!

[1/2] arm64: dts: ti: sa67: fix CMA node
      commit: 11a6a5bb72ce271de24330fd859e83f7bc281609
[2/2] arm64: dts: ti: sa67: fix SD card regulator
      commit: 53289af62b66812d07a7b0f5f9d62f429c94d317

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


