Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85177FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41EghBR1Si3KUu3EmNwe3VwxGp62drp1WeGSFjgcM7Q=; b=3I/3VU8m6HMjxYbaPfBXWhAcuG
	ENpn2AlqGWtUJSvkPi6hjwOEKcPOuMVZZ97JAKinqnhMvf9QwFcfO/jil1vy/jjFxy9MVnRNBxupS
	XJzBceGIc50+I9sXDPE16kdBNglKdAep7/sn28v6BPz208fUrw5GbDYPTY9mIzzJTNdA3LEYpEpVP
	ntB2G8dac/j7svrG0JCuxd5zLnfCHeRaIrvATIkT88hYFbK2y26OaZ5Ohs3mB/ozsBasf/ISNyDtc
	a65oPF4Cz2dAYtIqhHdToH4S8Kia/lGFM2lYigX9rKUhhnfbjpLhYKqopzZyp106+Hhz+5sWvM5Ri
	bmZtHQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILjx-00000004rz5-2vQc;
	Thu, 30 Apr 2026 07:23:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILjs-00000004ry0-1LqD;
	Thu, 30 Apr 2026 07:23:16 +0000
X-UUID: 6cf671e8446511f1a9a057f9f63c1fe2-20260430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=41EghBR1Si3KUu3EmNwe3VwxGp62drp1WeGSFjgcM7Q=;
	b=EJiQdVHrWGoCoNYlB0pkidIFCv2z5pWb2GN0S7AFpg1sJCcdNtO66n2JHnrYIJ4jdRpCQZpKpC49qHrW9ED9jstP5B+R/H+Hi13VG85DJnzTl/dyS+1xLb4vHzfWlYVDRv98ImDtaTN1hip73HnT7Zwm5pXlNh701hsgGAS4m+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:771fd81c-cfcd-4309-9a68-a69ada5fcacc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fb24bf70-3b7f-4b26-b2f9-40f0deecb36d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6cf671e8446511f1a9a057f9f63c1fe2-20260430
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1877997556; Thu, 30 Apr 2026 00:23:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 30 Apr 2026 15:23:01 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 30 Apr 2026 15:23:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akFKOXD5VzIZ3ciWqyPYqPF75BrgoB+bd7EmYCv/h6j4Mx+PAy2KxGbPYR8roFyjZ3et5ab/nH19SgfhqamPQuqIKAuGm8nYb0W61TP8z7tb/W6ZOinwOqKuTu6rspMmxxvAwhu3s0xz5Adv/QLaEywHCL/rjMz0tFZlAvud06bvvgGMAbnRus53JyPgF6Xxa7G6tpzrkmWFfeAPoUd++x/6bHff9lgsiYFv+ApKCgNLHdPfeY7y5XGRThoeZQci0GSUl1irFhyjJyKrpOTNfVWolcKbvVpdAez76qE6ovhdElrRPoLbgrxOgNAqVANOFrUP2QKYgceJYtOdY7OEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41EghBR1Si3KUu3EmNwe3VwxGp62drp1WeGSFjgcM7Q=;
 b=GPemAZpzSnN2CgDgIYouClLx1HKCRt7ByAVqT3Ef63LBTLWYU4LfezioXt8AJLizDCvxtcSHhvfMsu9RAl6d+VS9GecNBrZpeiRfvmjMvVuhcw0EKKfiUkF1B1lE1TJsBolqI9DScd4T5xM+MR7aDq8ZTw4xfUZgMB9GBXpA19/jMdwQ5LFynYhPUdg+4qNL7i3fgtKwRo7FVopWxX2yhhpGgfv1CDATSIE4DqCJRh6UQ/bP6nrwPj6HPXbL1SxoJCJw6JGE3+q0ERE2rIEut3vND+HkrMDICgcW+Y9IA74q2IR8DCI68uVCdobEAlAd0j0ijXd4qgdzDn4BNXwTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41EghBR1Si3KUu3EmNwe3VwxGp62drp1WeGSFjgcM7Q=;
 b=r8H+iAcL1PzAdLxv4B2MgUs2gjreginIRHCTq5JI5OUyUDIB7DzC2IVy+r5zG00AnOJt2Z0zgUcXwRH3vxTj2dustyFxAL/FjTGHaC0Gdvd6pdR1vKLF6oG1CCvVkArKvJ/McqvUuASD+9TVGmkASYaYLs3wb4g3GSVZNqvP0nk=
