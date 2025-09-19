Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDEFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKKc3djEVaUlXzcq1d4hYSCw5DsWn+oZ98YERmi/AyY=; b=jo2fxnGqBOF6SEqv307SvnJTaC
	jmPe1TC0PzFpGVgcPuNnahqOT0uyc0NCIy+HjH3vwRO4YnWI4nLp2P29QdPVBceDiDZ9C+acjgBkM
	4Q1Xo+2DB1cKHetXLmT5RcTgcQ9i2SjWmWU/7HdcF55y3v1oZDqc7tsBG43c11AgqCUFQfVQsyCwv
	8SLTn0RMfuQ0Tgwfy+Q186ez/maZflYAsxlYrqC8t4bXWYnP4oriPaBTmbTzgHOlpX+H/2rENj3Xt
	sEQxqsLu/HDG5Xrmyt1IBsU6oyb2zMCq2h3AC2rXkNTqLtxTVl38pMfs3RIGaYRPhiIkpRRqzWXIo
	L709CHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXEc-00000002Lav-0uEt;
	Fri, 19 Sep 2025 09:16:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXEZ-00000002LaM-1DNa;
	Fri, 19 Sep 2025 09:16:52 +0000
X-UUID: 5b630fa8953911f09f706fa2197c6ceb-20250919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gKKc3djEVaUlXzcq1d4hYSCw5DsWn+oZ98YERmi/AyY=;
	b=iCU/xBwhFb1U/wV/XfgNYurPN/TvYdRXC+ZioFJ8RO0EaZPFC27P+LYDg1blKgvYaz90h06XxUC8r+idXy7GUIiIxOmFND74AcnWPUL0ZyZcJh90Uxdl28S/UbCe3KmDB48FgoyaOspIzq16d/mmoeyW16A5s5WM6GENqJlxXws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:a2cc9859-079c-42c1-8690-4f76d6c6bb1d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:7ca1f784-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b630fa8953911f09f706fa2197c6ceb-20250919
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 501668157; Fri, 19 Sep 2025 02:16:42 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 19 Sep 2025 17:16:39 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 19 Sep 2025 17:16:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tujY8GWQ9+gIsQptHelgwhxrklh6H3OL5ifq1lejvNnf5mziiwN4d0VSAzSkrsVze48HkzQww7m0q1BQOEw6Bg+xta7jrEgVqm5cSZOju5JbNyBSviwR5f264i2NC4YAQUfDiVSW5S0s44QS62Iqddjcaxrvnsqn7GU73wibc84mpB3WrUSjA4qeTIjvFGx8xi+5xU3GNrEbWunTFLENgxi1HtyDqCiNQ2NDArRm1SdiuVSr9P1r/YHnnKXcPCOawvDY6/xvg2RLv1DaOnZqb9V546o5y3Q3j18Tog5Km39snAfsQc6JQRAZo33t+iVEQ9IwSNwE6zLD3xzWdcyG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKKc3djEVaUlXzcq1d4hYSCw5DsWn+oZ98YERmi/AyY=;
 b=l1+u0oS5/yYw5/oSSSRlZer9CPhT6y/7uv23WE0fm80V2U/CwnuKQw4ZIK58cWgod3zMINKjrAEMfHT5lTXEGizYnzxyTq3kdHPlPveQXmIlhumwkRvPZseje0c7Ct4RtWNMNPL1a75SFXCpLablxH9iKCvZvkzBv+NMr6n7TBD72lBVnFCnrEpBOnHj/0GHdDVhBlfapLMpZU7kSuSd9vnuFCTXiwo26IH8nt957UP7fs4pifT/xIFaTEjQ21yf6vibQBluLSD4KxBmturS9qaDMluT06f4u8QmDBjYVNw3+SgtFKJXCDDlknMz6g9k2lx1AVItMFwKbSlIkoF3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKKc3djEVaUlXzcq1d4hYSCw5DsWn+oZ98YERmi/AyY=;
 b=aqkZYb8oiWYEqk04m39QgcdaJIQqa+LMYCcuR2z2apmYSavspOBk+LD0NbCGspB5KKMNCYXvG7b/AUTailXzUbUCB7nNHyOqBWPqdVp9BLGjC9sz9U8pBUVdyrt9iD+tv1dqJsuazXbzw6C8r9T0K9sqdZeoT4SZ7TMW5Khsoss=
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com (2603:1096:301:5f::10)
 by SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 09:16:33 +0000
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f]) by PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 09:16:33 +0000
From: =?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Topic: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Index: AQHcEwpW87Sc9bspPUqF1pf91CjDQbSZyAEAgACeFoA=
Date: Fri, 19 Sep 2025 09:16:32 +0000
Message-ID: <1caca959976d415e1bf8dbcd3146d2c9e0665b93.camel@mediatek.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
	 <20250822021217.1598-3-jjian.zhou@mediatek.com>
	 <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
