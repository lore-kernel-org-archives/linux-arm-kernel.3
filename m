Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A26C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLFGyXG79IW/gSRC1T/DMIRmpkOGVP81Syq46mcP/XI=; b=uFAJsidskbdhOaixKn3QW/5Fu6
	yiIgaEsX8Nfko+E3flAsm0jwN+y0LGQH1rDRMQHi7r2OfWuu/kMJOkxMsdYzaj7qS46BYji5oGPSr
	gEIwr8A0GLA3KSjX/mdaj4MJ+zhhWAhiF1YC/Ea7qrTWblInwvpnJaCA3kVSrHB5hUU65SCi6EOcv
	bfCdp/+9eYfdikKeFNCtHA4MEXth8yEPZiMN0pj5gvxH/5vt9OHW1ySI1HunpgaDOAzEmbc+BIgwO
	XhesMM0h8oaotgv2G2WB1HYBW1Px00CYS4tdPbJCIOWeuWPpLEZZO3Lt4Zd27O2ayUO6MJuYxebp1
	Rdpn6EaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGUW-0000000HZEy-2SJN;
	Sat, 15 Feb 2025 11:37:48 +0000
Received: from mail-bn8nam11on2061b.outbound.protection.outlook.com ([2a01:111:f403:2414::61b] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGPa-0000000HYSW-3jZh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5j3zxWiSszcnkOMhp62i+qutddv7CL2djCOkbHvFi7Ieds+dEj/sVYlUz1Jj/0RGmMoM2rMOwehQG36ytmintd/cPcb4kBQwjIxblDa7GsyIqxSyp5C+bRHjpWLP7tywZpJiIxw0NVea9otVWajYrv74WCtjUp1cBGtkEKwwPT9psZR7W1FqubRoqctVGhLmY/H0oOZy+FOjjiZ+dtjzZgzYGUeqdnciSkjHXgCx/NbLO1UzQlTgdnGIPXmiRsDz63iDnQWwgfhShj/V8I1VwyuXo/dShGfKDMyHigBngLlYpxBqzKoSCPJc8Uj3vj9IKsh/16CwNtDpE7w9GobgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLFGyXG79IW/gSRC1T/DMIRmpkOGVP81Syq46mcP/XI=;
 b=IPr6f6K4oiFfWFKYHELcYFffMFVZlaI62ux2vSxeeUX5xV5bJSinnGFBDg4M8a+ymur6SAoaemTnXLEX4IBVbSBXSK8qcgjI8nZVWqBSAnAhhaoA/H5Likfz8F/4OsDEV0jR6qzLT470iGNKz3/J+olMzv98aczKUnhFBWvliSFSQX+Dzm9sPwIOagMUSUiWgZgPX8cxE3rCdcUs4evVf6hmWIrBy3SW8dgqdpZ6bU/qMf7dOpa3a6Mybal1f7lXdWLT7z5AmiqA7PO0Pvi/IqbHzglqDEfw192x/ba9u1Nza2H3y6+mElPqujHck1cWsVVIss4Xdjmv2UZZYWL8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLFGyXG79IW/gSRC1T/DMIRmpkOGVP81Syq46mcP/XI=;
 b=Q0yG4wDFfmmXT5A1C/bDUjBBKGOw0wT1T/p79//UKOcLg8RDY4UI+YarJTanxRGY4KiVJ/lgiTIpUC9bOmelvIX1MX3rJ5E8mnf9SoJ/W8mqmBWwgbpjUNqwvpVECoVHhvX+o0zWxXOP9jYvZxgWhs+qh9gz7SEmp9L28jqHkrE=
Received: from BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 15 Feb
 2025 11:32:33 +0000
Received: from BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6]) by BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6%5]) with mapi id 15.20.8445.013; Sat, 15 Feb 2025
 11:32:32 +0000
From: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
	<kuba@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: RE: [PATCH net-next] net: xilinx: axienet: Implement BQL
