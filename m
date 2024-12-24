Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EULW2viIDlVDAJbQUYictY93gLPz0M9MUx0qyq/Ocv8=; b=WFj9aDVrdChRYOKNolZZ7EF+1v
	A39jDzTTIra4Ba0PE9sgVI19i27TsERUoLAr7+oSwrCZeY4m3kiuOmBDJ1Tsa3WipC8hOHiWzQN2X
	J/Xe1XNbXhR1Hss97zq9EuDWjxvbEFGCuByh3rGGHU3um+WpprsRxAtuRayYrHuPcbmFBKc0ekr4O
	ztDa1N4IRbdtO6NtvFjUj1Plw6g5EjFGdUWzmfhBch1J+8Vo5MGMlYJ1tBtIdkXDp/y5eSxCGNVlO
	vbDgfgxLP6bL+E4lqQCXnM/27VQkt1ZFfYyyCey6R19cGTYW+gWMBJDxhe3NQrOgGRrswfOjrfP2g
	7Y9qgKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzJO-0000000BQbX-3CWP;
	Tue, 24 Dec 2024 07:26:38 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzIB-0000000BQS8-2UMP;
	Tue, 24 Dec 2024 07:25:25 +0000
X-UUID: 3a4f5816c1c811ef82ff63e91e7eb18c-20241224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=EULW2viIDlVDAJbQUYictY93gLPz0M9MUx0qyq/Ocv8=;
	b=BORzV0anmARKkcyMhDK0ltFNxr2BWTnBW009ojOw4WNXHSyVDOeTzCooT96oHDjQX6tLiwAtMbGBEt9dH5EOwdcI4UtahD7Iz9FqO45/rAQHOKUvxhYVUc8PbwQNXY7POs7k5ELXLMQOiwz+Yg3YZ/E/9ucxMkAzJOa91d7rTxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c14ffafb-ed04-4f38-a0e5-b27f66398bef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6d29c818-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3a4f5816c1c811ef82ff63e91e7eb18c-20241224
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789250834; Tue, 24 Dec 2024 00:25:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 15:25:15 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 15:25:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJclKgcGvEbVgtxVh7n0mZqaC6m2+V/SDg5c220MfjYiNZcTlKRnCOEvVFu4+nGbb7Tsexk4vjh9P/am9Gzpk+pQal803H776e7jTgS03QuAf/o9aB8cz5VNvlbagWOeR9wmG0OLP5fyGZjC4Ajki0BVgz1kl3EEX+8q+tufLpuePhePkrLO6UU2c8BSP51x4QKiwDaRR1w8m+mL0kfHdJEoRDf5INV4bbdtSt7yWRfcP1NkXlTeedhQXiN8qxUC/R0pjctgIVwEyddFnacTdiu4uRME3hBVwwpuNGmkXqXqQA18Bm+NGrg1Zx/1PeyXjWkajX4ju2U01fJejiIa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EULW2viIDlVDAJbQUYictY93gLPz0M9MUx0qyq/Ocv8=;
 b=U639YgD0gfYkbqYbYdkUj8lZ2Jt3MCrSzOYCtc1h63z3WDs7IXw7oRf0XzOMpN/ZiLpFLTqyu3Zt0ktAQUu/al/abY2IwVBvIxcp/k6y8C8vxajEm/AINdl0W1aoWjG6S4igoEqEXkyKidf4KV7OL6u4BV+FSoojEaFuRZnUm7JUwFjG1keOgBpWVwxWEuPqmS/tGuWcGG4w+AMEosFj3FxOkueR4nf8PaJ8tw8UmR8BNXrOrWr8WJc3dlEcr8zT0Yn55SvGeDmyxRPQ211JoHQQw/X33jx98um7aMRJ+SSkpfe1PCJZQF3/p1s0vh7RHsLDVyvzXkBZhbe9m+aKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EULW2viIDlVDAJbQUYictY93gLPz0M9MUx0qyq/Ocv8=;
 b=igfKH+805z+sjrFEuNVcmuMG2KvS6f/FuNnVS/IBKxSuHdabWsNLE6l2JZ09fe/bfon11hU1g89U4N1UUFQR9A/cdtUobO0L41f9dJliZ6XEEA9YxG8Lp/RilD3mqaBIF/NNZ3hSCKABY9VO6M19Qf1ftcOZ7VgsaUXK23T/0wc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6893.apcprd03.prod.outlook.com (2603:1096:400:286::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 07:25:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 07:25:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>, "greenjustin@chromium.org"
	<greenjustin@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"john@phrozen.org" <john@phrozen.org>, "frank-w@public-files.de"
	<frank-w@public-files.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if
 AFBC is supported
Thread-Topic: [PATCH v2] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if
 AFBC is supported
Thread-Index: AQHbUCGdVdPrlcYDjUuzvvyysodsRLL1Ca2A
Date: Tue, 24 Dec 2024 07:25:13 +0000
Message-ID: <c3efb52be2b1252477fd59663c8499693eaba037.camel@mediatek.com>
References: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
In-Reply-To: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6893:EE_
x-ms-office365-filtering-correlation-id: 3ad1c358-cb69-4ab5-b2f4-08dd23ec1b89
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?K3FhZXVycnovMzUvbFQvQlB5dXhKUkpRUXp3aVNlZ3NDOTM0OExlZG9hYW1H?=
 =?utf-8?B?Z1RkUWFua1U5S2UwYURHT01aMG5vdEFyZXhsU21CeFJkTjgxQ20vT25tekov?=
 =?utf-8?B?U3FvRE9lbEhJVmNFNGlnaFplb0tKMmlWTnNUWVJQSVhWTVVVeU16NCs0NXVi?=
 =?utf-8?B?MEQ3OWt3VVp0ZU9ocU8waG02WDlhVlhSc1VRZ2JURkl6YjRYMkxjQlJpNHZ0?=
 =?utf-8?B?NkMydUx2a0ZIcTBuZno5a21sdGdXd3I0ejh6T1l6U0hqYXVKNWxOWm9hS0tU?=
 =?utf-8?B?dUlJelRDb2JqWTdIcnNuaFlkU2RzNkwxZXZGZXpycDczMTg3b3F4d2NaUjJW?=
 =?utf-8?B?MDc3ZXczT0w1UkVyOHplbDVYZHNraXRRZGVGWTh6bkpIUWNjTDh4ekJhYjRD?=
 =?utf-8?B?Um5peVhoeWVnQVR0cVhyK2svSmxrVU1Hemp2bFAyTUQ2WnVjZXpPT0ZjUkR4?=
 =?utf-8?B?YkZobXc1OUZSdzRUbFhBYjJtZi9vb1NZYzZzRHdYNXFqZHE2c0g4ZkJjdnk1?=
 =?utf-8?B?R25kSXpCbVpVanlsMWhJdEJWWWhhTzZ5SlNwNjdhaXpZSTEvS1JITGtFaUdi?=
 =?utf-8?B?Skt4dUxWZk5DZHBaVEYyVGdKenB3ZUpycXNRVVRlTnhVZTVlSkNRSVZ0NTFy?=
 =?utf-8?B?aFVucVRWR2dkMFBKb2JZcTN3WDBuTis5bjFacW4rOWZmUE5uWm1tek1xMlNz?=
 =?utf-8?B?VGttd1hlQlNJeDdxR2V2MnlSWUg0and0QkIwZ0V5OGJ5c0YwNzRSMWpGd0xu?=
 =?utf-8?B?WjJrcWFQS2kxbDVPUFdveTVPYlJVdzJSUE9ab3Q5RVBYdVVmN0R6alhwU1Bh?=
 =?utf-8?B?N2ZrWVdPeUVUdW9PUFplQks0azFNeDJQcU1vT3pTMnAyKzhTY29FOHd0alM2?=
 =?utf-8?B?VUd2OEo3cmZOT216bUw2NVd0bytzb0NGeDFlTHBWUjRKYnBUZEFmT3ZualhP?=
 =?utf-8?B?bTJBZmkxUUNFY3p1eGcwN1JaMEZKVWsyWXpmTlQyUjlSZ1lkNXBlMk1SSEU5?=
 =?utf-8?B?Rkp1bCtWYjg4d09LMGI2VFZXdnYvRC9vZU9jdmtpTjAwVnJCUTFwcmxmSmhr?=
 =?utf-8?B?Ympicy9zM3RhK0VucVNiVmI5U0xXYWQ3anlkbCswUFBNcUpQa2Z2M3dqYjA4?=
 =?utf-8?B?SVprQ0VYZ3Y0bWZvVjRZV0NWaHVxcTVXY1NJQmNQZHZPMGJMQmdUbjVSZEMr?=
 =?utf-8?B?a1pwUUgxTEtlRitoTnNhZE9welNETFV1YXYwVFFpY21oNUtPdzN2UDNVRnZW?=
 =?utf-8?B?cU12T0lVVGk2ZDl4dnIyZ1c2c2loWHpPTWpBU0ZuMldiVUg2ajcwRG4rSS9m?=
 =?utf-8?B?aFBDODl6S1hxSnYrNWhZY1owckwvSE9uQUJXSkpyS3V3UFAyelF1QWFMc1U3?=
 =?utf-8?B?UHgrQ05tZUwzT21pVTcyT0lIN1NnUGRWKy8wbW9OMjFZelJVdjNtYWpDazNK?=
 =?utf-8?B?a3dxcUt2VXNnUW96VFZnQjVJNzFwcTArN3JCVjZuakZuakhKVW8xT2VVU2hU?=
 =?utf-8?B?aWJ5TTZ0VHArNk1rMVFYSkdEVnV6OXlwNzE5NmlKWXlhek0vSGtRT29pZmxW?=
 =?utf-8?B?eFVzR2NOSmNwSkdTbFRubkhlNXpKcnFuaytXNGh1T0J3UVpvSWFDQ2Z1N0RH?=
 =?utf-8?B?NTJqeWt1Tm1ZUjRkcStQZk5LVGU2aFozWDArNEllbWZyOTBxbzFmcVhZS25p?=
 =?utf-8?B?TG1DcXNCa1pvcS9kNm05ZllsVlgyK3VqWTFkdnMxTS8zT0Y5NFF6eXg5MWda?=
 =?utf-8?B?ekpheXpLUUVzVTFRUEVNdUREa3I4bnVSMFI5aHJNZS9SU1d3V29DLzRXUEhM?=
 =?utf-8?B?SjFHTEtPMUthV29vTnVld0lUNGNTblBHQmNnaUhYUWJjQ1hXcXpncHBNYmFs?=
 =?utf-8?B?L3lzWlhrRlNCc1BVelRkdDN3R0lJdmpnZjU1VW1tTDRGdTBwM1JibWpTVVNm?=
 =?utf-8?B?azQ1RS9TN2paQ0NnWGxvYlg5blNJVHA1Ty9PM3o0MWtJVHdBeWtsYTlqVmtS?=
 =?utf-8?B?QzdRRTJ6R0dBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmlQNUh6YVMvUkRnbE8xWW54TUNSTjZNbGpYTDc1MVRoejIvTTVvckNtT2JK?=
 =?utf-8?B?S1lIR1BhOXlKNTM2MTc4OWRBeUxLSUpSR1RveTIrOGVaRVVQUzBnTFV3aFJL?=
 =?utf-8?B?NGlVRVZxWmh0bEw4NWhXM2oxTkVzWFduMUJ6eUc5QjdNSjVOTHZiRFc5Q0NM?=
 =?utf-8?B?R3lBcWNRU3NBZnl3VlQraUlIaEtBeXNsNnNKYjBrRllUa2NEc2VrRHpoaGFM?=
 =?utf-8?B?bG12dEpnL1ZTbDVOTFczS08rWHNOaThud1JVcGRRaVlzMlhZeDYxMzU4VFNq?=
 =?utf-8?B?bmtXK1hmb0twckttZXpGK1RIVjlKRVVpb3VKcGQ3WGVDZllEbkJSSThPS0ds?=
 =?utf-8?B?VEduWU81c2Flb1dweVNsNVd4RWZRNmpiRG5ZanNEci9uaW82MlFTaEwxVkMw?=
 =?utf-8?B?Z09aU2lwQkhBMkdjQThvMlN1L2hOcVEzejhLbXBZcGtkNnlJUjNWcVpVZERo?=
 =?utf-8?B?bGlaTWxIcG9FUjlGQnVZR2FmRHVoVnNCeUMrWmozaUtYT1hQdnVHb0E3cFR3?=
 =?utf-8?B?OEhuYzIrNDZVazBpME4vSUpnREdDcDdTOE43UFlWdFlnMzhmQ0NqU1VXclZn?=
 =?utf-8?B?VGF3VnUvOEVBMTVKd3UvNFg1c0VZNUNobTlrUnRyd0pXRGtHU1ZkYVUzUUgy?=
 =?utf-8?B?VEdmNHdkNUVZNWYvVDdPcEl5dnBuUDlmY2U2aWpGREFmS2NOc0NnSVBSc2x1?=
 =?utf-8?B?a2Q5Z2dpdm5mMXAyaFFablpSdXF6TTNJRFgwQXRLNGhSU3R4MFJ1enhTTkd6?=
 =?utf-8?B?RHZFNW5ieDg0YmpEM1BYV1FWaEtWOWlqTTN1L2FvUmllRHJ3L1RsSnR2Qndx?=
 =?utf-8?B?cUhOalBXMytMeFF3TVFtVmZJcnBTNEFlOTM3TFpRU0NUQTNXV2I2NTVBWVY5?=
 =?utf-8?B?a0lZTmpUdFFIbkRuZVZjdUp4NmUxL0p3dzBiRVpyb04rMnVkQzlwVXB6REIv?=
 =?utf-8?B?WGRUcitmNytWM1RVNzdQem5BbGJVZjRkR1JZdWt6Rjl6bjhneUZEQ2p3dmNs?=
 =?utf-8?B?N0FCNTFaVi8yRUhpNUZ2UDJzNjl4WTN3MWJ3M1dFcEF0eXJIV04reFZCL3VT?=
 =?utf-8?B?Ujh5bzhVRE5lVWZlWUpLeDBGNHhaN0hzL0U3QXRrS2VLb1FsczlzdE9lMnRn?=
 =?utf-8?B?enNaeTJUU1Zsdno4WnUraWt5Z2xGbzVpRzEzUGdMQ0g4ckVsMmxTOXBScWFI?=
 =?utf-8?B?M2ZZRkhvay9Ta3JlY2x0K04rMGVJYy94aTdOa28vMXJ4TkpLa1pTV0Nwd3Bt?=
 =?utf-8?B?T29scXZLVkw4WWNhSXYrVXV6bU5RSkdFdGVTUmZqMlNxZXdQaVVBNzU2SWMv?=
 =?utf-8?B?cGRKQmlHdWV0TzRIdHhIUUUvZzBaL2M3R3VzMWt4VjllYU1PK3hKRlJsL3J0?=
 =?utf-8?B?UUVPbEVMaVdGb0V0SURmKzVjK2ZtZEtmME8vRk1rY1BIcVAzU2E5VDNORmJX?=
 =?utf-8?B?WFVjdjI1MEE4L2UyS2RSeGZVdnhWZXgyVmVyamZrcEpnanNUSU02SFZlVm12?=
 =?utf-8?B?dm1vdWQrdXhuYXl2K2g0VzJTV2NBWDdKc09aYXgxYkUwaWNmWXNUd09Wdkpa?=
 =?utf-8?B?ZUJDdS9xZCt3aFJHVUJPb01KSktENVBQcm1DdnIwT0Ixc1RETFhkWnRBMXQx?=
 =?utf-8?B?d0lFcy9VUm83YzJ4NVd4V2pOdU9jSFlQbUtLSndSbmNYbjJEajY3RklXMzVZ?=
 =?utf-8?B?QWdWbXpiVFZLV1Q4d0lRODRtVEd2bUI0eVRRa1JvTUNHY1ZZWlJGN3VWYlVS?=
 =?utf-8?B?M0VMYktOTkpuemFMYkpEWEVRUXVkWk1DeHVmUSt2UVZRVmFwa2NLMkhlSUpQ?=
 =?utf-8?B?MUEybjFnVXVqK1RTQlYyMysxdCtoSE1GaE5xcU42SXZIUVBKSlgyTVhwNmFx?=
 =?utf-8?B?ZllGOFBLTTFManpScmhUdDROTk5KbmtXRVZ2aUdSdXg0TFBDeHZ0emVXZ1ZW?=
 =?utf-8?B?Mi9GdXZkd0xMRW5IUXJJU0NSc09pMFR4bG1GT1JVM0FWWnk1SzNJMkVrL3ZF?=
 =?utf-8?B?ajVSTjZtUVZLVThSQzVuZXpJZFR2WWg5NFppeWpIM2JleDdGcEE3SXBha1du?=
 =?utf-8?B?emNIM0xWRDVDOVpYRWZsazJqVkdxUjMxVlVuUzh5YXlHaG5aV2svcFR0Smg5?=
 =?utf-8?Q?F8SabtAnAoI3z/TM6kz6XLM+k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5441AC00845446B4D7C3A1D17EE74D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad1c358-cb69-4ab5-b2f4-08dd23ec1b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 07:25:13.7343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UapIdgS+YeMtBfZNNuoPi9R5lEh0dI1761iN7z4rC+Cq5QsRVvBhb63wEKBuzQoikEOHKztqpqc/CbJbUJJH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_232523_649956_A156A7C6 
X-CRM114-Status: GOOD (  18.52  )
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

SGksIERhbmllbDoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDAxOjE4ICswMDAwLCBEYW5pZWwg
R29sbGUgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gVG91Y2hpbmcgRElTUF9SRUdfT1ZMX1BJVENIX01T
QiBsZWFkcyB0byB2aWRlbyBvdmVybGF5IG9uIE1UMjcwMSwgTVQ3NjIzTg0KPiBhbmQgcHJvYmFi
bHkgb3RoZXIgb2xkZXIgU29DcyBiZWluZyBicm9rZW4uDQo+IA0KPiBNb3ZlIHNldHRpbmcgdXAg
QUZCQyBsYXllciBjb25maWd1cmF0aW9uIGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbiBvbmx5DQo+
IGJlaW5nIGNhbGxlZCBvbiBoYXJkd2FyZSB3aGljaCBhY3R1YWxseSBzdXBwb3J0cyBBRkJDIHdo
aWNoIHJlc3RvcmVzIHRoZQ0KPiBiZWhhdmlvciBhcyBpdCB3YXMgYmVmb3JlIGNvbW1pdCBjNDEw
ZmE5YjA3YzMgKCJkcm0vbWVkaWF0ZWs6IEFkZCBBRkJDDQo+IHN1cHBvcnQgdG8gTWVkaWF0ZWsg
RFJNIGRyaXZlciIpIG9uIG5vbi1BRkJDIGhhcmR3YXJlLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IGM0MTBmYTliMDdjMyAoImRybS9t
ZWRpYXRlazogQWRkIEFGQkMgc3VwcG9ydCB0byBNZWRpYXRlayBEUk0gZHJpdmVyIikNCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEdvbGxlIDxk
YW5pZWxAbWFrcm90b3BpYS5vcmc+DQo+IC0tLQ0KPiB2MjogbW92ZSBBRkJDIGxheWVyIGNvbmZp
ZyBpbnRvIGEgbmV3IGZ1bmN0aW9uDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jIHwgNTcgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCBmNzMxZDRmYmU4YjYuLmUwZTI0
ZjBhNmVkZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiBAQCAtNDYwLDYgKzQ2MCwyOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxfZm10X2Nv
bnZlcnQoc3RydWN0IG10a19kaXNwX292bCAqb3ZsLA0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+
ICtzdGF0aWMgdm9pZCBtdGtfb3ZsX2FmYmNfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGlzcF9v
dmwgKm92bCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgaWR4LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBtdGtfcGxhbmVfcGVuZGluZ19zdGF0ZSAqcGVuZGluZywNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQ0KPiArew0KPiAr
ICAgICAgIHVuc2lnbmVkIGludCBwaXRjaF9tc2IgPSBwZW5kaW5nLT5waXRjaCA+PiAxNjsNCj4g
KyAgICAgICB1bnNpZ25lZCBpbnQgaGRyX3BpdGNoID0gcGVuZGluZy0+aGRyX3BpdGNoOw0KPiAr
ICAgICAgIHVuc2lnbmVkIGludCBoZHJfYWRkciA9IHBlbmRpbmctPmhkcl9hZGRyOw0KPiArDQo+
ICsgICAgICAgaWYgKHBlbmRpbmctPm1vZGlmaWVyICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUikg
ew0KPiArICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBoZHJf
YWRkciwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBESVNQX1JFR19PVkxfSERSX0FERFIob3ZsLCBpZHgpKTsNCj4gKyAg
ICAgICAgICAgICAgIG10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVkxfUElUQ0hfTVNCXzJORF9TVUJCVUYgfCBw
aXRjaF9tc2IsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm92bC0+
Y21kcV9yZWcsIG92bC0+cmVncywgRElTUF9SRUdfT1ZMX1BJVENIX01TQihpZHgpKTsNCj4gKyAg
ICAgICAgICAgICAgIG10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwgaGRyX3BpdGNoLCAm
b3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIERJU1BfUkVHX09WTF9IRFJfUElUQ0gob3ZsLCBpZHgpKTsNCj4gKyAgICAgICB9
IGVsc2Ugew0KPiArICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0
LCBwaXRjaF9tc2IsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm92
bC0+Y21kcV9yZWcsIG92bC0+cmVncywgRElTUF9SRUdfT1ZMX1BJVENIX01TQihpZHgpKTsNCj4g
KyAgICAgICB9DQo+ICt9DQo+ICsNCj4gIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0
IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0YXRlLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpDQo+IEBAIC00NjcsMjUgKzQ5MCwxMyBA
QCB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IGlkeCwNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3BlbmRpbmdfc3RhdGUgKnBl
bmRpbmcgPSAmc3RhdGUtPnBlbmRpbmc7DQo+ICAgICAgICAgdW5zaWduZWQgaW50IGFkZHIgPSBw
ZW5kaW5nLT5hZGRyOw0KPiAtICAgICAgIHVuc2lnbmVkIGludCBoZHJfYWRkciA9IHBlbmRpbmct
Pmhkcl9hZGRyOw0KPiAtICAgICAgIHVuc2lnbmVkIGludCBwaXRjaCA9IHBlbmRpbmctPnBpdGNo
Ow0KPiAtICAgICAgIHVuc2lnbmVkIGludCBoZHJfcGl0Y2ggPSBwZW5kaW5nLT5oZHJfcGl0Y2g7
DQo+ICsgICAgICAgdW5zaWduZWQgaW50IHBpdGNoX2xzYiA9IHBlbmRpbmctPnBpdGNoICYgR0VO
TUFTSygxNSwgMCk7DQo+ICAgICAgICAgdW5zaWduZWQgaW50IGZtdCA9IHBlbmRpbmctPmZvcm1h
dDsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gKHBlbmRpbmctPnkgPDwgMTYpIHwg
cGVuZGluZy0+eDsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgc3JjX3NpemUgPSAocGVuZGluZy0+
aGVpZ2h0IDw8IDE2KSB8IHBlbmRpbmctPndpZHRoOw0KPiAgICAgICAgIHVuc2lnbmVkIGludCBi
bGVuZF9tb2RlID0gc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZTsNCj4gICAgICAgICB1bnNp
Z25lZCBpbnQgaWdub3JlX3BpeGVsX2FscGhhID0gMDsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQg
Y29uOw0KPiAtICAgICAgIGJvb2wgaXNfYWZiYyA9IHBlbmRpbmctPm1vZGlmaWVyICE9IERSTV9G
T1JNQVRfTU9EX0xJTkVBUjsNCj4gLSAgICAgICB1bmlvbiBvdmVybGF5X3BpdGNoIHsNCj4gLSAg
ICAgICAgICAgICAgIHN0cnVjdCBzcGxpdF9waXRjaCB7DQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHUxNiBsc2I7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHUxNiBtc2I7DQo+IC0gICAg
ICAgICAgICAgICB9IHNwbGl0X3BpdGNoOw0KPiAtICAgICAgICAgICAgICAgdTMyIHBpdGNoOw0K
PiAtICAgICAgIH0gb3ZlcmxheV9waXRjaDsNCj4gLQ0KPiAtICAgICAgIG92ZXJsYXlfcGl0Y2gu
cGl0Y2ggPSBwaXRjaDsNCj4gDQo+ICAgICAgICAgaWYgKCFwZW5kaW5nLT5lbmFibGUpIHsNCj4g
ICAgICAgICAgICAgICAgIG10a19vdmxfbGF5ZXJfb2ZmKGRldiwgaWR4LCBjbWRxX3BrdCk7DQo+
IEBAIC01MjQsMTEgKzUzNSwxMiBAQCB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlkeCwNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAg
IGlmIChvdmwtPmRhdGEtPnN1cHBvcnRzX2FmYmMpDQo+IC0gICAgICAgICAgICAgICBtdGtfb3Zs
X3NldF9hZmJjKG92bCwgY21kcV9wa3QsIGlkeCwgaXNfYWZiYyk7DQo+ICsgICAgICAgICAgICAg
ICBtdGtfb3ZsX3NldF9hZmJjKG92bCwgY21kcV9wa3QsIGlkeCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGVuZGluZy0+bW9kaWZpZXIgIT0gRFJNX0ZPUk1BVF9NT0RfTElO
RUFSKTsNCj4gDQo+ICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBjb24s
ICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIERJU1BfUkVHX09WTF9DT04oaWR4KSk7DQo+IC0gICAgICAgbXRrX2RkcF93cml0ZV9yZWxh
eGVkKGNtZHFfcGt0LCBvdmVybGF5X3BpdGNoLnNwbGl0X3BpdGNoLmxzYiB8IGlnbm9yZV9waXhl
bF9hbHBoYSwNCj4gKyAgICAgICBtdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIHBpdGNo
X2xzYiB8IGlnbm9yZV9waXhlbF9hbHBoYSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywgRElTUF9SRUdfT1ZMX1BJVENIKGlkeCkpOw0K
PiAgICAgICAgIG10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwgc3JjX3NpemUsICZvdmwt
PmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJ
U1BfUkVHX09WTF9TUkNfU0laRShpZHgpKTsNCj4gQEAgLTUzNywxOSArNTQ5LDggQEAgdm9pZCBt
dGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgs
DQo+ICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBhZGRyLCAmb3ZsLT5j
bWRxX3JlZywgb3ZsLT5yZWdzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBESVNQ
X1JFR19PVkxfQUREUihvdmwsIGlkeCkpOw0KPiANCj4gLSAgICAgICBpZiAoaXNfYWZiYykgew0K
PiAtICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBoZHJfYWRk
ciwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBESVNQX1JFR19PVkxfSERSX0FERFIob3ZsLCBpZHgpKTsNCj4gLSAgICAg
ICAgICAgICAgIG10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBPVkxfUElUQ0hfTVNCXzJORF9TVUJCVUYgfCBvdmVy
bGF5X3BpdGNoLnNwbGl0X3BpdGNoLm1zYiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19PVkxfUElUQ0hf
TVNCKGlkeCkpOw0KPiAtICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFf
cGt0LCBoZHJfcGl0Y2gsICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRElTUF9SRUdfT1ZMX0hEUl9QSVRDSChvdmwsIGlk
eCkpOw0KPiAtICAgICAgIH0gZWxzZSB7DQo+IC0gICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRl
X3JlbGF4ZWQoY21kcV9wa3QsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgb3ZlcmxheV9waXRjaC5zcGxpdF9waXRjaC5tc2IsDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywgRElTUF9SRUdfT1ZM
X1BJVENIX01TQihpZHgpKTsNCj4gLSAgICAgICB9DQo+ICsgICAgICAgaWYgKG92bC0+ZGF0YS0+
c3VwcG9ydHNfYWZiYykNCj4gKyAgICAgICAgICAgICAgIG10a19vdmxfYWZiY19sYXllcl9jb25m
aWcob3ZsLCBpZHgsIHBlbmRpbmcsIGNtZHFfcGt0KTsNCj4gDQo+ICAgICAgICAgbXRrX292bF9z
ZXRfYml0X2RlcHRoKGRldiwgaWR4LCBmbXQsIGNtZHFfcGt0KTsNCj4gICAgICAgICBtdGtfb3Zs
X2xheWVyX29uKGRldiwgaWR4LCBjbWRxX3BrdCk7DQo+IC0tDQo+IDIuNDcuMQ0KDQo=

