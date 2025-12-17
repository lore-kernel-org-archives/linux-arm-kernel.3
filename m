Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF803D6406D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPQcLvgIPm0srHMtdp6yEblasdjsKuWxgUFKZ13WL2k=; b=hN12jxaZQlRBqSdEUCFO1k3AwG
	viHA5jIBl2ShpCkEuZvjoYYLBBIcHg3GM99jdwCGf++aOA2IIXNXYTUGz/Fl03H8flGqeEQZxpHII
	n0oEnlMY7fVnPzJw+aaDIEodTMzfZGPA5E/+gx3TW3kDTvqeT279yEyUJblbZndwYC3nliFPUPiTD
	4pI3dlsxayfzV45ic0m7M4Zsi09YoSJzR1AN/DIM++OWDMOB6+FtX56AZswm0DgCGRvjhsicDt8Un
	dwjOGObZlPaSCPTk1Tu0oyhqarhirt1cDEei5dFC13xGe/8Q71+/dH0IeSesOTgh00gUZgWExZzbd
	rkuKsE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhRB-000000063ql-3W6e;
	Wed, 17 Dec 2025 02:38:49 +0000
Received: from mail-japanwestazon11022077.outbound.protection.outlook.com ([40.107.75.77] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhR9-000000063qL-2YS3;
	Wed, 17 Dec 2025 02:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvThZGkV9ELQPsglAudxOWWSUfvXlKB53WQyxo+/eSLhusrmf3+nV9MPT8whM5+BOUp/2GFEZThxstTcfGRmOFLM8fmEdONexjbptZtBPnWxshkczF0iF62kpNSsVvuruHJCZcgzO1kHa8gDzQQBnbRor3LiDsIK8pPrN53kZlvZbqwD8QrmAkNiCMrKlQD2TAoAohi8l8rdeskN8u8+3x1kXnrVCOGjdv0Ht2gaRc6N22JggjGCk5FrLeqRv44W5v5s/5CsN7fO7ZEUgNKgQZWcHJB9CCqUGUK5y7gWyGrkI0NlU/YKZfagR7U9KbODqcyxhcWdeMQ0HQt4eDNRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPQcLvgIPm0srHMtdp6yEblasdjsKuWxgUFKZ13WL2k=;
 b=g2AOw0sHEJwVv2ZbzQC8g2Nk1B2qjGIlj2FwFsXCW0qDU9FKOwWaMrVw2jLfo04vBdYKU2Un2cKWxh+BOosF693N2ZNGLZv3xCHvL7b7BhX2t0ofmY0CYfIl+psFHyZXxIo/48aV60+rtYGcRZO3zdaRUyJLCc/q1IkNBYzMLgioFR+cS6l86kb4BYaYqU8u49MPgc9m52pTLvkJxKiotp5YUbeLXk46Vpvh57RGsdgQtRnrPNWMr2p+85HPfOPzsrdqAD1wk6t9g7OqIsGcZqia6tigMrL6rDe6atkmRx41XZMIcODJL9RbVAWjNRLynTzOqgrO7Yb2uzsISIa6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPQcLvgIPm0srHMtdp6yEblasdjsKuWxgUFKZ13WL2k=;
 b=m/8hhH9/+P6MBilLeILdR2MY73TsSkRM1KZ9QFmntYJua8J71kIoU276w0H5/mv94Olf0/tiLwPs7I0VLOFOIAIENPMVvfJLh2dUnkzglrEjbp8cjZ+LUDO0yKyfBCgDVdPAsX5EhUS6xTbi2GjRlrEqwfrHpChFXfU+cpz7iUMQvbuk+nj7sUqg3qd0OJlXxCD81UaooDmrRVubAsw+6fC3TXj4wqa8ofx4FcieHmJWZSYq9/jm61ezRBHABo0VFfKICp7zdWfh5vDFmAbPDDZhgJxzMhVzJ2hj6w4ABMSBSNWrdxexkWfq/8cw1D5jA1YucO8MkK2M3Z+bg4+vvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by JH0PR03MB7324.apcprd03.prod.outlook.com (2603:1096:990:17::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:38:36 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:38:35 +0000
Message-ID: <7ea65b00-a2d9-471c-bc3d-cc340ee1046d@amlogic.com>
Date: Wed, 17 Dec 2025 10:38:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
 <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|JH0PR03MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d8e456-cf37-47f6-2ba6-08de3d156060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGxvc056aXhTNzlKREFGaDRYUXNkaGQyamI0eGNxU3gwVVFON2tmQ0JKOFpU?=
 =?utf-8?B?a0pDb1ZKVjUzY0JwdTVyZGJobG5XYzAzcmc4MzFCbmdHYVRCdW9UZHdQRGpG?=
 =?utf-8?B?WHNwRWY0b09tWnBXY1BDOEZlNnF0NXNwTVh5K1lGMXlocGhTTU9CZHlvRDBy?=
 =?utf-8?B?aWFmSEZQb2QrS2EzNFdONnNaeGovZ29KY1VWbGNZd0NCd3JCUWRQZkk5bmpZ?=
 =?utf-8?B?Z0F3VHhOT21pMGJwKzlBYWl2WHJnWkIxWlRuU2gwaG5jbnpjdmtjWVlwZWlp?=
 =?utf-8?B?bk4zYkNHMW1vWGdXUDMwUjZ6YXFuMU1yaFk0RjFpVjFSaWxScmp0QTUraXdw?=
 =?utf-8?B?Nkw3TDBlWFBQZHRpRm82ZndKMklrNFFscGJ0S3BudjNLYVVuUDZsQ2w4dkxI?=
 =?utf-8?B?K25yUGc1YnlZZGVha2EyVEpqYmkxZHB2NDNrbGF0U2Z1ZWJ1VE5yU242bUJC?=
 =?utf-8?B?SDEvVDcyamIrTjM5T1lTRXJHbFJoeTdSUkoxTXFnVW5BcU9kUk5HTUZTZ00w?=
 =?utf-8?B?LzNib2Z5MHRONitwb0k2SU5tSDZVU3JZNVBSdm4wYUVtRTMxbFkwOVJnSndp?=
 =?utf-8?B?Ky94SDBqeWc4UXZnV3QyOUhHajY3K3JFT0E0RFFLaTU0TmZEVG9yTklINEpl?=
 =?utf-8?B?cWE2ZWMvaWRVYVhsYWJSWDlKc3BJL3c3bmlKd1o2a3ZBZkM2SXlCV2hOVWVj?=
 =?utf-8?B?dlA2SU5ZMzRpZG0xUUIxVHhwOVlrc2I5NkRJYy9jc1o1bjIzdDdCS3NjV3ox?=
 =?utf-8?B?MGo2OFFaQUQwdytuMDBTN1EwSGVHbFdsVjMrUTJ2N3hjRi8rYVYrNktCZWUy?=
 =?utf-8?B?TkllYjB0TFJ1VGpyQThOazBYY3llYmY3bVp1aWZUWDlQd1pDS3ZVbXdmeVZ3?=
 =?utf-8?B?YU84OVVaaCtjTkFkRXZOVGVRL2JBbXljejZ4THZGc2c0Um9CSGtzS3p5cERB?=
 =?utf-8?B?bGI0TVl5VDBDZmNKejFsdTJSN3NuR1JzMGQ5bStTY0JRcFdiNVFuSWFZYkhF?=
 =?utf-8?B?clhUVUNmbHV0bjdQWHBPWENCMkM3cHBiY2RNNm9WR0RLcDQzOGhqSTRRMW8x?=
 =?utf-8?B?OVRjQ0kvbHg3cWZzZUtIOWtVTHQxbStBTjYyMEtDODBOZUEwWE0zL1lzd05G?=
 =?utf-8?B?eDNpV3FGYjMydHpuNDFVczRoZzZQaXlmTnNPTWJsWDlzZnNpcUQyNnB1Wmo5?=
 =?utf-8?B?ZnBqc0RVczRXUTRGNTc3UFl5NEtWMHlMUlFyS0VnZitiK0lPM1lWbndyS2VT?=
 =?utf-8?B?YTl3N1RVNTNONkJVTDZMSGRYRFh6Mi9taDFxdkIvMTM5a3VXMFBKUHh4dVZC?=
 =?utf-8?B?dCtMVlA4RFpuK1Nrek5idWUrdDBDNDhSS3hLQVBhcFBiWTNVR3YrdHV6UDlj?=
 =?utf-8?B?ZE1ZbGNCM0NIRjE0bTNrNlRMU3dwSWwxOFc4bGwwVjVhVitGdTRmd241MjRt?=
 =?utf-8?B?QVdyR3hJRzNoMWNYNEljMUVLdHdKZDl1aGJhdW9qaUtjNUJ3SURaU09lOGVk?=
 =?utf-8?B?MFYzMm16bGxsSFovWmljNW9RblN5Vm90SHMyUTZkdmtrdWxNNWVkc2xqTVVQ?=
 =?utf-8?B?b1JCaHlZVzZrQ0dEdTh1bzNwS3AwQ3R2TWY2SHNWZXRyRVBOcG9KZldzKzAw?=
 =?utf-8?B?RU1qd3FCcmdSYVhYTWhDa1dpcEl0Snkxd3QyZTF3QncxSHdJUXlPblJZaFp3?=
 =?utf-8?B?aXhnMVZqVjY4WVJtbS8zVzErcmswYVdFeFk0THVPdndoeXNqZ3dMTFNmejFZ?=
 =?utf-8?B?bmhTczhMbjV5MTJPeGh3L0g5RlhONXZRT3ZTSjZNeVFkOWNCRnpEV3pDTjhQ?=
 =?utf-8?B?emFBM2xmZXVwcEk0ZzVJWUMrU3JBTVUxaUIzQ0xnRHJ1YlhJOGlnM2YxKzg5?=
 =?utf-8?B?d1VPRTB5SVNocFZsSXdMVzZhdDh6SmkvU0lCNXRBK1ZNekE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ell4dm1iclluV01MdXlxR0hXZmJsRVZ3akxkZS9YOFdONU0wckxDUVR6VW1K?=
 =?utf-8?B?cGZZbjVpek1HTGluWFVGa1hJcm1WY0hLVHgzMXlDNVBOZ2FLWm4zRVRDNTB0?=
 =?utf-8?B?T05iS255Z1JxdFRlajMvSCtlVXJzU3dVVzEyMUpKQmJhQTI0bTg5dDFvVmhZ?=
 =?utf-8?B?ZWhveEEvZ2w3NkovbW41RGRaQUw5c0doTG1xRkNNUmR6QXJtTVQrYkozT2lS?=
 =?utf-8?B?UjlieHVQNHdoR09adlpGVDhpbllLNjAwM21ZM2I0U0N0S3BJZWdqSTBOWUZR?=
 =?utf-8?B?dUp2bk9MdGhnSHJPSGxtM3RrRDFkVkRLeCs1dG1nUE80YmFWUzdNeWFNTExV?=
 =?utf-8?B?bW4wUGhnWU56U0cxWVJPVStWc21lQUFwVGJ5Sm5EMzNIeXFNaXFEU3F1eU55?=
 =?utf-8?B?WlM2bXVKVUJudEVNNVBVK091THFaMEMvb3dnUlFxVnJua0NOUEFDZkVjZjBP?=
 =?utf-8?B?WEdjcER2aXFwNExSVENKYU1mQ05XNnp1K0ZaRWFpTVE1bkp4QWQ0d0QvWlJQ?=
 =?utf-8?B?d3BPbFl4MEFlbXc5RFFvYzRLd1FpN1pBSE1ydHliVlVRWmVUdFQwVDRCSUht?=
 =?utf-8?B?NTRtOVRFamRXZVZFSkxhamdCTUpzSHR0aXhpa2RpeXk2aUpWWnBzRkNUdGZy?=
 =?utf-8?B?WGw2KzRRMUhDODJld3hGNlY1UkRmS21taE1PQklDTk5UL2R1Mm9xd0xlVWpz?=
 =?utf-8?B?RXZ5TXovcjBteWRSZkxsMWJTVDlkZ1NoQjhZQS94ZE45OHBJcVdFOE1uUDZi?=
 =?utf-8?B?MzJ0RFJsSXF5TTVsNUR2a25vMHJPODBSOGlLdGU0bXdrTTRkU1N3S1VKYUdE?=
 =?utf-8?B?SG1ReEVXd3RBN3k4RkJlcjM2dGEzaEhBNHYxOUN6bDY5VTVlY0JyWWtxT04r?=
 =?utf-8?B?VVNUVEIrUVBYci9VTFI1em51TGE4cm5HUjRaUGl2OWFNbWh0NVJsVjVTVjRj?=
 =?utf-8?B?UnRYVTMxN2g0dkZEQVlFeXhZZnFLb3BvTHY5NFNWaDlDNXl3RXA4ZFBJMzJY?=
 =?utf-8?B?ZTNzV2NBaGQ4VEdZQ2RRVjhDMFlWbHJrdXlYK1IrSzRsS081ZmFlQ2hoRVFx?=
 =?utf-8?B?SFZCZ2sxZVl2OUZkZXlrNDhrZWgyMWFsZjVOaEI0RnI1ZDIxdkhlNlk3WkE3?=
 =?utf-8?B?bkFVcHE3K2hYdHFjWWNsL0FvUElMaGRTYVRuUXZwbnhPMmw1VGJ1cW9pMTdz?=
 =?utf-8?B?cW42a1VZb01NWUR0cVQ2UDZZNFRiMTNmT29hMWVDZ1krMTZGbHZ3SkJFaTBi?=
 =?utf-8?B?QlRkRExRamlsVGFIanNFd3EycjQyNGhRQmZIYUpxRVJ3RDUzUlFvQWtYZGFC?=
 =?utf-8?B?U2NneFZWSTJqOUxUZWZHODV3WXJTNWRMdW1GREhtaklQZWxJVlVDWUxyTjJw?=
 =?utf-8?B?SGk5TzdDdXRidXhCSDMvQ1lOSGtEaFBDdWxCWkhtL01tYThPKzdaZkNxNCta?=
 =?utf-8?B?VWNld2dLMkczM2FvdUFnMXJIRXpaYjJkK3NORFJSWUtLb0FGeGRDZjY3b3ZZ?=
 =?utf-8?B?L0ptTzJJWStyMWxRcmVpSWd6UXBLdWxaUUZROGJLNEtDT1FaRXpPLzlyVzZs?=
 =?utf-8?B?Zm92Y3R1V1NEVGUwMXdlVjRoL2N0K2U1RmM3VWdqbEpVUlkveURuamZYSGNn?=
 =?utf-8?B?ZUZ4Ky82WTlyWVpFMUNuWG5QUzVJQTYxUko5eDh1dVBIMVVRSSt5aG5YTEd6?=
 =?utf-8?B?WVFUYmRBOW1xLytoTlh6WnhoZUJ2R3QxcHNHS0dNSDU4RlRQNHpXZ1ZSb2N4?=
 =?utf-8?B?ZTZ1Skg4Ung5TXlZbEZ2K1FQa3NSNlU0ZUFuM0MvQWFwa2hvbzhBaEtnYjRw?=
 =?utf-8?B?blloVUdNelNKV0tEVnhabjdYVFRvL0E5Y29TUGxtWkcrZW1mVUV4VDNKODNt?=
 =?utf-8?B?VEFHSWs3eUo4MzJTb2hqMVhVTVhielhyK1VIOFJMellRNVJEVFB2NnpwZnN5?=
 =?utf-8?B?RWhMcnpaWWFsK3RiNFJPeVIzb1N2MjVta1RFZFdqa0FOQ3lMRG1oRnNGeUtS?=
 =?utf-8?B?cXNyVGIrSGYxZ1dwU0s3eGhIVjMySW85QWc0Z0JaZjhqK3BCOGhtYlVzQ0ZD?=
 =?utf-8?B?Z2o2b2JFOTlscW1DVW91ZEJTVzZXdUpmblBoTC9GVWFrV0szYklxR3lMbEFl?=
 =?utf-8?Q?PdTHf4h/+XOQn5FTKqDG1ZVJo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d8e456-cf37-47f6-2ba6-08de3d156060
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:38:35.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nerSsSIHLPOJ5JgSjI1dqCzXmAXePa79aYliUT01CJVFr490ps7mC6eLoixSC0PLvSVEJwoWDPS3wwb8gG6ilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_183847_663678_B2B93C8A 
X-CRM114-Status: GOOD (  29.82  )
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

Hi Martain,

在 2025/12/17 7:43, Martin Blumenstingl 写道:
> [ EXTERNAL EMAIL ]
>
> Hi,
>
> On Mon, Nov 24, 2025 at 4:32 AM Zhentao Guo via B4 Relay
> <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> new file mode 100644
>> index 000000000000..401a5a32902e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description:
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vcodec-dec
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dos
>> +      - const: dmc
> Neil has commented on the driver patch (in v1) to use the existing
> canvas driver.
> The same applies to the binding: you can replace the whole "dmc"
> registers with an "amlogic,canvas" property (see
> Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml for
> an example).

Indeed, only a section of the dmc registers is for canvas. For the reset 
part of the registers, canvas driver should not access them directely.

For example, on S805X2 platform, the DMC registers range from 0xfe036000 
to 0xfe038000. The canvas registers only range from 0xfe036048 
to 0xfe03605c.

The decoder driver also need to access the register 0xfe036000, which is 
not contained in the range of canvas registers, so we still need to 
remap this register in the decoder driver. Therefore, the property 'dmc' 
is still needed.

>
> [...]
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
> I did a quick:
> $ git grep RESET_DOS
> {include/dt-bindings/reset/amlogic,arch/arm64/boot/dts/amlogic/}*.h
> -> that lists DOS reset lines for most (all?) SoCs that were supported
> by the old vdec driver as well as DOS reset lines for the S4 SoC (for
> which you're adding support here).
> If some of those reset lines are wired in hardware to the DOS region
> then you should include them in the binding.
> For reference in case you are not already familiar with it: [0] "[...]
> make bindings complete even if a driver doesn’t support some features.
> For example, if a device has an interrupt, then include the
> ‘interrupts’ property even if the driver is only polled mode".
> (the same also applies to any additional clocks or power-domains that
> are wired as inputs into the hardware which you have not listed yet as
> they are not needed for the initially supported codecs)
Yes, I also noticed this issue. The DOS reset line should be added. We 
will fix this in the next patch version. Thanks for your suggestions!
> Best regards,
> Martin
>
BRs

Zhentao

> [0] https://docs.kernel.org/devicetree/bindings/writing-bindings.html

