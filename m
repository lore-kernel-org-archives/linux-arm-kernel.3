Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02FCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4twCTtg4PX0XMuMxEyAsNUhC2s5Vow+Q9vJkNyhl9VM=; b=3+fbMgADfljR8QgqtVYbqpP/61
	+dncUkfRHEqY/HiVOy6BoTGA1wKLnaFtkRwtKwq9i9bb7ean4Ri/K+7UvozUGtBkJZ9ZhaVO1z1x4
	y3PX9HRVPBwWY6WWMa3H4SlW1YriwRnHUUsXrMaM8ApedX7ArRISxuIK0gXF+pt5+BoNkX8LTStvI
	kDa0zBYAX1xXrNsCScWdif7gknPn3PdGb9ekN5x/S29DYG7SK8WzuzSwS2fv3z1dhI1sphy9b6upE
	pR2PWxIXjHKXJGJ6uJv7rIOsiNwQqVhoNbx4PXMdb1qtaebHJuSNerSZAHbz9RtTPr8NgpQrF1OCj
	aUT2UHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCP5L-0000000ALCw-0qox;
	Thu, 01 Oct 2026 22:17:03 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCP5J-0000000ALCW-1baa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 22:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ6guDb0b1dhgbwn7lW3LGSHFCM50Kd3OQfVyzHa4O7bP+HOBDXWgCyV25IhLEU+LAywoYnG44vuKXDdcAl2vud7o5J/L0r5YYP2Uerk8ys/9DRWS7ahVhoIB2z3Imy/X2JmXri97QRwmoJwGrI6f1L/M5B8CWz+YSIHqWQyhQcUEbPUvboerKvbv3x6O5Gn0nJ8j3sarOmplZQ3R+W0LvI4i5fCOaq4hMi0MsTI1p9YtMv4czYTxACKDXy7qdtfH+XE8yMB7v+J6Ah57X6P4x43LXyuuZCfJMZy2CeSVdC9TxLE3ghcQy3x2KKodz/CTkRlGiJhd7zEpd6oVygcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4twCTtg4PX0XMuMxEyAsNUhC2s5Vow+Q9vJkNyhl9VM=;
 b=Zp06UDHehCO+3+zQw02uiTmZdqgvMXWBfp3HIp8lo3fF2R4GZAhWFpS06AITBzCfXf9KzymhMiYe+bbGmj4cu8dhs81av2fvoTL1moE05618x0sjNcoHIzkC6+ovzmCJnlER3wgGjJoC9KnYEKWMmuNN8i1CnahUScw7dfNOl9CMu7OS0JtbIJGh0vBFIX5VKVMULosnMRgatxaMbCR4MuMJMf6glAJdyQEl7AGnPfn/AuitDay46mmWfXJbkLUOG5sctmsAKgo+/eI0gGlvUnTjEaQh435jAlPOJbxKgyRLZrXlurqZPA1qOeEU1BjgpTkHmCYBTO9nf13Lx10nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4twCTtg4PX0XMuMxEyAsNUhC2s5Vow+Q9vJkNyhl9VM=;
 b=ZvnVyXm8nRcCtJfvPlQGp3ibEE5l1Ecxm4KZylBKSQgHS8ja2BOiViWkmAT7kKRZg8LQYMvUu9tINGP+io/rZqHtlhVA2lkWg0qe5oFVfqD18qCnlZJ2ijfyvqqPWfoksmb/T42Zw8TGTQaAXGxJMYcGfxU69UfZe9LNtzSxxwQ=
Received: from DU7P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::17)
 by DB5PR02MB11938.eurprd02.prod.outlook.com (2603:10a6:10:651::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 1 Oct
 2026 22:16:52 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::89) by DU7P194CA0011.outlook.office365.com
 (2603:10a6:10:553::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:16:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:16:52 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:16:51 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, Ivaylo Ivanov
	<ivo.ivanov.ivanov1@gmail.com>, <kernel@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/16] arm64: dts: exynos: Format with dtfmt
