Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C20D3CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vMQUPiTRIpJpfayXKOn4Jor9ubgfCx70xPEeSGhjVM4=; b=zC9T9KR1ndqHHjoIAMmCE3MgOX
	vl6tJakUf5A4RooRkW4V3LnxQitPT0+GG14wiBIeAy5tlOthF5qKdsqzd6OU43h5mkO8Ao2xNoq4L
	s0KQJM4AFO1P7XP7Di4nHwX/txVCj5s6zrtUdrayofpdv23Xn8Qi2LpDpWCSM+mPxOXWDpSEzB9Ia
	0OrqbAze6A9j0UcegOjpmttszmrbLtLm+nic3A14yOEQU/RBdnKoBHTcaWO1CSRw1HDJd7trTtj41
	Gpp/FTL/bJ7/TMu1uYb7LW74Oh3+hr/v0dtBAmKq2pSr+Hymp4GAm34vZF0rClweqHxOHoVn7VFDL
	BtCcO5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9Qx-0000000AvdA-2L1Q;
	Wed, 14 Jan 2026 22:33:47 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9Qu-0000000Avbe-1acc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 22:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzkTg7w6vgMR1XontBM2Rq5adF/7o5gZ15uwxR4qpITCWGUrLG7EtFV2z40gRUEN/KZr/ghhskkLFnGPQw2OzOuZd00u4d/Ay6rBvxv6aVK5tzzZiYvhBASs3JX/+m3J4zK3CEqTKkV69SHf0r5tEXuzUMj3b6CYiN4drtWoFSIRSRLjL4iLHP4HQDQEkauavJcA5uCddE8rpTh+OoK+Xh0WqUn+VIKzz2lx7ZHXaNH3k0xNCFfHvQxRDLMYVnauZv0QQGrZ7QETsFZPXJVSquAcVMFhlc0HvwyvgFIXLAi86hccJiV/8lrOKGJWgXClob4a+fKqqI/UdmFLyaKqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMQUPiTRIpJpfayXKOn4Jor9ubgfCx70xPEeSGhjVM4=;
 b=SPv/FO/Yo1uOOGjl6v49YpSWG92MqCEv4xyZ73XfgONWQ26MY208WGG5UOLPe9haWYVoqs5mYMIqOrARwE9CRRVRu6pFncXUCmZcEqtiX2NQavrkXrEydBKIuj+61CZ8FdEteFtu48E7RTSKC7xQ0b+cl0sWBySL301QCzLa5oZuq7kATQwDT7IjL42dP9BAI5uuF6SVrNRVw+2ctAykVsziQeWlhzlU1SxcfhYwpfVblBbpRU6fml4I/9LNQhrz4AgHtvGUD96W3Ev/vlYY7unzQC3w/z8EojfZmsIl5pwxWXj0KN2JzOABpgm78v0DUsVnHXOUzA3vOR86DzFvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMQUPiTRIpJpfayXKOn4Jor9ubgfCx70xPEeSGhjVM4=;
 b=X7hBgXDa5zWtOU9mXBoqHAAX2dDtar4F+f/N991Go3m+SVBZVaxWz1b55tgwJofTv81/pW90hrBE81664ofCjqKNEm0Xyfk1pPb/f1vfdtgpwRTgjjCMibyOdMjSHzBKH61hKf+5m38kFDMlrtRF+Lt93NQ2KODwSalVJo5cMcif5FLcUNEJTRiJP8z8aP506IkeO8AuAEdBIr8UtRLHhaXSR+iHHMsn3UFWfLhQThX2OeRpA7MXSUQcyVln1ArIf+tbaTcJUN85sfLNgvdnQesgrI0LtUBxjUTczRbsP+7w4wgBoJqQJomiefrvWUMBtC2J17OeiXDh4DDGH7Xtkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9554.eurprd04.prod.outlook.com (2603:10a6:10:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 22:33:39 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Wed, 14 Jan 2026
 22:33:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 00/13] dmaegnine: freescale-dmas: small improvement
