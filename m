Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC17C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF0IhOAKGM9CUj221RJIq1dZ/D1wUtUnFz8kCsvnWCk=; b=V9TWM59fgM5X3MWhip/9vKUwIk
	BNhEAKfLSMs9KcIsXPqsfvr/QTB0ROmat+wkmc3W9Gp+yFfsShn48e7CSWLJ+VlErFrjP/laLtS54
	AbNzRoCiQT4v/nBtqmDeHbTQ6R9PYh65G6Ss6tnXt2/Z5mNX+Omug0tUgEc/6CM0JmEV+ZmsXiQPV
	2bMbyq3ZX82kB1jmsaLB2mhSkMM3+BukeNZw/ACCLOPH+KftbMTzH4yVqxRa+OlVqlW8cxCEFmVse
	RPgPtD1wPhX3nxfnHNSNteXZMPGzqiZAb6GBJA0YQpstulrytiuWqAkcJFiVWwlsbo/UVVH9HVYaV
	WTEP3byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGLf-00000008HfI-2wZZ;
	Wed, 12 Feb 2025 17:16:31 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGCU-00000008Ddc-0Hyr;
	Wed, 12 Feb 2025 17:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAdR1K5su63SoEA7x6sVLlahvZuCpbzFeaciCpC8CSXI0pLHDDxZGwiEH7f56x75eUC9/upfGHZrZkfwejQrwMJSQO7ALnB/CNIUV3d5vWa/OiYu5+9K+jmleGihp6kceSVDVUnddavnjwWJFyE17kxs6HprVQzK6xnML0xNzEgXT0s48IogrYb7bCoue7378I+OYF0dsXcKWVLTBYV+86XUAjLNyNnpvM6fd1rQJzaFp9S2nj3i/PFyFGli4gikJPF6eiEM+QCSLoRL18gTQwdQVXa2QfjgrBO/TOIJ7DVkNpjnFu8B6HnIo5yTgF4OChdZPS/DuSfkM+WQxSZlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF0IhOAKGM9CUj221RJIq1dZ/D1wUtUnFz8kCsvnWCk=;
 b=kxWnulaD1LgvYaYW7Tp/8J41g2b6bCRyJlG/VdGP7730epJJF3CJCRMPso40pr8x1vBEnEYQZZJq3nXg3JTVfMfMXkpwfJVsn2KN3QO1cBc54SABnFscRi+iuW+bHeOO5M6hHoNpGeOlI628iGbxxoIlq3tNnsJcIxEKYEl+vqj4bJD5RntCL5yYbRVxod3AfgPv5Hsvkq+EZ8w6CHuYHGdV+MNPCFkOv+uGOWuFYGytgj7RG0Ogv3P3tDda4fmtRQDgAcYZxUtOTEFhOETTdmwgq04Vl7HSOm4ncteB0j9e/oMPTw7xyVa82ORk+TK1ILALCvx+enmOF23nR0M3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF0IhOAKGM9CUj221RJIq1dZ/D1wUtUnFz8kCsvnWCk=;
 b=Iy6ClrZdcvQPZXLpixhGQspNky/zUT2NG/XkojXXYHSRP0XLYlTEyMLJY+N2C3LM/ltm1CJExpm/UrQiP3CoyEMuU158miOJ4GpFEs61jXnzYzG/ZnJr9qINdIGcTAUkLWSHICeEBEiVIN0VxgkJ3zilflb4zVUwRTFVs7T2hFc=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYWPR01MB11829.jpnprd01.prod.outlook.com (2603:1096:400:400::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 17:06:52 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%6]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 17:06:52 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: Krzysztof Adamski <krzysztof.adamski@nokia.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>
