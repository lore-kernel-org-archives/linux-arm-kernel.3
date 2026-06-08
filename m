Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED82CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/kQ1x7FhiSbiP/Ql0h3BeLaSN9EQd9wf6Q5nPQyq6g=; b=C9kLme3qaT3T+6ky3lC+/tohKE
	nENCUW9ibQTxLHjk5OlX6wONo0mV38ZsE1OQZKSFNAw7BK4Fy0lvIMQKZui6DlJQmiAPWsbbyw+Cg
	VMzIoQ9TcGyhMUh70VX8gISG2FxFG6V2/Ue6MtwqfVTJi2Gq6a83aknwxNLucQMOPpzYZPx0Q2SU6
	GNx02TGC57i96ANEV7qBgQV+0GBb4pyEMuVdJdbtFgQ+6g8ZGQkZMib3YuO0Z/UBN1scRuv2c40zf
	569onueiA1ymvgfhuNMvcixUnQgOrIvVoQAkohxhYjHUQVJtzKo9gHMgQVSOvn4nZ56ZMtluwXx9d
	FTvhqhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPNy-00000002hkU-1HEQ;
	Mon, 08 Jun 2026 02:06:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPNv-00000002hjf-0vyL;
	Mon, 08 Jun 2026 02:06:40 +0000
X-UUID: ac3591ee62de11f1afed4741b24580c9-20260607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=B/kQ1x7FhiSbiP/Ql0h3BeLaSN9EQd9wf6Q5nPQyq6g=;
	b=hPFTopJ4E5rWDKdyybrpm128kV2v1qxDxY9HXCWzr/v2diKJdqn+0jstTjE1Zy8dsPkKyyrnE0vFciBm5VbD0UGrFow755NfSD4OeTy/TRXVLka8zXwwnigJ06LPgTAXv75IidT/XdOWRbLeIlqeNUoLDm60GMY9vWksj6udMuk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:3e59619b-6e95-4c04-8913-175390cbadeb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:8614cca4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ac3591ee62de11f1afed4741b24580c9-20260607
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1107665911; Sun, 07 Jun 2026 19:06:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Jun 2026 10:06:31 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 8 Jun 2026 10:06:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u025jyFSkln1sS1/PAC79oe+0Z58zSzU4qgNBryBrVft4goHscRfTWqSeJfKSrPsOW0McpDJcwTo6oYomuOktiM8YATdIUsaf6ydfROP2BnpCtN+Y3qKzJb9+JXyp66Egq2G0WdTazll0z+wVPnjQQaGmIhhmNIlihutYsNpCYQ7X7bTJakVWJAa74yxq1oqN31lVBLp2xVMHrQsXvlTwjpYJ6gffvdrxKDBBIiGZ1moe4NUlMN2bFi2UyoDv5M73+MF5Z2iASVvPqihsApwoAJULE6gCmmszyd5pFJBT0QKcWSDOyGP6rOxZ8I09gh8I10sr9ZzJ+BIc/i9E99hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/kQ1x7FhiSbiP/Ql0h3BeLaSN9EQd9wf6Q5nPQyq6g=;
 b=PfUwhqoHGMLdzlguc1f5F4hO9PCOVnMpBtZwUraoKGYZOjFfBLmB1xTG1B9mNdqFuDAdijSMH+iVTgN/mbNK8MrbfrvFXQT05SnLqJHg3tEQJPSwEQJ9L59rBNdJ070YL7Ir3rCLSJqj4nzzEBvj8duA+4nmcXOb6cqKE0FgPa9JDIyuVaqX3aMteZddXec8tC6DjLO5a98XwrVwV05LSnFRVxmcsxBllCRYhKWMzuY3l853BDK7lnEL+lHz5LiVqUok4PFX99Wrso7r9q1gNqUT4HfPvjtkySl0TElkHZpSUnDKxLDVFBwKnFYxDtlFEuVMoCIl0ZhbcJip10cw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/kQ1x7FhiSbiP/Ql0h3BeLaSN9EQd9wf6Q5nPQyq6g=;
 b=Y1dI6ya8aF45Ieu+pGiE2P3kGoHWQCAny6zpKWpOUa3nRqJg20FAV00JY1VJaBnAMwz55oSzhdZgKKKsGURHo6Azlnkv5bSf2erM+WbYc7PdKNhNn+djfLCLVK+J/WLgmgw3c93Q/YY3G1ZWJ/RtJ8Q7NAca9fYiHWxiIv1h/VE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8480.apcprd03.prod.outlook.com (2603:1096:101:1fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.8; Mon, 8 Jun 2026
 02:06:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%4]) with mapi id 15.21.0113.006; Mon, 8 Jun 2026
 02:06:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sarang Chaudhari
	<Sarang.Chaudhari@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: =?utf-8?B?Wmhhb3l1YW4gQ2hlbiAo6ZmI5YWG6L+cKQ==?=
	<zhaoyuan.chen@mediatek.com>, =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?=
	<Teddy.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6 3/4] media: uapi: mediatek: Add MT8188 AIE control
 definitions
