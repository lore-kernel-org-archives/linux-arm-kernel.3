Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9258CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Lr3knktHg7oJVwT55J6/d7gO/AXDJJslZxMdOVP6uY=; b=GcF2cSIhw9GVaJeCXXa/fcNUqM
	YEJmnllBGi96kBzFrW6hlyDLR2BGd5CLNJ9NDks6NuEC61SRClkG0+liXlrXy9fLh5wXNVBYMs4na
	QBvMSCOdkt3rD4Z+vxI54ZWM4amj6S/D11kr2kcdqc/6Q31Z1pY/ufV9ChCjswC8aUdZitrLL/jfo
	v14Vp0FqJRmYmKyRi2L2rWBBMsgCM5FvFZcM0Tk2l+1xCkPY0d3zqptnD+kFQVBOe7UMav0W85LwW
	PWBWuukt2RbgPB5xT1//Ggv09fSpTViYoBHC6APhrjNYFarMvErRx5or3UE6Y4aWnRSkDOqKDe5xw
	JeHNCbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtmf-0000000Fclx-3ROz;
	Mon, 17 Nov 2025 07:36:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtmZ-0000000Fcha-2Abx;
	Mon, 17 Nov 2025 07:36:17 +0000
X-UUID: 1711a648c38811f09f706fa2197c6ceb-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6Lr3knktHg7oJVwT55J6/d7gO/AXDJJslZxMdOVP6uY=;
	b=grAbL7H61ZP/nt+Jyl8x5xxVZUBLS16dTLES09bnVp2w5/nCB5fainNSds6T2kGzgDslqSAWt3yvWUl1iv7oBTn6HoPAj2WBw8BeCNenTh0Ox4PSuOJMDiJHbzmHr+eYc7uvGKcS98a2u4sQtHmo3B/7Yohj3F6zsfwBEwZgkBQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:722f572e-fb28-42e8-87d9-964ecdb1f7f9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f3d5f957-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1711a648c38811f09f706fa2197c6ceb-20251117
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019610011; Mon, 17 Nov 2025 00:36:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 15:36:08 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 15:36:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvHt1tBP9gQR5TF6gRSMQaBMW5ELwBuTRCz6IqfBhjgit/CokzxkYK/zAWPWqnZJ0Zojgr2tdJc2EbZp+8CzivGAVYzrfZjoYRsJ4TMUiXzaIY6d1C7TRF+/aC7zH2hWLG4bREpeAeTK9/ZHqGDrGJK86PGucVH9OUTfwD9Y9fqzrtFgqzEEt8UkN9gwzMQCaGZFsubNefYTxIv6L5FIqQH36IYMl+R99z77iFcomYqUMegtx1N+cqDUoBKVTD+63/41jec3njas9xL6GTF27Eotm71sB5suU38Ia7K21gj2NCBi5Z508YGXjuW3ZM3nxOASi98CPJtUC7lMFX6wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Lr3knktHg7oJVwT55J6/d7gO/AXDJJslZxMdOVP6uY=;
 b=haIU4g13ai9QVHVufVjSTMe/utcQQr0ad9rSlDfrOzhWPBrFzfW+4TPH4JlUHo58iTHQpA9wg96oQ3+qpdu7SJVDa+zqVIU0YCvFaCtV8m1o6oIXPozyo9cndJtS6EjAT36fyPQcYPAPCsmdmMYmYKEKUxAHItXUk/tqtXq4SbV6ala7HuFlMKw0BKAeIngw9NghWbNT1rjFqlfFyGS8cNLKEomdE518tb6IBEzOsigFBfYS+ibep6jCsp4gvcYtwFyBLueiYZ103kw1UBDYDfuRc4AaFGiErYc3Jcsi+IH8xhLWSjrX+EK+BzQ28oc28rlUl5XeiU8DZS6pXbIwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Lr3knktHg7oJVwT55J6/d7gO/AXDJJslZxMdOVP6uY=;
 b=sbIBn1RTj4WN95iXrUh81KCSPs4aXiSLlXqVJ3hR3og6S3t1reB9XHmz054wfn26XfgDjwDqQtA6eHELxsTPKZyTsXnP753q+VIhRB8+4v7y362ar2JHUAFl2LiMucTDvBpVrWU1ZFflx/IPK123nFoxtjfHmp2dCpHlMngiW90=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SE1PPF080775CC1.apcprd03.prod.outlook.com (2603:1096:108:1::844) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 07:36:02 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 07:36:02 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
