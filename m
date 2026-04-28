Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA46FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InetGST7l+/ODcoF8+EPoQeQG89iAw5nllVsRXqM71g=; b=25eQZ+aS16uyW+xuNb7XgEQYMy
	Uh9B86La5rvs/UIVIejmpfjBwy5+FwCl2toBHDYUcjPo7YY299PqeUBlk1dh6WgNpAUhVlmUjIgqQ
	07YI5ceMbv6nym+osEgZEJRGZuo/nTKYWDEPtQ6fFtB2nDatfbTK6nFiByLT0TszorurybCSIdHW9
	g/B/J4nYxd6uam5l0qAd0QhgmYah1GBKZqJe7ULRNIfufB4RI3SwqkrMvSNyj+FGLKR1iQcJW6d0u
	3lZWtmb/XkDAgROYK6TZUioW3gJNd6Igwhv3DsQDUktlplm8/wtdudUXsk4lMQze5b1VlscHTRXok
	LfT/BP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfU2-000000019Vq-3cD4;
	Tue, 28 Apr 2026 10:16:02 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfTz-000000019U0-3TfC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+hWZxE2gmptn6mAboBBYMNopYecnlPsrMi7xqIQ3BZfPK96ak8AivaY+FaGRMrL8rcxSl6xEmHcpQ3K4ReVoPJkUqltH9K871iasBVaLcJJkDdoNFQ54d3NYp7mIIhiNjewoOIg+NfFryIgMqv9rRBROrpaC+NzX6OPKp3U7rsWxHDOhVR76KoYmnnGLEszBQ8x6dIr3L5A6gdjBy9iGcSBin8ci9Cq3rrHVnK95mpZYj0aFzqP0wiiFWbL+0sN0cWCHTdEm+AAcizhO/Ea+c2kwcjSNobD/e9iF2X/rp9iyXu0W3+9KL33SQFJZNtphRgPwLaIZgp/dluDvvKiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InetGST7l+/ODcoF8+EPoQeQG89iAw5nllVsRXqM71g=;
 b=OljGGlOOt1Ew9lTImKP1v5AOUxCNcbFKbTjpia8Su4N38s2Wnzren5UUge0mFdR5HdsdVJHRb4VgLjionkmQGXAtICK6Y4ccjFedDuliYn8nldIX62+/wgNwGv70HdxsKQhVLKwvvYDhM1AodqbmZuJWAODd+QUJV/4BoQGjU0gfbA49ZMz+D6V6+fh9ojWKMBQ+bXfk+f3GdaZKl+OYVC2X6xcjxy427QHimErIRXwdwo+PRgrl8ET0BKeF3WIeFvindRizsPoX68fRUMuLNihRgtAu6bctG/E+BGCcYxtAChalKeFB5+Jo1JGkCQCS5P5Mdo0fWiCe5Hy68xuogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InetGST7l+/ODcoF8+EPoQeQG89iAw5nllVsRXqM71g=;
 b=Y2FUbHp/3yK+vSdNETdvYbvCxn/qiTy+1XqKkRlVLJP1EJay/F6qZQzCBBUMAP6xfaHUjIO3Fm7eYXdBhVQyUh4rOg/ki5ykwuf6WUrtO2kJPawa4Xy+t6pQx4GXpmO0ErtpGeDoGwHVak3HOHqLjAYDjTUkfFowtmFL1pfeayE=
