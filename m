Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E8C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=; b=lM7eYJoP8ZpQfUEHEq0M3TfjnN
	Dh3YWsDvwxcKUJNgejalPGvFQzESHvEPmD/vEeHyWvSf2BgBncSO4rVn5O6PJHWv8QGckptT3kKOk
	bJhsJiXXqc9M8BEL67F7RaEZ1aMpOEKjbCIK7N/siPylwtb1rLEoRe5pW2ayxcz9EHxWrU+UorkSE
	eSyvSFDJ5KnTTAVot+SDr5IvYogmkgnttkuPxDuxHajkDk9D3ssgqT99STZ056ZjTvDpyh6FIbmCX
	3Y7E4ErwtriHZ7tlD3WdeoHu1/pTOqETq5Q24PqI+yRZrl8cBWb6PHs+tQzUrpG/Xg0K+4442fssb
	62uuMKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uKB-00000008vti-1vv9;
	Tue, 08 Sep 2026 11:49:15 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uK5-00000008vmJ-3AdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGjPNnipVffsEZFQnGs5vTmWOcx0M08K0gZwFUPVYnBiTYjIbjcJRCDEfEtTqY2B+8MCilgkTUQW1YulteIagGKHiriCuR3N4NfutqIxlsyZL4S+xVWuo+SdR7SxORIZ5RwiZIkl18eKjeyd+MZA5WbAajqcBVqM+c/7u+t8YuRl3USojkQf2kkMv4Df56VNVmsUPs9rpODwspGvQzINfwbQDn3+RTl28GjgXb3dTS4fJeVpODtBqXsAtuduhlofDFvqR5SiD6DyxmQuBvPOcbGkcvz4lQ97Wv6etM4ELTCZlT2EWFgAMu2xdrM2yBdk8a6irQuzM88Ac3dcBfRVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=qZ04n2S5OR0c+eemg2hOfIo+IZTVzN3+pV15elhdzaGUAeZd5/odJKgOoJnWQr0DrxAnDGB8ynb72TlemuG6kwZe14hB6OuqZ8rFnLKDiXud+Z9sbXcUaR6DdeDFuPSVadu6mgF1KfuDhvzduRrOCuPdXTusfv3THqosmNUn1yLLkeIz0THLv6pICgarCawkmPZUSs1Fou/asniog4+ieVXxg8IrfKWh9qD0SojlvTwVTK756K9cuTH0bKZYCMeH7eAD/AW7jKa15sPfMjODgAuNZMfb0F28P4I/WsdcjZJj9djGBJ4o2aMQwoXLV2xpbdK6CDYqqF18tlDRwMiyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=xEPs+sExIUWx4WvkjGLw/VpEMFrJBxslRinRydRRKRcs+qxz4yT8Ci20/cJh3pUh0WazUc+pqUTideKjDu6ztQXGeWCzvPJd8s/Gssuk+pp3Tyj9xNVvP33kIKK5Y98urZiPNDnzcrJIM1Xhql66l4iOIJ9wTuX9M0NZbDkkw58G4FDsbfDh55JZJRRL1Li/i6OhI3SXM8MVX0oYdVV/EzTo7ZM+NIiyhJkMnQAK5EdxQhHJ+IFa4Nso8wE2SoG7MgGW+qqZg10U7dtXCq4pLCOI288Sszj1F0b6Ox6/7d47xTYiErhLA8mvWR+F4yoaMsoWTo2tEB1wYvpHhn9fug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:49:02 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:49:02 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 08 Sep 2026 22:48:12 +0530
