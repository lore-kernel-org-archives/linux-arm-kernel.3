Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AD0CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQC2WI9RIFvGyP53VpPEUVjZkap68ACowkD3tQvLGKs=; b=gUMaTnAxXT+TgWAzIlYrGwhBm0
	9g5u+iPxH4i2L0fHyd2YML+7Vf8bE8rGwC19Sor0OkG3Vo3ys0YdJcJZ/lNZjIA/Szl5qhroLaLAv
	hov/dLg0kRnKA+Qa7bKtUh/DPCOY5XB0H23K7Khlb2nLka1sbXmA5H+XIlQ4tUS1FXCp1qFRHmyrL
	pHDSMVOb/5KVuiiKP9KWKf+KUOz1c3/L8mdn9ForOwJtuPUZizEdvxGXnALgyKLwLhSdi40XRII2n
	CCPxXo/5vxDYGMexyr9IwtXvZ5raqg92NJAe6WP3lGjhm7s0RYStNOKE1D7YD7JbeCej1gr9/sNWP
	4NMNc5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMM6-0000000AEFo-0URH;
	Fri, 24 Oct 2025 18:17:38 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMM3-0000000AEEK-0zkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veNCrI3PIGcikw5w12LtGeSNXGooIPdwF1oqQ6nFquW76HnplTwObnWxZodXvSwqrgJN52ru1ujyqqr5gr25G+33hfvr+Nq/4XI6cNGY5tnAo9Kr/Ret4hdEW08RsZqM6PzUJ42VDJI6cDhHWvnOzrj939mWChT8a9AnQv/ThC3GehMdmKHGjuc3D59+vdUQAtWA5Gp1SXVm4lETAk3lrXmj5dzWdksFmrMN4RBJURSq1PvqhYTmcPJueBiQDrinz+eeiglgGAYPYoszlQfpeWdJJf9XQUn3uuRW2QU4I4F5iR/iX+Ecjuab5anrWMLuCZhja0YEO2Waw7y+BTKcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQC2WI9RIFvGyP53VpPEUVjZkap68ACowkD3tQvLGKs=;
 b=V5X3UZI5g8My0IIQ70dWjZxB9wkUS2ax2KJ2uVtlU92WenPtJOWW8RI7qiCEhCfBDVcJS1ok/NYD/zioG1V6fMBNFse+x2iSjU1mC19jif8QFgffROrWpjPQgp+rhgRWHkyoNZWeA2ZY3qOcbUd5bd7OMZo1JkaLO5i/G85HxW9bEbic0qtvMFbIrvF9qqU1+5+Yjml0/0Ug2DswSinAFC/6NDPveP2Mz26mnKUQKPh8b3ww6iYdYKRwat1lqn5TC3hSJEf2HzXyOld1iB4ImofyrZ2DrbHdflLqAld/kQaYH46nPAQiOsurLsc7BiDCGcLdXs/29WJkQWCv18e/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQC2WI9RIFvGyP53VpPEUVjZkap68ACowkD3tQvLGKs=;
 b=ZwC/kJRkU5M/bgSna5B/wmVdj4twfRrQhAnALEx/p0lknCSiMeTCpFQnQKjNSdGcpPAxpJ5NnUxwoIpJX0tm6kzTjji0iz/I+JPWp7hbqlE+00FS4SWUhZOIZJVDyWjuIBOmzBHUqxqhSPo8WALsMDWh+B0dZbyfA9wpvfaPYn3emKoC2s3ju3BuCRafwspQ7lwB4hJ17eSei+6I/rpWTVOSjBAY5fFekLa8FX0+9x5fVMC87kx2CA3fXHEFq8GcWQI4QDtN3CQLUv1jWHr7cZXyb894lkKCXhXZS1FnVbXp2iwW0eHaI22sW2Jv9r/87Iwed0PAvuzw6HXMVGnoHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:17:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 18:17:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/6] perf/imx_ddr: Add i.MX8QM and pmu in DB (system
 interconnects)
