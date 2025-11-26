Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F319D0EE29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbuX65tJ54n2G945wEmD/8YcpD6mKGhhzmwPsuvYmB0=; b=jF2qcoyAXzz05EMOw6g/3XyS6+
	4wB4fZRCKnJXYbiZbzmA3N+VkXjfpgII4+OQ8Z2BI+42kKroyKuuofubgcXuR8zrqSIWP+9vtalWQ
	dHFCDB20vaXZgRMUkAjQlUanaAR4vM2sJdCIiZ7fWr/IcySo4sHvoqj0yA/U9lsuwufBxdlHC9k69
	PAmF/N8yNILszfwhw3GpN2deHewWry3PdjAaGico5mfBnK1V7zuPN+Fa4R25WGK9lDRe12basCyoi
	GdHlwNaC9lqHmBo0PAhcRavwd1IUFEDCadA97wrZ0n5m0i/clcbXQBtIKLHJHuvq18PPOY77Yrkj/
	dcexz/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9bV-0000000ETRG-0FaC;
	Wed, 26 Nov 2025 07:06:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9bR-0000000ETQa-3tOs;
	Wed, 26 Nov 2025 07:06:15 +0000
X-UUID: 60bb5748ca9611f09f706fa2197c6ceb-20251126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nbuX65tJ54n2G945wEmD/8YcpD6mKGhhzmwPsuvYmB0=;
	b=A5KCgdu0glEqDW2I21h0sVDGhJHtd21dCFue7IKaSLqrxbQ3ZmS/YOka/9gteRd59Yq15pkxvPy0ZiVGnEvAhn1lUemSXR18j7zLsg/5/cv/uJbxnFQFqy3wEJFb5wRQvR5Nb6jUlVBU0Dcbh24YD4s2HKmnJVro5jYqMOodDHk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:711f5512-9903-4716-adba-81ef27e26e5f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f9c64f58-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60bb5748ca9611f09f706fa2197c6ceb-20251126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 853927568; Wed, 26 Nov 2025 00:06:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 26 Nov 2025 15:06:03 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 26 Nov 2025 15:06:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUCZXmiYsAgvPpe75dbem5pt0EkNwqXEtGwGTKd4UUM8SbwbYypXHXs6A5U+992Z4AQJ9qJtU+ntswGt/eEOOdBPyMpu+6mruvYc8poLGJH49CgKaFeX0mIw2NiqGB5u7KbT0D6vXgzpF3ZXnoCVRrhATEvYHqQfYY6L3iD0en0bplXtHIw3UjgvdcPv9oBQhWTv+ezy9GykcgLdS7RB09J+LMLxo2eKbwdNTcPj5JkkTT1eyyIxGEi9ttGcSYl7d0NONgnFu2S8hQZyJqiSlmiMC7p3CjKdpZjX3RmVQ1abswuZ7nCOHlzGDPExYmMOK613DhEoeN+R2KMBXi27Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbuX65tJ54n2G945wEmD/8YcpD6mKGhhzmwPsuvYmB0=;
 b=CUbj/t7kzVunbkT514+dHyfA/aPS/rJjfLgLBnvgEJ4BkosCAHthL/sy/N2jd+aDNUmepkoaADaQaqtnTpt3mjXRbVlqt9vzjD2APTl0uDv0J8hBlzgXd/HOjnbykHhrO1Yo6vMX1jMdAUI0HZGJEMD5XpkFmxfTuyVIWciBpoAuOv0xniTRORQzB+8vhdMg9q+7QGM5IMJUvCmsnlswMNB+8m0Io51BLmvsy+RKf98zaMQDoQZqFO8urbyRukLSd7b07xzFQEGJNHA9692eqX3PZae7lHHxSFdaQJqvmZMvumiiDpttwBTEZCm/OQ0tGgNflOI/zj/98dbDSWlDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbuX65tJ54n2G945wEmD/8YcpD6mKGhhzmwPsuvYmB0=;
 b=K2Ztp+6wV80qXXjbz9QxVHbGvvvhW74GKUpbFDtSIA+iRMTUJJMof/nv1XPf8SSdgNpIeGjZ4upBR81j2TyboO4VVB8mn5UYYeDFv+xDytkiKEIqSGk7oCGLX1ajsLMjdNHpfTN21vcJrkd+irjdlBvCujKQeqXMBogZzB96DaU=
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com (2603:1096:301:5f::10)
 by TYSPR03MB8759.apcprd03.prod.outlook.com (2603:1096:405:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 07:05:58 +0000
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f]) by PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 07:05:57 +0000
From: =?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v9 0/2] add VCP mailbox driver
Thread-Topic: [PATCH v9 0/2] add VCP mailbox driver
Thread-Index: AQHcPAsto9DZfasHeUaDhZuTimU8O7UEzheA
Date: Wed, 26 Nov 2025 07:05:57 +0000
Message-ID: <55b5b1c72e592b97a3841b31ea52ce1dd2f6b2e6.camel@mediatek.com>
References: <20251013063146.17919-1-jjian.zhou@mediatek.com>
In-Reply-To: <20251013063146.17919-1-jjian.zhou@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6363:EE_|TYSPR03MB8759:EE_
x-ms-office365-filtering-correlation-id: 5e8fb0ae-158d-4ba9-e81f-08de2cba3fa1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?c0xnWnl5anZCODVDKzYvRGJWK0hQSlBlVzhRMmF5enEwV0VTa2QvalVrVXE3?=
 =?utf-8?B?M2RNRk5FZHpPa3c3ZHF2SGxNNjA0VGs3Tkh3djZTSTR1bHpmdEV1VFBWQkpX?=
 =?utf-8?B?eVZETndscC9kcFU0a2FhSTd2OUZDL0xOL2F0YTV1MEw4VGtubE1IWnBscmds?=
 =?utf-8?B?ZlVWbUlxVVg4NGozQThYVDFlbTEzWmE4QzAyWjBwMTRIYnpqMk5PbmdGSWRo?=
 =?utf-8?B?MFcyRHVteDh6dGhjeXFsT1g3QlJwVmczR3FQaXFXTTU2d1hvT1ZFRDQwWHhU?=
 =?utf-8?B?Tm8vSHlsZFFGcUdWRUNZaDBaR3JpS29GdDFOdUJpMFdsdjlRUFA3U1dBUTNM?=
 =?utf-8?B?NnBJQzlrUW8yQ1hMbUxmd2prZ1VKSlZKQUxWUXVGV2d0c3RWV0hCTlhuZFpO?=
 =?utf-8?B?ZThuZThSbnNaWmw4VU14QWhhWkJNcGxoUmkwYkhNekN2R0J4OW44enRXYXpm?=
 =?utf-8?B?YzNJYk12TWFFTU50NzhvZ0FQUk1UeCsrclV1TGtXQ3I2bEpEemVDdEhHSHM3?=
 =?utf-8?B?M25qU2RCU2w5SjlvQWNoWUY1dGNQMDZtcUN5Z2RvVFI2bWlwNjAvN0w2a3Ni?=
 =?utf-8?B?dE4vOHRNVS90WFQwRGVFNTdCY2pmcXBtMW1qbEoxUzFrNDdqQU9aR05VdFdP?=
 =?utf-8?B?VVdPZGpwRUc1WkQ5dlU0VGdRM1lFeUJ0UXRRRlNpU3BJNm1YcVhIY3VnTSty?=
 =?utf-8?B?c2NSa3JXZ0wweWE2bnZDeE0zY0pvZkpHY2N5LzBjcElHOXpuNDdmdnZrK2JW?=
 =?utf-8?B?MGtkN0xFd0pqVjc2UCtUTFZwb25LYlZMY0Y2THhySmxIL3JEenpnL3QvWUVW?=
 =?utf-8?B?MXgrVWNNYm5yVnAzY3JJOURJWEsyWGl1VkQweW1USmMra3V4NUk2ejBnbEpo?=
 =?utf-8?B?TEVSd2ZVdHdyVjlxL015ZmxHazdZcWp3SUhhNXNNVVNJNGdiN25CZG5EbjhY?=
 =?utf-8?B?Z0FPUXRqbVdlUngvZTJpK2ZEcHNQYUxNVHgyMURHN21uOTJuVjc4NWlJa2p2?=
 =?utf-8?B?SmUwQUpISmtnQzk3dVdIVm1CVC9rTGVJRjJPdmVBcjYvY0FzbVZIdWdGSjl5?=
 =?utf-8?B?bGVUdnFqMVlkWDMzRTZwUGhReEVRQ1N3UDgrRE9RV0NzbGJTbzh4NmZJZ0Uw?=
 =?utf-8?B?VlVTYUk1MGQwK0RLVlJHMmdxMldtdjdOZlViZzQ0OURLMzdKbitwcG1rTXlM?=
 =?utf-8?B?SEs0ak93WXUyMXJHZlBoQ1E5N1E4ZzJkS0dTRkVMV1gxSEQ0UEticG5PZW9Y?=
 =?utf-8?B?M1podjJuL3R1bzg5QzdLVXNWODBKTW1xNmJ0VFNrNGtRcUkvUkNtUVFQa25G?=
 =?utf-8?B?MUhOWlJBWVB1akxLSW0zWlNKM3dYYW9SU3dQRFhMZ3dmRG85QVZ6c3B0UFdW?=
 =?utf-8?B?ZFIrSmNsOVgrRG9wVml2SWYxS1Y5WTA2TzhJMDRGVTE4cXVacG1tREJ0RVBp?=
 =?utf-8?B?Ui8waVFHWlcvQXc3QWh1MENwMWFZRzE2VGlhSldKWVkrMzlLK3M1WThETXZu?=
 =?utf-8?B?clVmOGhxN2hCSklkSjdSaGsyRDZQOXA1SGhJTmRLQWhNN2xhOFJIOHk4NkRJ?=
 =?utf-8?B?bkZkelZxakxCREpVZ2xTQ1M5VCtCRDhQdmFKQlo5RC84QkQ3cmYvYS9VMTIv?=
 =?utf-8?B?Q1ZHMUpveWx2Y1ZqWXc4blFoZTU2VDZRbHNnK2J3U3VCZml2UVBMUVhJOUxF?=
 =?utf-8?B?MlYwNW80dkxCUGZKTjZBMHJSdy90eitoUEJWcGdqZ2hpdnMwVWlaemI0dGsy?=
 =?utf-8?B?d2pPSnplZjFaZy9iaTFRTzROOHFCMGJha3F1ZzladENLa2FSMitramtSVCtx?=
 =?utf-8?B?QUF0YldncjdPTTZrVk5Dd3NOZUxVRlQzMkhMMEszTjRrcUVGWFBId21sNjg4?=
 =?utf-8?B?b1IyQjJpY3NOU2hDWUFSbFllV1Z3WmFQclBiS3hOaU5vRzNRVTVUZHFmUkdo?=
 =?utf-8?B?Rkdra0ZqUVU5cDlLOGxaTWZaN3o1WnA4OWRsT05JbGFtM0hlOUNZbTd4UGtN?=
 =?utf-8?B?M1pSNGZVUVhHLzQ1c2RRcmpYbG1seVlIWHlGdUhqb3c0VkRHZC85T05TMFRq?=
 =?utf-8?B?MXoxUDRhNUlNSEEyV0lyTnZsUFd2TjZiUTRLZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6363.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWhvbHRuRG1lNW43d05hQ2FvaG10ZzdOenJQZStyYm9senB3dFBVNnp2SnlU?=
 =?utf-8?B?SzJyNW1HL0ZDbnptcDBYWHJNTjZBUUxOemdnQURhenlIdUhkSnN5NFNUbHJE?=
 =?utf-8?B?OGxrdTNtZjFoR3JrY2J1b0JPcGlGVVNKTTlDRVlpMjBqdUZDcTFXdVBRRlVn?=
 =?utf-8?B?dDlrbTlSK1E1N29oQ0dKVkJuSTVZQUJSR3ZaTFA4MmNPMGViTW0rRTNBcVl2?=
 =?utf-8?B?b3ZoeUpYTUhMRDlUZTNPTHVMUlRqeko5eXIwd1UrZjEwU3lSUGxkcXdDSFVC?=
 =?utf-8?B?cHNzMEN2T2tjK2FVaFpyNzVOd3BpRnVPbHlubHZickpWNGU1ZFYwZTBEOXlU?=
 =?utf-8?B?QnFJWDhYM0NYajlhY0lnU2t6SmRCc3dZOTdKTzZJTTdGMy9ORWltVUhhRHdS?=
 =?utf-8?B?NXIrMEtlTmtSQVFNMmNKVWZHQ0cyZkRzdEFzV2pnaE1RWFN1MEhtR1cvYWhz?=
 =?utf-8?B?NExwMUNoZW9DWjdjSmdNZmY5UHBPMFBuUzRjcWEyVEZkQmI3T1pYa0U0Z20v?=
 =?utf-8?B?d1ZUSjVNUnU0djVSRGlpNlJncXllSnE0eXJ1WVhiVzZlaU05ZnM4blliTE1k?=
 =?utf-8?B?dU1jNHMzT01lcUhiNmFMN3R3YWVzY0d3NFd4bFpZb243dGN0SGVPRENtS2NN?=
 =?utf-8?B?ZktKVkE5czdzTVFub2ZmcTVXTlBKRU5JWXdwalVZYnQxalhWQW9xdldJNzM5?=
 =?utf-8?B?and1RzBqamUyaGJIUnpQaWxPMW9NdXlVUUtBT0F2OVlGWkREZmdLZWZCYUho?=
 =?utf-8?B?WWR3cFZIbHZmWlFxcXFNWE5pclRoaWd6Q1pmTWptekNUQnZ1bmUrTjhQbzZj?=
 =?utf-8?B?VFNkSXljT0U4djRrenFkd2Vzc2ZnRlFwTm9qNFpxR0RvbmtKdEFHWnpTSTR5?=
 =?utf-8?B?bjV6M1RFTnBvcTV6WW1HVEpDS3RVUWV1NTlBVDJOZXFJVFJ1Q1A1V013NnBi?=
 =?utf-8?B?cnlFRkIycEhTQUhwSWQwRU0rai9RdzVMajBmR1JYVG1Ub2VmY1J0S1pPZ1I3?=
 =?utf-8?B?UWNqZzRMaEJTbkVOU2hJODYyZDNvb0ZONitqaWtzUWlvZG9lNkdVeFBpbG9x?=
 =?utf-8?B?K2hEZW53ekhUSjJNQXRiS1ovQzdxOEdLNVBBQTZ2VHVTUGZWVEk0eHZNNlpi?=
 =?utf-8?B?ejBlZTNpNVcxWlBJY091RlNjNnJSYVYwc3ltU1I1V0kzb1JGUVJNN2ZEeXFq?=
 =?utf-8?B?bElPdEg1S0tRU3pXZXhxT2tZa3hadEVFOUNjTDgvdDZ6b3JnVXpUUHpYMTVo?=
 =?utf-8?B?VjJkMkxGK3JUalhINDhKZmJFN2xrSUZxUVo3ZmpYa1ZPYXAwd21INVp4K2Jv?=
 =?utf-8?B?MTZOTXlOcGY4dmtuUFBGc2VpcERQTkdTWklCcjFBYUxrWmxqaU9kMk9DeXBX?=
 =?utf-8?B?ekI0RUJ5dk5XWkc0bjFvaEg3c25FZmNzdk0remk1N2dTT3RKOWtiMlBVWHJj?=
 =?utf-8?B?VXVGMlB3bldlV3ZGMTllOTRMc21PS1pxRzhyaDhudjRnQm50a1NpRlNZcyt3?=
 =?utf-8?B?enljU3N3dGlQcGpYdjlWUXBJakFyK1hIcGNSdEx3Q2dkL2p5d3BPTXYxTFNK?=
 =?utf-8?B?TVQzR0xJVWxvYUttMHJ3d1hoaExzRXBPRStIeXQvYk43UERkbVA1THVxY0lC?=
 =?utf-8?B?TXVnbGpxM0Z5cWk3eFVCVDVudVNVSiswSmhSems5eUFDbUN3QzZ5VEVOclFi?=
 =?utf-8?B?OXlOc1NrODNtTHNkZXh2NDZCU1JrblVxYTYrTFpPWE8ya1E0cFk5T09VZ1J3?=
 =?utf-8?B?cXhDbkVySmpMN2lMcjd4YmU0YnNJeVRVNTQ0Y3ZLTzRrank2d3dxek1vdEl4?=
 =?utf-8?B?blc5RFR3WDN0TzJCdktpd2lXWkNHV2JreUdNa2VGWkFicnZDck52N2ZUWHhJ?=
 =?utf-8?B?VjNIOHFaeDN3VDZwaFk1L0JHN0llcCs5MCtzRW94WUhyWlJmUW9wNFFTNHEw?=
 =?utf-8?B?NjNTWm1uUHdaSE4wZWRiMElYalJ2QUxyQXdBYWJmbVZITmhiMVZCdW9YdjdC?=
 =?utf-8?B?eGxDMjIzYXpjd2lyeXlBeUdKaFU5WWU5MnF1WEJWenRBM2VEOFF4SHFvZWRW?=
 =?utf-8?B?NVdpbW5CcGdIbkJneUROdlVaVERHWEtFQS9IYkFGUDc4RkxzQXhvZTdCdlhT?=
 =?utf-8?B?Wi9vNC90ZTBxLytpZXlhYjg4RjlURUE4QnNFMmdVUXhFaFVKZ1VyMVQ5RGpU?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF7CC87515216D47B59F51A191EEEDD8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6363.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8fb0ae-158d-4ba9-e81f-08de2cba3fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 07:05:57.5933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVR6YP7Z5eRGVh94nlr/x30UefHaBQAvzv2m7qNJfk3mMfoUqIqxgybcLYp8eUj5EmOU+2dH8pYegC7YZMsCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_230614_005614_82434FD9 
