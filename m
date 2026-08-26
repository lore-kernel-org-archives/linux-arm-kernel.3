Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275A5C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xuhyx1ZC9EBGBVIFUGXyxYYzQ0dPcVgYj+dh9qz5y+A=; b=XvC73g+ljfD8Kz7nBY152RiwGX
	UMfpMdTlx2z0tpWIFQV9NhbvKhNspj2lB6m5fWp/1K5OZkaRMBmLFoRk4SPkKsvfVd9qGcQDicrbZ
	fzZLuvlSK0Wm5kGUSKe2JkUmmb9G7+YVhIW2awkWVVGNAjXcf4v4dnX6deDwwOOchYr2jkhnZcgHo
	VgvPhckI2FDQRvgBn869zXNty5DzUHpFJLQxkRlcIIFFAQJRDzBqnkszEGvXk8BzCfD8xmlr3XQqT
	NWrOK3LPAjD7rWrYVeWmiI/Sm9HsJNwmNDm7AcENv0ujrur8VqfsCuyB4m4ZlgdtoFuOKy+nJdBQ7
	60zEIUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsa-00000002Wpr-0E7z;
	Wed, 26 Aug 2026 13:41:24 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsN-00000002Wfd-2vBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:41:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC4jfE30o1McBqsFoPpkK76sPWywSP/O1WjwIcABxAGrW0iR9rDwNtXRMVDDIO/VtvBUIYrYjUtrQuQRGm9ogYNRrs+ijK3nZAeWEje3M5jAUoEWBxnv5A3JcR40sMxn6lSUdFqMMSG5W4JrlPC+n7GCCnZRSJLg+69+Ut6lEXG/WLT4QhMbLJ3sBb//ifvTwzJOViGhyYZCrDsybJLDzA+WlemJJRBAfArI0CTKYewE95J7YCw7Wr0ALP4oUUsKkO/oF3BLJ8dU4AXqD8BhK0JeyTZ+qwlyz2YDAl243AiXQPdu4xDTYHdjrn4yVqK4k56Qo8ImxbIh6MK0PbDZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xuhyx1ZC9EBGBVIFUGXyxYYzQ0dPcVgYj+dh9qz5y+A=;
 b=ggrSu81NbZBqUm9QctmkGVZi27fs3BEl4MLYTZRUX3k/mqp3w5/dkbCNUdoqCDaonZW9FeD1IYJP0W7+mwFFkDFIIg8i/l71ZX42kGq+YizTTM3JssBTX+sRU3MuYDBBwQ3inljNSSZM1Ckxe+3BaZvvuY4eBnKg5hwRzvB2A7OWTbAhKjEmkGj6LQR2H88mmUqHYNrGxu9UD683i8W5CeCzp6URmiWZ9F079+ojcy2y1WIOFFfRivdFHxzpxfcMPWWL0o4QDLNCp5VBaKSXZ0qdv4ckssxeS/9GU2ZmgkUCH2eL+8j1LezX3PVrlbHbJpnCexZ8qVSubWY3wYNHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xuhyx1ZC9EBGBVIFUGXyxYYzQ0dPcVgYj+dh9qz5y+A=;
 b=eTf04US5/cYfKURfcfeUQGYlZZkU1VsX7Wp/2Uqi/7xFDl0XVPWUUtPGBrXA9wzUri+rhv+WbKg5inkKk0xE1ihA4fTd/c7K6pbVYgRbjFbu2kGX38LO+BjZtLAQQPAmUW7BDdO/ADj2OtItqOk3V7x60gv4cuXXRWMQuJ164UKRMZ/HWx566jqVoEaTSCU670KgUm/IUhN+aG9kyTRUyIbNo+rqJS3/IfbCYQQQMqBoDk9wTzGlHlhf5v3gg0c+YBWkudLf4sEeYImNoky6HysuZMZT7CcmJqQgQxEa0AWmmabvYVnIgx5byGn43HDLsDfBZW69lvzDWTvgwpG/IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by GV2PR04MB11862.eurprd04.prod.outlook.com
 (2603:10a6:150:2f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 13:41:01 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:41:00 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 04/10] scsi: ufs: Move Versal2 M-PHY CREG access helpers into ufshcd-dwc
