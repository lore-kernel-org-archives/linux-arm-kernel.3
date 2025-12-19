Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454AD7879C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIzjKGwNQSSG54FEXrlyn5QloBmDfqIP1+zagD63GQk=; b=p+Uws2WtLXrjl/UGUZCnnFbNOs
	JRIb2bhE86MVUrrQeivKZbfTNMIuGBqVz3In9wjPqI/pXJO7E54siwBOXznYyWOZ625efEFJ3wMgD
	nMwXIbbe99vdksGsrBYgJKJiGoZkczRBbNpyLdBPVlHkwBiYBZucbJo7Y8zDfcmIxuqEMY9iW9FDs
	OtsnnMZOQgO3z+9Q6xPiPPBi00ZG3y/mYSAa1vj20cuCw3wjlP7fBumdnpOlXK9ck8zyS6Uh+NBeV
	J9cfnjYlZ6Sy1athSoLqfyT6XoJ6rYOzEhi9Vvj5UgKaMPknag8XzmXgEPTxuPZk3hE5oHwV5OK5X
	FbiB0JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdtf-0000000AgNf-10SG;
	Fri, 19 Dec 2025 17:04:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdtd-0000000AgN8-0Kaf;
	Fri, 19 Dec 2025 17:04:06 +0000
X-UUID: b54e22a4dcfc11f08b17dd397dc63300-20251219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oIzjKGwNQSSG54FEXrlyn5QloBmDfqIP1+zagD63GQk=;
	b=opy2pA4JGNOu7MwNBm0vtRG/1Kqdtut5pSxL/XGl5VC3jFFhvYWk7ZesVLAr2TIh7LGKpyOQtPcpk8DxjCNSYk8gSGe4MAZ9nKnMWqn/1jLUPGw6m3pEotA0FJwSNFC0zJdAnnOVlT+kF4XMibR9qAQFUVZUabhBMP9hcYqBmFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fd3576e1-286c-44ac-a604-5ca987664429,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3d30b728-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b54e22a4dcfc11f08b17dd397dc63300-20251219
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113364985; Fri, 19 Dec 2025 10:03:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 01:03:55 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 20 Dec 2025 01:03:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU3zvGW+AxRtipebs6X8OtbnWoxc+dbJlmn6nijOQVKgEJYZ9pc2jq1OZLbvsZMWmA7yOt4/b2jt13Sd1JObyG/cCLybCx04t9xltBz7xbRHbN4ANJ83YmFiuiO6UHCU8qvO5Gc9BjONCXM14a/0783461m6LCU73zmOWlXbv0iXiKasw0D37Y03HRasXIp4PiIyYos0MtJ+4K6V01aIVmEb+bBILewT0fS1mJguJpSEINO9lGAdVzAeNs+/tAGEweYBk3tvxmeOjQOd23TfTn3nk5EuTOtphzLlEwZHnK+NITt/Cf/aiNkGb0oL+ii33FwuUj9fYaijIcprY1JZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIzjKGwNQSSG54FEXrlyn5QloBmDfqIP1+zagD63GQk=;
 b=tP4KgABt0J36C64FAuWZYPBn9UR9nNQnc66qQ22TwofifbL6VLbwhfrnIdPCAve/YjcPidNBw4Y0SwsfRn9xyokSKs1BpLqtvtWjbhKKEHHcEAhy2tliYslfTlSW2SOOIRQ1O2TAoXvS+CN0kf0drFpMxWcqsbQcm6e216fEHY2Yn72I7Mw6SPgjurxlfwujWv2v2jUCu112unTmDX6ge7gRx5PT9aaynY6wCxHYqKyg+1vtnEsvMdcJwyO57GztKwhmLYlrXSTRQr0AvdpVzjpLeIa3V5L4q2cKmzvzU3IoAdgRe6DDWBq1R+kgBbaod9jwNSHSWMq4cczADFEXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIzjKGwNQSSG54FEXrlyn5QloBmDfqIP1+zagD63GQk=;
 b=Ch31JQ1fTS/BA8jLzaqN0q5bNATOlgR5/g6vdD/w3lXXvul2DbUKkGL0obOq0Lspu7LLGOVqI+b+TyRE/wE2LIK0mp6Kof1PMWF/Lvb5YhQlUpe6KVK1xWsGSa2jTR7XPMpEF+DE6RBs6CmuWfDkImd0BCZcGkACOG7BpMgUha4=
