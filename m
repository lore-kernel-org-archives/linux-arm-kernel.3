Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578F0E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnlPLsCM6swCMo7KYR4BZU3Am1EH+B446keVBEFwED8=; b=ew80NYYfCfeTzJ/c1fAPyjKWUn
	1cYAUVEcoNWDao+j4XiATY3fyZOsqbYJW38LO4Jhn/F9bPTbRzrjcJfox354x1uBG9WMz2z/5c6+j
	2WZycczMR9vRqSRRWpzwzai5Vw7zFvDYDEstnXxTMngFjdpjNrLFZbjLUTM3dhiInVWa6sMoqW5gL
	Vs+x4tw7wbNhVH73y5lBBVfR/FobQg4KhF4h6ujBPfkS23DiiHPG624EtLmr54wnzVsr5H3sI4xra
	2UsJ+sQ292sLl/osUcoxH3Gfc3uILeqfQni5m9KOFzd8oxudSxisBELXKUxQJS+nq4FyfIqJub4j0
	5JFXp8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGvk-00000004eyw-2Wil;
	Mon, 13 Jan 2025 09:40:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGrY-00000004dtH-3XGs;
	Mon, 13 Jan 2025 09:36:02 +0000
X-UUID: c924d1d2d19111ef82ff63e91e7eb18c-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UnlPLsCM6swCMo7KYR4BZU3Am1EH+B446keVBEFwED8=;
	b=qgJb/6JTya5P6fXseIePbTezJiVyDR1dcuudQMCxl0Wk46x+HVpn9OHZ6CTnMJeE5FQyKIE4LvuC1vW++YcGlzswEzrcuI5mUjeqt3X/KVe6gd8E/5ah7u7swYwjj8T+TbzbEPSzoShnYhAEgoh8LgQpijVV9krJoAX7co+Mxcs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:db661b53-c978-4815-8e5b-0cfbd225148d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:30cccc37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c924d1d2d19111ef82ff63e91e7eb18c-20250113
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 826735902; Mon, 13 Jan 2025 02:35:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 Jan 2025 17:35:51 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 13 Jan 2025 17:35:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3rlzC9CpnQZTmBrLypHk9JED3CxWU3Tg1Ly3DZUfz5LX3ffj6HqH4WduNluVKmZ/nHp99KwHS73jOc7Tttc/kuwZlmU2K+2GXkk5C+aCUgeewS92lHMm+Y6AWaRz6x9DFzme4+Z2uRcM8g8KaNcG+Dc2LWDdOS7Z3RenUqvwGUZASeD43cdCHQ4BbpoOgZfjryLDG6P0FWFqYrignBoG55CjnGuPuJR12uLgVV5tE3usarqRRjhzVZ1hTt0ktd2UE2nWtxWbbB/TmJBXyNL0BsWjdkQKb3uJgwFczy9A/KuSJGeC8O+V3H81mLzGYg5Ck0g90jZDZnUKzATilQJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnlPLsCM6swCMo7KYR4BZU3Am1EH+B446keVBEFwED8=;
 b=AVVaMLxeoXvPaC6dZh3sBcORNlpmp5ooYv7bKntaxDce89o6gzw9WAF6Vs5agNvrjssO44Axim6tG6B9s1gYNvhu6z3RIEU2tqSDSFv1xTC2PJ1hJJLCjM51lAEU4NrzgTxestuhB/OAIrdx6xAPhGxzjiWlAunLLYPSLsNpVLIW82zbToqaii/pSCZXnhByrAbjh2sDQCPuxinskSDoVXRcFFZkfFUgLb4JqCzVKlbXoPtPLOq5xZLvMDj8agBTJKChKiaZyuvopu/xzO5Xdwt3lvYN0I8CAXNFKzrQuCEu6C7ZhCsAoEESEr5X/y22IosrThxU/AMhI05TAK/xuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnlPLsCM6swCMo7KYR4BZU3Am1EH+B446keVBEFwED8=;
 b=VlaBiLscp8qNrzmokN6tOd1rYnOQS790XvS3ss5F9RkZxW8+P5OzbX5WSzZP6DqKrLgoqq0qEpexffm2aa/xGKp/o3D6/dSQ8Z+H3hwClmVzW3/+56mI9wtSboJxy3X6Dcf2b6MmlpE42QSlDT0Yu9RL6KXE6314qSwN2iUlTxU=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by TYZPR03MB7395.apcprd03.prod.outlook.com (2603:1096:400:420::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 09:35:48 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Mon, 13 Jan 2025
 09:35:48 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"guodong.liu@mediatek.corp-partner.google.com"
	<guodong.liu@mediatek.corp-partner.google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Topic: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Index: AQHbNc/k+/+av556eE+xAie8jxoTBbMU0W4A
Date: Mon, 13 Jan 2025 09:35:48 +0000
Message-ID: <3a2023816e2d622f2cbd22399aceae9deec0f676.camel@mediatek.com>
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
	 <CACRpkdaUYuNBANWyTcwbE2fS-STyGiV4hzOQ7rS=Q1cc2O5b6A@mail.gmail.com>
In-Reply-To: <CACRpkdaUYuNBANWyTcwbE2fS-STyGiV4hzOQ7rS=Q1cc2O5b6A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|TYZPR03MB7395:EE_
x-ms-office365-filtering-correlation-id: 7dab34e9-3272-4c32-db4f-08dd33b5a9d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFh4dlJ1TjI5QlowUjhRclZMUHk1dHM3cWZmcFhUbTVSUGExVkd6SlhTUm0w?=
 =?utf-8?B?QVR6OGRPcDVhWkJqL1IyTjhzeDFvTit1L2JjUS80aFlRdi81UnlUalIvOUMz?=
 =?utf-8?B?SzVJR0Vnbmp0a2NDcWh6R2VjcFY4cVo4Y0VOckJZRllSODRvUGthS3V1Skg1?=
 =?utf-8?B?cG9HUHBZeWR3eTJaU3J3VG5OYkR3REEzYkxiZlF1VHh5TEF2eVl5bkdPU21x?=
 =?utf-8?B?eStQNHRNVi9DY3Y5N2N0WkdsanFQZVNBdkJKemEzdmptblNIcjluais5N3Z0?=
 =?utf-8?B?dGgyNlMvL3FneThCdk9ZaCtsaE5UV3cyTjYyR2oyWmQ2ZEVRNHVoU0RBamVj?=
 =?utf-8?B?cTJLcFE1WnpIRkRlYmpDQkRZQTJ3d3ZSNS9LeUNQbWlGV3plYk95RzlGWkhB?=
 =?utf-8?B?MFFOUkRiVVZwUkhBNDduRFBRazl0N3oyS25rNUkrZnAvcUwrdUM2YmFRNWlu?=
 =?utf-8?B?bXJ1SWFrdUdTKzJZZlEwa05HcWxXMWZad3BrR3N5MWcxaDVQSVZxVmxqQW1M?=
 =?utf-8?B?aTIyK29JckliaVRPYXJNRUdmSzFjZTVwQy9qZ0JCekc5SkpFakJKUmRIaER3?=
 =?utf-8?B?SmVXcXp6M0RFNlowc0daSXIrcHQyai9rcFQ5b0FacWJDVW9jVUZQRThiUU83?=
 =?utf-8?B?TEUva29FRCttTEY0T1RNcllxbHRVcHplMzVnZ3h0bXRMdEwza1JEZFV0ejkv?=
 =?utf-8?B?MkNFQmJYWnhXQlpoaXA1djdWMjdpWFBzNm9DcEdsRUJyNmxXdnJXV2lseHN4?=
 =?utf-8?B?a1Q3d3J3cXRvMjBZcnprc2I5bWwwbTlreFRxVU9lWGhRckVqZ3diUE9DRHJV?=
 =?utf-8?B?dDUyN3VHOGJJd3pjbkhweWFJdFVnZUtxVEEreCtvaFVZZ2ZEcjRNNmVzUjNn?=
 =?utf-8?B?RWs1dHZWMmdUZVdTWjNUcDhvdUwvRUxYakttUkhJaEd1RmZTOXhWdm1IRmg0?=
 =?utf-8?B?NlR3cWJWQytlL0JJY05vdDZzTHI0d2FhdTlDNXpnblJDaTVVZFF0M3R0V21r?=
 =?utf-8?B?ZGFYcFhaYllWakhoQ0hHemdFL1BSdnljWGFJbG52aTRCeXJYU2I3MVh4bENp?=
 =?utf-8?B?THFSM3V0eW9zdlBJd1NhamlEZDhXUWVJdXZmTktFMTZEUmxLZlBQUzZBdTBG?=
 =?utf-8?B?T3pacTBza3Y2WEVrdHJiQVM3emo4dTMyK1NQbmJ6N0VObnBYS2xiRHJaeXd5?=
 =?utf-8?B?Q2NwbkJXZlZRQ2k0STdWbno5bWcwM3QxZXBRbTJYdGhGSTZxNzhreEQ1WXVj?=
 =?utf-8?B?THdQbUExc2xxNWd2Q1poaWQ5ajZZdm1wUzRvTjNVS1UzbmZFOVFIcDVhTjdL?=
 =?utf-8?B?OWtaRUh5REQwZURMbjE4UTNaYXArK3hEZCtZYmlFb0JtQmdlZVVzQmVKcEhs?=
 =?utf-8?B?SExjRlgyc09ZQUY0aU90QklYbXRkUnpvYzIrWXZpTTgvTkFQc3Q4WnhOS0Qx?=
 =?utf-8?B?b0YzUDFMN3lxZFdESURSdTZSTVNxaTFQcHVwamxWVlB4YXgwKzNpT2Y1bStv?=
 =?utf-8?B?cmlYWFU1YmFqQ3pvTzR5UXgwUXFOckJVSEJQMWZyUUtkY0FZaG5pblZ2UkpI?=
 =?utf-8?B?Wi8vUEtjSUt4ZkVZOTlxTHBHdzVZd2d6RnF6cFphMlVJRGsxa3NLbDlueVRa?=
 =?utf-8?B?MmRMbUFQNDBxaGRQdVdaRVc5N2FKV29pdG5GUEFNNVluRVlBNmFjY2JKR3c4?=
 =?utf-8?B?dVkzSk1jaWFZNk04bDN5WVFXUGN3WWhnaXVodDF6THduRU85VW5lZzBwWmwr?=
 =?utf-8?B?RnhCM1hkS25WT012anEzN1pMSFhPYmxEdVJJT2pYTGtKM1RrYVA0QjFzNENW?=
 =?utf-8?B?MEpvVUo3NmtyNTU2aTgzMlRxcUtzaEdnUDdnOERZb0ZJcGdVa3A5RlI5N0xu?=
 =?utf-8?B?cmY1ZWpvN2pUVEZtUnh6eUpoRnRoOHp3VDFMblBTZ05QeWIwQS9iL0NVM2lI?=
 =?utf-8?Q?VC7r1KPrQ4GevzT0mkAeBiHoGBjAu4rA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzJLOXhWbmozWGF2Tis1SWZxMmNFSk42K1MxSGRjckVtYkxzNTZHd1QxSC9S?=
 =?utf-8?B?OEZLeUd2a3hORmFXMTJJOGpqRWhaemtMR04vaW9rWnJrQ2paS0ZaditFV1E1?=
 =?utf-8?B?Szd3RnlDR2dCcjFBM1B6aE1WN09YNHJKbEhQRWF3N1BEdVhxU0hFTVdQdTNB?=
 =?utf-8?B?YmI2elp6bndxR1AzY1FLQ2xJeWdwMkc0bUNQSzY3cS9SZFpvL3JESndCOGUr?=
 =?utf-8?B?RjdTWkxhNzd1bEl3WUNxcW9BZ3Q1Mm1adytKYXFBQVVNemJ0MFowUTQxUks3?=
 =?utf-8?B?TmpkbThqM2dZaWlmQW9VY3JRLzdWNDI4M2loTnBQdDQzeXM2TklmdEgzcFZt?=
 =?utf-8?B?bHBmcVQ4RU9jY0l2Rm9BRjU0SVFiajVOblZINGJzcGRCdDFwOGhBeGdSZXJU?=
 =?utf-8?B?ekgvSmsxVnNJVHArNzJEREtJYlNTMWRpOHpRR3E5VldPSXBlbm1TMmNSZndh?=
 =?utf-8?B?UWVzYTFZQ0JCcWJuY0NvMUFiUXpTakxzS3l4NElpK0ZYR0pJK2llZDdta0ZZ?=
 =?utf-8?B?Si9wRUpMY1FUdkRIWVNnOGt4b2xETFZTRm9Edm5Yd0ZCSDY4cHVkN2pWeG9x?=
 =?utf-8?B?cHNvNWV0SWNGa29pUTNqcjVCd2NkdDhLSzZMdTIxdE1PZXJkajhEaWFYNE5F?=
 =?utf-8?B?UkNCSjN1TnBVQ05GVHhCZkJmajd4K1hEaTRlUTNCSGIwaytBSzdtOWhqNkhE?=
 =?utf-8?B?dm1zUlV1SUZmZXJWZExVQWNoWUtYQjRXeFlWemFucFJPeGJhclIwYTNJVDBI?=
 =?utf-8?B?RXZCaGdoYVhTNGdXTUdIVnUzczhrTFd4cG1lYXJJVnZsTklYQnpqOU1HL094?=
 =?utf-8?B?Zi9JWE1aWS9aY3BEQ3h4ZzdjdFFwY1BlZW5HMURidTJ2SHdxMkZsS0ZiaThG?=
 =?utf-8?B?cDhocUtIblFXdmhGeElNd2FLeEVLNWhEMEU3SnZ6NGdVVlVCMkVKMnowc0x3?=
 =?utf-8?B?ait6SG1XNzU0eUJHRUlZRGN2QXAxZzdqdmY2STZSUG9BOHdYVG9MMnIxNHlE?=
 =?utf-8?B?akxuZVZUeEkzRXdnUjlxaUF0bE9SQXlxSTJPR0NhSzJudUQ3TUI1T0hxU0Va?=
 =?utf-8?B?a3NYVFhpMjY0VElQUlp6YnB0VVJQWG1LVWdpVU8zYmZjc1RPNXFkRHYrMmVM?=
 =?utf-8?B?SEdFQTQrTGw4K3AySEh5OFRaTUFXdm45S1ZzL3VCZUI3ZFBmTlNtN20rNjFy?=
 =?utf-8?B?NGVQUUU4V2tUa0pTNVNNMUp5YmRDcmQ0Tmd4clZwWFh3QUg2U3JBcldqRndW?=
 =?utf-8?B?SU8yUVJnZVZIVXl2UjV0cmRQZ0R3elBYUFByaE9vRTF2Uk1lQUlxWCtpZUxi?=
 =?utf-8?B?YUVhcERwL2t5VW5LMTl4alRWSm1Ybmw3VzFtemJhT2hUcnJ2cE9kdkxEMjQ0?=
 =?utf-8?B?Z3hHcXE1Vy9uek1WK2gyeEZJUGNWMlJ4blBHTVMzRUF6R0RJTC81TTlFcGdp?=
 =?utf-8?B?TE9lbDVJUW9waVpld1RueVFFRUMrRGhFNUNHTncrZng1QzArbnRHTTBiR1NY?=
 =?utf-8?B?NUxDTTZsYms2R3o3S1ltSWZCWjMvY1kyYXVJcDRSZDlmd1JWMmt2MWNYN3p3?=
 =?utf-8?B?c003N1lpOTJYajJjdDlTenhMVUtWTjdFWkNwNUsxRHI3SlJMVWxUZlp5dVA3?=
 =?utf-8?B?OXJjY1YxKyt4bnFkMWVRY3hHblI2dHZHd05yQ2txSktERmZwVWd2T0NaUWh2?=
 =?utf-8?B?dnVwem9pY1I0d1FlREUwazFwcmpuU3FmN0dWWDQyTVhSb3ZQeGFWVkFseEp3?=
 =?utf-8?B?MzlpWWFCU09lTWgybmR0K3BpQkM3YUJFb1JvdkUyN0Fla0hhc2hRcmtlN2lo?=
 =?utf-8?B?Z1NtM01CNHp2U0pLMTR4YlBRb3FXSW1vM25OdkEwVzY5QTdpd0Fhak94ajd3?=
 =?utf-8?B?NkpLTmVWeC83QzBUNitkMlAwbWEvZlpFMDNCK3doOTRPT2hIV0p6UjN0MnJx?=
 =?utf-8?B?ZFAySFNuaW9JMnlNaGQ2M284anlwY2YvSzVMN0x2VGxKeTdhS3NwSkJaYVVF?=
 =?utf-8?B?dSt5ZS9QTDQwY1llbU5HVmhrc2JXSE5TUlFJQzZScVE0Q1EyNUl6ZVZVMnMz?=
 =?utf-8?B?WWFpVjcyZHVsOTVnVHJkSVJwQ1pJUXBhMm9WdFB5cy9XYlhGc1pJOHZxK0Zk?=
 =?utf-8?B?VnltMDF5K3ROekJSSjhCWWw5M0lxQU9uZTVQWXZ0L1Jab3RKa3RqVDF2RDJD?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9237FB878D1B2146BD2BE55F8A9F3C3E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dab34e9-3272-4c32-db4f-08dd33b5a9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 09:35:48.7950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dq2FNkJQ5VC8dkeDAT1SRr73+ChU2/2+iBxDQRjxZJ8B8z/n6Sp1OgkyiyQBIZXFRS95efE5E6QZzjdt8+q5FutZ7T2sB7TSHmJ5SYW7wyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_013600_912815_C464BE1D 
X-CRM114-Status: GOOD (  14.00  )
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

T24gV2VkLCAyMDI0LTExLTEzIGF0IDE0OjI4ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgTm92IDExLCAyMDI0IGF0IDk6NTTigK9BTSBvdDkwNzI4
MCA8b3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogR3Vv
ZG9uZyBMaXUgPGd1b2RvbmcubGl1QG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0K
PiA+IA0KPiA+IEFkZCByZWdpc3RlciBhZGRyZXNzIGZvciBlYWNoIHBpbiBjb25maWcuDQo+ID4g
QWRkIHRoZSBmdW5jdGlvbiBmb3IgZWFjaCBwaW4uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
R3VvZG9uZyBMaXUgPGd1b2RvbmcubGl1QG1lZGlhdGVrLmNvbT4NCj4gPiBDYXRoeSBYdSA8b3Rf
Y2F0aHkueHVAbWVkaWF0ZWsuY29tPg0KPiANCj4gVGhpcyBsb29rcyBmaW5lLCBidXQgdGhlcmUg
YXJlIG5vIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBtdDgxOTY/DQo+IFdoYXQgZG8geW91IGV4
cGVjdCBtZSB0byBkbyBoZXJlLCBJIGNhbid0IG1lcmdlIGEgZGV2aWNlIHRyZWUNCj4gYmFzZWQg
ZHJpdmVyIGZvciBhIGhhcmR3YXJlIHdpdGhvdXQgRFQgYmluZGluZ3MuDQogIFRoYW5rIHlvdSBm
b3IgeW91ciByZXZpZXcuIG10ODE5NiBiaW5kaW5ncyB3aWxsIGJlIGFkZCBpbiBuZXh0DQp2ZXJz
aW9uLg0KDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