Thread-Topic: [PATCH net-next] net: xilinx: axienet: Implement BQL
Thread-Index: AQHbfyVcP9M74iFYYUylKNMVcuL6ibNIO9IA
Date: Sat, 15 Feb 2025 11:32:32 +0000
Message-ID: <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
In-Reply-To: <20250214211252.2615573-1-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6571:EE_|CYYPR12MB8870:EE_
x-ms-office365-filtering-correlation-id: 7fcb2ceb-d849-4116-622e-08dd4db47039
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GciWJ4NM9AV3DJDckJnsnvB3fnkpahQhM+CFZWqy28TpLjgCSjIB5qhb8U/K?=
 =?us-ascii?Q?x1AZ5Qzz6ZERWufUnayIIIBsgoBa1YkyrF3qOrviODih0NG4seyKN+7rs+7y?=
 =?us-ascii?Q?owH7kZ4QQATgWCSzcHILqUJq5dzo0dlwPLgAo+eCZVzsJC5vmIRebSi5HTfG?=
 =?us-ascii?Q?FjzYbcgz8dbRaS5FFE6uaeLBvWInADTovHvnaPMFqX8qAS8eEFORbX880n4d?=
 =?us-ascii?Q?zJ3XH26SYjyhJpNJVi1BcX/svzN8S6QL/wAhNF2reMTRAEN5Ts1rnqDLjPfR?=
 =?us-ascii?Q?woH9eK2/XFxw9FygQwWuaFjbkks0zeYO0l9MunS3xlw+dA2ZvehqWmaOJgch?=
 =?us-ascii?Q?cz/eAZfyCSQ/GvprsUPYKaAFILfHpDYu2p+/5vRUBsPqvL471PPdF+eVYMUD?=
 =?us-ascii?Q?6BJOKYfnigmRPzsnr/U750C55fXA/IzwPdHC/PPBdgQP6RVxUVSHT0cL2vyR?=
 =?us-ascii?Q?d+GUbCzreA7CHhm7nD65VmD+2PCRi+NlruDJ5UFZ7uI5hFwpAYXYuk0ZE7Cp?=
 =?us-ascii?Q?aPGa7Z6/p5EEVTu29dlEw2rdCjx9kGdCLYpJn9FB9kJKKXTn/Kyf5/QOCo61?=
 =?us-ascii?Q?KYWB8FzUR5wqMqgwWJ5DwJYpn02YHQU1szwG7YvCmoLKhqjNzfkJB15y5kdF?=
 =?us-ascii?Q?8PY7kfU2m2F+UzHdU7zvWp1WwUyBzcjnkxTa31yc46GulXl5BKK2lB7++4D9?=
 =?us-ascii?Q?erQHIGpcIB82iXgfnj0zycH6siIFr9Yf1c7c1ifOut8/uty2vibt3LhABQ6/?=
 =?us-ascii?Q?8Sg8poA27un1uREu3HWsEK+NV1PPV0cGPXzoPnDoABVZ2547Efy3YgX/BNMF?=
 =?us-ascii?Q?Ry3wbgsQLCOEWk046BPdOSGZN7ekDnav+xNUEzLFPcw/QFBjJpSPdtrYZRdc?=
 =?us-ascii?Q?p6GZ1qzvJlblRHhuJcfUVGkZIsXyUe+n7PxxmCjYkzW1Q12pv++PWN5XICgF?=
 =?us-ascii?Q?TjdFW8SVhMHnHlKtjCoSmTHkYov0fvaQzduaUPsjb+kW4MBhs5CQjCa9SeYv?=
 =?us-ascii?Q?iE6W2Z1GSCBS88gCXy1z9Uji6rodfTGg47YuNOG/aS0HIa+dptlfMVWobDmP?=
 =?us-ascii?Q?2k3C0tRluUqHdKq+eavJabnpDhLvtIIyO2CchFUgFg2mTDKBKuAr/9gIB9hV?=
 =?us-ascii?Q?Rc687TcLRhgk6k+ugKCDCPv2BGDZ6CMGqquF3SuftvYjzK+yGVyA0t87VNZT?=
 =?us-ascii?Q?8cDeYOQ2INQXjjpuXfAMRoHUnJ4sS/zLNW4JnY4PuTtXoPSfQpLK1nYb3u/n?=
 =?us-ascii?Q?503vI/7rIdNjhzNToeMgykVRmedEdqyFFe2t286L+70nWrvLkuJxRVryCSYK?=
 =?us-ascii?Q?6S260G83q7IsIlQIUqlB8+GXnbixKRn92M1Sfzop4Jnk81sfTueknVUrA4UA?=
 =?us-ascii?Q?EsoWSllddPpvd1//8/kBRJnqOo4G21Naol7EtzsC84pbez9kagmYIBokbMnu?=
 =?us-ascii?Q?vhpSjLQ+o5rHxy+SX1Ut/sFUtEH4u7XW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6571.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1I7h/3OkqJ1gYj4KrDrLB1zeEx7JXsr2VlxuToIJuRUJJj03RcIKYbbyGDNE?=
 =?us-ascii?Q?CG201pJL4gQhCZO2tBbzHhIX4AT5E72OJe6nqSlLYb0aqeyClQIyb4/cCq2d?=
 =?us-ascii?Q?lB6vdnmUY0Qky/ngUSeSIWnimLslNhszRjdwWKgFZUxNmyvtCkMoZ+EzzHrO?=
 =?us-ascii?Q?QRvygvjDEnV0P/sImNQor16hyJ7dqO3OtiRnTc0gLOReBcdlCpI2XMNkPzIX?=
 =?us-ascii?Q?mRmQteXkTEcL2fbrtM1BXZIwsviR5eJ68VWHafUR5QLHmRAqcuG8TcI7dEfw?=
 =?us-ascii?Q?ZAtZUQ/cKwcuX0s3UcVUJ33whdXG04A9qO3ZC2h/b/gLKWsoLPlto/d2MMn+?=
 =?us-ascii?Q?DdvY3hSSVNYMHQRvj4YFJEiNo0maY1N8PBYqg5jWeacdxpRF1a3152aBcbPc?=
 =?us-ascii?Q?cvczcBNwzFsQRuLqDVpCDFgJiDIG4v9rgqnnpugHF9Swxl4Hb/TtcZqvf/DK?=
 =?us-ascii?Q?xgCRY5vvc2YkaWDC/iJ6o6QrbSJOTejsKGn5H4rbVhhEvUt/3A9UuMneD+nE?=
 =?us-ascii?Q?5Hp7YLcJaUapgxFwlkV1x8zdCXzOGpZVspEAcT6Xmo2tDYFR1QFzfZncmwDJ?=
 =?us-ascii?Q?7uuNvvXcRLvtQ8J3FltbMnafldFykeI/5KJKPmLDcNMlFT7Uv2/YWURNWpTN?=
 =?us-ascii?Q?9tt1leaiV8lCTjw22Ra/Applt72UF1UbiXa1uA7oGwebVxxiPU4eaJJHvk45?=
 =?us-ascii?Q?R1Xlgv3xy3mnyYUjOiIcc3oS3HQ7y+L1xP58uTqmsIOyx09G3GdxiUo9P48J?=
 =?us-ascii?Q?dYXTfSjnQgi/vN8ul3p5cBp3O/BPz9Ei23ed1mrSBnksWzZhbn1jW61igZVz?=
 =?us-ascii?Q?4HIv/ClVmXMps9Kpwn2NtwOK6yFo0JdWQUq0kWrE2oubbRp5b0WjiLjRv+7+?=
 =?us-ascii?Q?YmA5ghnQFaLgPq/2IsyVKN2UjRDjkT/VD/yO9FvUR8BgDuSx6ltrwx9N58T+?=
 =?us-ascii?Q?ykTsDAWXb4m8vzdIrUOgEIfuigvTHY+563EiRGVKGlmhS0FGnAHjWV2r9a8c?=
 =?us-ascii?Q?PopBSn/NGy6iDh79U8kaznoObSyG0lNpI+usXJ6yrsqC/MUcYgbRZyLAFj7q?=
 =?us-ascii?Q?hBA5caz5XakgdY/5wOOW6VjYwcs1Bjjfv7r6PY+9RFRzriSJRqpRm5UX37Wa?=
 =?us-ascii?Q?CO+2jkwjkGydPEXCG6SkzHXfijANDyTPwidSqeDoe/n/ZR9d5rv3Lfg7YeEm?=
 =?us-ascii?Q?mX8D8vHTa0pVl87FFkx2lzczI7ZzM4eWsToxj0C7LNBbiK1GpHCdaaenuRRC?=
 =?us-ascii?Q?evc8D8DvnCasTcdYMcryEb1g0ZyMijfga7gcIqA3Zw60K4tBJdr0tSkM8oAE?=
 =?us-ascii?Q?XyNPlx0YtmjninlMY3/iYMNHjkjYBoPSN6MknxQLUqtlkDoecnajexZGUxog?=
 =?us-ascii?Q?V9vNLjxB8qCxoMS1SxSfcqAFu6BofdcSFd0KXAPgKCZfX0Kn7Qx95XxYAhLQ?=
 =?us-ascii?Q?YWp6UjBIfuNRo0EwPUst9j6L6uUqMgIKlK7+HsRp1/1cCCAQk+4RG1vreWib?=
 =?us-ascii?Q?+qSHLf1aZmkQB7D9PX5U7UqmnToEmdAYkRz5be9mj2VfnvAMzhyPqLVvyO5u?=
 =?us-ascii?Q?K+Le6RqAlYS48ckqRDY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6571.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcb2ceb-d849-4116-622e-08dd4db47039
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 11:32:32.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0w66ByROqBxD5T+82q2JWr0CCnc3U3QFvIxIjwtS0sBZ8KfydJtJ074izXtTaQsoQyLYQ1EU8XauGn2VJiszdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_033243_108588_52A64052 
X-CRM114-Status: GOOD (  16.78  )
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
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Saturday, February 15, 2025 2:43 AM
> To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>;
> netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; Paolo Abeni <pabeni@redhat.com>; David =
S .
> Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Simek, Mi=
chal
> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; Eric Dumaze=
t
> <edumazet@google.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Sean
> Anderson <sean.anderson@linux.dev>
> Subject: [PATCH net-next] net: xilinx: axienet: Implement BQL
>=20
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>=20
>=20
> Implement byte queue limits to allow queueing disciplines to account for =
packets
> enqueued in the ring buffers but not yet transmitted.
>=20