In-Reply-To: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6363:EE_|SEYPR03MB7588:EE_
x-ms-office365-filtering-correlation-id: ae203625-322f-45bd-a180-08ddf75d39d7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TlRJdVZiOFJFRUJPQmg4OWUrYmZDVGIyQmRZQXo5NFM1NEFCL1VucjdWclM1?=
 =?utf-8?B?YjJ3M1dPbEFxWkN0V0pmVlJLRzlVQlpBSTM0RytuSGEwcHI5c2NHbHRYbHlz?=
 =?utf-8?B?eEFjMXI0dWp2ZU04TTE0Nk5QUVFyT3E3ZDhhaS8xVkNmUndiUWNjbFJmLzhu?=
 =?utf-8?B?Y2NSeEZXWEZjZ3NKWTNJL0l0YWN1VWVBUlhMUU4rejZPNFdNNXZseXVjRVBi?=
 =?utf-8?B?cjE3SDladi90eFIvMmVHbjgwb1J3Y0dxNDIvZUtLRGZnWXYyU01FLzhCM3Bw?=
 =?utf-8?B?dHFUOVFzQjFuNDNzY284VDNzdml2WWNONHhUQUdlaHJWTWkrMmM4SEU0K0Uv?=
 =?utf-8?B?aThFSk1talRJTW9pMmh3a3BZVkdRVXJnRE1zalRWU240dUw2cFFPZzd3K00x?=
 =?utf-8?B?VjdkSnZKOHhsaC9OTE1PRDBPdEFDcFdIUTV3eVNJL29rK1NVVmhMd1IvZkdv?=
 =?utf-8?B?NVd3VHVnSTJRamJjeHkzOFdlL095eFpYMzRWeFUwcDhmSVBYTTJUTVhDbDdO?=
 =?utf-8?B?N2o3VjVkOWZ6bCs1Z21idkJjTUlBSmFwdmRaWVN3VVA5SXhkTEJLMGdza0ox?=
 =?utf-8?B?dC9GYTlieG9pLys4bThNN3JkMHdOUjV6d3pLK1MwSjZKUndsd0dWZGRWSlFo?=
 =?utf-8?B?akpZMVV0TGZrTTh4TkFQell1VTRRME5BMlZFdElseTI3ZEFtUmVNcExEZHdY?=
 =?utf-8?B?a0dHVFhpamxaemZ1elA3RUFJTjhQOXJCUzhXZGJDSi9JWmxsSVFrL1hocktv?=
 =?utf-8?B?Q2hKQlZuVkwvTmh5OGc4ZGVMbkx1c1RGMHY3SytOb3c0VXlKK3d3RkFXcHNM?=
 =?utf-8?B?eHg2MkhNbHJHc3pQZVdNbi83d05zVmVVREt0OVdkekdWS0FNbGY2VkkvS3Yz?=
 =?utf-8?B?ZW05cVROY2EvNmR1ZWNyWnQrRmxMQkpCYUlSU2p0ejVPNk9ZNG5wamNrYnVs?=
 =?utf-8?B?b0l1UnBDWU81TFZnN2xYR0pqT0FwTkxRZWFmemlQaEw1ZXJQZnA5RHlaVkgz?=
 =?utf-8?B?MXlLTVpuUjFkeVVFTlJ5N0xPeWlmNktxYVI5Vi92bW16QkgzSUg5djVwalFi?=
 =?utf-8?B?YjB5c240UnR6Tmw1UDliZU5PblpoWWRFRjJaS3BncHFTT1JFdk1FUC9ydFM0?=
 =?utf-8?B?SStYK0JLbnUwcmpSQVFBYmJ4RlNpNlVZVnNkVXk4YitNMXd1VWw1YVdTaWx6?=
 =?utf-8?B?T2dVZ1pQa2pNQlN2U1FIbVpEOEVGcUgxSmpiSFdzbjJEYk9zZFYzVWREQkoy?=
 =?utf-8?B?VTJkem9ZbW1wdnlpMjVIbXgwYmFMU25mdmVhdEZJRFlFa0xvbmFUSk5EK3A5?=
 =?utf-8?B?MHptR3hvaS9MRkwyY2U3RGZ2U2FLQnkxbGt4NFo4bTV3cm0yMWhIUFl1SW5Q?=
 =?utf-8?B?cUZmL1VsbUdLRHJGaHdpR0Fndm8za3YxZDVOSk9mNEp1emNSdVhyQnJ6N2tE?=
 =?utf-8?B?bnhWd00xYWM0Y2NCcU5xeGhrdDNWNnZyc0VrVFQ3Zm5ZS0RxMW5YZ2o1RS9B?=
 =?utf-8?B?S05PdDdmSXBRblFHY3dVOHpBbVhkcUtiN0k3YkZlQWJCZEd4WW9Ic2ZHMGhB?=
 =?utf-8?B?ZUdnTXVzME14S0xxNkIvTGQ0NDNzdFpMSmhlYjNXUk13eVhoaFY3Wm5JMUcx?=
 =?utf-8?B?cGNwdmNKN0hhTWh0NndBMFpwMmRTZ0VMUTNMQytGT1FOa0x1U2g2Nk1vSzZD?=
 =?utf-8?B?ZGJTTkpsckFWbUdGT21IN08xdXAzMCtvL3FXVFhrdURBUWd0c0tKUG43QjVw?=
 =?utf-8?B?djFCY3FTUDVPampOOVhXZW5xaHQ1TkZCc2Vqa0ZOY0RyZE1WYjdNZU1VZWZy?=
 =?utf-8?B?eEFDamlGMzdwWmcwOEZuYnAreHlKeEZzSGFEUnpYcVAwK3F4Z0ZHOElISmVH?=
 =?utf-8?B?U1AvVkdJRS9nMTI4bjJBQm00MkJYdHpGRmpiUTlCME5jNUlWbGR2N00yUmo2?=
 =?utf-8?B?SXB1OWUrbEFMNGh6UmxxVjE2dzlsQldaMExENVB0bWliejhQUTZaT2VBQVZC?=
 =?utf-8?B?YVNBaGhyNGtnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6363.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1hQMkpyTDZGQjQzL3Zmd2hMOUltaWt3UWIzUWpvb2Y0K25tdGhreENWaXZV?=
 =?utf-8?B?elZic2NKRys3Y1M4V2dZUmJoc0ZoMHpVQXI4bTNicFdtc1N1THV4V0MwZ2ZK?=
 =?utf-8?B?RHJSQjZPT0E5VllJdGJHQlF4akpPaDYweWtGQ29kY2N1YU9IdFI1S1N1OEhJ?=
 =?utf-8?B?cWM2eU42bm9zV3JTdk1vRDZVWTNnYzlDSlFhZDVRYmRYQmFJTk5kVTV5dkh3?=
 =?utf-8?B?cjU5MitvT1BkOUZPTEI5N0xhazAvL0NtQlZ0eUt1SER1eEFKeWhFZkJnMjFw?=
 =?utf-8?B?MDEzZmVhclZZRjYybmZpS0hGYm5rcmFVa2IydzBDUDAwemJlOVBENk14emh4?=
 =?utf-8?B?bHRBdUx6WXdId0Z1YnZJN2hYRTE4TmlEUklJSmQ2czZ5ZXRXa1J0Uzg5TytD?=
 =?utf-8?B?bWZFRGFRSVZwWDRrOEo0WXBZL3JHUDcvSzJ3eTZHdEl3ZW1ROGVSVStPdlJL?=
 =?utf-8?B?dC9RT3k5VWpDNkowejZ3bmYzQnVVZ0pZdGwzaDQ4MEg2SGZhRERDOGkxNDBR?=
 =?utf-8?B?ak03dEJUWkFXK2NEZlVPVVZOeEV3eSszd0NPeGwxcUxwbmVGVXgxS2lsYUg0?=
 =?utf-8?B?Qk9wYUR1SEsxbjV0NnpRQW1KaGNsTmxodlZwOVhLVnZkK3FrMlV2c3Q2OU9Q?=
 =?utf-8?B?cENpM1RnS1p0NHFETlIybmVJRWVhR2dFVWk4Qm5QOXN6NzByV2NoWTBxZTFU?=
 =?utf-8?B?cHBzVndNZkVWQmdlYTg1ZC9ET0EraFJEcXRudjkrNXJuSUR5TFBGc1M0VDhh?=
 =?utf-8?B?bW5NY1I2Z2lxeURzVmRaTHR5eVc5NWtkVGVXS29qY1dhNHorOFRTZk1OMk8y?=
 =?utf-8?B?VEMxdGJOZVpkZ0cvQ0cxcGkvand0eUZDdkFuUFM0anNSRHNJeTl6eHB6NjVk?=
 =?utf-8?B?QlZyV0Q2bzJrUi9aU2I0YWNTcmVQSjI4S2RINm9QSCtGR0tiQ0t4V3h3ZTJZ?=
 =?utf-8?B?bXZxUjdKcDFNZ2pROXZ3Z2JtV2J1S1ZsQnBsdzlRWm1vdGtVdzZmVGl5eGVE?=
 =?utf-8?B?UStMOWhmaDMzMUJuVlE0bG9ZNng0VjlyeTEza05SMVViS3NlYzRJb3N1b0Vu?=
 =?utf-8?B?RDNIdWw3Q3VscFdCanNaVVgyMU8xQmdBWU5takhnNVJHd2JDdk5OVXdXeldl?=
 =?utf-8?B?c1RvczVkUGltREM0bjZXdk1xbHJETHFidHgxNVlJbkFTbG1HcjEwdnNwYWg1?=
 =?utf-8?B?RnFDazkvZlI1cXJaZU5IRXpaQnNOUjd5cDVTUlNaZisvRnhrMnNleVBvc3hi?=
 =?utf-8?B?L3lObXBkd2Q4c0dCalMyUDRJZGx1SDZGTzBOSStsZk5xSmFPeUpKclFuQ3Ny?=
 =?utf-8?B?OVFUVDRaMkpNcnR4Rndick1pVTRLbys3Q05uYTFDY2NhK1k2bFNJMHduamZ4?=
 =?utf-8?B?RTdtV2YxdlBHTm5sd2pMcHV6cWNCN1p1cFRmQ3FmVngwckhiMUhxOEgyZjZu?=
 =?utf-8?B?UDJoTjh4Smw3dlpWQ2t6NjIzaEtRYkx4Sm84NzFwa0t2M1I5SFJrMTRRdm80?=
 =?utf-8?B?YzdTOXVDbSt0Yis1TlFKZm8veXNHNWZ4MjF3MEczWU5mazloUzVkUmJuN3h5?=
 =?utf-8?B?QXFzTnZkUGh2R0ljQ3h3amFNRFRqMHZRMXFVY0wvZkVMSFpESUF5aURiYmo3?=
 =?utf-8?B?VEFmd1JmM1laSjZZYkJLa3VuK2h1N1hZQjZRZHRNQURuWmFQRVNhbm9zaS9h?=
 =?utf-8?B?STIrMENpQ3NWUCt4VC9uWGlIZFRlbkFkaWl3SGt4Sk5QK3phZnFJbnFBekl6?=
 =?utf-8?B?ZlhiMmdzbE5MQzBsTnFBSHVKcnVkRVZRWDMwdUdPbVgrRk85dkI2TDJ5T0li?=
 =?utf-8?B?VXZCM1dxQWhMd01CSUJrNkk5MzhPN1U0M1VCYk9paDdMY0p3MDVuR1h2aDF5?=
 =?utf-8?B?bUoyK1BBR2ZXclprbUg2ME1SbkRUYlNQd3lXaWRpbjJpVG53NEZjY2dGcnd0?=
 =?utf-8?B?WkNoZzMxd1BvUmE5T0o4MjVGMkxDOVM4QXJyVjBPSGw1VVMvTWdYMlFoS3Vo?=
 =?utf-8?B?QUhsL2tNUEE1NTVUcVFsS05rTjBwV2xJTU1IM3MvaEFwU1oyTUx6SUIxM0dx?=
 =?utf-8?B?MS9vclJpSE9sSWMyTmNFRllSNjVkeUN3U21DM3pGTlVDaVkvOFR2eDlSOVM2?=
 =?utf-8?B?QzUzMmFXZkhRSUk3dytQazFQcEV1TmNtQVFNNnovbHowTXVQWHEyc0dFcFRt?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9E6D3006CF30D438EB0D46A58EE3AC7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6363.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae203625-322f-45bd-a180-08ddf75d39d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 09:16:33.0318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyaqNPnhPbL+BAbdlFyvO0mKbM0P8zDcqOwv5bT6CexOawb7cffnCRR1HyCg5Yan6hnqWxft2T4ynu26NQHerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_021651_348064_3440C2D2 
