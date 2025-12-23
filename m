Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93568E6B277
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf08wUWknmQf7JDXFldK0RlNmifO7gRmGgyyLXr/oOg=; b=BFWbj5cbNVkSu2Br2dq/bwLUi6
	YlO0gjA2/gCDhAcTLQqsS8ikJgMH4pyW58uYS9qGIqG3RovhlYCF1mpnM8Z7meHlIgRcA4wyRZfpz
	zKxxe2sQ4TtYbR2XvIy/ovUxzBGHzUH496yL0+VS4Su/mt10C0UdkEHWylsbIL2Ex4V4ERtwQoHfT
	yZkB9p6KTEslO2TKLog/CTt+BI2h1GE+s4766iKB1YZehZq1GpG2aQ53VCpzNuNijLd75cVlE6y9l
	iRXwco+Jx7mxKRHAmYdSh+rPFHBWMlncWu8KkIQRSYn60aLPS9kgwVcHAb9swd3SxFbbomhz/Ro/G
	6qHlSenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvyq-0000000EbCG-0xQA;
	Tue, 23 Dec 2025 06:34:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvyn-0000000EbBH-16KJ;
	Tue, 23 Dec 2025 06:34:46 +0000
X-UUID: 757a4f7adfc911f09f706fa2197c6ceb-20251222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vf08wUWknmQf7JDXFldK0RlNmifO7gRmGgyyLXr/oOg=;
	b=Grq12i9hlYWBNAR7q5gEMZLj3XfJRTW+1vLzAKNY5JtUJiE6edtkSeY7NHcJTCtgIVwaZVzNP2VbnzCa6qvwN1AwlTfT7Zm22DXxo4gNCFXk0PrjSfSLZqKTm6SRfAaZxjzYEGnfZUFgdFaQ0i/QUTcoJR+2zgQJdPYqS+qVBmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:3bbdb9c2-bb02-4779-b0e6-cb497022d8dc,IP:0,UR
	L:0,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:10
X-CID-META: VersionHash:5047765,CLOUDID:e1127faa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:4|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 757a4f7adfc911f09f706fa2197c6ceb-20251222
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1118255407; Mon, 22 Dec 2025 23:34:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 14:34:36 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 14:34:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8ecokvSkD2pP5iJK4fRAvOSWPk0onas+3fOOdt//9fuFuC6NcsIinl4osyZZKyUFMALrMJYJp6qNZD4fUbmvFrpgma3HfQOGeimJ8dt7KFm7qdNKZo8VmTLAZRcoyMW92OgGz66LvjbbV2XWhkznCdn5fb88RH4uiDKB8LA3n9H1QgKejgjO0fwCIqAJUWJ+/Fm6YXZMMeAhFWPa6N73oIeY1ohxx2k4s1MQlFI2GWMfbLZdjFs22/XcDmQXR6jyU+9vZi+4/HFN+5zvtfyRPpaJCtnqVETC7JRrH3OaUQM7dGjTsnrvnrBIpChzfBxsgtSczmXxJaUz2PKLcCWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf08wUWknmQf7JDXFldK0RlNmifO7gRmGgyyLXr/oOg=;
 b=wOnXxS/bzJEnM5cmdrHw5HXj6a263iKg9fdNuY+Z/agAZonO+UtB4RfLLkGXc/MxwNEFu5RMCs2VWtw5IwFCl58I4Ju/1Joco1FEXaCa7yIgzrp1WTLEU25sB77UR58hZzw7cIyMRiRgAnJ+/muvYFlNSwJVcm1BToMt5cHzL/gXjZdk1y7R80aozS3QEQ9lQBjoS/z3ttVWn9duvIEaB324uxmTNVqa5RC+CVhff0CjvXawkLveezTW6lY7LtfAcPa/iwuoztB+GYYA3vYEYRGfGiJfBRgCJDPhDSpUahczZNyu36LXcGLZHdXUujI0y8n/rH65FyCDEZDm5xHUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf08wUWknmQf7JDXFldK0RlNmifO7gRmGgyyLXr/oOg=;
 b=adeF+SnBCplGNmjiMsuS84rK0yKPTTqYqfHdLRkiAe5UaWYwxYQxhM4T8bVGGTwzLssymXrww4JA/8cYrNbGREz8imLKfA3CmKDywhyBQUDzPeRulw6PrPvAs03LSrzNlveRCy3BrUeTtIsDnn0p1Vansqvtia3xGJ9QxjODMZc=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by TYZPR03MB6789.apcprd03.prod.outlook.com (2603:1096:400:1f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 06:34:33 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:34:33 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] drm/mediatek: Add isolation to edp
