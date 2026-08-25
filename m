Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75504C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5J9BdUtVDJKIzi6VQmcC7yQ2naLO19vZEfAaP+pIdU=; b=teAuSAMnS1bYjDvpmqmSpSK28N
	yABAq7AnHQkix8DBDvdrNBz/8ASfv7ZOZiAu0gcLoI9W/PQnoSkxjXze3q9HJFZVAeZMTH9tQ8Ss3
	mU07I8tpZaExLr5gBjmeVT4KmM8Kn3fFcRh8H+o7MytUoJC8hmDPtE3Q912Gzn7cxdtXNWt2TFCYv
	HZIXsnBonxLtxt3VgW/PPwQgnAIdQ+bKx94dLTTf9OvTovrkspxCZVmIC1C7yjRFakvg4Ho8o9xxk
	YLq7O5Y+O2vzQMRKZOCB4XrXkg9QSekIA2xNfUf859yCaVRKdyZ0h2zh35sgkdpwib/8kB+dvId6G
	QgYFvnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyw7-00000001YJO-0Ad6;
	Tue, 25 Aug 2026 21:44:03 +0000
Received: from mail-westeuropeazon11011021.outbound.protection.outlook.com ([52.101.70.21] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyw4-00000001YJ3-09w1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drcSGY0l7CRy8PD/nGdeWaNN1y8Ti5z2Vf2p+8SYGsewOPgwe+003V8IooSUu6YDp7PBxBSV51RzKxzoUnzfDxnrpZKn/tWbK0jMwX+DywfkPhph7hBLpMSMCkhIPOMeLWhDAKnFyWWU4rRMZUDB6HO0/luWkYUUGTpj08sKy/e+4qbAZNZRQPeFAXIj370YYs7pa2s17MEUu3gv3z/hFB4ScesFVNRouJ2/S4sEUsGPkr4qxb+ThebTEE3Cwbrm/vTXdq4YK1XN1/c5pKxtBDAEifcwAoEKgWqvo1JLjSvAsUX29OdZutzuAHDrZmKWpjIvOpkDgIP/hDp/XxwaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5J9BdUtVDJKIzi6VQmcC7yQ2naLO19vZEfAaP+pIdU=;
 b=iwhf7n1k3Rs/vLVw8T0zibCedAWuRh8jiK20nZhFR6qCyatTok9J8naSf08gL4LBJijlDYS5dWN354GhIOkyUjERvxAgpo6bUaLgIFEyfciSOWa0w44DIhjEvRRpZJJNI/6uZcVYYrQZLEHzIGBKBT5rM/f0DluugspAumnvkznIMQ+7IjY1yvIBey9RdusxExQ3X0NMOXSCZt+wFGudcz0ZhHvgjAoktgpT+RGr4UlzJ6BDvBblGDpYwv3N7upWNNJLgUe6SWeQxqWAOFeU5MK4dX/e/S+nguPJTSRYth1tkoHJLPYpihtpvjwGEJNXafbOxHAVi12WCEyidKjDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5J9BdUtVDJKIzi6VQmcC7yQ2naLO19vZEfAaP+pIdU=;
 b=j6YYoKFszTwtPwFdZxp0Cj0EvtGakWzrTZv3GvW2KiZAVooBWzW+IrVReoFSSYTRoUOJB9tAJLQAPnTXeAwa8RGkzByewg1Q10T3VfG+dEWLtFuaZFsZ7WRbR+158niHNrVUv+payUCjfwHbcRgI//I3Y3K6lyrshRBHXe/nlz534tr4HuJM/aTb9VmYC9Z/PHSbGxrxdwz+mNmM1DZRL8pnkKlYAyLb12C/I1AcxsAevH4v0kRlZM3x10WGKJE/A24CkwEhPsnHDh1mLTpaF+A1R/yRV6uZW5obUSktqQh4sehdThMs8Tgo2NoRQvC2Epiq/MJbcz7BKS3cRWeFFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 21:43:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:43:56 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx943-evk: Describe the PCIe M.2 Key E connector
Date: Tue, 25 Aug 2026 17:43:45 -0400
Message-ID: <178769419388.2275051.16645852812684256620.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818-imx943_m2-v1-1-d9832c91a12e@nxp.com>
References: <20260818-imx943_m2-v1-1-d9832c91a12e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b1f109-c8e7-481e-c41e-08df02f1f6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: twaEcBSBm/23/31QNyOfLMZsRag7KsgoyjH3qhtaOESnhPUfEXra2S/w8IpA6zsSUOj9BfTEf/3EZAgC4e20OLQIev/d8Nak/EKcoAPkaDCLmw3aId8pgLBdtU2oqppsK87IaWxW/oljyswFLJm9MkY3cmI8ZgwWf6ExcBTIFnS4mSLD/Wb71P8EHx+fM4DUq5BoBuAKQLMOtj0Mn+qcPaGucVtjeadwmAOcwZzGGbyNnrbhbY6VHTnJBZj/Voi1/lFyekMMsnznV6l1t7Vb5LP1/rB1iFfvup8gpdaLwp1Z/7MLwgZNTHKgQ+zRKkMTofWz7aMc5t2G2EoUTw9M7eDY14TQB43ZY3SwDfrUcYyRsm0v08AM9GzUqePOi0UHiJlvkf99SPsSh/t2UqL1YaWja/wEcxBcn9F3Zft0xJH7CbAU3S1lBKtth/IU8U94DS92P3IwFwklLXf3C5s0x2pm7bkMCkpcJbG23UXdjb/Z0dq8N/cghaTVc+0nfI1RzDKjB5obhB8TThibYiG4d4hw1hvEO4MtIWkgPpm2BN6ohPmmMLyJ02UBgknAG/8g/uJpaBgouCjpSbM793E9e18FGQzOu2tr6eZUEX6ccvz6olhcPgBsSDhY/w0AIJtkji0a/zUHXXJg35gvG6jvY/093UzVaF+RAY8Tdl/6WQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdwcDArREtJVXVpV0dPNTV0QjlFRi9qR2NTVWRsTU9BSXp1SUtFNER1algz?=
 =?utf-8?B?dUNnR2M2V05BTXNoN1pSYkRxQ3czR0xGTHVrdkV0L3J4RWZoYU0vbjIxTUZj?=
 =?utf-8?B?eE5WR3lWR3htNHZIOTI5WkYvNnR5MWRpSWxVbWRvZUxCVGIwU3o4Ly82N2tK?=
 =?utf-8?B?MjYySkZoSjVub05nTzRicy9WMGFzdnRKZ0llUGxwV3pSdXRFK0sxRDlvTmoz?=
 =?utf-8?B?OU1tWjNUejVXa2tZTXVxZXVDNVJhMGZ2OFh5bk80My9mMGJzdlZJbkVWUWdn?=
 =?utf-8?B?ZzJlTGJGV3czWTFqeHlDOXVSMDcxUlNRU3A1T1NlaVpOS3ovOUxmMktPMkhW?=
 =?utf-8?B?Q3RGYjBFQ3RmS2FwT28zQ3lMdmxRRWRCeGp2ZWFJZnJad0Z4UmVXLzVEbEtk?=
 =?utf-8?B?ZExLc04zVlVYQ0pvTmY5UEFqVCsyRUJPK0RJQkZRUWljdCtVTFZWMDVPb0t2?=
 =?utf-8?B?M29wWDZpS1ordXlMQitHUkdmalBQZmVSbTRLU1RxVVJIUndJM1FmN1d1UWpV?=
 =?utf-8?B?MUFJOXRya2kvWGFIdHVoV3ljLytTTU9ON0tkcGxpYXJKRXYvM3MvenJoMFI0?=
 =?utf-8?B?bTBPNmNKRitRbHJwbmZTQ3JpUHljZmpoMytHaHpVZjllYWxQcFVVTUtQLzM4?=
 =?utf-8?B?bVMxSWhGZkMyamFmTyttSHM0U05rYWFjUSsrL2p1VjJBOHcweFRLN1hpN0pv?=
 =?utf-8?B?QUdBMFg0ang2UldZanNwbWxFTUFwMnhubmsvMzhQMTRMTzEwVkxIMngvNnNM?=
 =?utf-8?B?T2RKbTJneUhuNXp2dGZtaWcwVDVJdjBpS0Z1MkkvYUdOZ2xjZy9QWm1vcGdP?=
 =?utf-8?B?YlRCR1N3UWZ5OEpaWUlHL0RQNDlJS2pUZndqMmVFc0JGZncwaC83K2tqTTBj?=
 =?utf-8?B?ZlFvY2IvRmVvMHVpdlVIV3YwQVNNOXFxbEpsRFU0YnVVOG1ML0lMcVhjYTNV?=
 =?utf-8?B?aE00NHgraTQxeFZNSFo0VjNXRXRjQkM3aXNlUnJSS0o5Smk1UXhsbVpyVTFE?=
 =?utf-8?B?emIrTnFkU0crZTZucml4MXZ1bUlFbHZ0S051SkN0MnlleFZoYzVpZVUrOVo5?=
 =?utf-8?B?T2RvTXFudDRIOU1QWkV3c3B0TDFJUFZkcEJqS2Rtc0FpYmZReFBqbVpaU2U3?=
 =?utf-8?B?N0t3alpLUTMzYjlqSmE2b0REa0lmMVlpbXowcnlvNlB0WmZicGhCWUlFalVP?=
 =?utf-8?B?bGtTYXpqaFBwWi9IYkUwRHpWbU95Q2F5cSt2YzIzZXlZR2xxSjV0UHNZMjhG?=
 =?utf-8?B?bFAvdjNKSXlNMXc5VCtwK3RTSnFxVUd3ZVBaSHNDUWIrZUdvSHhMcmlBQldD?=
 =?utf-8?B?VDdmbmNHbVIxeE52YVl3bFlHYmRNU2gvZlBXa0RYQlUzRTBDc0ZxUThwL0lY?=
 =?utf-8?B?WForM09hVVN3aTVncXRuNU9VRzZ0SDBreGd5ZHVLdXdDNGpWa1R0dGhIdlBa?=
 =?utf-8?B?WmpyVVpKK1ZIN0ZKZGdhTnJwWUJ4V0NpbTZtQ1RQQjFTVUUrQkhIeCtnaXUw?=
 =?utf-8?B?WVJFQzJWeHpmMXRSYWVkenBEZlNMU09Kem5NTGU3OHgvOXkvRHdkN1J1MjBV?=
 =?utf-8?B?M3hkelFGNHR4OFpJWlg2UFZkRitLemNGWVEvWS9GMzBOTzhGdVFBRCt3dDlK?=
 =?utf-8?B?YUphOGlBaEhDSzBYeDNzQmVmV0JocU1JRjUrZUJWWktPaWhZS2JkM3NmNDBh?=
 =?utf-8?B?ckNDOG1IRmtzTEN4aHZOWlRlclh5cUNlNTF3QVEza1RCclliOUFzMkVPNEJx?=
 =?utf-8?B?eUk1SkNiZGE0Y2JKbGtGMWhCd01rS3pTaTlvRUVidjlXRnZHd21mc0g5K0tU?=
 =?utf-8?B?VnpoSjhzVkowbDdYb05uckVnMjhHQXhPSHptdWEzakl4NmpETTdUV0x0N1VL?=
 =?utf-8?B?ODFnVFJNSmhMNTVEWFZpenoyRjNoS2duc2lnNjQ0dGdHQnQrc2xaVlBJOWFM?=
 =?utf-8?B?em94NFdIOFRWdHpCWURQdGJpR0owRVRMYmFzSXROemkrR2xiZ25vUDhwUitp?=
 =?utf-8?B?YkR2QjN4cm1jQTNJVENzMlRwbnFsVkZwRldISlQ0dWpwLzVlYU5HcllQTU5r?=
 =?utf-8?B?bEVuMjNZaDBjNjRlY3hqVk9tZEFrWjJ2aUNxRWhrcEVoNktscTVZV0tJakgy?=
 =?utf-8?B?U0NqNVArbEsxYmpCYjc1Y1RSMUR0cG1FOFdjSldrRDVzb2NGSFlEdVVjK3FD?=
 =?utf-8?B?azZwekZSZ0I3V1JzOHBEMXhyYlNodFhGMUU3Z1pWRVhJSE5Yc2RFcTZmNDhS?=
 =?utf-8?B?NmdRREZuTm5pVGsxanhHMFlMdGZjZUF5cGkwcTd3UzJyN1FZZGxCQk00eS9B?=
 =?utf-8?B?QjY0SHI5Zlc5RzhaQkFvTFAyejdMVTFIcXNYN0hPZmM1Vm1GU3hvRUQ1Z2hI?=
 =?utf-8?Q?bLmDnciRlP6m2/0KhXIF7HNHv5MjsqAeX4Gv7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b1f109-c8e7-481e-c41e-08df02f1f6d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:43:56.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxMG18QNM56V6jLzWtuARiM/+VDVNO8OfeOgZV053l3OWt6RhKLjlACr31AtbYx2wMrWA5z+crZB29Tel5BexdvdrcaE3b5A02FP4yW1gGF4H1VU0Z9s1WDAlJ5qaYr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_144400_165251_1D9F6CDB 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 18 Aug 2026 10:44:57 +0800, Sherry Sun (OSS) wrote:
> The i.MX943-EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> LPUART6 nodes through graph port/endpoint.
>
> Since currently the M.2 driver doesn't support SD-UART interface, for the
> supported SD-UART IW612 M.2 module on imx943-evk board, need to add back
> the WLAN regulator and bluetooth child node.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/1] arm64: dts: imx943-evk: Describe the PCIe M.2 Key E connector
      commit: e745a4ca89ae46c5be19717ea96ff7a272121c1f

Best regards,
--
Frank Li <Frank.Li@nxp.com>

