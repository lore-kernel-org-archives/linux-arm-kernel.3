Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2535CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3q3Dy0DAnIHJDqyPhcrO004vERKETCp9ZTy5LK+Y+M=; b=b4bneju8Jq769bQ2VhHx07U4ef
	oyzg+U7tipA2Vu6NXr+d1jnd3ZJG2U2NdwP8NmQhwWecRUtHGQL/qN9RFgvN7oUS3BlXRApgCAaOj
	5RehyVBx4MYwToQiALnFBS0LJj+lVGSv+G1DWxgBsl3k/2aC/2H1ox6HAq4J9uAqRCiWDdS+Wyqla
	EknnOcRWVE/7mVO7wQEei6VWONkbd4vshSZKBGmmXHLWTJ/9PoCfwID4rPin9p6z7bMNWUWnNMH1u
	WOlO2J2gCK6jTBsqlkw5uZlVwrrSCDe/qTc/cnYs/ylZvvyNGmi+ZZyF4NnWdcjy/jgj5CckS1U23
	9fl1eu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63Dg-00000001c0H-2Nj2;
	Tue, 07 Oct 2025 08:38:52 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63De-00000001bxn-3drm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:38:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS/m5W9YFiiN1WAoy0ieCLuLS3chpr6lscI/OTxH8Pngsli9W2lCJREVn+m2+KtQATAANhz62Ma4vnJky8CEQUQtMIxrwbGhgq8kOIufvzcBd+Xca7jVDRR2wB5peR3cYA15+5kSGuzjcWhCCMz6ZaiUHw9al3Y26Y40dFphX8ui79g5cqQb3FSgz51UZ7KKxJQIXVvJ3tBAlNs4MX+kIU4kBvU6a2AibStzSz3kgzajVakLKW7eTj1/tn1v5QMFKD00sOqTnNbPCOpKQuNxwNSaOgzLWU6DlfX0nEs04XAy+xFk+IpSfGc9v8MVgM1cuU64fcSwqnXTBoETV54Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3q3Dy0DAnIHJDqyPhcrO004vERKETCp9ZTy5LK+Y+M=;
 b=cIXNj/bGQxRaooqP//cVrGdrJewR8ZBdev8DV0LyPHqwxqsG4yfg6aTxM/7Sb1TM83QhyACE+j2H9P247QjUe7gNd3vabF8y+z/wqv8IuvP5JfkBSxJnaQdW6xIxyTrSUeOTUifKgvtBcdtC4F11EvqWcHd1fnAlO6z/HRQqFUsYCxwnK9CVtZhLFyXOwB5HQhMUEM8itUjHKNhH0E9BX80jq3i4MO4VwQ0jqcwmGxD+owmyZWX0csnvnGZqRE/BVr57Zc/gah22SJabltp9kNIjmE1t9Xztpr6pUoH5K1cfH/hRmLF0I9nWfldhrvn/p+Gbzd0YqA4hFg/+Y1G50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3q3Dy0DAnIHJDqyPhcrO004vERKETCp9ZTy5LK+Y+M=;
 b=e83vlMIY/Utn+v+DKl54ukTObAbJBxXtLG2YVtzh6k+KvzI+cK4ZZa98uUrkXG0a4eEph1iJwCKZLrpgn0Qdyf/AY3HIOk8UTwaoVJKUQuFV7oP5515wL+GDnlD8gpv1ddTrgXccLmfOq8ybJ8uYn1J5CO2DBzIkkJQQSYH6yKyylEi39s91Wu24jbhc4Onm6xSTFCKqLrBEzsHqg1LUZlu2Wt/MRSwP/drjRJGQJFvm4W6c5hkpc8Y5qi2Avnwde3JPnjBAeDmC0bcO+5roKnhFm6IBQOQlBs44dlkzS7hQ7HEaHjZjggAwQUojfoOySlQOTsnfMmjGgOGBrC5jeQ==
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::14)
 by AS8P195MB1877.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:38:40 +0000
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56]) by DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:38:39 +0000
From: Teresa Remmet <t.remmet@phytec.de>
To: Yannic Moog <y.moog@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [Upstream] [PATCH v4 1/4] arm64: dts: im8mp-phy{board,core}:
 update license and copyright
Thread-Topic: [Upstream] [PATCH v4 1/4] arm64: dts: im8mp-phy{board,core}:
 update license and copyright
