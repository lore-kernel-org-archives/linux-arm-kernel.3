Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5844C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5AZEHiLx8k4VFQ13HqVu8DJMztQwYj1tNwDFoGYJ9QY=; b=Klts+tRyw1o6Qo/lnSHnTPkG5a
	QMKU19XqpqFfEoYUVX6A0LPU7ZiHT58XWhlLKu39p7zSlnGO2t5AJmAuNba8eGqWKvmlOXtfrHTbN
	cc5KE/vT1FSu1sG8i7uPaiYBq/4FpNcAkHiHwiy3cIQj6QeZ+z190W11Dgbc7v3IhjFFAXWEMQSOY
	KpDVst3RpGkzGGG9VqEbdCI849VTKj4ADzBaZWFOs54xtVI50unHK+vYIYVSEkzPhHs4cVduTOako
	JTw6nPQY8d8ybG8zA3S30eEHOh17uQOYGD7rlNGCjQ6WWJBzHuTCjc1KjNy0O1xQoBw2B2LGppIQG
	3GZ4BmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX6G-00000005OlO-0kgX;
	Wed, 21 Jan 2026 12:14:16 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX6D-00000005OkV-1l9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW4gVoXQORLQhF9ycTlZPVYkDxTZBIy0kYE7zrfy0TlgT8OaQDr8nPv/3oyEmvm1nuBnCPg9DZTMIMYNNzI6Ni4pMQQPxayeefnG5CJikZq9LbYn21G8RJ2lLR05e+J9+Nm5lWslKMC1Ir9ZLndkQLD5ePol4pgawBCW6WqnbaPjdaYrnl+P/RDzAeiDpCnOpze5E4XmGd7taghWOSmMQGhF3fA6N7HbOyrIEYMpAIDxRMU38euWbin7Qutsuh5ebtVcjYD3URacx3aqHferfDxbGoF/ALEsZgTL7mH93kcpPllCL+SYzj6VtI5gY1PDhwtuGumsW0lOAhzmXarhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AZEHiLx8k4VFQ13HqVu8DJMztQwYj1tNwDFoGYJ9QY=;
 b=U1XtGySAGsDW8JKdFSspPRy9OsW5cz2ApNcUXYjRQ+rvXksCvUElgcNaJRDG2Y9zbr9DCRXBsa1gdX+9pmyYR9hCDgEf5J2S5jgOPkkQl+BCRXmhUOvMc1pSmqvpAFKwnIStlYox8S2aKk0qrab48Qmz4mNSsr8Vbb2zmY1UB050mCvywESdg6XV/fe5xIhiNhYpayljprqeEt+Sz1m44NR8Lz73qEf0fOd2tzk1HG1A5e8sWNTn5q7LzkE0XwHSBJ7c8tb5DppiaPSEBaprnwYH/+nO89FPMrsbzhWpI3EBFjaROOZwg4upvfhTGGgi0OxDzSn6botBHWDQrU/CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AZEHiLx8k4VFQ13HqVu8DJMztQwYj1tNwDFoGYJ9QY=;
 b=U40GXCeOmujdJ/qF2zAozjaBk5gOJ7V4HtbxpPLRTYwNNFT1BUrAZWklUSk42ol+yBNNy/vA3I2cCQBu+Z2eOmSu3mehLkXKeRi8Fu7HVzin2gX7dDlKm+2DtX2MqD1xEHYyCzFB5qjy4lxLMpulKKRb1VIEDs8PYHe6/eBFBsI=