Date: Fri, 24 Oct 2025 14:17:10 -0400
Message-Id: <20251024-qm_dts-v2-0-7a7e07022ed6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbC+2gC/zXMSwqDMBSF4a3IHTclD2NNR91HkSImrXdgookEi
 2TvvRUc/ofDt0NyEV2Ce7VDdBkTBk8hLxUMY+8/jqGlBsmlFlxKtkwvuybWcFHrlkZ1s0DnObo
 3bgf07KhHTGuI38PN4r+ehDqJLBhnplXcNn2tjTIPv83XIUzQlVJ+md32i5oAAAA=
X-Change-ID: 20251022-qm_dts-60145802537d
To: Frank Li <Frank.li@nxp.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761329844; l=1667;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DzMA3UaZE7MMc9k9ziaEASK4a4CARKa9pEIiDzS+1ho=;
 b=HVyoNIruzyD7BEDFhsphDSa5EB3V+lKkiuE42Os162AAQle9QYJwuO3z0e89JqAn3zFy1Tv5m
 top5BYwdHyOBrfBNTasypt1nXPADfSgfpX9UIVBJScpeMlrI6p7IiwK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 8298b370-4cd2-40b5-653b-08de132997c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUdLTkJYN04rcm80R3ZNU0tuQThNVjFJeVVzZWtkUUZjYlJnNVVFN2JsUldC?=
 =?utf-8?B?VWxoSytKNllaYXFDQWEvKy9mdElyZlRTMUw3Ui9SWlRSU1B2eUFoSk90d29v?=
 =?utf-8?B?Rm1GT21WaTFoSUFTdTJQUXRWTDMvOGd3Tms3b0JtV21QenpoMWREOUNpQVNS?=
 =?utf-8?B?eDdDNWVxeEZic095V0ROVUNUVFEyczZxdWFxN2o5NnAyV3pmeFI2TUdjeG1D?=
 =?utf-8?B?Tk1EVlpaN1FoMlNnLzVlMVI5ajUyakQ2YnhLZWorbVJWQVZDNWFvVyszQko5?=
 =?utf-8?B?eFdPWWwrV01aQmJGaVVYUVJlV0F4elhlb0s4T3o4cFVJUlFUQS9USkVvaEI5?=
 =?utf-8?B?UnNoeFhvdkx3bmJHNDBqSkxFQzNObUZYT29RbTZsYlYzRjRHRHkyeWx2V0JD?=
 =?utf-8?B?RzBEMDhxUUpkczVlSks5L2JOYVV1THVpZFJKWEJQdm1Cd21BckhPSmJwbVR3?=
 =?utf-8?B?aW1TWGJRTzV2QTZFSHEwa0Q1QWk2Y21QMThNTHIrekk5KzhDSjJlYk03RURW?=
 =?utf-8?B?dXRJWkJOMTlFNXRuS2JvTmRvRlVPTXRRNTk2WjB4dE5BamlNdUdBdFlZTjdh?=
 =?utf-8?B?cUhLNkJLQktDclpvei9KZkoyRjNWbGhLZ0kvMzMrRjg4TE9ybVBaS21MQjBk?=
 =?utf-8?B?TWJBb3MxNFhvb29XL2pkeFNOczMrMFlLakV0bkpWMVc3d2oyUnRDanl4RWV0?=
 =?utf-8?B?QlBqM210c3Vqam1JbkxsMGZ1bnAvNkhmNHIyQUlxeHp6bVNrRS84Y2cwQkVl?=
 =?utf-8?B?Yk5uaGdJZUs5WWJXS05XZnBxRFFOLzkxQUN0NzFLZ2xBNjJKZW02cUwxM0N3?=
 =?utf-8?B?ckhaNFhoQUxvMXZuTnJpemxOZTI5akp3M1g4K2NheHVOanFKUU8vcG5GS081?=
 =?utf-8?B?M2RVMFBSZVFVNXBKOW9Gb3pwWnRhayt2bHV0R2ZqN1dBTjk2eXI2WmpOUHFj?=
 =?utf-8?B?WnBJWmhXMFphRitGTVh2cTBVSzlQOUFHdnlaazNQRWd4TDdERVdadWtEMnZG?=
 =?utf-8?B?dlNyOHgzS1F4UUx1WklxRHN1UUZkU0VHWWJ3QW13b1NXTk8ralFHdGI5Q1FX?=
 =?utf-8?B?R1FzSnJaajlOM2xPb0lzSk9NWS9NR2VOQ25jTW5PeXZoSzdVb3daOG5SVDVD?=
 =?utf-8?B?MzFQUFRjL1NQUkU4enc3b2NCcGpPUHF4ZFJWRnN5T0FvcTgzYm5tOENGY3dv?=
 =?utf-8?B?c3l3aFJjSFNpdWMwQjlEK0daVXJrRmpIK093Rmk4UDhManJFMS9lbkRSV3F0?=
 =?utf-8?B?ZGE2Yjd1blh0NWdJRjUyNno2QmpvamQrSU92T3ZjRlFONXVxTjQycTVmVUtv?=
 =?utf-8?B?Qm9FWmQyUmRrQllqMFlPK0JRWUEzUWUydXNQcWNCamJERmV1YVBIUHMzaUJP?=
 =?utf-8?B?QmcrYUtBNFVLbWJ0anAwQlpMdUpSOXFTUHQyVlZXZUNKRWFtM05lclVjQ1d0?=
 =?utf-8?B?eDNscnRZT0wxZG1yd3lBTmJYd3l2WVFzSzdmTHZPZWN5OE9CbWhQb0lTMEY5?=
 =?utf-8?B?c0FUSkZEWitLT1ZBeGxhdzF6dzNOZTZoYXliN0ViSFhDU3d0TFFTcDdzNU1r?=
 =?utf-8?B?NWRLdklRaEVSQTdQY1czRkY0OXZ6YjJqZnZib2J2c3Zhdkh5eU1NdGpudzR3?=
 =?utf-8?B?NkRGaVpoaGFrOTZUOUIvcVlwNHExZWpVdEJ5bkVSTU9xRDEyRVdjQ2thcC9U?=
 =?utf-8?B?TzdOMHBKNjE3emluOVA1SC9ZY1grRnJmSGpETHN0LzZ4dmlkL0VwcWFWM2lC?=
 =?utf-8?B?TlhuQlJWWWhrcWRrVHRxVnhTMytiRTVMQ2xIdExJQ2EwS1pZeHBDQmxuYTJ5?=
 =?utf-8?B?a3FvbXNRK2xPTkxjbmdISWNGRmFVSmphbm11SENnOGUzREpodEtSTUFQMjNE?=
 =?utf-8?B?Q2RSOWFYL1hNSDAxRjBxa1BsSFo2Y09UV2tJRDRzK1p3ck9Oams2K2l2THph?=
 =?utf-8?B?RThwMGkwL1V0VDlVbXZHNFoyNTcwRENYQkZTeE9OTHFOaE9Ka3BTOG0xU2pR?=
 =?utf-8?B?ZGtNOThyaTk1cWJlRkZPRHVPcEFjSDN6cnYwU2x0bVRwZE81MEcyd3o2eVcz?=
 =?utf-8?B?Y0sxd2NUMlFxWkFhT3RmM1FGMHZDOW9ybGhpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rlc2SWZka1JBTTgxaHd1dVpCUWVPZTFWUm9xWTNjR01CeHZxUDZSU1NudC9j?=
 =?utf-8?B?TkZ1TjZqUGZTQnY3aFhpOFdPNnF0cHVNWUl3bEpsN0hNVTBsaDRwZ3plakpY?=
 =?utf-8?B?dVB5WjNZMjJnMlFPUThsZW5UMkcwaGRueHZYcklJY0F1bU9ZdlN6YU1aeGgr?=
 =?utf-8?B?K0hUWDhFclpXYWpYTEY0blYxRnY3VFp6RVpiWU1pZjUyZTFwYkpGbzd3WDcz?=
 =?utf-8?B?TU0xaC9rZUYwRXlsMXFsUWM3aUg5VllyTnJoeFZ6UnkrRDNBclFLYVZpY1dv?=
 =?utf-8?B?VnQzdldNY1pXb0VxYjRpS3JkeEUwZXhwWGdRN2Z2ZGxpWC94MXBSdWJkQ3JQ?=
 =?utf-8?B?Vk81U2lPenQzRE14K1hjWjhzSGxlOHFCNjhCanM0ZWlLVW50eFlRT0w0MDRw?=
 =?utf-8?B?cithZ2xVSDVmNkdNUzRqR0dYYy9RZXdOYjFwZ09mMnNRbTlSNDJZVGswR1dS?=
 =?utf-8?B?OUVMR0JNNC9VaGtaeHd6dkNidVkreko3NFpvWVV1VzhXdWwxS29PSTNBZWFF?=
 =?utf-8?B?a3V0czhqYnArK0JrL2NmdmQ5aWpkYlJ1SkpETkZHc3ZqTWYwaU5RNEFNcXY1?=
 =?utf-8?B?ZGZXbXVOYXVFVXNKRVpQUE1tcUc4TnVsdG0vbVR6UDhGQldNOXFRK01JamtB?=
 =?utf-8?B?Tyt5U2QwMVRlUVlxTnRFcm52ZnU1NFNMR1RsdXhtWUc5Tk1hV3VhVG91NnRz?=
 =?utf-8?B?S2VQeHpFRGdoMnNJS1ZvU2xlK0luR1dlazkyN210WlNQWXJLUnI4V3dGZ3RB?=
 =?utf-8?B?MW1JbHFqWldYcGJKUzJ4TXg4RW5nd01mbmU2N3ZCZkp1VkF3UC9FQTJydGNM?=
 =?utf-8?B?TU9uTkVhSE9lMlBUekV6S01UMzFvTjFzbHZRWDBBazFHaC9hNmNYWW9wWERw?=
 =?utf-8?B?Ym9ORmtSdHpVTGNMSXU0VmZGTGtOOXJUV0dudnliRkQySEFmS0w2YjhLR08z?=
 =?utf-8?B?d2ZVTlJIazlySHhUV08rS0Z3dExhQW51QTdrL2dEMFBuVUd3bmlCcUI3aUx1?=
 =?utf-8?B?ZTFtQ3ZiWkNYZmI3ZFRHdnhsdHFUb0VVUGlWYk5ML1gzamM1dXBRRmgxTE1z?=
 =?utf-8?B?MkVNaXQ1K1krUzJLYzdNUE81bmtocFQ4SFJENHY1TzAzcmp4eTlWbGxNaEtT?=
 =?utf-8?B?K2V2V2U2VStnRlBlUFhXL0FlTVdPU1dYZjNJbENCbm54U2k4YXlqbGI2c3NW?=
 =?utf-8?B?OThFUVRob2pMWkhyVGZiSTAybGcyMEt5d2hrZkNWRWdDNkswdUFVT1hKQXda?=
 =?utf-8?B?WkdWUVJ5NzBlUmNPWHJNbkxoRUhpZXB0NndGejBKNms2cEtweGFDREQ3eDdX?=
 =?utf-8?B?SktmUDZRb3VpN2lrc295RllMQUhPWk84Ri9jdncwU09OWGlRNjZSTXNnMUVa?=
 =?utf-8?B?RmlnM1k0T1d4OVBWK2lEMlI3cFE0RE53TlA2KzRZOG5ZUVJGclFkbllaYnpT?=
 =?utf-8?B?Z0NJQktwc0MrYnJyZVdPTzVEVVA4UzF6OUZpT25nSDJwRXlkQVRJMVZWekZx?=
 =?utf-8?B?NVVHTU5RZGJjd01iSkhVWUpIZytPRFk4NkJDMUE5M0NYclFoQjVnYnBHUWla?=
 =?utf-8?B?UEJUMWVkZERORk1NUHJkc2hiT3hoT1U2MWg5dE45cEZPcS85TDNybFM0SElk?=
 =?utf-8?B?N1VFS3hJQTFDMDcvR25TdGNBeHdURUIvZDMzN3Q4OWR1aWcweGYveWxaL3pV?=
 =?utf-8?B?Sk50a3hSckNLSVBWYXlkemNDbjl4Qk12aTgwOTJzZURaNVVMK0pqczFKNUpO?=
 =?utf-8?B?aEZGdTNMd3FVdnNWSFJLK0NBRlEzOU05dHRVT3RNSk1STlZwUkFDWi9FWjl4?=
 =?utf-8?B?WHE0MlVLOGlnTVNXNGQ3Nk5vRXZYbU53KzhKcWsweExjMlQwWDltZ05ycXI4?=
 =?utf-8?B?d0Nzc1Vhc1l2WGt4TG9iYUE5RXFMUnRuaVVKYSs0ci9tVlZodkdVK2N3V0h4?=
 =?utf-8?B?ODdxK2RMWTJRbDFSejhkZm1sd0dKeUdOazI0YUdlNTh1cmU3WEhjcXFHVG5W?=
 =?utf-8?B?VU5DTWo2eUo5aHVJUjVMaUhXY0c2TlR0TXI0aVJzbkxJZlRxSVdZNVAvOTVF?=
 =?utf-8?B?MEc1d3pzOEtQOU9IZmMwYiszWDZCUjNIRnZlT0ROQmtBOVZqTUdlR0JNZ05p?=
 =?utf-8?Q?JP/jWR5rh+CNOgfFYnce6ml4Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8298b370-4cd2-40b5-653b-08de132997c7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:17:29.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCgl7PxO+MUN5b4GCJXBp86NiWXbb063KC/gpCQwJh7ofUW0Ha3xTnT5mZFyrLDGY0fI7f345Fp4xt9qYSiDZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_111735_295568_B1CA7D7F 
