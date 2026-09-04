Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26711C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=; b=ayoFmHC5KAiEJTlniuGaGmtAF+
	JqX76fI0kV1w7uVEXWQtA66BeVrUT5znEN3PiplBMFSU4Pz3nLBUUHSoLTUbsyOO4gkU/3aoX9ZRr
	7Ytu6/KBv1s6QDb0KQagdw/OMJUBwn5xvOJIFDMinAiTVTKqfzGw6dCJM72z+bHeCj5TnUfFhzKm3
	m6K9FhmFDqSEziUH9+jsJioLKtc9SXJFbpXcxKFRgkfkJBsIP9laRHPA1otWa5DyrD8Fblq9QGum5
	QUkZztOS92LB+pL25NwyYD33wE19mBJ0SE5fPUikw9USQO4sA014tqbq/eDqrNYC3svBMm6mTCOn6
	4iyWO9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NOF-00000001820-1J3x;
	Fri, 04 Sep 2026 06:27:07 +0000
Received: from mail-francesouthazon11011054.outbound.protection.outlook.com ([40.107.130.54] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NOD-000000017uS-2FKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKIleyVnK+ER8nTmvfvKr/x9QYgFNYT7HGmjQjJ128ELU3t25zPaGXHHEhTw33hsD7Cr7OVKvZO9H/iRnQAVwfUhADZjFocgv8iaath3NAHpICAO0d3D1NMAgQHUV/GqLpe606WA1ncOGIAmeuWilJ270iygdvBJqkNcVnqHIn7pWl6L4w3LBGyQPmiP7Y8hFsKbqKC1gdVfr5m+0KnHzD8qsmlGRSvEfmCFXgd/FhVd7/+qu0jMB0k6gGvPQE80ZkDM1euG6cQ2iXLWKCGKeL9I6MDm2rQAlRThn3tTi6WUs+X4UgkyEQeWshOXVHwIFK8rk3nLz91zKGeHfhaMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=uF4NSytHiMa0nt6xQTRIStRqkmur/vWcugZX9UIw9B82HgnsePIUA6TMg+o/J9ehTCwGZTk8JMLnQHjyIIyzfxRnWDfRDhzybdIbTD2yy6Pd/TQJphBMzddOd3jPW4z5tJUzN3O/Zoe0+8B1NOMltvcqLm5u1t2GfyZ0QQE3dbfZwyKesTaQdp0StQji+j3AO+1/TDDD96e/jRjEe4oZwdfU/x7An2nUxP3ti06CJ09/CpQ2fRE/lmUZ606WBZ+m9YMm2g3Bh4UwabC+kINWr4wfbCEZrSTYOqnLtB1RgTWEskr3WPMn4mGBsl1wlj6SLN9yZiaZ7ZKosd+28luijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=mzw7JBsNQPP8+EPFkOzFTsjCn+xVV22m/Jy4YIVjcJ/53vFMKTPTuf+1pc7xLn1HS8k9UFhqycGv1FmI9RuR1NapV3CRtkv5VrbybdwDkdLCOiGZKxEHBlpOfpFaYFnYpzZK0jOUbpT4GzZi6b4weItuKfBabLprWKuACzmSLmctaxADZNRU2/Iky7nojYopx+FHH4f6CBSI8hsA+yBw0vVrOY4cBKHbim7JvzH1plKpl0CGYYJiTklxRz9mJIA6F9GMhZ9JCGFLXqB8DLjQz5VbBABca1o6lSjemsBl13Z7kpCxsDtUBudYdXtTNV3BHhJtB5jP4PILSGydCSNLJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB11395.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 06:27:02 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:27:02 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 17:26:04 +0530
Subject: [PATCH v47 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v47-6-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
In-Reply-To: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788522985; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=n79+e4SHn9p7dVKm6Elf3iX+DizwasCJVVrbHAfXW7BMrc+NR09exqLDGAURJAqqxjDC0qwpE
 Y+vAEZJYNJhCSV4DATTzXWtzvtWeoFGMqsX+KQONHcXYy522j+XQlGb
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0306.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::9) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB11395:EE_
X-MS-Office365-Filtering-Correlation-Id: 41207ce7-ec91-4d54-ac80-08df0a4d8801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info: usCln/p9qX+9q9TUEt7ba9+hluDUuMtlKIQ0HtsXN3g1dLBAjHV2g/k+lYXazCGC1y8xFUodjUhWU6GKMnVlQr7QxD0P05hRb7pGkTJPVyHaNlzDOPYjL3S9H6hliar36GWAgwnWGv2qBDvULvoFX53EfLlaC/9YiimgOLpa0pvTo+4gwJu8yoPpm1vfsi/Zz3Vnd7OZ/b9xPWES+jgUsUtr9McNsDu/3iSFRWnccWTit/AypwjiCGIgEZ/dwY/h3BAnrbq58ybN6wPY+Wc7uGKQ5n+VUbXA5gTvgRWqjSxeOi/NpH4TNms++KhaOyzezyydfHeEBOmBGD0lUPHAynGT5AgdoiScVqgcUWaKkhpsQGVaMhKaOypVP9EJl2H/UPPN8Ize1CGR7zaxbyhRz8IhAJGM3GDT5bXLm9JdWSAlOdron8fGSm4Yq9JYrP18aj0unUDbV+YWTCBnrjh4EQsCo4kFHT+D1w7a8d5E77tqxCnYeUYLkBg7vBlwpkv++rN5d9zHo3qYsT+50CkTm3DxBquMdRs67hSZ2oxevCLd5clRlZzYEGQ3yh7Gtp0iWc8ru59w4VizCEs4497q2wiD/n0CO8g3kGgSc02ANnY0+mli8VdinF7mzuZjt0oKNx8RlTJPnlQV8cmDiSLZK/bTIDdH34MFNb84eunQgdW/jMZARyPRjtu7t8FFmyU0hFHy5zd4xmH+vNWO1EtL5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1d5NmV5RlBFbDg2OU04YzZMbERPT1lBcmZOOWV6UkRDWENTWnI0Z21WREN2?=
 =?utf-8?B?REdKMFhQLzExMjBvQ3RYL1h4L0VVUllMYUtlbFhaTEszdEZ5aDRCUWM5Um0r?=
 =?utf-8?B?RXR1L0RzRzBxaW9zbEJCeVM2ZHQ0cXVRN2lxWGhYbE9YMThZbStoaGgrVXNh?=
 =?utf-8?B?L0VZRnZvcENqTHpkaEswSC9tSnFkL2JqYmEzQy9RdG8wMGx2L3hYSUo3bDNp?=
 =?utf-8?B?Y1BZOGErUlRGZG1YZDBFeldJYkpyMFRsam5XN0ZKUDVMZllqQUkzdjgrMjEx?=
 =?utf-8?B?SVdPZ1FYZnNTWDROWHhaNHVsK28wN0tGMWx1azdtc3czdzFZdm1TU0JXZ3RJ?=
 =?utf-8?B?Ym5oSjd3a2JLZGpHMFI2eG1pTkJSQUd6cmxxV0Jpc016NndhSmdZbGZoSWFX?=
 =?utf-8?B?K3F0YXBVOGkyNWwyU1h3bG1Ca283STZSNEd1ZDU0L2xtaU5yWStjeG9iVjg0?=
 =?utf-8?B?YWsySXFZTnJubkFzWjNRSlVMR0s1eXZsd2FQS3o0cC9oMW15ei93VnNkZnF6?=
 =?utf-8?B?OXZMTjlGbTdFNlR6NWw1dkJPcERualJuNGpzR0dkM053NEs3TVBLd2VIMmlv?=
 =?utf-8?B?U1E0TnVEb0ptQUM4T0lJbXEvVm5MMlBMTk9iQnFIak5IOWhiWHlydWNFb3NH?=
 =?utf-8?B?SlZWTWUrbEx0enJNZStlVUs2NE83blBveVUyM2Jid1krZjI3bVh1UDdzKy91?=
 =?utf-8?B?d09tYUgyTlFEcnh6dVlBUjZra0x4dkp1M2dpeFpzRlA2NjIzZ0UyTWlxU1c3?=
 =?utf-8?B?LzhiVXhLeWZBY1VFOEttRUtOSE5pWGVSSHNzNWdOZ1BFdDNWZUJBUVNTeUpw?=
 =?utf-8?B?S2pOcHpTVTQrSG1xSTBxNmtjdXNPTXc3MzZVQmplUUE5R2hWMUpZY2ppRS9h?=
 =?utf-8?B?SkpvcUsvbE1aYkM1R3RKYjRCVFFrQm1jd1RqN3pvMWd4QzEwZnNnaTRhTUFI?=
 =?utf-8?B?TjY3bnRlaG1TWlB1U2tldFV4dm5wS0RLRUJmWTFUS2lsTGhVa0RWek5KdEk3?=
 =?utf-8?B?OXlFZGJkejZpaFI0MWttNVBKbG5NTmx5eUx5TTBDZFVoQWxJdnZOaEVEaUEx?=
 =?utf-8?B?UXpQSFk2cm45VDFuOFM3K1ovQVF0eWZjVWE0L1F4ZFE5aGVZaHN3WkZRdElH?=
 =?utf-8?B?c0s5aGphNE5PNEhWMUVaM1FYQlYwTUtPUVFxZGp3NWV0ZWQ0RFQvblZ2OEx6?=
 =?utf-8?B?TlRneHR6Nkt4dGgxaU4zU05IbCtLMFI2d1NDM2hXOExEdUdjTmdUSDN1Y2Ju?=
 =?utf-8?B?K1FVMnZTVDFYajRkQmVKQ1psOUFSck1adUNJRjRuRWVHa1N2QjZ5cTY4dFpW?=
 =?utf-8?B?TjRSODZZdk5pT0x0Z0wyWktaRlM5cGRsTUNCLzVMOXVGNytWb2ttaVNpUVFw?=
 =?utf-8?B?dHVIWkswZjcrb0Rqa3Q3UzdhcXBEbldYRTJRakhZcFJKTTlnVTJqdUk5UGMv?=
 =?utf-8?B?NlZubVhmNVBIK0l2NXJTcHA3ZkZGRmxNOVZmRnBnazE4Z2xWWFE1MXI0WGJy?=
 =?utf-8?B?YlBseWxiaFp3aGlUTGkya3drSnlsbXVFSkRJVUVYcTJkQVdBQktPajZydFY1?=
 =?utf-8?B?SGR4bFBzSkNYUHVReFZhWGdIM1BPRG5HMENMUXFYamthRXZQa280cTNwc2xt?=
 =?utf-8?B?OUFIMGk4MXVQVHIwNVNMU1AzVExTL1FBUWdIaTlhaGw2QjA3dTlMbnVkZFY2?=
 =?utf-8?B?RmUxTWYwKy81N29JRjRlLzdxWW9BUll3UmtkOWZzbDNweURFTGxXUXNnbHpy?=
 =?utf-8?B?N2pOd3NvSG8wMUFmWnVpeHdTaDV0enlPZHpwblFxWWhaVlIrK3N6WXM3VFc1?=
 =?utf-8?B?WWVKS3ZoY3ZicjNaSmtuMmZDMWd6c3Bpd2tjOEZTT2FneEFPN1N5R2hBcGR3?=
 =?utf-8?B?Z3lZQ1Mya1hIRTNQRkhzWm92Qit5MDVrb3hzdDBGRzFYTko5c2xkSzRPOStE?=
 =?utf-8?B?dGUyanJtNENGa2dGY0FYWXRJRmtObDFiQVhrZHQzcnlHcVFYbjMzYmNsTktS?=
 =?utf-8?B?VGdOdUUvRmJsUDd1b2dwWmNLakI5YmN2UzZNQ0EwQU5FWnZzRmxLdEdKZGFr?=
 =?utf-8?B?V0ozZ01QS0pXS0haSHUxVXNnU3hFTzJQQkQwM0QrMDg3Q3Rralo0NDA3b1U5?=
 =?utf-8?B?NVlTWkJtOUI2Vk9WUzZGNGhGVVRRZG1rQTdmS1E1cktuSnhzc1dJNDJ3d0Ns?=
 =?utf-8?B?RVBHMHVhdlU5VFA1RVZCZXcranFZQ2N6TEVWRG8xTXB4b0kyVkZWUzJSSlVq?=
 =?utf-8?B?UTJZdVN2dGNLRXhnZ0JJSXdsYW9QM291bSttOG1FYURvQ2NrMHBwdy9vVkps?=
 =?utf-8?B?RG9PV0RMdTdKbjFZbkpKVnl0MnQxS05xV1RTcHZBK25xVm80TTJQVFc3ZUtv?=
 =?utf-8?Q?ogrwFhCErXoqjwWcKLNK4vpMQHmL/l4jsGx58?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41207ce7-ec91-4d54-ac80-08df0a4d8801
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:27:02.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ge5u4k7ZsjswUWeOpZrphCp96dQmTCl+VWZBhT+hZtpz56DgqS0xPF353Utsk71C8UMBYX+1Qu2SeCtoZq6Q56+aBSvvv6qma97kE/YHWUrsxH9bI7Ca7tQFIjAxRiRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_232705_589414_D983AB31 
X-CRM114-Status: GOOD (  10.89  )
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

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


