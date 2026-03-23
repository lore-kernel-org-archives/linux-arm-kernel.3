Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85098EC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/MoOKiKlGbIUuJ0aCwzZQwhxSCHlLlCT9G5CBE5bd0=; b=MqMwWfrYB8hF2SUc5jvepuuxHK
	R1yrQSuQYynU4HEiChBCmii6GVVJ0tFywGBG6QRfzvYbrvO2Q594zZHlTZ6Jgfv5o+N84xfSPVorf
	tdXZw7EiiBZhm47hp71rnce0VGaEvieqz82CrkkyhfSrMfNyd+6V09DpRQd8XnAyu6Ld0QTdPM04S
	/bnavzKSY8s0FMdvsA1/HSyA9xGCJq4LiI2Vg/w80MNgNgai+JMg5y5WzmxrEX2EsG8jaApPzzfiu
	2xpP8b4aIj1SUqsJrZtBGlt4UsfiT8r30Cds2fNqx+vWOAEfSJvj9f2g7VSCDS9Ae6WkLetrW2xeI
	KMQR4AZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c7n-0000000GS0t-0oBe;
	Mon, 23 Mar 2026 10:03:07 +0000
Received: from mail-westeuropeazon11010032.outbound.protection.outlook.com ([52.101.69.32] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c7k-0000000GS0K-103d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:03:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UNDM6fKU/jK+x8nqVVIN2qVKXqL20wCT9FEURCHU5nUeXfn++5pCGtnzrqaJ+dC4bo6kVXm9WFFpd9ZwsNMpJfGmR9l7jE0UFzAzNl6Dk04AScKJzivMkJo++/SbWxZN/lPSmYyGAAVxdxceQ/vimoVUanQ1BIz3MeKtd80ILUqpZUelNQlLNTNhieKDFqE/Vabs9Yqp2h6+cuHmQoF9M/dP+iQm4InRmpalMcW1oVk2+bIOvsZk1Il6DO+GjvpCE9S29XqwiHOAnP21n0vDBES104GrLDtcIhe/piV8sOVGp1Gk7oCLDriVEtWcQrbwWPA16GjQPk9xM7CbcdZe/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/MoOKiKlGbIUuJ0aCwzZQwhxSCHlLlCT9G5CBE5bd0=;
 b=yBh5raYib8JhuFhRxEmYUResdAhxWKMDq5qkgDQ9NNHsQaPgWuR+YDX+ZWg8AfoCsm8Q2XLEnu3ShRFk8zdIJpIQyJPzYONY+KTcwJrUnYSn2izzwEBCR7OBwZBjMJtXgSsUzSwt2ujig5U738Nv7lF+72Ur6Ur0/a4A7uz6gHpvnmpHCUu4Sv2u/sYDkXMhgoFFB/ErdsAKKCiEtm4YrUaPepMpTUGRr/FZLDdkINHhiJ1E7NUCAz7Zl+q7wQkKkvBnkyj7GIsWkZWVgMpenzn5Un8kgYmIiv2Hpnm9XyrXp286vVqpI2+tqbHIX/XW4CkDHAibdks0snrwoT9B5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/MoOKiKlGbIUuJ0aCwzZQwhxSCHlLlCT9G5CBE5bd0=;
 b=PKg/j3jo/0YM4lVJQLp5Lo8FOS8DvgIBsG2v9GWmzk9jS5WB7q0b6Cii8B2LgRJ32VpC6IJJLFFhbuyhraLkDMnYIJtQJTf/BMX0L4cuDodB3oTr+qJ2KDT9erEFH8j+xYC3vyNxCUgtV/L6YBqIxfCUXnBN9t2/RMqnVftUqeI=
Received: from AS4P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::8)
 by VI0PR08MB10448.eurprd08.prod.outlook.com (2603:10a6:800:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:02:57 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::fa) by AS4P189CA0037.outlook.office365.com
 (2603:10a6:20b:5dd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 10:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Mon, 23 Mar 2026 10:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZkQ9eKF6HDCVknE0JnBPvj9LvKUQpvpG8UIHCwrNVQN1azjziyCUeOCROYRXO5RwfYoSfwpdj77EofmTMCdxsfPrTHG7vTWqhqLGg8qX32R3OZMJFMgMKOmzN2bf1TJYwEiLpFmNAa08Z75Jacqam5kAL984KVvqjEMZ17UTgx/Teq1k1X9fa3TzcxjahdKjbUUkh4Nhkkg5Ilb4pYqf1fugsocWOPPRdfeptd1CVW/pdPY3PrFhb06hgKSh7f6fZJnzLSEa6A6zfXfVGeKZjWnA8bYAbBfXMcctz9+dh6EVwBGqVBwwiw3SiQNZ7PPfX+mHQcRA9KrcHOf43WbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/MoOKiKlGbIUuJ0aCwzZQwhxSCHlLlCT9G5CBE5bd0=;
 b=vC+Tl+rCaRStlsoBS8JKMQ7yVO0HukhyukFAzSGiTh6bKtYEV0oDyvDErp4OONk+HHwwEupxcMm5Tul9vT9gtoCS8CwC0aPBShj6G7QwWmucYNHW93k0kZAidO5WyRJg1c98rsbEXI/zfbHcDJFEi0jqr3BwHfTNk/CqjUt1GN0BGkdPCcPUEHutafJ69q/W2GkHB8o3y+YE7mDved/4Ud10uh7nXmw6Ck7XD58xT7k2EDrpsYKijJtLS1JHJOAIqzQPTCO3hoqnegzxePyAxayXrHflF31h/fz8Lf7u8lMf8J7IAFw/CImVHHDgv+HblT+J5RLRYnMv7MwUYKNMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/MoOKiKlGbIUuJ0aCwzZQwhxSCHlLlCT9G5CBE5bd0=;
 b=PKg/j3jo/0YM4lVJQLp5Lo8FOS8DvgIBsG2v9GWmzk9jS5WB7q0b6Cii8B2LgRJ32VpC6IJJLFFhbuyhraLkDMnYIJtQJTf/BMX0L4cuDodB3oTr+qJ2KDT9erEFH8j+xYC3vyNxCUgtV/L6YBqIxfCUXnBN9t2/RMqnVftUqeI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AM9PR08MB5969.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 10:01:53 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 10:01:53 +0000
Message-ID: <45af1506-c08d-4f7a-b07b-90666092680b@arm.com>
Date: Mon, 23 Mar 2026 10:01:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/20] coresight: Control path with range
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
 <20260320-arm_coresight_path_power_management_improvement-v7-14-327ddd36b58b@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-14-327ddd36b58b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::19) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AM9PR08MB5969:EE_|AM4PEPF00027A5E:EE_|VI0PR08MB10448:EE_
