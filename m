Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEFDC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppCtYcqixq+SetYMeXmsM2Ivq2IcyzjNMKQuKvrtJNk=; b=wZ/SrT6iizs7fFC37U6gr3B7NU
	asGSxoT+ra2FOufPILV+R7uhE/NbLAd2B+NGrd+zoM09s9eitdBLMhQyeMujjYsfVJ3OrWOD84os0
	u4VikenQ6aBVxgcUa0uk51hu8ur7jMd+rU1T2fp6O5f0kAvVKB0ho/ayGs0XWZoMTGfnxOHLkmzh2
	a6f948Sadi+8JeLhgmOtkSkNCkySLvjp/dnq/jjMuxasw1IO1yBs/qKQEAz9hbj4qHEc8Bb+YtmfZ
	Ulr7Z7LjgT5WZDQ8sOAreTP+++kw4QttoKIzOLupP25I+MKeeFmsY4ujIJZC/l2PdpHney5Qb5kYj
	UdGjZFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFxF-0000000CEiD-2KTv;
	Tue, 02 Jun 2026 03:38:13 +0000
Received: from mail-francecentralazolkn19013072.outbound.protection.outlook.com ([52.103.46.72] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFxD-0000000CEhT-1BJ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5CcbiZACK+mtZVFM8PeGxA8CBPoHcsedb0BCyHPwUbyHUc22ViSN41Q3ydWFDSsDnumOqzngnaOX5TRMRsJj9twwTCEjbgruFkAGa6/uKw9RYZgBgghnAK/SEyDXrOA2Q99RGJujXnbVpNjq32DKKiuzoQZWfU/fJo0KEuofrXZR4C+xG/lkaFk/1UsfTtEZnRkZgGDYlNaoXnDqYM68Ymmym6vSkATpR+6LHZhjGOjsH21DKMyiZuDdsg9LvjVyTIehIP0HjR6qB8bw7jdqJGNEHb2yK8IO8y2jzf+aCIfHKnxR4NBM56dHZYI67kbih3G+CuoOx+91nXr7a/Qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppCtYcqixq+SetYMeXmsM2Ivq2IcyzjNMKQuKvrtJNk=;
 b=HJ/CNHv1Di7D9mv2Uvqg0M9RhKjIVffznuRrxx+hSpqP5ZrFesJYVtol1LBDER4pMSM1pVnoBfTr4tTho0Xggrf//APjvPjEmv/1ftdOR8UXtcy/PPWzHu4cAKiISssIbAlkipHpUFZsKBsrQO6qAVxDPyw6zh7zTJc+zXQEh/agGBzcgPY7otMLTV3noE3io0Tu4ENqskJfk3iuBvfDo+eYrwUo46VBXSV4qZdoz8ZJ2j0O18OSVJsf2p5IXk/cAlGL0cqPAEXoPNdS9xNiJHNxnnDq+Y0QR8vhFFWb1cj6GdjR+KVwUDgU9KC7H+euCQozximplpmbQGSRB0pJkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppCtYcqixq+SetYMeXmsM2Ivq2IcyzjNMKQuKvrtJNk=;
 b=Hik6jILswjUcQYraFSb1tXW38OFZdGKf1cG+eEM5Q42BNwmmFiLwddXGB94V25BndKdbFZ/rMrM8hqhiYWs7A5zfhzvkt8TNXpUgtuAogYihRFPe729hmhkN0MSevo0I5eyz07Q/st5G0NcwzBkfMQ0bt5ZyWdc9mAtUxFgv+90P0pDsEOJA2pqF4qEmUZoOcyHNGONUJOqBXMx+WHyFIr1DhIwIMhZ9rCaZcfL3JR36XEzYlIZ0QbvP5m37ZMHglEduz2JJFAXrT73w1M3oiHFNLQLEZn5zd8EP3EIXB+XPZPVglYmE895jOqFUqTuyiPijIYi815waYUF9bYQTTg==
Received: from BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:ef::8)
 by GV2PR10MB7990.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:38:08 +0000
Received: from BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1847:57:5806:6cfe]) by BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1847:57:5806:6cfe%6]) with mapi id 15.21.0071.014; Tue, 2 Jun 2026
 03:38:08 +0000
