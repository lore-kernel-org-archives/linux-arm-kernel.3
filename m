Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37568CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noAY9NZxtLNkAKzoeB8W2GTdzIWcd+fyH30V6CqPW9I=; b=zM20kdlp021ZNzMUZCU5BTUEB4
	4ctMHPxYPNn1xHrUFvJ4at2QvupPbYATN1pS9P8SHxCP+vxZTkusqopK23SLac0jnXGobj5q4g60b
	Oa3RgGU8w0drzd4sEB97lU/LbFUlyGc9HlcXaUVHxLspS13sio7Htnh2WS3yrEKmsb2zTOaortvBx
	1hxTenWckD2PZZknsFsfoFY7J3YtG+duXyS769OHUBpgIPUUV2WVfonP3RQBVzZ9zabQOCrM5FxDO
	nMcta+X+LIRshNylxUyAAWGL8JjDj7N37lbU7uu4+0g89ZNE8RU4EyBVFadA9/pNmdp9cVVpMHpcF
	ScS/f0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzlQ-00000007qSF-38go;
	Fri, 29 May 2026 16:08:48 +0000
Received: from mail-northcentralusazon11013020.outbound.protection.outlook.com ([40.107.201.20] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzlN-00000007qR8-1stJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOogBxYVaFbSGf+3kVaSCjOy35hc2rXLOIggUEM6hlhwSzS45K+FJYbNhLsBeJGoaXqE+TcQp8rWszNtP2piM49jW+8ZzwGIQEX+fkAcSB4n+1/c6k1dn9k+HK5aimhFJCEzUVB791qab5kdoE6OoCCNFUhirDU4uFzDH74cdWjT2J7AFgHFpMSEWw5isL8hLdE+5hpN/vnLPLQeQauOxvnauPRGrvy39edEGonZsasuLvKns2ToHjop4hjeGz6pSQVgKmAwvguYsD77Yxc1SZS9s13Pl5YbExmkc2N09T0Bwh9v+LLl2je3hPfTz3FcH+tm2sYlsatnX+u3WivWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noAY9NZxtLNkAKzoeB8W2GTdzIWcd+fyH30V6CqPW9I=;
 b=mmiLH36B18dBd7iBgsPlSM2ovjMKCxWpGCeM7Fji/iiuUBArgeuoBqRN1GDGSAJysG1GLmMt3T1f4Kvx4bGvZ5IPpHVRm8pXnXbtESD0drDI2p9cxIuLhX8JvZNjSKrdP45+d8aGS9xtnmXO++1Vs/BhqTzkWY2eIcy2Uuj22c9RZuj31kF2B1Q6oxosxU05jiuzgUgjRvNN/XS1Vkeh6xImzWe9avhnXLFkVmgfJQVYBlEG+uSMlYqUWKoOltTau4U0Ggra8tNguOP05PUPSO4589JvojF/mqx5FP22W4pqzepgax/8on6+1gghujzRIPNVG3pmCCjAynnDZtbMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noAY9NZxtLNkAKzoeB8W2GTdzIWcd+fyH30V6CqPW9I=;
 b=hVy23Dbbdw1glO0pF1bxqQW+1wQUiPsyORCtZAuIn3zaj5eKBjT9QS7bRApb6tnbqPtO9TBYNpjhORyW5evmjKeyoaXbKH4Tro+1Da5RpvnG2bCpj66E533mHsdz7LyMDBZPCMZwHwvAZ/7qWG/AbpS2H5OoEinNnULYM82YyeI=
Received: from BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31)
 by SN7PR10MB6594.namprd10.prod.outlook.com (2603:10b6:806:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 16:08:35 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::90) by BY3PR03CA0026.outlook.office365.com
 (2603:10b6:a03:39a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 16:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 16:08:34 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 11:08:31 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 11:08:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 11:08:31 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TG8VgK3950593;
	Fri, 29 May 2026 11:08:31 -0500
Date: Fri, 29 May 2026 11:08:31 -0500
From: Nishanth Menon <nm@ti.com>
To: Swamil Jain <s-jain1@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>, <r-sharma3@ti.com>, <devarsht@ti.com>,
	<praneeth@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM625-BeaglePlay
Message-ID: <20260529160831.cltcr6wushiozupt@freeload>
References: <20260528111319.3262698-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260528111319.3262698-1-s-jain1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SN7PR10MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 913bc696-e3bf-493d-f690-08debd9c8950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: EnbPgD0ai0GsOZ0Z1AFoRgdO53hER3D0RpsTqc6j29lQ0Rkf1Pe6Kq4M4k/DsbLg0VyPU/J1cBJZKkAZjKWEpzbqk2x0k8yBIFEzxbbXC755AygysYkYa2Wkc5n9l2GTvYgI++DbgJcn8ZhMSKHJrM6dF35d0LXahnEShV1YRv6aWVe/uj8GES/CdFTxQtF6ecR5E9kmrLCScmP2S0LiviRZ4lZrsQ+OMNWn+jo/RadtTJ1iN0i7P4/P6e1mJKW0ytnNZCZdtmz/bH35ll429wmTdECaL/SdBnt2oMCoHgRzN4SbOS9HL+pEQoN80/6lUvCp+lhs/f3kCfklSV/pC8aGOI9/bkb3h/58MUaiX1b55vIMn0gM0w0+7nAn+dPzmy60+dhIHmIokL9Akn7q9wf+kdH3jwAPzzTQXOT8nOiHxOEm1tBAvv3zLcORgvDVeQqVSJzkSA6PM6iGORb0I33HRpKY3UIW3jWnrKY2shkw8sQFGnZXxF1Of+QqjQ0vEb/2yR3/rioADKgngvvGS7xYpcMx/dg5Fdvnmb/MmiolEM2pxGW7c3aueX2JS3ncdXuMVzvhp2EgG0bdfgqO5y3f70fjTLAMkQeVcN8uR+btgpEU+fGwgiQvKDJo1C9g2GakGcctgpN/XTJtKwVpu+Mf9CmUp6Qyy06uHNVafYtyZNC2NNHA+oKDCdit0zu9
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N+l2qLkuNGDk772gHqu1d1WnQARPA0PE3GcSqcvQ01fGJuLnSsS1UjTvIzFg4rD0I8NV0iinbt54/YTHf1Dx0WlMH5zZjQDxDQ2Jcx8xm9VnIwhes/DZV35WTQaz1F6V20SKWLEXUWrzLgBC/CzGryIosFHA4Hh1RIYQAoLIx+7cEkD1w8MGhbku57TSX4omsmLjZrsTLdHJDGqhVXUKlGNlOGhvMJlo9d658JVHTbY7/ESxYIjcZ1Q0Rjnb1gBru1GaX5XD+lQ8godUTVhJ5G/7B2EPBwU1L770EHWUUVNpTZc8Cxh4TU8oGRcAekTIj5RCECthrRkZXlSJqDdhVlbI1pStCXdToQwxUPVHxUoGn4CCwy5CjBY3QA+jnB44hnmCGmsd/AftJ7CBVUrw+8rDVbipoeCGjfXdY7D7kHRsNgq7+loj+EtyECd0GMk8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:08:34.8155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913bc696-e3bf-493d-f690-08debd9c8950
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090845_492727_974A8BB8 
X-CRM114-Status: GOOD (  10.74  )
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

Please fix $subject  - something like
arm64: dts: ti: k3-am625-beagleplay: Add overlay for ....

On 16:43-20260528, Swamil Jain wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
> Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
> Furthermore, it has an i2c based touch controller: Goodix-GT928.
> 
> Add DT overlay for the OLDI panel to connect with BeaglePlay platform.
> 
> [0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
> 
[...]

> + * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM625-BeaglePlay
> + *
> + * AM625-BeaglePlay: https://www.beagleboard.org/boards/beagleplay

Please drop this. we already have that in .dts information.

> + * Panel datasheet: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/

https:// please!

> + */
> +
> +/dts-v1/;
> +/plugin/;

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

