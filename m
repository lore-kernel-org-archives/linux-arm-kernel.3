Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA53FD3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=; b=RVxHpxMTSy0vZew0dGR9sulOwc
	LlIEDVhPqP/IpDjpl6mhJUVAkFmYavnjNy0Vl997eFDQv0vzggOeqExuVGim93beDOMl9TagoVDD+
	Chp9gNnPulkxc42+qqVFs1aAObpaWWjaYcWeN5QwPovkYDb6lFzQmphElFDTwU7xWCDbS2sl9AUCo
	nrT5XOFu0epNdiPWFR4ZT9RUQ88wrKnlqu2jKN1+TTiKDO5pHHdoogfyFD/JLX6tzpeGu5hZM11LK
	19oZHiqN2MjAY8WytNHWW0oUbOs5L38VvrRGm4ktlbrDSuUbWtB2Hr5+s8aRtR21/k80IHk7pqkkr
	qmSEUIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFu2N-0000000AS6o-2mbF;
	Tue, 26 Nov 2024 11:47:23 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtza-0000000ARVT-0P4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeJ2x922085lpLjBuf7CKp+otxlCz4lpsQGJIX40GGgjS8gohZWv09xG2inhnqkkMLHOD2eZVnA6IUGVqqlLHNTJ42JUw6OfUonMcYl9TBA0e3+RWLzUrosapjikSB2NyiiXUmsIOgQh0Y0TuUVzkFxrFdGmamolpiqon2ERhgUIUuXx1SajhaALbqNvUV+psxh7Lj0B/xrealVa1BhVw85fOIgE1pMfah6p6XyzVmBn89422pbf3llEqH6ZpoiQuXWbURyfYgQHsem9rXl6UmM0gOkT8U9Cy85/TgKvGBVduaw0Kj7vPjVjoBg3CqM2Av67Y5K5en0GIYwcfCD4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=vsb+HWjikJCmaFahxCYbsh2+i3nuIyzH13GCnBT7tIoTTXyOdYZzExXUVifUgC0x0rMpM91vm+ixhqeNlw1+omqVs/FR9uRZUgG3zKPkNWp7IGFuu+zfhNtT+SgS3LIs33rdh0/yZSyWUiOmbav3CRzlD6vtW9Iu7XSGnXPapr+JNwgNOW8tbzFG6vHhbGGva44Y6o6DRQBh6Z1Re5k2V33s0C6WMWG3ez/jREcSQNvFNtvBTAEMQFQXLfEWOn9BFKUj/mjIw37XiUVlbwz7zYjuuRdN2HqOsF8VGvcvl1/YkqykLpk+FSrYAPXiK0EOkSjFSz3nOwKusZQ2BmfZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=hdFsu+BmUp/Mse9GJBLO8Ho+/RqrXizpuwJ5IqLedp/ERt/huagybGiVMSUKN5UVQ7ALl3xq/63IyGUZr17FmfCPE3q9fmuZkEvdtzBGU9KU+rjWf/2uqhFO3H0iQjtZ/8IOlhmzTX0YL1l9msefBICC53LpuAmPtSa1VZG+NP8R93UfrYSCiaIbL+vRzhaLjZ27VzUTk4rh+FDc2m3jGHLN6fxIqRmmBqv+I+Dza8VZ38fOXQW0Glc9edm2dx0W7wihgSoPgOuLmSv5DBT/9xXV9+6r7zPYkrxBG69ATvQXhfaFQfWj9g7uX/qEKlX0fOwQt7jweGy9utyTo4yKcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:25 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Tue, 26 Nov 2024 13:44:11 +0200
