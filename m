Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA32CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIin2fFNqtbGvSBA/hgrxOATdf78ApZ7P15BsWxVZxM=; b=kWtLUbEMr0IA/wZhSEKewzhyQT
	0X0mczSS8LuQGNwuQDZyQzOUqQ5sXpHKi83yX4+qBeSGWNzjfewPpFOthcyF7HhhYhXcFDNWGd74a
	L/4TJ5M0wqTj0L/cdPRamA4wIeehj7d1UFMpJdv+SheN66GuJ6lLrnO9ALg2SRUgJzMzYVNnT5NED
	DbGTbdliB8VJXEs/PKzVo0H9jCJ88zNIBtj0FeVcjDmB1BgL8//dq3fThX9EOXI7WwMBvIyiBgIcd
	2teCs1SLFe7t/jfZfogyexKirTtjwzkeAnzGLqWESnPS2evm6O+FPKklw2LNjf9HXFZhp7gRvFl27
	6Z00uYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiFn-00000002Wur-1kdI;
	Tue, 11 Feb 2025 04:52:11 +0000
Received: from mail-koreacentralazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c40f::5] helo=SEVP216CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiBZ-00000002WPI-3ick
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNSTRrHPU1+G8UDaFK3mG54+L+KVEQu3JUj7WVYSdkftYmsu+fswjqtbbE2Z4ylOJfZ8Y2d5rG8zZPt5GHTVTxENnh6oWlxaBS5NgnHp0t5Sd9AGqM93VqaqLespjjwqShMUUvKaS7iYxtEXZdRR1obDkUlE/23Mz/4dKuXCPUUfyEr5ojuGEyRd/gTmhMHoDKhahfGl1zA4VluWUKhbIDF12XaEDwF5A2lkiKKE+HDwS0C5GBa3ikSPCoHEoI99uBOqdRqWU7h19pbz1JkzKEUEj75Pt763g9n4piwI/vFvhWUrBXDQ4Ss/9rE7jQ5AmwFYLyS432X5fZBReq65Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIin2fFNqtbGvSBA/hgrxOATdf78ApZ7P15BsWxVZxM=;
 b=TgogcEPYPOiHErV/31BeYJiLgwRs1p4RfIrKKVGw5+fvs9e4GvDkWIZP8A7FOkCvLuBHmMoANmRR3MdcnfJdJZVOscWBbK7vEByqqXJArb8ACiHqYCmByIhhIXSa4XsdTnu2e2V50QgkK4BXulJIYGf1KzWmVxI1DWomZ3Dyw8GA2F/e7z37d5uQ0/MMHO+Wj8ML4CXu8ma50b5O7Kt9Sj/+zk7eWoipJrKCMh7pXNxkD03AoBwPYr40DTgo9dpplf9l/Olocxk3DZ2OOjxEKpK+MBwfcCmKbtbXGcQ45mP/Ch6Bvk+kGDycg4rn2xzesBPUqX27S87KX2PCBFlGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIin2fFNqtbGvSBA/hgrxOATdf78ApZ7P15BsWxVZxM=;
 b=bFV/RCA6Tj/LO/xGUOfE8z/PzbWpMKhV2XtsuZyDSopMIrLpRQKYtbIRVCAuoB/ekBbHQupb03gWOqdBRtKxarLKI03AvdyqenrpQtPmpvyy2VOjrBikTuZb9f7QcQkmCPWJB89BOgrPCu4OYmf+IPlhZ7FxUSM/jEAZ11kexq8=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB1299.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 04:47:41 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 04:47:41 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 0/8] Add support for Wave6 video codec driver
