Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73141FB3CE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W7QevSyW0++d+cfhj6us2hiwVwmhH1Q5njgwCuSTPc=; b=UKd/58jUc3gjYvk1+yctSOYq+B
	ZvnxQEy2dP12Ufw9GR3tdr5mujzH9yWDoSIWerbt5CKUmY9TQ+4zUQ9411uwK3N0f+R3BQCurU1Gy
	0dVAlYgRmLmigrADD5FjBC/yXnkWyW6ZvoTpWISgC41V5BZFPzImrcKxgjHODvOtthbIJX+zUSnNb
	YvDqJ6K3EzFpi94Feg9md+TXcca+MpIgxrGSx3cfnG4coxjONYZahNPLj+jmiijjw4dgbIdT6rI38
	dDUOzWYp7cUGToNNy7csds12Lw7yrkBJVipP3nVvqP/HuqMWjRHbu41Lh28JwwQHKDDpPr0Qf43Yz
	/oXUDseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7938-0000000AydG-0ifj;
	Mon, 30 Mar 2026 09:36:46 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7935-0000000Aybw-3D7P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJebsJc/jN8ubzJ/Pko0e4nQk5KAr0/xR8D1V01mvNYowVVszinO5iBkXxUjaAbOqXmqVAVcUo4eGtjVkwTVZhaZZF1n+67lDG+6sAc298wXqcG1xn/JibHf8oYi0dHDWV2pnLvJIXrefKWt3O70bXls2obo8HxVRVX8EHWIp5WOxxvOQtHx1jqEockIbQQcBbPOSUgP/KPfAV6cXCQU/60yQsWDljoyo6ReVeJVeXFpUg6w8gggijOnoRmVPEhOBSqoU9cFhc5P8Z13wi/juNJcjrcVjkd/oqToMq8A7NMy+aMQpy1fIePZvjucK7rRVKB2ArNy5ZFTArt3TRpKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W7QevSyW0++d+cfhj6us2hiwVwmhH1Q5njgwCuSTPc=;
 b=dm2/r3vjfSbKhCVET949wmzhHu3913p2g/HNO/5gcgeQj6ltsFUTa092Qcw9uhQfB/soANuCrjGmGj8thS7uJIKKpE9hph7FwKXs1ZGDEU+URgAj6fzmJ1C4mOvePSX+418jVv5Ah9Zqh5cUmmInXzq2Q0Ye3IEPD5nOB1K4sutyV9hSXJDDOXy7HZVC9KNmX6FJEbPlRQQ8a0N288U8Acy9g43WywG1CEZovDZhOFOU78CgoLDURRJHGgQdk1N/kArVvm4UZZkb+3K/5XUT53k6XSqdQPipQeXKpSX1ZoKpSgDXdv1fP9r1eYCXlXlimEYqn53sOIDT/8drR+Kd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W7QevSyW0++d+cfhj6us2hiwVwmhH1Q5njgwCuSTPc=;
 b=Q6J2UMbJfoFxFnXfW5W6d6MbexRIWrGqP51Q7s+2cFyra2RXkuBja8qtsTqfQYKgmZoDPUvT0h2SxImtnSaMKavALIKpIDUKRbjyKsv1YbGfJmlcvmTMYeGKBvmKmXzfvI6swD3CGXp0QDtF6VtlUH89ntDk6rnfgHt/JB7ElmaPgK9AN0Is9QNXHMr6t3AMsN5Tl8mstlIymH00gVvW1yBuvC5565zYbtw2Dleqpi+EQ/G8JG4/NhQKd8bEsW96Li+emlc/0mc+14XW1zHQdEKnWjLrXuW+fRcCyuVntz4AI8SA6FRu3oytX0AWHLOu3BEos8PKARAPqpwn1vuC2g==
