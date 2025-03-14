Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07BFC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8gzwYSV5gwBYKcQc0nOtyeb1nit6TTBgM9pxHIg1cg=; b=TMTDDG8ym80Q16jeQsMnB1KeZH
	TZfPINxdDiatbfsPH0DNCXdRpcD/rZvzCxV5D6e//V0rfss0fINd42es/isSxpWAUHZltzfSzGIEq
	BAEltKaVj9SCQSbdg9NGzcirZ8KfF0eY7ICMtquGfNVAmZ2NppJqacQrfz+HhHv1UW93Y4UbJuy+7
	SxXOhCdnRsAogsjcGGYqbbzXqf9Qjb8TmTITyNLBaPgQgpPatgZ8O1HtDVtjcZGp8tybpcpkgT2Ib
	QvGVauk0V012eI28vZ2KB99gEjRQiFuy6M7xOu+5pIPkHnk26IDpdRWwZhY54gY2BAsgNi4F3hRT3
	v2DaDHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6wu-0000000EYtN-0QsW;
	Fri, 14 Mar 2025 15:27:48 +0000
Received: from mail-db8eur05on20613.outbound.protection.outlook.com ([2a01:111:f403:2614::613] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6uP-0000000EYST-2Cjd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:25:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TiqDPsGQ+s6BWRU5PAQyC5xlyZM5PsPFvPndUpL4lUWSw5Dli7u7As7Xwc7lZRFXjQk3NjYpkGGcFHFFsBOabhr88Sc2v/8UfJqGGaWY3edjdK6LK4zV5lSa6jLhHeU1vp2meefTqtnHzjabtfIte6uyun6QnB8+5i2nn2flCRA3nXdGEAJ+3kjCu1akThQ2fIj7jTNKBsGcNFztI0tpW/spVK3KUJlmtPoeSLtvQ8QtSoTAfxGfBj2kjwc2O3T5TUKEuftlySGHyQ/PBNDF2rjZ6P6KTch0scn+qpQw87XlQ1nMM9uJKnOMazck15SQukT1uX/D+f4dbubEAPlIvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8gzwYSV5gwBYKcQc0nOtyeb1nit6TTBgM9pxHIg1cg=;
 b=iC8ENu7hzrxrZJ6NRwwDm63NYyJwGgkg2PIEB7fA8p6m25shrOdv8CuEDZUPIESkRnuS6aHHwuSvXYQB6ZU9aa52N/KR9pPminT8natMtIxaO0kLjj3ysCihf+TZLX2xB1yeNyFk4k+kKbb2SpvNop6OXFfxmMfSxJ6S9yvH/9/akr/E+ezQn4ZfvpfIW2AvYAIpVYmPnyTsOB46WQFE00igJPu8hZOZ0VoBqbhaCiIyfRSVMkXzMYpAddMcA3glhoq4up6s9gZffGP0yB2feoCe1soeOXgh40ODIiKUu2BCV0nQE4kmvS1ZHwh6jX6R/fvtjasmNNZCA3nN1LCiaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8gzwYSV5gwBYKcQc0nOtyeb1nit6TTBgM9pxHIg1cg=;
 b=iM3X7BBe7ZEY9aatLxRTVGSkpOiXUP0hipIxrLMlkkO0z0vUTVZk9kC3FH57nJ1ET+PbHhxZQWWfVpBhWRAKVX0h/WfgtB2sMOKgIvpg1SZMXdsu0xXwjB9F7dlTgOopgSiS+NsTKDQ20ASmyAu32ilLXrT7kDYNjQkp4veWZoo=
Received: from DB8PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:10:120::29)
 by VI0PR08MB10653.eurprd08.prod.outlook.com (2603:10a6:800:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 15:25:08 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::ba) by DB8PR06CA0055.outlook.office365.com
 (2603:10a6:10:120::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Fri,
 14 Mar 2025 15:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 14 Mar 2025 15:25:08 +0000
Received: ("Tessian outbound 273c03480eca:v594"); Fri, 14 Mar 2025 15:25:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adf5239edfc2d516
X-TessianGatewayMetadata: 7LndFAy9U/lAqxoKR/fdRDGUvsMWaUKRPjkgSuLAKPwW2Nr3rlP1uMbCCMcQhPsW3qbWKdN72zM3wnE+VI8oZ9jn4njU9ogxWFR1LJksNEAM3ItLJIcozej7JGJ0zf0AIQzaA7PrdtIcoqqfJgYxAedVVj3RjFKYPuGzx8utCFaCWmfe3Odu/aZJtMb4LRIPdgqXZI/kkxsNacfqqaSfaw==
X-CR-MTA-TID: 64aa7808
Received: from Lb27a933a4a76.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4630B1D0-DAB8-445E-9ED4-37954B78E63A.1;
	Fri, 14 Mar 2025 15:25:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb27a933a4a76.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 14 Mar 2025 15:25:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKyp83fPacuX09LwYs14bAqGkfl6PvjoPaPPjffL5PfPmiHd3avL2dTYFVCxB0q3aux+nZ3U6zQwIJhVLSV5+rjoRsENC+vnA1dIYZvtJ+JnsYz/TqM0+iy1+6wqof+FYpPWaZMPX00dlc+HV5izf/WBFvnioX0eJoWQw7SX9KmpNBk8AmPUWN7IyJyGuKbxxlfsdySQ1FV/CutR9yZ+Vnx0R/mhZ+4jwK9v8wUx+aphHuZs+iCAJsba77UcBR/TFGLK6bTbzgJeHmuHL+6WP89AYlJBKmegLN/dWb4QUzw4mCx3k6jUQr0/ALGbVE275kGTE85DKHff5Pe3aO4T1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8gzwYSV5gwBYKcQc0nOtyeb1nit6TTBgM9pxHIg1cg=;
 b=UHhTs63dstblqSztqVjepG0iaQr4A08tKjooHTCzDncvEF6zMgBuR/ssUjzxnLUZgiN3/btDzr/O6IuYW74MAibQSJ+kQ0VT8j67MtWp1LsvpQ/YNR+5Gor/sAFquUIBiVglLf4oPjKnpdpkBNC0YYaHCvXQ4q/gZ37ebX0SOSKIEI2EHTan4crnbehXZqFYcz9gyQzs5g6XBS9uQZU9y+tk7YMVwgV5GUe5MU+lZbEGVks3tl3TmGgB7hz+9Ch03hyUUg+BFjvbZVMhJYTzxXr/9x/5diz7j57OeFfG/+mXpwOd+qY/WgLfMUo8dPPp+mOtdIP8cQibAJiIvDvkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8gzwYSV5gwBYKcQc0nOtyeb1nit6TTBgM9pxHIg1cg=;
 b=iM3X7BBe7ZEY9aatLxRTVGSkpOiXUP0hipIxrLMlkkO0z0vUTVZk9kC3FH57nJ1ET+PbHhxZQWWfVpBhWRAKVX0h/WfgtB2sMOKgIvpg1SZMXdsu0xXwjB9F7dlTgOopgSiS+NsTKDQ20ASmyAu32ilLXrT7kDYNjQkp4veWZoo=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by FRZPR08MB11138.eurprd08.prod.outlook.com
 (2603:10a6:d10:136::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 15:24:58 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:24:58 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Thread-Topic: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Thread-Index: AQHbYrq6r5SrhbLvl0KKCTupVv1Yu7NzG0MAgAAEncU=
Date: Fri, 14 Mar 2025 15:24:58 +0000
Message-ID: <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250109171956.3535294-1-yeoreum.yun@arm.com>
 <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
In-Reply-To: <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|FRZPR08MB11138:EE_|DB3PEPF0000885E:EE_|VI0PR08MB10653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b802a16-af20-4ea2-a5ae-08dd630c675b
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?flJFkHYQ34BS5lkt3+X3jhAwZnhX/LX35I5ZkuTbMNZF9DMOEk5lfCs6Zp?=
 =?iso-8859-1?Q?KYmSoXUFWwXwBoCV7J+c+RLtR3JUh6GBaxObVTpORnQdXW8j/E4Edfzy1y?=
 =?iso-8859-1?Q?5hrMTzppd7M0iotQxrpyNNeabIFoCVAL2YnXk39OvGxSyKTCK9bH3P3CEU?=
 =?iso-8859-1?Q?4WiwVrhPwFIf5CfmJ0SLHxWJKk6CX2T5xPV6hlFcN+7ACW7B/iLAkm4mxI?=
 =?iso-8859-1?Q?1cYYSexxT5TrQ6wS9IU94Dkeq+HpxL2LUk65uK9DNdnzJTUFw2cXe51YD3?=
 =?iso-8859-1?Q?3C+3DfE70Nw/qMCsSGcK9Rik0iYIAatDfdolaHwtpy2+MlpsIa+UaCBSIR?=
 =?iso-8859-1?Q?iGCGXA53RJz09bEOf0VTfOAEIOqXwJ20nnbHQsdBi7f0GF52ldJFGA+MGI?=
 =?iso-8859-1?Q?7NhAPOvBzxJ6xjhrdPrBceV3WAsOdVYkfj1FjZgZ37EK/ScPAhgf87wzbb?=
 =?iso-8859-1?Q?CKbFfPgJ6BICk8+XMztlCRrbhzJnsQ2pn9sqEPUJiRoh3mw+TNkSydDw+1?=
 =?iso-8859-1?Q?+eaDNcoFzaTuw0KMQERkJMdFByQG94HKK+W1i00H6WjGiSsYoWNihRx7DC?=
 =?iso-8859-1?Q?RwsJ1yDXVFT2viIrsfkgUjPTQvKKuoGYxBjdlzbXgw/x+d3unN4pRFsub6?=
 =?iso-8859-1?Q?LGRTMHOHYGtpem5dP1/lTuAwY2ihRoicSn6BUa3rbNwKDS/+YmmTj7fXH3?=
 =?iso-8859-1?Q?t00GeechnUGFcMxqCw7Se49A/EcQEKpG9LytSyNiM7EYi9swt24EmDEtOi?=
 =?iso-8859-1?Q?WQqNEPqvLf2CV7oRt9GNgxtos2TgWKD/Fz7vybPK6vWe+cmYCdga3pyP/y?=
 =?iso-8859-1?Q?4Bp98SxYV22atAuisfYxUjvVEcc3npubXdvMWKKOHiRVVBkzHC7ember16?=
 =?iso-8859-1?Q?nniREzEygad7Xu2jV5/Fqc+YdV4bqB7jNB92KjNqDNA+PAlwTLQbX5+xLC?=
 =?iso-8859-1?Q?JbQZocjbp8GApHOq2g8dCnHkE3IbdUZ3gN0Cnm2rGL0quhXuQyi8KC++Id?=
 =?iso-8859-1?Q?oanpYK3SQTauANxgBWvhs6OW1Uk0T9W6BvyWIKMCJjQHwcytekYdKxQhAn?=
 =?iso-8859-1?Q?lod7gXWT4qyJiege7ZmjzyLDNWo8MmNdRjp/khJCANm0i+y95Wsm3N1ZcN?=
 =?iso-8859-1?Q?k62NhrBSVE5aGoCbKMt7u6Q1burEbvoj2+l1Y1MoLjNPsFQWJjARnlKviK?=
 =?iso-8859-1?Q?5IdyHnBn0ehdi0GAJqJ6Atdg5XwdSx2gNRIGT05BpRxEqzl+F5LgVsfH96?=
 =?iso-8859-1?Q?2sCs07jJczs1ayNnPRx5rPgHwnBCorLoBQLJUGIHrhaJzZLQGEyjjwgv5H?=
 =?iso-8859-1?Q?dpD6ZUyQ/mi7N+kVvNtD1d4VmwJQydfLOsQmHC1WHCfSeZkC5gHAhSNLcq?=
 =?iso-8859-1?Q?V5K88OB8/fn0NiP8I+J5JO/0h2okQEIV3GJmy2BSp9imiLC3iwDl8LjgKR?=
 =?iso-8859-1?Q?MDT15YsPlgKb40xQhpxfjT+2FPmAiiOMj2H3mNNBRYjuNDojvDFosYXPgc?=
 =?iso-8859-1?Q?nKIXxgXxSaOFN1vEhMh6sc?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11138
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bebe76a4-9928-4baf-9d81-08dd630c61c3
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700013|82310400026|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4ZPj2OGQj+S7xxNK3WaXhobBX9aSIm7nQ6l88he7d9d88cv/9SyC+R4Fxc?=
 =?iso-8859-1?Q?1hVw6kY+JXNyevcNMTnxZY007OlnqaHLTq97m7Za3S4dcgeDqDaa2jkt7L?=
 =?iso-8859-1?Q?OgwFRCrngknhcsovGGk0HwzL89pHqbuXKXPN4rW8/dTFF/EXKpR37hhaoe?=
 =?iso-8859-1?Q?wkuUREv2dIUg8E4fSr/mlaDtzWAjkILWyet3Xn7HPGEE897AysRgXseBiC?=
 =?iso-8859-1?Q?EimOe07U6qzjIB2wWl2w2ef08/MJwI0LWuV88crYDfJ+aMOPrmiCngi9tM?=
 =?iso-8859-1?Q?1CbBki5fNO8mBKcwM3rjGz9/+VgzvWT500YZ9XEo9r5RxE8LkyYJKLNCGv?=
 =?iso-8859-1?Q?SgZKeeB/b5iD6+jFBtXNjDF6N6F7CECJbvC/NnCsvvu+30ljcQAhjAmHPB?=
 =?iso-8859-1?Q?24utTLVqikSlIL2m0MQg57N8a+1clw8SRRu8B9XUEHMnztCAf/k+gNqphr?=
 =?iso-8859-1?Q?L/MhQU7Nowwr37VijFEAT0wMO9m9byZ+qxxHPOWJz+ySPOQuXvKKAfJ8iv?=
 =?iso-8859-1?Q?KpNhYm+tsxr35bn8hzAL5ray41iu0h8ctV7w/qrhBgwfIVHBPOo5uz+hFW?=
 =?iso-8859-1?Q?l0xWenAfpsoRTFUFVdHsLwxFs69u2Dbe/eATg81BMJSffSkpQEpZub7W53?=
 =?iso-8859-1?Q?lygA4iaI2MIp6C62USq86KHk8QmVeI0LDYdLBbL4iP4V3l+ri/grF5LBV9?=
 =?iso-8859-1?Q?GUDYcBEVSbdq+BzALmYcEyXFTdhe6g44nHEo9/KX/RyEDsqmL6WWxZ/nV7?=
 =?iso-8859-1?Q?c5ZOWsXBBNvZ8q+eDFqwuby1JPA5J8rS7xcUcwZ5ECLHu63CyAJqTqpRco?=
 =?iso-8859-1?Q?sLb3gCpMbHiHkfJiNOXRHPaqwKlBCIgCuT7DKoxe55wL8JuGqlze/P595y?=
 =?iso-8859-1?Q?DKhuCX9OVOeffKTWs1hG29haW2upDMNGzs24zZ+RpuZsjVJE/RaaF0xxsR?=
 =?iso-8859-1?Q?kgR1qjavZJ/mF7u6GTcPqNOV2IHi6yr/39knRWObxsFkyyasVn2CGjtErG?=
 =?iso-8859-1?Q?jh7d3SipnEn6TZCQFO7l6Viawjh/87JVuWwBg6gYyavvVU7gEmkBJfVZ9L?=
 =?iso-8859-1?Q?P8m/LGzr7euNDj1G3OHXizh8mpAlTOJIZC2SqYY+VQWmieI65HrFiajCmX?=
 =?iso-8859-1?Q?//uaVcEa217TNc5G5Mkr+kSigRMcnglbbMCL2x86pQwjMJKj+Z7EjDBch7?=
 =?iso-8859-1?Q?YlJM186JJrVobtMVUTGR//sKQ5mJmkAfnrdnA+fh3y1Ll4FwYg5TT28ra5?=
 =?iso-8859-1?Q?W0DMsoEYjyNhd8TDGYgQLxqZX4hJuJLd5BTU2ynSiTj8EjBnjv2eKmsho5?=
 =?iso-8859-1?Q?vEXI14BtD5JYV+NO0q4kUjo/cTywE4bYJO16YddEBTMsDEdx4mquAWhsds?=
 =?iso-8859-1?Q?1y2+kEAgJ51deC/B9sosu8B299aoCujF4uW1z953GlXlL2fyQX1p/8DXNX?=
 =?iso-8859-1?Q?ysbWJ0c2JCGGGmPzuOC9S9K4ecZe/kPgUj2/3z4Thgy1aljTtsE70wzU+y?=
 =?iso-8859-1?Q?C7Ok2vv7/hsx/42DDP0NHJyQ4qTLu4X25VvpbibJOUW0izDmiPAHKyKi9S?=
 =?iso-8859-1?Q?IuCdO2o=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:25:08.1139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b802a16-af20-4ea2-a5ae-08dd630c675b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_082513_712502_66265E9A 
X-CRM114-Status: GOOD (  10.53  )
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

Hi, Mike.=0A=
=0A=
> >  static void cscfg_remove_owned_csdev_features(struct coresight_device =
*csdev, void *load_owner)=0A=
> > @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_devi=
ce *csdev)=0A=
> >  }=0A=
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);=0A=
> >=0A=
> > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_des=
c, bool enable)=0A=
> > +{=0A=
> > +       if (enable)=0A=
> > +               return atomic_inc_not_zero(&config_desc->active_cnt);=
=0A=
> > +=0A=
>=0A=
> Not sure why we have an "enable" parameter here - it completely=0A=
> changes the meaning of the function - with no comment at the start.=0A=
=0A=
Sorry. But what I intended is to distinguish=0A=
    - activation of config=0A=
    - enable of activated config.=0A=
Because, current coresight doesn't grab the module reference on enable of a=
ctivate config,=0A=
But It grabs that reference only in activation.=0A=
That's why I used to "enable" parameter to distinguish this=0A=
while I integrate with module_owner count.=0A=
=0A=
> >         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, =
item) {=0A=
> >                 if ((unsigned long)config_desc->event_ea->var =3D=3D cf=
g_hash) {=0A=
> > -                       atomic_dec(&config_desc->active_cnt);=0A=
> >                         atomic_dec(&cscfg_mgr->sys_active_cnt);=0A=
> > -                       cscfg_owner_put(config_desc->load_owner);=0A=
> > +                       cscfg_config_desc_put(config_desc);=0A=
> >                         dev_dbg(cscfg_device(), "Deactivate config %s.\=
n", config_desc->name);=0A=
> >                         break;=0A=
> >                 }=0A=
> > @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,=0A=
> >                                      unsigned long cfg_hash, int preset=
)=0A=
> >  {=0A=
> >         struct cscfg_config_csdev *config_csdev_active =3D NULL, *confi=
g_csdev_item;=0A=
> > -       const struct cscfg_config_desc *config_desc;=0A=
> > +       struct cscfg_config_desc *config_desc;=0A=
> >         unsigned long flags;=0A=
> >         int err =3D 0;=0A=
> >=0A=
> > @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,=0A=
> >         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);=0A=
> >         list_for_each_entry(config_csdev_item, &csdev->config_csdev_lis=
t, node) {=0A=
> >                 config_desc =3D config_csdev_item->config_desc;=0A=
> > -               if ((atomic_read(&config_desc->active_cnt)) &&=0A=
> > -                   ((unsigned long)config_desc->event_ea->var =3D=3D c=
fg_hash)) {=0A=
> > +               if (((unsigned long)config_desc->event_ea->var =3D=3D c=
fg_hash) &&=0A=
> > +                               cscfg_config_desc_get(config_desc, true=
)) {=0A=
> >=0A=
> This obfuscates the logic of the comparisons without good reason. With=0A=
> the true parameter, the function does no "get" operation but just=0A=
> replicates the logic being replaced - checking the active_cnt is=0A=
> non-zero.=0A=
>=0A=
> Restore this to the original logic to make it readable again=0A=
=0A=
It's not a replicates of comparsion logic, but if true,=0A=
It get the reference of active_cnt but not get module reference.=0A=
The fundemental fault in the UAF becase of just "atomic_read()"=0A=
so, it should hold reference in here.=0A=
=0A=
So, If you think the cscfg_config_desc_get()'s parameter makes obfuscation,=
=0A=
I think there're two way to modfiy.=0A=
=0A=
    1. cscfg_config_desc_get()/put() always grab/drop the module count. =0A=
    2. remove cscfg_config_desc_get()/put() but just use atomic_XXX(&active=
_cnt) only=0A=
        with cscfg_owner_get()/put()=0A=
 =0A=
Any thougt?=0A=
=0A=
Thanks!=0A=
=0A=
 =0A=

