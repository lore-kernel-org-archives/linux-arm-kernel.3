Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ar1BWwGlfNp640IcE5oKnLZ16LfXw1anW9aZ0nbtsHU=; b=lgzvrueV8qUMKm
	ldkoc0DuqOEjY+tgpTN15OERImm6C9VTtHCsnq6sZs8n+2aABnDR/kmRaJ2kz+sJ7pScMKSbd6xmp
	rEO0GD/JDJUzs/vPiOIeuO35/EUrt59hIgZkTF6vhZp+TkO9rxVM8fcMTuCb9To6PcWKq02m9jgj4
	D3+xpBf99/6dg9aiSp8o/Q+YtS4tQtCf4IDoouSZ53IYy05MW+6ZpTFh1C7GedTxBJlnvlxPYh+Wa
	w34y8u710PFjM2OJWfR9V6+HGm/xJDJp92qeKWDF9QPjHl4XUXvGosNooAE9aILLqEu+7qMJvQNbj
	VyNKZVXahNDRwfjPW/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnoh-0000000D1dw-2tIk;
	Mon, 20 Oct 2025 11:12:43 +0000
Received: from mail-norwayeastazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d20f::3] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnof-0000000D1br-0Mr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:12:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOTyw7LZznAnnkKyLENIU9eKq3iBS45IcjwN3Qwie2oSkELNGJhVidFTMbq1aJ3d+/vbeO89QA+/3XkBKunttFJxq3vbJ+OoljqmorPOkNaxbWY9vRJHBqbSlgC/w7xBnJxiTUCzMSz2KaZVfcJj8VAdqjYiKBYKyV7Y92SY/9yM26pa2kRyuyDq5CtlGtkAxfqlLRcQnfpwQd4Iikakjo1a+O4KUCseCZZS+UkV2+0ImeKGO/WDj68XiYGeGksaP/LxTplJL36WZ6fYjLk8TCOsWT05vEXchjgzrlaTZpEs47aPfWAZIWiJAyJSHT5OMiNH2WlCzNwzq0C/IDLm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar1BWwGlfNp640IcE5oKnLZ16LfXw1anW9aZ0nbtsHU=;
 b=j84NSw2WN49oFv7lkV6cb63Ua5+sM80fj+YUuGt9uDTLe1Z+ZU2IFlNUNpncl/pcqW72btM+SVMtIMSTLt0zFu0UWrIjW4nC6Gtsl7Kjz8ZO5OigDrjZdAxhQnCA//xFeqF6QScWKdRL9KksOPkhfBTzoQht6oh62FYaB1ZTpofbiZLjLUXknnn4kh97WrHxl4zU29+j4OZTrVMW6o4NVyVqPYGz4rzll+ujaQUhC/96Nwk/EVQQMmPmiK4Oy9t6T+F7kS076yByn4zCXn6b9MaPa7DPMBEcQzLxqyNPdXSvp4KjvNIV2BPKn0XP6ng+Jm3qauTqxYaNwEgOMFmCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar1BWwGlfNp640IcE5oKnLZ16LfXw1anW9aZ0nbtsHU=;
 b=OykXOz462DIviDECVO42QxK2g8AwqbXZMET3dqbYxzDLhddinVGoA7LSkmDdUYd7p9Rwj5w8zvPTm0JJGXOJwzFiz262oG6KTYcpbL6AKN8MDVMhgBvJVk6FsAQpN7E0zWJjLzn8kmLK8gMbr8EgVXx+fsBKuhPL/LxPQ69m8lowTsGAVL0vkyNAmGiPwlW4PV0f1/Ksu1vsrWIDy6udYm4KUfOvS3/3eTYKWuLQVR8HS9z6tmxMnGex9ddJ14ynViQgqFAiLPH2nZ1OBj34ZbkdgFIwzz/QE8a/xf9usxUtW3uTtOkWaUcN5dHuBkodAkD/CmHHRfgn2phcOlDE1g==
