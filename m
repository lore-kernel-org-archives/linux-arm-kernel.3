Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21455C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=; b=qa41XHFeh1Qfak2sGyknkqV4En
	Y4Y6qyscuZxuPoWZPue42JrAW/23wFCC9iBNK3HMm9wAzkJ0EMAYo9YXg+ds2prPig0nHc8HSt0s4
	2ONRu7KtZrDbE9ajfQpOnPpWa24fXvsVmmPNngdofCoSsbxmXhmIVJyus/UQg41s3icfuNlLTO+i2
	hMqN/a0jjSHEJ3OVlJlEHbhl3p4dGCOzjW6EN6bIgsLBhcdX9SWM+GoARts4eCGoXWjkMZ+CzJ6WE
	VsNoWWks9WWXt7Rgk4ZjsmYsYt1kN3Uvi9NPT0q4c4SX/0oGxFTcwfBJG2MP/2pM/A0sv7GJl4VVS
	BWaZfIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5M0S-00000000pCl-2SaH;
	Sat, 12 Sep 2026 11:34:52 +0000
Received: from mail-westeuropeazon11010014.outbound.protection.outlook.com ([52.101.69.14] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5M0K-00000000p8S-3C7U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 11:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvnW8teaI1exMwRtH50eH4hx6nACzU0CufcsIOmo7ZdFavRijy7JSss5IjFXYBl4bTrVvrkwDHIySv4FNJavDwrZ1KJ1n41AJTG9MAEodAeCE1hNKWVukx54AgLLvUOyZVnLM8nXjcCJMlgWVyHwLJYLyB3wHU88C2P5cS2xqIPuc5q8zzHBh55LZh3zZzssl1UAV0DK0PQcEGW4iHX5SNba44hWltMIeiEhYKElT4WeFvn7wwpSr/ZJ1gFUvuyj+0nE9Q9Ik8AaTxnklpsyJ6zeY8R1gAD4wub4PJvAHzWdnnCXoiTvMS+p3PNYKkqf/GSA4Oxys9sVV5pa2lojYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=YghOsy3DS3RlQABn7e8yPBL2CxmTbEPZ8k6ZNMxerAXEG/44T7WHx+On9wrKpqWa4VQ/BlHGiaY+r1jNPMLOKJlMHS6vyrNiv0WDp2TqI/rvdMbkkDMt3qMXN7WYvFgpA4bOJth4tBfSUHGQw5La3NVh0GsQILuctjR5b+1PwStPdvDHq8wo3/cRMQhVlI5txiRQ+IrBeUCZpiOOpF7EQxI0nVek3HWH4RFM8zPk9yn6fxqa6UOF+UJaFnaJANjXB5G6FyrWDlTq+aQwoi2FmZQEUOt74/R1Ejf28qODV8E8Jx0OV2JvpTnkCdADaUaIBXiI2l3Xgo+ki0one2C3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fzKfhwDcaTF4Rc6PrvIQT35Fp7VgjXMGScIyZv6EcM9+qAdJPxrbbgGr3rzjHTmZ9PncRPRXDImI4Ri62RFh9xPqEWPN7wEd3KpUvNhN6ehfas0ZmD3NxQgwEvIU6YEd2WiqEmomwk6zSYnlff99zcjVUYvQfxEIPsYCeuOSttglpNVBfM8BSTRQ5YkC7hZXlJzwZahwE9u68PHolO4XD5lY20+wq2/R/OdRxKViSbjdy3DP/5/nOaa7bRh19yBDrkhnOdiY9klUFW7WvESrl2DGPqjtLwG21lFqw9ly+KsYgK2cbLRfhSHmEcNxvok5Zno08+HsUb7bUG1n4Tgaog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by ZR6PR04MB466071.eurprd04.prod.outlook.com (2603:10a6:910:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 11:34:40 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 11:34:40 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 12 Sep 2026 22:33:36 +0530
Subject: [PATCH v50 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-imx-se-if-v50-2-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
In-Reply-To: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789232651; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=omBdAjL9PrTSkpVvXnhWe4dCxy6KjKWbUtzhh/8GPaNIeN7R2PwtKXCxgRfwylwah98MThvN6
 DAUWNsSryUoCgCpTWD1k/5oMZOgG++p96JazhNKH01euCx9du9vuQ9I
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0252.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|ZR6PR04MB466071:EE_
X-MS-Office365-Filtering-Correlation-Id: b14dbd23-8d0f-48db-b827-08df10c1d55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|11063799006|56012099006|6133799003|3023799007|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: yIN5mjCvTAAGt6vdLQy8kspdrr8b7+1mYx+GWjffGnMDjMHPPwGlzUVTnswBwVNMQH4JBQblHqJ0WxdByMlpY9LEZtQybaH9kbKL4EcgImNV6E4gVWZdmeI3c4zx6bIe0TT6pmkHz60ZjoXWeSwQXpQpkk+48RKUyvwTB2p6QwqYc6pczEtsu4bWRryAOGaVjJBGAsF6bXgPex/Y2VbYC7/UJAyh9hsLoan+vooLbRdIYL8IwtMrVGhrj8bsgh0FOQ2E4+qztu1ncjS0Kni+esKteUaBkGLzKFnBCaI7veteJQ+xE8XyRtjaKi+kwF4t0QxxpBjP0fzTLsDsuKy7qFOdz1WP5YYe8rz13iJSBFg+0BycHWz6uPjuhsHRSIgiGIgctNVVDFmq3ERJ3Saw1zM0GqJkBC4CdVaz+e9egt0k+scQvPKdkRvFP/5OUKwjI+VrNINln4nv9LcQVNht17mtXcbGQ6/KSnVhpFrXf2tS8hYA0ukB+dXomoKGiN7lgxDjSRWdClUZKd0agjCIAQbDVuZGCRwWytlkGkCWe26CBrcukmUNsOQY5LceJGx4S1hH+0K09sHG2BYFWbzVm20Gi1PkLnEUtzyKn2ClIJagtDy3pYZw8AxZJIc+xS2FdZAm8AHo356xXz8N77JCYOJBz1Hmf4SDhfKy8aInORE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(6133799003)(3023799007)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnlhakhicFFVdXBYeGdYZGJaZEZvdUdZQkRHdGxDcVNJMElka3Y1U0ZiaEJQ?=
 =?utf-8?B?czlCS1pZYWx3UG90SUhTS211bXBhTGE4UUx6MTV3RUoydHlFbTNiM0VwSVBy?=
 =?utf-8?B?Z0ROS1YrTWVWejFiTDRHcDZIemt4cHlMRTNxZnBXMzZoeEJqNDFxdjc3ejVx?=
 =?utf-8?B?Vld5TzM4T2ZkbG1ySG9zZ1dncmVUbjg5QjhabVY0WndTakdOaHRSTnR4aEN3?=
 =?utf-8?B?UHVjaDc1N0NMQjlrM1NYY1dKekUzUWNabFFEVjQ5R3BGZW90bjhmUEc3azNJ?=
 =?utf-8?B?Z04yUzBFY1RFaXg4Z3Rac01aZ3lSanR4YWI1OXJmNmRrVFlIYy9CUHhXbi9m?=
 =?utf-8?B?YXRTNHpaQTk2MmlMcEJVSVg3N24wKy9lVUN0SExvOXBmZ2hhbml4UnFaUDZa?=
 =?utf-8?B?MDM1Q1RhbFd0SURvclZtTmFrdlFRNnV1VCsvTWdXRlZ1YzdlNnBmSnlyVUk5?=
 =?utf-8?B?N3c2YWdBZnRiWkVMU3ZRVnRobmZWTyt4VnZadU9sSFpHUkZHMXYyekFXdDlM?=
 =?utf-8?B?YkZVajFyQ0xjV25Yak4vTEVWdEEwMG80NnlWR2doMHZzU2Nxc29nVnd4V1N2?=
 =?utf-8?B?RmpicjNXMG8vcHZLakN1UnkyN1NBTC9iUWFoVnVRZWpnZENHSENpeU84bWJz?=
 =?utf-8?B?M3RZaWNweGJsYllzSSsrVHVEeXE3cjI1TEJwcE5iK1JMUjlvbURtNlFwdVdN?=
 =?utf-8?B?MHJSYkNyS3Z4NU9hQlludXBCWmkrNXlTM3gzRVZBbGh5dkt1V1J5L1htczMy?=
 =?utf-8?B?WVI5dTd3UEw4STRpczlocHREMDJsUnpON0QxdE9DUDhBa094a2lsN2Z3Q0sw?=
 =?utf-8?B?NG5QenJrNHVZTGZsRGpzMURsbG9saG83Q2E2K1RlUnY5dkppN2l0STBOYnk3?=
 =?utf-8?B?cWVMM2xpQnNYRmlSS0JFdURaOXJENm5HNHB3bnZHU2RlUTZ2VGRGc3Q1Unc4?=
 =?utf-8?B?eUxDdy9Ndkl5cGVGT1czeG4xbTJ3YU54VHNBcndSMk1vQ2J4L28xZjVrWUIr?=
 =?utf-8?B?dkxCZllHbG40MUtPNThNanJjazFwNW51WktaWklleWpqWnBRSXU1V3dFVElN?=
 =?utf-8?B?cGdwSVVUT0laYWNST082TjM5TUhPajFzcjhUb2tPRCtadFNPNnY5S2EvSFh0?=
 =?utf-8?B?YjBJVFhlUTVBNHgxK0hjQVM5RzByNkNUajFJYmZyZnkra09VZEd3cndZS0pr?=
 =?utf-8?B?Tll4c2FZVk4vbnEvUFdXYXoxRHh1VlVJSlpxSUR3S0FRb2dvTlU0T2hSMzdZ?=
 =?utf-8?B?ZEVXaHpab0tGMGhwbjNWV1R5dWF3S3NIQURBa2orMk1UNkpzR0JSSTJrSzgx?=
 =?utf-8?B?K29RMFpiQU9MMmdFQWIzMDlWaEJJaVpJbTlzdU1RdU9PWmw4TTFoeGF6eENr?=
 =?utf-8?B?cW93dmJnMEhGVWw4WjBvcWdRNHUyTHVhYUlNRTNZSE5wcVBuRGlRUDhUN2x3?=
 =?utf-8?B?ODd4SzBXYWl1OUNZeERSbXRJOXVlTTU4SVVlZEd0alY2UmFVTUJGdXNNaUFP?=
 =?utf-8?B?QndFMmcvcXc2NCs1VHlqWHlTTUhNZWdud0pleVcwY3FSUGkzdmRRUERtOXV3?=
 =?utf-8?B?aTJZUUxzekRhcytaQ3NDallhNDFZZENXR0ExTVF3enNFSFRlcUZwWjY3SVg3?=
 =?utf-8?B?NGY3d3pNZk95KzFkbDhGQ2hBLzZKUXpxVFZ4UkYrMVhtQmFlK3VoQWFlRTA1?=
 =?utf-8?B?NmN4YWI5aHZWODdxeE5LTGRZeHZGdTNtTzUvZnE1ak9RQzdPSUNGSmtuWXlH?=
 =?utf-8?B?RmFnL3d3eUUxNzEzOTJ4Sm9oaUFxWHZydWpFcXVjZitsK2VrUUdWbHFlWnNE?=
 =?utf-8?B?QjZObkVNUCtvQk5NelNKSmlnb3Y2Q3BZbmgxSVd6czBEWWR3QlYrR2hScHNq?=
 =?utf-8?B?Y3NVeEtuM3pTNFZrNnVZWVlFdjZWdk41K09VV2s2ODRiZU1Mb2pHUXh4WUN3?=
 =?utf-8?B?Vk5EcFh3L0I0cjNPTVNpWkdwbzdnTjJhV2ZPUVlYcGk2aXlweTZ4KzNrWXU1?=
 =?utf-8?B?Zjd1YkViZHJPdWxQWUFYV1hzR1J4alU4Y3BvTVA3Vy92RVBoMTFvZkVWQkJN?=
 =?utf-8?B?cEthcHVGT2NOSTZvZG1oOGNlbWt2a0xGWWk3M2FOc3ZVdzBOcG5TNWdSd0ZO?=
 =?utf-8?B?WU9wOGQyYkFDS3F6aDM1bG91RDVDemdMb1JoYW9zb1p1OHJLT3hEY1VTWTRn?=
 =?utf-8?B?M2p6SVhQQ2FzZUhjU0t2N3BjU1ZpZ2prWGZ4OXpQdS9TckU1dVdmRTNwUWNV?=
 =?utf-8?B?dGRZUXlXVTdBUjBtVGUrenl1U0IvbWhlczAyRXlqcXVKbm1rbkd2ajkzLzk2?=
 =?utf-8?B?cVVPQmV0UFJ1dTM4MDlFMDBadVg4RHU3L2RmS211SHRuSEVsRmxjV3FuaGVh?=
 =?utf-8?Q?8CTsLRCRV/svPTH0qlkP118uOY0SnROc3vufT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14dbd23-8d0f-48db-b827-08df10c1d55f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 11:34:40.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0kw2lXT/DahZ7FRMNwtTHc36BFdzN0dQvFPGE8zeLkUEJpj61sZKXb1J1gX39iyTg1Q5IZgC+QiyWINWbil1Sv3o6JvNWYvRg6P72Rin3j6g2XsVigMEbA9kzkeynR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB466071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_043444_831807_6FE51919 
X-CRM114-Status: GOOD (  12.40  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0