Date: Wed, 14 Jan 2026 17:33:12 -0500
Message-Id: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgZaGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MT3dyK4pTcRN3c/JTSnFTd1CQjg+TkxGQTSwszJaCegqLUtMwKsHn
 RsbW1AMMVxfdfAAAA
X-Change-ID: 20260114-mxsdma-module-eb20ccac4986
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, 
 Frank Li <Frank.Li@nxp.com>, Jindong Yue <jindong.yue@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768430015; l=1715;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rWdxrt6JBschZfhtXTQGbtQR/H9Tc/VvwfJnyYYyNbA=;
 b=+uihlnaXbViKgC6NBqYlxLNjnq7sf93pCrmpQ9CM1ATNw30Gnwnbck0zFMsAY5XsnKuM+48vu
 yWJx/oBYH3mBWwICrUZa0e3/ruKzme/LQyUIUMXrtdj+E3xmLHo2W8r
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::19) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e805df-7ac7-4913-5254-08de53bcf68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDErSlMzSGJVSHUwb3RadGQ2ZlRnSjNBS2pmL2dhQUxmV2FaZ2REYXRuRy9s?=
 =?utf-8?B?MlpzTTg2eHpJT3lYUll1ck5lNndYS1ZjT09DblBzYndPeURmclhOQ1FUZm9M?=
 =?utf-8?B?UnBNYStXUTFlUU9BV251OWFTNFgrYko1b3FvZFhWQWw0cVNUQkhLWCt2YW9T?=
 =?utf-8?B?WW9OWWRaaVpsaTdPQVJBT1VjOHhjOFF3OUcwdHpSTmhMZmlJdE1jM2ZFbmQz?=
 =?utf-8?B?SkRKSk11K1owN0Q3M3hqVmlYenR3TEZVYlVOSWQxKzBCdHFGaXBJNThoYlJP?=
 =?utf-8?B?WEdXcWw5UDE3YWJkZHlrc3dFQXlzdTJnWTdxNTluRFh6NXJEekE4dENwQmVG?=
 =?utf-8?B?V3d3VjZ4ZzhqU21EZ2xCQ1AvQWJ5eWVUU2NSWnlyaFVPT0U5OG82cngrbWt0?=
 =?utf-8?B?R2IrZWxiakRIaU9zNVlneFVNWmIrQUM2Z0hqcyt3TXkycVN0K1hHZnF3NDNs?=
 =?utf-8?B?WXFzbVFvOGczRnA4bXFVOWNhMlFCL0tsTkdHM3lCZkQxZi9JL2R5SmxEZFYv?=
 =?utf-8?B?QTd4WUl3TGlRblBtUlB1Qkljb3ZMczc4NU9pdGc4S0E2NVVPMHJTSkZSenIz?=
 =?utf-8?B?YzcxT25RTlhFQkRQTHFmZ3VYRjRQMlNkNml4Y2NCZGlKUFg0bUgvV0loZWJR?=
 =?utf-8?B?OC9DeXg0Nm5kSEhISkJBRThFVkhubUZlZGMxd3dQeHozamVsUC9BN2VkZkdQ?=
 =?utf-8?B?N2RmTG90SGgwWjhNSU9QREhwbEdIdk9wNXFMNmljOEVlbUF3d1phMzFDQXVL?=
 =?utf-8?B?LzQwUTVpZ2JTbklOMnpEbVBwWVR3SGpuK1dZMi9hZ2xxWi9oY3V6QXV5TzBU?=
 =?utf-8?B?WnoyVzdlbFNJSXlWckFSSEhOWS82dE5UVHloWFBPN01UVm5wemNqbzBuRS82?=
 =?utf-8?B?czZmUGMveTUybllpZzlyOVJmbldoaVpmVjU5WTRqQnhYL3lQVE1rUnp1RUgz?=
 =?utf-8?B?eDVGb0xRSFptLzFqRERnRXJ0bno1SDV1NzZTRkl5MEUwVVVTYURjY1NJUE9E?=
 =?utf-8?B?UlhtK1Q1c1J1S3pJYzVUQmtTRWo5Q2tqclN6OG1ZTXR6SGhuTGoycmpzN1k3?=
 =?utf-8?B?NExUWFI1ZGVxZk1aYlZScDU1WTBPZ0VZclFsckZoNVc1KzFjTmQ0cytvNC9T?=
 =?utf-8?B?eFdFcG9lUm1ubWhHSHpCTHk1ZW0yOXZuUWVaSk1tQ0RUZHVLYjI5NkxBeFJ2?=
 =?utf-8?B?bm5TR1g1QVlSeFF2dVZiMVBPYUhFVzh1VTFEVnV2aHRaY3dONitjNUJNQXpJ?=
 =?utf-8?B?cnhHczE0T1RzY2JIdW83UEd6S0wrTk1EVHc3b0ttVS9DNmpKbENZOVdwckQz?=
 =?utf-8?B?Q0JOVUxaT3hSZ2FSWU11NmdUMTlpeXAzcmNwclUyam9zc25QdmxvbWM5RGcr?=
 =?utf-8?B?N2lKc0dDZldqUkdBRlhGSkl4ODVia25hcWd0MjdsRDE3N3RMZzBia2xGdEZq?=
 =?utf-8?B?WWNXMjRrNFRpczF5allFUXVyTXJHREZ3TDl6MklRRDFqQTZ4NEZZdmtjTWtu?=
 =?utf-8?B?eGpPc3l0b1ovZGlTWnUxR3lhdTlMYkZLRDZNdWcrQ3dmT2h0U1dBeGZpL1pU?=
 =?utf-8?B?QTc0MXU0UkE4RWQ4enlqYStKMm04UWg4M3hINmZ2OWxsLzhyRURzWVBQSlN6?=
 =?utf-8?B?ai9LMlJGRysvb0YrOGhicGp5YnRudEJtSlV0dnY1S2VtMUJYRlBrMmFUT3Qr?=
 =?utf-8?B?dkFTazRhUUZoSmxZMzZGdnNOOER5dDZERXdnVjdFT09oY1RjYzMyTWlhTVMv?=
 =?utf-8?B?a1lnbURoQWJKQ3hiTDd6UXZydWVXNHVTVXB0QmtWdEcvVmVCLzRSQTFOY05Q?=
 =?utf-8?B?RUtqcTJZZ3RaUzJmUnlZbzExWGpmREVKQ1BGK0lvRW94T09yZG9VS2t1OWFF?=
 =?utf-8?B?eUtsRkN3ZStVWmE5eUltK3pocC9GU01wODBrbjU3bEJVdGdVekNaVkRZQnds?=
 =?utf-8?B?V2lzZEJiTXVLMzRJVlZmdEFzNDNGS3VCeFVhUTJvREtuMmZHNzdZclc5Y1cy?=
 =?utf-8?B?ZWFsVm9oZnZUQi9VcjJrMjloNThucWg4dlRjOXRYVzRiV25NRXRDd0lQemlR?=
 =?utf-8?B?Z0tSYm1peFNQYjJ5UmZWMzBxdk8vWCtXcDUza21Yd29rVGxmOVBPK2ZkaGZl?=
 =?utf-8?B?TG9tS3pnMTcrNE1ScXIxZXpqMzRZa0p3OHBWVW13V0NwY2NraVdDbjAxV3Bx?=
 =?utf-8?Q?s6Ajd4OmKN0AiG274IhmRSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlhEN0VrbFBNemw4K25aUXRRb1N5QmZDNlJYRjh0YWZITzlhbE9SVTlrV09Q?=
 =?utf-8?B?amgxVGRyMHUxZWd2elJINTlMSjk2YzRGdmJScUlSdTVyWW5CNmxmVWE1RTIw?=
 =?utf-8?B?T3NNUjYwVkZFaXhxbmZYOVlEY01nbEovZ3p6dk9mNDE3OEhTeU5HVjdZRFU5?=
 =?utf-8?B?ejhJUXE0REZEbGNPVVI2cVN2MHR4cURkVDUxcUJjckdTYTZURUhTOWwwU0Rz?=
 =?utf-8?B?czZ3dURWZ01yMjlWRFYrK2xTT3UxeDdXVXlhSkV0cFRLVS9ydjh0LzF2SkQ5?=
 =?utf-8?B?TFI3cEthbDFkN2x1bnVGeVVSWjZGd09xbnd2VzJsd1lXNW50MCtXQmxnbENE?=
 =?utf-8?B?bDJlenRlKzJDQUxhcTBHbTFzTlhEYXRqVlVMbzQ4cUhFRmlydHlsMW1PSW5D?=
 =?utf-8?B?T1ZaZlQwOE45VWlWdytlMU15Sk1DOHZiVkhkYVg4cHpmUzFTWThXcFhjR0Vz?=
 =?utf-8?B?UTQ3bHBvbVB2b0ZSL3FLWlJkOVl3US8wY0Z6Z0pMcmdzUmRCc2lQTnJtN1gr?=
 =?utf-8?B?TllFbW5yeFM5RGlWVnJnc1E1VFZQc2ZFU1hqMWlSdFo5b3pDTTVBbVFHTWo3?=
 =?utf-8?B?ckk5bEd2Y3R0RkFnL2NYcGRQaE8rdGZGT0xJY2xVdkpSQ0U5dkN6VmphRi82?=
 =?utf-8?B?d04yU3h5WVRLQ25ZK0ttdlZJeFVvWEVOTlhTbmV1VCtVQVp1QzdNUkNpUUh5?=
 =?utf-8?B?aThFRnNYNW16cllXNWhvc0VZVTRrc1l4WVRhZFJaVmJySTkvcUgzUXR0L1VP?=
 =?utf-8?B?K3cwcXpxZmhTSnQwK0FXQU9JK1B5Z0xqVm50eXhOY2ErbzBKeHh6VWtrcjNK?=
 =?utf-8?B?NDB5SGdUWE9JT2FjajFYZ0d0Y09wOXdDZVF0MjZoN2RFblc1SnBUcTc3dVh3?=
 =?utf-8?B?aFh3dEQvd1FwUjB5UklpZnNOM3dqT2xQZmdxS2k2ckF2cE5jQVpxckpKQlZj?=
 =?utf-8?B?cDBEZXVnQjVLMWdKT3I3R1JKOU94aUJwSXhSamJ6Q2lNa2NLb0Z5cDZSdnk1?=
 =?utf-8?B?ekErS1hwWjJQK1puYnh3enhIMnN1VDBkZWx6eVYzOVB2ckpWYnIwNWVxUWZl?=
 =?utf-8?B?WFA2L2E2VDZLSTFpako2RDB1WGZmTE0vL0Yrc2loVlhhenhjWEgrZDZ4Q2FM?=
 =?utf-8?B?eTNWYk1ZVHBEMlhXUzVXL3ZOYW81TDZIRHp1Yy9uZ2ppS0FLeWRoa3NxU2JP?=
 =?utf-8?B?OXNBYkRPODBLSGpLQnd2NHFqSmk3VDRoL2dzWWQ2aTNIb0tSTUpmUHNZUEFw?=
 =?utf-8?B?UEJjTU1hZFBTRzJtK2pwWUVjTGkvWFdWM2hyYlBWSDhsdllpRFZtaTVGZkpU?=
 =?utf-8?B?NHFXeThjNEVwNW50Uk5jeGlFT2pCVnVXRTliQW5nZENXR2FhWG5EZmZmR0xl?=
 =?utf-8?B?bkExekxzRnNyTjRDVm9kaEUyRktkWHNIbXpZYU1rTmdhREIxTmdDeE9WdURE?=
 =?utf-8?B?NjhLL0dtaVdiMjJTeG5NczRwZmlRUDN3NGNrTHF3WTZ5MkcrWUxaaWF3U1Mw?=
 =?utf-8?B?TTdRdDJEa0VOOEZqN2Vqc3RrWW5XY2Vsa3I4ZlFVV1NZOGZod2thNUhJVmxx?=
 =?utf-8?B?RU5LaVJPb2NiOFRNMTBXWmVUdWNQTDR4R2grNFBMVFIxbDkvTXMzcmlqRU9j?=
 =?utf-8?B?ZmZoQXdtL0ZidkNERHRtb2Jnb0g4Y0ZuWDEzYlZRak9PcXg5b0pBV0NKMTVs?=
 =?utf-8?B?dUlDd2xYNU4zb2ZLREM3TFg2Wk9jZElNVUxWMlFNbXRRaGN3RXRNQUQ0QUFU?=
 =?utf-8?B?NklUbDdyVjNlQTVrT2NwVnI4OTViWnhVOEIyQzIrL3diaEprL1FYeXpIZEZD?=
 =?utf-8?B?STRpM01ycGRNMHFkOHEyaWQ1MU16aFZMcm54OGhxU25NaFhQZXhjQzdZTFM2?=
 =?utf-8?B?UmZBdW51Y3hhcGdmODBDRktFM1MrZGhZU204YjlSV0tPa2RHaGp0MDlaTWJS?=
 =?utf-8?B?NXgzTDhIbDlYcFZYOWZNSDdPNVpidWUvZTNKUGU3citNRlVGWXp2OThmVDRl?=
 =?utf-8?B?WE16Wlk2SERpclNiRVpEVm5Bb2dQdDI4dU1IOHg0RE1lbkc2YWtQZlQrNWpF?=
 =?utf-8?B?T0loczF6RGE3eUEwNnZtTzBSR1BYWndLbkJMTjZHRHh5d21NVmUyU3BxTVZi?=
 =?utf-8?B?S0d5R3QxVWMvL1NmVU0xVVJ3eDFZcEx1VFptUWpHRFhsay9sMWxkVCtZWCs1?=
 =?utf-8?B?cXhPLzdOaWVZY1pWNjgrUkt1MElYM0dWcmFGSnQxY3l2SVNDYUlPd3NDR3Fy?=
 =?utf-8?B?K1JBSVZ5M05hQzBzMndxYkpjSjVCOUIxYytSMGhUYmRCU1BDWE5tR2JCak5P?=
 =?utf-8?B?cmMwQk5yY1YwYm8vVHVPVEFYTmZra1duTXhNRHJuTzhOeWo0cXJCdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e805df-7ac7-4913-5254-08de53bcf68c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:33:39.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCuU/s4EFSp7pgWYbopER85YAfixdmg/yGEVXxfx9BQ4qMgWV77/sc7nOiSteVnzlus2VGeWRU0bBOtBBuKAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_143344_432148_E411066E 
