Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA56CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/n0sVcM/gv/IR5qfrB9U8U5Gi3zxX3YhVLnK+igEnY=; b=aWE5PmueCLzsnLjy7HenpyKY+j
	S2bASnMFeuV5Lx8fo1WqO0KtNVFTh68A3pUIxbXjBi6shXnyDwyPOmaxCJXh1rqBGhQzjuTpXWAPr
	jWywV4DcmP093dTZqdWoDSZ6R9KNoO5iM/zheYCl0kOEABxuJKLcqAmuErHefrvn6d8V3XfQ8EYfn
	XkDC5BCA/E3JrQe2leYIdviw1G+bfh9z5lk7EJhh9Frm6wuq6sP9WJfTfSbHtez2hHB3BrkPoeDEU
	cdioQuMTvDN2QZSZeZTX0HvRj2tsQEHP5O8vAqesGgLl/jRpbNloyCOWi7D8Hvfh+cB8kUd68dSC3
	HN8hcAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bDo-0000000Fjti-0LUi;
	Tue, 14 Oct 2025 09:21:32 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bDl-0000000FjsD-1Rjz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX257iumyHXIV2nFYhKiZoEDOBbDSFLRDCAFjGCatJZJOW+QjB0ggKF5NIrxT6gjOWFN12qqsFf9+AfYiZRSiQEKVATMmTfG2bylc/UHsG8x+l/uKREo+Nzswh7Puo2P2KkRrrZsDtQePjg56TN3VUaJcCYY7FEMMpWO1Yfp0ycy/9ENuIhQ079aCehEIpF2FWqXLUlTeN+UFYNpdFUJ89lwPsXAMsWnIuwvOZyFPDpq/AILyOKO//DwqVG/Ml6Ro2qBB2+XxlOyyDOoEyah8HffCfmBvys6GQnXU3TgaeOGFLUGFonvDFS5o0oWcQKQBBfFa3AH7hOXBB39lvng5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/n0sVcM/gv/IR5qfrB9U8U5Gi3zxX3YhVLnK+igEnY=;
 b=ZVedUh1Rwsxx9hjklFDEDr3GG3R0sTgQzR+E9HCsO62BLHrCIs9RnHLDOQC8qkcW9KjMrBx/YJbrKOr8RaxHt+WROeWa1ksZYsjYg8oiWz7tYGt0yN8N6zH7chvVuJEjtYCfKT3crqs+lHk5GjqInttm8cSWS217ug2geW50oKqMOVKJe1gDtpnGIVlvCFzz/MTPP2k2XXjrghZNRWgMOXKLFzyG6UPPcccXOpRLU2OXedd10d0OH1wKNYPx/9EbO6AsqGhUK2e+/3Wd5Qa+edEtwHEnPmV4CytGrznZe+R+ifFciFnq0rCNSwNJcbjoKa4xzwIq2+jZyK28oZkj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/n0sVcM/gv/IR5qfrB9U8U5Gi3zxX3YhVLnK+igEnY=;
 b=6xK7c8/xSXL3ps8IxOpTYXsJX1UO7Uxeea3ic4guGfBxpkSe7sAbfzm5zYl3HQ7YeloBGT3gF8q3gXW8HrRb/wqdPUMr+v4Eyce1pWXLkpj6jblUOx5hICLe4vIAdlGCzVT/mEm960XtL4gWtrSh1arYONZ5K7sst+Hmwdbf0tICGDAVVBnskiwYly/fxBujumM/mc0UFw6VYNnenhlwV1GZPlQCTgNl1wCy9EGWyjBmRRaO938UVhPxPmMg7BPMF2bsIxpZfIEZR5VNW8lWYwGopiZfXrpBlHSgsCzdVO8/a33gggOW5V9PbVowr/SyRdegbcs/eJKTXtvbI/0z7Q==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by CO1PR11MB4915.namprd11.prod.outlook.com
 (2603:10b6:303:93::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:21:22 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a%8]) with mapi id 15.20.9137.018; Tue, 14 Oct 2025
 09:21:21 +0000
From: <Manikandan.M@microchip.com>
To: <Nicolas.Ferre@microchip.com>, <sam@ravnborg.org>,
	<bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in plane
 atomic_disable
Thread-Topic: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in
 plane atomic_disable
Thread-Index: AQHbHgTz9/mtuBPRlkitZBG568Zv/rKF/zMAgj2ckYA=
Date: Tue, 14 Oct 2025 09:21:21 +0000
Message-ID: <9b6f2e79-4488-4164-9857-ceb3a6ef9c0c@microchip.com>
References: <20241014064644.292943-1-manikandan.m@microchip.com>
 <16e23ecd-24e3-4d6e-a336-da3c4308011d@microchip.com>
