Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653A1D58B06
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=izr7pIP1CN1uJgsUEqIJjhrv44uoCs6GlT47A4URMFk=; b=x9kIicmDc/QlQwEZa3O4596o55
	qoINLMauP/nuoMP+DkkhiytEPuRiK3G4RIDAJtq6wJ7D5VTpFwuElmjifPu9J5yx+NzJbeerQKAmo
	1fl0I1s5B1Rr1g0x/DHJgoBk8lbVociRxzRO8PCMR0/mLIbo81vwEbXM5EyChzRrtZ1wQ24u8sG2Y
	i7HPIpAgQcnYy3LY9VVSth9rFfag7RTSwxoxM8N+iRf6yv2m0aXPumStQhPhdP1pEhfO0XuSI5BTy
	vYRNmKUlHzze6o8ul1/P7IFlRHnhduZKIvlj+pPkCuEPimjkgrXs5Cb7Jh6mELiC1GIv8yMfZzNOq
	QRmqgLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBp9w-0000000E7T6-3DTj;
	Sun, 12 Apr 2026 07:23:08 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBp9s-0000000E7Sg-2IZp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 07:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0cNg2N/sw+ITGy5Gyjyif/G0a99F+yCLuh0A4ub0ARGMKSwXhgI2htHMFBfnnyBZ+MplnZ1AHFnJdxaW06Nn3Y8ZjgBnMZNHlvvrEl7j9KGdfBm9fHynk8X6nq/wljVhclW6UxDcyKkChtHGhHJMfCdUiq+koa6kSuQuNqybkMi+YppOXEG0al4k6cCpXwkq24mT6JLDAUVbLVvUv/EnBzqBsqBWgQEm6ibKTtKA0DD2AWvPKqrr0Xi67BI5Bn8E62n9PrmdmoNl7cy8PCrGmOUFSEcicZcncHveIks4vo3ZVZEvql6hGSGplvysQMSyFvbxcG1mLbIyhusrdSniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izr7pIP1CN1uJgsUEqIJjhrv44uoCs6GlT47A4URMFk=;
 b=ZNoL6HnotftNFtfQgbNhPoC2iQ+StTqaEr8xgnwkbDfteytfuF5FS8qeYPizgWBCgHVWtnMHYATer+5Sx3Lrl6+qYa8CuJTC0SMtqGSbEcg/VjLq+GXfitlwn3UWk8QmXjrfTPVyQN0PghAoBWpwyVYlOvx4tgpvnFCzn5gVL/z5AUk/43NN3BRK5pM4t1hPdnYM8emn603QSZ6qj79C7mHvreyDO+DwTvQYFmPrJ26DVwjyf4hMMkd+Y9i2qAe+yhdrEg5O+CLTyRawIBqEcERx0JFc90ZQNT7h9aASHkM7O7Z/qPB8Xf5Y6lePg/nA7ue7OpbxgMb/ZyjXkajOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izr7pIP1CN1uJgsUEqIJjhrv44uoCs6GlT47A4URMFk=;
 b=ZnvOJFmebvCEONi+cyhaK5zjQyONpdO7pefeBDFDwO9srCrrZ9aFxMR2m0dHAEEQpHK+LQrNIH8yfRb3WGO8Tc+kSv/WK8JxbryXQ3XRFrqNEObO1/xr/x1y5+ru02QCbaG6x0KooZNup+9AqdnOO3c4nney23E1Ly5uWabwsrQ=
