Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F229C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsBMMkHfpoYBt58FOXrHcE5SzRFgqCMQWkfXvuwBKVI=; b=PzDAwmJzsoKRF9Z7/udXgPvXXF
	Ztd8F23qKNF9XfsExMiIsEgEQx1JjjVpUpPYOSRdMD07iHRw4wq6Rih/ZXgtqkyvj8g4VutPg8ymj
	k3zhHe5TDFcZTd5y2RYMTqVUJasQP2fVqznBzlOJkpi8eEGqXha/dQlvxQ1PMlS0x31yijeKAmxzB
	nqIA3OhvY43cCIrgDiaEqiFf10Rqvz2CVTtNYpjuNgt0U+LdSp3/WWqL0Pei13lPTQeRmRfbkvDxX
	YECdAiQXmr1voeGLvCw+90m/uxkFcvZYGMzI3/NqrmGeC35ul5aamjyvcG21w8Qz/Gl3PLs3Av9bC
	rg/eK8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcOe-00000001HRA-2t8S;
	Mon, 07 Jul 2025 03:20:00 +0000
Received: from mail-mw2nam12olkn20806.outbound.protection.outlook.com ([2a01:111:f403:2805::806] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcIp-00000001GjC-1fMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc4ZZ7EdXqcErRl/8K5W83SM5XDWPCJhMuJvXEtaaoI2SjSs2qePLhEkbVQ8oa/Td2wG5LCYiIyDqWl5i/znLotouBnvBZQncTvZfi8b8Kzp9YchsaoN5O1lEoLHZB3CnfTBaAPZg7TxrzeN9HPZJy1CY6XvpEJPILvR0bookcOkq0XKGaZSvnEK9Kc45IcG6RMWavrsR14jixZjil1Y3YbT9gSPUVLPEXzQQLP5uRmkoC+Gy/6DKE04jFB41j/AhpDyikbgBR1bDT/k8fWyiOnRuBWyTEmqVLHKVVhxU/flPhqzLIJN9UjkyOJpMbvxPvWvPCycWgmGEDSzza2Acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsBMMkHfpoYBt58FOXrHcE5SzRFgqCMQWkfXvuwBKVI=;
 b=jjkEGiSX0mbbUAbBSifos2vpWWLsGWXgidE2TbnJSPEfvvY2HaZ9c1C+oeZhCBGT6YqJKQpQtiEoyvBo6KmUjLL4DvfKotX34uHe9m50a7mZLtj13BUTiYZHZ29OutfIsbwi9JLGKMZEbopODT4+e7CKY/w5cENipKQfAlGgOLN9ZnIOxrAtVdrBvsv/wia3IAjo6V6xb2l4ss/ZWFUNKu4RhV+B9U/hF6CQ3GFRo078XOnf+hHT5/PMvn5sf1Hs5viwqayym2ys/NjgD0hI8JQ/nBGKWr8Kt0T/MWqOhpudNqphuTHeMLiZVJMAqnOJH9yViRt/iWYN7QD82MQt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsBMMkHfpoYBt58FOXrHcE5SzRFgqCMQWkfXvuwBKVI=;
 b=c7V4YnACAkdOlfsf1odMzFFgnD5r3R4L1z6RH6Lz7c2fafZxf3q0nloYx88UzvuZqX+wOf/4TeweX8N5AregYY3o1FL6blGAbhyBVh6C+wf7swr+WvuASQUvvnxLwTP1cvtBsemlzObFMCie7mIGrfDPL9S73hsst36hS0C8CvGYEgnbGQ+H/4DZinyQKLwn/FovxjEJic3KW5/1VtkGxKU+dRMGLzHP1cn3IruJcSB+SfU9UCOKLS9iF29Guuvsgb37lDTIcaZyZSZ03bTZvlJ9UaBth7Wnfx9SYaVbEYswRiJiESp0i5DGF4YR3WLyBZ48u1fntowXGtvMZ5enmA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA1PR02MB8543.namprd02.prod.outlook.com (2603:10b6:806:1fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Mon, 7 Jul
 2025 03:13:54 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 03:13:54 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "romank@linux.microsoft.com"
	<romank@linux.microsoft.com>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
	"skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
	"mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH v2 3/6] x86/hyperv: Fix usage of cpu_online_mask to get
 valid cpu
Thread-Topic: [PATCH v2 3/6] x86/hyperv: Fix usage of cpu_online_mask to get
 valid cpu
Thread-Index: AQHb7GwXQlKj7RTs9EGg4YQ8BysuBrQjmtTw
Date: Mon, 7 Jul 2025 03:13:54 +0000
Message-ID: <SN6PR02MB415749B9B10571B01E0ABD0CD44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1751582677-30930-4-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1751582677-30930-4-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA1PR02MB8543:EE_
x-ms-office365-filtering-correlation-id: 1a26c300-8313-49a4-7cca-08ddbd044e47
x-microsoft-antispam: BCL:0;ARA:14566002|8062599006|8060799009|41001999006|19110799006|15080799009|461199028|4302099013|40105399003|3412199025|440099028|10035399007|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?nZeTKnw2HJaNFtwisnUhR987f9fwt9Gnl35FKcbnbcl5bJFqc8yuNsqf50/2?=
 =?us-ascii?Q?adMjITQOb8UP91VSW1KZDwq3m3ASeg9ROvB7at0lDaj48jBvXlC2ewEysdxk?=
 =?us-ascii?Q?aw+kew4r3jy4ZgiQg+tQ/8hrk6SmZkK6NM7tCZtubkokTq4A1dbHMREf2SgS?=
 =?us-ascii?Q?NkSkJry+YbN5oG4+zU/74CnKpqNZ7XC9WMeTk482453Cbbdu3giyGp2ytYBx?=
 =?us-ascii?Q?13vS821sW2h7b5z0yDaj0OC+psMK9jVe7nzNLjYr5JL4OCgzFtio6BGhXdeT?=
 =?us-ascii?Q?KWlVoRjh2DQ7PtBqpZpvtTzMsMnyesHYTVZDxsA+lUcIreho9Ia9gPWi8mRf?=
 =?us-ascii?Q?Xb1zj2pDsGkIZDdy00kiJqWZLY+UoYJavPL9HAUVz4DUxJhJoCx27r+TkzPj?=
 =?us-ascii?Q?xf67AWrJcNiknUvUWVNXVfj6thG/Z2ORH2xVoC22vevHmXic5EaukZ3tVeJt?=
 =?us-ascii?Q?fBkhMf9i86lxJasoHMtTN6ybtqud3ZpDUYqDWH35sZdQw1Fe5g5culWRa98g?=
 =?us-ascii?Q?yCBvhUaUYm2Y+jhKBfDbUOvUkL5Lm6H1+6rwnsTIvNdTgp1x2CcizGjYaZ8q?=
 =?us-ascii?Q?N2h4Lmm8aONWSVrsR9d73WGWmYpr9iZSUmgqiiGPu2ZZIGCyUslXT1mfQehT?=
 =?us-ascii?Q?K+P3oHO4riKD62fZgdUfyjQ4Q5xoOaTW+xvJ44eq+yzcRpQjaGdXfuxE1IIm?=
 =?us-ascii?Q?1InVmQUT0Y4hV3Sl6j70cMmwrSutLlKQsp3TARsfQB/eDXa9WPSVEGFCfewz?=
 =?us-ascii?Q?7/vDIKj5t/CsbgqPoVfSMVhF247oLc4kA7yUpIAUGDSbqLbMdaIC6tBXpJ3W?=
 =?us-ascii?Q?6HJmB32r3eJlyjdnsMzLAN9U+H/Onk8veXwOMI1K1zdbMrLmsYY20oyQxz9y?=
 =?us-ascii?Q?04l13wW7LbDUR3O1ZuPQxrE1aCSpUCnQZS/gf3b/PAJBNIPDD4ilksB1xUtB?=
 =?us-ascii?Q?HsAD5jQO1Yb6QQYU8w2QnQQ4rV4C1CWbnbf7khFKMOkErTFh6PfXfGPGNzjr?=
 =?us-ascii?Q?Cwi8jkacEDN76dvB4SIGnolN93ySGGfH//0RwQ8Urfll2igSSfkbzizDP2z3?=
 =?us-ascii?Q?3qgSqbRm5QrJK9+j45a7YlM4z6zBzQ+s9JDqn/kxrXX1GaDSO2mKLlU6VBXX?=
 =?us-ascii?Q?eHU3x52gwyGtMQfyJaZiLjkjEFCg9DxR6tLxXQM61rI581zvHTaNNDSo2meD?=
 =?us-ascii?Q?vFObDaezcgMjTcI3FQWFxSSgMCKBHOmAcw3STO6pqu/qM+ffj6wDzP7DjFry?=
 =?us-ascii?Q?w4fulBraDcliJE5ljjo6B3d4xgrXfNV+hS4e7znzbw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RZFHkQ58JpRGyb3d7lKLYLzddjpZxvARSnNvSEP3Zn2JYdvGKI8/tw6HMRvc?=
 =?us-ascii?Q?HRhccDlyOXp5TtEEpB/mCynnVSrIA9N7c2+nxZKvgm30C3PBGBlJrQoAyX9Q?=
 =?us-ascii?Q?RVbKTh+Zf6SzhEbxpn5N0LLyPu7uGI5FGBHFxk7Shzoh7WwwQiamq7giglOk?=
 =?us-ascii?Q?652ME+Aa2tEj//TPbfNxquQbzcG9AEfUHP2KFxzD5NeVmPHjqDXKQwYPVKC1?=
 =?us-ascii?Q?CIKDcIr+ebrQttx5tizsjxpI9Bii+Eejk9mbzZ/ubuYm/oYMBMQGm5u4zGHr?=
 =?us-ascii?Q?QXb7xo2R2SfoapyER4rx6S4XLSpQ/+pUt3lbGHhFZzpRffKcf0HifkPaDHgE?=
 =?us-ascii?Q?hlohaZnJXkRyNwG895FULSIc3ZbJihFMCzZjrwv56nw7KS+pfrLwfZ1+oCuL?=
 =?us-ascii?Q?aXFzk7zZbcCS87ElsQahi2NAuq/30DVhDKKmP79NL7dbUi7UuD0qxlYZALQi?=
 =?us-ascii?Q?iqjzx10CdWUu+nxEKCztdwMBcGA/2chWDvesy4Q+TccgV7OyIvCRBnlwd5yD?=
 =?us-ascii?Q?u61emWMO4WoQwARxFKeCsYYKg9cSA4SuOS55vpSzEIeHcD3GVRN9nffCam7M?=
 =?us-ascii?Q?wcACbsAyTBooif5pPcsO6H9emu44Kog933qoG0X31dKokcqFLSIU7gxkYw9q?=
 =?us-ascii?Q?8k1p73Xu8eiNL6Cifco5SM1g9e93hYzsDmKR7nY7ccUSodPvHNqivbTGa0c2?=
 =?us-ascii?Q?TwOIcsKUxhECepxA8lSt69I3dkv5fKrzR5fAWENv4mTTWB7wbSBdT9JNho4X?=
 =?us-ascii?Q?LNdSyrxbBXJ3sJ5tWVkwW3GbDZdSD8rb9P+XW8lSVgHsRCuyGEZeJleeCh25?=
 =?us-ascii?Q?wwZqq02pYRA4rFIJ6R4ZxV1s2A25bMwOgckk6urhULmn5ZJQTRfpC6WaS/Oj?=
 =?us-ascii?Q?lnff8/NBEF2Fh2V647/GTQ4h4wwTNZbFKdVaY5p636PhRa3Vd/uw+vuPziGp?=
 =?us-ascii?Q?4UVsRIpmlBUKmPDt6tBer1BwgZ9zjQxi3NReCgVWgQ6DKoIjlvxVYn2n9hTC?=
 =?us-ascii?Q?Ec/rXXacn+Ub3ZHiHzx6jyl8RUu0YQCNIVkvrYMXR51LKtAStdgQ4W554o2b?=
 =?us-ascii?Q?QeL+ydSaOvHGghDliXdJslQ7Rsnj23fBKXl3kuZVhfIYyVzWRgXH0JdQ2gzX?=
 =?us-ascii?Q?zajHN72TAsnAt0z0mbj8KHyqJ2yGbRwvWRkTn03kI3FBWjOuOUUzamCWwos1?=
 =?us-ascii?Q?WE6kZE/UfZi0+rntgMgxs13xZkYUAf1+1CW9ZYhShhusYX24Aec91I1bfyE?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a26c300-8313-49a4-7cca-08ddbd044e47
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 03:13:54.6738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8543
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_201359_429005_B2F4B977 
X-CRM114-Status: GOOD (  16.57  )
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

From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, Jul=
y 3, 2025 3:45 PM
>=20
> Accessing cpu_online_mask here is problematic because the cpus read lock
> is not held in this context.
>=20
> However, cpu_online_mask isn't needed here since the effective affinity
> mask is guaranteed to be valid in this callback. So, just use
> cpumask_first() to get the cpu instead of ANDing it with cpus_online_mask
> unnecessarily.
>=20
> Fixes: e39397d1fd68 ("x86/hyperv: implement an MSI domain for root partit=
ion")
> Reported-by: Michael Kelley <mhklinux@outlook.com>
> Closes: https://lore.kernel.org/linux-hyperv/SN6PR02MB4157639630F8AD2D8FD=
8F52FD475A@SN6PR02MB4157.namprd02.prod.outlook.com/
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/x86/hyperv/irqdomain.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
> index 31f0d29cbc5e..e28c317ac9e8 100644
> --- a/arch/x86/hyperv/irqdomain.c
> +++ b/arch/x86/hyperv/irqdomain.c
> @@ -192,7 +192,6 @@ static void hv_irq_compose_msi_msg(struct irq_data *d=
ata, struct msi_msg *msg)
>  	struct pci_dev *dev;
>  	struct hv_interrupt_entry out_entry, *stored_entry;
>  	struct irq_cfg *cfg =3D irqd_cfg(data);
> -	const cpumask_t *affinity;
>  	int cpu;
>  	u64 status;
>=20
> @@ -204,8 +203,7 @@ static void hv_irq_compose_msi_msg(struct irq_data *d=
ata, struct msi_msg *msg)
>  		return;
>  	}
>=20
> -	affinity =3D irq_data_get_effective_affinity_mask(data);
> -	cpu =3D cpumask_first_and(affinity, cpu_online_mask);
> +	cpu =3D cpumask_first(irq_data_get_effective_affinity_mask(data));
>=20
>  	if (data->chip_data) {
>  		/*
> --
> 2.34.1

Reviewed-by: Michael Kelley <mhklinux@outlook.com>


