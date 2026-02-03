Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DD6E7C714
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=; b=HUduFgOMZWJhHUfilhtisa7faH
	Bi5240FO9JbZld2RLwZ3SA1yLLRsAs/+q0kzjd/2K6p89YSc9jA8eTz7Im0dydUqSaPlgITMFv50h
	mEP6rvX0+zTFmFw43qAdhUZ2uL7gCz0ZZPhfaXonCVqycw0w10tXcDczrTcbspPsriL2A1HpaQXr8
	6jC08/FkhPL/HLBWbtKTDx02oebxlbZeSLK88rLg/dZOBByuRdbt2n+Ww1xjkMhRZeIU4Vkzi2vai
	dDHmJhXVf6PceMpWD9L3GLvKqbxpAEVS5scEmYhlGTrXtJhiC0DUgpAWB2aQ9V12USQlfiwLY1W43
	z9TIa1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5jL-00000005tON-0q3j;
	Tue, 03 Feb 2026 02:01:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5jI-00000005tNq-3aP1;
	Tue, 03 Feb 2026 02:01:26 +0000
X-UUID: 3c3e7e4c00a411f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=;
	b=auCESAYP4CvRz5FABhFXo96t5442Gjpnyk5vrjCZZ8d+eBwDVcNdHS53d4cnPAKx2Aji4WLSiolFjE3IL3r15zwwyLOnyuzkm4+V+KB/yE3p2qV9eFWDRjgUN5uMWdnvjCn6e097Kz27Jkl6cfVinVOzNLGGg+Mv/MIuYlL5Bjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c80cf1aa-9333-4f21-bfed-c733451cd28b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:2a97837a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c3e7e4c00a411f1a16f0188aa809bee-20260202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 920479732; Mon, 02 Feb 2026 19:01:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 10:01:18 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 10:01:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytJ0HCJ6ygltFZzKa4/tQTePXqDM1u64byHr7yo+LBHBdrVG3RulFjodYFFIhizOaAOYJUIOopQiGdIKJZ8sxTajVfJIa9IDweCJv/1+QG97nHcwRr8YiHT8SeNiOGPul3gVDqephobc/Wd+u0f0bBXk1rgQpkBCz2fqkEpQmHiCN9qJWVZtihjStUl79Rr0we9Uou3UGucSVDQeapGudNdXcv9Q290Z77xB/RYqlz9DbXsHl5riG3ocYG8FWrQKziqSLnHaMwOIzOBPL4ymY4QLjW4kvnWrFe2sTpo2usuPywerwIocJ2Y9fIIwcxiUcjsccySsz8jkP8S94fqmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=;
 b=uyHpXZd5PMHwjdEoQTp7kUvDxB52OyO/wG/9vMknu8eAgR5xN6oynSxAu4zjGtIS+L/0JdCTgQajOsIycJAxv8nFxNvWCs9PNJGV7R7Ejclv7JxqxcRwT0OhJ/x+zzqwTrg5BF1mcAJ+MjfpltHhs0F+4UawSRHuRWeBAUPsNGgarTE9QvTnVpYW9Qb3rstkl/kscN6WVRjyetGGowh0uhAtUX8AvRb/C2/0KEQsSFl6V4VakuXtdYXlDAHFah54H1iu2BNyGJRmURvPtk6Jl/GZhHvPsjEf1zhRk4Y39gE/bYweRUPUT03ZWk8XMc+kt2x94caFwxa+F9yiN/PvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=;
 b=aJ88AiezeXRrhFi3crNjog4SJtw1eZDtcy+9XxdMElA4VJr/5ngYehHa2M4iMbVlWgL6nJMmWwoGLYKL1/rj2HJuSRJ6kv/autouA3caZ0RfbGGK51PqWr4lROZbzC5YK1vDtUyilzcx8UWp60oIHTAyVdEYvnHMX36e5n7nKxM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYPPR03MB9676.apcprd03.prod.outlook.com (2603:1096:405:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:01:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:01:15 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Topic: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Index: AQHceZU/SlrIiCW2Fky/SXbbIg72WbVwbskA
Date: Tue, 3 Feb 2026 02:01:15 +0000
Message-ID: <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYPPR03MB9676:EE_
x-ms-office365-filtering-correlation-id: bfbfeaa9-0b81-4fec-cfaf-08de62c81d16
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QmF1RUFZcDJiN3lSVzZlZnJWUGV0TGxPVW9WcWNqMSthblVtaFVYbG5QcUR2?=
 =?utf-8?B?MTlvWEpXN2llcFpVcExHMTBJYmlWUWN2a2R5VWJTelVpbnJVN29MSEFNVCtW?=
 =?utf-8?B?UUpBNnI2Mmp2RkhhcjdwM25wTDhZbHYwYmRWNjRnYkVRdGVOaGhQdHBPWEl2?=
 =?utf-8?B?eFNsVWtVd3A5Z2Q0Q21vdkh5NjlOZ3RkbTIzK1FXT042RHZnWWJhM1Zrb0hR?=
 =?utf-8?B?TzJkcGZNYWY5VVN4eGxsY2NiUUs4ZXVXcWNETytuUE5OUEY5alRXaTBwY2Ex?=
 =?utf-8?B?TXdXOHYwVm5uMHhTbkl5Mll0cDRpRUowYmlBWGJDUC9xUzlORitCNlRxWDlZ?=
 =?utf-8?B?dXRvUDk2YkpWeEoyYzFoeGcyTm9WUk9SQlFpM0F1YUZ3Zm5yWWcrS2pYYlNx?=
 =?utf-8?B?eWx3end5NVd3Mkc0OVZKVU9rVWdpb1FuZlpOM1BoQnFtQlNxYWpNeHFoWW81?=
 =?utf-8?B?YTBzWDJOTGJxUDlRWFY1OGZlRVI3NGhUVmtLa2JvVUtTVllIQzBORjh0Q255?=
 =?utf-8?B?QXJXdUZmZTlxTUJlMmVHUC9aeTVRcUd4NUhkNTNITkNSdFBFVWxSTE1qbU4v?=
 =?utf-8?B?YXBUTVF3SC9UaHpFVTRYTEpBaUgvVGhYNzBJNDdRZEtvOU80eGpIYWFoWCty?=
 =?utf-8?B?Ulk2S0ZtRHhLR0s3OWRBYzdUYVVsTE8zWndtOW9BWWxTN2sraXBFUDF4YWtk?=
 =?utf-8?B?Yjhmb29ydkl6QUlyMTNqWFMzejFnem5JQzhMWFBxbUhmNitITmNlRUxCL1hw?=
 =?utf-8?B?ejR6NzB3YzRMNXZ4SHVTclAzcmZQUFl6UzZ2TldGaDRLK1FyYXAxUW5pNGJu?=
 =?utf-8?B?aE0zZzV5UTBDQmJVOWJhMGtLSXpnTHNXY3E4QzRxelpxZnhqRTJ1ckpYZGNC?=
 =?utf-8?B?cGZ6KzVKZ2dmOWNFZnlwbmNTTThSSDZhT3gwb01YV1M3UFdtQkxnREFxMTZq?=
 =?utf-8?B?VHFQWTAyT3Rkc2hRK1BLOEt5WUlUMks4SnJKWndQbjJyRjV4aGJPeGw3SmhC?=
 =?utf-8?B?eHFUT25QMy9qODh1Ty9JcG83akg3L2dhbXdONFhPYW9FV3cwMXJ5R0l1TmtI?=
 =?utf-8?B?Zi9iSnE3MFVYUDRYanBUS3l2YUR0cGpVbzB6NllLUWdsMXZuVjI4Rk1IM0hy?=
 =?utf-8?B?b1NCNlN3QUNhTzFZdy9nOXU4MXZpTHllK3hya1d6bmtETDFOUnVOMGZINVln?=
 =?utf-8?B?MDFjbEw1QlV5endybEdIZUJkeWxkSDltUGpmekRNRmlLTkw2ZXZadHI2c2cr?=
 =?utf-8?B?czZ4cllaejIzL1I1azJaMHJZK2xaSm1mV2p3N2p3WHhlTnBreGF2MC9NSjBx?=
 =?utf-8?B?dWZkK1ROWFc0ellpTEhSN21TSmVSMjA4Nm9oT3JtN1RRVWlja3pEYzdlbTNF?=
 =?utf-8?B?SGR4MkI0czZac1V0aE16MGxvQ0Vob0hveVIzbFFFRlFwUWV2V2U5YzFTY3VM?=
 =?utf-8?B?ZTZON2x6dWRUb0I1eW1KRTM1SUtLbkRGRVQwSyt2bmVQUFlMZFNZZ0FIb2xG?=
 =?utf-8?B?OXo5YlFjSndjTlFpVXhlT1hhd0EvOEJ4d0UvaGNmWGd2aitmbTAwMzBlQUd5?=
 =?utf-8?B?bkgwK1dDamxRM2lPREI5NEY0aFl0UVp1UjB0TndNRlR1MFNoQjVrdG45b00z?=
 =?utf-8?B?alEyYmNPVUlaR0pzTGFIVENRWmQvOVZPUWdVVVlNMUtBQmFjb0REL2VWN1lD?=
 =?utf-8?B?UkRlczFmVWt6OUIyU2N6dGI2VmdRMExJdlZTMWNvM2NtNVBCeUhUSHJoL2Nl?=
 =?utf-8?B?SURpZitLNHJPdUZSdm9BaXh2UWFJNTkzR3BRUXYyK2YzdEtDWHp0N0dwUUky?=
 =?utf-8?B?NGxoYkwyN1VZM0p1ZUs5ODNCRTd3RFI5ejFZbXU0SlpEUWE4Ry9tbGFXSkZE?=
 =?utf-8?B?am1UekdPVGFFR2djZ1RuMnpSSXdNNGM0eTR2bUMraFhZN3RNNVl4QTVOa3NW?=
 =?utf-8?B?b3l1YlJEYWVuYTc5TGdzd3JwbG9rZUtOcXhRSzJnd2JGelZCLzJDdVBobnpi?=
 =?utf-8?B?ajkzWTN0Tjl5NEdJcTBhMC95Rm4wc01wcXhLWVpyaGdCbUxzdm9KWUpEWUsw?=
 =?utf-8?B?elc3ays0MkJ3MUE2TEJiTisyY1pWdGVzNHhTMFFZcmQ3TjlvMnIyWlQ5OUtL?=
 =?utf-8?B?OTlORFZEZ2xacHRuKzg2YUZCY1RiYjlZblRGWUJuTE9RblRaSDhyeUhKZ01q?=
 =?utf-8?Q?GDpi3SL7k6saTzEJyTMHuPU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEt2dlQza0NhTUE2a3c5VjV5ZHhHaW41SVN1dHkvc0plS2VWemxlUXVvYzJN?=
 =?utf-8?B?WnpxSk9RZThVTmJCQm9LZkRQR3hSaGZndERlL1BBZ2pYTVcyRlcwcXo2SmhN?=
 =?utf-8?B?M3g0cmpsOWNZaWdVNjZXVkMvMWJIL0RQUDZOZHdIQnhOWW9IWTdPL25qdElO?=
 =?utf-8?B?VHlmMDE0TXczUUVQQ3ZDV3dQdDlxQ3ZGVHhqeWZ2dHd1MEY0MFRYSjczMDN1?=
 =?utf-8?B?SDBONEEyeW1mY1czSDNtNVQvd3ZkdDJDSE1uRVlRM21MVktjYndOVGFhQmxQ?=
 =?utf-8?B?ZEM3QjlqejhxSmdQeDJCbHI3Q20ydUJscXdPMnBjMk0vZmN2YjJNcU9uRWUy?=
 =?utf-8?B?c2JjV0RiVGNTSzA4cXROY0RMZU1SaHJhNHhOdHZHN0tEbEJNQjh0UFFSbTZs?=
 =?utf-8?B?eGVxN0VFTzE2U1VSd2xiaVA4SXNQQ0M4OVcwcDRIV3kyQlVuZXJuOC9MQVRM?=
 =?utf-8?B?NjVNQ3R1b2grcTUwck1waldwaDliTjFsS0htS051ZjJ6ZU1zNTJVQVZRcDNS?=
 =?utf-8?B?a01JejJueHZheWM5NVhFOUtrNTZJaERkejl6aTVrWVRaQko2eDNhYTc1UTFJ?=
 =?utf-8?B?WXV0ZTZvTTJnbjRjekdkQXYrc2FmclJiUnRYc3BwRE1FK3NucmVYVEZvVXBo?=
 =?utf-8?B?T01qT01taDFpdk1LUExZWG5aTWEwODFZYmhxd1pibEd6VGU0RHdUYVpZdFEx?=
 =?utf-8?B?V3lwNkg3NUpvUG1CZ1BKeXE1U2FTNldBbFF3QVNkNEM4eTVPSkR3LzRpa2lG?=
 =?utf-8?B?RG9UdzhHaXQwREtlc09OL1lxcTNJK283U0t0MkJoWE5rcnlubkxjRllYS2JN?=
 =?utf-8?B?U2w1VW9PTUdHMDZocEFGUTZnSjVFS2NsRm5oUDFtVDlWZWpET24wYjBXa2Rp?=
 =?utf-8?B?Ry9sR1JvMVJjYkNRN2JDTlFna1J0UHBpUGdyeG5qQkNHNG1wNEI1ZXNDSW42?=
 =?utf-8?B?aFlWUnpqeFhxMWJaSi9NWEVWaHY0ZW01SVc0U2VxblZiNzJYTEorOUdsTXhI?=
 =?utf-8?B?WHJhRGkrZ2hJTDh4dW9STDNEbHdaUWJBQnA2TzYrSUFLNWUrdHZVb3pnbWNP?=
 =?utf-8?B?SzFRZlFVeHBRZVFtNEZtY0dwcXFyTDZTMGoyS1pIa3FERGxCQ3NHL0tpZXRq?=
 =?utf-8?B?MU5YbFQ3djd4aEdmWU1aTGkwOUV0cTIxSkNkVWJaamdmcWRtMVV2TXVxdFJ3?=
 =?utf-8?B?K1dVY3cvZHZwU3haOXZrSUNDZUNlS3ZtdnJJaklzZ282bVNMeDN0akxic0VM?=
 =?utf-8?B?c0RaeHJSOElsVTJJbk16U094REdWbW1iYi8vKzZoeS9JWHR3aG81N2UyTDVr?=
 =?utf-8?B?a0kvanVKV2h2S1k0cDBCOEtRVVRTRGV2dFc1dkxDWkt2VDljRXY0aFZRaUZV?=
 =?utf-8?B?UER2VzJwZVlTZ0dWUFpiVVd1SWI5cDFDUEt6L0g5c3BWdHN1QzVZTEZCNDg4?=
 =?utf-8?B?c0QyQThJK05RSSs0VVdLeGg1Mk9DKzM3ZWtkVklERVY2WmpYR3RvYjN0UGVL?=
 =?utf-8?B?TjBkakhIdUxaeGJ6eVZKd2NheGhrMEpzOTVraDdXL25SbzJ5NlRGeEk3RU54?=
 =?utf-8?B?VTEzUGhSMXlVRGorS2xIemxWUkJVSXpDcjJtNENSOUtGcEphaXg3dkJxOUtW?=
 =?utf-8?B?RVR2czloMHppTGxEWTQwS0ZaKzZ6QnpmVEpTRTMvTldIMjBVdHkvekZ6SW1T?=
 =?utf-8?B?MEdZdGtlY2VDYlZOSXdQbXVWQU9tUkx5RGlhd29VRURRRXFHRE4wTjdtSXBQ?=
 =?utf-8?B?WDl0U0crSGY2ZlJYN0ZzT2h0TDRIaktlcktoUGJ2dEMvcngwNTFsQXAzeWVX?=
 =?utf-8?B?N2VtUzRSUkh3RTBDeHdWMmd6S0JYRXFURzdlam5SSlQ0enBjSEVUNFIxbi9Z?=
 =?utf-8?B?VWJWdmgrM2JVRVNOenFPbzFIZ1pDSDhTcXpSb2V1QjFLQWZaZGtnNXkzSVZO?=
 =?utf-8?B?eWZ1ZkE5U0xqQlZ1NVVlUFVDMytMaCsxbUNqZWxreEwxZ1JVL2YzK1U4TXdj?=
 =?utf-8?B?OUJvY1l0WGJCOEE2dlk2TVlCejllcXhwQzdmNW5CUDA3NHl5aThYbTFINjJx?=
 =?utf-8?B?Y1E3L3pPMklUUW5wWjJkTmM1amcwNVVGbnd3bEt6dEdWc291ci9rU1BKMFVJ?=
 =?utf-8?B?U0M0ZnczenN4M25qN210Sjh1R2x0UTJvaGF6ZHlqUnF2SW11UmlUK1hUajZw?=
 =?utf-8?B?NTdwY1YvNFNPNEh3U0daamJGME1EdndvYVc0VDFmNncwLzFmeElGdFFkcG15?=
 =?utf-8?B?WUNIbTN1S1hGVE5aMWIzMnIwYU51aFM1NUJxUHl1djFibXpkODkxRVdKcmxx?=
 =?utf-8?B?NW1GQTgwcXVaTzlEYWlnWnVVQVA1MXBaU255bXl2NmpheTFJMDJWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90BFD104EF830C46B77479C3E5E60029@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbfeaa9-0b81-4fec-cfaf-08de62c81d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:01:15.3681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVfqK0n8QS9zU7jW8o6A3DwMTqrRapsaupE7iBvR/gj1a0+VouzFktRBm/s3a1Ma6Kq6mbxpoxxyV+eyW3in4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9676
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_180124_937676_1D3AE900 
X-CRM114-Status: GOOD (  14.00  )
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

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRnJvbTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bj
b2xsYWJvcmEuY29tPg0KPiANCj4gSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBi
bG9jayBhbGlnbmVkLiBEdWUgdG8gdGhpcyBsaW1pdGF0aW9uDQo+IG9mIHRoZSBBRkJDIGZvcm1h
dCwgT1ZMX0NMSVAgbmVlZHMgdG8gYmUgdXNlZCB0byBhY2hpZXZlIHRoZSBkZXNpcmVkDQo+IG91
dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0aW5nIHRoZSBhbGlnbm1lbnQg
Y29uc3RyYWludHMuDQo+IEZhaWx1cmUgdG8gZG8gdGhpcyB3aWxsIHJlc3VsdCBpbiB2Ymxhbmsg
dGltZW91dHMgYW5kIG5vIHJlbmRlcmVkIG91dHB1dA0KPiB3aGVuIHRoZSBBRkJDIGRhdGEgc291
cmNlIGlzbid0IGFsaWduZWQgdG8gdGhlIEFGQkMgYmxvY2sgKDMyeDgpLg0KPiANCj4gQ29uZmln
dXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBBRkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLg0K
PiANCj4gVGhlIGZvbGxvd2luZyBpbGx1c3RyYXRlcyBob3cgdGhlIGFsaWdubWVudCBpcyBhY2hp
ZXZlZCB0aHJvdWdoIHRoZSBjbGlwDQo+IHNldHRpbmdzIGZvciB0aGUgaG9yaXpvbnRhbCBjb29y
ZGluYXRlcywgdGhlIHZlcnRpY2FsIGNvb3JkaW5hdGVzIGFyZQ0KPiBhbmFsb2dvdXM6DQo+IA0K
PiAvLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ICAg
ICAgICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAg
ICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAg
ICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAg
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiBcLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLw0KPiAgICAgIHwgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgIHwNCj4gICAgICB8ICAgICAgIHNyYy54MSAgICAgICAgICAg
ICAgICAgc3JjLngyICB8DQo+ICAgICAgfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgfA0KPiAgICAgIHwgICAgICAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58ICAgICAgIHwN
Cj4gICAgICB8ICAgICAgICAgICAgICBzcmNfd2lkdGggICAgICAgICAgICAgICB8DQo+ICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiAgICAgIE4gKiBBRkJD
X0RBVEFfQkxPQ0tfV0lEVEggICAgICAgICAgICAgIE0gKiBBRkJDX0RBVEFfQkxPQ0tfV0lEVEgN
Cj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICAgICAg
fDwtLS0tLT58ICAgICAgICAgICAgICAgICAgICAgIHw8LS0tLS0+fA0KPiAgICAgICBjbGlwX2xl
ZnQgICAgICAgICAgICAgICAgICAgICAgY2xpcF9yaWdodA0KDQpBcyBJIGtub3csIGNyb3AgaXMg
dXNlZCB0byBkcm9wIHBpeGVsIGRhdGEuDQpGcm9tIHRoZSBuYW1lIG9mICdjbGlwX2xlZnQnLCBJ
IHRoaW5rIGl0IHdvdWxkIGRyb3AgdGhlIGxlZnQgcGFydCBvZiB0aGlzIGltYWdlLg0KQnV0IHVz
dWFsbHkgdGhlIGltYWdlIGlzIGFsaWduZWQgdG8gdGhlIGxlZnQgKHN0YXJ0IGZyb20gYXhpcyAw
KSBhbmQgYXBwZW5kIGdhcmJhZ2UgZGF0YSBpbiByaWdodCBwYXJ0Lg0KSWYgc28sIGNsaXBfbGVm
dCBzaG91bGQgYmUgemVybyBhbmQgYWxsIHRoZSBjbGlwIHdvdWxkIGJlIGNsaXBfcmlnaHQuDQpU
aGlzIGlzIHRoZSBub3JtYWwgYmVoYXZpb3IuDQpJZiBPVkxfQ1JPUCBkb2VzIGJlaGF2ZSBhcyB0
aGlzLCBhZGQgY29tbWVudCB0byBkZXNjcmliZSB0aGF0IGNsaXBfbGVmdCBkb2VzIG5vdCBkcm9w
IHBpeGVsIGRhdGEuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcmll
bCBEJ0FsZXNzYW5kcm8gPGFyaWVsLmRhbGVzc2FuZHJvQGNvbGxhYm9yYS5jb20+DQo+IENvLWRl
dmVsb3BlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiANCg0K

