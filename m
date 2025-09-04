Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCcWtpdlJKSefXOKkeGMqI6Ln8NCOXsGs2mWaTlWTfo=; b=u2tE5MfBNH9p4I67apuDSdwXj8
	9Bn0C6GyJqb1Hmcr3kvAxxsv045CW/NTamh5/fSipvlnEfnhlaTcjjFD3sysW6DSfnSASLYPnakhS
	MSJOLelTYIHVOX3Yint9+YpRa5tQtbeX1ndL6R/G8fsiQsmZDhtj1pnZ/eSif1Qyk6VDOs/X0KdR2
	UulA1//ji1zG7v4/+54toR8YafWgslRj1XUdDypp1uAJhBzHWb3VVm/Vk5Fv4rZP+SebhYEW3oEit
	OJixK5RkzCyszBQ/3M+Fsk7gIHWiVVEDANjsTaNMh49RSf9pgXw2VEOXEvLAk7QgQspi8BkqWuoWJ
	IMsjPyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu90r-0000000BXbK-3Uh9;
	Thu, 04 Sep 2025 12:24:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7PS-0000000Axnx-2yQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5VodwsRS2udhR4CWqQSGiG1h2w5byHq9IFVqYB0Jcdvff6Lf81P8dbU8UKQ0q3txcGrEKx7XFf34VRx4fAFcj1tuPfUtptiEyeuROPvxsr1tEgG90klwCqWLmx8QU4qvoeXJIC9ZqSQbrlrECypuT0rkJ7BPusoVkbO5TJlEl63TNuZxA3cgWJDsE54KzPxcmt4nEzZV4DBm6euOL+OYB4CA5G5PYVNAIcM859QtZUbJMDJIzlkpWzBTwO874bnvgvfvmHNzcAMKIwzWcv7v/S/0Wbr8RxNG8eoDHpbS5F+tKgj/etEjJIQfSkTfmIKAFDZcHmLAKxiCuDSs+mgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCcWtpdlJKSefXOKkeGMqI6Ln8NCOXsGs2mWaTlWTfo=;
 b=L8U9Ga/0u8zhguoY4wizbnQYUhg6LNbzVKRDGgexRK2V39nnzNsExBPymYgdLaCGaegEKr9pj2fW8Ut6SezY9fdDUBsFjAaaPws+JWgVPZrkFjyF+OE3VC1o6ZMO5r5lp2KqzSIQaLo9qMQyVKeAA2kJb9pSi6U6fvL8yg2MPJHIedjzvFhuuubfue3p1VIhoxzR87OFYwzrzKUmMJcaIg3vmgraWX1ZHBGvju9REZD/OE0tXwgg3genTnIExnDEuJZECGI2ZM85GEC5O5z8LbR0ht4lKLAzjB5dE8gkLNlTq8K1jbjDMbNcKc8lLGcZVlxb81O1V7A0OLHFsYkvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCcWtpdlJKSefXOKkeGMqI6Ln8NCOXsGs2mWaTlWTfo=;
 b=RrY9LU/2JiegRqg7kM3QJ56tIV3vvknoq3V35uhWHMXdy5Ibb/wb1geMJCzP6loWH9b5FF+rsJ9bGLoGPt0FwGwg1A+LLJvV4bFh3MQy0Qf2y/0dw7EBqz7pICTpbENlRv/ifQe+12oIFJL7pEE2PJagt9MMSTS+wtgmeoL2iz7ylIGUh7zkc4i/NZL5zwj+oVsZrZ+F1gH0dvtIBFHbwVN3KJX9s1rYjnqN120zlbQUGoMxEbcWKd86xRTunJ1xE2qBGr6HuCUFfVIB95ohz0/9OtfCrKA0mctQW8QmS5mIU2Zdkk7Tb/57IMVjWYx6KBjuplcww4+5eADstXvjpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 10:41:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 10:41:37 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 0/6] firmware: arm_scmi: imx: Dump syslog and
 system_info
