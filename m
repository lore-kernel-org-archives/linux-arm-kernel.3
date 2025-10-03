Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB065CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lw/ZTTj3AmWpEHrJux6MPexTFOaAVs5bQtwXFRYHlZU=; b=jypX6bA1bCFJWidmdzTRdTCoih
	23Oyq9QdJYewcpjx9NfUykwLHsHGTqyq+If96X/JsMLXaMd40RNBvv01YWqr4jcWTjhHEdVM71QuJ
	SufSBbusv1/UwIAx7QYIUMNvYxlRIupdcNWbHRa40w+bu8HPXVDMGPrb9B3hx9Jbz0rSpEGe1BU5s
	He6uvXiJCNxzN0JKmqvcyQPBPJrVTl7uNvL3uMLoiJ9o68cHqW305Y8UcSa2SiVnGlGSs0SVvvjMq
	ruh/iMM2D+DrttcDq8C1TreW+q75HJKnIED0/kotLeIxH2Z0+V5mdGniJ+zPuFBsMHOJeaugTOMeR
	nwsfF2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g9Z-0000000CUPX-0IiH;
	Fri, 03 Oct 2025 13:48:57 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g9V-0000000CUPB-3nxY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuUcQhLVTPGf/MEhuM7unLqvsiIxtfU0MDrGmKT8ovM2cGolr4/aOQj1ry7kPCXmAxTdZ3Gi2lZzu4ByLCj+aeF5TadwvSK+2UI2BfzxaR4waFbRVQ90lI1ty+vzM/8S856rY+4ug7fIBaes512ZCxdi2WGDVqDZcYmkYwjNLYssn0Mfw0TcKp3oftKAOYiN6bAVFaN/2AiiFSwKLLIeenNJ1KT9z4LrGt7/ZR52rb+IM0hFKcPbTJ32cbADE7ywsBusenXfI+erM/ZhaqU48fuwcf9rINGC2eh4x8QOwaQ4C29Z5q65MItI4nn0mCC59lLGRkvAeve1ghuWk4/2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lw/ZTTj3AmWpEHrJux6MPexTFOaAVs5bQtwXFRYHlZU=;
 b=qpTyJUJhDIeOieUaDKJh2o9epmm143KDyg5CY6G9RtmPsR9PgcCFk76rHgfzRiPCAOMQ6rrQo3VKLwvDfyB4Svz207X1OLYMfDhZd77l2Ci4gbC2xB+NXJ6yJgmpCAjaToCDopzdi05sx9lmDIeLj5ys7a00YAeQ2y2GcHd6sfDtWf4wb4r+8eEpUURDRFRnQogamewTHQsvunkK5g4JOMOuKnf3l6tifXm0D98cHcnC9J/ymjSjKYfB9zif47IMfLLYHr3UdZkFrlsKLH5H1M34KzDmfCfeexlOyVc0MMVRFIL7T5x5aKfzBchl0vjLnFMRJI2J2TpbNnbDsy2Zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw/ZTTj3AmWpEHrJux6MPexTFOaAVs5bQtwXFRYHlZU=;
 b=lI1akb9yktC2I/OpRE9sKvTt7WgtTANlq18ZX5iVkXEYZ7g8z+UrMbDbDDROdSv3GqrHOsSxcPdb3aDkLWckJ5NlSE6JMhEZIIHK1xrYHejoB9zScWhrBs24ldkfs4U3kaYtVNdibO8TKACqxQAqYS6w+DrLZ/I3vyiODKJ+SalkLCpWW/ap5SJCVzjE5DSpCxPLA6xuZbdJIbBQbTf2bnd9aYHTHcV+bELc7c/vACuTHhv1MXMMkfRwz/OqopXPxFnf3lMGIpa32rKV0P/Rg1qnKDiaLPqVCTbim6uH2pZa1ZW1B7SgVxy2sdHkDtk9AnICasOHH9zTVgOY9OJ8pQ==
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM4PR03MB11056.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 13:48:39 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 13:48:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oliver Upton <oliver.upton@linux.dev>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly
	<joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Christoffer Dall <christoffer.dall@arm.com>, Alok Tiwari
	<alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] KVM: arm64: nv: do not inject L2-bound IRQs to L1
 hypervisor