In-Reply-To: <16e23ecd-24e3-4d6e-a336-da3c4308011d@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: e5b589e2-c072-4a48-39ff-08de0b030a47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MXg2SlBVUUR5K0JNZzhXV3JwNUNPUnhVNG5ha3FzVFVSOWtsMU9vR0phVVVX?=
 =?utf-8?B?YVJTeWNFQUV5OFlETEs1ZzRzTUU1cjVDYnlYYjZ0UVEvNmtabHJDaCtjWWtZ?=
 =?utf-8?B?UEp6bmZlNENBRzlCUWlhbCs0NzRyQm9XckYweE1XbXNQTEVoVlVpU1lRSWtx?=
 =?utf-8?B?bTFLWVlhRU9rVzNxMkJhWmt6TWxldzRNODMzbGJpSlVvcjVMVk5IZ051M0RF?=
 =?utf-8?B?Z2J5RVVRSTZwRTl6SXFjem56dldDYkxWOXE1RytIWjltMjkvQkExT0s0Zlh5?=
 =?utf-8?B?K29IREwzUWE4OU5EQUdubUlGTEE5cW9EYWJQTXJ6cWZQZWhQRDkyY0I1QXds?=
 =?utf-8?B?TWRTT2JYMGlVMGhmZ2loTWlOZWRDeWZHdS81RVBJZllPTFhKMXR1TzFycTI3?=
 =?utf-8?B?RlhqZDJTb0xqRE1DY0NyVXRUajh6bXptUHZ1Y1A4R21HZkRtaWFJQkRqY1Jm?=
 =?utf-8?B?ck9pWkZjV3lXcnA4K3dlUkNvNHhzT2JpUHkwd0VGNzVsbnlNcFNEWkpKejNT?=
 =?utf-8?B?aGk1QUVMaVEydkVKbkZ3aXl1SXF1OGh5bllKSmRKL3Zkaml4THpHWTV3MkI1?=
 =?utf-8?B?SUZ3akt5c1lrcDNJeS9nd04rU0d5R2dDeDZYM0ZRNmIyTkF2T2pYUGN0V0tL?=
 =?utf-8?B?OUxNT3lpakxacjNMVDBvZzZSbkE2VE5aclQ2c2pHbHNZMEVXbTExNThZY045?=
 =?utf-8?B?QVFndmlGSkZOa1lrc1B4NjJNdjhxd0JOM1MwTU1wOElCYXVSaTdBdFpRMVpv?=
 =?utf-8?B?RVVHVWVGRzZtV2J4MEU2TDNRZHdpQlVFZkxzaVNkYjRWZjJnNUhCSjdMblZz?=
 =?utf-8?B?dk9LMHc2am5DSklKM3pLVlJsYzRiMkFOK1Q4bG1zVkdQZmNrMDBGd1lZcmp0?=
 =?utf-8?B?eFJIQ3V5WVRCbGlCR2tVTVJSdkY2TURvOWNTcTg4RlhockVNK25WV0pLVlBw?=
 =?utf-8?B?SzR5WldXalBOakNDTytoZ3BPelVSTDhyb2xFbVA3MDQzbWRBTTY2akFGakMr?=
 =?utf-8?B?Y1JjYlEzQjM5YzdQTG4reWhFa1BnRW9SM1lIRjNPSnNsS0lOWW9OS2wwS0NI?=
 =?utf-8?B?STlpNGsxektTRWQwV3cvM0JjeFVXNFhqMWM4YUJzZ3l5N24rMUpja1paalJO?=
 =?utf-8?B?UHk0UHRZZ3VHLzRMWlZFYmpMMEl3SVA0dFBkL2puVDBIYldJS0VUZTFuTXhj?=
 =?utf-8?B?MFBVU3pralBZR3ozSWRvN3VxSm5BT1BxZVM2NHVnMVIvdEp4QlV0TXlqVGdS?=
 =?utf-8?B?ZVdGWHBSSlFqc3NBVElGT1hLMEhOTXZqcStVSXJ2cVRqb1VWUW9aN1FjekE5?=
 =?utf-8?B?cjNIOGZqcWVZRFJaM2prSWdpTmNmdDNPQUxQdE0vckRQV1FWTXVvNGdrV0V3?=
 =?utf-8?B?T3NnZGJpYytJOEs3ZklOVkM2elExcEVYTGY2dUNSWnd2aUJUc2hXZGoreGln?=
 =?utf-8?B?MmhQV053ZVU2UzZ2V2tJalUrbUJGVGRNSHUrUGVOVittUXducnRHOHFVU2RI?=
 =?utf-8?B?TzE4MEMwTmxvVlh6K3U5eElJeHIzTWFlMC8waTNvaGl1aDg1VUdkTVV6cVJB?=
 =?utf-8?B?VVBZem9GczZIUEpHN1dZUVlxWFRzWVh3emt6ZTB3UFRwWlpKMjZBb0pZZXM1?=
 =?utf-8?B?MzZqMWJkV0pOVS9EZmpzRkM0emRoN2FoZGZMYnh2ODNHNFcyWUVPU0poL1Rx?=
 =?utf-8?B?NXZ2cENsK0ErcFRyaGRXK1c3ZW16dDF4VlBDVGV4ZTRWZHN1SDFuZHVUNksv?=
 =?utf-8?B?UTFZREt6cDJqR2dlQ0VkVmR5dG5uQnM5SDNvVktucENwVysxZy9nanhwcjI3?=
 =?utf-8?B?QlpjZ2ZvOGpEdEpmT1Y3N0JvMVFJaWVsUVNLTGsxRk14M2p5Zy9uQmtJTFc3?=
 =?utf-8?B?eU9HMzY4dzZsdlJPTjM2VXlpTXRTNnpnYjNzQmEwTk5ITFpRR2NhSGtHdmh1?=
 =?utf-8?B?Ty9JTm5zQWltOXkrMnhnblBTUXhmRnltZlBRb1AxZVoyRzhJbHFYVjVJKzhM?=
 =?utf-8?B?NEs2VS9NVXp4S0luWDJ5eXR1UFJMRUg1MkxISmtkQWdHR1NjVUl0cUVLTFNn?=
 =?utf-8?B?T0lFMW1URnJmUnh4V2NpdEZVRmE1d0k4czVRZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFUycE1hTDFKamhOb2JaUHplUWhqQlJMK0pkNy9TRWZnV28xbkUydHJiL09Y?=
 =?utf-8?B?Rkg5TG91cERmWjA0U2N6bktPbXNwN1dQVzBNL05CbUlObHJGdzNHM3BXS0RR?=
 =?utf-8?B?N3J6dEZGME9YQi9nd1pDTEx5emJFY0krSU5BR1VSY2R1MktUR3FPWXR4NWV6?=
 =?utf-8?B?VU1XRC91NDErQ09LWENZV2RiUXpQNi9iSWorZlFmbE4xVEpOYmxKUjVYc0RI?=
 =?utf-8?B?KzR1a044SWZrL3MrTHUwOCt2dEtidE9uVXpFVHc2Uitwd3VZRDMvdmkxVDVN?=
 =?utf-8?B?K3FBaGlqdE1XS3BsYVpoYTNDejUrT216Q2FvUE92S3lqUzJJWFRFbEpVand3?=
 =?utf-8?B?L1JzN05MMDE5b0d2VGRZZWtCcFNVdnd5RW1GYkZ5ZDVFZXhZcmh5UlB3MG1r?=
 =?utf-8?B?d0E3MlYyKytjQzI5QVNYQ0RqS0dzcFV3cWNYWXNsc21xRmUwN215MHRROUtN?=
 =?utf-8?B?UlQwNWhOTnMvRHBXenM2Z01jRnpYb3hSVVE2eW9hNmdkaWUvemQ0bC9saWpr?=
 =?utf-8?B?bWJyS3pHTnlUVkRDNzZDMVcwdUhnVXNtcnh3Skh6eG84VzlxTStqai9hajN6?=
 =?utf-8?B?QVJnZ1hzN0pTN0dMODNnUUszR3BBN0d2eVFnc25oWjhWWTBGUkFXN3NPVDVC?=
 =?utf-8?B?aE12TE5JOVlpOVRScWwycHI5b2xJRkx1WGtOQTNZa2ZreXRhY3M5R0ZuTEhT?=
 =?utf-8?B?TlY1L1dLVzRHWXVMMWZnbzVzTEt0aGxhNG1FeVA5cGNDOERFNTdUU3M4aEZ0?=
 =?utf-8?B?Vm1meHU3dlFXQi9XUElEcXNjOFh1MXBpMlVEYTBieWJVenFRc3lrMFJ3R24y?=
 =?utf-8?B?M3R5d1huUjJhQ00xQ0FDL29yRXZTbDVyZWF0aTFwcnFQZndnOHY2bmtFNnFH?=
 =?utf-8?B?QkpQL1ZVaGZZaFUrTmU4ZHVrczRaR3hJQ2VNTm9UNUZqZlErYWt0a3hSWHBx?=
 =?utf-8?B?d3UyVXQzYWhqOUd4TlpOQjRxaFJIZGxFcUNtREpEZC82N1lzeEVZYUFMbHRB?=
 =?utf-8?B?SHRJOHJ5NzBIZVo0b29VWEJ6cnRuaUQwdFFhR3c2cEZxYjV6eklZbnRWOTVB?=
 =?utf-8?B?N3NxRkVNcjA5OE1mSktoNjMvSVdnTU5uRTdFTzJKdTU4SXMzTDdMMFoxdnZB?=
 =?utf-8?B?SWhQbE44bzZ5RmdXWUwvR1dsS01jaTVqcVlTWndOSjh5ODNoa3pocHdPem1N?=
 =?utf-8?B?UEw4M2E1UkJzZmloQmI3THRSR1NBUk53QjZCdGc3WVUrbTFsQ1NIeXpEVjdY?=
 =?utf-8?B?OXdveVNFaE9LdVd4QmhwaXBkbXI0bmJJa0dWbmcxY2MrTnk0eTBGa21nQWVr?=
 =?utf-8?B?MWI5bWtoWS8zN1ZWUmZoUWFoUVpvM3FzcjI2UHVIRTd4U1kwcUR3U0Zrc1dG?=
 =?utf-8?B?MTdVS1VneHZWYk5hMHVVRFVVK0xVYlJadmdOVG9NUi9lNEpxVUp4MUtHVnJw?=
 =?utf-8?B?a3dCLzh5M1lpZzF3eVNHRHRhMGhXcTkwS0c5WEVXaWJ4WHBWc2o4ajUrczRr?=
 =?utf-8?B?SktRWEZpT0NDalRiUjRQWXoyZldUOGMzZEIvaFNTb1p4T0tUbjB0WThUdDJY?=
 =?utf-8?B?YzhYbktuREJBMDZ5STJOd1ZxbjVvR0c0TjF6NFduaEd1VW5CSVdLTGVNTjZ0?=
 =?utf-8?B?Qi9UY1UwZ294SFBVOGx6TzFvU3grOEp4RFR4UXFNZElnczJmUUd0RWEveHUz?=
 =?utf-8?B?bUtEY0x0bTU0S3RhbTF2eUZFRitNalppbGJEcFJhVHd4bU9yeGlMamtPVGJj?=
 =?utf-8?B?VG9LRVRPVU8yNGRzL2tqVWtFWnlmUTRqZ3VKR0lVVjlhRGJ0RU5SY1FCVmE2?=
 =?utf-8?B?RHlPbjFkVEo1Q1VrWDliVGNDSnh1SThKUWt3STgzR1dOOXBkS01YNVp1WDhX?=
 =?utf-8?B?RjNDeGNJTUp1QS9ueXprdy9HeVM4ZytBakRZbndvZ3ZLV0xLa21aUlNnWll1?=
 =?utf-8?B?RHRtS0toTlBJd0h2dE8rZVF3SWgzcjBib1NjZ3lFMkhEbVFLL25oVWpmWGha?=
 =?utf-8?B?UERzZURHV2I0RHdBYkJEcm1DM1N3eERGRVhuaTlVaEpUWUdNb2N1ZTErSUxI?=
 =?utf-8?B?ci9vZHV4cFMwZmtjQlRvZ1g5empoRGtPM012TEk1Mjh6Sis4ZE1xbk1TSjRj?=
 =?utf-8?Q?1hQlMHVhWMwA05rLLR2UlILNz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C22159F9D40C1D43B852E08D5F892B51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b589e2-c072-4a48-39ff-08de0b030a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 09:21:21.7931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDpA9eaYO2w8j/BBFXlXRliEMiXFX5zMBa9rstjhUjmh8XtqdNvizbqgqG1bvmK1PG6qdgHPuaMaQ57lhmjqju0gtWecfu1SIyw09FpaF5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_022129_809120_D863E20D 
X-CRM114-Status: GOOD (  10.26  )
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

T24gMTQvMTAvMjQgMzoxNCBwbSwgTmljb2xhcyBGZXJyZSB3cm90ZToNCj4gT24gMTQvMTAvMjAy
NCBhdCAwODo0NiwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+PiB1cGRhdGUgdGhl
IExDRENfQVRUUkUgcmVnaXN0ZXIgaW4gZHJtIHBsYW5lIGF0b21pY19kaXNhYmxlIHRvIGhhbmRs
ZQ0KPj4gdGhlIGNvbmZpZ3VyYXRpb24gY2hhbmdlcyBvZiBlYWNoIGxheWVyIHdoZW4gYSBwbGFu
ZSBpcyBkaXNhYmxlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRo
YXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTmlj
b2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPg0KPiANCj4gVGhhbmtzIE1h
bmkuIEJlc3QgcmVnYXJkcywNCj4gIMKgIE5pY29sYXMNCj4gDQoNCkFwcGxpZWQgdG8gZHJtLW1p
c2MtbmV4dC4NCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==