Date: Thu, 04 Sep 2025 18:40:41 +0800
Message-Id: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlsuWgC/3XNzw6CMAwG8FchOzuzdQyGJ9/DeIBZtAf+ZDMLh
 vDuFi7EqEl7+Jr8vs4iYiCM4pTNImCiSEPPIT9kwj/q/o6SbpwFKLCqgFLGTnYUvaxHkklLZ70
 yyhclr2A0Bmxp2govV84Pis8hvLb+pNfr3yoeJaGpqtzpFh3Ycz+NRz90Yi1KsONSqy8MjL3By
 ho0eYPFJzY7dj8+G8YOfMWrnbb1jpdleQNH3UE8JAEAAA==
X-Change-ID: 20250627-sm-misc-api-v1-85c030c670c6
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756982492; l=2707;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=01nUeA3pWR+A+945v3rhqC7aNThGBJtQFlHcVEqE+o4=;
 b=nkCuygOp6ugb14isSwolhMugluTEZF28mjq0xdKfxaHtncVreZsfXnJLc0vnmWvuYtSkrjRCy
 Y3YDonTr4eUAXTwNw8V7330EqBT0ktspv9VzC7G4OjxQ2KzOORoYNIh
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGAP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: d1717620-4605-44a5-b39a-08ddeb9f9fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDJwQWtUR2xwWWxmcFNUbU5POWFpTlBKd1dLcEdJdVAzdDZsdFlqdEgvSjJI?=
 =?utf-8?B?WlIwRlB6YVRwak1qUEJoSVdJSU14T29LQTdrcHNCemJPa2EzSWxkYTlKL0Fi?=
 =?utf-8?B?dzJBOWRZN2RiQXpXRzVSYXU2c2dlOWpQeVc0S0xmNDY5MkwxbDRPVXVwSnRv?=
 =?utf-8?B?QU5LVmYzQTRoL1FPYThFSWR6Y1NXNEgvTnJnSjF4a0RLbGhSYkh3TTFpRHNt?=
 =?utf-8?B?dncvT01sWWNsYjZvU2VzdEJvUmlDakMxQ1ltQllOQmhVa1ZocWRTajNYWjdq?=
 =?utf-8?B?ckh0WEY2TGVXdzJDUGlYUUduUXFjQjhaMlI0K1hWQWJBWDNiTTQvQ3BlM1pN?=
 =?utf-8?B?M2YwZzY5aVBjQUhKV0JxY0xTQ3hWeXlOS2sxOUNsc1o3V0p6Y0hOVVZWL2lN?=
 =?utf-8?B?VHJ5MFg4RFo4R0lxU3FWSGNjVjl2Yy93aWU3NHZvS1MrKzRmMG51dlR1UEVL?=
 =?utf-8?B?U2tyeE9kaGxNWU1vWERLRHVFS0tlTUdBbnBBUE1zbENESFR6djEzbXA3c1lv?=
 =?utf-8?B?ekc1MjFoN3ZORnpRdEZDWk1Wbzl1ajBjLys3WGl2NFBLOUJYaEdWcFh6S0ls?=
 =?utf-8?B?WlZuYmZEU1VocXRPSXcrVnNQZWFwRjk3ait4bHdLMEVMRHBIMklLSlFGZzlp?=
 =?utf-8?B?N2EvU0VrMGtNcitsWm0rVFJkcnNhcmdxOHB0UHErTjltditLcHBCMHVvR0lR?=
 =?utf-8?B?NkRQMkVCR2FweWlaZmRZcmtoTUM0ZmpLWWMza3BsVlF4WGlFNTlXbHhwUmlt?=
 =?utf-8?B?QkRXUHlNaDlSbFd0VkFja2V0VVhwZ0EzbjZ1Rk5LNlJneldSZ0pNQUJuZVNS?=
 =?utf-8?B?cWxTUzRFSCtFRnc5cXhsbzRERElLQmw1YjBHV1J5Ukk3YmMrUnBRRDZaQWRh?=
 =?utf-8?B?TlRianZVRFVsTE45cDhaWmJxTlljQ1ltWk5VVkduaTQweURPcFFGWjhNMUFW?=
 =?utf-8?B?SDhubDlaYkJzT2V3VTI4aktZQkJ3RGl1enJpWDVmWDQ1cEdkL081N3dzUU0r?=
 =?utf-8?B?QmVhTkJlMHZqRlpKUFMxUXN2elRiMlpUYzZIamgwTlZhai9Tb3FwOGFhNnVq?=
 =?utf-8?B?ZnJGalpsUWJoc0tSdGI0bjgxYU5ENUNiOFhWU25ndGcweFAwdnFqSW9CbmYy?=
 =?utf-8?B?RXdVRytwYWg5V0pQckxFbTc1NFpwS3R2cHNIb1VYY0ZiZEJ6UmxiKzdFT3Nv?=
 =?utf-8?B?dFN3cFZyZXJsdm1kbnhIZFd2SXg2UGZ6QTRRM0hKeFh4WENCYTZSbzc0Y2RJ?=
 =?utf-8?B?bmI5em9WRitzSVU0ckdpaEswaG5ZbU1uWG9sTDVNd21BTmQwNTJlQ0h1bUtP?=
 =?utf-8?B?d1F3Rkg1VUtYUEhwZm1zTUVoOS9ydFlQdC9mZ0h4RXd3NCtiY1Y1Ynk0WUp0?=
 =?utf-8?B?TmJ3QXpwdzZ3QTdNc2dmUHVZV25IYWVYN0ovV1g2RHAwOEpnSWh3OWlOT0xt?=
 =?utf-8?B?UjdPOVNpcmtGNWJ2MGhoOEFCaThtL0RjaVRDakY4TVRoSE1idE50N0ZyMTNh?=
 =?utf-8?B?UWNGUi9aeVgwVEVBOGs4MS9tbkZoYXErbGVhZFFnWWFGb283RC9tdkxjTXVw?=
 =?utf-8?B?OUxUSmN0cW5CV08yM3RNd0cyZm9zUXZGbVQrYVFhdXFmL0RrcUpSRmxVR3l3?=
 =?utf-8?B?SXVHYVZZYkhiT3E4bEs4a0g2dko2WjBZRUl3WXVmWmpGdnI3Qkh4a3hNaFF6?=
 =?utf-8?B?NUJRYUU4UEtWWlovcUdaYUNXamgrVmphbC9lRy9KVFlqeXFaeFdqZnUzNTVN?=
 =?utf-8?B?QjJGa1RMRlkxQndMTDJFRTM5REh5YUtMc2VYUVFZSWV0TGtCVWcvaU1lZUNl?=
 =?utf-8?B?UmpZTzE2WG1pOXlKNFh2U1hFY2s5SjREVHNkMzhCZTZRUnFBallib0tTZnc5?=
 =?utf-8?B?SnM1YXdTQ1pCQWNKa2pnanhKSGhmY0hXY2xuNmRobUZGNHVWWE8zS2Z2a0ZC?=
 =?utf-8?Q?8JxzprPsQB9sdOUs8X/wRHs7SimlY2W2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNHNFN4Z3FRMEZ3ejhLZW04YkU0RVVEMHorS2w1N2dRekgxOWdlQk9ZOHVK?=
 =?utf-8?B?emNObWJhL21PeFI4SDB6c3R2NzNMS2VOYmo5M1lLd1ZyZmhiSlA1TDNUeC9K?=
 =?utf-8?B?amF0dEJVL1NKYW9oSUlsNTQ0ZmRVUm52NnMrdEdOVFNBMDd2TFd3a0ZhaldG?=
 =?utf-8?B?VlVBQVNLU3lmV016SmJHUHc4T0RkbU1UMHZ6ei9vNFMrOWxla0hXSjI5dW42?=
 =?utf-8?B?cGdHZjNUM2Z5aVRNRDQ4SGFMM1EvRVgxcjF1NWpXc2xKQXF3OVlUeDhSNnBi?=
 =?utf-8?B?azcxREFOeWdEK1FQQUUrdC80SDhlSStEN0wvNEcrdlhaL2hoM0NEL3JjQUlr?=
 =?utf-8?B?dXRFcGRRbFVTRElsNFkvZ3o1U0hpRGpqcUVUL3NHVHFQYzR6ZDBXQWRlem96?=
 =?utf-8?B?Rzl4UG5GUDNsS0lQY1piRTJkTDBHaVY0dTd0Y2N4L1paK1pUcXhBRUUvK3p1?=
 =?utf-8?B?WmYyUmR0djZ4MXlORmVSU0VUSzJ4U2N6RUYvbjYwWFVCWkFnYy9NdzNETlRu?=
 =?utf-8?B?QlhySUljSUtobW44UEdHZE9KMENGL2F0aDdHNWpqeG04Qkw1T2JYcWViTHRP?=
 =?utf-8?B?TnlEUFZyU282N3l2S3pMeCsycW5FeExvM3BSUVE5VU94alhNMnFEU2R3NGlw?=
 =?utf-8?B?cmZGYkNvdGNhNGliMUc5RFpJWU5hbnB3dGNxTVhOQ0UwSUhvdldtN2p6bzRn?=
 =?utf-8?B?NzU0WE84ZWg4ZEVaQ0ZJY050bm90TXZJWENPSEpxV2RUL3VsaCs3RGZJTVdk?=
 =?utf-8?B?Tk56UnRzN0kwSG5ONHhCbWhtUnpHQ2R4Q0hSeUpyNFgrVXBCQ3habzhzNDF2?=
 =?utf-8?B?QkhtNEFaRDg1Z1drcUZ6NG5oOEJtdU5JMkIzeFlpek9Ub1BDNjhrNk5qU2xv?=
 =?utf-8?B?bXRJdms5STB4MDFVbHJLZHBnWjZ1dDR0SFYvU24xWFBJRkt5YS9SeU1haElD?=
 =?utf-8?B?VmwzZkoyMHkva1E5a2lBaFB3MUNkcGJacHZYZTI4WDl4dTBmalgycWFwU0d0?=
 =?utf-8?B?bnlkeGlhb0NST0YxQmwreTRCZ3FXSXlNUER1WXRyemRMT1ZGVjNic3NJQUFr?=
 =?utf-8?B?cncyNlplOThBTmdScnpHcjNta1RqTWpyYzIvenlqQTdCYXB6NDlxQzA5YmJi?=
 =?utf-8?B?Ylp1U0ZrV1N3M2FpSGVtQ053QzdkWkNreVZndTFubFZDaWdubHdPZVBGYk5m?=
 =?utf-8?B?cXhoZStKcGhudHd0RTR1Ukg4MG45OEJUUjFhN1llSzUzQ3AzZTJWcTQ3YUZv?=
 =?utf-8?B?NjhXVE1mZjlSNDVpQUZBNkV0VW9lQVIrQm50a3VqdW5Xb3NnbkM1aFNTYkhp?=
 =?utf-8?B?TjZyMXZ6aER6b2JjQy9hWlJCMVRVeVl0L094dXdPck1JSkU2TmFrL3dtOWw3?=
 =?utf-8?B?Rkxsdy9HME5nMmp2NnZvMFhzYkpiTDRDU21pWjhhQ1Z6dTNRY3NacE5yTUww?=
 =?utf-8?B?SUhLNHRPZlRHZnVwZ1pZcUd4ZmNKMWJGVmZaOFZQckIwSzQ3eHRLZWQ2OHkr?=
 =?utf-8?B?RG1QVkE4UEMwV0NVY1NVMjhRVU9pYzVwNExwdjM3czd2S0JmeWhzY2grcnh1?=
 =?utf-8?B?ODZ5VkFMT2ppek9EN0FKQ3ozcmxIS0o5ZktFeE96ODdjdm1QYjdzVTJGUHAw?=
 =?utf-8?B?bG9STnpxYVJWeTVBeWhxYnZuK2JWRjVEVlorbTc5SnJRMWFuQ0I3anFuZ1Q3?=
 =?utf-8?B?Z2VadDE0Z2R3RERuVUgvSkdwaXUvOEhQUVN1bWlhQVBFSHpBRTZCOWFCU0ZQ?=
 =?utf-8?B?RnNZZGhVZVZKaUtYTEFjVzAzVWkxVXFWYnlrQ1F5Tlc3VmZQNnhTeGFKaEY2?=
 =?utf-8?B?bkhOL3ZoTGR6dTI0NVpHNHdBZnFuREUrM003SkJrNUdoc1laZmIycU1UVFFi?=
 =?utf-8?B?V1FXVU5uQXVpWXIvVkZDMVJqdlZhMHYyZ0IwVGlUbEFWd2txbU51cm9RMXZ2?=
 =?utf-8?B?UnBLa2FPYnlkYlRFZkVqN25iMmlTQUI5VFZNUTF6NHp5d0tlQzI4Y1duNVhw?=
 =?utf-8?B?NG1pdk9tRU40S05XT0wwVUN2QnVUT3UxeUdoYXpVejR4anN0WWMvNWwvNDRl?=
 =?utf-8?B?SXNNZzN2a1p5Wlh0UVkrK3VFTjVDaWtUM0NXc0hMN2xzbVZaZUE4V2orVmo0?=
 =?utf-8?Q?PW0rCxj2Wx/B3NQF6ySyweG9D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1717620-4605-44a5-b39a-08ddeb9f9fcd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 10:41:37.1193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey07NEyxkle7L9pN85onUzisqFU8pAlp5qdEU3Y05mO3rwePZ0hMO0FZ/vfqTujGrZRZZRKk0BtBOxdWkv4NNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_034142_809501_BDC97D80 
