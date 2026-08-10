Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36625C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Biy+o7BkqehCNm5vy/si+mNx3FzYGWTLJkGVpGa4MME=; b=23fZtT47G9tYPqp3hQzn6u/6En
	IdIi2GaQRiVuOoZIzb0OVySIFCiDyOG0UXsRpOVC5Xto6T9JivVn4Evk6D0fQwjVL184Q7SForNNs
	EvVFbueeYoyA/6HG2INjIiR26WFaweIyfhJuik43G0gWdB5Hf/KWyrigghjNwYJzpj73Q2Z0jQp7+
	2wvHlsyr8yJcwgBdtzs0CgZiu7bZDOoxPD7ua+HwTJXKfmFPGgM1xIR75CEDbMM0VFljMeuE3/z8L
	chLiCZ4OhO3zA8ARbaWlIhjU1WdV8k0JgGtAEIAbwWJ+oLkIMmWZkCwqB7/nCHw6ADYaohH0cg9w4
	atszjQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPi7-0000000BrQ5-320G;
	Mon, 10 Aug 2026 13:06:35 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPi5-0000000BrPX-0EDb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfpRPKDybdNgtUMyxSCmI4Qa0POEBNRmQY1KUO2vIJKRV2S9VMmXJ9RPQBsxUvf9wQT8v8DcKWTPaGQgzEkfvDOSWVVBQaU4/LDV40oB9u2uY0pB8YTawZ6JcxxDpJAEtkiYlv2czycVdvUKqrR35NXCeeSz+9lWF9FeSp+VvQAnSHiXWya6MXqbh0LEzSkrUpnThGCGtdafiqM2spliAvFnsSHur6dOe9pXI6ZE9/m+kfamQAoGWnbRPHM2Ez0PyFruzmxqCxb6HcW2Z2p98DuwrWp7+a3EpkiTQTL5p7WJoHrB3waDQH4bPfLmbermR3Z8/aOSZdJhVrQIZsSeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Biy+o7BkqehCNm5vy/si+mNx3FzYGWTLJkGVpGa4MME=;
 b=bdhsLxqJdSDuoKUoL4WBYBLthCwWNx5tsRFBQq7ofiF2zClCGJse00egRihZ06p/CG5exY0Tuh8MIZXOQpVviEVRNcfeXMRyn1BeyuURy+XaXAFnByIdv+qv5pqYiDxApxo3nz7yHQst7ZI9V6vNVNqWdoG8SVAp9ZLNjRS2y4VXt1Epj3Xjzig7gnmoRYa7g7uOjLr0QwDUN/z2BY5s5l+nnFYao/jEXXgYjV0kmP2IE0wVcHodKO7WNDvkplskHj4huU1HDCNFAgazgQy57Zj0P+n0rXZeUPOTFo2gzYk7EF5bF1Y7069DaLUE0zEYVZ7R/GLO84dfFc5KoOlTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Biy+o7BkqehCNm5vy/si+mNx3FzYGWTLJkGVpGa4MME=;
 b=cXWtKDbtKHfO52WWcpRJCG+hsKr55cpvLVt8+EyY4s5CcT9jSmiZXZX6O2fGWKWlz148kHsiKqZUdruOH9qBlvgq2sg2pXKWIp5sbb0bkj9gbPk4OOjbDZQZSzjAJ6uAjZbGQUjVoFyCE16fLuMwHrjECDBVHiJfv0i6QRh0cfBk4J6oo4VZ3TQr5TbdJ2g7fqI46Nf4wIugu1V/gbcFjCAPtYgjQq743J2Lj5VoGm+Ow6OtkrCa5MOKEhvnjt9YufIRA0CxGLGv3EysIRhldyFsZ0K2d+2uuMxIJygFyiqv5V26WN6+ILaX24aqCozKA4CVFbp3YHubgORCCT6Y+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by AS8P195MB1977.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:573::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 13:06:24 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 13:06:23 +0000
