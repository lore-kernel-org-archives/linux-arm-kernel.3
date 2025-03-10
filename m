Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E6CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9+PsQNRx5qV1MDxOVyk/QC4U1qn0bHe3omPEHc+JdQ=; b=qr3l2NlsTDNLH5zPEoiF5VKxMh
	hf8hhy8qhzh/MFzN2PbNVceFw395xTg34HQKPBz9+v9R5QFHw2jdRdLq4SYT0FT52AZDK9G+4WIKG
	iAlbeAFnM0IExuLRb8UWKsgxb2d2/W+PDNtmILUvcYYazcdzxhXQ79QBd7ouEfNy5ol0Hy61XNCww
	kYnu55iQNdod/9YCI20d2XpqPg/q8hyf+HtLk2r5a+3sIXriyhKx7KI1mSG2/Zo1fsZyCaW+Bb+Kk
	chH+oesbewOGtQoGUhjLX9dD1FBRSQs7/lIJslhAoHHdG1v3elGy1m/G05zkit0C1B2lFhUKndneu
	8KpaymMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trmHK-00000004BDP-3WhK;
	Mon, 10 Mar 2025 23:11:22 +0000
Received: from mail-dm3nam02olkn2080e.outbound.protection.outlook.com ([2a01:111:f403:2c05::80e] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trmFg-00000004AxZ-2GQw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 23:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNkgRxVBhxcyBgC7rM15jPxS6h60L5ZiQ/Iq6aZRf34xwHbqFXje/clvK2o+X7Utahnfq+5ZN3o+ejw4wfV+g9GLc+wsE/1VPN1sRjarUjKA0jx+kymGwqTckg4H5ZrPAq5KUMtA+G8NwMLDM8J//A0hGt5S65kNdZ5mOFDg18y6Vro0lbH8HNJj2xEApLbXwV5rRuA7D2gblRk+az8MxVCO9BT50RxQqILTsHikx1sGa9jgVHZDjw6fvxWrKaoORTFwGCww2R4XgiuIqqqExuEueJIVtdyBus253O8ZYBlYZnpsBJsAUWG95UvgbGjyFAmXjshXAyroWU6hyOXCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9+PsQNRx5qV1MDxOVyk/QC4U1qn0bHe3omPEHc+JdQ=;
 b=vtlq9LlGfgU0qea6AQvQw5LPAg2+sVbLOGZw6YtV66RCfB+tjfk5t4rA9vAp2P5LUQtqY/qsTBNfNmUy3W0VUfirF8+ApsXP2MAlVJ9Ku15mm5YmT6QiI58qhz4hltkUaZU0J5qq4TF/htj0P9NZLg5C/XFZ6DG/+R3LtQ67xaeYfi2QgvVbQYn4NG/H02CU2StoNliKxISE7gMuLdnq68FuO3XgIOXFOEuLZ++xechWkcM10eWOsLmjATAFFRGC6YaKSJA+m71N8y6r458poIHeWQT9cPv2rjXtobs6Qfb8nviYpPcqOnALLVIeEp4iUNuB8ohzaDzmLOcD+lXwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9+PsQNRx5qV1MDxOVyk/QC4U1qn0bHe3omPEHc+JdQ=;
 b=PArXlexflnU96VP2wwaRIWkXD79n2/DlEHH+c2pvwwQ+gS2PAHB5AIdMtNYeJztzr2SvfZokfTHHNVYrxHuVy2ikIvuNM4JopkkeF6RTWxHDQpX9HFpSuWggDKSRI4VNY5PTG7j/bl2hFRJEdXV3qoEL3uyt1OL6FPFh3PC4nvH5fD36RzMc2NDlnWQJnFb7HUZnQS+8MYQx7PLm2VHpRibKtfWjCt0AYyD1LCHZwgNjHcdjHsthPYiiQoEW5bR/B535/j4LYAxjGgiKDmtOHecCTnQ7d0vf/iQkr2qAuXBvaeUXq0i+ymnDKPdR/Kb3Zke63R28GqZ7H3lobRgMaA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BN0PR02MB7965.namprd02.prod.outlook.com (2603:10b6:408:166::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 23:09:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 23:09:34 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Roman Kisel <romank@linux.microsoft.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "decui@microsoft.com" <decui@microsoft.com>,
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"kys@microsoft.com" <kys@microsoft.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "rafael@kernel.org"
	<rafael@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
	<will@kernel.org>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
CC: "apais@microsoft.com" <apais@microsoft.com>, "benhill@microsoft.com"
	<benhill@microsoft.com>, "bperkins@microsoft.com" <bperkins@microsoft.com>,
	"sunilmut@microsoft.com" <sunilmut@microsoft.com>
Subject: RE: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
Thread-Topic: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
Thread-Index: AQHbj60mu8nNqN0VmkqQSWDTuISqT7NtAxuA
Date: Mon, 10 Mar 2025 23:09:34 +0000
Message-ID: <SN6PR02MB415732A17E3EE6A4966B853ED4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-9-romank@linux.microsoft.com>
In-Reply-To: <20250307220304.247725-9-romank@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BN0PR02MB7965:EE_
x-ms-office365-filtering-correlation-id: 7d2ea891-60a4-4ccc-d7f2-08dd60289f53
x-microsoft-antispam: BCL:0;ARA:14566002|8062599003|461199028|19110799003|15080799006|8060799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?TXW81hdncJw1XWmOu5evsCKy+TZg0FcVF8ygVQAwNAqgPqOgtyZpfSUPjo0+?=
 =?us-ascii?Q?NcweR4c7y/mB19XT4jLHwvFF8u+Mnz5/DFAhV/sqB+jFDIC/6OMx7irsJrqO?=
 =?us-ascii?Q?GI3BuL/jFEj7OtkS26Xh6GwtWoKZNxoqd8r+BK04SZZ/gEjmVB/aNgh4Tjzn?=
 =?us-ascii?Q?Pkl/HUiWNGnuXYMdL9w3tL0nbpi1mLLEooAN7ZDz9tlGsoFlASDxdN/sws4X?=
 =?us-ascii?Q?jZZmCN8n2z1ux6JQ57PqbiERYydBrqL6+e5KkrsN5o+s8ZYZ19GyDTo37lIg?=
 =?us-ascii?Q?NPQuBBIWCrHxyMCMDwhRgn5b5H04kwdoZEVzOf2K5l1ZSkbWsxSb3MazEq6v?=
 =?us-ascii?Q?fwVFBvLiDu8p9Gszh56AbfteMSk3c6HoT3cFlDileSWE3dHVpHPfXEAF4Tli?=
 =?us-ascii?Q?6rGOyDSVsXcNE5P3sPhiPEbKbZ7qKtet3po+QmUaA2a9ovDMUuxi1uvIBCWY?=
 =?us-ascii?Q?6bQ5rYf8bUG/o5q0uvfWgMM2sw7SWvv4VUXQB37AsVDzCilQD4vs9Th+hSIe?=
 =?us-ascii?Q?Ze8Cpt21fc4OSXvUCr6nxoq/VnbjVmA6Ev/uQKM8OykVA5YDjVHfjWDBGVGr?=
 =?us-ascii?Q?ktO1X2brniHMNzoqxaFb/+gxewCl0MzQrSuvb/uqHfRMCOBY3hZe5C8jxqmq?=
 =?us-ascii?Q?AFTmADzT8AE3m2bCkjzxEUXdT6OXRb8e5gTcfbYYmGZeoJWMvjUlItCslbLY?=
 =?us-ascii?Q?h7xN0QwfxJ+EunZUwNBUkGmBe/IrCqA3CFFtW3mIzPoEqQumbpc1uG+9zsf7?=
 =?us-ascii?Q?uZxvV+wrBGmng2oiovBBACcFXJG9em8p6p/JiaVfIQUgIYAn9M8W4A5Uak+y?=
 =?us-ascii?Q?34Wt3Zn61Igw0UwkXv6jk0DrTaQoGTomuLyQ6DX3ax2yxUsvpPPOzi4ztETp?=
 =?us-ascii?Q?Tls2pffp8fnA2j9G6TEMpkbGXcQw90Jz6xzMENuqL6GlLdd3k48qeOjXXrBk?=
 =?us-ascii?Q?duqXmHqR5kkFZoIZAbxQcVPIaTJY8VO8Rk41og/IF7nzK5O/Bb6BjCe27GlS?=
 =?us-ascii?Q?UvbpJO+pVuMzc4JiYvZcamnXixw+sDcGzSla4Ow88HMi14tvJ4C2RN0iMrEB?=
 =?us-ascii?Q?1duVRZGZBMxM4IwUvo9LboUOmsQU+Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4B7fGxAdnnZxTueqUPE0r1kQXNzZpWHbAPSL3GvhcZDuiBImzJB3Y94dlHGj?=
 =?us-ascii?Q?IjaEsnL6pPIFgcAqj1oZY3aHQC+dmK6SfSrtyNMeiMQNuA30Ke6o279P3/cP?=
 =?us-ascii?Q?CUjZhhT46hycM94fIfjOJjkmhqVoEGnGG+VnN017AtJ/fvzesAsNPZziBm6q?=
 =?us-ascii?Q?5rj6JJyAGiqX5O98qktyjDZmez14n3awptf+PCXn1gRz/fLfsl7r+mQW3vET?=
 =?us-ascii?Q?dfwuambuGEoBCpUnJwh9Gtw36u0nif1CdPMJ6uW1mx5hEZPK3LHlJ2Wfe5f3?=
 =?us-ascii?Q?JyPQxU+cCJEQCdHNAIjksc9kXMyJZuUMR6OugrLiVh7+3kCacVC3ef3wT0bA?=
 =?us-ascii?Q?YdVOZJNbv1ErlwA09iUz3TKmlyy2u4TKhhrmMGXd3o1aBM54NnFV91hYyQyb?=
 =?us-ascii?Q?ZE0eUXqZCACjkbHDrKpkiyNbxRlDwsljbVm39y2az4l9tSL7Q6yILz5Lot8Y?=
 =?us-ascii?Q?BEOJY+jeo3ofuiRYrSB6MjKeQW0zjwdWLvCrpD+YKpVy7XK6UdT64izmHOyD?=
 =?us-ascii?Q?exL7TN9e8toSSMkht5ti4PobtjIIkjPl72JDJI03kE/UNsHBf7OtLv1akGpK?=
 =?us-ascii?Q?RMJlhee+rHEmqrywxQINQMZSQV1lF+kQknL7FkaWE8aj0XsE5+XKr1Mo4RRd?=
 =?us-ascii?Q?rWZQSIrX1XlhyxMvv6DArrThUs+atVZ416tOnALR8shwXWj4ROQVlR/Yox1n?=
 =?us-ascii?Q?AtpE0ALMerHu7zKRfE5ISbkulpLAzBwG4BGBGRRZPfcw8/BV5XfGrxeUj3bK?=
 =?us-ascii?Q?VTENCFjB0dJjX26ECy2obk9li8pPIfu3nQOZuT3I+Z5NeMeDfYauethN8H56?=
 =?us-ascii?Q?uS5UGSz7DIwIscmx5cRQINy8fEoS2/TrmGt+gxA4qMn3uk/ewAewNZ9ugVav?=
 =?us-ascii?Q?7q+MKUULnzUQ2QLaH5lpeQ/pITMN6m3m+P9ubq71uTK9XMLYRLTZd79O/43V?=
 =?us-ascii?Q?xqO+im0cA+Fw/SAubiWR3F0CwBzLDPhbC/NSlnd2HxTg4Sf5Ntn0sw83vqcu?=
 =?us-ascii?Q?5nKa529sdZMRQmYNWvYzieGWPMoTjbDYDA+GPdna4twBxrULZkomAU6x0V9N?=
 =?us-ascii?Q?z4TLby34r+EFESWVWyCXjDrCsRvQZT+hlKR2d6/R/uvgrk/EPFem4RXMt68V?=
 =?us-ascii?Q?xPlCVq/soPY4mMELtvTTItPKTZGdKhhHg0NqqC+dUS3KNvfqajgab4dAU/HJ?=
 =?us-ascii?Q?UbqyNilat+zurN74x69nnviS8PDCQGCv21i4kaAgghnGet3rHD+v70ib4NA?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2ea891-60a4-4ccc-d7f2-08dd60289f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 23:09:34.4244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_160940_579259_8E26DB19 
X-CRM114-Status: GOOD (  20.14  )
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

From: Roman Kisel <romank@linux.microsoft.com> Sent: Friday, March 7, 2025 =
2:03 PM
>=20
> The VMBus driver uses ACPI for interrupt assignment on
> arm64 hence it won't function in the VTL mode where only
> DeviceTree can be used.
>=20
> Update the VMBus driver to discover interrupt configuration
> from DT.
>=20
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  drivers/hv/vmbus_drv.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 75eb1390b45c..c8474b48dcd2 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2345,6 +2345,36 @@ static int vmbus_acpi_add(struct platform_device *=
pdev)
>  }
>  #endif
>=20
> +static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
> +{
> +	struct irq_data *data;
> +	int irq;
> +	irq_hw_number_t hwirq;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq =3D=3D 0) {
> +		pr_err("VMBus interrupt mapping failure\n");
> +		return -EINVAL;
> +	}
> +	if (irq < 0) {
> +		pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n=
", irq);
> +		return irq;
> +	}
> +
> +	data =3D irq_get_irq_data(irq);
> +	if (!data) {
> +		pr_err("No interrupt data for VMBus virq %d\n", irq);
> +		return -ENODEV;
> +	}
> +	hwirq =3D irqd_to_hwirq(data);
> +
> +	vmbus_irq =3D irq;
> +	vmbus_interrupt =3D hwirq;
> +	pr_debug("VMBus virq %d, hwirq %d\n", vmbus_irq, vmbus_interrupt);
> +
> +	return 0;
> +}
> +
>  static int vmbus_device_add(struct platform_device *pdev)
>  {
>  	struct resource **cur_res =3D &hyperv_mmio;
> @@ -2359,6 +2389,12 @@ static int vmbus_device_add(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
>=20
> +#ifndef HYPERVISOR_CALLBACK_VECTOR
> +	ret =3D vmbus_set_irq(pdev);
> +	if (ret)
> +		return ret;
> +#endif
> +
>  	for_each_of_range(&parser, &range) {
>  		struct resource *res;
>=20
> --
> 2.43.0
>=20

Modulo Arnd's suggestion for avoiding the #ifndef,=20

Reviewed-by: Michael Kelley <mhklinux@outlook.com>


