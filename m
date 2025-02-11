Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65BEC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCUvOFYoeytzNSgKr4hsZ2X6kU3OJr2x1nG8nOrrD7Q=; b=rHfPBUS4adzfgOPkTvRsADtzJ0
	iWF48DsMyQvlv09HBD5Sd+8M/4icR7X2fpNzT+/o6Zu3Lq6JHFQ3W1SqRazdPCRQ1S+O7+TYn0tPv
	XHBIyfXCO/4f109QZYQNcMsCSEZ3dGxIGOuvwfuIbZbEjfMlLZcWMOS8rWmRwytAcBfnVBTcU2ftL
	x6QEXQMDN28g2FEX0ZvgfJ6L7yXClmn2wn/4llJkFWeMLTa3WXkZQEaBji07VMe1ubyD3Z196FVI8
	QflTdMc3iHdKoeuyRsE7KPDq+/n+2BQcRcASE0v1tkHyrzDfZ9DuSXds/noAeCxD9TDGQClcw5V+h
	aS4gEH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhpr-00000002UFb-2kS0;
	Tue, 11 Feb 2025 04:25:23 +0000
Received: from mail-koreasouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c410::1] helo=PUWP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhoR-00000002U8e-2Hb8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGZZH3zBjgZPT18+fdzVNN1d0tI/i/oeMjZcTuD3dTPQN7uaSJ2Mki4L3iUw1dv3gKcPmS6AOXvpgfk5owW5f0CVvK4T3q6H34VS6f/h0SpFLJjrzL/Dwt1QBLrvCavFLD/eJ5bRw340M72Gwk1jmMh0drT9Scysvtt0uEHSFS7H03tnHMZoUI6BBh9J5489P65JJj21eIbMrSAKsX8F01Ce8a9wEUhCiK89Wr9WuQteZpRsrQvIbh2QAtyJa/fxLCqpS+anx/vI4p77xuQp412Aqrz+lTkWYD0A7tJjVEBJsuZUNz8KQm979bhEgv2PGvdrpUYKxK/9+u6ZFD/XRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCUvOFYoeytzNSgKr4hsZ2X6kU3OJr2x1nG8nOrrD7Q=;
 b=raFpXdcz9xt03sJ3xLWbw7Rfo7xS5rOvWoSIGHCxhs6ZnhKUu1DYU8w4UWauenH8gM3r0+7Ww/YzpCVVKnbBrB885cEsg9raJV7sbbneKGKG1TqpiR3Wy9a5m8GhDaOwdby/WxV4kwhJrCJ3hBClAZRmay5+MOQpysw6Zk+9xsvxlJdSvWVeLgUb7j0XonXkJ9OgYvi42zfIuP9qAiyv0F1Ur03g8FeyKIKX2DIDJPSntXLTHg4bznMmGWuCILZqyOHHnEqCNF4G2xuOv79mRl8SPIjNdzq+2xo3q4IQzP0CQvL2EWDznPK6TotuM7AeoRDCzbbQDxhvysW8jDKIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCUvOFYoeytzNSgKr4hsZ2X6kU3OJr2x1nG8nOrrD7Q=;
 b=QA9ECc57z1y2lCnJ3kcK9v/87gCYW2AjQrzYhbvGFrFsd81TensX5/HjLLokeKXYTKxAzR7rlTaBzLy1NNmKV1XyKftaLN69XiOncfUrPslOVq4swXp/dIgXYbJ+YOcEDP9q9pQ5TeTGuTYpULjbMZuL+ando0LCgjt80J1h9PM=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB3034.KORP216.PROD.OUTLOOK.COM (2603:1096:301:154::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 04:23:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 04:23:37 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 1/8] media: platform: chips-media: wave5: Rename Kconfig
 parameter
Thread-Topic: [PATCH 1/8] media: platform: chips-media: wave5: Rename Kconfig
 parameter
Thread-Index: AQHbe5s5mvUd+yJT1UyIraYl4c8mYrNAygCAgACP7XA=
Date: Tue, 11 Feb 2025 04:23:37 +0000
Message-ID: <SL2P216MB124669DDF06578F9FA509BD9FBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-2-nas.chung@chipsnmedia.com>
 <d657fa70-af35-415d-b0e7-3aaf2fd05276@kernel.org>
