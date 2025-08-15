Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5F8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7j0RqQZP3Glq+JnDzFeFOU5AP7H8HB6sjp3CvV8wMI=; b=IRHSxEFPc3UKwxQZpciktFwbjG
	YCXOaYr8nCXJoQiNxdD0Uv58vVe5cVHsOuhFZZu6ulafUi+QmfQYJBdwqlPHm2nWaOnj/bBddWNuu
	Yfxly4luzowbpnqQA2PNF6HtH6l057HsKYHewhDVnnis3uGPgM5Ok1HleMocQP3aJh+zGvD2zeiFG
	LGI9YciW9OvzD+vzOjDmlsevGd10xtI2QxgW/RlDnBc1nCPNhTFfe0uZU3jaIRQI+n664IUpSwNqf
	43J4qPFDLbSPB2jcnr1DQC8mx1yfq1Ly8jexiZBJyvxSvEdJGa93/LSGrDO7UG50txFa5d0JiU7PD
	soYJu+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw1x-00000002oBt-3rvU;
	Fri, 15 Aug 2025 15:07:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqym-0000000267i-2PNa;
	Fri, 15 Aug 2025 09:44:09 +0000
X-UUID: 609ef6b479bc11f09eb0dd999d3936bf-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a7j0RqQZP3Glq+JnDzFeFOU5AP7H8HB6sjp3CvV8wMI=;
	b=jf++to9Cnh6ssoVASG0EOpGqfYRzLOtVez0lVtO/PaxYK6cDtbO4r1qfcDnyQZlHXQP83vE+SP0TJ3eelJL/oGGv8oRKun6duEowhuQqzJ6lmnZiqIYHkS2buvGvNjew4rjzgmsSWtLxe6gn96QkAl+GEP/jSUXCsK/Xrzco6Wk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:72459d95-2786-4638-9988-19b3894b76dd,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:8d0e2c7a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|801,TC:-5,Co
	ntent:3|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 609ef6b479bc11f09eb0dd999d3936bf-20250815
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 112167014; Fri, 15 Aug 2025 02:44:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 17:43:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 17:43:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o540z7ItOaiRYlcxXhmb6Z4ryGxGxsip2vOUi4CMMhlcT2hkoqKmMpxZVmECXYw2IP/YXaIuwpLjAt1cmgMKZCDesG2YkT1twLLHp+b/OF1Z5QN9dBrl4vX7tkG/EOtoAGfdUtLiWW/ZNi2k6wdrdRVEwrvEEUbe6MCBzsapYhm38co80H8JEGCfJtaI56eYheBMMUyZBTX/U6wp4swq7YosNF/XAhR9pyHvbkRjHPbuic7w62TB4p7aSGDLHjeneQwSaBepe/zU+fBCFRX2T2sMre/cIVmb840sksxui//igPIGcyvsqkrUv152yzZWgnPTCRPeZgudO9iN+92vaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7j0RqQZP3Glq+JnDzFeFOU5AP7H8HB6sjp3CvV8wMI=;
 b=yjTcSfjJFDxl/rA/yeZOvcRVYvNPO4byKwDF9O2OWw/ZZLJ7qNS8fjvIVfuecglzFSWXgXXdxTzyJO6xHg9fdlL0c4ZPEGL8/nnE9zJc/ySq+bYA7azz6Cj6swSuUqPsUG0XbS8kD8QWgIO+WvrznYslNOZlls71o62KQVBDX78h5ObEkI89A9mmI1/BVDcnxyWYIBUlZugR3ICsXDl3HMpKuNT6rPDCIOhGyk0tGNYtZKrmi6UI6ZCncAiNRD0aNR7/f7RwtIjNqM64jETd/tqRjB5tK0yTQoqrrF1w/QkampWw5z7dN646n/QySxYWuCDm4EzhTBxAV+9tB51UNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7j0RqQZP3Glq+JnDzFeFOU5AP7H8HB6sjp3CvV8wMI=;
 b=KM6M32jYNrNtUxfob73mV8Rq12jiYyYD3NVChdAFLnQtOLJqwBwkWRZpXFHs+h9UwOWG4k2tyZsmtGxUbASjOcHZasHNuclXhIXQAFlYLeiwKVbLy3ItOEiuKwJ+EWnrhIXo/ew7X57LxaxqwxZjvXTdN4uoOoCW0IruuAxlRHo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7826.apcprd03.prod.outlook.com (2603:1096:820:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 09:43:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:43:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "vkoul@kernel.org" <vkoul@kernel.org>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?UGF5bmUgTGluICjmnpfkuo7lubMp?= <Payne.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kishon@kernel.org" <kishon@kernel.org>
CC: =?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH] phy: mediatek: Modify mipi clk upper bound to 2.5Gbps
Thread-Topic: [PATCH] phy: mediatek: Modify mipi clk upper bound to 2.5Gbps
Thread-Index: AQHcDSpNsT4jYiJHhkGnv/UD83gEjrRjd+aA
Date: Fri, 15 Aug 2025 09:43:55 +0000
Message-ID: <94672a94c59bd6b65317044f070129446b5ec8cb.camel@mediatek.com>
References: <20250814125406.4161220-1-payne.lin@mediatek.com>
In-Reply-To: <20250814125406.4161220-1-payne.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7826:EE_
x-ms-office365-filtering-correlation-id: 63b5c3d8-6ac3-4971-a720-08dddbe04091
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zi9sK1dIL2dvWlFxd2h3SXlUcXR3eHVYNktGUENCaWt5RVRBN25aaWFsRFJT?=
 =?utf-8?B?bkxqL014WlpML29ILy9uZHBQTjFIMjBoQzhqUU10ZFFlOFIvYzFqcGZMSjJV?=
 =?utf-8?B?eVdtTGZ5ZnZNMEU0QzVZZFlBNzJMS2QzVVlYa212T3Z4V0psbExVdFEwaVoz?=
 =?utf-8?B?UW9EQktqc0MwNXJxOWVKTWRiZGR0ZnpVbDdFQWg0NVlSWGNzaThQMmgrbUtm?=
 =?utf-8?B?Zmc2K3kxeEIyZTNOdUhZY1RMZFhuY3prUHIyL05YNmY1MjRIVUtYWDBwU01Z?=
 =?utf-8?B?WmhJQzBsRGZSV3hpdGdDSFhWNFRWL2ltYzlaS3FlWkloQUdNVHFua1pURWhr?=
 =?utf-8?B?Wkdtd3hNRU1qNWJ2c281OS9aRUNncjFmRVZUTjM1akFlZDRncEdzN0ZkY0t1?=
 =?utf-8?B?SytxVjJMdVd2UGdoUm5xNUFWdnRJTHhQNW5DNktIZDY0aitReFJ6cnhMU1lC?=
 =?utf-8?B?M0pmaVl1YWRTT3Q4RFYvei84UG9LOEF1VU52YmZVTjNrZEtQc3E3eURqV3Qr?=
 =?utf-8?B?YWJ5cHhVekp6TnZTZ2VvWnRoYXp2WWJXWXBCZ3RVRzNGZ1NIYkxHKzFQdTlY?=
 =?utf-8?B?dENGOEh1RzdVWExoVy9IMkF5aDVjRVFXc1pPbURnK1p1MGpCTHhCZURHYWE0?=
 =?utf-8?B?RTluTE1heWxoRnVOVDd5SkRFZ1BGWTc5UDk5S3NpemNtZTJpMlhrRitZTk1U?=
 =?utf-8?B?MlNaNGJZU0JkKzJaSTZ4bFpCTFNldzhCUUpTOHQ2enhFcG4yV0x4MGJ3TU0x?=
 =?utf-8?B?QktQd3lwQzFjYlpmNXdVWGRNZXZES1pmazIrRGxzTEQzSlI2TCsrV1Z1Tlh5?=
 =?utf-8?B?YVZFYUUwSHdFaTI1aXZWemQvMnZuQ2hUTmxNZ25BdzFnL3lPVGY2NlpzcnJS?=
 =?utf-8?B?bkxJWXNsNDFKSUdyRUNaSGRMWTFNQWF3c3h6Yi9Vc3ZpMG1BVUwxNUU3L2ho?=
 =?utf-8?B?ZlNNaVR5VFBBcDJYSHpTSmRaL0lYLzZseVBDbXZkTkpoSGM2NjlhRW4zcXNs?=
 =?utf-8?B?YUJqL1Z4YkpuY2JGZ29HbTRkZTYwSk52UzlwVDNrT1dGVk1lSmZFYTV1clkr?=
 =?utf-8?B?eVZnc2k5dE1xUHMwckowaFI5SW82VDVkcFFjY2tLUGJmZlBPb3MxOGR2NnBT?=
 =?utf-8?B?ZkFUVW5kQ0RJZU5DbVJvQ3NpRFFYbWhsY090d1R1QVFBL1JFZ2hTbDBLSWZM?=
 =?utf-8?B?UFo1azhpVXRBSGtxeERGQTdSeFpUUnFwN1dodEVpOFFLbWxGS1BmRzlLVk5t?=
 =?utf-8?B?UmdCd2lZSFc3N2d2bHBWOGZHT0pWWlRqRktIbmx6d3lpT0hLbXVxcHB6ZEdQ?=
 =?utf-8?B?UzNXeTNaQnZFcmdqZlVybDhpYWVOc2VkdlYxb2gvNnJFbjZGNU5wTWZXNDh5?=
 =?utf-8?B?N010WTZGbEttbktrM3Q5RE5ZM2Q2SDdNb3lyUkJ0emozaWZoblkrMVRlNTdE?=
 =?utf-8?B?anVhNnVxZHJ4ZUh5Mzc4eFBVcmxJYkQ1RXhNWWlMWjQ0a3hMeEhJZEhOSmNs?=
 =?utf-8?B?empNRkdwZnkxaWFRK3pvUmROSHpBNGdkZSt0bEE1Y0lrSkxGT1JjbVNBWklU?=
 =?utf-8?B?YmxqUWlCbmlqZnoyWFBzTzBWNnkvTVhzTXc0c2tKL3BMQWpaeWs0cjVERHV3?=
 =?utf-8?B?cmpvSVpMU2xPUEJyc1R4U1FoNkRkWHI4Qk5EaFFGb053UTRjUFNjdE44d3E2?=
 =?utf-8?B?ZEpPSE41Y3dxak5aZC9mejFlUk11cmMzZzRvYmxRV0NWVlEvUlpDZEZMbEtq?=
 =?utf-8?B?am5NZFA2NEdqOTNNMGU2WFNNeFh6cmlXMnRkVllZYUkyQ2U1MTU0ajlrM2d6?=
 =?utf-8?B?WUhuSDJwek05dUMzaEIxRWNrVUUyYlEyUnRiV3dPRDNlMWpYK2xIR2d1NGVC?=
 =?utf-8?B?Y2t0ei9xalpla0hKUkNXR0xqcENkaGp1U0EwZzhoRUhCZTUxcFFBR0VtNk5C?=
 =?utf-8?B?Uk1ZMlhORnB6TXk5Wjgwem4ySGZxY0w5RUU1THlZdGdYTnZUWkE4Q3prZEIv?=
 =?utf-8?Q?0r6kBS2F25s9wXfzDeemuPKx0qUBs0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEpqZ01CNmlDQmVFbmtHbG1mdGhSNjdwcndNcHRobzZhTVBoQnVEaEFDSGRI?=
 =?utf-8?B?c2F0bkphTytUOUJ3LytQL3NRenNvQjJBNFdla3ZuaHR6aXpZa1ZVNXplSm9W?=
 =?utf-8?B?eDlNTHVGOC9pWnllZVh4dkhycFN0Mldpa0x4Y2xaM2tNMmVmWVlQZE9HdTBM?=
 =?utf-8?B?ZnlqWGE4N1ZKTFNlNHNJSXFtY21YQTl6cFJVRi8yeC9oUlQwMitPdUVXT1Jp?=
 =?utf-8?B?SDdybWxvNkdoM2tpMVZVRm9wU0VqOHptYjBkN3VEZGYwdDJKZS9IbWs2ajND?=
 =?utf-8?B?aW9UR0w1MkU5b2o5RWlNc21sTWg5YWJuS01xM2FVSnFJbGtwWmJNOFNPYnIz?=
 =?utf-8?B?SWZzNzlmaEZpbmhXaW56TDhPTlJBSkV0b29WL0VmK2lrcnRMeVB2cHhxMThU?=
 =?utf-8?B?dEZCVlQrK28vNW9jeG9ueXNQRDhsZjl5ekpSenlwUlJDTFYxbXVMK25oYWt4?=
 =?utf-8?B?ZUxGQjg5VGxhNENtNzdFdnZrWFFqdzg1Y2NUR3JTMHAvNFBHRXBITVp3VVky?=
 =?utf-8?B?YkRtV2dNK1FjNlF4c1BrM3hwZ2hIQWJyUmpFbWl1T0J2bmc3bU9xMzlyeGov?=
 =?utf-8?B?TWplU1dod2g5Mi9hUmoya1lkOXRicmVYblY0bHdIRkl5Z3VVV1pTZkdxRFRs?=
 =?utf-8?B?aHZ6dDE1SExhZlgwMnh1RzYyZHdjM0N2bS9xNkpoWUYxK2cyQ3RKSjJIL2h3?=
 =?utf-8?B?bmZvZnFzdFpkVFBNYTZxekp6NHk3cTBJVEJpYmR2ZDBkUzh1ZlJJMzhNZ1Nx?=
 =?utf-8?B?cjBoUVIrdWlCcVI0Q2RORUhiOVdYK2lNR1hTTzRMZFJGQ2UrTTZ1SE4xakpQ?=
 =?utf-8?B?aUxnSldNWHIyNHc2UVpJSGpsRk5xQTNBK3VSd2N0bmVJdVRHakozWFgvdlFG?=
 =?utf-8?B?dGZVN0ZzSHI5NXp3UXVvRWh2Z0xuWXl6c1dWdmFrdFMrdVRld1ZCZ3pqbUxM?=
 =?utf-8?B?MzlMSHBnNklnbVdPOWM0UWZGZFo1WG1VcjAxbG80MVlrb042S25iN29xazFP?=
 =?utf-8?B?K3dFci9LWDdZV29wdjNBSEcyN3RTQ0NrU3Zhb0tDYk5rUUs1Z25QZkszN1Fl?=
 =?utf-8?B?NzhCMnZrT0loTWxFMVRZRHdMaUhVdk9yVStnNXAzNENDazNFTGptZm1QUnBB?=
 =?utf-8?B?QjZ2aDFRRTNxYlFlaFZIK1JCWCtxMUdpSjNkUlRYMmRCUkdjMWdFWDRYQzFy?=
 =?utf-8?B?NWQ4azVzYkxmczJqZjJOQ1RocHc4c2xHTnpSMjZ5ZzFCSkVnUjY4Uy9CN0RJ?=
 =?utf-8?B?MnpPSFdrY0dTVnU1Wm1QYmpIR3FGNFdiV0kzM1M0dkx1NlpIRW11SDF0Tk14?=
 =?utf-8?B?QTFDVnZtQlRGZTY0THN6ZzErTWZtYWZLVEhWRCtkdWV1Uy82YTNxWUF4RG1I?=
 =?utf-8?B?dzNCSUZNSjlxczV6ZDhkWmRBa0pOSGhVZmRJenI3Q1Z2NVMvQU1HRmN2ZjMx?=
 =?utf-8?B?Ny9BN295QkwyVXZiRzFBd2hOVHVINGhadVl2dFJwTmJnVEM0TlJ3NTkrdDVX?=
 =?utf-8?B?d3ZncTNkWVhzZkRHSmU5SHMzMXhqTVkvTHA3V3BsaGRSR2pnd1ZxUVJlOUtq?=
 =?utf-8?B?TWlVNnZta2E2WVl1RjFnQ1h2WXZraTd1d202emp5WnJJcDl0S21EdENnM3dq?=
 =?utf-8?B?My9tUlVMeVJQMHRiNjRHS3AzelREaXk3VzM5bTJYS1grZU1JR1RyclVPRk9D?=
 =?utf-8?B?RzdsNUpCY21QTU5PSXFZa2oyNXhGMUxGYVRzRWZ4amZNK1Q1M1ZSUERzcnJy?=
 =?utf-8?B?SGFtSzhzMXpobXFOZG5PZllsUVdJcHRobXlybHhkejhpREpTMno4RngySm5J?=
 =?utf-8?B?ZTdJWW5XOFczNndJS1lNYXJiZzZjemJnTlRqSjU2RlhmVmVPMW5UR3J2V0Q1?=
 =?utf-8?B?VjFzOG95U3htbFY0UG1lK3BHM2wxU0VQY3NwRzN4WGMwcklLVHI1dUpoREwx?=
 =?utf-8?B?MXZmcDR3dGRHanBjZDVMY3BnVzBpL080dFl3UHJXNGlOKzVjQzRqemsrMS9J?=
 =?utf-8?B?NnI5T0NaMEZiOXRiV3RNczRUZkZqL01XQ3ZCV0JSNXNjd1ZnTWVRdDFpUlVU?=
 =?utf-8?B?ck5hTzVvSnlEUmZRVXV6b0E4MHRqN2YySVBhK1BlY3lqeCs4Snh2ZjNsbmZM?=
 =?utf-8?Q?DpgJBjmFHy49RG+mdsgHCZE3H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F302D0C6B41F74195CFE8FBB2F8DD2E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b5c3d8-6ac3-4971-a720-08dddbe04091
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 09:43:55.8525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtQPJbfMsdnfqidQM/RyXMBZPRvKabXhbZpT+rgaiYU34rIao9t9jRSq9zdGMm/tkt2/0FhGHPBWigf5lWTK3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_024408_618594_C1FAA6F0 
X-CRM114-Status: GOOD (  14.78  )
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