X-CRM114-Status: GOOD (  16.23  )
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

T24gVGh1LCAyMDI1LTA5LTE4IGF0IDE4OjUwIC0wNTAwLCBKYXNzaSBCcmFyIHdyb3RlOg0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IE9uIFRodSwgQXVnIDIxLCAyMDI1IGF0IDk6MTLigK9QTSBKamlhbiBaaG91
IDxqamlhbi56aG91QG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiAuLi4uLg0KPiANCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiA+ICsNCj4gPiArc3RydWN0IG10a192Y3BfbWJveF9wcml2IHsNCj4g
DQo+IE1heWJlICdtdGtfdmNwX21ib3gnIGlzIGEgbW9yZSBhcHByb3ByaWF0ZSBuYW1lID8NCg0K
T0ssIEkgcmVwbGFjZSBtdGtfdmNwX21ib3hfcHJpdiB3aXRoIG10a192Y3BfbWJveCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+
ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICsgICAgICAgc3RydWN0IG1ib3hfY29u
dHJvbGxlciBtYm94Ow0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a192Y3BfbWJveF9jZmcg
KmNmZzsNCj4gPiArICAgICAgIHN0cnVjdCBtdGtfaXBpX2luZm8gaXBpX3JlY3Y7DQo+IA0KPiBN
YXliZSBhbHNvIGhhdmUgInN0cnVjdCBtYm94X2NoYW4gY2hhblsxXTsgIiBzbyB0aGF0IHlvdSBk
b24ndCBoYXZlDQo+IHRvDQo+IGFsbG9jYXRlIG9uZSBkdXJpbmcgdGhlIHByb2JlLg0KPiBBbHNv
IGlmIHlvdSBoYXZlICAic3RydWN0IG1ib3hfY29udHJvbGxlciBtYm94OyIgYXMgdGhlIGZpcnN0
IG1lbWJlciwNCj4geW91IGNvdWxkIHNpbXBseSB0eXBlY2FzdCB0aGF0IHRvIGdldCB0aGlzIHN0
cnVjdHVyZS4NCj4gU29tZXRoaW5nIGxpa2UgInN0cnVjdCBtcGZzX21ib3giIGluIG1haWxib3gt
bXBmcy5jDQo+IA0KPiAuLi4uDQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IG1ib3hfY2hhbiAq
bXRrX3ZjcF9tYm94X3hsYXRlKHN0cnVjdCBtYm94X2NvbnRyb2xsZXINCj4gPiAqbWJveCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dA0KPiA+IG9mX3BoYW5kbGVfYXJncyAqc3ApDQo+ID4gK3sNCj4gPiArICAgICAgIGlmIChzcC0+
YXJnc19jb3VudCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIG1ib3gtPmNoYW5zOw0KPiANCj4gcmV0dXJuICZtYm94LT5jaGFuc1sw
XSAgIHNlZW1zIGJldHRlci4NCg0KT0suDQoNCj4gDQo+IHRobngNCg==