Message-ID: <20241126114414.419469-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: f345a0a0-1c66-4cc4-a946-08dd0e0fad23
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0wrdW5NNWxjbytvbENLbWljUGdNUmN1bkl0Z21ZWHhkQjJ3K3EyV0JoL1Iy?=
 =?utf-8?B?YzgyMWJYT2xhWXFScXZqY2UwQ1hnRWppT2pMbXNIV2VmWDgrWXVocHYzZFBQ?=
 =?utf-8?B?UkgrTmYvY0FFZWJVNy9iTGFpZ2JZb005Tzd3OGVQQ0o4clIvRU5NWnJ4TjQ2?=
 =?utf-8?B?TDcrVmpxckJ1NTJkZmp2MHBTckNLVW1SeGhRMmxzSk9OVUI3VjBNRTRPZWZa?=
 =?utf-8?B?TE9xVGZoYTUvVXpsSmExTmg3dnR3dFk4UnM3VzViNGhPeU4xV1JlNm5HNndn?=
 =?utf-8?B?V0F3OW1GSnhBN3FpNWkvRjI2TXhsRkV6Yk1iKzFqanppS1B2dHFZeFZYZkRz?=
 =?utf-8?B?ZStoK3REdkEveG1heHR0VlNtN3JUd2xxTzFHU3RaQ3R2RE1KdHZqN1NCNnVr?=
 =?utf-8?B?LzBFM2pUbzdZWGswMHptQ3BzTDI4QWRBOTlXa0xEZkVkZE9VTjdncktIVlJs?=
 =?utf-8?B?LzMyOG1nZlBVY2t3eGJyNXcyZkR1SjBvdncyQXlrSzNVa1dFdkVkbFRvSlVR?=
 =?utf-8?B?c1NQK1ZJVDcwMk5lTkE5M2xXRWpGUzRYdEV4Ykx3MDFrQW9DYnljYWxMdHFC?=
 =?utf-8?B?SkgzUGZ3MkhjOGc3MHc1cEtJbHNQaVlRb0ZDZENnaVFZa2sxNWVSYVFndXlu?=
 =?utf-8?B?elJKTFdlc2F0K2dETE0wR2JDL01tN1hBaEhvbVNhRGF2YjJOZFI5NkVJN1pa?=
 =?utf-8?B?Y0ZwejJ2SVNCeWpGWmNaM3RSTm9BeERDSGNleXJuM2NwM2dHMHErMlkvWE5C?=
 =?utf-8?B?WnhkQ3BmWFlQUDNjdlFlUmg0NVRscWZPR1l5eGU3TUorQjVBbnNYZVRjM0RX?=
 =?utf-8?B?Y3JiWlMzaENKNWJUYVo3bEFhVDNheUpLd2J6dlhjYlpvdDZqb1l2cUJzRzNj?=
 =?utf-8?B?cnpXVkZ5ZWptMERlVG5obkhFb0FhWS9pbzZvRm5TQnEvbWw5WWxpOHl4U05q?=
 =?utf-8?B?eERqOXdyNXRpOFdKL0VNYlpuQjUzMC90aTJKZ25TanZTWldFeTNUekVhRkdL?=
 =?utf-8?B?MmJNenYxeSt0QVVEa1pIYkQrS2VKSGNHSWRVNDJ4c0kxT1N5Ty90ZFFRM04x?=
 =?utf-8?B?UlU0eVZFdWs2STRyVVhkOGtKdjJMVld0eDRYbVRXRGtsc2k5OXlnbHA5UWg0?=
 =?utf-8?B?WENLZFFUelUxaXpjRDBnTFFOamkwNlZUVG9DR3lnaGJESFFrME9vc0FhaFAv?=
 =?utf-8?B?akwxc2VEa3lmemF5RlkzamE3azVSL3dnWU4wM2ZVLzkyREJhU3NxR1pOdVdZ?=
 =?utf-8?B?Mk43ODI1cmw4L09LNHZTV1Z5OFBUWjBCNVZpV3hIeWdoRTJQQVBkd0lDV045?=
 =?utf-8?B?NWovWis2Yy9QZkYxV1p1VGl1WDBxUllzVW9xSTdONk5tZ21DWU5kem13Z2l3?=
 =?utf-8?B?dk9MOGhkTkdCeHo4WURQRmVhRW9keUtIa0ExM2JidXJHdkZUZXJUWmxpUUJo?=
 =?utf-8?B?VngzVUZLK2RRR3NZK0hmZE5lVUhLRTZuK2hWeFRWcEVLczZTWjdSVTV5Yy9z?=
 =?utf-8?B?U0ZZb21CWkFaVFZUa2IvM0Q5NFNvU05xVHI2eEF6MXc1MHdyK0lDNFlBdU92?=
 =?utf-8?B?WWtiMXdrbzVlbjB0Wm4wVEN4N0xhVVo1ai9jdk5MZnZ2MThseE8wSlhEbE40?=
 =?utf-8?B?UXFubWIySnJIN1EwOXoxQnFCYjJ0T25DZityYloxb2ZRMUJQdk1BZHRteWNY?=
 =?utf-8?B?ZGVIU2FRQThTdlR4QW15NHpmYXR3bTN6U3BUamE3SjNWZkE5bjNYNWh2K0FL?=
 =?utf-8?Q?YWF7yGFNHfMAyKUvhvcUNyJD6NNnRxETfLEqZGa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmQvN3ZLMC9Ua3VrL0dZSEZHenRBSk1LV1pEYjhiR0dLeFJMZWkwalJyZmJD?=
 =?utf-8?B?aFE5L3FxV3NDSE0rVmpwUWdUaFdSclN2dEFCdmc2dVlOajFpNFQyVjQvQ1pk?=
 =?utf-8?B?YlVNZFJ2ZVhyWE1jeU1yTWJ2VmVvUlgwS1VNZXdDaUg2M1F3VzhUc1lxR2kw?=
 =?utf-8?B?N2lrVnVGV0JpMVl0Y1hQTnNPdWVacjVJNUNIb0t3bDBadzhvUHc4VFh3b0NG?=
 =?utf-8?B?dGpCc0grblRJRmVxZ0IrVUZScUxDS2ZldWV6Nzl0LzUrTEk0dUViR25jQjRE?=
 =?utf-8?B?S2NNYlFFTWdZUFdIZ25rSlBvSkRSaWtUTXk0TDZxUTN0aVNRb3hFZHlIbDhY?=
 =?utf-8?B?M1Q4WWQyMW9kUW0zRmMxUmJ4cnBuS0Y4eGNleGtuZGNKQUlzNzZYSjhTcTRp?=
 =?utf-8?B?U3BpcGVQQjk4ejZobmFDUHJIOUE5eHpNc1VrN3RTazR4dWtLWGJld2hQb2dN?=
 =?utf-8?B?bFRiY3l3S2U1dWVGUnJpdGVZRThFSVRaOWVxbDBsMmhJRnZyZ1djNmo0bmpt?=
 =?utf-8?B?cmFqRWlIU2Qva2gxNjdLaW4wVVQzWGl3R3lZQi9GNFRXc1lrb2lIL3hUNlMw?=
 =?utf-8?B?UnZJSTY3NUdZMUhCWTI0UkMwKzNaRko1bjh4VElUY25pczhReVkrZkN2eWtL?=
 =?utf-8?B?U3RGVFFJNE5ZUGJqQ01TSWVrdndXZjRCVXNzMGtuTS9aUDlDUEsxQTZHWElH?=
 =?utf-8?B?a1V4cC9PWTZ4d1phb1pvS1RBT095TFR3a1BxcHU4TThFenVvb1RjQnR1ZHBH?=
 =?utf-8?B?NW1UdkxocFdrSkxzbVYvSm13VWRINE1UYS96dEYyOEt2K2FWWjZqYkdBNmVV?=
 =?utf-8?B?dCtwZ2kxRFM1NUhGV3E5cGlPWFIrQzBMOExEZVUwVFhSYmZkNWRVbjRnNUh2?=
 =?utf-8?B?cE1tUXVmcmFMSHIyZTJOMWsxS2JoN0gxa2VBTVUzTjJ3L1NQY2txMEI3RVVl?=
 =?utf-8?B?aTJDTUJucFFBTFRadUlwUkJrRWN2Y2VnSkRVNUlCTFAyV0l0VFBINWlGTkJl?=
 =?utf-8?B?L0dLWHM1ZHdaRzNCcDhxNUV0bGhSYXljTDlBN1RRTlpVajdNTElBU0VnZXZa?=
 =?utf-8?B?M09qZHBINzFnZmplR0E2Z3h5YjhLUUtzQWJhQkRvaUxkZSt5RWlMbTdtSit0?=
 =?utf-8?B?ZGc0TmFoQzZGNmdDTEVDM3pSeGpnNytxY2grVDZIalVCaE1rdnpEQ0JITVVK?=
 =?utf-8?B?NnpvS2VzOWF3SnlrK09yU0ZmMmJ0cGxpVmxKTUJEQkE1b3ZtRUg2RElLeUhj?=
 =?utf-8?B?Z1RNcytReWJwSFhDU0pud1FXanlrMGJYdUVHbllyd3pZOS9hdEJ0WjlMK2Mv?=
 =?utf-8?B?WWxZMEFWZGFPNms4MXdhUjFNVWZIdEk4VUs1Qk9vblBvbEwvUHlSSHdWdm9K?=
 =?utf-8?B?WFI4ZnF3YmR5bVVZQi8zcVZKdFhRSzh5K2hEWC9kY21Ra0RneHZYTm9DckZE?=
 =?utf-8?B?U3p4cllySXFBQlRLN0VHQ3FVYzBFaHRzVTFUTFR1WVp1NUt6dDNsc1VhLzJo?=
 =?utf-8?B?S1dwd1BMZ25MRm1GOEVlTkFoeWZ6YjFNa1oyZm9ObTNXM2xzZUFMV2lLVjQy?=
 =?utf-8?B?VUpnanlhZkFiK3hRd2NpQjVQQVdVR3liU2hUajVPS29OckxURmFnbXZmVW9Q?=
 =?utf-8?B?aHRDOTRueG4ydmlIa3QwY2R6MFFUYXdGVVJuUkJ6cm9Za1JKc2xNNTZYcEJN?=
 =?utf-8?B?L2g2algzZmFSQlNIZEo4T2pCNE1QalNCb3lCSXhLclFHeDhra3VjanJoUER4?=
 =?utf-8?B?VVU0K1ptZjRUMzQ1SVE4L1hYMGJZcjhZQ0Z5dXV1SmZWZ0N3QmtibnpzTnZv?=
 =?utf-8?B?OHJFcGhybDcwNWtkcjZPOEhTK1RBNFhzZHlvSDZEOU16R1FLZXFWY0xJU2h4?=
 =?utf-8?B?UGxLYjRzQ1g2MWZRbThwcmNNTDRxY0lubjQwVzNSeDJTMUsxMm1kaEN1Mk4z?=
 =?utf-8?B?YXFWUE41VTFwNnlKNUlndkI1WnZZL3pSQmtwV1lqMUVQc0NXYlZjSGtaaGIv?=
 =?utf-8?B?RElGS2kwWVQyTFA4L1h6cGIyeG9ER1VySUtOcmZTRFVEdmZOelRjZU5iSHVK?=
 =?utf-8?B?ODJqOVQ2UUlaY0k5N1pIOWdjeHBzTTB2NXpNbWh0MkVMYnh1ZzlMUWJxVWRV?=
 =?utf-8?B?V01xZ28yQkFDVkw3UmRtbG5RQncwK1owbEhQa21tVytwSlN5YU91V2t5aS9D?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f345a0a0-1c66-4cc4-a946-08dd0e0fad23
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:25.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpCIaYNrWv67hvIcZ0z1ZjwRhmIJ+4D0ORHOVsMULsz5XoxZVDk2o06l7tfcyaVUCh20pfI9dAjI+KskDpa8Ga2/BTGBpnrj65adLYT9gLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_034430_138150_3FCC5C02 
X-CRM114-Status: GOOD (  16.49  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

RTC tracks clock time during system suspend and it is used as a wakeup
source on S32G2/S32G3 architecture.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..89414a0d926c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+description:
+  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
+  It is not kept alive during system reset and it is not battery-powered.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the RTC iomapped registers
+      - description: Clock source for the RTC module. Can be selected between
+          4 different clock sources using an integrated hardware mux.
+          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
+          available during standby and runtime. 'source1' is reserved and cannot
+          be used. 'source2' is the FIRC clock and it is only available during
+          runtime providing a better resolution (~48MHz). 'source3' is an external
+          RTC clock source which can be additionally added in hardware.
+
+  clock-names:
+    items:
+      - const: ipg
+      - enum: [ source0, source1, source2, source3 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                     "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>, <&clks 55>;
+        clock-names = "ipg", "source0";
+    };
-- 
2.45.2