Received: from SA9P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::20)
 by SA1PR10MB6470.namprd10.prod.outlook.com (2603:10b6:806:29f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 07:22:59 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::9e) by SA9P221CA0015.outlook.office365.com
 (2603:10b6:806:25::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.46 via Frontend Transport; Sun,
 12 Apr 2026 07:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sun, 12 Apr 2026 07:22:57 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Apr
 2026 02:22:55 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Apr
 2026 02:22:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Apr 2026 02:22:55 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63C7MqEi017453;
	Sun, 12 Apr 2026 02:22:53 -0500
Message-ID: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>
Date: Sun, 12 Apr 2026 12:52:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] arm64: dts: ti: k3: Late DT update for v7.1
Content-Language: en-US
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Nishanth,
 Menon" <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------wne23iCyT1RjOkaQBVNncqjt"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA1PR10MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bc0135-2508-44c7-ec17-08de9864525f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: cbSuQ/d66yFfvI5SuvBDgxDY2umJdKwu7QlwRdo+Goy2YkTDs+3J3SNwpXgK2uexgNa8TLAHccNrG5yxdPQ9/g7/Y2HUiHvcFSaBobnH+RJh/1fnK/jmhohNlQkBxzgltus+zT7xNjckLQvGKVy5DMt7w5jLi/VFnJDWvy8doCzSdaoZR1PaCRwKw9yHRayrM89njWRCssO00nAWR2SfYFix0Y+nZwYDVPNQnvl2upZsafuzgiEKnT2lbSeQgwjGLy/lTABOEccuhlqBL0oeaaQoq0E6fkOQkXfTi5VlwWSktDi8VuPjb/6cZTF5SzpJ679DHf9FnpLmALy00W4AKLIKg4ZVVUVjaW7hdIIEXY+sW0s+Je8dxAgIaPGQknJOkYqZxEssz2ANognRI8OgP3E0JOcMDimAAaO5i0l7Uxs/mXP0P0Ygm4BhomRgRyyFS/DyYcqAKDnPfWhj/q31/UYUpXwiknaP4bkXHnZlAJHZ4P9DeO8qzwpRbE6xjgZw5SFDeCqLNyTyTw3iSB9po5eq43mMRCAhwcbGrpgLpa60RVlcoV66eGFTlslYwyA/PMOekZDwb9UkP/PBEAG9c72pDODtNjM6QtjhwSLtQ9z/KI8Xtzb6VAgpAWuZT75zTNU7wn7L8VNmA2L+lloIrYluCt0BjpB96vKrxzBi7olCo+99GfQOIGU1PvvG2sf9/v66gqn8uDhLhQf6N3bHa51AQTDLReQb0BXJ3rghttu+yAZBewsNqyg6ShDPQWDAH29C764xLthi7GHBrnkZFZvn9iBM29AQrkAokl24AU8=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NR2IGS3mfcz0tgDExFsBX530vO1Gv2HCOcKsxnXCtlAdsmZ7vEuwHN69HP7hMh8kwvaHH3jawhFJ5rXrnchgaKeF4Boctcuic0B47QMkX5QqlA3TCq2Orrw7xUz2iOAAsx05SDH+PMxsTY8NXgJpNHuyd103evqXW2MtRPHpzPQrwkqiQRCR+CAnAiKUqS5FWre7UzX/q+GW/pcQfh/uWzkYcL/gg49AwcYSotodi0GIYC3XbPPkGip/nhQPtX7VUhCS9Px+Kn/EcHIdIUGFxHAXqsbPVzaahTxn1Sy6AEvMax59DNTRlQW6H9jJA10BFG78X2HB90+Vs/lWtmt08f7dTAEAtVDDpuFI/s4pfn19O024uZ/6B+iXn5h2YmBsY27oc8PNiKZo9FAy7ZhcCfhLuj6uk1NT1Ik6qvlcbTdRn8fZwoyJBpynQ63AJTWB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2026 07:22:57.8674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bc0135-2508-44c7-ec17-08de9864525f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_002304_749257_1578E2B0 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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

--------------wne23iCyT1RjOkaQBVNncqjt
Content-Type: multipart/mixed; boundary="------------Ajo5ceQ3I866hKcfjqMcw114";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: SoC <soc@kernel.org>, arm@kernel.org
Cc: SoC list <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
 "Nishanth, Menon" <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>
Subject: [GIT PULL] arm64: dts: ti: k3: Late DT update for v7.1

--------------Ajo5ceQ3I866hKcfjqMcw114
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC Maintainers,

This contains a single patch that updates r5f remoteproc DT nodes, warran=
ted by recent=20
binding update merged via remoteproc tree.

The following changes since commit 47c806de9e9cf171d197f2f0df86df7f2bd1aa=
56:

  arm64: dts: ti: k3-pinctrl: sort shift values numerically (2026-03-27 1=
9:55:06 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v7.1-part2

for you to fetch changes up to abe76f9f47d59ff80eb2fc59482aa76bbf6fd13a:

  arm64: dts: ti: k3: Use memory-region-names for r5f (2026-04-09 17:05:2=
8 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v7.1 part2

Late addition:
- Use memory-region-names for r5f across K3 SoCs

----------------------------------------------------------------
Markus Schneider-Pargmann (TI) (1):
      arm64: dts: ti: k3: Use memory-region-names for r5f

 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi               | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi              | 2 ++=

 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi              | 2 ++=

 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi               | 4 ++=
++
 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi               | 2 ++=

 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi              | 4 ++=
++
 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi              | 6 ++=
++++
 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi             | 6 ++=
++++
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi              | 3 ++=
+
 .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi      | 8 ++=
++++++
 10 files changed, 38 insertions(+)


--=20
Regards
Vignesh
https://ti.com/opensource


--------------Ajo5ceQ3I866hKcfjqMcw114--

--------------wne23iCyT1RjOkaQBVNncqjt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCadtITAUDAAAAAAAKCRADQj8NV+8d13cK
AP0ej3EtlNm4E0DX/S4vshnlWkn6VUcy8FOZYPHhJt5A/gD/YF8Hfrjr/SJlTghSybtuOCTOjIVF
L0HHL9STNERlWgE=
=JZPa
-----END PGP SIGNATURE-----

--------------wne23iCyT1RjOkaQBVNncqjt--

