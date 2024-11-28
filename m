Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5956ED65553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B845PDujJZA2/PooLgD+a8zkPUg1aX618Fzlgyw05jE=; b=BAKCjkBvILCXWREyTGPB77BO8Q
	r0q6zCBmIlowgJodv3EXfj0sABB4aJQP9iaeNp9c/66a1vpm+nJJpPFZh8cQGbBu5d+16mTp+soIm
	2pUcGbBoRdxJpCVOG7llOAH6yigHKGH+m92P4lPlcnF2VkRbHcC/5vA9cWWegZTdla2ZH66/Pb+/s
	rH78eTv0BaR5lrezzS58V9FcRC9kxf0Er6qWhJDwBy6gcjI0MT3ndT6lC8LfX/+OTem60kSpFzEJN
	q9WhcPddKqX9Q5ojNgafwhwo2R0EZhSbSMmM4145QqZGa6Czj/hA6d8lM55EhGdKO+3fWsz/0V/XL
	IGCC4xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXxC-0000000EnPS-2zSd;
	Thu, 28 Nov 2024 06:24:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXwD-0000000EnKb-1AYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 06:23:43 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AxUXb+Wg7lOm5gjhWDi5//j142nX3WVjCjfMYys/0ycBP3J4rZsQIdfvjKoUm4SBGilCUreDKJvnBoXksvYbqJrbNnxTYQ2PD0YX2aZHSyUPPjV2GwTadSfXTEWCXxaNl9y+6dkkU6EsQEfil8o1fGXNRcpqbpG4CwnpNisNR6on7rENNYTktapwNZ44VY4M53RY6CFCwSazQ3NqAisP0i4oGHFgLC7/EyCbeLD+Bu/ciemr/ormPPrNWAcR9h0kuQgw3dNVRj7YCcDlkot2uO35dEN+vp4c/RWoZ3EatmfoNFmQxwkTjGeuslasykf9Et+guQRvKaUl94WPj0jaAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B845PDujJZA2/PooLgD+a8zkPUg1aX618Fzlgyw05jE=;
 b=uLm9zVwvzuwV+7a9JUGNWVCKdYdPncZ5+dFA9y7u6SWXG7oSoc/vpSmqQaorkCajA72mJ9ORZC3GEGuKy2qDSKnWNrwFXmnKGTGX4DipJSohYDThO31pxUBLAH8yv6ER+SC8nl/7BlBW7ZUUZrJblqvD8UJ9qyHK3CR4L/xOVqLdsC9S5KTjlclMVEp27y29XL+ZdFnqJkNcIo7uQtXDt4oomF6iCTkoyYO6IlZliYszQgVU1MB0i406hkfiTzj9uSIkY3Nk178dWzqM4FBB6AJd7UZQL90u57AcaNSdVPCi7PtVdg2g738v4rQ5f3Ya53FWOTWn4FnmlpzuxPlSYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B845PDujJZA2/PooLgD+a8zkPUg1aX618Fzlgyw05jE=;
 b=ZS6SOQo2vAQ2jiVfvHlJNO/ntuYBNCro9A+gFDHxwnSSUoRYjIBI5YIilG82lSDQ0FS+j9R26YA9fS7zVfg67M+pBNrUqJtWW5Ikq3q4oVNW4jkgo2Q2/hPDVsbh5JV6pDDmzZJ2IP1Vm38LGMLeEBB3Oe/u2aTga0ih7PtvYZg=