Thread-Index: AQHcN2JVOHHgq2yPUE+TELxKqd1wsrS2XMqA
Date: Tue, 7 Oct 2025 08:38:39 +0000
Message-ID: <1d35dc97f00871df929a818c4721ae59ebdf6d48.camel@phytec.de>
References: <20251007-imx8mp-pollux-display-overlays-v4-0-778c61a4495c@phytec.de>
	 <20251007-imx8mp-pollux-display-overlays-v4-1-778c61a4495c@phytec.de>
In-Reply-To: <20251007-imx8mp-pollux-display-overlays-v4-1-778c61a4495c@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1228:EE_|AS8P195MB1877:EE_
x-ms-office365-filtering-correlation-id: 67e5de6c-d6de-4dcb-1a58-08de057cea56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bDV6V2w2bmwyN0FScHFTMkJSdHJmSDRkSGRGUzg4blZWYkdKS2V6Q0plTkxP?=
 =?utf-8?B?YTBRVWpyUUNId2ZmWW9BY29kcGQ1aGRweDFURnlKS3dLYnpYTHBReXRTQzBZ?=
 =?utf-8?B?SlJnQ1d3d3pLWkJFVnZLVDl2OG5kVXo1QVEwM010bGp4Vkl5amhQdGovZWRk?=
 =?utf-8?B?dFZwbE5yUXI1a1FMNlZyUkg1UEN4ZTRXODZlU3gzWWNoUU1pNCtNNjhHT05M?=
 =?utf-8?B?MEJCVU9YV2tnT2o0QUNmVGJPK05YTFpNL0FoVHdjdDZKQzgzWGRYV3cxbEFp?=
 =?utf-8?B?MlRDVHJHL21MdXgrWjArTjZmdTZoeWdBNGMwcnNkck5nOXQrS3lGQmltekRu?=
 =?utf-8?B?Vm1OSXVpQU40Zjd2akNxVTBYMzFLNk1EYlh1bHpFT21iV2FQa3pRZ0hEeGtz?=
 =?utf-8?B?RnM2MTVUVDR0R0dUQ254L2dJR0pDNVRIeDVpaHNhckphcnIrOGRGaE9Za085?=
 =?utf-8?B?bTZUbUhHU3NRUWlMNDVQMEhPQ09sM2ErOUR5Y1RJOGVoaXEyU1A5alRyRXQ0?=
 =?utf-8?B?WDVQQmh3Y2tabGM2NVI3UFZNUldLcjVZK3Z3blgxS21jTThBVDlnNVRoWHd1?=
 =?utf-8?B?S2tEc05QRzNGZGlHYXNQNGN4NzJlSlZ0SHJ4Ti9wM2JqMDJnK1B2eWVrRUVR?=
 =?utf-8?B?L2c4SHpTaWthb1JzZE9nWGsyNFlhNUtjeGp3aXI4a0NZUWpOUVVuOW5FMW1j?=
 =?utf-8?B?aHpkRlVuNjhCdkVsQVhjRW8zbzQyOG5vcGh4V0drbERHbGFyMjZyRmVqMUFU?=
 =?utf-8?B?QVMvTXJQV2VhR3dxSVRNQURvLzh5M1BYL1NDNGZJK1E4RmdLY00rcDMvcy9U?=
 =?utf-8?B?OEVWdURFY2Vtc0pjdUlMT24wbUJIL3lZUkhSRXpiTStvUHpHa0xDMEdBaFY1?=
 =?utf-8?B?dFZ3c0Q3TWh2RHNlQUNIOTBaMk5qb0YwWmhzUkdYS0NleE1yVnpReElyWkZ6?=
 =?utf-8?B?NHBSQ1NYL1VZWW00bUl2OWtlMjJnQnU0a2h0NGxnMG1jWUs0ZEdjZ3dDTXp0?=
 =?utf-8?B?aU9wcmlqQkVUeUtNVXhmWElqdGIwRncxMnZxRGNJWXJjaTYzSnpFd0lScmdG?=
 =?utf-8?B?ODFQRUh1b1QySmtva0M2WWROSUlUNzdTZGppSm82UVpLRmRCb2RaWW8yWi9x?=
 =?utf-8?B?VWlLMitmRkdBK1JXcUZhOE5GTWQxLzVCVEJJakpQcFRJWGF3WncxNjZlczg1?=
 =?utf-8?B?Um1sUGdVYTBOYnNOUUF3a2RPUGJad1VtQXVLN1llckZpMHNnc2E1bE9jQzlQ?=
 =?utf-8?B?RGhSenlBQnN6dVRrazdDSmVkOFFwSVRhNForWDAvVXlOQ2NmQ1QxTUMxanpV?=
 =?utf-8?B?SWxxRnVueEZhUDB4clBlQ0dDcU5FYVZmWWtWcWhXS0lna1h1YXBvNXh6aHNj?=
 =?utf-8?B?VGo2N29oVXg1STcrczJBRzlVYzVEWVhLU3p2eTFiNTg1YVJ3bzJBMHg1Szhj?=
 =?utf-8?B?c3kycDQvQ0svai82MDF6dHJ1ZGs3a2hoazJJTUFSY25BbGRockltRVdxbDR1?=
 =?utf-8?B?Wk5OT0RwY25mUllodnIwQVlOTU9vNFVQU1hiWi9CTHhKaHJwdDAxaFBUeVR4?=
 =?utf-8?B?K1U4NVdIZWhGaGJMLzREbTZpRGpqVHdWOG9YTzNvQTdzUVRDbXh2azZuZ1Er?=
 =?utf-8?B?eXlDc0I3SDJRYlI2K0RPQTVCK2FTN3BIQ2hjQldsM1Vqdm5jTXVVUHJqZEhu?=
 =?utf-8?B?dkZaMmwxRk91TXo1aG52RC9NajZZcVZqK041UVZwMzU3cEJOYnlPak44L2pO?=
 =?utf-8?B?QzFnbHo5OXZqRE1IRmJPY3p3dldtWkZrN0JuS25FQ2doR3J4Y25XTTdmRDNx?=
 =?utf-8?B?Ym1PWVVESTBwbm51QUluNHI2WmV2Z3F0eDJSTmE2eVNOM1Q3RFpVSHErdnhl?=
 =?utf-8?B?VzhZdm4yS1NwVWFzd2hycE1wTGlNeHlyS1JqcXczSWgrTEZNMWZ2UDF1U2Q2?=
 =?utf-8?B?eFBBbU5jYXp5dXA1aUtzNkhtTUh3aWVzbUhjYlVSYWlrVWdpR0dYR01ySlgr?=
 =?utf-8?B?ekhwSlY2emxsbFlsOU1ycFVOYnRGeEM4NEpJTzM2WkVuV1RJZFJ4TnhHd2V4?=
 =?utf-8?Q?2H+Rxm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1228.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUM2WmxaNjZWUTMxTFI2YkwyUWd6YjNFTjV0V2lZc05taVpRdWV4a0JNZTds?=
 =?utf-8?B?VlRBc3BFWm0vejhScC80NjRadmhFdXJKRTBHR2c2cjg0azI5SzNEdmtVeEd5?=
 =?utf-8?B?ZkdWOGo4aThPTUUyWktNMmVScXFwa29Vd3ZhQkRaVEhlcms1elZUcjlhVlhx?=
 =?utf-8?B?cnhVQ2Z6c3dlUHNzMFRzY0s5NVJBK2Rna1RMRHBrNnBhU1MyekhSY1FNOWR2?=
 =?utf-8?B?SCttYXFjVFV4RVEyMTlzdUU2RWpYVStSVm0rQ3B6L1ZBSENVZGJiNWZUVTdp?=
 =?utf-8?B?ck5OK21QcTRFZitGUVpQM2huSUJsekc5VDFGRmdUWkxNNE9ZUVRtVFJDcDAx?=
 =?utf-8?B?OXhCdXFiZGJyajN0ZUZoekROYVpyRFV4d3ZZN3VmM3RZUFpYT2tLc29tVUNj?=
 =?utf-8?B?aDl3cHdDczZ3R3MrUHlXUFFmRjRzVCtCcWpCeG5YZ2hhWGtvYjdwRlVpNlcy?=
 =?utf-8?B?K2pqdWhIYzlDank2VHFIUDlvVXptd2RRb3h1SU1DYVNJVHI3dTQ5QUZ6dlU0?=
 =?utf-8?B?U2VCMTdENzAwaStJdU4rcHdBQWR3QmZxK3MyQXNvSzgvUmdKQ3pmTERJRXRx?=
 =?utf-8?B?SFJQWkh4OWhRSlp3VUUvY01oQzEzKzUwUVg2ZDZqK2xiTlB0NUVJcmUvQkl4?=
 =?utf-8?B?QnBock1OR1lJeGpFUkhpY2hVZVVzN2FRSzRHb0V5cnZKRmxaTTBHbjJpSzNy?=
 =?utf-8?B?U0pMQVlkbDczY0RNQlliOEZSQ0ZURS9CMkUxRTRCbjJBbVNhYk9KRFBBTTV6?=
 =?utf-8?B?UG02bE5wQnArUVU2Sm56WmNXbFlqdmNOUHhPMWVNbDRKc3dHSXlzYnlBVTZ0?=
 =?utf-8?B?bXlhWEFtS0VvOUhwbnZRbkZKejBiMmpvWGVUY1NvdEp4M1h4T0tPN25jc3kx?=
 =?utf-8?B?M2RkUlFtdHdmYzNOT3kzSzRkUEg2UmhtbWUrOE83WEJOSnI5RUo3bWQ1c1FK?=
 =?utf-8?B?RHMvdWVQcVJnT2FyRUFIS2NRZkhscjc4eHZ6Yzk1RDFIT09lUWNGRjY5eitO?=
 =?utf-8?B?RUtUbitiR1Z3d2E5STk3dG9uYjNhcGJ1bjdWT0VWeXBBcHZzOHg5N2Jic0c4?=
 =?utf-8?B?RVpaQWcyTzRCUFI4YitWMDRINE9SbnlKQTUyQTRtVEJrMlcyOTBPRUJQME9E?=
 =?utf-8?B?dFVyQ0ZSdW1Ec2hLVkorbGpjL2UrYm83T3V6QjN1c2d3YTNaUUJxUGwvVFFy?=
 =?utf-8?B?aVZKWThUc20zdUhkT2R2M1R1N0FmcUJSTVg0SmdVaXFvVXhsMEU2cFlhZ2V0?=
 =?utf-8?B?ZnlLSGxyRTBuSW03VXM3U0lrVjZQSnU5QVRBRmRGMFFvVStmb1hFczczVVJa?=
 =?utf-8?B?TkUyQVZVMTdKYUhnL2ttL1gxSVNlNlRFMUloTXRXNWE1ZlZiNWxjOWpXVSts?=
 =?utf-8?B?bzl5SFdZSjl3dURvek5rN2xSOWgyRGdxeWxrOUlkY1FDR0tqc3lYekRET0Fk?=
 =?utf-8?B?TEY2MGdGVlpuck9JMHNaRDFBbm5aU2hkaTJmbEFVWHg1R1pLWnJEdlp4bDVO?=
 =?utf-8?B?TllueUlISFBoeG5xdkpoSXkxSEIxbWpCN2NOMGZzN2ltaUo5akI4eCtTaG5L?=
 =?utf-8?B?UElrQ2FKNEJLSVZjMWducGFGM0U5Wm1DS2FrRVYraGl4VjVxeWVDY05mck53?=
 =?utf-8?B?TWVrUVBncjloczZIZDcxK0NORU1kalJBc0pDMlRzTVlPYlZ3QXFheTFqUHYz?=
 =?utf-8?B?SXR1NjJmZFFVUlVRaEpVQjZqU2Nka2RiLzB1eVlKRjlZaHhxb2s3dURZdXZY?=
 =?utf-8?B?UG5PK1d5a0VNMlZlcFFETHlUbjV1MDJ5Mi9GcGEvOXVGUUNvZTkxWW53MTNF?=
 =?utf-8?B?VitUazN1RlRKcXlDNkc5Mk5USHV6TnczeFlLOXZucVllVytDK1FDNytKZXkr?=
 =?utf-8?B?OGVKUGJSNS81TWQxWnNyZll0L2pEaXZ6YUtyTUZuQXRoN1BRWnJLRWFNOGpY?=
 =?utf-8?B?cisxR3VPdngwSmY4OGhRbzN1RXcweG9rRHdtYlk2RE1nMXNnYTlSaUl3UXpD?=
 =?utf-8?B?dS9EYkJMTE1CMEZyTllMYk1PR1hUalU4WGRVYVd1NlZ2dDdiMXlLUDJOL3dp?=
 =?utf-8?B?YktKTitlbU1PbkI5RHptcUx4ZlNqT0pUcklsY0tiNzI0QTVuZHBFOHBnTGpN?=
 =?utf-8?Q?AEwu7EQoCXm9+A1eG1CeXdIDM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8A3FE1765945A43A94D36389B1124D9@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e5de6c-d6de-4dcb-1a58-08de057cea56
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 08:38:39.8384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tm3yfUvKJQsCUZt0BMfYG+JZt+QIO+do+3Qnf+WMcgiQVBfbLLN8YBXLcSb0UiDMIrHN8TF3OkDZJ8fH5X7shg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013850_941002_49998C6F 
X-CRM114-Status: GOOD (  14.76  )
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