Received: from SEYPR03MB7759.apcprd03.prod.outlook.com (2603:1096:101:142::9)
 by KL1PR03MB7940.apcprd03.prod.outlook.com (2603:1096:820:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 17:03:51 +0000
Received: from SEYPR03MB7759.apcprd03.prod.outlook.com
 ([fe80::cfde:8bcf:25af:873f]) by SEYPR03MB7759.apcprd03.prod.outlook.com
 ([fe80::cfde:8bcf:25af:873f%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:03:50 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v4 15/19] drm/mediatek: add BLENDER support for MT8196
Thread-Topic: [PATCH v4 15/19] drm/mediatek: add BLENDER support for MT8196
Thread-Index: AQHcF/M2k8HwqxzRj0GjAhfNnufExbSO6bqAgJr5QoA=
Date: Fri, 19 Dec 2025 17:03:50 +0000
Message-ID: <edf5da411c480f0e2337ed62a393d4cf66d17577.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
	 <20250828080855.3502514-16-paul-pl.chen@mediatek.com>
	 <41974a26982bf441230ba49f9c8c5ba21cf1336c.camel@mediatek.com>
In-Reply-To: <41974a26982bf441230ba49f9c8c5ba21cf1336c.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7759:EE_|KL1PR03MB7940:EE_
x-ms-office365-filtering-correlation-id: 8b071967-5a7b-4ba4-1d2a-08de3f2094cf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L2FKTUZaVmRXMUlIMXBaMnkwVnpRTmZMUlMxb0RSRWMwV3JnczlPVDl6clRQ?=
 =?utf-8?B?OHZQUDZvK0lrVUNOaHdZTm1jczRXQ09TTmlrMGxLNHMwUlZLVTN4MlZSNWlZ?=
 =?utf-8?B?ekdhaFJwVjBqVTU0YnIrU1dMSDY2NVNCRURFdzR6djI3WVV3aWo2SEI2SFYy?=
 =?utf-8?B?K3c0NC9QWXNZczVrZUNzdzRhbTQyeVREVHJxd0JXeHNxeGY5Z1FtdUpwczY2?=
 =?utf-8?B?em03SE1NSkIvbDg4MDJnVkNsZFI3S1BKbGJRRWRNckMwT1FjcDBhZkpZSFJT?=
 =?utf-8?B?M0pOempkOHBjeE9naCtYRkVTRUwwNFFyM1A4QVhzZ1N2WVhZUi9Uem9Na2d0?=
 =?utf-8?B?cDZ0N2pXZW96NXZaRm5rL0kydFZIY1Y3aVlIa1d6am5OSEtrMXhCdnVkSm5l?=
 =?utf-8?B?K1kxTkVHMms5cXRXUWlVWnZlS0FxZEU2d2d1SHFIbDRNU05BTVNXYjZtcXNN?=
 =?utf-8?B?OEFWMlgxYkloTlhOWXJIT3Z3RG85M0s3RjQrNlF4RlZkcXk5cG51emVGSzBw?=
 =?utf-8?B?dE9PLy9rM0FHT2hnSnZSYnM4SUlvN1A3WS9MZTNrSEJ1c1FoQ1lCMTZoeWh0?=
 =?utf-8?B?dnRGa3EwcEtNN2RTS3dMbHI3aWpRc3p5cWhQNGhtWHZrek5GWnZmSFYxaTNC?=
 =?utf-8?B?a1gwNFA3VmkxSnR2TzgxbUVMOEhYQ29JcWRjdXRxZkEzaEZnTzRCcnF2Tk5n?=
 =?utf-8?B?NmdiZnJDME8rcEphT0t2bVdXNVBsWTE4QWszRGY1Z1cyMERYU0YvM2NGMk0y?=
 =?utf-8?B?Umh5V01raU9NemxPY3o5RFR4NmtSb0R1V2U2Y05sT3ZBd0N5T0NVT3lIZGU4?=
 =?utf-8?B?ajltRmhIOXNjWHBDelZCV2dPK2VYVUNiN0hZOEFVaW1wMVNnSW1pL3pad0FE?=
 =?utf-8?B?NmxOMUhocG1YUGNTYjhMeXpOKy9qZkV3ZTBLVGllVGNiSHNWdERqV0VtYTZ4?=
 =?utf-8?B?ZkRlVGdlKzZUUGJxQkp5RC92YTBJYVdhWWJnZVhZNElHZTJtem9sSit6RVpy?=
 =?utf-8?B?cXVhaFFZUWRnWFdnMlk3QlR3OEJkZGw0bEI0TmxVdmtRTEE4QVprelJKU3dK?=
 =?utf-8?B?S1BCUkExL21XaDRnajBpQ3QzdDhCQUpTL0tFcjZZQ1pKd1RZT0lraHRqSkd1?=
 =?utf-8?B?QVlYeGNEeXl6elhLNmdqTUZ6dzlubU5nb3dndHhkMC94M0J1VkZCS0dISlRM?=
 =?utf-8?B?Z1Z2ZzVGbjBBMnFMYXR5SXdsYUdYWXYrUVBobit1UlprRk1FWWdFb3NGNnZX?=
 =?utf-8?B?RDJaUExtcTJ2YzlDMG9xMVdIcHJPNndmYXdpUWZSZytNRHlxTjZOVGFUVFVa?=
 =?utf-8?B?WjZ5U2V5MmtleGozN2RGaGNPYVFJcUFReFNlczFJWTl3WjJualp4US9hL3U0?=
 =?utf-8?B?VmZ4YThLSm12SE53SVNsRnZ4WVR2VnlpZ2FPdjByWWdvamtrV1NQSmFHT08w?=
 =?utf-8?B?WDIzdTUxQVVqcFhCT1I0R1Nja0hLYlZ6VmhndmVwWFVocjJxK2JwODBZcDEv?=
 =?utf-8?B?TXRKVEY1bUZkK2tEZEYzdEllOUo5N3lhY2M4cHVmWkdoa09qRUxWT0tpWFor?=
 =?utf-8?B?d0RjRDFNVVRISDIvaDh3TGVKNkxqbXRpcnhEajlNVWhuZ1hNOVFFaW5wb2Zk?=
 =?utf-8?B?Y2UxUUt4SnBlUlpuVE1jTTdJSEw4Q3FrbGFTZGJUaXU2T3NrRUxvU3NKc3FC?=
 =?utf-8?B?elRPb0Nzem8rc0g0eVlLbVNtTHhicVh6NUpCVXdHcUQ0VEVjekIxZkJrUHhv?=
 =?utf-8?B?cEV2NWNKblZsOW9XQXlHTDAzNTJCbXRDM2VDOW8zaXVVcXU3c0RnT1F2Y2hK?=
 =?utf-8?B?TDhzQTZFWTMxTCtmMm5yVi8xWTU0QzdLRkI4Qk0zcER1bG1lTWZTU05UYTd5?=
 =?utf-8?B?cnhxdHRmdzV5a3pqeUJuNDlqNVFzVXZMa3hBblBPVGpIVVpFNGhiaE5Yb0or?=
 =?utf-8?B?dmZORUN6TUJPazF0ajdiYkxCa09XV1pKaDlRT1BKUUVJVzNIdlhrekJNK0Jz?=
 =?utf-8?B?T3pjVi83L0xNaDlPUnBJSzlsdm84RUtDbGFkQzZlc2REN1N4OXEvTW1acE1v?=
 =?utf-8?Q?2MspIC?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7759.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R296azBnTWhFUDUxbDFVaG14VWJ5RW5heVBJVFN4OUZKdE1WMFZPZC9Fc0Nq?=
 =?utf-8?B?N3dqaHd0czMxMHhiZ3YxQmRqWkNFZG82aG1MTXFGWnliSDd0ZVNpL2hVQ1Z6?=
 =?utf-8?B?cmI3MlFTV1AwQTkxWGthUGd0N0ZQZE85VlQweHJlYmdKWDZVYjFWSDlQMnBG?=
 =?utf-8?B?Y1M4NWRReUxNNXQ1bERwQUNqUnZkV1Z1MzF3ZjlLS09Kdmlrb2FZMk9WVkti?=
 =?utf-8?B?Zm9jQ0RHOEpLUVdkRzdpU0tjWXgrZ2doaW1FMUNydUw3TGt6bll2QWNUME5B?=
 =?utf-8?B?VzM1S3liNkdrNzdvSmE0MWlFNTY2SG1HWW5DWXRqZ291bXUwRldPUm5ESjM4?=
 =?utf-8?B?TWQ3ZVZneW1YWklIeUFtSlFhcURPMC9DRDZyczRHUnNIbCtFajNITnQ0cVMz?=
 =?utf-8?B?ZmtRdU4wS2hiOUdGNTlKbmNIUUNSK0w2MUozaURMTkQ1dlEzNnl3WG5sb0lH?=
 =?utf-8?B?aW53YmRHK3NSaDN5UGZVNXVPQXcvMkZZeEErT2Z5V3RzamZadHI5UUxnZExj?=
 =?utf-8?B?N1ppQWdXUzM5N0NOUXFlWHBzYzFveHB1VXpxdkNPbzdwSGp6SjhpcFMvYzZW?=
 =?utf-8?B?UFVQK0xvNE85QXFxelFacUoyOVJPN3AyTVpxQm1XZUo2L1FncmVZRFJsQlBP?=
 =?utf-8?B?bnN0RlRDSmY4T3RIbW12S3hJWGpwM1M3MDdRQkxVQjhGTXBGNWdPaFppcVhW?=
 =?utf-8?B?SkxKb1gwZ0hEWXE5MHJWT2tKb05zVS9ha0g4N0xoajUwZG14bmcrR2FzMS9B?=
 =?utf-8?B?cVp0ZkxNQUhCZTJYWVB1ekM1U3IrODczVkNjcWhrT0RqMW5qL1I5Ky94VFdi?=
 =?utf-8?B?SlVrdGNqSFhqcHVyZlVqcjQvd0JmeVcvNEZaakN4YmVkd01ZTzhwY0o0bUha?=
 =?utf-8?B?YlVYNmh1S3Q5VmErUTZYcFlDbHZZWGVMMmhKVzUxM0lnM0Q3Wm9ja0RVc0pr?=
 =?utf-8?B?UWdWYlR3N1Rja3ZJSXpDakFveWViRFlpOGdkQ2Z1eDRlZGVEYVhMZXFzNnBC?=
 =?utf-8?B?K0VnU3ladlhFU1FiSGVWQitXWVhmVjlEc3RuOWF0U09QTnVieFczeU16Mnhs?=
 =?utf-8?B?RG5EdW9JMjdEVURnMXQwMVNmUDdpcmZXVVk0Ylg5VEV3b3lkbmNCTWIySFdl?=
 =?utf-8?B?ZmtYa3dldy9ydHpjaGNzMzZOb2lVZTVhVnhreUZZdUp0d0lNWFczbStmUnVQ?=
 =?utf-8?B?YTkxcVJDN1pxRk9iMktILzJCR2FReFNjcHFSYjh2RnNVNldmd2crb2N5SnZx?=
 =?utf-8?B?RHdqOFNXemowbXZsWmV5L0V6UlQ4Rzl2Zm5HU0k1V0JrQjJBUmZHeExWTUVa?=
 =?utf-8?B?TGdOd1dsMFptMm0xZTRmMTU2MU9FVDRVVDhIcEsvVnFQV3BOZW55bzNpZ3BN?=
 =?utf-8?B?Smo4NHFqYkc5S0oxRnJLaCtObHA2eEJvbnJqdGtuQnVhck1GZklMZHNDTlRO?=
 =?utf-8?B?RXQ4cjJoOXBKZTY2d1dzRk5Nak9ZYTBFcVZiclp2UThKS3BVK1pyZ0N4a2hv?=
 =?utf-8?B?WE96WmZ4YTJZVCsyUkhWT3ROZFNVSnBvcXo1YW14dzREMnRLNk52Um5HMjN0?=
 =?utf-8?B?dXEvbWw1RTdkNEJ1R2pDR2NURThwNEowaU9VRENpWmsyUFlwSzRURTFXK3NH?=
 =?utf-8?B?ai9VU2huSnNqWkx5OEhTYzZVbjdQbnlZbkFwcEUxL2ZxQytWM1IybUFOTWhD?=
 =?utf-8?B?ZGgyT0F2bWhIUDZpbkRTSmlqZHZIV21PSTlUalN3Z1pOL1RVNHNyQmkxQm5m?=
 =?utf-8?B?WVpSNnMzUlVMMy84M0gzcG9wb2VaYWtrV0ZtQThCMUdCbHhkVkEzQnhaNmEr?=
 =?utf-8?B?MDZ5bU93UndreG03cWo1YWVnYjAwZDA1TjZBRXNiS0E4QmhVallTTHhzVVls?=
 =?utf-8?B?QUFuQ2NTTmRja0JGWTN0NkhIRUhPVzVtaGtOU1p3ZkFWM3Y0Y2YzL0dGQTUr?=
 =?utf-8?B?RE1lc1dnNnFXRGgyNEkvcEpmcERwTlBNanZVeHNrN0ZTOE9GUW9VVjZYbXdl?=
 =?utf-8?B?K2w5dE1ab09mQXI4b05leU11ejUyclN4b2ZNVmlyMjNlSUtTcVNtQWhLRURS?=
 =?utf-8?B?eGt5ZHl3SENQbUVNczlKSUdMK2ZpOVJ1dEFtRjJZTVQxMmxudnRscThxR3p3?=
 =?utf-8?B?eGJYb3Vlb21PMGNES1MyMlV6cFRYaDdrNjBoS2dLYVB2UUN1Nmk0SzBNNlgv?=
 =?utf-8?B?ZHl6Rk81eTY5Vnp1UkFUZDlxc3hzZGlyaTJwRW5Hb3Z5R3pNQTdxYkkydmpp?=
 =?utf-8?B?bGVGaUFnbis5RjZ2dUdUWE9qRmNUdEh0ZlJ4RTB2OEZBQlpoejVpNGxRc1pP?=
 =?utf-8?B?KzVYK245VVNRUkdrRm9DQS9vUWxZOFZCZmp1aVM0SUN5NUdENzE3bmdRMEtp?=
 =?utf-8?Q?PExFzkaWMqJ7vfl4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B33E218B835FB4F87CF4E38B6655C2C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7759.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b071967-5a7b-4ba4-1d2a-08de3f2094cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 17:03:50.0777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8RZnDm9vSZQemQYFWpfwduIK8+uINKZyNCOJAsa+8nUUC1gSwly65xYDVfKs+x7tc+c8AtvPF+8HnfqWL+4lGfSHVT2e+o/rdRc4xzJ8EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_090405_149620_2EB82E73 
X-CRM114-Status: GOOD (  16.44  )
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

T24gRnJpLCAyMDI1LTA5LTEyIGF0IDAyOjI3ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6
DQo+ID4gRnJvbTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+
IEJMRU5ERVIgZXhlY3V0ZXMgdGhlIGFscGhhIGJsZW5kaW5nIGZ1bmN0aW9uIGZvciBvdmVybGFw
cGluZw0KPiA+IGxheWVycyBmcm9tIGRpZmZlcmVudCBzb3VyY2VzLCB3aGljaCBpcyB0aGUgcHJp
bWFyeSBmdW5jdGlvbg0KPiA+IG9mIHRoZSBvdmVybGFwcGluZyBzeXN0ZW0uDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX2JsZW5kZXIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2JsZW5kZXIuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi45MjEyZDJlMTljYTcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2JsZW5kZXIuYw0KPiA+IEBAIC0w
LDAgKzEsMjc0IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IE1lZGlhVGVrIEluYy4NCj4g
PiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4NCj4gPiArI2lu
Y2x1ZGUgPGRybS9kcm1fYmxlbmQuaD4NCj4gDQo+IEFscGhhYmV0aWMgb3JkZXIuDQo+IA0KPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
Y2xrLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gDQo+IEFs
cGhhYmV0aWMgb3JkZXIuDQo+IA0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9yZXNldC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRx
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmg+DQo+ID4g
Kw0KPiA+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gPiArI2luY2x1ZGUgIm10a19kZHBfY29t
cC5oIg0KPiA+ICsjaW5jbHVkZSAibXRrX2Rpc3BfYmxlbmRlci5oIg0KPiA+ICsjaW5jbHVkZSAi
bXRrX2Rpc3BfZHJ2LmgiDQo+ID4gKyNpbmNsdWRlICJtdGtfZGlzcF9vdmwuaCINCj4gPiArI2lu
Y2x1ZGUgIm10a19kcm1fZHJ2LmgiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9C
TERfREFUQVBBVEhfQ09OCQkJMHgwMTANCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfQkdDTFJf
SU5fU0VMCQkJCQlCSVQoMCkNCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfQkdDTFJfT1VUX1RP
X1BST0MJCQkJQklUKDQpDQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxfQkxEX0JHQ0xSX09VVF9UT19O
RVhUX0xBWUVSCQkJCUJJVCg1KQ0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfRU4JCQkJ
MHgwMjANCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfRU4JCQkJCQlCSVQoMCkNCj4gPiArI2Rl
ZmluZQ0KPiA+IE9WTF9CTERfRk9SQ0VfUkVMQVlfTU9ERQkJCQlCSVQoNCkNCj4gPiArI2RlZmlu
ZQ0KPiA+IE9WTF9CTERfUkVMQVlfTU9ERQkJCQkJQklUKDUpDQo+ID4gKyNkZWZpbmUgRElTUF9S
RUdfT1ZMX0JMRF9SU1QJCQkJMHgwMjQNCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfUlNUCQkJ
CQkJQklUKDApDQo+ID4gKyNkZWZpbmUgRElTUF9SRUdfT1ZMX0JMRF9TSEFET1dfQ1RSTAkJCTB4
MDI4DQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxfQkxEX0JZUEFTU19TSEFET1cJCQkJCUJJVCgyKQ0K
PiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfQkdDTFJfQkFMQ0sJCQkweGZmMDAwMDAwDQo+
IA0KPiBNb3ZlIHRoaXMgYWZ0ZXIgRElTUF9SRUdfT1ZMX0JMRF9CR0NMUl9DTFIsIGFuZCB0aGlz
IG5hbWUgaGFzIHR5cG8uDQo+IEl0IHNob3VsZCBiZSBESVNQX1JFR19PVkxfQkxEX0JHQ0xSX0JM
QUNLDQo+IA0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfUk9JX1NJWkUJCQkweDAzMA0K
PiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfTF9FTgkJCQkweDA0MA0KPiA+ICsjZGVmaW5l
DQo+ID4gT1ZMX0JMRF9MX0VOCQkJCQkJQklUKDApDQo+ID4gKyNkZWZpbmUNCj4gPiBESVNQX1JF
R19PVkxfQkxEX09GRlNFVAkJCQkweDA0NA0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERf
U1JDX1NJWkUJCQkweDA0OA0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfTDBfQ0xSRk1U
CQkJMHgwNTANCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfQ09OX0ZMRF9DTFJGTVQJCQkJCUdF
Tk1BU0soMywgMCkNCj4gPiArI2RlZmluZQ0KPiA+IE9WTF9CTERfQ09OX0NMUkZNVF9NQU4JCQkJ
CUJJVCg0KQ0KPiA+ICsjZGVmaW5lDQo+ID4gT1ZMX0JMRF9DT05fRkxEX0NMUkZNVF9OQgkJCQlH
RU5NQVNLKDksIDgpDQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxfQkxEX0NPTl9DTFJGTVRfTkJfMTBf
QklUCQkJCUJJVCg4KQ0KPiA+ICsjZGVmaW5lDQo+ID4gT1ZMX0JMRF9DT05fQllURV9TV0FQCQkJ
CQlCSVQoMTYpDQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxfQkxEX0NPTl9SR0JfU1dBUAkJCQkJQklU
KDE3KQ0KPiA+ICsjZGVmaW5lIERJU1BfUkVHX09WTF9CTERfQkdDTFJfQ0xSCQkJMHgxMDQNCj4g
PiArI2RlZmluZQ0KPiA+IERJU1BfUkVHX09WTF9CTERfTF9DT04yCQkJCTB4MjAwDQo+ID4gKyNk
ZWZpbmUNCj4gPiBPVkxfQkxEX0xfQUxQSEEJCQkJCQlHRU5NQVNLKDcsIDApDQo+ID4gKyNkZWZp
bmUNCj4gPiBPVkxfQkxEX0xfQUxQSEFfRU4JCQkJCUJJVCgxMikNCj4gPiArI2RlZmluZSBESVNQ
X1JFR19PVkxfQkxEX0wwX0FMUEhBX1NFTAkJCTB4MjA4DQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxf
QkxEX0wwX0NPTlNUCQkJCQlCSVQoMjQpDQo+ID4gKyNkZWZpbmUNCj4gPiBESVNQX1JFR19PVkxf
QkxEX0wwX0NMUgkJCQkweDIwYw0KPiA+ICsjZGVmaW5lDQo+ID4gT1ZMX0JMRF9DT05fQ0xSRk1U
X01BTgkJCQkJQklUKDQpDQo+IA0KPiBZb3UgaGF2ZSBhbHJlYWR5IGRlZmluZSBPVkxfQkxEX0NP
Tl9DTFJGTVRfTUFOLiBEcm9wIHRoaXMgb25lLg0KPiANCj4gPiArDQo+ID4gK3N0cnVjdCBtdGtf
ZGlzcF9ibGVuZGVyX2RhdGEgew0KPiA+ICsJdW5zaWduZWQgaW50IG1heF9zaXplOw0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RydWN0IG10a19kaXNwX2JsZW5kZXIgew0KPiA+ICsJdm9pZCBfX2lv
bWVtICpyZWdzOw0KPiA+ICsJc3RydWN0IGNsayAqY2xrOw0KPiA+ICsJc3RydWN0IGNtZHFfY2xp
ZW50X3JlZyBjbWRxX3JlZzsNCj4gPiArCWNvbnN0IHN0cnVjdCBtdGtfZGlzcF9ibGVuZGVyX2Rh
dGEgKmRhdGE7DQo+ID4gK307DQo+ID4gKw0KPiA+ICt2b2lkIG10a19kaXNwX2JsZW5kZXJfbGF5
ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gbXRrX3BsYW5lX3N0YXRl
ICpzdGF0ZSwNCj4gPiArCQkJCcKgwqAgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkNCj4gPiAr
ew0KPiA+ICsJc3RydWN0IG10a19kaXNwX2JsZW5kZXIgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gPiArCXN0cnVjdCBtdGtfcGxhbmVfcGVuZGluZ19zdGF0ZSAqcGVuZGluZyA9ICZz
dGF0ZS0+cGVuZGluZzsNCj4gPiArCXUzMiBhbHBoYSwgY2xyZm10LCBpZ25vcmVfcGl4ZWxfYWxw
aGEgPSAwOw0KPiA+ICsJdTMyIGJsZW5kX21vZGUgPSBtdGtfb3ZsX2dldF9ibGVuZF9tb2RlKHN0
YXRlLA0KPiA+IE1US19PVkxfU1VQUE9SVF9CTEVORF9NT0RFUyk7DQo+ID4gKw0KPiA+ICsJaWYg
KCFwZW5kaW5nLT5lbmFibGUgfHwgcGVuZGluZy0+aGVpZ2h0ID09IDAgfHwgcGVuZGluZy0NCj4g
PiA+d2lkdGggPT0gMCB8fA0KPiA+ICsJwqDCoMKgIHBlbmRpbmctPnggPiBwcml2LT5kYXRhLT5t
YXhfc2l6ZSB8fCBwZW5kaW5nLT55ID4NCj4gPiBwcml2LT5kYXRhLT5tYXhfc2l6ZSkgew0KPiA+
ICsJCW10a19kZHBfd3JpdGUoY21kcV9wa3QsIDAsICZwcml2LT5jbWRxX3JlZywgcHJpdi0NCj4g
PiA+cmVncywgRElTUF9SRUdfT1ZMX0JMRF9MX0VOKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICsJbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgcGVuZGluZy0+eSA8PCAxNiB8
IHBlbmRpbmctPngsDQo+ID4gJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLA0KPiA+ICsJCcKg
wqDCoMKgwqAgRElTUF9SRUdfT1ZMX0JMRF9PRkZTRVQpOw0KPiA+ICsNCj4gPiArCW10a19kZHBf
d3JpdGUoY21kcV9wa3QsIHBlbmRpbmctPmhlaWdodCA8PCAxNiB8IHBlbmRpbmctDQo+ID4gPndp
ZHRoLCAmcHJpdi0+Y21kcV9yZWcsDQo+ID4gKwkJwqDCoMKgwqDCoCBwcml2LT5yZWdzLCBESVNQ
X1JFR19PVkxfQkxEX1NSQ19TSVpFKTsNCj4gPiArDQo+ID4gKwljbHJmbXQgPSBtdGtfb3ZsX2Zt
dF9jb252ZXJ0KHBlbmRpbmctPmZvcm1hdCwgYmxlbmRfbW9kZSwNCj4gPiB0cnVlLCBmYWxzZSwg
MCwNCj4gPiArCQkJCcKgwqDCoMKgIE9WTF9CTERfQ09OX0NMUkZNVF9NQU4sDQo+ID4gT1ZMX0JM
RF9DT05fQllURV9TV0FQLA0KPiA+ICsJCQkJwqDCoMKgwqAgT1ZMX0JMRF9DT05fUkdCX1NXQVAp
Ow0KPiANCj4gVGhlIGJsZW5kZXIgZGF0YSBpbnB1dCBmcm9tIGV4ZG1hLg0KPiBleGRtYSB3b3Vs
ZCBjb252ZXJ0IFlVViBmb3JtYXQgdG8gUkdCLCBzbyBibGVuZGVyIHdvdWxkIGFsd2F5cw0KPiBy
ZWNlaXZlIFJHQiBmb3JtYXQsIHJpZ2h0Pw0KPiBJZiBwZW5kaW5nLT5mb3JtYXQgaXMgWVVWLCBh
bmQgc2V0IFlVViBmb3JtYXQgdG8gYmxlbmRlciwgd2hhdCBkb2VzDQo+IHRoaXMgbWVhbj8NCj4g
DQo+IA0KVGhpcyBpcyB0aGUgbWVjaGFuaXNtIG9mIGhhcmR3YXJlIGRlc2lnbiwgd2Ugd2lsbCB1
c2UgdGhlDQppZ25vcmVfcGl4ZWxfYWxwaGEgdG8gY2xvc2UgaXQNCj4gPiArCWNscmZtdCB8PSBt
dGtfb3ZsX2lzXzEwYml0X3JnYihwZW5kaW5nLT5mb3JtYXQpID8NCj4gPiBPVkxfQkxEX0NPTl9D
TFJGTVRfTkJfMTBfQklUIDogMDsNCj4gPiArCW10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwg
Y2xyZm10LCAmcHJpdi0+Y21kcV9yZWcsDQo+ID4gcHJpdi0+cmVncywNCj4gPiArCQkJwqDCoCBE
SVNQX1JFR19PVkxfQkxEX0wwX0NMUkZNVCwNCj4gPiBPVkxfQkxEX0NPTl9DTFJGTVRfTUFOIHwN
Cj4gPiArCQkJwqDCoCBPVkxfQkxEX0NPTl9SR0JfU1dBUCB8wqANCj4gPiBPVkxfQkxEX0NPTl9C
WVRFX1NXQVAgfA0KPiA+ICsJCQnCoMKgIE9WTF9CTERfQ09OX0ZMRF9DTFJGTVQgfA0KPiA+IE9W
TF9CTERfQ09OX0ZMRF9DTFJGTVRfTkIpOw0KPiANCj4gVGhlIG1hc2sgc2hvdWxkIGluY2x1ZGUg
T1ZMX0JMRF9DT05fQ0xSRk1UX05CXzEwX0JJVA0KPiANCj4gPiArDQo+ID4gKwlpZiAobXRrX292
bF9pc19pZ25vcmVfcGl4ZWxfYWxwaGEoc3RhdGUsIGJsZW5kX21vZGUpKQ0KPiA+ICsJCWlnbm9y
ZV9waXhlbF9hbHBoYSA9IE9WTF9CTERfTDBfQ09OU1Q7DQo+ID4gKwltdGtfZGRwX3dyaXRlX21h
c2soY21kcV9wa3QsIGlnbm9yZV9waXhlbF9hbHBoYSwgJnByaXYtDQo+ID4gPmNtZHFfcmVnLCBw
cml2LT5yZWdzLA0KPiA+ICsJCQnCoMKgIERJU1BfUkVHX09WTF9CTERfTDBfQUxQSEFfU0VMLA0K
PiA+IE9WTF9CTERfTDBfQ09OU1QpOw0KPiA+ICsNCj4gPiArCWFscGhhID0gKE9WTF9CTERfTF9B
TFBIQSAmIChzdGF0ZS0+YmFzZS5hbHBoYSA+PiA4KSkgfA0KPiA+IE9WTF9CTERfTF9BTFBIQV9F
TjsNCj4gDQo+IFdoeSBkbyB5b3UgYWx3YXlzIGVuYWJsZSBhbHBoYT8NCj4gSW4gb3ZsIGRyaXZl
ciwgaXQgZGVwZW5kIG9uIHN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSB0bw0KPiBl
bmFibGUgYWxwaGEuDQo+IA0KPiA+ICsJbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBhbHBo
YSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LQ0KPiA+ID5yZWdzLA0KPiA+ICsJCQnCoMKgIERJU1Bf
UkVHX09WTF9CTERfTF9DT04yLA0KPiA+IE9WTF9CTERfTF9BTFBIQV9FTiB8IE9WTF9CTERfTF9B
TFBIQSk7DQo+ID4gKw0KPiA+ICsJbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgT1ZMX0JMRF9MX0VO
LCAmcHJpdi0+Y21kcV9yZWcsDQo+ID4gcHJpdi0+cmVncywgRElTUF9SRUdfT1ZMX0JMRF9MX0VO
KTsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZGlzcF9ibGVuZGVyX2RhdGENCj4gPiBtdDgxOTZfZGlzcF9ibGVuZGVyX2RyaXZl
cl9kYXRhID0gew0KPiA+ICsJLm1heF9zaXplID0gODE5MSwNCj4gDQo+IFJlbW92ZSB0aGlzIFNv
QyBkYXRhLiBhbmQNCj4gDQo+ICNkZWZpbmUgQkxFTkRFUl9NQVhfU0laRSA4MTgxDQo+IA0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBt
dGtfZGlzcF9ibGVuZGVyX2RyaXZlcl9kdF9tYXRjaFtdID0gew0KPiA+ICsJeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxOTYtYmxlbmRlciIsDQo+ID4gKwnCoCAuZGF0YSA9ICZtdDgxOTZf
ZGlzcF9ibGVuZGVyX2RyaXZlcl9kYXRhfSwNCj4gPiArCXt9LA0KPiA+ICt9Ow0KPiA+ICsNCj4g
DQo+IFtzbmlwXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2JsZW5kZXIuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2JsZW5kZXIuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi5hNDdhYjEyODY0OWQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2JsZW5kZXIuaA0KPiA+IEBAIC0wLDAgKzEsMTAg
QEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPiA+
ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgTWVkaWFUZWsgSW5jLg0KPiA+ICsgKi8N
Cj4gPiArDQo+ID4gKyNpZm5kZWYgX19NVEtfRElTUF9CTEVOREVSX0hfXw0KPiA+ICsjZGVmaW5l
IF9fTVRLX0RJU1BfQkxFTkRFUl9IX18NCj4gPiArDQo+ID4gK3UzMiBtdGtfZGlzcF9ibGVuZGVy
X2dldF9ibGVuZF9tb2RlcyhzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiANCj4gTW92ZSB0aGlzIHBy
b3RvdHlwZSB0byBtdGtfZGlzcF9kcnYuaA0KPiANCj4gPiArI2VuZGlmIC8vIF9fTVRLX0RJU1Bf
QkxFTkRFUl9IX18NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX2Rydi5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2
LmgNCj4gPiBpbmRleCBiOWQ4ZjE3YzRmMzEuLmUwYWViODdmMGE1YiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCj4gPiBAQCAtOSw2ICs5LDcgQEAN
Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4NCj4gPiDCoCNp
bmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmg+DQo+ID4gwqAjaW5jbHVkZSA8
bGludXgvc29jL21lZGlhdGVrL210ay1tdXRleC5oPg0KPiA+ICsjaW5jbHVkZSAibXRrX2Rpc3Bf
YmxlbmRlci5oIg0KPiA+IMKgI2luY2x1ZGUgIm10a19tZHBfcmRtYS5oIg0KPiA+IMKgI2luY2x1
ZGUgIm10a19wbGFuZS5oIg0KPiA+IMKgDQo+IA0KDQo=

