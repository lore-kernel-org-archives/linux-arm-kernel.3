Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78D6D0BB4C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lht6WVhdY3ugHFntE3PnPkVDFNabb5F4OpTK7mghEIs=; b=wBbDWHbI4Kz+UUa+DPkHo5qJCj
	8++usH8sCSCPQtPNcj7LEqQdRIo35YPSn3awjR6icBZDRmn9wzckmKT1EB+6upIkbYJkGuLwpqeQw
	aB/39ybaU62kjr9n1mMrhH/8Sj5IzloVU/dLItO1yP79H6VwDkmuDjd1+Nd/6MTzG+PKa6WmWOGTj
	v44QS8p41zatF99WU76bgVbBNMGnJv9FXw6RvenESi5UHEBnkFJC4An35lufCDPGF8gWArWUuvGjU
	028stAHFqQ/FG32o5qde5afvKZbL3fhzF0BGDYiTMPRNvVThV85ZebHw0TnPJ61KxwJ/P/18X310c
	EKUwXY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mi1-0000000GQWe-0D4b;
	Thu, 24 Oct 2024 01:32:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mew-0000000GPtl-1MXq;
	Thu, 24 Oct 2024 01:29:07 +0000
X-UUID: 5a5a2bdc91a711ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Lht6WVhdY3ugHFntE3PnPkVDFNabb5F4OpTK7mghEIs=;
	b=m2NFoyNYQPaM5w5LexEqX1fehJDids2mT4mfIvipy47LvXphWqysdji+umgOheXayFm/tDyIhDfRqvA6/+2NgSof14eAz7MVrEFqNkBDgCoxrBxUIDL1er8dErIXSAYwU73g42H4x6JcuV3n5vvyNraOJL+w8xaPgddF7sBJ2cM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:ef80f9a7-7b8a-44b1-8c82-9c8d39926212,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:5824bd41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5a5a2bdc91a711ef9048ed6ed365623b-20241023
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1402444871; Wed, 23 Oct 2024 18:29:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 18:29:00 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 09:29:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boUdLKaUJjhkzvkHsko2jqq6Z6PlC/hTQeuiosfVHfcpvkCkXEJBZUpNdUaQlYCpbZvVUqVT+y4OWrqGI3brE855HvQJdFe9O9pVNDufiXRaNfoFQYOr27q+ie5c9WByU0mRvuyQz3iB1yDOVxjMn4eHWeqxEJsYhAvk7hcwik9ivPOFzVuWmLG15KqvBEMPjC7+bpWXMWQd2tUu/qJkHxsIA1r8K1AQIP5akRZi0eLMvcy3UYEguTZ8iQGu/F+mBjn5p7apj7lWleePGuoGtsa+myYS7WQTiFFvbCK7Z/pIIGc928E7Y5VMcdQl4JoMCimjAUJV2HOOaLy9eAHNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lht6WVhdY3ugHFntE3PnPkVDFNabb5F4OpTK7mghEIs=;
 b=YF12FcZcOyCtP57030f9T+vH2YRUXoxr8j8pIbG3g7E4LtRIkoo+VqgzVcpPKebYSF/OS8auWY8UfOT36vkCdvpNcQfWOi2CsafzgCGvGyRNJxLlLKhhkFEinU6/zSgbp+8I2wyv6zBxdi/jIMLf+PM6OQKXi7lQOiMnE+46hmx/Vvff8QQffodNffuCOI1YmuKb/+DGl+HteHk+FiW+6U4vxpeaz3Glj8Jp7cTdsQG7p2z3lzVunvyx2EiuiioYbEKyDa8FkcLLCTloNDUxhiT6PoffGQMtJaFbHQu/H9b2H6yF809h5nxkAyFwdZKPlS+eHcjOX2rAf06NmILN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lht6WVhdY3ugHFntE3PnPkVDFNabb5F4OpTK7mghEIs=;
 b=PADVPlPudHKQL/det3T6ZMu0Hn6lsJekZbqNm1b1FcWZvHJQDjqtVHXESxAPXMM2afUf/jx3zwOWk/ScX4jWST3/CGoXE2gIm00ZQBDZKystmCqaKbjdHYaqA0zwob/y3dGtObJawaFWxHfr7GlC50Wfk6KUrPtnb5wrC9gFHUM=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by JH0PR03MB7655.apcprd03.prod.outlook.com (2603:1096:990:d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 01:28:56 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%3]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 01:28:56 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] dt-bindings: memory: mediatek: Add smi-sub-common
 property for reset
