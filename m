Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5ABC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv5lN1oZDP5d3q2X/b7QczRKVOBkaa5DdM5O9UiBfcc=; b=QFdD7SgFNFHmWaRFTJuE9kaVDr
	h+wWXJBMVfUBLHW9DG2nL2sJp4Lk0ibKpxr0c2YPIJ0/1MTkSJm4cr7m8L0oV89AUY9qOuyOj0llX
	IiKj8/6XTlRWpn0tvs5RomKkVGMm75yq5RsZB8va00/03he81lPbJ7Y19Sfm9HUpr2PCox+y17qwP
	Cbk8dk+iLzhDRpLDTR2amRAmft7bA49IvmI2xVa0HaW0T/fTZe2FnPQBNFAbJTVn62bQ7Ecmm/vBD
	MwrNbwyDWv9u1U54jwmPt0z6rlw4OtggcYC5P2+IFS3D+A7edtreFWPBN9OFlgGpPANCL28tEqSl5
	gEnbDe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLUx-0000000BJ3x-3ZmY;
	Mon, 10 Aug 2026 08:36:43 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLUu-0000000BJ34-2mF8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL5RSGkM6+YkLFtTC6PbPHXr0jPH4ksQDx8gxNz5Ob+WxrmjbozujMHTXAWnLEW6g14RoHfcErzasGpfa0s4/8V/WlohaHn1EiMIpbBJ89FMpZImMijQBBXZ2WNy0bkjF2bLHpLjJPeixgAc4nFeVd3TTua5kLsWovZWn+HZ0LAadYLfDSQSLUmK3vAvd2u+uSJ4uGugNGjtyC4nJMu/tMH+//eUGfvlup4MBA5Dk4KDgqhiNgTsP2P9CLUPssuwlgm/9yfNvR+Pc/4h5pufmys2HbIxPVADyaKirsVMLi6gc0cRm0rDIBXFkENlbSHD4ms8QY9dkqhfgmsTV1A28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv5lN1oZDP5d3q2X/b7QczRKVOBkaa5DdM5O9UiBfcc=;
 b=dj28DOPlDOMfZZrYt8x+FDBovEVFIbxCv8wqtY9AJWp9Kkorad03wO7H6owS76+KBGUpVCtzVb1o7R+ZwMp/qyfdT5EbWRmiF/4W1P4fqBB1hnzKWo+YXDHOMqLeRyw801mctolns1DjQMZDpG5BesdjWhz2lfALRdPoKrGrMOEQBid7qDzJz8Rxh6Isq4WyN3655Yeq5BmrRkb++Xp/CFnB7kJxkd/igZe91uyTQTfZul8H1SYLwJC+12ruai4hI4zSGQJeDFURaR8LP3JVPBdiAdnnCSIfOejRniE8RDq3Du5JGz2xrviJt+Y/m+1wePtALxYp1G83t1C92T8sbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv5lN1oZDP5d3q2X/b7QczRKVOBkaa5DdM5O9UiBfcc=;
 b=hajEg0u7GBB2Qlb7AltBtwWjdqLlKAOszDSuc8WOwhIcu1fjxr/ko4UNhj4bNAXTtlyzddM3Kvuwy6zo+tIyrZBrRKnfEhxNZBd4QeahodWjDM/hNRvKDZPq9GSp2kmvXlgA6Kc4uZv3rLdu1qVaUUyB/wrO+Dy9xBVAi9nj4zxNVtEhX7ESp5GJp7XNgDIgm/YWJdBOBi5Rlu3dpbDCK7AA2tUDLsCoLAaF0al0GPoO5S5A9DqanO4hvjNjh6Vq8mNyIhZbnEFyixMToznYIj4hcU+acXdZWVkD5MAamPLtaDoqSGDZO9wT9x+M5gc8HJivzmoKPgMiC4DkxdnmRw==