Thread-Topic: [PATCH v7 2/2] drm/mediatek: Add isolation to edp
Thread-Index: AQHcTWmLIQuiciFtCECM8ij6auH9TrUl31SAgAkyPQA=
Date: Tue, 23 Dec 2025 06:34:33 +0000
Message-ID: <d26f894c12ae21a64dcf5926ebf0fc1cffbb39d5.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-3-liankun.yang@mediatek.com>
	 <e9f167c88c29fa30ef3a22995c2955cde478b41d.camel@mediatek.com>
In-Reply-To: <e9f167c88c29fa30ef3a22995c2955cde478b41d.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|TYZPR03MB6789:EE_
x-ms-office365-filtering-correlation-id: 451b0d78-f130-4e74-2a64-08de41ed558b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dmxNMjd3NjRhVVljSDQ1a056UHI3Q0gwTFpwSFZiSjNBUGc5RG1FbEM2NG1F?=
 =?utf-8?B?cW5HM1ROOFZNNEg2KzVJWm03dWdPbDVGK0h3NWZzb2F3R1J5OVZiTGQweFpS?=
 =?utf-8?B?OGtrYnJKb0VqK2M5NS8xYjk1YzdHb2J0QkNQN0FlNVBLU3dhWStyR2FSM1Nr?=
 =?utf-8?B?ZWN2SnFydzBMaDZ3Qk5nVWl1akd4MTZxbDRHai9Bb21DVzhoTEJSY1BraHR0?=
 =?utf-8?B?Ui9lbHFhSFVobC9MWldBSW1GVEYxVmE0dVk3OVpQN3ZMZlRpa3pnTWpoZW13?=
 =?utf-8?B?TXJUUUFweDhWU2gyRHRFT1ZTK2NLaTMxcGtkTEN5Y1NKalZheEpFSnFUUmFN?=
 =?utf-8?B?dHBZeXBxZTg0OHNwRDA2dU5jY01lanR1VUU4Z2JpcjJWSXV0TGVPSE9BOFFE?=
 =?utf-8?B?VzFaa0hFV2ZmU2NqeVk1dXRQbFJ1WVllbWdWWG44YjY1Mm11QkpEMUtEU2Vr?=
 =?utf-8?B?UWhtUFlSN3FLa3YreTlQWGpFaWVsWENmZW9mTWs1aHpXRGJsWEVwQzdWQ0lh?=
 =?utf-8?B?M3NwRkgvc29WWmRFUWg2ZWNGaUUrQzIzaE9jTlFrUWJ0d0djZkthcnVvY2JS?=
 =?utf-8?B?aDhGZHBxR3Q3WUdmVEhnWUNYN0Nyd3lKZVVMTHJRYTBYcWxiK1hIai9uYmt4?=
 =?utf-8?B?SVhKaXlsQlNtN2ZTLzNoVGRpTTd6L3A5YzJPVHBtY0JWZmwxdndVNW9uMTdM?=
 =?utf-8?B?bjl0OVkrTEdWQUZNZmxBcW1tdHVSWU5Pek5nQ3hxbXBiZVA0Y1dNVjcrSy9T?=
 =?utf-8?B?djBRTXJHYlZicFdjUXJzeHhBL3VZWnVuZEVFbko3ZzdkU25nSlBpWm9FckZE?=
 =?utf-8?B?WCs2a2pCZVpBTDZtVXJWTEVOUkh6RDduelFaYXZRUVV0QmRzVjJrUkhwWlFY?=
 =?utf-8?B?VHl1R3JPMDB2MGlINlBNUzFFTzNiRlpna1ZWWkNQSkFYWjJyT2pUQXhZZU1K?=
 =?utf-8?B?eXJ0VEZNbkx3cGdERmNnL3VZTWJ1Tnd0bU12QXVyb1dGSm5HRWFJL010VFJP?=
 =?utf-8?B?cjVNem8wWVd3VVFDU2N1S25naDd3WTRnQVRWckhyZGNoa3BrNVJvYkxiOXB4?=
 =?utf-8?B?WWlDcjRjNWZEcjZuVFljUU4xU1o0SEZTRWhFK1V2dktUSUhEb2J6TFJCcUVI?=
 =?utf-8?B?eGg0bUNwenBEa3RWVTRFejIzM1NRRXpTd3pMS0xRc3BUV0lzdVJSTzhENkla?=
 =?utf-8?B?dTQ5TndJc3VBSXFjTnh1RlNmWDZoV1dMTnhka2xGb09UYmZpYWlwbXVZNm5j?=
 =?utf-8?B?d2ZFMDE3bVhUVmUvLy83MU5QaFpMTmE4aENCNld0YlJQL1p5dm5tSElIUEs4?=
 =?utf-8?B?NE1iV2RXQmZzOUpPSmZiZDBOT3Z0RkhsdUxqc3Q1cFVSUmdDUzN5d0swaHhR?=
 =?utf-8?B?bVl1T1ZmSUExZTFhSTJMUFlPVjhhczRIZ2ZlQ21iVmU5TFVSc0o3V25jM2RJ?=
 =?utf-8?B?c1ZHelB6WjhoRlZOR2kwdW1FandSai9kcEtJOG94WkdSQ2NXK3gzazNZV21u?=
 =?utf-8?B?YXRSVCtJVUJaWTdRcjNFV1lGZzVDeFBtRXdXOHpLM1RIT2t4eXo4UEh1cmxn?=
 =?utf-8?B?SUNVaXFVbzZnZWVPSWN2VmNhWUwyOVFXVlBYbWkzM0FtbVh2SHg5V0d1YVIz?=
 =?utf-8?B?MFI4cGNYZVBMNmNLcnI3bktkdks3L2YvQXNyUTVmZzlBYXRnUlFFT2J2UC90?=
 =?utf-8?B?OU92Y01lVUVOdU42eHBLOEZGdUdFeHZwTlVlQlZJY254RXZnMFJLWUNkSGZW?=
 =?utf-8?B?NE0zYkhTeStENE5QV0NNZ0UvdHpIbFYyMFBvS2FMSXdxR0o2TWQ0K1lxdnJk?=
 =?utf-8?B?cStGSXF1ckUxY2NLNnpTRGNHSHVDZzh5c3FVeXBja2dJRTIyWERIZ3BCT3o2?=
 =?utf-8?B?d0Q4ZER6VjU5OURtS01VN2d6QVd1bWRXM245alBQQXFGczBwMWtWTjRXRFU5?=
 =?utf-8?B?a2JrZXRTMnBMS2NlVXVXMUZOUTFUUG9DZk1VdjEvcUhQeEdLcVBTWjYvTjRJ?=
 =?utf-8?B?YWRKNkJIamd4MkVGYytCSWpiTzMrc2o4MlJiWEd6c3JyQWhoMWVEY0RjbFQ0?=
 =?utf-8?B?OTNZVGxJLyt5V3VQUnpKTWhTSFE0VXdSUzIvQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5760.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWtERnlnQkpISDlrbDdoelU1Z0VLSFRlMFY2QUsxN0pRWUlOYTZUZHdKb1ZE?=
 =?utf-8?B?T01mV3l0YWhzRzhLY2VvSVJxaFRWV29hUmo2ZEIySys5NHUzcHBuTzIvRlVh?=
 =?utf-8?B?Z2QzYWdHVkRxTlk4NFZkWVdLZmlMald5d0ZMTmlHM3ZJeldiVEVJTlY1M2FS?=
 =?utf-8?B?MjhIUW5pZjVFWUw4OWppMWdyVkFqY1B5NjJvYlNld3hLS05LZWt5Z3ByMFg3?=
 =?utf-8?B?dm1pK3NOZVpPTGo1KzVlaTRhQStXQlhKRUxWMDIxMVc2ZXJyRHpqQTcyWTRH?=
 =?utf-8?B?Q0ZVOElTbGNkWllEUmdGekduZ0lqVVpHUDZRT2lkOFdKTzRTSnFpb3N2cnFC?=
 =?utf-8?B?eUFOQnB5TjREcnluT05DbDFTcVJURFc3R2VkeklvcVlQUE8rT2gzU3J2aVN1?=
 =?utf-8?B?TzVxYjdxdlFCVDRzbnBXL1QvYWVOZ3hiTUgxejlGbGJ4aktYTHgzVkh6ZzR1?=
 =?utf-8?B?S3pXRVhRTHRSZUphWGlHMC82UCtJb2ZsdzZ5QVp6c2R1YXc5by9HTHVhaGNV?=
 =?utf-8?B?L3EyZGpVa3A3NEcraVVnWFl1UzZPanJvWU1paVg5SWhSYnJucXBrUEo0dktJ?=
 =?utf-8?B?Q3VlOFNOY1BoNHU3NmRpZVJVS0xCL3pBVXFqL2srTDIrOVExaGhVMmcwMWNn?=
 =?utf-8?B?ZzRpZnRLYWUyRkR0MWgrbmdHZ2F6eDBtZ1VDbkhVZzBXa1pjMUcyYk5yN05P?=
 =?utf-8?B?ZVRvVXJHUVVGL1hNNnhkWHZlQkZRT0ZvTFdKVnVFMk9aN0lCWkJuTGc3QjYz?=
 =?utf-8?B?UGtTMkFqQnFDMFlta0dnRU1KK29SQVhpK3lyNjhKbTdwQTNCUTVRSFNacEw0?=
 =?utf-8?B?WU5BRnFtODJQKzdYWEFIeTRPTmFHcXc2TDF4cldsU2wyUCtqTnRDSHlLUXJR?=
 =?utf-8?B?TEhvM3JRWXRnaFFucW5rMkQrUHc3YkJqZUcvU0FiS0RyOHAwMW5wOFRtNFNM?=
 =?utf-8?B?Y0xmNEJpMnhQQmVQWFg2MDF1NXZlbmdxT0ZNUTIrV1JqdzFQc0pzM2JXY2cx?=
 =?utf-8?B?QjJsMXl6MTQ5TDU3aklSVmFrYTNESlMwYW0rbExiM3ZTck94RTVsRmlkMS92?=
 =?utf-8?B?Y1UxcEoxVVQwSzF1UDFnMTVadi9yNkVGNmJMaERZMkluUmVlbzYvOHJ3dlhG?=
 =?utf-8?B?U09kc1JvUWJuOG1IN3VWY2VzMmFUT1NNczEwbmZaVGZNV3BJTWVSS2pldm9h?=
 =?utf-8?B?R1RlcDhJZE5OMGFEN2V5T05RMEtmc3hVUW9XaU5JSHNGQzZ6blNkNS9WNzd4?=
 =?utf-8?B?TmkvUkovSHlhT2JVeERHcm5nbXhiODk5SnRrY3BLelpxeXBYRndlMGxkakhs?=
 =?utf-8?B?dm53U2pWamFQWE5TVjZuOFNIUXY1NnNLdVE4OXhZVnkvVzJwcHpFZi9qNUdw?=
 =?utf-8?B?TnRjRDcyT2ZidjRzOEo1RUFzSzNmQ2NrSVhpRmJXRSt6WWNZcUxnWW02OUhP?=
 =?utf-8?B?c3BNZkwzenQySmlqQ3c5eFMwaHNGaUxkRjF2MS9QT3BLbzA4amhyNXFBNVN5?=
 =?utf-8?B?MFJ1dVdzZTBja1BnamFpZVI2ZW9Gd1hobWNqTi9KL0lVakF0ckNWZ1NhWjg5?=
 =?utf-8?B?TmVpZm5GVTBsYVlORS91eHlJa0o5ZGE3NzZXUFNhUmFlRW1vZkFEWW95YVgw?=
 =?utf-8?B?eHdJbU5kMWVKYVB3WWNqTHVlYno1MWs3VVBqVEZwTGJJekxHNmpXYVY2UzFo?=
 =?utf-8?B?UjJnVDVVQlNWNnFaTkJDQVpxTlYveGZtejBVY3BPMDFna0RPbE41T1lSNEYw?=
 =?utf-8?B?Mk84TUNrMWd5b3JqbnZROXBlVHlNbmtyd2ZzdDFWTmppNlFZMjlBYVJGK3Jw?=
 =?utf-8?B?Q05Wd0tNMlI0TnV5RGZ4N2hvZzg0ZGRkSHM2MUpob0JkWGlvYVh6WjErMVJH?=
 =?utf-8?B?ZmJoeWptdEpac1ZYRy9Wby9VME84R245Ryttd1U5NjFkbVNreGl2ZGIvR2No?=
 =?utf-8?B?YkpYZDJxMndFdG1sSWtkOFpjYnlRVUplTWl5ci9oWjdsajlQVnF5QVJvMkFD?=
 =?utf-8?B?amR2bFFKTllBek5LUGVNYnk2NEZGazI2elFXV3J2SEZFYUNJdmF2QlpVYnlw?=
 =?utf-8?B?Uy9SNVF0WHkxVXFFdjlLaXRqSktVVTN4U3NEaVl1N1pkQThMQjZFRDRjdXp6?=
 =?utf-8?B?TnVWSnJhWVB4bnJhZzdhTVNNeDFsL1JJalFNUmdqeTVmR2l3MEpjMGJseWV4?=
 =?utf-8?B?WmRUd2kybmd6VitmS0VteUt3VkFQM3BLaVZaM25jZU5IV0cvYzlVbHExSlBC?=
 =?utf-8?B?N3VSVCt5K2tBUFVXdUdkcEFOSEErOU8yQk5Nc3N0RXRkZkYwM0FTN3dYeGNE?=
 =?utf-8?B?Mkt4QmlHenBkMEp0OFdDMUxjL2o5MU5pby81Si9WbEJQNVhFS1RhcStmQVBS?=
 =?utf-8?Q?IogAqLnY8KNFeMFg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <829AEEF5848B6649A9D1C6B7447329BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b0d78-f130-4e74-2a64-08de41ed558b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 06:34:33.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Am7zua6TCKyeUrCU3fhaY0By9WwdO+3mA/fJE/DUwtuQqB0Piwybc4ut4LlwwN3cAybaKEXdEa3lzI1G88amRTuqI5DYiHMXypf1rzxhKR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_223445_338403_6A58BAEB 
