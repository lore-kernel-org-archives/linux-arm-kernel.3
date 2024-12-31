Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1092AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqYwF3kPgutY2eUXPhG4Tbmm627CvSd6YgslaKn5zU0=; b=XvHuNDEt94K0vXosOtfcHSr5BN
	ya28evRSriyCCSSS06Y+U5vnWZN/1D92nKl197hxCMHhXtxosZMDNsFcIXCkPAohG3n/sjbY9TziE
	pMYoEw+GtmG+zaA2SzuwJDWCrYeIL6QO1KOAEs1YlhKktTjdM8l6v+2TfwsWReA3WN3c83+MdofM6
	bbDZNHyv46eEQcmbY6oif7/C0SDUN2AqiKtf0FlCKuZhEhJ5K+x8qsCILoz5itFEOaAxtkvmQ1L7q
	RoQWLPaCGuZQYNzsadCuznr58ta/5A7CkTKZYdFvkAMyLxsDUIK/t7PHXBJpt/G2Ui5pGXTMlf2PW
	UiH8VzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tST0Z-00000006OEY-3TQR;
	Tue, 31 Dec 2024 03:33:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSSzP-00000006O7B-1L9h;
	Tue, 31 Dec 2024 03:32:16 +0000
X-UUID: d32832a6c72711ef9048ed6ed365623b-20241230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wqYwF3kPgutY2eUXPhG4Tbmm627CvSd6YgslaKn5zU0=;
	b=Hi1UPb8fG88geenFvuRgvkQYn8NlIOmF+QG4qS1ImyiMo60X4WILT0IzLqyN8iyRz8KoQvOrheGGTnBMN3EkEegtaMI+amsB6M1udpgN7BPKIGQuShUBTGtiGAyqks8kncvhtRBAXX8VXd1iJAxvvWeTqC6B4V71xovnCZIr5d8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4f291121-fd73-42f2-bb0f-f947f67b512e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ca4b7025-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d32832a6c72711ef9048ed6ed365623b-20241230
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1942303757; Mon, 30 Dec 2024 20:32:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Dec 2024 11:32:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Dec 2024 11:32:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9Gx9MiRcN5TeQWS7QluNyFGcyx/G/rSlgJK5Ei9y6EOoonoj5slsSx5B6OturJ0EbDDwnZzkaNnjqqYlg1k8WeJh2luuDxWrnrMwrqYZdyrQ0k7F+0Ppm+Ue0MK9UvC9SAg8TnarNyVHSmCCnutOTr+XrjpxzaDTwULezueyP04RoKR8O6be8K/a413n50UvTwVbuBct23ZLUPNnBjNqSG4CSmP36zNd5B7AhCOBzPuwBrwT1iTqK3i0kAXEto3cv7Ru7Y65DKSdVQ0gCHa2ifYet0wCoUm2k2UIr5akCTV08GKmDGze2q0GaYYVXcnKhrYH6ChHQNt2SUcUDylgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqYwF3kPgutY2eUXPhG4Tbmm627CvSd6YgslaKn5zU0=;
 b=MwIQq29YLGk2T4nZI97AS8ty2qg1ylHXbqSQ3nIGANrWDZLLnjYsGORNqblaXl5tPSsYZjl5DEOtplIPXtbHoIp4SxpIQxoh1Kav8kdDPofhyL4O2ZJ3Rfn4mhfz+8Pzm8gv/sYQ7xNbbx3eizBK70Va7Pc43APcPrEI3iAS4fVpOwyPoDtDczraOIlJLwyM+dxyIXwKWWLH2pEImPIu04VJpAHv84g8C6xrgaLhfjp/EwdtDdv9SCkJQIYSjF+hGHlsXBwg7dVHIRbnIooPwzED241kRoLeGMBPnwMPxpl5ikgE/y/AxwFv6q8fIQjbuA++tJOymkTT7prwSIGmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqYwF3kPgutY2eUXPhG4Tbmm627CvSd6YgslaKn5zU0=;
 b=C3TVeWazuBmRg5tdwnyiOgEFT26VtvgyanXTOstx3F5st4yINmIlK7WFl5eEvnac0TH+UgY1WBg30UaXXFDqiNBq2LaqZvCGkZU35Q9BgF2y71tc/xHeR1Dfp+SqX6sfcEfskDqxPhMxWofRHQOAE4CnDCGufh7c9qRvhDhaAbk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8478.apcprd03.prod.outlook.com (2603:1096:101:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Tue, 31 Dec
 2024 03:32:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 03:32:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] drm/mediatek: dp: Support flexible length of DP
 calibration data
