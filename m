Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg4+DKrzpktTBCueSoAGLm6ue7Hn4I+oyp1ttWn8C/M=; b=jt5qyWL5bQg0T9hhDSEwZz8D8u
	GLmh+ALuzQOjRiAbvq9S1XvfN7L0zxgv+Z4E42LXNJibBDKKZ7dTf4enUchTOyHg4k8yTYq1nwf+t
	0yfjcrUfGyiF4enXUQDYEsZ+/CmHAvHU765T+l6IhfBA/rXoLQ9kkWDRx9gHEy58aWmurSIHkHZqk
	zFtL9GSiod4wvvAYcdhFqnXDoHolUaSX2o/+vWWx2bWLKnzUxaBSqNVlIzVnbzjbDB/eeT/uEzlNG
	TdT3HhioPAyPdvtrIn3Ver7LzVCSuzL3hnFEs86UVJM1ELWDYQgGW9FX2XYzPVWgDd2+sXQdHkgm0
	SGC9bfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4XW-000000001xa-1rTo;
	Sun, 26 Jan 2025 15:27:10 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4WF-000000001jW-2Jk2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 15:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cc/tjF4XeQTH0PM5ZBY6JfTu1R8dXJmoCtVgr36EmEcl3uAZg2zbqiBYV4/BpRREQbr5Lx11btmBMG4XuVpQsZu4BzkCOYLepNW5+pwdxjuh48EE30x4l9uvOe4JmYRrTXucCIDcVoGqvwGCe4z5ZpxKdBnb7dQoMtqZxr4NIRREnOESp83YprkPXi/PsEMV1AV4axcoy4KNHkj3ChYaqDXOud3+Zq0Ds8nLKioX5r2nbqhCiR+GdIih1NRFC1/ndONKbI5DwAGJ0KbG708DSI++XRr/Riv6douJ9TtVY1nr0FduCGJYY4tijoizIGoCJA/wtnf59pW0opfQM02Xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg4+DKrzpktTBCueSoAGLm6ue7Hn4I+oyp1ttWn8C/M=;
 b=klTB8B0SypLKHyZtcwjaR4qApXmzN1tiyiYinv1XipBSIDClpWlToxdq6AB53DGvQeaKAmN95nhr/j6DaaVAQqyCi/u0jPu6bcnZMi9dNRhKSMyTGqXoSpiEgRc2mdyw7s0fRpmmhEtjFCp6lxgEYffBOJPok5IvLiW58LNkb1Hd03bazeSOaNf35hFDOhYl28SxKkVlzmYRZOOTIP7labn93EPMzL0wtp2Xg06+ZK8wLGca2P8eM7puZiCRhSEXKpHU6/hydyK9J1/22bizRsybpnvPDp44s7WKZpE6Px6WlX/OAYpeyxjLQIbz9q9L4s2e3xb//aB6wqpBOIe03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vg4+DKrzpktTBCueSoAGLm6ue7Hn4I+oyp1ttWn8C/M=;
 b=HA4KJ0ZQHZs4IlrB2LeH6wXkeUugEvWkbJk9row7uDz+eaOidpbTg3jJsJ6Pcr+KhNdVHHezsXJAAEOfi09/pBLwTvWvDFNAvZqYa1MV5FltNsmo7ONfVy28xuSHvpMVyTL/OFsQKimwiag5L8pFr6EtI799nEK7a0BVXw33nOTRWejXn1h5WqCoGN94UnfcltzVQ2OHjo+ieMjKkTUAefmsdXWbdpnDCs9DpZm7qe0OPjvpkw9gpbXDpkjADDE0KZ+66upTG9Y4R2b2Jcq3V+EfYf47XqR3UvIgtO0iYWHkg4xb2XuxRcGVKVamnvrpzRhmgPjNPrjmc2+Z3xyIYQ==
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB4PR03MB8657.eurprd03.prod.outlook.com
 (2603:10a6:10:387::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 15:25:39 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 15:25:39 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Marc Zyngier <maz@kernel.org>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu
	<yuzenghui@huawei.com>, Bjorn Andersson <andersson@kernel.org>, Christoffer
 Dall <christoffer.dall@arm.com>, Ganapatrao Kulkarni
	<gankulkarni@os.amperecomputing.com>, Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>, Dmytro Terletskyi
	<Dmytro_Terletskyi@epam.com>
Subject: Re: [PATCH v2 02/12] KVM: arm64: nv: Sync nested timer state with
 FEAT_NV2
Thread-Topic: [PATCH v2 02/12] KVM: arm64: nv: Sync nested timer state with
 FEAT_NV2
Thread-Index: AQHbcAaOrTBbbSLpA0ukEQZvbJQCdQ==
Date: Sun, 26 Jan 2025 15:25:39 +0000
Message-ID: <87frl51tse.fsf@epam.com>
References: <20241217142321.763801-1-maz@kernel.org>
	<20241217142321.763801-3-maz@kernel.org>
In-Reply-To: <20241217142321.763801-3-maz@kernel.org> (Marc Zyngier's message
	of "Tue, 17 Dec 2024 14:23:10 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB4PR03MB8657:EE_
x-ms-office365-filtering-correlation-id: d9cbbbae-32ef-447c-1f18-08dd3e1db0a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?4GEbVx9bcR11FumCTr4eM4L+KUjv5i49aqUbx39+mXe6OHrIn/BA5eHbYJ?=
 =?iso-8859-1?Q?p+ZyGilDnf2NO5BLh3QtQ/kk8AUM4LToBB1VdT/0rz1ubnp750Lk9IUAoj?=
 =?iso-8859-1?Q?jQzsY5/y/Z0XOlGK1XacQUfNYNFbQgJf0AHWIaJo46NHLnN0LAHx8fTwy6?=
 =?iso-8859-1?Q?Pu1+vokZRqjXnHD+K5OtQKRBovAELvK49OYCIAHuLmJnJd1yJaCgKjIzp4?=
 =?iso-8859-1?Q?PQWmaNrzavNDFZX72nWXz/mR/YDN7lPfb5D0rvdI4nVryoVcICkMe4nZ0j?=
 =?iso-8859-1?Q?c1J9UlzpLSbfThd9Jm8l1XpFMuBTa/xs8D2p9h0uAylC/n5tVqhkdJtDCZ?=
 =?iso-8859-1?Q?Z5a71+1t7Eez2yJrDgNU7bIlw7olXNqJEX8k+o4VjI/ykLAjxvt4UTnqiv?=
 =?iso-8859-1?Q?jQ2KytK8TbXS/92VgWimshXwmb+zIsTQZYHpUn6OtpzeWtlprgPio0ljid?=
 =?iso-8859-1?Q?Q8HgTx7EySoHTuj8ibfeOvz8zGxRVIlGZorMXYeVDl3DnlXNdUqIiWUhwb?=
 =?iso-8859-1?Q?I8PnJaXa2MYBKljC0sdMZB1TVRAtzA28Xwlso97k7ULYF4VUBhju69kzO7?=
 =?iso-8859-1?Q?2bQoQy0tjVVPEQys2S1eFao5RjQXHOz2J3jbWEnsE4jYiqdmBHD2Jjok8k?=
 =?iso-8859-1?Q?spJhf26F2NaThWUPTGXhq8mvJSevXO1eDWm4lTm0WGX2ciA/Glf++En0jK?=
 =?iso-8859-1?Q?GmL30vndZsGeTKdrbedFTTddaap/0mX6B3y0qkqW62qiNkj6Cq6Tlp+SMJ?=
 =?iso-8859-1?Q?PX8Fk/Qd9xYYsQN6ZWQjBFMtTxi+KLgSSBbD48zekBqdwDhk3yhPdKDQWx?=
 =?iso-8859-1?Q?mXbvqZj6ZxHujGjKHD6JDvBf/Li3KgxkV6ap5LOBCxYQ9tcjztjkRf2RTk?=
 =?iso-8859-1?Q?REvaWcKogrhKDjojrM2i6Gc/IeIxF/an6ohwvcsm3WJvs+FbbP1+1i7o/J?=
 =?iso-8859-1?Q?I5S7tFbj44pEeSpqusRZdwZoD0Yfw7FtdChfHeZXnAZJomL4mpgoBw7bvE?=
 =?iso-8859-1?Q?ILlrpi/eKD4wseAY9Tf3yCJU8L9w9u3XITkZ6EcBG9utCVmW0t88OEDTuS?=
 =?iso-8859-1?Q?5phFlTIv1LX5Q63qdPq1u++RGV77WRHwAVurf7WWCfpfSGP0ToD35G7lwf?=
 =?iso-8859-1?Q?RvP4S3Zwp2/0oshupUqmjMBhJCvGSxq8ieT+9rDw4L1Pai0vQYr/xzDujx?=
 =?iso-8859-1?Q?y58HWBzho7wzQe37gvUyGUF4KKYMwDciNkJm1Itr9yRe1kylm0ameOfkw4?=
 =?iso-8859-1?Q?rO6xAo0UvmgvCo2ygE6IPANzLGrasUQz5QJW+2SOYIf40NW1dZCzCREP6j?=
 =?iso-8859-1?Q?Qx48P4zZ87ayPhNeDLLA79cBsfnIv2jPprb8BP0UFo9PDqB25pyC5bVSsS?=
 =?iso-8859-1?Q?96XKDRe4iDe+pcks5hY9stHMnNOvehEUlvSZ31RK+SAhp4s95Eu5i7+//P?=
 =?iso-8859-1?Q?pLVDktfc7Iw/ACkYXn1PNxJwBOxKiZQ1UD8Rimo48CEM+X+6UfE4bVnzbH?=
 =?iso-8859-1?Q?N67/m0DQ502IDjm+859oHx?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WkgU/8Vu27y9+bSmyH67fAXaGYlSCTPGPSXo6zMwRZ2dXAWcI4MURsVXc4?=
 =?iso-8859-1?Q?GKZFL3J3DVwtPHCCz4J2+fyeZu7hUXjrnAHRZ7YZQljJQUPEJSGP8PIPTo?=
 =?iso-8859-1?Q?HyIehgMfw4y4xXDPDwqI73J/S52hcV7KZPX95Ys2kUWwFznFQklsiUBOnp?=
 =?iso-8859-1?Q?OvhCs2UQ90OUkXfS9Kzb/BXtOPSyUCjW/ShQ1bVzpRBSyqOC7zjPwS0bGb?=
 =?iso-8859-1?Q?98X9TaTMGiw/qJDd4ScQAdVZBk5Rdm+arghp4lewrC/H255K/Rt2oZUrZo?=
 =?iso-8859-1?Q?WRb2nSK8Fm3vRxLoZI7hOye2HHSWBulcLqXxm59OB8k8BHm6R0ByFXuU3J?=
 =?iso-8859-1?Q?+4L+fiJLIr6NNA8UyJs5ZG5QB8xrPViq3lMZxnIGzln0+KcJU/jWcNSMiI?=
 =?iso-8859-1?Q?HFaaj6xxujBEQ9UHU93ZyildJUP1ZemlXBGPMSaDgobQD9A6PFaufxSyfn?=
 =?iso-8859-1?Q?H8untUn8/1oO3P5N7gb1WeVMDEq0a3RL1Xq4DLIYIifO7Uu6LrQndvS0T7?=
 =?iso-8859-1?Q?CUyUZIeyF8BqSatepKFgF7335rP9/sGtIrmNHLzDECGqcTRpqL5SGrA+Nf?=
 =?iso-8859-1?Q?SkdOqPmSnmVget+M/GyONTIjRCNsYUa8tg8YnPjj7FR/fyksxOZ4OVvjd1?=
 =?iso-8859-1?Q?xPBME38MUTVV4a0FVsbS2iOklX9Z5xYxhLoZ28eCOuBYFvs/xlua9oKkyH?=
 =?iso-8859-1?Q?8rWlHV633pSbO9s2FsGG1cgKUQctnlPRa8Shnm+3lF5CUAr/H9+XyQt0c+?=
 =?iso-8859-1?Q?/gS0jTDh5RMvaENySwclfzXRZTQhqGb36yCY/nlz4FFzE10Xfeu/UGCMKw?=
 =?iso-8859-1?Q?gfFgZHglwz8KzT/anaO3HHc91v1eAqTYtaxOt+0en1qZdVMI7YuQ7quH/o?=
 =?iso-8859-1?Q?ofdzfsDUXjVu+9PbVW7Nu2N31liJxD2f/w895wlndCiEWFg3mV9DisIRZy?=
 =?iso-8859-1?Q?1PLc1Mr9vMxkm2GbtDsTiHDHK8Px6JiyMJliZedMn+OXMSuQbmfcC8AF9w?=
 =?iso-8859-1?Q?VEGVrCGbyFwS4vtmSUgBfKEv19BZLP7pSUccZAgU3YmQAvnDGIhca2G6xw?=
 =?iso-8859-1?Q?IT1f1YymW8hUlOfrRjooYHLkc1tkA8853QtioyWbxY6qHzk1mirKH0/3FL?=
 =?iso-8859-1?Q?EQSmIIJR89pB38crvggyL5W40VoIMIZwxOw2/cf8Gxkvv6bK53zFvVSDJG?=
 =?iso-8859-1?Q?U8PCy4VLfzjY1EqGTH5XFjLaIhAcvWRlS3hn92sXSL6f3aB/0GQdN8Sguz?=
 =?iso-8859-1?Q?Hwhq0U/m+NSitMpdQlPFWfeU1ne3rYYxGbVFIJ6bmmHpeM8O5ZfhpRf34v?=
 =?iso-8859-1?Q?/81a9oLG0wjsUmIPkjFkhbRk6gDeS/fSgKJqvTt6kjYF1GXq/6PTAxsyqy?=
 =?iso-8859-1?Q?JHNLw81Yz5KfvIzIYeeTyInifkN1VD2z6js8jMjKvu/peArIgdnBqHCgOB?=
 =?iso-8859-1?Q?+ea1Ggq2YHH4St+AUy1Ee53UH4UEzxR4Sva82MT+CePlP2MCXIZTPP82wW?=
 =?iso-8859-1?Q?iTXWNnO70Rg9qzF7uMvUDlm1sm88ETrTUmJgMFYZzj8g5aIJQNhGxT9n38?=
 =?iso-8859-1?Q?arRmNXmWurt76e9kP9bDgPy4jIT7CTZ7yaOEkVf4PqHxlLznNjc5CJCJEM?=
 =?iso-8859-1?Q?R6i77QOmlUImbV44mQhUJdtC9huhGyGkHjICudD6yCVebNLR4kAzkJiA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cbbbae-32ef-447c-1f18-08dd3e1db0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 15:25:39.4127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZmV3X7t6BKl7A8te1bSUmZjcZXzmypcNjBN2DcKeQBhX+zt1IWXlxEVitWgayWbTuyRGHXWAGvcGnDazRibTCzARgzJlW++7PXsUq8/1Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_072551_622358_8D67A8B7 
X-CRM114-Status: GOOD (  25.13  )
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


Hi Marc,

Thank you for these patches. We (myself and Dmytro Terletskyi) are
trying to use this series to launch up Xen on Amazon Graviton 4 platform.
Graviton 4 is built on Neoverse V2 cores and does **not** support
FEAT_ECV. Looks like we have found issue in this particular patch on
this particular setup.

Marc Zyngier <maz@kernel.org> writes:

> Emulating the timers with FEAT_NV2 is a bit odd, as the timers
> can be reconfigured behind our back without the hypervisor even
> noticing. In the VHE case, that's an actual regression in the
> architecture...
>
> Co-developed-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/arch_timer.c  | 44 ++++++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/arm.c         |  3 +++
>  include/kvm/arm_arch_timer.h |  1 +
>  3 files changed, 48 insertions(+)
>
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 1215df5904185..ee5f732fbbece 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -905,6 +905,50 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_timer_blocking(vcpu);
>  }
> =20
> +void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * When NV2 is on, guest hypervisors have their EL1 timer register
> +	 * accesses redirected to the VNCR page. Any guest action taken on
> +	 * the timer is postponed until the next exit, leading to a very
> +	 * poor quality of emulation.
> +	 */
> +	if (!is_hyp_ctxt(vcpu))
> +		return;
> +
> +	if (!vcpu_el2_e2h_is_set(vcpu)) {
> +		/*
> +		 * A non-VHE guest hypervisor doesn't have any direct access
> +		 * to its timers: the EL2 registers trap (and the HW is
> +		 * fully emulated), while the EL0 registers access memory
> +		 * despite the access being notionally direct. Boo.
> +		 *
> +		 * We update the hardware timer registers with the
> +		 * latest value written by the guest to the VNCR page
> +		 * and let the hardware take care of the rest.
> +		 */
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CTL_EL0),  SYS_CNTV_CTL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CVAL_EL0), SYS_CNTV_CVAL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CTL_EL0),  SYS_CNTP_CTL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CVAL_EL0), SYS_CNTP_CVAL);


Here you are overwriting trapped/emulated state of  EL2 vtimer with EL0
vtimer, which renders all writes to EL2 timer registers useless.

This is the behavior we observed:

 1. Xen writes to CNTHP_CVAL_EL2, which is trapped and handled in
    kvm_arm_timer_write_sysreg().

 2. timer_set_cval() updates __vcpu_sys_reg(vcpu, CNTHP_CVAL_EL2)

 3. timer_restore_state() updates real CNTP_CVAL_EL0 with value from
   __vcpu_sys_reg(vcpu, CNTHP_CVAL_EL2)

 (so far so good)

 4. kvm_timer_sync_nested() is called and it updates real CNTP_CVAL_EL0
 with __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0), overwriting value that we got
 from Xen.

The same stands for other hypervisor timer registers of course.

I am wondering, what is the correct fix for this issue?

Also, we are observing issues with timers in Dom0, which seems related
to this, but we didn't pinpoint exact problem yet.

--=20
WBR, Volodymyr=

