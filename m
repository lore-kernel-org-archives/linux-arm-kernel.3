Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED2ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/dzKFu5pmjAxFlzqXJLKewgA12KlzEgFjQwFQ8tSR8=; b=Q5YKlSxJzI35WREMZieQr5jWzQ
	LS8SllZNQUARWtw9f9k7IzTv1NppqAHFZ838RtZHXHywfBTJjtnVGOPBWInwN9hOX1NMpbsxlGM9w
	T6YZFdoUjN3dNqZOodLMxLoJgcExz6YhB0/50Y0y6ifHp/IxBoWW31UGg5DvZO3Oqz+8YtKGAWz2W
	X4zFPWCrwZZE7J//tNvTG2b5ANYACX7SUK9psLxtctaIGLU0SOqtUp8k3yfUOrcE+7iu7bCb1pxBo
	9Qw8TpF0RV7F6XgjKKiDsjx+c1TdY1lQNWGpPys0xotqihF3/0vjR0YizqaLM/M3HWk8mKLNAyehl
	p0Y36rWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjQI-00000003xU1-0rfv;
	Thu, 11 Sep 2025 15:41:22 +0000
Received: from mail-mw2nam12on2060d.outbound.protection.outlook.com ([2a01:111:f403:200a::60d] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjQF-00000003xSg-1Vno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdK3xjycymp6FF2LcZGUm7DEAZJAIAEOvFH1b9xjmegyJI9bVpe+UyiKHSTviVjtMIagMjsoprKAQIFxLdTP04lO/OSE4vbE5Iw8wAeSiX32jInqXOlWuY/OEX4l/dhej0A25tf8Kq+tzNsi4iPQdWWECmWhGCj7/7QKeKTbyGoe4XeocE8LCL0RUIqzQCoVQGqsAxrO8iO+sKyxwnGmpOn919/jhhCX7q0LtRd7by50qF7Ka8FrSluXJEve5K9305dJqDsc1VsZmuKQDYHl4OAjIxrHT5RjpqrO/5M6L5rMuy9BZnlRPWRs4c15TVNOCrq65fIvsQ4hdqspl08HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/dzKFu5pmjAxFlzqXJLKewgA12KlzEgFjQwFQ8tSR8=;
 b=G3qESmR9R9lHnRkjZx28oDvehRqmxEzJ27+cHzrjt5OtkXWhrFfPh+RdKm4DOc9hZivxsuJhVDwa48YHeT7dHoi6R/+D71CbwS9eRf3p+lskhv2Lrp3CSsfia6zoRGTmmqb6i2Lwp2k4PfXWlolCDjGBqpTKsUxVsAi6B1CexVF5jVUfM18FPou9wb2wW5kVZnyYoDurGpI5BbCHqLGJML9Q5fyx4QsXw+emm0QAuMoarX1ZRAlC20a72D4KAQwFOh2n5fVqwzac0P8/i+Of/TSaHAKwnZR/JhLRoT+kyV5Iy2c8A171ypfcY7EXqueFItwFb9cUHLofmMDfU+TgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/dzKFu5pmjAxFlzqXJLKewgA12KlzEgFjQwFQ8tSR8=;
 b=LVdOkP5eo6BMp0E/7XDJy8SIFAgEOs4q6vq42xZ2PdbOtQn1DfTJWqYkIg7YGg1piR43WrkTT/UtPZG+8ZihDEIcJ8OaXEnpOzcXfI2GBfNn5gQ3MkuW/gjdBQ3ZjyZaLI9f0D7f1OcKUAKvfanYBUqoL2VwW/vuRfMiVj2iijQ=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by PH7PR12MB6979.namprd12.prod.outlook.com (2603:10b6:510:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:41:06 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:41:06 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "Simek, Michal"
	<michal.simek@amd.com>, "sean.anderson@linux.dev" <sean.anderson@linux.dev>,
	"horms@kernel.org" <horms@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: RE: [PATCH net-next 1/2] net: xilinx: axienet: Fix kernel-doc warning
 for axienet_free_tx_chain return value
Thread-Topic: [PATCH net-next 1/2] net: xilinx: axienet: Fix kernel-doc
 warning for axienet_free_tx_chain return value
Thread-Index: AQHcIu3ACEM8+K2X/UGMrGFnoxpALLSOHqhg
Date: Thu, 11 Sep 2025 15:41:06 +0000
Message-ID: <MN0PR12MB59534339999B93E3C8D25E90B709A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20250911072815.3119843-1-suraj.gupta2@amd.com>
 <20250911072815.3119843-2-suraj.gupta2@amd.com>
In-Reply-To: <20250911072815.3119843-2-suraj.gupta2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-11T15:39:37.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|PH7PR12MB6979:EE_
x-ms-office365-filtering-correlation-id: f29b3066-2115-4f9c-9e1f-08ddf1499f91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007|38070700021|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?awEixjLY2IxIeHVMt8GBrrAoK1Z14N7aOa2vNpfSHC22bV4n0iqIgR7HqdQ0?=
 =?us-ascii?Q?TNdhHWWl5YgQeFcIPKuNeuGoqkvuKxeVCbtpueKEbOPdN8kuW3AWbmhvqa/W?=
 =?us-ascii?Q?mOGsAl/gxj2SannDgjsGh5iTde1/0tIk8bknJK4hE3g/QnCpz01Yaeuo8PDG?=
 =?us-ascii?Q?W9QK9Nq5NrbxPtXXPockwIA6ilUZfdpsjPkbR7IIQNGUGJ0mJr4JMXshL4g3?=
 =?us-ascii?Q?gdm6o4UJSKFdBPciDyoCDhgym1MXJISoTOjQN9daAzXOYP4qb6L2IvJOZ2BL?=
 =?us-ascii?Q?7S7Cdk0BWkMucGzgYMTQ5fYZpJH+JTDielQALhgJXhJsR4LRu/dVSqGp9bTj?=
 =?us-ascii?Q?ObIYkO9Eb6rsXs1pnJ4Bmu3eT9im2KpF88xpjdHpO2mhj3gGKkXvZdGHigWv?=
 =?us-ascii?Q?+qahwHS1NVIUexw1kJTXB2lbqGBBLOQCD6q3jsykU2rlwranJGuNHHrFmHCJ?=
 =?us-ascii?Q?84E+Po8Y9mwNXvjD8JbCzvohwtr9kZDovD8xRt4oS7LMtK4uHWNnt4f7mp7D?=
 =?us-ascii?Q?NyqLuaaoCm4UGY3jGpv++nVWX2k9CmsmpSW1POQh1/tVd7YB/AnLGS7U/dSh?=
 =?us-ascii?Q?Gh1RSuPX8RqYYtvjeOL7P9yUMMphSbY5SsZUt4D7itB5XZyUHkfeCzBTa3V8?=
 =?us-ascii?Q?GnsYUsUulIzwwhRlzkfMoDDQImxYtYQZ+5ANSApAFrmSbb8XjGcDXnUS/RIL?=
 =?us-ascii?Q?+NWsMBchk/jLmT5Lql+XZHU6RLcrtZEpXGMQ142rMBbJ6KqAn+VsGTaDlK2R?=
 =?us-ascii?Q?yr1k0tSt2wHhMr3zMG9AEW+H9LwKnFGXApJ9VC1RKfX4p/8jLEHWqwrB5Pyi?=
 =?us-ascii?Q?x3SEU4TFkrJKNC9clTCSWbHUFv4o4m1uM1jcuLsNhiREzK82Jl0lXy956aWN?=
 =?us-ascii?Q?OwqjuW5+hRJ45aYh2wRzRq0WOXpwlPUbV7+DPOuFnYL+hkb8gt+pHkwcM//5?=
 =?us-ascii?Q?5L8O0m4f1z1QPxTNcIRgh2XUZS1yd2V3OW5JtHbFHrS80rLnIJYnctpiBGpk?=
 =?us-ascii?Q?5IAty7eJDoPHRomqHCN67X95GTOnAu8h3B0qwpQS8UuBr+Hm5kJSoV28u9cm?=
 =?us-ascii?Q?L3/aaMz2elLqxAGGR0j5iv4zD8fuV+qYNn6kpsJMt+GguQ/Sx15DAgbI/tLT?=
 =?us-ascii?Q?H7+DBNaYkt8w1bDtcTWK22pv5rGvi7Zv+WB7IJu3suSePEhrIJpxXkETn1js?=
 =?us-ascii?Q?hBi0f8cDxrgCyofzpEj1xeELROY10hkAs/736cfSYeEDdmFOiqJiklCJMnNh?=
 =?us-ascii?Q?EfAJgdUolESpH4Be7xl5rWmO5Q/x896IO3aUzJ4THUF4LIihGYhsAVsMPgMh?=
 =?us-ascii?Q?Xo2N/KU2jXILkEy/uVIaiJfw7PK5zcaC+cILgGUCDVnP916AbnElGxf5sgwm?=
 =?us-ascii?Q?le2UI9+uzHrkpiOAGnQFSf+ExB8wWIGVzHywOCOdVnj2d6QMcfOveR6ksReZ?=
 =?us-ascii?Q?D38P2F3AoIolUKdsVI8/gPpNJkxQPQLMYLm/SeOnK34UEBSckX5tMvV9fdrS?=
 =?us-ascii?Q?zKKeUVgId9TL1nw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+idUZuHSXpDbZ+vYsU6L0og4Q2G/wio0WrlUAru1twC1B6lr+NRACVJNXCjt?=
 =?us-ascii?Q?YyyfHVqceiAo3O8YCtIoTLtoS0p77FGBKQ/RF4DdDgRujv9Ig5bsWOffxLrw?=
 =?us-ascii?Q?vDdRwF+3A/m4EQYckhZvZ70Y0+ShmL1bCbw6p/GODTxaQ4Q4EwUrMau7pk2W?=
 =?us-ascii?Q?HQI08X6l/0rJ5A30VHC/Z6uqg2wfLC7rrCovQYlHzAgLYjZUe20yIMus/RVW?=
 =?us-ascii?Q?rWEDl7v35RfnYLYrvG1ElFe6fKZYyhHVY9dXNMq0VNK+vYd//QiNb2TVyyNB?=
 =?us-ascii?Q?h2iMiVzFUIk+F5co7uP+epmW7PD9X59QFzc2ssepbyQ1PxVQtHIeyySEAweH?=
 =?us-ascii?Q?ZE0QepkGUjDPwi34Fg8bkVDA6wv6zXIDlm3rb1Sn5/xo7cJ+lQ5AgqabDQGT?=
 =?us-ascii?Q?f8jSy/GLfVUbNo2CMq8XuZwUNBFy69oLZhNEj3yHK/gvNH33F1M8SrVGdShg?=
 =?us-ascii?Q?oVvP0OxsEpQj3zcVt+i3iickQWC+AIrFduH8m+u3BKFCNSP7IYM5p04y9Xtf?=
 =?us-ascii?Q?3ViaTv1WIM0swu9CeDyke0KLd2y/WPfNAs7SFHhPTNvC9TDHkxOCerXsjVik?=
 =?us-ascii?Q?8vP63lnvp7y/2oYMz+iO79doteLyORaMSKCZkBwMyws4Y3bzBckzbTCBYlsH?=
 =?us-ascii?Q?oyoNxRSIC7rbxePTUsSUBaM7hCu61A6vULHmNYcRjKTjsvX7KsRYFGXoytJr?=
 =?us-ascii?Q?Jiqc9ZmrSJYC7Aqn+gNi7RuXGdAbmpwVzg+Y9Q1CrsvBxFE+ZUG0l1X30nyN?=
 =?us-ascii?Q?T4cx/dq8lpZkiClQSdT9/blMoIGA9VRDnbx3f34bkwjP5AywP2UXB7fGx857?=
 =?us-ascii?Q?N9ypJdLfVLuxw5fc0pwLR+CrfbUi3+Rn7DVnHKck9jti4hOrn7NZFH2zwwC8?=
 =?us-ascii?Q?asarbmIEt8eRp4h6Lb2p1NyGwd+IkKptWkjojNc1qJwyx6YYAIG0jOMgeXyT?=
 =?us-ascii?Q?DEfy5Lqkk9WC1YBJBHvS34j7LgWQ2M3vSWKb0XBbTbuDwOOqeKe3K77l2+5J?=
 =?us-ascii?Q?0YtREXExh0SGRQMt46R5ewdhLdKzLCZs4bZGdHhATjBTLKTXU4+Lw6fqvZIP?=
 =?us-ascii?Q?em9Ug1EtWx2ueiz8f3awy2Ei2UXK89nIbGTaN4xlsA4SQlU/UW3RwTgk3VNF?=
 =?us-ascii?Q?id4fG/8/SEnlmUaIhEhcpgALBFPuDGhf+2orx6askHm6swOvjebwRUG/6g2E?=
 =?us-ascii?Q?RR1Ne9JT2SNzXMnODDYVOguWK6nHMkYKBT9LQ2LxGfexeq1JrInn/TfjMJBK?=
 =?us-ascii?Q?1cuAhjNkeGBtzDRGsZSDsMmoLoN9qblvNKSbKHvyqX292NT8khP9wafd145v?=
 =?us-ascii?Q?fiU0fWG31prd3P2osaatTW6/jf696DF0U1g3NYgAgYbL+7huJrUZ62u7K5rH?=
 =?us-ascii?Q?cWP7ItTfjcsUMwDMoPJYPcKheFAqkZPlEIpH9uH/y4J6udWEse2ZqPWjah1j?=
 =?us-ascii?Q?x6o+ZfoZWEGCqJFeks4YewF5eCIzyPyhGEMpYwfDgaHnoad8LXOn2j93ouci?=
 =?us-ascii?Q?sTq9S9ugW81CrsduVd3CwjB5mSUWfe4J+NTfblrcTbqvewYDhZZcmdmResAW?=
 =?us-ascii?Q?X033LHRpKweHDdYk03w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29b3066-2115-4f9c-9e1f-08ddf1499f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 15:41:06.8185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bf7evDC5Z8yKx5xnl8VzT3k81NhE88hnpamhqGxHu/23rt/8sLWNYf2Jm59r3uZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_084119_406668_6ADAB811 
X-CRM114-Status: GOOD (  19.86  )
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

[Public]

> -----Original Message-----
> From: Suraj Gupta <suraj.gupta2@amd.com>
> Sent: Thursday, September 11, 2025 12:58 PM
> To: andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; Simek, Michal <michal.simek@amd.com>;
> sean.anderson@linux.dev; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; horms@kernel.org
> Cc: netdev@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Katakam, Harini <harini.katakam@amd.com>
> Subject: [PATCH net-next 1/2] net: xilinx: axienet: Fix kernel-doc warnin=
g for
> axienet_free_tx_chain return value
>
> Add proper "Return:" section in axienet_free_tx_chain() description.
> The return value description was present in the function description but =
not in the
> standardized format.
> Move the return value description from the main description to a separate=
 "Return:"
> section to follow Linux kernel documentation standards.
>
> Fixes below kernel-doc warning:
> warning: No description found for return value of 'axienet_free_tx_chain'
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index ec6d47dc984a..0cf776153508 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -773,7 +773,8 @@ static int axienet_device_reset(struct net_device *nd=
ev)
>   *
>   * Would either be called after a successful transmit operation, or afte=
r
>   * there was an error when setting up the chain.
> - * Returns the number of packets handled.
> + *
> + * Return: The number of packets handled.
>   */
>  static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>                                int nr_bds, bool force, u32 *sizep, int bu=
dget)
> --
> 2.25.1