Received: from AM6P195CA0079.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::20)
 by GV1PR08MB7377.eurprd08.prod.outlook.com (2603:10a6:150:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 06:23:29 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:209:86:cafe::2d) by AM6P195CA0079.outlook.office365.com
 (2603:10a6:209:86::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 06:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 06:23:29 +0000
Received: ("Tessian outbound 5b75617ec243:v514"); Thu, 28 Nov 2024 06:23:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db5955d616ebdeeb
X-TessianGatewayMetadata: Rc8PV39BqiggdIQTS8Vudkj0CP3bfkkYYdjcjDlba+G0vC+kejbugkfdMeqleAVr+R2sSIdUy+91gbtqpZ40gRanI4eSqnts20NIMc0me4q0Y1ETixtcuEdLUVwC8vpcOp2KhDqd7f86SLXT96bmTawfOPgSN6VAqquBVdkX3L5iqAZeOqzcsDbddD3567CEb+nrefs8633n8H7jP8m0xg==
X-CR-MTA-TID: 64aa7808
Received: from L2f045e2287c3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 381FD8D9-87F3-4362-831F-3E42D3D9A737.1;
	Thu, 28 Nov 2024 06:23:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2f045e2287c3.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 06:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nkqde/YoUiDCxpEUVdvI02JtxAzwz1rb/ezKlOxzsmwenQHJSlMliqP0StmC9Ongz6NGpccLjUt+UBTgaDNGKTa9hzJzrNuuhnv0FqxltriR4fax696faiE4feusGVhidwnXcz7uxEF7zOxgcsrVZjYinLp8UjAz2jR7Wx7FhzJL9aifVq1GOgkG8A8rrLWSvdmd9lvQ7delA1/DUVCaNtY7Ni81Oz9K3c6tnYqVyeUAbkIcVo4ej1dLmVYc3qDWM1tb2/LtTmrY0bqoSvRxsApwfM2KgEaPdcVygFHIlCjCG5WzRkNIcvVpZ2btAVA9WbOqA/NyethmIjDWD+MWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B845PDujJZA2/PooLgD+a8zkPUg1aX618Fzlgyw05jE=;
 b=Z//n+oR9lEWaJtTRlVInZE23rtfjVGzJKAs/9L5N9shXZInR9uva7FyOPiutxiDPXtisy2aAK/I8RAVca+1zl4iT/qmc/1iIYZ5YZGIiT+TP1LsWEu1emmQx+yYLsDfdfjr0tAdEHTZlcs1YKxldgsY9oKAa6p2S9PU1E39ZHqiRKRuHF/Jl0G7UcMkjSrE2rD/QtC/BHqV/mcL376osxiFesSIX6MFJl84y6p58/FcByCxum9DGjxhtdawOs3bkJCRYkrICPkud6CNI9g+8gebJKCjgVp5KTiUGWZMgUNDOHDB7hXe628N+7mizZG076j8DQKZL/SLQvjFlmg7r4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B845PDujJZA2/PooLgD+a8zkPUg1aX618Fzlgyw05jE=;
 b=ZS6SOQo2vAQ2jiVfvHlJNO/ntuYBNCro9A+gFDHxwnSSUoRYjIBI5YIilG82lSDQ0FS+j9R26YA9fS7zVfg67M+pBNrUqJtWW5Ikq3q4oVNW4jkgo2Q2/hPDVsbh5JV6pDDmzZJ2IP1Vm38LGMLeEBB3Oe/u2aTga0ih7PtvYZg=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB10798.eurprd08.prod.outlook.com
 (2603:10a6:800:211::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 06:23:15 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 06:23:14 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: James Clark <james.clark@linaro.org>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "mike.leach@linaro.org" <mike.leach@linaro.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
	<clrkwllms@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [PATCH 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Topic: [PATCH 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Index: AQHbPx8wr3p+WgsBJEaSjUrN0UERgLLLWRsAgADY9mQ=
Date: Thu, 28 Nov 2024 06:23:14 +0000
Message-ID: <GV1PR08MB105210FEE951B6331F48CF6CCFB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
 <22ef761d-7a9c-46a2-8d61-3d16c2188c0c@linaro.org>
In-Reply-To: <22ef761d-7a9c-46a2-8d61-3d16c2188c0c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|VI0PR08MB10798:EE_|AMS0EPF000001AB:EE_|GV1PR08MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: f14ff840-2b3a-4b8b-b235-08dd0f752cb6
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?oArepz0AHvUorkAVihbHyDx1aLWT/P4CelSiPiSzf8tlrtsdiYkf+sm+yg?=
 =?iso-8859-1?Q?00U91Sp9MkFRyIMsZz62fpaqCpN44g+lgj8VHBrsVQO6BpQnhHOhRE7san?=
 =?iso-8859-1?Q?9BQUV1278stb3LH+6rY7FixkoM+BZKw23tJmO/6/VOsQP724rAlVfQ03ij?=
 =?iso-8859-1?Q?3z2tsi6yDfFqIX4rHY1fYuz47GpaPrsUb+cg4fV5xiTzaEwVt739l4+kDK?=
 =?iso-8859-1?Q?S1MldVdAaccLYCdFWw/S79h5nBGO55IwbeqckyNAd7RFZgY1iAIxKvNDIK?=
 =?iso-8859-1?Q?FaxewkGuRF6XBEwiM5pMZAh6Wwb2PvhYiKzEBKrB43Upsc8rlWXwdOHIJ6?=
 =?iso-8859-1?Q?7HXsyhicmL0X83t3REkINzSyWiq+K+Dber0sRhWOXG62FMOL/aOdJXqj/d?=
 =?iso-8859-1?Q?aeqeB4+udnnrGDWLyM5AuwX7kuloK1zb0BXgepEo/EhK7/Zjgzs3q0MV68?=
 =?iso-8859-1?Q?8cRFfWxGLwjaGwmOjBGhW/zwdAloEI+xZHeEGZrv3TUpi2Vp/ljhLFmt9S?=
 =?iso-8859-1?Q?QbiylD+29ZLWfL/XyWEr+JtH/vm2fGywNv17piXQekjfSYqWr3zbt6KGaL?=
 =?iso-8859-1?Q?pvx2wYr7vRK0hI0NSaO444zP4IEbpMm2gigN7ZBUKj+AegTXBE3ryg8bW6?=
 =?iso-8859-1?Q?W0nt97O+v6EUvNzOERNwgbEq7xfXvWs0izGGuvrlLdchgzbT3eYxGXUEcm?=
 =?iso-8859-1?Q?MGPETeGERxQfdUy+1a2MdCa0U3L4tgZivrjAeY85y1vUJmuMD5s7WTi6WL?=
 =?iso-8859-1?Q?dFa3A+uHJ03lPRV3CN4FHlnFhQUFp8N3wooX/dC10dVTZA+pPpKc9MSnIZ?=
 =?iso-8859-1?Q?IHdtWRWQZhgYIKrh7P1liY7+t6tS/IeLSwAhKw8AynOrqSBH0vG+uKltTE?=
 =?iso-8859-1?Q?LeaPKcYAeeFDtUjnB9rllgolbrywRSxgTyarOnCFe9QLnhkT1c5OK5GI9q?=
 =?iso-8859-1?Q?EBGTcfE93cmP/YvXnLS6wwGlM2Rld6ufWx4PQtW/JGj5ufP3p6fLTftPB5?=
 =?iso-8859-1?Q?ToRPAj7F7M54zqX/wS6qBtt3fiJMkICSeHf8ZwSOJkNTi2C8d1/OAooXka?=
 =?iso-8859-1?Q?TsKTpzFSu3bDE0XHIhXNpB4so6zPTIgbbb4HLtfdoIm0dwcaB6e0FpvF/3?=
 =?iso-8859-1?Q?/NyuF5tv2W1lYHDJyak/L2ONbRWjNYfEVv1iKEU3bOUFaVx2RdMwZIJkU9?=
 =?iso-8859-1?Q?l1SEfasiZybvTMiT9545zUtit3c/0G+AUlTEdixyLTPEiMy/Y0gnjuEytp?=
 =?iso-8859-1?Q?+CuPJEknY1oHGl5eHukTMBD+opTieEoLhO4tPhkBt+wTvZx/9Y3IIH0QqL?=
 =?iso-8859-1?Q?7BrXU1x46w1fu+6t3Pg11yZ2R/f+1RU0wqe3DLwViYBjWOisuz3Xp1gwT7?=
 =?iso-8859-1?Q?lfmJqgUTHTCdZugPSbO4ENjrZ3MqCXOic5me7GOoyVW02hLmeiBng=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10798
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 03d00084-f778-4c69-265f-08dd0f752404
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sTyQkEG0T10SgWYUZdqm49o8QBxun2N6LJw8aDvvaEG7knvh4tK0cs7ZlD?=
 =?iso-8859-1?Q?1GBJldDrnZLKivLp5LsyTShLg5HHkfVf7XnFudXt6pesk4Yq3Sm6/bNPLy?=
 =?iso-8859-1?Q?4XT1w8voSveXzgI67p2Y2GZobwjnhqYf75utcLTPSv99GBgHYmMYgu+fxQ?=
 =?iso-8859-1?Q?BiLyCQ7xW3bbC7JiKIt3HYbU6xtX2r8hZWRLjIic+Z6OtSBOJBgKRevWvA?=
 =?iso-8859-1?Q?JiPWHei7NQ/t5uOsyBW2dXFZBIMViIhAza2tOkc3ZxM/b7xIuXn2Kdm30q?=
 =?iso-8859-1?Q?Xt7nWxuHPL41qRorthQQhlDJnq4HM3QZZ22wHaMuxOfUhM93E0bt54pZ+k?=
 =?iso-8859-1?Q?8HEZsKOwllUInFJkosDBrN2TXfK5iJCmWiBNOFjGHbm/dBhd8mjyaOUq8+?=
 =?iso-8859-1?Q?fl7jTQ/7FkGo9ylzlwobORB/w6mDLmsehcjDesvll9TEWSzAI4uQAVooxz?=
 =?iso-8859-1?Q?Lb4SQ+bdFT364Be9B4ah0men8gd6OrPM4BunMK/8vHaZlq7b+35p0pYXFl?=
 =?iso-8859-1?Q?Bb/fnp/jfhs+iFh3d9bKuA5LOi0pt4RsZA62WiQxz8QaFaEnjonrD/TzZ9?=
 =?iso-8859-1?Q?NaTKXv2zQ64uRfIAvOJs1zBhc52Kt0CTxavleM4AqeeZbSVe9ls671CWCw?=
 =?iso-8859-1?Q?RbEGqO38XCcUByCOoMEbO85CTwrY87k2xTf9gxSVPXklHWE/xBViT4+e2G?=
 =?iso-8859-1?Q?SGmtrjyWgu2HiPTDVFc6zBSfklBl8HmGdLdfzyB3JW4taDLozlctdoVPaP?=
 =?iso-8859-1?Q?4fxmku+Fn0HLAhgJeqIgLQDYN72tcCA+Zn45JvnS9nqgweA6/P9euby67K?=
 =?iso-8859-1?Q?TR8xEJbc7X+3nSKn00YXBtWMLhhJNaY2M8VW96s4bDofj73Ww7yNoaY8q+?=
 =?iso-8859-1?Q?ObNWojRDNIm5R623jAdQGXYTcJSGG8NeQb3LdzFa44X0XI22Sh57ZFEbDQ?=
 =?iso-8859-1?Q?wWRMA/ZkWFUEUbzSth7nvBBrwSOVemOmDS1COK4LSoiX0O75Et/cgo7wQ1?=
 =?iso-8859-1?Q?ZXO8mXpYX8AOUfo4+Wxy8iugeiMvgd/xfHaGvFMhJZkKS/5B5Wq0vtz0jU?=
 =?iso-8859-1?Q?022M+Slsce8zSAxqvux52Uw1FIXAEyajywnnJT8gOxiHPNJ5TtnzzH7WB7?=
 =?iso-8859-1?Q?05oQEBlETeqwSo6N+M9+x4h7wUFMWCtsIMmZX5G1OHoji8bpV72U/dMhLP?=
 =?iso-8859-1?Q?kFzKL0fNm8sNV2x9LagpVV2J7F1KNu/qZOjBdzmBDyDPLmgHaGE9SZpSId?=
 =?iso-8859-1?Q?Qtpl/AA7Wfb3VJaUlpWtIB1MwrXtrwP2MQbLB7ESm6dl0MgiDW0EzQluMd?=
 =?iso-8859-1?Q?ucDpfYMHVLqhba2YNwlPTS4yJIDSZDTCW+FVt/nYV5NiKdvQ4EQyYPx+Zc?=
 =?iso-8859-1?Q?Ma7P5vB7B9andrHk+Tt+Jb5vVboUFkjsMtEasGeIBLeLfpJRYtoonrT105?=
 =?iso-8859-1?Q?PiCZe+CDUOa7+9yrXzQj0M0hnZaxE/tbDOx8AA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 06:23:29.1770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14ff840-2b3a-4b8b-b235-08dd0f752cb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_222341_579728_7250727B 
X-CRM114-Status: GOOD (  14.24  )
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

Hi James,=0A=
=0A=
Thanks for your review.=0A=
=0A=
> Somewhat related to this change, but not something that needs to be done=
=0A=
> now:=0A=
=0A=
> All of the spinlocks for the syfs store/read functions don't need to be=
=0A=
> raw spinlocks, or spinlocks at all. They're never called from the=0A=
> scheduling code and can be locked by coresight_mutex instead.=0A=
> coresight_mutex is held on the sysfs enable/disable path when those=0A=
> values are actually used.=0A=
=0A=
> Same point as here:=0A=
> https://lore.kernel.org/linux-arm-kernel/9a637e74-d81d-405c-bad0-c97ec1aa=
4b77@linaro.org/=0A=
=0A=
> Probably needs a review of which values in each device might be shared=0A=
> between perf mode and sysfs mode when they shouldn't be, as there was=0A=
> one in the link above.=0A=
=0A=
> I thought the only thing shared between sysfs and perf should be the=0A=
> 'mode' which is taken with a compare and swap without locking anyway.=0A=
=0A=
I think it seems bit of hard while sysfs exports interface to modify config=
uration.=0A=
Think about one source enabling via "PERF" and other process try to call re=
set via "SYSFS"=0A=
wihtout locking enabled "PERF" event can have different configuration =0A=
because "SYSFS" can change the configuration while applying "PERF" configur=
ation configured by perf event.=0A=
=0A=
(CPU0 - enabling some coresight device with PERF and configuration from per=
f-event=0A=
 CPU1 - reset configuration via "SYSFS")=0A=
=0A=
I think it seems hard to shared only "mode" between PERF and SYSFS mode.=0A=
=0A=
Suppose one soure device's mode is DISABLED, and=0A=
    - one process setting the configuration via SYSFS interface=0A=
    - one process enabling source device via PERF according to configuratio=
n saved in perf_event.=0A=
=0A=
wihtout locking, how to prevent "SYSFS"'s change of configuration while it =
saw "DISABLED state"?=0A=
I think wihtout lock, It falls to enabled perf event with inconsistent conf=
iguration.=0A=
=0A=
IMHO, only shared cannot be mode unless sysfs provides interface to config =
something=0A=
which can affects function of hardware.....=0A=
=0A=
Thanks.=0A=
=0A=
=0A=
  =0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=