In-Reply-To: <d7bef9eb-144d-4476-b6bd-d4b14ec1059c@kernel.org>
References: <cover.1790629313.git.waqar.hameed@axis.com>
	<ba1939f5-c528-42b8-971a-4b16998c37f9@kernel.org>
	<pndy0chstai.a.out@axis.com>
	<d7bef9eb-144d-4476-b6bd-d4b14ec1059c@kernel.org>
User-Agent: a.out
Date: Fri, 2 Oct 2026 00:16:51 +0200
Message-ID: <pndfqypnk18.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|DB5PR02MB11938:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e3a18c-1f2a-4418-bf5f-08df2009b220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|30052699003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3O1k+/5AY1ordn5nNodycu3O/enXb8tZSOsQGKtwaKFGHpv/G7nebAn9U8PrmBt9qVTZOlahDcLLb3tNJzzHK423NLOzO3EJGxAL4R1o3qBQa2f8gLGzTm/EtpJpqYveN21V6nZ3eea7uqWqz8QHc6rzsNCYF6F/vr8BfthDXY+sUaZi6/qi1+2JAJUN1nzN6fbyDCn0Le2QFBZSlRqJfhmu4Oya++lQ7QJ11yfu3ibTmZ8xhFLmTWHoOFb1xln0H4RXaZ9+A71PUYVQARUgDxp0ccMl342bPVVxjPpHOwwIkWGKM5IiU3w42b3B/ClzIH6F5g6gxF7+8+NUVucCjCU/vXG92GsxOkIhqjV8wgm/ZpqQ5dzD1Q96yIEr/nf8KHcCRUZ8gvHpkZaV5Vf7RpUYPrsPUGF2t7EBC6viQ0rmvYUajXLzy72j40uwSwbX6H3FhEwJloj1LE4ONVUGTF9Rjy5PV2IIS/6h+kwY6SzjmsQ/MDMhHgcmJKFKZN0pI5R1JivIJvJrq/+a1cMh/uRZ4QE/yKiS55kN9ZX86VzBdrVb0QdZMN8aN7Yv9Duz6xhEpO2to39j+s1Z9Za+iAWdiuGXQrm6k+yOjiV1oPRFFk9qcxReIbEEX66tfc+cruNJRhNqraov+GTzWTgGZK7CWbwbchBSHYpQtkrVWeKPQQ/blU27DjXlyMJd/MClZXKB+Y4U+tYOxAmo4zrf2g==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(30052699003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rfrzon7fjCamz6vP9E5YRPhZh3R40t97VcvD2LmD5orfXX53+nV4OTNxkVdExZLSthdoGeg65FLKd9BFquXoZmWZvnrXARAq5RCoeerQSko1/VcvH8m0r+3dklTEfCDsTbU92dyF1KYwR7DZ1GdaWSxPH7IoQKKvR1nwogSLEY+gwxKpElKw+DzoF5vATThg82nEiRhbrPzNa0zr6xpBZ9sJHD5jdMy/xiDGqZBOXnDcAWGsRwW2wG0LaFUYAJza0jighhdXdNfRcgG2n+s/zfuR7AymUhftSBPjojp9tSZeK6TOjvQtS9ChG+V9k+4IH76ttBAdZsDDppmSBhiEjuri5UAHPrmOYNc6vlwMIlAB25aLTNvML47vydg7XYuP0vQQrKF0cq7W3xklT3du+vo79W4DVuxn5iR51QYr30brAyZpCF5u3SFlZPN1J29z
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:16:52.4678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e3a18c-1f2a-4418-bf5f-08df2009b220
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB11938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_151701_461849_3EE2982B 
X-CRM114-Status: UNSURE (   9.82  )
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

On Thu, Oct 01, 2026 at 11:06 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

[...]

>> Let me know if you want me to run it on `arch/arm/boot/dts/samsung` to
>> show some more examples. Or even better, you could play with it yourself
>
> Sure, I left arm/samsung for the community to deal with, just note that
> Henrik Grimler mentioned in IRC he was working on that.

Yup, I have now synced with Henrik Grimler about this (he's my
colleague). He'll use dtfmt and do a clean-up on
`arch/arm/boot/dts/samsung`.

I'm thinking about doing `arch/arm/boot/dts/qcom` just for also
showcasing it for Konrad. He might just not have had time to look a this
thread yet, but I'll just send the patches either way...

