Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DBC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=; b=5GzZutsKe8L8hlCpJB9iY1gB/k
	MZ6sQT9MoPRGVhY3TOwkimqMSSlV3NV8VGuwGr9E7nEU31RWMWUebpzjBZLu18acXqwO1UJrnFmfV
	5/Y435IWlagjMot6w1/Nx63sMPJM6nIz2as98yIFI6XFs4gG5jnA8YcpiaOUnxOhLkQCdivPwjegu
	NhEoOBPksaH7G37xLcTI0TR4/J3qKE/sMpXRyN87HaekJ/MOLHe7W5d64zQdJF98rNYK2ySHhXUc+
	2bkhIiYCZ78BqefWS4mPWVvpdieYNmwUvH0Xe2FzetHQaa+hG+Jx4xdJVc1NmjN8NszQF9E5hqz1b
	BMai38mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR71-00000008bK8-35Yt;
	Wed, 26 Mar 2025 13:48:07 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQpT-00000008ZVu-3Uwh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stdiru7Aw+TOZpc1C09xPpMb6TEXTkef9Q6wZcjcBNREX6baJK9TP0+dlN+airhSFsFHt+TOz1o0P8XPa/gzLiuHNMQ7AcZKNfBYHaezXmKO1IxP7OUGiBxi8SLeFY+iaZOyf1P0W6AfjYvwXHN0h5G3LWlcpmhp5ajyEd+1DFrYWMepR0La4ndB7S88MdPs5UBsK/pJQ//khfxpR/PZPQZByzlvbg923CZ7oKcesW4xDea+mQMo9vEhaRmzR5NUAA8sf/d1Zb5YAVHKui3iCIqI61DoN5Co2mLnjqa3JkffhMFwA8c5Mk2391ilbCCU3puT90TUbCXKuawexjxzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=GjIIFYbk7w00QRby8hl7lAk6ZgyUbwI0dduyW6cJwbtgw/p7gLrrGxBjmGIG0R1FNqmmOGpdyK/pW5RB5BY83REvUMSTAFNn3lVPjcWCAlkTo2TyCVQ75BL0jmY/LhVwzC6frBDkKiqFzXcrlVPx/yKVxyEahg8axylGKkjEuSfDLXa00Lz9wxtqJ/KDmIi7Yj2lhuDgloChZnkQ1TXtZnp13xYR/XSubugbh6t7FJtFxb8RxQiKDj63MMbkqyAlebOEZhL2FUWIXtVkTGoxYiV8Oeqlb6wR78J9Q9zWe0BsX6J0d3yvW5a1DBG1r2YwX1qQ7Gd6UKBjO4NSnnAtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=TzktxxxVbSF0/H0pAnke2bVMr66tA3W1h2zoSbVbJFpV0Qfwk8+MmbpzqGDdpEVR8IcT8PZWnfbMTPgFM3m5yr+aK/1Zk3w9iLMIGKMm66qNq2x2d7fkWCaA8VlhdSCFusi/Jdvbb7G+vAteBVnghrWwqGtzadi2Uq8ZF+xwpbyqKEVgeWwllV/Rmf/i3dmgnNLvVXXlgQLgd0MZhRD3gxvUeN+vZmERFStCHq74k+1T2zSwI2biamdiolXNTjL0Sa6zZ2uxrJIPbPdQkjIogiuxVZeVgTUU8fyhtqqNE/LeSFuNlpXOzOJD5smwfND3QcK19MPd64VrUaT+fi6qxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 13:14:59 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 13:14:59 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 27 Mar 2025 00:07:58 +0530