Date: Wed, 26 Aug 2026 15:40:42 +0200
Message-ID: <20260826134048.854748-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|GV2PR04MB11862:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d73036-9d48-4652-d65a-08df0377aa9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|19092799006|376014|366016|921020|10067099003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lD0X0O3L1d2FKIcCi0vFmB1w8uRBWcBStsPgWjG9xWjujRZ2Us0Jj7W7jImBCeDFJl9jzbvlmpw0roL+PKx1YOTxw1rDdMQx0lKyB6ZvX9f7+Z+L0XGVlPllCiAjKQARKuxwjyj2dwcbZS3N6Y20VXsxIkjPRLs6aXixF0hdgBJi4v8m0wb4vz8dkaZBn6e83FcSyqI+OBIhWVnGbvW2VoYd5T8WlvNA28wzEd4REStIgZWt2auf4pdQJuLInmixQuhQyG6HqugwvfH0WbIWa2u0m1DaiKd5bMvGnH3YlxIeOZGKH8iQtB8oiYcJ/a0zguzM4xMLnv3/JZ/jCOx7D20Xzf+KO0aO/kMO9e9NDEwOyxXu/YaVQgJKZ+ah05kHA7D51pl8O4DiY1ikBEjhmuFviIR6I3vishniPb+Rfh9tOnCc8aW2+LTVqI3C35nGduyREzXNZXnSKrqQ5W7XsMy6WpqLFarjO46GMHjKlGXnlvS+zXNd1SrBfbaUVofD+ZF1Wp8fIO+5TGDjN37QSilhAYfIcvBT3hHhtdG6w+I40EoMR/ORcHFZGf88dmvAWQTBq0LwYI4x58leScMu4Eakg++E1lihbgCarAIpXaWtGPPHq3wtfyvCLEhIw5DvdS7Ju6lt6Tb3stLgHQngDXPotXuE6AVmM7enuN86YD8QCsepOm7hC2qhEsea1GgoNTJhZOq8nQ5aESb7HrNk6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(19092799006)(376014)(366016)(921020)(10067099003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFKelZvUDAyM2tDTnQvcjVwTU1GcUdYbHRSWHYwQm1hSEFOdWtOWGp6U0lq?=
 =?utf-8?B?UjNHbW9HRE9RYjdiZFgzeS9PSm9VbXFlV1p1VHhRSkdwRWNaODY0b3lramd3?=
 =?utf-8?B?Vk8rQWpDVjE5MDJTUlh4QkhRY1ErSnAyNFV6SU90dkN1Ukx2dUtPS0s0QjRr?=
 =?utf-8?B?bHpPdVRycVdsUnNQVlJWWjd2S3lEY2ZKWjhZNHQ2L2Npc3J2U3kvbzB5YlFy?=
 =?utf-8?B?b1RrZjN4ZDVCVG94SmFRNndtR3cydjVEYWZUL3VrRC9oZkNRdGY0b2VFdXhC?=
 =?utf-8?B?TFlKVlFqTk1xTGtCQXBvOW1TQXhxeHFNZGdkdXRCc3Q5ZHcwbmRRTzZlTG50?=
 =?utf-8?B?elZkempuWjg0eWIvdG1BOGJaRkkrZ09aQVNyVmsxSm5sb0dQMzUyVkdVa3hL?=
 =?utf-8?B?emJTZ0tvU3g0OWVUanNxVE5kNjBtTzliZXMzWFBESjFWeTlUMHE4U3dNVkd1?=
 =?utf-8?B?QXJML1E4azhZbGdhTXNucW1zM29BdFpVQ1Q4Mk52L2YrUCswREphcVJySUFr?=
 =?utf-8?B?YVBhV2JSUUxwSDFWSlowUDVqTEdUcm5QcDVYdjlRVE9WdGd1ZTE4a1VRR0lN?=
 =?utf-8?B?UE9ITlNlN0VPUDc3N3RSNE1iN2ZER2hWdEZyVEtrQ2d4Zkl2SmMvdFdtaGor?=
 =?utf-8?B?QWRaQjExOHdzKzd5Ym9xVWE4ejdGUXVmd2pqaFNySW9uVWMzOFFzTTV2R29h?=
 =?utf-8?B?SU1YeXpPVktPeVJNa2NSakpSd1UyNzFwWnR0UEpTRnNqTllWUWRGM1REeUpJ?=
 =?utf-8?B?Mmd3NWhLYXV5Nk1hRU45NStiMVQ5ZXQ2S3Q1ajJ6M2NIOTg0S1RZK0x3SnJX?=
 =?utf-8?B?UWhSVUFOUmxpNEF5Ymx3bkJDYzkrL3ZWd2diWlg4S0lVTko2dlF1NkJHTzdq?=
 =?utf-8?B?SzBmYkV1Ly9lL1U2Z1RRUXFYMFkzSE1MMERZeVdtMjdkSWpWa2toeGw4TVgr?=
 =?utf-8?B?Ui9BTTA0dzNFVE1nVVdObUwyZXNFQkF0Y01qVU1leU5zRXdjQmh6ZXpQSURD?=
 =?utf-8?B?R1NmT2ZtS3BsLzdBQ3hBcnFzQmU2WGlZa1hTSHBXNzBkd2R0emlkSmpaWjAz?=
 =?utf-8?B?eENXWlpmVkNOUkZqSG9oUlpua3dSOFpGTEF4aVFjNk9OMFBWYTNqSVhMMHJ3?=
 =?utf-8?B?SmlJWVVaNGVTK1JVenRieEZRazU2T3d2RWJ3dEp6ZlIvQUozMlVJNzlHNXow?=
 =?utf-8?B?YXlBSHpuOUlTTlJUdGY3UGZKYjlXaEtHSjFVMzhNcTRwYm04T0xQV2RPOUU0?=
 =?utf-8?B?b2FZR0gvRkJYa2lnSkVyK0JvSXA0QnJlWjd0ZXRiZnpIZDZMU21zUXNhZDM0?=
 =?utf-8?B?SDR1N01JS203b1lsL2ExQitybzlJVTk0Vy9QNll1VnpjTlJtcmsrbmRsK0hN?=
 =?utf-8?B?QzlsOHlpRTMreXNHZGRhZll5Umo4SCtaekpIYUpqNzdzNk1OVmNyU2JvaklC?=
 =?utf-8?B?NUFNcXd1aFVneko3ZUJyQmVzcjJPSkZ0UjV1WjVHRVZldjhPTkhIaWx6T0tt?=
 =?utf-8?B?SENHd1FaTHhBL0pWQnB5bmR4Zkl1MzVSeFYvYUNRQWxlQXVuS2ZyNGUzWCsw?=
 =?utf-8?B?M3I3ZDRaYS93THZSUWh3NTlpbHd4dXhoNm1UVGF3cHRsckRaOW1xaTJheG1k?=
 =?utf-8?B?OXVPQllObXAwVUk4eWxpMGg2K1R5ZW9zeXdXWDJieGpSQjRFZzVNcUUydkYz?=
 =?utf-8?B?T09sUkMrVFlES1N3Si8vS1JhVXY2c2tXSjJnWHJLT2VMMndPQjFlMFJ3RVMr?=
 =?utf-8?B?eDZoNWRKMkN5UGVxN29DYVhWamdHeDArbGdJbFRKQ0k5Vi9xVUhBZGxIUElM?=
 =?utf-8?B?VCtnRjhIOStQanhOUDhmOGFGdW5SOGthVG5HeWltcGdWWStXZHBXRUd4REZW?=
 =?utf-8?B?K2I1eFZhZkJCa2tnZnhac0dDSEpNUUtDTWRJdVhXSitTbVErMDRTT1RpREQz?=
 =?utf-8?B?QXFwVXhZd0dyUUtyQ1MyZ1dLT2RUb2tsTzYwbUdoZUNjRmJPMVU3bDNYT0E4?=
 =?utf-8?B?ZGQ0OCtKWXVzTEIvVlM0QTNIazRsU0dndzh0Yy8ydTBpa3pjWlVmekF4S2VN?=
 =?utf-8?B?TkthWjV3bUFNUHRGWmFybkhLNjJoSThDNVBieGtuZGVWNk5vUXR6Uy9qV2V0?=
 =?utf-8?B?RW1KZllNM2MxcDRCdzhQV2R4QTVVWGF5R216QUl2UnhISDlNMWdNWjJLTlZO?=
 =?utf-8?B?bFdweXNWNmtWbmZOQlNKZWVtK3puYXdQdzUzUkpLUXRBVEcwVnhqWXBScmdH?=
 =?utf-8?B?WWc3dmZzaDF6TDZieW92Z0JRUlBOSTdTZkFJNkVibFJtOUVmd2xXTmUxQkVy?=
 =?utf-8?B?RWtWdEFiWDFleTdndGFPTElyT0p4dzY1bEk1MGJEVmxzckI0T05YcjhsalQ2?=
 =?utf-8?Q?VtUvg0JiUgzU20ko=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d73036-9d48-4652-d65a-08df0377aa9a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:41:00.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTczOed6LGZV17uAsNdyC2QkwGG0CodjJB3v8JH8ylPnoorJtuIx0biA/wvFyfvEJKJtcfJ6aiOyZ19Iuaqi7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_064111_755263_45239321 
X-CRM114-Status: GOOD (  13.95  )
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

The AMD Versal Gen 2 UFS platform driver carries local helpers to access
M-PHY control registers through the UniPro CREG interface.

Move these helpers into the common Synopsys DWC layer as
ufshcd_dwc_phy_reg_read() and ufshcd_dwc_phy_reg_write(). This avoids code
duplication in DWC-based glue drivers and provides a single implementation
for future reuse.
Dropped `static` from `phy_write_attrs` and `phy_read_attrs` since there
is no benefit in keeping them persistent.

Update the AMD Versal2 glue driver to use the new ufshcd-dwc helpers.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/host/ufs-amd-versal2.c | 85 ++++++------------------------
 drivers/ufs/host/ufshcd-dwc.c      | 77 +++++++++++++++++++++++++++
 drivers/ufs/host/ufshcd-dwc.h      |  2 +
 3 files changed, 96 insertions(+), 68 deletions(-)

diff --git a/drivers/ufs/host/ufs-amd-versal2.c b/drivers/ufs/host/ufs-amd-versal2.c
index 0d4d5e98ad65..c7da95999c85 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -43,57 +43,6 @@ struct ufs_versal2_host {
 	u8 ctlecompval1;
 };
 
-static int ufs_versal2_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
-{
-	static struct ufshcd_dme_attr_val phy_write_attrs[] = {
-		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGWRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGWRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1, DME_LOCAL },
-		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
-	};
-
-	phy_write_attrs[0].mib_val = (u8)addr;
-	phy_write_attrs[1].mib_val = (u8)(addr >> 8);
-	phy_write_attrs[2].mib_val = (u8)val;
-	phy_write_attrs[3].mib_val = (u8)(val >> 8);
-
-	return ufshcd_dwc_dme_set_attrs(hba, phy_write_attrs, ARRAY_SIZE(phy_write_attrs));
-}
-
-static int ufs_versal2_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val)
-{
-	u32 mib_val;
-	int ret;
-	static struct ufshcd_dme_attr_val phy_read_attrs[] = {
-		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGRDWRSEL), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
-	};
-
-	phy_read_attrs[0].mib_val = (u8)addr;
-	phy_read_attrs[1].mib_val = (u8)(addr >> 8);
-
-	ret = ufshcd_dwc_dme_set_attrs(hba, phy_read_attrs, ARRAY_SIZE(phy_read_attrs));
-	if (ret)
-		return ret;
-
-	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDLSB), &mib_val);
-	if (ret)
-		return ret;
-
-	*val = mib_val;
-	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDMSB), &mib_val);
-	if (ret)
-		return ret;
-
-	*val |= (mib_val << 8);
-
-	return 0;
-}
-
 static int ufs_versal2_enable_phy(struct ufs_hba *hba)
 {
 	u32 offset, reg;
@@ -162,64 +111,64 @@ static int ufs_versal2_setup_phy(struct ufs_hba *hba)
 	u32 reg;
 
 	/* Bypass RX-AFE offset calibrations (ATT/CTLE) */
-	ret = ufs_versal2_phy_reg_read(hba, FAST_FLAGS(0), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FAST_FLAGS(0), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FAST_RX_AFE_CAL;
-	ret = ufs_versal2_phy_reg_write(hba, FAST_FLAGS(0), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FAST_FLAGS(0), reg);
 	if (ret)
 		return ret;
 
-	ret = ufs_versal2_phy_reg_read(hba, FAST_FLAGS(1), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FAST_FLAGS(1), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FAST_RX_AFE_CAL;
-	ret = ufs_versal2_phy_reg_write(hba, FAST_FLAGS(1), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FAST_FLAGS(1), reg);
 	if (ret)
 		return ret;
 
 	/* Program ATT and CTLE compensation values */
 	if (host->attcompval0) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_ATT_IDAC(0), host->attcompval0);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_ATT_IDAC(0), host->attcompval0);
 		if (ret)
 			return ret;
 	}
 
 	if (host->attcompval1) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_ATT_IDAC(1), host->attcompval1);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_ATT_IDAC(1), host->attcompval1);
 		if (ret)
 			return ret;
 	}
 
 	if (host->ctlecompval0) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_CTLE_IDAC(0), host->ctlecompval0);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_CTLE_IDAC(0), host->ctlecompval0);
 		if (ret)
 			return ret;
 	}
 
 	if (host->ctlecompval1) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_CTLE_IDAC(1), host->ctlecompval1);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_CTLE_IDAC(1), host->ctlecompval1);
 		if (ret)
 			return ret;
 	}
 
