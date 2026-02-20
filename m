Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9264AC56206
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmZSCq/h+oD47ZnnQ83+bbQFXbv7emC+D65qZgGrPUY=; b=AcfgWpHLvNEe8H4tnKtEVqky7n
	cEHyZFG051TAL+5wJJ7rk5SmQ55x2HKvex7AJ1q0woOgzO0d5rDjwXS4Q8q+kKyh9FQDJg1y1nf8k
	yCZRxXnZ7b0UmjIl4qFa8nm8HlsIN1G3v7ka4JmJfy1eSM3H4SFijMuPDmTZtNljLFHeQDRskQ5uC
	W8310kHsV0h2Z5rk3dy1d1dbSRMtYp0/IwYBzkf49441liPmwSqAWcxs5HkNS3Op/BIVazSlhlYpc
	xJ812NhObRLHHvtPkLB2uOyDsiMMNa4G87Vz6HFg9vXoXHpWmPs4tdTFD2A1pwQmwpuUpdFKHBJhD
	DKxDNncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSN6-0000000F0go-185X;
	Fri, 20 Feb 2026 15:24:48 +0000
Received: from mail-francecentralazon11013054.outbound.protection.outlook.com ([40.107.162.54] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSN3-0000000F0fb-2R3l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6SUMhS3BBOyt8oaCRWkUjvClZ6pr3Cd4b/fkZlblS3lGuWFtBbZwHeDNHuRRKkpV7ck5rSzngINe0XwMn4CkxquB9/1n39o05PwDRQatpyP8VsBSlr5mR/1Clfg+mMcX34gy9Kfz0UA0oC9yujadqu6xg4bKATobNtHEMdVLtLLEPjVDuKpmSsXATTekmN/qMbJXi61CEXW2vtlDTISlf3e5dghQ1Agjttow62OvTc+Qo30XPW8IyBkaq4ehK9KvMhJobyHO/2hzE+8F/OY5+i0i5PW6JZ9NoY0XhsVUejlCUEjlv3VNizSgb3tpJH78s6tmGDEJ0aLFoMyNMuQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmZSCq/h+oD47ZnnQ83+bbQFXbv7emC+D65qZgGrPUY=;
 b=upUIadAclLHBceOC/TtNl9KK7QdPUPkTHkurfXyW+VE3w6L3tQLn0b88l5DynTUgsZqIEUHOBi+YomcPjAMMo4jTXVQ6dDAoztVRtS1Ao7++JFXzPZ7JxcTif0NoJT/NG/n57JsxELjWRpyl28MKFLBaER90w/sX6up39uOi+mtgwYRYwCM7FxGeR0xIC9QisJdGUVq3P9HinOhbhaP8YkIG7dwmtVzLnTueRcKRpAjhgN/D1uCefFh5tAkZPSfMlO/Jd629VFJlT+MCiXCTNJ29LCl0NpGrWpqfbj2m2bmrwW2jpYA7mJwRhlD9HUwvHFjGbzGFzr2R1iHJ3yt5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmZSCq/h+oD47ZnnQ83+bbQFXbv7emC+D65qZgGrPUY=;
 b=DH3sMhtLGa54uRjqDWmDkIUSUbeTmI+LJFxoj7ZACayywNJAz0aS6aOnzy1qEgHLFdn0lHohbtqFbCg4zbZNuzuyZ+7hcGxxCWmUhQEPQCUIZTgLH0oXul8iHZpjkKTSL1etV2oI0D0GTPI3sv1G8sBY716FdILyK87jnWt4QQq/4BZmKExp290eQ7cdmEXu5LH5q4ZHyYBxXRYjMUEkUgIfPXjkuZz/vJEN3Ka+3Da/f8iVa8cswcTmc1Px14tsPCwo11/IdqaEYal7RTsANxxytP/mfqifbenXyr7zlgpTud93lFVqrD9bLpmgCuNTEoLxUCEpRA3AJUjy1iNJAA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:24:40 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 15:24:40 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>
Subject: RE: [PATCH v8 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v8 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcnGfUhZI7lEl4VkWu+RXiwBi5ErWLWt4AgABkHQA=
Date: Fri, 20 Feb 2026 15:24:40 +0000
Message-ID: <PAXPR04MB91858CA74E93D06F5CF589058968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <69de4747-fd38-4d04-8831-c538cd758566@oss.nxp.com>
In-Reply-To: <69de4747-fd38-4d04-8831-c538cd758566@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB8735:EE_
x-ms-office365-filtering-correlation-id: fcdd9963-1b54-4f29-397c-08de70942a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?Y2Q0b3RGR2lXVzVTaEdVaHFMcms4bGp5VElDSWpEZEpBRW9VTi93ZFpQU0JT?=
 =?utf-8?B?VERBTVRmYW10MlRteHp0cDhSUHpwVmtjdlliVnNVbGNieERwOGJoSlRJUCtz?=
 =?utf-8?B?TWNiSWJHMEVtZDhLdVUyNGtSWThOZk1hd2V2SE90RDJTVUdEUjlLOGlocjVp?=
 =?utf-8?B?cUhPTzdiRUVPaldKS1RZR0o4QVJ0UmV1UExVYkMyQnFxZ3dGcVpSaXM3eHMy?=
 =?utf-8?B?blVrUGx6NkVTbEFKdGJYNGVCY3IyUmdJMFI1U2R6RzNoZnl5NkFDSWczLzV5?=
 =?utf-8?B?QWgzcVowWGl6QURrS3c4eGNMQTdsd3Y4Y3A1cjludHgzbC9CZW9zdUl6UWtJ?=
 =?utf-8?B?RWFWaVZLUkJienVwcEFzT2hQNjVGakJlSDkxOWRMYzZLYjhCOVUwVXB1S2xw?=
 =?utf-8?B?aGVnTTVUWUxnTEhyR3haUkdIQ0hlYlRJNy9yNERqQlNwcjNQSkwycnZpWFl1?=
 =?utf-8?B?amFEY2d5OWorNno2KzdsSExuWDdJL055dHYwQlE0QWNuamJqWjI5TGxlbHUw?=
 =?utf-8?B?OTQ5Z0tLNkNPcG5ucTdnelp5SmY0VjVrUW9Fb1RlYnFKVzFiejFzYmtSaVhp?=
 =?utf-8?B?QkJMMzhiKytOY2k0dFBtOFMrWFNpemkzRFhBejQ3VnlTWm5KVFRDK0R0Mi9H?=
 =?utf-8?B?UjhmcHBVTzROTVZjeEttSm1CV0xEK0pJTCtaMFp1N0lBVzhKNE9uUWlHQ0JJ?=
 =?utf-8?B?aFpRdjFBYVVWdU1kYWoydnhJVHNKYVFTRnlTbDV2SEZRTWhobWp2Zmc4TENm?=
 =?utf-8?B?b09YcVhqSVI3c1puNU1MY0NPWmxmRmZVcnByTEUzem9DV2dIYUdPZU5Xc0R6?=
 =?utf-8?B?ZmZFL3JMTWNsejE0dHhBRzVzMWsvdmVISy9rUzJWalJHcWRKYVE5ZmN2WHJQ?=
 =?utf-8?B?ZXVSakRmc0xkWFBRTjdwOHpySkZ2bS9YT3cyYTl5ZjFFZVFOOEpqcEZlL24y?=
 =?utf-8?B?c1l3SW9wdmtveFp6UWxVM2lsVVJDbUlOU01ienJ1S1dwY0pMeG8vd1F3YXNY?=
 =?utf-8?B?d0ZEcnZVajYvZWQxcVZvdXo1WEwzb1RUc3htVUJ5ZEV3SmhSeWhxTXdOQ3Y4?=
 =?utf-8?B?eEk3bDZGYmo4MWdQaEUyUUN1VFA0eDIyL0hldzJuK3FJSjR6SzJHd2tHRzlx?=
 =?utf-8?B?U213Y0dHSkRoRkFTUkgyN1I3bjR5c2doQXkvVlY0TmI2YUxEeU91YmVHd2lm?=
 =?utf-8?B?c1dHQklkSitYb0NIMG9LZmFTZHlDWGJHbVBnRzViWTg2elJFMTJYUWxqaEhm?=
 =?utf-8?B?WHg2SGx3T0dBOUlYRlJrcTJSWEhWdFRpU0pQTVUwVS9nU0piejVPeTcyY2JF?=
 =?utf-8?B?eWdCeFE2TVdDRE81Y3BjQllxRjZ4S2tkMmdhQXFWQ0ZyS1NzeVJkME1QT29V?=
 =?utf-8?B?V0NaWExtREhmb1dtcjRLZmNxR1RLTC9LS3FlanpRdTcrS3BUd2FKU2ozNkpk?=
 =?utf-8?B?d0t4Ry9aOFdQd1luSmVaT3Z3N3NiS1hEbE9NdCtqYlhlUHJNTVRITkpDaGlC?=
 =?utf-8?B?dHBpZXNxYzRVZXRVWnlUalF3UzZEaWlyVmN3MXdhQnhOcGlXejQyMi83WnRV?=
 =?utf-8?B?Z2xnRFZkdFg2bmdjU0NadlpFU1BxOVcrZGIyc3RlOTZCZmxDY25acURJSmRq?=
 =?utf-8?B?cUNneGloTEVkZThNYStXM3lDbWoxb0lGOUF4a29HNkwxenFtQ0FMLzE2V0lC?=
 =?utf-8?B?RVFpRzZXeURKdHhzdjlMTk5EekJ3K3pFSnVEL00xNG85N1ZEN3ZOTWh6TmJK?=
 =?utf-8?B?MndoMFVRRnhqMkx0OVpLRXh1NkdZaUJnZXhYS1V6MWlhbzNKTkFnb3dqQ0pq?=
 =?utf-8?B?NU9UaWNsekE2bmdWd0cwM0dCTzFxZXk5dDZERGI4UWEzRStWVlZadzhtbGpZ?=
 =?utf-8?B?a1ByWlZ6YnNONHBCcVFZcnVVY3oyLzBIK05aZGRsUlhOTGs0TXZiSlV2UlEz?=
 =?utf-8?B?VHZxV2hEbThLMEIxREcwaW9Fb0pXT3BvYWYwLzQvdzVoR0F1M3lWT1hpc2N4?=
 =?utf-8?B?aVFzTGhDVlA0NVRXN0ltbkk0end2cWUvNDI3U1hpbi85OC82VjhPZ1N2OEZo?=
 =?utf-8?B?Z3hmaE5oR2c0eFVNdTlFNFBERlZkQ0lUcjRadG5jS3FORTFLRkRlNUYrQWFy?=
 =?utf-8?B?eXFUejVqZVJsYUJBdzZSRE5JRjhOZEpYbWZVdkpOeUMxRWJDY0R0SEg3dUY1?=
 =?utf-8?Q?yfs2am2T3V+6LwebDDNDFGFnL+R7gjDLfRRJyBEOU0Ys?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUQ0NTJDMzZWVVA3THVuN3p2enVkTk5jY1Fld2UwenN6UUU1OGgrSHdsSWxr?=
 =?utf-8?B?SlJUcGF2UVBjcXpJSjVINXZ5aHg2dG9MVFFqcEkvaVd4Tk9zN08wU3o5Rzha?=
 =?utf-8?B?MHVpaHVEZzhzakxybmR0MXNrb051VTU3OFRZRkFsQk9qZnltZ1IvZjhVNkty?=
 =?utf-8?B?K21zQmZmQmlBOGwwTk1EYnAxcC90WmVrdHQ3QWxYdWswdjdyakpCWDBIRjhW?=
 =?utf-8?B?WnROZXExc2ZPbElNZkV6aXc5R2FrbHJLcDRpRUdrdzNFbUV5dUwyVzBvVXJ3?=
 =?utf-8?B?VHpGbTJyM2c2ME5JWkVKQk5WT0V6TkFsQ2QrZ3hCN1RMZ0gyNmdUZEFDUEl1?=
 =?utf-8?B?TXdteTVFZDk1NjNHVFZUYkNQUGRCM3Y4eFlGU25lWE9IbWR2SVh2VCtEYllO?=
 =?utf-8?B?d1pScllLL3ZIZ3VRZlpabExQUXlvdlhSQVlBTm9SOGh1aGJObWQ2U1pDTVNj?=
 =?utf-8?B?Y0FzVEFwU2hWUkFjYWFkOEhnVWVidkhnb20rRDY5Q1lySE5MNVhFUGhUUDl5?=
 =?utf-8?B?Z1FLNFU0aHo5bGpjOTZ2azJLWlpCalczQWRKOVg5cUZidUlNWkZHVnh3MXZQ?=
 =?utf-8?B?WVdTSDhKczNaYjQ2Q0xvOE51enUvdzFaQlJ1UzBaYkZkQjNxZEYzNExDZG0r?=
 =?utf-8?B?eDVmeE9XaWIybDNkMytxb1FnUmk0Z3RzeVBVclFFS3lXdEt0WUFpZG5BTjZu?=
 =?utf-8?B?VElpcUIwUkM5WVZwWUx1R3BVTmRkZU8yTFk1eENIVy9QTldlbnRMMjE1U0Ri?=
 =?utf-8?B?b2NuQk8yVTMrelZiYjlEeDhOcnVDdHZ2Qk9HNkZwR2lIamhpMWEyT3pjK1Vo?=
 =?utf-8?B?aW5WQWJYSmovc0pBRm5zdmxoa3F3MW5pUVk0dU14S1hWN2VrdjF5OTY2eEt0?=
 =?utf-8?B?cWdTa1hIZVVYRmNmZFIxWnowaXJZdjhhLytxQkNERDNGRzQyZXJiczFiZUZB?=
 =?utf-8?B?YzRVd3J2cmZNMDNzZjA4UHUrOWRzdnkrclhmeUZFQ2ZEMGtYUEN5SFdGNFZx?=
 =?utf-8?B?NFVaQkVxVjhJWjhoRVRnVUxRMlQ5T0x5R0RtZm9VTkdVWElCV0tWKythZWJw?=
 =?utf-8?B?alBMZzFwVXdPQ09neHJ4bVR4eXhjRzN5dHdVMjJMcFJjQXpzQjhibGQwd0Nm?=
 =?utf-8?B?SUZaRHhOeW5henQ4ZXBneWFrTCtSaFRZM3MycWpiL1dha3dBWGw1VzFEUDNL?=
 =?utf-8?B?QzZTdFRheGpYU1dZSGpHYWV6eU9YU3FWemc2ZzB4R1J4U1Y3VDVzNkVqT1Mr?=
 =?utf-8?B?NDI2SzMxTmRBUkZKSEJXV3dRb0dQenl6OE5iVTF1S3k1Z1BqQi92VlNWWTlB?=
 =?utf-8?B?dDBqck5NZTRvdnYrTGpnZUhaWk1jTXV2dktLZUsyVVVVaGVzN0lsRm1Ta1dJ?=
 =?utf-8?B?VUhoZ1VOVnUyT2xvQ2hubXJjMHJhZ21oN1I4NkliTUJrN2xsL2w1M24ySXZY?=
 =?utf-8?B?QTRsYmFLZ0ZmS3JpVHNQaVh4QXJBUVVqOVdsM2pHTGx3WG9rbzBGWG5HVGtY?=
 =?utf-8?B?aDhpV2ZEK0R6dm1VRTRyeERzNHJrWUtMbHVVS3p0d3VUSDk3b2ZPQmgyYjRV?=
 =?utf-8?B?ZkRXcnYzZmpIc3c0VjRpd3dhU3YrUFh0TjVoN0hYMVcreUN6Nzl1Q013SVFB?=
 =?utf-8?B?YjVZSEdJeCt4SG52Tlp1bkpjeGtjMU5xdTBRK2Z3aU9zWTZIbXI1K1d1L2xw?=
 =?utf-8?B?M1pibzNkYllOZmprcVdWRDNvc01zRys1TnZibWdGYVJGQ29IWUFHaXVuTVpk?=
 =?utf-8?B?UysvRlUrdFU2bkJ6d0llOU5SUFlmaDljQzhNeFRBRmxRNUsxeFN1Umh3MVhw?=
 =?utf-8?B?ZlZ5N0MyRDVUa1pGSzVzUW1SQzRxZWtKcTdWK2QreEVqbXEwd0xMUVdtUTdh?=
 =?utf-8?B?MURoOVNQMDhva05iUHBpamNyd0V5RHJFM1A5WmRCeEVkOXAxUjJzdnd3aitI?=
 =?utf-8?B?KzZ4YmtoRHF0eFE3TnZYNkgxRi96M1JaQ2F5QjZ3KzV0VmNqTEhDVmhnTTNW?=
 =?utf-8?B?anlVelhJcFN2dUVYN1lRTDllc2pZSDFWVW1XdDkycm9TbGVDaUZYdE9xWmx4?=
 =?utf-8?B?Wjl5YUJtL2U2YVdQVkNPM0szN0tiS1pXWEVBN0tkVzVJOUdjWnUvMHdvKzYz?=
 =?utf-8?B?UHA1VWtFWXRucXBWMjUrZmlEck9HSTVYMk5HelJ1SG5LelcxTDFIZEJJOEo4?=
 =?utf-8?B?KzNRbXJ4d1BOcXBIM2ttcjBKdVlkQU9DYktYZ3prbXhNK04vSW52Z2ZLUWwx?=
 =?utf-8?B?K2d2TkJFUmRqNW1WSGV2T0hjU3ZwckJib0tFMVJxRkZCZHAvR2hSaTZkeHFz?=
 =?utf-8?Q?P+ehWGom3TZhytUwBB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd9963-1b54-4f29-397c-08de70942a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 15:24:40.2310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk+OI0cewhymSytqZgOjyzjhLnvjVJ7jVD4POEOj42u8b4eqzN/pWbmfwPR7mrIFiJgEnkgrJooZBEo2i+EHCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_072445_643825_63629124 
X-CRM114-Status: GOOD (  14.90  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIEJhbHV0YSAo
T1NTKSA8ZGFuaWVsLmJhbHV0YUBvc3MubnhwLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFy
eSAyMCwgMjAyNiAzOjE4IEFNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAu
Y29tPjsgTGludXMgV2FsbGVpag0KPiA8bGludXN3QGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24u
bmV0PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IEJqb3JuIEFuZGVyc3Nvbg0KPiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBNYXRoaWV1IFBv
aXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxp
QG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBT
aHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJv
bml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGVuZyBGYW4NCj4g
PHBlbmcuZmFuQG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1h
cm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPjsNCj4gYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY4IDAvNF0gRW5hYmxlIFJlbW90ZSBHUElPIG92ZXIgUlBNU0cgb24gaS5NWCBQ
bGF0Zm9ybQ0KPiANCj4gT24gMi8xMi8yNiAyMzozNiwgU2hlbndlaSBXYW5nIHdyb3RlOg0KPiA+
IG1tZW50cy4NCj4gPiAgLSB1cGRhdGUgdGhlIHlhbWwgZG9jIHBlciBSb2IncyBmZWVkYmFjaw0K
PiA+DQo+ID4gU2hlbndlaSBXYW5nICg0KToNCj4gPiAgIGRvY3M6IGRyaXZlci1hcGk6IGdwaW86
IHJwbXNnIGdwaW8gZHJpdmVyIG92ZXIgcnBtc2cgYnVzDQo+ID4gICBkdC1iaW5kaW5nczogcmVt
b3RlcHJvYzogaW14X3Jwcm9jOiBBZGQgInJwbXNnIiBzdWJub2RlIHN1cHBvcnQNCj4gPiAgIGdw
aW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZyBHUElPIGRyaXZlcg0KPiA+ICAgYXJtNjQ6IGR0
czogaW14OHVscDogQWRkIHJwbXNnIG5vZGUgdW5kZXIgaW14X3Jwcm9jDQo+ID4NCj4gDQo+IFNo
ZW53ZWksIGRvIHlvdSBoYXZlIGEgZnVsbCBleGFtcGxlIG9uIGhvdyB0byB0ZXN0IHRoaXM/IElu
Y2x1ZGluZyByZW1vdGUNCj4gZmlybXdhcmUgcGFydC4NCg0KSXQgY2FuIGJlIHRlc3RlZCBvbiBh
IGkuTVg4VUxQIEVWSyBib2FyZCBieSBkaXNhYmxpbmcgdGhlIGRvd25zdHJlYW0gdmVyc2lvbiBv
ZiBycG1zZyBncGlvIGRyaXZlci4NCg0KVGhhbmtzLA0KU2hlbndlaQ0K

