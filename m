Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68466C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQtIvXKOXvwNJz7J7GdzYAtP7EZ/puwrwJ+oaQDpD7I=; b=WjxAY1wvclX6+M6/3bDIirImnU
	MKeOPLI9ph4v10NnUJHm5h4LaZJs7dKUjW7NnyoOC0wfCNC77w546xigEbwQScHCh4JnQKei/cdFY
	N8jSSxBt6JyqzjiQZoSdIyl+2xQnrqMTsR38VLLTn47TEJC8VVrDsKfwy/CQEZAV6wMNV8QkbzUtC
	RFRIqRBVCogq/aVHgsqU+YU7zDHOR3if+3FLbhEAHcql9iO2nHAW7EjBO+FKt50g3BOewHI5bw7PQ
	uqbAFzAuSJtXOPhJKVh+ZckOHhiXMIPJhJhN/sx+gFynwmfpy+wxG2MIGJgYIqWBhs2s1bbP82pMF
	AHIPuUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzbM-00000003tkH-1Qi0;
	Fri, 10 Jul 2026 01:00:24 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzbJ-00000003tjS-2IjI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 01:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM60qAu4A5vXwUGst4HyLn5Rw4J64TsAEDn0DPL3Xq/9TBMAJ9Tiakx2a9QJewNSfuskRAnGPuJZaCGyo4plZyg3kDM149prMnzfq4Gsaf1VffjvfuOUMJlyGruOvYA4qC4gz4Z78QrfDZOdrglOfta65qEThT1Q9YqutCvPuAt74IjABhWBXObPKXvdbcIcGF3b2zVj6EkDsjmgJCSWiGe56ykxO/LL9TugLr+SecjE/f09Yx4+Bx/Qyq3w93C6sP2F9SQJLSoS1EF3aXiXTvGal/Ttl8iPGsOkJZKjT7uyKXLItgzB48CFMKRKm+d4R031BfD6VaKm6b2TaZ12+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQtIvXKOXvwNJz7J7GdzYAtP7EZ/puwrwJ+oaQDpD7I=;
 b=nRl8DxVHB/lqjs/dTL+pGPH13woTNZcivhZ3ORsvjrPbaH4tZdyt/J+IoHYkbHt1CNeP4hg7bn10221Vb2v8l+4t7e+6iA+XdWb1N3Yby8PIG/X+gfU0HTlJh5jBD5X9OjY5/tjFjBLccg22fgEw0ApFINT+PlUmi3v2LNgzXbInsukxp0YomRoU5X4qHu3Jm5wgho1/AODCGPi2bOhSUK+U89vvRN8UV9iAymS/uCGHk1yykdGlT+ugOTBzxRNPyrzJ4bPnLLkFnrPgGswuzlIy/Vy4awgYP5xbn1s2LpTaLlzZ2qlFN3ZQPvob40DH87MFElD7qY0tMVzSkC2I+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQtIvXKOXvwNJz7J7GdzYAtP7EZ/puwrwJ+oaQDpD7I=;
 b=dFBIs9xFzGe80HaveSoz/QrRIxz9Nr/c+zuEzb8tdXklR/WlNxGoaFCNTvTTRpUYxr3K3gAr7cJhtAMZNxHSLlK/Izw3kokH0WwQWlxYts7BgtDaXxwTqk02sJjUf2e1KYgHoKCWTs8IzyY2mit5C5JltPqV1Z/OnJXDn39dYDw=
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by TYCPR01MB6881.jpnprd01.prod.outlook.com (2603:1096:400:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 01:00:02 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::e6a8:d:daf1:ebc6]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::e6a8:d:daf1:ebc6%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 00:59:54 +0000
From: Duy Nguyen <duy.nguyen.rh@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: magnus.damm <magnus.damm@gmail.com>, Huy Bui <huy.bui.wm@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>
Subject: RE: [PATCH] soc: renesas: r8a78000: Drop duplicate "default
 ARCH_RENESAS"
Thread-Topic: [PATCH] soc: renesas: r8a78000: Drop duplicate "default
 ARCH_RENESAS"
Thread-Index: AQHdD5BnlbyMbhfI3kOmzZSRU7AmzrZlzcaAgAAhrFA=
Date: Fri, 10 Jul 2026 00:59:54 +0000
Message-ID: <TYWPR01MB10194ADE0C781E25C22A2A680B4FD2@TYWPR01MB10194.jpnprd01.prod.outlook.com>
References: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
 <87tsq7ojn0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tsq7ojn0.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB10194:EE_|TYCPR01MB6881:EE_