Message-ID: <008985f8-5931-4976-b614-55b2cab50a94@phytec.de>
Date: Mon, 10 Aug 2026 16:06:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
To: John Ma <jma@phytec.com>, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260805172658.3892154-1-jma@phytec.com>
 <20260805172658.3892154-2-jma@phytec.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260805172658.3892154-2-jma@phytec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::16) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|AS8P195MB1977:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c4018f-8796-43b6-9af1-08def6e02dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sI1kU/g19fWNUftyKRRXfT39BJoPwmXNdYtZnP77nGMfryJVzWgikKLWq6BLA/qtl1gbGu+lrYaaLjYtKZwIG65rvXp0+A1lEU2TXXw+vXQ3f2672qpaHk3P3f0O4mUHgnvHDgwdYoIJcOq0qoS/dK9Q8ok+pXBFRpgeIGkxkBn4hHQZqnlZy93PJsgb64h8yfgV6JtS4M66kjlzYq9sUosQ0SKKrB0O6T4rAQbeyTlj4JNIcmrAqlFRxNXdQxR14+izzniZwik1/Qp+aS43IGDITGqwX+MYqkxEJDx+6CxrZmTPvSmUkZcSoE+5tENBbtO/YJ8BovzzbGTZBNlwo1BLi72Mf9CdNOjy44ksuYglRjYcRcZTYYDvVObJW3WyxwOfbhOiS2tY/h1fGMnYunN6ITsLwAYQbn2ADS03bmb+meVM08YYRp7snZRpO+QUNsaypKeTuG3GEb0QO/SQ2w0zGdtUtcVS/kHj2xZoytuuEC2fWLWnA0s4gjxf/5Wa+is0MBzTqmTQqzJ9+BZno01f5NNI7BsAgjtofl5Ga4lAR2hZu8WWqRL8CVb8B1JvI+Y8nS7xE4nTyn+CnBqUxynOgDoHjNkegajM7uKdg2GZ81X5OKPUR4gpged3cO2BmKGnYf9wYPHSeclXkljOJ9iOUvpvMvwi2SLvnG8l7BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5Oa3k0QXZGNWxSOHJsWTFiZzV5UDk1ZVcvemZwYzFreWNuc3NSendoMmZI?=
 =?utf-8?B?OEx6S3NUMCtaVUxpTVhDRmJTZmlFenJZQ2g3RWM0YkFvV3FmdVUyUHdnQzVs?=
 =?utf-8?B?cjkvY3oydjZ6ckcrSWRPRG9iYm5kbjlwbm40dWNiRnFyTGZzbWVXZTlzUEdN?=
 =?utf-8?B?M1pOb3hNdysyNEhURzludytXSnFkWVB5N21OQnJqaktBdUpYa3dPaDJSSnc0?=
 =?utf-8?B?cUxKNEwxVVJ0R2JEVXBLbG5DaDRsT3NxVFBrbTFUT01zNlNHTEZhb0x6MjJr?=
 =?utf-8?B?U3cyUmRsOC9YVVBPejAyYkl0aHR2K3hYd2FqR1I4bzIybTliMm9IcTBnZEY4?=
 =?utf-8?B?SzQyM0U2MkdmZjF1SDExeFZwWGM3YVZHa1R3eFFXQTlvRzhYSHl6cUVjbG9M?=
 =?utf-8?B?Mm1UV0hpd2RtV0FqelhONW9SWUJodXhURTE0MkxIdUwxeEZKdUk1cGR5bWtB?=
 =?utf-8?B?dDJYT1VvVnN1NnZrOWZmT3N0M2lHRzZNRERCL0FHUTJTd2RFUkMxOFYrYU02?=
 =?utf-8?B?cFRiMjZIQ0VnVEw1bUplWDVHd3Nxclprc1JFSFJYNld5NmNpbGZyL2NxRHJ3?=
 =?utf-8?B?YjgyaE0wS0taWlQyVVlMMzNmdFNRclcxZDZ4RjQxV0lLQ1M4VEgzcXJHRVAw?=
 =?utf-8?B?Qk95dTFmZTNxUFpFMHRhU2xMM1RUS1AyRStFMUIxQisxZytDVjlLVm0ybzB4?=
 =?utf-8?B?WlJxY0pVQU1GWXVKZ2ZLNEd5OEdpUDJmT21RaUlpdEZRdEVMeFV1amRsS2cy?=
 =?utf-8?B?MWZrT0pjUXNTS3JLcTdWQ1R4cjRDYy9LZTd4ajRsT3JaUGdJMmNFSDVRSTFu?=
 =?utf-8?B?dmdJUERNZTVLNk4zNGxJMW4zMWp3WXMvWWZJTHczN3V6UEo4WnpzVmtENVV2?=
 =?utf-8?B?RHpmeFRrMllyb1R5Y2VvOGR3ZXVCb2VkMTRsRzlYUVdrYjd5bGZ2bFd2YjJt?=
 =?utf-8?B?ZFhwbmd3VTh4L2YzUVpzWC9leHozNDZ5SUU3cE5Db1hGUXhzcXAzYTdIeEpY?=
 =?utf-8?B?MW9BTisvWWZaL2pMNkRsTlhDd3IvaFBVdlhkZmFlMFhtZ0ZGc3Q5S3lFNXJs?=
 =?utf-8?B?NzBFZU9VZVdGbmhPK2Rwb0trZEFRREZ6N2VJVW5PdWJHdUNjNjczQmR2UEln?=
 =?utf-8?B?eW55SExLdlZ5NmdoUEFPNVJva0RudnZnOWVJb21MNUxESW9MbjduQlhKdG5O?=
 =?utf-8?B?UktiSHZaaUpjazhsczBtUE0vaDZiQy90b3BBM1dPT01PK0EvZHNCRlc5ZHp5?=
 =?utf-8?B?TStHQ1JZVURtMzZVNzdZMG1kZzF2VkNMeFdCOHQyVGQzVXlWNU85dWswQ21I?=
 =?utf-8?B?WWd4eFRvZGxTZkFlOEpIQlNhZnFNT1pPU1ZDV2pRcGdQR3RodFJKWVhhT0Mx?=
 =?utf-8?B?Y1A3Q0FnSDR6RGNsS2pnMmJZUjhTeFNCb3F4MUNjMjBwZ0M1QXltbTNJMnBX?=
 =?utf-8?B?RE9kU2FHenVmelA1c0VuNUh6VHpVQ3dmMUIxRS9pWVRRT3YwYThCMVduRDB0?=
 =?utf-8?B?QUxJWmtwQVJCVTlHM1o5MG5BU1BpQTBKNUdNZDlaVFNhTnhjdXBPaG53UUVt?=
 =?utf-8?B?N0ZlRzZmTm82aHJqV1BONlFyZDBzdmpteVVsM0tYYzk4S0NRelIvcVJFbENG?=
 =?utf-8?B?a0M4MWhObjBncVZYSW9sTXZPcFN3RjNsRHowRDA5c2hEQUxoM2JVYU9Gazdj?=
 =?utf-8?B?dGxkTUgzS1UwQ3cwL0tkY29xempKcnRJNjFCRnAxRDU2YWNCWlNPZHZsaC9n?=
 =?utf-8?B?K2RXNHZ6VitKVkZxZlNnK1lxRzJXN0cyS1JYODdaRjZrdS9kNDlETFF4aVZG?=
 =?utf-8?B?V1hGRCszS0UwbXJJL3ZCaXZlOHRabVNhTXA0VTl1cXFLbnRqTHljcXhmYXMz?=
 =?utf-8?B?eXBYaEdtY0xDa0ZJTy9mWmRqMkJDSWZEQnJUYmcxY1ZPVWdaY000R3hjWUhR?=
 =?utf-8?B?NDJYdW1IbjlRdkN0WjdWbmdsQ3puTU5vR21UajQwazExZTROK0hBc21vL2hW?=
 =?utf-8?B?d3ozN0h5TTVRVGh4N3A0OXBtQUdNRTE3MGo0SStCZGFkb2ZaS3crN0lTMXpn?=
 =?utf-8?B?U3RYTnRiRUkzdzVCS0tvOWdmSk9CRE56d2pwbGhqdmxLcmlGekpQeGVIMXRC?=
 =?utf-8?B?K2RHKzFhU2V5U1hFaFFvRTVHZGtFVDVGSFMrTDFKMDhBaU5naVZLcFQyOUdD?=
 =?utf-8?B?SVVLTHAxTU1Ocm1RTmp6QmFieHI4cVVXMDA1NG9reUxGOGhKQ3ZjcGUrQVFB?=
 =?utf-8?B?Z3pYTFhUVksra28wOWZ2b2xFeHU3a3RGNzhDbTRRYUZNVVcyUXlCNGJmTklq?=
 =?utf-8?B?MjVuZmdQeTVJMkNGaW1ibVIwMDNMam9ySmF1RURrTmJpNDYzNDJ2Zz09?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c4018f-8796-43b6-9af1-08def6e02dd8
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:06:23.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FlhET129A6uvUBfKwBEPz3hp8yB3Zw6cZgEtXJCReooPBR7ADZpUhJlfN/sdsqAVYEaE9NB3/glg4UrbKLqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_060633_301423_D6C814B9 
X-CRM114-Status: GOOD (  20.46  )
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

