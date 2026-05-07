Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D1CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIf8QG+bbq23tN8htG23QGqiTALYTWmROeUahIonHqc=; b=1Dj2Q4Ky0Tb3gEIs0VfeVpeIlR
	OaiOK0fAeFZr2HSmpSpUAiROJ+1qzxrfm4/2brMVq6CnMmEcGoO9E60jIRpwTL/PtZqMWHLD7YbJC
	tfDiZrvZYOAU7G+3X9uTwv9F4Jh3lzhmYs9CZnWyW0+He8V26KJIC6lDMAFLOa7vFUt6z6EEnivMU
	XS7KCB/ErWDOOBhsU603PBNV+pnA8/rzoIgBlAKYoo4j27JQZzsCtXvXr4a8fAtY7pn9pM7AoszK5
	ENH5NsD1bm7MOPZeUgGmWi1MgNEUiYoNc6h6tDJv3E3CtHgcfvtZF2AsKCTrGMcz2XWOwelAK7ZjC
	wYtmGeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0wp-00000004FPx-1iAl;
	Thu, 07 May 2026 15:47:35 +0000
Received: from mail-westus2azon11010071.outbound.protection.outlook.com ([52.101.46.71] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0wm-00000004FO4-1duI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8Sx+TWEcAgJ3u2KwIqdZnk+7plKe8JeYCRswHr4a3T0RdKv82vVyX6MaXghJZS6iU9PvMTinPoJI3HHRZsoKHtsV6FaoPUTIahHwW4N6E4dWU5OeJQzoqeagrhSDTLKE0z1g/8ZKicAZ8m6kHJN/+9QKHExNw170+HSwjwBSE92qbp8B+VIzinDAqqDCPVOUu4006uBbQO0RrbiJGwGQvtEQjHFfUGmIatJ0AXr8Xri8EEEPiBOpKosdHVcTUWmSxw7xqT3gX34Vrf3ulkaCC5liTrIP5JtAt+XDNZtjVl7iax26Jby4rWVYj3DLuNxy1hioVORfWx+FUzQIDorsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIf8QG+bbq23tN8htG23QGqiTALYTWmROeUahIonHqc=;
 b=rFwUElPyztXu7FOXs2L74iz/2NSFYWEmpSyDylf/6hfyAMiDhBwWQ8zzp6bJSGuv58fc2TxIUl7xXtVEIQhl7HYDvPQ/NSgzNFFPM/n4HpqLqwXHjZXVqh+P0kIxDFWXTUq28VpRYPub/+qvOcXIH4uVUIKRUf4GGB7ZMBHsnm7wims9t3GFLkAv0uFaWQ8a5Opd1s0OrRsaqqZDCfaiDjZIlB2xrSQlJArxm7SyOranSK7NreF1rFoA8OP9YiVh46NOsfe+IY1ZwnYZ0YDSfXpSji3wuwtFQZj/UxvBoCB2aCmYHHdBO/Zg8nLaSv7qgLReJzSu+nR75oYWEU8hXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIf8QG+bbq23tN8htG23QGqiTALYTWmROeUahIonHqc=;
 b=Kxop64zZ3JnJDITb+EiPOaT6ItVhJP3mjee92Ire0artch6tk5Ep3FyLqYS6KRYlzVkCjJ4+oOLRV71+HgPqb5M93kPclIheZIuKL5IfHS9DC40awPZDtb5tIiWzKwkAoRkU/1fxeppmQae80J0TxQx4gAtt/kV2o3zyu2Zz0JU=
Received: from DM6PR07CA0084.namprd07.prod.outlook.com (2603:10b6:5:337::17)
 by PH0PR10MB5793.namprd10.prod.outlook.com (2603:10b6:510:fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 15:47:25 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::a6) by DM6PR07CA0084.outlook.office365.com
 (2603:10b6:5:337::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 15:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 15:47:23 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:47:05 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:47:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 10:47:05 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647Fl5cb3946841;
	Thu, 7 May 2026 10:47:05 -0500
Date: Thu, 7 May 2026 10:47:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Josua Mayer <josua@solid-run.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "w.egorov@phytec.de" <w.egorov@phytec.de>,
	"matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"d.haller@phytec.de" <d.haller@phytec.de>, "francesco.dolcini@toradex.com"
	<francesco.dolcini@toradex.com>, "joao.goncalves@toradex.com"
	<joao.goncalves@toradex.com>, "emanuele.ghidoli@toradex.com"
	<emanuele.ghidoli@toradex.com>, "ernest.vanhoecke@toradex.com"
	<ernest.vanhoecke@toradex.com>, "rogerq@kernel.org" <rogerq@kernel.org>,
	"eballetb@redhat.com" <eballetb@redhat.com>, "robertcnelson@gmail.com"
	<robertcnelson@gmail.com>, "afd@ti.com" <afd@ti.com>, "u-kumar1@ti.com"
	<u-kumar1@ti.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "luis.parga@ti.com"
	<luis.parga@ti.com>, "srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH v2 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix
 USB clocking for compliance
Message-ID: <20260507154705.oisyadsyrrvv53qj@upriver>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
 <20260506141040.1368918-2-s-vadapalli@ti.com>
 <c5c8a3a0-c8c3-448c-83a6-99ffe3e6ef11@solid-run.com>
 <440c9069-b8dc-4dba-9dca-3a6c94bfd52e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <440c9069-b8dc-4dba-9dca-3a6c94bfd52e@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|PH0PR10MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 8409058c-fa61-4a3b-ba73-08deac4fee85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zhrWn/paEoR/A4tmTJZBEb01Rn7UlSt2wOFxv18Wt4mjCT2R+QLw2GNcVLLzKhbeCuIrk0TZuZj3vm5NThb7I+d4s8FByJJd6SQwq7+naIWngnMnaRANSfe/SSCePIuwqFJkvEfQ5UNkwV0ZHVk7ZLR8C731vLkU5jmRtKqnck0PneU2X8Dc8cLbf1XNgzaVWDcRImSyndjz1jynDRlS5CafaTx6IaWgTJ3imhtd7GcVe16fwSfbpXbEx5NDrz9usJ+w9Nvz+DFYWpuN6T84LkdmFFdYaIbeh4HXceLUhKdP+qP6vngDubKTPjj2MK7ndJh4WUKBK3tIqTiJLZh6yl4Fpb50fg3Fu4ddUYdZ27A5OQDThg/SfWGAosxDKv1Hd2cI3mL0iPJ0AQthIFB++4vHA3F01YnMd4MQRU0yvP7XtPEC+35mANsqt/MfSiFbMkbH4IObq/coxloDgGiR5dJLcmB0asIyBEwHepx8BkcJTf7U0mK6MpXgRuR65rewBzcl4ZLYRYkmfrpyvwVmiHo/KzFILA5mfHQzVSUDFtEwVBDdQ+w/pdiSjsNwT4OBotz4YVCCqRYRRf8ZX5NClXnFcz1ogkqeIozfpB3tlOSe5Mh0zfzLUpqF4dVLVMZL6pd3LvJ7I77O/+Db2JGhKOyR+842ZVPiAlI/6qj9uDhd1pJRD/d1YhGFwytgFPE1YyCWHhGouFcCA7Mo9bBRFxpDkwLV8P45AFK1R7Pif14=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PipU7+bKk2ETqW/q4lBSBJOYU9OYeQ1BeVfJhQ6p1qAsMjfwU/TkNGVGLUloDEt+BnfrerBGySDKaGkjmPoPzhek3MuGwPT6XrkpitxAtfgzvgWeUPOSt39ntrVkOr22gttG0vA+xWzB7B27vLNsWfGKMLcTfVzBVCiyMOLApYiuGfsKMc35PtuugLJx18iqCEEbEGSh+jUld3LZ4sWleaWeuWexOzehRIXb8hDWGHfq3N5VitwW6EiTREueKrtt3uNsIkzxHThDcYiFjzi7/s/SXiBQlL9xwCLtSQIhyYAB1YKHdAh7VCForC7t53M53sq/K0uoUA0KWLy34zkjW5s9E65wssB1/nxoNR4hyhETTUAlhHAFHHU1q/fHZkeax90IdR3QF28f59aM/W1lQ4jZTjWT8mJZA23qCyafRtr5JBXlyEeQBeqaau5iZ9PQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:47:23.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8409058c-fa61-4a3b-ba73-08deac4fee85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_084732_431762_DB362484 
X-CRM114-Status: GOOD (  12.51  )
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

On 12:09-20260507, Siddharth Vadapalli wrote:
> On 06/05/26 19:47, Josua Mayer wrote:
> > Am 06.05.26 um 16:09 schrieb Siddharth Vadapalli:
> > > According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
> > > the USB 3.2 Specification, SSC should be enabled by default. This protects
> > > against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
> > > 
> > > Fixes: e2b691804319 ("arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts")
> > > Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Acked-by: Josua Mayer <josua@solid-run.com>
> > 
> > Your (submitter) Signed-off should always be last.
> 
> I see both patterns in git log (Acked-by before Signed-off-by and Acked-by
> after Signed-off-by) for arch/arm64/boot/dts. When posting the v2 patch, I
> looked at a commit with Acked-by following a Signed-off-by and followed the
> sequence.

Documentation/process/maintainer-tip.rst,
Documentation/process/submitting-patches.rst etc.. Signed-off-by is the
last in the chain - always the handling order is maintained.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

