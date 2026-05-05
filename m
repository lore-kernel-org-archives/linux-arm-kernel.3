Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C597FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLRKjY+dTk7MNtndcoc2Nm++WwPduDsu+jujhCsW/MI=; b=2RYDWwzfAUdszWqvAX6OpwGPdG
	9FyKJOEhOeOBpViJG+mr1e101UFApnQdA9NBGY9n4UL23W+86p3PPmjRM2ya/17yj9c1npByYSDRK
	pO0Zm3yCxevImLXvP/v3tfwzn5zCX/HWiOJWnnyu79uRUjr5bLQoaildGudTVn85WWo/V1+N4hDhH
	cWKeuybDQBXUdyk7z8zd4MAIH9lIfJmgHbAMM9Divk9hlgOdYErggJJ96gfzfKWKEjKMA+ZC5vCHC
	N5CGFbeCVmkZAOUdohLVkJIFq5/kYDdntLYd6gE6SLZF6CiUVQlipp5rWUE7dYoPwS++E9xhJq/Yz
	w9MwqFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGJo-0000000GPdV-0FOb;
	Tue, 05 May 2026 14:00:12 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGJk-0000000GPce-2MYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeeByqkojifANuistrLzMNyBKa7vzhhy85q5dD3tpi3g9vxyVS4g5JcWPyVtYBq4y6qafoiw5poonWOrlj9GciUGBSSWPb8maAuVc0+Zcu8BjJi0fize1VFb4oYS0L77L1dc4Oig3sgWYDoDiYjuSzb0RiIHptlXgR+7YNIMqM+QECwrCDRwB3IjoFdNqQ6vD9a3Voazwan9/SiSSG6yOgMAsiuxN5NKgfphmtj7Jw4dvspnnjlWtBHA4lObrLiDU0VpEAJwYC0YvszedUZqZ7AD+GHqNzblWsGOlLwgjIwlSOUgXC+uy4tu4taPMqV0gI585hAc8HAV6iEeq2qJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLRKjY+dTk7MNtndcoc2Nm++WwPduDsu+jujhCsW/MI=;
 b=V7SDzLTMG0nZEseGgdTd7FRwS6jEQkKjhaHQerJxgTjUcW9z0zyIpQhcc3cJuVBYp/k4Jcvdf8wh4ESe2b3yizXpqCKReQtGoIQIecAp+gTqDoybhOHBetGg9CHLvsFLxJDoCvDsOT6v6gKbz5DWMmcsHt/kUOKUH6nyLGKZJzKZHjIyXOWa9PYzXkSb6yThNrlMmPjh4W/IrVu9drAjW30bRPDX0CTa3GLiA54twysiuuU26A5i88NE+POijfBd2uuFlJzxyvcg3/wG92d++XIDwOP50rZDSiswAJcZuIO4pkA9IfnJY/ShKsrgYeN48Ngxgw2gNDrcVC62arGxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLRKjY+dTk7MNtndcoc2Nm++WwPduDsu+jujhCsW/MI=;
 b=Gp83Wc0HBFhTT4/G5v16OoXSrNrcsb4jS/LMjygbDJBDrKNi9BUx4pXgjM8Te2cdd0lt4eeIq/U0Bk7dq/IiLkJyxKY2eUFNcoGmACqWsgG9SswyuW8am6TUMFC6krJREeCZKdltPtWibNOxaYHCkgUhy0HQb7W5QIaMZ5k9okY=