Hi John,

On 8/5/26 8:26 PM, John Ma wrote:
> Add support for the PHYTEC phyCORE-AM62Px SoM [1] and the
> corresponding phyBOARD-Lynx carrier board [2]. The phyCORE-AM62Px SoM
> uses the TI AM62Px SoC and can come with different sizes and models of
> DDR, eMMC, and SPI NOR Flash.
> 
> Supported features:
>   * Audio playback and recording
>   * CAN
>   * Debug UART
>   * eMMC
>   * Ethernet
>   * GPIO buttons
>   * Heartbeat LED
>   * I2C EEPROM
>   * I2C RTC
>   * Micro SD card
>   * SPI NOR flash
>   * SPI Accelerometer
>   * USB
> 
> [1] https://www.phytec.com/product/phycore-am62px/
> [2] https://www.phytec.com/product/phyboard-am62px-development-kit/
> 
> Test results:
> https://gist.github.com/jma-phytec/fd7911a834e39b3fac0104690668882e
> 
> Signed-off-by: John Ma <jma@phytec.com>
> ---
> v2:
>   - added bootph-all in cpsw3g_phy1 node
>   - fixed ti,fifo-depth property deprecated issue
>   - update ospi vcc-supply label from SoM
>   - added bootph-all in wkup_i2c0 node
>   - sorted nodes in alphabetical order
>   - sorted vendor property
>   - removed unsed leds from phyboard lynx dts
>   - added chosen/stdout-path
>   - update usb0_connector node with proper name
>   - fixed missing space
>   - removed unused pinmux
>   - removed bootph-all from rgmii2 pinmux
>   - added interrupt-names for adxl345 node
>   - sorted status property in main_uart1
> 
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62p-phycore-som.dtsi     | 340 ++++++++++++
>  .../boot/dts/ti/k3-am62p5-phyboard-lynx.dts   | 522 ++++++++++++++++++
>  3 files changed, 863 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 371f9a043fe5..b223681cdfbf 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>  
>  # Boards with AM62Px SoC
> +dtb-$(CONFIG_ARCH_K3) += k3-am62p5-phyboard-lynx.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> new file mode 100644
> index 000000000000..4f273f3dc2ad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: John Ma <jma@phytec.com>
> + *
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	model = "PHYTEC phyCORE-AM62P5";
> +	compatible = "phytec,am62p-phycore-som", "ti,am62p5";
> +
> +	aliases {
> +		ethernet0 = &cpsw_port1;
> +		gpio0 = &main_gpio0;
> +		gpio1 = &main_gpio1;
> +		i2c0 = &wkup_i2c0;
> +		mmc0 = &sdhci0;
> +		rtc0 = &i2c_som_rtc;
> +		rtc1 = &wkup_rtc0;
> +		spi0 = &ospi0;
> +	};
> +
> +	memory@80000000 {
> +		/* 2G RAM */
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
> +			no-map;
> +		};
> +
> +		secure_tfa_ddr: tfa@9e780000 {
> +			reg = <0x00 0x9e780000 0x00 0x80000>;
> +			no-map;
> +		};
> +
> +		secure_ddr: optee@9e800000 {
> +			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> +			no-map;
> +		};
> +	};
> +
> +	vcc_5v0_som: regulator-vcc-5v0-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V0_SOM";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins_default>;
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;
> +		};
> +	};
> +
> +	opp-table {
> +		/* Requires VDD_CORE at 0v85 */
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-supported-hw = <0x01 0x0004>;
> +			clock-latency-ns = <6000000>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	leds_pins_default: leds-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0034, PIN_OUTPUT, 7) /* (L22) OSPI0_CSn2.GPIO0_13 */
> +		>;
> +	};
> +
> +	main_mdio0_pins_default: main-mdio0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0160, PIN_OUTPUT_PULLUP, 0) /* (F17) MDIO0_MDC */
> +			AM62PX_IOPAD(0x015c, PIN_INPUT_PULLUP, 0) /* (F16) MDIO0_MDIO */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_rgmii1_pins_default: main-rgmii1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
> +			AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
> +			AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
> +			AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
> +			AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
> +			AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
> +			AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
> +			AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
> +			AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
> +			AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
> +			AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
> +			AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
> +		>;
> +		bootph-all;
> +	};
> +
> +	ospi0_pins_default: ospi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (P23) OSPI0_CLK */
> +			AM62PX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (M25) OSPI0_CSn0 */
> +			AM62PX_IOPAD(0x000c, PIN_INPUT, 0) /* (L25) OSPI0_D0 */
> +			AM62PX_IOPAD(0x0010, PIN_INPUT, 0) /* (N24) OSPI0_D1 */
> +			AM62PX_IOPAD(0x0014, PIN_INPUT, 0) /* (N25) OSPI0_D2 */
> +			AM62PX_IOPAD(0x0018, PIN_INPUT, 0) /* (M24) OSPI0_D3 */
> +			AM62PX_IOPAD(0x001c, PIN_INPUT, 0) /* (N21) OSPI0_D4 */
> +			AM62PX_IOPAD(0x0020, PIN_INPUT, 0) /* (N22) OSPI0_D5 */
> +			AM62PX_IOPAD(0x0024, PIN_INPUT, 0) /* (P21) OSPI0_D6 */
> +			AM62PX_IOPAD(0x0028, PIN_INPUT, 0) /* (N20) OSPI0_D7 */
> +			AM62PX_IOPAD(0x0008, PIN_INPUT, 0) /* (P22) OSPI0_DQS */
> +		>;
> +		bootph-all;
> +	};
> +
> +	pmic_irq_pins_default: pmic-irq-default-pins {
> +	       pinctrl-single,pins = <
^ I think you use spaces here instead of tabs

> +			AM62PX_IOPAD(0x01f4, PIN_INPUT, 7) /* (C23) EXTINTn.GPIO1_31 */

Use the dedicated EXTINTn, mux 0 here.

> +	       >;

and here as well.

> +	};
> +};
> +
> +&mcu_pmx0 {
> +	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0) /* (A13) WKUP_I2C0_SCL */
> +			AM62PX_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0) /* (C11) WKUP_I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +&cpsw3g {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_rgmii1_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&cpsw3g_mdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mdio0_pins_default>;
> +	status = "okay";
> +
> +	cpsw3g_phy1: ethernet-phy@1 {
> +		reg = <1>;
> +		bootph-all;
> +		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,min-output-impedance;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +	};
> +};
> +
> +&cpsw_port1 {
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&cpsw3g_phy1>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&fss {
> +	bootph-all;
> +};
> +
> +&ospi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ospi0_pins_default>;
> +	status = "okay";
> +
> +	serial_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +		spi-max-frequency = <25000000>;
> +		vcc-supply = <&vdd_1v8_som>;
> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <0>;
> +		bootph-all;
> +	};
> +};
> +
> +&sdhci0 {
> +	non-removable;
> +	bootph-all;
> +	ti,driver-strength-ohm = <50>;
> +	status = "okay";
> +};
> +
> +&wkup_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	bootph-all;
> +	status = "okay";
> +
> +	pmic@30 {
> +		compatible = "ti,tps65219";
> +		reg = <0x30>;
> +		buck1-supply = <&vcc_5v0_som>;
> +		buck2-supply = <&vcc_5v0_som>;
> +		buck3-supply = <&vcc_5v0_som>;
> +		ldo1-supply = <&vdd_3v3_som>;
> +		ldo2-supply = <&vdd_1v8_som>;
> +		ldo3-supply = <&vdd_3v3_som>;
> +		ldo4-supply = <&vdd_3v3_som>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_irq_pins_default>;
> +		interrupt-parent = <&main_gpio1>;
> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;

Update here accordingly to use GIC_SPI. With that changed,

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>

Regards,
Wadim