T24gVGh1LCAyMDI1LTA4LTE0IGF0IDIwOjU0ICswODAwLCBwYXluZS5saW4gd3JvdGU6DQo+IEZy
b206IEJpbmNhaSBMaXUgPGJpbmNhaS5saXVAbWVkaWF0ZWsuY29tPg0KPiANCj4gTWlwaSBkcGh5
IGNhbiBzdXBwb3J0IHVwIHRvIDRrMzAgd2l0aG91dCBkc2MuDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaW5jYWkgTGl1
IDxiaW5jYWkubGl1QG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGF5bmUgTGluIDxw
YXluZS5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL3Bo
eS1tdGstbWlwaS1kc2ktbXQ4MTgzLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jIGIvZHJpdmVycy9waHkvbWVkaWF0ZWsv
cGh5LW10ay1taXBpLWRzaS1tdDgxODMuYw0KPiBpbmRleCA1NTM3MjVlMTI2OWMuLmI4MjMzYzQ5
NjA3MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRz
aS1tdDgxODMuYw0KPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNp
LW10ODE4My5jDQo+IEBAIC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIHZvaWQgbXRrX21pcGlfdHhf
cGxsX2Rpc2FibGUoc3RydWN0IGNsa19odyAqaHcpDQo+ICBzdGF0aWMgbG9uZyBtdGtfbWlwaV90
eF9wbGxfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLA0K
PiAgCQkJCSAgICAgICB1bnNpZ25lZCBsb25nICpwcmF0ZSkNCj4gIHsNCj4gLQlyZXR1cm4gY2xh
bXBfdmFsKHJhdGUsIDEyNTAwMDAwMCwgMTYwMDAwMDAwMCk7DQo+ICsJcmV0dXJuIGNsYW1wX3Zh
bChyYXRlLCAxMjUwMDAwMDAsIDI1MDAwMDAwMDApOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGNsa19vcHMgbXRrX21pcGlfdHhfcGxsX29wcyA9IHsNCg0K

