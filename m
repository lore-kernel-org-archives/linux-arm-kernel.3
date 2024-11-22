Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31781E65D3B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rY2r5ZZMmonMgN4jn8fCP/iWEWlPVf2fClh59yULSG8=; b=Sdd5PZhaXJMJR09Zz9/P3G3JGE
	vl8FrpIsjLq75NEON2p6dm6C34sq2zOGVX5TAeord77VWFiI/p1rrl7OE63DRbIflaGHUaUn3b/X+
	7S4FdL4LOjNyMOqwS5SWYN+meuo7DqtswctKeXfrkkTXp0yF/Pf2xrXAAVrptuShm+FZAk/GdwbO6
	JKXKiAk96+7yzjnygRxXN9mobA6slTX71ehT7FkYlbDCs90OktEtbcpe/F58CsT6SuGZonfHJKY+Y
	rQHzBCkQX0/71qOkpHUyyrITFOmJQbJIb8rBQUIF1kFJxJT56nMNWtcTb/utPjzHaLSOM3qtolvvJ
	MLpYMZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQAQ-000000027qV-1Cqm;
	Fri, 22 Nov 2024 09:41:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQ9S-000000027gD-403c;
	Fri, 22 Nov 2024 09:40:36 +0000
X-UUID: cee7ce94a8b511ef9048ed6ed365623b-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rY2r5ZZMmonMgN4jn8fCP/iWEWlPVf2fClh59yULSG8=;
	b=Qt/9Krx5GEN9R2goeHaX3Gcnn0wJulIdvNh77bfQtPc2DPgnaXasPGnwcynJq4lM/j5xXQ03C6zHIEhFVFQeXWCacFZZcQn3HvAazZWtt8i8ZhTfZtCooYb1B7hUVh1zmZR6XSvWxRhwHoj5TYxc3hRMMU3zfXFHI2bsJKlT1VI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:cfcdf004-8154-481d-9a74-d49b6dfb9096,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7aaaa3a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cee7ce94a8b511ef9048ed6ed365623b-20241122
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 431816182; Fri, 22 Nov 2024 02:40:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 17:40:25 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 17:40:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUvcsJTJYF8fAsX5Plm0fz8/38obVuPG8ZSG7dRYzCf8j0wFUMi8M0wMhykUx5XbTHO+AQTOKDH/AkyDyrGIocJcYzVdnReLvM2TXgvto9r7b2Rv7G2FMoz1gqLtmycUAR75FQvuE+yuE449RNZnn2zEM86MKDvAGVHBHS7eRbZ80WP9hOtjFL4ifFH3X8n/8syd8vXB2whbe6Zz2mLfUmublGPVgWbyw7/DImtNKsiNfJbC2zebKxJYYGFDvx2VgKMozvNeFx4fHxM4Gkn4QMizQdQyqnwA8Ga+2HDHqz/74SuyD3VkYvlb2ROaplIHw5pUya5YOx0QeGCYgJD4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY2r5ZZMmonMgN4jn8fCP/iWEWlPVf2fClh59yULSG8=;
 b=RH3uyy6NXAAzr987McYXhuolyUsn7AquVtzUHTCS0o6g0t/VRHXY2D1KTbBLt8JvubRb4lKWlNBhJVzZJjkprYjPGB9wWUObxit16acGiRE9YI7u1NnVFHOqfMXtX0NN27vhWNNtFaN+pctiGa6ZxT7uMWhq2TcJfYJpVl43xYf33PUgNij8vrV1pU2SUdi9BxIgOot70RCbwqQvCQSLEwHE33v4d2RzzW+2mxmx4TUB38aMsCMpDKaDPPyMJdZDHR5j4DXWUBdKqLf7Q92eFU+b32PDPVqmrIue8DzEQtCWXaqNTde1g5aei6lP6TfrHhffLgPC+qq29Sm2XOXXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY2r5ZZMmonMgN4jn8fCP/iWEWlPVf2fClh59yULSG8=;
 b=Sg6YU9Ao6LgCZwL0tEnjM0e5Xk/PJECkpCueWvqlGfAi9rMJKzxTJsDRDn/kitEdwBSkWopOAKM8KTK8HCCcq/AuKCpGlIKer/JN4wJ/Wa9qAKJ2dZpODa1u5SSIwL3pzrh/gSWQTmqA/ScoAxBQlCDRtQl/sC4xZ7Sk0eNjyus=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by OSQPR03MB8435.apcprd03.prod.outlook.com (2603:1096:604:271::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 09:40:22 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 09:40:22 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp related property
Thread-Topic: [PATCH v2 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp related property
Thread-Index: AQHbOxafW9Nl29fMRkmElAappRl4rrK/yj0AgANEroA=
Date: Fri, 22 Nov 2024 09:40:22 +0000
Message-ID: <2b9b7a52536bfa07155a24feecd03a3b4268b07b.camel@mediatek.com>
References: <20241120063701.8194-1-friday.yang@mediatek.com>
	 <20241120063701.8194-2-friday.yang@mediatek.com>
	 <mnbc33u3ohncqmhyftag26sttqif24mjadnlg2btx7tc3dmowj@6bfh2lb7ekud>
In-Reply-To: <mnbc33u3ohncqmhyftag26sttqif24mjadnlg2btx7tc3dmowj@6bfh2lb7ekud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|OSQPR03MB8435:EE_
x-ms-office365-filtering-correlation-id: 600b0bbe-66c4-48ee-d865-08dd0ad9af76
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWU1RzJpMEZIUnlDU3c1eVJmVlhXTnVGeU8vcW9rcGgzRlBEVXd1VVZtV0M3?=
 =?utf-8?B?WXZzV1JHcjdmUEQycXAyMXpuOW5DSHV0OGpEalNmanFoUUxkeEFtTXlEczZP?=
 =?utf-8?B?dUp3U3k0eDFXOW55VXlZRWFDSFNkS0VLNjBJcFFndVdXbDdpejFTbnhGOFBz?=
 =?utf-8?B?ZGZyd2ZHdWtpQ3lhOTdyTXV4UUsvdzdKbnE2QWNTS0hxMUd1Yy9ENXZlODN6?=
 =?utf-8?B?YkVaWW9XWUovTTI1R1Fvb2IyZ0QvTU9zdE9RZjhQaTM0R21QblNUWjhFdHl5?=
 =?utf-8?B?cTVqYnBTckdxc2c1bi9pWm5WclRERnZ0cTdXMEcxOElKOW0zditVNEdRQjZI?=
 =?utf-8?B?RUFqV1E4aFRxQ3JLL2lEWVl2SVF2QnVRdm8vUXJkRGxSNmVrQm5kWkw0TUhR?=
 =?utf-8?B?bDNYWWlMZGUwd1JiYnRueUlKcHhmUGhkM0VWOWlibEQrN1RwTFdsMXVZbHhU?=
 =?utf-8?B?d2JPMUJad2tYL2I1OW80VG9YWTJDazBLMStSdlpaU3Y3RzRQempKM3gzUWl3?=
 =?utf-8?B?YnV5dXdLSUZtb3dLaXJnRTlGY1l3YmlJWXRCYy9rWGp1RWVOUjVqc2FzWnpY?=
 =?utf-8?B?T3pycWdwWm1IV2FTdlV1UmNLV2N2d3lvdDhJTVIwNlJGYks2dkRqRS9UOVQx?=
 =?utf-8?B?TWNwam1UVkJyWjlVM29yS0k5MlcxWWNQZWZ4OUF4dElCRU1vVGFEam85ZEJr?=
 =?utf-8?B?NFdZbE05Uk5ZbTlDTnp5Q2VSc3VoaE1oU00rNFZaVml3eE13T1d4TE9uUTAr?=
 =?utf-8?B?ODhkc2djeG9lMk5zdG4rVE5WOWVCSVNYdk5jQ01zK0NXeW40K29KRC9sM2lU?=
 =?utf-8?B?bDlVRGlGb2lveUJNc3FqQllNWlJLbWk2Q09vSDd3Sk1RUTNSRlRSUDNIWTVZ?=
 =?utf-8?B?TFhOVkNLMHdrQmU2Q1FzM1FXNHA3dEc5dGZsSHVXWHhPZnVabUoxQlJldDJJ?=
 =?utf-8?B?ZzhkUjJtbWx5dldTZ2ZTekhqblNmd1Z3M0VBZkhpbEtuQ05FamxwYnFSSWlD?=
 =?utf-8?B?b2RIVnc4WlpQUVhFK0x3NDRsYkdjYVl5dWZTRk8ySnFudE04ZEpoY0pUMnFl?=
 =?utf-8?B?YUhsSGxQRkhEZVg5UW1CQ2J3RS91eXdrWUFlcVJsTnExZ1BmS0h5SXg0UVkz?=
 =?utf-8?B?eHgvWGpIWm4ydWE5QmRBLzNkalpGclVSS2FTdFRZbG5pSE5XOW9YOGFYWFdC?=
 =?utf-8?B?S0NGSStuQnlGQ3p3NUQ1SnM2M1FqQVdlcUQyeVQ0MHpaQ25EOEhSUGVOUm1O?=
 =?utf-8?B?aVNpV09UcmdjaFBuKzdTdWsrbDNWMTlzM1pnZTNLTUVaWmZHSWhkTmdodVlJ?=
 =?utf-8?B?MG1wR3hQMFJ3UGw0cEo5S0NZS2V4SEpUdkY1eWhiMXFpTGZmSDJSZlBEd2xN?=
 =?utf-8?B?eGFxdDFIKzM2N203dW1YM1Ryb2NIUElCUWw1MXV6ZzJwdjN5TFBIcml1TWV4?=
 =?utf-8?B?MzJlM2FVUm9IQndsbVozSnArV0NpQlo4L1NScTEvWkY4RTAwajVTZFowM2Fn?=
 =?utf-8?B?MFdlRHg2cEdWdDRBWHc3OG40NXR4TFZmSG9uTnRiVUJjTEtEQVF4ZmMrc1Zk?=
 =?utf-8?B?Y0FkUkZxZXBkYW02b3lhUDJJekFRU0Z2Z0VpNmoyeHNDWlUvL2dVSGlQc0hP?=
 =?utf-8?B?WDF5Tk8wV25iZmM5MlVoYnVwaGs2RGRkWTJQdWNZZ3dWUGhaRUJKUVVDWkd6?=
 =?utf-8?B?QjJtMi9qNGNSOU40UUVhZGRwWlBrOTdpTnVJNzNWNklrZlA5Z0Rub3lnU1dh?=
 =?utf-8?B?eFF5Y21qMWdWMks5WTZYeHFpcWR4NE5NMXVORGthOXVWSzF2c0VJSVY1dXBo?=
 =?utf-8?B?OCtEMm1wMis2cHphNnQzVDlVY1hEQkdYclJLYnZnOC84TDJMWjBpQnpHRGxx?=
 =?utf-8?B?MWFReHovSElrRU9LUXFOTzM3eGpsWWZWYk85ZDBTQkp6ZWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTRFbXBmWVk3WkNRWFJMQjAwMm5ybHBQaUlvaWtYTGhGeWJqTHd2UCt5ZDNI?=
 =?utf-8?B?K0cvM0R0VEtBSUhIVDlqZ2MrMGtiaHpRZy9lalE5Q0ZUdDhjd1ZWV2Z0L3NS?=
 =?utf-8?B?MGZFcTRMbjFyL0lMbURxUFQ1UE5uOEFONFFUWDQveEJWZE1FMjJpV04rL3Jt?=
 =?utf-8?B?d0U4dGZuNXJFbVRVbWxEMHBmZTIxY2hvNng3a3d2Qml0bmV1eE9VUWdZbGt1?=
 =?utf-8?B?d3VMODNTejFRbUlsSDJmQU9KQm0vN2VhZ0M5WENkdEM5ZUYyUW9KV1BFZVcx?=
 =?utf-8?B?bjAxbCtNMXljdzJCSXZXaUQ1aFdEMldpaHhicHlGOFhMLzBPTXVDa1RaU1Br?=
 =?utf-8?B?eGJyd0gzT01DQVoybkFqZ1lxYk9DNzRNK24wSEVyemFOLzdVaHFLb0lUNVZx?=
 =?utf-8?B?SUR4dE9pYVFuM2ZLWDdUc0Y3Y2Ywdk54dy9EWklGN1ZxNmJZdFNsaVE5anRX?=
 =?utf-8?B?YkdVWXdwczRQVS84TDhBc0dBY3pyWkNqSzZkNTA3aDVMS3FRdWZyZTJFODFY?=
 =?utf-8?B?d0NPUEZGVmVaWkR6SHhab2RkZjU1YzhMZ0hEKzBUWEFzcFF1dVNRRnVVcmxj?=
 =?utf-8?B?c3daKzcxVkpnc1hlMW1XNGtOOFkxWG9xdHhEeUp5Zjh3R013TEhEUHd3RytV?=
 =?utf-8?B?Z1dsOXFjZi9MWHIwblg4NUZuUlJlc0RUNkQ1WFd3UGZEaHVQbnJ0REpUbGVx?=
 =?utf-8?B?WURUZFIvbWNmOHV3N2V5NTZ6dHBKV2cwWWNqZSt5MUdveWwvSmpCdjFySUxD?=
 =?utf-8?B?SXZqOVlZM1ZXVC9MaFJjZTJ6cEExT29EZk5WY0RJSnNONS9IcDBZdk1YNXlR?=
 =?utf-8?B?cVZKN1MxcUpUQXVRTFpUY2RDWWhYYzJiaWV3Z0p1TDI3V0hhMlYrb3pjdEVM?=
 =?utf-8?B?R1kydjE5Qm82VTk4YUVEdVo2dXExRlg1RDczOW12VEhNeERGaDV1NXZRT0ZX?=
 =?utf-8?B?cmo4OFJTNGVyR0xDU09WY3hjRFcva1FYUE4rTmFMeVRvaE5iRVBNRUU2dEFr?=
 =?utf-8?B?em10NDZEcFZ2dlZDZEE0djI2ODNXdFpoNk5PeFg0Nkx4WnhQRTFjblRzRkV2?=
 =?utf-8?B?NGJsME9Ua3lCcElNZmh1NytCODJYYzQyR2ptYUZraHVUY3RTVS9kSnB3ZHlB?=
 =?utf-8?B?TEhhM1hmWjhZeWxVekRLc28zOFd3VjJzU0NzRHVPeURNQk5zTVlEUklJVk5Z?=
 =?utf-8?B?MXMwVytuRVNyUHZEdlZPUSsrc3FkUTdBcTQ3RFBYWlI3MGJPYnhZZ24xcXg1?=
 =?utf-8?B?SnpTeElXZU9VOSs5MkQrbkFMUW12Vmpvemg1ajVhS1FCd0didUJ3Qk9HNmVk?=
 =?utf-8?B?bGdobk9DYkdWbjNNdlUrNDlBeWsvaVNzK2xYcDZ0Q1VQd1RaeW90T1I1a3Zr?=
 =?utf-8?B?R1VEVWM4M2lvMzBnQVBrY21nek9GWkp0QWpkR3cvbXJJKzJncEpMeXBNTHU3?=
 =?utf-8?B?TWNUOUd2YVNJYjN6RjA4eENUZXFwLzZQK29NLytaTXI1YTE0SGprUVQ2aUEx?=
 =?utf-8?B?dEZEQ1dlUkRZOEpPWmsrUHR6K0FyZkpWS0FIdHJ4TWhsZlZ2MXZmWDYxOUlt?=
 =?utf-8?B?Ly9vMFNPZFdGVmJqYkxuUEYvekp3SHBxcjJ4Rm9VdlM1WTFaTHN0cEVVYnBO?=
 =?utf-8?B?TnJDYTdKcDRObWhqUmNxQy94OElORWk5cFgvVWFwbVFLMGpNcFlabDliVk5C?=
 =?utf-8?B?L1BrYlNoZTNxNmp1NUtaRGlSYXZSa0c3R2gxaVAvTlVsT2xEcmhOQXd1ZmRj?=
 =?utf-8?B?S1FNcXl5Z1NQQmQ4dmFmMnZxNnJMOW9oWUVjZml6Y0JHVlZlN1pUMVprLzNi?=
 =?utf-8?B?bTE0dGhyTkhMVDltMGlIRXd0dUVPOTJYelJzSGVjT3hPdCtlZlhvMk1FR2Vs?=
 =?utf-8?B?cTEyZEtEUXh0Zk9DamIzNUl5eVpxM0tJWDh4UVk4VmpPbHJkVzM2K0tZNDA5?=
 =?utf-8?B?N1oyVUtNQnQ1RHRseXlJSy9Bdi9hSlRqQ210SHlZZ3RXbEw0MFVVZWFSV0NS?=
 =?utf-8?B?VlZxRlJEd1h0ZjlhTW1meVdJQkRXS1Z4VzEwQThRcmhGYjlIN2IxWE4yaVBw?=
 =?utf-8?B?ZDRuWkt6SjVUYXRmaFk2UUFXNXM4d1A4bHZIakdWWm04MUdoeXA0cTZVUGVH?=
 =?utf-8?B?a2FscDVFTExBaTMzaTlZeXVMWUVnWEJwd3VzY1hMY1BFdVBlZ1NlSkVwckpD?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C485C0D7466CA4A889E34BD94E734D1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b0bbe-66c4-48ee-d865-08dd0ad9af76
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 09:40:22.4317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbzyqgevaDGJJ26XJkP4xtjpbUeGo2BZw0IpYtJh0gwQhaqf/07Xg9Tgym3UgdEBp+y6ddc0ngmvU5C5e2MQrlPdgRJhhR1Cl6idQMF5H2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_014034_999447_4B6E75EF 
X-CRM114-Status: GOOD (  24.31  )
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

T24gV2VkLCAyMDI0LTExLTIwIGF0IDA4OjQ1ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFdlZCwgTm92IDIwLCAyMDI0IGF0IDAyOjM2OjM4UE0g
KzA4MDAsIEZyaWRheSBZYW5nIHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiA+IGNvbnRyb2xsZXJzL21lZGlhdGVrLHNt
aS1sYXJiLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktDQo+ID4gY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIueWFtbA0KPiA+IGluZGV4IDIz
ODE2NjBiMzI0Yy4uMzAyYzBmOTNiNDlkIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMvbWVkaWF0ZWssc21p
LWxhcmIueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktDQo+ID4gY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIueWFtbA0KPiA+IEBAIC02
OSw2ICs2OSwxOCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgZGVzY3JpcHRpb246IHRoZSBoYXJk
d2FyZSBpZCBvZiB0aGlzIGxhcmIuIEl0J3Mgb25seSByZXF1aXJlZA0KPiA+IHdoZW4gdGhpcw0K
PiA+ICAgICAgICBoYXJkd2FyZSBpZCBpcyBub3QgY29uc2VjdXRpdmUgZnJvbSBpdHMgTTRVIHBv
aW50IG9mIHZpZXcuDQo+ID4gDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDEN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGlzIGNvbnRhaW5zIGEgcGhhbmRsZSB0byB0aGUgcmVz
ZXQgY29udHJvbGxlcg0KPiA+IG5vZGUgYW5kIGFuIGluZGV4DQo+ID4gKyAgICAgIHRvIGEgcmVz
ZXQgc2lnbmFsLiBTTUkgbGFyYnMgbmVlZCB0byBnZXQgdGhlIHJlc2V0DQo+ID4gY29udHJvbGxl
ciBieSB0aGUgbm9kZS4NCj4gDQo+IEZpcnN0IHNlbnRlbmNlIGlzIDEwMCUgcmVkdW5kYW50LiBB
cmd1bWVudHMgZGVwZW5kIG9uIHRoZSByZXNldC0NCj4gY2VsbHMsDQo+IG5vdCB0aGlzIGJpbmRp
bmcuDQo+IA0KPiA+ICsgICAgICBTTUkgY291bGQgZ2V0IHRoZSByZXNldCBzaWduYWwgYnkgdGhl
IGluZGV4IG51bWJlciBkZWZpbmVkDQo+ID4gaW4gdGhlIGhlYWRlcg0KPiA+ICsgICAgICBpbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE4OC1yZXNldHMuaC4NCj4gDQo+IFdoYXQ/IEhvdyB0
aGlzIGNhbiBkZXBlbmQgb24gY29uc3VtZXI/IERyb3AgZW50aXJlIGRlc2NyaXB0aW9uLCBpdCBp
cw0KPiB1c2VsZXNzLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLCBJIHdpbGwgcmVt
b3ZlIHRoZSBlbnRpcmUgZGVzY3JpcHRpb24uDQoNCj4gPiArDQo+ID4gKyAgcmVzZXQtbmFtZXM6
DQo+ID4gKyAgICBjb25zdDogbGFyYg0KPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSBuYW1lIG9m
IHJlc2V0IGNvbnRyb2xsZXIuIFNNSSBkcml2ZXIgbmVlZCB0bw0KPiA+IG9idGFpbiB0aGUNCj4g
PiArICAgICAgcmVzZXQgY29udHJvbGxlciBiYXNlZCBvbiB0aGlzLg0KPiANCj4gRHJvcCBkZXNj
cmlwdGlvbiwgdXNlbGVzcy4NCg0KT0ssIEkgd2lsbCByZW1vdmUgdGhlIGVudGlyZSBkZXNjcmlw
dGlvbi4NCg0KPiANCj4gPiArDQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0K
PiA+ICAgIC0gcmVnDQo+ID4gQEAgLTEyNSwxOSArMTM3LDM4IEBAIGFsbE9mOg0KPiA+ICAgICAg
ICByZXF1aXJlZDoNCj4gPiAgICAgICAgICAtIG1lZGlhdGVrLGxhcmItaWQNCj4gPiANCj4gPiAr
ICAtIGlmOiAgIyBvbmx5IGZvciBjYW1lcmEgYW5kIGltYWdlIHN1YnN5cw0KPiA+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIG1lZGlhdGVrLHNtaToNCj4gPiArICAgICAgICAgICAg
Y29udGFpbnM6DQo+IA0KPiBOZXZlciB0ZXN0ZWQuDQoNCk9LLCBJIHdpbGwgZml4IHRoZSBpbmRl
bnRhdGlvbi4NCg0KPiANCj4gPiArICAgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAg
ICAgICAgLSBzbWlfc3ViX2NvbW1vbl9pbWcwXzR4MQ0KPiA+ICsgICAgICAgICAgICAgICAgLSBz
bWlfc3ViX2NvbW1vbl9pbWcxXzR4MQ0KPiA+ICsgICAgICAgICAgICAgICAgLSBzbWlfc3ViX2Nv
bW1vbl9jYW1fNXgxDQo+ID4gKyAgICAgICAgICAgICAgICAtIHNtaV9zdWJfY29tbW9uX2NhbV84
eDENCj4gDQo+IERvZXMgbm90IHdvcmsuIFRlc3QgeW91ciBjb2RlIGJlZm9yZSB5b3Ugc2VuZCBp
dC4gTm8gY2x1ZSB3aGF0IHlvdQ0KPiB3YW50DQo+IHRvIGFjaGlldmUsIHNvIG5vdCBzdXJlIGhv
dyB0byBoZWxwLg0KPiANCg0KQXMgSSBtZW50aW9uZWQgaW4gU01JIGRyaXZlciwgb25seSBTTUkg
bGFyYnMgbG9jYXRlZCBpbg0KY2FtZXJhIGFuZCBpbWFnZSBzdWJzeXMgbmVlZCB0byBhcHBseSBj
bGFtcCBhbmQgcmVzZXQgb3BlcmF0aW9uLA0Kb3RoZXJzIGNhbiBiZSBza2lwcGVkLg0KU28gSSB3
YW50IHRvIGtub3cgaWYgdGhpcyBkZXNjcmlwdGlvbiBtZXRob2QgbWVldHMgeW91ciBleHBlY3Rh
dGlvbnMNCmhlcmUoc21pX3N1Yl9jb21tb25faW1nMF80eDEsIHNtaV9zdWJfY29tbW9uX2ltZzFf
NHgxIC4uLikuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcmVxdWly
ZWQ6DQo+ID4gKyAgICAgICAgLSByZXNldHMNCj4gPiArICAgICAgICAtIHJlc2V0LW5hbWVzDQo+
ID4gKw0KPiA+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiANCj4gPiAgZXhhbXBs
ZXM6DQo+ID4gICAgLSB8Kw0KPiA+IC0gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210
ODE3My1jbGsuaD4NCj4gPiAtICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxNzMt
cG93ZXIuaD4NCj4gPiAtDQo+ID4gLSAgICBsYXJiMTogbGFyYkAxNjAxMDAwMCB7DQo+ID4gLSAg
ICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXNtaS1sYXJiIjsNCj4gPiAtICAgICAg
cmVnID0gPDB4MTYwMTAwMDAgMHgxMDAwPjsNCj4gPiAtICAgICAgbWVkaWF0ZWssc21pID0gPCZz
bWlfY29tbW9uPjsNCj4gPiAtICAgICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19Q
T1dFUl9ET01BSU5fVkRFQz47DQo+ID4gLSAgICAgIGNsb2NrcyA9IDwmdmRlY3N5cyBDTEtfVkRF
Q19DS0VOPiwNCj4gPiAtICAgICAgICAgICAgICAgPCZ2ZGVjc3lzIENMS19WREVDX0xBUkJfQ0tF
Tj47DQo+ID4gLSAgICAgIGNsb2NrLW5hbWVzID0gImFwYiIsICJzbWkiOw0KPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL21lZGlhdGVrLG10ODE4OC1jbGsuaD4NCj4gPiArICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZWRpYXRlayxtdDgxODgtcG93ZXIuaD4NCj4g
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9tdDgxODgtcmVzZXRzLmg+DQo+IA0K
PiBUaGlzIGlzIHNvbWUgdG90YWwgbWVzcy4gTmV2ZXIgdGVzdGVkLCBub3QgY29ycmVjdC4gU29y
cnksIHJ1biBpdA0KPiBpbnRlcm5hbGx5IHRocm91Z2ggc29tZSBzb3J0IG9mIHJldmlldyBvciBp
bnRlcm5hbCBjaGVja2xpc3Qgd2hpY2gNCj4gd2lsbA0KPiBhc2sgeW91IHRvIHRlc3QgdGhlIGNv
ZGUgYmVmb3JlIHNlbmRpbmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiAN
Cg==