Thread-Topic: [PATCH 0/8] Add support for Wave6 video codec driver
Thread-Index: AQHbe5s4KCUzPNXPbEWQJvjgpNkKRLNAgbGAgAEBBxA=
Date: Tue, 11 Feb 2025 04:47:41 +0000
Message-ID: <SL2P216MB1246CE20FC3740311953C790FBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210130527.7wm5an4sfxzca7ra@basti-TUXEDO-Book-XA1510>
In-Reply-To: <20250210130527.7wm5an4sfxzca7ra@basti-TUXEDO-Book-XA1510>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PS2P216MB1299:EE_
x-ms-office365-filtering-correlation-id: 0ee11da2-4e2a-44ad-9dd1-08dd4a57378c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wavwRD68UGKS3aDmVuh8/GajtWpVXZNedoBd7lCDJa4UF2QrMt0vAY1jr3jw?=
 =?us-ascii?Q?FmiExtTD+cdPzd3FKUHD7hEU2KotsLCcN9TTwFu3c19705ao2j5PP/CsITe1?=
 =?us-ascii?Q?tLQFbjop6D3K5wrTnIb2X1cXh4ykWdYqE1oR0qym8H67MWNBln2dcxWyz/yZ?=
 =?us-ascii?Q?n5s/VOO+dOUf1F+3IhIp0sWK4/wilkdmI+QYRATfNvjJ18RD+fZjDvM1uAYa?=
 =?us-ascii?Q?xK8qt2lWEhM3FPekcHlby/UImxyTEmHbsh8u+esFjWLtf8TCetrZYka+FKoO?=
 =?us-ascii?Q?zA+GGZVAXs/WS8Qcd9q9dZo3Aj8h/BvKpAuEIFmdZEp8cU3qPLD8ymYdUBsR?=
 =?us-ascii?Q?EoRtEkxYGxeCrUy04+MDsyvLJZg+8R9hDBQqn2x59Q0lDApOVhd0yWyM4yMS?=
 =?us-ascii?Q?huz34BST1YE5AFM7bZT9cmRpokFOocBK2fIB1x9Xm/iOCx8F9+yCmJLMASaK?=
 =?us-ascii?Q?u6bwgoyaNGkeouXYEpazgMehZR48SpnpIGpjIspCoxdfnaxKBqAxV1jPkfpm?=
 =?us-ascii?Q?Waran7zMaaIqCG30ZVGrrN/aWFsvPgpw8XORMx9Q6SKp0hmCws66861/DdW9?=
 =?us-ascii?Q?yQMIPbbNon4tVQ133tT1ki7T0kLU2h357Mc+qQYsda/vRqkthbx36PePd0Fb?=
 =?us-ascii?Q?C2pwX+0+Dp//vVdGWRaQT+zV2AJQ3fzkKrejUE8b/YagoEoIt//7eJ76MQOU?=
 =?us-ascii?Q?UrDC9QSRKjzcN6YFVm+0NwWG3tY0Pvddsmwwj+E3UPl/FYG8Qm3uQvXHcYNa?=
 =?us-ascii?Q?lUv4wcI1Hvpf+tIno/Pz7IRwEJYUlDO9d5SMJpEIS/tMrqpP8aHojSztyqtO?=
 =?us-ascii?Q?kWNaa0BsAcRUUabFwOcJz8SuXOHJRN2JgphUtqE0H/3P64ZVbTVtVnKXKfPC?=
 =?us-ascii?Q?OpJ/etswOPy9fQEQfHicLw3NXl8k0xE9cajPMN8z1gD2TZkBvAmJLNV4dRkS?=
 =?us-ascii?Q?/ppEeJjwtAydTqyk0A+BeeBH3qpB/5ZDMhGaTb4JkSGY7H+FvxGi0PhAlef1?=
 =?us-ascii?Q?lJ2l1tEJBgp13sqrxwTavRGDHT5QQfrguTxE9VH4S3Vbx/Z1hV3yUhZAAdFl?=
 =?us-ascii?Q?WAOPtX7HfhpzHsDlMFrd5u+ApuLFUw8Dc6gHXFCXXfFcajrIjRL7Uu+RSo+A?=
 =?us-ascii?Q?qkEjP5in4zuvn8wg76CCm7kfYPE8vtNysLlYLKU9Lt2aFtPgW/cP7AU4D3bS?=
 =?us-ascii?Q?baUKeN43n7cTREsNzvg8o2J4ts65HmPXKpOkvvhCC/hhd8BtB+JAWDVI8eON?=
 =?us-ascii?Q?S83yp3bJeuyOqZvJJ9I54/6jncTDmP/rb0F8ERkuX/q0FUkpXzH8wV1jWIi4?=
 =?us-ascii?Q?IgskSzknMABYsTJZxx2jxBd3MvpqAt9BLuteI7R19OLorhiscgFcjmL66t3n?=
 =?us-ascii?Q?w181HEbLyKC7TiEqyVG8NPHKph9B4qeVan6nTPwoe9hvt9aJLgT1FvlOjZT4?=
 =?us-ascii?Q?83IUt87qEC6McRC9ZMDavMQm/n8uU+Ad?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PpAt5gMYEvWaA1LxP1Fgm5j0gq9q3y1BVqqNraU9VgVvzApjhmx1X8uLYc4z?=
 =?us-ascii?Q?uK+C2AfLsKME6+pc2KcOZsVKHUO7uDhoyESLuZEeoPKm4m486mgS7rvb7dF2?=
 =?us-ascii?Q?0yK6wMIoH0qaZ+gbAvpoC6/5Sw77dLZFJzwcwadRQ3N2nTvF4SZQl9COaCak?=
 =?us-ascii?Q?AhRnB8HhAVEOne7hary2pKahorzS9BSbEYBqDFra+XyE5XelO2LLJigWMT/2?=
 =?us-ascii?Q?UpOM9r4eMMGlUM3L4lVZUQUqKNohw2d/PlqwBHcBV6qORE/ZqixjfemQW2AK?=
 =?us-ascii?Q?cF3taU2mC2Jt4WGGG6ZQGfiKzQYyKnpkSnzJ2T7sBKyCnyc0F2o+PZG/qFgA?=
 =?us-ascii?Q?JUPDh8jO1Mi22VQW+J7q2ODIHDp3WN+ybvhNu42bpX+xSGdVuztcVLa6UlLA?=
 =?us-ascii?Q?cbXYk6x0e8m9vlOTr03XfWGLdBF3t+4jOKRT3YNs5jaOekn24IKuLh4i8jlQ?=
 =?us-ascii?Q?ZqpljVbrMk7ICnHVlCHwcH4Xgbo8cWhOxow6UNSwOBHTqevprpSEtN+gHxNU?=
 =?us-ascii?Q?X5VcqWVYKbXd8Vo2GXDmcTIa/P5LGsS7ZR5A/Wrc283VBJD2RkL2hAOe8cRE?=
 =?us-ascii?Q?q7/wkI4jIaw4gyBQUr9pA7Sv8aUaAxchQ7o4roXN2YDp/flhBl6qQssUgjHE?=
 =?us-ascii?Q?St+/86/oqCbc5UjIHGKbriUAKIrS68kZjp70g4CoV55EYOx6td0Tab+CAY5b?=
 =?us-ascii?Q?S0equvkBII0zJ12oq04MGGUaiHfEXNJhATF8d3qNdsj9wbddhnQNtPCP/hb3?=
 =?us-ascii?Q?cnRFL2SS4y1rb1bqDdZ4EVwbwkZemErcXe4T5qxrWtf24yI/eZ/ux9QVSXGq?=
 =?us-ascii?Q?cNNS5gngowGWrnmEvUd9Mqb4WHOb6rzOOEad1HAz+0amHl7q9JQ2GKmt9PX7?=
 =?us-ascii?Q?574aKyl2Dp2eRerWXhLzEBoxE6NgVFpu/8N2nxYM7T/DvLnXJbL7XAJbUiTG?=
 =?us-ascii?Q?EkMAWNaKqmyMBurD5CJ6qtf4tS/kMCV0t5IkmODwyN3mkcKBlj0gdXjZenQp?=
 =?us-ascii?Q?k3fQ/Wq4p6aB2JoG0PviBU+oHFOlMdWMp/vt4UzCqN4xnBbU5A5rpelMGRKB?=
 =?us-ascii?Q?W31+EM99GVz3O8UNqRmRRCcnAwY5cWgj+aBJy6Rg/8szdCQa8HVrsmLOoDek?=
 =?us-ascii?Q?X9P0jjdUGJlcqApY7706QQw2T5JDP1Yi1MlAwmLOSVOaLk66h+mYUi3KuDxq?=
 =?us-ascii?Q?WfjYiR5ib6RN4QKAtzqsXBT5yJ2hYuqGTd1a5t26QuqaGRL6Az7a7rTpOOTW?=
 =?us-ascii?Q?1tl5QjVCTkPBfq7HCQi1sVTVm48MVEl9+2uLiPW5WNiNeg5J9FNWdvnWXjHp?=
 =?us-ascii?Q?lr1DsTMzG9SV/hG8B60oufbrwEovcy1ZPz+7pRL5XSEu4w3tUSGGIi9Y3lh/?=
 =?us-ascii?Q?dH6TcnITYKWE1cZAH5f45eqLTdt5lOYmMCRAGFGL+1auXq7GUacR7mZjrme2?=
 =?us-ascii?Q?oBm5ljdjkhPh/yFvZgB/iwFcMXwmFw9C8/7TIOej1tx1yVpWyVmV7h7nm3kY?=
 =?us-ascii?Q?uOtjO7xouqKXRaKlDGOB/hZBi/sXDqn6o5DSwcQ8UbSMvcI1IM7EspB+uaR+?=
 =?us-ascii?Q?jUQ3NB7rllXQPZjAzVoU3ID8pj/uwfPokGjq4cXjelzkaxdd1QzN1KXX/GNB?=
 =?us-ascii?Q?hA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee11da2-4e2a-44ad-9dd1-08dd4a57378c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 04:47:41.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qf2sq43z+LML8a/u8AogIl4XB3oyAef9VMsQOygFTyUtPzXPtXYkh0/uxsqDraR/Tv1hZ8hvOnJJ8Rj6ycW3IW2NH9QiwvjcKDJSO+lSZ8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_204750_063996_BC2A403E 
