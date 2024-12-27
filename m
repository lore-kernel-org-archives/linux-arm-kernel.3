Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=; b=GJ4j7x1g+kOjX07/RzmLKyCJE1
	Eq8xMuYCaIIVbLsqQ549W1OD1wHHD8ZiPpqniWe8M+RSJUCM/m4kvAA3pTF/BA4JkCAlZ56XV2JNL
	WHmH8y4jgEsn/LxUm8FH9l39xZujJ9NPLMFIYOrD29pNGuA5hnbUrlpvOkCDBi6ynSt5XNJwoTkdy
	c8eCTCsqe1BFuqcaeZzx0UnzFhmkACvBW+uSrQuc6brDy8ep0cWFZscoGTvbTzFNDYjuBNqOEuHQ1
	PfvX2MMKi/SllzifmL/AfcL0bamERYSBAdrbpWU9RoPYuD+oHyzLJVjFzVBs3PmlWoxt97ux8YoF+
	td/Cjomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR3M3-0000000H7yT-0kOk;
	Fri, 27 Dec 2024 05:57:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR3Kq-0000000H7pi-1v5m;
	Fri, 27 Dec 2024 05:56:33 +0000
X-UUID: 4e45537ec41711ef82ff63e91e7eb18c-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
	b=QfVVbWowCNxUG7FjTiQNDxh91nAuaCZbTFNqARO85JFAjJgl99Z2BrOhOl1UoedllcQnKeL+RkAAD09G1QyiJ2ku4vvGV7wIx98wAT9LPWG3FRJ/PogFn7NarXSMAQupTd3rsEqOHMFapP82F1jOSwQGAludBnjClXUdZ+TlYzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8c62ff4d-95ad-4e54-b793-c5f1696f7547,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:87e5f836-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4e45537ec41711ef82ff63e91e7eb18c-20241226
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1810154720; Thu, 26 Dec 2024 22:56:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Dec 2024 13:56:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Dec 2024 13:56:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eit+1ZfZmHaqOK2lM0+NEnbU+sWi0G+McFk/UgQssUVQNRmy5xMUKg2WIahf5vDKlhu68KMN8TulMheCavgiKearQ/UHsUb2sWdWn5lwkU3tnbAsOut+vtj0fLgWFJ8zh7F7NkA59LaTqDHeI9zkbSrX3OAEL/uLWxZk5BXVLndO9jHsYqGSn6/VHnQxfgV7Jt5IklddYsLPMIzBs78qdhTFhL7jnEATncoIOOK/5vF5ZJLZc/QNIJllbzD4hE5ThXDUdKkXoWlZ7PemCILzsxDpb8oDbRL3RtFHpZgLhztoEvP//G5LeKukXTfH/3+I6y+LdVVLq2BRTbQACXRIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
 b=q8JULTn/LqvKRjj6jquCTP5YFIiZtUtavXXDU1wQuNU70TOvbcD84eixfEkd/GymRzzYnjDxg6FI3kdx/z1kiCQQ8axsXhkjXMLruSqv7QvCd4LAn5zScGutKvKCYHKzAdBSQyu0Bok5Wy3GBq7r9ZMCziX6U/+pUtvzobMxKJkLEaKYZyEqPyBg/kXyF1BFon0fxB9ckIylqoeS41GRG015cFCiA3+AAtVUQZ3eCslrk6RamMWWoYNf6ou++VE6+yEbTF7yfd88L+yXDYVlkkpYHxpHaSVRFmPLMvD3vBo+uiH1iVVoD6VCmQm9oO2nsKIX2MvXwzozZgzhwsNfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
 b=TNPhQoemKaNEpG3vZ4+jwdW4vx1QO4ZXhotehbchbxRPzWg57PoW9LpD9xrpzdXlv+nCQ05b8PULhrqk9YtZ+yhQrR3RpPxLX+m22vLIrNciORlyd2R3PbgVwB/dFFKe1x4fPdVLCFCmUzEs1pZXv5fPeV92Fn6lboqxnmFLiMg=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB8728.apcprd03.prod.outlook.com (2603:1096:405:66::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 05:56:18 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 05:56:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5mr6A
Date: Fri, 27 Dec 2024 05:56:18 +0000
Message-ID: <e2c20204500252aaa20f1dc813547fd9d304d611.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB8728:EE_
x-ms-office365-filtering-correlation-id: 35911cde-d6aa-4ab5-72fe-08dd263b2ea9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjAvM3RZNURCclF2UzFvYm1zYXFwejFpQ0IrdFN4cGdUa0huVkRqZXNtY2NS?=
 =?utf-8?B?SVJOeCtWUU9YSUJhbjErNC9nN0ZKT0FTUEF3Qm1pUzBIZ2lBOGl2VTBOUmZW?=
 =?utf-8?B?dTVtWkRzVXB0R0dMUmhIR2JXREtrTXdnY1ByaUM3ZmROWGZJNWMyclpLenE3?=
 =?utf-8?B?em5hYThENUNNaGZYWm01RmxXN1QzMUlHeFZ5Nko1WjE1Skp0RGttS0tHbDFh?=
 =?utf-8?B?d0pNcmwwaHFMRzhEemR2bHpLUjNhbDJKdU93TUhkMElkSzdtUldRYTZDTkVm?=
 =?utf-8?B?RXIwdm9WNWsvS1VaR2dYTFc0N3JhQnFxNVhIdFZ2dmRRS1hCYnJCaU1MMDNs?=
 =?utf-8?B?dmFKUXdvMnJJb3ZvUGZUYXZNT1dEdDdsTFQwQnc2Uzl5SXBDZEV5LzlVQUxl?=
 =?utf-8?B?blZ4cXdlcWFQR29PbnVKaDRFSi9qMkpVRVdyN1hDRkd0ZTlxeWV1QTJtRm1n?=
 =?utf-8?B?c2JpdVMxSVdnRXBxbGJxUUpFTVhhWnpkRjU2SjFkSWFPOVdxWk01dlM0eCtK?=
 =?utf-8?B?MkM0cVUwa1Y3aXNEUm4zRzRabkpZS1ZJK1c3VHJObXFrWHRpZ1UxZytUN2pT?=
 =?utf-8?B?UVRTY3ZUSmdzcmRlbEJVY2h4U1o2TFBsbjYzako4REdKa0xXYzhVMm9EbHE1?=
 =?utf-8?B?WlY0VlNUVW1OVFVtandRUXRMd1Foa0JlM0s2UEJFcTdXSnJ2Q1krMFlRNHBB?=
 =?utf-8?B?emRrWEw3UVV0QWNGeFc4NlZDcldwMFh5Skt6WmkyaU5USVNGTXB0ck8yVXBL?=
 =?utf-8?B?aFlvMHMrUnA5eUdBNVVteEVZWTNHaGFhK0V3Wjd3aWQ4Mk4yYmFLN09zT2Z3?=
 =?utf-8?B?MHpkQy90dXF1dExrcFhPQklTbThvRUpxVHRwWmcwSGVEa2YyT3FkRFFla1cz?=
 =?utf-8?B?QkhQT2JGckxiU2xQYVM2Wi83b3VPUFhyYUpiRWFDOHdWRGNjSldKc3ozUzJa?=
 =?utf-8?B?M0QrcXkrODBtL3IvNjVIQURObDdwRUpqN1FMaEVmek55NnRjRDVhcnJqdlJv?=
 =?utf-8?B?WmVUNlc1dCswUWNiWFYzRGVkb2dMcjRCVVB6WHR6NTVyN1FtNHpiZHB0Vk5i?=
 =?utf-8?B?ZHE0Qmd3aXZ5dytUNVJiTEdESnRUaHFsRHI0dTdqd2xYQTlZdGRtVXJ2YVZ3?=
 =?utf-8?B?VGlWUFRxb3FxTzBVb0g0bFFXWEFNcHFUU3dPZGMvTHk4YlQ1L2RqZm0wdXkr?=
 =?utf-8?B?elpITnRlc2swdmN6Mk83WjlraFowMmJpT2hjYitjREZVSnR5eCs3eGxiYmJo?=
 =?utf-8?B?Skx2dGhiN0o4dVNlZW90dEFzSi9vTzhOa1ZVT25xVG9rZjQ1WHBPQTl6Nkgx?=
 =?utf-8?B?dFQwWXYrZ2YzODYxVC9qejRrcnZuaXd4QWtrVUJ2L2Y2YnpGTCs2MUZtbnI4?=
 =?utf-8?B?OG1LZzhVUHF6OFZwR1Bxelg1d2YzaEFrdUNvZHk0Q0pFZjhoMkQzY2gzRXg0?=
 =?utf-8?B?SnJYK0pNZkwvL3FGS0ljOTVqRjBtRTVQdUpDVzVydEQrcDRXYTBXS3Mrd0V4?=
 =?utf-8?B?WDVPd3dtV3htWTFUaXROQldDMTc5bDA4ZWM3ODlneWpDdytxbHdrT0VDWDJj?=
 =?utf-8?B?RmY3L25jUEpEQmRzQ1U0aUtIN3RFbGJkeGRaUjN6NkI3L04zdXZaWUR5UFBM?=
 =?utf-8?B?WXpadDMyaDlaakY1V0E4a1RGbWpVbmcyN3hhY29MQWNVeDJhTElqRWV2QnFu?=
 =?utf-8?B?dnY0MTZrTjk2ZS9QdktNQVJKdTNENG5HV0FMNVRBVCtydEIyaDVTclBFU0ZV?=
 =?utf-8?B?ajFHczREa0RGRjNHV3FyaENCeGVSUC93dms1SzBzUzRHUjM1UXlBaCtmc2ZI?=
 =?utf-8?B?N3hhSWp5TSthMExHNmhXSVRTekd3TmlMUVNwU1dFL2Y5WTJ4TzQyVzBMYzl2?=
 =?utf-8?B?Wk93ZUJxeGZnckNHN0p1QUhzVER1N3E4VUhkM29UYmZwZFp2S3A0VEhDOEYw?=
 =?utf-8?Q?Pu+LIP7aH2HRbNKi0dKuLHwBAiXA5Zmg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mnk4TXV0NS9adGtRUWdNdlMza2lDQTdTc1p1Y281WXdZSXRPcnRpTys3SzFC?=
 =?utf-8?B?OWZPM2VZK1BRaHdHLzNHYXJLS0EyRGM1TFNUeGFjSjBQZWlPcElLUFNid1hX?=
 =?utf-8?B?RlRFKzVMUTg1bGlhOVVOcWxpSFBid1Q0M2dmNHMyRVJvcnZnbU80SWE3aFFH?=
 =?utf-8?B?QnUzWWRtdGdsdnZzbHFXYWpGc200dVlIcnY5SEY2cnBkbjE0SEV2NENhaXNl?=
 =?utf-8?B?VDJha01nYXJDazgxY2dDeGF6WEZ1eWpNREhxeEVYRkxEbUR5QmQyc0dIRFdJ?=
 =?utf-8?B?ZHpTUXVRL1VlL2N2WWt6TnNtTUE4SlVCNWlkSlNkVk0rb0NsaVlsWitaclN0?=
 =?utf-8?B?OXUyTlY2VVFtYSthMWlpSCs0MVk5djBFaGFleHdJM1c3YlBaWFZHYnhGTW0z?=
 =?utf-8?B?RW1FOG1GN21iYW9UQk1HMXo2K1ZGT25wTks1YjVWVXNwc0ZIVTZ1bW5WTmFF?=
 =?utf-8?B?aFIwQmgzeUVqZWQzd2I3RnNTYWIrWDFORlY0a05Kd1ZZbG1SWXg5R3lHNFho?=
 =?utf-8?B?bWJjcU1pdTRsczZWZm9wTkhDTzVNMVJrWnpIbEJMbHRCYzRYT3hXZkFjcHJs?=
 =?utf-8?B?Y3lJcDloM1Joc1ZzL0w1dDVvZ2V1OWtBWnRVaFV2ZGZpVUVKTUNEaVVldVl5?=
 =?utf-8?B?bTY2eVp4WVNVWGhmSjh2SEdYY0tSSG05TUh6RGYzTS92RjNncTBxdDVhNENm?=
 =?utf-8?B?bFBJTmJJbUx6Mnc3QTA3Z0JCMERKcmtWOTdOTTlxSmV0ZkpqRTRmYVVrQU5Z?=
 =?utf-8?B?ZE1uZkQ1aVFlYjhQdGYyaldSTGZLVGk0WmJ4Y0NyRnJPUnVqSHI3dGJlUDZy?=
 =?utf-8?B?TkNZdE1wdkswYmsySkVrWUxwRzZoT0ZwaEplamFaTWFmSkNVNEZlTWFUYm5M?=
 =?utf-8?B?b3l3WGNhOFJCMFQxUDg1OFhnTno0QndsK3hhTEVWbkQ2RGVIaVllRG9ic2Ux?=
 =?utf-8?B?SkpxL1ZjVjl5TzJVM2FJREgyRnJiV29neVAwclNKVEpJZ2RZMVAyVzFpdHcx?=
 =?utf-8?B?MmxYVWlyRG9GSlZ1MTNiSkVueEV6MFcrQkxpTW5UbXZPOUpkYXRrNllhelY1?=
 =?utf-8?B?aENLb0hCZGhHYS9wc1laL3BYcW81WmRjT3hqVGVDWTgzTXgrTWZjSUx1SVds?=
 =?utf-8?B?anRZT0xzK1djOTgzZTZvaTdxRXhnNjdndnMrZjBFQzE5ZjFWSnZQQW5wZS9U?=
 =?utf-8?B?ZWtQN3VRZzNGYW9aQ2xMWit1NEhkUVh2WlJtNWtLM29VQ3p6eEVtNnhsclpv?=
 =?utf-8?B?ejRlV3VVQVZ0L29UeUtWVDAxV1V6OVpWWjFlNGFWcXNuRDVIR0V0SHNWTzRp?=
 =?utf-8?B?em9VNU5qeWdNTnZjZXkwY05EamNmYk1FdHJQcmU2ZHA5V1ZaTmF2Mm1wb0x2?=
 =?utf-8?B?cGdGb2NNTUVLWnM2MEhnNnRRQmZwVkM0ZytiZEZXUHcvcWpuQXdqZXlVVmZr?=
 =?utf-8?B?ajJ6dVZVUlJqN2ZxUGxMUUFXSXY2YjFxd0psdjZscDdiZWpGLytKaEZGZlI0?=
 =?utf-8?B?YUtiL3k4cmJtekpPOTVVR1ZKcGhJQzk2QUJCOWJUVFl4Rld4VFREcVZpV3hs?=
 =?utf-8?B?ZGVsTkU0TE1EYmJVcUtySmw2V3VqaTZ6eGhOSXNhbVBybzZEcXFVZGtzSDFh?=
 =?utf-8?B?bXNxZDkxRzFGQzRxV0dGejMxQ2ZranRTcVpmRjRMOU9zUC9RYkJZaWNWaGFD?=
 =?utf-8?B?b2FVVHZrM0VSaThZNVhNR1lNcm1GeWVySzdYUzlsb2F5enJIRXhoL3lBQlo3?=
 =?utf-8?B?K01iSmI1MjVvZUVWRGdFSHQ5M1NxMEt0eXc2RjNKdEdSUi9xeFdYREw4bVZZ?=
 =?utf-8?B?Ump5azRQb1o3M0tJb295WUgwWjJQTVZuOHJwTlMweG85ZTZtQjdkbk1TVkNV?=
 =?utf-8?B?Y0FVNXVDQU1pWWt0Sm5WZEgxSWxGYWk5dDE1eDlxMU81M2N2ekVlSWxqdEU0?=
 =?utf-8?B?alpzUXZTNndPZFRhRzZTYTZ4ZkRabmQ2QkxzcE9HWG50dzNUNGphZk03N0tp?=
 =?utf-8?B?WXdRK1p2dFpxUjJPRHp2YWdRdmpFTzlIZE5SQzVkeFJXTVZMeHp6STh0eUxk?=
 =?utf-8?B?d3ladkZxaGprLzdURGtaSXBLTXBjenNJb2txM1ZOQ2FIbGlMRVJzYjNoNWIw?=
 =?utf-8?Q?wieJcqCztKiPCgYY5/+o8jZfl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B11D5DC06435004AA12878D806C76CE8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35911cde-d6aa-4ab5-72fe-08dd263b2ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 05:56:18.3711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GYX3pnQGnADz9/Q7bU7cfXP4fIFiGxf5swMIkfMhPb/2il+0GI5GgVsNbt3GUovHVi8TtGMzdHHYma1xT4hKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8728
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_215632_525507_DFB83738 
X-CRM114-Status: GOOD (  12.15  )
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

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IGFpZV9jb25maWdfZHJhbShzdHJ1Y3QgbXRrX2FpZV9kZXYgKmZkLCBzdHJ1Y3QgYWllX2VucV9p
bmZvICphaWVfY2ZnKQ0KPiArew0KPiArCWludCByZXQgPSAtRUlOVkFMOw0KPiArDQo+ICsJaWYg
KGFpZV9jZmctPnNlbF9tb2RlID09IEZETU9ERSkgew0KPiArCQlyZXQgPSBhaWVfY29uZmlnX3ky
cihmZCwgYWllX2NmZywgYWllX2NmZy0+c2VsX21vZGUpOw0KDQpUaGlzIGNvZGUgaXMgaWRlbnRp
Y2FsIHdpdGggQVRUUklCVVRFTU9ERSwgc28gbW92ZSB0aGlzIG91dCBvZiB0aGlzIGlmLWNhc2Uu
DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJCXJldCA9IGFpZV9jb25maWdfcnMoZmQsIGFpZV9jZmcpOw0KPiArCQlpZiAocmV0KQ0K
PiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlyZXQgPSBhaWVfY29uZmlnX25ldHdvcmsoZmQs
IGFpZV9jZmcpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCX0g
ZWxzZSBpZiAoYWllX2NmZy0+c2VsX21vZGUgPT0gQVRUUklCVVRFTU9ERSkgew0KPiArCQlyZXQg
PSBhaWVfY29uZmlnX3kycihmZCwgYWllX2NmZywgYWllX2NmZy0+c2VsX21vZGUpOw0KPiArCQlp
ZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlyZXQgPSBhaWVfY29uZmlnX2F0
dHJfbmV0d29yayhmZCwgYWllX2NmZyk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0
Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCg0K

