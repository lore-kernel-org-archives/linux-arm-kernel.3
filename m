Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644CFD3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 06:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bPchJhllR775OGnFP7XwIxgM0rvfta+iVqvr2lAyUw=; b=EJr63ur+80LKvrwhQyyZEYIb2g
	qt5Op5mKE5toLIwxRFgg5EHAX0XWBQcT1Zf4BDG8YgkIsCEcz9kIKfNHH5NZhLDyHNb26b3+6TQsB
	fYsDQafD6q8nfLWZb9Tna5ub4XwRuNthmSrzZ6aV/Vx9x+WM45SdiNU3ZufxJBf8TGWbBnAmOfYc8
	QIUA1rmxNTbrOf51E0PHfpIvXLtu4G86Fxf/imbDZixNH9TIdRLP3nxLTEAtl4AXhCUJ2wFbzIfMC
	lj3xZvDQZWb+eJxsirqnMhqmGS9gCXch8HSo6ddkD2eIb6PIcrcp/rKnnjkBvVQHWkuLM2lP5zO5u
	xyXZPH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZPD-00000001yoA-3RmB;
	Wed, 06 Nov 2024 06:20:39 +0000
Received: from mail-am6eur05on20625.outbound.protection.outlook.com ([2a01:111:f403:2612::625] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZNA-00000001yIc-0tK1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 06:18:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+CLFEjL7gaEbHu8X7T33tx3VGg1TYXKbf17tk1zhh5TBCr2jjAgkutZUrkQeXskH72XMzb+3pZcjq7bcMckWiCJc6uZ8IcGAC4qGP9diludlqHssYe3J3HeHtHOksY1Yu+PHePUiMoeqoBcuJ3crKcgi6f79VhMiGdhNuFcaRuqFjD8u9qye+SnlzbUGJ4+RQsOCDZyd+pAv0skVGTNPuHGOX6N9LwZi1guKOCUKZq7dLxJY+kvV4/G0YmdgAyfpoQ2nQBWVaahDi7Sy86cByaPIeF4TQ7X4WE/fjV+6xxntTq1HpiMKaL4aZZeCkJYNeQ1dnvj37mL5dHClflsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bPchJhllR775OGnFP7XwIxgM0rvfta+iVqvr2lAyUw=;
 b=RNqd+ceAMNM/X9AAiGsT6NG36CiU9ORbHzrryY1yxlnV0snY8NjMXxRBjnZCs4c5B29xhSxJ2EtPzxvb3dI/KWUJpGecJRp5iombZ380RyMJmJy3WrIE6biXOeBFgGhwhSufCeuZqotE+CNaVV++AuUs15MnEqxQsSRorQOzm1xkYP4DONziP6BwsO5XnAc7m/p9cHtMopXadtKkJH+0iVW9j64jVZ4cPYGWFyF6HHUlYa6Sj08ETmKAsI4c1j2Q9dH+1HiAQc/pufZT5wx0mmxVtyauM6tZd2Ul5QfPaPNuZ/jv5yUwIdZNjSDUiyUkpcFQZku6zbVARkSKcJW6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bPchJhllR775OGnFP7XwIxgM0rvfta+iVqvr2lAyUw=;
 b=PBBunqc2jazj5bIEAfDKREw1vkhIPjWIMKP87j4h0aSmntGdg+d4ptEGk105FrvhaosD5e30C9Y5h4iKYEM3EbJy6mxcE1SBePXh9TYJk4Pvm9ieSweirKJRiiPzxRJiOLjJ+ufS36bisPRZh6Gh+o0E3xjyudmWu/IzXqtOeKmPwyxvr1D5VIvgiI6P+Io2icot5lEGYCG/ks2C2+LQTHh6A3UGTjF6VECqJgfc2xXWM08qR8EfTH0xNh6sJkmABrMdvbeHV4QZ9Hx+MZU4Fu8bLhl+II7AFYQpC7b6CWSmQq0lL9e1INkb3iRIe715b5Z3w4ZgljiBfhM+snDG0A==
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by GVXPR04MB10384.eurprd04.prod.outlook.com (2603:10a6:150:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:18:25 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 06:18:24 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: =?gb2312?B?S3J6eXN6dG9mIFdpbGN6eai9c2tp?= <kwilczynski@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com"
	<lorenzo.pieralisi@arm.com>, Frank Li <frank.li@nxp.com>, "mani@kernel.org"
	<mani@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Thread-Topic: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Thread-Index: AQHa3AEqv5bRdDxqKkSUwsC4eegPdrKmrdaAgAPAQkA=
Date: Wed, 6 Nov 2024 06:18:24 +0000
Message-ID: <AS8PR04MB8676B83C73ABBA45A34C58DB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
 <20241103205659.GI237624@rocinante>
In-Reply-To: <20241103205659.GI237624@rocinante>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|GVXPR04MB10384:EE_
x-ms-office365-filtering-correlation-id: 8c40f459-1ce2-484d-9250-08dcfe2ad23e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?gb2312?B?Sm5kMS9SNEpNblRaSHRRYUNwYklvcVQyUG9tMjdDSndqTE1vVldOMHZmVVFT?=
 =?gb2312?B?cHJqNzUzNCs0UGIrZGZyQ0Z3RjMxemxOV09XSEZXR0U3cFVTdTduT3NveVU0?=
 =?gb2312?B?T0xnMWMzNUcreWlGd1BRcm95MVpwQkl4QlZtdnN1RmIrczVmdlhWSFdacGZM?=
 =?gb2312?B?N2RnZHozTTRJckNjamMzSUdrcWk2RWNlRDNxUFZBem5VZ0JQNkRIL1kxc3Z4?=
 =?gb2312?B?b2RyUS8zRDl5WjhkYS9ZZ3B2ejZROE9jUlRUcXNYZTNNOHl1Qk9aUXlUazZ4?=
 =?gb2312?B?d3dhbHRCcHJCR2d6ZHo1d2hCaUdyQlFrKzcxM0hna1hEYys1VFJaUndTcWNJ?=
 =?gb2312?B?MU5EVEhwRHcvdW1MWFFOSDdJcXBuK3BQVGVuSHVyUitPZ25jdmVLelVTNmhP?=
 =?gb2312?B?Q1luSHpZVGdMU3dZWjdmZGsrTXFNVHR1aTFHSjFNODBHRlJ5aXdERllsSmhH?=
 =?gb2312?B?WFg4VzB5OTJhRGFmZUlheHFxcmVlSVdSamtsTExEWW9PVWFVOUZoTTFOQ1Fa?=
 =?gb2312?B?UnNtanRwQkV6Vm05b2lpRDNaWFhPaStsMTRGTDNoaFRUVFpVdnNsSzA2eTBJ?=
 =?gb2312?B?NG1kTklmWlUraC9LcnRPWmtOVjhtOElOTFArd1JRWWZBTUxLdE4xTGlzRStm?=
 =?gb2312?B?TjIwUk1MaTlvTC84MzlFV3RYaGlEVGlKTmw3YVorRm1uU2FXM0Y5Y3FodzhZ?=
 =?gb2312?B?QkxtKzFNd1M2NE9HT0M4RWhDdS9vUzA3c3lBUHAwL1RkTFpFSHNDakd3N2xk?=
 =?gb2312?B?bTFRdXVDa3dBcTkycmhqWWVkVzNNcHgxZGZyOVJzYnNqV3ZjVnRwSHIwMDNt?=
 =?gb2312?B?Vmk5Z0dhb3hKZ010MUpRRnFVdFBQT0l4ZFZESEQ1TkIzcDVYa1FSVUk2VlZv?=
 =?gb2312?B?OFE5dWdaaERwWDZidCt5Mko0NnArQVNFa0pXaGdrdVJyMFpnYzZwRjhjNVU2?=
 =?gb2312?B?UFp3ZkJmU3p0OXZ6cVNVSlVWeVM4bXplcUZtOVlpUkhoSThLZzlvZi9zS3py?=
 =?gb2312?B?VUZQcjdCOEpPVnlWRzB3TlFDQ2RtOEZTNkJZYzI4MjdCZ2UxaXlBbmRJOUgz?=
 =?gb2312?B?dkh0VTZEYWEzY3kxRHd1UFp0SHVrbkdBMEQ2OU1GZTY3T2xjZWFyV29SYXNE?=
 =?gb2312?B?WEt4NXhvcFgwQ09XVWl2azBhNGwyRVZ2K0FQN0ZyVzBydEpXbEI1V2xVVVZG?=
 =?gb2312?B?clF5dHJzeUt3WTBna3U2RnY3M1RGNkIwd20xSTZkN3BVUG0raHBNTEtEYXVP?=
 =?gb2312?B?YjNkTys2ZWZCZGU5VENYOXdBL1U1YXFTTGZsa0lSQXNZZEVrcnhyR1NZT0d4?=
 =?gb2312?B?K01tUW85cFF6d0g2N25vQnBsRzQ5dnJEK2gvaTBjTkxXdUQzUm40cFR5bHds?=
 =?gb2312?B?cW5LeDlQL3JCNmcwM0JHQVVpdis2cHlJZmxuVVZURjIyV2dQZk9IbXlWUkZs?=
 =?gb2312?B?TlNXd29MWlBUU0VHNklFdzluUTg3MmFSSXgwQXNDWTltTWI3aS95T200U0lu?=
 =?gb2312?B?MU53emdRaWhrTnFIYU5QbkRKMWRZQmx6SWY1aFZCWk5SM1YzeVN0aTdFSG0r?=
 =?gb2312?B?LzZ1U1hMSUNkVTJhSnlPaERuVHV3RzE1dEtaVDJ6bW1WNjNxZkNMMm9CNGFh?=
 =?gb2312?B?V3ZrNFg4UUJzQUVHZXA3MnJLa2NrOTV2bHJyN2hITXNROHRqL2t3TXpZVFVo?=
 =?gb2312?B?dytBOC9CcXREYzhLQWRNNHQ5VXZaTGtyMkYvVTRNeWI2U2hpT3FTTTRZc3dC?=
 =?gb2312?Q?0nVLykDv4GGkVEFYHQkYmCf/71RDKSMwJNUj6Zu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?OFZpc3FtOGJzNzNxQlpsSUxsTE1tcGlTMXJPd3J3YzZjdVRDRmJXYzFuN3pE?=
 =?gb2312?B?Z21GWnhQMHdXc1duQXpKMHlrd2lreTdQUU5jVU12ck9NMUo5NExHbWdGQWto?=
 =?gb2312?B?dituODRmQmhRQ1VnUndyOG8yL2Y2eGdSTEJtTktXVTlXWUJqMC9qSFdoZ1RY?=
 =?gb2312?B?YXdOUHdSZDdyL2VFRzQ5a2kySXpSZTJpMkRCcHl5QmZvTW0vTklTNVZ2OXdN?=
 =?gb2312?B?ZWkzQVh1TnFqQVFQTGh0ODZlTmFKalZEUStUSG9OL0pNSHAwOHpyL3dCQTJJ?=
 =?gb2312?B?WU12K1ZMQjR6OFN6azVwd2dhQVB0WDQ1UWMxNUtDL0E1OTljWEJoWUQwZzJQ?=
 =?gb2312?B?UWtONUFUTzE1QnVlakp6VXpoVmF2SEJNMjcvUW5ZMHNIYloxWmE4QysrMXA0?=
 =?gb2312?B?blhNL3g0dFdkdlh5U09obHNPMUdQV3oyWkpjZzJTbkJDWmNYYlNoSUp5Mmpp?=
 =?gb2312?B?TTNlajJVRmFmZ1lEQzlwQWJnbTdyN1QrUWJVTWNrZjg4VmJZVWFMYkpMclV1?=
 =?gb2312?B?YjUvemxWL2M2WHIrSlFiaEVCcG1OTG9VampSbTgxWFZReUozS29rcWNwQmFq?=
 =?gb2312?B?cHJYNFVOSWRIWnVFb0lBb2l0b29ld2JnWEg3cTRDNjlmc2U2TllaMDJ6N21n?=
 =?gb2312?B?elk5b29pLzNtLzk2S0VxSExGTTh3VWczRFdYS2JTS0hjY0NFN1M5K0FDVUZI?=
 =?gb2312?B?YWVQRHJUTWt1a0dkTHZrNWVEQTdrd0VMQ3RMSXZzdmM4akluOS9PV21laFFH?=
 =?gb2312?B?SGZuaUtsUFBGNzRSLzZOZyt2cWQwTDNtYXVJbUpxV2x6NlhYbXhnZ29CL3dp?=
 =?gb2312?B?UzhrTGdMQy9IU0tMVXNYYmxDcXVwNS9yemxxbzlDQi9ZdzZLU2dKanBVZ2M4?=
 =?gb2312?B?T1lPb3B3SURHWW9ZZUhWT25mWkt5ejcxbCs0VythckRQVlBiTFVVYi9XZGxD?=
 =?gb2312?B?VWIyVHJPNzdPaWFOMUY2MDQrRnhwak9LdW5sRUxEMUwvQUV3M1U5MWE3ZDhD?=
 =?gb2312?B?ZlJPajcyenA5ZnlJM1pFT0tOejJFMGx0aUhBV211b0ZDWlRPZU1iQ0xtSU85?=
 =?gb2312?B?dXN1QVloTVVBQ1Njamh4SDlKVDZLeVFKNHo1TmI5VUEzU0UxTERSZFVtenpm?=
 =?gb2312?B?eTVyTkxLUlZwS1laOC9kZU5iNG9JN2VZUE1wSmdFZ1pFQk5UUlJKS0xHaTlp?=
 =?gb2312?B?TTQ4a3RFRWpqcWxUU0t5MVh1Uk1BRmxrbml3ZUpNVVlHTFF6T0VvTUo1RUNC?=
 =?gb2312?B?ZE5ibWxZaXZGQUJGR2NucjYzM1RleE5xaHo5d2JlWVpuc2hrb0o0Mm5YU0hV?=
 =?gb2312?B?MVBpWmtrTnZMRmNab245TmRJdUY5alEwSnRlQnM5elRLUkRMYVY3RXVvQmtT?=
 =?gb2312?B?cUtSMlJTSlhIaTdHNXNlNmhYVVROcFdiQjhCd3p0KzhKMGVBZDFGVWFodVZI?=
 =?gb2312?B?QWQyWTYxVHRWL3c0cVBvNUNadHpjOGFXL0RESGt6RjV4SjMzblh1U0RFb215?=
 =?gb2312?B?T1YxaTMwMEpwRUhvMkZaMXBNMytpYnFDdTB5S0xYS1hhaUpmMzJqczlXSHZo?=
 =?gb2312?B?TGNaRWlXOEdFZ3J6YnZtbGZjYTQrQkZNc0FheFFMM1YzR0ZLMkZZZ2pQN3ZJ?=
 =?gb2312?B?dGFpZzMxV0NjZThOc2I0eUZSeEpZUjAwTVVyUHpreWthQUZucXpJc2pNOWFW?=
 =?gb2312?B?SDh5MUc5U2NjUWZ4L0VzWlVoemh3R1Q0SWRORTZxNG4wUVRHM1M1MXRKenA3?=
 =?gb2312?B?cjY4UDZhRHphalU1eVFxemtnZXBhTTA3T3hmbkc3QjdMQldiSDNRZWhkZHpM?=
 =?gb2312?B?NFV2TkhQMHk2NXVZMXhUWk4yVG8xTnZWRzlCR2syOFNzVGMxMjhPV241Q0xT?=
 =?gb2312?B?QUY4MTdWQXpBVU94bnBqeGpreEJBUnE4R3FEZm5GSG8wc0tNTzdqbkx2TGVL?=
 =?gb2312?B?V2NsQytaYVlqUXlpTGtkbisyY3lzSm1SSE5oQ2drWTBCT2xLdy9CL3h6WGZt?=
 =?gb2312?B?SEZTZk5la2ZPak5YUjdvMnowcjhmbS8xb0k2cEM3cFZKS1YxRHF2RzRFbGQ5?=
 =?gb2312?B?L2wyVHRjNjB2T1VLRWJxNVIvZzlDUkZqSDBBK25xWUp3UWlOVHBOOXV1K1h1?=
 =?gb2312?Q?10Y1lagF8+n9dYc3yxSgwHmWQ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c40f459-1ce2-484d-9250-08dcfe2ad23e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 06:18:24.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rul6mT5A6LCZQ8IsBFJKpMI9wWaK5upY4yhovBG3QroIobQEtY7ScgDBeB6I0R1sB4bb1/kTzKtCRYHjVHtFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_221832_462117_FF824D39 
X-CRM114-Status: GOOD (  19.81  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgV2lsY3p5qL1z
a2kgPGt3aWxjenluc2tpQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjTE6jEx1MI0yNUgNDo1Nw0K
PiBUbzogSG9uZ3hpbmcgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFz
QGdvb2dsZS5jb207IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207IEZyYW5rIExpDQo+IDxmcmFu
ay5saUBueHAuY29tPjsgbWFuaUBrZXJuZWwub3JnOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3Jn
Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgaW14QGxpc3RzLmxpbnV4
LmRldg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBQQ0k6IGR3YzogRml4IHJlc3VtZSBmYWls
dXJlIGlmIG5vIEVQIGlzIGNvbm5lY3RlZCBhdA0KPiBzb21lIHBsYXRmb3Jtcw0KPg0KPiBIZWxs
bywNCj4NCj4gPiBUaGUgZHdfcGNpZV9zdXNwZW5kX25vaXJxKCkgZnVuY3Rpb24gY3VycmVudGx5
IHJldHVybnMgc3VjY2Vzcw0KPiA+IGRpcmVjdGx5IGlmIG5vIGVuZHBvaW50IChFUCkgZGV2aWNl
IGlzIGNvbm5lY3RlZC4gSG93ZXZlciwgb24gc29tZQ0KPiA+IHBsYXRmb3JtcywgcG93ZXIgbG9z
cyBvY2N1cnMgZHVyaW5nIHN1c3BlbmQsIGNhdXNpbmcgZHdfcmVzdW1lKCkgdG8gZG8NCj4gbm90
aGluZyBpbiB0aGlzIGNhc2UuDQo+ID4gVGhpcyByZXN1bHRzIGluIGEgc3lzdGVtIGhhbHQgYmVj
YXVzZSB0aGUgRFdDIGNvbnRyb2xsZXIgaXMgbm90DQo+ID4gaW5pdGlhbGl6ZWQgYWZ0ZXIgcG93
ZXItb24gZHVyaW5nIHJlc3VtZS4NCj4gPg0KPiA+IENoYW5nZSBjYWxsIHRvIGRlaW5pdCgpIGlu
IHN1c3BlbmQgYW5kIGluaXQoKSBhdCByZXN1bWUgcmVnYXJkbGVzcyBvZg0KPiA+IHdoZXRoZXIg
dGhlcmUgYXJlIEVQIGRldmljZSBjb25uZWN0aW9ucyBvciBub3QuIEl0IGlzIG5vdCBoYXJtZnVs
IHRvDQo+ID4gcGVyZm9ybSBkZWluaXQoKSBhbmQgaW5pdCgpIGFnYWluIGZvciB0aGUgbm8gcG93
ZXItb2ZmIGNhc2UsIGFuZCBpdA0KPiA+IGtlZXBzIHRoZSBjb2RlIHNpbXBsZSBhbmQgY29uc2lz
dGVudCBpbiBsb2dpYy4NCj4NCj4gQXBwbGllZCB0byBjb250cm9sbGVyL2R3YywgdGhhbmsgeW91
IQ0KPg0KPiBbMDEvMDFdIFBDSTogZHdjOiBGaXggcmVzdW1lIGZhaWx1cmUgaWYgbm8gRVAgaXMg
Y29ubmVjdGVkIGF0IHNvbWUgcGxhdGZvcm1zDQoNCkhpIEtyenlzenRvZjoNClRoYW5rcyBmb3Ig
eW91ciBwaWNrIHVwLg0KSSBjb21iaW5lIHRoaXMgZHdjIGJ1ZyBmaXggd2l0aCB0aGUgb3RoZXIg
b25lLg0KQ2FuIHlvdSBoZWxwIHRvIHJlcGxhY2UgdGhpcyBjb21taXQgYnkgdGhlIGZvbGxvd2lu
ZyBzZXJpZXM/DQpodHRwczovL2xrbWwub3JnL2xrbWwvMjAyNC8xMC8xMC8yNDANCg0KQmVzdCBS
ZWdhcmRzDQpSaWNoYXJkIFpodQ0KDQo+DQo+IGh0dHBzOi8vZ2l0Lmtlci8NCj4gbmVsLm9yZyUy
RnBjaSUyRnBjaSUyRmMlMkZlYzAwOGM0OTNjMjUmZGF0YT0wNSU3QzAyJTdDaG9uZ3hpbmcueg0K
PiBodSU0MG54cC5jb20lN0M5OTYxMmMyNjRlNzA0ZGVlZjNmNTA4ZGNmYzRhMTIwNSU3QzY4NmVh
MWQzYmMyYg0KPiA0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM4NjYyNjQyMjY3NDE5
NTMxJTdDVW5rbm93bg0KPiAlN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJ
am9pVjJsdU16SWlMQ0pCVGlJNklrMWhhDQo+IFd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3
QyZzZGF0YT1ybElqVjJnWldubnJ1VVI4RHluVHF5VQ0KPiB2bk8lMkIlMkJ4dnp4aUNEdyUyRm5l
b1FNdyUzRCZyZXNlcnZlZD0wDQo+DQo+ICAgICAgIEtyenlzenRvZg0K

