Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z5/dd6pkx58BzBKiceQoqUqRGe8j5oTj9QW6s5BfY4=; b=u4FOTZq4PUJmKfPmJ8wczyfE74
	JzLWD7yy7Re8JbK6d7eZQc/Ax58phjbzMmC6r75x6FeDzo/2Dh5jHq28eVpYfuCEfI/XUTTi7QXJ6
	zgIkDAQb8sDY/Ub4SWxYwyNcrHcbKGLKzWS2kWDSqQFzuUVNy+RsdCRKPRm3sEek7MZi0FOiuWhpn
	vSiozhI4xjvQVIHePHGWglQvVirwyeyfB+xmn0/Q3OTretP059mqHBipCP2yx+vzgleeoI84+6jMV
	7s7xWdbIPmrJOLaJ+Y6If5k4wwMcZKdGe67aEhGZ1gkeufBIcqd+gtlODw6H+EYEkkQNX0EnbelUX
	YAZmcrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEoc-0000000BebW-0ljv;
	Thu, 06 Mar 2025 17:15:22 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEWP-0000000BafT-39sF;
	Thu, 06 Mar 2025 16:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKmiqtOE3uXROEqfBh91VEW43qx3GMOT+ZHFKv15ekj476mcBZ3Tnx7q+FpqpbWlw07n2O5DbJLxSJAN6jJfKfGgIWFfiJ4rMjpJSVbJg4f1TpFlG9yP4dc7sOeTed6qUqqUSN1wYYPsdvmhR/B90hjbftUuqvrRXyoHzsdXW6nJVtEg1ybktVGWyWZiCzumTdEJBPoGar8zrhf72Vki6PiHsHuuxK9Gl8QJIEDbRjlb0xpfiBy8ZYsU6ISaPT+k0V7DwqoPuratiZJb5RVuST464799wRVU1cbprQbuvhN0BpGIzm6hyNFAv9Ldj+l7KYW0Hv/nzY4bVamkd09mZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Z5/dd6pkx58BzBKiceQoqUqRGe8j5oTj9QW6s5BfY4=;
 b=Su+oFNTo61E3N2wCGmjZhtZTKAmiix2Ln074EYpOwgcly8TSj5xtu4y2NqClp9BM/yI5sNM6iZhWmgxgXt6PUTmkH72no/qgcNCmJ6f1jzGDx30wajmP9UvxsvG5DCg11j+g4gOi50exb6krv3us8mFo2cFc6WW0FP00cd+aSHvCTsoJj1BuUVc99RA000BcD71a6oKGgItMxWejk17jI9kynetx8KGcoClO0PNn3Os8Q6NF/4iITH9ndxmBPckYMJLTp952AY74qzJq0virazYeP6qoJfNqs91wC1i57PEj6XVUky4AWJrMp9VogZcq2QJ+180bbcmLqLiFnCsINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Z5/dd6pkx58BzBKiceQoqUqRGe8j5oTj9QW6s5BfY4=;
 b=huDqT/nMDk9f5do88JkQaugxaTkcJnT9n03ZuykwWn9fCKBJoxWJlF3VXkRsikhAN2VSZlQE+gnolg58YohYlQt0q2MhNQQE1g1eNhOzn4Xs/adLioyoS460tk9FHjSNRCsNYFeQ1UihPVN7vIZDvVlUIhAmgKDECRM7L6IzbOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:26 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:25 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:11 +0100