Received: from VI1PR02MB3952.eurprd02.prod.outlook.com (2603:10a6:803:85::14)
 by PA1PR02MB11474.eurprd02.prod.outlook.com (2603:10a6:102:4f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 11:12:33 +0000
Received: from VI1PR02MB3952.eurprd02.prod.outlook.com
 ([fe80::60e5:4de0:ff18:2fb1]) by VI1PR02MB3952.eurprd02.prod.outlook.com
 ([fe80::60e5:4de0:ff18:2fb1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 11:12:33 +0000
From: David Binderman <dcb314@hotmail.com>
To: "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: linux-6.18-rc2/arch/arm64/kvm/vgic/vgic-v3.c:728: Possible || and |
 mixup ?
Thread-Topic: linux-6.18-rc2/arch/arm64/kvm/vgic/vgic-v3.c:728: Possible ||
 and | mixup ?
Thread-Index: AQHcQbIAXK9FdldYaEebDX/5mg5dXA==
Date: Mon, 20 Oct 2025 11:12:33 +0000
Message-ID: <VI1PR02MB39529C3384B3308D100CCD399CF5A@VI1PR02MB3952.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR02MB3952:EE_|PA1PR02MB11474:EE_
x-ms-office365-filtering-correlation-id: 37461397-bd2f-41a5-6d04-08de0fc9919c
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|461199028|8062599012|15030799006|8060799015|19110799012|15080799012|440099028|3412199025|40105399003|39105399003|102099032|21999032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CCg14MrjFY50Y/yFPx2q8V516YDXPWdfZS4u2HI/52otG9n7gEVYPy/MG7?=
 =?iso-8859-1?Q?00BeGxNm11cDaflFyLRCZNFGg316NIHShjuuD/3e7cHd3AgDK4f+Glxs/G?=
 =?iso-8859-1?Q?mZXdWkIhb8OmxMakidNlOxacyOsVFRgdeeG/bCmy245tQ1IzznWueP+2Uy?=
 =?iso-8859-1?Q?mb09DV3K1qavHC1VryT5JVr+2aErJ/PIhpzf9YLPywxuk+lHzClCZ9l/36?=
 =?iso-8859-1?Q?g/xbRC2bY/9qaMoCKmEaZtbr+pvA7GsHx4Q/AhSuRLVdrnbs2rIy4qK93U?=
 =?iso-8859-1?Q?0riSBM+lfQz/iyP7VofqRM3+xVbRve4lNVHOxfQiLHkt3SmqFwXUUf+TGu?=
 =?iso-8859-1?Q?5RUfDXeOp4j90QxfrPFWivl8Iutcr/fZ+Gg9sESa+Vy/s7qpGUwieBoMOm?=
 =?iso-8859-1?Q?OaMGJxfUMWeHWhdVOA5S34jc9qz7Z6KyNVucjueJYohDTdBa2QCCtCrqM4?=
 =?iso-8859-1?Q?eeM87nhWxR4P3Z2jPp8rPAarjAE2wfJkuu1iIGQ2WH4m/1FC2MrFFicvvD?=
 =?iso-8859-1?Q?ZCFA54apESIfdfrvIy9iQ8WuEiO6GS4eSO0iAsuJpKsn2+zOx8Dax0p9R6?=
 =?iso-8859-1?Q?symYD2eVsFShzunQVwYnkW80abPcJRmPID1q0BCfudivFhM38q4c7QEJnn?=
 =?iso-8859-1?Q?HlecYD5xwuwsGYyb8d6+zncHp6MlaATKdJPB06Gg4fZ7FzYvzJ916ac1Js?=
 =?iso-8859-1?Q?o80sZxfmvtAI0m9HtK6wJZRAVi6Wiosyr6dcgQRjGlVpqaJY9a13dpFsKw?=
 =?iso-8859-1?Q?4sx3o+TYlp4hxu4i556XmWiII96ToYO2yvdHKpwTOdFkzNbUzHGcIiNf04?=
 =?iso-8859-1?Q?NPvcA4a9vcH8Ibc1IbsOeiQY2Lfci02I1PFEJarLgQy0/T98G1o9qWwdpy?=
 =?iso-8859-1?Q?dOQYurdQ0Ws2wS3+tnYqYw9nGELSvqk0q9CAhBGTpgExMjXLerKu76i8Pl?=
 =?iso-8859-1?Q?ES93dZJqCuWuvEmoB0JX01iRYvIUqp9GaffYpph3SBlo3dPBiO5czWfXcG?=
 =?iso-8859-1?Q?tiRHACufDzGLGoiiJpNYpOPE4rO6yu/cl2uxKJpeUIdSBstf/bP0k6XYKK?=
 =?iso-8859-1?Q?bsnWZAd9ZIGUlwa+vhf6z+XIbto2eM3rnT5Y7fcQM7SlikpTjvw5AiLmtY?=
 =?iso-8859-1?Q?ufgG6WlHsLxps+FJ+/QcxwiiUKfT0oG9Y01qZ8hEvYshQ+tFj/g9lgOd0T?=
 =?iso-8859-1?Q?ci+pqfiE3TdZ0GNyN/jO7T53ZOufGWh6s/m4LcmWfKYFna3C/lGmuTadpb?=
 =?iso-8859-1?Q?JmMyPZnZw8IvaB1nE0kw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8dPaLxTsQU2u2ca/w1Uvnai+slFVRMGpKMi06bN8egx5wDMzFX7Udzn1XF?=
 =?iso-8859-1?Q?BxvLOFC24hOX4JRvn4tE/dBv0WYmceblYvFNENu+qwNK39fUil/kc9cdaI?=
 =?iso-8859-1?Q?6/Cv2XQvBq4RXZcSu+nWQMoNETRhJbfG3td+sV5MQmBDs451Fbgu8Kr2yi?=
 =?iso-8859-1?Q?MuCtPd/Dulp1rw2GQydK4kXdseG5qjWMu75/UmPXRgJrfET/9caSyLzGWn?=
 =?iso-8859-1?Q?uULJ0OeDH5+rED/1krBkqpYIaArQ3UOghsR+XzNGNoujWM3MN6mZwqXVK1?=
 =?iso-8859-1?Q?NTFN4Voq+YgVuuBGV7cMnp5DPQ+mYQcgBn3OEY1nK0UqsoKndSidjELvaI?=
 =?iso-8859-1?Q?w6S+q06sdabSaGVZ17M5/0I6kjhkLHJJoku4iDVADCfdjtbLZM0jJ/auX7?=
 =?iso-8859-1?Q?rIive8cUpGu6pCZre9E78POOsQ0QDIDQyixg7DSoF8biC0bMFrsaDhLOt5?=
 =?iso-8859-1?Q?Xfci11X+Zjw9fnXF8auk9gRndZKH9dHPuQ4GrooEvwRb9si75ivo/uuITm?=
 =?iso-8859-1?Q?H9PuqHh61HUKo7EUVtftLvH1ZkM2Wnpr8dt8x6yk0FzHI4uPaGRZlTfi+H?=
 =?iso-8859-1?Q?MqJDW78nwiwnEzxkLeTA5cLG9013X1uNy+9rucUEHK8nnl96o5BVpDvGAT?=
 =?iso-8859-1?Q?YSdSl6Y+oCzIV1YUZuESON9Q4DL53ert5FoHGR9Qq2VrDLMd/TWZadzXiK?=
 =?iso-8859-1?Q?M3dIR+1ZL8z2O65WRLdBppL9kESsUJ9fdc6ZeAk8hpwL+GBrlyhDXi6no3?=
 =?iso-8859-1?Q?7wJ+AMlpCSqPJczGM/EFmYvOPVnAAP9l69WYUl9L8plZF1aQL2FNRhqV+T?=
 =?iso-8859-1?Q?xbX+icTA/1mH5uqcAe5O+CgkAVEdFCHrd3hJs/3b+3LK1FJBVkiFgsNbGV?=
 =?iso-8859-1?Q?KcgoGW4Jc2FRjcITCpFfHRv3dN7G8M7INLRkH+uU3w2Rx6p6hAGJ4l7xwj?=
 =?iso-8859-1?Q?FK3iOYy1IccP6yD3xLNmnKM2yp8P5MF8GlXa/lW+7aP53CZi9UAxL3wHud?=
 =?iso-8859-1?Q?7408UYq5EvijoJqFROdUByOx5xxb3Ri072iMEmuCnYGzCqbFRPuChdi9LB?=
 =?iso-8859-1?Q?al+B0s2cC/WW+CbE3lrSPB+HTbz5Sdydm035d8bGJRxB59GmY1LwXdlnCi?=
 =?iso-8859-1?Q?/4OmsVu1QeHMHASCgthtHaOmm/hG/toCx8LQbO0AXldHcFIY9KwVBOT6TL?=
 =?iso-8859-1?Q?NZHpDxOI6NhlUFdFZAQukeiHtBrQ7gCNn5Thud35ij2jtU5uGe7ke8bV2Z?=
 =?iso-8859-1?Q?RqFcJQdy3q1qWjp1mG6A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-5faa0.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB3952.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 37461397-bd2f-41a5-6d04-08de0fc9919c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 11:12:33.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11474
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041241_411580_7DD4C8A6 
X-CRM114-Status: UNSURE (   4.73  )
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

Hello there,=0A=
=0A=
Static analyser cppcheck said:=0A=
=0A=
linux-6.18-rc2/arch/arm64/kvm/vgic/vgic-v3.c:728:48: style: inconclusive: B=
oolean expression 'common_trap' is used in bitwise operation. Did you mean =
'||'? [bitwiseOnBoolean]=0A=
=0A=
Source code is=0A=
=0A=
    if (group0_trap || group1_trap || common_trap | dir_trap) {=0A=
=0A=
Maybe better code:=0A=
=0A=
    if (group0_trap || group1_trap || common_trap || dir_trap) {=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=

