Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C8C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qr2r0iKiP+EtEWzjqDzp7sPZ847OIHtrEKc/EGjUkI8=; b=RviNeczPTKbfqzthAqmoTXux9t
	zBA2w3uX8EnNbFPFus/L8LOqjs/FbqE6eUtKVzeaHL74QA4XWOx6RdwR/UQi567cSyOymHF+6HvVu
	P5CgGOlXtlxJ6VEYpdLaRPB5S7UOrCN0VLwqjZBH4RUSADlAoRXDDawxlOguWg8nmzDcBItSBe+vC
	fXMydV2nV5BHKp5g+avSUyMPwUqm1+mmlp7Y6E1OzTYpXWJW3veV89NdsKTxdvOT+kBBPQHkJ9P2D
	iHOlE9bkM3SPArnBExAilKTLGpifPrwhc+5iOM3V040PQqzgVMGZNBANjBXRqT7ZxK3aeukTBw7jj
	8uweb+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNgN-00000008Svw-46Ly;
	Fri, 07 Aug 2026 16:44:31 +0000
Received: from mail-centralusazon11011050.outbound.protection.outlook.com ([52.101.62.50] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNgK-00000008Srd-44lm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvIaUw63U8Z/KXnf5RvCvSuTvL1IRQRxC8nRfUsbqoFvyVPxkD5HUJkFEPtbpwpYTUGEjMQopn5XD0aDipaMktEPFfJ7bTjjV0tTojLwAn1sjxDlwN2SJLga7Fgu8XNQTjPx8L50FLJ2/rMN76qAt6fib8UQ+0dKzBnqtZf3/kYJEHoWNBgNAU9gRn+lflAm1Q/kCxalGXygkzCDLAmLAVeVKIEoJzr8AOanpIBpz39juKaCz7qh8iGIzrMYf3RVUwbpi3Vh5kDyppH1b5KwFzeBQ1zWBzY7DVPNXzxDX1F0jX6NKSKXmiJEf1ZLCqpg36rX5IOPOsoQrWsKje7gQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr2r0iKiP+EtEWzjqDzp7sPZ847OIHtrEKc/EGjUkI8=;
 b=WWQluYGzQFx5EOuQjaRGfupG66mMcTtpEbsQLvY2wPFL8y5R6r71SZndw1uaIU1MGnBZm+OBs8gJPKJlxqQwtmvINH7ftzRO58UttjE4LKs4A9d7Jow6n1SQjwoFnQQ8JdJiD8zU8nqYc8Tkyua0bzpMNAqV80LFNyLBVkpJUgae7g3O4/5E7/U02XEaBfjDOiFDtudbVFRVBpPBDBY7jCyYFuCN/L6tT29aDjW7F5yFsNbHc+UoXSlVvGMex3f1I1cdslCnMOEgkdTG/iCmTafgmD0BgHskdKuilzr3ioBqyX3DZ4BBHd9BUMyQJPMGbZ2pwgHpLdiJmtMEVL63dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr2r0iKiP+EtEWzjqDzp7sPZ847OIHtrEKc/EGjUkI8=;
 b=ZGmda1oMBA7ALZUaK0CjtIRaGPIrQIN8jJM8XPG8vsdGxkrD72eXYGIvXUcMBPUpCgzXyL61Z0zmRhUp6gVkby4O4bMon638Ku590ptI5tkFdlJ1gErcjFbpz1UyJ2Fi4Ok/Ps7Zb7D3hmhNQ8/CKJcnxRO+0Z4ws4+R+BQpjAddYaZpO3WFXt4CnkXQbrv09gEXP6JHCXVAMNUbl+ci7TwCpLG1lqGQ3yHKXQJiVv7kvOm1+M16I5KiZcuTTkvkSd+sMavr1PfvfrNylvGEcgMUbCnSzHELP192DS+fJOkCLy5IvBwraKqudsTILkD84ybqyrILEUmG0/R7uGzUmw==
Received: from BL1PR13CA0178.namprd13.prod.outlook.com (2603:10b6:208:2bd::33)
 by SJ2PR12MB8942.namprd12.prod.outlook.com (2603:10b6:a03:53b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Fri, 7 Aug
 2026 16:44:21 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::80) by BL1PR13CA0178.outlook.office365.com
 (2603:10b6:208:2bd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.10 via Frontend Transport; Fri, 7
 Aug 2026 16:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 16:44:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 7 Aug
 2026 09:43:56 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Aug
 2026 09:43:55 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Aug 2026 09:43:53 -0700
Date: Fri, 7 Aug 2026 09:43:52 -0700
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
Message-ID: <anYLSFi0He6clllr@nvidia.com>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com>
 <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SJ2PR12MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bf733f-40b8-4ba5-efe1-08def4a32143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|11063799006|4143699003|3023799007|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: c4V9QH9RvYHgxcKzBLXXfv2ANZCRId/kJMvCEXGwmGTSYjOiZgY5lhmGCo7gggH0/ZNw1VhACNnRs8Ad2NsHnINg0j2LfEqpumKFR4CyqC2UBVRFme+Ep2BbLjkVheO8iS4OIblzfT/lG9sxETI7DzxkC5icguiqQC/CtlD3QJKxfta3vK76GXHWZkMVxPO5yo74ZfztCuckURkYgXl5ZciiZ6nkBHBeMEmqSTQxg7KzRM57FtLxPrWNb5SXeznpbu00Hp8qC05VyHT7XgMzM/4sGtqCctjJzdbvabJxqH5y5KKHYDODlD0/+/tJ6+iwBPpd0+U8712taQuyJOUnI0FrXSpprL86q83XPneCsNtoaqmGk+KpCTAUJ1pUKdxRHTC2XT7yT3pOKnTJVE0lsesf1kSWT4NhB4JKk294fzCxy74zyxHRizj64UJs2EW9AA18t0oGWwULUSaBIXnTxR8H9R8GSmNf42c3CiTABEAbYie4N0Bq25+niYBgB8F4Iw8mS352HLzDrD7ZO3ssEyVGn6vG40NIjmh1ZPWTiCvkcaORAGyIx/3ih6QLdrBzKjbw7DNRGjN1Q1b2zfKQ+k4bdWbSoir19ACTnfD1I7UriYx5tHKdypovHiGUzXmEdUhKJXQXozaxIC/SoCSL4qEcAi/EoZ/QGZWkbxKdReBCJuMBFl+2x5BWA9RC6JKwJlp8Yf26cQ1OlNEevCD1PA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(11063799006)(4143699003)(3023799007)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lfJkgFPuHsKAme8kyNmwvaUuX76tqFYf9jVRQ2uj2ECKkDO9Y2d+Iv2x/SdXAexIQXxvXJf/jlFfRResefWZVLTCjgylWsvUNZcKUp9r8yfvTMT/3s/ScKw+LlsB+rtmH2axNRiiq1hZFTVL6bQMCtgdhmcjay4wwQThfHxYJAlJhi6hf26VRQfVeZxcvYsf0ToKJ9qVvH+YCtzpnD+mvv8lVhFO7EI9aZUhqybru3CcSCW8ekErSvF9/ZsYWg9aFnrRFILvV+YmoPXvLqF+5j6T9ii/e0u2lplV/dPIo+RQJNOJP2Qe+jzmT/m86MfkI5E2TCnKEJgIuy/01mr81yMW+FnktusqGJ4DijDhGxDuwNxG9ztemccrTGcucs5sUEPGCiko+UAu6G5laDR6AREzJsHaWUwX620FkS3+mq8DQEZwcuQSsLqbMPZX5Olk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:44:20.6153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bf733f-40b8-4ba5-efe1-08def4a32143
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094429_011395_2873D35C 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:
> Hi Nicolin,
> 
> Thank you for your review feedback.
> 
> On Fri, 24 Jul 2026 at 19:05, Nicolin Chen <nicolinc@nvidia.com> wrote:
> >
> > On Fri, Jul 24, 2026 at 01:39:43PM +0100, Peter Griffin wrote:
> > > @@ -1206,7 +1207,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> > >                       cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
> > >                                   STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
> > >                                   STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
> > > -                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
> > > +                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
> > > +                                 STRTAB_STE_1_INSTCFG);
> > >               used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
> > >
> > >               /*
> > > @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> > >       if (cfg & BIT(1)) {
> > >               used_bits[1] |=
> > >                       cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> > > -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> > > +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> > > +                                 STRTAB_STE_1_INSTCFG);
> > >               used_bits[2] |=
> > >                       cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> > >                                   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
> >
> > This adds for "stage-1" and "stage-2", while missing "bypass"?
> 
> I need to follow up again on this point, but I don't believe currently
> we require the override for Laguna when it's in bypass.

This get_ste_used lists all the critical fields that the HW will
read when operating in the mode per STE.Cfg.

Given that GBPA also has INSTCFG, STE.Cfg=Bypass uses it as well.

Nicolin