Thread-Topic: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
Thread-Index: AQHcTuSm9J6VepoZjEGhhb0MM0oiWbTlwzQAgBDIpgA=
Date: Mon, 17 Nov 2025 07:36:01 +0000
Message-ID: <dea9519e6b72c12ea15760fc3bd7c7746dbfd5de.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-6-kyrie.wu@mediatek.com>
	 <bd2f63265df829ec9bb3498c83126827415c2ebf.camel@collabora.com>
In-Reply-To: <bd2f63265df829ec9bb3498c83126827415c2ebf.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SE1PPF080775CC1:EE_
x-ms-office365-filtering-correlation-id: 514eb33b-7ae5-445c-aaf0-08de25abf578
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Szh3L2psNjdKeUNRMDBQOEZNdkcwam1MK2RQNjZ1KzdDcHdoVThYL2tWUjU5?=
 =?utf-8?B?VTJDUk1BVDk0bUk3djY5dHZmQzFVTnp3d055bWF5elhCR3dVNkplRFdFa0Ra?=
 =?utf-8?B?MnJyRlhHM0dKdlMxRndsdzBOVEh1eGJka3dFd0FUNmwvMVFqNVdBMTNkQm0v?=
 =?utf-8?B?elp6L3NOWjluYU1ET1BOWmtId2NlYnVCZDVwVEhiV0xrdStTNXAreTFKVGNw?=
 =?utf-8?B?WVR2QVB6bng5RDZ6ZER1OHkza2U1ZjhnVnBKRnE1OThISm5EdUdoVkl4Wkl6?=
 =?utf-8?B?ODVBSDBnMWRGRWNnOWdMaUdXcWpTQTk2VG43NHB6QWh1UjltdlhiSmNONFNk?=
 =?utf-8?B?a0V2UzRpUWNLQVp0TlppVTcvdEZ1clExaXJKQWptM3RzV2FkMjBHdW1LQTEx?=
 =?utf-8?B?NkU1ZlZhL1dqOXh0endUK0tGRUppVm9aUFdQTkdHUXhFZ3BNWjVIY2lxT0NW?=
 =?utf-8?B?eFdYV2FSRFdkaEpmRE1RL25pUlhweGh1S1RaNXhNa3hWTFVlVGQ2aTUrM1J3?=
 =?utf-8?B?MTV1RE1UYmxBdFJubHQrNVNIZ2JwbjBwbnhMSkczQktGZ0Y4WEdtNll2ODlV?=
 =?utf-8?B?QVFjM1N1TlZObUJuVjFDaWlIMzIvcGhiWEZteU1yN3MzTjQ0ZGNYay9nTHE3?=
 =?utf-8?B?R3Z6dTliajNsT1JpWXJRWWNNTkNjOWcxQktLSy8wYVVVWnk1UHNtV0VDVnNo?=
 =?utf-8?B?NEFyN2J5cXRGbWczSzhYeEUyZ0NsNWVIaTlmNUVUaFBadEZlVWRTOVZQNjJU?=
 =?utf-8?B?NWRDejRQT2pOb0JZTWxLMXZQcTNudEU1QTR4U3RXb0NxL2hhbEVEYzlVejVl?=
 =?utf-8?B?ckdxVk53SUt6RmJ4dHh3Sk1xaVIxUkNPdEFlcjlPbENnRC8rVGJlMVh4MnJF?=
 =?utf-8?B?T2JpZUpPa2Q2U1ZOTE5XRW1ZSm5uaEZ4d0ZKS2daWlVzNStjMHRoZUYzZzFR?=
 =?utf-8?B?NHoxSkM2NGpMS0wzWVRiMVJlYzRqd1F2VFdMU3dWUVZNM3hvaThsQ1VHaVl1?=
 =?utf-8?B?d0xBbE8rcFN3NSs2M2gwNEU4dXh6RHZNYkVsemg3VzJzaEFoQnhKV1AycmJv?=
 =?utf-8?B?bEJXN2UwT3VvZEpQbTQ2bTdldmZka2RrUkZiRGwyazZ4VEc1RU1tYS9ZWHNh?=
 =?utf-8?B?VGtKMlhBRGxXSTlRQmN0QzVtUy9pTk4zVG9hSE51ZERJb2drWmRpcDBsTzcz?=
 =?utf-8?B?azkybWpJbTd3QTN6U3NCYkRoRERNd1RLQ0VyV1kyQVRSYjVUTmtxVHVybWx3?=
 =?utf-8?B?M0w4M2JDMlFnU0Vycm5YVGFaa3N2VGd6Q3p4L0pCS3N5WWU0TFl1bWVUaGFr?=
 =?utf-8?B?Yi9XQ2NxQUoxb0JWdUg1WTdJVGJQR1BTY01WUVdPLzZ5WDVTcElTV0FIcWhG?=
 =?utf-8?B?UnFmbHNCRDd0dzNpcDhKTi9DRTRGaEV1c2JDMHM2bG9nVVYvV2VRVTV1OWxL?=
 =?utf-8?B?SGxVU2NJSndjK1VmK1AwQmJmTTIyK2duTG05YWlBRnZVRSs3d01SWmxscHJR?=
 =?utf-8?B?aWRzY0x5M2hlMXU4RXpNeEs5bFhUUkhWVVNmYldkbFprOUNsYWpKNFFnVGZu?=
 =?utf-8?B?dlBpZloxamhVZ0RIUVpmOHpUKzRVQXhxeW1uOHN5ekc0WFBpd2RhNFVoY0Zv?=
 =?utf-8?B?Y1hRSGpVQUVlTE5uT2QveXNtekpPWkZ1c2dvNWxuN1ZKUVlLNFB4NjNmRk5h?=
 =?utf-8?B?QmpCUkR4c1M1YndaeVN0TW9icU9GWWNmK1dENUN3cGhMYk01QXN5dWNTK0lE?=
 =?utf-8?B?eUhpbE95akhXWXIyejRoZmtreTZyam9Da3Foa1o2VnNnVnJyaEd0ZnJ1OHN4?=
 =?utf-8?B?dE00WjBjV05sMkpJdFowZTBGblNjTVJLVnUrZk5LWjJKeGxpZ09DTSs0MjVn?=
 =?utf-8?B?K2NKTmJLWUtpWWJHVnpvZFdQdERVMklWODFHRCtVMXBEVzNXN3lxaGlaa1dG?=
 =?utf-8?B?NStOSGlBNk45ZERRSkdIenArRXZtSHh6YnFWZlNaTHhpYjVUUUZEZ2s2UjFC?=
 =?utf-8?B?SXVxaTAyYWJmREdCTVU0eW5WQVBnVWFpbUdHN2JGMVNyeXBRY0l0cUZTY2Np?=
 =?utf-8?B?YW4wWDJvdzlwUktPWWppZWE3SENlSzJ4NWsxQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1hkdUhSa3ZyRFNUUVZNaStvYmpJWnlRbEpBWFZhY0lhbS9DcjZHWVpwdzc0?=
 =?utf-8?B?K0JxNVhvMm5ySTNvRmd3TlNMd1JMalhGVzZwemw5c25IUUNKdmkwN2I3WVpV?=
 =?utf-8?B?U2lkMXhnZTd1ZkxTTXZVL3JjWHVMY3MzUzNaWm1OUlVmQ01FZE9lYnpJRGlB?=
 =?utf-8?B?c1ordVNEMkVuTHFQRUhMbVl6VVgyWHFWeW9RSDhWRU9JUWRpY1ZnYVJIem5q?=
 =?utf-8?B?c3lubUdBZmthUjVEVnEyckpwRHExVC9sdkhrTm5VQUdjZGlsaHo0QVBIeDdG?=
 =?utf-8?B?bTliNVVqcExMY0lZbE5iRnJ4VXlPdmdhNmFEOXJNMGdpNVZBbS9vVzNDTFJW?=
 =?utf-8?B?aGhaKys5Vlo5aStlcmY5RHVKQjhObzRtVmFRdGo5QU43VWtmWWZsVnJkdjZ6?=
 =?utf-8?B?L1VwZDliSmhoSVdRR3BXRU5ESHUvR2dhY0VBczEzeTNiMmxueW5pWk9md05y?=
 =?utf-8?B?ZHoxcnFXTTVwR0V4dmZzNHdrOUM5WFFXVnphWWxHVUpVTWpGZ0FUSUFnTkNO?=
 =?utf-8?B?RnltdStYa2doWHlGVDlXSFJwY1NRM0dQMjIvYXZKcFZQNFNtM0ZHKzVlVHFB?=
 =?utf-8?B?dHJ4bHhSL3pCZi8yTDNOY1k5bW1RaDIrWWJZZGtRL3dTeVFBbjVkck04RTJy?=
 =?utf-8?B?b0tTZFpxcEhzYUhCd1FNN2dSeUxsL2dFV3FlSmtpY3puQS9qY1lhOTdzTVlj?=
 =?utf-8?B?WjJzSFArdk5YVXpJUXpXRE54UUdtUFhqc1YvVXFMR2czRW8wOWkrUmdPSzlq?=
 =?utf-8?B?NzJMTmhXcGJxOVJrS0xCQ3krVGRSVWMxeXcxSThPUkpLQzNTbnRNL2M3WEFD?=
 =?utf-8?B?YlJ1Yy9vd0RSWmNFdVFyWC9KSUZDcDJiNHgwNXhPaFBlOHlyd3dRSlp0Ynp3?=
 =?utf-8?B?S3pLcndlbWYwbGJ3WXloZnoxR2NJdWFJSmExMU0zOURLQTZEell6SmV1SURa?=
 =?utf-8?B?OWI4akVyTmhTRklnQ3BrZWMxZ0kyOVh1WXR4R1JSVFJYamZURGVxaklCenJU?=
 =?utf-8?B?eHJRM2N1cUt5Vlh3NXB0S3FHek9qeTNXWWJEZC82YWt0TmFwQldrSEJrekx1?=
 =?utf-8?B?aHdPQ0Z0blBMSEpoRTNyWloxZzBreFV1Q3hnTlllQWZkY20yZTFOSzVlZzZX?=
 =?utf-8?B?QisvTTVQaG94NzdDN3FGdDdFaGNOcTE1SHhHL1RCdjkrekZjeXlaUlhNS1Y4?=
 =?utf-8?B?WndLWWtqVGpHZWNrV2N2NXVlaXlYV3lUVUJ4Vm1oRzBsRGN0bzBicnVoTndo?=
 =?utf-8?B?d1hDRzZJWCs2V3c1NStndytMU2ZLVVpHWXNIcTIzNU1vZ3RORFFEU09RSFlY?=
 =?utf-8?B?dXRYSUhiS1VPMEJoczlNUCt2VWJJcGVxY2luSENnYXd6ZTZHT3RrZmVPbWRT?=
 =?utf-8?B?UGE4NDc2NkE5V251bmNxK3JvOEl0UVRHd1dxU1ZGeEtrZkQ1VTgrMEJkSk9o?=
 =?utf-8?B?WjRVRCtjUTIyRDE1Q3NXMUlraTZLaUZRb1VNekRqU0Z6SjZQbmN4KzExY2xH?=
 =?utf-8?B?YUNIMlNORVdFUXh3YjZ4NXMzdkM5NVgrZm42d20yVTlBSmhxK2FMZ1J1Z3lO?=
 =?utf-8?B?UzlKMlBhcXZkdVdUS1hXNGpCNVcwL1dTcVR0VS95U0ZCZisrcHlUVDVxTmVW?=
 =?utf-8?B?RnpXK1I2VGxvMitCQTVmMHpVUVB1bElYSWZyaHhSV01qU3hWOG9WRC9aV1Ro?=
 =?utf-8?B?QzZPZUpQeEx1TW5PbXo4OEFnczlDV2E0NnJORDFyRzVVY0xWOXY4UkZ4L2Vo?=
 =?utf-8?B?N0ljLzZCUDc5NHdPcGg0N01EOG9NTk5veDl1ZnJudTN5eFBJYUZDVVFQZmI1?=
 =?utf-8?B?eGN1Y0UxaHFVYjdQVFk4ZkZPZ2hYQzVBM2VuMzQ2aFR3L1I5WXd3QUdGdzg4?=
 =?utf-8?B?dWRVT2FuZG1tNmZoQXRSYVdrSENSRFpuaXpmbGVBdlVtSmN6bmkwVWlPV2tD?=
 =?utf-8?B?WVVieGtNN3pqYzJ2ZStleEZ1RTNiNzFNNVozZER1OU5PbE5rOVVhRVgrUE1a?=
 =?utf-8?B?SlNTT1ZneHlvQ0xsakszNkx2RElYNGU1Y2hWQVJCeURITGxCWkc5N01BTXpq?=
 =?utf-8?B?M2VBTXpFQUx6QmNoRnpRS3ZhWnRiSDFZZitmTE1UTEsrS3VMcVVVUFUySU1o?=
 =?utf-8?Q?Wm8lSQy4OJ+J4d8n85H0otwYO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19D58358BB8F3F41B42FB7F3062683EB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514eb33b-7ae5-445c-aaf0-08de25abf578
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:36:02.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLaI7QymMjmLPt35an4RfkfjRcAV0I7Crd21wdks9nqiFICIhTpHdzyDowpYu2jtJyrPdVG8W8iYVspilXGHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF080775CC1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_233615_733031_E164615B 
X-CRM114-Status: GOOD (  18.53  )
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

