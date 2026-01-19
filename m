Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64872D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=; b=P48uJin68/sG2S+GROPbaValYZ
	fIIyZmY9zFYEgnH1a5VQPsu3a76w3uzsHF93QX53LZom/AUQnsdq19nvwwsGqeSLKWbY+etd0KxYl
	1jpel1+gwpJHa3PGa/az3z8Sj2Xob0q0Te8D5AX0EX4//VeDuHMvlsXPKxIlSFSTYMSVIcT4zQmFV
	N5Mayb+4R2YL4dQc7UvahNO0RZv8POnCzJA/wLHE33zbffg59Wj8loO/8/jmEsCmf1FXk+th/tiTc
	FfUmXeujYi92JdNq9yZcEU9gZgtOAvX5/kV+VJ3wXpJQNHBb7rntsSh9W7BN5ZqnQABeps6fNKnbw
	b49mOBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqCJ-00000002FZA-2s3G;
	Mon, 19 Jan 2026 14:25:39 +0000
Received: from mail-japanwestazon11022086.outbound.protection.outlook.com ([40.107.75.86] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqCD-00000002FWk-1BYK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkIfGy+BTFf6suzM9hv9dO0tkLsgVK9JIXCJXXslFArGruMvWs3QL1DUsTx+NEKvfmSObedcEqQGYjpN2+clpmFOWGfMyF0qwN0lc9TpvP8vJIgozTwXbSMnvTH6HoBaZ0MSTzVbwl2m36aB+xKm9AUcup36V2j9gjytuv3mwhRxD4OBocZgQpI8e3O32e86Zig9RfmKuOzFPTbtO+Sz0MSRjMajhDIIXJ1L73y2w38Sfbgc+bQ/ELFy0Oo0G9mKwNXLkkkCzqeEa7GenFlw7I/jO7LPiMK+mAJLxFfYRbPyUp8ctlwkXHtISMvsfU5Y2TqgNFy2+xLACTPPUeMYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=;
 b=a1FmDPuCCnEwHM8eE0rlWrte14AR2pbKoYlQHIvBU9VchrTX6xAqrDMqSrpbsUygWs9U20bn9A3N4K7D4OyxDr17FEsowcuTfXpuL4gqkNlh8ZJv6olYAo8zeq5/vu0oXELzWOh8EEmyRIis6BWRExSiBWogMJ4chc2mg/d8YhDhOmcdHxVD1IjfXh6lJXAFgCcJ2sX2WQwR7izXD1RJ57BKvj/4p0M1LdORLnOzZ1k1mmxeSAZZKMYXfAzKbY8h0jVCGil25BSNvvdLvcg84/Gjf60jDc1LBUHMpSQE4DrjZxu7ODOgwTvyuyRi2fvyuTccoBbCKS6zgXG+/sPWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=;
 b=hIsGEIz0PnoIubBSL5BF0pWR41PFrellwgtmLvt0His0B34wKeKBYbhEe+9KcOn1oXnllEDuy3eXEJ+GRfZtqc4fg65B0rv2MiBGUXcMbhWlG+wFLPc3Yk9gjr+LEThylLk3MP8VAxOJ+yVcMFbFoQVu1v77ADckENzXXt92+EWqKvrFGhd8Lso/VHzLbJKTxqWUG0V4FYO7yENCS1zUj3VethQTeeZuSabWTZQOlqs8tXCVyx05l1vNmnVyRhTA7FIbGx8SmNlB3/R7kYYrTIJG66qJleBKgj2s6RbDfP49in5gNGmLqvqHUlFE1EqD5v8hGVVssMQZ7kp6OZ+W1g==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SE1PPF59C9ED6A9.apcprd06.prod.outlook.com (2603:1096:108:1::418) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 14:25:23 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 14:25:23 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Mark Brown <broonie@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
CC: "clg@kaod.org" <clg@kaod.org>, "boris.brezillon@bootlin.com"
	<boris.brezillon@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Topic: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Index: AQHch7cbAQl19CEQ6kOCsI3Fk+BkmLVXCCqAgAJ50QCAAAz90A==
Date: Mon, 19 Jan 2026 14:25:23 +0000
Message-ID: <TYZPR06MB5203305392403192577AC26CB288A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-3-chin-ting_kuo@aspeedtech.com>
 <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
 <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
In-Reply-To: <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SE1PPF59C9ED6A9:EE_
x-ms-office365-filtering-correlation-id: b97436c2-143a-4513-4174-08de57669544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?daAgXzUEZuZ0O70GgJCgotZF53Kf8DQPPlq2D9UagZaM8pjiCCvyVqqToq4d?=
 =?us-ascii?Q?4QKLIutzpJfFZSjvKt08J0bQNzaXopZqg1cxt8vkH/iv02/QANpMJTPz60kL?=
 =?us-ascii?Q?VISqhZlnr6KkLbmGJgCp7wRBMCUUO1a7fqmRomxDF169XsYGc+VlVIPxTbzR?=
 =?us-ascii?Q?u1p3Tp5vxYRE5JjFsiDipsdERPCv/0cBPlqSVgBXvM9snENwwmBbTrdjuRYB?=
 =?us-ascii?Q?av/6zC0dZYKdw+4QctgigUUhF+8Mw9Wn+2XrYIYRTtsoc7ncqfna6xSLCth3?=
 =?us-ascii?Q?MdFo85gsf9x0p/rMK4s/wlg+fiiXvwrX05i51tPNmU/Nf2f+MOsiel5tYZ8S?=
 =?us-ascii?Q?G75gKTyME1j+WOR5a8Ma1B8l26U7t4PHrFxtFz9Zs3kTxpfkiN0M1BGPEize?=
 =?us-ascii?Q?IHYyKSPXT4itfXNctXMEqelVhyYPOuiachbIOmpOklJ0evB0aetr/3/bywiC?=
 =?us-ascii?Q?W4tURRWftURMfOAK+yKWB9w0e1Ah5k8HNx8alv3c6tNk6UveSuqcGKaKXxtt?=
 =?us-ascii?Q?4xsA2jlHGha0XwTw4x9Evp9hjGT0anfMrNfnHng+Tn/7ZggZdSy7QSfadSOL?=
 =?us-ascii?Q?cOkb8TNOm8qQBHaU9Wk4k3aQxFp1FgswE9KvtPA+B+6TcspSdyxe4sa1tWnO?=
 =?us-ascii?Q?FxGnMNyW18y1gN4XrrUbm4QHGw+VerR64qYWTI6rex5eb93LNavKCx8lwokf?=
 =?us-ascii?Q?sLZ8jKlQx4NRhffZBhPmWRmrJKNmZfZliQxeK8fdvNSipzAvZ/Giwd+rf+bl?=
 =?us-ascii?Q?J5AipzAKN+qoxkrPXP+wX8YjYSjPhs91M2xmygZbzjZb4aO/Bsr5rKCDm7mG?=
 =?us-ascii?Q?8nJBwoLT52Wzar8fbpfWqV/kfUqBoLZKBVwKpp2SJjUnJJcIwu0+O4v9IOyh?=
 =?us-ascii?Q?t/uwjy6KbPJscyqTQOyRNK2GvP5a0RuFsEWZF/wcuAVs+bWB/YhdLkafilxF?=
 =?us-ascii?Q?rtzOY3+hpdD0tJx5dDoVjecgWxUBh2qtsE7swjxMdMuNpCS3lLM3zIGzHJXD?=
 =?us-ascii?Q?WyEaS5rsdCk+hYEPNTE+ljxh08GR3j8zGJnwwkpOcjBlrQEwXfsR1qP4SuZx?=
 =?us-ascii?Q?PYuCOoaAJk7MTH1n1sg/by11E40cwt9YlcenyHq6OPSH2S3Nvt8UFrA/T6mB?=
 =?us-ascii?Q?z08RtIx685xCaj9u8X40mxGR8zLFAZaSnUqK+u/gL4I0uUye1MQLMSkkDaDH?=
 =?us-ascii?Q?Zp6TvYcSKFeZhdUh2LERQeqbygF9qV5b3er2rXF+8JcGjO85y/lBP2QW6ASu?=
 =?us-ascii?Q?R6A7HaezJ60wvErV7CiuphQYv1TbF+kBZTQfPtaurISPSOiEcqLrV2jpRzqM?=
 =?us-ascii?Q?+ckE/H2rjE8KOjxVYAZsVe53zmjoMwe0xpWHEawxxCAt2TRi/JxVImqtXRmt?=
 =?us-ascii?Q?Bt9yfT/HZv2DyzW7hyaN0J4dV+/NFVPTlSDNqsolvbPtJozGc7uBtKlW8jWw?=
 =?us-ascii?Q?meu1p+1xYSmMEaWySxfzPg2bGrVgbsInGtloNSVFmSzH1pV51FwvhuHDYZm6?=
 =?us-ascii?Q?dXapMw7s+u6Pom1PqY9kH1JY9zGufHEcKkTUKbDKmvlYAyGxgWEJ2mXkgntU?=
 =?us-ascii?Q?udkoU1UFEKl++o8IvEXCadeNULPmMYqQ5g7/raWimSs5nMUxujsojj3Qga9G?=
 =?us-ascii?Q?H7R8c1g1Fsh+02yxpwiiT0U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TjKgIQiaAVRQQNMjY5tJ+fhR/Lx34HjHDuNID+WSlq5J/39Tq0JNpjkskCYn?=
 =?us-ascii?Q?mrxh5E5oHXFqkZoR39kk575P4l+QsELjYtQdIQ6eB8rj4LwzB7ltBoLHwcB9?=
 =?us-ascii?Q?8Nxd4zwzxf1la8z+9l3FDBZjsMPSUAvZXYJEshQ9m1H4PkPa5+CRmMaiEhkO?=
 =?us-ascii?Q?VNLNxkCj2wz8EhK+7Y5jkmbioRPFeyseUE8rrdB2Jv1KSua+7mnX9u9ihBCM?=
 =?us-ascii?Q?MnLF0k6KAw2uvKM6JLKYTErjKXG+KaUizmQDeFDWedzV3Sxk4XXnGYnPUR9m?=
 =?us-ascii?Q?1AjIyTq2yfafi6k6UE9dhN9ker2KaFZOj4RP2xpi11iIm4aX66eykR2lHF/u?=
 =?us-ascii?Q?4g4bYs5DZ+YUoXZOn6LhLaOqMGUinR5LURkVJW2T4ABHE512x3wsL4vz5rb5?=
 =?us-ascii?Q?MN24Za6NjzFyZVYKXvpgLtND94tlXnUD/sPPiMkYdOH996mEnimebsUHYQax?=
 =?us-ascii?Q?fPm4Yz+J21rCa+9fzSeo6zhC5XoyTuYKDBbYqqmwVKc0g8wGnxaszBmI/Fw4?=
 =?us-ascii?Q?a2yi339mxcNdpvbLC/zYicTvhYKnZJEUParDkogMiMHRHY3s1YjKTamgVILC?=
 =?us-ascii?Q?lSxEvKLCr4fuE22tjF9j1s9vp+mObJ10Gr0eMLrAhPHCnIZDn66rDbBGWPlv?=
 =?us-ascii?Q?3cJWB5X2fZeLGhYrWdeaFeCMfwkgTb83fepi+1hMJpU1jpEXxA7YAd7r+l1B?=
 =?us-ascii?Q?BXAiEREF6lnmIUG5xkrnzkDmjyh/ZltXnLXHm0FQ1LuvWKLl+5u5GQUHE4Df?=
 =?us-ascii?Q?7jbykpUOzI+UgFmvg7YtDnrHtlGJMpz+MoHIDu1Zvyh3sO21JhQ5dKkJoKxI?=
 =?us-ascii?Q?+0CUotl3Q1qUJSkQYHxSgDAsIACLD28OjzcGuzMBPKABVzEW5gm4HYOM1Fzl?=
 =?us-ascii?Q?EL2Or3Cnr/0ZXIBIEU5ZiYcGb9WXKcp3Bi47hOUWfX9kyU5V9z005Wd2aca5?=
 =?us-ascii?Q?t3Hw9gHgt/KBHIFbtJc+xFYgYnx3G5GRw+HzJJTaoFHM3namtWs2rxitk2yk?=
 =?us-ascii?Q?Y+TlY+pGM+zse7f9/7WzYbTsDDs9E5aC1Z3ZrLk4Z6Rd/adWzBqBsED19MKT?=
 =?us-ascii?Q?rSAM+llza6SiYx2w794bYd0VjVGARdRjKHdrbF4StF3eVNBaqtk7dbxnz58U?=
 =?us-ascii?Q?NrWC0MixkOVZ0WR2ZQsxPMMLKPr0FtR+ZlWtHF35xu7Ps3tWLecx4WwND388?=
 =?us-ascii?Q?t/nijtOXOIn/tcLWhnKpu0ywbI7A9E1HE5qPgfrPqK0HsdqVIO3we9tm90rZ?=
 =?us-ascii?Q?dWR3DXVweDhvKgSPTqyvCJNos47sIjR/jpD/fFUw2Hs1DZ83pPNwBaLkXew1?=
 =?us-ascii?Q?MPpIsKNCQw8o16oPtuSQqBpYICmjv/Re04ZbVfcH+PBJRYRaKoj7yO/H+T0q?=
 =?us-ascii?Q?sQO8sa/tN2HuCh/mmJO1WZAlpBZz4v4D0NoypO2S7IsWNpWp+uTv+qSvaJdW?=
 =?us-ascii?Q?25Y9FpaaC4TfCkOwf8tC6fskL7Ami4mo+tiMivPgim9tR4dWfA6o5R4b6tLE?=
 =?us-ascii?Q?uycaVcj8LNZt9QprJXe5AQM83+oR9GOhy01ny4nlDORY0ETUvjSajvd9ng1j?=
 =?us-ascii?Q?Ig9AGhYlO7pnAnHqBT2oH3zX8VhRk4xi+ZZYZdnWnWQsIFjP9+V/Mw9sly6R?=
 =?us-ascii?Q?IrfKrIwm1LJ6ioPyoHGXeTCs9Tn7arkBrgsL0MjJsjMtarH9vZmSAist2iAu?=
 =?us-ascii?Q?gG7kxwUcE3dzc6sGzyRGAIH0UxtOE2Ta0UGL/jCa+ufyfFG1tIItmVN8s1Xz?=
 =?us-ascii?Q?WvqgQr6AzCybvUDNn+rlOrpAwg9MHZM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97436c2-143a-4513-4174-08de57669544
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 14:25:23.5507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BMCWeh1VCEv7gsHbmttxr5PMZ9NRmriM8tLvzipEFATFi9u4pEP/EsepBBUt54litokT+QO84JF/gVxY9f7Kz882L0txWKhvhwpq5CEWSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF59C9ED6A9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_062533_726123_B0BF0F00 
X-CRM114-Status: GOOD (  16.45  )
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


> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, January 19, 2026 9:37 PM
> Subject: Re: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devi=
ces
>=20
> On Sun, Jan 18, 2026 at 12:48:37AM +0100, Paul Menzel wrote:
> > Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> > > The ASPEED FMC/SPI controller may be shared by spi-mem devices and
> > > other SPI peripherals that do not use the spi-mem framework.
> > >
> > > The driver currently assumes spi-mem semantics for all devices,
> > > while the controller also supports direct user mode access commonly
> > > used by non-spi-mem devices. This mismatch can result in incorrect
> > > behavior when different types of devices share the same controller.
>=20
> Please delete unneeded context from mails when replying.  Doing this make=
s
> it much easier to find your reply in the message, helping ensure it won't=
 be
> missed by people scrolling through the irrelevant quoted material.

Okay, thanks for the reminder.


