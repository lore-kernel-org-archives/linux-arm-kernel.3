Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE08D2E03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Hu3Rp9xPT/MZvrBPApnYVKsXtZADyQkwQALLWUdOaw=; b=iDy56XXcclreU8xibkqJBbRqTC
	d70Uluxmrji3+sG1DRG64lcoXrdYeWSrgBIJVDdN/YUMoVs08fcu4hJNgbO0CBcuwfY9ozsQ/jG5x
	Ap0+GRige51b070tA3XiRys0zvovdM1mmhl2o6uX+Bu+o/YylJh5HA9p22g7GunW54qHHwAynoX+9
	5h+d4hbFU/aBIgJGMObF+9stTFNcVUNz6U/yfSaEYbfBmvblNxZWV4YEnlQ47ray0cPp239PeESBh
	gcdyfaDuQieEe7iDygPgCAt3J59W9eZrrsZ/lXpgnA3blbc4CuN1E7IScldVr/jVOaSa9aArMFWvy
	JOs2yCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y22-0000000Ds4l-144e;
	Wed, 23 Oct 2024 09:51:58 +0000
Received: from mail-bmxind01on20701.outbound.protection.outlook.com ([2a01:111:f403:2021::701] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XYc-0000000Dlvc-2Bi1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atBkVy1GAjYBmDr4e5hgfjdnsyRAsM0A14hg0tiz9eETdsbUUHp3M/QHdiWCiuWfqb6Lh1MYrB0uFE9TPQj27C+19Css3OIPyJgxEzyZtg6P4kpQkgBh2+1+VQoYzGrCbBxXAmW4IX5oNqZE2gLU1qFeq4xUc/VtiVo5ETUtTPzD6HPf6TWElgppriqnCn1c7Ta172+yE9NTL8a2BqzlhiusM6/PisgwXnegBemGbmaVQ2xAkYceMRcA5LaJ7aYm8RT356YSL0PqpKZaCYefFO9+9f0wj7ZaAy+w1nvc6RmMHZ6qjzEEoGDmYEdqFsQGXYYwEwZOITo2w9PFmIA0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Hu3Rp9xPT/MZvrBPApnYVKsXtZADyQkwQALLWUdOaw=;
 b=M9a2lzKxXE2Qi/VwyAsuCwG6RjlWnCD920jR6SmltcMQAF38b9DVeXn8Zivlckt4fLX6FZ3qSUUxMEV6DjtPbPpMfADY74u/YjbRwEhG3dT8nCYn7pML0/U8x0av/3BUNFblnrdb+ZFC46xfTGz/l1+JhalB6/Kpfecs6irF2kAE0bYRFummT94qI8mqyn7m55iupHy6YZ59TMHRYYIUWgTSBLRq223USQidvnWovpKZYkrXOZzdOMEZMXW4CpadDmSAE6HPXi/b6yqjU17PxgMPAXWhDrznYrI2T9nj19IuhzMMIvv1SnSmqe8xdccJRC9rpowizhDRRR8LaFdipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN0P287MB0087.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 09:21:24 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 09:21:24 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Hiago De Franco
	<hiago.franco@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Joao
 Paulo Goncalves <joao.goncalves@toradex.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, Mathieu
 Othacehe <m.othacehe@gmail.com>, Gregor Herburger
	<gregor.herburger@ew.tq-group.com>, Max Merchel
	<Max.Merchel@ew.tq-group.com>, Tim Harvey <tharvey@gateworks.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board 
Thread-Topic: [PATCH v2 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board 
Thread-Index: AQHbJFl+kTDphPLIK0iBSnJx5frztLKUDxyZ
Date: Wed, 23 Oct 2024 09:21:24 +0000
Message-ID: <PN3P287MB117153A57F3747247A5FC1BBF24D2@PN3P287MB1171.INDP287.PROD.OUTLOOK.COM>
References: <20241022080645.39536-1-bhavin.sharma@siliconsignals.io>
In-Reply-To: <20241022080645.39536-1-bhavin.sharma@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1171:EE_|PN0P287MB0087:EE_
x-ms-office365-filtering-correlation-id: 8fdd6e52-45bd-4949-dacb-08dcf3441086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hCy3HKGpuQAaYbNMGBa5WYORdGqW8c2vDRDEXrdrRFOIpEcT8RrKHjk2vv?=
 =?iso-8859-1?Q?DEI97nt18vFMqgjfXSNR3JM/02lEJsWiAKGPGU/X0aUlYTbRZGpFNyqxqa?=
 =?iso-8859-1?Q?WZZS0RHlSWerAsCHxLJdgB3l7it3eTDPKl6Qug3JPIItKJQoED1wn9/hnT?=
 =?iso-8859-1?Q?p46BYIlSGs4XNGNsMPCN3WswDrJBNoFZP6idbC78xcFGWZhDDTOtvfHJsT?=
 =?iso-8859-1?Q?ap85DMCTyT7AbIjkRiNluU91EgAKRKpKV3/Bw3qK30X64G5CV5narbyr8I?=
 =?iso-8859-1?Q?eT3wPWbcaUuLScIntTYcOI3IFX6I6YslwoXbs6WnyZzcqB99tY+yR7FU2O?=
 =?iso-8859-1?Q?kDAGBbIot+lz92rksjtXkTU0D5x0OXfA5ZWlO/ripwQpecw/Cx0UmhfTGm?=
 =?iso-8859-1?Q?I3mZUJKZEcwz7m6++RUV3vA5fMKXIs7XjB7Oh8kTcQQyzr9zJu10CoPSh+?=
 =?iso-8859-1?Q?sv277Fpq3+nAHAuL1j7YJDV7EDxgsGB3qnp+ERpYRsi8giZzAgBF+h27G4?=
 =?iso-8859-1?Q?bohEdflBguOyzUfXlbsr2WyECk7YQD6MQ7zAWL4Ixqm8S/lXjOeTTtP05h?=
 =?iso-8859-1?Q?59ppW3EVwlcYyP6V21UgibYUakDFkB0yLb5ppjyCt0ax8vFTnXsnswDALe?=
 =?iso-8859-1?Q?8jprWXYtFqjjsQb36NDqHdNWafHiXuqQNmzOdaxf3mYL/ww7IVFTEFHuI9?=
 =?iso-8859-1?Q?ke2R0UFfDWKs1TWWyJQ5LXuGAiJs2BI1z1CDsmCaQeiCltFqwwKdAz7cKj?=
 =?iso-8859-1?Q?0v+/mKt+YBfIYVgPeCjuMJDp9Ew93PYMZhjw7Cbyust+Vmg7AlZ1GTHkSk?=
 =?iso-8859-1?Q?7BvvcweUhegWZTtYnYpDmrekDbZp1JGauKK7T95moOqhbxAlZrxOwRQjj1?=
 =?iso-8859-1?Q?JrJDp7JXeCqPwWzvkfOMr1p+prs+vmLudDhrMLbrx0Vls7PgI2JPN2QERf?=
 =?iso-8859-1?Q?FyDdZ1j7eW6SD8juWIeNw/3+uMP9q4n41oKujFwOgPBoZolU7AaGLQrpQc?=
 =?iso-8859-1?Q?g774VUf5NqT5tvGljrNLhWgkeaOsUrEKd68r+gqjQKyNqfME6bhVo4/VyS?=
 =?iso-8859-1?Q?iYJ9n9cYsiaQm4lxQwEJAS6SWDNBVtvEwQa0ciDdHL11IX4kvriAy8Pb95?=
 =?iso-8859-1?Q?aitTeIwZk9PJggKi/ODPhErnqI90aKXpZqtcuV064MqctEBhunuUCMkj+k?=
 =?iso-8859-1?Q?G5fkAo3iHKmJxpxqPARLQEeleTmbr3mO0c7wpgRiqBWTK+5q3KAZiolxpI?=
 =?iso-8859-1?Q?r0LSvWqhaGuBMI5VqwZgOLeBnZbko3vDPShCDHbabv1bKcmswyABqn/bv2?=
 =?iso-8859-1?Q?zfaKp/oH3XFWCrjJrulaMR/xYxvkWidQkPHTrUFtOpR1geftdGhm4+E+rb?=
 =?iso-8859-1?Q?r0C74yLtds?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zAYmrQrHiGc0p7nKVd/hTZydO0GBGgT+vjYbsmPsXbWzB6+oj6I/o+MUk9?=
 =?iso-8859-1?Q?GVE1mYaRUWczdQJ81YgDVAAgqkn61PAcafR+Czcv9W+TUR0q+IqopUut4G?=
 =?iso-8859-1?Q?yWG/T03FNmlxxSYChVN8QHuPZcRlbYk2zsrdecWU2yFrIn9BBxLdfKVa/J?=
 =?iso-8859-1?Q?PuO6m1h1hlv6RNBimPBkvzBAgJhZX4nd52kP0n94hftm4EogBGuIqwM+xk?=
 =?iso-8859-1?Q?WP9Laa5DrSWO6QkNtwsm+f1WzIT8VbUqhalzg1mBTPgJCXiAqej2biwcnh?=
 =?iso-8859-1?Q?Z0q5nveQ3ZYY5saM+CxP4QhSh6RN3z/LNThbfb/Oo//JpKAkpmIvYfJF28?=
 =?iso-8859-1?Q?NhgFXDokky1kHUt7Q/DZ0Vj+boGBV0AJ6gVjD4Ad6yrpMe9xUDmMKKdAlA?=
 =?iso-8859-1?Q?nKtVSGSs5Ey860MxfRKEIKQN6QVGZ5fx4V46aO+MV80Bz/53VteAmldbw6?=
 =?iso-8859-1?Q?Yb3jhuQyfpZ2Ymm/PBbbsTeBWnABI8EqAZe8VhY+o4gl+9KLYYaCSh6IL5?=
 =?iso-8859-1?Q?Bg18NU6mnjRVTtn/C8tbE9GBSx/B/mwcR7ihGb87tAcg3DlRjOiR+IThV7?=
 =?iso-8859-1?Q?h4j4SPtvZNuG3tXGzJ/IBdaJMzDKyLJVg4VfU3GtCG3ChbaHHXy7bDgpIR?=
 =?iso-8859-1?Q?rjNMzgwfseow+ScpXCyD2ATM9YAsmpOvJvziQwY8swe/Ckad3nr6P545+b?=
 =?iso-8859-1?Q?Ms+Qo24dekALgd3gvImCOmYjAlOeJ5JAP03RRIk29N4wc3Jm2wLEmu4fcb?=
 =?iso-8859-1?Q?EE9NMzpkFN3xVdbGtZ+igdkKiHe0N25RJMTZFDLA4zmkXjGMIPBf34igGS?=
 =?iso-8859-1?Q?GRFBwSX6ILFa0R+kI4L7MLsOU9avGpqi0OnSRdThR0cEG+/a4/Idu7UlQW?=
 =?iso-8859-1?Q?c7ZFRIjmVkKJh4IgS20v7WQSI3Q420r2RBtvSPwob0N5LKb6LbeJ6/QQhF?=
 =?iso-8859-1?Q?nHXrGiDA9g24GMlOm4zSb1bKEkYc7xpwYuFM7Bh5I4SC4YlAM0+C7aqHXX?=
 =?iso-8859-1?Q?LpYUFmOP20n0uSrT1s3P2AH9IRIct+wryIAqRgPsQEGDd/ozs3kwx3ax92?=
 =?iso-8859-1?Q?WBE7MKN9TPsINLhcAfa89M6RDVkoXuOMI/6NPwu6pqviKMUOOR+7CT/V+G?=
 =?iso-8859-1?Q?vCrGdxoYCEIRdHn+Izy3LbZeoNuhsHsIBMeAor178rVS6Xqtn35Q1dEXe0?=
 =?iso-8859-1?Q?j3Mnl9jJlvVzZhhyXL/6FWQlbmhTfUdpGM9mf3TCdqR/lkwgFBBpkRxeeJ?=
 =?iso-8859-1?Q?Y7IMsXoBsYUgz8A5ZHPjzV6lg54Gr0SD2jJ66Yuhyi8H7kx6FMA+jLkp/G?=
 =?iso-8859-1?Q?nqaUbG4qFqMGTQJdEXzPU8FbURZzYNKeGU9AiPiWWeuEjJ39/rFpQXYJA8?=
 =?iso-8859-1?Q?6ha9EBFpXLcvbafCnO0P21Bk0MwEMd68+QBTg11OpexlbRoKeUuqW1zFPi?=
 =?iso-8859-1?Q?A4IwRLtcnXgWBVr3UJJlzLXKNF/2z0y12ru98vc4hdfWJRlDpDeZM7D1Go?=
 =?iso-8859-1?Q?x+Q7H6/uNkhS99/x8HpkXPnLq3zpyVD3iI1GwM7MNZ2oh3DmPBE4UaGCwo?=
 =?iso-8859-1?Q?FUt/cB6d+V/pJ1OgRudra/RGRXmoa1kJWyo8/kuc+lOYw8B6ohE1aCv8Cx?=
 =?iso-8859-1?Q?yPOWNXq6TGGEr3rQkutH8695i7yzAAiol1GB9FrYC06RecFSB7uJp95A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdd6e52-45bd-4949-dacb-08dcf3441086
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 09:21:24.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjRMbng5jXtnJ9kVqf3+GLqpksO5W5n0c49lVT+OydqVNCC0Cb4J8HZFPHN9SADWXmuULtiyvpRaxxWXtvy2sakMEAKi33fRJzKHqzMvi+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_022134_587189_2B221483 
X-CRM114-Status: UNSURE (   8.23  )
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

Hi Shawn,=0A=
=0A=
I mistakenly removed the Makefile in the V2 patch, so please disregard the =
review of this version. =0A=
I submitted a corrected V3 patch =0A=
 =0A=
Link for v3 patch: https://lore.kernel.org/linux-devicetree/20241023091231.=
10050-1-bhavin.sharma@siliconsignals.io/T/#t=0A=
=0A=
Apologies for any inconvenience caused, and thank you for your understandin=
g.=0A=
=0A=
Best regards,=0A=
Bhavin=

