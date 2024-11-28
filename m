Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6004D66BA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeamX18ru7PA4NYwAgwtiuzDIISH6Vy/Hzd4iQz/IyM=; b=0sERyiMl4kFZfBPT1KsDAxyQS1
	+2+Y07/3n86IvYWGbOlqa1urbxTCpyzpidN2wSnlFWimDnSNQDMeJY/5zKCNhJXhKlJWzUUBWFwQa
	eF4Sw3EuyWp8UfeS4Z6GaRMECwCev5O3oRHe/Fz1HK+hPjzcRozwqnQAvI/lwDPCtLHRtpWcMzG1B
	SyV/efpsm+smc0WQezIuvZNKHoV0P7Nns6sKmuKiwCL9uS/2IfacCpCcc3N6xbjrnAgW8kBVVhln0
	UK1tRHbO+tK/E2auc4jdCEmKWg4a4cB30B9/8t03zrTU+q8Jt3i1xKdTo/OC96oPxpDMgHoTXy5Y2
	n7cuHK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXcj-0000000Elum-1iFz;
	Thu, 28 Nov 2024 06:03:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXbk-0000000Elni-2wSQ;
	Thu, 28 Nov 2024 06:02:34 +0000
X-UUID: 593fe058ad4e11ef82ff63e91e7eb18c-20241127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=AeamX18ru7PA4NYwAgwtiuzDIISH6Vy/Hzd4iQz/IyM=;
	b=DBFY+DQ6HIDtymYyykOx8lDs4afj21Inq4AvLWuh2C3SfFLDd7E5IEJxhd1lkXY+KsZVYLEuSzGyui8d4ch3LgGswJmSCmUOTJH6fTPJmMA5bLY6BvVSHInd57mQ/ieByCUsjwClatb5io/9PShoFPnO7WZAzOqScBAqvUkrjKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:3fe2e628-df7e-4c10-9ad6-232950c519dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:ad54a123-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 593fe058ad4e11ef82ff63e91e7eb18c-20241127
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 578836156; Wed, 27 Nov 2024 23:02:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Nov 2024 14:02:25 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Nov 2024 14:02:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhQy3kJHVDl8qV/p5nKC5iwd3B/LJkCnxqzPzePw/OGqj3LLhM8+IfEMwwODzJjlqGrmk+ik6QAJ7v1upgh+kStZ2uTA48c7MQX4aXS0je4mP7TRIyU98GZZ0qrwqzBOKUlS1/0DIJ+vrRaqcRj1tghaXIUcS6yYgFFs6DIz9LRsDrteE59OVeUWQSXV5pext7UtiRIAgwmW4qqoxkPnC3jSD4eSm4Z3BHW9zmOJd//Z5oDandPkvx6fdsCwdmWoQEezUjZlOLa2AMjUBzF8e1utEjAPzM6wVHrQjRcj/MZMVC2rlcXvm9a8W04q/WGUaG2mrNUEUT5fWbQSwWihQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeamX18ru7PA4NYwAgwtiuzDIISH6Vy/Hzd4iQz/IyM=;
 b=mpWltzA8Z63sB8DULgwv46PC2UpTa0ZWPCb22UUIuGFmeO1YhQZlo6woQKq/8wI+UkzRHbBQoJb3O5YAy9FLpFLhPefjysS8Gcer7ldC0eGN4zPh7KL7VXgRqMKGwp6i0cZ7EYGMTqRP81kuymPVncotlw0CRjs9X8AtEq6htOv2X1VHX7xHNFEmymf+qY6+Gm8uQoLG6XlA8SS1csJGnyZ6Y5RiImowOf33JEbKsuC1j8vOacDzxEd8cY3emEs/BdbYhP2jrZIbVA4ceBWOhRNyiBeQoV052c1zZ8t1esVVaBhzd1gMDnJ0diVQE061Q0bbOC/PTgzudGgOKf7+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeamX18ru7PA4NYwAgwtiuzDIISH6Vy/Hzd4iQz/IyM=;
 b=jg8AGb6SFQjgrrFuRxkpxq27qTh3vgn2XfZ7PeHXPzPwBs7dOPvol0TT1QlN/XufiVlqriG9Ibyy7eiyM7WoZoz2tYaEnEX414ktaNrOeuzbsnFBSwx17VoyOoaGBlWzhV3LkOtqs8G2t4q+ycjuimcZGSOlrjnM2oynAbk0diY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7553.apcprd03.prod.outlook.com (2603:1096:400:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 06:02:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Thu, 28 Nov 2024
 06:02:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 2/7] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Topic: [PATCH v1 2/7] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Index: AQHbO0o5ukncxVfT6kWYuLGFTOD1aLLMP5kA