X-CRM114-Status: GOOD (  15.97  )
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDE0OjMxICswODAwLCBKamlhbiBaaG91IHdyb3RlOg0KDQpU
aGlzIGVtYWlsIGlzIGp1c3QgYSByZW1pbmRlciB0byByZXZpZXcgdGhlIHBhdGNoOg0KDQoNCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDI1MTAxMzA2MzE0Ni4xNzkxOS0zLWpqaWFuLnpob3VAbWVkaWF0ZWsuY29tLw0KDQo+IEhpIGV2
ZXJ5b25lLA0KPiANCj4gVGhpcyBpcyB2OSBvZiBteSBWQ1AgbWFpbGJveCBkcml2ZXIuDQo+IA0K
PiBDaGFuZ2VzIHNpbmNlIHY5Og0KPiAtIEFkZCAiUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
PiINCj4gDQo+IENoYW5nZXMgc2luY2Ugdjg6DQo+IC0gUmViYXNlIG9udG8gbmV4dC0yMDI1MTAw
OCBhbmQgZml4ZWQgYnVpbGQgYnJlYWtzLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2NzoNCj4gLSBt
dGstdmNwLW1haWxib3guYzoNCj4gICAtIENoYW5nZSB0eXBlIHUzMiB0byB1MTYuDQo+ICAgLSBD
aGFuZ2UgQklUKGlwaV9pbmZvLT5pbmRleCkgdG8gaWYuDQo+ICAgLSBQdXQgdGhlIHBsYXRmb3Jt
X3NldF9kcnZkYXRhIGJldHdlZW4gIm9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSINCj4gICAgIGFu
ZCAicGxhdGZvcm1fZ2V0X2lycSIuDQo+IC0gbXRrLXZjcC1tYWlsYm94LmgNCj4gICAtIE1vZGlm
eSB0aGUgZGVmaW5pdGlvbiB0byBNVEtfVkNQX01CT1hfU0xPVF9NQVhfU0laRS4NCj4gDQo+IENo
YW5nZXMgc2luY2UgdjY6DQo+IC0gbXRrLXZjcC1tYWlsYm94LmM6DQo+ICAgLSBSZXBsYWNlIG10
a192Y3BfbWJveF9wcml2IHdpdGggbXRrX3ZjcF9tYm94Lg0KPiAgIC0gTW92ZSBtYm94X2NvbnRy
b2xsZXIgdG8gdGhlIGZpcnN0IG1lbWJlci4NCj4gICAtIERlZmluZSAic3RydWN0IG1ib3hfY2hh
biBjaGFuIjsgUmVtb3ZlIGFsbG9jYXRlIG9uZSBkdXJpbmcgdGhlDQo+IHByb2JlLg0KPiAgIC0g
UmVtb3ZlIEFQSSBnZXRfbXRrX3ZjcF9tYm94X3ByaXYuDQo+ICAgLSBQYXNzIHRoZSBwcml2YXRl
IGRhdGEgc2luY2UgdGhlcmUncyBvbmx5IG9uZSBtYWlsYm94Lg0KPiAgIC0gTW9kaWZ5IG10a192
Y3BfbWJveF94bGF0ZSAicmV0dXJuICZtYm94LT5jaGFuc1swXSIuDQo+IA0KPiBDaGFuZ2VzIHNp
bmNlIHY1Og0KPiAtIGJpbmRpbmc6DQo+ICAgLSBQYXRjaCAxIGZpeCAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBlcnJvcnMuDQo+ICAgLSBMaW5rIHRvIHY1DQo+ICAgICANCj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjUwODIyMDIx
MjE3LjE1OTgtMi1qamlhbi56aG91QG1lZGlhdGVrLmNvbS8NCj4gDQo+IENoYW5nZXMgc2luY2Ug
djQ6DQo+IC0gYmluZGluZzoNCj4gICAtIE1hdGNoIHRoZSBiaW5kaW5nIGZpbGUgbmFtZSBhbmQg
Y29tcGF0aWJsZS4NCj4gLSBtdGstdmNwLW1haWxib3guYzoNCj4gICAtIERyb3AgJ2Rldl9kYmco
ZGV2LCAiTVRLIFZDUCBtYWlsYm94IGluaXRpYWxpemVkXG4iKScuDQo+IC0gU2luY2UgdGhlIHJl
dmlld2VyIGhvcGVzIHRvIGNvbWJpbmUgdGhlIFZDUCBJUEMgZHJpdmVyIGFuZA0KPiAgIHRoZSBW
Q1AgZHJpdmVyIGZvciBhIHVuaWZpZWQgcmV2aWV3LCB0aGUgb3JpZ2luYWwgdGhyZWUgcGF0Y2hl
cw0KPiAgIGhhdmUgYmVlbiBzcGxpdCBpbnRvIHR3byBwYXJ0czogdGhlIFZDUCBtYWlsYm94IGRy
aXZlciBhbmQNCj4gICB0aGUgYmluZGluZyByZW1haW4gdG9nZXRoZXIsIHdoaWxlIHRoZSBWQ1Ag
SVBDIGRyaXZlciBpcyBtZXJnZWQNCj4gICB3aXRoIHRoZSBWQ1AgZHJpdmVyIGFuZCBzdWJtaXR0
ZWQgYXMgb25lLg0KPiAtIExpbmsgdG8gdjQNCj4gICANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwODIwMDk0NTQ1LjIzODIxLTEtamppYW4uemhvdUBtZWRpYXRlay5jb20vDQo+
IA0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAtIGJpbmRpbmc6DQo+ICAgLSBSZW1vdmUgdW51c2Vk
IGxhYmxlICd8JyBhbmQgJ3ZjcF9tYWlsYm94MCcuDQo+IC0gTGluayB0byB2Mw0KPiAgIA0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAzMTcxMTAzMzEuMjc3Ni0xLWpqaWFuLnpo
b3VAbWVkaWF0ZWsuY29tLw0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBMaW5rIHRvIHYx
DQo+ICAgDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDMwNTA4MjA0Ny4xNTc0
Ni0xLWpqaWFuLnpob3VAbWVkaWF0ZWsuY29tLw0KPiANCj4gSW4gdGhlIHYyIHZlcnNpb24sIHRo
ZXJlIGlzIG9uZ29pbmcgZGlzY3Vzc2lvbiBhYm91dCB3aGV0aGVyIHRoZQ0KPiBWQ1Ancw0KPiBJ
UEMgc2hvdWxkIHVzZSBtYWlsYm94IG9yIHJwbXNnLiBUbyBwcmV2ZW50IHRoZSBkaXNjdXNzaW9u
IHJlY29yZHMNCj4gZnJvbSBiZWluZyBsb3N0LCB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBsaW5r
IGlzIGF0dGFjaGVkLg0KPiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUdYdis1Rlhx
WmJfdjJkUU5nQ0tiRnBKckxoYlZrM2Ywc1dyck1DVmszamFXd29CcUFAbWFpbC5nbWFpbC5jb20v
DQo+IA0KPiANCj4gSmppYW4gWmhvdSAoMik6DQo+ICAgZHQtYmluZGluZ3M6IG1haWxib3g6IG1l
ZGlhdGVrLG10ODE5Ni12Y3AtbWJveDogYWRkIG10ayB2Y3AtbWJveA0KPiAgICAgZG9jdW1lbnQN
Cj4gICBtYWlsYm94OiBtZWRpYXRlazogQWRkIG10ay12Y3AtbWFpbGJveCBkcml2ZXINCj4gDQo+
ICAuLi4vbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtdmNwLW1ib3gueWFtbCAgICAgfCAgNDkgKysr
KysNCj4gIGRyaXZlcnMvbWFpbGJveC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAg
OSArDQo+ICBkcml2ZXJzL21haWxib3gvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKw0KPiAgZHJpdmVycy9tYWlsYm94L210ay12Y3AtbWFpbGJveC5jICAgICAgICAgICAgIHwg
MTcwDQo+ICsrKysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay12
Y3AtbWFpbGJveC5oICAgICAgIHwgIDMyICsrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjYyIGlu
c2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtdmNwLQ0KPiBtYm94LnlhbWwN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbXRrLXZjcC1tYWlsYm94LmMN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLXZjcC1tYWls
Ym94LmgNCj4gDQo+IC0tDQo+IDIuNDYuMA0KPiANCg==

