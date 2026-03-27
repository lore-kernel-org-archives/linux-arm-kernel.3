Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7736E10BA428
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnx8T/WUpPfJEfdCVpoJvz5/IxsubaQ8d1+YrUR+aag=; b=vhoXMJKP977Xu3qNAH6vZAXEmK
	iNr02D3eBu9So6WCTWIdA8E4vEpg2Xj/kyGIRwzDg7q8O8QW5N44Ff1fEHo0TDtd2iXk1GfLINbkW
	7yzZnFvbUp58GjClQ/zbA4k3ZhI0dUCJvOf8EP+QuZP4+lNXq8pMIHgGtX8x7HxiNWHPM3eUUxeD5
	ohe2uJP8lKcmHGDffJQ1KXo+Hx0ULyB92A/fdnqNYVB1rnqCME+pMUeAxdKicLYqbV0/mVNe1LqOc
	68yITsIXhKyFK+HyBk52wyUQonDhvETRGW6VF1HC887aXfmMC7IawC37O1YR6TXqpx0glnFFFteiU
	xZQ9MNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z0W-00000006fNv-0cbu;
	Fri, 27 Mar 2026 04:41:16 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z0T-00000006fNa-1LKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7I/c53qN+khBX4Er/sNef6LfnVZkqxojZnxVug7qE6TxiveubPeZanQKNSg0b3aUjcHdcRBJaT1jXViv3uQ0pzTah2pDvyZaqm5fOBqzDv+1HARZmkoIObRvP7wLsBG8L/c/LbE7bpvbZXPGh48Jy3GH4Y2U4Z8hQ+KQJqMVtnEMKpk+kl9Nka5k8wuV8hPvD/hhOQ/co32kQNuN7xx/yoOaxJLAWHWVk2evdnFelcyc1q8VQOh9Z5WTEkpaEJFcv3FuJKGGJTzft6Y2OD6IKdiblk+P01cbQvjz/U6NKqaSdabuJ17BhGSCV2BDEiHoM6czYvI9tCfBgWU7vyM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnx8T/WUpPfJEfdCVpoJvz5/IxsubaQ8d1+YrUR+aag=;
 b=o1MpyDvTmHd6k9KT3aISRWzBgmdfQlEdsfe25Xrv2+6YzwTx1vWqMvc/pmjJfkN1QyCXu4hzJFEKBu1R0YD3+Apivrjomhbc2kZAJzP1iPGLFtv+UHUuwhbKZhwldef/IM1dQ072v+wMwIAxNCRW0RJUwh5QvjlzcuzvNI0fJaaUKH95bzt3+zUoAhbr0V2a2xkohUdfgZaCKtGpzD1gMb4+Pdjl8OcYwGHsshFLtJf98Wfu0m1852JHCSej/KbsvA6k4VmZ9W6QcxR0HtW4OvGSepwG0cMNi0GxGS72gF7olQtRjCvzzQcr5QtMcV2WeyujXkkBjNvrZXcZ2GJIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnx8T/WUpPfJEfdCVpoJvz5/IxsubaQ8d1+YrUR+aag=;
 b=Dxx7wWdhay8XZeSziLg7EjSfGYscTiSXjC+Bq6s0R1xGdvO4itIL63ScLS9xHHH1f9puz0zQuNEgSqnMUjWGRQ0j+0pDzOItN4iG9FXfnQY1zOmP+OthZBosGfjVseq94dGMPNjedzwQ04BbWbEZWd7hNoQuCSI2ZSV34Vg9BO4=
Received: from BLAPR05CA0031.namprd05.prod.outlook.com (2603:10b6:208:335::12)
 by SA1PR10MB5736.namprd10.prod.outlook.com (2603:10b6:806:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 04:41:07 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::d7) by BLAPR05CA0031.outlook.office365.com
 (2603:10b6:208:335::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 04:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 27 Mar 2026 04:41:04 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:01 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:41:00 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4evKx2868631;
	Thu, 26 Mar 2026 23:40:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Judith Mendez <jm@ti.com>,
	<stable@vger.kernel.org>
In-Reply-To: <20260320073032.10427-1-francesco@dolcini.it>
References: <20260320073032.10427-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] arm64: dts: ti: am62-verdin: Enable pullup for eMMC
 data pins