X-CRM114-Status: GOOD (  10.37  )
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

dts: add soc specific compatible string for imx8qm, imx8qxp, imx8dxl in db.
driver:
 - did some cleanup
 - add support for pmu in imx8dxl DB
binding:
 - add compatible string for imx8qm, imx8qxp, imx8dxl in db

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- fix binding file by move imx8qm/qxp/dxl under enum
- move clock-db-ipg clock into imx8dxl.dtsi
- Fix CHECK_DTBS warning caused in v1
- Link to v1: https://lore.kernel.org/r/20251023-qm_dts-v1-0-9830d6a45939@nxp.com

---
Frank Li (4):
      dt-bindings: perf: fsl-imx-ddr: Add compatible string for i.MX8QM, i.MX8QXP and i.MX8DXL
      perf/imx_ddr: Move ida_alloc() from ddr_perf_init() to ddr_perf_probe()
      perf/imx_ddr: Get and enable optional clks
      arm64: dts: imx8qm: add ddr perf device node

Jacky Bai (1):
      arm64: dts: imx8dxl-ss-ddr: Add DB (system interconnects) pmu support for i.MX8DXL

Joakim Zhang (1):
      perf/imx_ddr: Add support for PMU in DB (system interconnects)

 .../devicetree/bindings/perf/fsl-imx-ddr.yaml      | 29 ++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |  2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  | 22 ++++++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |  7 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi   | 19 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  2 +
 drivers/perf/fsl_imx8_ddr_perf.c                   | 91 ++++++++++++++++++----
 7 files changed, 153 insertions(+), 19 deletions(-)
---
base-commit: c31b21db1c04ba719c3889a57873f0f7eff54670
change-id: 20251022-qm_dts-60145802537d

Best regards,
--
Frank Li <Frank.Li@nxp.com>