X-MS-Office365-Filtering-Correlation-Id: b4393b75-d4da-4f55-8da6-08de88c35b64
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 9t5HoIJGZ1iO/avWX2PqJfavxMTs4tdt7HnrCvwQc/bx82yPVYwWDVMKwr0xOONT/RzoQn5YEsbFbYrihbtZk6csW1wZJti3L3cB4lkaODves24FzA1kE9Q4xVjBJNhqL/C5DFEi1J1ktz6J83j5kRrHlzXzg8G/JexYSQr/KQD4OtTju1p9rSAK79BNL5X5b/B9cLjk/spF8QDanztv/K8yUdrq5Ag844Zwuv3F0dOho2j6bdNrHo16ROUfId3E52jpH7LmefwL9Mxn7yHjjtcM9I8VxCZ49vtp+PHxQcg9nYUNJg4EveglrNmkRNg0MsGfFJGubKicGsHZVVGlFeHq8rF+9/679JYndgtk/mwLCtWujzv+V1+Rw+CiyvBQGovtYSK99BeDQSnFKYMrp4HvlR43DKlUhbTY4w5wt4QfpzGFWSpeQntVvaxTdlHRgeXUKsElOBC3NYswZcOs5pXMvWhlm1PltZcLPgjjTgBHdPdS9c9F1P3ta7ZSGLCFyegILB0QaZxZFziUfBiZ/P7nv+BomcUdUb0B5+9TpDg0o3nE8USRXq1KhVlU+95EBN5kRS9dTiUhjnG2M/IuQ2GztmeWFNM31G0G3ISsEffEnuuExfsQumW+EISD/SPeVsH5BWU/T8m4CQc8WDVXa/UFFcXbU5Y/52ZbrhC4VRa5Z4MkyxONjTxXS1n6E+Y7dpHPdbR0f37kwVXk79km2vGVPi1AuebPi2SInQbESMX8uTh0oko6YZKmVNYgUYaSVeH7kfx5T+xHs+8EdWsUZA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: VMl4ajLTm6X6/dfw7durSX8Z4R+6tUQweg2A0RC9uw7FZUP0szlYnH46Zq0SMHXrDeLNBE6P+L/8+c4FY24OVb/TOEdLKJlRVpZH1kZgiyj5ckawr4yzYdudl+qlB6mLGEEH0+7wYeHtRBAonTJYygOtH+d3C0mTTc7ZIo6VqyK0Y5E3bDMyn55UTlpynfaq0Lu8tnwGpB/bQNeBDTTOd+DunMjFDiOklrftl1EgtT9Lv18hpf6EUcLa31fnRRsAAqtBAcFJMlzCFVpZFc3qa2cHVr8IzI9r0R7VQxXxzDgnQchMFIh4lJfK1IfY6D3wE5PPsfTNRH1c2IQPTrP/Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5969
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a72302f8-57ca-4756-5c2e-08de88c335da
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|35042699022|14060799003|82310400026|376014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: BZbRRcP8lmNOcDfh3eCHr35QxbdskVI5qOx6WGs1NkOduJJSX1GTkEdufptKyB07ib9Iak+fDU5sO6P0hxQQ+VkHDtxnAq2DEyTJuu93v9bdQoA0WOOCSAuL/1PA7/8IfFUmVPPPEBxsPkAcaRyz4nYmPXfgt4c9kF+QlZAk/YVXyE5qs+YvvAX6WD+HMI46Ay3vWkAhOGxYWc7NhEf0N4JIeVeMJvoUpVvJbvkOOB9+wO4F37HdLFzx77AX1Cdq1KW6sBJ8egUKBtHLMGy1sC7xbwCx4YtEejKqverYFo7ugekeY3v2Pgbk2bI2UzUXjKYq3758ZoyJF/+fq2eGPb2XjeflaKspJzTrcJIhEgkiLqrWo2mQIiYYmmerrBod8QdkKgpoT2jocNNFDiqP2h4qhugYliXbgkjtE+TCXvVx+UxRMwFHM+hfnU4YIwjnWPFQW6vDEEqrl2KSI5a6IMe4Y/VSN1+gV+wZQbGtOhdq88K+wSNKxq6RylS7osQ9lO2hpGBPJYTSIGyhUj9iKrAB4TSngTn+NHWvc77Bp/sgJtbdXTrxGkRTdCYOKj287qF/B4j89fjtr2xOQ8M4rKe9tK5zQRTCZJLeJCimSFUsgUaDOTMH7CLl8icKwn9M2C1RbpnzQYbx2oVq/MTYA0w35ceXGIBzY7bQPzjRsr2iBh2uCwKbbXWbPjP6SiFoJnqX+MhM0Z3CKs3UH7PpiH5CQ+4jnJpo+4HWwq7h/3F4LjSq3wCmMLP+YJGwyoiYBkOPsLE+XXytm79wprD6B89ti2rBc80vWbmaQaRudDjnXTlgdBYWxv33C/op72U7
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(82310400026)(376014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OaqJgplJWkwLrl3TNd2DZ/QM7u/VkPYcg2WukQcKr+P6PwJDW5PBFSW60nsLafPN/28nE1PTJTVOM6Zp+Uw8erJs2VAnoOQD/8PrcNiSquHBjuv/IQAPAfl1dA8eA8LHWxNFpMNuaq6cTqtl76Jjvw++Q7xAGDUb5a5wVeZjeGlP8QPUPCqUmUZra2DyIbIFaIiZVQ2QeKsVFcQE/BRb+zYYSnX4noobzkSXwg7y2mMJXpRX/UMwoVQihDQin0ReQYjwEiTgdsLJ/luXGfjk6/EmrLCTb7yfTV0bD/2ZF52cIM8wTNW49nN+3UNPfv6tuMIul+hCwJQJtE+WqhcYblXVkOSlhwsXdK/YgSUrNBjdlDIr4kvI5PCQp+br/416I9pD9HYjf8ZdmgYxxQY27WxiRtksV5dlfW02xS18Co4yUSdCmB9WxWHDC/bwIKMC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:02:56.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4393b75-d4da-4f55-8da6-08de88c35b64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_030304_431642_974EE19C 
X-CRM114-Status: GOOD (  29.52  )
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

On 20/03/2026 17:42, Leo Yan wrote:
> Add parameters @from and @to for path enabling and disabling, allowing
> finer-grained control of a path.
> 
> Disabling a path uses the range (@from..@to].  @from is exclusive to
> handle the case where the source is passed as the start node: the first
> node is skipped, as the source has its own disable function.
> 
> Enabling a path uses the range [@from..@to], where both @from and @to
> are inclusive.  The enable path still needs to enable the source's
> helpers, though the source has its own enable function.
> 
> Introduce coresight_path_nodes_in_order() to validate the given range if
> is ordered.  Update callers accordingly.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 96 ++++++++++++++++++++++++----
>   1 file changed, 85 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 81bf4637f788f99844e839fd9dad8802ee78eb60..874bd87da2270fdbe6b32c2fa29292d7a26b8dc7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -492,20 +492,62 @@ int coresight_resume_source(struct coresight_device *csdev)
>   }
>   EXPORT_SYMBOL_GPL(coresight_resume_source);
>   
> +static struct coresight_node *
> +coresight_path_first_node(struct coresight_path *path)
> +{
> +	return list_first_entry(&path->path_list, struct coresight_node, link);
> +}
> +
> +static struct coresight_node *
> +coresight_path_last_node(struct coresight_path *path)
> +{
> +	return list_last_entry(&path->path_list, struct coresight_node, link);
> +}
> +