From: Nisarg Rajput <rajputnisarg17@outlook.com>
To: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "mripard@kernel.org" <mripard@kernel.org>
Subject: [PATCH v2] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
Thread-Topic: [PATCH v2] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
Thread-Index: AQHc8kEUm8oxNsj+BE63RXN5Eudeow==
Date: Tue, 2 Jun 2026 03:38:08 +0000
Message-ID: <BESPR10MB9223FFB989C825881E02F0CAD2122@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESPR10MB9223:EE_|GV2PR10MB7990:EE_
x-ms-office365-filtering-correlation-id: fb756257-13f8-4cd5-ab96-08dec0585ced
x-ms-exchange-slblob-mailprops: 30ekHghIwFpCqul8QpcVn7bH49gTWybxqyMJATrvjkJww584Lr6aEG5LaDA+Y7D+DtRwgzpeDM93PJDX/eeDceIQaDUvvxK/6grnd1fztrM0Yi6hVMgxxIm6Sp226HnukzD349o4xN6V0+GIfIWzyDFlO7T0/MebsTp7laDjjUjlJ+JQI5KBdxojtPTk5ObV64/hgsZTYST1zLtWM1Vc0S/3NOdflYhjr2TkCxmfnWJXQNAhqoL6F3XYZJneYBc8Um3ApUgbdSo2++HBIoJRlC0KXsIQa+2mTgpE27tFY0ccC4L6xWDfBAsUlTGwh2UqwH6hve0iojLufZUt3RGjQdkkZvuXd1TRkph3Svp1xsFuGDgcIPzpqvhOUYKWjAPVVpylEXvzL9TYuihPmlL/GHjPinr0oOk2Du3UQ6oi7msyDobBTP6gdfog63yRzvGsQ7y/cpcK8oBVyfySJivHzjet2ASkZ4hwjYJTT/NkaAIVKQxD6FJNPubsgCyXrwg69iaJQ/0Dk066oi/GfAWDL0HTGUD6Z4GSdq5WB66UOJMz5lTAwUQRBEDTls2Foul424ArHfaCnoaap8B3oWmBz+A+AJNXc+MSn2ByFq52YWPIdRbfHqTsav+cleIeI0tEQf8sTPgC7z7B5NnIDlrWTJRGlGxnfrD2t6hjjNb017tXef1vzGqhS8VlpjoWsZIo6ij39tVQEybjHS9/kbQV6ehsnDKek3+3YF5ws0WzFJLF1we6KRG2e5r73bjBXLKn
x-microsoft-antispam: BCL:0;ARA:14566002|19110799012|8060799015|8062599012|24021099003|31061999003|15080799012|15030799006|26104999009|52005399003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qBtwf4/zrbuR3Z9Iip1PnRE+e8/d5jFJoYomT5Fd+DoPwjQ9xSe26A0ukK?=
 =?iso-8859-1?Q?3Is9cIm+JXXR0qSKysoK6OWqVZMcbJvdehNEpGGczb07rHFdpttWqqC0WR?=
 =?iso-8859-1?Q?43X51FKMfaCdlOHzG0o0CeXxCbDHyEHivU9Z/uKH9q5dnnANlRDOgePP3f?=
 =?iso-8859-1?Q?u1vpvPqy+BIJEih6oWJsVwU2z9WVaYCvLehSgL7I0fUuG/dWnRJIZ4onvv?=
 =?iso-8859-1?Q?vKJ8JDoUcWNwu2KGp4hzejt61pxLkURytvqLmG0L94Q+hGH1CKj7z6hvi3?=
 =?iso-8859-1?Q?81AaTZarNXHXiJBb7L0PHazX3WipYg4kp8Ljumz1C4yfF1HG9hP/i1pGLL?=
 =?iso-8859-1?Q?ajLWXnVOq6aTzFB8FL1IQK2cZLFgtoQZERWQWx+L7PYzLw8yBxru+cst6f?=
 =?iso-8859-1?Q?wGh+rX28Bt3lUlUVY1zjxdAsxqJuKFdBOnC21o6KtkRIy18Yn2ckvCNfSa?=
 =?iso-8859-1?Q?T0tVhQsBlSZmOFVn/9GSZhqD2OMBGNqd5a5l5PQMJueYhThZiOQSPqmILF?=
 =?iso-8859-1?Q?WThbAHNhv7kueqoPpEDAvb+lhI0VB3u1fELO5biz2VDiuJAMB4Vrwe6L2l?=
 =?iso-8859-1?Q?SgGCO1lZA0jOYHflPSYIKsFqAZKY0kR8FoKBoVv39Du/Zh/QJkQwAAxZbl?=
 =?iso-8859-1?Q?4EMFWCKoWSQCC4eV0Vx/Mjyq6QILqNAUDy/QWuUhGzGFsaegK0SpWhcwvC?=
 =?iso-8859-1?Q?iietQEiroEQJUm1oZKmjOCRMDyPcLJ3KR3gmYit1vlhaYKpR17Oh7GCd2H?=
 =?iso-8859-1?Q?8B39ETjzVXIWVp8gYQyLmW95UKZQIdMaJacKESxZAsSHYAI5JJAaXzlVMW?=
 =?iso-8859-1?Q?M3TmwaGudZb3UBQIgC5m2U3g/vEX/rdDi5OY4AsVMdWFltomWdNSQQuZQt?=
 =?iso-8859-1?Q?way6WCb5w2oJICdp/9LhYdKvsRBp8dg6j/38AmRtJ8Y7OCn83Xje8Sp2XM?=
 =?iso-8859-1?Q?y0cv/LMQ8VZz5rnfVo9EnKHm29x098xIOUn9LmK39MV4V/GaVNYQjBHJFB?=
 =?iso-8859-1?Q?cypwep9HxNXsNh0qE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AvtTBPI4NZ54R1DILqRvmYOVh12OQc+e12D5WnhDjwpHFsinYUVVCbJRA/?=
 =?iso-8859-1?Q?UPWIB60d1eUmh1YcSeKSgltK64kMdbXFeMpcgsj/azBGueuzcX6lsh7q/x?=
 =?iso-8859-1?Q?3FOxNpyx6EKchK/mDWOPZoUhCz1gNfsvIb1lA9dNbEID8n9zAdkpI3cb+R?=
 =?iso-8859-1?Q?XkRKqF9O6FtiGHQrbTa4h6I5JYDQdkF8ZtUct+wN3FwUKYwk/rZW2Qd12O?=
 =?iso-8859-1?Q?/rfrYeLKiqaQAWzFxwQLTpyjuya352OadkacDJmqfLSOs5CDWJ5+s3EKcw?=
 =?iso-8859-1?Q?SrA/ksCVb9LzAQPSPEvZVMoJKGtKdD87WRpw+P4SFaZhe/BEJz0xZ4V05G?=
 =?iso-8859-1?Q?31DhEreKP+iu08ozEWw85zCpZyftqqc4lcATGzPhrEpuOmbTYv5fiPiztC?=
 =?iso-8859-1?Q?NOvW/OghSJKrEsfdQ3b0pdIhzPAqZ5O1yWxK0Z+seutL4oyg0lD7WAUghV?=
 =?iso-8859-1?Q?FJljp1O4VvVqii0XemC5E85NJQujboRMuxal+dWV5tyjuSX7O1beLcNUhs?=
 =?iso-8859-1?Q?Y8o8eKkw53PrI/+AvAMdX1iGfR/FimRHpmrefptC5ISBE5ggE/P9fMq6Ki?=
 =?iso-8859-1?Q?UmkGKt469CtwV/bnPCZWvNYHqZain22CcTOjUxzcEdcDX6RAcY8k9qRUBk?=
 =?iso-8859-1?Q?MwAwEqtROvbl5VHvVFZr0f67Oa4x7kVbqB9Z4xExtc5caiFBd1LSDR/9U6?=
 =?iso-8859-1?Q?bQ0USCkZ0L5D5lzkmQn9MOvRKjj7uC6vLBczlJkAldI/eU9rXXgVqXLKlm?=
 =?iso-8859-1?Q?DIFhewdPlecMFu8nPonOaKGlDYrmre1cR0uYHb+5gmVZV7qORVbUUtUdvi?=
 =?iso-8859-1?Q?CbpTD817uF8df+SzIiDfLRpkwVwXtbiDsBYSvQOyPNnjp2DLXKcU0Upqj7?=
 =?iso-8859-1?Q?i0Pp0PoVESV9z5TaWo0LLHbEjDRntXWddPodKEpNhYKaj2NEFMmK2OvuhL?=
 =?iso-8859-1?Q?BwP3Xm23sjJBwf3De9vT8pPihiN9Wsa18715L97OIv327QIlwnx2XRD64u?=
 =?iso-8859-1?Q?+Tk2fPpwuokxeJedPm4AiKAhvnw89/bn6abHbnr/sceKdOZTFT8VqaPycY?=
 =?iso-8859-1?Q?nNcf7LkNCPMkBtEx7i6NMr2RUUrwceHpOWt/cOmVFBhwFB2wOZLn6qHrt/?=
 =?iso-8859-1?Q?xdN2PSmrOqNQfPKL0Sxf/Mbqn6fuXEEGt3tzkhT4tbJ4Snvxi4B6Ypky/9?=
 =?iso-8859-1?Q?2EiGBlkO8OjxuxPnkyb9OKkUwRVSYx1aqAvqTdFlqIUtqxE3qnfzqS5OXg?=
 =?iso-8859-1?Q?cFRyQTY7VRYcEBJhag3fnQ+WrMx9BTJy6h0KupOQiC/YqBJoi7Q/mEjbF3?=
 =?iso-8859-1?Q?KKTZNyEeTKhhS04VrU2gEW7n/ohCj47D0+qmlxJY6QZ6gToXKtPJ2tUOFq?=
 =?iso-8859-1?Q?UUk3rfLrLvuRYeCIpJx5YwSbqT+msu4/O6j/3Py5MC+aagOKuCPvcrXuU1?=
 =?iso-8859-1?Q?LIiEs1Aj91u2LgiZwhogAU+gl7YFG7AMi2JSNg3D8hKuWrjZtAzBy6C89v?=
 =?iso-8859-1?Q?20YcLE5U45Kynuhk7lCdul?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fb756257-13f8-4cd5-ab96-08dec0585ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 03:38:08.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_203811_318626_75DEFDB7 
