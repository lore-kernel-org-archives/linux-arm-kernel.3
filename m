Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1210BA426
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXdpyG5mS+ujTi03nf9InerTFT4o8qab9Hm85A+52H0=; b=IxdfczTuTCdafBchVy2zmOIqj0
	UGmTfwuLtzDI8KDGnlB3oYIdoNucLLWvh0m/UcXlSGGetjKzSRZbuGKRBa7M9hoDfWy+IlTuOnfNt
	jOabZeij4eth06RGU7fNcZqtbkGGQUUIpHZAZ1KS4XwHqYufx5HYg/MJo3FNEzc4zhh61lH8aB8iX
	bTqPbk59DKf9Dzo0h2LWLt46wg8rtWQ+LgV4viFNKcyL40Gt4AH12JnN0qVxywZz+kJA9EYotzzvB
	zlLtTPw47YISoK12reBiFVux8xT5mCZRxHxmnEq21H3HsL6LqC0+bk/tOD5kJhD/IU+mN33RqUsoT
	EKYj7aWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z7i-00000006frF-0SvM;
	Fri, 27 Mar 2026 04:48:42 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z7f-00000006fqt-068a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:48:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO4wYAoq/ksmkmOHJDpN9bZJUBTgtGLgzB/+T3lMqgRvOMOpH0+QRlnPRb3QMjuC09h/aEBlUbeiDlqI6n5K69GtyDEzJG5DzJBb46qc+Y18JT//COqmZ8BjYklg8qpvtBdHXZUi1RQTNnF1pxeMCHr4L9SFAgiBR1UbRMbNm2R1z2E6xgRkL5Bw24Sapfvz3SIO6HNx9XLgePbTxxiv6FXp7u5jHRikVaEzRdlvczv7WSH9qqpjum/6kahmtn6AtuJiqjGE3bniMK6+WyGB0ucyRWOPTYGeTEr9oltL+/e+RBwY1B5R5NjyXNu7NdGCszBAKhfGVG7fuCsDyj/umQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXdpyG5mS+ujTi03nf9InerTFT4o8qab9Hm85A+52H0=;
 b=zQfwRx+qeuFytydc1nvhuW7b18TmjEjC8uEKrT5a/gzxBrIw1cAWXKoklBHnCXDJ1r8gcZYlZ6QOYoJhODOgESR4ZlodGmAHLGPf9GG5niRPDvRKAuGCxBb9f3qOSEBUeIu+b0fNy8XQOHVK8ir4lCQovr77d1Bm6aiRlU4O2HWxMbdoYigkwWB3hCcKP3ZEyBj/qPDeXNX+DUUG5VM4CtduFmBkWJOeTpuH6DJkLB5xKsNOS7JIlZ3yg8od6CmbOs1zByAv0JDe0Y8pM0bje2T5TENPCjDHmP2fadZz9ItNLBWKdQz99E6/httGboejB92m97kJIDHx9woGmy6phQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXdpyG5mS+ujTi03nf9InerTFT4o8qab9Hm85A+52H0=;
 b=rfH0t56mObV/2gywcakOTECAZgPSLm2xcH11HQ+c2+g9ggVjm3M/CTcKf7211R5YQwglkVRqOTBjSQAbQBDMw99i5CoQQnuk+8dtvmkY7XIapF+XRCUwJDHWhkRmCnbXJOrlaKSSORxLV/HddasIcbakIHSgy4RzSQcwJ69oMd4=
