Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D7FC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaBklIEnXSs0wqdbLYG6OP3wkbhIDgt/D4Zh+qG2Hw8=; b=oCxKjp0+aEFmzA2mZ7KDYCInfy
	IMIxDypm7o0AThnHg9a7qCfOGr2ATEvQtssOnbu1kjZ6hjNxrEhpjIrZqzO9RTpN6C26uIX7tgHr+
	FDp4ZwD1ITkoWCe5UyuSLLwOVAbSK4PMy5vm4pDaH9mFUIApahDnlejD3Jo+uIq4hUfLqIoXJkHdz
	Wz1gLTxW8tHt9E9dV5fQfnLf2ua0qu7j5bfhbo5Pdy0OdLwdqCCAQX1hSfaksGZgH+LyambIbkbOz
	kBcK2Xy1ZWb+4MZ1l4c/bn8P/o2CsCwNVg+ODH4Cn/7g2DBYEFrOJa+7I4YQMOAdBJCsJttQtpoC3
	CLVHdSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKH1-0000000H2BD-36xU;
	Fri, 24 Jul 2026 18:05:27 +0000
Received: from mail-eastusazon11011019.outbound.protection.outlook.com ([52.101.52.19] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKGv-0000000H2AY-2eGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IId4KfUZ678j8JbTspyuVUegRWVbo0arLgrWoXtu/C9qXYgdgZnLRYkRh7zyabmoPq38v7oM6uGMioCOvWsf0qaee/kryMStVESK6n2E/q1esS4ZHzyxCo6u9ZpXh3tV3dWlE+W5n/ZMjmIv3NpGvTl8dETD1SXFVg9wAOMS0X2XUE1qV752q1ZMQUS1z+23yc1y68QXTWxb2ebbzB3/JXKwInz8bCwlE8OSLPA9L4xTS8y3YZqpG6z0NEvQniszRwaQkNGIkykCIjZ383QWyJsRnF0tHDUFJ7oXlyJFgV3QJa3/nJgj7ewvNFw1CeqIER93tZ+GbPrFiNnyvhHm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaBklIEnXSs0wqdbLYG6OP3wkbhIDgt/D4Zh+qG2Hw8=;
 b=HMWAx985omt7yJ0l3HSSRnlsXKqdPDPcKTs1c87r9T0J8D1+uEs4wWC8ZN/Z9Pd16DozuzWQ+/LEHUqclwHWkxB4KZTLLshmKQPJkTJ6AFQt8wYgQ06rTxEvrMgBekn5T70SUWf0yfE2uRHN8yTZ/Ye3DNOAt0nEJd2CT/bmoWOOYVfkISW0R98ksSZi1EiW5Fy2mr4p0Q4dzSeMF/ndqjFjRSN4aPi601Rsb6F7RAoq+p8JcFkEr14iEES4s5MDX0bE3pQpm1+QiSN1qZfEBzdhGUn9y3tanJBq9zIo9BV6mCNI1ornsRWDo0RSuEiVz+MHINZlA2XR3+J9ImK0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaBklIEnXSs0wqdbLYG6OP3wkbhIDgt/D4Zh+qG2Hw8=;
 b=qF/9jx2MyJ/796pgWYJyp6ETfpf6rAYMO5KC0rrq97sbfd9bYwbHKrfsiWjTqG1Mfwn5zRNBblm5eZOhXFknRCLkYqx1yA4TNKAytmwCUKRIyq50V+JWbHHP0tF62eC/lxGDIFxG+Ba1yaueKw+777akcGVQacop0tp3rgSMVyJbKgIFIfEgQTF7onXUoNuibXMwP0fH1TDjhka2ljJ9hk9kZL/SHxeYHw6ju3q+DGoEvh4gCuWYR1nmB1XqO1PGP0ALlLErgU9XhzKcoXHL5Sv1s2+pwH/Y/i5B7hxK7O8vXqhdKBjHhXbn8P4P1WWm98zVRpwXuqtkUlkixA9ydA==
Received: from MW4PR04CA0185.namprd04.prod.outlook.com (2603:10b6:303:86::10)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:05:12 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::5c) by MW4PR04CA0185.outlook.office365.com
 (2603:10b6:303:86::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 18:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 18:05:12 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 24 Jul
 2026 11:05:00 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 24 Jul 2026 11:04:59 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Jul 2026 11:04:58 -0700
Date: Fri, 24 Jul 2026 11:04:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Peter Griffin <peter.griffin@linaro.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Pranjal
 Shrivastava" <praan@google.com>, Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel-team@android.com>,
	<tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
	<willmcvicker@google.com>, <jyescas@google.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
Message-ID: <amOpSPmc36+YXgCQ@nvidia.com>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cdaa8a-de48-4a48-c726-08dee9ae1b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V75vysgnBPwo9VAs6GmkJ11O9uyThw7B8+d9gL6poEip1Y+aNHhByccK0lVgrpnSP2ywFc2qvjye5Yfp7HKcP7/h/2NETZ0b4Jfh8tMt4GuaUUeEgYzB6adn0ppOixUW1DyF1WSRHldQXcSjZjhIV9sXLyXiuFAeCay0AoFOOEOOBwLDfLkUOmJydwX5Y74fym71uTr780pWiWNdni+JhjrsLadk9syT4XHIURyX0oPc7d8MymqhnRlQK5tfFYPySY8rRudHqBnu7Yi19rrDSZ24HL4zzOAK+geudcBabAHXr13ly3ySxIie6V5OTBwzmpNi45Ko9MGxPo0f6OvnxDR5EGvtcJ2JbAQdipgBSqdcMn/qzui3JHk6/eoabDyB8tbJmaMDTyuhg6Ob7qA2U7te6+TtgmrYlHJB3ErRsXEyDhAzy1cHgL+yEmK0iZbgwEW6Jmxt0mIuyH3KMmQYa+/PLcV25LgdFypCZ152y3xdBG3+745ZPVEBHDMqgvviQbpHvftYoJa4fSFzUa/GlgvRJhIOTHS9wG/GMGPp8+25vtrYwVScrkiYTNcyXPp1gf2nuOe7WpFelBq2C3cpfg72tgBpa6uVNDlINP+F+O03EgPEoXXH4l1IOUeSQF2NHoDXmGOzOxfA4znl3TG0Ja0FK3ffkDk+ppQVZ9VKjE5fGeqa2Jdff0jkNeGK5Qi60XSym+NVRidg17ZNkkRm3w==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Msapzi+1hEuc0mFGNp5mybScohmIQJkOn6sRPmKeBPAv7eSboQM5bGoYiEWr4dqcgExVmwz+/kkMmE9zJS2rxFZALhWPuYLadqQJdoeGa9/Dw9F2uyR+2qZNVEckAhGlkXe+aSY7BXwHeJVtQBnaYiRecn+CK9oeWg0qCKobeTY6ZAXAVXYcPv6Yynesd5BQPlm0Hv1q48Dw5hYr72eW4D4os6WdI0YlMFHDb8eJeKS8P7iYruKNqgJFhWRK6G0XAUF6w8byir0fWevgpNX15wqueKwoeao5cYBy1731a/rKpuvplE5Det9KIXqagjqwYQqVM5ujD3sdDZo4WuuWZYFlHAzykYYKZIkKPVwsSaZggvjXZ0k5pVzKsXBSIuCWO//0rBvq4ZxNyvF3WxwNy2TezR9UCnPuFcAaD0+YishuvkVfmairhI7St+ddwheh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:05:12.5424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cdaa8a-de48-4a48-c726-08dee9ae1b5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110521_682994_68FED888 
X-CRM114-Status: GOOD (  11.56  )
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

On Fri, Jul 24, 2026 at 01:39:43PM +0100, Peter Griffin wrote:
> @@ -1206,7 +1207,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>  			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
>  				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
>  				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
> -				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
> +				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
> +				    STRTAB_STE_1_INSTCFG);
>  		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
>  
>  		/*
> @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>  	if (cfg & BIT(1)) {
>  		used_bits[1] |=
>  			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> -				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> +				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> +				    STRTAB_STE_1_INSTCFG);
>  		used_bits[2] |=
>  			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
>  				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |

This adds for "stage-1" and "stage-2", while missing "bypass"?

> @@ -1835,7 +1838,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>  			 STRTAB_STE_1_S1STALLD :
>  			 0) |
>  		FIELD_PREP(STRTAB_STE_1_EATS,
> -			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> +			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0)) |
> +		FIELD_PREP(STRTAB_STE_1_INSTCFG,
> +			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> +				   STRTAB_STE_1_INSTCFG_DATA :
> +				   STRTAB_STE_1_INSTCFG_INCOMING);

Sashiko pointed out that this prematurely closes the cpu_to_le64()
macro.

> @@ -1887,7 +1894,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
>  
>  	target->data[1] = cpu_to_le64(
>  		FIELD_PREP(STRTAB_STE_1_EATS,
> -			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> +			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
> +		FIELD_PREP(STRTAB_STE_1_INSTCFG,
> +			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> +				   STRTAB_STE_1_INSTCFG_DATA :
> +				   STRTAB_STE_1_INSTCFG_INCOMING));

You might need to set in arm_smmu_make_bypass_ste() too.

> @@ -5087,6 +5098,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (smmu->sid_bits <= STRTAB_SPLIT)
>  		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
>  
> +	if (reg & IDR1_ATTR_PERMS_OVR) {
> +		smmu->features |= ARM_SMMU_FEAT_PERMS_OVR;

Where does this new feature bit get used?

Nicolin

