Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975CFCE7AAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2JtL1hlnaC87sMny1FCzpPNza9HEqZ0sbyjTEjtAXc=; b=ad5lhb9MMLLapfyreax6ubWDNi
	cazhUeWD1Gn0wAgM2RqjhSeqYn9SLQQgsirjMOdO+G4gUG3TikryMFK0gMe7ApbVZamapPLgXzAQW
	1QqTyP00VuUM0C8Oxr6fX3594YX9qMtNZCd77kwl4DhiDFbRgFRYCLjsRIMe0u4zNkLpm1cARxr84
	IcFMMGwINZAq02fp44bHqOr0gD1eXzWhGqVjY+DK7o3+o34MLPCcDwnAM3Zq+7uOFIjDL4cD1JSva
	c4Tl/Uk2PXis4H1ct1A7YOl1lYWQKyKpY0iQ4jYjP1PsEPvN/1rMBcieVRRlOyiN6x7hQNXr0cAjX
	NJQcvidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrVB-0000000C4YB-1KKr;
	Fri, 14 Nov 2025 10:58:01 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrV8-0000000C4Xe-1fF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcaLlP0ell/oMRL+P7tH2XxW1IQKJ6TSPssVUU06SApiYaBTP0V04TtNKyCoQth2CNcyPXJGEwolfgL65YZT35jHQGpbgi9rgjFe3JyYkG5k4uEUn+I4tPw3uEfzt2H7TwbmO207jww9M+FAIVuCZ5GMtGhbw0E+R+k72oAku9grd+sfNkbPozGENzfsDYlQEmgkueGAV3xv723kFQmrPfmptQ3GOiXH1Hlbbzi3p2LGDzATwK3mP9Qx6KNDSzBN8OmZW6/zy7AyugjzyzKHxGHPAJomkOJsz7yNNSSQ5dD2JS3p7B87tZFymavxLrMDEjN+tgGRgDY2b6BXdGJxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2JtL1hlnaC87sMny1FCzpPNza9HEqZ0sbyjTEjtAXc=;
 b=YguF+9ixfV5OrO6jrmPZivcBlrZCu/o/xe3iUlYLgKq5EfVrGeYE/oyXU7nz9H/HF58xxk7UggiqeIlPnX6Ejo8EdOGff0W4YbjzVEM7YhN+C9JWUMMvT5GC9DPlzfVegKy6MIv/tdokgMeHLhYHhWD+/HLL6EtJdcAcVqj3i3ploJAUcTmN1vL/1f/s1otf+JjOKQLPNJoOng/is6jvrM0QCNPtW557o+oZ+UuvzEsL1g7S9JwLE/mQN5bfMgdLiWR6Io7SvVAoDnl8q28yb43zhWrnxTZjmPajoZGDKZhBYp3SIHqO0Q7LijrY/SpXNutHdgZxlOaw9LrdneXeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2JtL1hlnaC87sMny1FCzpPNza9HEqZ0sbyjTEjtAXc=;
 b=A4s46IFkuQ6+6X0PhlF4w4oZUXmo/fXpM95ySeGo1w9uQBHu55bo/iQgXxVqkTbxhGuVrDBY7OzedWvjfM27mHHuiQb/KTcL+uWsdED3LO9Klktjv1n5YsbOq3h6n2kvhde75dNf3tmNyM6Qjk9UeoEuKhzl+z+Mkk23ThUSGgA=