Subject: [PATCH v5 10/11] arm64: dts: rockchip: add mipi csi host node to
 rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-10-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=1452;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=C5mShH0pESQITrVfwzea+P8hpOwQL+i4p/s/hgOvzQM=;
 b=KFu+VgMM5ERyw0/xfyzHQPFVgpWFhNjhLjiIlclefL55ScU2Rm9LVZU8mWrzOewBtMUVT0u33
 qqaSBeBaeg4CPvpqjAhuJh9jENOLNHRfbA8osx6gjs2gP8Byykb96rD
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e98a401-4cad-46d6-0753-08dd5ccfd47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNkUmNXeER4SlpIRXVTOGdwMWhmbVNheWhia0JJTTRpWEJrNTg1RmtDVzZX?=
 =?utf-8?B?WnpNT0VGWmU1Q3dpeGQ2RzBySzRBN0xINm94dkloSnhHQk1yVjJCdGxHeGdD?=
 =?utf-8?B?cjFOdDA1aVNXY0pXT2xKZVlwQjR1MVoxdHM5eVFWMVczR2tUczhFR0J0S3hi?=
 =?utf-8?B?UTNTaXFMbFBLS2x6aVYvSjROSHk0bGNoZ3hVbmdzOWMvYkdtaU8wZU9mMjBE?=
 =?utf-8?B?WXlvTnhFdG5RL2VKZkxId2xTR05hVkc1OC9WbHRnS3hJQ3E3Z29rQ2RVSnRo?=
 =?utf-8?B?UW50d2NNS3I0ZTdvWWxHY2VrQm1UdEZKT2hnMUU1ZmkxNU1LSFJ3ZVV4R2Rh?=
 =?utf-8?B?bmxhQjF5akEyZzIzV2cvRmJjY1V1UlVPRXBKL0l5QUcxdkxESTNEWjZmeTY2?=
 =?utf-8?B?SndqYjZGTzV3b3JTa1F0NGlPV2l3ZjIweWVRN3NNVWRBL2ZrTnI2V0w3Q1Bt?=
 =?utf-8?B?Q04ydDQxQ1kxSkF2VDFMdTU4OHpKZFFpcE4yS24weURvV3lJcXZYdTFZb2t1?=
 =?utf-8?B?cU5YS2drWmd5eEtqd0hYbUFjVVp6elBndnBpSlFxeGN3YkxWT1FVMHlhcmRh?=
 =?utf-8?B?VnNBdStZTXVFQ01aOUtCdFlGTWUyMzgyWWJRWCtrUXFzV2Zvd1M0Mk11cGJ2?=
 =?utf-8?B?YzhEd3Z2Mi91Z1JGME4zQ29halNqMUluUHNFbGNqanJiYW9QZ0toME5GVHJS?=
 =?utf-8?B?R0U3Tnd1TGZSWnR6VENHdGtqQUUrRG91WU10OGJFTW1TaGNZNVFvZkpIdDl5?=
 =?utf-8?B?YkNoMmdVZkV0MW1FTFVFMU9EVEgrYmZzK1BQclRjQVdSSVBWRjAxMCthdGVK?=
 =?utf-8?B?WWtTTFZtZk9XUjZZRGgyeVc2U2tVcFhaM1IxL2hxYXVwNjgzRlFFMGtnSm1S?=
 =?utf-8?B?QW9WMEkyMHcyckNodURFb2RpU3IzdGluM1NJaXY0QTBGM0xmdlhESnBhYXIw?=
 =?utf-8?B?ZmhsaEFVTElaNG5zQ2cvM2pSamZ3MHhFNG83aEZ4SnJGUUlCUjJsSmluWnhp?=
 =?utf-8?B?U2oxS1JUb1ZXRzVkcXNvd1NlenN0Tng4L2lzMStIeDhCVkQ3NmttM2gvY3pM?=
 =?utf-8?B?RXpXNlVvTzFaMk4ydy9sL2UvQTVxZm0vZmlNMlB4Yi9yQldHN2VRMU1jOVJR?=
 =?utf-8?B?c2tRbHhoQ1JsQk4vL0VFRy9KVXRxMnZPUzhNaFVrZUpQc2tjTE1WUi80dGc2?=
 =?utf-8?B?RWRMZTZTbWVzQThMWjdneUJVRldtb0tNdzRleUppNG4zOUg5ZU5RdUI2WEFT?=
 =?utf-8?B?UnViK2NnMlZleUlUSDN5b1Bxd3FMN2VlbHp1YVZIVXh0S2N0WEdoMGE3dmtm?=
 =?utf-8?B?Y1lxTFdGcTJjTS9GREd4MXdweDF2c0c2YWVBeDFKWm9VRlo4YUtMSi96bW5i?=
 =?utf-8?B?WnREZnZwTkVsNHRtOE5tZEJleGxFWTA3aVp3Q3hoV3Fja0UwUkdYcDdsYTAr?=
 =?utf-8?B?bVRSeHpyQVEwcWc0KytJYWJiRlpwdWVHeGhFdEZGZG5GWTJKc1hyQWQyRWFG?=
 =?utf-8?B?MHJwSjlyMzdtOEJ6TDBIM2NYUWFOT3doSGNGYkpJcC9OQ29nVk0vTHVyaHNO?=
 =?utf-8?B?Uitwbys0WThTa0R1T3hycHZzeXlVUmo5czE1c3FMMXRCT1ZpMDBYRlg2b2gr?=
 =?utf-8?B?VHFDcjJ5V0o5NThvNzJpMXE0ZGRzWU9JYUEwckgwUVIzRWtiTGRKaHk5bHph?=
 =?utf-8?B?UEJRSzRSOW9wcVgzOXRxYWduMmVNVGh0LzRoZ0VPVnJWVHIrSXRyNjErOHRI?=
 =?utf-8?B?cWRVZktGMG5uTDZqcS9CTlk1WCtVN1lWR3dJcGpaSGxMbUpXQ1RKdlJpR1Qv?=
 =?utf-8?B?djRraUhuVkZhN2g4d0JFbFVBMnFidzNrdGEzMkxSNGlVMnNwRk9Ld3E3VWZK?=
 =?utf-8?B?ZmZDWGplUU9LK0JieUNOUEVjVk1LWG5DVEE2elVSUHdsOEkyeGhjZlBxdHpW?=
 =?utf-8?B?S0FDUy9reWtDME0rMFc1RzY5bmRnNi85UmF1YmhuZmo3ODhpS0dWTzBZTnBy?=
 =?utf-8?B?OWF0L1NudHVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm5PcWdkK3g2QVdwajAyRWV0MTQ2M0t0ME9ucDAvK1FwNlV6ZXY4enh6Ky85?=
 =?utf-8?B?SXJVajJPVWlkWUdmY0RGVVMvOEtZTVU3MytiNytOcUkyQlF5R1M4c0JwWWJG?=
 =?utf-8?B?MlBKOEpZSDBEY0RsQitGb0YrMEd0d2RuN0xVUU5DQUtVL1U3eHZBUkprTENo?=
 =?utf-8?B?NmF6TkVYOC81U0I2Z0QzeG1RUGVGUUp0NlEvVGNDa3AvWERnVWZqLzRMQWx2?=
 =?utf-8?B?TG83T0dkRm9sN2hDQlBVaUgybkl3aHp3US9sVGM0Q3dtdEErSUtjeWFJenhN?=
 =?utf-8?B?ZTUrWTU5WElzTFRCVG8vL0xBNmErV0xhTDdUTmp3cDU1eElhRnRYQjk4UEZ0?=
 =?utf-8?B?aklvUmxKMlhkZFFlNkExUDdNVkRtOEYvMGtzdWVxYmhLRjJYeTFURG9nL0tJ?=
 =?utf-8?B?cjBuTUY4UTRIOUZDL1hhTWJaNjc3Zmd4cGU3TzdlNFdyRzJIQXEzRkFWYkpR?=
 =?utf-8?B?V3NWNDBJSmpKdUFpL2RNR3R6ZDZuM2VVWG1USW9zcDZZL3RWWlN2UkhVeEhx?=
 =?utf-8?B?M2ZIM2dXMnlvYzRINDRjY1hQTTFiQ3FlNGNMLzFZb0tqaE1BTVBCa3pLSDVK?=
 =?utf-8?B?MTFnTmpaYW92KzFicHFEekxwVnJTWHdUbUVMZGI3Y1NoeWViWHBwT21Ycisv?=
 =?utf-8?B?bFhqSDQxbi9tVHVMbnpHdkl5UjM5bk5LT1BvcG5jK0ZtZVN5aGMrV2xLTFRO?=
 =?utf-8?B?Q1I0K0xhNzJFVVdTZEIzNGZmNnh0eHhUNkM5d2pIeUZ3UHVGcGlyS0k0c3VV?=
 =?utf-8?B?WjgvdW1HTDFuWEdGQUo0MFAxL0Jlb3dhL3RRdDBIYTg5ak4ycTJGa21ab2Y1?=
 =?utf-8?B?T0tXZWo2ZkRESlgrbytEREU2VDZLb21BcS8wRXBCczZEeEZvcXR6N0VPZlJ0?=
 =?utf-8?B?dDFxRTVYZ2gvTkJyaWZjbUdybkhaNmNHd25UWTRYUkZ4VmREbFVkS3d4MzRo?=
 =?utf-8?B?R3JHWDk2cVpLTzROMXVBRS9tb0FBS3RXOU1SSHRPMFdiZmtyN2JZemxZQmdx?=
 =?utf-8?B?eDc2VVpQWHZWWjBpaUJqTzBreis4MHpsQVZiRHJGc2lud25EbytDVWhPMGZI?=
 =?utf-8?B?WDRUL3lxMlExS2JGOTh4RGZvNWdKUzQ2eGNsbS81aW9oSjl1QXhSdmp3S2x6?=
 =?utf-8?B?UHRERXVzS3d1a3BRVE56K3ZuY0lraGVORE91QTQ1QnM4allpVmU4MTNBd3Zy?=
 =?utf-8?B?QTJDL1Y1MjllZUpKWitUeE4vRjliek5zMFZjaW5jQks2MDFaL3F6ZFcyWk9C?=
 =?utf-8?B?WDVOSlExY2IxUzhHamNTS052YUlWMDcraFRXWnQzU3o2TFFtNGV6VUR2Sy9J?=
 =?utf-8?B?YU82TWhtTXFodUNOUXlNWDlld2p6VHpnU1RFSHpjb01CZGo3WDhUR3VacXVF?=
 =?utf-8?B?UDUzNXgzVjNuNFpjQW5qK3J3K2w1U0t1c0tGblFxZ1pQWGpudTQ1M01MTlR1?=
 =?utf-8?B?TjNRemp2VUxkSUgzTjc3Zk5tWUJ4elNpOUtkc05hWjRyc3Bia1VFUVlJMVMz?=
 =?utf-8?B?RnJsTVlKYUJVT3FoYU1BL0V4clhxV1NnUGFCQ0RZZSsxSW9lRnlwdGRLbnVS?=
 =?utf-8?B?anRBT0llSURVNFJwb0JGdWUvVlExMFhGZDhEQ3ZoSGVBWDErelNNMUthUjZ5?=
 =?utf-8?B?NmVseFQ5WVo4VllMQi93RGhUWU5xL0hvNnJ0ZmZmb2tWVE1jNVk0c1hRM0tR?=
 =?utf-8?B?czVsckk0Sjcwd0l0clhINHpjZUxBeEpFc1BBQlhYNUV5MDdPRzR3alJXRGw0?=
 =?utf-8?B?VS9haXc4UEFDUTJBRmdtUEMxMWpVTzMrNzB4QW1GNGtxak44ajdqQVg1YnVE?=
 =?utf-8?B?R0NZZ2dwWVZ4UGd1YUtaM0VoR3lCYVpYRGtJVk9tbFJXeVJ1OHRWSlBzRi80?=
 =?utf-8?B?dDBKZkxINnQzelpBbHUyUkhRbVhnUFJWaUNnR1A5SEE1M095dTN1TmpybDBE?=
 =?utf-8?B?aHZ1cVcxSjBHejBXdURJcktYVGFHQ0NFQXBLWHp1SUl5c1UxWWl5Mlp5VGZZ?=
 =?utf-8?B?eC9qbWtKN1hXU282b1hyejRoVXo3cGJOZEZzL2kxTHcxOE1GbXlsU3hhZ00y?=
 =?utf-8?B?TlFTaHlnSkFtblNTRlFjRnZSakhxSGxYMDdvUzdzYVhsSzFWZEtaMjFacEli?=
 =?utf-8?B?amx2KzJYWXFyMkpBTGhNUXR3Y2dOS0M4UWNqeW1za2hhcFpDRUhQVE9wZC9O?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e98a401-4cad-46d6-0753-08dd5ccfd47c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:25.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpEwoaCUq8rLRnlBa/kWhXp2bKVzJDHj+GNVXaquMI1/WjFdZyBHtS8B8Cfa8mmIVRCyyB/ztxVEUG6KUsDE4QIH4cFscsXmHFrPvCk+bIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085633_806635_9EDF8E5B 
X-CRM114-Status: UNSURE (   9.34  )
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

Add the device tree node for the RK356x MIPI CSI-2 Host unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index cba5092dbcea..da56a40e2aee 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -553,6 +553,33 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	csi: csi@fdfb0000 {
+		compatible = "rockchip,rk3568-mipi-csi";
+		reg = <0x0 0xfdfb0000 0x0 0x10000>;
+		clocks = <&cru PCLK_CSI2HOST1>;
+		phys = <&csi_dphy>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_P_CSI2HOST1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi_in: port@0 {
+				reg = <0>;
+			};
+
+			csi_out: port@1 {
+				reg = <1>;
+
+				csi_output: endpoint {
+					remote-endpoint = <&vicap_mipi_input>;
+				};
+			};
+		};
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
@@ -581,6 +608,10 @@ vicap_dvp: port@0 {
 
 			vicap_mipi: port@1 {
 				reg = <1>;
+
+				vicap_mipi_input: endpoint {
+					remote-endpoint = <&csi_output>;
+				};
 			};
 		};
 	};

-- 
2.34.1