Date: Thu, 28 Nov 2024 06:02:23 +0000
Message-ID: <721896498fe9a5ba5a942fe837deb90d461b5090.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
	 <20241120124512.134278-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7553:EE_
x-ms-office365-filtering-correlation-id: c505953e-886e-468e-d7d3-08dd0f723a2c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2VKeHMyM2JUMnROV0JVSzA4VXlDbnF5T25kMzdaYnkwYXZRQXhMaEN3RGdY?=
 =?utf-8?B?UkxlY1FRVHBFS1dGZ3k1L1JweVhSV1V3anZ5U2VveCtFbnY2Yk11RDhTaEVK?=
 =?utf-8?B?UFdaSGhTUmYrV2YvSkU1Qkg1eDBiN0MrdjZNQTRCOU9sSm83VzhWaDMyTFYv?=
 =?utf-8?B?WXdFbGdjZGdxekFHNk0yUTFwQWNwTU95QXFoN3VyYjc0eWpjWWNzZHhBUXBy?=
 =?utf-8?B?Y0hBSVVIdERGbFpDalQ2NXkxMEI3Wlc0bVhOandvM2pkRU5wV0dFWVhGdjRt?=
 =?utf-8?B?bjM0VFJGc3E2M2F6TVl0YmpFZTVBNXIwM3Z4S2gxNnp1MCthQ2NvU2J6UGpL?=
 =?utf-8?B?d2pUNSszS2VVc0dtbTNIR2VwcDBoM3I2R0JYNmFhSUlPOUJJajdwOFJRL3Iw?=
 =?utf-8?B?cjhtek5JUTZvbWxKSWxaMy9HVG5JV29EdCsrYTk0UGFSTVNnVWZIMUIrc0tY?=
 =?utf-8?B?Q1ZQNTJaYW9hR0pSZk1iY3lXSU1uZURSVkZUcURSWXFzMEFWMG50ckpBNWl0?=
 =?utf-8?B?UEVuZThHQ0JGaXcyZmNndHhOa05JbzZXajB4cW5JcjVIVVZCY0E3Wnc4S3FR?=
 =?utf-8?B?M1pvWDhIUXUrSDFkcXlKS1FtcVpVdU1jeU82OE93eEFKN2FRVWNiTUdyNnBG?=
 =?utf-8?B?Q21OMG1lbDJpdFlLMUZEQmhvVmN3M0Z3dTV1R3ZIQ2JCTjhGM25PK3NocitH?=
 =?utf-8?B?RVY4SVpwbDBNRzNIM3NoZHR5cUdZaE5yYWhTYWU4NmRZTTVVNEU4ZmowRkR6?=
 =?utf-8?B?a1hQcDNaU3A3dHl1U1FET296VkRSVTZ5NjU0NkdnMlQ0K3Yva0o0QUkwU0hN?=
 =?utf-8?B?K0dvQkpQNkRMaFlXcmVFZVUrVTFpQ012TmdJRUhzN01ncUtSQjBnVWRNOVhK?=
 =?utf-8?B?VjFHS1B1Skx1L0tLSmFMdmhBVHpkVGtiUGxwNUVJWVR5WjhtbjdPTGJCWmdD?=
 =?utf-8?B?SUtMMnRLbk5VZmNwbStJMndIOXl5MThkdzl2R2oxUWNYYVo2aGpVUmNLV1FZ?=
 =?utf-8?B?Uy94aVJ1eTlzWG5jMEVpczJyUmF4QS9aSDRKYVhpZWNIckZzT0R1d0pzWW9Q?=
 =?utf-8?B?NnRBNWh6cTBYdEN6OHJlMWJVQWxMQzdnUFZvWXdMQVo1ejRlQVE3ODkya2RW?=
 =?utf-8?B?cG1OU2o1NnBFMmR2THJtT2FYbldmWW1TTlRXa1drcCsrMGhlRjNiRmdXU2I4?=
 =?utf-8?B?OHNiWUo0UVVsajZxYVdCMmZaelZSL0ZuZVJicFo4L3JxS0xzajJWQnQ4QmdH?=
 =?utf-8?B?bFJERm1ad2MvQzlNYUJnVlJKdVhFOXhzaE5yVU4wMHJPUHVPSzhMYmZNWmlu?=
 =?utf-8?B?QmlBeitQQW4wQXpKRS8zemlDMlpwTGRrVVRPL1RjZDc2eTBpcW1RNm5ENjdH?=
 =?utf-8?B?Y0YvdFc4ZkRDWFl6NzdXaDltK2F0bzBGN1ZnUGxYc1BkeGtlWUlnNDArSGdH?=
 =?utf-8?B?TnRLaWJNbjhJenRENWtMb0ZMbTRLVjcwU2MzR0xWV1hINmk2cDJ0c2NiTFNT?=
 =?utf-8?B?TzBXNytKT1paczkvSmVqRzZ6ZVBDbkZkRmYvdGFaQ3UzOUZ5cDg0M1RQUjJK?=
 =?utf-8?B?U2RQQmo2aFJDRVdmVzVldGEzRVVVYTR4ZUVGcmx1SnljWFEyb0RxcWJVTXMy?=
 =?utf-8?B?R2FNY09lME83dXBmVGhFZklGQWZPeFFnVE5KNGk5bVViY253U0FqZDVJcTBo?=
 =?utf-8?B?ekh1MGsrYVA1ZVdVTjN4T2RMbG5idTFtVm40MmhSY0VlYkg4eVFTaVBOWGVY?=
 =?utf-8?B?eTRNdk5Sa2t4cjlwUnU4SVNFMGcxOGQ3YUV1eWl3bG4rVjJWUGE3QTlNMHZE?=
 =?utf-8?Q?A5NBTeDUQf+HKzVoOBncpymhDWLja3AnfPXwg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmtYVGVzV1ZTR3ZYNGluMHBDMVJ5SENSbURzeWg1NktaRUxubzkzK1dNNTRz?=
 =?utf-8?B?QjdaQVhSVnJKU1hsNkJQSlUrVXlJeUEyd0IzMzhmQjBSSC9VWGZlcHB6WXBx?=
 =?utf-8?B?bEt5U1lMVlcvS1dTeHh1OUVVM1ZBVllxa2kzemgxZDlZYTVZbEo0NUJ4dlJo?=
 =?utf-8?B?cXhUVklCZjhUN3FmMjN5VVdQTWRhTjFYdkxwbDltNHgyRjQvNmp0R3lPcjNj?=
 =?utf-8?B?V041aERzWGNjZFM5dHJub2krVHVvdWRpdHVtbnVnd0RSMXZRVWt0ZmhwUUpi?=
 =?utf-8?B?YlZqbnRTNmNkRWYrVWQyUkY3Wmd5MU9MMDJjRGpxdWZPMGtIbmFBUkJnUU80?=
 =?utf-8?B?d0NCMExPNXBlVnZKdjNpaGpkdHA1N1FIMGt5Z2tObG9ad1hPY0owN2UreGE5?=
 =?utf-8?B?VTh3YUt3enhrL0FNRjVmVWJYL3dQTlhrdVdwc2NLTFZ5S21NNDZ3RU1zUXV0?=
 =?utf-8?B?TUZZblF6S0lhc0RVZXFCdlZIbTlvOWlwbEpUTkY4SmVJSlVwVDh4Z0NkSCtn?=
 =?utf-8?B?OXNkUjFMTHB1NngvUVFMdmcvajlPVEJzRUpGT0VLMlYwRDVTS0JqQ21MbWZm?=
 =?utf-8?B?THg1ZVpyL2JkbEVjRndJUkFpR2h6Wjl3ZVRQeWtNM0pOWDVrU2dQL2RuU0FC?=
 =?utf-8?B?cVR1M0x3RVl6b3Y1dUNNOEMxcWVzTjRzQ204dHZYTEdzUUVOZE52VzNHVkpz?=
 =?utf-8?B?N1RkeG1NTzF4VjM2SEZlb1lZUmQwQktZUWRheHBwSm1kTEhIczdzQ0JvNGpw?=
 =?utf-8?B?U1VvZWZJNUdXKzZHMWh3R1hZM0dxY1Rvemt6bnora0lTNG5IdWpDN3BJdFpV?=
 =?utf-8?B?NWRQSG0xcEpsK1JDOTBlVVlVc0hiZVdiZ0FJZWk1MjVOa24zVlNiclE1dVV1?=
 =?utf-8?B?N3gzVkFsd1g3THZWVkg3cU9nQzdYbklvTHVvQnFKdGVtcmJsdVYvTUNGQ3lj?=
 =?utf-8?B?eWZMZHdZcVA3TjAvRis1UEJqQlZlRHZ6VjlUMlZiNVB3Z0x2MEFkaVNzM1dN?=
 =?utf-8?B?QmUwVzZlbEQxL25ndTBxS1VkeHFkWHJPYVdHZzhvYUdaMmRQZXNMNmYwelVh?=
 =?utf-8?B?M21QcXNhaWhQQXpTbGZYSjcxY3puUkVRd0JBWHo3bE1VN3NRQlVNcG5wTlF0?=
 =?utf-8?B?Mmk2RHBVRlNwZFppekVFMEhEem1XVDRpNC9TTzFzNEptQzhKUTkwVEp2TDZv?=
 =?utf-8?B?Z3lqZmR4bmxrZTJrVFN2dlVxUWsyem0zUTJ1b0t3M3I0L3YwaGhFOXNIcUph?=
 =?utf-8?B?NkNIcDg4ZjllMUkwZjdjaTdoK2lSQWlWVGYvRlF2QzYyc0xGVnhtZldvcmlw?=
 =?utf-8?B?MHFFL1EwVGhWOEgxbEFkNXlrOE5RckhSZTZoZTlLWEt3dk1Ccm9FbEpONEpp?=
 =?utf-8?B?MFBRaUxzTktMeTQwaFlNWjBsWUUxK2gzSDBDbzlqb2dNMlVnUDEyQVdTaGlM?=
 =?utf-8?B?RGxZOVlKNzdLdTFNWUVUY2N6ZG02Z29DWmV5cjcwOWR5Q3FBV2JWUkdpY1Fs?=
 =?utf-8?B?eE9ZZGM4NWhibkgzOEh1ZjhLdXZ3QnFHMFk4NTNLT3J0SXZsVEJzMldicG5h?=
 =?utf-8?B?ZGdWQ01mbVN1L1FTQzEwc3JYQkRNdXNvTGJiRklDU3QwRzNYNWY1SFd4c0E2?=
 =?utf-8?B?RFRlYUhKTUplSVFheEkzclRCZEd0TEhESURtYWRoUTMycXA1TkFZZzlUNjNP?=
 =?utf-8?B?MTZpVlA0dUtVTWsxNUpJVzgyMFhyV0RpL1dzM21pWFpRUEw3SmxPLzlsNjN5?=
 =?utf-8?B?THVickx5ZmpsVnZ0TXZpc3lyQ2xEN2NYR3RyYk9wVmpqMlVKbWZjMWlBR0hi?=
 =?utf-8?B?MnRHMEFyYTREQ0lHa1FzYXFKdGNEMFZHRlhlb1A5NFRCa1BXS3F4SGVQRVJG?=
 =?utf-8?B?Q1V0S1JqTCt1MHcybzU1ZklWT0JXcjJzMllkdGgzZ2ZhcmJNRHFSSFBnTnNZ?=
 =?utf-8?B?cE5jQ2Z6N0RkRXU1TlpvY2kwMnZmREM0KzQ2VFEzN3VEbm5XaEhnZWlRZElB?=
 =?utf-8?B?L25TM242R2VaaHlFLy9WOXNJMVg4YzRKZzROYVMvcEpGeXQ2aTVhVzRQdXE1?=
 =?utf-8?B?MmxZU1VySzNDSkRDRncyUzlra1pTKy9FaGt5ZGMvd0tDcGpLNjRpamlEU3RH?=
 =?utf-8?B?amliZ1NIUjJDZlB4cmhPV3cvQUJTdlpkMDI3MEhXUFdQU0JNUnp4aWFpL2o2?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5942E7D5A750C041B2536D3025969353@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c505953e-886e-468e-d7d3-08dd0f723a2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 06:02:23.3161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgYi9xhzx+heevPKH1qgqNcqBWceNj2mT48yZ7CPn35rU8srnQ9YYfkKYKb2jFBk5t0A6fK+MsDvmaced1dKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_220232_750309_ADDD799F 