Received: from BL1PR13CA0375.namprd13.prod.outlook.com (2603:10b6:208:2c0::20)
 by CY5PR10MB6215.namprd10.prod.outlook.com (2603:10b6:930:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 10:57:53 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::b2) by BL1PR13CA0375.outlook.office365.com
 (2603:10b6:208:2c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Fri,
 14 Nov 2025 10:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 10:57:52 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 04:57:49 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 04:57:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 04:57:49 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEAvjdH1871514;
	Fri, 14 Nov 2025 04:57:46 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: ti: Add Aquila AM69 Support
Date: Fri, 14 Nov 2025 16:26:10 +0530
Message-ID: <176311776041.1390105.6254099147958762962.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251111175502.8847-1-francesco@dolcini.it>
References: <20251111175502.8847-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|CY5PR10MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: bb951401-cbdb-4a4f-66a5-08de236ca8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWw5MHJ0a1pNeGVTTkthTTF3M1VaUUQ2R0FDQzhzdjhYZGtnQ0xERkN6Rzl3?=
 =?utf-8?B?T2loaHM4cWV0bC9kR2RaL3RsRWpudlE0ZkxnaGtSQTk1TUg4YU44TzFhYWtl?=
 =?utf-8?B?YVI2YkkzMlAvRnVlRVlvelZwdDZQOCtlZWNPWEVzNUwxMWJsTXpyZXZUcGpi?=
 =?utf-8?B?L2QyTE5YL1Zqang1YmIvaVZHS2kzRU1xQXV0a0ZFVTU5OGk4N0xYcEZjMzg2?=
 =?utf-8?B?NFh2U1pSMjJHUVFMUjJFYnpNUnVYOGlpSUFENC9peUJiVXNudENlbUpJVnJM?=
 =?utf-8?B?aTlNMUpqbkg1MVVscjkvQnhRa0dtSVVaWTcxYUhUVWxHbXpKOEtqZnBpcERY?=
 =?utf-8?B?YUdrRmNnM3NXVmVtM2NDb0hFNXVBZ09CZVU1L044Sm02bjA1azU3Z1BTZUE5?=
 =?utf-8?B?NmN4dGlRMHovMWdxOGZzRlNUWTJjSHlFTHJON1NtQ2swVmJwMnVvWXhhd29u?=
 =?utf-8?B?aTcxY0RLNlo1U2MrR01lL3hMOHBvc2wwbG83c211YnZXeUxuOTZPU0gwUHdQ?=
 =?utf-8?B?eFhaMVRtUGgyUHJRMHBSME84M0hLQ2JuZFZCQVdPVWs0ZWdjL2hORndORGYr?=
 =?utf-8?B?QW9relp6Q1RKRHhROFdQOFdQSEhJYmZNM29CZ280ZVZlSmNOWWE1bjJpcWNH?=
 =?utf-8?B?K05mM0pYQ2JsYUtYalNMY0JCZytIZXlvN3BUNUsya2NrSGR6OTdpTlY5WVAx?=
 =?utf-8?B?V2RlaDREcHQvenZ2cFRXOURqVDJVa01yYnpCM1ZZdnV2eGhjcTJHNUg0Z2dl?=
 =?utf-8?B?TVYyRUZSUlVWWDB6VXFnZ280VzdGVUhORWsxN2k5Y2ZNa1M2WUpjTlNweTR4?=
 =?utf-8?B?V2dUWDZxTWVmUWxhWWtZT2hnNG9LQkJZWThsSXRhN2YxWU0wR0owRmFTM2lY?=
 =?utf-8?B?MERkTGY5M0NLWFN1ZElIQ0t6NU9FS3dGU2kyU3c1TmtEQy9STlBRYzhLN2JM?=
 =?utf-8?B?elJwbjdrZEs3K3F5K0dkQUhKNmxBc1NQYmlFQTN6enBsN3cySG1BTFVKRVVi?=
 =?utf-8?B?WjdielZzLzJCVnc4NnZSQzZkUUJMUGk5VEdHN2VVQ2tFT2IzWkhsY1RzUlky?=
 =?utf-8?B?endjbG1yS3JxbkxBaVJwcUV3Y0RUam03dy9wMTJRRDFrRDhabm8xbDdWVXkw?=
 =?utf-8?B?S1FFc1lpak9KR2lLYTdPcTA1YzZaUWZwTTdJcDBHUks1WTJCcnhwNmg5cHpH?=
 =?utf-8?B?NG42aCtqZmZKUzlCL29VWUhZL3BJdlZYeStQVzRVRTEyRFMxRGlUNmk0THRV?=
 =?utf-8?B?VWF6UUhQRHd6UjR5ZVFGeWJVbGdyS2tmem9iT0c5Z3lXWHJ3NGQ5VWxzcWpj?=
 =?utf-8?B?OXR3OTZpRjJnZTZKNG9yRmhEaTA0aERUNTBwakhuenVwZzk3UUZSUThWSFhr?=
 =?utf-8?B?TGlxaE12Y3lFSEJDdzZiU3pFVVlRVzBBRWhqbE9aeHhGTHdJelA5MUd4dFpl?=
 =?utf-8?B?emlycXYxWmJPWTlJL2dZVVhrTnJTbXR6QkpNemFITWUzb0llbWU1SnlYRFR1?=
 =?utf-8?B?bWRsYVlCekJCZW80WFl5bUtPWHJjOWdNb29RcXcyWUhPM1hheXB3VDMydTF1?=
 =?utf-8?B?ai9ZdDBPRWljNWZuVlZqeXRsMUhaVEpSRWk1TExkdVV1UGtPK25GYWRMVysy?=
 =?utf-8?B?SWVqcWJ3U3h2L2wzU0xYT0hFNzVHL2VEeEJIVFNaTS8wQmlRb0g5aitHSks1?=
 =?utf-8?B?cWI5dmtoa001R2ZjT1o4dFBOazRpN1hYU0p1cGtVQ2RFbERJUk45T3ZFRThD?=
 =?utf-8?B?eVJlcWJkLzg4Si95Q3hhcUZ4ZUtsUFh1OEl2R1IzKzFxekM5ODlCWDFIc01W?=
 =?utf-8?B?N2d6Zy9FOFErd24zOFJma0lZWVJPd0ZLUU9QWE9GY24xaXZ4d0tyNEE1VFNF?=
 =?utf-8?B?b3FmdGxRM3k3MmFGYklvUEwyZUhuZGcvY1ZTU3VKUmkxZGdVS1ZMQzJ4cHAr?=
 =?utf-8?B?SEZYSDZWTHpoTU5lNytBcU9VRHJBeDVWcVBnYk1TdDUwcHphSW9PYU8wRitM?=
 =?utf-8?B?L0J3cjIxQm9acThJT2kwenhFd2lNT0p5TmFqbTdiZ1BMSGI0ZndzaE1QUXh1?=
 =?utf-8?B?Ymtld1gyUC9wUGZFWVJMNU1SQ0VoVncrdGdTbGpOT09EbDZKM0NoakhDNzcx?=
 =?utf-8?Q?Wupk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 10:57:52.7086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb951401-cbdb-4a4f-66a5-08de236ca8c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_025758_655354_DD3B4835 
X-CRM114-Status: GOOD (  15.47  )
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

Hi Francesco Dolcini,

On Tue, 11 Nov 2025 18:54:56 +0100, Francesco Dolcini wrote:
> This patch series adds support for the Toradex Aquila AM69 SoM and its
> currently available carrier boards: the Aquila Development Board and Clover.
> 
> The Aquila AM69 SoM is based on the TI AM69 SoC from the Jacinto 7 family and
> is designed for high-end embedded computing. The SoM features up to 32GB of
> LPDDR4 RAM and 256GB eMMC storage, extensive multimedia support (3x Quad CSI,
> 2x Quad DSI, DisplayPort, 5x Audio I2S/TDM), six Ethernet interfaces (1x 1G, 4x
> 2.5G SGMII, 1x 10G), USB 3.2 Host and DRD support and a Wi-Fi 7/BT 5.3 module.
> Additionally, it includes an RX8130 RTC, I2C EEPROM and Temperature Sensor and
> an optional TPM 2.0.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: add Toradex Aquila AM69
      commit: 2f6ef830a756f58312b3f3bbe3c1edb739e84ec5
[2/3] arm64: dts: ti: Add Aquila AM69 Support
      commit: 39ac6623b1d85fdc8b142c26991339fcad270606
[3/3] arm64: dts: ti: am69-aquila: Add Clover
      commit: 9f748a6177e1fba8b27588e6ac6721e129f097de

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