Received: from SA0PR12CA0009.namprd12.prod.outlook.com (2603:10b6:806:6f::14)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:15:52 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::38) by SA0PR12CA0009.outlook.office365.com
 (2603:10b6:806:6f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 10:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 10:15:51 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 05:15:50 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 05:15:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 05:15:49 -0500
Received: from [10.249.134.231] ([10.249.134.231])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SAFibP982649;
	Tue, 28 Apr 2026 05:15:45 -0500
Message-ID: <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Date: Tue, 28 Apr 2026 15:45:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, <a-kumar2@ti.com>, <u-kumar1@ti.com>
References: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: ae707c20-c3c7-4194-8f27-08dea50f1fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8RGGqa6z8d4l2cIiapNhQbny6U5H82Kk9IlaiorHOVtNuU6TjOQlzxMelKAGz6mqCkdq0HImqU9oVlDpG5jUQYoCRA+S/CGiOdPNVN0MHBk/fFLC0Cw8Z3rQTVXuZmxrjaRJGns+yD5qhLex7ylpIIRJ9oHI1y4tf5C4bUgYftu+EqbCtrrVHYGA49KT5WMqov+sZW/oANTYh2G6vRMv2Ch2N+q4JBixesnPpBuhO/bNZvz1l3+u7y1AaUS0woGGatXpYdYgkzd7NB8AYwjyFuJBW8LNh+W7txBKQNejWUjzQ2AJQE95KviHIJw/eBlxcsJYdFM9XNui5JqIXBsQtmrzxzjoH2KMwP1RmBWwcDit0uWxTWpmZ7y5SeOXatuKdHyr5D7CngPbYOimwa21Ls4cZ4dITn7NUcw1F/5cJj8irJlHu0VinRinLf4vlSshj9QPPmZmuhsMzoDkSJk4E8kwk39HBqpAZRo7NaRFS7vjuEm2rb/ogzl/oM+AQRk/gExbjW9AYA6cp2315Oj5MwYql0bNn8aCD+ltfiJQqIOilr67Uzf9cLcvQdhVYn9wd+nCmAKLF7og/9RyTL00BvxvCzZDvVzANxMXUnEjszaEfAF48SWt83YgYS17EzWulu8We0aiduIhjchAXxLRkxWKF/D0fUhFy/1LectmPpPLYIwI/pr69KtDKAMUk6L4W3tnwNPdxBYJjG3xUcqz7FS6c2xUy/f/qOB0DwBR+5faV396mltaqa+8cceXQRtVJKczygpSni09s1tVev4ofQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MnqscwMjyusMewP0XRc0XZnhVrm+oc5pxsAJ9KpIvoSRzfuKSFsAL287y2VZLOXQZVlzrgYg1/vJuw3nnWM+PQ9LllJCqpYmVgCcLDLuzuwtIV8a0p1I/ffqAB2+0nKu5WD6hMRzKR12/deBcQ5pcXxa3fILGV0St5w0IVyE5lBu0VQGM/T9dz5OVERV2jvyeBAHtPDO+c/MfbQto0bClTSe1JS11nCgA3BIDzij+k+lbpdWa/5OZYBGDvI9lebq4fowOb5yyjYtsXpxorviDadXotme5QhrWQZTQEXApVwS4KAgUgdsMgX/5hXQgMcSCQ+pnHUfvgLbJGW6PLojiwAglnjbFuh78nMfnCWx5o631v/mrgsRIM1QAFgufFWxKj6bBokG1DAxhro3Oj2eJKVmiFn3i5A4IRxseFuAFw1I3TsmnLqqXpG23OeWVMvD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:15:51.1221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae707c20-c3c7-4194-8f27-08dea50f1fed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_031559_956678_BAC12311 
X-CRM114-Status: GOOD (  13.53  )
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



On 4/28/2026 2:23 PM, Thomas Richard (TI) wrote:
> On j721s2, pmic@4c is needed to exit the DDR from retention after

pmic@4c to PMIC-A to align with schematic, please

> suspend-to-ram. Add bootph-pre-ram property to make pmic@4c available to
> the bootloader in the phase that sets up the DDR.
> 
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> index 12a38dd1514b..a19e535f4946 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> @@ -250,6 +250,7 @@ buckb1: buck1 {
>  				regulator-max-microvolt = <1800000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> +				bootph-pre-ram;
>  			};
>  
>  			buckb2: buck2 {
> 
> ---
> base-commit: 59b04cb2325c07ddc1cc7d984bd8c8f89f161746
> change-id: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3
> 
> Best regards,