Received: from SEZPR06MB6958.apcprd06.prod.outlook.com (2603:1096:101:1ef::9)
 by TYSPR06MB6673.apcprd06.prod.outlook.com (2603:1096:400:47f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:36:32 +0000
Received: from SEZPR06MB6958.apcprd06.prod.outlook.com
 ([fe80::4dc1:6d4c:47c8:4928]) by SEZPR06MB6958.apcprd06.prod.outlook.com
 ([fe80::4dc1:6d4c:47c8:4928%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:36:32 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Paul Louvel <paul.louvel@bootlin.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: aspeed/hash: Use memcpy_from_sglist() in
 aspeed_ahash_dma_prepare()
Thread-Topic: [PATCH] crypto: aspeed/hash: Use memcpy_from_sglist() in
 aspeed_ahash_dma_prepare()
Thread-Index: AQHcvcuSChYte+1WIEepzcuwY3YOjLXG1Hpj
Date: Mon, 30 Mar 2026 09:36:32 +0000
Message-ID: <SEZPR06MB69583063476D6F61E9A7A42C8052A@SEZPR06MB6958.apcprd06.prod.outlook.com>
References: <20260327092418.10476-1-paul.louvel@bootlin.com>
In-Reply-To: <20260327092418.10476-1-paul.louvel@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6958:EE_|TYSPR06MB6673:EE_
x-ms-office365-filtering-correlation-id: fb377b5a-1c92-4067-5dde-08de8e3fd40f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: cAYkv+YwcsB7SDe9YD2KWi6dztv9ymHk1fAdy9dCSm8KtyMU/mFLduM6gU1fz6daOHl8I/0I0XNhsQ7DmS51/YIna4hgSRJEoWOiB4xfioS/282lZCHEXuNJwc0JPAd5uM50rH80BvR03x7lN6baUy95H4PUDahYCvCRtpERvGY7twTvDJecCjuvxsZqQZ/5fiOurO49Ba9hnBo7Rh+IhE0vght9/eypAlpOW3bTyjN+vhejKJGwaQl0Nj0e83AmASs3k3PHpIEYVGSPIFJ8W9upNVWQILhfpuQNnRURAZ72DtcuMznQLz8g3218TnVDJ98MZniJL9bHCKrwZCp7GPny7T4fk2WgE6/b8cbgLg0xYE2/KGRSd+L14QdFEzeVQEEvLy7J5gplwO/UWNh28s7dMkZsJlvz7uRpBjzKjSdIlqNSsG/FhbehR9kGJ+nl4PmTiEGHFF91CyLblsOBmjuDT7QMl3peK9XxKSkJ8+qeF/R/XRyWJT2e2bRhzvzvZZ0cco9Un0FnFf0Xy+SSZ5JCWontzBz6fgEL4O1xaZkCNWCtELF8bnH5WqN8q5au6/wzTmGeaLsUGOzIwI9SS4VpG/SgsYVpgIFtuA1Rq9i24oukgrd+wbstwonJQE+n43ADp/pGAkvY5EMfLWIIWOnIvYBfnsnTiircecV+0vtCSYN+mmjtNmrcY1p4RQHKzNrxTbVTKWvIdvDk2w89Rr3Ep6DPT+AC//+kuR/XnccsjIk/uyGNElp3g2/v0bdFy2rNyzCXvzqLC7Uk1imqIssaBdKuQUVRaxXASZZywic=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6958.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?E+iT2JMoKt5r9foi/otW79sXfCGF+oYwY5AUFmKa/9dMN6LIiK54uautRg?=
 =?iso-8859-1?Q?sLOaSmS1NbJ5INqAdv4bgPY8GOz1/lzKhaldpAdlJcqY/7WacbMZ1Nq4og?=
 =?iso-8859-1?Q?edDqWtSrpJk0JdoP04ab9SF2EiGOqKbP4qrKMUkJ2MoaV/fhSbJvXwhwXA?=
 =?iso-8859-1?Q?3unvj2dpaRydNetlhGWfaeSxTmCbpkVj2FDT2e3gQeD8iMxKX4U/wb008K?=
 =?iso-8859-1?Q?2R7UAt3ap5dOXrD9Zg2Vkwqu6Fro8iELKUXxrtYrUTTKxk/oqX8DHeYHAZ?=
 =?iso-8859-1?Q?/XgP8YrGXNSv/N/1q/qQbPWvgoncMS6LLOJFwCiFrJi9mNpLMI28ko5VNO?=
 =?iso-8859-1?Q?GaW84yHU2yYVs02hKTFuGpn6YxAK8DWvdhxS11FrtAZQS35CO8R2W39pEl?=
 =?iso-8859-1?Q?WU31k8BcV6LzxCV90IRm2grXhuHqeC1k84/qjH+NVeCHrbFUieRvvHqFvQ?=
 =?iso-8859-1?Q?+okZKM2PcX/hLbv3vS2qZveL7xiyfFqHZDqS0sla7OBTxOzyUbKA7YpHBr?=
 =?iso-8859-1?Q?MMvr9wFSHOhDZW1eZbwIYfRzyqp676BIEmYjb1PGWr+p7uOBMrUyZ2XYzD?=
 =?iso-8859-1?Q?dS/CnoIh8VYB9CKs9K0TqhJ2UBwArxXMnxmb2zA7UxxHmSe0ZBg0H2iI/2?=
 =?iso-8859-1?Q?Dq7bNLYRwfN6M0jjsPcvIgsYw8lqJC66aLpa1NZK4LCNwAdYgDoeQRkriH?=
 =?iso-8859-1?Q?YwvatM80fyxHUaa/KnzUKh5vGTWPrJtVQ1+lhWDOFAOue7zpUGMtEkafgE?=
 =?iso-8859-1?Q?coEROII8IlpZIR61SOPY8dwkOTSfszxa9v3QmzjORxGB7RdoyHZALs8oE+?=
 =?iso-8859-1?Q?279VmfAJuYJloW+hRn/eBfiRY4sgfm/EjQ6ZKvaFex8TBZQjqvoMtvyqi2?=
 =?iso-8859-1?Q?Vv4NHaYGBwObyMuJiXUQqS8pK3JXx6egRnmqB4nMXVL8AELcnBV2zpBA8J?=
 =?iso-8859-1?Q?MuiTgQDO/WzTpo0ajW3aJOrGibTUDJDfkcEUOyZoyV52hvNpsIEPb8hnDE?=
 =?iso-8859-1?Q?23exnMNGu4ah/gLRGb2QnjcEaXruf65JpAY3OpUa3hDh0YHZj+1bUM/eWo?=
 =?iso-8859-1?Q?YOx41HEO2UMbJHBnalzVRLXVAxkq/WZztwoK6uTBqgoMd6kdnizaed/9vi?=
 =?iso-8859-1?Q?n9lZbaZ6BekFZf/OdBUQVdRwVZxg1KnPXW03viPS37cge+0DmHh4lWkHey?=
 =?iso-8859-1?Q?+Zq6PycIW2xMVwbbhkVJ0smmzGHmM0lq3PdTsS3Yu0rmBX3v2vbN2hA8B8?=
 =?iso-8859-1?Q?OE6X/orl94C89QhXA3DS2dG/FHmbsdkrkiYoXU9HbLwTeWtT45WTZv5t9M?=
 =?iso-8859-1?Q?okot2/rEv4FC0hf0Ysd7k7ibonLWIMcqX/Fr0kYGKr+Q1udlgvQkR+0owZ?=
 =?iso-8859-1?Q?l91jnbhcHbXitPY+3PGKzr+L9teGRfWModMePmC5bhbgbA1qQW+cQA4rN0?=
 =?iso-8859-1?Q?Y6iEFWmP5aiSfuCbVG1GeC4T+rXEnGxKBHT06XCgkFzJoEtt8J7NJjDUMa?=
 =?iso-8859-1?Q?USZ/86iXDUzfa3j4L8vi7tfvkwaJLRYkyQSgtx2qhKTpb2ZHxURSvubfAt?=
 =?iso-8859-1?Q?Km/BU5pa5Vuz39kKACfKbFR8PsXzxi+0rlckmZGGzJyPaoaSCbEuVQrQr8?=
 =?iso-8859-1?Q?QEbCjPv6gmfX61B0KSrqnm+ANNZ21xnOrC67ilfGd6awbRuJeY5DLuRA4n?=
 =?iso-8859-1?Q?GqXXANkmHJCtV9VPd4gFbAaON2pSX5wLChYJP3ttGdSnpXLta+MNRfD9Qf?=
 =?iso-8859-1?Q?zBb5Xg8gFb7zXTqwTClGmkb4jKYRbWC/p5LwpA3O9dBYdYHB4xXDTupCAZ?=
 =?iso-8859-1?Q?u6r8zaw5dA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6958.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb377b5a-1c92-4067-5dde-08de8e3fd40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 09:36:32.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u82OPKpqxd+jfa2Q9hQZdBSRAOMVWS7Ob8MFwCIC0TEC+PrIPw/8YSsXKi25c30kvPBYnCWcp+RZu3sue4JwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_023644_095958_B2A3CCF2 
X-CRM114-Status: GOOD (  11.17  )
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

> Replace scatterwalk_map_and_copy() with memcpy_from_sglist() in=0A=
> aspeed_ahash_dma_prepare(). The latter provides a simpler interface=0A=
> without requiring a direction parameter, making the code easier to=0A=
> read and less error-prone.=0A=
> =0A=
> No functional change intended.=0A=
> =0A=
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>=0A=
> ---=0A=
> =A0drivers/crypto/aspeed/aspeed-hace-hash.c | 3 +--=0A=
> =A01 file changed, 1 insertion(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/crypto/aspeed/aspeed-hace-hash.c b/drivers/crypto/as=
peed/aspeed-hace-hash.c=0A=
> index f8f37c9d5f3c..6f0d03cfbefc 100644=0A=
> --- a/drivers/crypto/aspeed/aspeed-hace-hash.c=0A=
> +++ b/drivers/crypto/aspeed/aspeed-hace-hash.c=0A=
> @@ -182,8 +182,7 @@ static int aspeed_ahash_dma_prepare(struct aspeed_hac=
e_dev *hace_dev)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
final =3D true;=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 } else=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 length -=3D remain;=0A=
> -=A0=A0=A0=A0=A0=A0 scatterwalk_map_and_copy(hash_engine->ahash_src_addr,=
 rctx->src_sg,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 rctx->offset, length, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 memcpy_from_sglist(hash_engine->ahash_src_addr, rctx-=
>src_sg, rctx->offset, length);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 aspeed_ahash_update_counter(rctx, length);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (final)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 length +=3D aspeed_ahash=
_fill_padding(=0A=
> --=0A=
> 2.53.0=0A=
=0A=
Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>=0A=

