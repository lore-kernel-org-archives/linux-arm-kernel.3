Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E582ED3C523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 02:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xH3drQAYYtji0Fzx5XrFrFtMAZ09XIO82H9YDmLYd0=; b=LznMl1eJNZ5QqP2jCYfL9dui6E
	D84+7PdtY+7PmlpUPUsPNm2p9eh1QkDThhM0hX4m4u+eMF48ahaKGMjFHFkhXCEJ3kzZpvdWHzCT7
	2OdY6zFhDTqHly9+8KAbuvnD+ARzjxfmUy8XhKK0aO5BvoHv+eTNy89ga0/FJzhL02zQVlSJltYnk
	p5nhUZqacwQ+t9dGwgAJOB4TdvQHZagyUOCh+m/1UHMFUMAN3sgr5Yx9Xhuj2PBG4Q5NfkSSHFXN9
	GZdZ34fbJmGoJYiooPmPkmmNgy1iUDMT2tc3AVRbhgLmEBVfghWMNOT/7dSMn6U3n/BuTi7T33YU2
	ijIu4i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAIb-0000000F1xw-1ONg;
	Wed, 10 Dec 2025 02:51:29 +0000
Received: from mail-japaneastazon11023073.outbound.protection.outlook.com ([52.101.127.73] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAIQ-0000000F1x7-2UEz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 02:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3MvzjeydETtLWzFL1Soc+eb4ZeTMjzOhbu9XHS70WToh2TBUz8Kzu6OzWJ51dBu2KPPLMgYrza2/DZglM6UgaCq7hIBFSE3lpedgXsxoCKmdtprDecgzeDZ+PWi2PZFRSxjrQbxI2RV1KPB+gVevmYQStLih5cA7x+c4qxpycJxVZUdiiAjRcaYYZjEPalWx5pyuR1UoDLRMZHvOGcy5I6+nWVuE7oZqGiwkCQfSuIE7EO7TdBzG1v/AaPpD5Toh5vqJdG0H0NMlQFX5WFGA85UxjR1NQlKUrIo2kDJbKObpQkPe4W/6gRymXOM6iMHnZX/ELh6raIMpRsbigi1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xH3drQAYYtji0Fzx5XrFrFtMAZ09XIO82H9YDmLYd0=;
 b=mKtdYPNJA1o8zYRhzxH51MFhE+wrU/GBT/Wnj/1u09nfJI4norCVw74ES0ELhjMqKhMLdyqpWA0Iha1lowiF48QuysSuWO4or50MidNdau3zvIn+Pe4wI49FaK3l4Fal3dm8n4GV+3h0Cywvv41PVbQ1Mym6Z8QYSsRaV3RNN0qvjh1ube1qabB2xcKNRDZ0yUxtvzIfU7JF/a/T4yXteP0wJLOQsbXsXEP9GX4FbvutEC+gI5u0hp+vbWcM6vQ75b1kmVMpqolEd8XoUEAWXzif28j9Tlct+VH4yQXKNhbsBsChZizLo6WLixm6jAf6KkYpyVb8DHQ5U43wnFRq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xH3drQAYYtji0Fzx5XrFrFtMAZ09XIO82H9YDmLYd0=;
 b=OFl/K0J2HxmpkFo0YfPuVc91dGCII/mivXPm/5OSzNEPnSYNYDCMe/hwiL+vRfsP8h+7GWEsQFhE6n8QyAAB1LLZAovXSAmq+SEwY+6gwGaALygy8jJGn9BhYimlZDE1IEYuGeG3mC07NbEreK+cHQeunH79rEaim5NlVbD6qltemsZMf0Mib34R9/+4WqA/hvVKjFgDw2EdElFjQkzGfRiBRE2CpPiEXoTbyEQpwg+1uw4Xf3PmDR/wIO+7yqHHOOH3l13SIw4aa/qt1YruK0p3hC/WJlppoQOdOmyaz4kLYCZ6weTwWq5XHexPIkSZFpcvhPVz6S/hNIEjiaFskQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SI2PR06MB5138.apcprd06.prod.outlook.com (2603:1096:4:1ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 02:51:12 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9388.009; Wed, 10 Dec 2025
 02:51:12 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Russell King <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Potin
 Lai <potin.lai@quantatw.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net v2] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Thread-Topic: [PATCH net v2] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Thread-Index: AQHcaP0lz9UNiPjziEO/AE8/Qcm1NLUZK8GAgAEBmrA=
Date: Wed, 10 Dec 2025 02:51:11 +0000
Message-ID: <SEYPR06MB5134FEDC81B12477031E2C179DA0A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251209-aspeed_mdio_add_dummy_read-v2-1-5f6061641989@aspeedtech.com>
 <aTgHva-UVEPl9EAR@shell.armlinux.org.uk>
In-Reply-To: <aTgHva-UVEPl9EAR@shell.armlinux.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SI2PR06MB5138:EE_
x-ms-office365-filtering-correlation-id: 919b57a0-ba26-421f-d0ee-08de3796fa82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?AVtHLZg5PJFF7yo9DOYQ46XYFpRk62mJK/Q8Bzchp/RAcFSUxTBM/oUI0ugJ?=
 =?us-ascii?Q?7YiD8kyy9p3D9QfN1BgMW9uCzc8KdMv14TRnc1z8OyITHoGG/9ScmYB3cr54?=
 =?us-ascii?Q?dL+qu6BxdapxetQ1m+1mgqGdkY6blmdBWDpH8QQtgm5TatlLNzDXGAom0tZg?=
 =?us-ascii?Q?XxkfhGK+SX/0REozp+RBeJd8lEvuTbSQPYK9yLbFgn0PGlDqeBh9qeC6sCLL?=
 =?us-ascii?Q?+j+m+4CFBPDqSgV0ZyqiKSJAJTaUdc0QrkscIVd1867alEmyte0KOoL9MtFb?=
 =?us-ascii?Q?jQLB0iVw2KOw1SqvJyBAMO3ViHh4061vRp3QMDang4L1n5VduUuMyjgcuVjT?=
 =?us-ascii?Q?9gTH6dmea9akVvWOFW6An9NhhAUs1CwbCNe8lAbn6REX8Dstl/uOFYNgTW3t?=
 =?us-ascii?Q?suZlZhXm8O4fbos5Z2SsdSsdrwIAlqIkTKrMdX7r9UPlN20AkPQ3tdIuQhpS?=
 =?us-ascii?Q?UI8vTgw1IzOV2YzI+r8FBKfCcDJ5o3d1NcvTWBwCx3uevyelY4VpGIFtcDpX?=
 =?us-ascii?Q?9ubwsZJj8P0VlW+7KYp/RLarBPcTbkfwwjZ99fgmRDwwBhGB6SUy6deeeUXM?=
 =?us-ascii?Q?HJDAvFRfMBB4ZTsqJcgWNuodBDaDZp20nkMnw5VsuC5RpU50Jop6fGMKq/jl?=
 =?us-ascii?Q?R+K3F7xKCY6QjlpL1E9P3sztLQUhSbYWQyA2GuW57DRC9d0t2fNpvYwCa6RW?=
 =?us-ascii?Q?RH7xCmXlu+AjUmuhCKH0+54LHNWMZNQILeFCGIs7wknHmC+8UIz4751/tdZZ?=
 =?us-ascii?Q?iYbiw+/mSJFocy0upzUVc4B8Ld/Q+d7fLFNIW3UuqWR6bOORKkEkAS1CJ+IA?=
 =?us-ascii?Q?m4tZS8xefscY0+9PPMNtkMZ6d3QtT67XqdkPLObi3HmrhQhuDTCA27Wn8nCa?=
 =?us-ascii?Q?VC+qlUGloYRyHTSKbgCAPh6K59ydcemisbK3fBhzPVkCp8FmkppLad0sjW4T?=
 =?us-ascii?Q?c7mOVd4BLaHOIqUrph79358eX24WttlsruTyFkNqjBKq8iNQygqlbtjUG3LX?=
 =?us-ascii?Q?hWkcBBziptppDVJB75ulyh+CdPkxukiP4fAFAFbDn+zJg8IimrNMWIu9x3lQ?=
 =?us-ascii?Q?OBOmagHqRH4BCkI8MG0UahKogiGGgN4KpmwW4SAf3yAubQO0qxZkmIrcL9Xa?=
 =?us-ascii?Q?Ea719y/OOXE9yS4hHdUsbLxe9H4hibzE6+wZdWonp4gGtAoVyC2ZJvdLKuiG?=
 =?us-ascii?Q?uP2MvTjgog+h8E43PNUrEhKIQnVyp/JClWj0dzk/xXsEzyU4chN6aRHH9t7f?=
 =?us-ascii?Q?6EL4C0fz53GE1ivP0LnaIOWZj3iy//s6dh6UYMOKSoL/g0IljWbsUo1gWSqm?=
 =?us-ascii?Q?9Ga6AKBUbxoBpjIkO5puecz50tfTljoeAVsRk9PQcLZu7gAxu6eDNrQtwtWl?=
 =?us-ascii?Q?8yKUCr6eZFVcDDtJ6/dtdg3ZoJgsk18rjDcFS6bd2VlFHQwjCEuLNT8iD8wr?=
 =?us-ascii?Q?gFDcQE5dJXERBX97neQrD6mtUuhInP6ZYpFjSKgRJKwGkfI9MPT6W32EBH1J?=
 =?us-ascii?Q?czsTHDyGWkxXkgKsSyPENk9EAShWLR7DGuAh?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XICwqIZQaUTu4yBb4jsAYJwbwrv5LyEsDm786otJpL1cKwsK/2qNSaWFKwrm?=
 =?us-ascii?Q?Awc0R387+2tcABzus/mNt9YUCm6AtLxo1EM4GX9o7rQhjV8IkrzQJt4rT57F?=
 =?us-ascii?Q?O3PhCgSutSuDDgSgGl+xWClFZGRPtYdRq8mnxhQf5PKFhoZWrD7kN4fwNUFm?=
 =?us-ascii?Q?/dd3cFl2+KQKi2Mne88npuGIVzYh5+pM3F67itpiNjSkrItvVFQHk4QO99P1?=
 =?us-ascii?Q?y0Prj9jNsSVw60/HK1AwYAkgqmxcTuZ0NLCvTYECVYYOy60X3tlezBUyFpI9?=
 =?us-ascii?Q?e54gff80W9rfc8zgQ5WeOrL+7Ll4qGNFFet0jhWhFKHRfmLY9OHSsgiihbeX?=
 =?us-ascii?Q?l+kvRUBpZCD8XIaYmfFBUzeSsdsjwO72crj/YG2UtSPQKiRAf5h+9sT+lLUc?=
 =?us-ascii?Q?ZKJGwYRnU9AiNSRJz0rjjw3Wqo4ks5/UGuWb3GnTAgoFb8WeF0KwbqhUzspb?=
 =?us-ascii?Q?H+7p7qP4zFqYakHfx5QMBiUEaLVlC+iKopJHCWFgjGG9JSOseuHrcFbgqH3K?=
 =?us-ascii?Q?mPdGfdpfZT4kFpdXMghO7oWXfPX+h/Mea3nuAXq58Qb3C6hLL44lDt0IpRjz?=
 =?us-ascii?Q?hKShLiBf4BW05iyfCVyDuIo7kNk2z57FFb5Tv3p7YvKB0jwxcd7wznrPsWMc?=
 =?us-ascii?Q?/uDLhlJneJC4+qVt9u8wuMpuWbCK97TEb3keYr4M6xo2iEe1/Llw9QaPtB+C?=
 =?us-ascii?Q?2KIL3zS8JVv8mqz7lTbQ7pw671Qw38bBvIBJyVNGdIQmSxFJpbzAUTga3+06?=
 =?us-ascii?Q?xOB0GoHrwhAg1vnNOE9uljt7BBG1R0XnwDez0H2EVtcjdJhGrqgS0VmlLOCi?=
 =?us-ascii?Q?QNxfIDuoMOckGfE3tHhJVXP9AuwkqCI8iy0fxLWDnzYHP5sS61UOR13zmDyt?=
 =?us-ascii?Q?waRyQTJ+PHfwNQdOdlVeKyLjj29m+c29hwzexQxEv74rnODdwFIfEOzbKr84?=
 =?us-ascii?Q?4SKhhR1Ljh3XV0SERibRRYFHvFESQ/x3tweY1+jd5Shk3DY+If92SfzhsgB2?=
 =?us-ascii?Q?2/rqgmMd/y4aHLTFBiagBkC7kgL/xfz5ffH+HcAok4Cn28HSnsp70BQaa2fF?=
 =?us-ascii?Q?pElHAHRe2c7QQwFRBIqxIGTeUBxQ0gyagiNo9chJmTz9rnUZCm766x/TeQkX?=
 =?us-ascii?Q?MZ3AY4OHcLNtyz9h9UUFeUZ0NnGuKKM2ji011y0EKOBpYTX92/T5Xc96yvXA?=
 =?us-ascii?Q?q1fNH36WqQsaJVwMvyH1l1NASAWW/XuW5wW+UTl2stX0IwXYedrrAOyp4ksf?=
 =?us-ascii?Q?GfkeKYLSr4SN5HsXQf5Y1zerFOsnyKgWL/o2lexVl/VMQAgLqn4r0p23ND4A?=
 =?us-ascii?Q?K5S70d/yVy/BWW6rkxLbXYaqcHZrQUsuHNaY2aazzg7OwtmKTiCGLgv0U7JF?=
 =?us-ascii?Q?I442cZ3mjPfwAXqlpchyfdKc4v+mAOQMoJPYgvJk2sjJNptyuyHtdV53Z2m/?=
 =?us-ascii?Q?Js/b1PEpSlxlrkc1MkyV1Rat05zgZIoJ+2yI0rZaPPeDYvEEiqsVokyz4dZA?=
 =?us-ascii?Q?5L9MtXrEbUCgBQrj9+Bo8hCKwwmm5KYUCj8PC+PxQsG/1+zcs35Uu0Q/08cH?=
 =?us-ascii?Q?yAl8v4+qDbcBxAPRsa/DEQJLcGsJew6RbLuvWJ+M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919b57a0-ba26-421f-d0ee-08de3796fa82
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 02:51:12.0253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1an7oemPZHrjay7QumF1B5KBbfkPBc8z4TZQWvnYJzoxuoTMSCvwxLa0uuAnE6kvKEQLP1OlEhILLyU7nE6/tmQz0Rh+JnvEOjSr0XxO4xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_185121_697724_9EAA84F2 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Russell King,

> > +	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);
>=20
> What purpose does this cast to void achieve in an already void context?
>=20
> We have plenty of functions that get called in the kernel that return a v=
alue
> which the caller ignores, never assigning to a variable, none of these wa=
rn.
>=20

Thanks for pointing this out.

On some older compilers I used to encounter warnings when ignoring a=20
function's return value, so adding (void) became a habitual practice.
You're right that it is unnecessary in the kernel context today.
I'll remove it in the next revision.

Thanks,
Jacky