Subject: RE: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Thread-Topic: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Thread-Index: AQHbfWv1ZOXd26SOMk69BpdYimUxfLND5csg
Date: Wed, 12 Feb 2025 17:06:52 +0000
Message-ID: <TYCPR01MB1209313670D2A1C634E7E45CFC2FC2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYWPR01MB11829:EE_
x-ms-office365-filtering-correlation-id: 0fc0317b-bf89-45bc-98a6-08dd4b87a54e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?AF2BmB6MTx0aFmCqiwi6zs/XXOFv+NEiLadiDABSL3zlnVCDQH04ylIkzixH?=
 =?us-ascii?Q?ToQdg+ysrKZgXK6ZfKlh8MCzz2U1ISuF9AFfmwspVitLvFPG63TLFeHb3qsT?=
 =?us-ascii?Q?i5KwhxV3d4ANyTuY0zNEMVW1u74ANoF/uy98bhZfjHsgv8c2E7iHSwHWf3Vv?=
 =?us-ascii?Q?/n/h3aZpZX4w3Ufb8+z6YC5WDC4nY4tG20ed/wIA1yEwT+jnhl4jd4RSXupa?=
 =?us-ascii?Q?gGkLfEozAOQYylO9cBSCGaOQHcoXq7KaUCHfRFzvYznmgy50Le/AELHXG3Bm?=
 =?us-ascii?Q?uaqrvqve6Mi+3kVJqIeosqBUQE6dl0tWt8rrYei/1868rgvhfWd7ddyym4/A?=
 =?us-ascii?Q?8ydTD9kLu8CFuJJ5jFU6Yw1sBqOnLSxwOhN8gAx0gwx7qnqKxBcUnbRXwEy/?=
 =?us-ascii?Q?8t/2zrq88g5utNLg4BVUHgUseHAM6RxXIvO/x5RbJF0kK83+Al7b/siG5vKp?=
 =?us-ascii?Q?ZUih1sNaplcdeYhajmmB78t130+Skq81RPKt/NSl7vAHoyIOs0dOrrbljaWj?=
 =?us-ascii?Q?0y4qJPbTn0vV1JYCFP50kcQRE5GAtIdlui6rS2Wx3JRotaukvY4fv9vdi9i+?=
 =?us-ascii?Q?/emYlwN8yaCbWp34bcJg5rEJUR555/QM5Lz9c5SRcT8E3mrlKu+L5k0YcE/i?=
 =?us-ascii?Q?O9ER8Bq9YLxrJPD9pVx5JJIIWcB/uNzHTKeVkWVipNOO1E22QI5EivwdaqI9?=
 =?us-ascii?Q?Y5cjT+yYm5GKnMSCUYtVf4lQcIUUSU2l7cQvmTbITxZiyswGdHH3G8KKf5tv?=
 =?us-ascii?Q?IeBHc5by/TTCOGgBPcTFUIGOXoXKQjqukeO7Qxr96ayEEGWSQDCokF/62DvB?=
 =?us-ascii?Q?gfjv0tZO8ThQw8EMtXs6Tfd9JH+vRMdevf3/rBJRsl2v7iNVS3EkoEPLmy1v?=
 =?us-ascii?Q?ihSU9JRlGOcDmTdfZHS6vbuxWIW7pE+bbeENShnSqmTrKCu0P9nL5/BHSw62?=
 =?us-ascii?Q?FTt3CeHemMGjPp3BaQabVbCCvNtZ3d1hCp55JkXiZbbZaHzcfMUlQWBgRhl/?=
 =?us-ascii?Q?s5zCf2t4XqESS8RTt0RO+lg4wlupetOeuBZ0jwWkf2Hp9Hb2ppZ2tlB6v42P?=
 =?us-ascii?Q?CekPkYyyb02FMKrCEJ/K6EHCUQQXWyzDOy+XPOGNFqijn6DKRAF3Koeb+fyH?=
 =?us-ascii?Q?oQlBomj3b6P4VEWevo4gn6t+9aZyq5KLNO7Li/kpDKH2c8bjSE5LOo3nS8sz?=
 =?us-ascii?Q?Tl1XIF5RdKXhRtW53AlJNecaryLRTWhraL/2e3XRBEUFdpxk3NyBd6zf0KrG?=
 =?us-ascii?Q?SUd4YfrRNJYJFt60S97XwgXYjSyUIqq9/KAlHgTB3KtfOzI3+HiD8wtkhMep?=
 =?us-ascii?Q?2xO06OAzA9OaKQn/roaKJpyhPrAzujKujGnxplVixq4IJyQQvMFZKgYaLB2U?=
 =?us-ascii?Q?VKvbBaziT1YQKbAq0Vg2e32LY2VasTuFOwgd3SZqYF1TTjFI29kkRcXil2Zj?=
 =?us-ascii?Q?+h+Es5oWxPmSXKqfANlnH/QIYGtC4DdW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fKBOit86f1e4pQrQzlrPYD8ftXfAFAeRKyt9LlT6QSGEvGINPlc3fLQaQ+k1?=
 =?us-ascii?Q?nwZM0VosUIxurB6AQ2vC04b7AHekTLfX4JMxPtE686/Mt1KDzvoCTeKPd4Pj?=
 =?us-ascii?Q?TkNY4e2yS36l7KEmbZSj3wFJFaM5TlSprhe/Ffvqr1TIUEs81tcJB4f9Ri0t?=
 =?us-ascii?Q?mA8c+KpQCzMGswRHGDaTLa/WTC5Qn7f/epxOFnOky6pYtb1aK2q0d6FaJnuo?=
 =?us-ascii?Q?+vsTJQ8xeXraSWxMGh+kaf4HWSB9vZ97TgGGlVg/xuo1hOjD2Q0xS/vlpwLw?=
 =?us-ascii?Q?64rX6crkp+SmmDTQqNiXMjwx6YrZPDVZFoFUQSh2DTl8pjFEMNYg30Lvdt+j?=
 =?us-ascii?Q?3y+lL39pE2vTdovDIYuy906LfBhwzZm6wCzkOxPzIDiOo582Ic5TbJLOvefq?=
 =?us-ascii?Q?Z6CDKl+JoEUSyiXnIJSSyWq8ZfuteYOswPqChEn2ULMaYP7+HaDJiifcZ6os?=
 =?us-ascii?Q?ZAlYyeTlPBCCOXdSX3O0T//8QVj7Gejr44EcDKnQp6NQVelvbP02n9UyyfHz?=
 =?us-ascii?Q?OEmE5Wlso/EDVZs55hJ/Ucvwx+1A0s3/h3ADktEHF7WdNHYo3ikscy1yeY/s?=
 =?us-ascii?Q?nPxF4C01vxK4WD5MWOdXisR+YYRcMzlOxZOa5FkXkw4ElRQ5NuuiYzFp1Z3i?=
 =?us-ascii?Q?1zoJKwdcvh+KG3hY0eUC0dfwARodQ9XCberVDY1AtdDIVbj/5Nz3RAa/10G0?=
 =?us-ascii?Q?nJADpW0qukDC0Hs75FGpHqr0AShHIzdxreEhUdZHOpPDcCy4WOjUU8pMmRh/?=
 =?us-ascii?Q?+aIAXIzLicadsp5G91YJAHaeSJqP5mjPY9PUjDFA+qcqU/6tithDxSto92rz?=
 =?us-ascii?Q?TVMSHllH7YW/pRS5u/9zG40Su48JQZje7WXy3W+GUAWIr52CL++wvYiHGf/+?=
 =?us-ascii?Q?HC2h+jKrYlNqvu8uTek2jAc9QxT+wrI4OgJTyfpM63Z7PjjVsFfY1YIgjg1I?=
 =?us-ascii?Q?yFjDq2I23XggrWmHfekVtcCCqkOjy3ujverLSmhQu0HNOzl1r2tpdwq1umPS?=
 =?us-ascii?Q?aiXPgcIPmLRBFwbpiOnkEaaUtXaYk1YUDEqeE2rTnGOZYkfCHiRscY9Y1iOE?=
 =?us-ascii?Q?tragsA9HBGUJLoL8GvoubFlrmOo8tU8tVvfXWgAPkEfvGbDC2zXgIlcudrfh?=
 =?us-ascii?Q?axkNxS3PhBkAp648sonY2ojugoAFzmCtatrk8V46T8vAKrAWeVoPrFW4FVga?=
 =?us-ascii?Q?rvkiW0jpcDYAVilmn8+uDTJgiDt3q46Uy1ZNJ/Pfx4US3Jt/4NR4Tk73A1i+?=
 =?us-ascii?Q?N9Ey48hY9YlcUZGXSa3vIqcV83IoUU1oi46EoA4i01m1pUZKbXgfhLkluVz6?=
 =?us-ascii?Q?J+PBXrTFxq5/0Bcbc6TM3IH/86KaJ+P3H6Dn8e6JtFAokUWWXDjdUJMQFw8h?=
 =?us-ascii?Q?3ZhBsDLZDVzicIE6yqOCIH3ax5cIhsAydVsaXDcZFW+yAxE5K3hj3OTOV6i0?=
 =?us-ascii?Q?CECGF0gGnAk6TMBgcEScDbh4c82P6lhdOsutvl9piy/Ynkcyo0IWydVX/Nb0?=
 =?us-ascii?Q?Re1OHYi09i58I1Ln2J4zLswMnnKK0Rj5Pcc58aCOq9SHbL3ekpLd8JYDSkty?=
 =?us-ascii?Q?b2rRDUv/FMJB11pkclDHLJKE+OzAxFwvx2qYmri5d+NbN/T2yvfuSkP0b/M+?=
 =?us-ascii?Q?+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc0317b-bf89-45bc-98a6-08dd4b87a54e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 17:06:52.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KanATX3Lx023ImvPczuXekn/UQ9HDZSoEeHTf6/2Uvx4waYEGXncXlyYo37bbuq6uZGUdzUNUErCqImAjkxv/zwjYk9EeVDh17QoW+VqH8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_090702_376747_8C83C685 
X-CRM114-Status: GOOD (  16.94  )
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

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: 12 February 2025 16:32
> Subject: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
>=20
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  include/linux/i2c.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 997e80649889..4d281ff5582b 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct=
 i2c_msg *msg)
>  	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
>  }
>=20
> +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> +{
> +	/*
> +	 * 10-bit address
> +	 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +	 *   addr_2: addr[7:0]
> +	 */
> +	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_=
RD);
> +}
> +
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold=
);
>  void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred=
);
>=20
> --
> 2.45.1.3035.g276e886db78b


