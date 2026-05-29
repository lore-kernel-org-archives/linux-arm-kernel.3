Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3FCCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlvcSp/rrpHFLtIpSLyFhaGHVz7gzgTDiD7PFPIB3Es=; b=wbCfQnfE9XnTOBj4PSZeOHAdzz
	WKHLhi0UB9MW8iUOLhdNHLHGQsPrxP2pOdnMcXYtLQS1h9Em7kEnrqo0KOxXdP5JV/tZ2X+2vKJaC
	GPj9tzcoQPJjGiJIVLNaXGrZkWfE8eFziIV9oCAlezCVIAYfaeT2MttLE50FefgScxmu82gDspXR0
	ZoPW8sEALHTxmhRr8NnbzkWYsUOGhwUvXmLa8jxGnr3NNMX9k9tme07ak2NFuth37EK8pMlbIHu4E
	n27TKcMQkWmOhIR40/5p8CuAHlQ24Go5WtlcPm6HMMkeP3L/a7ESoDTOfQmSTO0SRN7cllw9mm2Oz
	eyM7Y9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2o-00000007f9a-0QRa;
	Fri, 29 May 2026 15:22:42 +0000
Received: from mail-centralusazon11011070.outbound.protection.outlook.com ([52.101.62.70] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2i-00000007f8J-28r0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB0UubKkdka+v00vVTlTbKkgTYW6q1pG1bdFRrYiUCZzgBS3mazuqZjwMyGx+jksDmwZpzp17UfVp2IABPkD84zfGpriM8uAsNpOatg9sBAFynMbWNnVhOujf+hGNgcltOy5CKXUZN7T/hUF42Mhw/oTVfUAkIAy0T8/w8xNZkTo87bB4bPrrO0iySu/CV5fbewMe+Ts3Hy+PeHRMMf+JSbBx8jBSF1gXzx9zn5A+CPPMqSw53vaIfivAt3t+kB9NpSZTjyD7eEvEhg/abUVSYgm6ddwOVJoONzIcxS3roH8OwpmtxU51slN/sRyzovsIqRRrfZ0zqJENkco66pNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlvcSp/rrpHFLtIpSLyFhaGHVz7gzgTDiD7PFPIB3Es=;
 b=eyCbcX8ii7KNNBpev09bBPSH/9WDuhE87yn2tcy6vkMC8ZJ3sG9Zj3Xl+ItJfNZxpbvd1VBjcUb2C9QB5avQznMBS9deS2Y3CtWdO/lDWsbqlh4p6cK7sKqgtLPD2jNM0ZXFkXwW4cbwnHB+0l6S+Rt+ysYiEHmQAPkwSnm9NQtX9mX+VQxFtRhuv/GiJspzFvfYu2pYC4qMlDHhuZFASEqvEV3+4CTGlju/+wx2d52OVM0fWStm3aNOCBQHkjbUVz2FnqL4N13hAEpRkvPLLIoLARmoHEoc0U04tY6yEaSh6tPNtNKkLVacT4z1RuTd5NzPuNc1uIrB2Oodld3m8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlvcSp/rrpHFLtIpSLyFhaGHVz7gzgTDiD7PFPIB3Es=;
 b=d7RPQzyz5Lf6sgC79qVEHAdvspNMJ5TLgF9Fk8yfqouCsy6ve7FkCdGprpl5DgBpKMB+RASDBngVDx/jRrvsAZhsk/n66/E5SmSPAH6KxmhOV7cFt7MwQy0PT7Wyf7c1YpPcbOvmdbOEm+Ts+mzOgXE7uaYvTfm4PyvmFedmxMw=
Received: from SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::13)
 by IA4PR10MB8472.namprd10.prod.outlook.com (2603:10b6:208:56f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 15:22:30 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::79) by SJ0P220CA0029.outlook.office365.com
 (2603:10b6:a03:41b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 15:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 15:22:30 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 10:22:16 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 10:22:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 10:22:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TFMGaq218904;
	Fri, 29 May 2026 10:22:16 -0500
Date: Fri, 29 May 2026 10:22:16 -0500
From: Nishanth Menon <nm@ti.com>
To: "Wang, Sen" <sen@ti.com>
CC: Moteen Shah <m-shah@ti.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
Message-ID: <20260529152216.nfsyt7rf7jtfgvi2@agreeably>
References: <20260520115603.2662930-1-m-shah@ti.com>
 <20260520115603.2662930-3-m-shah@ti.com>
 <3d958ba0-30b1-461b-aea7-c0bf758a490c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3d958ba0-30b1-461b-aea7-c0bf758a490c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|IA4PR10MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 935d16f7-da9d-47c8-83f8-08debd961983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2Q7KnfmnJlZZFcc09Gq74jd5wCYL8dkBJJDTpm3EvjFluZB9/4GLkWcnLSGAQ7nYMudxI1M6Y66Jn5Vf2skk/ST34De6xV7IPRktlHkYGOAZ1lS2plaPMr7/bV3kaxlIjfyuxBIXE6AqqJPnzbLDWCfrakMXD4tP1w0Ux7C0wnqxK4R344YjRAnbE1eb3/9by9qfyLBIqyykTDBOzEDXmHdi0avgFG5NknpSFtEeRSHU5NhOIINaK/20M0jzdGxwVHlhVZXYS8BZkEEjlIyBscSyy1C5d8k0WSg927JlI3qz5ffGaWrUQpNjW4HmzzGBD3Dk7kc6cT5nBV69or+yzM32r3814YhPVJ2C/iuDpDkLStcyqWin894XrU4a8X4oBs+R7sJpPH9afZW1LAbY7QwAtgUcXAoCYjonYvHC71ZAqvIQSADHAZpgb54JWFy7K1YCih384fO4YBuTthfw1BxZoa2XQPwtum7ZrOTjxr0SjQodxsPlr5hmzbkppVGRzeMOZscSNLtfFZ1HI/+Rd5cjGqoJTejVH/OhrkuJ6p1G+6EMNrGu82PR/APVIod3Kx1isGbG8naSIuRpv6RL6a7RnNgOxvOD0hfud3XVQwh3oPS4TSMFIUwtUpzLlR1z/xGxM4eWCb6TjLwtTnxZRglp9vpNrH30rn1wSf2GT9UptIJ2cG3p8pSJLqMc4uvbUQv+MwNIznA7kbv/fzdCPdGPJLg6JAJctVpLkOh7ziE=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Iao6NFCxpKWp5GCKI6naDMJDKao07/mcFnesbtRGJWdtYjDxF9JgmShJkRYuFl7m7ZsXump73iUkAw+pOMqbL59go/ReDMeUx2YKL02+ERSC422DcEKVlKYTMlNKw2mdu6UR47lQ4F1QjHCfL6W0MIHhx2nIIScSRJj9WXCbhTo8IwIw/saQ7ONnUbfUaPDmMj6HtQ+Y/tRKdH3hlbE3poKI8Ed2ocEqbcKga5htKRyWToFtvAuf0ZAM53cdg3Wsns/hYDIFutEC2AE2sDL68hqLHspTJks2c8YlPSrpdvIgblupkiIajS/nkmsm4TEG8z9hcaH8Lfk16up1gLYmmf53pzYzgWcY2tmVpGjmsPQXWwlnVO/edgwfiw2ADm199dbyDbYKnklEASWgiHR3v+NfYK0R9h5gRhRi5Em3+9eyL7l4MltfNG33Ki7CBB5+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:22:30.2678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935d16f7-da9d-47c8-83f8-08debd961983
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082236_673614_FD71B11B 
X-CRM114-Status: GOOD (  12.74  )
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

On 22:09-20260528, Wang, Sen wrote:
> On 5/20/2026 6:56 AM, Moteen Shah wrote:
> > From: Jayesh Choudhary <j-choudhary@ti.com>
> > 
> > Add device tree overlay to enable analog audio support on J721S2-EVM
> > using PCM3168A codec connected to McASP4 serializers.
> (snip)> +&scm_conf {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	audio_refclk1: clock-controller@42e4 {
> > +		compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
> > +		reg = <0x42e4 0x4>;
> > +		clocks = <&k3_clks 157 299>;
> > +		assigned-clocks = <&k3_clks 157 299>;
> > +		assigned-clock-parents = <&k3_clks 157 328>;
> > +		#clock-cells = <0>;
> > +	};
> > +};
> 
> Hi Moteen,
> 
> Should the bulk of this scm_conf block go to the SoC-dtsi instead? It looks
> like it could be a part of J721 SoC dtsi, which currently doesn't seem to
> have any audio refclks defined.

See 6111ac92f9341 as an example? audio refclk is the primary function,
why make it as board dependent function?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