Thread-Topic: [PATCH v6 3/4] media: uapi: mediatek: Add MT8188 AIE control
 definitions
Thread-Index: AQHc9MWPrlea4DKYMkCbYvjzF4bLR7Yz7UcA
Date: Mon, 8 Jun 2026 02:06:27 +0000
Message-ID: <139308dda4cc6f29cc973d86af52e6153b88b2f1.camel@mediatek.com>
References: <20260605082956.2590511-1-sarang.chaudhari@mediatek.com>
In-Reply-To: <20260605082956.2590511-1-sarang.chaudhari@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8480:EE_
x-ms-office365-filtering-correlation-id: 5ae43fd1-b9d8-4db4-fd9b-08dec5028cbb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|11063799006|56012099006|3023799007|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: y+OkNdUhN00YKHhZIS32Mbod9bpuYoXo2c/LVWucPaCWU0S5/hb6Xwp8/P6/SkV6Hs9KKCmkq4Ovh+ONPbRWxcJwgWYmMLPKcNepesGDlVEiDxQW79oBkB3fTsAHE5SZWnbmeu/T0BIe52MdErJQp7Dzr9ihP7LzYe5TT3Z81Ts+BLDjGZThVrFY3t86MlDT0smdJYI2Vq6oR3p9a9NGXKYPVwttfeC49zka76/GpUzpdbIszfDcw3SApxVCkhvvmQX+k2n0g5m9QTkyNxpwE6viAUI9J8rSxcLejKQOH8jVCdqH3aF/3ZpgKB4fzxwV+BEOlVyEPCuJBCrJB9OYXdfAclcS1kAvRH/0u4wysAwF8km5LpsvnVmGm3RHU/18LNHIeB/3sVgoMj3f1QPKbeRpCHzKT4y5bG/kpL484s7ZCmFi0Me2xoGWkEP4gPHWhlwyaWggj6ULsIlWgPQP/7m+lsl2wdl3ZKbdP/ExRMiQrAH9fQ3F4/COQhOPWOiuo2THxyfJ42xd4E/kXJNBHNHqUA398zjZXl0T/D++8vbxpEWlI9yBeSb+iZwrm23n3SWnx4JBPqGU+GmmxktNaUsrBi7TB+bUsvZvyFhjuHEzU9WgWKI7eD3ye3wcFn3mCmEkP9w3pZbfSn7SQBGwCXvGZwqjXFLR5LjhmCCIufbpp3x1mVCd4jsKklrqOhTjywaaG3cWNXvv6jfemJ5HMjTmd2hlMAukR3b7ffhgZ+28C35byXtTECAmYxeIF2jM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(11063799006)(56012099006)(3023799007)(6133799003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzllZ21yWHVIb1ZUTnV4VFptTk8zUXJGRzYxcGhIVjlBVGIza0lrV0RJWE1t?=
 =?utf-8?B?cWNQZDlUMk0xd1ZreFVlV3VHbkpGZlFFMVpPaGQ3L09nY082U2MxNC8rdExa?=
 =?utf-8?B?bWdlY1cydlJYLzRreEN1cVRxeHNONE9adDdyVDd0b2Y3SXZFUUxmK2g1Vnpk?=
 =?utf-8?B?dFZYRnFHcTR0RUdMV1VGZEVsNzRNelpJR29STkF3OG1ERzh2d0hTb3VzYnF6?=
 =?utf-8?B?VHcxSVk1MlRXZWpjMXVLNDhMUWhBZENnQWIxYnZpNkNRUnpGVXlUWWwwNFFh?=
 =?utf-8?B?aHpGcHdxWnRMWkU0VWlBdTJLVlF0ZGR6dnl4bHJIRjBFTTRvMnZQODh2V1ZY?=
 =?utf-8?B?WEVQWDZRTWZHd2JsamhTckNyU2xucjF0ZTlRMDVvR1daOUJtT1IzMk05eC9B?=
 =?utf-8?B?bThjT0g4dTk5Q2syQ3QrUlAxQitKclJUd0FFSVRkZGtzbjV2b2ZCYnY0aDRB?=
 =?utf-8?B?VXdNQzNBck1OV3FJbmJlbXJ2Y2xuT1Q5cnFLdFNKQ3J0NTZmazZzbytsSjBt?=
 =?utf-8?B?T01BZEtFM2ErUWhxSFRsbFVTRTJVQm9EMU5COHEzNjlLcUcvQkZVVkN6Vkhh?=
 =?utf-8?B?MGFiTlhzcDI1VmhIVVU2L3o2L1BpOVpSU3gxYUZhcWdKZUx1L0Y3c3hud3hZ?=
 =?utf-8?B?MWNTOWNKYkF2WTFkWlhWNXNZSERxOTZOc281RytsL3IvVmNJKzZCSkx6Niti?=
 =?utf-8?B?T0tBMXF4SDByeS94bnpKc0FSVDBwV0h1cFlEV3JDaUJWUGg2N3JLblJBZmdq?=
 =?utf-8?B?VjJhKzFKYlNpbTlKOExSeXE4TFdEL1UwMTF3ODlDT2xXRW5RMmFTQUl5NExN?=
 =?utf-8?B?eU12M0VLclZ6YlJLcFJieVNoUU4rYXF5Y3ROWmhrYXBUNzhOb0laWVVPblhw?=
 =?utf-8?B?eUgwWUJmVWJ0VU9jbVZScm54cHplMlN5OHYxa2FRNnpuam1tSTR2R1JBUTVY?=
 =?utf-8?B?UXNzRUdMVXJHVjV6Tllvb3lEakppSVltajhPNFdiSWhyRUVkTXhHRnd5NWlq?=
 =?utf-8?B?WlE4bVk4NHlOM1RoQml5VVFCRFZMMVJ0SjRTMVFoQStDUUhzODZPdzNJUC9n?=
 =?utf-8?B?eFQvL05MalRxVDFuVXBtMFRvVUMzbXAreThPMjI4am9raGNQcmxuekFESkI1?=
 =?utf-8?B?cjVxTnVPVEFmWUt0VW9GOUVjK3QvTlRJTWF0SzBGbFU5QkV0TDRDV2cyZXlz?=
 =?utf-8?B?WUV5RUUrRUNBRm82WFhZVHhXQnpjbUpiT3k2ajFxVzZ1TEpHTi8xU2lnOE80?=
 =?utf-8?B?NWROU1BsV2hyS3NtSVlwUHZvbXZHSlgxZHpQTkI0TUhIU3V3ZjFTSmg3Y3JM?=
 =?utf-8?B?WEJybkdhQXRsWFZGQzQrc2RxWlBMT3I1aml1RU9NZTVER01sZndad01NcnVw?=
 =?utf-8?B?Y0tTNktveEdCbkVUeVRhUzQraWM5QS80QmlVKzJiYktjb1NKbXpSTnU0K2dn?=
 =?utf-8?B?QVZSUFNPL25XdlVuMjdsVjlGYXU5bEZrTmJxMituM1puU0daMCswN3dRWFBo?=
 =?utf-8?B?VnZaQXd2SUVicUdyelFFRDVmdjQ4WnEyRXZjekxiU1pUZFVpN3hTaEx3amFS?=
 =?utf-8?B?MVg2ejZRZWVEcSs2MkpzRFFNQTNRZFdXSHU5bmdrN25zd2lqTEg1NHlDU3VM?=
 =?utf-8?B?RlduZUhqeGlVbGZGYTJnMS9SSllRWGFwY0tINlNrYTdTdEF0bTYza2FLVXRt?=
 =?utf-8?B?QXYwTU1ZZ2ZsSy9CSHhGZGN4M2NTTW9Kc3ZHb1AxeXlEdzdWbUljZmc1emJk?=
 =?utf-8?B?b2p6QXRuQmZXN25IRTFTby9teDhqaTJHc1MyWHkwMGlzcGEwSjMwZmM2dElB?=
 =?utf-8?B?a2lJZlJLaWpYWTNZTEpWQ0VETFRMcFRXbkJCY2JnR1FWZDNCMFZidVNlZEZp?=
 =?utf-8?B?SnZaaEJPTW9aRm9GOWV5MWgwRVJHdzEyME1VbWhPL1RjNHROSS96aVNWVkRR?=
 =?utf-8?B?ZDExNzQwREh6R201cTdQdDZBREVCakJCVzZJbU5xbzVCRVBSMUZLempXNkpn?=
 =?utf-8?B?TVRReG5pTEY5OXZWRFFVeXN2ZGxSQWZ2M3NpbXpkSzFta1FlWk9Bam8wcTl1?=
 =?utf-8?B?OHZvVjh6N3l5TU4wTThidmNQRTl5Tkp1UmUvNzlNYXpFNXdXTVlSajNscC9H?=
 =?utf-8?B?cjFNUkJNRksycUIzNk5mYVpic1RHdWRJcHNueVJwMC9kc3dJVGh6bE1oRlZX?=
 =?utf-8?B?UG9DeUxJMHdCa2xrcnFKVk9GUGdycFR3aWJHNkhRVVVDRnpybzdhZnMyVk9i?=
 =?utf-8?B?N3crczVwRytqWTFIa1FCT1ZlcXlWckVUazVlYmN2L2tYeHl1V2ZMWm1ud0h6?=
 =?utf-8?B?MThvTHMxb3NPN3pxQWd2a3NGOUtVckdVNlA0aHdvNzVCWXljZ21sQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59287254CE2E3C47B00909D0065289C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E9QyrvmC+kIpGHnYVJmtqfwM37CYbXfOAr3XaYnjp2p/v6edOaykUlC92+hhBLzTyV19VOfnRrjzxgCHnwGIQLy9dBM4WuYPfwadzmbdyMnP45ARGaGNN4naV/4TbWoTNmp0VMUusTgzqx3uyX10MAKDM+1Q9LL2ZHST0G92LSyXO4zBcCysxZoqcbvoFCYkzeUVRQATVuDsPGjPxZEmJem/Xi+5pyupIzFK3qFAfSt8somwB9CZFkus6guvO3iTZPvlSO7L228eBU1A9ntmXHPXtb+1KUJIHFbm8vpZzseSpdABbUNzapRisjpg4Uq6vwWXBmZwkVpbGIRIQYHX8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae43fd1-b9d8-4db4-fd9b-08dec5028cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 02:06:27.4874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uKoTljRiORYyBHV2qGAcngezrR3K6FEF5S7r2ta1BLZbIkrw1tY4Njq63uHgmzqJbcPaCW3FuSK0SHn9zKT86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8480
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_190639_280342_469DD582 
X-CRM114-Status: GOOD (  20.60  )
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

T24gRnJpLCAyMDI2LTA2LTA1IGF0IDE2OjI5ICswODAwLCBTYXJhbmcgQ2hhdWRoYXJpIHdyb3Rl
Og0KPiBBZGQgQUlFIChBSSBFbmdpbmUpIFVBUEkgY29udHJvbCBkZWZpbml0aW9ucyBhbmQgcmVn
aXN0ZXIgdGhlDQo+IFY0TDJfTUVUQV9GTVRfTVRGRF9SRVNVTFQgbWV0YWRhdGEgZm9ybWF0IGZv
ciB0aGUgTWVkaWFUZWsgZmFjZQ0KPiBkZXRlY3Rpb24gaGFyZHdhcmUgYWNjZWxlcmF0b3IuDQo+
IA0KPiBUaGlzIHBhdGNoIGFkZHM6DQo+IC0gaW5jbHVkZS91YXBpL2xpbnV4L210a19haWVfdjRs
Ml9jb250cm9scy5oOiBDdXN0b20gVjRMMiBjb250cm9sIElEcw0KPiAgIGZvciBBSUUgaW5pdGlh
bGl6YXRpb24gYW5kIHBlci1mcmFtZSBwYXJhbWV0ZXJzLg0KPiAtIFY0TDJfTUVUQV9GTVRfTVRG
RF9SRVNVTFQgZm9ybWF0IGluIHZpZGVvZGV2Mi5oIGZvciBmYWNlIGRldGVjdGlvbg0KPiAgIHJl
c3VsdCBtZXRhZGF0YSBvdXRwdXQuDQo+IC0gRm9ybWF0IGRlc2NyaXB0aW9uIGluIHY0bDItaW9j
dGwuYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhcmFuZyBDaGF1ZGhhcmkgPHNhcmFuZy5jaGF1
ZGhhcmlAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2NjoNCj4gLSBTaW1wbGlm
eSBVQVBJIGhlYWRlciB0byBjb250YWluIG9ubHkgY29udHJvbCBJRCBkZWZpbml0aW9ucy4gRnVs
bA0KPiAgIHN0cnVjdHVyZXMga2VwdCBpbiBrZXJuZWwtaW50ZXJuYWwgaGVhZGVyIGZvciBub3cs
IHBlbmRpbmcgVUFQSQ0KPiAgIHN0cnVjdHVyZSByZWRlc2lnbiBwZXIgQ0sgSHUncyBmZWVkYmFj
ay4NCj4gLSBEcm9wIFY0TDJfQ1RSTF9UWVBFX0FJRV9JTklUIGFuZCBWNEwyX0NUUkxfVFlQRV9B
SUVfUEFSQU0gZnJvbQ0KPiAgIHY0bDJfY3RybF90eXBlIGVudW0gKHVzZSBWNEwyX0NUUkxfVFlQ
RV9VMzIgY29tcG91bmQgY29udHJvbCBpbnN0ZWFkKS4NCj4gLSBBZGRyZXNzIENLIEh1J3MgcmV2
aWV3IGZlZWRiYWNrOiByZW1vdmUgZnJlcV9sZXZlbCwgaW1wcm92ZQ0KPiAgIGZlYXR1cmVfdGhy
ZXNob2xkIGRvY3MsIGNsYXJpZnkgcHlyYW1pZCBtdWx0aS1zY2FsZSBkZXRlY3Rpb24sIGNsYXJp
ZnkNCj4gICBGTEQgbW9kZSB1c2VzIEZEIHJlc3VsdHMgdmlhIEJpbmFyeSBUcmVlIFRyYXZlcnNh
bC4NCj4gDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gQWRkIGFuIGludHJvZHVjdGlvbiBmb3IgZmVh
dHVyZV90aHJlc2hvbGQuDQo+IC0gUmVuYW1lIHY0bDJfYWllX3JvaSB0byBhaWVfcm9pX2Nvb3Jk
aW5hdGUuDQo+IC0gUmVuYW1lIHY0bDJfYWllX3BhZGRpbmcgdG8gYWllX3BhZGRpbmdfc2l6ZS4N
Cj4gLSBFeHBsYWluIGVuX3BhZGRpbmcgYW5kIHRoZSB0aHJlZSBtb2RlcyBvZiBmZF9tb2RlLg0K
PiAtIE1vdmUgc3RydWN0dXJlcyBmcm9tIG10a19haWUuaCB0byB0aGUgdWFwaSBkaXJlY3Rvcnku
DQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIERvY3VtZW50IHRoZSBkZXRhaWwgb2YgVjRMMl9N
RVRBX0ZNVF9NVEZEX1JFU1VMVC4NCj4gLSBBZGQgdGhlIGludHJvZHVjdGlvbiBvZiByZWxhdGVk
IHZhcmlhYmxlcy4NCj4gDQo+IENoYW5nZXMgaW4gdjM6IE5vbmUNCj4gDQo+IENoYW5nZXMgaW4g
djI6DQo+IC0gRml4IGNvZGluZyBzdHlsZS4NCj4gDQo+ICBkcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWlvY3RsLmMgICAgICAgfCAgMSArDQo+ICBpbmNsdWRlL3VhcGkvbGludXgvbXRrX2Fp
ZV92NGwyX2NvbnRyb2xzLmggfCAyMyArKysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRl
L3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgICAgICAgfCAgMSArDQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3Vh
cGkvbGludXgvbXRrX2FpZV92NGwyX2NvbnRyb2xzLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWlvY3RsLmMNCj4gaW5kZXggZTUwZTUxNy4uODc1NDA5OCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jDQo+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiBAQCAtMTEsNiArMTEsNyBAQCBzdGF0aWMgdm9p
ZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmZtdCkNCj4gIAljYXNlIFY0
TDJfTUVUQV9GTVRfR0VORVJJQ19DU0kyXzE2OglkZXNjciA9ICI4LWJpdCBHZW5lcmljIE1ldGEs
IDE2YiBDU0ktMiI7IGJyZWFrOw0KPiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9HRU5FUklDX0NTSTJf
MjA6CWRlc2NyID0gIjgtYml0IEdlbmVyaWMgTWV0YSwgMjBiIENTSS0yIjsgYnJlYWs7DQo+ICAJ
Y2FzZSBWNEwyX01FVEFfRk1UX0dFTkVSSUNfQ1NJMl8yNDoJZGVzY3IgPSAiOC1iaXQgR2VuZXJp
YyBNZXRhLCAyNGIgQ1NJLTIiOyBicmVhazsNCj4gKwljYXNlIFY0TDJfTUVUQV9GTVRfTVRGRF9S
RVNVTFQ6CWRlc2NyID0gIk1lZGlhdGVrIEZhY2UgRGV0ZWN0IFJlc3VsdCI7IGJyZWFrOw0KPiAg
DQo+ICAJZGVmYXVsdDoNCj4gIAkJLyogQ29tcHJlc3NlZCBmb3JtYXRzICovDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvbXRrX2FpZV92NGwyX2NvbnRyb2xzLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvbXRrX2FpZV92NGwyX2NvbnRyb2xzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMC4uYThiMjkyNw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMuaA0KPiBAQCAtMCwwICsxLDIz
IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5
c2NhbGwtbm90ZSAqLw0KPiArLyoNCj4gKyAqIE1lZGlhVGVrIEFJIEVuZ2luZSAoQUlFKSBWNEwy
IGNvbnRyb2wgZGVmaW5pdGlvbnMNCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAgTWVk
aWFUZWsgSW5jLg0KPiArICogQXV0aG9yOiBGaXNoIFd1IDxmaXNoLnd1QG1lZGlhdGVrLmNvbT4N
Cj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fVUFQSV9NVEtfQUlFX1Y0TDJfQ09OVFJPTFNfSF9f
DQo+ICsjZGVmaW5lIF9fVUFQSV9NVEtfQUlFX1Y0TDJfQ09OVFJPTFNfSF9fDQo+ICsNCj4gKyNp
bmNsdWRlIDxsaW51eC92aWRlb2RldjIuaD4NCj4gKw0KPiArLyoNCj4gKyAqIFRoZSBiYXNlIGZv
ciB0aGUgTWVkaWFUZWsgQUlFIGRyaXZlciBjb250cm9scy4NCj4gKyAqIFdlIHJlc2VydmUgMTYg
Y29udHJvbHMgZm9yIHRoaXMgZHJpdmVyLg0KPiArICovDQo+ICsjZGVmaW5lIFY0TDJfQ0lEX1VT
RVJfTVRLX0ZEX0JBU0UJKFY0TDJfQ0lEX1VTRVJfQkFTRSArIDB4MWZkMCkNCj4gKw0KPiArI2Rl
ZmluZSBWNEwyX0NJRF9NVEtfQUlFX0lOSVQJCShWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsg
MSkNCj4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0FJRV9QQVJBTQkJKFY0TDJfQ0lEX1VTRVJfTVRL
X0ZEX0JBU0UgKyAyKQ0KDQpBZGQgZGVmaW5pdGlvbiBvZiBwYXJhbWV0ZXIgb2YgVjRMMl9DSURf
TVRLX0FJRV9JTklUIGFuZCBWNEwyX0NJRF9NVEtfQUlFX1BBUkFNLA0Kc28gdXNlciBzcGFjZSB3
b3VsZCBrbm93IGhvdyB0byBjb250cm9sIHRoaXMgZHJpdmVyLg0KSWYgdGhpcyBwYXRjaCBpcyBu
b3QgcmVhZHkgdG8gYXBwbHkuIEFkZCAnUkZDJyBwcmVmaXggaW4gdGl0bGUuDQoNCj4gKw0KPiAr
I2VuZGlmIC8qIF9fVUFQSV9NVEtfQUlFX1Y0TDJfQ09OVFJPTFNfSF9fICovDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmgNCj4gaW5kZXggNzY2ODIwMS4uNmQ2ODY2ZCAxMDA2NDQNCj4gLS0tIGEvaW5j
bHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92
aWRlb2RldjIuaA0KPiBAQCAtMTAsNiArMTAsNyBAQCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IHsN
Cj4gICNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9HRU5FUklDX0NTSTJfMTYJdjRsMl9mb3VyY2MoJ00n
LCAnQycsICcxJywgJ0cnKSAvKiAxNi1iaXQgQ1NJLTIgcGFja2VkIDgtYml0IG1ldGFkYXRhICov
DQo+ICAjZGVmaW5lIFY0TDJfTUVUQV9GTVRfR0VORVJJQ19DU0kyXzIwCXY0bDJfZm91cmNjKCdN
JywgJ0MnLCAnMScsICdLJykgLyogMjAtYml0IENTSS0yIHBhY2tlZCA4LWJpdCBtZXRhZGF0YSAq
Lw0KPiAgI2RlZmluZSBWNEwyX01FVEFfRk1UX0dFTkVSSUNfQ1NJMl8yNAl2NGwyX2ZvdXJjYygn
TScsICdDJywgJzEnLCAnTycpIC8qIDI0LWJpdCBDU0ktMiBwYWNrZWQgOC1iaXQgbWV0YWRhdGEg
Ki8NCj4gKyNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9NVEZEX1JFU1VMVAl2NGwyX2ZvdXJjYygnTScs
ICdUJywgJ2YnLCAnZCcpIC8qIE1lZGlhdGVrIGZhY2UgZGV0ZWN0aW9uIHJlc3VsdCAqLw0KDQpB
ZGQgZG9jdW1lbnQgdG8gZGVzY3JpYmUgdGhlIGRldGFpbCBvZiBWNEwyX01FVEFfRk1UX01URkRf
UkVTVUxULiBbMV0gaXMgdGhlIGV4YW1wbGUgZG9jdW1lbnQgZm9yIFY0TDJfTUVUQV9GTVRfUlBJ
X0ZFX0NGRy4NClRoZXJlIGFyZSBtYW55IGRvY3VtZW50IGluIERvY3VtZW50YXRpb24vdXNlcnNw
YWNlLWFwaS9tZWRpYS92NGwvIGZvciB5b3VyIHJlZmVyZW5jZS4NCiANClsxXSBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWEvcGF0Y2gvMjAyNDEwMDMtcnAx
LWNmZS12Ni0xLWQ2NzYyZWRkOThhOEBpZGVhc29uYm9hcmQuY29tLw0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiAgI2VuZGlmDQo+ICANCj4gIC8qIHByaXYgZmllbGQgdmFsdWUgdG8gaW5kaWNhdGVzIHRo
YXQgc3Vic2VxdWVudCBmaWVsZHMgYXJlIHZhbGlkLiAqLw0KDQo=