Thread-Topic: [PATCH v2] drm/mediatek: dp: Support flexible length of DP
 calibration data
Thread-Index: AQHbRlikgJmhUARJ90eF3d8XDnneN7L/3HGA
Date: Tue, 31 Dec 2024 03:32:07 +0000
Message-ID: <3fbe65e74bc17db0182acc512ce7991b1cf75e04.camel@mediatek.com>
References: <20241204142626.158395-1-fshao@chromium.org>
In-Reply-To: <20241204142626.158395-1-fshao@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8478:EE_
x-ms-office365-filtering-correlation-id: 970ade87-ff2e-4dfe-b416-08dd294bb437
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R01qOGsraTNhZkFCM3EyQnRScjc2Q0RmbVdlbU15djd2Umg5bGd4ZG4zUUtx?=
 =?utf-8?B?eVAzL001N2tUSDkvNTgwWUdqQ2dmZldFNWtVakJ3NFdIRG1iSkpGRDQ1cUxL?=
 =?utf-8?B?bWtnb0wyMFl2amE2dWIvbTJxZEdodDd0cUltTUNUK3dJL2YrWFRDd1FRa05v?=
 =?utf-8?B?UjJtVk5LeWJCWEgyMkFNUXU5OWo4dVBVVUd1WkhLbzkyeTJpbDA4ODZjQjJx?=
 =?utf-8?B?MWZVOFhpQkNGZS9sU1dIZ2FHK3ArcVZOeDkvVTJtZVJoRDAyUkdRUjYrUWl3?=
 =?utf-8?B?eEl5eFpPb0xOekF6SU9Xa1pUbitqYlNWNzBnUC8rQW9xcTJRMjduSlMzMTcv?=
 =?utf-8?B?VWVmdHRYU2FFSlNKcjJYMG1aS1V4RWNUK2lyWldjaTA1VmZCMjc0eHpkZEhP?=
 =?utf-8?B?T3BtcVY3TmFQYUpLZmRQeXVNSkxwRlExcVl1dWJ0aUtXdmUxekdKdy9WV2FP?=
 =?utf-8?B?bUtsR0poNWVSKzRIaHBlU2UzbEZIUXBoeUNKdURPYjZVZTBoeTRiYUp5c2pm?=
 =?utf-8?B?QnViRmFWSkdxSVVYdWwwWlFJRkh0OGNpV29FdEYrMlZUMlAzdUtLUEt3a0Nv?=
 =?utf-8?B?ekhuaDErNVFGeFFoWGt6MTVsZmNSZ3FLdFZwZENPanI4TVJlajJPcUsyY0ho?=
 =?utf-8?B?U1IyQ20xYnh0NXFZWXphenFXUW1QR1Q1Uk9ZamlmYURwb1VCeExzYXpOdFBJ?=
 =?utf-8?B?emxrYm1SQU5mL0wxTDF5SzVyelloamQ1Y0xmeUYrdEFaMHNvQklYMmlwd0pO?=
 =?utf-8?B?OHd4WUhaSmZ0UmlLSTJ4S0txa1N2MWVZcWFsZmZlRFFHb1hxZHVWSit4cURv?=
 =?utf-8?B?aksyZEdVU2o5ZzRMdS92OUpOd0tlSGUzdFBLTXdtbEhNdTlwVG8xeW9ocU93?=
 =?utf-8?B?ckxrbkhwR3FTd3lFUG1pL3FFT2JZc3RZV2NFY1gzV0pjRzZYUUNNQWE4QUp4?=
 =?utf-8?B?d3haTkgxbzhtc1BtL0VpZjhhUGszVFU4VU9SdWlxOG1tKzRHdlYwc01MQjRs?=
 =?utf-8?B?TkNmU09Xc0toSHRkTW43VHNmek5TYkdFL3o4K281aE9tY1I4TFhCY2F3TU13?=
 =?utf-8?B?OTJhUWRxT3FYcE8yTSt6MXRlUEUrOUVETkRTQ0VnT3lyaXcvbmNpQjNJczdu?=
 =?utf-8?B?KzhVNFNrTVlmNDVHeHF5Wm5iT2R1YjNmMDk2ZTJiSXB2K3NlREIwbnoyWlBH?=
 =?utf-8?B?eUxIME5LNTkva1JDcXZVUFN6THVVc2RrMnZBZWk1eHl2aW9VNDlacE5kTjJs?=
 =?utf-8?B?dUtHZGZMbHJvUVR3RVpKQjhVSFFjSFQ4Z0lramNiVUNER2N3eDAxOXhwb2kv?=
 =?utf-8?B?TVdPcks2MkxwL1p3dE9yTnNPTEI4RGJraEhXc3hraHVsOGhIWE9JYmZnVGE2?=
 =?utf-8?B?NDVqVWRHRkNMQThUd0JrWUVPL283dzZ0bjdkZGNLQlcybFFmeFVMbGEwWGFP?=
 =?utf-8?B?eXh5cjNOcWo5Sk5XQithR1hyeUNvL1FpZFFNcyt3MHFZR3lnOUwxa2VNbnRX?=
 =?utf-8?B?UWxOdk9yZHVkWHVIcXlyZGNLZGp2d3k1bVE2cnVKY2puMFl0WU9yVEJxNmVz?=
 =?utf-8?B?cjY0VXNGbFZLeVYvQXcveUl6MU1rY1Q5a2ZJWCtOc1JPVWRWanVnUENjazlQ?=
 =?utf-8?B?YWtqc2VoNm45b0lHSkxzU1N4ajJEZ2JnVWJZd2NqQnhYS0NYTU1SREwvY0xF?=
 =?utf-8?B?elgzM3d2RFpaelo1dDUySlZxV0Y2STljUUl5K0F1N2lVdHgwaWdEWlRlVTNB?=
 =?utf-8?B?UnhSMHg0SUEvUEEzZmFKN1d0RW9zYzNMTTErU0tSc0IyYzBtaC9Wb3kxdWNQ?=
 =?utf-8?B?TTZ4Tzg3THJQWlppRTBqMGM2TElKa3NGQjJtZk5zVXVQdDZubkR4UVdqU1Ez?=
 =?utf-8?B?T1lZdXdNQTJoYUVuR3dhdnJBWWQvSVY5TGdnQVFUZk5GTWFkY3JrVjh5SFZ4?=
 =?utf-8?Q?YiX/aM9JP+8lEaSOTvPuxoH3BkVpQJIt?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWs0RVJsYXlUYlBwVVJuMWZRZUkydFk0ODRnLy9EZndqaGRIVEJXM2xLMnN5?=
 =?utf-8?B?U0M1WjlMYXFVaUVnalZLUzk0cnVpc3BQdW9QaWE4RUJhaG9qdG5iNy9XOE0y?=
 =?utf-8?B?bUhqZCthd1JRZ1BTeGlFVU1xaTVYZUhQZVQ5YzNjcUNiYUtPakpVdUdEc095?=
 =?utf-8?B?RDI4SXJvU0JqSnYrMmR0S1B5bE1qUHhiRmQzSUxyQy9hdjMrSzRHMW9La2Zs?=
 =?utf-8?B?S1RZdDA3QUZFVWV1SjlJZVY4WUo3S2ZYNUZhSVF0OHpFa3JaajBEQ2Nkajhu?=
 =?utf-8?B?Q2xvNGxEWVBZL2xzZ0NjblVmUVhRRjVCQThFU0dPTjdUM2RyeDFqUHIxdzVj?=
 =?utf-8?B?Q1h6Z1h0T0Z6SW01MnZPL2pSeHF4K0haT2RnK0N6WDZLZm1UUXZYdWQzaTVn?=
 =?utf-8?B?WWVnVk9CWndKWWpOZm5QU3I1UHljaUVGWmlCTFI5R20rMjJzWG5xUXJBemRk?=
 =?utf-8?B?RzRxRUY1SlpSVCt1UjhkUUN0VUwxdHBpdWpBSnFMWENEWHlmdG9CN1JwMmxH?=
 =?utf-8?B?VERUYnN2Z3V4UHVMSVdwUElYc2IreEtZYTlXQUUwNlBnQnE0QUc0cm11THc0?=
 =?utf-8?B?MHlKTTBwSGVoaHR5TjFEZnBKR1JQaXFEOE5Oa0xraGozZmN1MEpiRDErZExM?=
 =?utf-8?B?cWsxT2lwaEgzZytESTFhQzRIRmlwQXR1cnNrdHNuY2prWXI2cnZqMitta1kx?=
 =?utf-8?B?UVc5S0Mwd3dNL3RQY004dzZhQ29peVRjcHJ0QmQwZ1VvTWJYTkFYVTRYRjB0?=
 =?utf-8?B?VjVDWWJreWY3aGNQQUhielJqWllZWk1nRFpHdExDeEhNMnYrVnBmSVVhTG5C?=
 =?utf-8?B?cFV6ZlpsTmZlUVhiTFJtcnR0LzhIa2M4WWhqYzQrbHpDT3gvMG5EUHVwUENR?=
 =?utf-8?B?c2JiUWdORWcvditSS0RWNDlYdjBRSWcxTzhnd1NpR1piQW53U2NiWU9mdnNF?=
 =?utf-8?B?cW5GVkk0VGFVL2pJeGVLcldzUy81MHFUNHRKRG5CbnpXOVBNS1lEZ1JBUVRy?=
 =?utf-8?B?WGxFRlJPcFJqVHRScXJwVUh3WXN1eXBTT3ZrVHE0aHpOODVCdHFkSGtjUllQ?=
 =?utf-8?B?Z09jRVg5RGk4d1VkUVpBdUwvQXcwa0pLOTlRWS9TMW9EUlpPNmd3ejl4MTYv?=
 =?utf-8?B?MW5mZjI0UFFBbHJWdVB6M3ZqSUhXMG0wUC9KeERONHNTZDEyb3Z6SnR1TXEx?=
 =?utf-8?B?YVh1U2lRcCtLZjJSVms1TVVJWmpFRmdnTFF1U0tleFBXZUZHRWMzbGZ5dHpW?=
 =?utf-8?B?bGV3L1o3SUVTOURUelo2M1FMekJBQytpVUJ1OUtnbjJyMC9ic09rOVRGcUpu?=
 =?utf-8?B?MmVpMWRlSWxvSCtnK0p0cE1IeG1qTENmaEVKVDRXMWN4ZG9jeVVPYlRaWGJi?=
 =?utf-8?B?MUl2SXFKWFJPZDFQVjAwNlpHcHAxWU9jWklETG5MSmtzM2hGS2xCc3ZCNnEx?=
 =?utf-8?B?SDhhUkdPQlFhNEUzaXJDbUZuVUliS2FuRmloR1hkQ1pEc3NSbWR5SEdGNHRE?=
 =?utf-8?B?VmFLV1d5Z0Zmb0hVMnEwbFVHd0R2b0FsSmo4di91S2JKWXVzbFpLZW42SWxO?=
 =?utf-8?B?ekIvQm8yWEp3Wlp1SUdmcHVvUzlTNE1Qd3lXaisrS1hIdWp6TE9qckVGQm5u?=
 =?utf-8?B?ajRtaVpqUnUxUVpQYzFUVjNwd0lmbkFBK3FnYkR6RnB3elZ4K1NoUmJQY1RL?=
 =?utf-8?B?a3cyeTA3a3R0dkhxVHNPcHY1V2lBR3hMVTVTeEU4S0NYKzBoRGI0d0gweG05?=
 =?utf-8?B?R1pwSVBLK0QzbHZhOHQxQWtHR2I4UG01WEJjT2dWbCtCUlpjVlVMMW9hSHFn?=
 =?utf-8?B?RDU0YTVIT2daQzJJMGZJREcyZ3NqREoyaTdoVWRtYUZOQ2RyTVkveUI5ZjBX?=
 =?utf-8?B?bDFBU0syZnVJcGxVQTBabkhoSjNpNDVaZ2FXQmhTUmRFMXdLK0NDdytlWEJX?=
 =?utf-8?B?cTZQTVlpTzJMUjA4ZXZlTE52YnlySE9lWmo0d1J3MjdqaGcyeHVsZ2dhWDdW?=
 =?utf-8?B?Y2pNa2JxYVhsTGY5T3MyV2pjZEptWTM4ZERRNEdGS1djY0hwRmh3Mkd4cUcv?=
 =?utf-8?B?Q3Nadkk5THBGa0Y0L1FIMVQreTA3Mko4UFY3VHozRnJQRDU5MlZrZ0FPL1hR?=
 =?utf-8?Q?yH631zYvALssC4dQesKCQjlN1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97DC0F1DA58769418FCEB9E86962E193@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970ade87-ff2e-4dfe-b416-08dd294bb437
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 03:32:07.8821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnTbVNW6pSNZ7fX29c0m/4jsWM1LVPKu6XmOPCLOFyE0PDgdGwld4ohT0I0u/csaXS0I+o4i+DagR/9Y+2FFog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_193215_376868_6105B5BC 
X-CRM114-Status: GOOD (  26.80  )
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

