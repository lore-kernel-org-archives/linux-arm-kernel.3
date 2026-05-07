Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C5DCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTEBCtCLTc81Gf7zQ2uzXU3CB9wfnDVnv7yBQIHWrSU=; b=jgN7KM97oM0+N7ppm73g3O+ZfR
	czfoNTVnSzQqkg6IM6ngbhHH+OCDW7p3uGoe3hpohGyQ+7FZ+Lfi6+MjTCNMXkl8IVG+hg4+v5L4O
	9oRidqILWcbsbmu3GJwqkBqvJsU0PIqpcUFu4JuHj/sZbrhw8vD0v8MEVO++dT5tjXu4jpdSOFjMu
	8JsVq1vl0VsMawg6VoJmHo7hhvq8/fqUBW0PI/sqNQ9VMiqhrRcyUygFOl+EOz0OHmadryFWXG3F3
	lJOm0J1wGH71JRabtWi09LDCjkj2CTT01iLMIXs3bcYOnHSpRoQ42QlIejGtkK3BmjZJDBJoFlnUr
	O8X4jUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0uZ-00000004EyG-3i1a;
	Thu, 07 May 2026 15:45:15 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0uW-00000004Ewu-3ip7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEFMXKoBh7KI9JqnUKOfMDGvBKo5BPwRMFj3Txq0CBWF3VOXzoVuk3g/5cvWyswF+dOKgZNBcahHO2Z5QHDMPFStd4zWdMzV/Tu1Q+fAUGJPkjmEjq/lO8flFw3ITCu84VOYhY9+yT9NmsdPEW4j3UPItrVGOXd1nTAPDe7f/rgAg574HQ0VVFlvMWFX4Hqr1AU+J8ytidlJKOkAVyCv3f9MNnRuP5UwhuxHvOxfOujur9nx811WT+Giuk6TUBXBaqrhBLDYRqHepGXVqQY/wz7ZFsbqlHrvebtBGg60+ClkaqW+ni95j89WCkAizdUT8zjO38A3Ce+NQoNNUhlE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTEBCtCLTc81Gf7zQ2uzXU3CB9wfnDVnv7yBQIHWrSU=;
 b=CTweHJGT3K5Z8SUqJVWoL+CNNxB56QEbwsTNc69dXldUDHYjYPTUUiuy6Gq7DYhm5RmGeqs3cT9aGvP8l8YDQejly4FVcfXZUusUucoABfTsdCvsquyszdNtGb2IbAt39FW4eV7pD5iH7s0uyynZY6vrump55MPhQ1R7PsoEMfPDFqhdSlzM5B09B/8tOILM5LIwnl9mUjG2uzKsWCRy6qGubAaVJc13yTUhCqYrhqIV0e1duQpbuRKS4LmlXabHIx6/LdkWBdu2WVlAicwYIAjvfYYt0WdxtXasV6sTiTuAt72MrheRkhc4SLN2Y3axQ8G0j5+BY0HF6/ZrmlcO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTEBCtCLTc81Gf7zQ2uzXU3CB9wfnDVnv7yBQIHWrSU=;
 b=S+txlguOe0U2JB4qXzFiYrZtSPcLHrCqWazMTQT1rU9Und8sOV15qjOfpXG0VZ/X/vU9rxiuFW0t3w3DvmzU8CkLvdDfmLrFwrXLPxIj/6FgGh66Gq/zIx+S01rkAkvpTYV8LtySYbJkgBhG5JIIyMQgCSYefSho6kVZd4LV1bM=
