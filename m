Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D0BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXu4ho4u1hLbTDmRqDaTpJLX+I1X0rmwXI1cv9aVnOA=; b=sz8vt8CIzqoatwgg2XDfcKMAXp
	lBwAEwncYYNv7trxT2ItO9E99FQI3VfErt9eA5oEvhevh5s0EUfL4+zUW7Kxj9r2sWCXbiaIIyGIP
	YxutkO6dswSNiDYFk4FYFZhIcLkx4hkR+THstgm8tUMqEwEgR6jIum6H+PE74sRZteLNnJ0GgtY2T
	pSN32cO2gyq693oaCMORZVQLcOcbfUMHmvNwc+g8+XYwHYwS6l3MJprbBP2xcwS5AsOXfGs+qSBq/
	AEaFe49T7S2oBsao9BPVFJk+MoGi3+v1GirvjVSQcrNGKTCldw7yf3K3HpqQPwLIwhO9qvhg1p87f
	tRVb3A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrgT-0000000ESYd-23pl;
	Mon, 18 May 2026 06:42:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrgQ-0000000ESXY-1etW;
	Mon, 18 May 2026 06:42:35 +0000
X-UUID: bc21b75a528411f1afed4741b24580c9-20260517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dXu4ho4u1hLbTDmRqDaTpJLX+I1X0rmwXI1cv9aVnOA=;
	b=m47NoUY48NVjAaJo2mNs6f+UjYlFNY0zDOZn3C2GvOhHdZjw3VMUWLRqc3hK+WqNmwt2urga/p6wM8eFNrn9ycCRCwEuFzrRV66C00fnS0qkJJP8HIcvupW/q2ZmMz3IWr3c6iITt1U7Kxb+KmyRuUD74C89FEVyQdRg/i+ho6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:a24c670e-85fd-4a61-91c6-166d11074a81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:0f5c81e1-02d4-4065-accc-97789b7ab0e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bc21b75a528411f1afed4741b24580c9-20260517
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2140809599; Sun, 17 May 2026 23:42:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 18 May 2026 14:42:24 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 14:42:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buxDwEJs2/PZ5VFVClBePbUTF0UG1ypJuHyhMP683l33Zy/Y7nTQIdJGPqVcW5kLeFXFOmpPHq9f5WlcshpwNCOzDffCWjk+DzEMZHZj05pb2slYWoicfA8x5R9vOGvPa25g4wjUzerZdAFIcsDVt8+UqMLd0Pm/7cUNs6W+vyhMC2aBOiZdQfkH441e//t1N5cp1MGA+FMgUS3dxt9x4GfV98JVFRO8PpmEFaW8APH3fzDympPTCJevtaK1ZSqk2vuDSGukoexQhslnw+mn0arJ6nwfrlCHXe+J4kH2Z3no6TpYJwMZm5zzBXfSRCTnCfJtHhZwl5yiHuyJsBPh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXu4ho4u1hLbTDmRqDaTpJLX+I1X0rmwXI1cv9aVnOA=;
 b=dvRAMP9Y148FnjhDC/cNrsaAQH2SlHR0hap7CJPVKO9w+eqljr2OkBwJTuBqW45Xan0RXSv23vdTb6bWtIPw4CyUEF/OhG1aPjvyRjcAvgUjhyMFCJRcYI05bqoy/FZAP61aeDWctmvgI6ZzOqtfaJ+99PA+V/N8d2a73g7nBzj2xB2ZH8N5MLW2T3UqMmF7mcPXu6hy1N+LwQ0PDjjspxjBetNGa65WBE48pE4zlo+l6tWwVgpQ90H8B7kW8S91vJnjqCCd6SyyWmpMuGJbyyQ2W2ANrTHdUmm7vCMRMa0tmD5UwHtT9eNZpRFbQOFoi7H8ytgzU6Axqh0bjGQoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXu4ho4u1hLbTDmRqDaTpJLX+I1X0rmwXI1cv9aVnOA=;
 b=iNWs/D7bAYxVSD7lvZvt6bW8fiNykzEhoU7QGLp75KgK3ym2EOKsuc5Lw1NRki9Lq47coKKxvAIoQKEGSqscBgMnkW1SKa4UqIA1wxrXpNVhiSNv3Hg0mG2U3Xqltvf4Z+/Jnk/nhTBzLizGTTHjbkrKe9zeBvWjrFLsJV+XYcE=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by TYSPR03MB7705.apcprd03.prod.outlook.com (2603:1096:400:40e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Mon, 18 May
 2026 06:42:21 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 06:42:20 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: =?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpoAZ4A=
Date: Mon, 18 May 2026 06:42:20 +0000
Message-ID: <1bea7be27732964905ac38816f8b2c8978af1fd5.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
In-Reply-To: <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|TYSPR03MB7705:EE_
x-ms-office365-filtering-correlation-id: 10c6af32-f510-435e-efaf-08deb4a89c7c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003|11063799003|4143699003;
x-microsoft-antispam-message-info: QFc3Sbfual5CGSjvSJbOq67ktkdWch4HPD3sYlIQ+7vShm0BCl40B9b4roDMac+9/5cE1li/i3jV4Tzv2FkbVJlbplZ3r8XN2Srr8u6PKJV75y+GxMELeCiDo4LctYbmUb1L8kn5XQQq5APvOJLMXYdmVBvJmo252vb6VA0JErYnlkE5JBexiKcTksLnHtP5EnyM+RPnFwNZUp5dYJrXVKv/KiCc4KseBJZh6zm3ifyJJBT2+rGU0x/BlWBhSk5CP13DKLjiziNazMnI3/GiD30z9x293fZq/WphKLg6mjJcihsXP6yVMejFO2HQVSB4U3N3b2+YOG3C+AxgKSHu5Fogwnn6gxXmeBGLGqvreclSXWQ+M+v3dR45YuCDxBCGYMFM7TZMEmYrFupcV7zv5Wx1RHvIlJtxSaG+0WRGY7cCf2ltdo0daz0dIkenF4RKD7HUM8Wvmb0F7O+fmu55uZq9BE55F6gqba3wVmIkNsKEGfQvFis0sXQAhaWWHZePQ+kj/23YZ1Ieldb0sKLL+yv7Q+VpYENP1bDfcJM2I6JAi9a64UcovSqBIZXSM2twB57Jky91bDY2tcCgUzcdbFitbY+MKiFG3GQ0H4kJCps7XmUYhfbStGkCqJg9UO33R5tjJqDe5WyBnWWJdQgL0aDRZU2clFbXkpIgK3S5qI5psuYW+aA862QOgha5qu1LJ1iVAlaLdedWz6ISz0hYLLezRWZO4lTloan/FHT/9GD3nEQQ4Hm3ao6sMF60H9X3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmV6aVNsMWh5N3R0eVZXVlRzMTdmbEV0YnlNNDVrQ0NndGpieWdybXQyWVhL?=
 =?utf-8?B?VFAydVFzRTZNSktUTkh0ZUhTbi9DblBUL3Nya2RYcTBDbTNXVmNmNGlpRHVq?=
 =?utf-8?B?NGtYY0tpNzQ3anVzQnpJMlphN1V2NlJaUGxTaVlTOVJlNE02V2RycXVwTEhL?=
 =?utf-8?B?WDJzSlJEVWNRRTlSZGVZaUx3eFVhZFkzbXdac2VJYkptbWdsMk9qc2dMVFV4?=
 =?utf-8?B?R2JtRGZUd3RGcVUxaklkb1ZVemZYRXN3cmg4bGk0TVNyODRXN0N6UVY3RUVw?=
 =?utf-8?B?VnFlSDZSWDV5bC9xZEVMc0tvN1FTL1Nwcy8xYkxHQ3ZINXhScURQeERQd1lR?=
 =?utf-8?B?cjdqQlMyS3N2VWFOaFFuWmRPYXFvbllwWGNKWEZENTlscXZMbWdNUlBEQlRo?=
 =?utf-8?B?SWVJaVN0cWk4WVlIZzRwQXJJL2NqSXYyWCtHZVdWeXRtdjNhZDE3TjdLQmZn?=
 =?utf-8?B?cEl1ZS9wSmQyRFpMcHVsSWdEWFJHMWFLRk9zSzd3N0lUaEVyMVdEMnBSTzBT?=
 =?utf-8?B?d0ZXRndnZVVjWE4vSE5yOEczSjgwS1BtT1dCRkljejg0dTR2cWhEK1p6K0xj?=
 =?utf-8?B?Szl1eWlzaEpnWmFGNzVDYUc5ekpMWEg5YW1vVTRxT1RZQW4yN3BKR2xyZ2Rr?=
 =?utf-8?B?NGhLdWdDamMvWnk5NGhuMnFDVTlrZGxWVktBdWY2azJYblJnV1c1SmtiSC8r?=
 =?utf-8?B?bXc5Z21XWnFpbG52YnJvdXNpNFNVWURZRXd0YXFvbGN5KzU1NEU3aVVaeUZV?=
 =?utf-8?B?ZTJneGhDWlF0MkQyY3kxUlJYVVprNVp6OGdnaDhmZ2ZvTUg5a29ENXV0L2dD?=
 =?utf-8?B?Tmx6ZXVXVlFLT2FXS09aQ2pEYkpLWG1KTGZiTFlZSlpvZkExNTFseXdLSk5a?=
 =?utf-8?B?R09QNC8vZWtyeXFWSmZuZmxxWGFFc2NOUko5ZWc3UDd3cW8wUHUwNzNIdjRz?=
 =?utf-8?B?UmV6bFExZi8vV2tKNE5xaE9RYTB4WEZKOHRrL2RWMnV0LzZZZXMzcXo4Wkl0?=
 =?utf-8?B?VlEwaXBLZmhiclhjZTJuQlVOSHczU1FmamYzMUhZM3BtUjgxeCtpWkc5aDlW?=
 =?utf-8?B?b1o2SkczL20ybmo0Sm1YZWxSMW1DTmI5ZEUvckRuUkhFR3RrZWJnZWtJb2lX?=
 =?utf-8?B?WVBrdERwVS9xRERaTERiZGJ5c25nSUcvZkkyNkpXcmdLS0lVVUNMNFU1bDVn?=
 =?utf-8?B?amJnRXliY1JqUFNMTlpTU0oraUkyNUNnbHVBRVBnUjhqY0l6dUQ0bEd2TkFX?=
 =?utf-8?B?TDUrT1lrWlJTbUp5dEJubWtaOE9RTEIzQWhGNFc1VEY2R0pyYzBNQ1hkYUJs?=
 =?utf-8?B?Vlc0SGtYek5DekNWRDJibjZsRWRuN0VuTlQxbGZqTkk5cTIvMXVDalNyWHM5?=
 =?utf-8?B?MjI1bU5OQ3Q5MUNJTGZmUjFJb2lkR2kza3BhTlBxK1V3Nmxpc05Cb05MZXNh?=
 =?utf-8?B?U3haeStXTmVsWnhydTY5WlZra2FTa1dVenoraFhUK2NSRzVKWjR6Ykl5ejZV?=
 =?utf-8?B?RTRJak9NSStqZXV1Z0tpSElDZE1wR2diKysxQXRVT0w5YS9pSThNMEpKV0Jo?=
 =?utf-8?B?Mlk0em9UTGs3Tm9Kb0VlSytnVkQwQ3BrQ204QzF5bndTUGVoVmNoWGhicEVX?=
 =?utf-8?B?UnoxbmgvNFR3RkhPM2V2Nk5DQWxzbTZrNVBhZ05kUFNBU2lHTDRlTmdoaVVu?=
 =?utf-8?B?bElNSms2MjF1MlJ4WTlBcUZJbnBZZjJldGQvRm5tNFkrYU5uMTdjZE9iQ1Ix?=
 =?utf-8?B?NnpqR3Vwc2s1YVdYZlZZeHFhYzJJRU9uMjl6K0hXL1VEVDBDdHdQa0RyTVZh?=
 =?utf-8?B?S3BIRTdMcUlFS09XVFo1K0xEaGRsTW50K0dOSzV6Nk42dHBzenNIRmFKNUtB?=
 =?utf-8?B?MzM0VjdzZnRua2k3YUlYeks5Vm1VRHY3OHcwa0hZejE3V1AramFYM3ptclMx?=
 =?utf-8?B?Z1VHejlmK1d3d3N2WnlkL3pQcC9MNlpvdE1hK09IaXVwNURTcElnRW5Dbkkz?=
 =?utf-8?B?L1F6cmpldnREUWt2ZjExczN4RktBSkEzTFE4L0VQd3MxMTR6aE43WDFqbWh3?=
 =?utf-8?B?VmRWZHZxcU9aZUp2ZXNtRjZNZStnQjFYeU5aWXdOOEozNmxMVHl4WTcyY2ZC?=
 =?utf-8?B?eElHZjhFelBPYUY3d3ErTG1wK29IMmJPWXU2Y2VxZ2J1Rkpib2hTOG5YV2Fz?=
 =?utf-8?B?UHNJVUVTQ3VGamgrelZ2UGNCak1GWjlzWEJ1TTJDNFRCRkV3N3JPS2ExMm9L?=
 =?utf-8?B?eklPcDlBNFI3UkdvUFN2MSt5TUhhNlJUWFlmQlhVM3N1UWU0bVBwbzBMK3Y3?=
 =?utf-8?B?eHhiMkdBNmdteGFoNWhNMXU0RVQ3OHhFK09wM1Q4Y0cwOThDNm94UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <835147F5DC1CA042A7FE13F3DCA64300@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: saom5GogfRCjUpeEQV4ttpKY2ZH25NOp/h/KsXQWz8xHwODZzs8UrrHqEjQFFpk6vnItsysJbmTTsIFrIccupdu2yMiBsuBWfAH1VvjziTKIkhj5wPN8v4hIdbWIhj0BOzOSSYXqFIgfaisgHP0wwO0K7YuQ0n8lY8pxJAs9KNmKXTLfkApzOLgr2M4xS5HmIsw7p0sr77DO+HW1Xhfy7MWxmEjEdxzLDAtbXndoi+l0dXQlYdn+pt1FjKlnMHroJev62/uyu8R4ra+hUgbfxQFo7zkAy6gorPK7BMLV3SiNNzIIqFBR5juY1VzZsV/R8hIhfq4R4eTil1lqMfwtBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c6af32-f510-435e-efaf-08deb4a89c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:42:20.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TEk2hB9K/ylkxOxe7QGTH2vTFWQojNzrJZi6B9Z90AYTc8j3jXYo7L1rBPhgSL6YNjnqMmJvAQym6WrmfroTVdZ8oj45yjjzAFiJEu8KGgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_234234_452594_042C4914 
X-CRM114-Status: GOOD (  27.15  )
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

aGkgQW5nZWxvDQoNCkZpcnN0IG9mIGFsbCwgcGxlYXNlIGFjY2VwdCBteSBhcG9sb2dpZXMgZm9y
IHRoZSBkZWxheWVkIHJlc3BvbnNlLiBJDQpoYXZlIGJlZW4gZGVlcGx5IG9jY3VwaWVkIHdpdGgg
TVQ4MTk2IEFsdW1pbml1bSBwS1ZNIFNNTVUgYW5kIFNNSQ0KcmVsYXRlZCB0YXNrcyByZWNlbnRs
eS4NCg0KUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb24sIG15IHByZXZpb3VzIGRlc2NyaXB0aW9uIGlu
IHRoZSBwYXRjaCB3YXMgbm90DQphY2N1cmF0ZSBlbm91Z2ggYW5kIG1heSBoYXZlIGNhdXNlZCBz
b21lIGNvbmZ1c2lvbi4gSW4gZmFjdCwgbm90IGFsbA0KU01JIGNvbW1vbnMgaGF2ZSB0aGVpciBi
YWNrdXAvcmVzdG9yZSBoYW5kbGVkIGJ5IHRoZSBSVEZGIGhhcmR3YXJlLiBUaGUNClNNSSBjb21t
b25zIGFyZSBkaXN0cmlidXRlZCBhY3Jvc3MgdmFyaW91cyBzdWJzeXN0ZW1zIChlLmcuLCBtbWlu
ZnJhLA0KdmVuYywgZGlzcGxheSwgY2FtLCBldGMuKS4gQ3VycmVudGx5LCBvbmx5IHRoZSBTTUkg
Y29tbW9uIHVuZGVyIHRoZQ0KbW1pbmZyYSBzdWJzeXN0ZW0gaXMgYmFja2VkIHVwIGFuZCByZXN0
b3JlZCBieSB0aGUgUlRGRiBoYXJkd2FyZS4NCg0KVGhlcmVmb3JlLCBJIGJlbGlldmUgYWRkaW5n
IGEgc3BlY2lmaWMgc2tpcF9ycG0gZmxhZyBpcyBtb3JlDQphcHByb3ByaWF0ZSBoZXJlLiBJZiB3
ZSB3ZXJlIHRvIGRpZmZlcmVudGlhdGUgdGhpcyBiYXNlZCBvbiBhIG5ldw0KTVRLX1NNSV9HRU4z
IHR5cGUsIGl0IHdvdWxkIGltcGx5IHRoYXQgYWxsIFNNSSBjb21tb24gbW9kdWxlcyBvZiB0aGF0
DQpnZW5lcmF0aW9uIHdvdWxkIHNraXAgdGhlIFJQTSBvcGVyYXRpb25zLCB3aGljaCBpcyBub3Qg
dGhlIGludGVuZGVkDQpiZWhhdmlvci4NCg0KVG8gbWFrZSB0aGlzIGNsZWFyZXIsIEkgcGxhbiB0
byB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBuZXh0DQp2ZXJzaW9uIGFzIGZvbGxv
d3M6DQoNClN1YmplY3Q6IG1lbW9yeTogbXRrLXNtaTogQWRkIHNraXBfcnBtIGZsYWcgZm9yIGNl
cnRhaW4gTVQ4MTk2IFNNSQ0KY29tbW9ucw0KDQpCb2R5Og0KT24gTVQ4MTk2LCBjZXJ0YWluIFNN
SSBjb21tb25zIGFyZSBiYWNrZWQgdXAgYW5kIHJlc3RvcmVkIGJ5IHRoZSBSVEZGDQooUmVhbC1U
aW1lIEZ1bmN0aW9uIEZpeCkgaGFyZHdhcmUgcmF0aGVyIHRoYW4gYnkgc29mdHdhcmUuDQoNCkZv
ciB0aGVzZSBzcGVjaWZpYyBTTUkgY29tbW9ucywgc29mdHdhcmUtY29udHJvbGxlZCByZWdpc3Rl
ciBiYWNrdXAgYW5kDQpyZXN0b3JlIGluIHRoZSBydW50aW1lIGNhbGxiYWNrIGlzIG5vIGxvbmdl
ciBuZWNlc3NhcnkuIFRoZXJlZm9yZSwNCmludHJvZHVjZSBhIHNraXBfcnBtIGZsYWcgdG8gYnlw
YXNzIHRoZXNlIHJlZHVuZGFudCBSUE0gb3BlcmF0aW9ucyBmb3INCnRoZXNlIFNNSSBjb21tb25z
Lg0KDQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KDQpGb3IgcmVmZXJl
bmNlLCBoZXJlIGlzIHRoZSBsaW5rIHRvIHRoZSBwYXRjaCBzZXJpZXMgb24gUGF0Y2h3b3JrOg0K
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlz
dC8/c2VyaWVzPTk0NTgxMSZhcmNoaXZlPWJvdGgNCg0KVGhhbmtzLA0KWHVlcWkNCg0KT24gVGh1
LCAyMDI1LTAzLTIwIGF0IDEzOjExICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3
cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMC8wMy8yNSAwODozNiwgWHVlcWkgWmhhbmcgaGEg
c2NyaXR0bzoNCj4gPiBNVDgxOTYgU01JIGNvbW1vbnMgaXMgYmFja2VkIHVwL3Jlc3RvcmVkIGJ5
IFJURkYgSFcuDQo+ID4gSXQgZG9lc24ndCBuZWVkIFNXIGNvbnRyb2wgdGhlIHJlZ2lzdGVyIGJh
Y2t1cC9zdG9yZQ0KPiA+IGluIHRoZSBydW50aW1lIGNhbGxiYWNrLlRoZXJlZm9yZSwgYWRkIGEg
ZmxhZyBza2lwX3JwbQ0KPiA+IHRvIGhlbHAgc2tpcCBSUE0gb3BlcmF0aW9ucyBmb3IgU01JIGNv
bW1vbnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWHVlcWkgWmhhbmcgPHh1ZXFpLnpoYW5n
QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFNvIHRoZSBNVDgxOTYgU01JIGNvbW1vbiBkb2Vzbid0IHJl
cXVpcmUgYW55IGNsb2Nrcz8NCj4gDQo+IFRoYXQncyBmaW5lIGZvciBtZSwgYnV0IHRoaXMgbG9v
a3MgYmxvb2R5IHNpbWlsYXIgdG8gTVQ2OTg5J3MgU01JDQo+IGNvbW1vbiwgd2hpY2gNCj4gaXMg
U01JIEdFTjMgYW5kIG5vdCBHRU4yLi4uLg0KPiANCj4gLi4uLnNvLCBhcmUgeW91IHN1cmUgdGhh
dCB5b3UgbmVlZCBhIGBza2lwX3JwbWAgZmxhZyBhbmQgbm90IG5ldw0KPiBNVEtfU01JX0dFTjMg
YW5kDQo+IE1US19TTUlfR0VOM19TVUJfQ09NTSB0eXBlcz8gOi0pDQo+IA0KPiBSZWdhcmRzLA0K
PiBBbmdlbG8NCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL21lbW9yeS9tdGstc21pLmMgfCAx
MSArKysrKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvbXRrLXNt
aS5jIGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gaW5kZXggYThmNTQ2N2Q2YjMxLi5i
OWFmZmEzYzMxODUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+
ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gQEAgLTEyMyw2ICsxMjMsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19zbWlfY29tbW9uX2Nsa3NbXQ0KPiA+ID0g
eyJhcGIiLCAic21pIiwgImdhbHMwIiwgImdhbHMxDQo+ID4gICBzdHJ1Y3QgbXRrX3NtaV9jb21t
b25fcGxhdCB7DQo+ID4gICAgICAgZW51bSBtdGtfc21pX3R5cGUgICAgICAgdHlwZTsNCj4gPiAg
ICAgICBib29sICAgICAgICAgICAgICAgICAgICBoYXNfZ2FsczsNCj4gPiArICAgICBib29sICAg
ICAgICAgICAgICAgICAgICBza2lwX3JwbTsNCj4gPiAgICAgICB1MzIgICAgICAgICAgICAgICAg
ICAgICBidXNfc2VsOyAvKiBCYWxhbmNlIHNvbWUgbGFyYnMgdG8NCj4gPiBlbnRlciBtbXUwIG9y
IG1tdTEgKi8NCj4gPiANCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3NtaV9yZWdfcGFpciAg
ICppbml0Ow0KPiA+IEBAIC01NDcsNiArNTQ4LDkgQEAgc3RhdGljIGludCBtdGtfc21pX2R0c19j
bGtfaW5pdChzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldiwgc3RydWN0IG10a19zbWkgKnNtaSwNCj4g
PiAgIHsNCj4gPiAgICAgICBpbnQgaSwgcmV0Ow0KPiA+IA0KPiA+ICsgICAgIGlmIChzbWktPnBs
YXQtPnNraXBfcnBtKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBjbGtfbnJfcmVxdWlyZWQ7IGkrKykNCj4gPiAgICAgICAgICAg
ICAgIHNtaS0+Y2xrc1tpXS5pZCA9IGNsa3NbaV07DQo+ID4gICAgICAgcmV0ID0gZGV2bV9jbGtf
YnVsa19nZXQoZGV2LCBjbGtfbnJfcmVxdWlyZWQsIHNtaS0+Y2xrcyk7DQo+ID4gQEAgLTc4Myw3
ICs3ODcsNyBAQCBzdGF0aWMgaW50IG10a19zbWlfY29tbW9uX3Byb2JlKHN0cnVjdA0KPiA+IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICBjb21tb24tPmRldiA9IGRldjsNCj4gPiAg
ICAgICBjb21tb24tPnBsYXQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiAN
Cj4gPiAtICAgICBpZiAoY29tbW9uLT5wbGF0LT5oYXNfZ2Fscykgew0KPiA+ICsgICAgIGlmICgh
Y29tbW9uLT5wbGF0LT5za2lwX3JwbSAmJiBjb21tb24tPnBsYXQtPmhhc19nYWxzKSB7DQo+ID4g
ICAgICAgICAgICAgICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlfR0VOMikNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgY2xrX3JlcXVpcmVkID0gTVRLX1NNSV9DT01fR0FMU19S
RVFfQ0xLX05SOw0KPiA+ICAgICAgICAgICAgICAgZWxzZSBpZiAoY29tbW9uLT5wbGF0LT50eXBl
ID09IE1US19TTUlfR0VOMl9TVUJfQ09NTSkNCj4gPiBAQCAtODE0LDEzICs4MTgsMTQgQEAgc3Rh
dGljIGludCBtdGtfc21pX2NvbW1vbl9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ID4gICAgICAgfQ0KPiA+IA0KPiA+ICAgICAgIC8qIGxpbmsgaXRzIHNtaS1jb21t
b24gaWYgdGhpcyBpcyBzbWktc3ViLWNvbW1vbiAqLw0KPiA+IC0gICAgIGlmIChjb21tb24tPnBs
YXQtPnR5cGUgPT0gTVRLX1NNSV9HRU4yX1NVQl9DT01NKSB7DQo+ID4gKyAgICAgaWYgKGNvbW1v
bi0+cGxhdC0+dHlwZSA9PSBNVEtfU01JX0dFTjJfU1VCX0NPTU0gJiYgIWNvbW1vbi0NCj4gPiA+
cGxhdC0+c2tpcF9ycG0pIHsNCj4gPiAgICAgICAgICAgICAgIHJldCA9IG10a19zbWlfZGV2aWNl
X2xpbmtfY29tbW9uKGRldiwgJmNvbW1vbi0NCj4gPiA+c21pX2NvbW1vbl9kZXYpOw0KPiA+ICAg
ICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+ID4gICAgICAgfQ0KPiA+IA0KPiA+IC0gICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRl
dik7DQo+ID4gKyAgICAgaWYgKCFjb21tb24tPnBsYXQtPnNraXBfcnBtKQ0KPiA+ICsgICAgICAg
ICAgICAgcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBjb21tb24pOw0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiANCj4g
DQo=

