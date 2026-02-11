Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AAEE9E30C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ml57KqT5lzhPCBF4ThgoCaTT6BVdlM43pDiV1QmsKCA=; b=3GiJlHbEEWMD46
	XEBmOYS4NUY1AUTcINE0Sp+f523+52iVSmKjMp8HKvnZIbEhYelpbJqFQuspw24j+5pju4qY+oRK8
	02JM9RtR4v2J0Qucb8LrhEEvrMjXYzG+Ndfub4XLtddEvY4h36fdrIcvwC2CCHIcdmuhQnmWgoywh
	insV3gvz62LzQN7l9xSkfgeugstZrWLVIxBkCHcP1Y23BB9dcbbEeVhCTo+27kJ5l6GIkB+lmXgn1
	Hfb9vpmV0OeRAhBHpuVQ5xJ04uDxllv6yv48RWv6NdKrYxAmV0WO1LCsFfGkqQCZl8zM9jSrm5P3G
	UtWyG0xHdxrmLY/J8bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgY-00000000hWo-26Nw;
	Wed, 11 Feb 2026 13:55:18 +0000
Received: from mail-francecentralazon11013006.outbound.protection.outlook.com ([40.107.162.6] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgQ-00000000hUM-3d6t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD5pW3OWp+pArLEBclt7mZd8HlfppwnU3fFH2GsVeHD0HJKENOP9ZoCQGs1/5SP92qUd2CZKBLa3t3tejER+j/xTku5n1hxvPVLVQ9ja8PZy/4IMuy8r8riCCsznPyspUyy5lhvTl3UpI4EAOobnjxixv/nsoI7N4TFLK09V3Ag9UZW67obh9yXxnr/0B81hMNAxeJ323ZEnB7OaLq5M4choMfofIE+LyguTs4eangqN2r9MaqCFhULdC/KQHwqg9bPCVwM5b7fG8tm9huBHE2lDE23AP8TMcXQkVHqj9uBA2VjUPjjg0zqGMph7uBp/m359+ynJ86aqyK+YU8YlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml57KqT5lzhPCBF4ThgoCaTT6BVdlM43pDiV1QmsKCA=;
 b=xN0ALO6765xdacelDEZxC2iND/8GU1WaFkTTSTbHEb26mPz8pasRSL0ZbGaZ9nvoK8l/eNHnOuSvLWiG4zZtlFgI+MtfKZWgdYQMyanIPH/1YGboNLmvmHrUJ+xNMNoTXeen/enLyi2tDUEgeR0Li/5X48HUsQcvAZZJTdg4GAaOM8fK/4zuhO6o333xBCm1XXCgwo01ifGd4FnlZoVEGxTm0+gUwsyrx/ZTrZyrlTctXvv+z8F+b9u8pJVY//agN3lfgd1c/QAiywRCF9f+az7K1/zj1oEVoqAnf2sbANkfJJlYUfoNJj6Jj17Qa8uUbn3p1vgnjhOXFg91T0cIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml57KqT5lzhPCBF4ThgoCaTT6BVdlM43pDiV1QmsKCA=;
 b=n1RxKLhVqccnbXqjnsiXvl3mdpmZc6x+TBXHIskVT+MxQLL73kUKkl+HR2ws5iO1pgdJ/0pysSLDvwB0QyUL39eJf8qcghXBzz+4gvMtgm+NVE375eiR+Z8+EvxLopvpfqbZkyrCnwLwwhsADqv78jUnk4JwMF9DCcqa7Ldsy9aIcW4W6Gh4ZeKkuBf/93e15jmOyCpyUOJY16XerFy4yBcXCntNl1UxGyy1CIh7A5TuSNsF7K2SXO3SKJgCOrWQ8uC/2zizUMFgUVZVTdgkNYEtTnM24eJoi2lsAOuskD0AstXADmIUEKgFGs4ytkx0DpLgxDIoemrjhAyMMj71NQ==
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by PAVPR10MB7010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:305::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 13:55:02 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::58) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 13:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 11 Feb 2026 13:55:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:56:43 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:55:00 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH 0/2] arm64: dts: st: Add BSEC support for STM32MP21
Date: Wed, 11 Feb 2026 14:55:00 +0100
Message-ID: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSKjGkC/x3MwQrCMAwA0F8ZOVtYMqjir4iUrI2aQ7vSbCKM/
 fuKx3d5O5g0FYP7sEOTr5oupQMvA8QPl7c4Td1AI/mREN1WbW3COdiaJ8qVMMwmMZQliTn0zDf
 yfJ1ShH7UJi/9/f/H8zhOgY5FA28AAAA=
