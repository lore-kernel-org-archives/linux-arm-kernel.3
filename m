Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niTM7tvKflv+37O+TYoEApPpcQFxWW4qhfOejryWs5o=; b=Dk0XJC0DjrC8C+3aK0i/RbSfW6
	N3NENiuB4PnM/DOXcIGIF3oZJDYThWd/iGXF+gxuMIVHSlevQxBzckE51DCUV5od8H2vpfapCTe6R
	WZKzDJ8F7qIO4kv3WcYf0gw6an/vzCbqYXvp6NEN7f3t5hUtWv3i6VM5tHy2uH2bPVhdKSyYb7psJ
	mfixgB63jBt2dRppJ/nB2ZbSXxmoNUgiluDCOQW1psgXeuapZaCvP97MXAs2ghXoexNu0v463Ac3P
	xEAvJQ2rRynu2IK83uh7065+iAw+h7j18RzTn1w7vUVmkstPyhxTlomfpxUTBWIfKl8E7nO9XLOvU
	+pv3Ymkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61iT-00000001QGt-3cus;
	Tue, 07 Oct 2025 07:02:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61iQ-00000001QF4-1vVo;
	Tue, 07 Oct 2025 07:02:31 +0000
X-UUID: 94198ffaa34b11f09f706fa2197c6ceb-20251007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=niTM7tvKflv+37O+TYoEApPpcQFxWW4qhfOejryWs5o=;
	b=S/HQkGlk6bFCEXBS9LHmWLEEXdsR4OjGkxTwc/pmvQlY4OFDbsrl9qE6gh/uhep5SOGiVBXzZWgWIs+Csa/8BNF/n+GwU5yEdKybp/yH6RLDDOY2qML8CGEhqx11q9l3e/LKOOVJRf4ehq8l17Rihcy2ALLN2zjl+efdHgDxw14=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9ff5f27b-ee5f-4d32-b2ca-26ed874c2dfa,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:37aa0df9-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94198ffaa34b11f09f706fa2197c6ceb-20251007
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1605140602; Tue, 07 Oct 2025 00:02:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 7 Oct 2025 15:02:21 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 7 Oct 2025 15:02:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD4xpDozVGHOsEJZX4Jb7j/Twz+tnk/jSpD8QJcADUwSYl8PtWxTFoTCN4duvb1l0U1dGlCtvHqh+a5xWN8IYBHsnRJ3BArLI1rPZt/TmtgDs67dto07MXxUKbofRDPzNOhOVOD8ScInrjnOWvkxA+yRk++tej/qK+m+ddGXVq228RLX9iGCVB8pwrLSFEeqJoNK2Zz1B86ro1twk44lZ8aKwRthnvHcRY5dILQshrl7jAzHIJ6dlzycGr6aiWSZ3gpGkpzrd8dtvOEwK9W/1XwVdwct2ZsJVuqc36K6z38SCMiWxDe6Y/Qp7u3Xr0x78qwSarNcJ0LhUOFOiijlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niTM7tvKflv+37O+TYoEApPpcQFxWW4qhfOejryWs5o=;
 b=giEjtjQ8ab3D5gZ/t6b8RwHnlZ8xhJmz/n8TV6wh3+ti9Ikkpt69JSwLuO+dG9w08Hm4jjspiNBhkN0NUWLQM0vhc059GENRDMrmRL47W4CwRhI/cG5v7FgLztsgIP2eLTkdeK1GZBM4qQTyAcCf4VPj4aoKQ/UT9moHodZolQI6DOqnnwiRzAm70Mb5DbFIKB9rKCae28HgTPj+HhOOaJAAj344LqBv61kCBqEHqx0DdI9eibcLvnym3SIuirlgRkO3at9egWq+AtHq+TyhWgQFffLXK0eVpL+9lkZzxb0Pc6cxSNKCOsH0KobWThsfUjywrNbsbxoHHXleDx0ZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niTM7tvKflv+37O+TYoEApPpcQFxWW4qhfOejryWs5o=;
 b=LrOseLHm7yOcDpI9VwKT4fsnyWIKFkC9Vf4kAtVTJbI09gLpcm4HFCFO/H7Ce53LdcNqwsKx7triffuyiJKIrV4QegE295XVmEkmY4903tQmJWeQWuubQcyKNetCiRFrTjwu0+0tDHvueMcrNvykL8o9SyG9gLJhw2zpNPVyHVU=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:02:18 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:02:18 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "avri.altman@wdc.com" <avri.altman@wdc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>, "quic_nguyenb@quicinc.com"
	<quic_nguyenb@quicinc.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>, "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>, "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Topic: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Thread-Index: AQHcMxYfOksnBxmnP02s2Q6lFEkIhrSufh+AgAC2GICAAIwFAIABLjOAgAVcBoA=