Subject: [PATCH v14 2/6] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-imx-se-if-v14-2-2219448932e4@nxp.com>
References: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
In-Reply-To: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743014302; l=3712;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
 b=p47sOm2XIWO1bZZ7uCPcKpirvf/O00U0/qnYqYBdBMpLqZ+2x+pGlr5EdLa8hLxzQWYa9DBP7
 ArMCzvOs97MDcAZ9NdBFtPZ70Ae3jPrscNGiL0APNOQWSAp/Tl+Vruh
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee1a811-c3cf-49b9-5e4f-08dd6c6835ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHV5T3ZQTmlIWW1sRWxsbVZlZmRiR0FQcUJvK3BCdmZIUXFtMkdlUlYvUEVZ?=
 =?utf-8?B?SGdJNnR2SVF3Mm11WnNqQ3BMY1JVc21VZEJTb2ZNWFo4SVkyV1FrTnNwZEtq?=
 =?utf-8?B?aGZiYmUxaXZkUmljbHRzVmlUTmFXVjliRGRMYmppZk1ITFB1R0FOS2RyK0Z0?=
 =?utf-8?B?SUNqM3RIMmpyMHE3aC9jRHZDRjBYTmFBa28wTzFDNy90QTEweTVMWW1rUUlQ?=
 =?utf-8?B?V0Y4QURBUlZDSjUwNE91YTdtcXBGSExpbUZ4SzZMNkFPUVlNY3dHdHYzQzBX?=
 =?utf-8?B?dWUyd0NSTGRYby9yMnhRWU1kTmRYMkJUV01YUkt0MklGMnpVRUpIanFsQ1pu?=
 =?utf-8?B?ZGlTb3liNFFYTndyR2dXSkM4bVRQNXN2cFBhSytBR0xDRnluQTE0dTlNZFNX?=
 =?utf-8?B?bUsxaXBONjV4ZFJOZHNUYVU2QmpQZzMvOWxiUVhORThjUFJTSFpzZHdGWTFM?=
 =?utf-8?B?RS93SWpySVNyUlVaU0djai9iN3M2UWI3aUt0TVdDWDNlY0JtYTVyL0h6TTZV?=
 =?utf-8?B?Znhyb0FZUjV1V0JJdXRESk1QN2U0d0FFOCtDN1V0VytYWVFzYVNwdDM4SkxR?=
 =?utf-8?B?UFZKRm5yMmlZK25MOHl3cGtNK09SZDRUK1Z3aVo3eW5IVlY2bWdFazk1OWlO?=
 =?utf-8?B?ak1Ya1NKSlRuaGxnWGxqekxNWUdZQlBJUjVhWXNSRkJoc3NjOUFwUmE0Ky9k?=
 =?utf-8?B?TWhhZmpyK0pmb2l6aC9aTk1ma28veEgrOC96UjBiRG5MM1NvQ0xraTE4NHlu?=
 =?utf-8?B?MW0zT3FsaVh3QzQwbzJSTVh5MVZTUkVSYlFBSmFGWHpLRmRjZWVJSmxWUzRE?=
 =?utf-8?B?dUVnSjBPOUlVbXdmZzdVazBsMWV0bENBRTBSbkxyNlRnWWhkQ0IyRG1ZQ0Z0?=
 =?utf-8?B?R3JleGFjZEhNWExkNXdqcXlMNzdXMys4aUpjZnZEbmFSdWMxMFh1OVJuMFFn?=
 =?utf-8?B?Yis3b3kzMG1QOFllL09QampvbWVQc09BOVIyQ21oclVKYndVTFBWK3ZnUDVj?=
 =?utf-8?B?Qzl4S1MraTNDWCtTQ0RrYTFIL1lvQ3NrSVF3TTVmOHI1bEthemZtY2pFa1l4?=
 =?utf-8?B?WExpTmlybk43TjkrRksvTFRiL2pYUVdiWVp6WUg0Smxjbk1QUW9QbHFNZXdn?=
 =?utf-8?B?b2hKNkZGK1M2N2N4Lzd6K2N4TmV2M2JXMlA3STViTWVmUnhtanBxNUVzTDd1?=
 =?utf-8?B?c283ekNMYk9UVDFzdW00TjNGQnNSOHlsVlVCUEZ5TW9zVUVyRkxwNU5ybnRB?=
 =?utf-8?B?TzZCbm1scFdmeXdCOEw5QVQrOUJLTzE3cWR5L2lHVVdvajd2VXBSYVd2RGxN?=
 =?utf-8?B?VDlTR29RdFlMbWJBRGhjZ3lSNTNxWlcydEU1cTBRbXA4NVhOTXRCbXZ0Z1F0?=
 =?utf-8?B?SHp3VExJamlDUXdHdHZtVHJqcllYTE9WNnIrZERFSktIQi9Yd2lwSU4zTitB?=
 =?utf-8?B?czF4L05HdGtkbzJ3TG40VC9MazdwNFFQbmg1SXFYN0tPNnZrL1ErRmp2VTlP?=
 =?utf-8?B?dW9GeHhBOEUxM3NhbmFHQlBiRUVsU2dOT1lRY2tlNG5SbkZoZy90S1gwajRJ?=
 =?utf-8?B?bjVLdzRrVUk3L0F6TFZhcjI4aDJpUzhIRWpjcjVuM0ppbGdtYms2cDhIRGFL?=
 =?utf-8?B?ZEE3cXVxeWw2YVJISytESzVZZEtZTUVGRDVHVlZUSkJRd1RjVXgzMEJpSTE2?=
 =?utf-8?B?K3REZXkzQUs2TStTWHIwdTNFUGNWTkcxQnlZSVpaQVhDYkJETlhUUnNrc29v?=
 =?utf-8?B?bTJiSlhWYUMxcXZlWkhGVGRrRUJFZWxqVUdHbkJmZjRBdTB1bUJwV2VLUGhX?=
 =?utf-8?B?WlVabDErNlh0RlNucXNvQmJ3cmE3d1RlMC8zMUU4YS9taHE3Yk14aCtMTTM3?=
 =?utf-8?B?QU5ZeE9DYXh5RW5aQm9mY1hEY0pvNjNuaXZNZUp4cE5CWWxWME8vSTQ2SVQx?=
 =?utf-8?Q?YS+3SLdPc6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09ETDluWFhXZmloaVBZY3oxcDg0MDZzYkZJN3JuRWdvSDVNTitwYitpMkZQ?=
 =?utf-8?B?aHoxTmE4OHp4TGNnQ1VHczVLdzNmRTFGSWRnVUp3TGlpUzY2MTgzZFFOUUp6?=
 =?utf-8?B?YTVTYXRGZldXdFBtSi9BRDhNNndvWTF1NHNraW9uUEovM2E5Ulp5L2l2RW5B?=
 =?utf-8?B?UTljTkZFZXVqbUJEYWZNY20vRTRqN1EwanlsdU45MHRaZUNRRlZlcS9CcU9h?=
 =?utf-8?B?bjBOb0tGellJeFF4Y2FpdGJpQnRIR0EwOVFOYjNFcXg5cEtBNVNhSFQ5bDBN?=
 =?utf-8?B?NHkvL2pKa0hyekJhT04xV0dUd29Scm9NYVJJN3VzY3lOZUdIT0dpUHVXTFd1?=
 =?utf-8?B?QUFidVNLTnlDTEpCVEtydVM2THorejNmV0xRN1I0U0NqM1hUbEg2bjdqL2hy?=
 =?utf-8?B?S3ovM2o0N1U0a2QxNmQwTlVrNXpJMmF4aVRSL2dodkYvZmRHV0RJMm5NNG4r?=
 =?utf-8?B?OTZOZWQ2YWhyYmppdWkrcHdXQVRJS0w1VFRqcVM3dGN1aXhDVGJGTHVBWFFi?=
 =?utf-8?B?aW9DcFBvakYvakI1azRQZmgrWXh3d1RiMGtuYUdiaW8wanFueHhUMmpHbXlD?=
 =?utf-8?B?WDVHK1Fac3pJdkdiSU83UnhES2ZsdCtuZUJ4T2xvWlYvLytSZzRBanhmQkg4?=
 =?utf-8?B?NE9UbjBVOUU5WnVKZlJVcUVlNmRaUkxGWUFZMllQakYvcVpFam5pVU1rdmZz?=
 =?utf-8?B?RS95UmRZZFBNbllwcWhzbnlKVGQzRk5lWlk0Mjc2Qk83SHAvUGpETmhPVkJQ?=
 =?utf-8?B?OWVGM0wvNERkVktsRDE1NXVVbnczbWNueWd1V0FmbnlsTUZpa0NNaTF5QU9Y?=
 =?utf-8?B?QjZOczJJSGFCWEhhMllzV2I5cjEyTW1NV242Y0dIMCsxTWVEZGdpMFFZZFpO?=
 =?utf-8?B?cG55Rmk3dEtpM3ZGZjlDTE5BZHcrcHQrTUh6NGkyMUxmTC9nU2pseE1yd0Fl?=
 =?utf-8?B?RE9YYVRGdFRzQkpFYlFsQ0tQRnM5cDBUb3JlTW1aN2ZGQlhWTGlpV3FJRllL?=
 =?utf-8?B?N2xmVkNCQ3lVY1hjSkxxa3RKQ0JyNENHaTZQY3JMSGh3OHNnUHJpN1k0a2ZE?=
 =?utf-8?B?MFB2M1BuSng5M2NqVXdsQ0x0TWFBNnplMm1Pc0tRcVdxZnBteFZuTWFKWUkx?=
 =?utf-8?B?UmtuVmRyR0JKUFVuMnhkeFI3VmJHblVaOHNVeXRZbGZFTWlNVVlmdzNuSWcr?=
 =?utf-8?B?dUZmRVUwdnUycUxCc3ZEb1RWRWdoSWtmM1RxRWdWdm5nbzg5UUNlR3NUNFZm?=
 =?utf-8?B?Q1Z4Wmt5MEoxdXB3VnVidnFISm56b0Uway9iWmtlWTBOM2xzMEpncHZReU9O?=
 =?utf-8?B?SjVGdTltYTR5ejBHcUNTYzNqYWlzSTB2ZDBzUzEyMWRVcXpQalFFQlA5WXZq?=
 =?utf-8?B?L1FkWTZvK0pYQm93WFVpUjRXNSsxMUVrYzgrOWdtMlpDZnROSXczcTBIV2lX?=
 =?utf-8?B?akgzU0l0UDRBejFjZG93TUgxekNMN0pSbFd3bUFiSXZtcHpERjREVEFRcFdt?=
 =?utf-8?B?dTJ3K3JvR2dncUozZHVMY2lpVzZ6WVZndHpHV1NvZWJ5dDl5dS8weEJ5TGta?=
 =?utf-8?B?d0E4YUVFL2VyTVVsT1h6UmkrUEtxcmF5NjcwM05zeGYzSXFBa3dGSUcrRmty?=
 =?utf-8?B?bm1URkRpQnpWOHZGV0dmMVE2bGo1MmVnaG9oS21JMXIxV3ZTNDlLMXNndG5p?=
 =?utf-8?B?L25OOEJTUlZZU2diZFI1UEpJZnFxUURHdFJuMXg1VjlFWXIyVHRqT0JlT205?=
 =?utf-8?B?VGlVWjM4NzZxeFFwNVB4dk5GUlBEMUNMRTRiNW1kK2ZkdG9tVVZrWDRaWTk0?=
 =?utf-8?B?UWFMbmIrbDh0a3E4REcyejlKQ21UM2J3SXZwcWlxbk8zaHlHRkRpUEZQMG5h?=
 =?utf-8?B?cGZPYmVaeFNTeU42Qk52SGgxV1RaSmV3M1FZZGoxa2srVkp3NjZtMGRmcWhP?=
 =?utf-8?B?TFdJZURFTXJ4SmFiTXJ4dW5sRFhDaXF5R3dXL2o4QUEycnlSVjVzRlZWbGg4?=
 =?utf-8?B?T2pkYXF1ekJRYXhsK2pxM29VSmhrcUR2Wi85QjR3UkxMcWpWbTg3YW1JejNq?=
 =?utf-8?B?UUZKSGdGLzhiU09Gb0F1VjgxSGNEaXhrUVVMT2VLNE9qUDQ4NG9RWkpKYVYw?=
 =?utf-8?Q?lTPiwl2rlfCrA3R+wlkVrl5NW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee1a811-c3cf-49b9-5e4f-08dd6c6835ca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 13:14:59.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v86wdqdNPRbedKMoVD9nbjEtvukkp8vqqdYCppPWOGrXxhvIJzlFDhg0a9kaf8KGvdLjNK1rCwTVaRwyJkfWaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062959_875869_EC5B86CB 
X-CRM114-Status: GOOD (  13.78  )
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
---
Changes from v13 to v14:
- No changed.

Changes from v12 to v13:
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)
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