X-CRM114-Status: UNSURE (   6.90  )
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

Subject: [PATCH v2] arm: dts: allwinner: enable overlay support for sun8i-h=
2-plus pi boards=0A=
=0A=
Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree=0A=
overlay support. This follows the same approach used for H3 pi boards=0A=
in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable=0A=
device-tree overlay support for sun8i-h3 pi devices").=0A=
=0A=
The -@ flag populates the __symbols__ node in the DTB which is required=0A=
for applying device-tree overlays from the bootloader or firmware.=0A=
=0A=
Boards affected:=0A=
- sun8i-h2-plus-bananapi-m2-zero=0A=
- sun8i-h2-plus-libretech-all-h3-cc=0A=
- sun8i-h2-plus-orangepi-r1=0A=
- sun8i-h2-plus-orangepi-zero=0A=
=0A=
Signed-off-by: Nisarg Rajput <rajputnisarg17@outlook.com>=0A=
---=0A=
 arch/arm/boot/dts/allwinner/Makefile | 6 ++++++=0A=
 1 file changed, 6 insertions(+)=0A=
=0A=
diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwi=
nner/Makefile=0A=
index 296be33ec934..2e0cc454df74 100644=0A=
--- a/arch/arm/boot/dts/allwinner/Makefile=0A=
+++ b/arch/arm/boot/dts/allwinner/Makefile=0A=
@@ -198,6 +198,12 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@=0A=
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@=0A=
+=0A=
+# Enables support for device-tree overlays for H2+ pi boards=0A=
+DTC_FLAGS_sun8i-h2-plus-bananapi-m2-zero :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-libretech-all-h3-cc :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-orangepi-r1 :=3D -@=0A=
+DTC_FLAGS_sun8i-h2-plus-orangepi-zero :=3D -@=0A=
 dtb-$(CONFIG_MACH_SUN8I) +=3D \=0A=
 	sun8i-a23-evb.dtb \=0A=
 	sun8i-a23-gt90h-v4.dtb \=0A=
--=0A=
2.43.0=