X-CRM114-Status: GOOD (  21.50  )
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

T24gV2VkLCAyMDI1LTEyLTE3IGF0IDEwOjA4ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVHVlLCAyMDI1LTExLTA0IGF0IDE2OjU1ICswODAwLCBMaWFua3VuIFlhbmcgd3Jv
dGU6DQo+ID4gQmVjYXVzZSBlZHAgZG9lc24ndCBleHBlY3QgYW55ICh1bilwbHVnIGV2ZW50cyBk
dXJpbmcgcnVudGltZSBhbmQNCj4gPiBpdHMgcHJvY2VzcyBkaWZmZXJzIGZyb20gRFAuIFRoZXJl
Zm9yZSwgaXQgaXMgbmVjZXNzYXJ5IHRvIGlzb2xhdGUNCj4gPiB0aGUgcGFyc2luZyBjYXBhYmls
aXR5LCBwYW5lbCBwb3dlciwgdHJhaW5pbmcgc3RhdGUgYW5kIGVuYWJsZQ0KPiA+IHN0YXRlLg0K
PiA+IA0KPiA+IEFuZCBEUCByZWxhdGVkIGJlaGF2aW9ycyBhcmUgYWRqdXN0ZWQgdG8gZXhlY3V0
ZSBpbiB0aGUgc2Vjb25kIGhhbGYNCj4gPiBvZiB0aGUgaW50ZXJydXB0Lg0KPiA+IEZvciBEUCBk
ZXRhaWxzLCBzZWUgZHJtL21lZGlhdGVrOiBBZGp1c3QgYmFuZHdpZHRoIGxpbWl0IGZvciBEUA0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5rdW4gWWFuZyA8bGlhbmt1bi55YW5nQG1lZGlh
dGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5j
IHwgMzcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+IC0tLS0tLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gaW5kZXggMGJhMmMyMDg4MTFjLi5lZmQ0
YzQ1OTg1Y2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gQEAg
LTIxODcsNyArMjE4Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VkaWQNCj4gPiAqbXRr
X2RwX2VkaWRfcmVhZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+ICAJICogUGFyc2Ug
Y2FwYWJpbGl0eSBoZXJlIHRvIGxldCBhdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzIGFuZA0KPiA+
ICAJICogbW9kZV92YWxpZCB1c2UgdGhlIGNhcGFiaWxpdHkgdG8gY2FsY3VsYXRlIHNpbmsgYml0
cmF0ZXMuDQo+ID4gIAkgKi8NCj4gPiAtCWlmIChtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10
a19kcCkpIHsNCj4gPiArCWlmIChtdGtfZHAtPmJyaWRnZS50eXBlID09IERSTV9NT0RFX0NPTk5F
Q1RPUl9lRFAgJiYNCj4gPiArCSAgICBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCkp
IHsNCj4gDQo+IFRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gZHAgdHJhaW5pbmcuDQo+IElmIGRwIGRv
ZXMgbm90IG5lZWQgdG8gcGFyc2UgZWRpZCwgZGVzY3JpYmUgV0hZIGFuZCBkbyBub3QgbWl4IGVk
aWQNCj4gbW9kaWZpY2F0aW9uIHdpdGggZHAgdHJhaW5pbmcgbW9kaWZpY2F0aW9uLg0KPiANCg0K
YG10a19kcF9wYXJzZV9jYXBhYmlsaXRpZXNgIGlzIHJlbGF0ZWQgdG8gRFAgdHJhaW5pbmcsIGl0
IGlzDQp1c2VkIGluIGBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZGAgYmVmb3JlIERQIHRyYWluaW5n
LCBhbmQgdGhlbiBvbmx5DQp1c2VkIGJ5IGVEUCB3aGVuIHJlYWQgZWRpZC4NCg0KUmVhZCBlZGlk
IGNvbnRpbnVlZCBhY2NvcmRpbmcgdG8gaXRzIG9yaWdpbmFsIGxvZ2ljIGFuZCB3YXMgdW5hZmZl
Y3RlZC4NCgkuLi4NCglkcm1fZWRpZCA9IGRybV9lZGlkX3JlYWRfZGRjKGNvbm5lY3RvciwgJm10
a19kcC0+YXV4LmRkYyk7DQoNCgkvKg0KCSAqIFBhcnNlIGNhcGFiaWxpdHkgaGVyZSB0byBsZXQg
YXRvbWljX2dldF9pbnB1dF9idXNfZm10cyBhbmQNCgkgKiBtb2RlX3ZhbGlkIHVzZSB0aGUgY2Fw
YWJpbGl0eSB0byBjYWxjdWxhdGUgc2luayBiaXRyYXRlcy4NCgkgKi8NCglpZiAobXRrX2RwX3Bh
cnNlX2NhcGFiaWxpdGllcyhtdGtfZHApKSB7DQoJCWRybV9lcnIobXRrX2RwLT5kcm1fZGV2LCAi
Q2FuJ3QgcGFyc2UgY2FwYWJpbGl0aWVzXG4iKTsNCgkJZHJtX2VkaWRfZnJlZShkcm1fZWRpZCk7
DQoJCWRybV9lZGlkID0gTlVMTDsNCgl9DQoNCglpZiAoZHJtX2VkaWQpIHsNCgkuLi4NCg0KPiA+
ICAJCWRybV9lcnIobXRrX2RwLT5kcm1fZGV2LCAiQ2FuJ3QgcGFyc2UgY2FwYWJpbGl0aWVzXG4i
KTsNCj4gPiAgCQlkcm1fZWRpZF9mcmVlKGRybV9lZGlkKTsNCj4gPiAgCQlkcm1fZWRpZCA9IE5V
TEw7DQo+ID4gQEAgLTIzODUsMTMgKzIzODYsMTUgQEAgc3RhdGljIHZvaWQNCj4gPiBtdGtfZHBf
YnJpZGdlX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgCQly
ZXR1cm47DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0JbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uKG10
a19kcCwgdHJ1ZSk7DQo+ID4gKwlpZiAobXRrX2RwLT5kYXRhLT5icmlkZ2VfdHlwZSA9PSBEUk1f
TU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ID4gKwkJbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uKG10
a19kcCwgdHJ1ZSk7DQo+ID4gIA0KPiA+IC0JLyogVHJhaW5pbmcgKi8NCj4gPiAtCXJldCA9IG10
a19kcF90cmFpbmluZyhtdGtfZHApOw0KPiA+IC0JaWYgKHJldCkgew0KPiA+IC0JCWRybV9lcnIo
bXRrX2RwLT5kcm1fZGV2LCAiVHJhaW5pbmcgZmFpbGVkLCAlZFxuIiwgcmV0KTsNCj4gPiAtCQln
b3RvIHBvd2VyX29mZl9hdXg7DQo+ID4gKwkJLyogVHJhaW5pbmcgKi8NCj4gPiArCQlyZXQgPSBt
dGtfZHBfdHJhaW5pbmcobXRrX2RwKTsNCj4gPiArCQlpZiAocmV0KSB7DQo+ID4gKwkJCWRybV9l
cnIobXRrX2RwLT5kcm1fZGV2LCAiVHJhaW5pbmcgZmFpbGVkLA0KPiA+ICVkXG4iLCByZXQpOw0K
PiA+ICsJCQlnb3RvIHBvd2VyX29mZl9hdXg7DQo+ID4gKwkJfQ0KPiANCj4gTWVyZ2UgdGhpcyB0
byBwcmV2aW91cyBwYXRjaC4NCj4gDQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJcmV0ID0gbXRrX2Rw
X3ZpZGVvX2NvbmZpZyhtdGtfZHApOw0KPiA+IEBAIC0yNDExLDcgKzI0MTQsOSBAQCBzdGF0aWMg
dm9pZA0KPiA+IG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlLA0KPiA+ICAJCSAgICAgICBzaXplb2YobXRrX2RwLT5pbmZvLmF1ZGlvX2N1cl9jZmcp
KTsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQltdGtfZHAtPmVuYWJsZWQgPSB0cnVlOw0KPiA+ICsJ
aWYgKG10a19kcC0+ZGF0YS0+YnJpZGdlX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkN
Cj4gPiArCQltdGtfZHAtPmVuYWJsZWQgPSB0cnVlOw0KPiANCj4gTWVyZ2UgdGhpcyB0byBwcmV2
aW91cyBwYXRjaC4NCj4gDQo+ID4gKw0KPiA+ICAJbXRrX2RwX3VwZGF0ZV9wbHVnZ2VkX3N0YXR1
cyhtdGtfZHApOw0KPiA+ICANCj4gPiAgCXJldHVybjsNCj4gPiBAQCAtMjQyNiwyMSArMjQzMSwx
NSBAQCBzdGF0aWMgdm9pZA0KPiA+IG10a19kcF9icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgew0KPiA+ICAJc3RydWN0IG10a19kcCAqbXRrX2Rw
ID0gbXRrX2RwX2Zyb21fYnJpZGdlKGJyaWRnZSk7DQo+ID4gIA0KPiA+IC0JbXRrX2RwLT5lbmFi
bGVkID0gZmFsc2U7DQo+ID4gKwlpZiAobXRrX2RwLT5kYXRhLT5icmlkZ2VfdHlwZSA9PSBEUk1f
TU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ID4gKwkJbXRrX2RwLT5lbmFibGVkID0gZmFsc2U7DQo+
IA0KPiBNZXJnZSB0aGlzIHRvIHByZXZpb3VzIHBhdGNoLg0KPiANCj4gPiArCQltdGtfZHBfYXV4
X3BhbmVsX3Bvd2Vyb24obXRrX2RwLCBmYWxzZSk7DQo+IA0KPiBZb3UgY2hhbmdlIHRoZSBjb2Rl
IGZsb3cgb2YgRFJNX01PREVfQ09OTkVDVE9SX2VEUC4NCj4gSSB0aGluayB5b3Ugc2hvdWxkIG5v
dCBjaGFuZ2UgdGhpcy4NCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJbXRrX2RwX3VwZGF0ZV9w
bHVnZ2VkX3N0YXR1cyhtdGtfZHApOw0KPiA+ICAJbXRrX2RwX3ZpZGVvX2VuYWJsZShtdGtfZHAs
IGZhbHNlKTsNCj4gPiAgCW10a19kcF9hdWRpb19tdXRlKG10a19kcCwgdHJ1ZSk7DQo+ID4gIA0K
PiA+IC0JaWYgKG10a19kcC0+dHJhaW5faW5mby5jYWJsZV9wbHVnZ2VkX2luKSB7DQo+ID4gLQkJ
ZHJtX2RwX2RwY2Rfd3JpdGViKCZtdGtfZHAtPmF1eCwgRFBfU0VUX1BPV0VSLA0KPiA+IERQX1NF
VF9QT1dFUl9EMyk7DQo+ID4gLQkJdXNsZWVwX3JhbmdlKDIwMDAsIDMwMDApOw0KPiANCj4gRm9y
IERSTV9NT0RFX0NPTk5FQ1RPUl9EUCwgeW91IHJlbW92ZSB0aGlzIHVzbGVlcC4gVGhpcyBtYXkg
Y2F1c2UNCj4gc2lkZSBlZmZlY3QuDQo+IERvZXNuJ3QgaXQ/DQo+IA0KDQpUaGUgbW9kaWZpY2F0
aW9uIHRvIGBtdGtfZHBfYnJpZGdlX2F0b21pY19kaXNhYmxlYCBoZXJlIGlzIGJhc2Ugb24NCnRo
ZSBzYW1lIGxvZ2ljIGFzIGBtdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb24obXRrX2RwLCBmYWxzZSk7
YC4NCg0KTW9kaWZ5IHBhcnQgb2YgaW4gYG10a19kcF9icmlkZ2VfYXRvbWljX2Rpc2FibGVgDQog
IGlmIChtdGtfZHAtPnRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikgew0KICAgIGRybV9kcF9k
cGNkX3dyaXRlYigmbXRrX2RwLT5hdXgsIERQX1NFVF9QT1dFUiwgRFBfU0VUX1BPV0VSX0QzKTsN
CiAgICB1c2xlZXBfcmFuZ2UoMjAwMCwgMzAwMCk7DQogIH0NCg0KICAvKiBwb3dlciBvZmYgYXV4
ICovDQogIG10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsIE1US19EUF9UT1BfUFdSX1NUQVRFLA0K
CQlEUF9QV1JfU1RBVEVfQkFOREdBUF9UUExMLA0KCQlEUF9QV1JfU1RBVEVfTUFTSyk7DQoNCk1v
ZGlmeSBwYXJ0IG9mIGluIGBtdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb24obXRrX2RwLCBmYWxzZSk7
YA0KICBpZiAocHdyb24pIHsNCiAgICAuLi4uDQogIH0gZWxzZSB7DQogICAgLyogcG93ZXIgb2Zm
IHBhbmVsICovDQogICAgZHJtX2RwX2RwY2Rfd3JpdGViKCZtdGtfZHAtPmF1eCwgRFBfU0VUX1BP
V0VSLCBEUF9TRVRfUE9XRVJfRDMpOw0KICAgIHVzbGVlcF9yYW5nZSgyMDAwLCAzMDAwKTsNCg0K
ICAgIC8qIHBvd2VyIG9mZiBhdXggKi8NCiAgICBtdGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCBN
VEtfRFBfVE9QX1BXUl9TVEFURSwNCgkJCURQX1BXUl9TVEFURV9CQU5ER0FQX1RQTEwsDQoJCQlE
UF9QV1JfU1RBVEVfTUFTSyk7DQogIH0NCg0KVGhlIGBtdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb25g
IGZ1bmN0aW9uIGZhaWxzIHRvIGFsaWduLg0KV2l0aGluIHRoZSBgbXRrX2RwX2hwZF9ldmVudF90
aHJlYWRgLCBpZiBEUCBpcyBkaXNjb25uZWN0ZWQsDQp0aGUgYG10a19kcF9hdXhfcGFuZWxfcG93
ZXJvbmAgZnVuY3Rpb24gd2lsbCB3cml0ZSBmcm9tIGBhdXhgDQp0byBgRFBSWGAsIGNhdXNpbmcg
YSBmYWlsdXJlIGFuZCB0aHVzIHByZXZlbnRpbmcgc3ltbWV0cnkuDQoNCj4gPiAtCX0NCj4gPiAt
DQo+ID4gLQkvKiBwb3dlciBvZmYgYXV4ICovDQo+ID4gLQltdGtfZHBfdXBkYXRlX2JpdHMobXRr
X2RwLCBNVEtfRFBfVE9QX1BXUl9TVEFURSwNCj4gPiAtCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRH
QVBfVFBMTCwNCj4gPiAtCQkJICAgRFBfUFdSX1NUQVRFX01BU0spOw0KPiANCj4gaWYgKG10a19k
cC0+ZGF0YS0+YnJpZGdlX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgew0KPiAJLyog
cG93ZXIgb2ZmIGF1eCAqLw0KPiAJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwgTVRLX0RQX1RP
UF9QV1JfU1RBVEUsDQo+IAkJCSAgIERQX1BXUl9TVEFURV9CQU5ER0FQX1RQTEwsDQo+IAkJCSAg
IERQX1BXUl9TVEFURV9NQVNLKTsNCj4gfQ0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+ID4g
LQ0KPiA+ICAJLyogU0RQIHBhdGggcmVzZXQgc3cqLw0KPiA+ICAJbXRrX2RwX3NkcF9wYXRoX3Jl
c2V0KG10a19kcCk7DQo+ID4gIA0KPiANCj4gDQo=

