Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89007CF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=; b=epwn5YxeWtDnEp6hQCIqkmRMIi
	ENP0tyXS870zVUfj7WuWnCgghsvMNl4V0QkJ9EfZGZxCRUfV50JOKNNp2/TXp7pZv3Bq9oBmoY0++
	DivNYa1cOB6TMaYQ6Jk2Ay0ReUIPrGBMiEGW2CXfaYVZkLm5GLOdA1LDSlEgIM5ZIw3YkaJtmNeSm
	CXGvNqzuCXAlEh2Jb9pZPR3n3afCHpN3zmltdHsrcy7kN4vlcPXZWMqT5EhFDI2lCaQirVD1MiGZA
	za8LD5I4WgsmeL9GE4AwQKh/ms5FPv37XdbTOXXkK5gcXIrUVlCNXZ7ThtzH7vH4wbo4dbJ8zblJr
	aAVzwHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLc8N-00000002erq-2r7Y;
	Wed, 19 Nov 2025 06:57:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLc8K-00000002erF-1cJq;
	Wed, 19 Nov 2025 06:57:41 +0000
X-UUID: 06341f0cc51511f09f706fa2197c6ceb-20251118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=;
	b=bI3Xjslvm1LVlMUy36mIihRULpR75yENqs+0d05fc7zpeT6UdTIYdy27OWYmuWA8OFr3RXibp3ObbTKFIF/Mt/vz3jDbBuDaJW6SC5zrz7B1XPBxGvXmRnFWqMx7YpUcsXANyDtN3z2JTlGHiI5Cc6gHEp2i5mUvZvrz7gg+F8o=;
