Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA88CFA768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	References:CC:To:From:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aH7BfUwaqoK7Hs2FnS70yiRz4vKWLlib8H+Qwa07EdU=; b=ftmxaTLfyO5GDnhupcVCwWNBC8
	Dq+5wAe5nn2VfU8o6VEc6zIFUKSlS1cSPh6nbkS4h/0NAEdNEp6y3iky3IImZ1eiZ6bEPIfDjJCLq
	oxxbKNZL2cbknCqgtgQr0ZbOVcCqtINXwkj0bmIKmUkoGOCtwJMihroWpBxGslVqQY55dVB2/tldm
	pjuJybkd9jeDC/TOEwPgROPl8mIDS6fwKY5W10lsMwSnjm1w2ZCmlMlnVFtBa0gVBQCB5T17R0Vbp
	f05D56ROSS5Wx3FHQWeuJQIg9ng2RVo581G7TRDEkVpnygUU2NjYoLCtDylzeaDILig/Kmq7pCSNF
	Fl7uClSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU7y-00000008jbG-0iGj;
	Fri, 21 Nov 2025 16:36:54 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU7u-00000008jan-2BDl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzZlp0PoVe0RIrS5kIJe7GNZvmS+GAurXCjVG8VbQ8LPgj1SldfCXVlzYlJGqSmWKD3VUmXJ0L4w36TF56rIqU3i22nqQusd0+Bpp7aS6lZ7W88oznyryb/Fc9Nx2VLO1s+rbbW56kWSQ/5HIiSjeJwISez1l9vrkssMAUzwWuVPg0A+aZlF1nHrRzHJJClo+c8M9Qknx2LSu8QQ0pfGAO5BBqCjuizfGsl9UILueT6XNE62KR3vi+WzPJUzuKQTgFTJP7XqFH9DCEa6NWEJVCGzOnMmjHDCPywxHnX1xcEmeMOoq8msOvVOeJxqYrYS0VqgZbeHfVWTJIK9NuCpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH7BfUwaqoK7Hs2FnS70yiRz4vKWLlib8H+Qwa07EdU=;
 b=DJhZNWAGQ0DcBOrJLmZRPsV4DGnCGNB7lJU07WYWc/2/nfD45yWMpzGEREo+G+e2/4NnaKG2NQnnk8+NG7KLu2U9NQwd0ujeGsRZcFFDcUBTKEKCy24x+Gj3t+mgxTlgniH5qvQ/riSL6wVbDF5a2cWSf6aPtWWY3bJBEi0FK42WmDKkGaPyooAkC/UWT0AgD/EqJUuRsOkVhc9d64eAWv8u6TLwJyBEGcmjpjm2Z/3HjNF1D0K3jNw6UuN44iL63+1dZkiZcJzUdOSz1OaSXDAVnDTHBvEWYxyaTNJogpmeDs2ORh6FSsifYJgqp1nuJoANqeEG2Xrox8Xktqz7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH7BfUwaqoK7Hs2FnS70yiRz4vKWLlib8H+Qwa07EdU=;
 b=LvsZ+RH5J+bUKSKPClqWWje+WHOaAsRO6OZRkrXgmunwPI/jrDEehdLKrrrYeV3oD4w1m++OuxKWl/kJLr6IbwdXgVS4psDA+YLzlOj+1XfJhcwfT2Fi9x2hpMSlsnoaosUNcOM5oqyDp7vM1YAteI1ID1SA0e8ittoeP1FPTU0=
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by CYYPR10MB7567.namprd10.prod.outlook.com (2603:10b6:930:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 16:36:45 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::6c) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 16:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 16:36:44 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:36:40 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:36:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 10:36:40 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALGabWe1530610;
	Fri, 21 Nov 2025 10:36:38 -0600