Received: from DB8PR06CA0056.eurprd06.prod.outlook.com (2603:10a6:10:120::30)
 by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:36:36 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::5) by DB8PR06CA0056.outlook.office365.com
 (2603:10a6:10:120::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 08:36:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:42:04 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:36:34 +0200
Message-ID: <8e31a91d-6c1e-43c7-8a9f-cbd592e148dc@foss.st.com>
Date: Mon, 10 Aug 2026 10:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ARM/arm64: dts: st: fix node ordering in ST board
 device trees
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|PA4PR10MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: e0baacc9-0614-476c-e1e4-08def6ba7d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NZgt+9tWkr/w5+aSAo5EUJi84xka8EO3Nfevq2FzU4GhaNtzCGKiDT7GoTw6MxemjWtspbDcsQyhybXT3H4plL7gyXCE3dSXJXslrQCsznV/JzrwOrEu/e2R8hfLsrPVmrt1we7toAUgXWpQjVw+3AqIMTzRScjy66QXXSZmvwjmKYvDs5dy+qANdKdZ4O1AWG63GmT8LYapxvL4xvpalvW586w4HpveO/sBpIvxkFoAUgNSgCtbYzGKO3f7UX5FcesDPU12UUyt1sVGZKfwDYR4H5FP9mGwkvluazwOAJjYQ4mzcdsNv0V0sQrsms+Frfh4s1zOQDWf4EK33YnBkA7IkqGzdcPXxKje3v639fORW41Mr2R6GmklgfjWWifhdcJcjnH/2/ikW7xHAhr+kouzZh9GKFf5Hgcyc+vaUdcNtDNTn32fYWoE7rkOz5PL2wJ14hR/7w1W/sWSWs57tWlPN8RI201CaGCXyef/AQub5smQA5VPzU7ICWHW/iMY9p7COz16HyzRDSBEhmbU8xAgrW2jeAGlBe0L+BcoVSAf23o6ywDe8a1lO0MvWhsyluzDKBHxhn+/jOQAk9tVqV+n5JryldtnLdBf6AbNaUBaIzegaPazfDPiPuhB8An8kaDZdaewcJhQ6hdAKuhWQCsFtJSB54fMtwsZJXFE7/7QtS3eU+8w0Mgj31P6SV6/s+Qs/uUUewE81NxlScA3aA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CI650E4aUrmTs/zZRDdV0CA7jrTAQNhiS0jV6a9KGVCHNTspuvJhBkl9dCi6M8UHnxQHrg6TYtBBkf36ccFRD55gXa7CCP1Fbhd7cFq2Ppw3TL9p1NrUPhfec6SN0xYZjxjhHFyPqrucSr+qafkHsl1V6pAtRZleMk+dycrLNkldjMhlz8Ctce1fKo/+BQRo+aCndnlLm8feGIK1RX4rTpk+Rlef9VIEmG9iVimtJb2gHLritfna283RlZamEW7caI6fA78jJ1TaOqmxx5Mxdx9/uusqX6atGJi+bOXITugZT5Ddd/JBMGsi0wvzGOqWYnT65OF3wMP01jHjscKmyDINFpGlF2xWJe5GnbVDiwzi3gw7SVZLWBz0qVr/Z5WU1lJmJNVmVF8MPVH5VSVsnQsvvEioQkkPPEkDfgY/1YpShWuH3Rqoe9HXmhx3mOr+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:36:35.4870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0baacc9-0614-476c-e1e4-08def6ba7d15
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_013640_810057_BE01C805 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Amélie

On 6/12/26 14:56, Amelie Delaunay wrote:
> In the ST board DTS files, &label entries must be ordered
> alphanumerically.
> Over time, several nodes ended up out of order as a side effect of
> adding new features or refactoring existing ones.
> This series restores the correct alphanumeric ordering across
> all ST board DTS files, with no functional change.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v2:
> - Fix typo in commit message of patch 1.
> - Link to v1: https://lore.kernel.org/r/20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com
> 
> ---
> Amelie Delaunay (5):
>        arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
>        ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
>        ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
>        ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
>        ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts
> 
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  4 +-
>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  8 ++--
>   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  8 ++--
>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  8 ++--
>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  8 ++--
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  6 +--
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 +--
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 56 +++++++++++++--------------
>   8 files changed, 52 insertions(+), 52 deletions(-)
> ---
> base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
> change-id: 20260611-node_reordering-4b9b132b007f
> 
> Best regards,

Series applied on stm32-next.

Regards
Alex

