Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F01CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alGgbI5dM7B5IcKcUfvIpMf+FKLOanNqVnIOlOEdg+E=; b=TB4ORclOaRPZHrbzMEVe6izhOB
	iM54Dt7QtUqF0Nxt/kpXXN5RJo4r6hnBreb5tJ3kjuR3BuI1524u6Ay7Cs9Fu0NxzUP59BRSgKLtC
	NazEvvA1ZB/r6/r+Ijy9Shb/8OIrw/deX1ABGIdZ8OWXfjJ9fDKVa4ABdCPRAO7pm/oMtFrhxVWRi
	YuyVL8ISs3olJWmCvv9zYOE+RyuEEdAeF63peji1Vt2wU+HvSaJM8Kq7aPDcq6aCnae4Q2lwPMfAp
	deRDC9/VHZZ0bFqeLd6uRy673qDbGhxhfbdFgZMjhd7dJpLfC/kRwP6JKLX4A3O6gn7Z1TRU2gKZ0
	N3WyuApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9Nd-0000000BAw9-16er;
	Tue, 04 Nov 2025 05:14:53 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9Na-0000000BAvg-0cNd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 05:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfI1Z+MdUJPD9Si3VSuVyYEio/k2TCZwaa+9ATVoFkbu06lf2Qu01GyKMtPM+vDvQ+kTDmbHUWNWB+rBZ6yHL/D6gpYbjlsZYONvakKnUegDaOJRerQFowsJ6YvCp6fhRixSAfaGi+9u7dWMnmVHG2ueL9tUuE0N8U80nPJh95DYghZTsD/7QGWN8UvwGHqzyscibC+StiiwiK0gEEc00pyNdeetzjHdahbFJ7IkuZEqYDS/CPm/mxV2soQYF8nhl3VN09HN7FJTSBjYQ8wD4KTQv1PO+LBlmnYNwdo+7lnWK/gzLPBWcNNX8NmygvtJTrm38L2i6s/ooaudJTOpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alGgbI5dM7B5IcKcUfvIpMf+FKLOanNqVnIOlOEdg+E=;
 b=XHCilZb14R+P7XkM2T/th4k1qOAYWb+BN04rmFRFAFnW+vu7qVt+FTysq6e5o9m2yVvhlaelSwxk2CIS3QAsIxKeekUsPxT3DQrkT/5mvuFlNlI11CzmZxvUdkT1HA0E5prPzeCIcZ9RMpuXhovZrxyOWHehslt0H+1GvVNxRuNlNfoQf7WmfybZV9OGWDAdj0lLRK485EagrLPIEu3CO+x8BHFpEDIc9FXj03diqfw/WpuYgBrrCA7fxq/V+MB29qEfOpBG67Lnb3Rq5XKvH/0uAH6zOARJFRY+JS8Bwz6H/Q+Cr89dT6eBpjqTxTh4mZ5hoSUurvezLXINwHKiPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alGgbI5dM7B5IcKcUfvIpMf+FKLOanNqVnIOlOEdg+E=;
 b=XxE4bMk5zwwl+CPFnp+jbRW0q4bC3f3mf8Z4llZuwUz5Spq6OeAZb63CVwgSEPwe7zqSRs8f1YGIFc3UioVKvDCNcSswsZBGwOhEYhPSAI3oSG7S7vWOqtmv4aheyiGSR5A2EdOJOlfX5X4M+T6xmUBQiUrqMGpKy+LSB9xGVRvIiF7gfbqMaJy1X4NFaMxSj64w7gNKRLcLR1amXibg6kuBM9IVWI5FOm50awCP43EtZ4sm72s8G4L/eJA3xdMTpgCMVbC0u98+mMN99TPmKGqITGdaijt+9i4wGk8Ph+4aP0U6vTPhfwePDpXc8v3DX9XBJwinY5uS56Nm4duZ+A==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR0601MB5655.apcprd06.prod.outlook.com (2603:1096:820:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 05:14:42 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 05:14:41 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "taoren@meta.com" <taoren@meta.com>
Subject: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Topic: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Index: AQHcTJUB+TmCwKSgIEaeQsrh+oaRd7ThzyYAgAAnFuA=
Date: Tue, 4 Nov 2025 05:14:41 +0000
Message-ID: <SEYPR06MB5134AB242733717317AAEDEA9DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <2424e7e9-8eef-43f4-88aa-054413ca63fe@lunn.ch>
In-Reply-To: <2424e7e9-8eef-43f4-88aa-054413ca63fe@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR0601MB5655:EE_
x-ms-office365-filtering-correlation-id: 8ffa7e87-ea86-4d40-d721-08de1b610f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?THUAc97zVaHxnxhjYAtLlYfzC5pw+mdw1BBxotRmK2auyVnNEQe5PX4TF9/X?=
 =?us-ascii?Q?CJtGpj/OzzudNmouRnYdJKs728qiTyojkf4TJYan8WcTjW+ZmsBeevG1ZUJR?=
 =?us-ascii?Q?WTxovsZkDOBKvCzFwHj6Y8ho3tqRUf6quOX1R75fNEQutSFulnIQGIKF6Xg9?=
 =?us-ascii?Q?vxjDxqPHCDFBQb94Py2OAe/GJDH6U0f+ovQc4AtSzK+U97B5XciV/ti/bC0/?=
 =?us-ascii?Q?fbXRfzIJMhK+/8bI7EA07QCdnOj+pBACXCgge4YOSWqkJkOwDSXhSW3AOxoV?=
 =?us-ascii?Q?zI7SkVgdyXc/PSdyslSu7Vt9giHG/vaNLYWL7Q6iMf8yoI2iIdefSlg9XhT9?=
 =?us-ascii?Q?IpZXmVUBYJR84rMbeaFL1pgnrVaTahDupNT6k+2UdUKLz3rfrLC+d8YWNFJc?=
 =?us-ascii?Q?MdT9J4iuo27wjuVqaYP0WWSKR1OdtK2zxvSbKOpNO6uSg6SIrZfEnq/xon7R?=
 =?us-ascii?Q?n2aoQPJSAheakrewqk5lOqlFnM4QeIlL5kvy0u19L8wQRIAcUs67qA/Kgi/2?=
 =?us-ascii?Q?xk/NPyTu+q7hfII4DlECKwnO5lr1U7tCEg2RDLCOTLJ3fAIvDlU9WwDj6WSI?=
 =?us-ascii?Q?NFxWvVuqg4BFb71dGIna1v+pm4UOFR/qH5Kae/wwzeT1cvCiaQgX6nNFKgum?=
 =?us-ascii?Q?4sk+hNs2SC+eQ2MMEOH1gV+OMLEbWAQGjXIUw9NhTfwa0O3aLVY07t2WDN1i?=
 =?us-ascii?Q?tbyjYxgmpSaDb6F+4iVybC664JE6RP54QVlGeQP2m9hIq1+D/2KF142hqHrm?=
 =?us-ascii?Q?rV0dOfDT4svPqcAbJwYE/ONzWE4IShp7uNTt32LCBWXEPkfDPOGZsJJD6riY?=
 =?us-ascii?Q?Y+1bVcgSulRfOd24ZcNVd8i0fGk46D5+P5odr05nUxQtIxpYCsM6QJ+a+b2j?=
 =?us-ascii?Q?jmvLjn2Pz4HZ2LyRzFMq3kwTCsIuZdOGl9HSyOWy/3E6p0M5scPPUfnbS3Qi?=
 =?us-ascii?Q?f2kB/RvngWsEewSl+CVM1kgi6M/Jg3ZMRsr47mmKRux2HvcCPz+s4NufiPpj?=
 =?us-ascii?Q?aq24rLe9DY6E6azi8mBmRDNVSouDIDwP0RuSEXjmtAO0Xf91+opdRSFy6IAV?=
 =?us-ascii?Q?xHg25Ru2ttm0UXh9hxqbprBiPlzj+JOxCfJTi1S0oQy0AeiZ3sabdHs/vJZq?=
 =?us-ascii?Q?l71wk7/41t01QA7nosH3gIiqaUChfMNH4sqjTumUKM8X1xkYZNFMgJ0532Or?=
 =?us-ascii?Q?E0r7KJ1MX7jNJcU/Xaz4XWTiiShOzqoykxpWGjiKFB8CWOyX/5D+vFw5kQ3b?=
 =?us-ascii?Q?11VlXaSm+zGnojwMh6p4RsvFgW7VyfArOfutpEzmUk8vUbyRs+Br+aC/8fRA?=
 =?us-ascii?Q?5FSwdIU+6X5s3MsSbYR3n284IC/wWlpdT4/Rk8BhvHIveU2QSGaS9hoOOfMB?=
 =?us-ascii?Q?vumoMmZqIZKQfyv6FNN65Rij6SKBdSgob0qEmvf9kw6nCTOVzsrHU/sVDE14?=
 =?us-ascii?Q?dEbz1iJlSuLJ/Ydri3E9WBMtHE+r1srZy9n86zwp6neANKihSzSULwanaWgw?=
 =?us-ascii?Q?4IrnkWJDADjgCV+9O/XBT7O4FZ30tgSvk33m?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yMF5+YiOdt7FFrK2qryqR5MrPKeP3hi9Hht+kHFL4OnHK2RBtNmBdVbg1PbH?=
 =?us-ascii?Q?n43vjw9jOe319fvE1lT6g4mU2mYx3j51BhzB6558UlaBL8CdbbGhdpaLJ9ww?=
 =?us-ascii?Q?RjORjGFHxBR2jBE0eSzqw8bg3x1tFCPZDs06wPocX3SZRC71hAzjrNVjVnMm?=
 =?us-ascii?Q?b6HhX0FvDXy5JRf6X0yzuf6kSCsp5lGMfP3UYR2rUH/92bKN7h6QGI35mwEs?=
 =?us-ascii?Q?uZzV7TRraUSdATLr9nBhjDXPrxrPgw663vSfDGnecxqOCpsPLmpzz6OoFVVA?=
 =?us-ascii?Q?D8YMQCbqyOxFt9M4mK82WpfIYIY522a7x6Q+2fGTtOb3wx6c+wtjNpI/8q2m?=
 =?us-ascii?Q?PY8e9zkSueL/Av2ZUw7EFBGFI4ckPMmiruV4Y1xRdYTQqBvGusmz3gtgBvq9?=
 =?us-ascii?Q?RCN3HXcXBDOXWhcHsQtnpIHAwF1jCdoTekNCXkB5eXhOLXQpyh2fKPe2iCsJ?=
 =?us-ascii?Q?E6T2Nv3xgue1pfxm4+ZjywImjgW23agp24xi9lFCxZWZD7NIVEtRiuK4YzC6?=
 =?us-ascii?Q?0wwX3gkXpdBmMfTAJ2oBbeP3JTTX0RAd8MN0cwNem8ffIvmxTo6bl8y6nnyj?=
 =?us-ascii?Q?k8vpfYWJDPQoxsdiP/fFCAt0ojt2XZnav123AUAAhyte010wRbqJad2Hsh4o?=
 =?us-ascii?Q?caTGEcMDug6wQV8n4d7f10UIlv6eGpGYNNNpW8VR7agId5QVAALaOAsFMUJ0?=
 =?us-ascii?Q?yzOiFAlEui+fTDD/7XvXhdqiap2y6OaJYxVglyA0IEGpjITRhOsrUA92mgCa?=
 =?us-ascii?Q?8oz0HYZ4Uo541dFQQfrQxs4M9sPESArD/cSGe1cElR+R2nyWNJMTwJY64ZAT?=
 =?us-ascii?Q?oHAlizrSAvUnHoM2o6FvMSXEl9FcmTAcXChdbF7p8EFRVoPK8W23hAZpONQQ?=
 =?us-ascii?Q?JuwMM7T65jmzsE8ijdRKsRPuOa0JXw7ciYc6ZdBH5AXbRJDRFGzmaODqxACZ?=
 =?us-ascii?Q?YiaqqJZiv4pKNmjxXa+d2NcD2aGjnRwjDwkcTwuiEl4vfWquhQzJJbZvuXME?=
 =?us-ascii?Q?Dok2G7zzRw7ArLRI8psIfTS9JuX9t3ibC5aGuc3v8VZ3wkWtrjlfsxcbdRK7?=
 =?us-ascii?Q?tv2Bp/97fc4R8JQ3nPB0jnejEtZOi8HgakZNY+p8VuxXAENtetTaUEZq0EDG?=
 =?us-ascii?Q?aHpR9bClFt5W2tTUROpfvCMUPA7ibwjrUlTJFUXBEyc9SejC3WbSM+1ExPCn?=
 =?us-ascii?Q?/kmwCHOgDKLC3q0FfoE6JgOhyZhOA7Pg7aciC/U6fsHak9iB0qpjZZLB0cok?=
 =?us-ascii?Q?/aj91NFGXExGhizrU5l0EjxSNbT9tllfWRtDP+e74UZKV4XdQDwvGi9n4DFJ?=
 =?us-ascii?Q?cl6xZo/uDQlpINmPd/zqou4bieoahg1YH8GKuuBuDWIfKCIzEuaYmYDtCuPn?=
 =?us-ascii?Q?oFKD1/Q8euPlUsWT2A7Ji2+sE7OBVXOQ1W01onHdnZaPr0F9nNmdjIMwHaDm?=
 =?us-ascii?Q?ONV1frfAahXXuRJ89b/x6kxCuJD+ApnbHPkU5MpWQpd/I97KRlflZuGfOr2z?=
 =?us-ascii?Q?O5EA72N/exAYwWchjLR35gXUJ5sHnIOlA5sH91pq32P0oVI2j7Dq9WvYgv3P?=
 =?us-ascii?Q?KV2SYT1LmiX0cUn3AiVHsarRYDpSKYB+j+pJbhUA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffa7e87-ea86-4d40-d721-08de1b610f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 05:14:41.8786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgv6r9MfkqGCgFZ9tRXGxXYTmNZKEq0UOi557YXY8hkHOJ6Omuy7QTaJ8ntloSTHC1HcxUXKIo1PFgruuilKc8hkZYV16069st2Dwb0lPPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_211450_213026_D177760B 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Andrew,

Thank you for your reply.

> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2600-mac01
> > +    then:
> > +      properties:
> > +        rx-internal-delay-ps:
> > +          minimum: 0
> > +          maximum: 1395
> > +          multipleOf: 45
>=20
> I would add a default: 0
>=20

Agreed.
I will add it in next version.

> > +        tx-internal-delay-ps:
> > +          minimum: 0
> > +          maximum: 1395
> > +          multipleOf: 45
>=20
> and also here.
>=20

Agreed.

> > +      required:
> > +        - scu
> > +        - rx-internal-delay-ps
> > +        - tx-internal-delay-ps
>=20
> and then these are not required, but optional.
>=20

Configure the tx/rx delay in the scu register.
At least, the scu handle must be required.

Here I have one question.
In v3 patches series, if the ftgmac driver cannot find one of=20
tx-internal-delay-ps and rx-internal-delay-ps, it will return error in prob=
e=20
stage.
If here is optional, does it means that just add warning and not return err=
or when
lack one of them and use the default to configure? Or not configure tx/rx d=
elay just
return success in probe stage?

Thanks,
Jacky