Message-ID: <7ad1ef51-e56f-44b2-acbf-70bc1f43dce9@ti.com>
Date: Fri, 21 Nov 2025 22:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL] arm64: dts: ti: K3 updates for v6.19 part2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
References: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>
Content-Language: en-US
In-Reply-To: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------waDou8rfZD4gI7w0vN4bo0ys"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|CYYPR10MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: d4582fe7-1450-42d0-3099-08de291c285e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QklwT25SRXhlVGp0TDBFdUhQVnB3bDRZM1ZoQXViWE5VK05Ddy9kRkdwOWlu?=
 =?utf-8?B?RzhsMG4yT2tWb1E3bTBtTUs5VUpuYjZkKzNxTkxCMjZSeWZ4dm9QRDZTTCs0?=
 =?utf-8?B?VUp6bUUrck5BVkFNTFdVc2xMT0c5dDRXOVpXTmJUT2kzMUZxRmRDVlBtNnpM?=
 =?utf-8?B?OUVBZERaOHIvZEFtMXZzWStqbkJnMWlNeHNVazloeXFLblEySVVwWjlpa2NS?=
 =?utf-8?B?VE5iaENXREFUSEk0cTF0QWNKeEM2K3phOFhBRTl3LzU2Y0dUSmwraExuMUlz?=
 =?utf-8?B?dzliUnNUdEtXVk5wemVqanY3dDRPYkZ1STVucTFXWEN4bG9XL0RuK0hJc3NR?=
 =?utf-8?B?dmZzWGw5THVPeXB6M0lyVEllNmE0OVJiMDFRcnBndjZCcVA3UHBGenRYVnhV?=
 =?utf-8?B?aHgzMklyNUVOcWF6SjFQUTlwWFVxMllkcnQ1ejA2WUEyK3gvWVlYSXBFNGRx?=
 =?utf-8?B?VHRycU9oV2tteEhBQlBNRGowNCttVUJQTTV2TzRwVTlyRkxRdlNZZW0xTDla?=
 =?utf-8?B?RFNENC84NWFHL296VXRiWmg5RHpuaVNkZHBmRkZUN21hdXhTcHZRSGZhT0s5?=
 =?utf-8?B?WGo1RFF0d2N4a2lLbVp2Y2tRMGkyb1BGMlNhNEFmUFAzZTB5YWVoeGhOU2w2?=
 =?utf-8?B?aTNsQlNFR3lXQlpDc05rNnZVdGV1MFdua2ZIZkVvWTFUSGFGV1pGaUk5bkk0?=
 =?utf-8?B?WGVuVGFoTWEzcnRrcFlkMFA1b002K3lReHY3S1VkczRuMDA5ck5zcS9xQzZT?=
 =?utf-8?B?UkFxSTl5dTdhNnpGalBZc1R2elk3Si9xdFAyVkppU2NRRXR3VjJ3Uld1UmtH?=
 =?utf-8?B?YjVDYmxYd215cFJ0aWF3emM4b1RTWUI1Q0k3Ymk5cHRNL2VKcitYUW1vc1dx?=
 =?utf-8?B?cGpiaityVXRPMkt5OWFMYjJGYTV5RU1DekQzdkR0TElDaUNySE5BMDlQZ1NT?=
 =?utf-8?B?NTFoclFFWTlPUFpSUmxwWjN4eWVDMW5IWWptcFk1YlV2eGllMU1EWmFtSllz?=
 =?utf-8?B?SFU1R1VSZkVVYm5RUWMwaWNwaWpENzNBNUdRQlVmK21yNWVpWnBuRmUzaHZD?=
 =?utf-8?B?Y3owbFFJbzArbExoMDRGbGtDTWpsOTI0T3NiVjBOVXRaM3pGQ3NxOTdnZTRH?=
 =?utf-8?B?VmRyTEczNDFUdVJWc1FvMDhna0ZOellPbXFmNnJKZWhJOW0xUnRBY0loNlhC?=
 =?utf-8?B?V3M5M3VPeFVLT2tSSDFndURqSFA4aitCSVpwdGNpY1VxM2lTdDRVbUFHTHJr?=
 =?utf-8?B?YjJMWUh5UzZ3YUVtVW9DRXI1dXEzVEJKeXZMbytOcnhTOFVrTU9rUWdJbVBj?=
 =?utf-8?B?WVhxdzVxOW9iTERNRlVmR2hWVEcyOWJxSENSdE4zUlZaaXRRVExsajZzM1dv?=
 =?utf-8?B?eWUvK0U3dkp1Si9FVkM2Vkx1M3ZnSHJqOGFCN2tob2MxRldYZThsOFR0bXdp?=
 =?utf-8?B?bE9pc0JxUnZ3NTZrbVgrUXpMSHdrTEwrVjljcmxXYy9xME9hWDRWOXUrOVZH?=
 =?utf-8?B?OFZjVUY2bFQ5QTZRTFgyUTJubkJWVGRZcWdjVituMFFFMFdnYVJReFR6Vzl4?=
 =?utf-8?B?bzB6U2RDejIwOGJIUkI4ZEQxZG5YTG1BclUvUkhNdWNHODcza0plaGdkN0Vj?=
 =?utf-8?B?dTZqWmdNUzR6akVjSFFLa3ZvM1hxY2hxUy9ua2pKUC9hRm5NbUcyeTVtcDQ5?=
 =?utf-8?B?QzVtMlFLUGFYcHNzYmxqR001U1UyV3NpcmlEeXJKVk5jL0xvUXY3dFk3OVhW?=
 =?utf-8?B?eWZYeDhWT0ticXpKTnB6UDFYTTlPeXZwQWNSYUU5S285NHFaWk82QnNJQ1hi?=
 =?utf-8?B?VUFqVWEzSkRGMmc0SXdidlZPeG05aDBPbjFaTjl5OHpER0EyQXJDbThzem95?=
 =?utf-8?B?Rmk0UEg4bWxXNmlPemJzWWpwMDhwVU9VL3NjQ21NdTA1eGJyV3FDMUF6UmVr?=
 =?utf-8?B?R3Fkc0FsNFhteUpTNUZ2enBkSjRHUWloaE93ckxHTGtSMXJGOE9sRXliN0V0?=
 =?utf-8?B?U3NRKzBGRHBrZGZwOFg4U3dWdU5EMFoyak00MmlZMGEwMDNvMHg4LzFnc1pF?=
 =?utf-8?B?c3pydEE3VHlDeTNKd2dyQmx0UXl0SWVlNVMwNm9SUWVzK3VLTis0WDNtOVQw?=
 =?utf-8?Q?x9IU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:36:44.5467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4582fe7-1450-42d0-3099-08de291c285e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_083650_692854_63E086F7 
