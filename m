Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8452D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzKPXcys/yDv3xR50V/DQ4UbV8OFp6lVFesvejZ/KE4=; b=ZYdDM+31u6OM1OuHTWGEkcSqiz
	UCLtbSu5uZmttBPx71G5Ri8I8bi/DLikXx50AycRgms5zh4m57sgBYoKRW1Fmuw4HQNQSpfLT0o8h
	IJhzaIqWmDbWe01T/ERSIx97NE9ACLW56EpyexP4lgJJ/IXRRGDHmtRmg6lTT1AyLGQJv+8zMr82H
	OhbF8BoByJcnrpyk4Iv4q5zkdWJ1+1BHxxt3GXRxccWXIJAQoIBQlSoJGlGJNT5BSeRP0NHRenP5t
	bxwOzJNf9iNvKl4wIn1T73qXwfTXHcRUXnK/czI6EvBMCyWLGAuKhDQEanOcORO6b2FMZeQwrDoTV
	56wi4Xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt3y-00000000Avd-21Kq;
	Thu, 08 Jan 2026 16:40:42 +0000
Received: from mail-centralusazhn150100000.outbound.protection.outlook.com ([2a01:111:f403:d906::] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdt3v-00000000Auy-1E7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZFZ+QITetErSYrKnZ04ohU7jDBUijLx9hEDrCqQtPC+meXjiIT+1nxOubB8kiJUlCSjAp9wR1I05+4nmT+cMyoQTFPRxJyCmQeQvFePb9b7n1hLB+LQPvwb+q+5xGbQJT9su/eUqzqXibrB9xfpqjqH+kkI/2eYGp6FTmIsABTkI6wVxy+vofGx5mhFSJPKbKDR5/hyEs+ffsQjeeG9Hl/E/RPBTQiLEN6H9Oz7UsrEWtNpT3YYJZlV3KNlMBtif6Dyef/VQUfMhgehZKe8BO/qpEfulOb1963oLDkYNyyZfaxtr3OyH0cjW20GQLV4FKjknZZJ66+GcAo57RwZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzKPXcys/yDv3xR50V/DQ4UbV8OFp6lVFesvejZ/KE4=;
 b=gcp9oU7r1h4Iu4iTEzWauFiOjnSbFGCimnSsRrXi9J0lWDB3hDY5VCMDg2Kkjn4cOI5YApYwAIzEOKM1jtQ98fyNeixMZHbkQjs2rrJZ4H+R57zhOcOmwVvr2nh/HS2/NzCLuknsgrbguPTf9FfTCa6vDd6p3AMQQJu4R7ize4kZHeYy7jOtw5OEBkluaUhBAwuXHJtR6iSgjC1b1EAs5tlwne+L3zmJ8hpNVjEoPlAsZ7avnX44m9cDjDAdp35oxZ3YwUky4Eqdv0mZweI1XjYSo7e0ReIkpDJ+lR8M6slOzxAD9ZBSJNoxMovSBO2QOzlUuuY92qguJS05SlLVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzKPXcys/yDv3xR50V/DQ4UbV8OFp6lVFesvejZ/KE4=;
 b=sW1RxAzShqEybrpSmOtSoNZEDGvqxjEI+bUFFy4ItnwQHQ5u6c75UI5+mZlP4gkbcTDOWbUh7iMkSA/KfbJbu5VUV9PvD2f8fOEYdCKCRbW3ape29WZw115yH+o/oNDT6nIYIrx2RgMfV/z2AmEsrZ+XKM0EVduVDtThZHaYikY=
Received: from IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::8)
 by PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 16:40:34 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::ba) by IA4P221CA0002.outlook.office365.com
 (2603:10b6:208:559::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Thu, 8
 Jan 2026 16:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:40:32 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 10:40:25 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 10:40:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 10:40:24 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608GeOqp2674922;
	Thu, 8 Jan 2026 10:40:24 -0600
Date: Thu, 8 Jan 2026 10:40:24 -0600
From: Nishanth Menon <nm@ti.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman
	<khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur
	<a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Message-ID: <20260108164024.fodfklk7xayh4dqj@authentic>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
 <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
 <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
 <6c90102537c3e3f1712538ca0b165cd54d71d8c2.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c90102537c3e3f1712538ca0b165cd54d71d8c2.camel@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|PH8PR10MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 019846df-1a8e-4833-7bb7-08de4ed4a45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34070700014|376014|1800799024|7416014|82310400026|36860700013|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k6h74jTKTRfH/n2xceMwm5qyxWHcj0GErZouanMUOz9uAI5sq0rEYAa8ft3o?=
 =?us-ascii?Q?c3mnhe3gail07p2CUKyNs/C56kRw+nXsu+kTlToJXpFZOnb315b5wrJQUY0Z?=
 =?us-ascii?Q?E2pJHpyFuHZ80/xjJ2bjZ9+hxlsLhCWSNpOqyfrNl7hD10aeAzPRKmpxRsa/?=
 =?us-ascii?Q?LxVuwyGuxXU69F/ONr1azinLOikNt5cWV+8DbrkdQqgY3qEsYAng8T6MQ9F6?=
 =?us-ascii?Q?6i8B2aklb9mLfB6bGHaRmcRrBBBBRJ/4mJFIFIPLvvtYTnhDLEiGwUOJ/txY?=
 =?us-ascii?Q?9FY6reNGQP18OLoLnn7DKAAn4m9zstU+mLoeqxtxaRCgjA8Lz9Tq336pfgRV?=
 =?us-ascii?Q?67BaKtUNOL+27zvz+DSVtoY41KL4673tqMYTv9jRCADjNknlC0qOmULSM34A?=
 =?us-ascii?Q?xslLvTrTCQ4o+8XhaDZKGHyoNlJUk4VBcU7i7xnkZdTltk/cWWt5ij7BhegR?=
 =?us-ascii?Q?wuAFBhAsMVJm1LaSuMo++L6LDBfu5sRXqQkdlRqMHBfakaAcC2o7Jk+Sm0Tl?=
 =?us-ascii?Q?A+MrQ8XotSPPC3YSgGRThkQB/wY2sbtxaLHsqrDylphcbXEZJsJ4ASqAGrG9?=
 =?us-ascii?Q?laBhmYuDuHZa4hmTKme+Aic4CFUflZXAIKgBr5ooFcnuUBT8CkGCiss5CagP?=
 =?us-ascii?Q?ev8VdWJQK1qsJ+89V1gus12IGwPUU7mXb+OExJen+b203aSXH10fZ6/aqOLB?=
 =?us-ascii?Q?5rvPttFXSaXSU4Got6xv1XUCkBcawm9+MnPm19fwTSulsIxB/V1Y6RNGEMhL?=
 =?us-ascii?Q?Z9xp9gKWeoSBWC4dIEnMr1HABTcRt5jOnOQZKV4ba4bIfQFQ5CRwnTiGPHfM?=
 =?us-ascii?Q?4Q0lQ74awrddLe+UNxZQLjR4WBkxoLh/0oxxc49P1rQ4Mr08+DJgGBtBuNwf?=
 =?us-ascii?Q?EaMnBpCy+hLPef1Y2CaDQI75cvaPoORlaOEAyvBYaIZMidQf8xyprlQmilm9?=
 =?us-ascii?Q?v/Hqv7mIxzivvs+Mo6IASm5uXxJGu14hO4CO+FteOfxHUx/+7ElzatphloQt?=
 =?us-ascii?Q?ATTTHuNVKFI0B7jKc/w8nv+2/eKbo3XgDRyak7AEKNzjvKFze6x5t+OqrYlA?=
 =?us-ascii?Q?w/IrFK980VIA3pBn1UON14NrmnszxhbkaGSiwvin7x0ID3nx4w8J+VZmjDrn?=
 =?us-ascii?Q?2wOjheMiD4WiPfYHCzIiPyw1nbyua/VHBXECpty+HszeQR/WzGFcW9cSIMi5?=
 =?us-ascii?Q?oX9LlHfC0SoUBBh6ID/3LwdxbVsl40ybVksZxBbJnQAOn49+TFfULrRC750B?=
 =?us-ascii?Q?mRxaqJSlHsYCqvifv6Jv6/oTnsHd6hiTgHdA4YxSvFRQVohkhUJz3ZNdMqkZ?=
 =?us-ascii?Q?Oi+FFdD8VRvc5gPTEyuVDKhcc3qy4EfZ9sPPsBY9fA5q5iDuaxkTF+ryIIcC?=
 =?us-ascii?Q?XqDVl8PTrS1zMZMuL9i7EcPJshNg6eBSkkmSXZpWwGA/hqEnTPTzWwdqhYGX?=
 =?us-ascii?Q?raPNSRfewd1tonfLBPK4enXes3plhfEWTUGRzPDPL1MN0WjErBGAIx6N7fhb?=
 =?us-ascii?Q?Jr4ANY2N+n6xIVj31XGIc2tLdal3mUgzlNwqroCPY87OmwimZBJAHrFuf/qa?=
 =?us-ascii?Q?RFfCUx+V2l9BzbXAiRE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(376014)(1800799024)(7416014)(82310400026)(36860700013)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:40:32.9656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019846df-1a8e-4833-7bb7-08de4ed4a45e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_084039_529606_9B9804C7 
X-CRM114-Status: GOOD (  22.57  )
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

On 23:57-20260107, Alexander Sverdlin wrote:
> Hi Markus,
> 
> On Tue, 2026-01-06 at 21:25 +0100, Markus Schneider-Pargmann wrote:
> > > I think we would need to discuss this with TI via our FAE, because the change
> > > in question has both been discussed with former FAE and the technical team
> > > behind, and adopted in TI SDK.
> > > 
> > > Or have you already discused this with corresponding TI HW team?
> > > 
> > > Which hardware is affected, is it the official SK-AM62A-LP?
> > > Is MMC2 the SD-card?
> > 
> > I only tested my am62a board on u-boot v2026.01. It is a SK-AM62A-LP.
> > MMC2 is the SD-card and mmc1 in the devicetree.
> 
> just wanted to let you know, I was able to reproduce the problems with SD
> card access via MMC2 under Linux on AM623 with ST enabled.
> 
> We will seek clarification from TI on why this happens, which peripherals
> are affected and what should be the course of actions.


I have passed this up the chain here at TI. What confuses the heck out
of me is this: from an internal email chain I am privy to, i am being
told that "the ST_EN bit in every PADCONFIG register should never be
changed from its power-on default state of 0b1" and the fact that Linux
kernel has been stable with the setting for a long period, So I am
confused why U-Boot would show this instability.. I don't have answers
at the moment. until we clarify the reasoning, I am going to have to
hold off this given that kernel behavior has not regressed that I am
aware of.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