X-CRM114-Status: GOOD (  11.16  )
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

Hi, Sebastian.

>-----Original Message-----
>From: Sebastian Fricke <sebastian.fricke@collabora.com>
>Sent: Monday, February 10, 2025 10:05 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 0/8] Add support for Wave6 video codec driver
>
>Hey Nas,
>
>On 10.02.2025 18:07, Nas Chung wrote:
>>This patch series introduces support for the Chips&Media Wave6 video
>>codec IP, a completely different hardware architecture compared to Wave5.
>>
>>The wave6 driver is a M2M stateful encoder/decoder driver.
>>It supports various video formats, including H.264 and H.265,
>>for both encoding and decoding.
>
>Sounds like the hardware supports more formats.
>What are the other video formats?

You are correct.
The Wave6 IP supports VP9/AV1 decoding and AV1 encoding.
However, the IP can be configured to support only specific formats.

The Wave6 driver currently being upstreamed has been validated with
the Wave633 configuration, which supports only H.264 and H.265.

Thanks.
Nas.

>
>Regards,
>Sebastian
>
>>
>>On NXP i.MX SoCs, the Wave6 IP functionality is split between two devices=
:
>>VPU Control Device, Manages shared resources such as firmware access and
>>power domains.
>>VPU Device, Provides encoding and decoding capabilities.
>>The VPU device cannot operate independently without the VPU control devic=
e.
>>
>>This driver has been tested with GStreamer on:
>>- NXP i.MX95 board
>>- pre-silicon FPGA environment
>>
>>Test results for decoder fluster:
>>- JVT-AVC_V1, Ran 77/135 tests successfully              in 35.929 secs
>>- JVT-FR-EXT, Ran 25/69 tests successfully               in 17.717 secs
>>- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.568 secs
>>- All failures are due to unsupported hardware features:
>>-- 10bit, Resolutions higher than 4K, FMO, MBAFF
>>-- Extended profile, Field encoding and High422 sreams.
>>
>>Test results for v4l2-compliance:
>>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
>>v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
>>
>>Compliance test for wave6-dec device /dev/video0:
>>
>>Driver Info:
>>        Driver name      : wave6-dec
>>        Card type        : wave6-dec
>>        Bus info         : platform:wave6-dec
>>        Driver version   : 6.9.2
>>        Capabilities     : 0x84204000
>>                Video Memory-to-Memory Multiplanar
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04204000
>>                Video Memory-to-Memory Multiplanar
>>                Streaming
>>                Extended Pix Format
>>        Detected Stateful Decoder
>>
>>Required ioctls:
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>>Allow for multiple opens:
>>        test second /dev/video0 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>>Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>>Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>>Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>>Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>>Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>        test VIDIOC_QUERYCTRL: OK
>>        test VIDIOC_G/S_CTRL: OK
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>                fail: ../utils/v4l2-compliance/v4l2-test-
>controls.cpp(1180): !have_source_change || !have_eos
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 7 Private Controls: 1
>>
>>Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK
>>        test Composing: OK
>>        test Scaling: OK (Not Supported)
>>
>>Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>>Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>        test blocking wait: OK
>>
>>Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1,
>Warnings: 0
>>
>>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
>>v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
>>
>>Compliance test for wave6-enc device /dev/video1:
>>
>>Driver Info:
>>        Driver name      : wave6-enc
>>        Card type        : wave6-enc
>>        Bus info         : platform:wave6-enc
>>        Driver version   : 6.9.2
>>        Capabilities     : 0x84204000
>>                Video Memory-to-Memory Multiplanar
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04204000
>>                Video Memory-to-Memory Multiplanar
>>                Streaming
>>                Extended Pix Format
>>        Detected Stateful Encoder
>>
>>Required ioctls:
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>>Allow for multiple opens:
>>        test second /dev/video1 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>>Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>>Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>>Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>>Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>>Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>        test VIDIOC_QUERYCTRL: OK
>>        test VIDIOC_G/S_CTRL: OK
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(116=
9):
>node->codec_mask & STATEFUL_ENCODER
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 53 Private Controls: 0
>>
>>Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK (Not Supported)
>>
>>Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>>Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>        test blocking wait: OK
>>
>>Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1,
>Warnings: 0
>>
>>Nas Chung (8):
>>  media: platform: chips-media: wave5: Rename Kconfig parameter
>>  media: v4l2-common: Add YUV24 format info
>>  dt-bindings: media: nxp: Add Wave6 video codec device
>>  media: chips-media: wave6: Add Wave6 codec driver
>>  media: chips-media: wave6: Add v4l2 m2m driver
>>  media: chips-media: wave6: Add Wave6 vpu interface
>>  media: chips-media: wave6: Add Wave6 control driver
>>  media: chips-media: wave6: Improve debugging capabilities
>>
>> .../bindings/media/nxp,wave633c.yaml          |  202 ++
>> MAINTAINERS                                   |    8 +
>> arch/arm64/configs/defconfig                  |    2 +-
>> drivers/media/platform/chips-media/Kconfig    |    1 +
>> drivers/media/platform/chips-media/Makefile   |    1 +
>> .../media/platform/chips-media/wave5/Kconfig  |    6 +-
>> .../media/platform/chips-media/wave5/Makefile |    2 +-
>> .../media/platform/chips-media/wave6/Kconfig  |   26 +
>> .../media/platform/chips-media/wave6/Makefile |   17 +
>> .../platform/chips-media/wave6/wave6-hw.c     | 3113 +++++++++++++++++
>> .../platform/chips-media/wave6/wave6-hw.h     |   69 +
>> .../chips-media/wave6/wave6-regdefine.h       |  675 ++++
>> .../platform/chips-media/wave6/wave6-trace.h  |  336 ++
>> .../platform/chips-media/wave6/wave6-vdi.c    |   52 +
>> .../platform/chips-media/wave6/wave6-vdi.h    |   59 +
>> .../chips-media/wave6/wave6-vpu-ctrl.c        | 1020 ++++++
>> .../chips-media/wave6/wave6-vpu-ctrl.h        |   38 +
>> .../chips-media/wave6/wave6-vpu-dbg.c         |  230 ++
>> .../chips-media/wave6/wave6-vpu-dbg.h         |   22 +
>> .../chips-media/wave6/wave6-vpu-dec.c         | 1883 ++++++++++
>> .../chips-media/wave6/wave6-vpu-enc.c         | 2698 ++++++++++++++
>> .../chips-media/wave6/wave6-vpu-v4l2.c        |  381 ++
>> .../platform/chips-media/wave6/wave6-vpu.c    |  487 +++
>> .../platform/chips-media/wave6/wave6-vpu.h    |  106 +
>> .../platform/chips-media/wave6/wave6-vpuapi.c | 1001 ++++++
>> .../platform/chips-media/wave6/wave6-vpuapi.h |  993 ++++++
>> .../chips-media/wave6/wave6-vpuconfig.h       |   80 +
>> .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
>> drivers/media/v4l2-core/v4l2-common.c         |    1 +
>> 29 files changed, 13766 insertions(+), 5 deletions(-)
>> create mode 100644
>Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>> create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
>> create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>regdefine.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.=
h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>ctrl.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>ctrl.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dbg.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dbg.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dec.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>enc.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>v4l2.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.c
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuconfig.h
>> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuerror.h
>>
>>--
>>2.31.1
>>