Subject: [PATCH v49 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-imx-se-if-v49-2-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
In-Reply-To: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887921; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=tec7AtRAxon/3HKLtaKrf9XDUDQ3tNTDuBClNB7SKEAaikFUi6OYD60Mr7KJn5WYfCmeHfslq
 eGzsB9VX5V5AfJLiAdCbRJ4aKSwVDCRFL5grQAfWCPqPi6Y22LWmAwA
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2283f8-1e57-450b-f48c-08df0d9f2d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info: 3WcAqoekHFXCSc5AojUnD3g1C0L0Z0poyQymwx+5pQp7JuKcW1zbDjgwwb5bTx6PqLbFJi9kZ0NO1yiaiSfQk22+bx1NjaW8Uy2Sg9bIyKsSuGTpP0un2c2TXaQsmrVBDZouMLrlrZ4VbNCrR8puTKrbT4pek4kZQf3uSC3M1GIf7ypwK7pZU8Xj2tmBPVJ9A0X/xbyuACXZdXIoQIfpWi0zF5lQ5nhYCckyqNUyFwlVVfKqo1UGILKfIFvOE6Rsjna0tKkrxDz6kfNptev/5yRPUgaDH5tTOexw1d21ZRf7hnpqTVALy//qTagDYqt2HjCMmek4huFy64joR8y1TeM8/g/HBjR7n3Qt03V4wSXzDWUYJFE5BqCRdtluvn19A0ynWd1atMaXn00lddbQoOJhUAJQ1C+ElufoIspm7qMu2D8rIMN7sJLPhQrgDIJ+N1fg3Qw79oaD+fO/VC84SAgkyWs0iduBYS/Y0fZfkqMb1Joum+Z7R7a1aXhrcttGVXgasbmbIQLCGHF5BAu4VMFzk7WTz0QOGq+JnYV88c3xFE0JH6RpHSwl/W3753EkkPUG7uisxF7Clgcwy5LOA98TH9rEM0VWmXOX6Wqkl/k+4gt901qjRdSb6OsHhKKbZbxkhL0VUpkI4kyUplC416fpYWigNPURf3+Xi0Y3N+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2ozdnZ1ZTZUdlI3VDQ2TTV2R2tHZ2V2MHRzUmJTOEhtKytUZSt0alM0Q096?=
 =?utf-8?B?UUFhaHlUTVFrMlFRQjg1QW52Z1FtMGlTL3pMa0FwUnp5aUNnYmVwOFFQRlZC?=
 =?utf-8?B?MFlMbi85K3dnOGR5OWlLcWtkc2hiTXNWQkxxSCtYTGo2UjNBbFVqQ2twOEoy?=
 =?utf-8?B?bnFKNkdOUmk2Wk1iSm9ZOTNQWXlOQlRXSi9oRk85VzUxUVR2OTFWaytXQXJF?=
 =?utf-8?B?dnh0b0pBREhTNzJmektGTW9CK2dKNDFyOE1NaWZscXd1UXh0eU5qRWowdksw?=
 =?utf-8?B?ZTQ5VVBHNUNOdFZ5ejEvUU9ja2Znb2xEQ3B3NEJ3bndxWmUreXhMc2RXMllE?=
 =?utf-8?B?dWNpbFZISnpicVV5T1FUTzZ1TnpCbGZwTG9HWUZVOGllZ05ZNmsxU3ZaaFcr?=
 =?utf-8?B?T01seEFNZCtFL1FJTUpHWndaa2kyZjFsbnhzeUpIbGJ3TCtkR0hYb0pnQk1r?=
 =?utf-8?B?NUZrTjRuNlNKdGVvcVBHRDBTNGkyTGh3aGlJNnoxdCt6Vlpod2ovbDFPY0NS?=
 =?utf-8?B?MUpkcXNKelZwTlhmWCtyNU1aR0FSWFRTQXZqNmFjZGdyOGJlTXFDVzg3VjNt?=
 =?utf-8?B?S1BSNVU3VzRTWTdSVThLazZid2xYU2pEbE41QUt1VHpucUdDN1dPVWhGMjht?=
 =?utf-8?B?T3U3WDN3bFhZT2IrVnZsdE44Z0lGOWx5UHRNSFVEd21MWUdTZHZlbHE5TGNL?=
 =?utf-8?B?SGlxOW5lQ1grNUswSE9lS2hvQ3I3STVuY0tsdVNJc21XaFJ1MlBiaXQ3amNz?=
 =?utf-8?B?SVIzU2pLb1ZCbHVBeFZZMkJlUldUeTBzNUYzLzlHZG45SXFpNzA1SFlMWnN0?=
 =?utf-8?B?djVvc0RieUJtMkppbmsyZXRQWjZUUUFYRExzeE9DUXNKZDY0TGZpZ0p1WjE4?=
 =?utf-8?B?Q0pPTGs5Y3hTNFBCU0FzYVJOWGtzUHBwN3Q2ZDFYOVlBaFBEa3BPT1hqbnZQ?=
 =?utf-8?B?T3BaNS9rYnE0OFhmblMrZWJYZzZXYVJzb3o1TkRERmNVUmdyZWY1TFBZQzZK?=
 =?utf-8?B?eHg2YzBDQmhSWHFzd0EvWVM3ZUVWWWZMT1lSbEs0SHRYWkVZeXFQWTdRQzRJ?=
 =?utf-8?B?QzhwR3daQlBKNm9rWHRXRmpPbW9PZnF2M2dDZGVqMkhFTjRtaXpNeHFwbzBN?=
 =?utf-8?B?cUZCNHdHUWFsU3cwZDZ0Z2JPaDFMS3BrR2NBR09kdDR2VWhJWXMwVkJDRTR1?=
 =?utf-8?B?SXdudzEwdkFsc2cvQ3MyUFl1WElsN3hzKzZmTXo1b0pRM3VCb2NuN2lrZXE4?=
 =?utf-8?B?S3BPaVVxaklaczR4WmVLRi9TS1RPZmJIZFBML0tHZTgxbGVVOEJHcy9XWmNu?=
 =?utf-8?B?QTMySm4vT25YTWxQaXpFZlR3TkROdXJBeXlkVlljREVlb0lDMDRlaWViaXpj?=
 =?utf-8?B?eTFQaWhlRmJjek1helphajZHN0xIbkJZeVpiQ3VVc0kyRXNJM09sb0p2NzZz?=
 =?utf-8?B?SGNIRmIrSTY4dEhBVEZBWEZyOUhmclkyVzl3NDE3M1hXU1ZBWU1kVUxnZXdT?=
 =?utf-8?B?UWlQUHhTd2pmS0dlYXhRSC9Dd29HTkh1V01FUENqQnlHVyszcEY4VmFFbGVN?=
 =?utf-8?B?UnQxb0dQRzg3bWRZdVoxaTkvNnBmVjRYLzZBNzQzb1BRQno5MnJnQ1hSVzhk?=
 =?utf-8?B?aGdjc0ZaT2FJeDhuSmFEeFpwR0pISmwvZXZYekZ4WVJocjFEeEp0aWNEN3VN?=
 =?utf-8?B?OERCM1I0RUN5YzhsdVJISzhMZmtWY3dFV281aWt6RHBGUHZFRzk5dW1HdzFS?=
 =?utf-8?B?Sm92eFA3eDlrS3k1WU1KZHkxTGVDb3BmTFI4cyt0aXB3c1d0SmNUcjZFdjVw?=
 =?utf-8?B?eWdHVHkwZGdobUpxSnlSZUZBM09FU0NIemZQcGVVWVU2SjZJMkZXVS9DWGty?=
 =?utf-8?B?OVh1SHlxb3NzTGI5a1pjTnlzVTZjN1dxL25QTjFyWmF3N25uODRrd25sb3Zn?=
 =?utf-8?B?Z1J4SU83WTlFVU55WGk4dFR4WkdDRE1ZTlRPWEVhR3NUSjFFcGc3MnlNWjVl?=
 =?utf-8?B?cUJScjluYUw4b2xWR2FRNTIrZlRVTms2ejdESk9nOWtLVmFzNFBEeVdkL3J5?=
 =?utf-8?B?NTZVeC9zN2FHdkJ0OC9NbTB1SmVMaklFNEtkOGFkbFpzaEpsWXROOUJMVDlN?=
 =?utf-8?B?c1Irdmk0Ym5udEJTL3lkOUhtNjhUeTlYRUhkbDg2UkhqaGd5SVUxUTlDYUds?=
 =?utf-8?B?U3lyOTNZN3k1Z0lUaFBHaHg1enBEMHI3UGRWRHZJTTNvSzc2WDFnK2hXQkQy?=
 =?utf-8?B?QU85ZS85dlJrc0lYMytUZVNTdkI2M2JJR0Y4M016aDZ2L1NvUTJSQnEySUFF?=
 =?utf-8?B?QTdjK3JDY2tiUG5GY3k3eUYvdjJtYXJjNzdjZDZueUxYTG5aVkNvNHF1TmpF?=
 =?utf-8?Q?M737GREjLyTwK8l/SBJ0FDLRMBTu8TQKStVoc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2283f8-1e57-450b-f48c-08df0d9f2d9f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:49:02.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jlo25s1XBprc2z00BAq/WLxaGyGzcSDsYpO21clwVDvWUOpq1GprS+ZxMcModybJHHSfgtR0r3XJ3L/GPc4X6h384LTEHKGnH+dxEabv2eBDnHrONsDoEnBGze5/xE9L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_044909_805222_4F426CB5 
X-CRM114-Status: GOOD (  12.42  )
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