Could you please check if BQL can be implemented for DMAengine flow?

> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>=20
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 0673b2694e4c..7406e00de0fb 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1002,6 +1002,7 @@ static int axienet_tx_poll(struct napi_struct *napi=
, int
> budget)
>                                         &size, budget);
>=20
>         if (packets) {
> +               netdev_completed_queue(ndev, packets, size);
>                 u64_stats_update_begin(&lp->tx_stat_sync);
>                 u64_stats_add(&lp->tx_packets, packets);
>                 u64_stats_add(&lp->tx_bytes, size); @@ -1125,6 +1126,7 @@
> axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>         if (++new_tail_ptr >=3D lp->tx_bd_num)
>                 new_tail_ptr =3D 0;
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
> +       netdev_sent_queue(ndev, skb->len);
>=20
>         /* Start the transfer */
>         axienet_dma_out_addr(lp, XAXIDMA_TX_TDESC_OFFSET, tail_p); @@ -
> 1751,6 +1753,7 @@ static int axienet_stop(struct net_device *ndev)
>                 dma_release_channel(lp->tx_chan);
>         }
>=20
> +       netdev_reset_queue(ndev);
>         axienet_iow(lp, XAE_IE_OFFSET, 0);
>=20
>         if (lp->eth_irq > 0)
> @@ -2676,6 +2679,7 @@ static void axienet_dma_err_handler(struct work_str=
uct
> *work)
>                            ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
>=20
>         axienet_dma_stop(lp);
> +       netdev_reset_queue(ndev);
>=20
>         for (i =3D 0; i < lp->tx_bd_num; i++) {
>                 cur_p =3D &lp->tx_bd_v[i];
> --
> 2.35.1.1320.gc452695387.dirty
>=20


