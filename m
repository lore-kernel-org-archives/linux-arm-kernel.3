Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10904C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDyyEx8cYOA/l0TvcFZvtt2l9+pp4mDpubDlzKeS7e0=; b=ewmXERkU6frDbxu6wX0XJJV/uk
	Etk/jzdILFRZGgyF3LNoRfL/Mef9/uV00v7d1GQUl8hoIBEmWwkA69E8pOHLTBjI+g2iLGLgqhYt6
	D0Vd6ZHxph8THZI8jiit28ARFS22drWsctgkqGZHe3iASyr959NsF7a12ijHmsWWlc00NKW8xSaeh
	xE/KEf1kmfv6yAr9xlaTt6QPtFcprTnQ/PRiGf3j/pWjZLdAnPYnhtlxp+oAqyBL/NEW8ITNgLY2O
	Yd83mlf7fw+ToHyEDB30gBBeyo1TdXhlH7qs0If42zecPWqs3sfKApNWlPsr23E6Fx+6S3w4cGxpb
	d4GS8ZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZp8M-00000005MK9-0n6R;
	Mon, 20 Jan 2025 10:35:54 +0000
Received: from mail-dbaeur03on20710.outbound.protection.outlook.com ([2a01:111:f403:260d::710] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZp74-00000005Lsw-3pXq;
	Mon, 20 Jan 2025 10:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3WOV2PJzjrLCteWH/qCz05JaOeQnoNXrADr6GlhVoj6soe1el8JpCnBcghIwbWJlGgCY7lSCkEnrsd0ER/Q1bssty98yaJRsFe2yiPzXpuM8TJEWoUakmxB/tJonMvcNy79Wv2WvZJ+TwwFKScs6ZThZyRy9DFN4BFVcJ4LdtMNCBi1hMozMjFvKHsjYU3VjiW6Bus3pajWjE1dj4nBHTxakl4WUjGQJeLnkN5WyEfrKjY1LW3NTa251hcPpSN3UqV15ugqX9Gfyg/LCOmQ7RZytiXSDccdISDh7RK5x0C8MabkWQOdlnXWKRuVBTC1Qr+2kEOFwPefwp5dkBH08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDyyEx8cYOA/l0TvcFZvtt2l9+pp4mDpubDlzKeS7e0=;
 b=ZIYN8mrly1fDSs7AlfJUqJ2XqZYQyc2y59xRh33N2bKu/B4qpWBRR/tKaLXKySDZdNOlyGa4jKsozyCa0bQqw4JK/K20dAz0xl/iZU7XpC2mBzL1+4wS4Qo+yLkeYbSZ0CdLqKFzaw4a570iUIIzGlnlUj5HnF+fVmDbUuHwaa2PWARlK0J7ATeBXBjk2P9vDeLd6v7Mh1PPk7cPwOW4f1OeRw+XoaLvIV6z1AOBXXvfvGKXzVAFd881h8KzWiN9OoKlVQJnk5+t/IsIQFs8ES3PaL8TO8LCpZyZirUP8JFPeUH6uA86sj8a9jZ99di1EA/xpIHvO2plTMDo4yTb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDyyEx8cYOA/l0TvcFZvtt2l9+pp4mDpubDlzKeS7e0=;
 b=vOaHruCeRim3JzAkU/ps5HiQkjXjTVy2I8gx9JnsQ06GFGkWzMlqThppYKz9/tM3zK3EmjtQZ5UjcPSGFFCyOHRZeRcqGiTrjrPjSKXvFc21/663bjOIkDdSOh2eiuy+uvv4Kwl0gJHmjt7GrTfdVrMkpdEZggAFq8QpzCBSNdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8781.eurprd08.prod.outlook.com (2603:10a6:20b:5f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:34:29 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 10:34:29 +0000
Message-ID: <bbf47543-6fe3-409e-a988-35be63d47cfa@wolfvision.net>
Date: Mon, 20 Jan 2025 11:34:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-1-157d319004fc@cherry.de>
 <e492812f-11cb-42e3-ad0d-ae6df37c346b@wolfvision.net>
 <433a8050-98b5-409b-97b5-00fe0e719a52@cherry.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <433a8050-98b5-409b-97b5-00fe0e719a52@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac0b911-cf6b-4723-e489-08dd393e04f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWhTc1BDelZuNmdraTIvTU9WS2t6RWJiYlFneXlDbUtyM3Myc0NmdmJEY3Qy?=
 =?utf-8?B?SXl4bmVpdTFhaVRKT05BZ3hwN0czK0pzRHJWWU4zWjRKWm42R3E1dk1rZy9Z?=
 =?utf-8?B?a2xoR1VlM3Y1dEQwN1J5YWkrem96U2FrQWI4dDFySkl0Z05HZlNWM2owejls?=
 =?utf-8?B?MERlUHp3THJyaUFwRFg0bnh4VDVkb2dKeEQ5NmJFU1RuSkFSLzh4emkweGhi?=
 =?utf-8?B?Y1k4ZWlaaHgwZ0xkdDA5ZFNxT3prejkzbjNzRTNLenM3L1FTd2FPSWlORXM2?=
 =?utf-8?B?L1Y2cGZpcnlHYjJNL2hoenVKaGd0SEFWZ044VkpHVUhXeVRJMUxTTGJ3MGQ4?=
 =?utf-8?B?V3RLVnNKRXNQUWtxa0dYRHFSbFJ3VmNWTEYxRXBGR3FGTVo3Z2ltdUJtOVdi?=
 =?utf-8?B?eHFTaW01WTl0U2RGZ2Nsbkw0bk0rQ2kzWHhncnYvNDhIdEFzZXFveUpZM2JD?=
 =?utf-8?B?MUtLaG9jRXlzTDdtb3lWR2tNK1REcHFERTdKdU41VVlHZ2J1azRpUXVZNm9G?=
 =?utf-8?B?S2JCNGJjRlZOTGIybDdMV0V1RVlVZlNMYjVZZjlxbFcrV0RsYkVnZXJMOEw5?=
 =?utf-8?B?YUtuRUU0ZVFmMUFpRC92ZXNheEJERG1pOUk2Rld1NXpUNVRYOURYM09uTjlZ?=
 =?utf-8?B?dUVVZDg4T0k2bU5VNU5NTllyZ04zZmcxUzZNc0dxLzN4VVM5eGZNZnUvR3A3?=
 =?utf-8?B?aFhiNlFaUWQ3OUk5b1Z3aEZkVGJVUVZQQmtGWGI0ZGJiMEhmZkQ1NjdwZ0F6?=
 =?utf-8?B?STNHdDBwazVxemZhOTVqV2VyejJFaG0zWTBsVnFPU0tyZzluejg1NnJmOEpF?=
 =?utf-8?B?Z2dqWE5PRVdIc3RHbk5FSlZuQS85TlVMTVJqV2RFTm16UU83MWl4OURPbmM2?=
 =?utf-8?B?Nnd5dzB2a0dSNUtPaCs2bk90ZVIwV3NwTnF5YUliRUZxNmNncTE4NzM0ZGFT?=
 =?utf-8?B?V0NKZ251QWZSZURmTXdGMCtkbng1OUExWFRLelE1b0gyN3UvdWNyYnovZ3pW?=
 =?utf-8?B?TnNxNUtUREIxbDNocUcxNCs3S0F5OGhtMXRKa0RhQ0JaWWZrK1pVdHh1NXNF?=
 =?utf-8?B?bU8rR21IdTEwVWtSSmJ3ZzBaZ2NTK0pYL2podkZQQUhUOEdpZStjZUVsdXh4?=
 =?utf-8?B?L0ExSjJqMnN2d0FWcENWcFozOVdrQ05POHZKanc2OGo3WGhhMzkzMXBHQm5u?=
 =?utf-8?B?c3IrdFcvOWdrems4MkllNjI2U1JTUU9sTDc3V0crUEFXZjl2aXhPYWQvU0ha?=
 =?utf-8?B?aXd3dXNPZjRTNUxEUVlMSXEyZmlySjFxT2FJSlNiZW44a1hGZU13WVFqTno4?=
 =?utf-8?B?dk5RUkt4S2VoVHFtVjJMa2ladWNaVzFZNFRKZkczcXQzdDJVL3d2K3FXeHVI?=
 =?utf-8?B?Uzk5NnArT1B0dzJVa1g4MXF5ekpRYllGMTVqNzVaTVJGU3E3RUFjRXZJWStM?=
 =?utf-8?B?bnlFRGtjS0tiQUQ2ejlGb255RytHbmc0R2JabEFwZWpGS1pndERBaXBsZFAv?=
 =?utf-8?B?b2tZcm5GR2VmL2dhem9oMWZJUGN4VUxtbit2UDk5RW8zL2dnb01XeEVyR2pI?=
 =?utf-8?B?bXd1aHBCZVRodlNha2s3OVVhK2Z6dlV6ZWR6S0ljK0J0aWF4dnpKNHRqNzVZ?=
 =?utf-8?B?VTlZcENhREl5QjUyNkllSXRjTDZ3VHQ2RmRPeENLWi9FdW1wTU9UeXp5eXgw?=
 =?utf-8?B?YXZUS1kwZmlmdC9LQ2VqSm9NaXdIaG9xVFlNaE9YdE94NC82eWJrb09EL3Ar?=
 =?utf-8?B?eVVYZDB0aTBaN3lqVU15OWlVcjJ5VUdqckcvdWdTYnpPOHFoSWhQbW13ZlMx?=
 =?utf-8?B?RjIrZWZXK2o1TGlNbFhOSEtpTXNiOS94RmRWcE15ekxKMXY1VGI5cW9oUnVw?=
 =?utf-8?Q?ggU6wmATHu3cO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVNTU0VSL3V4TlJSVnRMc25mT0lyZm5JMFBGT3ZwaTlxeU1JOEk2YnhsV3Q4?=
 =?utf-8?B?YkJpL0NUQ3FaTXRycUgzNGFpZkk2UWYwSUR2UGp5ZGFDSEg0akVkSWRmQjBu?=
 =?utf-8?B?MEgwaXNiRVNPcGJkRmZVUHNTYzBWYlNyREZ5NS9GRFZja0YyK3FuWFNNUWJt?=
 =?utf-8?B?a2laQnBSamZQU1Qrek92MGcrY1loOWV2UmRQZ0dyclRvZFpZREJLSytWRTg4?=
 =?utf-8?B?aFZKa2FZaTNVbzhxaXA0dVhCdHIraGRoNzBHa2k0cjNLeWxHZ2pLckJqOEky?=
 =?utf-8?B?SDdMaWFTcW40czlFeURkSnZkOFhFZGZiT3FvYlNoRUNZTnhwYmFHVW9lYk9s?=
 =?utf-8?B?akoxVUVsTGZCblRvMGJEdXZydkliQ1lDSUY5ODJQNE03VEh0R04yRFVwQlFR?=
 =?utf-8?B?aG5EdnFQRlQ2eEtVUm5jejFRUE04L0VvTGtHTlVlZ3VrMzhTbkhrc3dURkxw?=
 =?utf-8?B?ZnkvdHJnUThzaFBsbU9pclljQkM4N29ZbFd6OUZTTmhRVU0yL2pEanAwTzQy?=
 =?utf-8?B?bDI4V0lIWFN2WTZvSFdjcEFRaW1Ydy9YRm9sNDBmVS9xZTQ3U2xQZytwbXE0?=
 =?utf-8?B?aUJKYXhFRDNSN09XeFNKWE9QOVp3cHZaZjBhT1RhaVlWYnRrWi83UllEajNL?=
 =?utf-8?B?Y0xQMW5Ca09XbFlEaHRHNXpXTFlkQzIrZ09zYW9PUFVmMGJDdDJNdEJnRFFU?=
 =?utf-8?B?NFhpVnBWeVlwK2ROMVNxU2RQdGVlMklvVjJVQUZMdzk5b2c2akkyYmE0Vnpv?=
 =?utf-8?B?SDZxS0d3MEZKNnd0Y2ZDUFhFWE9kZ2U5YTZOVTlPRDJkcXE1SFpsQU9oazNq?=
 =?utf-8?B?eXFLWXJqeXRkM2htV3JIOFJvWUJnUXpsNVVza29IWmRlUEZIcmhQQVpMWlJl?=
 =?utf-8?B?M2MvMGJFUzgzeW0zQVZwN25HcWdPdlpJSDZFT2RobUViMkFxSUtSSGYvdjBv?=
 =?utf-8?B?NFlENHlyZHkvTFJrU2RDa3RuSFNHS24xTzl3MVJaYVZabm1aSldIRmRNSDJO?=
 =?utf-8?B?S2xVZTJHa2o4RjlULzBPMm0rV1pLRFYzbWJSd3M3eDJHTHVWSU9PcEZoMDVw?=
 =?utf-8?B?YUVya1p0cGhvVHA5RjU5VitVU0pFR2xXMUdVSVJNNHpSNkdFNlFLdWpUM1hh?=
 =?utf-8?B?cDdYZ0t6cVZvMEE0czlRbENYNjdMclNZVXdBSzZaZ2FpeUEyM05iV2Frb2tY?=
 =?utf-8?B?ZThsMmRieEJUL0sxT1Q2SDg3ak5XQjgvTUdkTWhXMU9zcENoVHdTeEJ2RXBS?=
 =?utf-8?B?SU5GeU52d1d0Z3R5VkdqN0dSTnF3dUpCc3prNlBhU3hkUTZXWG90YXhiZmJR?=
 =?utf-8?B?WU8vc1N1YmY4b3NSNUI2bEZ4dFdzeU01dm1XMXp3RElsWEh4WURqKytJSjY3?=
 =?utf-8?B?NndDTVJ0Z3V4NnBIaFMxbmE0VTkwS3RUVXlDZ3Y4MXJWcHp5VE4wRnN4WGFG?=
 =?utf-8?B?aGZDMDJwWWRYa3lRZ1ppbiswV3Q0bmhjRTg4TnZRUG0xQnVERHdLTlRZMXd5?=
 =?utf-8?B?UUxYM2hHTmhZQVlSVVVNSTFXRnZpZ0NLS3VwOHpQUXJ2bjUvWkk0a25kSUsy?=
 =?utf-8?B?ZkpwSVIyS3o0TjliZEFwd2ozcGVONGc2TlozQzhTbkJwMXN4LzFjeHI2SjdM?=
 =?utf-8?B?bzNVcG9IS3NPdU9nSWhocDJWOWIrUWtyVnZEL0RyVklrNnBrSlZIdDhlK3ly?=
 =?utf-8?B?WjRSSGh1SGtWZkRmeGNIZC81MWNucElCU2NZczJvRmh5T0FhMWNLMWxiaWRW?=
 =?utf-8?B?Y3VpaUxsbUQxUG9NL3A5YU5QMUwxL3BTL3EvNWFBWFNlYlQ2a1ZzbitVY2Nk?=
 =?utf-8?B?TDRmblRBaVZpUWlieGRqOXFsNmdDbUNTdXdMSDlURHRkeXNQQ2dBYVp6bDF0?=
 =?utf-8?B?dG41Ty9qZkxKb0VHcG82NktTMlFEMnVhLzIyOGZic3plQXZyaEJIQWF3NTlC?=
 =?utf-8?B?T0dONy84VzRRMy9FSGpWQWdUTS9ybDZXd285aXEwZ05HU0xKaE1NT2RXUzlU?=
 =?utf-8?B?ZkhpZnJJUmQvejRZUlczMFhxeStqYnZ5NkZaMUR0VW03RkY5b3RQcXhzaVMv?=
 =?utf-8?B?d1h4T2tJcDZnWlFhZjBsL0NJbVhXdTNGdzNxOFhwOEpTZVd3QzNSVTVzUm01?=
 =?utf-8?B?RWJpNkt2OXRYUW4xbG02cTBwM0tuZkRHVFI5ajY1MFhqajY2R1EvRjRMYVcr?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac0b911-cf6b-4723-e489-08dd393e04f8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:34:29.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MO3wxFjzqGbq8fMNs5Hx2Fa0D1IdtZ3+WLZ+e4DUsMo5U4UVp0KRS8Bf0M4SR3MHK/qvZ2871v2HT0ucvzEBBFBjs0yi3G4+DrC7FJrG9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_023434_963447_D90F3EAD 
X-CRM114-Status: GOOD (  20.29  )
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

Hi Quentin,

On 1/20/25 10:23, Quentin Schulz wrote:
> Hi Michael,
> 
> On 1/20/25 10:07 AM, Michael Riesch wrote:
>> Hi Quentin,
>>
>> On 1/16/25 15:47, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> The Edgeble NCM6A can have WiFi modules connected and this is handled
>>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
>>> NCM6A WiFi6 Overlay")).
>>>
>>> In order to make sure the overlay is still valid in the future, let's
>>> add a validation test by applying the overlay on top of the main base
>>> at build time.
>>>
>>> Fixes: 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble NCM6A WiFi6
>>> Overlay")
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/Makefile | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>>> b/arch/arm64/boot/dts/rockchip/Makefile
>>> index
>>> 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..3f92d1a9d0b6efeee46ad4aff8c2b8ed3cb83d73 100644
>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>> @@ -134,7 +134,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
>>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
>>> @@ -163,3 +162,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
>>> rk3588s-orangepi-5.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>>> +
>>> +# Overlays
>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>> +
>>
>> Maybe open a new section "# Compile time tests" or something like that?
>>
> 
> The above line is to compile the build-time test of overlay application
> (notice the missing o in the extension). This points at the target below
> (which ends with -dtbs), which does require the dtbo to exist. So
> essentially, they are both for the build-time test of applying (and
> generating) DTBO. I feel like this comment/section would add to the
> confusion? I may have misunderstood what you are suggesting, can you
> provide an example?

Thanks for the explanation. At the beginning I was wondering what the
point of this line was, and thought that a comment that explains the
purpose of it would be beneficial.

Maybe it makes sense to provide a section so that other contributors
know where to sort in their tests, so maybe

# Overlays
dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
[...]

# Compile-time tests for overlays (and combinations thereof)
rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb
rk3588-edgeble-neu6a-wifi.dtbo
[...]

But this is simply a recommendation.

Regards, Michael

