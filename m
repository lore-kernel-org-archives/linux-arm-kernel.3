Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273DFFD461F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=; b=GbzqsKX0jLAR18iuHQinddAXpO
	Dp0OZFe/tmt24f6UqBhkOLriar3Vselnoq3f8n7mdZAeE+Wbrr258UpEwnjRdW2+3vRU9VoTksy9S
	cZQr2dVT6+/Es4ym7kp2QelTNoLkchPIQn+9F1H8GIHBFhrk4FyJiRs1Rz7/da0MFFxbcXpDkwgnq
	oZ3Fco/W+JDwiHL812MlcRk+eyY//wxpNiE9hIFqZJne6qcH1AgHgecaBwP7fn8nMlmPkVLHao7Od
	iQxH9f6HTNZY4iXDC7fkwDpmFJCQRcC7idIN6Q6lXZPGR+wteGxGurdLomD+d8+FjA59U9P0Pcx+t
	DfZAqOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUnl-00000005Up5-3bXt;
	Thu, 26 Feb 2026 06:24:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUnf-00000005UoD-1iC6;
	Thu, 26 Feb 2026 06:24:44 +0000
X-UUID: d0a82c2e12db11f1ad39f32c34db0b1c-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=;
	b=LlHGG3OZOPyM4Um0AhyPFE0FYS08T0GK0Q9CfdUNKiwa3YFI6b+dDiYGz788x15ioT20rkh8M1fPo6QkvqsYluNolEptcuhtYyAAiFrPWH0mSJ2TEVhIvYw0Bfsy/JJGGWOhEVwhg/n/xi1FbvGCB+F5z6CqEv/6RfjMjJlhCT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f899f907-c59e-4ff5-8535-611ecf522991,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:1812a15b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0a82c2e12db11f1ad39f32c34db0b1c-20260225
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 639688779; Wed, 25 Feb 2026 23:24:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Feb 2026 14:24:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Feb 2026 14:24:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWz5sMn9z4u5l3rTgqmqUNy0cnAdisirylNgeuvOCRYtqkoMVjA74uOHW5K0hypILHl1PwC9yFnHGGddGpMLHLtja9WHB9Ud9OmYK6GZLO+Yvw202TP1WkkddaCcKNcKE5rNJjFT79qFOb3Vli9TI9MR8YcOPvIx1CjotaJyYDZcveZtDQDtFQtDRSxMuRtEBrQC3nrPgV/Tpd8WCOeTrCGy1AB39QP9PztpOk7CQgXikyIOYi4m8F3oguVDIU2VmPpN06cXAJkcKAnykihs/pbT/Z9xJ9TcqjfUzULX6DZNucPJCQJPfX9gSVeRJqAnQV0imoI5I7MAgqGtPP4iAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=;
 b=Zft/p9zhYkNtSCGW6GjI6L9xBL1RbXueplbqhJc3ILxSw2n3vmlCZE6nn8F0t7tojz/Xh3+goPKnsyIVOiAX+hqyGQk+3lw5gS8WJdfAoWEp3MXHoJ3h6G2yd5GPpVEPqmPKhjiyrn5I4Dn06Rl9YiDPaWuY1yOoZAYmHM5cg6zx/bR22cQE4gXJVY5m3aCUkg+6qLbq9fPQ3OrAGiYWzsIWLMVuswsdrw3TEwzqumKaDzHsaji9XUjWR4aXExUcKlIMnYLtqg8ZRvHNZKETNEwp0iZZ9TdIr+5r0GdPqCouFvcJsyQ7Nlk2VP2MbBggMvxyYZptEssFomTi1IhHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+KZwufMJ11ICfhycSv6CIttDGX/0xr30fwSvo/mIBM=;
 b=hkrLnb238/Ddwa7XuCZxRcnlYzJwsUc48nR2sxGRNXJPTUu4ySR9Yv+6Y/LuVD056aodeXgFjIYwg93BjxBhJk8/8zB27KyLek0NusyVaAEOL6HJI+tTeFq/2Ps+E0c2oYSq998q338dnni3mMhnZPB1nSGXMa3So8Udi7U/q+s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7710.apcprd03.prod.outlook.com (2603:1096:400:3ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 06:24:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 06:24:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>, "Nicolas
 Prado" <nfraprado@collabora.com>, "harry.wentland@amd.com"
	<harry.wentland@amd.com>
CC: "wiagn233@outlook.com" <wiagn233@outlook.com>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mripard@kernel.org" <mripard@kernel.org>, Daniel Stone
	<daniels@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "kernel@collabora.com"
	<kernel@collabora.com>, Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "xaver.hugl@gmail.com"
	<xaver.hugl@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Thread-Topic: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Thread-Index: AQHcdETgu5VPqU2x3kSZZ+zVV6eomrU5AF8AgARNwICAAffWgIA2YfiAgABIbQCAHvg4AA==
Date: Thu, 26 Feb 2026 06:24:27 +0000
Message-ID: <3efaa7ec40c68f0d463da00c3a57474a40d4fdae.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
	 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
	 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
	 <20260206110901.660cf712@eldfell>
	 <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
In-Reply-To: <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7710:EE_
x-ms-office365-filtering-correlation-id: d924a7af-ff49-4606-b045-08de74ffb138
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 08kXm8clyyQPxs/uKkuomoscfUIuFyvrnUzosTPdWIbXL8XqAgYrjNfes8z957MyzC3bWJr+OpbyMs/KoqOX0nxAv8W6AlHqZzeKghH5w3+0WYBJtHB0c023PhAQT9DB1NtcA1xnrpYMBFD6OycD+jBPTarG2B3SoD7tbfIJDekfWPuzpbzi4AjgCVQ4MyIOhcrRSSbGTod6t6TacjDKCgxsKYuvXZ2xqGV0TsyzQqQShGgCkWtF+Psd0CmdfYZraILEf7Sgu7Qa4CEYsHcGSc7wuIosYJy1WSjv/Vzoi1+XRLyDVeiTv/i136cu0b2Vg+vAwt7Q54vLboDV+0DPHZT0MMoFc7qJ/375bvGp7rEMrkCsMc6tft2L8wj7R3vllmaFFi96zcYGXwPfloaPdj1JkOCWv8H6klp4qOakJVlBTRx4uXLOcDaijOjo9GJPWk3Z3mjQwePOQELq1Cs+u9mjOFhICTmWEkS33HYKR/B+CHtgpO1S8OGfDxeFIv9D0ysDQOn6cHZBZHpyTI2nq8flv9UThlzxguRdHvJDpSVAAEKiywK1o519DIOOuEO2ZQaXgYyupNezF+IYQBTULCgBGs5z4CP0Sx/BnjynMuFr9pXW/N+3KWfmtIOGu2Uhub5THaSnVqidl6XSRsNqdVfaClvrMa4pTWwWaClIs1yTLSOJiMhVt3ssoJdIL77dN060kcWoYgMYT3m8DH/OiB4lPMXCVgRAcQawb9LFY/G7vwwRIlnOdKU3ttJTOGVI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS9PQjVmaWIyeE50U28ya05CZ0l5bkd1THJROEQ5TmdHS0RkVnZVQ04rRjVt?=
 =?utf-8?B?S2JZRkp1SHFTbzF3VHdqbW00N01SMGJia1RTT0tjdzNJYXc0czZxdUU3UU02?=
 =?utf-8?B?MzhIbXBxOHJqZGV5enljc3hIRFRqcnhlZlBsQU13eGZMUXhTKytINlhoTmR2?=
 =?utf-8?B?VmVDZk5YbFhyVnVpTUJQcy9XcUMvWmh5Vlp4OHlySTI0WDgwR3R5bzlUQTNC?=
 =?utf-8?B?MEwxRUdIQUFUdm54a0d3WDdMMXgvM2l0T0p0MHd4SWpkYVJTQVpJN01sRHFy?=
 =?utf-8?B?bnhUWWxpZ0FycmVJbHQ2QUlPcUdabWJMdHQ0Um00YVFlV29Sb1ljQ3VMTDhR?=
 =?utf-8?B?ZE9DR3pTaXVvQXY2UmhacVhUVTQxTkpMV2FBcGZ3M2QyNWN0UzI4ZHJHWDVC?=
 =?utf-8?B?SDc1SlpPb2J0dHVQR1hEY0d2NURSQVdTT0VqVDJGVWFjOEVGUm1EenhFemRR?=
 =?utf-8?B?cnF5RFgwM21mWExCaGt5eTl5NVVDc0VxV3E5dnhnV0E4WGt3Y1ROaEY3cUVt?=
 =?utf-8?B?dWlLdGtrMkFjZHV5cVRBN3p2azY0K1VheExKUnhWQTJnQmJ4dDFSWHhiSXEy?=
 =?utf-8?B?Vmo2SnQrdnZQb1RJb2ZxcWlxMm9SbUdoQUxUMHlIeGd1enN0M3ptanBud1lm?=
 =?utf-8?B?VXRQR3hhTUNEell0LzhtSDFwM29NUURrcEVkSzhsN1NBejBZYnVhcUJjSXNP?=
 =?utf-8?B?TE9ncnQ2aW91Q09NcC9kdkRHUmlmR09CQ1lETTJGWXY2TlNNV1dodmV0WENW?=
 =?utf-8?B?bmp2MkYvVFJpN1llVWdPNzFYcHVFWGRMQklKSmRsak42cFFJYnVkT0xUOS9R?=
 =?utf-8?B?citvK2NoaGtSa2lZV1czb1hISlVhOC9uejBTQWpjWlNPY0VyY1Q2c3VheGpq?=
 =?utf-8?B?L1EwNE9Da21hallBZFM4cFc5ZlNvaFdGRUdQeEVOUVA1ajJBa3VjQ1BjQkx0?=
 =?utf-8?B?a0w4MFJTVzVqYWJncGo4b2pkZ2JNcjBiM3l1UEJjaUZzdUhIQitoNGt3MlJ4?=
 =?utf-8?B?SWd2cFFhSUVBSStGb3BJbnFzenJrUndVK3M4YXlWaFhyQmdGbkZGdVlBWGlZ?=
 =?utf-8?B?NmY4dFVXaENQU2tDK1RwZ2F3dE50REFGa3QwemRZZXRWeDN3dU9xdjNuekc2?=
 =?utf-8?B?b2JJK0poakJKZ0J1SFdyZGU1UGkrV0J6cms2VXRLNjRvR09haHRwVjlWcHNx?=
 =?utf-8?B?Zm1MNS9lSkhFVUFXRnB2ODhyWEw5aDRUa2dXdGgzeXBTNXBROXdybzk5K2lH?=
 =?utf-8?B?bm82YjBNYVErdC8rRk9XcHJKVjViak13eGRnVC9yWml0WllVMmxvODJnc0hw?=
 =?utf-8?B?Q1F4bkd5UmZKQTBrbUwzWEhRdERnZnlXZ1czWjlzdkVmcE9wZDBhSnZvcVMw?=
 =?utf-8?B?dmNkTGYwcHZpUVlINm45d1ZQNjVKb2VrM2JRZC9WYUt0Y2E2TFA5Y3ZqTzdQ?=
 =?utf-8?B?TlFEcTd6bGZISnpxak9JNmh0N0g4eWN5K1FmVUhpWGQ5anowaEdMaWVaZmhE?=
 =?utf-8?B?OXlaREZDODVnNTFwelRjRlZZOTJpK2k4VGo1NHhnQXpocnpmMWhvSTF3cHgz?=
 =?utf-8?B?WDRRbmY0bldzNWlGNGM0SGpsS0VGeExkRVZLRE1HTFNteitxNkJLdkEwK1RT?=
 =?utf-8?B?aWpDdGM0M1prb0JwemlybG1OSEt4aWJkVWRhcDY1Wlg3UWxxcE5wbE9JNUZR?=
 =?utf-8?B?U2thV0ExS0pkSnpodnNaRjMxMTRmRUNPTFk0eUlpLzY2Vko2dHhLOHUvbHJv?=
 =?utf-8?B?dCtLUGxVcnA0ejFoVFlrY1UwcGJxQXNHcFJPZC8wUEh5Rjk2YVVGNGtEbThX?=
 =?utf-8?B?V0ZEWmIxVlk1YklodDdqWWVTS0NIKzZvVUcxVTFwMjIwT1Z2K1YxRnN2Nkhu?=
 =?utf-8?B?TmgvdkVIQkIrOXQrVnpmRk8xNFFoY2lQbXc2N3hSR3NaQ0hBWnlCZkNWdHVp?=
 =?utf-8?B?K2ZtOGsyQ212QjF0cmdWVkVUemw0aGVPSHE3amNCelU1M1FCNVlEWEZVUlJF?=
 =?utf-8?B?M1F1Wm5yVFVWaFlyNmZkK1hVTFZES0kvRW1vaEt4SUFTbFppSTRsOWJCNkww?=
 =?utf-8?B?YjZkWHRUMWEyZUR1SVIxclNEZ2hUWG80NTBDRGJzaStKbHkvQ09qQU9mRlZD?=
 =?utf-8?B?UWM5dnRud2JVd2NUOTNBMzhOVi9QUW5iZEhOMW1LcmJDcGY4U2pTTWtjTEZE?=
 =?utf-8?B?R3liSzNzMnNFa2k2cTAxZXJqYW9meVM5L2lZdml4c3lUY1BWb1d3Q0xoakRG?=
 =?utf-8?B?NG0xL0w4VGpYRTFKcUZGc204SjBNTmRzYVVZYXhYd0NESGxJTkFoa2J3ejlQ?=
 =?utf-8?B?V0lBUGFsNldZc0Z3bGkzVytodnhHZDRLdlZDYzUyYWQ3Rjc0dkJRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <653063F72E0E4842B4C5BC6F9D7685EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q70Rho8lPTo+Rtm9Ib4RiPGf84Q+mi5gJO7gzjsatEve8d23ZO5OuLOdpjood/bUeBkDN9EGfcX8L9ehVVYbZWD9uKDxmiWrxHbvj15ofNs5BFQ9h0gmHS8fecfQQqOKtCLQYJNMmeePAOdcYWnxIi+Qup3Jzef5zLB6Hy3+VqG7pigeRRqqSL6Uzzmcn5gxGQK2HGx5dN/HHmx6SzctD3gnotwWfCWehww5eTlF7diGcUE3bscpbj/N0lpnIkfx56HZr17iFr47f3VjY+AMkVIPkIvBifPgGnpmLuqyfNJiHVhfd9DRSc9Gm5fX92P/9iH1bhwQxezVP0TCnrhqGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924a7af-ff49-4606-b045-08de74ffb138
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 06:24:27.0762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXMoq+ljusY7gzK1/TrN7eo/pCp+BrsEeiJQCHW+qEnpGc29crOD7irlkxfhc83CaadBf+5Pg1DDs1n4QqW8zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7710
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_222439_470612_D5EA8F6A 
X-CRM114-Status: GOOD (  32.33  )
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

T24gRnJpLCAyMDI2LTAyLTA2IGF0IDA4OjI4IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gT24gRnJpLCAyMDI2LTAyLTA2IGF0IDExOjA5ICswMjAwLCBQZWtrYSBQYWFs
YW5lbiB3cm90ZToNCj4gPiBPbiBGcmksIDIgSmFuIDIwMjYgMTM6NDA6MjEgLTA1MDANCj4gPiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
PiBPbiAyMDI2LTAxLTAxIDA3OjM3LCBTaGVuZ3l1IFF1IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+IOWcqCAyMDI1LzEyLzMwIDAyOjUzLCBTaGVuZ3l1IFF1IOWGmemBkzrCoCAN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiDlnKggMjAyNS8xMi8yNCAzOjQ0LCBO
w4MgY29sYXMgRi4gUi4gQS4gUHJhZG8g5YaZ6YGTOsKgIA0KPiA+IA0KPiA+ID4gPiA+ID4gR2l2
ZW4gdGhlIGxhY2sgb2Ygc3VwcG9ydCBmb3Igd3JpdGViYWNrIGNvbm5lY3RvcnMgb24gdGhlDQo+
ID4gPiA+ID4gPiBNZWRpYVRlayBLTVMgZHJpdmVyLCBjb21iaW5lZCB3aXRoIGxpbWl0ZWQgaGFy
ZHdhcmUNCj4gPiA+ID4gPiA+IGRvY3VtZW50YXRpb24sIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
dmVyaWZ5IHRoZSBjb3JyZWN0bmVzcw0KPiA+ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiA+IGVhY2gg
Y3VydmUsIG9ubHkgdGhhdCB0aGV5IHdlcmUgdmlzdWFsbHkgc2FuZSAoZ2FtbWEgY3VydmVzDQo+
ID4gPiA+ID4gPiBtYWRlDQo+ID4gPiA+ID4gPiB0aGUgaW1hZ2Ugb24gdGhlIGRpc3BsYXkgYnJp
Z2h0ZXIsIHdoaWxlIGludmVyc2UgZ2FtbWEgbWFkZQ0KPiA+ID4gPiA+ID4gaXQNCj4gPiA+ID4g
PiA+IGRhcmtlcikuwqAgDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSG1tbSBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgYWNjZXB0YWJsZS4gc1JHQi9zY1JHQiBoYXMgdHdvDQo+ID4gPiA+ID4gdHJhbnNm
ZXINCj4gPiA+ID4gPiBmdW5jdGlvbnMgbWVudGlvbmVkIGluIG9yaWdpbmFsIHNwZWNpZmljYXRp
b25bMV0uIFRvIGtlZXAgY29sb3INCj4gPiA+ID4gPiBhY2N1cmFjeSwgd2UgbmVlZCBzb21lb25l
IGZyb20gbWVkaWF0ZWsgY29uZmlybSB3aGV0aGVyIHRoaXMgaXMNCj4gPiA+ID4gPiBwaWVjZS0g
d2lzZSBvciBwdXJlIHBvd2VyIDIuMiB0cmFuc2ZlciBmdW5jdGlvbiwgdGhpcyBpcw0KPiA+ID4g
PiA+IGFscmVhZHkNCj4gPiA+ID4gPiBkb25lIGluIG9yaWdpbmFsIGFtZGdwdSBjb2xvciBwaXBl
bGluZSBzZXJpZXMsIHNSR0IgbWVhbnMNCj4gPiA+ID4gPiBwaWVjZS13aXNlIHdoaWxlIGFsc28g
ZGVkaWNhdGVkIHBvd2VyIDIuMiBmdW5jdGlvbiBleGlzdHMuwqAgDQo+ID4gPiANCj4gPiA+IE5v
dCBzdXJlIHdoYXQgeW91IG1lYW4gd2l0aCB0aGlzIG5vdCBiZWluZyBhY2NlcHRhYmxlLiBUaGlz
IGlzDQo+ID4gPiBhYm91dA0KPiA+ID4gZW5hYmxpbmcgSFcgc3VwcG9ydCBmb3IgdGhpcyBmdW5j
dGlvbmFsaXR5LiBOb3QgZXZlcnkgSFcgaGFzDQo+ID4gPiB3cml0ZWJhY2sgZm9yIHRlc3Rpbmcu
IEF0IHNvbWUgcG9pbnQgeW91J2xsIGhhdmUgdG8gdHJ1c3QgdGhlDQo+ID4gPiBkcml2ZXINCj4g
PiA+IGRldnMgaWYgeW91J3JlIGdvaW5nIHRvIHVzZSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBkcml2
ZXIuIFdlJ3JlIG5vdA0KPiA+ID4gYWx3YXlzIGdvaW5nIHRvIGdldCBldmVyeXRoaW5nIHBlcmZl
Y3QsIGJ1dCBpZiB0aGF0J3MgcmVhbGx5IHN1Y2ggYQ0KPiA+ID4gd29ycnkgeW91IGNhbiBhbHdh
eXMgdXNlIHNoYWRlcnMgdG8gZG8gcHJlY2lzZWx5IHdoYXQgeW91IHdhbnQuDQo+ID4gPiANCj4g
PiANCj4gPiBIaSBIYXJyeSwNCj4gPiANCj4gPiB5ZXMsIGJ1dCBJIHVuZGVyc3Rvb2QgdGhhdCBp
biB0aGlzIGNhc2UsIHRoZSBoYXJkd2FyZSBkb2N1bWVudGF0aW9uDQo+ID4gYXZhaWxhYmxlIGlz
IHNvIHZhZ3VlIHRoYXQgaXQncyBpbXBvc3NpYmxlIHRvIHNheSB3aGF0IGl0IHdpbGwNCj4gPiBh
Y3R1YWxseQ0KPiA+IGRvLiBUaGVyZSBhcmUgbm8gZm9ybXVsYXMgZ2l2ZW4gb3IgcmVmZXJlbmNl
ZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiwNCj4gPiBhcmUNCj4gPiB0aGVyZSwgTsOtY29sYXM/DQo+
IA0KPiBObyBmb3JtdWxhcyBhdCBhbGwsIHRoZSBvbmx5IGRvY3VtZW50YXRpb24gSSBoYWQgYXZh
aWxhYmxlIGZvciB0aGUNCj4gY3VydmVzIHdhcyB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiwgd2hp
Y2ggc2ltcGx5IGxpc3RzIHRoZSBwb3NzaWJsZQ0KPiB2YWx1ZXM6IFNDUkdCLCBCVDcwOSwgQlQy
MDIwLCBITEcuDQoNCkhpLCBOaWNvbGFzOg0KDQpJbiBbMV0sIGl0IHNob3dzIE9WTCBjb3VsZCBv
dXRwdXQgZGF0YSB0byBXRE1BIHdoaWNoIGNvdWxkIHdyaXRlIGRhdGEgaW50byBEUkFNLg0KSXRz
IGNvbnRyb2wgaXMgc2ltaWxhciB0byBSRE1BLiBSRE1BIHJlYWQgZGF0YSBmcm9tIERSQU0gYW5k
IFdETUEgd3JpdGUgZGF0YSBpbnRvIERSQU0uDQpEbyB5b3UgaGF2ZSBpbnRlcmVzdCB0byBpbXBs
ZW1lbnQgV0RNQT8NClRoaXMgaXMganVzdCBhIHN1Z2dlc3Rpb24uDQpJIGNvdWxkIGFjY2VwdCB3
ZSBiZWxpZXZlIHdoYXQgZG9jdW1lbnQgc2F5IGZpcnN0IGFuZCB3YWl0IGZvciBzb21lb25lIHRv
IHZlcmlmeSBpdC4NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc29jL21lZGlhdGVrL210
ODE5NS1tbXN5cy5oP2g9djcuMC1yYzEjbjgNCg0KUmVnYXJkcywNCkNLDQoNCj4gDQoNCg==