Received: from SEZPR03MB7007.apcprd03.prod.outlook.com (2603:1096:101:ac::12)
 by SG2PR03MB6480.apcprd03.prod.outlook.com (2603:1096:4:1c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.5; Thu, 30 Apr
 2026 07:22:57 +0000
Received: from SEZPR03MB7007.apcprd03.prod.outlook.com
 ([fe80::9c76:eb8b:1cad:54]) by SEZPR03MB7007.apcprd03.prod.outlook.com
 ([fe80::9c76:eb8b:1cad:54%2]) with mapi id 15.20.9891.004; Thu, 30 Apr 2026
 07:22:57 +0000
From: =?utf-8?B?WmhlbmduYW4gQ2hlbiAo6ZmI5b6B5Y2XKQ==?=
	<Zhengnan.Chen@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Thread-Topic: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Thread-Index: AQHc1hRAjD3LboVwzkmNK55SMM8SprX0A6KAgAM0iIA=
Date: Thu, 30 Apr 2026 07:22:57 +0000
Message-ID: <9f5275a4ab003b9dbc44afa8e506ea96b19ea41c.camel@mediatek.com>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
	 <20260427070444.20247-2-zhengnan.chen@mediatek.com>
	 <20260428-topaz-turtle-of-support-f5b9ec@quoll>
In-Reply-To: <20260428-topaz-turtle-of-support-f5b9ec@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7007:EE_|SG2PR03MB6480:EE_
x-ms-office365-filtering-correlation-id: ef1c86b5-f168-46ef-10f1-08dea6894d97
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: b4GgS6s+jAYcKt5iEFI1B3TrdgbZjRZdz7/QNpPoX6jXNMaaPEEIQHHV77bPQ12wtpCWlGVb67NfZAGg9m7W2tfMCHi9joUSgH1MpojYRWcL9uq5XwrDrreh3ikRbpt+XcSfsy2O2LDFuCXgY8rkGG+Io71NNfJzOrR0k1O6/+E3xTsimvLNLdWAmqXReFp4RJzRx1BnGb9SSbnGFHq0SkyeF/nCIpiyp2/rkjGSM5tHESRCSwMlIAiIDXnadM0xDY0wmMB7ZIdObQrq8zMt54qU3NpgLrdPwyTlvUaMkgPdvrLEgfMeVqRevpfBHpdyEdPdMR9A2KaySBiPtwGIBvKtbH/zJgcU+J4xBgvwHIkyoRfYznrJ5qFHHVq/QSktS6hpqULVTHmXXqk8hU6kPOJPozTFRXE3HBVb/TzIZ9WNO1TGSr2AhfVQpv1uJFkyJBIA9vOWoPGFiATzgV9QMGU5upEcAjgUVm1MOSKxqcwwFmMUIeXBaV5qaVpio+Odi4PbNN91DIYV4MSTQ71weRYvu6WbHY+Gx6hPaKZKGKMDotfIoF2EW1z7GV5EVT6EbQgbFf4CN82FxO4xmM/Y9INHMqYIKzFGGru+IcF3HYyW2R2c0d8NgxxQu19dmQWrRLP96mz18YMzbHFmkxpDh826gaPlaeBGdn2c9s0leImxmtevc2/cNGYZFAzq/Y4vpDSWkonr2sU6RxhyL4xDD3BsfL/V9rAo8/76KsG85SE7t1BKu2HDsp2efe4IBugjM0Bzs2MTCnjZ5KlUo10vlImNzv6bQIZj6Sq78WJqMnQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7007.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGNheTJUdzBTZENkZW5ucWR2a296OFJIU2xhbTBScFFxTzk0TG5TWUpFdWo1?=
 =?utf-8?B?QVlEcjNJa3haZUpjZ3BuV044SHV0clVvVjVucVY2SWx0V3BQcEczNDI5SGFR?=
 =?utf-8?B?dDdNRXNXaVlydUhMMklWZUZ0YjUwejVOTHFnNE4xK3EvWkRaWWt5czRBZ1RB?=
 =?utf-8?B?SXJOaTlkS0I0bFphQlYwQ0d4QjRMSTBLbEJIZWZHbFNISnVhL2NUcmoxdG52?=
 =?utf-8?B?VVA4U01sQWZGRkpaMWh6c01LZ0FTR2xRSFZuaDFUTGlTY1N0aXYvS0dTTDZr?=
 =?utf-8?B?NmRuTThkMFJLS3p0MmNuMFRWcXAxbkhFNHZHWTVwZm5HeFduMmVYZklYblFP?=
 =?utf-8?B?UGh0cVZhMXFzUDlZcjVzSnJNc2NQYVdZNTgwUG54M09EUldhTDZiN1IrQlF0?=
 =?utf-8?B?Z1hVZTg2czBuNy9sR2gxUllXQnhDUmdSTSt5RUVlaWdSVGlCVFJqL1dhcHJQ?=
 =?utf-8?B?Zm9TR0VrdXpOZ0FEcUNvbEVCa3dNSUpCQzNIN3c0UFVpdGNWaGlxSEVKRWVv?=
 =?utf-8?B?SUp6d0ZraGJGTlJFSGY3VXUwRzliaHpqb0phYWgyNVZScWpUbHlMYXpjZndF?=
 =?utf-8?B?M0tqTXpObFRjS25wMkduZmVlVVVCWWo5ZmlwR0QvR2UyYjd3ZTJsbW1YWGI5?=
 =?utf-8?B?T2lONzJPcWdnejVHT2Q4aUtDYjJUQ0Y5d2lMbUdmOHdxaDRRN0lFaWdKSG03?=
 =?utf-8?B?ZitQdmthYzlxVWp5ZDJNOXJkZ3VLdUx6VFVwVkpwLy9qVW1uTUVKTitQb0py?=
 =?utf-8?B?SkpZdmF1NlpaZi8wTlNucG8xZTY0bzZ6Q2I5OWxuTERWOEFwYll3UVQyOFFs?=
 =?utf-8?B?aHlUR2RvckVIMDdvU2p1MUtROGJZSFR1aFE1Y01CaU9BZTV3dEp0NG5oUXpJ?=
 =?utf-8?B?T21KN3pHelNVaVc1V1lGZ1BITlZsTjMzYXpXeHhYTmVjY21Dbnk5OUJ4RmY5?=
 =?utf-8?B?OVY5S3BhNFFGakZkaklKQ3BQVjlJUis5WlFEWDhXNWhRS05qdUwwM3ZGd2xM?=
 =?utf-8?B?d1NEU2g1d1RZMEZuZy9YaFlwMmZpUVhLV1JUR2c4WHY1UTloVU1ZelhtbWJv?=
 =?utf-8?B?YmFDZVlzWktIVm5YSGpneENLbVRZTGRkZVNiakRMS0tKTWc1SVNjWW9Fa2Yz?=
 =?utf-8?B?TzViNDVFSWRaSEEyZjNMeE0xc043NWxUVi9FbkN2dlRtUkFKeCtzVVYzektM?=
 =?utf-8?B?YTdZdThwZ2pZUGVoTjdQeWxWL3dsL0tjODZQYlpuU3liNUUvSU5XQklGSkIv?=
 =?utf-8?B?VUMzZTlLblFTbW1Gd09JNExKdXpiWGEvM0QzMTBEQlNGaXJldjJiMDU0WDB6?=
 =?utf-8?B?TEUwblBjSm01d2xoNTZqZzRJbS94UnlPa3plN0wxV1hUckhFN0J3MEVzRThD?=
 =?utf-8?B?Tkh5TE5jWEJsNWhpVGVtdEtQT3JUTm41YzNMUzE5N3NvNk10T1ZEM0JvUGJW?=
 =?utf-8?B?SEUva2w1REZlaC9Pa1YyL2E0MWx5RDBDdXE1WHgrZ1YrMnQzRWs2SkdsNjFL?=
 =?utf-8?B?bGRORE9NS0NJN2h4SGhLVWNuNXJOamxIN3pyK0Nvb2QxbTBUQ3h4R1BWaGdz?=
 =?utf-8?B?RStuM0REVFF1S0dvTDExUFR4bDdjS1dVSjQ3ZzRqcGJ4UVREUy9mcm1yUWJl?=
 =?utf-8?B?MkdLL1Q2dlpoaDcwYmJWYWNCdFBNRC95YUpNNkY4Wi9Dc3lpQUZRQjk4a2Fo?=
 =?utf-8?B?S01tUDFqeGF1d1JKMTFLSk9HbkZkTlRjc2FUWUZmZG1mdVpPTE0vM0hva2dI?=
 =?utf-8?B?azJCYmJrU3dVLzFGZGlqaHZjTldPdnkzR1daaFNuSHpoVlZSekd3WmZJSmsz?=
 =?utf-8?B?MkZGNHhxdE9jQjArNFJpSy9sMEJIQ0xrb1hNUzR3K01hWkhPT1IwYjRvS1F3?=
 =?utf-8?B?RzN0cm1EMUwxMHozWHVsQ1FybjdHd24yNnhPZFltWGliNWxUWE43OHdqa2Nu?=
 =?utf-8?B?V1Nob0pXN1Jqc2RJZ3BIL0VHRnROTmZzVGFhVlJjTU45b0RUYkxrN05tTTk0?=
 =?utf-8?B?M1pkSXF0QU83Z2VyOWpmYTN6WGU3cTNkQW9aSm1nMk9kL1d4aXkvK1dVRlIw?=
 =?utf-8?B?UHZCY0ZjU1F0THc4UEJBbU9FK2g0MmhaL3UyWVhMcW4zeTA4Z1ZqZDdkbjA4?=
 =?utf-8?B?aUtCdmRZV3pCUnVHZDVpTTNSQVowS2J0R2tPdmd6L3VGV3ZOY0F6VExSa0pD?=
 =?utf-8?B?VWlFL2hNT1gyNkVTeWhkWFRYRXhpUG1UeXhtSUxYQWpIK0VUcHlXVjMxMFJo?=
 =?utf-8?B?emdqTnlUYmRvR0pIWXBJWmlvbGgwMy9WTGJwNnY5bmJKaDVUdHpBUU9FMnlV?=
 =?utf-8?B?cUcvZGxuRjZrVmVUU0VMTktXQ1Y2ZUM3NUluV1lwYnMzTFgvcUQxcjNFN3dV?=
 =?utf-8?Q?ivGx86I/pn7OT/Rk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DF0C6D2E05F9A43B41943B4C0A0EBD4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DVJNhdSv8XZ3vey7zVFVLOtK6+GC+LDdj9bcQ+OocM8tBre+DExAXW/BVkV+Sx7IF9DyXhrf9gfvLCipngQhG1Ijj7Vrn8Ps7nnfcPqFm84PieDmO2ILJZHI7pnx4lXFWHY37EEa0NqSf4TqGGBTVy+jx5aFY4fDb0NcfIateoyVeqKdm7Y8vNaf1LuDXyY8xGZft+JTiMfO1q/ogGYGR1d1FsBD/64Yg9hFU1FikFyorwxVdUHicFd9bvflKgLjW74/TAh/C1aWWzfx0NA2DAiVaqE7Hnp9cp+INnxnIwCYrlsaevcijFcHbsc7W9cN7i96qgjGLNx7qYlsJv3liw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7007.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c86b5-f168-46ef-10f1-08dea6894d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 07:22:57.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: za9MUzYfX8OM+8ZuV+ZyO4dWykFSl9Fh64nO0uqwqb3nkZ1PivLs261sKz4UsXbEhk1c7xy0MLXZVbWlOX8ut1LiJmv71mQzhwc63t/LrkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_002312_379023_7CEB9583 
X-CRM114-Status: GOOD (  15.67  )
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

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDA4OjI2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBNb24sIEFwciAyNywgMjAyNiBhdCAwMzowNDoyOFBNICswODAwLCBtdGsyMDg5
OCB3cm90ZToNCj4gPiAgcHJvcGVydGllczoNCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+ICAgICAg
b25lT2Y6DQo+ID4gQEAgLTQwLDYgKzU1LDggQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAg
IC0gbWVkaWF0ZWssbXQ4MTg2LXNtaS1jb21tb24NCj4gPiAgICAgICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTg4LXNtaS1jb21tb24tdmRvDQo+ID4gICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1z
bWktY29tbW9uLXZwcA0KPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODktc21pLWNvbW1v
bg0KPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODktc21pLXN1Yi1jb21tb24NCj4gPiAg
ICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXNtaS1jb21tb24NCj4gPiAgICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTk1LXNtaS1jb21tb24tdmRvDQo+ID4gICAgICAgICAgICAtIG1lZGlhdGVr
LG10ODE5NS1zbWktY29tbW9uLXZwcA0KPiA+IEBAIC0xMDgsMTkgKzEyNSwyMyBAQCBhbGxPZjoN
Cj4gPiAgICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICAgICAgICAgICAgY29udGFpbnM6DQo+ID4g
ICAgICAgICAgICAgIGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODkt
c21pLXN1Yi1jb21tb24NCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1zbWkt
c3ViLWNvbW1vbg0KPiA+ICAgICAgdGhlbjoNCj4gPiAgICAgICAgcmVxdWlyZWQ6DQo+ID4gICAg
ICAgICAgLSBtZWRpYXRlayxzbWkNCj4gPiAgICAgICAgcHJvcGVydGllczoNCj4gPiAgICAgICAg
ICBjbG9ja3M6DQo+ID4gLSAgICAgICAgICBtaW5JdGVtczogMw0KPiA+ICsgICAgICAgICAgbWlu
SXRlbXM6IDINCj4gDQo+IFNhbWUgcHJvYmxlbSBhcyB2MiBiZWZvcmUgcmVzZW5kLg0KPiANCj4g
UGxlYXNlIGV4cGxhaW4gbWUgaG93IG10ODE5NSByZXF1aXJlcyB0aHJlZSBjbG9ja3MuIFlvdSBj
YW4gcHJvdmUgaXQNCj4gYnkNCj4gdHJ5aW5nIGEgbWFsZm9ybWVkIERUUyAocGFzdCBoZXJlIHRo
ZSBzbmlwcGV0L2RpZmYpIGFuZCBwYXN0aW5nIGhlcmUNCj4gdGhlDQo+IHZhbGlkYXRpb24gZXJy
b3IuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQpUaGUgbXQ4MTk1
IHNtaS1zdWItY29tbSBoYXMgYSB0aHJlZS1jbG9jayBjb25maWd1cmF0aW9uLCBmb3IgZXhhbXBs
ZToNCnNtaV9zdWJfY29tbW9uX2NhbV83eDE6IHNtaUAxNjAwNTAwMCB7DQoJIGNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTk1LXNtaS1zdWItY29tbW9uIjsNCgkgcmVnID0gPDAgMHgxNjAwNTAw
MCAwIDB4MTAwMD47DQoJIGNsb2NrcyA9IDwmY2Ftc3lzIENMS19DQU1fTEFSQjE0PiwNCgkJCSAg
PCZjYW1zeXMgQ0xLX0NBTV9DQU0yTU0xX0dBTFM+LA0KCQkJICA8JnZwcHN5czAgQ0xLX1ZQUDBf
R0FMU19JTUdTWVNfQ0FNU1lTPjsNCgkgY2xvY2stbmFtZXMgPSAiYXBiIiwgInNtaSIsICJnYWxz
MCI7DQoJIG1lZGlhdGVrLHNtaSA9IDwmc21pX2NvbW1vbl92cHA+Ow0KCSBwb3dlci1kb21haW5z
ID0gPCZzcG0gTVQ4MTk1X1BPV0VSX0RPTUFJTl9DQU0+Ow0KfTsNCg0KYnV0IG10ODE4OSBzbWkt
c3ViLWNvbW0gb25seSByZXF1aXJlcyAyIGNsb2NrIGN5Y2xlcywNCnRoZXJlIGlzIG5vIGNhc2Ug
d2hlcmUgdGhyZWUgY2xvY2sgY3ljbGVzIGFyZSBuZWVkZWQsIGZvciBleGFtcGxlOg0Kc21pX2Nh
bV8zeDFfc3ViX2NvbW06IHNtaUAxYTAwYzAwMCB7DQoJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxODktc21pLXN1Yi1jb21tb24iOw0KCXJlZyA9IDwwIDB4MWEwMGMwMDAgMCAweDEwMDA+Ow0K
CWNsb2NrcyA9IDwmY2Ftc3lzX21haW5fY2xrIENMS19DQU1fTV9DQU0yTU1fR0FMUz4sDQoJCSA8
JmNhbXN5c19tYWluX2NsayBDTEtfQ0FNX01fQ0FNMk1NX0dBTFM+Ow0KCWNsb2NrLW5hbWVzID0g
ImFwYiIsICJzbWkiOw0KCXBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxODlfUE9XRVJfRE9NQUlO
X0NBTV9NQUlOPjsNCgltZWRpYXRlayxzbWkgPSA8JnNtaV9kaXNwX2NvbW1vbj47DQp9Ow0KDQpP
dXIgY3VycmVudCBhcHByb2FjaCBpcyByYXRoZXIgbGVuaWVudC4gDQoNCklmIHN0cmljdGVyIHJl
c3RyaWN0aW9ucyBhcmUgbmVlZGVkLCBpdCBzaG91bGQgYmUgcmV2aXNlZC4gDQpXZSB3YW50IHRv
IGNoYW5nZSBpdCB0byBhIGZvcm1hdCBzaW1pbGFyIHRvIHRoZSBmb2xsb3dpbmc6DQoNCmFsbE9m
Og0KICAjIEdlbmVyaWMgcnVsZTogb25seSBzdWItY29tbW9uIG5vZGVzIGNhbiBoYXZlIG1lZGlh
dGVrLHNtaQ0KICAtIGlmOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAgY29tcGF0aWJsZToN
CiAgICAgICAgICBjb250YWluczoNCiAgICAgICAgICAgIHBhdHRlcm46ICJebWVkaWF0ZWssbXRb
MC05XSstc21pLXN1Yi1jb21tb24kIg0KICAgIHRoZW46DQogICAgICByZXF1aXJlZDoNCiAgICAg
ICAgLSBtZWRpYXRlayxzbWkNCiAgICBlbHNlOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAg
bWVkaWF0ZWssc21pOiBmYWxzZQ0KDQogICMgR3JvdXAgQTogc3ViLWNvbW1vbiBTb0NzIHdpdGgg
ZXhhY3RseSAyIGNsb2Nrcw0KICAtIGlmOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAgY29t
cGF0aWJsZToNCiAgICAgICAgICBjb250YWluczoNCiAgICAgICAgICAgIGVudW06DQogICAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg5LXNtaS1zdWItY29tbW9uDQogICAgdGhlbjoNCiAgICAg
IHByb3BlcnRpZXM6DQogICAgICAgIGNsb2NrczoNCiAgICAgICAgICBtaW5JdGVtczogMg0KICAg
ICAgICAgIG1heEl0ZW1zOiAyDQogICAgICAgIGNsb2NrLW5hbWVzOg0KICAgICAgICAgIG1pbkl0
ZW1zOiAyDQogICAgICAgICAgbWF4SXRlbXM6IDINCiAgICAgICAgICBpdGVtczoNCiAgICAgICAg
ICAgIC0gY29uc3Q6IGFwYg0KICAgICAgICAgICAgLSBjb25zdDogc21pDQoNCiAgIyBHcm91cCBC
OiBzdWItY29tbW9uIFNvQ3Mgd2l0aCBleGFjdGx5IDMgY2xvY2tzDQogIC0gaWY6DQogICAgICBw
cm9wZXJ0aWVzOg0KICAgICAgICBjb21wYXRpYmxlOg0KICAgICAgICAgIGNvbnRhaW5zOg0KICAg
ICAgICAgICAgZW51bToNCiAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtc21pLXN1Yi1j
b21tb24NCiAgICB0aGVuOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAgY2xvY2tzOg0KICAg
ICAgICAgIG1pbkl0ZW1zOiAzDQogICAgICAgICAgbWF4SXRlbXM6IDMNCiAgICAgICAgY2xvY2st
bmFtZXM6DQogICAgICAgICAgbWluSXRlbXM6IDMNCiAgICAgICAgICBtYXhJdGVtczogMw0KICAg
ICAgICAgIGl0ZW1zOg0KICAgICAgICAgICAgLSBjb25zdDogYXBiDQogICAgICAgICAgICAtIGNv
bnN0OiBzbWkNCiAgICAgICAgICAgIC0gY29uc3Q6IGdhbHMwDQoJCQkNCklzIHRoaXMgd3JpdGlu
ZyBva2F5Pw0K