Received: from CY5PR13CA0015.namprd13.prod.outlook.com (2603:10b6:930::24) by
 DS0PR10MB6973.namprd10.prod.outlook.com (2603:10b6:8:14d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Tue, 5 May 2026 14:00:02 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:930:0:cafe::74) by CY5PR13CA0015.outlook.office365.com
 (2603:10b6:930::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 14:00:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 14:00:00 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:00:00 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 08:59:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 08:59:59 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645DxxPQ3101012;
	Tue, 5 May 2026 08:59:59 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: Re: [PATCH v3 0/2] Add AM62P silicon revision detection via NVMEM
Date: Tue, 5 May 2026 08:59:54 -0500
Message-ID: <177798958251.336362.11127694530585425048.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260209172330.53623-1-jm@ti.com>
References: <20260209172330.53623-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|DS0PR10MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfd7172-b2de-44de-ed09-08deaaae9974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yN1kWcUqbo3/q998fBgXQfDxUiwy/aHqiRG+MhWqTevd+HaOcxhtoTTNzDLw4CDN2w/l4vgY2CVXmSgndHCxdZuCc5F5l/rk/NbdXv6FTM3EU77dAkVpBye9A2CV8JixmLaTcoU///wx4zlhjIJepIj2wuRrD1bLy2rAhq6luuERokUZcrCLTTFB061PEHlMeMqOimN8gJjKWoDg2GxQJZtwQ75nbpLq9Z+rIWmwq+PNOW7PCK0khhQ/973VxFpcfhqakLmEtpxcvwjTuBeeKJFWUpXuXXtDnt4MMUEUfY9P2/30HnP62VIP4WxDCJiz/6ZUYg6QpBSlawADabCiIY3xyCuzpcBK7u6eoTshTViVEcVbT+ddMhad8A+asohiYWdhdhurpMKKlmPyMiNEFYSkjy+ZkLRrMqZqv6KYekUM4Krwze5f8JDKy6OYeoiLi+hasxpNY/rlQzsBADbCUU8OdDsn41jmebPUYOqX5GzFLPv3tdEJ6iZjSHyzCR1TBlkTJoXet+5w6cBzzxqbql8sLfj8mJRdn82WIihx4WpnWAXE0yBSjSpGyJEaCMgHKnmsYCZI3g2nIDt7Rqt8yAVGvv5ozhCONsc8eoTPIkPsrG+zES9zxcyPX5FqOWAfwHsyZIWZkmM1uocdyf+85UIL+khsRBTs/BX+JfKJE/CV24OYLbHRRfeq2sJqraB6WbzMVwDJZ6woIavmVi/pld7SnPYEDsp3a5Y4P0ObgLs=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rMUU4v4ppXzZyiuLuoS7RuS+1Fe2i5IBy4A7af5YuOtCZbJj5M0vqQAqO6UmyveeXrvp7S/juGeGVcoptg+KKRh7Upy4ACTIxtpsJymV37nMgwUoXaKOCXTaZW5sYhaxkcL+BXZouQVzNxd7AmxYBc3R6T0V9V9rFrql/j9LPz5Bc7LFM7Q1zIVtb7hYFniuavrx4qIsd8xLpxWwDTEdHaeJrxoXGcnxNhocuhiLzbFMEDe5uhjEExwSNVkYjKqeEBmZpMe2WApVwpa5NUCSU7NN3OUyb3HSQk0UVuP4o/H11G2N0hoFgGnDCnzO9CJq1+niMEyMQAAh2+QMQu1Y/EJ9Ewa68baFB5TqcN0dwwDMEO3pVD5hftSsxPlvnwkDNs8I2XflDsBDj4ggcP4dsOucDzEJkmQaDkkXFMVhioZsLMjKF+L0iQDEISWbQaUS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:00:00.7140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfd7172-b2de-44de-ed09-08deaaae9974
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070008_707868_9A7D70FF 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Judith Mendez,

On Mon, 09 Feb 2026 11:23:28 -0600, Judith Mendez wrote:
> This series adds support for detecting AM62P silicon revisions using
> the NVMEM framework to read the GP_SW1 register.
> 
> Background:
> ===========
> On AM62P SoCs, the standard JTAGID register does not provide information
> on silicon revision, instead the GP_SW1 register contains the information
> needed for proper device identification.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/2] dt-bindings: hwinfo: ti,k3-socinfo: Add nvmem-cells support
      commit: b0ea5175358f0872ffdc9c6073585637dc01815a
[2/2] soc: ti: k3-socinfo: Add support for AM62P variants via NVMEM
      commit: 97cfbd30525ef0df3de0681a4ca04a80a06d4f16

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


