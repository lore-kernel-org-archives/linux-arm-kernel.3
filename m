Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50453CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhpidOuvjK/PCwpXDuCtiLBH7krNWYQRdjOWzgKu0h8=; b=0gqD5UMgYE2rTZzXE20PnSkeqE
	wtlUcaao87JybtxmEz8yOexjoHbnAYhVWieJl4sm/wx8RJkStZWC5XyS9UWtuQIRLyaKm4dDgLS39
	Kc1jsQifBHxQmduhg6a40WI1smYc76yPgiyI/YD9Y0komkws0ZH7pfftpW3du6dU3LHc/eHzX8btr
	hhI5BZ6zSrb4E8+QJ8e37oP7p3xbwMpAKxGNeC42J/ck72tYzVSP1/WdRgoa6JjyXEqoTFzLiv32B
	rQ5rWKCeRLxTZ4BST/y6psCMjWV3RKbYTFmI/wHfQfrz+jSlPUThVp01sa2tBAQttmUgglBNtrVRb
	4+L3onGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V8y-00000004Y3g-1z1G;
	Tue, 30 Sep 2025 07:51:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V8v-00000004Y2H-3SIB;
	Tue, 30 Sep 2025 07:51:27 +0000
X-UUID: 40087ca69dd211f09f706fa2197c6ceb-20250930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yhpidOuvjK/PCwpXDuCtiLBH7krNWYQRdjOWzgKu0h8=;
	b=fBa21+HF76C/tmarbnM8X8hT9tTSgt5X1c/xP+R2kgmg6+HLTeVdCFH3mo5N+Qqi034VeVz94/pIWnRQ0DanywzP//p2I8+TO1uGuGBINduVojwIdE67n6e+W/IYnikqVmQft4OCbDn7ZJbzFzdnfVZ/J2DwT8iNIO3WDSclDYY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6ac13d55-67b9-4f08-8102-0a3064f1260b,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:4e99156d-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 40087ca69dd211f09f706fa2197c6ceb-20250930
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585689189; Tue, 30 Sep 2025 00:51:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 30 Sep 2025 15:51:15 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 30 Sep 2025 15:51:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amUnVipDFyyPZJWUPLe7gBY8Efm5ERxw5Q1Vh6bal5NxpcjTFCANbb4t3nqZxXxrvVyyBoFj9AFiePi+dwKNTKSewkiTSDF/7ixn15UA1HZ47yrbcGzx0+DiQFr7Oa3bLeFxed4+fkeEBtk4Owp56q8XEFcdnqA0v3fn4s+627yrbM2UA+TbqYdYSV6I/U71beg4iIKzo4poDUihJ32KT1qhioBdWMruJTthtQ2gO3M2U0TKYcaAOlKvoVTnrsJFa8rHjcdDqpM95BYDDL8zHOoZNfIOSZK5anahfT8LjBn5eEO6P7p+ZsJsXHE6QpC5VsLPdiVXqcHbtfwxvK9chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhpidOuvjK/PCwpXDuCtiLBH7krNWYQRdjOWzgKu0h8=;
 b=IgAOBS4MvOdstIfXXcMLpe+MDPooEhVrVTkmF69fGS/HhB2zi4PY1zlFGnEi1BPww983G7iK9XYUAxlrqp9fE4y0CQansDyqTOveUroH/vs4rx3KKtxWO39k0aiJgl5ThtOHqu5tOmO3r3LlqNYlBT4dtRL4LSer3ZuVgFwguU4Y5//QkzhmRcJHhecc31XBJ52x6RkA5DPJkkgKO5IjcNMC8h7tjj5b6eo61dUNTPi0J4qeEvit+aBvAapMv0qxdXQlR0EMKkw3fEX+pZGJJEE+BFJEWRekLa7Tk2QLCXoOOOZ58fzskTY2Sw/MnYknJ7uIHzuDIipfRATvvrcVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhpidOuvjK/PCwpXDuCtiLBH7krNWYQRdjOWzgKu0h8=;
 b=UXPEFWLENsvzUTJe/Rhw44ulJI9Fwk6rqAHCSK0wewrtU1hNxhurQMxlMuxflkI/Zav5i+KcF7CsFVmYwj8qJzoDHUuw0SHCADDUplJq+x0NT19CMSfWovmdnUw83zHYAMNqFS6Vpji1es4269tcOI3s+ypXK6xTYHVf4s1buXo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8810.apcprd03.prod.outlook.com (2603:1096:990:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 07:51:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 07:51:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"hsinyi@chromium.org" <hsinyi@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
Thread-Topic: [PATCH v1 1/1] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
Thread-Index: AQHcKrxJFvgScr5P1UCW7F2TsTOBzLSraIGA
Date: Tue, 30 Sep 2025 07:51:11 +0000
Message-ID: <ec1c7d3deca62adca0ee016a3691a4d8b8f0bdb4.camel@mediatek.com>
References: <20250921055416.25588-1-jay.liu@mediatek.com>
	 <20250921055416.25588-2-jay.liu@mediatek.com>
In-Reply-To: <20250921055416.25588-2-jay.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8810:EE_
x-ms-office365-filtering-correlation-id: 209ebb33-543e-4384-8c5e-08ddfff62024
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|42112799006|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MmtOblhpT290UEFma0FCcEFSMkh2UEVyeUN3V2RHc0ExdlhNbkFlc3d2OE1w?=
 =?utf-8?B?S0hvZ05Ca2FMR1RUL29VTnFsVnN3STBjRUpja0ppYnpmdEl6QVUyLzlWU3Rh?=
 =?utf-8?B?Ry9tL3VzaXJ0Q0ExM3pvZC92REJod2oxY0gwbUpFTmRvSFpEUjdDR01EdExC?=
 =?utf-8?B?NTFZY3dXUHRaQXROU2F3YzREQ2ZRRHh0UFY2NnFhQTMvMnlXQk9pMGZIV3Zo?=
 =?utf-8?B?bUZNZE0zdzZmQkszUEJrRjdaRDhLdWhTdTNRQWlNcHl1SXpUbTlnalRpRzgx?=
 =?utf-8?B?WDNZNmhId2xYMjhYeC9HUm5VbHdxWmM4dGRpNnNaWW44WVMvUzhGTzh3alNC?=
 =?utf-8?B?QWNaem9rMy9FNnhPL3JYY21vVGo3WkhHY3kxQzUvUVNqb3NsOVlJcmRCMk1B?=
 =?utf-8?B?aXIzR0kveW1jV3YwUnNjdzQyRXVtZ1ZxdFNxeVhpc2s4YmhIQWZHY1ZpQVNS?=
 =?utf-8?B?K1Bxc083aVpFbFB4M2FrMlg3a0hsOTl1YWlWdlRTdXNrVzdyUlVZbUV1MXg4?=
 =?utf-8?B?Zm1ScFcrVkVFeFNCT3MvdkR3ek9qQXNveEdvMjZtREhWWWw2K0FzM1F1ZFQ2?=
 =?utf-8?B?SEU5V3lxd0NiVWpvL1UrT0daM1hlZmFiR3ZTMW9mQTZNRTE3T0srdS83cTFW?=
 =?utf-8?B?b0RJSWFhaHY2dUR3WGFFVDJLb2pydmRwenZIOFVjZFo4UlVFZDV1YWNlSUVF?=
 =?utf-8?B?S0VqQ2N3OXlLZjBRb1FBMmhtdnNIdzJRN0lhYm5kdm5BQW93TjdVeDc5RzNJ?=
 =?utf-8?B?QjZ3TU5NTkh3azFWUkNNUDFhM3VLcHBGT1FVSVg4L2RCN1h4emZaWW5XMk5K?=
 =?utf-8?B?VGk4aTUweXZWbzFjdy9UZ1lLNVIyZVR6OU9PLzlWcXpvc2MrcURmZkVEY1Jq?=
 =?utf-8?B?MUlGM0M0bGZ2ZXdCT1hLZndnQWpEMXcvRFBneUJ2VURaL1EyZTcrUE9rVEI2?=
 =?utf-8?B?UUpaRVFEa0dKWm9CWlpXMkRNZmszK1diOWxweDhDakliQWFiL3huNC9LZHl3?=
 =?utf-8?B?MEJxaUk5SWIya3hubWRrTlBvVU5NWmVtTWMwYXJYRHBkVDRwdW42ODBCbHhR?=
 =?utf-8?B?WCtJRnN5SHIvK25NK2hQWTNQUHNpUUdxTUxCOGxiLzN3UFlWS25wejU1Tzcv?=
 =?utf-8?B?N3U4S0RYR1Qvdm1NKzVXNC91ZUlLNkxaY2ZQdDNLaEpMeklZZThibjllUGdQ?=
 =?utf-8?B?WW8zbWVsQW54ZnRwYWZlVEc1SldkMDRSbmhpRXI0QVA4SkFGY2RUR3FRRWdl?=
 =?utf-8?B?NFJYMWlIWkZuRW56aW0vUjhjUXBab3VyZEZQdnkvWjlDR2pJdXJuU2JQK2VU?=
 =?utf-8?B?d0pmYTF0NnAvaGtEVzlVbmVUN0FIQ2xjbDl1Ri9tckY3aTBuMU9KN3pvRDlB?=
 =?utf-8?B?ZnN3WHN3RWk4NWZmY0VwVndLdjhVU1lUcUgvYnpFcFlpUno3VHRPSG4rVmZT?=
 =?utf-8?B?VzJVTEZMeW1NdkFjL3haNEFuMG1ZSC9VOXkxc2tBMm9ma3lKNGtxZmFFdDVy?=
 =?utf-8?B?RmNxM0d5b2E1TDE5REJERzNHUnR0c1ZwWXJIMmxEN1J2elh0anJjNURWNmlw?=
 =?utf-8?B?NlZaUm5ncXFXem1ISllReHhpNFA5cXdTRUc3cjFySUVtT05ZbktJYm5EcGU2?=
 =?utf-8?B?QXArcHVxdXdSeG0xRDB3NXhjQll0MGNFNVV2MHUxTmJpVnBZOTA2OU1sNHov?=
 =?utf-8?B?cU5pSDBjMm94Y1lqUDIrSHd2eURYaGpMNzl2bmhIWlhKRndBajNOYXB4cFlv?=
 =?utf-8?B?ZUdCaldrMXFjOTFkWE11VlUvSzhLbVMydlhMbTc1d25ncEVTamdoYWhQWFdu?=
 =?utf-8?B?eit5Ymd2YlltSzdEZkNrUHpFcXI4UE9tQWtxVnVXcTA5VjIwQ2c5cjR2NmU5?=
 =?utf-8?B?YnNlNWdmWXdIakFDTXU0cVlkUGRUREN4TXJZd1BiUW9TVEw1M1YvYllNUzgz?=
 =?utf-8?B?REhjd2FDSnFEL0I5Q1hPN1ZTTTlnQkZNNnJLYzJZZ3dHbVpsWHAva0ExTHpv?=
 =?utf-8?B?c09Rb0tjRTBZU0FSdG9EM25iMGlOYTVXWTBtQTNIdWZ2WWYzM1U5cExFVlNZ?=
 =?utf-8?Q?7m5yIQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SndSVEJmV1BCYXdtcTZtajdUUW02N1BVcW1ibWx4RVRwVFJlK1pxUHA0dHRK?=
 =?utf-8?B?cDlOUWd0UStFZWhLMUo5WDBvdFlmdThBa3E0UEJ2bkNDVmxtNmI5aXJFN29D?=
 =?utf-8?B?T3JpTGNjMDl6S29Bem1nSytHU1JwdDd5dHRHbnB5MVZWOFFuaUJadkpzUVNo?=
 =?utf-8?B?MS85amJSUHB5M24xVTgvSUJyUE9CQk9rd0hhcWsrb0NMdjQvNkRDZmo2eE9s?=
 =?utf-8?B?dHlqOXZLYlIrTGpCM1oxSlZ0aUFXSmIrV2xkN3B6UDVGSjVzRmU5OXZGV0ZY?=
 =?utf-8?B?SWlVeVRjY2x5eWZVQ0t5OExyVGFJc2ZkcEdPaDFXM1NyNXVicFp0ek5JVU9S?=
 =?utf-8?B?ZFNQc0xjajRqK2NkaERMay9EWE96S2Nydks4QnlnSElsRytYZjJyWms0WFdl?=
 =?utf-8?B?YVliaE9XTVJadyt2cVpyOUNpU3VERGZUWkxtZzFOSXI2ZG5KZmFla0huVDlO?=
 =?utf-8?B?alBLKzJPSlVZbkZHVlhrVTl0aXUzOFlJUDFMWVNRMU9FUUQwdE4remtNcHNp?=
 =?utf-8?B?eG01bmllZWNnZ0h4TUZldW92NXFBa1lCYWltcExnTVRzYkV0Q3pyVkVjRmVK?=
 =?utf-8?B?WUo5bTJYdnBoQWwxQ2JCVk9MeldXOXE4MXJKOTBkZ1ZvVDZ4bzQvMzFsM3Zh?=
 =?utf-8?B?MGRCdmVEWWhwQ1ZKRFJXUUJ4WXk0SEFsdk11ZG9KblEwNEZ6VmJ3VnNKdmxa?=
 =?utf-8?B?bXhuckp4U245YzI0SG1IL1ZSMUIzNVNRWml0WSt0bmI2Lzl2S1lFRFIzNFZL?=
 =?utf-8?B?MmtjelMyTXhlZDhNK3RidmRZT09mS0NyampNd2NyMDVVSkdFcDN2TFA1MjFO?=
 =?utf-8?B?Yk5hUG0rVVhDZUVJa3BFREdyVzZRNjBQWFJhYThrMUl4K2FNL0JNcEpGeS9Q?=
 =?utf-8?B?MnNOcUlHMUVlYy9SS0JQZjNwYUFsU3NyR0JaSkNaeXo3TXRIOEpGRWNHa2F2?=
 =?utf-8?B?RFp0MVB4YzJYS0tjV1dIL2s5bjJDTEVjTTh6OUNiKzVUeFc5aFlUZUNjT2p0?=
 =?utf-8?B?UTlxNmVXYTdwMS9za0xjbWxQUk80RUgzc1dPZEhVQTVQa21SekROUCtCT3hG?=
 =?utf-8?B?Um1IeklPM2ZTWmh4VWwyR0I5QnRoV3YxOW9ycFo0MFJKZG1WTmVSd2MwaEQ0?=
 =?utf-8?B?eFhjWFozbHJldjM3OTNJVFdnWHZqUWtTZjVSeFRNSXAzUGhVbm52aHNURk03?=
 =?utf-8?B?Wk1ObmdGbUpUTDN0UktYekY0UWVrOWpqaUVKMFRlRWhGV1pmazc0Q3UySGNt?=
 =?utf-8?B?ZGF3N1lFQUEwVEhJYjBQK3FYMTcwZ2Q0aW9FeGdKUXR3UlUrVHVzTjR2a09p?=
 =?utf-8?B?SXh4bUZVa1JPaGRZdUNlQ0s0SEpmQ29MLzcrUXdYTThGbG0wT0p4ZC9PVU5B?=
 =?utf-8?B?MmJBdmNoUzliUUJFbTk5akxzUWVGTnY3a0VSajBoR0o0KzRaSXpkQzdRenRp?=
 =?utf-8?B?U29tL3Z5Y2IzVHdkOExNSDJ3U0FsMnhFNENRNHlVRlpjRExyYmhZSG9zeWhP?=
 =?utf-8?B?K2FkOTBXd09adjFhQW1ReS82STZ6MmpXeHdTTysvaGFXT1Erb0Npc0lrZGlw?=
 =?utf-8?B?bnhyMWNuZkwyaUlBODM5M3phNTUwblhIMFVyRVZhT0Q2MWtBMVZaQVZha2dh?=
 =?utf-8?B?bmtBREhjcEFzT0hobW5YTkV0SmwxeVhUTXpFTUJCUEtvazV4ckZrcThmMjF2?=
 =?utf-8?B?Zk42c1k5YUZJaC9VUWIwWTVZRktCcURnRUU2ejQvMWhvSE5yT0M1RCtweEs5?=
 =?utf-8?B?LzBIT09KMlJGLzA5bmduZllTZHl2VFF0WGg1eVI2eDI5YllmUUZrOW5xTkFL?=
 =?utf-8?B?emJueFlsRW9NcWxFc3BYYUlUM2JFWFpvQkdvMjRhbzdjcS9pbGZnKzBVYitY?=
 =?utf-8?B?T2NZd3BleGZ6OXFRK0llTzZyc09TemQxQTVxampmeGR6Q1h3TWR1MDhzVEZp?=
 =?utf-8?B?dHZJNmRMOCtURFhzL1N5bG9XY2J5WUlxY3Q3eEVTQW9GM3NCSVlqYlZsVXpW?=
 =?utf-8?B?eGlxNndIS1hGalpyWlpLTTRQUmpMVDFFRUs5ZDJDWmdsazBROFhTb1JlczVK?=
 =?utf-8?B?QjJOUWtrTXI3Z05wWDJINTdsNWdhank4eW44Y244c1pWZmVza3NGTUQxS3Z2?=
 =?utf-8?Q?EoHXyHMjhMM01q5CU5E6UvHdD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDE1C5A0ED5B124499EF4174682F38B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209ebb33-543e-4384-8c5e-08ddfff62024
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 07:51:12.2677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9FGIE5vNt9YIcYrvyZL+jgPOsAuI4sI05ptSlmH8kAI3XWaa1+FPggthgvdNAuA3trHslafEduVWXQ0BIawxcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_005125_911105_8DE8A0E8 
X-CRM114-Status: GOOD (  20.20  )
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

SGksIFlvbmdxaWFuZzoNCg0KSSB3b3VsZCBsaWtlIHlvdSB0byByZXZpZXcgdGhpcyBwYXRjaC4N
Cg0KUmVnYXJkcywNCkNLDQoNCk9uIFN1biwgMjAyNS0wOS0yMSBhdCAxMzo1MyArMDgwMCwgSmF5
IExpdSB3cm90ZToNCj4gaWYgbWF0cml4Yml0IGlzIDExLA0KPiBUaGUgcmFuZ2Ugb2YgY29sb3Ig
bWF0cml4IGlzIGZyb20gMCB0byAoQklUKDEyKSAtIDEpLg0KPiBWYWx1ZXMgZnJvbSAwIHRvIChC
SVQoMTEpIC0gMSkgcmVwcmVzZW50IHBvc2l0aXZlIG51bWJlcnMsDQo+IHZhbHVlcyBmcm9tIEJJ
VCgxMSkgdG8gKEJJVCgxMikgLSAxKSByZXByZXNlbnQgbmVnYXRpdmUgbnVtYmVycy4NCj4gRm9y
IGV4YW1wbGUsIC0xIG5lZWQgY29udmVydGVkIHRvIDgxOTEuDQo+IHNvIGNvbnZlcnQgUzMxLjMy
IHRvIEhXIFEyLjExIGZvcm1hdCBieSBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uLA0KPiBh
bmQgc2V0IGludF9iaXRzIHRvIDIuDQo+IA0KPiBGaXhlczogNzM4ZWQ0MTU2ZmJhICgiZHJtL21l
ZGlhdGVrOiBBZGQgbWF0cml4X2JpdHMgcHJpdmF0ZSBkYXRhIGZvciBjY29yciIpDQo+IENoYW5n
ZS1JZDogSWNiMmFhZTFkZWUyMWQ5ZWEzNGYyNjNhNTQ4NTBmZWUyNmQ5N2Q0NTUNCj4gUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpheSBMaXUgPGpheS5saXVAbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9j
Y29yci5jIHwgMjYgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX2Njb3JyLmMNCj4gaW5kZXggMTBkNjBkMmMyYTU2Li42MzRiMzEzNDY5
MjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29y
ci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQo+
IEBAIC04MCwyOCArODAsNyBAQCB2b2lkIG10a19jY29ycl9zdG9wKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gIAl3cml0ZWxfcmVsYXhlZCgweDAsIGNjb3JyLT5yZWdzICsgRElTUF9DQ09SUl9FTik7
DQo+ICB9DQo+ICANCj4gLS8qIENvbnZlcnRzIGEgRFJNIFMzMS4zMiB2YWx1ZSB0byB0aGUgSFcg
UzEubiBmb3JtYXQuICovDQo+IC1zdGF0aWMgdTE2IG10a19jdG1fczMxXzMyX3RvX3MxX24odTY0
IGluLCB1MzIgbikNCj4gLXsNCj4gLQl1MTYgcjsNCj4gLQ0KPiAtCS8qIFNpZ24gYml0LiAqLw0K
PiAtCXIgPSBpbiAmIEJJVF9VTEwoNjMpID8gQklUKG4gKyAxKSA6IDA7DQo+IC0NCj4gLQlpZiAo
KGluICYgR0VOTUFTS19VTEwoNjIsIDMzKSkgPiAwKSB7DQo+IC0JCS8qIGlkZW50aXR5IHZhbHVl
IDB4MTAwMDAwMDAwIC0+IDB4NDAwKG10ODE4MyksICovDQo+IC0JCS8qIGlkZW50aXR5IHZhbHVl
IDB4MTAwMDAwMDAwIC0+IDB4ODAwKG10ODE5MiksICovDQo+IC0JCS8qIGlmIGJpZ2dlciB0aGlz
LCBzZXQgaXQgdG8gbWF4IDB4N2ZmLiAqLw0KPiAtCQlyIHw9IEdFTk1BU0sobiwgMCk7DQo+IC0J
fSBlbHNlIHsNCj4gLQkJLyogdGFrZSB0aGUgbisxIG1vc3QgaW1wb3J0YW50IGJpdHMuICovDQo+
IC0JCXIgfD0gKGluID4+ICgzMiAtIG4pKSAmIEdFTk1BU0sobiwgMCk7DQo+IC0JfQ0KPiAtDQo+
IC0JcmV0dXJuIHI7DQo+IC19DQo+IC0NCj4gLXZvaWQgbXRrX2Njb3JyX2N0bV9zZXQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQ0KPiArYm9vbCBtdGtf
Y2NvcnJfY3RtX3NldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
c3RhdGUpDQo+ICB7DQo+ICAJc3RydWN0IG10a19kaXNwX2Njb3JyICpjY29yciA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYiA9IHN0YXRl
LT5jdG07DQo+IEBAIC0xMDksNiArODgsNyBAQCB2b2lkIG10a19jY29ycl9jdG1fc2V0KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkNCj4gIAljb25zdCB1
NjQgKmlucHV0Ow0KPiAgCXVpbnQxNl90IGNvZWZmc1s5XSA9IHsgMCB9Ow0KPiAgCWludCBpOw0K
PiArCWludCBpbnRfYml0cyA9IDI7DQo+ICAJc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCA9IE5V
TEw7DQo+ICAJdTMyIG1hdHJpeF9iaXRzID0gY2NvcnItPmRhdGEtPm1hdHJpeF9iaXRzOw0KPiAg
DQo+IEBAIC0xMTksNyArOTksNyBAQCB2b2lkIG10a19jY29ycl9jdG1fc2V0KHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkNCj4gIAlpbnB1dCA9IGN0bS0+
bWF0cml4Ow0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY29lZmZzKTsgaSsr
KQ0KPiAtCQljb2VmZnNbaV0gPSBtdGtfY3RtX3MzMV8zMl90b19zMV9uKGlucHV0W2ldLCBtYXRy
aXhfYml0cyk7DQo+ICsJCWNvZWZmc1tpXSA9IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24o
aW5wdXRbaV0sIGludF9iaXRzLCBtYXRyaXhfYml0cyk7DQo+ICANCj4gIAltdGtfZGRwX3dyaXRl
KGNtZHFfcGt0LCBjb2VmZnNbMF0gPDwgMTYgfCBjb2VmZnNbMV0sDQo+ICAJCSAgICAgICZjY29y
ci0+Y21kcV9yZWcsIGNjb3JyLT5yZWdzLCBESVNQX0NDT1JSX0NPRUZfMCk7DQoNCg==

