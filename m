Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9ADE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKKDykLz6VYpftPC3GzNRkMS5jJYF/gq5aro10LGZ/U=; b=rrr1rcItp3RadbDpwltRC37Uje
	Aemimpx9DUjC5hIDVKifvoJnhHCitYpcZFuxnRahXlyyMUQLlM/w2vuLhiofWH8noRiKZQisv+AZC
	iK0XGw6mXAKpa18MmL84c924TGvs27OnX/i+q9rjhmtP/6wtScl8XkPEfdodxMLOyuBo5K3+xg3MS
	uRxl9gxeNOox5y1WyShXvxq+BdhxIN6EE3lqR8q0MUo8lb7qXbMxez9PNvRV0su0bdtWj/LfLns+p
	83mx1yk0LtOSQj2yGVegE8Z0Nawepd9g8QW/L4mzJxqQCWfFQ5m2DyeNPDjxn4djr+vk/rMWU6LPE
	jPkEYRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKKu-00000002Z2Z-2WyJ;
	Thu, 19 Dec 2024 17:29:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKJn-00000002YrW-1gEV;
	Thu, 19 Dec 2024 17:28:12 +0000
X-UUID: 7235f4eebe2e11ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KKKDykLz6VYpftPC3GzNRkMS5jJYF/gq5aro10LGZ/U=;
	b=Pa4RFgqWDryAxYSWOJPqkrsIlnmuOLDrXdSVkW2Huo8cSf8GyAl09xJUyNV0VFfTYGXQ5b3scaaIytORFLuQe1Zn1I0DTvkpqQcP6S9GDIDWPWhZPyHlOTL9LKTMvSMwC63Irh80anSr7QNpunGESAoockiTAtE7ViIkD0edu5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:095b0549-9d3a-423f-bb28-840cc5d4d592,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:e7bb3e3c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:100,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7235f4eebe2e11ef82ff63e91e7eb18c-20241219
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1466047308; Thu, 19 Dec 2024 10:26:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 01:26:53 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 01:26:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKFOFRmevqcKhpX1m09iciJKvaxJIFQbXiIjpbMJJ3sNrotKJnhC+3P9oZghGa9SYVH3MD6bjJKdZ7yxZLfdNjyYAXXh2FGX5o+uwKhs4PMEyYvk7N74yNpadB2Trta/hYlj2dnHjndmngeIjvLPZKTXmNuJ5hGfUjxFq1rNZWqe4DSAktrD9SFWbt2Y4P1dNx8Tc8n3ykqzsvMs1f13+1cF9ldXITBPSuJfH8fr1ORGAhbmqbJjrV11L+8G+Fiy0R8QF3H2A698sWf+5YJw5Dyt7+pmMEQ2K+pFnC4KikXyDOAun+RQnLFQm6D3qrCPbPC8rixqKMk2NG62OS+i8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKKDykLz6VYpftPC3GzNRkMS5jJYF/gq5aro10LGZ/U=;
 b=k+W7pAYsnClNqelfDchl5+CFYqjLKVDcHjNmjRs3QBY2Bz3THxhe4f+osPLsw/WhOJlsKA6BtuqWcQ3q7WSeCsdUBTeFBZeYP6UfnU58REaHw6Em8dM6pjuiswwwFPnjwpOZrLuv2y1rVjYcOeWf5sSF1Lw09/q/HVqCgd3XCtMYoZ1Nc1qVpf90gYL0cXBmH7I0lfzcpmctlyuM2b4RsJ6In2eUBnMTbo7K5Hs9hxXhWynS6SXXb4bT35gLb2iOq85rsyYn/gTRMukF4mIadXI1GLd8dEy9RKcswGC4owGGx1XewSmbjx/AdlfzaqGGCDVi6vMBU7inRdcJXjgETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKKDykLz6VYpftPC3GzNRkMS5jJYF/gq5aro10LGZ/U=;
 b=EsUtIFGtACy08omnFPf24GB9qcU9rLRtNyPezb309tYNiXZ+29Btotp38FxihbIKEJb8yuETHPz/EXWgdbxP51kbp7T+FlNj+JtoBZmn07H/j5Ou91pIyazTVp46YQmi52YjfMZtEhg6zyFWFiEhjfQGq6IH7o2Eb+nzKZORWjo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7964.apcprd03.prod.outlook.com (2603:1096:400:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:26:51 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:26:51 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
	"treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: ovl: Modify rules
 for MT8195/MT8188
Thread-Topic: [PATCH v2 1/3] dt-bindings: display: mediatek: ovl: Modify rules
 for MT8195/MT8188
Thread-Index: AQHbTUSVx6aKw9BWZk6MLfUFWWZAk7LtcoQAgABpUYA=
Date: Thu, 19 Dec 2024 17:26:51 +0000
Message-ID: <8599c12c853cdbe19c39c12ee3391cde5a29a2ac.camel@mediatek.com>
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
	 <20241213095044.23757-2-jason-jh.lin@mediatek.com>
	 <6f92c81f-84d0-4306-96d2-1cfc2ddb72e0@collabora.com>
In-Reply-To: <6f92c81f-84d0-4306-96d2-1cfc2ddb72e0@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7964:EE_
x-ms-office365-filtering-correlation-id: bae35373-7670-458b-d13f-08dd2052535d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YVd1ZmJBZDk3eHUyL256RGM0Y2Mza2JXZTVSUmRicXhDeFdHOWFDOURNTmtW?=
 =?utf-8?B?b0FlaXFBWk9RWXl0Q1RJZndoalFiamtSRU9qSkFWVUpteUxZTWhaN3VHejhQ?=
 =?utf-8?B?aDVlWGJBQ1dCWm9SN0NRM0FRQjIrM3pZSmJuQXdkOXpUbEJaZ0lkRW9ha0Jl?=
 =?utf-8?B?YTB5VHZNSkcxMXFEbFZlSi9DV0RZNk43TG5VZGlEZTk2YkdGUzRVcDlzak9Z?=
 =?utf-8?B?Mlk1RFUxaUlacGhhbCt2VkVnbGdvMDBmNDJHSnFLUHQ2czZxTG9VcUthUlIv?=
 =?utf-8?B?RDZCayttMVpZckFmRVh2RXU0YTFRMWpRS2tacVVJcUxEbXViRWNSbW1FSStF?=
 =?utf-8?B?YzYvWXp3bXUwK0x3anhmQUJHNHdwQXE4YzN5L21NQitEdmZBU1Y3MXpBWS9i?=
 =?utf-8?B?V0JyWWRWUkgvcUE5WkY0eFI2Qy9sNzlKaVpjcWFVM1huUm0vUjl0UVlFNjV0?=
 =?utf-8?B?MnF3SnhES0ZpOGNBV09sQVAxU2NERHNoejExbDNiSTVrTkJtR2tibFNPU2Nw?=
 =?utf-8?B?Z2xXZ2U3RFUyc2RGeEk3N3hFVnl5OVBlTnJFdmhTU3RGNlRucTBmVGhlMXhy?=
 =?utf-8?B?NURZQ0hJbjNqWElsZ0RqY0EvTkgycUVPU1dXa2FTZzgyRkpHVGRJM0xtUkhp?=
 =?utf-8?B?Y0g3WExEQTE1cElJdmd2eEQ2VEVQeENYUHNJVEUxbzFaSXVpblc2VlRLS2h2?=
 =?utf-8?B?Ry9RZ1VCYjIrUEI2R0ZKMXowWXFKcjBuY2U4T1QrL2luOS8rc2piNHdQRVdS?=
 =?utf-8?B?aGk4WWZ4ZVgxdDdMR0k5MmJkaXVhajhjSVp3WVhvTjdnOUg1QXNlWlVBSkpm?=
 =?utf-8?B?NDY0eldMck1zRThicEZ5bjIxVkNWUTVmRWhPTmxtVmgyWit3dFlJR3BRN081?=
 =?utf-8?B?S2FJU2JMMXJ0YkFYSGtmbG95dGt0clJHWEw0UGtZOVVJdjFDQ3F3OXI2N0J4?=
 =?utf-8?B?SVJCV2pDYjF0VUtaVGFKUG9DUEdLaXh3aitPaXdUUTZTdzUzekNGVWhoV1Ns?=
 =?utf-8?B?Q29rcE5uNlJldXU2dm1MZXBJUVhXY2JJcmFDNVExOTdSdnVYdUNoY2Nyc05L?=
 =?utf-8?B?Wk5VU01OelVEbTRUZUFETmgwczJrbDVSK1lpemFyTTlIVjZpYm81ZFdTRXlT?=
 =?utf-8?B?dFRLUTN6dHIzQmVaWmdldzFhQ1ZiVi8vOC96cG1nL0MvQWFSNWpHU2NER2Jt?=
 =?utf-8?B?cVYvNkI2cHRwdm90djdpWDFkQXBKVUF6WVVJUXFTV1czMDFkaWs2cU1uSFhy?=
 =?utf-8?B?RTRZV0l2UWxxYWRMRW9QK0MwSVlSeTJHMDFJWHBueWMwUHEyRTZNRVZFR3Vm?=
 =?utf-8?B?bDNKWUNSMjczZTZtQ2lsY2NpV002RndJNHhPV1NlbVhDRGtWR2JzUHgyTG1j?=
 =?utf-8?B?a1ZUdkVCMVIwWjh6WGx4Y0hTQTlUVjhQUFlrdzVnRVRuTEVvSVNRVmhWMGs0?=
 =?utf-8?B?S08raWp5RDJUa1g1YjFWdHhNOERTTEtIbzFic2kyRy9hMnh6WXJFaWFVTklh?=
 =?utf-8?B?YTZkdGhSaXR6SzU1bXZLdzNSQ3Axc3NOaU1ucW92QVJPWk5OekNCV3YvTW1z?=
 =?utf-8?B?cW1uR3ZKRzJHemlQaFJoWFhhWTFEeXRYZG1nNGxYUXRxa0JDQUFQNzNGZk5R?=
 =?utf-8?B?TFl3cVFKUVh1cmNkZnM4QWMxK3NNUVZHMm5EUmh6RzlCdDRjd0FscTJwWWl6?=
 =?utf-8?B?NVAwTk91dlZUK3R3b2RhV3FEd043eXRHNjArQkpJUnV0OVhmWFBxODkxM1N5?=
 =?utf-8?B?S2ExYkZWaytrdFhiNU5TNmJ5Z2MvTWxYSWtVSXcwU2dNZGM5RUZzay9JV0ha?=
 =?utf-8?B?eFlaTTJvaTlpT1AveHdWM2k2dUM0THZnODhrMEYyQzFJRVBUT2k4MGI5TDRY?=
 =?utf-8?B?VVhvVFAydUVmOW9jVHRzS3h2aWI2TWNhTEx1NGxvR3JhQmtTUnpuRkpXZll5?=
 =?utf-8?Q?eR1mCmm4ZQ3dRyB4xvSVXQNL3/LBqPs5?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDNUc1hQd2dUQ0EyVlFsR29tem55S1FDODRGZnpCdm56WTFFL3E3Vms1R2d3?=
 =?utf-8?B?bWhoMzRnbndsZXFFTjhid3VBaTNCYVlta1U2dUNKNGRKNm41VTQwQjY3a1By?=
 =?utf-8?B?VFFuMWZETGlKRDQ5OEFKRWhWMHdWTjhIOHc3L2U1VXJMd2FmRUgxUnJ0RExu?=
 =?utf-8?B?bzZhTEZqbnhPczlGcTVsZUxGeHl3YkM5WjlaUVVoSkJKbHI0aVlDZFpIc0hl?=
 =?utf-8?B?ZGpWdTlmenh3eW5hcXBPbjhybW9qYzViVjVxRzNHekZTY2ExblJLSTNGcXQ3?=
 =?utf-8?B?OUNxNFo1V1R0Y2FEMTlIdzFRbTVhVFpyWE95YTMxVHNaTGo5VGlYQlhnOGlD?=
 =?utf-8?B?UitUVmsyNmtzci9vaEJwVUpHeGdEdGhZS1NmeDlUbVMvQkVlbDhjVFdxRUgz?=
 =?utf-8?B?ZHo3RldqS0tueDJqdURIUHlheUJZVUNidWR2bEZxbitOcGlLY1gxYnFBUTBx?=
 =?utf-8?B?Q1hxdDU4b3IycGY1N1plMER2RkhUNkhGa01DMnlaZUFyNldzUnhra0hsNHE1?=
 =?utf-8?B?Qnh5WnhaVFk2bHhObmR4VnlUdVRhZjlIS292ak9CVmJycjl5MnJidHhneHpn?=
 =?utf-8?B?NENmQ2pid3E1WUJ3akdoR0NLMXlmOGF3czhDUDFrdzl2anNhZ2dYUlRRTDNY?=
 =?utf-8?B?elpwazRpVS9EUWlIQ3ovTzZLNkhqT3V3alF1QkNXa2M0cE5EL0tRbUx4MVIw?=
 =?utf-8?B?UEc3Nmd0Z1A4V2xkVnJoN1BQaDhOc3lBWVkzUFNmU0VNQWZtTGFrVjR0cko4?=
 =?utf-8?B?ZytONjJHYkE1MWZwWW5yMXJYZjJLcGoyTnVZQjRlczZ6dE4zTndBYlZpcDZk?=
 =?utf-8?B?bjNlZWRkSXRzUEJsM21GY1lBUm1XS3dEOElpYUNkVTV1S3d3U20xR2ZoRWd0?=
 =?utf-8?B?aHJ5dWhtbEtZM3ppSmZFSzlYZE0zdXlocmFmQXdmbnZzTFZBeTlxZHk2SWpY?=
 =?utf-8?B?M21CQ25haWF0c0xieTJRb2FlWENGVVVVTGtDTm80Q1Zrd2E3UUxDbFcybzFG?=
 =?utf-8?B?Z05uR2VBWkdrWTNDUkNJTWR6SVpCa3lDdzlrOUhoTmhKR29oU1BkaHE0dWpF?=
 =?utf-8?B?NGpYRnlVQTdwQ1VZSVFseTg5cks5aXVwWUdCWHFHUnpvWGhTRGt3dXF6RER0?=
 =?utf-8?B?cWpJYzdLd0dnVU55MDhvUXFqSm1JS2tUdll3T1VLUEdqeld4a3Z1RkhWa0Jn?=
 =?utf-8?B?NUpJUGI0Q2o5U0kzaE1tMmxydE5lZ0pwRVYybDNnRmdlU0pmVzdSVlV5N0Ry?=
 =?utf-8?B?VVJBbnBOcGZ5WC9TdGtlVHVIL2Jwa0lUMW81Tndwd0RkZUFZRk5IRE5kKzBq?=
 =?utf-8?B?RkxLRVlDSWQzd2hIOFdNYXZyRnRNNHRvU0c1UXpVMVg0OFdCbE5HZGhybnFC?=
 =?utf-8?B?UWptWjJSTGQzMWpnK1gvcFVZUmpXbjZWdFgzUFVGekgwUmpSczNwSHYyb0ho?=
 =?utf-8?B?bGFvRUJOaVpSRUhya0VzOHBwWnZMRWxUcFhtMEpyTlhCRm03RVNKVUIvNlk5?=
 =?utf-8?B?eWhIRVNPUXJaWm4vVE5vbmlhQk12eVpnTEpnazkwN3JGUzNpaC94WGVqVzBp?=
 =?utf-8?B?L09aUGlnYzU3UndNclBVZjVnS0swRkdvUGZtN1pod0twQk93QU1qRXR1cE12?=
 =?utf-8?B?U0tFekMyTk5iM3pSQXE4ODVkbnV0Kzkxd1o5WjRhek5DQ3dBdU91ZVcxazEz?=
 =?utf-8?B?Y09MamdFVWdGNTlwZFRtSkFkYnVTUHJ5RFZQc2VLYnlUbW9BYUhEWFp4ZXZs?=
 =?utf-8?B?WjZvUXN1M2VWVzNpUWFmVHpZNlZ5ZG56cXpMcysxK1dWaDRkUzRHR1Q1WlQx?=
 =?utf-8?B?MVNDaDVER3VsV2pvVGhSQ0Y2ZStHWjZyWS9VQ0oraUN0NlpnYllDU1U1ZW4w?=
 =?utf-8?B?b2gwRkJFaGJvRWxqRWpwNEZlTGpkckRyYmcrayt5bmE1WDg4SUhyMjkxaWQ2?=
 =?utf-8?B?cGh1T2prenIyWXB2UjNYbGUrNkdYZ0lCWldNbGtydUJmSlZOSmZTR252WjVh?=
 =?utf-8?B?QVZ0UHNRQlZTOTdKb3RLcWF4TVpYZDNYTFdzdXdFQjN6QmJWSGZRMVJ0eWpi?=
 =?utf-8?B?TkNPL0hFYzJXTzF3M2pWakRpMXFrSlNPaWZkL0VZZDdsb0diVWRLZHZMWlc4?=
 =?utf-8?B?Sm5vdzlRdU0xc1NpU0t3WGM4K09MTFZHdTFvZmx5ZFVGUHRDOHk5eHBCUW9R?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B60433914169140979306C56B7B534E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae35373-7670-458b-d13f-08dd2052535d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 17:26:51.4131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8j6X6W4nrxfw1KgIkzvvJOfgzsYpUDz9QRQrLYYpNJp1hBe7caILi6IyqSqFx6ANvzSFGtu7T0zVErBvSpbSWfEgWdkeHZ6KvARi6G8y+3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_092811_441608_3BD03754 
X-CRM114-Status: GOOD (  13.95  )
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

T24gVGh1LCAyMDI0LTEyLTE5IGF0IDEyOjA5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMy8xMi8yNCAxMDo1MCwgSmFzb24tSkgu
TGluIGhhIHNjcml0dG86DQo+ID4gRnJvbTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0Bt
ZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gTW9kaWZ5IHJ1bGVzIGZvciBib3RoIE1UODE5NSBhbmQg
TVQ4MTg4Lg0KPiA+IEhhcmR3YXJlIGNhcGFiaWxpdGllcyBpbmNsdWRlIGNvbG9yIGZvcm1hdHMg
YW5kIEFGQkMgYXJlDQo+ID4gY2hhbmdlZCBzaW5jZSBNVDgxOTUsIHN0b3AgdXNpbmcgdGhlIHNl
dHRpbmdzIG9mIE1UODE4My4NCj4gPiANCj4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PA0KPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
c2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+
ID4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdmwueWFtbCAgICAg
ICAgICB8IDkNCj4gPiArKysrLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssb3Zs
LnkNCj4gPiBhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLG92bC55DQo+ID4gYW1sDQo+ID4gaW5kZXggOWVhNzk2YTAz
M2IyLi44Y2E4ZTU5NjZiOWEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdmwueQ0KPiA+IGFt
bA0KPiA+ICsrKw0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssb3ZsLnkNCj4gPiBhbWwNCj4gPiBAQCAtMjYsNiArMjYsNyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3Atb3Zs
DQo+ID4gICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1vdmwNCj4gPiAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5Mi1kaXNwLW92bA0KPiA+ICsgICAgICAgICAgLSBtZWRpYXRl
ayxtdDgxOTUtZGlzcC1vdmwNCj4gPiAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1tZHAz
LW92bA0KPiA+ICAgICAgICAgLSBpdGVtczoNCj4gPiAgICAgICAgICAgICAtIGVudW06DQo+ID4g
QEAgLTM2LDE2ICszNywxNCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgIC0gZW51bToN
Cj4gPiAgICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDY3OTUtZGlzcC1vdmwNCj4gPiAgICAg
ICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxNzMtZGlzcC1vdmwNCj4gPiAtICAgICAgLSBp
dGVtczoNCj4gPiAtICAgICAgICAgIC0gZW51bToNCj4gPiAtICAgICAgICAgICAgICAtIG1lZGlh
dGVrLG10ODE4OC1kaXNwLW92bA0KPiA+IC0gICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1
LWRpc3Atb3ZsDQo+ID4gLSAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtZGlzcC1v
dmwNCj4gPiAgICAgICAgIC0gaXRlbXM6DQo+ID4gICAgICAgICAgICAgLSBlbnVtOg0KPiA+ICAg
ICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni1kaXNwLW92bA0KPiA+ICAgICAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODM2NS1kaXNwLW92bA0KPiA+ICAgICAgICAgICAgIC0gY29uc3Q6
IG1lZGlhdGVrLG10ODE5Mi1kaXNwLW92bA0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAg
ICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTg4LWRpc3Atb3ZsDQo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwNCj4gPiANCj4gPiAgICAgcmVnOg0KPiA+
ICAgICAgIG1heEl0ZW1zOiAxDQo+IA0KPiANCj4gSmFzb24sIHdoaWxlIGRvaW5nIE1EUDMgYmlu
ZGluZ3MgZm9yIE1UODE4OCwgSSBub3RpY2VkIHRoYXQgdGhlDQo+IGJpbmRpbmcgZm9yIE9WTCBp
cw0KPiBtaXNzaW5nOyBjYW4geW91IHBsZWFzZSBhZGQgYSBjb21taXQgb24gdG9wIG9mIHRoaXMg
c2VyaWVzIGFkZGluZyB0aGUNCj4gZm9sbG93aW5nDQo+IHNuaXBwZXQ/DQo+IA0KPiAgICAgICAg
LSBpdGVtczoNCj4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODgtbWRwMy1vdmwN
Cj4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1vdmwNCj4gDQo+IC4u
LndpdGggYSBzdWdnZXN0ZWQtYnkgdGFnIGl0J3MgZ29pbmcgdG8gYmUgZmluZSA6LSkNCj4gDQoN
ClN1cmUsIEknbGwgYWRkIG9uZSBtb3JlIHBhdGNoIGZvciB0aGlzIGluIHRoZSB0b3Agb2YgdjMu
DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBQLlMuOiBQbGVhc2UgcmVmZXIgdG8NCj4g
DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjE4MTA1MzIwLjM4OTgwLTEtYW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tDQo+IA0KPiBUaGFua3MsDQo+IEFuZ2Vs
bw0K

