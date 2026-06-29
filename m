Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC794C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=; b=q6QP7lts7xQUsr2p09CS7qbiUK
	tqUoh+OYdgDkUP28KmJGf1E5L6v9w00cvGuKSqMrETnTBIBZVVyzLoOZXJkdup3cLN9l0OvcwBuOd
	XfTJO+mJPu+y+d6P1R2hxVg3bUHViPsiVvd87l2qf2bTPnsio9BFZw9U1+76IKEmoqjkmxKfolFTg
	JRDLd772Vg/kcEtHRfRK76qU7I+vh5xcMyWLC16/k546abD0AQ1OlyNqiwGJR9Y4GUDvY+JDsfNx5
	f4ZsDWZk2ySFvMTuj/JcsDzFLmRLHL7dMWT820WC8Fs04quqgJ178ra4nQ/DMl10j5gC/qDwJwWdM
	tAcF0V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6J8-0000000DsYx-4BfS;
	Mon, 29 Jun 2026 07:21:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6J7-0000000DsXt-12k7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:21:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0pcd6oYW3KhmutHM7cMCsXh6SJhDgFfjBNyFMPrfhhA+RyuXSXueS+Vedg5WKonbniT7NWZbJ0IIHFiUVgUpw7ky4KHXwybK45dO/kOKel658Y9qfdHTHIgw0GImKMLup/WenQFZh7+8RbSKoi87QHEQJ6gYamr71SZOhRgAbdcimFQB9lIzSttMkYz45DzoabMBYsCiea/FobJsIjYTguJTjclLCJiayHwnN4694vJs/2qyBmzcEA90Jt1Kzxq4jI6sZvQGRShgE9msmjJcgvUDJqWMSDKXyYHTK0L0lSfKKfMzFxHnYlRmGVqB3UKuJVezr1ZvbOnnJMtdZ7+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=;
 b=QQO/gevEZZUdR3xmeFi/DBNR/Xh0cIFdz0kG4wLWcrUWfRs/W6qK/uin8kLwouAwY6QgXgA7IAlewFV/vCpJlNUjegrY6On06cGw+u1SsR+GzQhkdxN8tb1H7Yh+wlT7xJ7kMzKIKeTeM/7vT8+fiDAO2mzSILiEBmH5EIbzaVCXcI5L1oX6KFDlc7c/XnhzkSRJmTeJmu3QospUO94B/hEhKXWrAQanVK4fc5xns8ad883K4ZbHsfsUgBma2sVUs/590x5deiAj9eA1a6E6CZM8RlIkEcG46cde5IB26PgXX1icKTBd9V3+/dlYSBKoa6/sV8MRhk9eZ+q3rnAH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=;
 b=r0YrWYfxtGd2+vMBua5X6oNzDMIi2yVvzxCOJu2ZEuZ+B1iW1CcwhhpEfhXt37uEJwo6M5vfblTAaLnqQPOfiZNYiTPk7Sj5ZSaqKvCs+aFuglEUPrCtQxYa2RhQ0kTxx6htFPCfWJhHB166oB71xGZpgaQjh03q8J8tIwmnHWVDcWihbTHzLjxt4Ap2Fd/bT3+Q94uQrhPhrDiuWp7e/iH12HotXlI/h14ubkmZSLWMtWlRXc1fko4lZ7KQFKj5QKrfhmDOSiG3yWTPiKbX/oiJ7q7gEFArS0mDmwDFhzGmo8G3i3LP1Xl3fTPBj46HgxO8rUU+0HDP5RePpolEfQ==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:21:14 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:21:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Thread-Topic: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Thread-Index: AQHdBXlaaIjSStSllkesDxC57IFG0rZVJJEw