X-Change-ID: 20260211-upstream_stm32mp21_bsec_nodes-16aa826a73dc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|PAVPR10MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec61145-1685-43d0-94bc-08de697526e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTgrenJOR0h6ZkhZQXpnQnBNdStpUzBiQmFyUGkzOTFwajl5S2tIa2dpR2wz?=
 =?utf-8?B?SEt4VWoza0RPSmRIcGRxTURCSE5BRkswdDdtSUo1YkdMN0VuZDh1Ym1jNjVr?=
 =?utf-8?B?eThzTUxYbUtIRTBoeC9rVno1MDlRdERxeENoSS92aEFROWJrOGtVL3I0OXZW?=
 =?utf-8?B?M00xbFN2VGk5MUpFWDZhclZaUk5ZNXNpNnErdVNQbGNkNXRyaVdSSkZ0Vmhr?=
 =?utf-8?B?V2tmZ21VOWdpVHp0SVNTV0dmSWpXYVlwSkN5a3lVTVd5WFRKZ0ZVRlNqemgr?=
 =?utf-8?B?MTR0bkNLRC9qRGZ1MWN5WUJoTGNDazByVXFtWFFkYzRNY0JZcURDVlBFWjFC?=
 =?utf-8?B?TEJKRFVFK2xsZHJiU1NrdDJBdVRsSUlGbjVTSnhDUHE0d0tPN2p6NkpGZlNo?=
 =?utf-8?B?b2pUY0s4ejlmR25udlFYUytJWUE0UXhuVEY5UHpmcENOemR6WDE2TTAwNjVz?=
 =?utf-8?B?WDFNOXhrS2thdEdDekhKclFJdng3UFM0bFoyLzNDdXRLRTNGUmNsTWlUN21M?=
 =?utf-8?B?WjUvbUFCSjBVTHpQbERPRTRQRGRoMjdCaW9UeFFTS0pBc2NicGsvMHVrV3l5?=
 =?utf-8?B?eWxQVW5wZFZGNnlqanczdU93K2pJa2NRcThxZ1psdWp1NkFXSEpkYklSaXVY?=
 =?utf-8?B?MGhubHIrOXlYVlZkL1FTMi9oV1UwMUFVaytEdHNibUpZMmlMTmZKSjBqSjh5?=
 =?utf-8?B?ZmV4Y2RuL21GSlVTQnR2K3JzK0RvZGNGQmtwZ3A1anZPZEpTbTFTMG1uSldX?=
 =?utf-8?B?TGRrRXVYaGJNWkFzNFQxMDgvQzRWUkIwc3MxYmZLZ3lxanlraW5vcDZTWkls?=
 =?utf-8?B?Sm9ueWNIMDFHc080K2NJSGE3N3d2cVZHVEwwU3RLYW9EamlTNDdzWFBScHRl?=
 =?utf-8?B?TzhlSndlVjFTRk5Ya0JtY0pDNnl4K3dXWXlYTzJSS1owYjcweW5ocHJJZEpG?=
 =?utf-8?B?UlZoK0dDK3VTb01tOVRwZ2U3Wk5BeEMrSCtsODBUZG93dXhOa0pKVzNjdFY3?=
 =?utf-8?B?eDVNNTZJRFluS3U5Q2lQQThwMjY1cGZLNm9pY1V0d3pCWHA2VWRkdzFaK04r?=
 =?utf-8?B?bUYwMmNGM1RSa1I2TW1rOVNyRDQvdXExTDZjM3ZmVEdhKzRsQ3VFQVVqRjVN?=
 =?utf-8?B?M1JRL2EyM0VDTTFwelRJc2lENzJRZEs3QkFsVnM0dlBFZmRmOHhGMkJDQ1U5?=
 =?utf-8?B?SXQ2cTFaOVQzOE5jeUZTV0VNeTNtMmQ4aU1RekNsL28xclIzRUZwVGdGc2tx?=
 =?utf-8?B?LysyUkdjMno0K3ZxT0ZTaE4rWmhkcE05cXNqa1Q1c1JIZHplakwxVXp1ZHN4?=
 =?utf-8?B?YnJjOTlwVCtWNHA2a1hTUDJ5dEJPZ1BhSmxrWkNmVUk2dzdMWjB1dnQ5VURl?=
 =?utf-8?B?OCswc1puSjVhMThGdkF6QmZiNTBiUEFlcjk3azFxemtYeGpkMkYyMDBqNEtx?=
 =?utf-8?B?eFlUR0xMVlZDN1V3N1RmTE9mdG0xSDJ5Q0xpS1QwWEVpcEhNcGhoaktnMWxQ?=
 =?utf-8?B?NWRxRGtVcTVqdDNvSklod3g2NlNIMFRQWHA2ZzhnNFc1WFNpOU8vRVpFQ2hs?=
 =?utf-8?B?Y3QzR1FPem4yczM1aW9OaGlKaFJEdzk1R1RhREd5QkY1UVBlUS93NmdnS1pz?=
 =?utf-8?B?VjY4TTdqRmpxL240cmIrSTU3eUJySDFkcWpOSXNBa3QwZm5UWWcvK29jRlhj?=
 =?utf-8?B?dVVrazNxSFN2S1ZEZlNWK3ViWVFSdmV1VGc4UXM0dXBJUUZzWkRKait6M1hp?=
 =?utf-8?B?amJHLzZJTGdWcTJVVVJhVGl2KytmcTJlTVc0dGFKeUZvYzRQWkdhaHV3ZExP?=
 =?utf-8?B?YUNndlRGeDMzcjJKcWxObjRpSW9LcVkvdkdsa2l6N0tIdTZLaCtteVFKUWN3?=
 =?utf-8?B?V0FJZXRFZ3VSdnNabHFxU21zdTMyZzVNNTk2L05IcVJqY3NvSnpKd3FJR2dU?=
 =?utf-8?B?TnI0dGMvS0VsazlURFFEMUlFZTJJeVFMVnJyVk40UVNtdTViOWMrSWcrK1lo?=
 =?utf-8?B?Nk96UDF1VlNXcU5Od0xGVW9DVE8wNXR0VWRBbElaR1UrZEExV0Zldlpkc1FH?=
 =?utf-8?B?YkdUdTBvYmJ6WnhOT3B5ZmIzbTFVeTBCOVdSOFZLeGVZbVNTZmN2bjZIc1lt?=
 =?utf-8?B?V0EzNXQrNmZEVldrMzF2OFdNdzNHWkRTQUFEVGQ5UUljSE5yamVubmdURVNv?=
 =?utf-8?B?M3libThxTHFFTVZxbkdnbkFsMTFib1EwYU5DZkwrOU1qN3cvSkY4elRKMkF2?=
 =?utf-8?B?Q09KaWtLaDBhRG1LSlVvNmFleUNnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lTpfWy6dqDT/x3+2sEk5OfmBJy9na6Lep78cG83QXwrCZgN1c1e++4t3XE/Pc+tuc2uTAdMebUrTGHeXQSe2kLpYKKonNQdVg1KvSdKrp7i59VSD1YVbpoHKB4VhxebzvheCKRZa+XPPbD5WhyT++yYmfkvDYCOqRJbuj2sBMFmRH6hzmb5qGHXX2txDPdznA1Hn+OKXIbs0s8c5c8gfr1xO6N5QHJL18i8dAaCJDGhPrfa5yopyoW0oNabXFObzCFHEkiUsSEcLfHdgRaCIE3ugGBC+2LZ07Sttuj9p81rDcUyVxegzKV/TVPJnlp1GWxT41fPtW3blV2OX1wFKp9ypXvpwowUGSoWXG2RoQY90Am+5HSkmlsXBxvdm2WcpMJJ1NVDOeaneHr6EfAX/HuA0gOVZLDasfCiFvQoLXbyO1iU52ISPDSY1ucIguD7S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:55:01.6752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec61145-1685-43d0-94bc-08de697526e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_055510_919776_6AFDA48D 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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

This series adds BSEC support for STM32MP21.
It adds bsec node in stm32mp211.dtsi and bootph-all property in bsec
node in stm32mp215f-dk.dts file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      arm64: dts: st: add bsec support to stm32mp21
      arm64: dts: st: add bootph-all in bsec node to stm32mp215f-dk

 arch/arm64/boot/dts/st/stm32mp211.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts |  4 ++++
 2 files changed, 20 insertions(+)
---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260211-upstream_stm32mp21_bsec_nodes-16aa826a73dc

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