Date: Tue, 7 Oct 2025 07:02:18 +0000
Message-ID: <bc223eabf97d4c530a43c4831fe6ba2be7ae43b9.camel@mediatek.com>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
	 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
	 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
	 <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
	 <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
	 <4e58fa6c-ddec-a6a9-fb8b-5f4ffa12fbc3@quicinc.com>
In-Reply-To: <4e58fa6c-ddec-a6a9-fb8b-5f4ffa12fbc3@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TY0PR03MB8330:EE_
x-ms-office365-filtering-correlation-id: 4b19188e-0e5a-4425-7840-08de056f7466
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UFpPUTNtamJxMjFuZi91RVFMb1pLTFNXRWU3NTREcTh6RHlUYUFIWXphdHFj?=
 =?utf-8?B?YXpMdnBqU0NDWkp2Mnh0RUxDc0lzcCttRGJDOHVRN2VSb1JnVXovQ25QUFQx?=
 =?utf-8?B?QXJaTjZCZkYzdEJ5bXJhN2tGalhMVEFEc0xuUjVYbHI2L1VBZnprVTNqLzEw?=
 =?utf-8?B?Q0EwbURrL2R2L3VQQW9IdHRKSmNUZUZhdEUwQkZLZ0g5NW9GcHJBOXdpVmNP?=
 =?utf-8?B?Y1VsbGx4NHhnK2VsZFBwQmQ2N1hXOHhCSlN0c0hNZFFSTVdBK1RQVm9NSFR4?=
 =?utf-8?B?dytTYWRURnNrNkVRVkw1WE1ZV1hQTGxERDQzR215L3hnRCtCTGVMZ1IrRFor?=
 =?utf-8?B?RmdGSkY5bTVLR0ZYUE0rNjgxaTN2Wk5HWXFlbHBid252Tmhib0dVV2s1bXRQ?=
 =?utf-8?B?T0Vlb21ud3gxSS83VGpWUmFueVZrQnM1U2xaTzNpMHNPSzdNaDA2c0VmaURV?=
 =?utf-8?B?OFRlSlp3QlhHc2JjNk8vT1hvS3hqWUtLZ2dJUkFMTDJoY0d1SzV0VVRJRjRN?=
 =?utf-8?B?Tnp3aDQ3N0E0NDRnQjlqTXg0RS9sMGtoNDFrTCs1aFJPcktuLzNFdGZ4VGo1?=
 =?utf-8?B?SXEwcUFhb0NndnQ0TGErcjRYYmEvZFRSaDNIWkYvelNUVHVKSmpHRjVrM0Mw?=
 =?utf-8?B?NGlXTi9vZXhMSG9lem11eDQvWnhHL1R6bVZ5UDVBMTlIdGl4cnVxRzdYcWxV?=
 =?utf-8?B?RFQ3M2c0SGFCd2Iyc0hlK1N1L29tbThPWHBFV256ZGpxWmFVSWNhdWVKUllK?=
 =?utf-8?B?aHI4UjFIaGhnU2NoblhzcUgyNUV3amY4WFZONjQ2cTFEQS9DelcrOXVONFNS?=
 =?utf-8?B?WklTSm50SnJjbHBWL2Ztb2M0L2l4cUpKdGtZQVJsT2IveE54QnZWVmhLakV4?=
 =?utf-8?B?bXVLRUo1UEVRZnlaSlNmbTVPTlh4NG5zR3VZUi9jUXJHSXZMM29nODA4K0JH?=
 =?utf-8?B?L0g3OTA1c3lmcGJidHVkL0hpczJFN3RObjRLVVBXdVplS1dhS2JtSzVmdldL?=
 =?utf-8?B?QlFNaXpiNVpXQ2piUE93L0Q4eDFHelRTV09XcTNFaGIyZkRTd0hUT0JnWHht?=
 =?utf-8?B?ZXFxR3pycVlQODdSSDFvNXQ2dk9xcG9LcmZTNEd2S2FXNXJJbnByTkd3alFI?=
 =?utf-8?B?S3ZzRVlyRTBoeTQ3enEyZk5pNEUxLzltYUExL2NEZ3YzRGdpcGVCOWxqS3ZY?=
 =?utf-8?B?M0ZZR1VaK3kzY3liQ1hPak5wVzFsQnhwajJObElNWjBHY0xreVpjTitZZFFM?=
 =?utf-8?B?WThjM0JCbTZKZ0ZRbWhzY2s1TVZrUUFhUDVZSHpjU09pZW5LZ1c3WHdTNUFJ?=
 =?utf-8?B?dmNUUXJuaENwN3o2N1JtdDN6UUNPMGF0eU1COS94RXQ5Yzl5UFlPMSszMjcr?=
 =?utf-8?B?K1d4aWxVNjZUUGFBT2xZYm91T2ZzWWNPMkwrd3lyMXQ1Qk56b09GUDBRSUJW?=
 =?utf-8?B?K29iczlGSnZBV1E5cnU4UHY0eVo2M2FyQUNHeXllYy9JUGxPS1EvSWd0Ylh5?=
 =?utf-8?B?d3VvMmVUYXR2MVBQR1pFY3l5d3lwckJmYUNtS0xuNDRsQUdCMHJpVWhjekpT?=
 =?utf-8?B?OUd4aEQ4eXBRRWpJNVgvU0tJa3Rhbjh3RTg2YUxGeFBOWVIzMUhJVXJ6S2c1?=
 =?utf-8?B?RmtON2ttNnhibG1iMGo5QlF5emprVmtGbWtlem9BR3hDRVZFVkRvR2J1MUNZ?=
 =?utf-8?B?NEFsSmxNU0xRQ0FUV25MZ3BKSDVzMCtBRGd1WFJlZ1hOVHF3Rlc4cGEwQVFv?=
 =?utf-8?B?K3BCMHFNQUl1dGJHSGErc3BKZml3Qm9yNUNKQUQycjh1MHNCMGRUdmZtRnU4?=
 =?utf-8?B?L08yM0lHOFVyeXFYK0hudmZBamE5VlJDMmJ5QUZnbDlnTVZBVnY4M04vZjdU?=
 =?utf-8?B?QmJUWUM0TksxSTMyWUs0dEhGWnhWK3VxaVNRZGNIdVI5Y1crTXFocEd4QmNP?=
 =?utf-8?B?TnBFa1ArQmlTaVY0eWh5dzU3bXBna0JMQzd6NVIzdmFNZkpBY2ZiMWFXTy9i?=
 =?utf-8?B?MTQrQjl0V3l3QjN4MjhiRm1hTEFpVVNsVXBZbzdtTEsveGVwNTQ2Q1NtU0xk?=
 =?utf-8?Q?j0kTPt?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUVPd2gzL3FTQVFEa3d6ZXg4UTVLTWp4NWJGcEgxMG83UWNDdlNha3VkR2w4?=
 =?utf-8?B?dUJSTzlDOXA5eUR1OW9YVTJDMzJ0WnZKekw1TUxUVEZDZjIyb01iWVVtbXZG?=
 =?utf-8?B?NlRoRzFDeCtUZWE1Ung1NXg5SHNUbHA5TkYyVDZqejFiWjlpTEl6MjcxeSt6?=
 =?utf-8?B?bFgyTmVLMWRYZGcyV0lVeTBMQTFIUURCaE5PMkU0bUlYWlNUbWlvbTdyTzE5?=
 =?utf-8?B?aUNrQzJPSFdXclNHV00vWFo2STdBQVFPZDA5TXlUakdJSmZuc0xHQWFwMlli?=
 =?utf-8?B?VmtSVmdlcGZmd2tNUmowMTBKZEh3YzZFcnZWTk5ud0tkYVVxaTA3MHJKQ0Nt?=
 =?utf-8?B?eTBNaHp2YVJRVXl3RHZRRzdVdE85QmJGOHdmd2poMGllclcvdll5L0J6ZWds?=
 =?utf-8?B?a2doaHlDcFVXRUNIWFNzK2NJYnVROGlYcXpNWGJkOEpKeUk3QlBKQjhjQmNh?=
 =?utf-8?B?ZWJ2ODZTRTk0RHYvQld1MFl4RzF4eUt2YXpzRlcwRFo2cmN5U2NuNytpOHYw?=
 =?utf-8?B?c1VkT2YyaTdMK1RvbEluTUhocEV4ZWdZLzJ3WFlIRnJHY3N0WEJ3bUZsY25X?=
 =?utf-8?B?YzFKMyt0Q2dLbEkyYi9QZm9VcDJXTHpxR3dudmNuYnBwUVFvY0kvNklnUlJ6?=
 =?utf-8?B?dElPNlhCTHJweE1uMVM3L1NCSGx1clpyblZrdC9LVTNBWHpNWmlYU093SzE3?=
 =?utf-8?B?Ym5Kbi9LdGdYZGNyVlBFcHpIWThRcGNyam10dkdWRk5GK3ZhZTJyVVlTZU0y?=
 =?utf-8?B?SXB3a1c3bzhBdmM4N2tUNUQvODlTVDJLd0RlazF2TCtuOVB1MDljLzJUcjhK?=
 =?utf-8?B?NDRibkRZcFAxWnhlMFZ0bnliSjgzUUxUWWNBRkh1WkFoaFU3dC9ZUTlFNmZF?=
 =?utf-8?B?Rkc3N2ovNHpPWFU4OGI1SmtYSE9Rdm15eWRGbGR0aGx5ZDl3cFk2WFNWT3F5?=
 =?utf-8?B?SG5TZGdBR3JMRi9OYWpkUjhxM1NqQU5uRk9hNlY0YTArRkJ2ZHczUk5iZlUz?=
 =?utf-8?B?aTFRamxmTk5oSk8xYTV3OTdyaFBOSTRzaThGTzhadkhUa3cvRERwb3BGN1FK?=
 =?utf-8?B?bTRhUy9kVEVHall6b1kwY29QaTROYmpEVVZ3akhMbGNWRFhnUllvVTNIZWdw?=
 =?utf-8?B?SEFhcDBsWUlwY0F0UndvY0NlcVlLOGMwZTd2Um91K1VoVWxiSVJEc1hzdmp4?=
 =?utf-8?B?eXJRMkt0dGhxeE9TUTUyZDBnUjVHMWo3L05yWTd0YTdFRzhtQjU3N3dxa1Jk?=
 =?utf-8?B?djJXaFZ1bTU5RDY3QWFRSFZxdlVXOHRybGlaKzM0UmhGNUNodjJwTzBZOEwy?=
 =?utf-8?B?dTdiUi9QT1JhOXRKc1NMRjdsNHl4V2lTdzRVMWttSDA4OVNpZnBXcFZWNUIr?=
 =?utf-8?B?aG41cThLdk00dWdFdkd5QUZvenY2akZ2QXl3VEhua3BGR1NjaTV2RUpLZW1o?=
 =?utf-8?B?Z3JiMmVvVUxyQkwraXppSWdYMWxadkdOVVFNamp6OFZXcUNxWlRZTW02VVNP?=
 =?utf-8?B?OVdwSEpVRFhYRGdXWWgvV3p2bXBtaUxiUzAwcXFaY0swMVloS0x6RDBiVDJG?=
 =?utf-8?B?d3RwT2VRSCtGT0Yxb3ZBSHVYeW1zcnBPVkx6TEVqNEJ1SVNab2cxS29TL0ZX?=
 =?utf-8?B?SVVsWllySklSOXVNbkhRc0pXTEs5a3puTG9xanNvUXA1UFBQUlQ2NXAzcW5z?=
 =?utf-8?B?Nm44T3RoMTVyK2dPMXgyTkUwUkV5djBzWWNwOXFjTm5qVS9UNjJycEVUMHp5?=
 =?utf-8?B?MkNNa3dWTnRYMUNxb1diRVdUa2tXSnMrS1NEUjN2NFhBYUxxWVBJT3JWRU91?=
 =?utf-8?B?Ry96ZDZVb1Z1V2VhR3Rrcll3YUx4YkJmWmwzTkJ1VUZQVWZMa05HdEY2OThK?=
 =?utf-8?B?VU9Wd0pFQXR4dXFLVWNBUnVwZldqUDhBSCt5OElLallTMFV0ZHpoWEhQOWhm?=
 =?utf-8?B?RmpnQkxVZ3lsNHYxUUx5NEwrWmxFbXVrSXowYWhGVVBiU2NWa09WWFJTdVpt?=
 =?utf-8?B?bWF6Z1Q4cFhLSjQ2Uk8zSGhYNGhNcy9UZW5yREpQaVFYZkhQcnJsVk90ZTNl?=
 =?utf-8?B?VUM5bG5lZW9RcDBpazNsWnByQ3VHV1h3dENjLzJYUVdGVnVoQTRubktDODdL?=
 =?utf-8?B?cGV4RlBsVDRVYWlIVVRZLzJJSEM3YncwcWhlNFNJbHNpZkYwSjVSbWd3ZFNE?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F03430AA282B784F905AF3B8E354A7BD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b19188e-0e5a-4425-7840-08de056f7466
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 07:02:18.5286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7m5nvVBqRCUpWsFfGLjYvYX1vLYGvA3shJ0cVT6lS7a+LIigcR4ZS3LxqNvgTNqkz/lOi8GkGuyNr1enFkM90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_000230_502579_81F4FC71 
X-CRM114-Status: GOOD (  14.98  )
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDE0OjExIC0wNzAwLCBCYW8gRC4gTmd1eWVuIHdyb3RlOg0K
PiBBcmUgeW91IHJlZmVycmluZyB0byB0aGUgYWx3YXlzX29uIGZsYWcgaW4gdGhlIHN0cnVjdCB1
ZnNfdnJlZz8gSQ0KPiBiZWxpZXZlIGN1cnJlbnRseSB0aGUgdWZzX3ZyZWcncyBhbHdheXNfb24g
ZmxhZyBpc24ndCB1c2VkIGluDQo+IGRldGVybWluaW5nIHdoZXRoZXIgdGhlIGRlbGF5IGlzIGFw
cGxpZWQgb3Igbm90Lg0KPiANCg0KSGkgQmFvLA0KDQpZZXMsIEkgbWVhbiB2cmVnX2luZm8udmNj
LT5hbHdheXNfb24gPSB0cnVlLg0KQmVmb3JlIHlvdXIgY2hhbmdlLCBNZWRpYXRlayB3b3VsZCBz
ZXQgYWx3YXlzX29uID0gdHJ1ZSANCmFuZCByZW1vdmUgVUZTX0RFVklDRV9RVUlSS19ERUxBWV9B
RlRFUl9MUE0gdG8gZGlzYWJsZSANCnRoaXMgZGVsYXkuDQoNCg0KPiBIb3cgYWJvdXQgd2UgYWRk
IHRoZSBjaGVjayBmb3IgdGhlIFZjYydzIGFsd2F5c19vbiBhcyBzaG93biBiZWxvdz8NCj4gVGhl
IE1lZGlhdGVrJ3Mgd29ya2Fyb3VuZCBjYW4gYXZvaWQgdGhlIGV4dHJhIGRlbGF5IGJ5IHNldHRp
bmcgdGhlDQo+IGFsd2F5c19vbiBmbGFnIGFzIGl0IGFscmVhZHkgZGlkLCB3aXRob3V0IHVzaW5n
IHRoZQ0KPiBVRlNfREVWSUNFX1FVSVJLX0RFTEFZX0FGVEVSX0xQTS4NCj4gDQo+IGlmICh2Y2Nf
b2ZmICYmIGhiYS0+dnJlZ19pbmZvLnZjYyAmJiAhaGJhLT52cmVnX2luZm8udmNjLT5hbHdheXNf
b24pDQo+IMKgwqDCoMKgwqDCoMKgIHVzbGVlcF9yYW5nZSg1MDAwLCA1MTAwKTsNCj4gDQo+IFRo
YW5rcywgQmFvDQo+IA0KPiANCg0KWWVzLCBJIGJlbGlldmUgdGhpcyBpcyB0aGUgY29ycmVjdCB3
YXkgdG8gZG8gaXQuDQoNClRoYW5rcw0KUGV0ZXINCg==

