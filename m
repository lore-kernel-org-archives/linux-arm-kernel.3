Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B282EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 03:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+MThah22THcfh4c2unyZQPmilCjpS9EpCXxCIvT6NM=; b=AAXHPN6ut6PzkM5Gh9fsa5AFlG
	7g/0KmZhGGSqQhlvRhif3gv3PPINSwwPmduw+baK0ZIm9vivhO7tmh8K2J/E0nFwTsgvA/Tkoj/he
	T5o3arJrkGZ6o9AwP1PBbisJHMm6tCRzQrQb2mLVqOIgjOYNGGc74nUlCfohxyvgNUg2PrtJef4oo
	gGtmz8Gs5+WkmRD4+so28dZsk2zVEQNgOU7f3k1s1twcyAsHNPrXYIeOdlRueXRDi53/41Zk6qtLZ
	kJYWJQrYNxl1fdImb2gupjgtur4H+CeYeRY5WLSzCI8mw7SvKwMGyNJcTC5KU6JHR0KlI6miFgiGV
	kXNnq3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHRI-00000007Tl9-0PQL;
	Wed, 26 Mar 2025 03:28:24 +0000
Received: from mail-sg2apc01on2070e.outbound.protection.outlook.com ([2a01:111:f403:200f::70e] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHPY-00000007TYx-04w0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 03:26:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h66mnTAt+j98FeWgFAVIi1HR3sfW/WBG2X6gh+ijFBugUxLJbn3zeGppNs5dyMnvnoESK2OD61+z1jL9KfUrN3oZRTfWbAAXgvgfHVUjmZm8xN2Vxngi1mZEmp2S31U+E2IMyCVRCW+uL63u5lm0vqX7dWrvENOYig3pct9tM8H0pMQTlReffgWJqYoqHiqPRTJztos4rOIbU/FLxLxrdikzQRfZC3d+b4IjecPyRQiIz4hbwFY3/Wl34Qcr+KELy+uehaFeBIdJNdDkWIVQXnaXi+MEYxqm3c1XZAa/6Y/8xOLNG2/DMynmaiM55rMIaX5DU5zjHrm3cFsI6Ii9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+MThah22THcfh4c2unyZQPmilCjpS9EpCXxCIvT6NM=;
 b=C/gr6wa09NAzHVrtSlzhGQhMfvJcZzCVNAC0P0ujHNA8eW8q8SdCQWhnxsTSvIVQ+suDCJvv3n193WgGt4dEER1MIEpv+cwbUMNbgTcva+qc4syCZRVs3jR2+8L5x/0xTjCmh2y/C/RQ0nWwcZKrfBSKU1rxGA06niS2eHmZaCuEslpJEMIZKysTrWRn3T2D2FrwEsz1djwXBPK6YI9tXk1HaQAL0jA5Rz2HmQclwcS1bX0u/+MEUSy2kORSG0cLJj4pcpoveAKW0zF/pshZEMuW5daE6DAcLFRmD4+JDrddXaL3REzxlpPi6Me2w6xLN3cwKapU0i5woK7KtrQKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0003.apcprd06.prod.outlook.com (2603:1096:4:186::14)
 by SEZPR06MB5144.apcprd06.prod.outlook.com (2603:1096:101:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 03:26:16 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::d1) by SI2PR06CA0003.outlook.office365.com
 (2603:1096:4:186::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 03:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 03:26:14 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 829B84160CA0;
	Wed, 26 Mar 2025 11:26:13 +0800 (CST)
Date: Wed, 26 Mar 2025 11:26:08 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Marc Zyngier <maz@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl,
	kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z-Nz0DU441Wwj1i4@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xjxmlgl.wl-maz@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|SEZPR06MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 2093e6ef-d8b5-43a8-24bc-08dd6c15f6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M4V0iulAgPYt8LfDPToN+NBTX2XMS+GMh/dnhUjr4TlEhlEhnqzIbdXx2OLx?=
 =?us-ascii?Q?6LGsnS/itIeCMkETqbh9Q9SFsLBvDuSrlTgV6TbDxEAphRI+nZaVdCr7HK3G?=
 =?us-ascii?Q?0M++Y5VaOTe6ZYqIQ5WFUUQOHA8oHw3dtaPMH6mAMGZ4fFNqBo6G/Ny+MK/5?=
 =?us-ascii?Q?uqmaAHUsgsjc48jjR/W0yPuYPgZuNX8tjXXYFFuXgN36p2IcKbfsztX7Oyb0?=
 =?us-ascii?Q?V3KJuu7OLC3/BXuMpvR2JWtIpRwG3bWoY7b5+/1RaJgaWm9sG0/HkPMrHkhJ?=
 =?us-ascii?Q?fOGL3wp7sqEqKMp65DWggflilEWkTWNeydXviZhLugbIql9eWuPEbTCkfa0m?=
 =?us-ascii?Q?2DtaRbR5UVMCqT95uYkm3xqMMoja6NHikazJo9WM6yN8ZaxUz0AWV/WOJa0/?=
 =?us-ascii?Q?lojdWilxF9NlqVqbRiMq+oO/B2KMNMTU7+ekjO5NDy4+j+NPaZH14kbanlf4?=
 =?us-ascii?Q?DBqvYwPnRMecwXMZjzC2wcCSck2jNB+85nMAuashG2XlecZ+ZbGKIhELEHBz?=
 =?us-ascii?Q?lbFvNfUKvi1tzLUXRHBcARq9LRBC9XHSnI7mJcreGTtQbiO6iCggVIcDhZbE?=
 =?us-ascii?Q?hlB8obVsLVWn41AhmZMqV3isgsfOT1qZoksRpH1yji7rkZVjE2AcJugI8cy9?=
 =?us-ascii?Q?hpd01/qHSFhCOn97Iyw/Al5k3hW7S1FJ/IEZfcJVhw8zVkJRcHMmzX1q0Wkp?=
 =?us-ascii?Q?YDv7TBXhveY9kEfTas/lZJ39EKt7dVKaEKeOuHXj/F8wGQtsSHcdtX92FsF/?=
 =?us-ascii?Q?ltiYb9pLhqsZ2Bcc6KEFIZtdb5FYrnPp1Zhmk/6u5a4Rf2W5M6ZusnUTIWd4?=
 =?us-ascii?Q?BIyfpWW2t1r/GqizDj2GSE6gIcCFiw3o9xzKs4hDNQKX8o7UacozF9cdo6g4?=
 =?us-ascii?Q?jRM7C8UFtq6yWuuap9EuA3vUFSxi8On1ReFJD0NdEa1JWLD9uYbSiu8XCnEB?=
 =?us-ascii?Q?ELzzMcSdWtU2FG0Uw1X8lR3g36yBDKIvOdIUssD2IA/G8sAZpAqwfkqh9gLe?=
 =?us-ascii?Q?M3UDUdSMxsrCtxEVoGAKMkQVddHgpdDunIb6yn4g9vD/zWPg0Mmd6ot2TUQ1?=
 =?us-ascii?Q?BqMKaFO2xrSoEvbhBP6bE5HB+LE5LUBWlT8tGLmFoF2zWZx/2LT/QzDqn+EN?=
 =?us-ascii?Q?KP0BkH34UWXQNfkobLfj3q5ubUMFXYsR+eDXAe3+/er1cFopW/7mgp4i5Bsc?=
 =?us-ascii?Q?FNGAd7X4azJ1tV14DtyrCg5FMBdZAEGvo2otc4YQLa8pbd+0Yb+CPb68UpjR?=
 =?us-ascii?Q?foNCu49YUT/7ASAgt4dqmANJaDnXSN9vE4rmLzdwjbbC2o0Y9vkvukVK2X76?=
 =?us-ascii?Q?rC7VSxri/MVOj1s2UTEf55cwW7QJGOUnfTplas8md9+0HrH5jeupp9rR20OA?=
 =?us-ascii?Q?GiSjdglr7zwF2QfUpQgJrs7+X9EM9Avwr3FrOfwhQcJx0xZzOvJc/uqht0Th?=
 =?us-ascii?Q?8qoI9gGZxjhl71MnrjUrXWE16mMlfrhWclOFHrpHoe9V13wKCaWXUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 03:26:14.5083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2093e6ef-d8b5-43a8-24bc-08dd6c15f6d0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_202636_055667_4F95E6D2 
X-CRM114-Status: GOOD (  15.24  )
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

On 25-03-25 10:52:10, Marc Zyngier wrote:
> > +     timer {
> > +             compatible = "arm,armv8-timer";
> > +             interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
> > +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> > +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> > +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> > +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> > +                          <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
> > +     };
> > +};
> 
> I don't think there is anything wrong here, but it is also a pretty
> useless DT. There isn't even a UART to interact with the machine and
> find out whether it has actually booted.
> 

UEFI uses the same UART, so we could see all kernel boot logs until
switch to use kernel UART driver for printk. If you would like boot
to the console at initramfs, just add uart node like patchset v1.

> I reckon this should be part of the initial DT, as this otherwise
> serves little purpose.
> 

Without this initial support, we can't add some base drivers, like
mailbox. The dt_binding_check will report warnings/errors [1].

Full UART support depends on clock, clock control needs mailbox
to talk with FW using SCMI protocol.

There is no any support for CIX SoC, so we had to add one small step by
step.

[1] https://lore.kernel.org/lkml/174290730775.1655008.14031380406017771195.robh@kernel.org/

-- 

Best regards,
Peter

