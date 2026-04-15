Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D8FA0C5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIxfevD6ZOYTFsAmaOEP8nwJBpoWovoGLSUjZyNjUJA=; b=sfxSmwF76Sz9tCWycQtwrp8Iak
	ZacOHB5+9MdScwjkl9PF/PIhZ/oh0tG8hAa7zoPRZBx5POF4c107y0NsT7BuO13oA0JdhL12Lz2I+
	dT7hBnnNfLcUugrM2VAog03qhwhT+WO3ihzoCYo4CQZ7Pb7DJufLmiYwP313IoJRKFxU6uQdKdU7+
	ZkeiOntQDG0Xm5XcNyz5yf9E42QlEJBuN0XS9wrD2MGcQ9woxHPbjBy7iMaaj97mvsA23E5RKb3UK
	pzUWU0aDkteNDGK92a9NhRRfL9QVsjLUJ4sFX87u7/glk4GFq2NL6t+F0ml6Op5sIWTbak9uYh8pP
	2rNHJXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCw4U-00000000rhE-0tED;
	Wed, 15 Apr 2026 08:58:06 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCw4S-00000000rfw-10OA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:58:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dNhm9cthZE1o1byWOUVZ0q8JOTQzLgBDnK+1V4YcGT78lucJVL697eUCR63Hft6w/E5k2nZUWi1bE8ed7eMNJtxsmO6oNI2I0/y+tSkoQBYs2gJcPR8KSHvx6fIGM8S9XG+Dp6AQ/sp2/JSszmrxo9woF2JpKbTopYFMzrx+9GUexYcVbSTxuNCYDKGfSImwmRpLwLXDEg/TpQc6QjTuPuf02kS00bgz8h8VJgC6iJieCD/eZiow7v5fgPye9vEEuw+3cdNG9md2gUPJuYDI3KZU7+PpYMqwjRQehL1jJlM0iVOm22P1RoyezMjuf98VmA/380IH/YwQCj6Jog9csw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIxfevD6ZOYTFsAmaOEP8nwJBpoWovoGLSUjZyNjUJA=;
 b=PiacMfB6+23rTsMq8kFmF7r50O2uo6zJgi7x3Ru7NppZLkRBOVOPtI9XQY+7Pm6YFTIOnqo0pZPNI6kE3gopF03DrkK4QZ+j7T5hTrS4ycIn2toLmSa70pzGuiVI3WOEslNR0DFCiAL2SpsNVb4HeDSDsKyv9pFI6BDfKSKv+mQLdZN/qoi+b3jR7nbBt4U+ehtvAsaEv9g0nWF/XNT3Cn6nREDycRjfoaJYEfsboo6YRAkCpoXtV2nYPX4S9Yh5E6qLRe14pMw5jUmYQCiW/EpO+kZg+VMUEfO1dYRjbKqlMh5Hcexv7pnXG06ticQoYlT9r9siKvipHPbLSNziKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxfevD6ZOYTFsAmaOEP8nwJBpoWovoGLSUjZyNjUJA=;
 b=cm9XanujNntFpICds536bsB9TOavshyTY4o7JZCl4rERGirXzw8sghMxA1YtFqkkW6XClW/tUY749Yln22peVk7M3QmNkodnkwR9V/Fj6FITBrOl4Npi6SJ45QBkiS518wsaJg0HCHn+1+9jbiHzSmiMi6Hb6F79yLd6iP9w8oU=