X-CRM114-Status: GOOD (  17.01  )
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

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYSBiaW5kaW5nIGZv
ciB0aGUgSERNSSBUWCB2MiBFbmNvZGVyIGZvdW5kIGluIE1lZGlhVGVrIE1UODE5NQ0KPiBhbmQg
TVQ4MTg4IFNvQ3MuDQo+IA0KPiBUaGlzIGZ1bGx5IHN1cHBvcnRzIHRoZSBIRE1JIFNwZWNpZmlj
YXRpb24gMi4wYiwgaGVuY2UgaXQgcHJvdmlkZXMNCj4gc3VwcG9ydCBmb3IgM0QtSERNSSwgUG9s
YXJpdHkgaW52ZXJzaW9uLCB1cCB0byAxNiBiaXRzIERlZXAgQ29sb3IsDQo+IGNvbG9yIHNwYWNl
cyBpbmNsdWRpbmcgUkdCNDQ0LCBZQ0JDUjQyMC80MjIvNDQ0IChJVFU2MDEvSVRVNzA5KSBhbmQN
Cj4geHZZQ0MsIHdpdGggb3V0cHV0IHJlc29sdXRpb25zIHVwIHRvIDM4NDB4MjE2MHBANjBIei4N
Cj4gDQo+IE1vcmVvdmVyLCBpdCBhbHNvIHN1cHBvcnRzIEhEQ1AgMS40IGFuZCAyLjMsIFZhcmlh
YmxlIFJlZnJlc2ggUmF0ZQ0KPiAoVlJSKSBhbmQgQ29uc3VtZXIgRWxlY3Ryb25pY3MgQ29udHJv
bCAoQ0VDKS4NCj4gDQo+IFRoaXMgSVAgYWxzbyBpbmNsdWRlcyBzdXBwb3J0IGZvciBIRE1JIEF1
ZGlvLCBpbmNsdWRpbmcgSUVDNjA5NTgNCj4gYW5kIElFQzYxOTM3IFNQRElGLCA4LWNoYW5uZWwg
UENNLCBEU0QsIGFuZCBvdGhlciBsb3NzbGVzcyBhdWRpbw0KPiBhY2NvcmRpbmcgdG8gSERNSSAy
LjAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIC4uLi9tZWRp
YXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS55YW1sICAgICAgICB8IDE1MCArKysrKysrKysrKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLnlhbWwNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgx
OTUtaGRtaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWkueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI3M2E4ODcxNDYxZQ0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG10ODE5NS1oZG1pLnlhbWwNCj4gQEAgLTAsMCArMSwxNTAgQEANCj4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiAr
JVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4
MTk1LWhkbWkueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWx1MERfQzNUd1EyLTAyaldZQUJu
TUlROHZFb1V3UDBPNGdiUW5kSm5QVU1wZGk2d1hkQUhyYTlpdkNmQjd6b2VsREk3cXNTMjBZZFJs
bVA0YkVLQUFCbGV0WEZYJA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJO
S0E5d01nMEFSYnchbHUwRF9DM1R3UTItMDJqV1lBQm5NSVE4dkVvVXdQME80Z2JRbmRKblBVTXBk
aTZ3WGRBSHJhOWl2Q2ZCN3pvZWxESTdxc1MyMFlkUmxtUDRiRUtBQUZsblktS1kkDQo+ICsNCj4g
K3RpdGxlOiBNZWRpYVRlayBIRE1JLVRYIHYyIEVuY29kZXINCj4gKw0KPiArbWFpbnRhaW5lcnM6
DQo+ICsgIC0gQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4NCj4gKyAgLSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
PiArDQo+ICtkZXNjcmlwdGlvbjogfA0KPiArICBUaGUgTWVkaWFUZWsgSERNSS1UWCB2MiBlbmNv
ZGVyIGNhbiBnZW5lcmF0ZSBIRE1JIGZvcm1hdCBkYXRhIGJhc2VkIG9uDQo+ICsgIHRoZSBIRE1J
IFNwZWNpZmljYXRpb24gMi4wYi4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJs
ZToNCj4gKyAgICBlbnVtOg0KPiArICAgICAgLSBtZWRpYXRlayxtdDgxODgtaGRtaS10eA0KPiAr
ICAgICAgLSBtZWRpYXRlayxtdDgxOTUtaGRtaS10eA0KPiArDQo+ICsgIHJlZzoNCj4gKyAgICBt
YXhJdGVtczogMQ0KPiArDQo+ICsgIGludGVycnVwdHM6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4g
Kw0KPiArICBjbG9ja3M6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBI
RE1JIEFQQiBjbG9jaw0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogSERDUCB0b3AgY2xvY2sNCj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEhEQ1AgcmVmZXJlbmNlIGNsb2NrDQo+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBWUFAgSERNSSBTcGxpdCBjbG9jaw0KDQpJIHdvdWxkIGxpa2UgdG8ga25vdyBt
b3JlIGFib3V0IEhETUkgdjIuDQpXb3VsZCB5b3UgbWFwIGVhY2ggdjIgY2xvY2sgdG8gdjEgY2xv
Y2s/DQpJZiBvbmUgY2xvY2sgaGFzIG5vIG1hcHBpbmcsIGlzIGl0IGEgbmV3IGZlYXR1cmUgdGhh
dCB2MSBkb2VzIG5vdCBoYXM/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKyAgY2xvY2stbmFt
ZXM6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGNvbnN0OiBidXMNCj4gKyAgICAgIC0gY29u
c3Q6IGhkY3ANCj4gKyAgICAgIC0gY29uc3Q6IGhkY3AyNG0NCj4gKyAgICAgIC0gY29uc3Q6IGhk
bWktc3BsaXQNCj4gKw0KPiANCj4gLS0NCj4gMi40Ny4wDQo+IA0K

