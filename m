Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F77106FD98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToGnh3yeB71hHz/0RKbhcnA3sjL4bLBovhtrQ1V7BRM=; b=fhRRczjH7K2XkYO1iS+OWRnGzV
	fRZDAMraVbTb2UHmgGJad/JgWHLxGO8xrQc8lGgPS0qCS4j8w3AnVFbCLFyIRj45+3MdILL6Kxft/
	in+upUW9s3qXC77fC3qImJi+PwxZVA0s5yFVG1dQoEQdcTryqkJ4Z+8PRCbRU9fET0k1CyHSauXgB
	TqcCiX6YXiHSog+BIWkVQzYDusgld2PzWoXx1NmWB5BFXbIpBPSl++J921fOK9VyK46bLuBpL9xy0
	Qy9kuFvaHUHoZ6V3eABjkig7JPVsvxaMLfRHumSCf2lvVd/6SNcdsPMmHVYg6rM2g6kepsGr40eKD
	6ZmTPUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xFU-0000000H6nC-1FWM;
	Fri, 13 Mar 2026 07:47:56 +0000
Received: from mail-centralusazon11010041.outbound.protection.outlook.com ([52.101.61.41] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xFS-0000000H6mC-054c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYkQJexqfZyaIX7bn3ICG6jx8FcEb1/TXcokehcw6Wh/QMvuQRoFYDOlic7lGXAHKXlrk4mnwzyjbcjVmSPYcmkheMlQKxdYEN8m+KCT/NMcHlxauHlmh9x5mLJYnW+g8gZxFsXdAfPcnivKOl7DY3Ndlh5JI2ASWbjyJ1r90TRRIq13MK0HJov0bIdMbGz3B/GlRsX91Cbov4Zzec9JeJ2VXQsFedwKPcbauz6T/O4swZHzgd9HENzOZ8lHdObkRXy0QYZBW9qNgp29yDxJVLBpp0EjlIByJ9QmnvXxO+10xc6TTQGJTADb7tlZNdtOfNWOSMyiP2//3u3CHRmtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToGnh3yeB71hHz/0RKbhcnA3sjL4bLBovhtrQ1V7BRM=;
 b=hKLo5kdHBBJq5Y+/NJwY5OAA1aRYjGjmgO4bjv9oGKjkXpKjJDMyVsLL2JnP+TnRQ9FhffHF7Wd6QrSs/9gFdWFWXkXZXwkODkVr68ZUdoGRfLNRgxKvZB8kLmnIm3y2+k1VCBcVH+Z8xedqduM96VWKD0mjPpMqpYwrljmhkiv7ZUrZXitjWRn07BuCn9lOr46gTPLepb6SMkLI52aLnXu5wKiuL50+HHPHJgFkQKMYlssMhi/6V/k7Sfe7VhejuzWCbX6Rk3w2U8sRQFgcEcPIkrLp4wQZVzTvZeVeYiU/98BRHs8CmGphEBNAZ3cxMW3CGSf0I0tMCbxOrE5NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToGnh3yeB71hHz/0RKbhcnA3sjL4bLBovhtrQ1V7BRM=;
 b=D91Onl6QBupT036WMdKK79vlRMw+SpA6lm0Hcmbw1u+RuTH83KQgLhV7r/RKhWFAipdejOishPMzyTGvi0eWuT4YS8psYjdUS/YwkxY9n33Fbccnayfhp4TWjPQ+/dKU7OQIYNrcN1smBwjWCqi0fEucZFzpYo6DrUGAJ4RWtxk=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 07:47:49 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::d3) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 07:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 07:47:47 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:47:23 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:47:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:47:23 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7lJNv3847731;
	Fri, 13 Mar 2026 02:47:20 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Franz Schnyder <fra.schnyder@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Franz Schnyder
	<franz.schnyder@toradex.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Fix DP enable GPIO
