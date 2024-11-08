Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3993AD5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aazrK/dmDL9MRy4fcs7xkL2cUfSrZJiHG6PATAkcqV8=; b=a/1KxY5CVO0T1weP/SxcAKhEKl
	CHHBDxnVf03Ak3XL2oSlCMgTfQBW368cwSXK75eWV0OLAZvCCDTp9oTXaOrYTRkswF2XUMj/W9W5C
	4VWHjG2skp0CN431j1xFGN3WNEVcCtZWIEEeuGKtuUlsvsWL9+8cdeCjn2NbpZgov/mzWDY+x8NLg
	4X6RSu69+5lo4l9ZJo4yQ8d6aV+WtZVL0ZqKgXbRZtif8p+myzjugklCX3gjMcy46HkGzyVdzC/fe
	wnWk8mvqPgDfNvBk3hU7Fex8+rF02Se8arg8CXxDPdiLmjakLS/a1JUfpxCqgKrbUCZnH2tVQUu2S
	tvHyo5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MyG-0000000AJiy-1lxn;
	Fri, 08 Nov 2024 11:16:08 +0000
Received: from mx07-0063e101.pphosted.com ([205.220.184.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MHy-0000000A7di-3BJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:32:29 +0000
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8AGexF021628;
	Fri, 8 Nov 2024 10:32:06 GMT
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010006.outbound.protection.outlook.com [40.93.131.6])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 42s6f5r8jr-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 10:32:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Heg9UUfxqlFsGsA8czwilQKNtQU3yEoeEM31c/W2qkEOVmT1Q0zhOtWUKy2mh5nWNn12jUYkcw7NzdgFUQQzssQfBC6X9w0EWKxPtjqRDp2BSWJ2rl/rQfyDJymIoY/I5RsgjRiRX5VD0jz4UKD+yHN1bDrOnSOHrA4OPPIJ/fzk84Pn4W2C6PcchUrsVoD4e4+y+YCP4gMLtGBf3O/sFF4cF+SMiQlzZlgf8aMh9H+T6On71/39nqj8qQi77m6uLWZ506qaSuq6M+QJewco5LbSVrw631VWFYAR7IrU3ggrKAm6RibwywJew47yaS/cXUnVhMMkvvbf5NEVt4c+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aazrK/dmDL9MRy4fcs7xkL2cUfSrZJiHG6PATAkcqV8=;
 b=bywDmZAVn4ox+QYaDu0DHg4lF1fTloNuH4p041uTDmAueRN3CP7z8n9QsKNCq1Dj43Q9c02U9lTkmznCX9PSptSZLex1KebntkCNEi7qWNY7t4KKzO8wckFI7fS6sO3V5VpvJ1G6Pch9+xQ4W5XR1fp095YY5UW4IcBOFV74p2uaE3tEGZCX+SrFSTZwyn+yvGRMLzl4Lbo9rXiM0hqO10byyHCDGOGYZvA266zS4PYwUdIt9XHygn3/W6aRt4hEbaFsjYi3apQ+amKaa41hCz4t7RPNKOW22gVq6qtClPnmGeGiWN7ZH6AH3I8LymXafj3Os++jex4n2FRASeQohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aazrK/dmDL9MRy4fcs7xkL2cUfSrZJiHG6PATAkcqV8=;
 b=THQPlKftbIyP3I82Pq1DEKqOZnPCEAL77rBuHg0qVwq7eu6kMoaD878EZPA3RILKkJLWsABmFqzb1rxUBDdHveNwFIoZJwRyLEt6K4YQJggr0u/EffzKAxSUoBtu2OLVYN3FUnw9MEnAWkuDkyhKC4Wldrdb4UdTl1/8JKp9JLc=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN0PR01MB7813.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 10:31:58 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 10:31:58 +0000
From: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn
	<matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>,
        Niko
 Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
        "olof@lixom.net" <olof@lixom.net>,
        "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
        "andre.przywara@arm.com" <andre.przywara@arm.com>,
        "rafal@milecki.pl"
	<rafal@milecki.pl>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
        "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
        "nm@ti.com" <nm@ti.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "nfraprado@collabora.com" <nfraprado@collabora.com>,
        "johan+linaro@kernel.org" <johan+linaro@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 5/6] arm64: defconfig: Enable ARCH_BLAIZE_BLZP1600