Date: Mon, 29 Jun 2026 07:21:12 +0000
Message-ID: <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
In-Reply-To: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GVXPR04MB10969:EE_
x-ms-office365-filtering-correlation-id: f7872b3d-c86f-4b1d-b300-08ded5aeffe0
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info: wT66/P/GgOy02zVg/aQHKEqB0i8XOn/EKq7pV6zkNlIBdn1IZ4OElwBTaE3NllLP6bTKRbkXPU5hbttRn5XU7MLR0uceghdR1ddDGajc0DIEQqcPhQSnOkNVI5y7+WYVZwzjpkjaXnAjNjVkiM16QdjuByOavzqH3Bpmd7QtikXeOEu6GLmiVaJDKpVLDJhccMCw9RQ9YSs9kmmM0okgStcPkJrPKa0L42qSZ6x3Y/TQm6hwfSpPqjDQcFiSVJJl8Lssg3hLiXiLj0QSjy4PNGBO+XRb0u3vm3wgkUCHfjQ9CCHx7hecJ6qx+0X7tQPL3ZNc6AEFpYYLlEH3ZE2tiKqya+CKedCjxAzVncIppt1FIdjb1mgWQ+5UxGSz9NI549UA2rDlyVX8oiIxL9cEmCNgSU6M2ypSOxDlUn1uJ/PIT5v3d7/jU1ZRlIdMeBWvEaYDisVTz9bhbBtBRtJfpLmCTlTUwIq4MLtsKFDjT2TfMwB8e/BQQ01eknP+UBDkQbpsu6ZmoHUovrKDYisQn21RhGDP06rmWCF7iHbom4zGFNvwMRPNjaMbqD7T/wf277xxrpnaFtbMNnCMDtCm/kpcC4cbnsoAmcAALvqJ51PX0Wh5Jjfr6MYzCvh5wl7yqQ08hkR7gyR5ZYqJFZn2eAQkz2eHYsH22uzN1N2FfrW5Mw4fxXSMWs26n5IbH7lOR4tCcIaA9LljOHrvVyFEQ50e/QCJVnf2TZtp3uyr52A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1JNeGptbHVlUnk3UEZsemk5MURQV0VlanFvU3k1RWF3SXF3U3FJVkl3QXMx?=
 =?utf-8?B?SVQrYk9MTDNDYmhqWGc3WE16bkxhUVU3bHNSaldBdnMxVVlFYW9jamFhNE9n?=
 =?utf-8?B?NGYyc2VCWE9Qck0rclkrTE1mdjR1ZHJUZVdPVWRKc0hJdjFyUlFyZGIvanFi?=
 =?utf-8?B?d1M2TGZyZnlLRFBhem5JQlFtOXdSSnB1VFpnbzdQbWJnVTRCMEEvQUJ4ZDN5?=
 =?utf-8?B?V1pSSEtCVTFxVmwzVHpmdHlIQ0tXYmtROGUxeW53amdWRXduNTQ5dUdXNHlt?=
 =?utf-8?B?UVAxdzhiSkNSV2VIcXcyZ21KY1dwS29LY0dWZEpjVnVyTlFoRU9OVUhxd2g1?=
 =?utf-8?B?MGpFL0d2RUVITzRqQS9idDB6ZHdWSEdNZjB4V0N5cGo0dFRNK1QrMmxjRGlH?=
 =?utf-8?B?MVNVK1AydDBCK1czcXFoYXRCYm1Kb1VwWlFmaUZKS2dVMUxqazJzNzFPNGlJ?=
 =?utf-8?B?RWNsZEN0dzkySVljNGowUGRPR1FqNFRiVEdGb2dDNi8wMGNpSmU1Wm1vaFRK?=
 =?utf-8?B?d2dpTmQ3MHVjNUlSQ2NnenRoeG43TjQ0S1MwaEJHYytWSFpDSnFMb1ZhbXcr?=
 =?utf-8?B?d1o2b0swVXFtVUpUTEJDTVpvMGFPZGt4eGk5ZWdOMFdMVUZjckN1RHgxZ3Vl?=
 =?utf-8?B?NURBdmpLYTEyN250UWFoVzdtRE4wWi9tT0k1RjJ3UHl2dmMwa0o3NW1ieDRB?=
 =?utf-8?B?SkUyczRrajg1Z0J4SWx5N3daTXNFelVrb0ZqVFdCV2VBL2tSQXNPMUoraWth?=
 =?utf-8?B?STRydFR3OWZyOU43NnFwSWV0alV1cE5nWS9FaWFnU0FsMU9ZMnpiM1JFbngy?=
 =?utf-8?B?YlRoL0thR09CV2hNNm96VzNqSGxkTkVPUUtWczM3VHU1OUZLclBKNU1sQk1Q?=
 =?utf-8?B?NFdJMVBQa3g0ZTRUdmhiVzArTUNDTnFLSDkwOFR6blF0V2Z5QXhwRTBTbCtx?=
 =?utf-8?B?NU1aZW1vTTNVUzBMcVNmMDBYRllKc1l0QktJSUhxS0NhbjZHdnlxbXpnR1dN?=
 =?utf-8?B?MU4wY1lLeUpFYk9jSEdiWUJoRFcrbXJyMDVwRHJHWTU3QUZ2emVKMm1NcXg3?=
 =?utf-8?B?T3VBZ0tGMUZOa24zbVIybUd5Mml1anJ1a3EwOXlsRHlpeUdhZWxla0lyejhW?=
 =?utf-8?B?UVM1c2d4SG1ZVThZajNlUWtJSzZVN3daK1ZYZ2RLbmpvRE5tbzhubVNaU2tJ?=
 =?utf-8?B?NHF4eTJ3ZkFiRXRJQ0xIcW0yZVpCaFprMFQwR2d0R3hja2Q4YWY3L1ljR1ZH?=
 =?utf-8?B?RVNrejRuTUVKSXV0SDFwcHZrcFJNVmhLM2VDNzJBSUE1VWp2Mnd2YzUrK25B?=
 =?utf-8?B?K2ZqWGw3L0RCWW1IdG0vY0RwNDh3dmdteXFZeXVyQi9NaHJBeFVaZHNvNE56?=
 =?utf-8?B?VVFLb0VlQ291Vit5bWVlTW4wcHUwaDB2dTdodk5aSXQ5Z21qT2RzWWxhUDVZ?=
 =?utf-8?B?ak5rSzYwVDhjUHNhaytSSWoxaXhNZzhqRG92d2FSQ3U1U2dGQ0ZGYnJuUDhM?=
 =?utf-8?B?V0xmeDJHb0VkamJoMmQrL2c5MkkyeFVwZUNHWmZZblRVeS8rRkxrbjBOZmhj?=
 =?utf-8?B?RUFSbVhXdzhvRVlHN25IODZFclh4WGRLY2NnUm56Y2plQ0VhUnBsTWM1eXVF?=
 =?utf-8?B?UVFOZDRYeTNzVTNGS3J1cTVRSUVUMmhhYlMreDMvQWw0Q2VybUNuRmY0eGdX?=
 =?utf-8?B?a3p3S1FIOTFWRG5pbERoU3FpTDllVUhOcGhZYUdmQVFCTFd4UUUxaDBRTWMz?=
 =?utf-8?B?Z3pNNVgweElnc2NwQ1pFdEJMZEtROXNvNW5CY0Vka2NnWkV0dEtidnFOVXMz?=
 =?utf-8?B?Q0o2ZldlbTVmbWNqNVpYT0k0UjVkejMvTXowTStjR2hndGRUMHE0eFZPcXZC?=
 =?utf-8?B?V05rcFFvRlkxc041dXZ2RDZMTFNQeWkzNmZvRCtidlVCU0hBSU9GTnA1Rjl6?=
 =?utf-8?B?Ukl3OFBHNlUrV3VISVpGMVNacXpRMzNnQUpudnAwZHFvRVNVcTdIOHEyMk51?=
 =?utf-8?B?UjA5aDgvNjQxNGUrZmF3YXI3OHBJWXUwUXp5UU1oWUc5c0NTVVhsRHFWNk5x?=
 =?utf-8?B?WUc4R2RxdWR2QjhxdDh5UVJ3clV4dFFSS25YZS82WGZud0tpYUdLODcrNFQ4?=
 =?utf-8?B?UVdvNStSeVlOZ1ljUEp3SmVvVHFDeEphVWNzS1lXRk96VjYyUW9MSUV1UHhn?=
 =?utf-8?B?QnhwaW1sKzgyZGtTU0pLM210WGJSdWNwRzVjcXhCZFlYRHB3Z3dwbUFTRjVi?=
 =?utf-8?B?T293YWtQOEFlSDZmYnBOZlZhWklObzhBN1ZwRnJaNEZjZXdOODQrWEViNlpk?=
 =?utf-8?Q?z0JWMoSspetTZP9p38?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7872b3d-c86f-4b1d-b300-08ded5aeffe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 07:21:12.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYNxqLFztUpY0pqkGpjNc+HcYNRI3ETIVF7ZcDH9VFmnrbTWH73Kgljz6Uw69n2YnQ8zOACFPZ8RM1yNwqtZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002129_292071_F28C1600 