Date: Fri, 13 Mar 2026 13:16:55 +0530
Message-ID: <177338196935.240421.13983455283267702229.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260202083604.325060-1-fra.schnyder@gmail.com>
References: <20260202083604.325060-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA1PR10MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 637f181d-4189-4f18-8947-08de80d4d1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: d+KuvUidfnMKQuq0tmgQBmgirOm6rlj84GVk/UeE41b/rjr2GjR3FBRVHaWMY4mdVHcB4SwGNN54K8hZqam8aqlmL/tX5u6WJM7E/di8T3VFQ+3WZ66owbCi2vfp2dqmWNentKjv7OGYjuAmobtaghduFSVcyuj8gm2je0r4VXqZW9MklpIgtwMeU+pQQTRAbwzF0cbcCYve4cOCipYPSBZwOn19IXsS6+j4Llcm/OVqUJc8lKwaD+iDWhgxISjpV2mT94JRbxzhyZk9KIDJbT5VfpxQ9HU2gf5SB0pLyBmUzFCvaiD23sr9irfS0OnRY5Dpa+PvjOxSTfAQhZeVlbAm5Wk0BOFF+Fe1bpkTE9VPMcJW6VPo+M/S5zpPlgtTh3z5N23hDiImLlncCebOgWiUwkwDBJzdqYcU4fhUXfXz69RFZk1lRk0C8ZPnd1QGX895+caDciq4N0mxuzBQfW0z7T3q7M+/48/scmJyl203EPTPRGh8Sqa3wCoXkATNiJrCpHOtDbD4Q7JY/eNs34OnsWi3CHms6MeP7i3qVgm9WHkiHV+iApC/tgvEporokbmFqi9zO0ofcjLrXrFU7QzvPlmsuYpVBZ5rMk2xIQEAmduvTwpeAEIH4l84Bb1vJpYJoH6sYUjnjFwD1isKPDILRQM9W4TC4qb2CpT2Q65afMEr8oEXHFpbVqfPKDZVXKFwCFs3DJOHG0/7tWK/W1A20wdmV/JSLITPaFywNMg=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sm0ya9rTEd8kp6YqNN3jRAcr4ko+hGC6YbTUgl3zXCH2+7Ecud7DwYy+8zDpd5rgzVuLEKg7f8inkODcs0NBy0rYZaB5FxTC3fhra6/uPERDm1yJfvuEFBFF5YK6nRxPa3zlrltnVG2z+h+RVAAA+/N/R3YVHlqn7GHyRDOVQnhT2Haso7vNEp9YhR2MIC5ZuFqmquux2kAQsJMtBsjMlh595CaKG2aEh3kj+61F8VaoEebog2TFyiVoy0yMxYPZxOkSQLkWOkPQRVTw11v4WbOLixNKkr24yOJOBL7hRz7fKnrKnWtyjAsQykwUXdK3aLcf85V7wWUZoZ+aqVQHQlGRz518OaLSASEK+thMnAQ4AE9yqgTIWYqltP6oCIOjxwpIkcGUtiKM4nmvmNr3RTMYvBXEml+3uD6roZ41i2b6ek00cgaL6sM5aXwN4Uqu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:47:47.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637f181d-4189-4f18-8947-08de80d4d1b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004754_061375_C6B2B90A 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Franz Schnyder,

On Mon, 02 Feb 2026 09:35:59 +0100, Franz Schnyder wrote:
> Correct the DP regulator enable GPIO to index 21 on Clover and Dev board.
> The 3.3V DP regulator was not being enabled by the assigned GPIO, as it
> is routed to GPIO index 21 and not 37, which was causing instability
> with displays connected over DP or via an active DP-to-HDMI adapter.
> 
> Franz Schnyder (2):
>   arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
>   arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
      commit: 222191225e69711089ecade3b98d79757d51e907
[2/2] arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO
      commit: 8cfb2e517113543e0de9e8df5754d5e09cb3627e

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