Thread-Topic: [PATCH] KVM: arm64: nv: do not inject L2-bound IRQs to L1
 hypervisor
Thread-Index: AQHcM9+LYDnAyTjoxEGPXCTCBBWLLw==
Date: Fri, 3 Oct 2025 13:48:38 +0000
Message-ID: <874isgnlje.fsf@epam.com>
References: <20251002205939.1219901-1-volodymyr_babchuk@epam.com>
	<aN8S-8HJFLjq6i2M@linux.dev>
In-Reply-To: <aN8S-8HJFLjq6i2M@linux.dev> (Oliver Upton's message of "Thu, 2
	Oct 2025 17:04:11 -0700")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM4PR03MB11056:EE_
x-ms-office365-filtering-correlation-id: 23a5be2c-271c-49dd-36ee-08de02838e50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Dm40MtE9kXRsTwIvtqfjUN01q7ZdP92hILEa/rmQRvLcyvGXciwiOcNdeO?=
 =?iso-8859-1?Q?K8+bNSn1apXb7vmt4Eq6kqq6Ook3ZfZSHyDl3t8WsxH+r4EoRZl2Z6caRi?=
 =?iso-8859-1?Q?eVC1hC++NZUr3fWo+ku0I/P/Q/iC2Q9BvKJOHotkFmdF9SulJdxjaExrS9?=
 =?iso-8859-1?Q?S4u75oPWyFDCkJNbkXPp1DuXQcXGQOFezRVy9wtGd5Y9XAomwZo9kucvjq?=
 =?iso-8859-1?Q?/T1a6EJ43diR2sU9oW37+oYpFVOeq0gUJ4uVJDd+zXllTC1dtr1cCWPNLO?=
 =?iso-8859-1?Q?zurPnq46v4574MARcRx/F13OvdBhjJZBrodeq3F+Zc63+BVlLTWpqgqqX7?=
 =?iso-8859-1?Q?LHYwWf9pYxcfbWxd2SrKIHFxAyuIhOh4YQntmyiilPLr9OwRLE29cTfwg6?=
 =?iso-8859-1?Q?Aa8jTKzJHaIe/rKG3WG312QyXwgI9koVPj/RYDkXJ8lN823eOelgMLxl+V?=
 =?iso-8859-1?Q?owl5tNdwtU6XxlltlTTAZ16Gvug9hqhJ8qCcCdmRWSZcbWHgDkfw6wImD2?=
 =?iso-8859-1?Q?zhDaSP7U2/Dd4V8bBp+9a5OdCCDJKGumqSnWgq14ZtvT7X88cK36cmMY8t?=
 =?iso-8859-1?Q?KdlRjAcfmQ57vVObDQnV3RjFve4p+SVOx7dJuI2p1aowgwkaUtzaFjVEgv?=
 =?iso-8859-1?Q?/oPw51Umh1amI7rZCiCkIlTLzsDiSxsK+o3Rerb3mikuTMgCnTK9GjIxOY?=
 =?iso-8859-1?Q?L1wZfkJRkzPAgD16Yjf1Oxvycrtq17gqEAvg0jXmexTMORfZEYsD8g3sM1?=
 =?iso-8859-1?Q?iOgGIpsUWBAaMwwhDXz7j0hmrgPOg6Jc9ovy7Q4z9Ez8ZaJcoZEL+TwNUM?=
 =?iso-8859-1?Q?CNnFYFCDwCPEMsXtYyCo3p522nVWBRekCWzQBeWlcocK+KVUSkKu4Z+IG9?=
 =?iso-8859-1?Q?2vHe2l8RdSiQOMPjhURVdA/uc4SYTeMPnhTwPo0VFf5m9Bh9qWCOJv9eFu?=
 =?iso-8859-1?Q?YJvqpTtYTl8rpHvNea1syWgBDhaZcc6fRQHCGK+ICDZUocy6jU+uPdlRC6?=
 =?iso-8859-1?Q?sjJ5ZBtNS6UlyrCqefakawniBzTFKDdnhnKNLFe9SVi7W7S4bEluOHNx0n?=
 =?iso-8859-1?Q?Znk95ljb5KDCzcWKaI54YJ/aMVw1+bqAvHGkhu1qJa3MKGVq8kbrYDxqeW?=
 =?iso-8859-1?Q?CbD/dYAhWWYcm0BU0QKBbcsE14r/4wWNI4reizvj/NnZq+UXCRAT4cDT6K?=
 =?iso-8859-1?Q?tiusfZpYUg+ZJ3ufWhnvE8jDLKXXr+I/tYoLujqDYnriEX73Rs2mqfOlMn?=
 =?iso-8859-1?Q?JR+3n8ugCqPMlBIsiNJw1CiEb0P/6z5J/wIN6CcC+7LZLIftmvNLNLGdpJ?=
 =?iso-8859-1?Q?my4pVJ1l1c7zm4t9NVvwMkfOVn8Gp8PGa9LAkZFUCx1XjbuAA2Zk3SdEfo?=
 =?iso-8859-1?Q?b+P7lvftH7nxhSNPtOwuTkN6EShu7y3f6GgWtjMf+xhh5PJhVuKtzGzFlE?=
 =?iso-8859-1?Q?kSoB3x3HRiXjXsGfHMYM21GRl7b0EwSUmXsElqKNTcl2ik2hLYtjL+XFv/?=
 =?iso-8859-1?Q?Pp75WE3r+NZXEOA5i6dQGUMpy/cfM7aC7sEcnn5rdfteFT3c4ei9VZUeen?=
 =?iso-8859-1?Q?vgBAPkPjorfH7VJZy+evP76CmbUC?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BJOWMgLMv5C0bS0ZWSIv2wTBFcV5ChL8wmBRdOyQjUZ4WdIfRKkADAdnhA?=
 =?iso-8859-1?Q?+4P98Lex8sFg/MY7LirF3g/MriDgrodYXfptY3Y2Ht/d/lJT30XkqWJ7lx?=
 =?iso-8859-1?Q?PgJ6bCVcxjPXwu8BxGXX5O57l5KB2J5qR04FD/kuilcdIqoF9JvHQpLQl2?=
 =?iso-8859-1?Q?20jcepxfQGkaTfJ+9oRonJtwsNNUzcFQiSDgyDSQRKrMJ20sUamc3DVChO?=
 =?iso-8859-1?Q?IJqkAaVqa7ou34GEBF8IDBE9J936H/meV6vV5ZIdIt+fBAS+ixArJ/8iGj?=
 =?iso-8859-1?Q?VfU1H2wB+qIKSWdNVdbsDbt16fJ4PMwJ+gAGfl2sd4IC/dFZVIeJFrewq2?=
 =?iso-8859-1?Q?3Tj+F7Oo+xjzjnX5n6/GhsLkPsC/SMiJg3JDRCIMLMKWVu3G4zhOUG1fPY?=
 =?iso-8859-1?Q?HIywwU9zn5L8IO00UPDztp+N0pZKH9vNZtqOdawHyBpcVj3bZLYbvsHaNs?=
 =?iso-8859-1?Q?PsSDll3+88RJxf6HqZeLC0u5LcN+/Apw0nP88r47Zc0Oa7ZlUpOu2lC2wu?=
 =?iso-8859-1?Q?nmYo4PZbQ5VxungH0dLyc1ntD+piaZFXIUOKJCjiZuX5AFas/Lr1Dp3drY?=
 =?iso-8859-1?Q?aGCYGdb3/zH5fg/gE0e7+W5i5AoeUtJc6BzYrhZQ+6L5tE7XPcdq12hzBT?=
 =?iso-8859-1?Q?pt/xqcDdzINtq2nV8ezICzYpjYxY7LR8tLExpJfpvwYbTMXoFQM/qjmDgt?=
 =?iso-8859-1?Q?3mkelxPaiQnmh5jWq8TNSgUR/jKN9o6rxafabVXvRNMHkyXpifbbSVezNW?=
 =?iso-8859-1?Q?fMz73pZuOVSCEhGAJTzpUOBSzvCqefiQ89J8uFVy/zjzvsm2AV9DNhIVbc?=
 =?iso-8859-1?Q?5ZBuY022DDkbcExE22nCbbPtsGvD8qSQn5lgQAHgjbITqOdMDOPUbRS/5g?=
 =?iso-8859-1?Q?Y0cBk0+O7Oktpd8BNXKJVmeSiULTzIiruX/3Mo+OXkhm2u0GLuQoYGTRo4?=
 =?iso-8859-1?Q?sLUik1kyiZJ0HKPCPeISz8FJteiE2CJcYVQxI4BZbw5HfreOUmvxYmnWI8?=
 =?iso-8859-1?Q?/eOxA9FDELShnVIh9SBAyYDNLfukzPfKNoTckyXHYrdbC6TAeMBdVpsa0J?=
 =?iso-8859-1?Q?L/5HNst7l79+o2jXx5iSfY+AahLbjdzExEbRw6S+S9V9n9PLXitt53kqE0?=
 =?iso-8859-1?Q?bw5/Yd/Rrhkx+kWo53yIQ+E/HSZv8/KyJMAy/BBe9v0ydOBj2oyW3kDpqF?=
 =?iso-8859-1?Q?cdVNmAXt3uL0kwW8UBGbFoh2rZYESzf+I7SPHrZXR36ZfqNmNUK8aq0UVQ?=
 =?iso-8859-1?Q?Bo2hKzAi+OD0se3PqxXYm7vu5tjwccO0liDmcrYOCDTFnuu7Vu8wx6jcWf?=
 =?iso-8859-1?Q?YwVkG2mRmqLTyg7bqOgAX9f2m3ynPkvmQoCluTCfFpTjk+QGALn7xtUpoz?=
 =?iso-8859-1?Q?lIxceKsNKkkmGFvWKQPRuOzZlceM4jFNjCxzxO32tiEkTCuo1+fGZF497W?=
 =?iso-8859-1?Q?Hh+fsbDv/mjZvsWDrM70iENhhCyKAyjkSwc7oYfPe6ytoGjEdeYk4JpsWt?=
 =?iso-8859-1?Q?kxfKaLIsKg5l+rdM5mGnTujbocWOiM6tImoVv+jgtZOfrtwurTZ04tROMf?=
 =?iso-8859-1?Q?2k6s6JO5BAk+M/AzIsy7EQ8DyWdS2TOlCGor364X+FBFgMtRqsfZy7xhGn?=
 =?iso-8859-1?Q?rDoLRfupvfygNdBBFTFHX7vwNVtwW5RMaUjRbOWfQ/yxoy+vV/cH9KsQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a5be2c-271c-49dd-36ee-08de02838e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 13:48:38.4596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LeWGVPAcTiSg4AFpN8b/mCPvwpHdp+qocQ7FOLihIwSLL02CJxdku4hpzVYc+7h1Aa3ZB5ArARRoAazhQms2O1lrD11Rl0vjWW5JqSjGcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB11056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_064853_964078_BFBF7738 
X-CRM114-Status: GOOD (  20.14  )
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

Hi Oliver,

Oliver Upton <oliver.upton@linux.dev> writes:

> Hi Volodymyr,
>
> On Thu, Oct 02, 2025 at 09:00:11PM +0000, Volodymyr Babchuk wrote:
>> Difference between nested virtualization and "baremetal" case is that
>> real GIC can track lots of active interrupts simultaneously, but vGIC
>> is limited only to 4..16 LRs.
>
> There isn't an architectural limitation here. Nothing prevents a
> virtualized GIC from representing more active IRQs than there are LRs in
> hardware.
>
> ICH_HCR_EL2.LRENPIE allows you to take a trap when an EOI is received
> for an IRQ that exists outside of teh list registers which would allow
> the deactivation of the SW view of that IRQ.

Ah, right. I am missed this feature.

>
> As Marc suggested, the correct thing to do is adjust the sorting of IRQs
> such that pending IRQs fill LRs before those in an active state.

Looks like I missed an email where he suggested that, but yeah, this was
my first ideal as well, I just didn't knew about LRENPIE bit.

[...]

> I'd really like to see a solution similar to Marc's proposal which
> addresses the fundamental problem of active IRQs overflowing the list
> registers.
>

I'm sorry but it appears that I won't be able to put any more effort
into this issue right now. My boss wants me to switch to another pressing
task... So yeah, I won't mind if someone else will continue the work.

Also, I am sorry that I can't share reproducer, but as I said, that
would require all the whopping Android build and believe me, you don't
want this. I suspect that this issue can be reproduced by firing lots of
interrupts simultaneously in kvmtool. And of course in this case there
is nothing Xen-specific, so KVM as L1 hypervisor should be fine too. But
I have no time to verify this.

--=20
WBR, Volodymyr=