Thread-Topic: [PATCH 2/4] dt-bindings: memory: mediatek: Add smi-sub-common
 property for reset
Thread-Index: AQHa86RRlzYUg5Gi9UG44pqPb7iOI7IxaJMAgGQYZgA=
Date: Thu, 24 Oct 2024 01:28:56 +0000
Message-ID: <7ca196cf1c1f57426fc6b733d01d38f073da7d94.camel@mediatek.com>
References: <20240821082845.11792-1-friday.yang@mediatek.com>
	 <20240821082845.11792-3-friday.yang@mediatek.com>
	 <3b31bf46-c5c0-41c9-bb4d-3ba9f64a5d1c@kernel.org>
In-Reply-To: <3b31bf46-c5c0-41c9-bb4d-3ba9f64a5d1c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|JH0PR03MB7655:EE_
x-ms-office365-filtering-correlation-id: 414e22ad-b78b-474b-56d0-08dcf3cb3aa6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OENBSThhZzh6VWllV0FJRnFrNUdrV1BNNkx5VEFFanpaNlZ6TWpLcTBxZVJD?=
 =?utf-8?B?T2NTQ0JvbTcrWjVmc0xnRERjMHpBV2ZScms1VG0zVW5XZk8vNWdxaHdYcEt2?=
 =?utf-8?B?QXVsZkRFTytoTURTejFtcXdVeVJPclRNUzZNUGZTSlQ4Rmp5YlUvaXRtYldy?=
 =?utf-8?B?L1BicXllZzBhV1ZPclplemtKWFAyQThnZDR3RGZnZ0EwY3hnL01uU1h3b2Jq?=
 =?utf-8?B?bnMrUTh6dzhIUjQ1ekF2Q1oycEhHZFVabDZMUXdtdmdEMXd6MkwvaHZrNXB0?=
 =?utf-8?B?T0hZVythWERwWFFMVHFRQUtLaTNjSWhYeGlBellKTThZaUt6SWJVYmwzVFBz?=
 =?utf-8?B?cjhESTF1Y1VPbDd0RmZnUXkxRlhJWjFjekdUNnE5REhuMjJ5dnR0R2hEay9W?=
 =?utf-8?B?cXZPNE9JWXFwZHFPTjlva01zS1ZtRzN0NTIwWkVqVnZCRXptV1JtNk9BNkFa?=
 =?utf-8?B?TWFSUHhqdFU5cEZ4eDZQZkl6akRzZW1nMDJ1eW8yRWZrbWlmOWJKaGVZd0ly?=
 =?utf-8?B?dnBmam5tVU5BMFQvelpmUnE3MTRZSkQ5MDZ3ckd3cW81TzM0SHBqRnU0eFZw?=
 =?utf-8?B?N2NpaFJIelJTakNaSFNXc295d3AzVEZLb2ZkVWtWSytVQjVWZjhRRnVUcjhM?=
 =?utf-8?B?Mys4UVBycVFydVVWTXZJdnZNMEV4d0JOWWlXOHo5RmtRSHdZODZEb0gxK2g0?=
 =?utf-8?B?SU5pUUtxSlJCY2dTdnJYS2dNRy92d09NQXBNb1FGTW9QU2hWTVdYOE9uRXBh?=
 =?utf-8?B?WlZab1EyRGxIc2tmbmpKTVpnNGlqWExQakdFSUhTMWxFSVNIYjNiT05YZFFC?=
 =?utf-8?B?ZjhsQVp4ejkyQ3VRVVFjUFNzS3hqWHZnRnF1SmtFdkx4cUs1WHZTUzMvaVdT?=
 =?utf-8?B?ejlqRWVzbjVHZzF1dGU2a2RTcHpsekVRVXM3QzZkTTFteXBjcFFNaVMwV1Zj?=
 =?utf-8?B?aGttenpxQVpENWtZNzc1cm5ZYnNZN3EydXovd25sdkNaNE5FcjNyeDVYa2cw?=
 =?utf-8?B?Mnkxb3ViaEhFWWh1eUVFT2E4V3hHelhER09rNlVhRWhXL3F6UVVYS0lselN1?=
 =?utf-8?B?bk8yd0N6RWFodnJVVnlWUXRKcEVQdlBTUUM4c0xTdjM2UDY1OVhtS2lrdmla?=
 =?utf-8?B?clR2ZjFmTExtdE1ndDJBQm50MHJwdDM1M2RsY242OEF5bk95QWk4cHQ1eTlF?=
 =?utf-8?B?bEh1TUVFcmpCY2hzRzBYWlhSWmNsdTZPRVZwUktMRHJMU3ljRnNqbVluNFpz?=
 =?utf-8?B?L2pXQmJnQ2sraUpJMnRadlNmakZTazk5TkV0KzNEVkx1RUwwTkJiaTRRSzBk?=
 =?utf-8?B?NVpPZFc1aC9tejBvY1o5S1NHZ0YvZngyU0QyL0RQbzViVzNoamFoZFhRMzRW?=
 =?utf-8?B?UzliVVcrNFpIeTRCTFh4RlNUck1VZGVGVnZXY0hxN0t5OWZLVHpXY0N4em5T?=
 =?utf-8?B?WklJL3crMkoyYW9PVThubXdkMEpPOWgvTmV2NExaWkdINHRqNG41SGdLeTBH?=
 =?utf-8?B?SUdYaWd4TUMzdGRwS0Z2ckRYUURJUFhVakV3cTM5K084bmVVbWZvT1EvQmxZ?=
 =?utf-8?B?Y0ZSVk5YNG5iVE53am83VnpQc0REdHdGczFVOXlQVHpDay92L294am1xK2Jk?=
 =?utf-8?B?Q1J1T3FIT29NaGh2Qm9wTytKZ2wwYVM0MURrZHhHTHk4QjZWY0d6M0ljdTVw?=
 =?utf-8?B?aTVYc2VCZDRMNWJCS0pJcll5a3p1ellCcXQ2RzhxVzB3SHNQc0NZNHhwWXdE?=
 =?utf-8?B?NkRWbVo4b29EODVIRExJMk9qU0ZWblQzQm5NWGRmWXRQMkc5SUZtUFE5MU1w?=
 =?utf-8?Q?YRAtR9GObtOTT3bVIaxBxAMNEhUEBB1monRy8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U25xb2d6VW9ZU3kyRmlJL2pCQWkwN053OEx4U3RXbHVJbEhKOTB1cEhXekl6?=
 =?utf-8?B?RWxnYmhrRWwxeC9UUHZVcXBzVTQ2eEdOTE1sbVprV3EvRzg5NTFUTHRwYWZr?=
 =?utf-8?B?anJla2svUTZiL1dxUXprZ2FwZTNDbUFGZlVsb3IyWjUxVmtBSXJ5ZURKMDFW?=
 =?utf-8?B?L1hZWkdySmVMWHVFTW5nOTBpL1orWVQvSDdNQTlVbHhpOVNtQWc2WFJSOVpJ?=
 =?utf-8?B?NUp2bXFhWDFlNXQxbVRLdkk5Qk1ZT3ZzME9aNXZQUDZlVWFqNXk1dlJYYUtI?=
 =?utf-8?B?ZGNET1c3aklCT0ZnSWtCWURrRUNsNVplZWxqZzVhd2p5eE1ZTjVCS1RVNExs?=
 =?utf-8?B?NjVSS3J2TUJVa0trSUJML0ttditFNVI0U0NHNnpKVUcxU1d5MzdVcmgxZXE1?=
 =?utf-8?B?U3VzRktNWk51ZERyNVpRa1hUUTgxLy96WHJhZklvZERzRGJ5cm9ldGhmTjNk?=
 =?utf-8?B?UmFTdGg5elVLTkZxbVhNNUgvS29SNTJ1cHdTVklHdjMyS0gzUmEyOEVaMzFJ?=
 =?utf-8?B?VVdzVWlyVVQ2WElqbncxRzl6aTZnRXFOakJ5Y01ScGNoc3FQcWRoQUZqUUZo?=
 =?utf-8?B?akJYWFFNYit4eWc1UjRoMVpSTGQ3d2U4SUh4cExUZjVHbE94empiZnY1cldS?=
 =?utf-8?B?cUltOXF3UmdtSnV0Skt4a1h5MllXSUZSL0JYaThoRkpuMHM0WnFjSmN3Z0pO?=
 =?utf-8?B?d3Jxb0RKY09mcGNBVExoYmJ3UjF3VEZQMyt1NlZ5bWxBNmp1YzFQS3ZSMnZ5?=
 =?utf-8?B?TWpJN3VnMHB5em1YaUFyMUJTclI0MXdhTkR1Z200cWFmNFdjRTY0NHVSbW1r?=
 =?utf-8?B?b0RHcGlVYmFJWHd0aFBqNzVVUkVjRndyaW5JMzJQOGtRODE1TEZCb1RJMzZv?=
 =?utf-8?B?M1YxR0I3S1BQSmVzSVRwUkprb3lOVjNpRE1jcXc2OFNkYmV6dU5LcDY3aHI2?=
 =?utf-8?B?TTVTekZOR1JqWTVzUUVKZE5rM2JyZjNwYUhFVzBPbzlaa2c4ZWRpdzh2WG9I?=
 =?utf-8?B?TXdtR2hPaXozTTRsb3Uwb1JuYVdUODRXRXhsK2tmYXJVVGx4MEpxaTNaY2Uw?=
 =?utf-8?B?bi83Y0ROY0ZmVStxOUpLUmVkRUlQcEkySnorYThHTGxicE5ESnhPZG1TRG5Z?=
 =?utf-8?B?cnRwb3pkMWVRVWFhSVBOSDAzRkdSamVURzhzZTJyeEh1YzcrektOQTVMdEdD?=
 =?utf-8?B?eGFrSXVFS243VThCb0dueVdwSXJCcmJTZzdtZUVrRFV6R2o2ZXh2SGlkT0NV?=
 =?utf-8?B?Q05BUGlONXF3QzNPUGlEc1pxV3liQmx5MjE4NlcvbkUveU1ITXFpVWxCc20v?=
 =?utf-8?B?M0lJNzVuRlBqY3g5R2ZzRmtla0w0R3NqcmZYYkJIZUk4QzVuOEVERDd2cEMx?=
 =?utf-8?B?MWczV25jS01rV0RNWTlaK1o3ZFR4eWEzL3AvMkRLdDZFbXRxR3BlUDNERjNK?=
 =?utf-8?B?bFRKb0t0c1VLSGJpcVhSL1F5QWd0K3N1dlNaYnplRXhzdGRoS1hQenZyQWVD?=
 =?utf-8?B?Z3NsSE5qUnhuR1ZjMFF6QnVhU2VtSUhrdHFoSTRzOTZrcTJndit5dnVMaGts?=
 =?utf-8?B?OE1Cb1YxSFMzWjlVSjczZ2prazVCQlpEQ0l3UUFNZjJSUEtrd01JVFhEZElU?=
 =?utf-8?B?WXI1cVdYcndXYjY3Q3ZwalltUGhBSFVneXNrVEJWOFNnZ1FWdm1ESzBaeXBX?=
 =?utf-8?B?aGVxM0FQam5hR3ZFalR0cERkSEN0anM2emJDbXhXMFpVU2x3NVd4R2Fnczhu?=
 =?utf-8?B?eFFlcjIwTW1rQWloNHhQZVljbGdXbU1JYm9pdnFFa2dHNStPVzBIci9MTE9m?=
 =?utf-8?B?c3Q3MXEvZTBEQUlLUDBobHY3TkRxOCtFVC85NGI4UXJRVmdiUnhZUTJIOFlt?=
 =?utf-8?B?Y3VOMlVSRXp3cm0xTjVCMUJWVDNsWVpvV0IwK2taQmZPMW55WkowVjdCRmw5?=
 =?utf-8?B?TllVaFprZWlwUjhDMm0xZERYaE9yY1Z0VUtLN3FNemdYcW82YlFTOGc0MnRi?=
 =?utf-8?B?WDYvb2JFb3QvWmlBTTRKdVNVSlV2QTErKzFMR0J4L0J6dWE0R3R5Vnl4UHBn?=
 =?utf-8?B?VkVJaHcrMUQ2M25SZUp4bnREd0RSOGJDUmwxR2lGWGJDZDk2M2pNeWp2T1pF?=
 =?utf-8?B?bVhvYlFSa1czWkZjZXpMQ3QzalNydDVLclo2YkZXekxhUGtLTHBuTGYvemZ3?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63F38EE2231F7845864F8C135B75917D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414e22ad-b78b-474b-56d0-08dcf3cb3aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 01:28:56.7621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tW3gFfsi6Pc5tbQR/5Mi9RTWhiBFeja6RK9EcoZcscv1XWRcDbqVi1gCQSiArzBVUP/WYtjMdTfIShGmJLulejzsYnuO0UYts5sIaGOJce4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_182906_407577_1E7A4CE1 