Message-ID: <177458644615.423823.12334575193190360698.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:10:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=c3rOAVJ5PQHAUWCPCjH1T8w0nxX9wHjK/kyOgxGHhf0=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjXJEPlNMVD3Ody9S8tXrOhAncYUXPxXfIymfeYi7SY
 9noJ/eto5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgInMZWH4xbzMTqpr98JnUp92
 Ll8gtO0DJ0/5YXE3y5wPEx5zloXlPWT4K71fZbmdxgye6uvtOSqOr0wM7V35DC+JXp3ZtvKTq9B
 sHgA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|SA1PR10MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: b631829e-4482-4161-f17a-08de8bbb0e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OhYt6QPodYix7gLdp2BT4n2VEDkNLp3qquDiWWPWH4U8OI7KALKr2hYWUxBoSdej6zzMfGzeIFWJodyyYnehOu4sxJ6A0yGswha1vRbYA/5GyTvr881rNabApzX8BT5kM2jxIfMct5Qyi9aki9QnM50id8UIllyqh/cLpYDXl3HGKmcsV5cDKcXIcIH73n1VdC1wtZJF6EtFmIFTH4SdFVmNsZp2h8fuUURAJIe9YphH9EZyZzsYlwDKJQvCn0nwpvqTB8Z1+A+MYLGRqfKH5xkWfXYO1tKa7p4f/KOWYOj3yQ5Xu5dQri7+KDMvg9Z4Qc0NtMHmiZGfdavyiX3FLU0YfgKBmwbF9HC0jE8byXQ3HoNYIGbnYJjSv9G99zymyVZcrC2HHBlE29ajTtO5BIjZbPBaHD81YxYN4Y9z1jOzVYzFXjiuj6Y4wE9Q4I/L2PmMEXzM+dQrkTiFtm9e82A6f+PMVw3bWBBAyLI8ZvBeI1IS19/GgUTnDXsTuTkwaO0na8zszJRrZIpig6BiL0SKZ1oVybeUgJ+cIePFbV80+aSkdSLoi69W0b3b0p/olOtxScr6SDyq9f37lntIhCzQTvyJhbOiLsln535JA7nhsF8Ye2FSETnKxigpwrV6WHF3M7cpugm8sqCd/kJvZh1Vc4Qo7u8Qa4l3CiH0bb78hL9Bx5kTBH19xArFGewv+Sx+8Zfr0Ui6JYGJpA1yMPqpjzPLUDfY0j+N55cgzuUb+QPp+3lkwBKrGNqgxlRKOjwZjpsFXid6HapNoM90JA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wmYQr6Z6C4kv4LNL6fnrcJLzaPUsmevwNj1RW1Nv5HTx1d7/HMgQM+yjCCe+DrHQF5LWodp69Pl0mgKPp2L/KrIegIIkdf6ZtI/5rMht8emZxAaTKU9EpeQEq37rqdqHq/eyoQfPfNwwZiH0Pm3zq05ZJvGjZVTjtyr5yf8KAzY5Jc/eKpWtQCRBVeu9TEwKMzcayYi4uf3sb/Uo6mooczUHYJojKc4fGX1jNI7goPC8+CdAYysF32wvUDc6XLpXgCWewq2hwOukk+KgngCbPQ740uFoJWWVYyizEwsymy0NC6Ie7eHSqSjP2s9sbrbIoIlHJDlHEFhFR4eChbweqPBgSmVwzWSsqyEIKIJ22PDR8p+Z4SDM5hT+/rEz7qOPzbAp47hMIfgacjd92dM6untr0OIG/xgh5JvAqVLBLnjZiGVaZe8nvdOlnlDEd0x/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:41:04.9660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b631829e-4482-4161-f17a-08de8bbb0e74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_214113_485681_9F39ACA0 
X-CRM114-Status: UNSURE (   8.82  )
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

Hi Francesco Dolcini,

On Fri, 20 Mar 2026 08:30:30 +0100, Francesco Dolcini wrote:
> arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins
      commit: d5325810814ee995debfa0b6c4a22e0391598bef

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