-	ret = ufs_versal2_phy_reg_read(hba, FW_CALIB_CCFG(0), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FW_CALIB_CCFG(0), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FW_CALIB_CFG_VAL;
-	ret = ufs_versal2_phy_reg_write(hba, FW_CALIB_CCFG(0), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FW_CALIB_CCFG(0), reg);
 	if (ret)
 		return ret;
 
-	ret = ufs_versal2_phy_reg_read(hba, FW_CALIB_CCFG(1), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FW_CALIB_CCFG(1), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FW_CALIB_CFG_VAL;
-	return ufs_versal2_phy_reg_write(hba, FW_CALIB_CCFG(1), reg);
+	return ufshcd_dwc_phy_reg_write(hba, FW_CALIB_CCFG(1), reg);
 }
 
 static int ufs_versal2_phy_init(struct ufs_hba *hba)
@@ -406,7 +355,7 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 
 	for (lane = 0; lane < activelanes; lane++) {
 		time_left = TIMEOUT_MICROSEC;
-		ret = ufs_versal2_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
+		ret = ufshcd_dwc_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
 		if (ret)
 			return ret;
 
@@ -416,12 +365,12 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 		else
 			reg &= ~MPHY_RX_OVRD_VAL;
 
-		ret = ufs_versal2_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
 		if (ret)
 			return ret;
 
 		do {
-			ret = ufs_versal2_phy_reg_read(hba, RX_PCS_OUT(lane), &reg);
+			ret = ufshcd_dwc_phy_reg_read(hba, RX_PCS_OUT(lane), &reg);
 			if (ret)
 				return ret;
 
@@ -483,12 +432,12 @@ static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_ch
 
 		/* Remove rx_req override */
 		for (lane = 0; lane < dev_req_params->lane_tx; lane++) {
-			ret = ufs_versal2_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
+			ret = ufshcd_dwc_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
 			if (ret)
 				return ret;
 
 			reg &= ~MPHY_RX_OVRD_EN;
-			ret = ufs_versal2_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
+			ret = ufshcd_dwc_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 21b1cf912dcc..45920793d1a8 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -141,6 +141,83 @@ int ufshcd_dwc_link_startup_notify(struct ufs_hba *hba,
 }
 EXPORT_SYMBOL(ufshcd_dwc_link_startup_notify);
 
+/**
+ * ufshcd_dwc_phy_reg_write - Write a DWC M-PHY CREG register
+ * @hba: private structure pointer
+ * @addr: M-PHY CREG register address
+ * @val: value to write
+ *
+ * Write a 16-bit M-PHY CREG register through the Synopsys DesignWare
+ * UniPro indirect register access interface.
+ *
+ * Return: 0 on success, non-zero value on failure.
+ */
+int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
+{
+	struct ufshcd_dme_attr_val phy_write_attrs[] = {
+		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGWRLSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGWRMSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1, DME_LOCAL },
+		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
+	};
+
+	phy_write_attrs[0].mib_val = (u8)addr;
+	phy_write_attrs[1].mib_val = (u8)(addr >> 8);
+	phy_write_attrs[2].mib_val = (u8)val;
+	phy_write_attrs[3].mib_val = (u8)(val >> 8);
+
+	return ufshcd_dwc_dme_set_attrs(hba, phy_write_attrs,
+					ARRAY_SIZE(phy_write_attrs));
+}
+EXPORT_SYMBOL(ufshcd_dwc_phy_reg_write);
+
+/**
+ * ufshcd_dwc_phy_reg_read - Read a DWC M-PHY CREG register
+ * @hba: private structure pointer
+ * @addr: M-PHY CREG register address
+ * @val: pointer where the read value is stored
+ *
+ * Read a 16-bit M-PHY CREG register through the Synopsys DesignWare
+ * UniPro indirect register access interface.
+ *
+ * Return: 0 on success, non-zero value on failure.
+ */
+int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val)
+{
+	struct ufshcd_dme_attr_val phy_read_attrs[] = {
+		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGRDWRSEL), 0, DME_LOCAL },
+		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
+	};
+	u32 mib_val;
+	int ret;
+
+	phy_read_attrs[0].mib_val = (u8)addr;
+	phy_read_attrs[1].mib_val = (u8)(addr >> 8);
+
+	ret = ufshcd_dwc_dme_set_attrs(hba, phy_read_attrs,
+				       ARRAY_SIZE(phy_read_attrs));
+	if (ret)
+		return ret;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDLSB), &mib_val);
+	if (ret)
+		return ret;
+
+	*val = mib_val;
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDMSB), &mib_val);
+	if (ret)
+		return ret;
+
+	*val |= (mib_val << 8);
+
+	return 0;
+}
+EXPORT_SYMBOL(ufshcd_dwc_phy_reg_read);
+
 MODULE_AUTHOR("Joao Pinto <Joao.Pinto@synopsys.com>");
 MODULE_DESCRIPTION("UFS Host driver for Synopsys Designware Core");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index 0406f2bb576b..d8673cd54d4c 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -45,4 +45,6 @@ int ufshcd_dwc_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status);
 int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
 				const struct ufshcd_dme_attr_val *v, int n);
+int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
+int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
 #endif /* End of Header */
-- 
2.43.0