Received: from BLAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:36e::11)
 by CH0PR10MB4876.namprd10.prod.outlook.com (2603:10b6:610:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 15:45:05 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::65) by BLAPR05CA0008.outlook.office365.com
 (2603:10b6:208:36e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.7 via Frontend Transport; Thu, 7
 May 2026 15:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Thu, 7 May 2026 15:45:03 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:44:55 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:44:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 10:44:55 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647Fit1m3630653;
	Thu, 7 May 2026 10:44:55 -0500
Date: Thu, 7 May 2026 10:44:54 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Wadim Egorov <w.egorov@phytec.de>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<josua@solid-run.com>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>
Subject: Re: [PATCH v2 02/13] arm64: dts: ti: k3-am642-phyboard-electra-rdk:
 fix USB clocking for compliance
Message-ID: <20260507154454.puxr5sjtx4j3k2sb@pasted>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
 <20260506141040.1368918-3-s-vadapalli@ti.com>
 <d0eb7931-bcbc-4ca6-8ab5-4c12d134545a@phytec.de>
 <0043574e-6721-445b-ad01-54446dd72395@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0043574e-6721-445b-ad01-54446dd72395@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|CH0PR10MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 4191c654-3381-4a3b-7cd2-08deac4f9aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 45kWMaa2iF0fscWF4ao2OPklXQavXbEtVYRW2diR+jvIebs8Goj+4xqLxofJNp0tu2uzcGzgPGEooKjnbq17KkqCIcSr7KSg5pibhy2rratb+LQIwZpz92LZIO2gQ3y279VPfeMx642A4U7isCpVw0hhIQ1R9qKrv3Peq+AUhfGD+LWi4hLSWQHkGaGPDT2wi733julInNK47xsehnoyARsbr9Guy2h6WhE/sUuuJjdfQkY7E83n3TBaYHjRBhFxzEMJ1WlZRf/1E2rs0asSpHuAPHnN2PodYa+Sz6n12Cf9xmccnv+ded/2VOGqZrupOFkbbe0bj00Wm3cmRKSrqlVeHk8IhN+OtjL3HSJOG64Zfun+YFhVdOIRzTgrx/oFYHvBLfVqps7LNov90vbZZSRef2LjqX7Amw3efy5KOIORuAv33PDtelVCO/JK52K8MtyakpCvWBzqeRqrB7NWEaB3o4eJqTnLn4HLIKRIyP2GoGjUigdqUr7xk9nPzmdrNYsH5o5g2X1ixS9bkcEYESo+GcVuJgaOMwOYzQ1UJYqXKXGzJY84JI1IExuin/afa2xMqu0v5aPg6mmB1S2VY9w8nztd84eaIPSI9Kmvj+C6w6IEzl+hX+Ptg86Wakt34cWXnLKhjZQTyijf7yv9yRUDtzyfd6zt84bIMmJ0uDCc6SoV/KCQYsPl8STkzTr3A8qUkKa4YPMvCeFfNmOyXibQXbnj6V5iIzJ73k+Hm2U=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0PTyXWALxxAklS08MDPQQKvg/9DNbik09WQ+ccRt34MgumqYyWf6dygPQ1wLeYxH5FsaKQTDSXbIJB2Efw81T3dYKJ22WnFq2jRi1wUiFJtfpIF6FDAfEjvhp6xxka1PoGJkz6vuKwY3n6mT19ajhOaHv+YMWijuABbHxOwu7yTJzL5db8xgzjMCpxzcIrw6lDUFmwslwvXLSDDq1d3ti+NVeI8PohfG1MW+iv+bp+zsPscWIAM+i7GKiYsdnHAeP4s4hwWD3chQ2neRopUfvSVNsgJiLYuL3g1DRNcAEZQ9h+oUuXvxfs8THmYZzJfOy1NIRsPIl8o3mnj3J+B8Gxf6Z60XgPs1szlOrtYOO8qcPZlqAiyp8nDvdirbEkoWR/hh9AMGLdAPb5jAqHxlqew6EiPa+aOFTuqpx1Sh/ioaUMB4aen3o/MLQatCB0t4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:45:03.3763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4191c654-3381-4a3b-7cd2-08deac4f9aef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_084513_038686_3467B31A 
X-CRM114-Status: GOOD (  21.73  )
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

On 14:15-20260507, Siddharth Vadapalli wrote:
[...]

> > > diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> > > index 793538f94942..a85d7d08bd1b 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> > > +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> > > @@ -439,12 +439,21 @@ &sdhci1 {
> > >   	status = "okay";
> > >   };
> > > +&serdes_wiz0 {
> > > +	ti,core-clk-sel = <1>;  /* Select internal reference clock */

Doesn't the binding give the info?
> > > +	ti,ssc-enable; /* Enable SSC */

That comment is what the property says

> > > +	ti,ssc-type = <1>; /* 1 for Downspread */

If it is that critical should we have a include header or if the binding
describes this, that should suffice, no?

> > > +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */

33000 Hz is 33Khz.

> > > +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */

Binding should describe this?

> > 
> > I don't think the comments are very helpful. The property names already give a meaning.
> 
> The comments have been added for three reasons:
> 1. The meaning of the following properties isn't obvious:
> 	ti,core-clk-sel = <1>
> 	ti,ssc-type = <1>
> 2. For ease of 'grepping'. Grepping for '33 KHz' for example based on the
> USB 3.2 Specification's modulation rate will not show '33000' in the
> results.
> 3. Completeness / Consistency. Since some of the less obvious properties
> have been described via comments, the remaining have also been commented on,
> although it is obvious what it means (ti,ssc-enable for example).
> 
> Unless you have a strong objection to removing the comments, I would prefer
> retaining them. Please let me know.

Just keep the necessary documentation - something that we cannot
determine by bindings.. If we have to document in ever single dts, it
might mean, you need a header to make it explicit? IRQ_TYPE_ kind of
macro? IMHO (I leave it to subsystem maintainers), I feel these are
better documented in the bindings. Also are these properties expected
to be exactly same on all evms of a given SoC (wondering it they belong
to SoC.dtsi instead)?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