Received: from BLAPR03CA0047.namprd03.prod.outlook.com (2603:10b6:208:32d::22)
 by CH3PR10MB7834.namprd10.prod.outlook.com (2603:10b6:610:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:14:08 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::46) by BLAPR03CA0047.outlook.office365.com
 (2603:10b6:208:32d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 12:14:08 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:14:07 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:14:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:14:06 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LCE6212981089;
	Wed, 21 Jan 2026 06:14:06 -0600
Date: Wed, 21 Jan 2026 06:14:06 -0600
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/3] arm64: defconfig: TI K3 updates for v6.20
Message-ID: <20260121121406.dq63ixnhppobra2r@boots>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipel7x4aq3xu7z3b"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|CH3PR10MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1396c74d-c051-4ef0-b773-08de58e693fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n5+3GwKJ+SKqqIr5ZF0dPy0BqziLh8/Pn8fCmlerU9XS13Fsa7FUUDaQQPzh?=
 =?us-ascii?Q?4Xt59b2CvETuJZPaCIWO+XkSS2kA+EzIIvW2xEZgYs8LMbnmpPJhdjNIeKSd?=
 =?us-ascii?Q?Nu6aHZ19XMI8Z9d6bMJwmh3u9gUlBKcFevSGDIevKxT7evyJrHTlW0nYrqAv?=
 =?us-ascii?Q?MoViKdkydMHwXhotPek4hzhEFVfnUjcDpGAUy+Rm5ILMklBCEWC5hl8im3cU?=
 =?us-ascii?Q?WIYi2Az0f6ZHL/t4ivWJkzr0i8KP8MHwrAWSOjHtYJcGgRT9hHCM1M27eooG?=
 =?us-ascii?Q?3hKwuG3PPej+0esrsJBtaCkCFBPW2pIzzrbol26Fs6hYz+JXxb8q7fl6vagh?=
 =?us-ascii?Q?Jr8Gx8B+S6SBPtD9FITJwGrfPcftyWig0Yaj+pL62wS3Lt/8agRKyhRrZpWR?=
 =?us-ascii?Q?FHhtrit17FXR7zWNfhOpM3JJNYoNDHl22AvyoFQxt14LRBX6ZGXfdn01abmo?=
 =?us-ascii?Q?6rNARMJRtTS6jpN7UBX4Lm4v/qA+rrq3sRS1PhCTmijDHPSIUeoFZi6sWMr8?=
 =?us-ascii?Q?gcA5Pe8KKzXHrPKcv+bF/K64SQQM8FMSIl6eJGTj3+DqxZK+uDoezdp7YTiv?=
 =?us-ascii?Q?k3+OVvLzOcW97oJ/hx8dwmG7v8PD6SaQ4MYP5Cc2sFLH6cJfbjgTtc1FGlD3?=
 =?us-ascii?Q?QUDQgHF1LJfQWFjNZjw5yCCgmE0/fUT8/wkwb7lVZyIIisVTFMHRmq7boDZd?=
 =?us-ascii?Q?ho1qCs28lwKoFzu3Jx4tI/2+jolmN4MS8Y7KdowoLYQzvylU5GVXyWRULnCp?=
 =?us-ascii?Q?coPJB6TuUSeqNvcO3KDgGZ+g+Tb++Ht4L3cKPP5/FBBx4eKW927r/zcCeuft?=
 =?us-ascii?Q?F5OlqMVXpv9mRMZLSgMxc8vnSbo1n4rl/XOW/dZko1NEtQh0dKXOQhO8jkBu?=
 =?us-ascii?Q?uvscmgpmmz89mWufD/EW4oP104LBlxDtvEeU+4dgBMJtOIZLOecN45ySkzNn?=
 =?us-ascii?Q?SNRYyL/gMlt/BePDS5EPRlYppeKXghya6iMNyc+Vf1Dijhb8ZxrL/pMLOXpb?=
 =?us-ascii?Q?45LQjLEASDJBLDxTLwRjnYGBluuUhNap1PXoau4VvZSlY1oSfvuAOZq/tw76?=
 =?us-ascii?Q?Laf4d0Dg717CIURnoaZfZ8unTGb9xmi8w7htC2X90PjemwVt64fRll5TzfPp?=
 =?us-ascii?Q?256SNmcn2MpZKJ7B/gJqM1H+8WW58hs2XmV6veQsOZtY48Rd30MFy/XqSc7V?=
 =?us-ascii?Q?VrNz4CzSRthQKwaf2jfpB8eyZzgukPoK1l7eq7txSjrtwFB2tvWmW5+1AppY?=
 =?us-ascii?Q?bxPimol9JtckZz8ZWgCZMqsuBXQ5ioIoU2tAULM5P5OiGl9IGBZIKsumdv3F?=
 =?us-ascii?Q?PYVDP3rwMh/SBxBRZOY2MTHCi4pBCsS829VPjvUTlvT+qUP0Gr46Z1WIIC3t?=
 =?us-ascii?Q?JR86zN10CghXyzTIGPaOZ3lFErlZVQKQr/l2OLjyYMRvH4kXW91P5dM/PJsO?=
 =?us-ascii?Q?xOcyI6mapJI/QGR3oO4RnZMqcjuOOM6VE3gUFs0aLwOUhhpPmszSc/LHKNW/?=
 =?us-ascii?Q?3Hy/M6/f9436wQfrEWHPCDubENcxcALR992680XKmxGRkEdKOTZnMPVcj3U2?=
 =?us-ascii?Q?TuwnDJde57lUM7OnnL0e4raEgag6AGywJ/T8yjtbCxIZ6artyfjcq0aUbowj?=
 =?us-ascii?Q?hE7j+MK7NxGxOmO4CYh04dJBqODa0zcFyjLWizbRe9TeHH3081PFH1b1XihK?=
 =?us-ascii?Q?GJtxk3LqRf+qXWsd3BdRFez8eX0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:14:08.0445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1396c74d-c051-4ef0-b773-08de58e693fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_041413_465666_2994062B 
