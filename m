Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D11CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N4HYbxv/hxiIdFzqlhUkFwSCOQJaniOqzLtXEa4swY=; b=dYHtC6GfG1jhLNsc2H0ajgI1pQ
	mumltZ/teRtkEm7HgNEp+gP6sdozuECsIPVHJPj1ZNV2iamtCxgROXzr9XQ5V4jO1UbjDDNGEZeM2
	BTM7RR7rOgHU48vVdgIWDdx/5ydjV4V+832s+a0sSaEjWWFp77R8rnHNF5f4TBZ6v1S/7nF4Ckso2
	1fG8sxh9vyGBvG5VclyAjskgQdE5tKOgZP4dPYOPqsxbp/3gmXTDI+b9G49fmnCiXsTM+7tHeNrl9
	1WO+JtrymOTGCHBcSsQeQokJDf8nJMieknI3TNp9s8QAnnGRfD1s5GBOxsEzVxZn9BmGM7w6VGVgL
	fuHOSpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ0M-0000000DSf0-2zw1;
	Mon, 27 Oct 2025 08:55:06 +0000
Received: from mail-northeuropeazon11012031.outbound.protection.outlook.com ([52.101.66.31] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ0K-0000000DSeG-14jw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:55:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ob1jhfN62oiwPfDQIT2bYM/iR1Bi++iBxjf4IvVE9fF9rHbQ0+bmd8E273fxTSfCy1nDsj2sfM6auZKeDH1yE4+d2jkBvQpXhJJdhoxZZ/zcqvV9rQI48212jIG+l6NPX9/VwP1ts78oy2IplIBtWgUlLnxze+00yqx81J+hOZWxEgXOSLIY8rvJS2CLOxvd0dSPq4/dS8q43lOubc+Ma61UloWgXB0WrNQy6AJiU3MxPIMHlTlUX3wvHj+SifbFyvuCALuUeLoj3grXlUorE2SSG7QWA4ly3Q5a6eBic1pAdo0dtoajY+MpFaRO9wNVCjZ4cacfw3CLqcoTfP44ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N4HYbxv/hxiIdFzqlhUkFwSCOQJaniOqzLtXEa4swY=;
 b=DDW9f9l1aPc/kt7PxBkQd73ugGfXgKvjHKZ19dAlAfJrtKFlCIFWHCpcYchmzcInFWumiH6YYqcoXZW6fH59QrLJr3Y3xDDR92SvrUweXZfUJ4dGQeg9VVipHDdmP3MfKPFUdZA1sR7ArsL6Fg8cDq+QDsTJ48qfa+pnctyaMXVYtaCCljqDaY8mVEvqzeDLGKZ8vv6BnqybC1TG4zCTjj5H2WYsCpaHty9I4b/in89gNIc5RGfBSCNhPy8jsoR80PdDyL1teVfjgucAWXvPnVbSk9PFBF7ll1wcMpCIGETnsA4A3q0YhaqJ7VKZ8Fv6IKd4WlWktq8vCNGfoosoOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N4HYbxv/hxiIdFzqlhUkFwSCOQJaniOqzLtXEa4swY=;
 b=GJ7jZwrKpEemTvI9aC1hdqm4e76FPgfGdXbhCQVp5XJ49tVq+zzCXfDckBnHpD5RQal/9IGwix4eB2EPRNSJYLViAUYMcrSqAzEsWASN5+Ua6nNS/Ww157QA1ponjgGnmd3/E8DW4bf3X6sldVrMkqeLPxYs1/ib46XBD3gUYIE=
Received: from AS4P190CA0055.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::19)
 by AS2PR08MB9738.eurprd08.prod.outlook.com (2603:10a6:20b:606::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:54:57 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::95) by AS4P190CA0055.outlook.office365.com
 (2603:10a6:20b:656::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 08:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 08:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht9yFHUc53gwPYHcAl2HwcwFOHOaHn0NEO4JJI7RSywfSEQaSD2HhiF7x4WniBKdI4DhMQD/TpcgJQXI2aYv2w6UGprRfM4C8R2OucbrHAWnGWbENLY+q6/UG3fGlJd+/2lsCgBehGpA8CpH+4k62rwTbDgQmbWiJCiauWVk5oW8G7rlTBzKW0MlMeCZPDbDTFDy8y/W+b8hljeo1sLs35icDA5nfjmRNUW6Lg4Wh5v5+2sgwBQK8cKd12G4k3NklzO9djUTRngm8+vJSvaMQgREZpBiK+oMoMOMpyCWSZorOIoMBvhodjDqFNpyzsazJNeEInFkXg0U74lPy5e09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N4HYbxv/hxiIdFzqlhUkFwSCOQJaniOqzLtXEa4swY=;
 b=BZmUwBOUeTneZ6JjzIBK5/PvppwUj0ZrNHsJkayj0Y00pBaY7x4iWuyTHJlz7/rNppF4rZiIIhT+LttsFNe3s2hS9hP3nJpkdT11PxxxFOgU4oW3D7PmIMr05X4AHqnaucPosT2lvVZjehsu7JYpEUkrnlNIkKtxNAcCfRwOw42/TTxiqYvmZ0XnKkOnecd9FUxgB1co2SF9VgJb3G/QvT3Niaow8Xp2hfg4CueDuAJuh/9zIEmxhsZI0r2Nnj6AvCZlNEC2sC/xFSO1eSXaAa/I0lQFzEKWRLHHphTOGneoKvK6pnZF73UkT4BqSNscp4dpG/B0rQeXihh3gFtNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N4HYbxv/hxiIdFzqlhUkFwSCOQJaniOqzLtXEa4swY=;
 b=GJ7jZwrKpEemTvI9aC1hdqm4e76FPgfGdXbhCQVp5XJ49tVq+zzCXfDckBnHpD5RQal/9IGwix4eB2EPRNSJYLViAUYMcrSqAzEsWASN5+Ua6nNS/Ww157QA1ponjgGnmd3/E8DW4bf3X6sldVrMkqeLPxYs1/ib46XBD3gUYIE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB11064.eurprd08.prod.outlook.com
 (2603:10a6:800:252::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 08:54:21 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:54:21 +0000
Date: Mon, 27 Oct 2025 08:54:18 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <aP8zOo8x0yWi1394@e129823.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-11-690e69ae6977@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-11-690e69ae6977@arm.com>
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|VI0PR08MB11064:EE_|AMS1EPF00000041:EE_|AS2PR08MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: c81b63a6-fff3-47bd-dfdf-08de1536810b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?sKpQkTNkxg9LkkIg6xHJfXGchF9odX7+5wQa1+Ov6qBE/u0xhJf7RAAJxpTc?=
 =?us-ascii?Q?BZM4OKSw1yQR+QfRW5jkOL6IlTEGbGbgDnWNy2GojfEWugCd0aDoWc0Jy4yb?=
 =?us-ascii?Q?NICQSwg0oe6REZzkqE4rcUVMuViR4MM6eoxhGs3l/HgZoJRs6LAViF1Nnwx9?=
 =?us-ascii?Q?iTIeHMCvvw9m0wspYGJIvRIZEDaMZ4TAUGhh/ytiUfG9Nn8fsLn1oOyM4JA3?=
 =?us-ascii?Q?FgxXbNCoJnoANnyv1W/L4AqdPRgdrhu8A3d6XfLd3Q1AMPH4ZXAJaCd6dMJS?=
 =?us-ascii?Q?3us/71MdQE2brMILgqAzpkoMqt8J7643ogcMWruhfOB6HfAoSebBj6hZaYAE?=
 =?us-ascii?Q?tjLnGdnTcwNJ3O3d2rXejrAvxkwEL7fv35Y7lglvV2O6bjryrMgamoEyoJSG?=
 =?us-ascii?Q?I42XpVXbwLaNbbbIZ1H1EC7CfjsvUx7aobGX4slMS5EEoY8zc7sW5dmjo57d?=
 =?us-ascii?Q?Th1U71Kb4As9+rcMDgQhPFLGqmLmeprj0IKWF9DUHDI5aLmnavfBcwIGI+H2?=
 =?us-ascii?Q?d5KzOnIsZhijbCATUVhs5DssIq1yNz8YJow9T5CxQ5UhNsaNun7Z6F582W5b?=
 =?us-ascii?Q?LsHZYW62tCJ9Xg1mQlw9yCB9I9wCKwkkzbEUkMaTzA3hK8sY00SNekbknLOH?=
 =?us-ascii?Q?T4l6v6gy2zKcU81JY/DD6PtCqg98WdFqQEqo05ZdoG0rPdTW3F0qGXg0D2wL?=
 =?us-ascii?Q?hYE4WE2M1E+pYoBV2ot5izHX2mos1QjwuPzlJq+oM5C1Nau1ZNx4eUylCoVA?=
 =?us-ascii?Q?d0FGkp81QdjKdGtIy9K1Gy0ePvc8foXOOWyU+Ls2LosN64MxGTV/W7Ra+x7X?=
 =?us-ascii?Q?0hPH5RChAhI/VQmHIafukqKQ4bHf6bIKf0VlSGaKGmEfiQg8683hyFIKo2As?=
 =?us-ascii?Q?jgJ6BfbtZRYWXoJuKor/AlPLsRmBTd6U7PqvhUp216zdPWKBynrQ5yFgJFA3?=
 =?us-ascii?Q?6GsKy6iSSKFJ3nShyqjZRml7qbGdyxoFo52tzp4LnZSAnv++oCEmepBEK9co?=
 =?us-ascii?Q?icxiYR+J8fy0g0azb9ju1A9fTpSpk+qGukDBw7RCYZFj4zdEVLO/H9J0dUpw?=
 =?us-ascii?Q?99+uArmbdnIktpFqg8nj002N1S/SC8bRZcr48jrrqq4qv/1SN1iCDfBYvbmG?=
 =?us-ascii?Q?fD3v/E5xj/UXyQYPRGafZaglZSkhzN0KIeblBh9MxbkWfQ3JuPt6JyW7t45m?=
 =?us-ascii?Q?2Fsysib5bmAme6oEgIqjyWqUffP+5lQ//uzPOo8j49xKeZpLm/eI43Io+cF1?=
 =?us-ascii?Q?xTQlCNblDn2jzhgL5vHn6nMu7/gmH2ES6tuZVbfSqPX2ywT4W8OwOEBzjW5e?=
 =?us-ascii?Q?V65oksycpkMmZdE4ZuNJojY0mqyR5fbrj9/ZITKCZwb/WBSJhmsMrLMP+olB?=
 =?us-ascii?Q?Lp+5bouXOIA/xYKYwsz2684Kps1m98YkyQFhsfKZYvKcrZwl++84LJBXGCzJ?=
 =?us-ascii?Q?BtPE/ZWGl976IzPaxHnAElKPLMFbGFIT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11064
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a5470293-d51b-4614-ceb9-08de15366b95
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rD79qBrui9zP3/H9rqdm+ImkHo1YDmvbtygj6E4MjP+83Jqx8cSheH3LB+4l?=
 =?us-ascii?Q?XXu5a/s6keqlFZ1R4MnhQ75utNthI5jCenO+vdrJ/gaqn53JpqUTMMqeEjcH?=
 =?us-ascii?Q?WryL8ZwECvoQBmJJYHjdCSRRTloLn2TVsUpIUZXPuNBo0KQlFIi2Dm6aD3qH?=
 =?us-ascii?Q?qDYS11HeRkyN4dxwUpmke0xcC1Yy+Tgy8JyrTXmoPpxpxacDEqN7DkptM1Fy?=
 =?us-ascii?Q?dxMEqLpro2hVAKdTY4v02UkezbSkvA7XtYLOYeYepTqBbtAWNN/V9tQ89MtE?=
 =?us-ascii?Q?tFmAhMN+rVx8X5QBHyyk7C+xjJgxJEwsmX1WONSGax6eKrfFOlj+Vy2Q7Bio?=
 =?us-ascii?Q?eyn1Ak62xE0/v7mW8cqmqVqKhO0IpWONqEdrX9j5rsyqvSEEOBGuX5Dz7F4Y?=
 =?us-ascii?Q?P0q6roRH7yjrGdYjRQh++d0g3iw2WVfkMKxC762HVwbgHelOkYFIJCoStO73?=
 =?us-ascii?Q?LLuKOUbOTYYcbN2cos0TH/Z+kmXnBsX/DLsOZV9jNxWu1xdZUcr7tzagZTLY?=
 =?us-ascii?Q?oZPxYk9CvkOdR0f9FvTzTAehAlaZmS1kWYo3X9VHhytPuz06W+uxnNaJfckM?=
 =?us-ascii?Q?FSrhYoagdLkCkCiOto2TNoCCfOn3qez2mKveptFUtW3XnaVlKWbBgnnt3+Ct?=
 =?us-ascii?Q?r/bBSML/Ncw0JXPgt+x9sNkXbZwG4e5ui13Ng6p4FsEO9a2EzV2H9KZL0DAh?=
 =?us-ascii?Q?6O6VXlIe6mr7awVB5iMDGqEtRrBGjSwMM5df2xepTmATCBatCWOxGdDaLQfA?=
 =?us-ascii?Q?KrESjEgNMLhsiW/NO10GQrdCIDI9QwdTXrzye0OiJbFFPSx8zUVmYFoevXJN?=
 =?us-ascii?Q?XUOI+CvMd/MgydyiJWf+xIBP0MwQvNXOt7tu01YCfsfuUZjaGzHgJmKf3mq4?=
 =?us-ascii?Q?I3iQ3Uc0d4yfX7sEp3xI9ZaTrhIvOwYwHl0253wdYT/qtD2AhvrPRYOoe1Cz?=
 =?us-ascii?Q?cp14Xtfh4V3odJ4r9CLwyAjmMMUWcC3XCdeB1DzfszF/KGuV9jS2ZeQp1rZH?=
 =?us-ascii?Q?NRHcPnVbcN4ETI6BfoWZT/mljfj/3oAPoicCY73eOeacOR1nEOx8SViq9l9p?=
 =?us-ascii?Q?GNm/nleT3j290IjEKdl65tuE0F39zleyW/3aXMZcUv/Z0qL6tWtSpVbEn9ri?=
 =?us-ascii?Q?CxgiwsgftBhC6o9qmqQNBVFEEvtFzcZQ5KQKnRXb5cutqDVEregx/8J3kOJD?=
 =?us-ascii?Q?CBxTSl0mzyhpuQSH1lqG9mGz0Cer2EgKMXgD0OU/y8Z/cYsr3+/ssLmENh/q?=
 =?us-ascii?Q?6UzAjpSuD+CCSOBwxiefgmSm+Brg8y3G4Eq5ndnOEeXVZw8d2QnvKmvATxA1?=
 =?us-ascii?Q?M5ycPZHGUIdcMXXgDYI8pGmyUFcTIb9pnGlfOHRSrmQVkq0QhK3f43FuWZ58?=
 =?us-ascii?Q?bluhaRlp4wOo8bFU3XWKIskH4Jg4KdxjeZUp8z1TIZokPAU9QJHWwxQ2rbKA?=
 =?us-ascii?Q?DVif9Ff3AGgvyo7vIgiVUombNPbcnLMx7t/DczceANGXIk+tgfsmblsAB8g1?=
 =?us-ascii?Q?3utLIJGjKchxa8lPJbeBdcA/YCFf2v+mmzw2L3t2phdt9xZW/OSs1UOMltRd?=
 =?us-ascii?Q?6MC4Cvf5SKrWnt3oqDk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:54:56.9638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c81b63a6-fff3-47bd-dfdf-08de1536810b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_015504_445628_5AEDD4D1 
X-CRM114-Status: GOOD (  24.19  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> The etm4_enable_trace_unit() function is almost identical to the restore
> flow, with a few differences listed below:
>
> 1) TRCQCTLR register
>
>    The TRCQCTLR register is saved and restored during CPU idle, but it
>    is never touched in the normal flow. Given the Q element is not
>    enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
>    restoring this register during idle.
>
> 2) TRCSSCSRn.STATUS bit
>
>    The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
>    but instead directly loads the saved value. In contrast, the normal
>    flow clears this bit to 0 when re-enabling single-shot control.
>
>    Therefore, the restore function passes the restart_ss argument as
>    false to etm4_enable_hw() to avoid re-enabling single-shot mode.
>
> 3) Claim Tag Handling
>
>    The claim tag is acquired and released in normal flow, on the other
>    hand, the claim protocol is not applied in CPU idle flow - it simply
>    restores the saved value.
>
>    The claim bits serve two purpose:
>
>    * Exclusive access between the kernel driver and an external
>      debugger. During CPU idle, the kernel driver locks the OS Lock,
>      ensuring that the external debugger cannot access the trace unit.
>      Therefore, it is safe to release the claim tag during idle.
>
>    * Notification to supervisory software to save/restore context for
>      external debuggers. The kernel driver does not touch the external
>      debugger's claim bit (ETMCLAIM[0]).
>
>    Based on this, it is safe to acquire and release claim tag in the
>    idle sequence.
>
> 4) OS Lock Behavior
>
>    The OS Lock should be locked during CPU idle states. This differs
>    from the normal flow, which unlock it. This special handling remains
>    in the CPU save path.
>
> This commit reuses the normal enable and disable logic in the CPU idle
> path. The only addition is locking the OS Lock upon entering idle to
> ensure exclusive access.
>
> The save context in the driver data is no longer needed and has been
> removed.
>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 215 +--------------------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  57 ------
>  2 files changed, 5 insertions(+), 267 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 71a4fcbca44091d5f441d4bc502b3c5f4fd3c984..6cfcede7e87846727bc040069399f7f9bb2e1abc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1856,8 +1856,7 @@ static int etm4_dying_cpu(unsigned int cpu)
>
>  static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
> -	int i, ret = 0;
> -	struct etmv4_save_state *state;
> +	int ret = 0;
>  	struct coresight_device *csdev = drvdata->csdev;
>  	struct csdev_access *csa;
>  	struct device *etm_dev;
> @@ -1887,100 +1886,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  		ret = -EBUSY;
>  		goto out;
>  	}
> +	etm4_cs_lock(drvdata, csa);
>
> -	if (!drvdata->paused)
> -		etm4_disable_trace_unit(drvdata);
> -
> -	/*
> -	 * As recommended by section 4.3.7 (Synchronization of register updates)
> -	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> -	 * ISB instruction after programming the trace unit registers.
> -	 */
> -	isb();
> -
> -	state = drvdata->save_state;
> -
> -	if (drvdata->nr_pe)
> -		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
> -	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> -	state->trcauxctlr = etm4x_read32(csa, TRCAUXCTLR);
> -	state->trceventctl0r = etm4x_read32(csa, TRCEVENTCTL0R);
> -	state->trceventctl1r = etm4x_read32(csa, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> -		state->trcstallctlr = etm4x_read32(csa, TRCSTALLCTLR);
> -	state->trctsctlr = etm4x_read32(csa, TRCTSCTLR);
> -	state->trcsyncpr = etm4x_read32(csa, TRCSYNCPR);
> -	state->trcccctlr = etm4x_read32(csa, TRCCCCTLR);
> -	state->trcbbctlr = etm4x_read32(csa, TRCBBCTLR);
> -	state->trctraceidr = etm4x_read32(csa, TRCTRACEIDR);
> -	if (drvdata->q_filt)
> -		state->trcqctlr = etm4x_read32(csa, TRCQCTLR);
> -
> -	state->trcvictlr = etm4x_read32(csa, TRCVICTLR);
> -	state->trcviiectlr = etm4x_read32(csa, TRCVIIECTLR);
> -	state->trcvissctlr = etm4x_read32(csa, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> -		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
> -
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> -
> -	if (drvdata->nrseqstate) {
> -		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> -		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> -	}
> -
> -	if (drvdata->numextinsel)
> -		state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> -
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
> -		state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
> -		state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
> -	}
> -
> -	/* Resource selector pair 0 is reserved */
> -	for (i = 2; i < drvdata->nr_resource * 2; i++)
> -		state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
> -
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -		state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
> -		state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
> -		if (etm4x_sspcicrn_present(drvdata, i))
> -			state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
> -	}
> -
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> -		state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
> -		state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
> -	}
> -
> -	/*
> -	 * Data trace stream is architecturally prohibited for A profile cores
> -	 * so we don't save (or later restore) trcdvcvr and trcdvcmr - As per
> -	 * section 1.3.4 ("Possible functional configurations of an ETMv4 trace
> -	 * unit") of ARM IHI 0064D.
> -	 */
> -
> -	for (i = 0; i < drvdata->numcidc; i++)
> -		state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
> -
> -	for (i = 0; i < drvdata->numvmidc; i++)
> -		state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
> -
> -	state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
> -	if (drvdata->numcidc > 4)
> -		state->trccidcctlr1 = etm4x_read32(csa, TRCCIDCCTLR1);
> -
> -	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
> -	if (drvdata->numvmidc > 4)
> -		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
> -
> -	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
> -
> -	if (!drvdata->skip_power_up)
> -		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
> +	etm4_disable_hw(drvdata);
>
> +	etm4_cs_unlock(drvdata, csa);
>  	/* wait for TRCSTATR.IDLE to go up */
>  	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
>  		dev_err(etm_dev,
> @@ -1990,14 +1900,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  		goto out;
>  	}
>
> -	/*
> -	 * Power can be removed from the trace unit now. We do this to
> -	 * potentially save power on systems that respect the TRCPDCR_PU
> -	 * despite requesting software to save/restore state.
> -	 */
> -	if (!drvdata->skip_power_up)
> -		etm4x_relaxed_write32(csa, (state->trcpdcr & ~TRCPDCR_PU),
> -				      TRCPDCR);
>  out:
>  	etm4_cs_lock(drvdata, csa);
>  	return ret;
> @@ -2021,110 +1923,10 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>
>  static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -	int i;
> -	struct etmv4_save_state *state = drvdata->save_state;
> -	struct csdev_access *csa = &drvdata->csdev->access;
> -
>  	if (WARN_ON(!drvdata->csdev))
>  		return;
>
> -	etm4_cs_unlock(drvdata, csa);
> -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
> -	if (drvdata->nr_pe)
> -		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
> -	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> -	etm4x_relaxed_write32(csa, state->trcauxctlr, TRCAUXCTLR);
> -	etm4x_relaxed_write32(csa, state->trceventctl0r, TRCEVENTCTL0R);
> -	etm4x_relaxed_write32(csa, state->trceventctl1r, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> -		etm4x_relaxed_write32(csa, state->trcstallctlr, TRCSTALLCTLR);
> -	etm4x_relaxed_write32(csa, state->trctsctlr, TRCTSCTLR);
> -	etm4x_relaxed_write32(csa, state->trcsyncpr, TRCSYNCPR);
> -	etm4x_relaxed_write32(csa, state->trcccctlr, TRCCCCTLR);
> -	etm4x_relaxed_write32(csa, state->trcbbctlr, TRCBBCTLR);
> -	etm4x_relaxed_write32(csa, state->trctraceidr, TRCTRACEIDR);
> -	if (drvdata->q_filt)
> -		etm4x_relaxed_write32(csa, state->trcqctlr, TRCQCTLR);
> -
> -	etm4x_relaxed_write32(csa, state->trcvictlr, TRCVICTLR);
> -	etm4x_relaxed_write32(csa, state->trcviiectlr, TRCVIIECTLR);
> -	etm4x_relaxed_write32(csa, state->trcvissctlr, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> -		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
> -
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> -
> -	if (drvdata->nrseqstate) {
> -		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> -		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> -	}
> -	if (drvdata->numextinsel)
> -		etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> -
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
> -		etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
> -		etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
> -	}
> -
> -	/* Resource selector pair 0 is reserved */
> -	for (i = 2; i < drvdata->nr_resource * 2; i++)
> -		etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
> -
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -		etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
> -		if (etm4x_sspcicrn_present(drvdata, i))
> -			etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
> -	}
> -
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> -		etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
> -		etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
> -	}
> -
> -	for (i = 0; i < drvdata->numcidc; i++)
> -		etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
> -
> -	for (i = 0; i < drvdata->numvmidc; i++)
> -		etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
> -
> -	etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
> -	if (drvdata->numcidc > 4)
> -		etm4x_relaxed_write32(csa, state->trccidcctlr1, TRCCIDCCTLR1);
> -
> -	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
> -	if (drvdata->numvmidc > 4)
> -		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
> -
> -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
> -	if (!drvdata->skip_power_up)
> -		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
> -
> -	/*
> -	 * As recommended by section 4.3.7 ("Synchronization when using the
> -	 * memory-mapped interface") of ARM IHI 0064D
> -	 */
> -	dsb(sy);
> -	isb();
> -
> -	/* Unlock the OS lock to re-enable trace and external debug access */
> -	etm4_os_unlock(drvdata);
> -
> -	if (!drvdata->paused)
> -		etm4_enable_trace_unit(drvdata);
> -
> -	/*
> -	 * As recommended by section 4.3.7 (Synchronization of register updates)
> -	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> -	 * ISB instruction after programming the trace unit registers.
> -	 */
> -	isb();
> -
> -	etm4_cs_lock(drvdata, csa);
> +	etm4_enable_hw(drvdata, false);
>  }
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> @@ -2311,13 +2113,6 @@ static int etm4_probe(struct device *dev)
>  		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>  			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
>
> -	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
> -		drvdata->save_state = devm_kmalloc(dev,
> -				sizeof(struct etmv4_save_state), GFP_KERNEL);
> -		if (!drvdata->save_state)
> -			return -ENOMEM;
> -	}
> -
>  	raw_spin_lock_init(&drvdata->spinlock);
>
>  	drvdata->cpu = coresight_get_cpu(dev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 012c52fd19338133129752d35523dc102df24604..9dfdcfc2b16748bedc278ba2ceaa7e39b29cc351 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -862,61 +862,6 @@ struct etmv4_config {
>  	u8				s_ex_level;
>  };
>
> -/**
> - * struct etm4_save_state - state to be preserved when ETM is without power
> - */
> -struct etmv4_save_state {
> -	u32	trcprocselr;
> -	u32	trcconfigr;
> -	u32	trcauxctlr;
> -	u32	trceventctl0r;
> -	u32	trceventctl1r;
> -	u32	trcstallctlr;
> -	u32	trctsctlr;
> -	u32	trcsyncpr;
> -	u32	trcccctlr;
> -	u32	trcbbctlr;
> -	u32	trctraceidr;
> -	u32	trcqctlr;
> -
> -	u32	trcvictlr;
> -	u32	trcviiectlr;
> -	u32	trcvissctlr;
> -	u32	trcvipcssctlr;
> -
> -	u32	trcseqevr[ETM_MAX_SEQ_STATES];
> -	u32	trcseqrstevr;
> -	u32	trcseqstr;
> -	u32	trcextinselr;
> -	u32	trccntrldvr[ETMv4_MAX_CNTR];
> -	u32	trccntctlr[ETMv4_MAX_CNTR];
> -	u32	trccntvr[ETMv4_MAX_CNTR];
> -
> -	u32	trcrsctlr[ETM_MAX_RES_SEL];
> -
> -	u32	trcssccr[ETM_MAX_SS_CMP];
> -	u32	trcsscsr[ETM_MAX_SS_CMP];
> -	u32	trcsspcicr[ETM_MAX_SS_CMP];
> -
> -	u64	trcacvr[ETM_MAX_SINGLE_ADDR_CMP];
> -	u64	trcacatr[ETM_MAX_SINGLE_ADDR_CMP];
> -	u64	trccidcvr[ETMv4_MAX_CTXID_CMP];
> -	u64	trcvmidcvr[ETM_MAX_VMID_CMP];
> -	u32	trccidcctlr0;
> -	u32	trccidcctlr1;
> -	u32	trcvmidcctlr0;
> -	u32	trcvmidcctlr1;
> -
> -	u32	trcclaimset;
> -
> -	u32	cntr_val[ETMv4_MAX_CNTR];
> -	u32	seq_state;
> -	u32	vinst_ctrl;
> -	u32	ss_status[ETM_MAX_SS_CMP];
> -
> -	u32	trcpdcr;
> -};
> -
>  /**
>   * struct etm4_drvdata - specifics associated to an ETM component
>   * @pclk:       APB clock if present, otherwise NULL
> @@ -979,7 +924,6 @@ struct etmv4_save_state {
>   *		at runtime, due to the additional setting of TRFCR_CX when
>   *		in EL2. Otherwise, 0.
>   * @config:	structure holding configuration parameters.
> - * @save_state:	State to be preserved across power loss
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *		   the trace unit.
>   * @paused:	Indicates if the trace unit is paused.
> @@ -1034,7 +978,6 @@ struct etmv4_drvdata {
>  	bool				lpoverride;
>  	u64				trfcr;
>  	struct etmv4_config		config;
> -	struct etmv4_save_state		*save_state;
>  	bool				skip_power_up;
>  	bool				paused;
>  	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