X-CRM114-Status: GOOD (  10.15  )
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

--------------waDou8rfZD4gI7w0vN4bo0ys
Content-Type: multipart/mixed; boundary="------------aVcXyVBIK9DUmlEOSOI7WS0D";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev
Message-ID: <7ad1ef51-e56f-44b2-acbf-70bc1f43dce9@ti.com>
Subject: [GIT PULL] arm64: dts: ti: K3 updates for v6.19 part2
References: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>
In-Reply-To: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>

--------------aVcXyVBIK9DUmlEOSOI7WS0D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

This follow on PR for TI K3 DT updates contains few late fixes mostly aro=
und unapplied overlays
which now lead to build time warnings and couple of non urgent fixes.

The following changes since commit 00fb4c73b67d36783c5ab95a830f0cf0142b9f=
c3:

  arm64: dts: ti: k3-am62l: add initial reference board file (2025-11-13 =
22:01:07 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v6.19-part2

for you to fetch changes up to 56baa9190988f35d53b1479a87c1bf44f6c979c6:

  arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup (2025-11-21 =
09:25:42 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v6.19 part2

Late fixes and cleanups:
* Fix build warnings for unapplied overlays for PHYTEC, SA67 and certain =
TI EVM
* Fix pinmux of SD regulator control line on J721e SK
* Correct unit address of cbass_wakeup node for AM62L

----------------------------------------------------------------
Michael Walle (1):
      arm64: dts: ti: sa67: add build time dtb for overlays

Rob Herring (Arm) (1):
      arm64: dts: ti: Add missing applied DT overlay targets

Siddharth Vadapalli (1):
      arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power re=
gulator

Vignesh Raghavendra (1):
      arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup

Wadim Egorov (1):
      arm64: dts: ti: Enable build testing of PHYTEC board overlays

 arch/arm64/boot/dts/ti/Makefile        | 34 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 12 ++--
 3 files changed, 41 insertions(+), 7 deletions(-)

--=20
Regards
Vignesh
https://ti.com/opensource

--------------aVcXyVBIK9DUmlEOSOI7WS0D--

--------------waDou8rfZD4gI7w0vN4bo0ys
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCaSCVFQUDAAAAAAAKCRADQj8NV+8d11Jt
AQC8Tnp+HA2MlKlk+0v6ja5oQC35F37MFYAztEvqIl4JDAD+OYYkqAbTtUipGzZuWsAp2VUYppp7
kaCkgu2+Y+iN3g0=
=ptuh
-----END PGP SIGNATURE-----

--------------waDou8rfZD4gI7w0vN4bo0ys--