X-CRM114-Status: GOOD (  10.04  )
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

--ipel7x4aq3xu7z3b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that there is a minor merge conflict Vs xilinx tree as
reported in [1] with conflict resolution.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-c=
onfig-for-v6.20

for you to fetch changes up to 65428481cf6e174cc1bb45444ddc7489e3f2ef0d:

  arm64: defconfig: Enable configurations for Kontron SMARC-sAM67 (2026-01-=
20 06:06:49 -0600)

----------------------------------------------------------------
TI K3 defconfig updates for v6.20

- Enable configurations for Kontron SMARC-sAM67 module support

----------------------------------------------------------------
Michael Walle (1):
      arm64: defconfig: Enable configurations for Kontron SMARC-sAM67

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

[1] https://lore.kernel.org/all/aW5KbYimWKx7obE9@sirena.org.uk/

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--ipel7x4aq3xu7z3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmlwwwYACgkQ3bWEnRc2
JJ0dmQ//Wmd23dassCNbGcsKz8WRPIzpKZuyFvLIaUoDo5+xBLigJ21oKib1DjVm
WExDAtWYvJnr7IKKdMPGx0WigXv45AN+fwqVUEFZCBXzIn0RhDQYFxfvebvlyw7w
Q70ewT4DPOd8qokiJOCRBQsrrWoqQsGeCGKS04bmRyAqg1Wl8W7lGSKPOEB1D15X
gGogPC4CWcmFG2p/ZI10Nenha7y6Q/P9X+Z44iUL+9TNre59z+59ktxIUpqJ3V18
O8KGgkPwDV/KKfrjUst0roNz8510IERea2IfbIS+4UWThGOJ5m3MvaEqMvQov8dQ
CEqTnw0zDQ7x9uMHYG6XZ3+DA4JQ/CMr/eLC9EK3jNAHhw0WeGafGRz8/1ndunqC
bAC4A517tfIuUVfd+zbcQP235c33wfuXMDUkziFA/TWIUSZcmJUfkfAgQ4H1KB8e
W8pgPv3vHLl7gZc6CBpyBafe4QmOPbjej2Ojk5YZLXfgHOx07wwVk5Gb7WKb3Txm
E9hmDsq+uB0/JIU6p4VDokAHYWfe7XJH2PmAbDXzweDp8Hrw/7NYPRpIJTsIQR/L
rlP5kp2rIy5OYGnRnbA/v9JK2RFyhK9HFSGd3xVsnWy41qv7y5ZbYBKww1M3rG5H
ohjxqqkcJzF5I7/OnAygWsdAa75+RjGfK3FW3n9fqLBJcL4BYwY=
=BYZB
-----END PGP SIGNATURE-----

--ipel7x4aq3xu7z3b--