X-CRM114-Status: GOOD (  18.01  )
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

T24gV2VkLCAyMDI0LTA4LTIxIGF0IDEwOjU1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDIxLzA4LzIwMjQgMTA6MjYsIGZyaWRheS55YW5nIHdy
b3RlOg0KPiA+IE9uIHRoZSBNZWRpYVRlayBwbGF0Zm9ybSwgc29tZSBTTUkgTEFSQnMgYXJlIGRp
cmVjdGx5IGxpbmtlZCB0byBTTUkNCj4gPiBjb21tb24uIFdoaWxlIHNvbWUgU01JIExBUkJzIGFy
ZSBsaW5rZWQgdG8gU01JIHN1YiBjb21tb24sIHRoZW4gU01JDQo+ID4gc3ViIGNvbW1vbiBpcyBs
aW5rZWQgdG8gU01JIGNvbW1vbi4gQWRkICdtZWRpYXRlayxzbWktc3ViLWNvbW0nIGFuZA0KPiA+
ICdtZWRpYXRlayxzbWktc3ViLWNvbW0taW4tcG9ydGlkJyBwcm9wZXJ0aWVzIGhlcmUuIFRoZSBT
TUkgcmVzZXQNCj4gPiBkcml2ZXIgY291bGQgcXVlcnkgd2hpY2ggcG9ydCBvZiB0aGUgU01JIHN1
YiBjb21tb24gdGhlIGN1cnJlbnQNCj4gTEFSQg0KPiA+IGlzIGxpbmtlZCB0byB0aHJvdWdoIHRo
ZSB0d28gcHJvcGVydGllcy4gVGhlIGhhcmR3YXJlIGJsb2NrIGRpYWdyYW0NCj4gPiBjb3VsZCBi
ZSBkZXNjcmliZWQgYXMgYmVsb3cuDQo+ID4gDQo+ID4gICAgICAgICAgICAgIFNNSSBDb21tb24o
U21hcnQgTXVsdGltZWRpYSBJbnRlcmZhY2UgQ29tbW9uKQ0KPiA+ICAgICAgICAgICAgICAgICAg
fA0KPiA+ICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0NCj4gPiAgICAgICAgICB8
ICAgICAgICAgICAgICAgIHwNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgICAgIHwNCj4gPiAg
ICAgICAgICB8ICAgICAgICAgICAgICAgIHwNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgICAg
IHwNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgICAgIHwNCj4gPiAgICAgICAgbGFyYjAgICAg
ICAgU01JIFN1YiBDb21tb24NCj4gPiAgICAgICAgICAgICAgICAgICAgfCAgICAgIHwgICAgIHwN
Cj4gPiAgICAgICAgICAgICAgICAgICBsYXJiMSAgbGFyYjIgbGFyYjMNCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBmcmlkYXkueWFuZyA8ZnJpZGF5LnlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+ICAuLi4vbWVkaWF0ZWssc21pLWNvbW1vbi55YW1sICAgICAgICAgICAgICAgICAgfCAg
MiArKw0KPiA+ICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlhbWwg
fCAyMg0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxzbWktY29tbW9uLnlh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL21lZGlhdGVrLHNtaS0NCj4gY29tbW9uLnlhbWwNCj4gPiBpbmRleCAyZjM2YWMyMzYwNGMu
LjQzOTJkMzQ5ODc4YyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxzbWktY29tbW9uLnlhbWwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBj
b250cm9sbGVycy9tZWRpYXRlayxzbWktY29tbW9uLnlhbWwNCj4gPiBAQCAtMzksNiArMzksNyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODYtc21pLWNvbW1v
bg0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgtc21pLWNvbW1vbi12ZG8NCj4gPiAg
ICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXNtaS1jb21tb24tdnBwDQo+ID4gKyAgICAgICAg
ICAtIG1lZGlhdGVrLG10ODE4OC1zbWktc3ViLWNvbW1vbg0KPiA+ICAgICAgICAgICAgLSBtZWRp
YXRlayxtdDgxOTItc21pLWNvbW1vbg0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUt
c21pLWNvbW1vbi12ZG8NCj4gPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LXNtaS1jb21t
b24tdnBwDQo+ID4gQEAgLTEwNyw2ICsxMDgsNyBAQCBhbGxPZjoNCj4gPiAgICAgICAgICBjb21w
YXRpYmxlOg0KPiA+ICAgICAgICAgICAgY29udGFpbnM6DQo+ID4gICAgICAgICAgICAgIGVudW06
DQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgtc21pLXN1Yi1jb21tb24NCj4g
PiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1zbWktc3ViLWNvbW1vbg0KPiA+ICAg
ICAgdGhlbjoNCj4gPiAgICAgICAgcmVxdWlyZWQ6DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+IGNvbnRyb2xsZXJzL21lZGlhdGVr
LHNtaS1sYXJiLnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS0NCj4gbGFyYi55YW1sDQo+ID4gaW5kZXggMjM4
MTY2MGIzMjRjLi41ZjE2MmJiMzYwZGIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxh
cmIueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktDQo+IGNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlhbWwNCj4gPiBAQCAtNjksNiAr
NjksMTYgQEAgcHJvcGVydGllczoNCj4gPiAgICAgIGRlc2NyaXB0aW9uOiB0aGUgaGFyZHdhcmUg
aWQgb2YgdGhpcyBsYXJiLiBJdCdzIG9ubHkgcmVxdWlyZWQNCj4gd2hlbiB0aGlzDQo+ID4gICAg
ICAgIGhhcmR3YXJlIGlkIGlzIG5vdCBjb25zZWN1dGl2ZSBmcm9tIGl0cyBNNFUgcG9pbnQgb2Yg
dmlldy4NCj4gPiAgDQo+ID4gKyAgbWVkaWF0ZWssc21pLXN1Yi1jb21tOg0KPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVz
Y3JpcHRpb246IGEgcGhhbmRsZSBvZiBzbWlfc3ViX2NvbW1vbiB0aGF0IHRoZSBsYXJiIGlzDQo+
IGxpbmtlZCB0by4NCj4gDQo+IFdoeSBkbyB5b3UgaGF2ZSB0byBzbWkgcGhhbmRsZSBwcm9wZXJ0
aWVzIHBlciBlYWNoIG5vZGU/DQo+IA0KDQpBcyBzaG93biBpbiB0aGUgcGljdHVyZSBmcm9tIHRo
ZSBjb21taXQgbWVzc2FnZSwgd2UgaGF2ZSBtdWx0aXB1bGUgc21pLQ0Kc3ViLWNvbW1vbiwgZWFj
aCBTTUkgbGFyYiBtYXkgbGluayB0byBvbmUgb2YgdGhlIHNtaS1zdWItY29tbW9uLiBTbyB3ZQ0K
bmVlZCB0aGUgJ21lZGlhdGVrLHNtaS1zdWItY29tbScgdG8gZGVzY3JpYmUgd2hpY2ggc21pLXN1
Yi1jb21tb24gdGhlDQpsYXJiIGlzIGxpbmtlZCB0by4NCkluIG5leHQgdmVyc2lvbiwgSSB3aWxs
IGFkZCB0d28gc21pLXN1Yi1jb21tb24gdG8gdGhlIGRpYWdyYW0gaW4gdGhlDQpjb21taXQgbWVz
c2FnZS4NCg0KPiA+ICsNCj4gPiArICBtZWRpYXRlayxzbWktc3ViLWNvbW0taW4tcG9ydGlkOg0K
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+
ID4gKyAgICBtaW5pbXVtOiAwDQo+ID4gKyAgICBtYXhpbXVtOiA3DQo+ID4gKyAgICBkZXNjcmlw
dGlvbjogd2hpY2ggcG9ydCBvZiBzbWlfc3ViX2NvbW1vbiB0aGF0IHRoZSBsYXJiIGlzDQo+IGxp
bmtlZCB0by4NCj4gDQo+IE1lcmdlIGl0IGludG8gcGhhbmRsZS4NCj4gDQoNCkp1c3QgY29uZmly
bSwNCkRvIHlvdSBtZWFuIG1lcmdlIHRoZXNlIHR3byBpbnRvIG9uZSBwcm9wZXJ0eSwgbGlrZToN
Cm1lZGlhdGVrLHNtaS1zdWItY29tbSA9IDwmcGhhbmRsZSBwb3J0LWlkPjsNCg0KPiA+ICsNCj4g
PiAgcmVxdWlyZWQ6DQo+ID4gICAgLSBjb21wYXRpYmxlDQo+ID4gICAgLSByZWcNCj4gPiBAQCAt
MTI1LDYgKzEzNSwxOCBAQCBhbGxPZjoNCj4gPiAgICAgICAgcmVxdWlyZWQ6DQo+ID4gICAgICAg
ICAgLSBtZWRpYXRlayxsYXJiLWlkDQo+ID4gIA0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRh
aW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0
ZWssbXQ4MTg4LXNtaS1sYXJiDQo+ID4gKw0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcmVx
dWlyZWQ6DQo+ID4gKyAgICAgICAgLSBtZWRpYXRlayxzbWktc3ViLWNvbW0NCj4gPiArICAgICAg
ICAtIG1lZGlhdGVrLHNtaS1zdWItY29tbS1pbi1wb3J0aWQNCj4gPiArDQo+IA0KPiBhbmQgYWRk
IGl0IHRvIHRoZSBleGFtcGxlIChzaW5jZSB5b3UgY2xhaW0gaXQgaXMgdmFsaWQgZm9yIGV2ZXJ5
DQo+IGRldmljZSkuDQo+IA0KDQpPSywgSSB3aWxsIGFkZCB0aGlzIHRvIHRoZSBleGFtcGxlLg0K
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K

