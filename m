Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8971BD232FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=; b=NL77mBLf7AsMFiT63vqoloUzCX
	Kw8zngT8XjLmM9zL+eQntbNlZijtgt7KU5f2Hg6yim7ZukKjqrEmSp9aCwkxMAW6gEA2O2c4hR/EE
	owoQUH7KlSW4BFuKofadmVg1XK6UzgEq/zRqDq8nf1DNWsLogTGQJOSXnoVy6TYPyq6GF+R7/YEgo
	duFvQ6slE44m4TJP0bUJXfHEpC+jghP3eR16iL0jgX084UT/9hJGyeEgJXD62NgBC7INupVw7TI5V
	GS1ThuaQM5bRdOIA2OOP1Dlgnrmuj6WgnyOjeM/L9vxu+KSU4C/qEr1iCnsVW59XMSQ0FMK0sZ9G2
	xy1Rb+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8i3-0000000201h-1WW9;
	Fri, 09 Jan 2026 09:23:07 +0000
Received: from mail-northeuropeazon11011029.outbound.protection.outlook.com ([52.101.65.29] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hu-00000001ztm-3tRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlZNhSUPW9OSSI7CfqaUpoWdJSv0KGFfA43ZFp863inzgxJfweUHsGhWT+/TkgJUiO6jMTEod+5wF8M+B5+UDQiue2ylgKYgB7hsDHkRkuLZ30+1ZKkv4T5ZHwLURfcXp1vw0cUrHzC/EbQXCOnFB7sS2pz14x4ES5F7s9asMRKSm+Gv9TJFN/h1YCrEqjPmAHJT1VKrDw9zLYQ0mFOz3ph99LUqLoFseyTzGLvybBMzId+xAnMcXXh1L6fCZ8KWcS2c5nJTIRco2M/mXb798qWvypGHaqn8N1MLruJZi1a47Cj1yX/2fVZ+IZqq4jJHd4oqGzBZnjLZlEdg/Yn9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=;
 b=JgpWWZI2CiQl6yOx1LXp8b4oluHtjscPOJqmBXNbi3w/vq7ksNLfdDJJUMj+iJPESNovPio16CSShok2EUzEDZoH8v0JBsWDogtkkGGjZU/ow7+kORCrxOD/9zDGPyv+YVokM1ZbORlBhID8PXNSrQ9YrAeeZ1ri0UKADlpJbLQ/Fz7WRy3LaI2x8HTGnTVzflkSpyKkSJFo7BzMFIQlTNazN61ltVdDLOiLZqHXv5OxgEazOCDtEd0nPxlqqiGLT5JhjWOGIwFAOe3pUxvwaIWqaMwOagzbpIe9fXn0K8vqBjMHp1UoBxs1B4nKLOMG6fZL7MtltKNP+HDgpNy1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=;
 b=Rmt13KLit0Dv+XF12Yq8dPtqnrqFKSRstw4H7yGvvR6HMeaaomFn5aL+vwhFzpIrbgODoZ0RXoyA9pxBsdSQUD4fx7jV9g9w9X6sEhuJ+QOkScyJVbMuazCvhJLAwnVaLffpbs3zpfX11Ah/kHjzoB8U8SO72JAF94xH+YzBCJmGgOPhpatsu9TGRGaN69VBJXKpkXmec8cP148lrt0qEHmzxdRXI4IpgPM6YPcwNU4aoZ8EubYm7Mj7IXxLDDzRkYMjdXqHD781wr3qCyYSeX6Eh6hUaQePbCrgkrBCTOywhMKljJxPxTswnlTdLQ7dTO0qRisK7OpjMxskOWhWiw==
Received: from AM9P193CA0026.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::31)
 by DB4PR10MB6237.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:22:52 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e::4) by AM9P193CA0026.outlook.office365.com
 (2603:10a6:20b:21e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Fri, 9
 Jan 2026 09:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Fri, 9 Jan 2026 09:22:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 10:24:06 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:50 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:50 +0100
Subject: [PATCH v4 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-upstream_uboot_properties-v4-6-75e06657c600@foss.st.com>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|DB4PR10MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 088764c3-ea22-4bf6-6a4b-08de4f60a9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0lEUUNRRldPVDJ5Mm9pc1c0SDNaSzFmSDMzWWtrZCtnQ2pjT2daQmkxVjk5?=
 =?utf-8?B?YzVvc0paWGt6bXhhY2JadW94SE1HejZja01QKyt5MUJlOVA1dFhLSHNKZko2?=
 =?utf-8?B?bHkwQjFzSGZtN1Q0Y3lDT0RvNlI1RHdCWW9WZW1jaVZoTGgxYzVHRHBaTStu?=
 =?utf-8?B?U3UrUHlJM29BT2U1VDI5UWxuK3Ztc21VRVVkUmVsUDJlU1UyVFBqQWlHS0Rq?=
 =?utf-8?B?M2dtamFPTmlOOVdNSTl5dzRwWk4ya3lEbXpqMTBNdlN0M1BndmxsU0xMak01?=
 =?utf-8?B?WnBPb0FCd1A1WmFpT1FQejQ5M1AwM3dOMk5taDNkNWhIZWVOQ3huZ0p5RzdB?=
 =?utf-8?B?aWlUSTJIVG42N0hjd1BLTEw1S0RzSUxzUmszS1Y0cG5sell4WXVHVXgzbnVi?=
 =?utf-8?B?WmZkbS9zZk5qT2YrTUk4K0VwVjl5bVVxMG9mSDE3QmhRUXp4VnRqZzBEOUIv?=
 =?utf-8?B?dDQ4dWV1TDF5b3o0L25KMjJYOFloOExzZVZZQVVybCt4WDVUaHV3bzVHd0JP?=
 =?utf-8?B?TnA5a1N2MWtSaDM5NjNNV2JrZnQ1ZUZYbTI1WEdiV3YwTHNDTkJoLzg2SVc5?=
 =?utf-8?B?YnNCSEN2ZVFyRXJLN0ZVYW16bDJoSDlPK0NTVnR3UzFHWWVvQW5tNFM0S05y?=
 =?utf-8?B?bE53VWJpbzFKbThiTFNmdWNxd3Q3Qm5NRElRejk0Y29zZkZiakxVYTU2OXhU?=
 =?utf-8?B?KzNaS1F3TUdXSW03aG1aalV1Z21Ud1RIVkpsTW9rRG40cGt0cDZLUW1VZ2NV?=
 =?utf-8?B?YlNrT085SFVrV1BmT3kvVlhGNDNvRHlRKzEvOXN4bDMyVm1aTlF0QVVjUkxJ?=
 =?utf-8?B?dUdDUDRaMjFuQ3Z6YXl1N2E5UXBGUzF1V2tWVUdMSG5xd3B4ZExXLzVRcFl5?=
 =?utf-8?B?SXlTdElnUmp6MDFTZFpLdkRGTG5aeUJFNHhldTZobkdnVm1mNGl3cjA0dVg2?=
 =?utf-8?B?RVdmTU9tc2I3eS9Dd1pvdDNqb0NKUjRvRGRsbnNzTzlLMDZvWFVoZXFTY202?=
 =?utf-8?B?Ukp3V0xNZ3RGR29ITkVWc2VBckpvcmREakJFK0ozNjd3SUNacFBJanFheTlq?=
 =?utf-8?B?YzZ0ZlJ1Zm1kQTRFeTZ5ZzhWS2RqRSt6Nzgvbk5sR1hiTUl4VldwRTJpMzNi?=
 =?utf-8?B?ZmhYL09SZ3RSa05iSG9ZaWtMdXVBTFpMVjZURm5sWElMYWtweDcyc0xpSnhZ?=
 =?utf-8?B?YjVUTjc2ZHRmSGtTN2M2RjdJWFI1Vm02WFp0U0ZQMGJFYnpaQmN4SE0zUVlG?=
 =?utf-8?B?N3owOWhvRXQxbnFiUTAzQmQrRTdXdktsRXQvS0hDTkVRVFcrd1oxTVdrdWwr?=
 =?utf-8?B?dVE4dE5LWDVXbFhqbGc3eGRSclIyTFJ2a1Z0VGpUck41VHlhaXhxYmhPV1lx?=
 =?utf-8?B?NFoxQ0ZzclYrWGI3WUxtOFkzbnE2amYvdW0rZzRJRmpNMlJJUXcrTDA2TzZC?=
 =?utf-8?B?cGdEQW81M3E5ZjIwb0ptTVQzcnArVVh1Vm5LR0lHOUx5RlBXS0ZlNnhuRGY5?=
 =?utf-8?B?cDl1bHpyV29OcWVuOGdnSk42eDNUeC96ZGpaK2xrckZ3SkMwOVhkRWphQThY?=
 =?utf-8?B?WXdHZDJxRWVvNDhTb1Y2RlN0QW5VVG01dnJMWXhmZ3ZBRktXNm9sdC8rNGwy?=
 =?utf-8?B?UHhKZ1F3MmJlZDNmLzFwNWRnRVdXYXZDMUhKTkFMU214dXNFcGRnREZ6UGNz?=
 =?utf-8?B?Szd2K1BmcG5FNXh0SmJXdWtHVkJ3MmNBYlI3eXlzeEM0UVFET0FqQ3NWQWxN?=
 =?utf-8?B?OEh6ZjNCQ1ZXNjEyaHc5L0QyZ2F3RFNTc0VGODRRS3dTMHdVOEo3WDMxVjMw?=
 =?utf-8?B?SCtJdUphV1NQSGMxNmlqNDk5Q2dBY2dWZFhRU0krdGdDZXEwTE9TSHE2a2pC?=
 =?utf-8?B?ZlpPOTJabHVuQ2hBMWpFWjdzMzdWNEpBYzd1a2htVURsbjNnUVdrN1hMdGRV?=
 =?utf-8?B?ajhvNzFOSjdVRU8xTXRuMmNzR2NGTTd6S09CYktib2pOS1lIZGpUUTZ3Ry9Y?=
 =?utf-8?B?SGd2SDZXRFdFTlpKWnVuREpGQzB2RmhoZjJCNXRwaDJCVDhqcUZ5QlRBOTNy?=
 =?utf-8?B?Z2ZqOHQ4WFVpN2gwU0ZNT3NPN3hMM2Fmdjh3Tm1WQjRIcDdNcktsQ3RQajU3?=
 =?utf-8?Q?58QQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: G1gNXv8QHsXAe/+qFcqzFZuu/g/vU4wnQAjWm9IIRAewrgIkJl63qUkI4dJoROJUUBjLPwQIgcHmNmBL7+mfeWI9wMiH9+jGa9HX3gm5+iJLJ68I6JhMiqxUIUI1wlzFbAELxI0tbRNqcjE3Y6lj78RBsYeUOKRBewN5LKnZMYJb6JGt48/dwxv1QhgSMzYyeiPLiPs2HTmIXWzhieEjOt+aaVWosP/JN5vrWpnQzrve9TKq0ahcAIIFTIcrlDfyStBMsyFNzZb0KY4xmNJ99CPuHeSsKyiD1JaFgdYbrPubikSuVl3FXttE3rCRCME5iZO6ZiDGQzxK8HMbMdYFRJen271tJCS5e2st3wKUGp92ilNVGEnQLGvNukZdnbcpAt/5X/xsy+XNAFvyDwy+UdI6n7UbD1id9IfCS2d39iBX2Q/7iDPYoyJxRwWx/JOtJy9GO/ZZKB60Y1wC8FHQWgALUJXzlWiVWzKEx90wHhDKPCFHZBRV178ik1kiiXaASPSRUvshw4EpaPddaHb2rn9YM/7sxbApnuXff9rowM8l/RlRFYuJ2w02bW+WBtsusHCoWQJO1tbk7PKuj9IjOfMoQJFxrRwWcC5UvOpQz4bVTNRHZHEFO/AMGE97eJGZaOHTfl7o7ufBKS//+6IQJf3K4ABWjq7FaC2ERixaEhWrFGlT8aqiMuYgPvb8Ch/T
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:51.7469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 088764c3-ea22-4bf6-6a4b-08de4f60a9da
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012259_108712_3215A6E8 
X-CRM114-Status: GOOD (  10.23  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |  7 +++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi     | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |  3 ++-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 11 +++++++++++
 8 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index bf888d60cd4f..81b6a71fc032 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -50,6 +50,7 @@ firmware {
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -57,15 +58,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 		};
 	};
@@ -73,6 +77,7 @@ scmi_reset: protocol@16 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 	};
 
 	timer {
@@ -92,6 +97,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <2>;
+		bootph-all;
 
 		rifsc: bus@42080000 {
 			compatible = "simple-bus";
@@ -100,6 +106,7 @@ rifsc: bus@42080000 {
 			dma-ranges;
 			#address-cells = <1>;
 			#size-cells = <2>;
+			bootph-all;
 
 			usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..bc366639744a 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -45,5 +45,6 @@ &arm_wdt {
 };
 
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..075b4419d3ae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -57,6 +57,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -64,15 +65,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -114,6 +118,7 @@ scmi_vdda18adc: regulator@7 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -146,6 +151,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -223,6 +229,7 @@ rifsc: bus@42080000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
+			bootph-all;
 
 			i2s2: audio-controller@400b0000 {
 				compatible = "st,stm32mp25-i2s";
@@ -760,6 +767,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -857,6 +865,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -955,6 +964,7 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -965,6 +975,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
@@ -974,6 +985,7 @@ gpioa: gpio@44240000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -985,6 +997,7 @@ gpiob: gpio@44250000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -996,6 +1009,7 @@ gpioc: gpio@44260000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1007,6 +1021,7 @@ gpiod: gpio@44270000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1018,6 +1033,7 @@ gpioe: gpio@44280000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1029,6 +1045,7 @@ gpiof: gpio@44290000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1040,6 +1057,7 @@ gpiog: gpio@442a0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1051,6 +1069,7 @@ gpioh: gpio@442b0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1062,6 +1081,7 @@ gpioi: gpio@442c0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -1084,6 +1104,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				reg = <0 0x400>;
@@ -1094,6 +1115,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..391494eda5e6 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..0cc3ac8bb584 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -66,6 +66,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -73,15 +74,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -142,6 +146,7 @@ v2m0: v2m@48090000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -174,6 +179,7 @@ soc@0 {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -305,6 +311,7 @@ rifsc: bus@42080000 {
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
 			ranges;
+			bootph-all;
 
 			timers2: timer@40000000 {
 				compatible = "st,stm32mp25-timers";
@@ -1577,6 +1584,7 @@ ltdc: display-controller@48010000 {
 				clock-names = "lcd", "bus";
 				resets = <&rcc LTDC_R>;
 				access-controllers = <&rifsc 80>;
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1738,6 +1746,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -1842,6 +1851,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -1941,6 +1951,7 @@ syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
 			#clock-cells = <0>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -1951,6 +1962,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				gpio-controller;
@@ -1960,6 +1972,7 @@ gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1971,6 +1984,7 @@ gpiob: gpio@44250000 {
 				reg = <0x10000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1982,6 +1996,7 @@ gpioc: gpio@44260000 {
 				reg = <0x20000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1993,6 +2008,7 @@ gpiod: gpio@44270000 {
 				reg = <0x30000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2004,6 +2020,7 @@ gpioe: gpio@44280000 {
 				reg = <0x40000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2015,6 +2032,7 @@ gpiof: gpio@44290000 {
 				reg = <0x50000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2026,6 +2044,7 @@ gpiog: gpio@442a0000 {
 				reg = <0x60000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2037,6 +2056,7 @@ gpioh: gpio@442b0000 {
 				reg = <0x70000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2048,6 +2068,7 @@ gpioi: gpio@442c0000 {
 				reg = <0x80000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2059,6 +2080,7 @@ gpioj: gpio@442d0000 {
 				reg = <0x90000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOJ>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2070,6 +2092,7 @@ gpiok: gpio@442e0000 {
 				reg = <0xa0000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOK>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -2092,6 +2115,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				gpio-controller;
@@ -2102,6 +2126,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..7b2e07613030 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -21,6 +21,7 @@ lvds: lvds@48060000 {
 		resets = <&rcc LVDS_R>;
 		access-controllers = <&rifsc 84>;
 		power-domains = <&CLUSTER_PD>;
+		bootph-all;
 		status = "disabled";
 	};
 
@@ -40,4 +41,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..69bac9e719d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6e165073f732..307b9692b00a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -477,11 +477,22 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart6 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart6_pins_a>;

-- 
2.43.0


