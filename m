Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ACFC98310
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ6Utr1X2hiwrDQrOHZGIZI/jjFAEh3VK8g8U2qXsvo=; b=axjTSRtwfy6tvVT3ZV3O01Xs78
	gDu26LqwQuOxZFnj5BMWskogoLYETINy2M+NCmJsxLiOXBvRuxtOozc6qzCzDtkLpLI5BnKKEujdl
	YxsIdAdMKM5Bllui62lupaXRtFSatPoCsBlRKcYzzCDGzmxZupNaQ0ddjwx0THeAGztPtCwZ0ohMO
	Nz55HW1YwX/NuOwvScq+CtQ4sJ2ItyA9c4n/rNXuRV/cEjnfc9I1r5xQezCxXv2uISC0FWTyItfKz
	Pb7jS710H4PTvLtiOuMN5tGyvpxkZ/OOwT96ojaLdOUoOgF0pyShMoXzy8VuBa60/HmGoz6rtEfp9
	4jvxeWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TIm-00000009P6O-3wYz;
	Wed, 23 Sep 2026 20:10:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TIk-00000009P5n-0aqK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slyb4W0iiUtA42qnv5rT4WeYbHFLx3XpvdxqZljUpmPMPGY5xUkVsp0BBvDWT/16qiB/BndjMp92uKms7tF5bM6bypgu0xvx2PZIzARb+mPMuLpBKKkGgH8VCKc2cSV7aPwRYYIfEMWiTGfjprMWqcBsaRhglcwYMqOJzXvS6AGexaZLWscKyTnz91AFPemZeYkU89hOPsH/FBIqdjXMq1raAVQPIaROWOMKGNZVq9RJXGYwejH+Ze4M8Uz+Kxf7sAJAxZNEUC5gDyi3NS/A++Ebxi8ZyNgJrwwd7LdFEt9r/PZ+4kU6kK7GykbVN2DdBkvislaqHO5NKaoloy119w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ6Utr1X2hiwrDQrOHZGIZI/jjFAEh3VK8g8U2qXsvo=;
 b=gQt+89S1RScmYKEJ8Kr8yOYdRWXVgK8ucBM2Yynih+JfMpsLFakSy+oE+8d14rXMWES3L9hWZYDTRhE1SIyfdVwXtxIZ1240dbvw5uuqGTulrchL4pGfoHMdbm9N6cLj3JxjsKaWFNE9dn1iTN5qXhaYTfNxtnzfU76/+uYzppK/uVv65mx9Rce/J1gDDVhxlYlDWitPHFtvxrv+fajQHtYaAs3/CGqL9QilrVB4avSRIQPuLq0DoPe+PbBpuDpADUIKfXx0jOp5HmwDII28JGxgGhF+xuQfMOYYJO630s9Rau4va1+KbM34/hs8QS3aX3kXI4nntVBFpUvX0lucAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ6Utr1X2hiwrDQrOHZGIZI/jjFAEh3VK8g8U2qXsvo=;
 b=NnoccR5otGeXPkvr6YqDCMDNKWKxzQl+YMyYrtptBeYjhafRYwwE7MkEiYHZOkdC0T6dzigUCiO0aBQ852ilN1jrA0MuNlnIQBYKdXvk8BJA5ppwurSe4IsNAKPjhEKx5laFWTfbitbJFMIDwel196Cbo8jjvp74RteDHdJoWyWHR9mSU9mplpHRIplBbSilks6bCSyI1YxOOFlh/B+6x5PiviVKamEyI5NGNGcwnEY5VCyR+A3RwsMQ06vDIhfwHkjVBvm7JrnWjoeiEdOkZIO5pZcBFtShq//by2miUy0JzXHh9Xd0XZIb6amg92+6U3hJ6OPv2JmlS98iX6Soug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10715.eurprd04.prod.outlook.com (2603:10a6:800:277::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 20:10:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:10:40 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Natasha Kovalenko <natasha.k@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
