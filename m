Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E9C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 05:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DMpfP8q0NqnjA2fXWV7Sbx1STbVigzf8RiKCY0OzjE=; b=Ar3uNfBSuen6PxLlwhbpz0VUuw
	w76KQQsAPuJWvkRDne/LMy+EI5bs5TumIVhQ67u5EQTWSqdopmLHIFGxtZkAyxSRN2NmCFab2QYfe
	6HT3yFkalMpg1SXHZmzcWYNA9hhjATSTbr9yr1WRoOAeIinYM8fkz2ZFhkfMyEdstVHSOui3LpJGA
	9F7rSK5xe6YjZYlCXnInu3iR/m6P7ed7dOCbgb9fiigj7q2TMUnj5HzE/6fK61boeSgT+P19Vzkd6
	Uw+sA0bmB+Lm7k0m5hiQbhjqAWOWRDLr5LA2snkzUloPMcPAJaSiRMmLnrdf4fJh3Vt74WlnQj7Ka
	KAPIQI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYaL-0000000DI7G-0yTE;
	Fri, 04 Jul 2025 05:03:41 +0000
Received: from mail-dm6nam11olkn2080c.outbound.protection.outlook.com ([2a01:111:f403:2c15::80c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYVW-0000000DHZC-44LV;
	Fri, 04 Jul 2025 04:58:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTKA4KdKvS/sCPNkBHfoUuc391amdpHhZCGOTzff0KacQD9IuZvThBFRRstTHI8Eqfbhpku3O2z6fu1iJnogPAPairhhbWy2YDrlBOvT/ebJTHXTS4X5RzKGts7J4J+ouRhwfiihW1zuzaneUzefxn3BihN9CzJaKo4mFs45nuwk9gEWxnoV3rfv6MWEiMPTKXu879GXvxHZUVau+ttMWpPyROwlxpOAEgwWuOvUtcAR4/A893HGKvLx0Sfvdy1FhuLCgeIMAsnGrDxJPom59DNIcO7T5GNuZRJqw8QyhztjqVWHZ5En20nuNGeFwRn9rnbezNGC1o6eyHCKzXihag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DMpfP8q0NqnjA2fXWV7Sbx1STbVigzf8RiKCY0OzjE=;
 b=HUFzcSPo02olaTP+vFO4bOeLdyf4F8eKZ0UWV8iYpOeIvv5XU+Gv5WNvNp528yQrbZha9qnW1yUfiSDW6XUBC3sahPfcKerPFe3VnU+BCn41lkuc7fsWzyBOaus9RA8ymkymjz4iWOs2RxrE1QEMTLpp1Cm97tsPPwIPo5Un+QuI2nLjscQkQ884/wo6dsTg5BsbEphplcbvj0vEOh7st3tK6+9Ic62jmFPDbavUokiA7ivAndR7p77N5isAR/8sR8vG8ByssqJ/B5b21A56ZH704IlRYZ6oeqTXRS7EhnpH/FLWLNznxzP3llBgw1JKQE+Q1uZBxUmGOFAQ+Pkn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DMpfP8q0NqnjA2fXWV7Sbx1STbVigzf8RiKCY0OzjE=;
 b=XDMGivjEbhokU9lYktVlSTpfB1lPBCe9fJuobtKihmzh7yPHrouKJEIucfyM7c0/oholDFAfzJsVo+o7W9JtMcaLOZx1vFYEswnGdSStl4EEhjAgKE0zajfoeCew6EI7KorOQyJH/Q74KuMsDiMesKUjPMg1aWVx4oiKMWOxUqEfgtS9xgaPmqV0pJs34NySSXDmOVMokJFtKlUSHFPsAfzUoGJl1tWBTE9v/r1EeKoly/ZxoZO0gTJH9HyDQTd68T6E27rQ10rgYIAoP4Nlb7dqR0xX5pWd40cmZtTrVZ8Hp8czixgILus9vKj8D+rtQqqPEpRra2884P7eTb6I4A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB7741.namprd02.prod.outlook.com (2603:10b6:a03:32c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 04:58:26 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 04:58:26 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nam Cao <namcao@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Karthikeyan Mitran
	<m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-2?Q?Pali_Roh=E1r?=
	<pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang
	<haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan
	<jim2101024@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut
	<marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel
	<nirmal.patel@linux.intel.com>, Jonathan Derrick
	<jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Thread-Topic: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Thread-Index: AQHb5qqGWI9T0Ene10yNxUr1s0p/CbQgsvtAgAAprgCAAAJH0IAAFK4AgABQraCAACfLgIAABTGQ
Date: Fri, 4 Jul 2025 04:58:26 +0000
Message-ID: <SN6PR02MB41575601F0250A20ABF50F3BD442A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
 <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87zfdlrmvr.ffs@tglx>
 <SN6PR02MB41573141969F6B3028099C65D442A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250704043255.JCK9HyRj@linutronix.de>
In-Reply-To: <20250704043255.JCK9HyRj@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB7741:EE_
x-ms-office365-filtering-correlation-id: 63d29470-a328-4ff4-b014-08ddbab7694e
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|8060799009|15080799009|8062599006|41001999006|19110799006|102099032|40105399003|440099028|3412199025;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?B2S4Ua9Znrw8ESvWiFLrLvRZJ7KSwWb2SV17lPGLJlj8tIcnYYOjrg7hk7?=
 =?iso-8859-2?Q?Jn0zmUOB+pEfun2g8buvuUSpmcMUVHsyaAj4Obcd/5TGqsLUcbITB2Etuq?=
 =?iso-8859-2?Q?vAiMc837tVhqrHIpCfs9NpUMzXVzKyVXoiniQPE404x5x8v0OfmoWxZQDC?=
 =?iso-8859-2?Q?3wy0wFtDNAncpnVqy3WXMYqRXapLk0Dzika3RAyV26s9hcHDQI0W7bgewG?=
 =?iso-8859-2?Q?N6YbDmSKqee3M5v58Ef54a8vrcpuCh5EmXutwiyzvX9J/ZP0UxfY/a4vsa?=
 =?iso-8859-2?Q?XnLURbfRJRtca6rdOQqJHRJVRf7Yw6qScOtZfPMRgjdFivRT2h+FnrCie1?=
 =?iso-8859-2?Q?Q0d0Z48Bmtx1fh6vXpO8+qaUNifJLATHjZhAhmtXbR1pJswx7PIZIjaojS?=
 =?iso-8859-2?Q?/YZCJZIdafA5o1bjgI8ywh8DdWwlEzOQ8rse3o5s/UFCeISjhvvlymYr9z?=
 =?iso-8859-2?Q?xazgnceRZ0sYI5WaMM9O7CkpyPu31Brh4fOohdEJx1VBOzNcernakTTISR?=
 =?iso-8859-2?Q?FRotwlMnlrrirTmtj0bxT8hHS04TJUCl0APKWeRBeHhYNOgLK6EnVMfwVs?=
 =?iso-8859-2?Q?Lh3t+eUh/j8kWg05RJ1P3SOKQEMOI+6d4DmvoWYHDFdyz9WzVsHOaAjONZ?=
 =?iso-8859-2?Q?kxTWRTdAKhnmEzH1+VQxLb7Pw3YtPb3nVTG9esrzdZdDiaCPtOuHznGuq4?=
 =?iso-8859-2?Q?odCtwr/qImiBnI6fQsNxwQkbZ3qnhg46B7jzE2f1Aocx+kPnqf6w9J7Zbu?=
 =?iso-8859-2?Q?XnmTp1j64Kk5WvfNK6v/kgdMJkSqz2abb8OMI55rSik5prX04f0Tleohpf?=
 =?iso-8859-2?Q?w/QoTGy22Wat/hRyNzycJQryxqNso551yrxD0BjEx1nE/RtGaIiL1zYkCi?=
 =?iso-8859-2?Q?aw+Wz1rDqc+GU9LnvY4sDaliUJWZK5nmDKYvV//LE0nsZRpKfyCFTSUotl?=
 =?iso-8859-2?Q?f4W54KQlN8LHDKOdcurG8m5eP16y+tl0+xNhDuseLE5hXS84MSPoPcsOEo?=
 =?iso-8859-2?Q?w3DFS3UD+QX4MufRG1DUia7xDCWSVrTavsktHcqVFfuFbd11skKANVJZNI?=
 =?iso-8859-2?Q?A3Kn5xjdl9OrnwCP3AmyOSg+AXO5DIP5EhNW6ObnX0AMO3L1/debapjx/9?=
 =?iso-8859-2?Q?rHuVa8yeaoKECr8Y+ADcl17i5S1fKqkHaT0Fg/TeHk8xgOcqgYHEv313Lo?=
 =?iso-8859-2?Q?POUkfoDiIKf/og=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?16L/pFu9uW+XRHWlYchwo3D9ayFU44b2rfzKVIuPYV+MI98mq286ABUGAJ?=
 =?iso-8859-2?Q?ALB1tzlm8cZu3kv5rtm5X9nOW4YY0AvQEhv7UjepH0tra212lNKKKViOcM?=
 =?iso-8859-2?Q?7shM0IxbA5dSn7HVnOJctpqSfiE6eAWXF3kj4ApOgIRTBUdgKoUCpFAfz9?=
 =?iso-8859-2?Q?XW5CgsU8lDkOlM4xedLRNXxuXNPMco56yn43a0Imdn76rnGsok8Y0zkfZw?=
 =?iso-8859-2?Q?BVQlFsvzFdO1LzcxZ1fzaWESosLUABuIfU3Zq5vgqaq4wiut6irGmbuDI2?=
 =?iso-8859-2?Q?/e1JzAD/HOvPh9+HrTiocMRiX5zpvHUHLxWyXbFHyTzQJmKSmFA5mEnlnD?=
 =?iso-8859-2?Q?RI9qYSFptJXLArlJgmd/jIAOY8IPQpG9FZxnnvuAd+igMDYki2jviRPG7E?=
 =?iso-8859-2?Q?+PY4X3yXMgDrExrQdRyTN6rgRgni08KkJ6LegndcLGRN0SaSZch0i2N0Nu?=
 =?iso-8859-2?Q?VGQbskAcFopcrYjS2SBMwieYrEplkN3Eo6SSSUfhu9MxNiW7A1Kwac7e2P?=
 =?iso-8859-2?Q?OolnxS3YisY2pQIAp65g77Fel23LpY49C94FGwXNjOnH9wA48eiPOmbfz2?=
 =?iso-8859-2?Q?NjhGta3gzKGpf1SunH8b/5wUBGBr9PqIjw9RrIg/cxGzUqBmZSwvvinAKw?=
 =?iso-8859-2?Q?txzafj6iXHxcrkJIyOpnX1lRY4qtc86r2j/gvLt2I7HSCg9z95kz1uxv/r?=
 =?iso-8859-2?Q?GHeJIVGl8THt3UgmdkeehsrABniNlPylibNM2vuWvhSXphDPpASqzWYs8Q?=
 =?iso-8859-2?Q?HzyH0mYr48Ewnz0ewCBc8yCvLZgu3IkbzW9XVkw95M3UGGnq2Irga+fX5M?=
 =?iso-8859-2?Q?78guSNmYyKuzyS+/GfVO6KimLT5XAbaBnY0yjuHmSTnk3VbRUmdUmlvLxU?=
 =?iso-8859-2?Q?tDvLMoZeo0rDnGJ2SC48pkFkoggX7b1p/uzqvhrjVq1QnBDKhHg0bZ9wpN?=
 =?iso-8859-2?Q?m02vGLBLg8z7Cg3kytKmAU1b2SckwJ+zhSsw+rqY4YPdjuD/xICFbvMppL?=
 =?iso-8859-2?Q?yjU9WmpQxqmkYv9Fn9QQjIBWJZcgzYNePwy1itTounSyCUNrdjjcjHlv9+?=
 =?iso-8859-2?Q?P+prvhmNBPEGiQBggYZ8jh8dSAhIvokzjrUXqGB0jdXpTbkqDxquOUgsI4?=
 =?iso-8859-2?Q?WrhAEjajeeM5LLawRlx4syP4VNC27qatnew/9WQCYwhcy/Dk6c+eTCwJkA?=
 =?iso-8859-2?Q?S/0Bn8aGqeKwYPpydUxENirvhn0qDhxgCS6WrbFbeWsqv+LeygelFMJKVC?=
 =?iso-8859-2?Q?vSsciBa+5YeOQZfhPhPUl5bcfrfw+jXP2yzjLnoGk=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d29470-a328-4ff4-b014-08ddbab7694e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 04:58:26.4794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_215843_032496_D219D2FE 
X-CRM114-Status: GOOD (  27.40  )
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

From: Nam Cao <namcao@linutronix.de> Sent: Thursday, July 3, 2025 9:33 PM
>=20
> On Fri, Jul 04, 2025 at 02:27:01AM +0000, Michael Kelley wrote:
> > I haven't resolved the conflict. As a shortcut for testing I just
> > removed the conflicting patch since it is for a Microsoft custom NIC
> > ("MANA") that's not in the configuration I'm testing with. I'll have to
> > look more closely to figure out the resolution.
> >
> > Separately, this patch (the switch to misc_create_parent_irq_domain)
> > isn't working for Linux VMs on Hyper-V on ARM64. The initial symptom
> > is that interrupts from the NVMe controller aren't getting handled
> > and everything hangs. Here's the dmesg output:
> >
> > [   84.463419] hv_vmbus: registering driver hv_pci
> > [   84.463875] hv_pci abee639e-0b9d-49b7-9a07-c54ba8cd5734: PCI VMBus p=
robing: Using version 0x10004
> > [   84.464518] hv_pci abee639e-0b9d-49b7-9a07-c54ba8cd5734: PCI host br=
idge to bus 0b9d:00
> > [   84.464529] pci_bus 0b9d:00: root bus resource [mem 0xfc0000000-0xfc=
00fffff window]
> > [   84.464531] pci_bus 0b9d:00: No busn resource found for root bus, wi=
ll use [bus 00-ff]
> > [   84.465211] pci 0b9d:00:00.0: [1414:b111] type 00 class 0x010802 PCI=
e Endpoint
> > [   84.466657] pci 0b9d:00:00.0: BAR 0 [mem 0xfc0000000-0xfc00fffff 64b=
it]
> > [   84.481923] pci_bus 0b9d:00: busn_res: [bus 00-ff] end is updated to=
 00
> > [   84.481936] pci 0b9d:00:00.0: BAR 0 [mem 0xfc0000000-0xfc00fffff 64b=
it]: assigned
> > [   84.482413] nvme nvme0: pci function 0b9d:00:00.0
> > [   84.482513] nvme 0b9d:00:00.0: enabling device (0000 -> 0002)
> > [   84.556871] irq 17, desc: 00000000e8529819, depth: 0, count: 0, unha=
ndled: 0
> > [   84.556883] ->handle_irq():  0000000062fa78bc, handle_bad_irq+0x0/0x=
270
> > [   84.556892] ->irq_data.chip(): 00000000ba07832f, 0xffff00011469dc30
> > [   84.556895] ->action(): 0000000069f160b3
> > [   84.556896] ->action->handler(): 00000000e15d8191, nvme_irq+0x0/0x3e=
8
> > [  172.307920] watchdog: BUG: soft lockup - CPU#6 stuck for 26s! [kwork=
er/6:1H:195]
>=20
> Thanks for the report.
>=20
> On arm64, this driver relies on the parent irq domain to set handler. So
> the driver must not overwrite it to NULL.
>=20
> This should cures it:
>=20
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller=
/pci-hyperv.c
> index 3a24fadddb83..f4a435b0456c 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -577,8 +577,6 @@ static void hv_pci_onchannelcallback(void *context);
>=20
>  #ifdef CONFIG_X86
>  #define DELIVERY_MODE	APIC_DELIVERY_MODE_FIXED
> -#define FLOW_HANDLER	handle_edge_irq
> -#define FLOW_NAME	"edge"
>=20
>  static int hv_pci_irqchip_init(void)
>  {
> @@ -723,8 +721,6 @@ static void hv_arch_irq_unmask(struct irq_data *data)
>  #define HV_PCI_MSI_SPI_START	64
>  #define HV_PCI_MSI_SPI_NR	(1020 - HV_PCI_MSI_SPI_START)
>  #define DELIVERY_MODE		0
> -#define FLOW_HANDLER		NULL
> -#define FLOW_NAME		NULL
>  #define hv_msi_prepare		NULL
>=20
>  struct hv_pci_chip_data {
> @@ -2162,8 +2158,9 @@ static int hv_pcie_domain_alloc(struct irq_domain *=
d,
> unsigned int virq, unsigne
>  		return ret;
>=20
>  	for (int i =3D 0; i < nr_irqs; i++) {
> -		irq_domain_set_info(d, virq + i, 0, &hv_msi_irq_chip, NULL, FLOW_HANDL=
ER, NULL,
> -				    FLOW_NAME);
> +		irq_domain_set_hwirq_and_chip(d, virq + i, 0, &hv_msi_irq_chip, NULL);
> +		if (IS_ENABLED(CONFIG_X86))
> +			__irq_set_handler(virq + i, handle_edge_irq, 0, "edge");
>  	}
>=20
>  	return 0;

Yes, that fixes the problem. Linux now boots with the PCI NIC VF and two
NVMe controllers being visible and operational. Thanks for the fix! It
would have taken me a while to figure it out.

I want to do some additional testing tomorrow, and look more closely at the
code, but now I have something that works well enough to make further
progress.

Michael