X-CRM114-Status: GOOD (  11.68  )
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

System Manager firmware provides API to dump board, silicon, firmware
information. It also provides API to dump system sleep, wakeup
information. So add the interface for Linux to retrieve the information:

patch 1 is to add doc for board information which was missed before.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Patch 1: Typo in commit log, state the attribute is set to 0 by firmware
           add NOT SUPPORTED return value for syslog
- Patch 2: rename to scmi_imx_misc_build_info_discover, add -EOPNOTSUPP check
- Patch 3: rename to scmi_imx_misc_cfg_info_get, correct command order,
           add -EOPNOTSUPP check.
- Patch 4: correct command order, add -EOPNOTSUPP check.
- Patch 5: correct command order, align command name in doc and driver,
           Use u32 for consistency, add comment for sleep record.
	   Add a comment for iterator run "saying propagate -EOPNOTSUPP
	   to caller".
- Link to v3: https://lore.kernel.org/r/20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com

Changes in v3:
- Add R-b from Cristian
- Store size, per Cristian's comments in patch 5: "*(ipriv->size) =
st->num_returned + st->num_remaining"
- Minor change in patch 6 to add size check
- Rebased to next-20250826
- Link to v2: https://lore.kernel.org/r/20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com

Changes in v2:
- Add more info in patch 1 for documentation(attribute is reserved for
  future use, boardname may not align with the board name in device tree)
- Drop dump silicon revision API
- Update discover build info, cfg info, board info API to be only used in probe phase
- Update to use single sysfs single value for syslog.
- Link to v1: https://lore.kernel.org/r/20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com

---
Peng Fan (6):
      firmware: arm_scmi: imx: Add documentation for MISC_BOARD_INFO
      firmware: arm_scmi: imx: Support discovering buildinfo of MISC protocol
      firmware: arm_scmi: imx: Support getting cfg info of MISC protocol
      firmware: arm_scmi: imx: Support getting board info of MISC protocol
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: imx: sm-misc: Dump syslog info

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 194 +++++++++++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    |  24 +++
 drivers/firmware/imx/sm-misc.c                     | 232 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  23 ++
 4 files changed, 473 insertions(+)
---
base-commit: 8e5b06f3b616530c57cd765b769c5ce54aaa6da7
change-id: 20250627-sm-misc-api-v1-85c030c670c6

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