X-CRM114-Status: GOOD (  17.37  )
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

PiBTdWJqZWN0OiBbUEFUQ0hdIHNvYzogaW14OG06IGZpeCBjbG9jayByZWZlcmVuY2UgbGVhayBp
bg0KPiBpbXg4bV9zb2NfcHJlcGFyZSgpDQo+IA0KPiBXaGVuIGNsa19wcmVwYXJlX2VuYWJsZSgp
IGZhaWxzLCB0aGUgZXJyb3IgcGF0aCBkb2VzIG5vdCByZWxlYXNlIHRoZQ0KPiBjbG9jayByZWZl
cmVuY2Ugb2J0YWluZWQgYnkgb2ZfY2xrX2dldF9ieV9uYW1lKCkuIEFkZCBjbGtfcHV0KCkgdG8N
Cj4gdGhlIGVycm9yIHBhdGggYmVmb3JlIGlvdW5tYXAoKS4NCj4gDQo+IEZpeGVzOiAzOTBjMDEw
NzNmNWQgKCJzb2M6IGlteDhtOiBDbGVhbnVwIHdpdGggYWRkaW5nDQo+IGlteDhtX3NvY19bdW5d
cHJlcGFyZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMgfCA0ICsrKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMgYi9kcml2ZXJzL3NvYy9pbXgvc29jLQ0K
PiBpbXg4bS5jIGluZGV4IGZjMDgwZTU2ZjUwZC4uZGUxOTk3MjQzNWY5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvaW14L3Nv
Yy1pbXg4bS5jDQo+IEBAIC0xNTAsMTAgKzE1MCwxMiBAQCBzdGF0aWMgaW50IGlteDhtX3NvY19w
cmVwYXJlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIGNvbnN0IGNoYXIgKm9jb3Rw
X2NvbQ0KPiANCj4gIAlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHJ2ZGF0YS0+Y2xrKTsNCj4g
IAlpZiAocmV0KQ0KPiAtCQlnb3RvIGVycl9jbGs7DQo+ICsJCWdvdG8gcHV0X2NsazsNCj4gDQo+
ICAJcmV0dXJuIDA7DQo+IA0KPiArcHV0X2NsazoNCj4gKwljbGtfcHV0KGRydmRhdGEtPmNsayk7
DQo+ICBlcnJfY2xrOg0KDQpJdCBzaG91bGQgYmUgc2FmZSB0byBkaXJlY3RseSBwdXQgImNsa19w
dXQiIGhlcmUsIG5vDQpuZWVkIGV4dHJhIGxhYmVsLg0KDQpSZWdhcmRzDQpQZW5nLg0KDQo+ICAJ
aW91bm1hcChkcnZkYXRhLT5vY290cF9iYXNlKTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiANCj4gLS0t
DQo+IGJhc2UtY29tbWl0OiAzMGZmYThkZTU0ZTVjYzgwZDkzZmQyMTFjYTEzNGQxNzY0YTcwMTFm
DQo+IGNoYW5nZS1pZDogMjAyNjA2MjYtc29jLWlteDhtLTkzOGU4OTEwNDA0NA0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiAtLQ0KPiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQoNCg==

