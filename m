Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D2ED41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgpEPCHtoxOU//DTDxtoXSDKXPdjdESsDfmNgRYCxdk=; b=oQpkCpgJVVi+KOMx+vtOvYtYnX
	VLghlATd2MMe270ybom0ljphoXIqR928cJGSc32KUcm3MYXmGVG3xcugZPc/YNKtkd5FTMajhmZ5E
	WQbfi4deCgGEM91BPXsXNKuSitqbKDaK6i85Zgp62SDttXFDD3bUPcit6BPHq+L6Iuq5Sv4I1GMtA
	/SF9COtxIHwdvaCO0z0U6aQKUzIG4a1TyG9ZOINDbFQOMIHVZ5seU6+19veEdrj6fTRjUOmsOQukr
	5U5RaLdoPAZngMzeNhE4Y3vFOExrMdOhCukdHtx6GNF/O2/O3Nnt0YtoIodGfylf20rCHI2z6GuGY
	2jEQ6bBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAknZ-00000002Nfa-45Ez;
	Tue, 12 Nov 2024 06:54:50 +0000
Received: from mail-db8eur05on20707.outbound.protection.outlook.com ([2a01:111:f403:2614::707] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkl9-00000002NMI-3xof
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehG2r4Stw7UMQk2lrNM7GP1+rsL9UAUjWkltCKZdLLHL0I6aE+3GtFuLi9SAmU3d6q97u4QzUJcyiNg3HNjKlJyTHEZzvW4m00A7xFzTClOuBEdN8eHdX4flhS80ewZAtqMSKyb/5xySwi6mQvSj536TclsF35TOTYtUIqoQx0YOIMnloIpWLd7c4gRduljiQKp0OBBCQ1JIlsJwzH+Zfzi3GemI3VPSWDXFGJ0QzYfMbmNPyRcDAiJTuMmmNo/OMlYfpLhVNZ/54vNiVj0xZVat6Fuc4hx4KCQ929/KQ/IrVWmogL7TPGRXX6bBXrLaPM/5in7aRpBpFncaOCOj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgpEPCHtoxOU//DTDxtoXSDKXPdjdESsDfmNgRYCxdk=;
 b=MZxzzz4R5w4DCnTRUvOcX88kZcSkNAxUZKsS6QvuCAoy3EACgUH2vsXQykwRBzZ1xCY//br5XBztQYFxFkhDD1AYVC0sIaa+FGs4kbrLAeCEqckv1toqHDi2CKYcdNDa+vyIpSim+jKa9AnPtTkmj9s8n0ATKtJOB1GOxUiglHyiUjp3ezM2wGW1fY5vsMeMPP1bNcEs7Y91nsyY0veCuThZE4B/sGiG3RZzb98rlQBzSANPOE5DIfvrvl17WZEHjr29LB3yPcKkf74hHHQdS4DwdQUnt0yUAQZL39pY9kHlWNDwVNrQeHVh3aRAAeOHSAwcUmR0zI9IcaqbkvFomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgpEPCHtoxOU//DTDxtoXSDKXPdjdESsDfmNgRYCxdk=;
 b=KHMf9btXFvqFU1BxgPXStpiZ2+XlHzi3SlyUvVVzbCnZBvbZlOK+6VrhqCTcYHXga03q4xkXc7DA+7VDprFnIUv2jy14nHG1DieUbeb2z+Y5YOGQ7Yh99A7RUEk7ZkhP4JE7gQOsaVWFnRVOOjmzWVgi4tKcsbMelOvvQdsn0Pk=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by GV1PR04MB10654.eurprd04.prod.outlook.com (2603:10a6:150:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 06:52:14 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 06:52:13 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Jon Nettleton <jon@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH 1/2] of: add support for value "false" to
 of_property_read_bool
Thread-Topic: [PATCH 1/2] of: add support for value "false" to
 of_property_read_bool
Thread-Index: AQHbNM32GnV3W6Mt9UCo8BZSzCrDrbKzNTKA
Date: Tue, 12 Nov 2024 06:52:13 +0000
Message-ID: <0f81c87f-478e-4f03-b7bb-ac33915340ed@solid-run.com>
References: <20241112-am64-overlay-bool-v1-0-b9d1faff444e@solid-run.com>
 <20241112-am64-overlay-bool-v1-1-b9d1faff444e@solid-run.com>
In-Reply-To: <20241112-am64-overlay-bool-v1-1-b9d1faff444e@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB7586:EE_|GV1PR04MB10654:EE_
x-ms-office365-filtering-correlation-id: 28f24e53-193b-4f43-1f53-08dd02e68a1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THIwODErSXJjeGgyaWVhS1NIWWxRdjQwa3Y2RWJUVElYL2ZYZmQ5ZHpYUUdh?=
 =?utf-8?B?aiszK0dXaEh3cnUyYVlDM3dRd0k1V245bmt1R1AvaWNyR0RFTmlKNkNHaEpo?=
 =?utf-8?B?Z2UzUlRCT1NhOGkzLzkxLzU1dVNja242cERkdHZJOW01dzJ5QlVIcVQ5TUpK?=
 =?utf-8?B?MWdMREZnY3drUUl3bGFuU1kvSGZ6UGoxbHZPRXk3M1NnMW1WM2d3dUVvUjAw?=
 =?utf-8?B?TlpoenU2OEZwaGthRlFicXNYWE81OUJVU1dTa01YT0FyVW1JNkMxbVFRUUFN?=
 =?utf-8?B?Y2lhYmtLU0FSZ3B0S2huQ0tqcUowRTBKY015NmttaE9ZMGRHRk1GdkFGbndm?=
 =?utf-8?B?bmIwcmlJOU8zOFVHQnVQRzZkYmc4b3VvZDUzRGdaeGNqVDVxOFVBZ3NJR01n?=
 =?utf-8?B?c0I2dmNMU2cvdG5sQWpzNWJjVlFvZGErRTZOT0hQSDllUW5UaklWRVR1ZXFO?=
 =?utf-8?B?V0N6ZVlzdFR5NVl6NlhFa29UdGtMSFRMOXZtc1hsc2pibjhYb2VVM0xzOUZN?=
 =?utf-8?B?MVVMcFRWNVpDbFQ2YlJMYmRxQ3czZjFIUU4vVUlhUDEwN3FFVVhCc1NacHNl?=
 =?utf-8?B?b080STFkUUNqZ1hKSW55QlY0a2VySkttTW5rdHdiaXhJNWVIeGxLSUs1MGlD?=
 =?utf-8?B?eEJIblk4ODVCUTBuTWNjYVUzbE5mYVBUcnBzVFBXelBaOW4xVkIzdm5LL2Jm?=
 =?utf-8?B?OVpZUTQ1bkxTU1FBb0RlY2JhUGlQTUIrMElEeHVMNWZMaEJ3bGtIWDRGU1ZC?=
 =?utf-8?B?YklyWVhxUndUK3ZjUk03ZnZlcWZiYXRYNVBYajJoQlpEclo0VEhPalZUM1ky?=
 =?utf-8?B?aERJbmJVb2lsUGVCRVdEM3IyTlQvcXFRQS85ejFNdzdFSGZCVERWSTdlNklT?=
 =?utf-8?B?NXdDS1NEb0dtS3U1b1Jtd0FGdU1mbi9OU2RONDJvN0ZXdndMTjhURXBJUzJC?=
 =?utf-8?B?eW9wbGwyY0VoOFBzL0FDYWxqaXdrWTZ0eHZocGVFL1h0ZzIveWNNZ29KRXdt?=
 =?utf-8?B?N1pkNEhtRDNFMW9jQ3ZnWkpVbnowZjY4QU5DTGY1VVpLMzV2Z1VjNEJxTDZi?=
 =?utf-8?B?MU45dUxrMXh5U2NWU0tOaGNObHNIZ2tRdFNublFvbWtNUFdIZUROeDF4THBF?=
 =?utf-8?B?emxNTDlzdzhEd2hCZjNyeC8xZ1graXF4RmF4MUVqVklqR1A0UlJXZDJXc1pJ?=
 =?utf-8?B?aTZEdTM4bXFKbWVBZkpmTEtZbFlxYjZjK3M2VzFxTlR6RFF1anFBVHVjczZI?=
 =?utf-8?B?TzhaeWNiRHNrUmVPZnVvUkxrTEFCUzRObnM3UytQNzluYnJPNGVPWTNnc3dN?=
 =?utf-8?B?ZkF5TGRwNGdhVGsvMDU1U2VydmxKNU1jOVdUYTBQdm9VYjlsM3FNaTl0a0lD?=
 =?utf-8?B?d1pxT1VhOFNVVk1LZUxGUG03THR6OGd4TkIvV1U3WkRtdjRjMmZxcWNXV1Zs?=
 =?utf-8?B?MXM0bnFvckIvbHQ2SVpGOXJXU1NBYXg5bmY1d3VZYnpmSzZSMm9QbEQ3aTBn?=
 =?utf-8?B?cjRrRnlpTjNqQUNFZHRVek0zd0w3NHIxY2phRmZCMXNTQWg2L0xZb2k0L2NY?=
 =?utf-8?B?ZmtDMXhEY3ZRUWhtVnZLYWZUbDR6TFBOYWxucWgzZ0V4TnRVVXlFU200U29m?=
 =?utf-8?B?WVBsTWV4KzFHeXdQcTJodGVDT1dqcjVBeGJFaGs1TzNjbjAwMWpZSVJDTkoy?=
 =?utf-8?B?NXQ5NU81eFEvYlpEZEprTmh4Rng2M0N1SlhLVGh6RHZ5elp5TTcwQ2lpZDU1?=
 =?utf-8?B?T0xVd3lKOVNQR1ZWRk1XQitFMUlGOXMwMzNHbCtDTmsxNmVMUGVweCttd1d4?=
 =?utf-8?Q?5I5qG2NCgIeRRkDqwL8sySUnBJ9pBow94XFGQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZLM2FRWmVSZmx6RXljREJUTVRHM2ZUNXBKNXVZSHlidHFMM2UvWlRMNHM0?=
 =?utf-8?B?WFQwWm1ZM0VFV3dEbDMxRzZrMVBNRE8vMVowa2RkNjV0bDJqdWJvcEloaW5Z?=
 =?utf-8?B?TExIeUFEM28vSnVmT0s3M1dEdy8vSTJMNXpjWjBkNjlHTXNWWTJ1dnp4MFgr?=
 =?utf-8?B?MHlPaFlZZndoQkdmMTZjWFdVNXNjeC9NZkwzUERFSHBVRGJzdXpIVGQxZllv?=
 =?utf-8?B?TEg0bTJGQ0FVQ1NqZVFrb3VSRmU2M055ZlF5Z0VJZVJGS1VzM2FNbXNXOW53?=
 =?utf-8?B?QmVLWUxWOXdVMm1VL3JQWjNDK0puWkxIWUlaUjBsZk9Ea2NJZFV3ZjQzUUxx?=
 =?utf-8?B?QW1kVnZwaW03YlFTSW9xbFI2TnNUVXo5d2dudkMzOXRHSERIaDFuUWs3VFVI?=
 =?utf-8?B?bVl4eWYzTDR2RzIwQVZpdEh2SEMreFdPeTE3RW9Rd25VWk0yRzE0U0hoREhG?=
 =?utf-8?B?ZkRUcmttNzM1MjRTVldkRXFucjYrUEoxd0owZmJOd3JsS3FVRXhTOVF2U0hU?=
 =?utf-8?B?VXRlUHFmVmVhbkVDc2RaeU5YdTNnSTZxQWl2UjdLRjJJWFY0aHBjU2ZKdm9t?=
 =?utf-8?B?a1k2eE9LQWxYVUczQ0FTVEN3R2xWNXJHR0FHRjJ0TW9xZS9hYzFWVWF6QTJy?=
 =?utf-8?B?L2F0VDR6UjBYQk9vaitxMGJVYUtHN002cUVlY3RSelk5THVjR0NBSHp2NVVT?=
 =?utf-8?B?aTRsK3VuL0RyMDFYZFBBTHJINzhqaXY1b0R4d2JMeTdKSERnM2Q1SnluUFh4?=
 =?utf-8?B?Z1pXN0pNeUV0U1lLb0ZERVJHckxyZ0sxdUxiY1g4NXp2UXhkME1ldStOUWxo?=
 =?utf-8?B?cWwzemJMMEZ0YnRkalFER0dGOTU2SnpMODZ5K2Rqem11NDR4TEw0ZHNINllo?=
 =?utf-8?B?UmFHajNCTW5XSVhIR1ovVlp0bkFUYXMyQTFJRTRZZmFpMFRta3BqcUtYZktO?=
 =?utf-8?B?N1ByN1ZSd3dmZFdTaVdGK1phNTh6ZlpuNkliMnVucHhWSnlQeEtobHBRT1pO?=
 =?utf-8?B?NHU2cmVTbG5DeGRCWVk2UmxDSU9MSkd6U2h4RlJpWXk1aEtDRG4vYkJUUGRs?=
 =?utf-8?B?ZWNtYlJaMDU2ZTJtR2hTYUlBWjhHZjAwZUF3Zy8wclBVbUVTbU9iWG90QXhD?=
 =?utf-8?B?NTNTSGJpV0M5cElEVnZUYjh6bzdORXVaL280L25ZVnRpQU5WaHFKV1Y3NW10?=
 =?utf-8?B?RGd2WktPQ0VncDlrZEVnanlKYnFOTlJOYm1hRXEvZXd5RHNSQjlnVm43eWNt?=
 =?utf-8?B?RFE4N1AzdkxkcjdWWUdOTm0vemRseWFTNjhlZXc4djJ2Ulorb1NRMS9JZHdE?=
 =?utf-8?B?TVpMbzljMDBlWWpXWm1MT1pFNnJrUlZncFlaK3FJWkl5OFhiL2ppMmNlWGQ2?=
 =?utf-8?B?bjhZcVBiM1NnUVRZQ1hpWTdXRnlzNDY4MG5iUnN2T2VVOWxKZHhiaGZ3U3Ju?=
 =?utf-8?B?Y2s2Z1dEdFFqa2tzVlpneGJOdDEvZ1pwMlhLZnpBbHJkQmVmNHpGQXlkQm8x?=
 =?utf-8?B?dC9jSEo1eFpiMWE4bGJ4MUpiWEk2OVNrcmk4cElNZW5vWkZUUFZDTTFyVzh0?=
 =?utf-8?B?bTdBZTJ6WmVvOHVIRVY1RGFqOVFNMEZaSzlRSkNMRkRaK1pYdlBnOG9PdW5i?=
 =?utf-8?B?NVdnekE2VlhyaEtxVjhrZGJMOEpVMVVCbEUrd2U4bUUxbks4amhpSm5XZ0E1?=
 =?utf-8?B?LzJBdHRtd3dNNnFyM1hOWU5NUWZ3RUFIOWxMYkpWN1BJWThIT3lZWCs3K1A4?=
 =?utf-8?B?QUJDbmhXcXZEWXoyRERSTmlFTmpIclJKTk9jclc3VUdZT1BSd01nenB3T3pI?=
 =?utf-8?B?bC9iV1N3QUdFNnVPbTlid1BFVFcwcVdBT1BrYUFIWlhpN0tKNGhlUStxTDgy?=
 =?utf-8?B?Sm8rOWU3RE5EWDB1OXo5eVBWRmFzdzNvMmRWbFNTd0NSbk9uRVRJYUFJVjJJ?=
 =?utf-8?B?Wk5Gblh0Qll4M0dyYnAzVmx1VzFOWDE2NjdvVlVBM1NBOEhDczRodUpDWVo2?=
 =?utf-8?B?V1F1TXltWXErb09kamsxMjVpc09ZeUptQ05FMmEycGJ2TW1vajR2Q1JiNVRE?=
 =?utf-8?B?Z3d2a3JkWlpKdE81MTdrTUxJaXlrMTQzSVFrR2drUHoySmxNYmJEbis3VWlz?=
 =?utf-8?Q?Jd2c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <943F26BA9723D84888887DB2FC8CCD21@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f24e53-193b-4f43-1f53-08dd02e68a1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 06:52:13.9286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1clSwmGng+HdeYn+4t8WzXIh9Xm06BvbVLznWlMBxs/+CSw/tiKyCy7NWRvO2mAQeHo5QSpK9nMg36CYQCDi4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_225220_011467_03D42FC8 
X-CRM114-Status: GOOD (  17.85  )
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

QW0gMTIuMTEuMjQgdW0gMDg6NDEgc2NocmllYiBKb3N1YSBNYXllcjoNCj4gQm9vbGVhbiB0eXBl
IHByb3BlcnRpZXMgYXJlIHVzdWFsbHkgY29uc2lkZXJlZCB0cnVlIGlmIHByZXNlbnQgYW5kIGZh
bHNlDQo+IHdoZW4gdGhleSBkbyBub3QgZXhpc3QuIFRoaXMgd29ya3Mgd2VsbCBmb3IgbWFueSBp
bi10cmVlIGJvYXJkIGR0cyBhbmQNCj4gZXhpc3RpbmcgZHJpdmVycy4NCj4NCj4gV2hlbiB1c2Vy
cyBuZWVkIHRvIG92ZXJycmlkZSBib29sZWFuIHZhbHVlcyBmcm9tIGluY2x1ZGVkIGR0cyBpbmNs
dWRlcywNCj4gL2RlbGV0ZS1wcm9wZXJ0eS8gaXMgcmVjb21tZW5kLiBUaGlzIGhvd2V2ZXIgZG9l
cyBub3Qgd29yayBpbiBvdmVybGF5cw0KPiAoYWRkb25zKS4NCj4NCj4gU2V2ZXJhbCBwbGFjZXMg
dXNlIHN0cmluZyAidHJ1ZSIgKFsxXSwgWzJdLCBbM10pIGFuZCBvbmUgdXNlcyBzdHJpbmcNCj4g
ImZhbHNlIiAoWzFdKS4gVGhpcyBzdWdnZXN0cyB0aGF0IGF0IHNvbWUgcG9pbnQgdGhlIHZhbHVl
IG9mIGEgdHlwZQ0KPiBzdHJpbmcgcHJvcGVydHkgd2FzIHRvIGJlIHRha2VuIGludG8gYWNjb3Vu
dCBkdXJpbmcgZXZhbHVhdGlvbi4NCj4NCj4gQ2hhbmdlIG9mX3Byb3BlcnR5X3JlYWRfYm9vbCB0
byBvbmx5IHJldHVybiB0cnVlIGlmIGEgcHJvcGVydHkgaXMgYm90aA0KPiBwcmVzZW50LCBhbmQg
bm90IGVxdWFsICJmYWxzZSIuDQo+DQo+IEV4aXN0aW5nIHVzYWdlIGluIGRyaXZlcnMvb2YgYW5k
IGluY2x1ZGUvbGludXgvb2YuaCBhcmUgdXBkYXRlZA0KPiBhY2NvcmRpbmdseS4NCj4gT3RoZXIg
cGxhY2VzIHNob3VsZCBiZSByZXZpZXdlZCBhcyBuZWVkZWQgd3J0LiBjaGFuZ2VkIHNlbWFudGlj
cy4NCj4NCj4gWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2
NTEudHh0DQo+IFsyXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcGNt
MzA2MC50eHQNCj4gWzNdIGFyY2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAvYW0zMzV4LWJhbHRvcy5k
dHNpDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29t
Pg0KPiAtLS0NClBsZWFzZSBub3RlIHRoaXMgcGF0Y2gtc2V0IGhhcyBvbmx5IGJlZW4gdGVzdGVk
IHRvIGNvbXBpbGUsDQpJIGRvIG5vdCBjb25zaWRlciBpdCByZWFkeSBmb3IgY3VycmVudCBtZXJn
ZSB3aW5kb3cuDQoNCkkgd291bGQgaG93ZXZlciBhcHByZWNpYXRlIGNvbW1lbnRzLg0KDQo=