T24gVGh1LCAyMDI1LTExLTA2IGF0IDEwOjE3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDA2IG5vdmVtYnJlIDIwMjUgw6AgMTQ6MTMgKzA4MDAs
IEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiBUaGUgZHJhbSBhZGRyIG9mIHZwOSBkZWNvZGVyIHRp
bGUgbnVtYmVyLCB3aGljaCB1c2UgZHJhbSBtb2RlDQo+ID4gdG8gc2V0IHRpbGUgaW5mb3JtYXRp
b24sIG1heSByZWFjaCB0byAzNmJpdHMgZm9yIDQwOTZ4MjE3Ni4NCj4gPiBJdCBuZWVkcyB0byBn
ZXQgdGhlIGhpZ2hlc3QgNGJpdCBvZiB0aWxlIGJ1ZmZlciBhZGRyZXNzIHRvDQo+ID4gc2V0IHRp
bGUgYnVmZmVyIGFkZHJlc3MuDQo+IA0KPiBBbiBhZnRlciB0aG91Z2h0LCBJIGRvbid0IHNlZSBh
bnkgY2FsbCB0bw0KPiB2YjJfZG1hX2NvbnRpZ19zZXRfbWF4X3NlZ19zaXplKCkgb3INCj4gZG1h
X3NldF9jb2hlcmVudF9tYXNrKCkgd2l0aCBETUFfQklUX01BU0soMzIpL0RNQV9CSVRfTUFTSygz
NikgaW4NCj4gdGhpcyBkcml2ZXIuDQo+IEhvdyBkbyB5b3UgY29udHJvbCB0aGlzID8NCj4gDQo+
IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpUaGUgdGlsZSBidWZmZXIgaXMgaGFuZGxlZCBp
biBWQ1AsIG5vdCBpbiBrZXJuZWwgZHJpdmVyLiBXZSBvbmx5DQpnZXQgdGhlIGZ1bGwgY29ycmVj
dCBhZGRyZXNzIGluIGtlcm5lbC4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUNCj4gDQo+
ID4gDQo+ID4gRml4ZXM6IDVkNDE4MzUxY2E4ZjEgKCJtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzog
c3VwcG9ydCBzdGF0ZWxlc3MNCj4gPiBWUDkNCj4gPiBkZWNvZGluZyIpDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdl
ZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiA8YW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgICAgICAgfCA1DQo+ID4gKysrKy0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3Zw
OV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBpbmRleCBkOTY2OTE0ZGI0YjkuLjkxYzU2M2MwNDli
ZCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiArKysN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRl
Yy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBAQCAtMTE1Niw3ICsxMTU2LDEwIEBA
IHN0YXRpYyBpbnQNCj4gPiB2ZGVjX3ZwOV9zbGljZV9zZXR1cF90aWxlX2J1ZmZlcihzdHJ1Y3QN
Cj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdA0KPiA+ICAJCQl0aWxlcy0+c2l6ZVtp
XVtqXSA9IHNpemU7DQo+ID4gIAkJCWlmICh0aWxlcy0+bWlfcm93c1tpXSkgew0KPiA+ICAJCQkJ
KnRiKysgPSAoc2l6ZSA8PCAzKSArICgob2Zmc2V0IDw8IDMpICYNCj4gPiAweDdmKTsNCj4gPiAt
CQkJCSp0YisrID0gcGEgJiB+MHhmOw0KPiA+ICsJCQkJKnRiID0gcGEgJiB+MHhmOw0KPiA+ICsJ
CQkJaWYNCj4gPiAoSVNfRU5BQkxFRChDT05GSUdfQVJDSF9ETUFfQUREUl9UXzY0QklUKSkNCj4g
PiArCQkJCQkqdGIgfD0gKHBhID4+IDMyKSAmIDB4ZjsNCj4gPiArCQkJCXRiKys7DQo+ID4gIAkJ
CQkqdGIrKyA9IChwYSA8PCAzKSAmIDB4N2Y7DQo+ID4gIAkJCQltaV9yb3cgPSAodGlsZXMtPm1p
X3Jvd3NbaV0gLSAxKSAmDQo+ID4gMHgxZmY7DQo+ID4gIAkJCQltaV9jb2wgPSAodGlsZXMtPm1p
X2NvbHNbal0gLSAxKSAmDQo+ID4gMHgzZjsNCg==

