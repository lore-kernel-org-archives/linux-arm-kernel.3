Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B9C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9iPYPYAXHoH3+86H3Xyi28+Nj+QQ9YSyhIdqoDn4eM=; b=W5DlluISnydL63nLy7QxXhOBqG
	n3lSCi+Ntz8PzsQSXXxjNdMxK6eLda+Rr1jGXjKOe7RQFHGUEuXrn9bVeBampgoz+sdThL329TAvJ
	MxtZOamKY/4zvyvPOh1XHsAnxAUco1uDcZEyjUYFaLNMMGAb+VFj7ANzmD6UjaVfTOJTGxq3yU6Nl
	DcN53Fo8hcZ1Thd0QGnx5JDk3wHThkB8lJg0ktyAljRVgl07tbFV13U9gmmi0iw5gSUt+abwKRROq
	wSfrYJB3VW92Jw6xcReCQDZ8AJlRM/v/QyX4BS3mWiFNGbQHqco9rEy6GmbnujLsQB1pazKzLE264
	vTT1qPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQ3n-00000000McZ-0kE2;
	Sun, 06 Jul 2025 14:09:39 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQ1R-00000000MSu-0mhX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 14:07:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDE8rnulnjKttjPbv8MBMnkj1SbNVlfnDoT5jG0w6L6++8kvSwE4F/jY7PfmPY/MX3iiZmN32VtCv4dybYcTqyh931z8olj13BwZOLZw9HCmAAxm7ZjUawLZLP4fFgyTq9c8S9kTwiLWu3UqVlpROSY8RTdc1jbW7YRDn0Vb6qaC40T7lLioXA/PSs7my3rBP0YWk4OdlcW1OpwUmGCnKaROtjj58qA7zOWIs48xq1SvGNh00n6MfLMYZ6c8nkTbrWKtGcC+bkn0+I6NmZZ9i+7/b7fdCWaHT9p0RcaGDUpzzQZNIrxd6n6oP/u+Hyby5SOrJmbWE6Fb5YUGm2NQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9iPYPYAXHoH3+86H3Xyi28+Nj+QQ9YSyhIdqoDn4eM=;
 b=cYjEjf1QgIi0D9bznfQ+bEbvElcNNKXe6Jbl3rN2jeUYdsc0gJn85jdaXR6aJZ0NzEo4ZtuZNZxRGHhiLC/aBvPj4GawZRwsM77ogN/oHtYQpowUd0CVmvVcOUP/OQ11L1jWtu6XgwtIa/P9Tk82FVffGsxD96PFQ2ge+6/oFlgUf5Xmk/bCDI1o67WkhM5HG+dx3xZ8UyNwEPSV0lyjjHoH5L+dkZM2EdkGIOLWzH2gnokTmB9pslczhKiMJks7eKHpLI7NTeNs9FWD71tQ+VRcr6UGkBlOagZ83LfHXeEiiqQw3XXEh0tGWZZhYMKuV78Va1qDOiuK28mWCVnVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9iPYPYAXHoH3+86H3Xyi28+Nj+QQ9YSyhIdqoDn4eM=;
 b=Vdm5JybbiTvqOZXvHHtr7gbiL5DrOQkv8i3km1hKtzPXcML+LoUxVgFssZFPkImQ3e+xsttSpCVIoEueKTngpsqEMNTlCpjyI+HIfrXRT2TrJLOdkr2Xrb1A8LAxmqDtHnatsxEurkhdD0gjFU8OSlIcWRDc9XCc0Km7DCjmYmw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16197.jpnprd01.prod.outlook.com (2603:1096:604:3de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sun, 6 Jul
 2025 14:06:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 14:06:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQj6xeAgAALbTCAANFSwIAAEXhAgAAHjACAAD+qsA==
Date: Sun, 6 Jul 2025 14:06:42 +0000
Message-ID: <TY3PR01MB1134675512A8812B5CA7BB7F9864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aGpLpLDPdcPByC7j@shell.armlinux.org.uk>
In-Reply-To: <aGpLpLDPdcPByC7j@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16197:EE_
x-ms-office365-filtering-correlation-id: bac42693-9282-4914-079a-08ddbc9655ae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8p2Gfo8vWHrNMcQIDOUA6t7oY5lS10zGrGDC98ndPQ62gJnEk5tuMst16EiE?=
 =?us-ascii?Q?U2FTFhUPcUbuoXY4GONpo9IvLnbGH7+8l061Xqejv+DalFFtqSZmfYQ4E8mZ?=
 =?us-ascii?Q?lLQVHWTqbXj/7TbeN0DW0MRCQwJMZXVtlhU94Dl6E6xuhl8SqPzaWoblSG0R?=
 =?us-ascii?Q?eBuhccJN90Nl14REv/mAOerjKU4lzpHMyXMOsHTzI8o4YeBKdFP2n1hvkw2C?=
 =?us-ascii?Q?o/q/iY+EC6LqAj0M8d1anXKif2KpP0578ZQ7kQl0/l/FBVIxGj6VLMcglXB9?=
 =?us-ascii?Q?lItXGnyKtzhMW63iKpV5l94WenuOR1ov0OcG3pf56veIM+1WRwo3ExAjXnLC?=
 =?us-ascii?Q?ylj/mPenoo1VZ4NHkZvWl9MRdZOfQja6P1AAW9zCWBcyJbcNqtd7zJh2rKf+?=
 =?us-ascii?Q?qxhaQ5MGtmnaK/leptpt8OUg5FQpzT0/HhNxqPtwQvvqFzgFupo0hXzPmkw8?=
 =?us-ascii?Q?MlF97nqRtBmWwTktO/UW7n5nYdmpaaQVDxcEr3OqV0hE2op3vCRXf7wTTzyv?=
 =?us-ascii?Q?mt9KhMkujjzhqXvxRHQiTpbjFsOn2/NxdhriIHTlik+1Ms+3qoFtHlIRMANm?=
 =?us-ascii?Q?7Fky5grz0gTm2TXVPMC+KFFS3lKqMXLXbZxo4JTV9CmgobJVCBHkKIL6d04O?=
 =?us-ascii?Q?OaoeFFvknCrb5wnLPzQ57DbxTb7vy35krO5oIh/QTWJCVs6E4MYTNk1s9qmD?=
 =?us-ascii?Q?R7byn9dzFJW0zcCFIRUWBs3rKXBCUli2raFSB1wEk19hcDH9x0omTdRLIZGA?=
 =?us-ascii?Q?jU9ZzME2pyZLZuOr28u/1O4rwmvL82LoxWkUGysgyL+yXaA12OLUdQ5hEyxW?=
 =?us-ascii?Q?9GXbKe/s/rlyAkA+KpYmyRAcrwMeuZQm2DUHZABeUdFPG9jioCDo6EDB236u?=
 =?us-ascii?Q?bgyK71nGKDTMpng5u0sF0yPn8qVyNp36yfajmkWPH8whFOkntsdAnFVOEnbK?=
 =?us-ascii?Q?dTnmAc/U2KIjRmoLCqOsKowkWcoiNH7fR9zFNnENTSASx5AZypiCUmMwAt4Z?=
 =?us-ascii?Q?8jyzrFbCrhG9F3Ey0KCYnki7h2GoUe9i/zZgQlWXRKDRLuhrx1A4aDJdgxbf?=
 =?us-ascii?Q?0oWUqXZTAMLvbKcoFLKAwCl3OGZlPl4Igq1jLdmRo8G9fHWyuYyIm2WlKyz+?=
 =?us-ascii?Q?TYEqWDojDuOOf8keWuoMWUUm1AjRaC7k31G10REeSL0hE/4Bi8C90oRoFDNo?=
 =?us-ascii?Q?ZacOywkI2FPzV9OR4q7ZuYCDfYej1pnXZGIGMG9F2JaWj6Th2P4oTkk3M7xZ?=
 =?us-ascii?Q?1mfjTv6XoYK40Cub12h5AdEJyBTc5B/K9Xd4JNGf7Z9oUXj8esi57EH6k7A7?=
 =?us-ascii?Q?DGfMYXPW0d5WpL+RAO+qshcRSOXl4XFUfgOSHUzwyX6inKKv44p9RHR3flSA?=
 =?us-ascii?Q?88bMTZVug2dsgDskMR3vcWXKTPPaEMADTzY/hL/3ofsbhZluTxtxAsrtzHKm?=
 =?us-ascii?Q?ygMzfPRcx9CYnK4d2LzZQnTUF36DLPx3mfkbp5PfiIFXMdptTVvIlMVNUXcP?=
 =?us-ascii?Q?Pw2gmc81tvGBbdE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s5ANKwDVMUWKcwOC6LMOB7uXn3lOAqChQK7ZyB8cNirgweOzejnfSIVT27lz?=
 =?us-ascii?Q?5dgRfoNEeTEcBaoP1FqrUGm5nAhyoRz8QxXYk2NAbQlJIOedRqGfAfyzjuMS?=
 =?us-ascii?Q?1baUYHQYtBagnVw6RS/DV/Q/1SrpXEduo6AVLaNO/9SRq7PVBHZXQoTVd4G/?=
 =?us-ascii?Q?aTwNN0X3usOsYp+GdXipA6h81mB452PwHxebyWhwZ783gscxXkMr/8HBlsoZ?=
 =?us-ascii?Q?GXAzbjRRze5oiTCp3sv6QgE/7CiptqFBODUdkH0q0LH9WrtfMtglZv0RD6g6?=
 =?us-ascii?Q?btr8HxW/Q9siFObnTvGSEMMhR1RIM746LbmsP8I17lqeEWI8wQmseklwWmUT?=
 =?us-ascii?Q?TJbvcgYdw00LDBTpUuXVgxGvbKieNp2FIfqEbNKoncP74QfhI9zpWGOqbFWw?=
 =?us-ascii?Q?RTzqmuoJ4/oB/qiZYiWZG/Iq9MENbtssPI5R+AhRGuNx6murvgn9UEwRGUlp?=
 =?us-ascii?Q?aeo8Kky5PSsfl7iuwm+6UGJ2uTYi3xc/GCXXGZEeueNqV94wU1l7UpvVdQbz?=
 =?us-ascii?Q?OIEtF4FOm1lIyWaF0KcJC/2fkpwfuZg6CwSzuqWocWNOMkd6QhCZenKfQXPl?=
 =?us-ascii?Q?I9rZ8jL2BcbiLgUPDwRmWLM7vnDBd4Di/NHHQHMYxyXDd11NJ5teg8GB6JO6?=
 =?us-ascii?Q?YQ+xd0eVVahlIIzHX8HaSZ1cp973WnwYLFzchG8dc+CXTZKfa1SADC7huFAw?=
 =?us-ascii?Q?cvfwNSirf9q0to8oeBa4p8btDZfxesH83fPw/F38eDRRDRfozjXU82cIfiMO?=
 =?us-ascii?Q?JU3ulhzQKOZV0ThI9CWmZ7rJNbsn68w3jOZ6N800C0u403iraaNPBzqwmo7B?=
 =?us-ascii?Q?Ml0LadHdoMi9xUlxJiVy2dIIDc1GqIzp17kxdC7zyLApVwpBDCYxtwhywtsr?=
 =?us-ascii?Q?Et9OCYkJFDpOEVUPv7Ug0eZCO9ybr52WvGSOvF8BVU/UpHpIMg9O9uqQqQKj?=
 =?us-ascii?Q?kIPzEhVF/+MNdvbVzPeuKamvQzQ7ovI8smtTSLf1PNlw5GjrhkOMXRflvuFH?=
 =?us-ascii?Q?R/nRF+BNczPFt2WPhK3ehhgYZu6fovdOq04cUYFfNag1YJrmJYoc2CF2G2/v?=
 =?us-ascii?Q?xognqz/CctdcoJpsrZXNeyqO3x+Y0vEcZLBrP/jW+hr6QUcPXR7um3kecgnq?=
 =?us-ascii?Q?oL31zFa4W4yjr2QeWxcKr2EHdgS/Rq9vXM2aBEb8EnquV2YlekiPIR6yQetn?=
 =?us-ascii?Q?jxDRl7GXKRYCUK3L8V2fMFnkAlcP1+n9LmOCXEW95WPOPA9X8kwoJIF3uOP+?=
 =?us-ascii?Q?UQ5Q7fqySSu/Mi+ZG+WlXqgSuO7OjTp6yHz21i+x49PdvJcOC8fmz+s46k16?=
 =?us-ascii?Q?C9/Y5fkSnYTPp5f4wSu87REPYJSaHsACfAb2lGW0NmRlmYa/uU6YQSuZX3Ou?=
 =?us-ascii?Q?+U1CUVSxot2SZfoZGzi6jo1SMu9ejEt+4Lp02maUdlCc6abw+x+DoOmRyvxM?=
 =?us-ascii?Q?P28pv7F3ZmA5EA01qZTkf7AQmc+dhsH//7LKI9BEqnm05pJMDea8pXtwstnI?=
 =?us-ascii?Q?geOBm442ZtqYVDXDUigPjIOla0wMw+ozgLRiuJymictdpHLbThnqygb298sY?=
 =?us-ascii?Q?1NhJabPCx3E7nBDc/ZVu93Iz+RSvphmUNTznJ37f0c59GLlCNqmxFrP9bO8m?=
 =?us-ascii?Q?zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac42693-9282-4914-079a-08ddbc9655ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2025 14:06:42.4698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EI5onKvUkxQLZwc3RGGcj8ygZOCKhoWJYhHtzgUB8VBOrU7LH3J71eb/4AjVKZ0HGijkmPcrPRQtPE4ccWDJkkoonYm+A5VDGsFa2WiFkbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_070713_246206_F55A601C 
X-CRM114-Status: GOOD (  15.69  )
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
> From: Russell King <linux@armlinux.org.uk>
> Sent: 06 July 2025 11:11
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Andr=
ew Lunn
> <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric Duma=
zet <edumazet@google.com>;
> Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime=
 Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue <alexandre.torgue@foss.st.c=
om>; netdev@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.c=
om; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Geert Uytterhoe=
ven
> <geert+renesas@glider.be>; biju.das.au <biju.das.au@gmail.com>
> Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM su=
spend/resume callbacks
>=20
> On Sun, Jul 06, 2025 at 09:55:28AM +0000, Biju Das wrote:
> > Just adding some logs:
> > Currently PHY resume is called twice
> > [   35.754933]  kszphy_resume+0x3c/0xf0
> > [   35.754940]  phy_resume+0x3c/0x74
> > [   35.754949]  phylink_prepare_resume+0x58/0xa0
> > [   35.754957]  stmmac_resume+0x90/0x2a0
> > [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c
> >
> > and
> >
> > [   35.771258]  kszphy_resume+0x3c/0xf0
> > [   35.771263]  __phy_resume+0x28/0x54
> > [   35.771270]  phy_start+0x7c/0xb4
> > [   35.771275]  phylink_start+0xb8/0x210
> > [   35.771282]  phylink_resume+0x7c/0xc4
> > [   35.771288]  stmmac_resume+0x1ec/0x2a0
> > [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c
>=20
> This shouldn't be a problem. Phylib will do this, and PHY drivers are exp=
ected to cope.
>=20
> For example, on non-MAC managed PM PHYs, mdio_bus_phy_resume() will call =
phy_init_hw() followed by
> phy_resume(). If a MAC subsequently is brought up, phy_start() will be ca=
lled, which will also call
> __phy_resume().
>=20
> If this is upsetting the KSZ PHY, then the KSZ PHY driver needs fixing.

By reconfiguring rgmii_delay during resume also fixes the issue.
Not sure, PHY device is expected to configure the delay during every resume=
?


	if (phy_interface_is_rgmii(phydev)) {
		ret =3D ksz9131_config_rgmii_delay(phydev);
		if (ret < 0)
			return ret;
	}

Cheers,
Biju