In-Reply-To: <d657fa70-af35-415d-b0e7-3aaf2fd05276@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PUYP216MB3034:EE_
x-ms-office365-filtering-correlation-id: 16d7daa6-7880-4923-1aad-08dd4a53dafd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9GphgIPfFP1KT5yFw6z5RDzdRTJF54LFKGvu9P8fjNyAY5obxw4eIMjiIoo6?=
 =?us-ascii?Q?+ONZq6ZJ1+jduFeZhvAUbyeTSxkNBwiSCib2OmQXCRfjsCFBWyvpzOP5A5vK?=
 =?us-ascii?Q?1A7EE3yvhVop5Gpwa87EBONXJ07nqYKtMNW4tiER7oBr02swhJ19qKNumunw?=
 =?us-ascii?Q?3t7B5/bg3v7htPg5+0BKMt78Ky1XmioVN90MlYhHc23gKfV5GTuo3AxTArpF?=
 =?us-ascii?Q?feuMd9IZuvG8rUXmkHXHFdbQgiwayGbZu7YmFrvwtrDQUGTeA1HyRX8w8VzS?=
 =?us-ascii?Q?OGcX2hNidaU1wJj+sDWCk3LesmcitijBHUGUkWSJG5Xwrm01AuF7FTCbHlKb?=
 =?us-ascii?Q?QuzIVMLhfka/yNwkyPWoZLFlOJdwyGY6sHo5WMQ5SW1IfhHbzKWOFOoAKNOf?=
 =?us-ascii?Q?wRopXhfXfhu/H1gFgYbi2uhs0elMpAMphtY27aO9FfE2x+1s6eynYwmdgvrL?=
 =?us-ascii?Q?StXBrJWjZXNsIwNYSQ0tHz6rAfVcOof75uV01zg3SFehQKwEX4nfzqgiW0vg?=
 =?us-ascii?Q?cCKU1l/IxyXEr6sKX7bnPYUPMLpiZxtuNQnkCXqRZ1S7v7MkZnbTVi76Lnqn?=
 =?us-ascii?Q?IwQXJ5AEu91Kq+xmZ0AQQjwGyU8xtAfvZJiLQmMAvbmAGSt70zf0ihHeAcIy?=
 =?us-ascii?Q?O5bSkX8o3/bq6SJhTGgTQCIdOohOwgq1uzuANqMZBA3bvwNia8VGImUw9PKA?=
 =?us-ascii?Q?uyBpzXwKDI8QkID1Rvxh87EUnG6VEG4clsODOeyaoxq41VOxZLNu14xxqWaO?=
 =?us-ascii?Q?r9SDFoSYNoFDiOY8OT4vfBdFFXV7p6UxZirj4HnRAioQSpqNIWfCmg6vc4Ay?=
 =?us-ascii?Q?gyuAnsybtR2gAeBimxy3VWw6r1JNrTI64h3pDCrOAB+Se7K6VPrlwkj0u+6v?=
 =?us-ascii?Q?9M4tk4dTrwoRFIs58ewB39tX8AyEaCnSpeVf5j20ue5VL6+BrhV7JS4I0OFh?=
 =?us-ascii?Q?sTM10Up4+XhcKSAU63fBjfjM7hy4J2+6XMwSEeVJt8PDag/KXEQuFBA2ahcW?=
 =?us-ascii?Q?7UfMMBeaHOhqm8vqpm6CWwKR6u2/Yv2PUyhadN5QPPablPt9qYVR4YxeqwY8?=
 =?us-ascii?Q?K/zvMuVywfsLsDqdIhJDnLprHT4RyhsuZkwP8CUucKpcdayduiiwBjadiDNy?=
 =?us-ascii?Q?8u/hFjDh5k7LLqKLvH0a3SJaOKVAor6DQHZBvfHQGY/MVeq5Lvo3dwuRO/Zc?=
 =?us-ascii?Q?3K0eKQSl/AT97mGv1PaTsX3yD8mypHUz0rV739nIlkPXuX3LeSKDoLbZDSmR?=
 =?us-ascii?Q?V7fRGjwGUqLtYD23QPku79KWzwPD90UIplM50Ed1QBnZfc19g8eLwuqeaxI7?=
 =?us-ascii?Q?mxlDyIhFA8tKpQA8gg4l3xUBd9SMUI6q6FI6Bo/5kkedWya6bm8KWLV4Wt6K?=
 =?us-ascii?Q?sMTM9hDPCbqf/FA7Utj/Vz0awa7uINt/bSZwYG7ypwpty5lba0TcgpnJknDt?=
 =?us-ascii?Q?FAtJE9Lzhpw2S49lekPYARwfwXrl9idB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DSueKDEvqAK1mWs6wGZ8F2fDbUAi69lybw8nPYkc84u1e1DfymVOs13PgFaO?=
 =?us-ascii?Q?MezrStV5gLiGqUJkHfvx1UhKnzcVm9zQapM7d3TWm5LEcMO+q7a104FA5IsY?=
 =?us-ascii?Q?QFwVkowjStROq5pTP7d1Z9Ac3K+WDkDnhX4FJUi0eAC3i3w6wrup4WNjMLjd?=
 =?us-ascii?Q?v2j4rVA7fSbyARBdZtiRujtzRhVuiJrd0+eXvsy2COUWM0cC1mwt9202kWnG?=
 =?us-ascii?Q?mRTmbOYk4YK9fRLhbU84oCs/ldWVH9KBSPsEyYCe66y7ApcGBg4Bml/oqh16?=
 =?us-ascii?Q?cczfwNOZO53zvG85PWQ5ImG/XCE0cpCzsA4+SD41m3OE+PEDnXrmSA6Ag0ca?=
 =?us-ascii?Q?iYGgog6Js2zl0rKycUkNbEckFl0IgjAlWUBgcpLgUr6Tb8ojXpjA9ISgb3v8?=
 =?us-ascii?Q?HE3BtKSsORj2sQWiE3yNHS1KmCWkHf4moFRmBF6x0WyW8i4Lt0ex1NJy4Dwe?=
 =?us-ascii?Q?oM3ZujCqHLYAVFPq9BvYh/8P0PaczuqrfoVy3RNQERL4+sKZ6oUzGlL05MWl?=
 =?us-ascii?Q?Hs7Dn2yl4A2rui5v6JgFPF7P7VFYE+4hCwkQT+n6mjr6WwyewrsMehrEmklB?=
 =?us-ascii?Q?yLo4HY2j8LzXzf8lpY3T4Rgny8B36kIBkjzBbmnjewsd1KI7Ex+82G3heAE4?=
 =?us-ascii?Q?ZWgQQXz0tG5mKpF5AFapJv2IMyp8RyJYHBy+h8x0twFPMqhvWDqC1rVJCLOe?=
 =?us-ascii?Q?hIlAxIgU264i2cnwbNF4oeyKLYw6IkiXFjYZFXjR11lpbOAxSu5KcdHW6bc4?=
 =?us-ascii?Q?81vVBM0HAbRXZtXbBowAQV9G8jDAN28ywJDlzMP3ZHs2UvxpnFAo0cQXC35W?=
 =?us-ascii?Q?xDVOzIAKs7i8qze1jUUUIAcs392knL4wTpCNKoM4vNFDMsyIGpABpkX5OZ6T?=
 =?us-ascii?Q?Pc13ivmnWw6F3EH0DVrgf+lD1EgyUoRzLws3r+05+N6nuHj6IjFDT3zGZJzQ?=
 =?us-ascii?Q?MNyD1j6iA+oXm0UxKmpMksmlO175+onJBrdgDM5efco31mZdfylR+pIv1UZr?=
 =?us-ascii?Q?7XwjD2GXMecQ/BCqlz6btAXgCzjfjSMRHxJb126G6mGFJwhBiPnQqiBLgKWP?=
 =?us-ascii?Q?BHW4JOxgW3oZbpPbTY94G42nfkGp8iTBcy24WAsYUxuJf6KwOYkulj0nDmpD?=
 =?us-ascii?Q?A3woaCUeE7XvoAF+9EAGUGVXoqciQByUMb6wvdcgVtfBw9T7+lU5CYep6EoN?=
 =?us-ascii?Q?QcnoxejmVsKCpkwfDDWZQGmd6fY+dGW9n+HIdqZ0X7Fbp23JbFenBHRoWOHz?=
 =?us-ascii?Q?axaYJ8LcvPL6kR9UFIAr3vSpolXGu0VxLpf0QkWdB8KwCI/uAf/FDZGgf3+Q?=
 =?us-ascii?Q?3x7O1MxSEG2LbzuC1FYQN8JGydRuPXzjqngwNLDgHbOCLtvNtBiZHYRNNKT7?=
 =?us-ascii?Q?xV09+Tzb6LwGI85N+w64VNHPhCQm8JdMMpjqk6ikXSrBzJcs7Kp9xh0GkJhj?=
 =?us-ascii?Q?hGnHcGDlwKNoix15UwURgjx2n4HzSnnIVep0C4UhH36gmyAYR9jiJMITKqLE?=
 =?us-ascii?Q?dEwsCEATu51MRPVH/cdbj3LKoeMvg3BC7RUKG8uu+EVz7pARMJHHAO45TYe6?=
 =?us-ascii?Q?jLUeegDYHXCUJe7e+ljOFmdDT/vTX9MD7iNdMcJP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d7daa6-7880-4923-1aad-08dd4a53dafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 04:23:37.2860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drinfx7A+k8VBrxt3LLzG+869E8kws2QdRXa1pF8Xhr6ilR4e+wcYVYbW1OjHuH84wflDD2W1Vkec3a2cAaZzxxBIoHBK4kfgPVTyPd5ig8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_202355_601145_2EA23792 
X-CRM114-Status: GOOD (  10.87  )
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

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:24 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 1/8] media: platform: chips-media: wave5: Rename
>Kconfig parameter
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> The existing Kconfig parameter VIDEO_WAVE_VPU is ambiguous,
>> as it does not clearly indicate that it is specific to the Wave5 IP.
>>
>> Rename VIDEO_WAVE_VPU to VIDEO_WAVE5_VPU to make it explicit
>> that the parameter is specific to the Wave5 IP.
>>
>> No functional changes, only the parameter name is updated.
>
>
>That's unnecessary churn. Old name was fine. Kconfig does not match
>hardware 1-to-1 but represents only the driver name (or not even that...).
>
>If you solve any particular problem, then explain it. Otherwise this is
>just unnecessarily affecting users and backports.

I understand your point.
To avoid unnecessary changes, I'll drop this patch.

Thank you for your feedback.

Thanks.
Nas.

>
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  arch/arm64/configs/defconfig                      | 2 +-
>
>That's a SoC patch, don't mix up subsystems.
>
>
>Best regards,
>Krzysztof