Thread-Topic: [PATCH v4 5/6] arm64: defconfig: Enable ARCH_BLAIZE_BLZP1600
Thread-Index: AQHbMclwCwq7DoKch0yhrxts1OZQHw==
Date: Fri, 8 Nov 2024 10:31:58 +0000
Message-ID: <20241108103120.9955-6-nikolaos.pasaloukos@blaize.com>
References: <20241108103120.9955-1-nikolaos.pasaloukos@blaize.com>
In-Reply-To: <20241108103120.9955-1-nikolaos.pasaloukos@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|PN0PR01MB7813:EE_
x-ms-office365-filtering-correlation-id: 6d7fa88b-6177-4504-c360-08dcffe09338
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ui29h1fYM1R0IKaUYk7ClzaGmLL38Nsng9qhGmDfUlQ6pIkUzZG7kkkrkR?=
 =?iso-8859-1?Q?libAnfWyfK+7EXZH+6X8XHcdArUCy+MZ3CcGwUvrCraKGutiR+2pKxTlev?=
 =?iso-8859-1?Q?LRE6XolZ3fooJfZFhEbWwa3vCTESgHv60hTfRRBYxxOGSlhGoOtdG2W96e?=
 =?iso-8859-1?Q?JuF4dFQCUtlOeyGjNqCVykVZ8e9yiPwMwvifxprDERuKBsHmxRgbmFiVPB?=
 =?iso-8859-1?Q?FCeOD1UW/r3OItGH6k3fADGCegzov6AIfvXVccE/R0l3WTUQh+TnIfAWaS?=
 =?iso-8859-1?Q?8M78LYs7vvJmdQwQ6SHIAdrTqeYJi8G0h4egIqGkGVSQIHg7w5OegPfNQg?=
 =?iso-8859-1?Q?X5h1vBLgUiFWSQ6iIKQTsBcs4YsxTpZSThBQ8pQo3W+oVmp8KMLZFYNZ2n?=
 =?iso-8859-1?Q?XFT5RwztDY+ePElFTtuG9TcUjfiOURD7KwBXs8io/+bXVykMaWFLyTdmR2?=
 =?iso-8859-1?Q?V4b0a0S9zNf1S2W8rPDGayHjI6WGJkOTSm+N9JWC2+5AhZi7cJcfq/iY2C?=
 =?iso-8859-1?Q?sTHft9qO77B1v8w06LW8SuYoGnO7XYPz6aihWuWFK/JNRUnVhLdpp5qoW6?=
 =?iso-8859-1?Q?Wk7JpRJqIY1PpiB5B1hoQSJLtha+GwLkI2lmhwIhqYJPCVM3OC9nka06oa?=
 =?iso-8859-1?Q?Qkucmp0VcBEUKpmxHNY1GXQj1yTcHs2P3th0i+TVUlfTYBk8ADO03zb/GK?=
 =?iso-8859-1?Q?RdrdZfFzHjt+xUQqmxCY8h+dL6WcHL27CvBLWbF1f+JVjqsGJM64M9AEs/?=
 =?iso-8859-1?Q?AEg+OXVIMRWO5Gxe/DLTbsqcZrxIz6TdJ48IY1LdRQnHAKYWG1MNj4QJMZ?=
 =?iso-8859-1?Q?teuItXI73Rocxyz8wbzNIsqSprtX+E6Zfh8DoQHjnSJuXPxGj1oWYOH8Fb?=
 =?iso-8859-1?Q?gUhaOgKLQfRiy78dGC2ybzcfRcg8IeFoFGNLn5LsOqihnnqIoh26EuXgwl?=
 =?iso-8859-1?Q?WbuZzPYlNRP0JELv0vuKn3CW0oNyCgbktfRU7Ysa9yfGCa8BQOIkzgb+ti?=
 =?iso-8859-1?Q?XwY46zHQBpoebi2irYyKqgRx2SqpyrdIgblbgFs+UoRxp3/IKR+r1TwcBu?=
 =?iso-8859-1?Q?/GFtRs7ylo7zlGa2jiAjd4byvt4lCgKGAbWmRthye5CJ87qwVH7EGMdQsq?=
 =?iso-8859-1?Q?aP/ILSAyfiDJfKcOZFBNAdYvED8KlPCYmQaBPRe1eFiRl82ie5pzJJBNTu?=
 =?iso-8859-1?Q?vRaCsHLp+IX4zL7rHGrkFUvC6PkceTsqDVr5hd9HZwiDvur+FyqnkUYLik?=
 =?iso-8859-1?Q?HIArsSikIO37k/TeJ+q5MEj/uqh+RQUdCpyRfghn5EKrtIx9GCQ5b910LS?=
 =?iso-8859-1?Q?/3CZXHiaaWKAAD6cRc9a2/pdV38udtoyTdJfbfgE6X8ehCHuuXXlGaEBQD?=
 =?iso-8859-1?Q?e2xyK6Wrf82an/6/miHE12FvsEsd7vAunacyuSiR/8EbXkG483pIeDJ2Gc?=
 =?iso-8859-1?Q?d0ZOjUatAKuU1mZv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fbOyXYtgUPbm49ZQrCgqOa97jDto8Fm9Hc/DCZ8q3LIe/CWgJh9SvSEo+9?=
 =?iso-8859-1?Q?oGvnUEMyXj+gTsh0ZJm8zWc+kFZhK8k89gjwrrLVKpRdic0lSyKNfS1El/?=
 =?iso-8859-1?Q?JYZLEx//5GvITmAS43nQBv6e+H5PUmkkDUK5HMGoGKX2p4s0YdOeWqVMdg?=
 =?iso-8859-1?Q?k8dHXGaG2toLCm4nQvNVI43rd3y3qwZ96t8WY+5RfjbcQM4axZBSVAnguk?=
 =?iso-8859-1?Q?G7XePQjHYnlwCB3RxzlsIkkHTdTwK7n/pC7DDOd5oOrf+glYIxdOKTc/zE?=
 =?iso-8859-1?Q?R6U+pdSg/RZxCt/XblHZEBzMft+vYPX/LgUUJe009f6WrMcSq/dLmG9HM4?=
 =?iso-8859-1?Q?fR5EbbMPg4qpkahzjF/4Gldw8cxHIjV04QqH4eNqXUYuts78zGnBsKBm7y?=
 =?iso-8859-1?Q?35jL/tpHwhUQ6wxg7ZSjPeQTw8CdKHCcLilmGYJ+Jf8oN0MNs7sBJ6EAvK?=
 =?iso-8859-1?Q?tfyFGNZu1Zf0fVP/d8TBA96Zqusaiogv+O4w4FYdpxB7YJ3Tv7IecJlIDR?=
 =?iso-8859-1?Q?+gYFwo+bMtYI7hhW/+GB11xGFiQoVQ8OgOeE8CuXsACqVqjNgQNG79qBWQ?=
 =?iso-8859-1?Q?0vaX4Z9vajsINadtvD7aJ9A5jwXPuAMbIcUNwvXhWJWtV9wbX0cOeemz4x?=
 =?iso-8859-1?Q?DbgX8PX3v/61KaEWehTMCi8Ab/RyAIg+C74RK2ZkR/sh882DfGmzu8PPQa?=
 =?iso-8859-1?Q?ir1wnJJTxAqyHpgYgo+1lFl+7iukkmIvMvOMupMsXPK7UapE3sG3+vrmBF?=
 =?iso-8859-1?Q?8hYMv6PzCjDp1wKyExaVTlEjGjfZnEwOL8eOEXv2MHVGMMZHkPayUvO7f2?=
 =?iso-8859-1?Q?z+tTq4xlq+Fx2nmIWP2h5tg+i18Pw3aaEuK9Ng9tMF1JOYqmQAvCqPXBpj?=
 =?iso-8859-1?Q?+sHY+uhitSzIi7VY9nJ07WRDjdTkr2Qgcd7qPkJBdNAi4nYt3ROojXAJ39?=
 =?iso-8859-1?Q?MucXeYz6SiJvB8eadx8xaMqdWgVi5FpSyHl2wCKt/gpIGc+KQIlNDJSyEQ?=
 =?iso-8859-1?Q?K3JGK/mPiG0ox8VOwjFY/aIZphBCxidNI5H9I8tnoMuYNM6a7IceHXX70P?=
 =?iso-8859-1?Q?n5q/V14riNEAyjnguJtn7Av6DTRjsdveKvo87AsAxomNll/PDxXzjY64P/?=
 =?iso-8859-1?Q?g31nsw+gAe+Q7n4BzaSFRRfl5rfOaZyS4h9S+wOhtus0QwzPBpqq4UlG0S?=
 =?iso-8859-1?Q?oYAvsgI/s2wYTySdBU1/45KyhMihU3c/we44BseeGhgGcAnOq3utvjmF5x?=
 =?iso-8859-1?Q?4pyfkpcW/cD+kWjWGVKVYpUFmXR84RaOxXUtSQIvNU8ZO1gP9103ud92dV?=
 =?iso-8859-1?Q?HFSxxoHB21lbjfvM7sO/V4SlIWHAzMuRN5B989vSDAv9HAbuJaKCHN17G+?=
 =?iso-8859-1?Q?7y5MsAQ+apBp+eFojvtq29M6YtT6O0zhl7kcYb5lGwWWaJ4QuG7bOnbT49?=
 =?iso-8859-1?Q?VR8hdeRm0ULLcQagFTEaZrSW1bybRONJIaTSMLSCUihHDR7o8eCE03mggz?=
 =?iso-8859-1?Q?N7rsLDFpcT14ZiigNRKjCagkX177cvKj+h/PBDL1qFvqu19kSD8eah0xm8?=
 =?iso-8859-1?Q?C75wcitGTk1lJyh6KxgR7Kmsj1r8on/lJZZSj9LDrhtwjc24k/hj6qPVir?=
 =?iso-8859-1?Q?sKVUcpLrLlu2Y2WdD3L+zNoQlDokxa++kqW29wt+1MVKutHeqBvlfUPg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7fa88b-6177-4504-c360-08dcffe09338
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 10:31:58.7316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E65Z1bXZnI7UuAz8O/1QwtR23t8H2fACf2KkcOuqLqkSRJx8uqZmBYjtVcIbhRu8f6NvyF1VWFc/jgVPC3P5pc0K8ExT+OWqLe37i9w5CLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7813
X-Proofpoint-GUID: pvxx6u08jDh1f502WbHhnOSiF0kaVNoD
X-Authority-Analysis: v=2.4 cv=BqvPwpX5 c=1 sm=1 tr=0 ts=672de8a5 cx=c_pps a=TXs1g+7sIME2BPo3OSn30g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=VlfZXiiP6vEA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=19NgvEGcTR1uuG0R9uUA:9 a=wPNLvfGTeEIA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-ORIG-GUID: pvxx6u08jDh1f502WbHhnOSiF0kaVNoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_08,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Reason: orgsafe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023227_149230_E2D9FCFB 
X-CRM114-Status: GOOD (  10.04  )
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

Enable ARCH_BLAIZE_BLZP1600 to get proper build coverage.

Resolves: PESW-2604
Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..7d368a8911bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -43,6 +43,7 @@ CONFIG_ARCH_BCM_IPROC=3Dy
 CONFIG_ARCH_BCMBCA=3Dy
 CONFIG_ARCH_BRCMSTB=3Dy
 CONFIG_ARCH_BERLIN=3Dy
+CONFIG_ARCH_BLAIZE_BLZP1600=3Dy
 CONFIG_ARCH_EXYNOS=3Dy
 CONFIG_ARCH_SPARX5=3Dy
 CONFIG_ARCH_K3=3Dy
--=20
2.43.0


