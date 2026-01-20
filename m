Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF9D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXvv8CO3hXqIXpF8YR3tOCAPQB3Eir/RM7wzK3KSo0w=; b=0polLtZh4DDo6M5TP2t0zkeTjh
	daKXIMt4B1DXJ+ubA3BvztTmaMGr98eoSO9rT+RKCSDTKkEZ+aDi1HAXbageZzHW2mlqzdGFmTkUE
	FnJRrvTfTg9JpCf543qtTkZl37jmkA4mxana9UhnExVmYdmFa4Ttl5no2QipG/CcaZUJfnrj/WYNT
	HDmOXMy4Xe+Wk/nWO18TWs0xs/xqYPpCalyD/9IEeNgprDTyuXFhcMY46eVaDv12UTS0zsY3ae/kW
	dt3nadjg/PAAlZiMU1OyzYIrNHTs+qU8BLuEVkki1XXoDUd88aK63HkgfC48GA5IeKvVM0mTkHWrt
	BRX/Wp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viB22-00000003r9k-3cVf;
	Tue, 20 Jan 2026 12:40:26 +0000
Received: from mail-centralusazon11010025.outbound.protection.outlook.com ([52.101.61.25] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viB20-00000003r92-0fWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:40:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGY/uuKC5/OIIx92em8ztj4QlQwhuzt7lij9qP4FQklmPYsShZegBOe45+SaVkfLg6W5WNFXRxEun07j++bobFaFIgUKL7i5SpwQtOazxQPIvuHmNCNrj20rJ7zcfG6gIXO7rzltnaI5eQV7zcIUICCGdTKrNkHWDicmVz1cS2qt6U2wVYkZWi4JkpsP2gAr0nyUd7U7za1aQcSxeZX+2ELY3WwMOQ0sVjBs3JcihnF+27z81nFsJNYyQpd780g6kGKJhMwCupurJSoNxcpym0pTla17+mOk25ySeWoTZ2+2HIcPIMM4178xfYRjVqH8+ufeo2nG9hrRQDqaOb4a0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXvv8CO3hXqIXpF8YR3tOCAPQB3Eir/RM7wzK3KSo0w=;
 b=PWd55Wtdzn7SerCYpVr3evLci+mUVbiB/5fnREHn5e7b6zUpTTqUv8aZFL94WJ+t8BGnLOg787hRopVlHlRj5XOVRc7fdq9G+wzvJbKpWd+B/uoWxPMwBXuLvbIHGZ11eHMBYXVNcZSvmmqxlwjaL25CJaj6TG0eNAC1Uor1S5rgl3UJLPZnuCTih9seqmNjTqiAsHSYxV/QQi6qK+/DVLkVFEWWeJniMAZSowmq3QZ8EcmY0oiJU+Y2xvHpRU2OCsLyaCPNguUeDp2PkZ6HuJa4HWyXzDAxetpPzxms4RKVBBvnfDSFJJXXEdpzzBOfDmW5NzB7n3HAbQVNL2a8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXvv8CO3hXqIXpF8YR3tOCAPQB3Eir/RM7wzK3KSo0w=;
 b=s+LMxjKjU6a+5sQJ87NCzDKo+9ePcwcyZhYtdiENrcP5kWBGPZkAsgNalOPZSBmvElUYmcoWoph9E6BbpmGJuKwKaJiSDoHNt5zxxFUTV1k4dt5SR/B6J4I6NqtF2r4mRwy1nepW0pvTOds2yB7DHuB8a7W3Hkw+bU5KHLl5AAE=
Received: from CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::34)
 by MW4PR10MB6677.namprd10.prod.outlook.com (2603:10b6:303:22f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 12:40:17 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::d2) by CH0P223CA0016.outlook.office365.com
 (2603:10b6:610:116::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 12:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 12:40:16 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 06:40:15 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 06:40:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 06:40:15 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KCeFnH1073710;
	Tue, 20 Jan 2026 06:40:15 -0600
Date: Tue, 20 Jan 2026 06:40:15 -0600
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Michael Walle <mwalle@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] arm64: defconfig: enable Kontron SMARC-sAM67 support
Message-ID: <20260120124015.f47xvslcpycsc2la@legislate>
References: <20260115132558.1522169-1-mwalle@kernel.org>
 <176857429244.3703601.340857575047572204.b4-ty@ti.com>
 <03116f78-a332-4c47-b524-6a5378c1a1dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <03116f78-a332-4c47-b524-6a5378c1a1dd@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|MW4PR10MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: b157697b-623d-4c34-e2ab-08de58211089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qnFLJ94Z8rxeWMMJ6+8WauI99sCvTPFxExTfFzEOHgKEtzetDwYe+4SfJQd5?=
 =?us-ascii?Q?DpU2fRBrXnLRxkKcYfLaU0RRS8hmb6bwgvezMkWtpwM9du0vjYCmMamlxbbG?=
 =?us-ascii?Q?MhWraa7/UX62yjmWJ961rdgaQn28gEcOxS0MX370rIz4mkngeSolB4VEGZvu?=
 =?us-ascii?Q?ZDFk/tY6veyzx0y5mmA6bEhkzVBDAslsnxMva5AsEWHTSxtqY+4dm70w4U78?=
 =?us-ascii?Q?VJhPDNpVmXUMFYW37YcO407sGaufoE8zbR7MNqQXoXipfnWdk+w2qlmsbmnK?=
 =?us-ascii?Q?GjGRwKKVrIoxebS0plU7vt9XgUxSZwMO4lN4oCriWEG9alTe2OEh9Blvud9P?=
 =?us-ascii?Q?cMZ9rjkPcAkPI+6HY5YzBvrEE/qcsBfRVC49t0+CipqtNPjGWoO1H4d4lYc3?=
 =?us-ascii?Q?yayRcal0t/6HpBlUf0Pqy8ilwtLwg053FtF5T0dNz91m8q/jFwViLbpDd6xC?=
 =?us-ascii?Q?JkljpEOYA79QI+v4knw+MUWQwCztBKIO+rajqIwQRCg2sfoOt/9EkfZzNR7q?=
 =?us-ascii?Q?VuLxITcibQ+5OkRWguLF79R7S00eeInja4Dg0GzVW1hnq1kShgSwq5UXlvS0?=
 =?us-ascii?Q?vL4wC8axt2Oyo1c35cYMy+RLf7ugOBwjtcOlJFHgyY+zRzs6MEDCHoI91u9L?=
 =?us-ascii?Q?Ny3n/i4uu0yMXhJ1tGsCL1wqnMbaHMwwBgOahN7a7Od3ZtV2fh8IxGqQeuFC?=
 =?us-ascii?Q?6jf5IPKf+TdmUA4BIKRFo1ixDCT28Pe8BO2bHzVBDLExQ2LagXD6fj6AC3s6?=
 =?us-ascii?Q?Xr/Ah1fD721LOkKv8SFWftcEvyO+H2gGpfqT1CgkYMhU4aMRi/v/QiIbwdDZ?=
 =?us-ascii?Q?5wnlpvgjDFhDCgYOGJitchAeBe7MIPfw2tnZ6NqJn63zNSAL3BzT6hvkzUhN?=
 =?us-ascii?Q?NQKvESqA8F+54VN2bVVgUVsjnNt4OW/mUqVVD/Ve9WR4TCqG03PiMScA+iXg?=
 =?us-ascii?Q?7dpXGpcWCoE4ZKIxsvKV/BaRuKv2TNDRaeMzlEk6fwH2EDdPiJRJWIHu2cdm?=
 =?us-ascii?Q?BSAPFgU/MtKo2/lFdEHLK6ylMpaei0OaO3x1T0hLJm3mnI8maMcgkZzcy9iA?=
 =?us-ascii?Q?hg/5fdB49YxlvFFKc4mBEPBbsSevist57PoD4qTFMjFnnUhimGDgnkGQgfaX?=
 =?us-ascii?Q?+z1d96t5Slmbb1qWkbo1sLuo0mURi7vspKyQQNXBANkPIs/D5lln+nPX65aS?=
 =?us-ascii?Q?QAKsCmZyTum8k34PpeJvRVQlt/mqcksUalxxXpPFAid8WMbjIwydjsbwm5MP?=
 =?us-ascii?Q?IXF6dHadxCHDOckHXQ6kFbAvGWkkPaY6UqIJAmoHiAQONu3agvudgBySls9A?=
 =?us-ascii?Q?ub9ibft3uTpICUjuUrMqke0L5+6IuItN5uKDUTYi544uVHG+yXImCrGDB3Nh?=
 =?us-ascii?Q?9wMy8KfXccMPqAmXyL3tVwK9PhhW21BnrL3JAQaO4x0SXFUcgGdpJTPCRZjV?=
 =?us-ascii?Q?AD1A9mt8gSWtJr0gB8fnJGRjmll7EnbrkIkOcJyRlzAJXxlc0qkRqLWNP8pS?=
 =?us-ascii?Q?GFm8u8UeytNmLxf8E1RuV84Dmqwge7ULBzQn2eJ+MYq1awrcHaZFJs17R3AC?=
 =?us-ascii?Q?KXSIq/nIv8B2Bsg93+Z2+z+ZyDEkJ6sJwziqKkmsIJUPULc3OAB0cSJXrh5Q?=
 =?us-ascii?Q?dZh7d18G+qpGjLv9OE+L58tTgVNE+NjJtYibWhmmd4Y5kiRprghIN74mqDBz?=
 =?us-ascii?Q?0pwPEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:40:16.6933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b157697b-623d-4c34-e2ab-08de58211089
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_044024_204299_3E756508 
X-CRM114-Status: GOOD (  13.79  )
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

On 12:05-20260117, Krzysztof Kozlowski wrote:
> On 16/01/2026 15:39, Nishanth Menon wrote:
> > Hi Michael Walle,
> > 
> > On Thu, 15 Jan 2026 14:24:41 +0100, Michael Walle wrote:
> >> Enable the modules required to make the sa67 module function
> >> properly. It is planned to add this module to KCI.
> >>
> >> Michael Walle (3):
> >>   arm64: defconfig: enable the J721E PCI host driver
> >>   arm64: defconfig: enable TPS6594 power button module
> >>   arm64: defconfig: enable sa67mcu sensors
> >>
> >> [...]
> > 
> > I have applied the following to branch ti-k3-config-next on [1].
> 
> 
> Before they get to next next, please squash them.

Thanks for catching this.

Done. new commit 65428481cf6e174cc1bb45444ddc7489e3f2ef0d
("arm64: defconfig: Enable configurations for Kontron SMARC-sAM67")

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