nit: This could be used for in coresight_get_sink().

> +static bool coresight_path_nodes_in_order(struct coresight_path *path,
> +					  struct coresight_node *from,
> +					  struct coresight_node *to)

I am not very clear what this is supposed to do and what it is doing ?
Are we verifying that the nodes @from and @to are in order ? As, in the
the link is from @from to @to ? In that case what you do may not be 
sufficient ?

Rather, we should walk the path from @from and return if we find @to on 
the walk. Otherwise return false ? In any case,this need a comment on
the top.

Also I don't think this check is really needed. If we don't find the
@to, simply disable the entire path.


> +{
> +	struct coresight_node *nd;
> +
> +	/* Callers must fetch nodes from the path */
> +	if (WARN_ON_ONCE(!from || !to))
> +		return false;
> +
> +	list_for_each_entry(nd, &path->path_list, link) {
> +		if (nd == from)
> +			return true;
> +		if (nd == to)
> +			return false;
> +	}
> +
> +	return false;
> +}
> +
>   /*
> - * coresight_disable_path_from : Disable components in the given path beyond
> - * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> - * disabled.
> + * coresight_disable_path_from_to : Disable components in the given @path
> + * between @from and @to.
> + *
> + * The range excludes @from but includes @to.  @from is exclusive to handle the
> + * case where it is the source (the first node in the path), as the source has
> + * its own disable function.

Why not break that "hack" and always include @from and let the caller 
now use this helper to disable everything after the @source ?

>    */
> -static void coresight_disable_path_from(struct coresight_path *path,
> -					struct coresight_node *nd)
> +static void coresight_disable_path_from_to(struct coresight_path *path,
> +					   struct coresight_node *from,
> +					   struct coresight_node *to)
>   {
>   	u32 type;
>   	struct coresight_device *csdev, *parent, *child;
> +	struct coresight_node *nd;
>   
> -	if (!nd)
> -		nd = list_first_entry(&path->path_list, struct coresight_node, link);
> +	if (!coresight_path_nodes_in_order(path, from, to))
> +		return;
>   
> +	/* @from is exclusive; nothing to do if @from == @to */
> +	if (from == to)
> +		return;

And drop this ^

> +
> +	nd = from;
>   	list_for_each_entry_continue(nd, &path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
> @@ -545,12 +587,18 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   
>   		/* Disable all helpers adjacent along the path last */
>   		coresight_disable_helpers(csdev, path);
> +
> +		/* Iterate up to and including @to */
> +		if (nd == to)
> +			break;
>   	}
>   }
>   
>   void coresight_disable_path(struct coresight_path *path)
>   {
> -	coresight_disable_path_from(path, NULL);
> +	coresight_disable_path_from_to(path,
> +				       coresight_path_first_node(path),
> +				       coresight_path_last_node(path));
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>   
> @@ -574,7 +622,18 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   	return 0;
>   }
>   
> -int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
> +/*
> + * coresight_enable_path_from_to : Enable components in the given @path
> + * between @from and @to with the specified mode.
> + *
> + * The range includes both @from and @to. If @from is the source (the first
> + * node in the path), its helper is enabled here but the source is enabled
> + * in a separate function.

Like above, can we cleanup everything to always include from and to 
requested in the arguments ? That way it is very clear from the code
perspective on what we are doing, rather than hiding the facts
under a comment/code.


Otherwise, looks like a great step towards cleaning this up

Cheers
Suzuki


> + */
> +static int coresight_enable_path_from_to(struct coresight_path *path,
> +					 enum cs_mode mode,
> +					 struct coresight_node *from,
> +					 struct coresight_node *to)
>   {
>   	int ret = 0;
>   	u32 type;
> @@ -582,8 +641,12 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   	struct coresight_device *csdev, *parent, *child;
>   	struct coresight_device *source;
>   
> +	if (!coresight_path_nodes_in_order(path, from, to))
> +		return -EINVAL;
> +
> +	nd = to;
>   	source = coresight_get_source(path);
> -	list_for_each_entry_reverse(nd, &path->path_list, link) {
> +	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> @@ -630,6 +693,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   			ret = -EINVAL;
>   			goto err_disable_helpers;
>   		}
> +
> +		/* Iterate down to and including @from */
> +		if (nd == from)
> +			break;
>   	}
>   
>   out:
> @@ -637,10 +704,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   err_disable_helpers:
>   	coresight_disable_helpers(csdev, path);
>   err_disable_path:
> -	coresight_disable_path_from(path, nd);
> +	coresight_disable_path_from_to(path, nd, coresight_path_last_node(path));
>   	goto out;
>   }
>   
> +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
> +{
> +	return coresight_enable_path_from_to(path, mode,
> +					     coresight_path_first_node(path),
> +					     coresight_path_last_node(path));
> +}
> +
>   struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> 