SGksIEZlaToNCg0KT24gV2VkLCAyMDI0LTEyLTA0IGF0IDIyOjI1ICswODAwLCBGZWkgU2hhbyB3
cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBUaGUgRFAgY2FsaWJyYXRpb24gZGF0YSBpcyBzdG9yZWQgaW4g
bnZtZW0gY2VsbHMsIGFuZCB0aGUgZGF0YSBsYXlvdXQgaXMNCj4gZGVzY3JpYmVkIGluIHRoZSBg
bXRrX2RwX2VmdXNlX2ZtdGAgYXJyYXlzIGZvciBlYWNoIHBsYXRmb3JtLg0KPiANCj4gVGhlcmUg
aXMgbm8gZ3VhcmFudGVlIHRoYXQgdGhlIGRhdGEgaXMgYWx3YXlzIGEgNC1sZW5ndGggdTMyIGNl
bGwgYXJyYXkuDQo+IEZvciBleGFtcGxlLCBNVDgxODggaGFzIGEgZGF0YSBsZW5ndGggb2YgMywg
cHJldmVudGluZyBpdCBmcm9tIHBhc3NpbmcNCj4gdGhlIHByZWxpbWluYXJ5IGNoZWNrIGFuZCB1
bmRlcmdvaW5nIGNhbGlicmF0aW9uLg0KPiANCj4gVXBkYXRlIHRoZSBsb2dpYyB0byBzdXBwb3J0
IGZsZXhpYmxlIGRhdGEgbGVuZ3Rocy4gU3BlY2lmaWNhbGx5LCB3ZQ0KPiB2YWxpZGF0ZSB0aGUg
bGVuZ3RoIHJldHVybmVkIGZyb20gYG52bWVtX2NlbGxfcmVhZCgpYCBhZ2FpbnN0IHRoZQ0KPiBw
bGF0Zm9ybS1zcGVjaWZpYyBlZnVzZSBmb3JtYXQuIElmIG91dC1vZi1ib3VuZCBhY2Nlc3MgaXMg
ZGV0ZWN0ZWQsIGZhbGwNCj4gYmFjayB0byB0aGUgZGVmYXVsdCBjYWxpYnJhdGlvbiB2YWx1ZXMu
IFRoaXMgbGlrZWx5IGluZGljYXRlcyBhbiBlcnJvcg0KPiBpbiBlaXRoZXIgdGhlIGVmdXNlIGRh
dGEgbGVuZ3RoIGRlc2NyaWJlZCBpbiBEVCBvciB0aGUgZWZ1c2UgZm9ybWF0DQo+IHdpdGhpbiB0
aGUgZHJpdmVyLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRmVpIFNoYW8gPGZzaGFvQGNocm9taXVtLm9yZz4NCj4gLS0t
DQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIHVzZSAlenUgaWRlbnRpZmllciBmb3Igc2l6ZV90
IGluIGRldl93YXJuKCkNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMg
fCAxOCArKysrKysrKysrKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBp
bmRleCAzNjcxM2MxNzZjZmMuLjU1NjcxNzAxNDU5YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHAuYw0KPiBAQCAtMTE2NSwxNyArMTE2NSwyNSBAQCBzdGF0aWMgdm9pZCBtdGtfZHBf
Z2V0X2NhbGlicmF0aW9uX2RhdGEoc3RydWN0IG10a19kcCAqbXRrX2RwKQ0KPiAgICAgICAgIGJ1
ZiA9ICh1MzIgKiludm1lbV9jZWxsX3JlYWQoY2VsbCwgJmxlbik7DQo+ICAgICAgICAgbnZtZW1f
Y2VsbF9wdXQoY2VsbCk7DQo+IA0KPiAtICAgICAgIGlmIChJU19FUlIoYnVmKSB8fCAoKGxlbiAv
IHNpemVvZih1MzIpKSAhPSA0KSkgew0KPiArICAgICAgIGlmIChJU19FUlIoYnVmKSkgew0KPiAg
ICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiRmFpbGVkIHRvIHJlYWQgbnZtZW1fY2VsbF9y
ZWFkXG4iKTsNCj4gLQ0KPiAtICAgICAgICAgICAgICAgaWYgKCFJU19FUlIoYnVmKSkNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAga2ZyZWUoYnVmKTsNCj4gLQ0KPiAgICAgICAgICAgICAgICAg
Z290byB1c2VfZGVmYXVsdF92YWw7DQo+ICAgICAgICAgfQ0KPiANCj4gKyAgICAgICAvKiBUaGUg
Y2VsbCBsZW5ndGggaXMgaW4gYnl0ZXMuIENvbnZlcnQgaXQgdG8gYmUgY29tcGF0aWJsZSB3aXRo
IHUzMiBidWZmZXIuICovDQo+ICsgICAgICAgbGVuIC89IHNpemVvZih1MzIpOw0KPiArDQo+ICAg
ICAgICAgZm9yIChpID0gMDsgaSA8IE1US19EUF9DQUxfTUFYOyBpKyspIHsNCj4gICAgICAgICAg
ICAgICAgIGZtdCA9ICZtdGtfZHAtPmRhdGEtPmVmdXNlX2ZtdFtpXTsNCj4gKw0KPiArICAgICAg
ICAgICAgICAgaWYgKGZtdC0+aWR4ID49IGxlbikgew0KPiArICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfd2FybihtdGtfZHAtPmRldiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIk91dC1vZi1ib3VuZCBlZnVzZSBkYXRhIGFjY2VzcywgZm10IGlkeCA9ICVkLCBidWYgbGVu
ID0gJXp1XG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbXQtPmlkeCwg
bGVuKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUoYnVmKTsNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byB1c2VfZGVmYXVsdF92YWw7DQo+ICsgICAgICAgICAgICAgICB9
DQo+ICsNCj4gICAgICAgICAgICAgICAgIGNhbF9kYXRhW2ldID0gKGJ1ZltmbXQtPmlkeF0gPj4g
Zm10LT5zaGlmdCkgJiBmbXQtPm1hc2s7DQo+IA0KPiAgICAgICAgICAgICAgICAgaWYgKGNhbF9k
YXRhW2ldIDwgZm10LT5taW5fdmFsIHx8IGNhbF9kYXRhW2ldID4gZm10LT5tYXhfdmFsKSB7DQo+
IC0tDQo+IDIuNDcuMC4zMzguZzYwY2NhMTU4MTktZ29vZw0KPiANCg0K

