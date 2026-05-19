Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D429CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdhlnYeYNj9B2/Sn88AKPaPWZbTenhSivsBzEhx8Yns=; b=jgbBum2Hx8IXl8hagD3+zEniw5
	UBrcTaBJBwE73+f44br2aYBclT+mPTjf+fr9o0aM62rCPuj3bdUuNVpSXQM+HTUe2JamqANMBwFDB
	tLRGfxc986S/yubfu5/AHEnECOx1PYJ2JAAqJdYcpJ+k1q80MZhD7vGX0twa0tw7c/gaxFTZfzbWU
	NlU7JeQna3NFlUnzQbzi3tYyvizDe8qVbpKyCcasgJDk5bH7yN8Dh4P2pyQYbchcD4kXT4A0OrzfY
	0VGc/Q8k6eVxWK4r7dNxzeNVjjOAwjwN3xvMGTNymbfpXgHyX3A8eLdSjaNQbO+t1QSo2W4wSB4g/
	vHbcy/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGuw-00000000xYy-0MtI;
	Tue, 19 May 2026 09:39:14 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGus-00000000xXe-3GIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:39:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkHk2eU74Pm3fg6YTKv522ZQMaqDv4SLYIftaoUwx1XJ8mQTcuNQeA+WGD3/RB7X+nqNNUfpaEQUEMLNrbLAydlrL2dM+T428bZ9vBIe6FQPP/pzAQyfNNMmoIyf4dI7XtgcBgp5C4/XdQXUeSLJXhVfF5vhWFk/uT9UFqEyTBiuyYg4YygGYS4s1qg3UtkUtJoOgMYsT6/5k5GoSU+u3Nl4vVALArigaN6kKmPncq4fFtc/mb94bR9IsuCcq3fltj9l4tpxzWFrV0rlO118UB+TGiVd8lg7kG9FwkSS9qZG5PVSzCp1P2MFZNWGMiICizJc4Y78bhOvOkTspLwo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdhlnYeYNj9B2/Sn88AKPaPWZbTenhSivsBzEhx8Yns=;
 b=Gcqs4yc+EaGpVqd0IwnFvnHDaWkICC3S8SU+vokCdK4KVpySqCHsORQ5kcDatUhYReWdnnvm8SLWvTkkL+pq+jsbefd4fA+p2EccO5SYO6acE+/x+w1UOMsev6IqAwixROoQ9jNqFyWjws7oF2FhA/bX2IbA8UxdHvGSsSb579ewGqsZf0548sbSZtncEvagBwCFiZa5mk6QdgKxoWgkfrGRc+rxKeowcpBtYJY8wWtmjPb3/FlcwugwdAPkC9unxZVBsm3bm8vXE39CJp466ngj2v+CeTNDjcXDjMbuCTui0PPL9GYd3fA6EZrce6IWowdP0jM4v2hXdG2tT4e9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdhlnYeYNj9B2/Sn88AKPaPWZbTenhSivsBzEhx8Yns=;
 b=efK0PN45BVBIjiwaRzqkdbdP1ogNafWAHUILecmI6t84atRjAyEJRPioceSEpQSeg2/jlOt6vPfL29OsdPgfmgpODowyyr5HgqYrkQM5cYv5UWnq4bLAQMlyFfd1HOBC13IvoUNS3HTJ2TuyU4J3cP/X+V+3HjfDZ99RXPZfpDJxNMF1pg7o0wy/v31zRDPCswd1HDB1nooPoRL4nwUx/vut3YRi7y/FPX6OCY8qLozDrNE/laPw5F6o2/EFeBAYibnBWfu7H52ObOMwfHG4CkYtXoNWdg9x4MPC2HxZ72Ovjut6Op2o1Qb2c5ozONnY0d48CQK1LW3s3HpPM2mkLA==
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by AM0PR10MB3123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 09:39:05 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::56) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 09:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 09:39:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:42:57 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:39:03 +0200
Message-ID: <09d3d997-6b4c-43e8-b153-7eb31f17192c@foss.st.com>
Date: Tue, 19 May 2026 11:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: stm32: add board pin documentation
 stm32mp135f-dk
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|AM0PR10MB3123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e43d9c5-bbea-496c-dfdc-08deb58a77b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: MPbrlK3rOnjw9idjj0DgRA8qbaZjcS6qBF8/5eowhQY1Q8yNEt6XKunzqWUwsmv/ITjSKSBpkaZ3/F7fQSQq5etZz2S62T8XcJ8dHZg9826/KDimIHcJYUDzcp3WOfFqDt9PUSM4daMbCamULc6xqukQRhBm1jpLuXcFwQ+oIhTFrKZxmtTfb+PkCxdGK7CJtvbYlrf2dpvXVwN/MUyzIa07mjn2UXJsVIGKiDfYyJvwzTRZW+K4h4rmo35l7SnqKrAlcRj8SFNno0pXOHLo+dVmV4DWhmNIUB0BiyDujMvV8RyjufFNOifVIxnpK8iYGdwQ0GQ3MA+O5h8S2Ih7RQx8h6LQgGq1//wWRFDo+juvmvF52RDKvg5+4RvLsCB2TSNYpBhRwCjYS33yGHUGDt+AXXTeG4joUbD9RESaaJCvAgljb+3jOVCvIWyjKNQ+AEIIg++hnf+S78A7ZzKQVrtXGKlmiGVnNBXOVCaF/9S04u6L1R7Hh3Of+pzeVJjlT546WNiS9ASEx4EiCAKKAzGcFymr3VROFSgYSgwQaLclLTQi51gSZobTldqnTARHDD0SJhIIwznqz0oRZgxi6lcGG+Ur7MxxkkpO5Jkz6ySck4Ft6/vsnLSx/T/V+Vo05u3GrSqS6qIHNwf7HXNY15eB7vkn7JNkZK9PbDZOv9g=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9FCNVyLeVL8cufqaciNNYGXUxXaFoNJ3B8PBhGDcFSMH6LiwO12GqEg5WE9c46tVA0bCkgbp0ot/rSWf27nRqLSXeJDpWrV0NiLhPdzb+lFnCRTbnS4qlw64HmNRxKazQRz2l2g4jd3O5WPojPBeKS9166MP+4T7Z3AXe45+TMvghORFeZIGn74AASWN7S0dL+nxn/LWBFj3wvR79Wt9HZuFt4vqQC9zzBXtXNQwz9uLoxp5ME6UrrCmF45IajM4n6kVAUhrBKSZlL61b4o7y/uawqPSvw4NLplqAyFqrlmgo00gxiiE3C+7xsXzm5v9nWQAiSp8cQCLLoj0bf+fPA/N3sJ3sWFnNOHoef/RWY6z9TNlml1xg8lvnj2xbwV/bUuAyCkM2hJ+W4tJr5yZYjWsnuQmYXd4SIHavjaqvC8ZeQdo048RHmEikDPigG8A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:39:05.0281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e43d9c5-bbea-496c-dfdc-08deb58a77b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023910_817931_133AE791 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Uwe

On 4/20/26 22:46, Uwe Kleine-König wrote:
> Relate the devices defined in the device tree to the SoC ports and pins
> and labels available on the board.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> my (implicit) v1 was reviewed by sashiko, see
> https://sashiko.dev/#/patchset/20260416110218.594911-2-u.kleine-koenig%40baylibre.com
> 
> The findings were good, this v2 addresses these.
> 
> Best regards
> Uwe
> 
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts | 28 +++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)

Applied on stm32-next.

regards
Alex