Received: from SN7PR04CA0023.namprd04.prod.outlook.com (2603:10b6:806:f2::28)
 by SJ1PR10MB6001.namprd10.prod.outlook.com (2603:10b6:a03:488::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 04:48:34 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::79) by SN7PR04CA0023.outlook.office365.com
 (2603:10b6:806:f2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 04:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:48:32 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:48:31 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:48:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:48:31 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4mS8B2877592;
	Thu, 26 Mar 2026 23:48:29 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260303205224.108217-1-afd@ti.com>
References: <20260303205224.108217-1-afd@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-j7200: Make MAIN domain system
 control bus a simple-bus
Message-ID: <177458690603.423823.17503280814095404802.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:18:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=hQFFnC7dlNekxjNT/d8KMvliO79E1Uhou6Xgo1VyDZ4=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjPDJPjUQKWIVYZzDzH94+g3G1dmFkUnaVWY/Ktubem
 9LVM/d2lLIwiHEwyIopsgSw7ZpllWLxOKIicSvMHFYmkCEMXJwCMJGkGkaGpQ8cm7NVsydKC+uf
 PDWlvPXUm56vW1+H7vO8eKvCW2j9JIb/blNdftp8eV7886DC3uWnZNPeWii4qTUf1tHTllTu2Z3
 OCAA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ1PR10MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 179c846e-012e-49e5-d467-08de8bbc1906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 61yP2D5wHtgMKvHQC6nQODqMe7xcEHUys3wTN4z/HSCSidSkiAtT8bVh8kcOJVTk9V+MuyC711RtdA1+iM5M2ccM5R8mzgLfvfw3oPSax/oqGpEmiFmLmgjsA7B0VUloNxXi80a6adtdSgiCLPDkAuSIIHkyGGxuLToGMvsC+CEIpf/2ZDmqWiyy/NtNH3D1Ukq4fhSv7DtsosoylW5mtZZAzoVu+2faUTpRoebNAc/QffLLcYsy+67vTHgTfcUBzuz3bZVJccsevCiQHCK9uQZws73oFI772OV8UEOYUWCJuYdcKNAmqcUZRFEgzyyt3gMlxpXfGa+W539A7tkdyLCIxR1uABjAfAFxBazv4OsFJtcDS7koQdl/LKwv3a5xU08xErk9nzY3/Ndpn4reZ5Sn2H0vB2/Ljl0x+wtIxpoPG3Y5xBz4JzKv8EO2fAtm0+K+I3SHKQ6n/kdpz8OxWNvilbwAmKIvMdQ2S4xaqmor5cHsehltoDacG0LSyUjBZUQrRNhGO+7DQiC/DnbcH6jm0IrGmt24fOKFYjvONqqTMIFEdplVBhBP+qcLxDWNf162akjh+FpJTNZqORAz20jASG4F/cR3QJ3nAJ1eWdYuZhqfAZGh1qwqn7ekJuETm3hK8Eph+TXDFs+NymlKTsFbY5jajvw9NEGvr9kq1Ds+deJZ9wzhTDC2Xgi0KZy95gDJFEkAzlZw8fXB0EBuVdsGs1kgzP0AVXVYhI6FoxYy3y3ru8S8yU9WSk/CFg40bsdIS8T1OwozfEHInlWz4w==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +DAR8npQeeU87XOFZmt8o6d2kazCYIMcKfQYevgc3qtg1EG5TLVO7Lye+z01Tv5XxSwTyqx+qNs3gq7bguCuCwEdIOvpBkBTDnbyCt2N42hu1CYS4fZEkt1IsBheRYlHCpWyzo3vxyS9Y+ClywG2O1pfUo1fWUG8TYIVzIBRIX20Qqe+9GM4xDH3S9AURnsEVzgjPxifHiYdNrY3OzMDMJTacrNNaT3jIQNIPDcUjyUQgxmh29Sa3cGpCGcLy+DW6YU3fmp31Q7gtxb+xqilnugkggq6uPRbh75ycaybmdwe9bA2C5dmmTj2muT4mK0GWt6VtGfMr+lfdJ3OK9CGtT8dZv9cLjr4orDHSbruzRQTwqC+rUKtbLGfCcp4sZLrByKGkTb/p+saAy0ugcAuSsXfp0QysWi3Uq/CMIZQTJCzDoLeiVY9jbb/Syh9d++O
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:48:32.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179c846e-012e-49e5-d467-08de8bbc1906
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_214839_090761_23CA50CC 
X-CRM114-Status: UNSURE (   9.02  )
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

Hi Andrew Davis,

On Tue, 03 Mar 2026 14:52:23 -0600, Andrew Davis wrote:
> arm64: dts: ti: k3-j7200: Make MAIN domain system control bus a simple-bus

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-j7200: Make MAIN domain system control bus a simple-bus
      commit: 830e0b0e15ee3d676539346b019f97f9bfae16b5
[2/2] arm64: dts: ti: k3-j721s2: Make MAIN domain system control bus a simple-bus
      commit: af704cad18c0e973c758f41c9337411168de3681

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