X-CID-CACHE: Type:Local,Time:202511182357-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e129bc5e-b6d9-4fe4-85f2-1896d1ba99d5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:2a83f6ba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06341f0cc51511f09f706fa2197c6ceb-20251118
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1996533080; Tue, 18 Nov 2025 23:57:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 19 Nov 2025 14:57:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 19 Nov 2025 14:57:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOIJ09s4XZh7fKtqr5EuJJ8qiKdPMRbqc3hOMmVp4ondvWsezjGTn5QK82NYzfN5iYN8tkm+lMMEe2ldO+cOaUi40rouHIuZHCucBN4z/WPwkSYgV/P5FITAokcn7wHVBsIlEYf7gckJJlWCO0nR1fhRp8lt5CObpk0NruGZpcNEm6ydnR9zT+YUQgz5R/nqxcybvjZaRdltWMv75lssA9pSYzjEBnOpY5lLFVpovXW27F7Ins1ZrD/DC0o9OQUp+JlsxgMNtfpkDAqF+HihXo4webhtLb+TRcgUTqjqi3N8vuMV8icEqgVS1Q5w1Ad4akrSrPwxEJ2/ind/hBMoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=;
 b=UBZhi36DkjhJm6nZhiRyH9DF5C4oiwpXEu24W34hLfuApwh3OrUb/fEltrD/HDrCLH8McyuRZqpeqPem69wRNcXTwNE+Xv1FKWLXC50E7E4s2G9i1nvkvk/Rklzke8H8eA3RG4LHQrk0K+tVQ3aDQ7RmOc5p7txK/Vm2rVkqrxWi6Kvalipc7DuEAze3h3QbmIQXCx6OiWXeYxO/xU/Ts1oOwcRi2Ce3bKVn4+QQ9fcOTdnOpgMAq7ieyFpNl0LsqKwuO/woRfhU9aaSnM4ZZyA2raLyXrDqIkY4exusFkbtm4hRSZY7tiULbeD0qpYr8Tcw1wl9cUvkZG0zy7QZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=;
 b=AS1ihXn83+K0IssODXJw8Z7yqJzuDCo9FzfXA1kDrY9WcyJAkLQgwW4cTkXsuiIl6twMFm8i8H3qqMuaODad1TzhiGGFhPKxSrDLHFUebm/rtmwyt3eCDH5JUb/HW2kgGJwIo3/mT5Ok9kCXU2n551ncoPJ8VrTSr7++oE2uhl8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7938.apcprd03.prod.outlook.com (2603:1096:820:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:57:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:57:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "zhang.enpei@zte.com.cn" <zhang.enpei@zte.com.cn>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: mtk_drm_drv: switch to use
 devm_kmemdup_array()
Thread-Topic: [PATCH] drm/mediatek: mtk_drm_drv: switch to use
 devm_kmemdup_array()
Thread-Index: AQHcEOtYO39If2Nv1Umjae7lPOksoLT6Ia8A
Date: Wed, 19 Nov 2025 06:57:26 +0000
Message-ID: <799c9d76cd847dbeed7e414e6504719d8da8bd06.camel@mediatek.com>
References: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
In-Reply-To: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7938:EE_
x-ms-office365-filtering-correlation-id: 2e57c9e8-0e28-4386-26b8-08de2738e637
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|42112799006|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?ZmxUYTBkeVFheVFkV2RDMERzS2ZSWUZYWFdEd3d1MjRleUhpbmc4WFJTM0Rv?=
 =?utf-8?B?M2xiNkJuMXdsS2Mxd3EyWXdDcUd6eTQvcmlrV3psQUtaRnhSNEtIOGgxcVlG?=
 =?utf-8?B?Ri9wN21hSDdzQWg4UkxqQ0dMQ1V6SUIzeWhmcVp3OVJtUjQ3dGJEUi9WcGV3?=
 =?utf-8?B?bExtdEx3VjVYSlM4NnY4ejJVVzdJWlVDdDFsODdrWWw5cjd1REg4OWNYZlMx?=
 =?utf-8?B?L01paDRuMkpORjBCT1pHaTdDb2lqQzUvY3R1RlJ5dmRkZnVPaWZJRHltRE5X?=
 =?utf-8?B?VmwzUFh4MDhpcXVTOG11b1BpNFlBcFl3TmZlVUxaNmxpc25ONUtvaUZKdTZ5?=
 =?utf-8?B?NUYxYnMyQ3F5S2VjQjNKY2lMcnhGRXdaNTVMOXFzdjRJUEt0OCtpZDB4TkJu?=
 =?utf-8?B?Y1k1YmVQT1hLYXlwSitOREZOMzZlSmZFSktyc1ZEUnRHbDNwOHRQWTcvemJi?=
 =?utf-8?B?U3VySjgzaEUzSE1CcEZNNU8wVnNWZFZYUnY1dE9pOFlUbHFwOTR4YlFwQnVa?=
 =?utf-8?B?WHMvVXl0Ykx4dm1ueVJiVno0NjU0amdCT0l1QitrRzZ3cTN1enJWcjg3ZTkx?=
 =?utf-8?B?cTR3TmtwVUxKSk9wUGdhaXduUmFadnR0bjUrVGJDemVFNWdMTVVzV2xOdFFX?=
 =?utf-8?B?ZHcxbjdPa1R3QmkvK0o3WUE1RHJYd3JnMmNkd0UrNkZTYjlFMTJsRXFkYm5q?=
 =?utf-8?B?QmljMkFEWlQ1VkpVWDJrRS9nalVLdTllNW9wNm5xMFRPa3cvNHhXcVZpZklD?=
 =?utf-8?B?MnJ0bFQ3TS9vZTRNMS9NM2JmSkRZT2FDMUxXTU9oTHNCTGRvUmFlaHVJNzZS?=
 =?utf-8?B?WmlRUmV0RmtpeEpyVXFXWm1TNGhrU1JrZ0RpdkVVR0d2V0tSMnBQZTNBSFlX?=
 =?utf-8?B?UmpZZ3ZtQVJpT1dtdkpqQlltSVZ6cGp4b2M4SXkyTG9ETmVmUHg2amR0b3Rs?=
 =?utf-8?B?a2pzU0lxQnYyaExCb3dUUkZxV3NIeSt4NEgrbjhPNnBBRmthcUc3YVc3N3RU?=
 =?utf-8?B?OVMxZ091MU8rc2lDeStVWVQ5VDlnMHp2bUU5c2JEaGFmZ3dURHdNeFpsNzN6?=
 =?utf-8?B?bXg1MXpwb1ZPTVNrcXVSYUdUdmRXM3YrbzJvSzk5NEEyTlNUU0RtTTl6SVd2?=
 =?utf-8?B?U1VyTmVFR2h3Rm9NTVVyL1hxRmxnZ0I1dExSeVZGY0hLcHdZSnJTMnRhN0JC?=
 =?utf-8?B?QTNLYzUvU05sMXVhV3d2WWRhRmNPOC9DMzVGUWZxUVlMK1FZYXdaQVpBY1My?=
 =?utf-8?B?eVpWUjhiblRWWlFoSGVCM2VBUzJvZElpcHJQaFlrUkQ0cjIrVUtBYjhGZ25V?=
 =?utf-8?B?T1l1N1VTTG03MEg5OFhGckh2NFo0eGROK1ZwV3Z1bERiN2NrQUNmMXJoVGZn?=
 =?utf-8?B?ZCtiUHFWMWhVblZnT1FMVnAraHlRUjlMbnZZTWNpMjVXWHRVTG9Rdlc4enVy?=
 =?utf-8?B?dFZmeVh4N2FEMVdqRTdya3ExWWhEWFdUcW9sWHJBWndqdmxwS2RQS2RqL2Z1?=
 =?utf-8?B?a3VhL0ZVN0VlNmtwc3l2elJ4Y0Q2SEJUbnIwYktPOXJna3QrbEt3TDBNdm1W?=
 =?utf-8?B?M0RnVkN6R0ZHMFZnR0JzVmFwaDdPUmVSYU1mUGxkMTdxZnF4VG4vWVRlb0FF?=
 =?utf-8?B?SmUwZTNRdzY5SWpkY25JMEQrbGVLWk5lcUdYdmFkY3ZQM3dmd3dYVTRkUFlU?=
 =?utf-8?B?YThMK3MvaGYvWnRyaldDT0YrSlRnUzMvREt3L1VLTXYyT1VHME9hR096RlJ2?=
 =?utf-8?B?emRCZFZDSzU1amhnTDN6Z1cwUVZjZ2lDcWVhSjM4YW5VOEV5VUZ1cmRITFd6?=
 =?utf-8?B?T1VWMGtoNVhsYmMyT0FOMGVOR2dyUEs4a01OTUZyVUFIOWw0cVZjK3RoeUVU?=
 =?utf-8?B?elcyRW42ZmFVTk8yNWF2azlLcjNYNVFrVUtxQ1FWWXBOb2UzU0dGL1ZLWnov?=
 =?utf-8?B?OVRxUldMWFVOOXlBUzVvajYwL2lKV3pMNzRkVVR5M3BHVnhmSHBWdGt2a00r?=
 =?utf-8?B?VlJnYkZGVEJubVV5M0tMQmRzbXFaMUIwcEhib0ZZajhPdUMyaUVzUmpIY0V5?=
 =?utf-8?Q?se3Hhm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(42112799006)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEdaNmZtd3hqYk9rR1pYcktrNGhTYjQxVUdxT1liY0hvWWtJZ2xBbWswNVBJ?=
 =?utf-8?B?K1NyTitkZnhCSFdCL0hKMDIzVjZpVkdrd3pUcmR5YWk2bit3d2RoNUUrV0Jz?=
 =?utf-8?B?MVhTaFkrZVA4ekg2MDhVWHhjQUw1NWhNVkorZlRoKzFrWnNFQXNsdXdlSitl?=
 =?utf-8?B?ZUpJOEF3cjlRYkRkWXdWQWFmVmNpR0tJZ0tVb0N1ZnhjaGtHYml0VkNTbUNI?=
 =?utf-8?B?clFxQkx1V1RGdnFDVUE0aUdnc3E2V2VpY1BPSWo3UHdrckQybWxMRU5GczU4?=
 =?utf-8?B?dWFMbWJrdDVxRTZ3SGhlR3FMUmtzeVQ3NHA1M2kxZkdCZjBjb0VHQXRTMGg4?=
 =?utf-8?B?TnhzdWdkbURIU0RWNFg3M05BRmRmekNTSXFrK3dsQ1Avcmx0Z2lJeEVPRlpl?=
 =?utf-8?B?TlNhdStDL3BBQWs1R1h2ZndpcjdDZ0dHNG1MNDdiYkdrd2lueWdONUVGd0Zx?=
 =?utf-8?B?MWtRbkNwZjY5L01PWHRSblZSMTh2RUhzc0ZWajh2NUhyZ2lWZkRReFVuMVZB?=
 =?utf-8?B?bHpnaTg1M1l3SG1HM1NOS2EzOW5qQlE3Nk9oV0FVUEp0WjlEMnBtRkx5aE5M?=
 =?utf-8?B?b1UwRkc2aUljYU5FdnhxT0F3QUQwNFNHNTd5N0N0SUpMYStWWnRQaHVLWjVj?=
 =?utf-8?B?cEw2dEFzUmVsLzlnQjRiOUg2d2p0N2xVMTEwWXB2MXlSeVNnV3JNWEx0bzFN?=
 =?utf-8?B?Y3BmWkc2Zkw1b0UwSUt2K2RwT3J2RzJLNC84RzM0Qk1sRG5sdnhibjFFSlJu?=
 =?utf-8?B?NmRmVkFjNXVPMHVTL1BQQ1NpbTI1WURrM1RiTlBXZVBDaXo0TkNPNTZkMWRI?=
 =?utf-8?B?eHVXaWgzRVdlM2UxSnpKd0RyMWt1U1lGejUxVjd5NnlyZUVTU3FMWGNLd3NW?=
 =?utf-8?B?cW4vMTdJYmNyY05NbDlZd00vV0Y1RjJyQmFHVTZJamZ1N2lWOVFhRVhMT3Mw?=
 =?utf-8?B?M0orQnZ2aUU5d1hHeDBnaDYwTFowazd5QjhtQ3EvVjNCcUN4Tm1hQUptN1dz?=
 =?utf-8?B?bExBV1UvTlgrREtSMERoZmNwL0hubk5CYTdRZmR1THc4enVYVGZtUVowbkhu?=
 =?utf-8?B?WUt5Q0ZoTUxjSUE1K2ROMTM0TGp1eE5tZEMxOGhHTDcrdVVGdWwwOWlxaTJr?=
 =?utf-8?B?dWtyOGtROWxZSDRULytqYnJmckhPOUtOaTNtem1xczZ5UmxGdm5TMlppQ2E1?=
 =?utf-8?B?eFJVQnBaRmlpaVNUZGRWZFl4ZEtlU20rUEkyQ05IQXNORnhBcDNGempUNWpt?=
 =?utf-8?B?TWdwc0tuaGR0ZHNDYk5GZlVCRzJlbUloSnBwcTJYZGtQV3lqQjY1UXd5OEJm?=
 =?utf-8?B?WmVpYWZOVWVpS3JYUWNsek13OTNTYTFXQ3h4ODBDU0gySHNSUTBzVi9jTFM1?=
 =?utf-8?B?TjlaajdQdFRwL0JMRVVGMm9sSDlSYkF2YVNpdFdJL2grZ1Y0aG82a29vanZU?=
 =?utf-8?B?bjgvNXViTktuVWdxQ0E1TGZvK2pCUExqRUxjNWdYMzNtS01QR29SclhtWGda?=
 =?utf-8?B?TFdMSzk2S3pTKzVoUnBKVkFVUitiaTYySkdmNmVUUGxzdkhOWUwyNU5MQU8r?=
 =?utf-8?B?eE5yeEQwTlEvc2VaWjhPbUtTWXdMVC9KZy8rVFhMVzJhTFU5c0wxc1FyL2xm?=
 =?utf-8?B?dUpiK0lqZnRDT0djaVpicFNXTFRGNDdVTU1mWnhteHlBUlBDblEvWHRXL2hQ?=
 =?utf-8?B?ZHN1SHcyYldFc01uU1hUTWlJM3YyUzcybkY5VlArS3dERkxnMnhKS3J1aU5C?=
 =?utf-8?B?MW9XN1h5dkZZZWxYNk9YUkwyNm5UbW5aYlJoREczaUV5MkZZNFVYek1NeE9z?=
 =?utf-8?B?UGdSWWR6NjlQVHJoc0RTdGJmejl2L21OUjExOG1zL3dzODR1SHh1WmhMQkZi?=
 =?utf-8?B?S2tCQXFBQnZOMnJ0cVN4UGhQeVVBRzg1cWdnNVltOEJYNEpVejZoemwvaDht?=
 =?utf-8?B?aVNiZU5mSXc2ekRVM0hJWmVYYnczbSs5Zm0wTXQvRkFIS3BMcGcvTDBSc2ZZ?=
 =?utf-8?B?ZEZBbHpCU1BVcUxwWmp2d1RvV3VVbTIzVWRYb3NoL2Mxd3dXRTFmTytGenBB?=
 =?utf-8?B?WnIvaWgzU1JWZ0tkTUdPM3pjMWxjMXFCeDlONk9NVVdIM2R0T3N2dzVxdXFY?=
 =?utf-8?Q?VcwYs61rK4PsmM+/MupKFuPSb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81F1195AE450B04F9937B59F4CCA650C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e57c9e8-0e28-4386-26b8-08de2738e637
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:57:26.7032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSjE164Zm83/y3EZxillyW+KVOjYHJqdfnWh95yd/iPoqtyztx+4+U9rjE5Z52MWfLmeKnfpP7cUT9SDKQzAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_225740_443937_B6B9C668 
X-CRM114-Status: GOOD (  16.69  )
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

T24gVHVlLCAyMDI1LTA4LTE5IGF0IDE3OjI1ICswODAwLCB6aGFuZy5lbnBlaUB6dGUuY29tLmNu
IHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IEZyb206IFpoYW5nIEVucGVpIDx6aGFuZy5lbnBlaUB6dGUu
Y29tLmNuPg0KPiANCj4gVXNlIGRldm1fa21lbWR1cF9hcnJheSgpIHRvIGF2b2lkIG11bHRpcGxp
Y2F0aW9uIG9yIHBvc3NpYmxlIG92ZXJmbG93cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IEVucGVpIDx6aGFuZy5lbnBlaUB6dGUuY29tLmNuPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jDQo+IGluZGV4IGQ1ZTZiYWIzNjQxNC4uZTcwMGMwZjBhM2EyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtMTAwMyw3ICsxMDAz
LDggQEAgc3RhdGljIGludCBtdGtfZHJtX29mX2RkcF9wYXRoX2J1aWxkX29uZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGVudW0gbXRrX2NydGNfcGF0aA0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ICAgICAgICAgfQ0KPiANCj4gLSAgICAgICBmaW5hbF9kZHBfcGF0aCA9IGRldm1f
a21lbWR1cChkZXYsIHRlbXBfcGF0aCwgaWR4ICogc2l6ZW9mKHRlbXBfcGF0aFswXSksIEdGUF9L
RVJORUwpOw0KPiArICAgICAgIGZpbmFsX2RkcF9wYXRoID0gZGV2bV9rbWVtZHVwX2FycmF5KGRl
diwgdGVtcF9wYXRoLCBpZHgsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKCp0ZW1wX3BhdGgpLCBHRlBfS0VSTkVMKTsNCg0KaWR4IGFuZCBzaXpl
b2YoKnRlbXBfcGF0aCkgYXJlIHNvIHNtYWxsLCBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gd29ycnkg
b3ZlcmZsb3cuDQpkZXZtX2ttZW1kdXBfYXJyYXkoKSB3b3VsZCB1c2UgYnVpbHQtaW4gbXVsdGlw
bHksIGl0J3MgYWxzbyBhIG11bHRpcGxpY2F0aW9uLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgICAg
ICAgIGlmICghZmluYWxfZGRwX3BhdGgpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=