QW0gRGllbnN0YWcsIGRlbSAwNy4xMC4yMDI1IHVtIDEwOjEzICswMjAwIHNjaHJpZWIgWWFubmlj
IE1vb2c6DQo+IFVwZGF0ZSBDb3B5cmlnaHQgeWVhciBhbmQgY2hhbmdlIGxpY2Vuc2UgZnJvbSBH
UEwtMi4wIHRvDQo+IEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlULiBVc2Ugc3ludGF4IGFzIGRlZmlu
ZWQgaW4gdGhlIFNQRFggc3RhbmRhcmQuDQo+IEFsc28gcmVtb3ZlIGluZGl2aWR1YWwgYXV0aG9y
c2hpcC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pYyBNb29nIDx5Lm1vb2dAcGh5dGVjLmRl
Pg0KDQpBY2tlZC1ieTogVGVyZXNhIFJlbW1ldCA8dC5yZW1tZXRAcGh5dGVjLmRlPg0KDQo+IC0t
LQ0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xs
dXgtcmRrLmR0cyB8IDUgKystDQo+IC0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OG1wLXBoeWNvcmUtc29tLmR0c2nCoMKgwqDCoMKgwqDCoCB8IDUgKystDQo+IC0tDQo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWJv
YXJkLXBvbGx1eC0NCj4gcmRrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC1waHlib2FyZC1wb2xsdXgtDQo+IHJkay5kdHMNCj4gaW5kZXgNCj4gNDM2MTUyMzA4NjQy
MjcwYzMyMGUzYWUzYjIxYjllNDZiOTIzYzA0My4uNDY5MzBlMzExMTlhZGI4MmVhZGViNWFlNWJi
DQo+IDU2NDA2MGQ2ZmQ1YjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGh5Ym9hcmQtcG9sbHV4LXJkay5kdHMNCj4gQEAg
LTEsNyArMSw2IEBADQo+IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUDQo+IMKg
LyoNCj4gLSAqIENvcHlyaWdodCAoQykgMjAyMCBQSFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiAt
ICogQXV0aG9yOiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+DQo+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjAtMjAyNSBQSFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiDCoCAqLw0KPiDC
oA0KPiDCoC9kdHMtdjEvOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1wLXBoeWNvcmUtc29tLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bXAtcGh5Y29yZS1zb20uZHRzaQ0KPiBpbmRleA0KPiAwNGY3MjRjNmVjMjEw
YmMyZjM4MmU2YjllMmIxM2ZlODVkMzkyNmRlLi4xNDRlMDBlMTE3OTA1Njg0MTU2ZTYyMTM4MWEN
Cj4gZWNkNWYwZTAwOGI1MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1wLXBoeWNvcmUtc29tLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OG1wLXBoeWNvcmUtc29tLmR0c2kNCj4gQEAgLTEsNyArMSw2IEBADQo+
IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUDQo+IMKgLyoNCj4gLSAqIENvcHly
aWdodCAoQykgMjAyMCBQSFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiAtICogQXV0aG9yOiBUZXJl
c2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+DQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjAt
MjAyNSBQSFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiDCoCAqLw0KPiDCoA0KPiDCoCNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9uZXQvdGktZHA4Mzg2Ny5oPg0KPiANCg0KLS0gDQpQSFlURUMgTWVzc3Rl
Y2huaWsgR21iSCB8IEJhcmNlbG9uYS1BbGxlZSAxIHwgNTUxMjkgTWFpbnosIEdlcm1hbnkNCg0K
R2VzY2jDpGZ0c2bDvGhyZXI6IERpcGwuLUluZy4gTWljaGFlbCBNaXRlemtpLCBEaXBsLi1Jbmcu
IEJvZG8gSHViZXIsDQpEaXBsLi1JbmcuIChGSCkgTWFya3VzIExpY2tlcyB8IEhhbmRlbHNyZWdp
c3RlciBNYWlueiBIUkIgNDY1NiB8DQpGaW5hbnphbXQgTWFpbnogfCBTdC5Oci4gMjYvNjY1LzAw
NjA4LCBERSAxNDkwNTk4NTUNCg==