Received: from DU2PR04CA0317.eurprd04.prod.outlook.com (2603:10a6:10:2b5::22)
 by AS8PR08MB7717.eurprd08.prod.outlook.com (2603:10a6:20b:525::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:57:53 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::ea) by DU2PR04CA0317.outlook.office365.com
 (2603:10a6:10:2b5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 08:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 08:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFiEHn47GBv+7u0aZ+Q4XKVTjL4c9cpaiQkBK0Aw5VgOsq3NxRR6a8jsPgo5wV65G45tB6dpNdWYL1zaXFheDQK4QY8SqzIIMAFVaxHzFP37X/KHIymcLJdZcXaUN5K0fwrw0xPSgcOv5xn1tZCAe7VdyVGo+EIjFHABXYojhHoqhdaPlb2WnGA8qJ+NrN2yb2ZtuCc2fkEhKVIWXZazLbjeWRgHmM3jLLfKbtIwB/fcYoRKnGf+3FmTSjHWa7g7EgHpVVvUbKv+Gb3PuKksFV486tbuvDIODknzEH7CcD6p7Yp3hKXqfERDSKcj9JD7RAFH3vKYOwEO3hKntCEL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIxfevD6ZOYTFsAmaOEP8nwJBpoWovoGLSUjZyNjUJA=;
 b=lHCTx55lE/F4AvyuKjnbhKF6/8nDY128puiOAmRw/ad53UapGRC47+kYSYKoCHNi5xwG1ZLMh5uxjOem9XX48sJ/f8WyUzPO1ykcDuUntiNF9AhU8qWHVVwRGcyvdWvoUIpkWpbjX5cbBntaWMedXsdPq7QlriTJOyHq6nydLtKC/XhLNGYVdbQU+yU/gMWPP837TR6bU3Mqu+mIe7cSy1lFs16Zp/NS+3PQmc2lQtVjo97q3TIk1kXrRKbFdn9FtjTi2S+JYlTn9Giqud/I7Veo8oPqQpvkaFoHmirviljSK6ZWEMpRLZjrxUa0ExXrlfU+EkLVG/QVwllPCb8lfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxfevD6ZOYTFsAmaOEP8nwJBpoWovoGLSUjZyNjUJA=;
 b=cm9XanujNntFpICds536bsB9TOavshyTY4o7JZCl4rERGirXzw8sghMxA1YtFqkkW6XClW/tUY749Yln22peVk7M3QmNkodnkwR9V/Fj6FITBrOl4Npi6SJ45QBkiS518wsaJg0HCHn+1+9jbiHzSmiMi6Hb6F79yLd6iP9w8oU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DB9PR08MB6618.eurprd08.prod.outlook.com (2603:10a6:10:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:56:50 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 08:56:50 +0000
Message-ID: <a681fb3e-d15f-4dcc-ae35-46bb4ba5e11a@arm.com>
Date: Wed, 15 Apr 2026 09:56:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
To: Jie Gan <jie.gan@oss.qualcomm.com>, Leo Yan <leo.yan@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com> <ad5wVVnUw1jnkCdn@e129823.arm.com>
 <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
 <20260415072933.GH356832@e132581.arm.com> <ad9FxS86FTqxu00d@e129823.arm.com>
 <20260415083224.GJ356832@e132581.arm.com>
 <d871bc3a-c104-4e8f-8104-898b957af79c@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <d871bc3a-c104-4e8f-8104-898b957af79c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::18) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DB9PR08MB6618:EE_|DB1PEPF000509F6:EE_|AS8PR08MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 649a864d-349e-4609-ae12-08de9acd13ff
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: iA3kxXCNnis0SiErJ+6rwnIHbh7Su8bTSccv8xLk3s5B5fPuznmgga2BZR8tyUwXaBNvUn8HQm+iDW79S3JDgaEl0VY1fiTn3Lzm+v5uHtyK60IG48aANHCK36lgDoU3QTpJu0CWBRd4y5oeYG59RslovwHau4EasO1VzApjwuiInLcuDtCkVXGb5FR00jNQTo53AxsW8Js3GFVJP0CStKZwfVqzdN0mG9Ka64uCbns5EibV9vgTJsZpRNpXBtOaLFrQKg6L2w4jn8V0uaL9v7uASfjBeVKauTVCBS9o1K0mcR5cql2wW0o0KqQWnEcjTQczAtJaiW5onKL5Tf7hGb1QztNvS6YLCrdHor5pHcIs1XcE7qt/qiUPiqy11856JFEKMT2n+oiXtmoLkiX4AavxIWALuiy3HZzjJK3HKO3ztaUErCnG768SVfwYAJRZXYogHJMDV1RvDPVUbqfbU3a9CLYLwyk1G8G1TTogkUr7SaNmo47UwiUR9dVxTznhYz1OF+xJf8OuPk3s5iI2LbFbgZrfWZUW+fr7MNJdGYaBW8XrGjWUePTeCE9mKedkTAtWjOu2hsxgA589kFcXYBNl5DmVe8tlB0xjNvlyGndLlSN+IrYt2BzVcliuiq3zUnQipz7fga2gGQZ75bQZf70iboJsxd2lt5G5svC+s8W0rRpFUHzhhxygquuYU85ALZaxwmMGvH6UHvsw7ZMAcxD5Y1C18RmFhMptoxwrqCo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: EKQpvN08gevf4LNrvMm2wXcBiJvDID8JczV4zXcVkowQQW/LZJ06jOSa2+nt3myCMDUoPEpVy8pOcQImpkIjl1OELCLj+6iddzGanWJDi/d+dC7+Eaa0v0RwMbNreXSfgdzpKVuOTbU7qFDHNDLxSal2aPJ6VbE9SIg00u504UrYudL0Pm9gSNAc1HXio5ZcOqOz6I1BWABOZYO+KU5qxueCLkEHq5E4OUcegW2/uf8oCZW1gnCPuzJsHFNlBxQFSDWjoN+kQpwbeFqSbaUeIDNViRrYGzcRjvyPvkVZ9jLgsAlr5T+29VNSGbMm89/Bng5FP3KMqHHBVuBNjgUXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6618
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5be722e3-0a2a-4f71-e5c9-08de9accee95
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700016|376014|82310400026|35042699022|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vCamGCuAi+/Yf7ZRPhnXPgLHNaZbkkmcslLx117Pvy8mcndtTxOuRJTmWXq1pBgHZQXlqexZbEH9vuzriQ7tDSusHyzUCJ4H9dP2B0X/jg+59l8tx3DsTi+hUAzA26oo2TJY+i9sITeBuaWE+VJhDGM/z24smACOtDE2AtuoJ29Ai1FQCuCRFw1yTqF+6jAi/H5NFiF/1aZk4AObHYbgW2mpEA5ioN+jSHr3WNDZamOWSgC8I0fiDB83drWJ7dy1oxNjuCtVAMqWHO3vLmihlWiY5zfoRwLGctIJ9Jp2ZyP5VlglBKzeMGre7CGakj61YOfLdhVf6Sz4JiIEz05scN9xjS/d0yEyjvkkv65gNT/IW7umfCiYGLxKqNquhiyPLRO7YcBL6vwCSy18hzaEXhO4/BtPX5Kt6Cl49zmXoLkDws2IZsMpouXtBiSVI1Pns6EpQXd5NxWanl9gUpFOXw++PG1ugWVFGoa7vyR9on8gGp8xBp887G3rvpgu9+24lHSol+MynjOBIGz4DGwUYmPHAO+HP5R+Gjy7sihtLRcPYAvByl2nBcmJrjy+XPxpGIJznkSVPs1xs99KhWeMKXWWLEiRXl6n0SIRsy6MyWH9xbU7mTZNSLYC3GYNGPGqOM0wbFU3C49o6ze1L87kytdskTwgaDF3AuqYacYp1d2NvX40/vQtduuRySgvOr0g39jn1g2YSRI58JmfWw/errTXlQnT08ohbRYslq/iSQfXEG8nLcRXME8uqY2IboNLZpimuLzOobEE0TzY+7VICg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(82310400026)(35042699022)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IA7WCHcyPPGNHpCdxxDOQI8hBGbL1PivfCZAWek/NrdZgBur0QKRv+eYjDY2Ht0Mt4G6cX3KIBXkUFcc+HRbrTzCJBo9Na8dgKQnd3XaHKE4nrAOGtjdJrSx/YEmF5ojS73oXsmaDLN/Xh5aeqp1A1+a0TILzJjNpDPdWJrluPu2dXWVzZ8xrlRJVxrJQZkqOZoo83PGS1ZyRSbzQQl+ar3LP3pzD+y4pfK4DC+sRMjCgRlCfCGJqfGwCbwsFW+YFsDizaiyj/D3ytBTPLpSEOr23MIokjijknDqLVMKSt7vMRsvmPphaenniE0BGRAEK/55yEf6hhoKvQ32TWRMBf4SVAAm5jsqXkq6Ha6nnWQW6ph4h9yRb3NPNa8Rfxq/TQR9Hf2xB76LZaDfX59npW+Y8XAaxDHDqgdnyglFSrBQWsUkF8f+5YIHtGQxcPFc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:57:52.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649a864d-349e-4609-ae12-08de9acd13ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_015804_416783_D6E22752 
X-CRM114-Status: GOOD (  15.95  )
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

On 15/04/2026 09:45, Jie Gan wrote:
> 
> 
> On 4/15/2026 4:32 PM, Leo Yan wrote:
>> On Wed, Apr 15, 2026 at 09:01:09AM +0100, Yeoreum Yun wrote:
>>
>> [...]
>>
>>>>> What I am thinking is as SoCs continue to grow more complex with an
>>>>> increasing number of subsystems, trace IDs may be exhausted in the 
>>>>> near
>>>>> future. (that's why we have dynamic trace ID allocation/release).
>>>>
>>>> Thanks for the input.
>>>>
>>>> I am wandering if we can use "dev->devt" as the trace ID.  A device's
>>>> major/minor number is unique in kernel and dev_t is defined as u32:
>>>>
>>>>    typedef u32 __kernel_dev_t;
>>>>
>>>> And we can consolidate this for both SYSFS and PERF modes.
>>>>
>>>
>>> When I see the CORESIGHT_TRACE_ID_MAX:
>>>
>>>   /* architecturally we have 128 IDs some of which are reserved */
>>>    #define CORESIGHT_TRACE_IDS_MAX 128
>>>
>>> I think this came from the hardware restriction for number of TRACE_IDs.
>>> In this case, clamping the device_id to trace_id seems more complex and
>>> reduce some performance perspective.
>>
>> Sigh, my stupid.  Please ignore my previous comment, let us first fix
>> ID leak issue.
>>
>> Given Jie's comment on the use-out issue, it is valid for me especially
>> if a system have many dummy tracers.  We can defer to refactor it
>> later (e.g., use separate ranges for hardware and dummy tracers).
>>
>> thanks for correction!
> 
> Just share some info:
> 
> With my memory, The ARM AMBA ATB Protocol Specification defined a 7-bit 
> width field for the trace ID, that's where the 128 comes from. (in each 
> frame, we also have 7-bit field for containing the trace ID)

That is true and some IDs in the range (0-128) are reserved. So we
actually have less than 128. We need the dynamic allocation, preferrably
isolated to a "pool" for the relevant session to make the full use of
the space.

Suzuki

> 
> Thanks,
> Jie
> 