X-CRM114-Status: UNSURE (   6.48  )
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

Add managed API devm_of_dma_controller_register().

simple mxs-dma code and add build as module support.
Use dev_err_probe() simple freescale dmaengines.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (11):
      dmaengine: of_dma: Add devm_of_dma_controller_register()
      dmaengine: mxs-dma: Use local dev variable in probe()
      dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
      dmaengine: mxs-dma: Use dev_err_probe() simple code
      dmaengine: mxs-dma: Use managed API devm_of_dma_controller_register()
      dmaengine: fsl-edma: Use managed API dmaenginem_async_device_register()
      dmaengine: fsl-edma: Use dev_err_probe() to simplify code
      dmaengine: imx-sdma: Use devm_clk_get_prepared() to simplify code
      dmaengine: imx-sdma: Use managed API to simplify code
      dmaengine: imx-sdma: Use dev_err_probe() to simplify code
      dmaengine: fsl-qdma: Use dev_err_probe() to simplify code

Jindong Yue (2):
      dmaengine: mxs-dma: Add module license and description
      dmaengine: mxs-dma: Turn MXS_DMA as tristate

 drivers/dma/Kconfig         |  2 +-
 drivers/dma/fsl-edma-main.c | 55 +++++++++++++++++------------------------
 drivers/dma/fsl-qdma.c      | 47 ++++++++++++++---------------------
 drivers/dma/imx-sdma.c      | 60 ++++++++++++++-------------------------------
 drivers/dma/mxs-dma.c       | 33 ++++++++++++-------------
 include/linux/of_dma.h      | 29 ++++++++++++++++++++++
 6 files changed, 105 insertions(+), 121 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260114-mxsdma-module-eb20ccac4986

Best regards,
--
Frank Li <Frank.Li@nxp.com>