x-ms-office365-filtering-correlation-id: de88c7f8-9604-478b-781a-08dede1e8e29
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4133799003|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Q+yaLTk0IRNG5eXDCgjSz4Pw0wB2l53OzDxb1rt1L5pIxer4/XNVA75723kAcA1XemIDrlIOtdCr6gLFLTbBLAj0d0HLQeNnTZGXYSo2BcYrMI29RGof4KDmngZcKDyMgyb8ntbVf6/zsUVJY4dRDm0ZvbNe7wVAT5YNd3ES4+nLN+HvBZPTpLNuBMH1474mqrA8bMHVN3qfiePWPOG0i6teDnSaWmm8CiTy3oP8c/JO4kpk76dSfH6qTvsLr2MwFpdklRgimzyY4bmnfwYUCKrlbOJ72lwBYUISPfHfF3CyK+XACXvZq9uo8x65jLnmu16KDhp5RVi6y7KfW7BZM8hucL5CmKChe0uzK0bu9EmHSqr5aP4ekiWV8SU+YdWZQEiF8i1DTS/e9Yj/HBLMn07khdTPSBPWj7WRc0C6EEwLsJwtTzZ/QFPR18Ag2M37J2g9W2aGCfKbNBsmUqYApsNfk4QSlEtpABjcswig8O6OUhBYJZV+YFlWq2e2fQhAO1lhuPA3N8ZXY6T2MKSm4y+M+M6jcmgVHb2gXbqpmyyFyOCZgNJxGjJz1PzXqLF9bF7i7+qwDPKC03sWbzMXtt8zQXiFG+fP1bZzf9KYrIi0/R0Dm6kdgduSYcJtyCgrXAfbmHPuR3QovsUgGPIrEMpvdodQ5gpq+d6G6AfGHEdSCxT85n4FSCZdafWyv9eIDNOOHI76/EC8NJxVDvYetd8m6bszWjSVaTEYKdyN5pc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB10194.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4133799003)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j6S1ZzNH0LzPq2Lk/d6oVCGaZlcq7FUT6oSWjQva3YQfX7xakDAx/RkNa2KF?=
 =?us-ascii?Q?bvoqRWcNmW2ePstv2nn/dAhO9i+IbC4oUv72oFhGTw6KhOQCVX+zQy9MPs/1?=
 =?us-ascii?Q?c7JbHwqvHUGNl2SWPkE5mcfK4Q2jWMMxeHOrxW3yIPk41uCi+w6NkcFrGbYX?=
 =?us-ascii?Q?XqY0Mt0Ov83eAd1y8pzQ3z7sA8mDCcU11T2o2LLS96rzzdFXPkBxRe2apD/J?=
 =?us-ascii?Q?yuGXJAsFjSaIXKHrM5vJJFyLBFmvblhqYuVf3tiPk33BpbSVyIhF5eR+ZOiO?=
 =?us-ascii?Q?1sA4PcvUsK5837VfS512Bvs4agPfiiegP6CzO9sGOcVEhsDcGcmoQ1rB+O2J?=
 =?us-ascii?Q?nGWjg4fKrdmgYOx97p4BRXpJJH05HLsb9PijNCVRdZ3MdHajb29H8Xtz8BGD?=
 =?us-ascii?Q?gn8bnE5tS/EDN8uzuH0eNojnKUO8SFqSu8Sc/HhfCKF6gkh34v4FX3d2g4yW?=
 =?us-ascii?Q?QLVM8KgVr/1IQ2p62wnLWf7yDO3osSq66H5BNn2ce3rBiCpodX4mVkre8S2Q?=
 =?us-ascii?Q?8WeZesB88P6hAcbvueF7p51a4kvfJnAsgeklKHs6/8Ua0kuJgJIRdMswITOy?=
 =?us-ascii?Q?whVtND+JS7oH6OT08Nj48qWVz46ZH9xsCfqY9Qr1eeMN+pu34sRyJqk7XYi0?=
 =?us-ascii?Q?XYROjGEuABuk1Zm25rA0wLFfm/66hvQjWTDbXTM6JjYbkpz5Bi9sEc4x9fJm?=
 =?us-ascii?Q?GDns6EU+OMcxbsomaSK5AVcnMgYEfbQAe0vSr5MQEnsJ4feG3NtaXs0AC+l5?=
 =?us-ascii?Q?PpUFDKBegArScZI4rORvzgUM0LWgojE332RDzVQoeggi2RTGg0pafCOnokUK?=
 =?us-ascii?Q?ak2waE4Or3udLheiESKTboJVmT008izfBrd08+RXxPv7KaYUB06wirCF4NRK?=
 =?us-ascii?Q?b4mJIo6/fw/soe2okteJVGwBhfXCemsvpS813XW22lFBaNNh+qA/FBN5INzD?=
 =?us-ascii?Q?uOiOc8/uiURGxwg4FTBoIqv957lBWZuLgMjxpkDiZUgOmbEDKXJLZ8+8joY6?=
 =?us-ascii?Q?W6/69vMt79S+wpPe5bwmV6K1FLH1VAK2YZZeOtutRAqhf6xThVWbWwG0HaDI?=
 =?us-ascii?Q?KJfg2NCtxTSuR5la6GCPg83GSm/Bkpvafh+8pRD3+1aMPA6lgxYs7fg1tpsA?=
 =?us-ascii?Q?WaXaeGXUQqMZD6oqJjc2Hi+q+rDOCWrfU7C/5DB1kY1bILzTrVdlBY1bB3TZ?=
 =?us-ascii?Q?mNJzItiq6r/QQf+QzdsutvLA2HLOxVsx5/lGzgT9XGv/eqnNtbDAMhsiFfHy?=
 =?us-ascii?Q?JPoRNRTqlMDH9NNukrMKKm2WFlhBeKnbHQMv8HvGEdHtPr7w1STKADGTt/kv?=
 =?us-ascii?Q?zbTRnah/RaaRu03X0Qllu4pVhc1ejFKzbQe3H+eCsdK0TCx5KhJ0aVj6vu1f?=
 =?us-ascii?Q?krowfnrtWjGN7ns9L6B6vMtbDtzpiEtJSUeHj713XvH1w4VdfrD/3O0Wd9Jt?=
 =?us-ascii?Q?/4aYjnzB6lZknnNiFOKSKveF+YNUNdAhEps5PgcBy9vi59nWHsr7X7D6Mwaw?=
 =?us-ascii?Q?kgzk+ek8L2M3M9l7kIughsUxU6QIGnky4q3FBmFIJm8GV0zGDe04e3r+Nv5q?=
 =?us-ascii?Q?Uigeo2CCL0PFYJgDqVAlVv4rDT39Ny/HfLHKqPdZeESVHtrWFaoVLoOKuDv8?=
 =?us-ascii?Q?VM4tI+KVqvD1OrlOe9tWGLUTeq7Lsrp4QOzUlrNNTtw9NjwIT2jLVC9Nez8C?=
 =?us-ascii?Q?zzLKkYUElhgcphZR+WbSY872szyE9JekO79yivEzSfTKiRrZr3835Hi3bDTp?=
 =?us-ascii?Q?eGEPwVSYfg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de88c7f8-9604-478b-781a-08dede1e8e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 00:59:54.8396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LU2OtpuWdPvXLVYNOPpUCVs++llXriNEWnQaWPKJy5dV5ND4hUUHyzXo1AaB+sbPK88M/TTpSv+5JOiAujiaziwjQhmJtqjarrYhhdI36m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_180021_604700_71F6C61D 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

Hi,

> The Kconfig entry for ARCH_R8A78000 contains both "default y if=20
> ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.
>=20
> Drop the latter, to restore consistency with the other ARM64 entries.
>=20
> Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
> Reported-by: Marek Vasut <marek.vasut@mailbox.org>
> Closes:=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .kernel.org%2Fa069d50d-030d-4189-ae9d-37f989829da4%40mailbox.org&data=3D
> 05%7C02%7Cduy.nguyen.rh%40renesas.com%7C4e853b1e874c4059247708dede0d96
> ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639192347095170160%7CU
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO
> iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dc7q4KNa
> YIVavKCWwyBTzrjsqBPPYZN7nCdSUSc5ZWwQ%3D&reserved=3D0
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Duy Nguyen <duy.nguyen.rh@renesas.com>