Date: Wed, 23 Sep 2026 16:10:32 -0400
Message-ID: <179019422287.3742204.18120428206043977139.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914125311.8354-1-stefano.r@variscite.com>
References: <20260914125311.8354-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10715:EE_
X-MS-Office365-Filtering-Correlation-Id: 978d995f-9211-4043-0326-08df19aebd86
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|19092799006|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XN/AyHsdgFOpehCBbRtpMzs2oUuFbgn0H/aXah/UlXt0euq1m6PRY7Ub2HePSR9NypOj+dhlwy5Lk0HyLbpT2lid7YlISb8v8P8EJk/Q/3auTGvUab8aNSo2OReIZYT/Vb4rfwYyjZOXb3bGU0gvuNAEO2tLJT8e7iohXW5Lt2IcXnOCdghWEVlxGzOoE40t5Itb5AYKeNJcyPvQnBwaeCvyvnb6omX5whNoHyXU9ppqmvga0Iov1sCMB8h1zcm/S93qEW5YbXntTqxl7NlyTofyAUiiVBEAQ1Hb779ZpEYB7bAwVqL9uPDvnanVqbUXdtvCOKX5vbmvFg8dDx979961QxMQFKGQvHJsCY7PyoFs7AAWt2FUEtYvm3LQ/AX0n53mkDA7jxe0qxaTFkJ+4dQhDQvH65hhzhZfVDxjdXP3VsFTu6Inr2vlDWm31dvASjBt1kI+4rT9f8clC9mAZeCyCKnUEoN+TEqtzWIZgq8Xvgrpp1SrYFuGlHMcQ1qX0/63w5eHnj7rTN7ePkFxmCBuOIy1RTfnqo2dIxW6QoUMXPfTk4uzv9KxohnTYOiLJonytx7M6iDGPuSO7MDiBygng7gbjNO8kxBAZfKIKFM6nRwLkcWXwt7yZHS/5zwDl5junTE1wlRIX6GWBYT1dY3+ZX6pDjPr6xNu/JZ+T1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(19092799006)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1VMFRIbjBrK0tXdlhSYjRkUHZYVWZEY3RrZGdCMHBhUmcwcDRGdVY2eXlF?=
 =?utf-8?B?a2FvU1EzVWprM0lZczMzbHI1ZnpMY2I0d1pKTjhNajdzQjRDaVI5cTFIOEZx?=
 =?utf-8?B?TExOcHZFd2tZdWJsTTd0MVVVeDV0Y1U1YVpkSExBRnF3eXVDZDZjS0JnTTB1?=
 =?utf-8?B?OUU1dEN5WHp6aExIaG5oLzhlb1Z5bm9qYnhOMWZjd1VoRWxsZ0RIOXpHbm04?=
 =?utf-8?B?UVo2U0ZnU2lZV1BGQkFZRVlsK0pIUm0vMlVFSVNFUENUYXIvQjNDSUc4cVJh?=
 =?utf-8?B?ZUh6Z3pFTEVCbWdsSU1GUTdHRVJJL0Jrd1RocEk1MDRaMGJFZGNLb1JaVEtY?=
 =?utf-8?B?SEQ1cGhXbHRWM283SWMyWTVGcHlnMjE5WG1LSUNyRVVybko1bFA4amdYS0lX?=
 =?utf-8?B?QlEralpWZDRvV01pQVNoZVVRUWRjZDRPRGFsc1JmQWZ2dEZ4TkdMMVArK1ox?=
 =?utf-8?B?VXArY0ZVcTRQcVNUR0VvdVM2azBybFVUWGNWb0xwZlZ5TlhJOWcrSWpDTmJX?=
 =?utf-8?B?TlVYTWRyS1ZSWHdNeGxKMTRKVXlyRnYxNnhhSGNhRlk0SDRFaS9SbkZsZ2F5?=
 =?utf-8?B?MmEyQS9QVC9ydWt2KzVlRXFtem8wQmZHdEJ0QTFMaWI5TUNibUR3YXR0OExG?=
 =?utf-8?B?TDJoMFZIWGd3cnZzem81NkljWng4U0l3bzNHN2lUbmlyRjI4KzQydWNpNjEx?=
 =?utf-8?B?TkNIUnhLS2lDYjJOenZUeUVUc1FHdDZncnpyQW1jL2ZkekdJN3lzVGxsTTZ4?=
 =?utf-8?B?akJ3K1diYW40KzhTK2dwdzN2VGJ5SG5OWDdzU2dzMXVxUHhLVzJUeVMxSW5u?=
 =?utf-8?B?MWRUTkhadmxBTmU4VkxNWXUxVWtrOUY4cHhXMlo2Vk0ra2pJYXpUdzEzTmlN?=
 =?utf-8?B?MExURWdLWGJ3V21GOHdhU3JpL0h0VEJGYVN5UmVwRTM4ZTJkZGNob1lmSmlp?=
 =?utf-8?B?ajhQZ0lUQmprU0FaL29EZmNJY0xlbnMranp2RUtyQjZ3emNNNGZoZ2Z4U1F2?=
 =?utf-8?B?Zmo1VEF3OHpRNGNXSjFUTGhicDA4QUJOT2FYblRkc2lZeDBDSzFnTytGL1BU?=
 =?utf-8?B?eGVrOEo5aUwxWDY2d1kyVW9UemxzdXhWZS9pRUM3TXVWNUd1a0dXUUgvTVZx?=
 =?utf-8?B?Nzl4dUJrMkJ4aWRDdVoyMS9qdzZmTXRrZldLYUN4L3h5TzlNVnVvZWtod3Jk?=
 =?utf-8?B?YmNlSDh0KzY2TGVNRk9kMC85YTljMElBOGVvblUrZDU5UVZQMW12LzBtL3B0?=
 =?utf-8?B?d090Q2JEc1pWL3M5OW91Z0NYeDdvTDB2NlZHRnppYVpZODcwNFFITnZ4V3NV?=
 =?utf-8?B?dUI5NE1kejZndVR1b09SS3h1MmVhQXlVV1FwMFF6Y0U2NWtkQ2p6MkxpUnlZ?=
 =?utf-8?B?UUVpaEExYnZ6NnIzQVJvZXJlNDRJV0I1Q0dseE41SUZEdW1XZWFxTlZOb0Nx?=
 =?utf-8?B?b2tyNmVNVGxOZ0lReWlqRkxVMmJTZ3I5MzQxYVNzeCtrRklBaVBRaXhlVEVs?=
 =?utf-8?B?dTBTRks4NHNHQ1NoNDZZYm42UGVSYUlLKy9Gam9tVkNWRlZwRWpPVUF2dzlM?=
 =?utf-8?B?cTc1MjU5RUg4U2kzWmN1eFJHWk5qOElmTGNuYXNLMXR3Zkd6SFpUcE85MFBJ?=
 =?utf-8?B?WnR4ZDF1eHNuVkNzWk5IU3I5QTgwdGg2SVRiRnZsblJlYW8raUZRNC9wS1lK?=
 =?utf-8?B?UzRNelRtSGhzYVROQXMzRnhoT2lzS25zVHZXOTFCK3d3TEcwWTNvcXYzV1Y4?=
 =?utf-8?B?NklqVHBMWU5BSFFPR1JhQU5KSGNRMXZ1TXNRVmM1MG5kSm5JVkVGU213WDVR?=
 =?utf-8?B?aWtaVzNRbVgza1dwcXU4K1FLV2lEZll4UUpzbVMwenhEcTFPNU5JYVpWVFNU?=
 =?utf-8?B?REplZnhlVUw0bDl1d1F1bWZSR1dDZzlGV09FT3VmR2tYQVJiSk1jYU9SVzRo?=
 =?utf-8?B?RWpNTWVzcVNLQ2VZbkVJcmIyemdnRXRMOFZWa1F0bXA4SGVwWGo2UWZTUEVR?=
 =?utf-8?B?bjY4cURIQWZaOUxNUEEvZHcxLzA5YmFkbTNPTHRNbFFMNzdtZVJQSXpMa1RQ?=
 =?utf-8?B?UzhYRTYxTEFBVFBveHRvcGFTTDJGMW9OYnR0aUhybkFFMWwzU2I2aWhXTm1H?=
 =?utf-8?B?SDJmYWUwS0s2ZHhDcmpMZDI4WTRURkJSdnpSQURsT0gzNlBrUFlUQkh2Vndq?=
 =?utf-8?B?RkVEQnpZSXhQMU5zOUFlRE1TTUFZTkdOSHhDZFo0T3l3bG9QRjU1Qk5kbHJK?=
 =?utf-8?B?NmplelZnZXRyYk9kNUFZQ2xnRnY4bENmM3dQUVI5NHRvU2cvTWR0SlJlRnRp?=
 =?utf-8?B?Y3F2SFlPdU1lakFSZkI0L01ESmdoNHpvT1NXRWVQT1ArZEJhSE5sTVlETXVv?=
 =?utf-8?Q?m2rMB3cMbZ+iR3H6uRliZse9KlOg2wKrsICpN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978d995f-9211-4043-0326-08df19aebd86
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:10:40.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4k/ywipXMQeP3Dtu9h8Qefa9Gw7kl81O4kh3ovwx0OHPsYNOdcxZOQGVvvoj47UYF9FIq4EjDW21NgyNButugXQB0Gq/5gg79LGxPD7EjFj9/uVCHea3Qqpb5/A60qC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131046_184066_3FFAA328 
X-CRM114-Status: UNSURE (   9.19  )
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


On Mon, 14 Sep 2026 14:53:11 +0200, Stefano Radaelli wrote:
> Correct the UART8 header reference from J12 to J6 on the DART-MX95
> Sonata carrier board.
> 
> This is a documentation-only fix and does not change the hardware
> configuration.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
      commit: 8912bc10501ddb0d9b9ad450b21f42110b6bc619

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

