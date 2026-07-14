Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0010C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pup7WDa7Ky4wehwSLqoEAdDkExqfXTv2ZHtTc//0qvs=; b=dvWD+a9jgLRZx2wsBdxhWaLVsy
	FgJy28fqt4d308siJF71Ixgrl4KmzWW59Yhyy8C7y2x7BHk7y8x+ryi3WW0tqALO/GCBnZUVnJFH0
	cNU6yH6UmX0kKGz7t0HUW+6YL2ZudjNJ+lOPsiqusB3wqRcZQg4XR7kvgnHQu23ilboOi7ezYQi7i
	DcO2UH+Kq/t2n0QmHlZuH5FbyMpPKBqmoVGZH17MBjDhXSVo9jkKcTaTK9th78hG2IFOcg4QJat+B
	xY3l9XHekayqMb0/0r/FfMPkLgd4Xc4TeOmgJyYe8Pr+ONMmmY26/vzUNlx6qv9bwNAo7TBVBHuIP
	3P1k0qzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcJh-0000000Bwm6-22nJ;
	Tue, 14 Jul 2026 12:32:53 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcJe-0000000Bwku-0n0O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:32:51 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso2471022f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784032368; x=1784637168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pup7WDa7Ky4wehwSLqoEAdDkExqfXTv2ZHtTc//0qvs=;
        b=baLr4YqWu6dcHsyJ9qsn7nYIb30nHOg1aWFQokTc6fUVpanYos5dOONMrEjcrs58dJ
         sO0x/hItKjMmqINQgYbt6khzZjCGXfqg9b8TxJC/X/iZPBW1RZewFYU7BWn5wWeBXlka
         yrt+0rDhL31Xl5+Y+8JQYNamo4PYFAhTlxKqeZ++Y6QEAgHlN7zyEHQfJIRWIPUK+/Iz
         D0XqDxhHZuw7E0L60PEUo+1dh9XlSXkTJqVdhUlGjN/v7ejK7vSDRrRJZnFZbJZhmD+w
         P9N9LymCjOp+6JZ58Ao89Y6jn8HXwAJjovSi4+urWpZo1FEHeVjFZqUY+C+rk92i3QVK
         zgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032368; x=1784637168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pup7WDa7Ky4wehwSLqoEAdDkExqfXTv2ZHtTc//0qvs=;
        b=qfSdIv+Mw6qrzOvfIFm/tJ72YBclP1k7UiMyO/d5C/86iHy9vmxLYoO34E03LqctDW
         jA+pu2NcvIf54N/bh1Ap+K6EylboTBCe9PI+s5IC/WryMdvtkTOJ5NglILmET8mtD5rH
         CSIlhcn9pZQR/sJTEpbZxL3jv7/aEeqN/a5Kb9jIW77zdHzcN6eJ/BZ9s1OlxgttJiWH
         0wlrDvEvmrYdFgaqkg4OHBcjQawL4hFVFlETjDV5ryKqdmYQNRSQrC8U+ObXnxhwlkzM
         87bPcRVcdrLZTZbs/jqTrwrX26AHNBejVj2TYTa2ryZruRYUc8uYRKykFvGRAGELTESy
         jATQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFfygRTEPgi+/Exo8vR2wEl++coWNcXlUoYQHVgK4SCUHO7/hroquOGtx9kSK4F6lwU7ZYuRjDtZdtHhV911BO@lists.infradead.org
X-Gm-Message-State: AOJu0YxgcdzTDmfvZEVr1w6kaob4keYzPgN/YK1ededpjnB+rX6vX7sn
	7zvH//EMVO5GNrm4ifzTh6pZB7J4Zn3qm3DMoVyoZwX85dYmf278eFpXuU+OLSwVhgKKCOI24mx
	/M6Vm4E0=
X-Gm-Gg: AfdE7ckl1THu9n31A5Amfs763Ox8oaL1V16Mn2bcAPgh8z0lBC30YZtxzOWbj5mItyJ
	eAacIVfFYjpBkTWJVZq58y2EC2kK4q7xx6yAeepgG114hk4VixEhkjgkTn3ot3dMQaXlAg1fGYE
	NdUAQjHQImjC3nZLRhBhQmn//sQYKtHZQ63f+5U04hIXohENa81hEdN9SllBk+qGTLNADnyvyUk
	EFve9waytFyoYhFdD5KPLCCfpBeYi+XbiO36MbemKfhCxuqsgn2TEyJ4bbaa3uewTaPO3dd5MV9
	D0QfbsKHi7Ii5g2uyIkC8Gnr53vwoP240LZxFqUZE2pbsGUbFgHNRYhrlNpSOGT6ZdILD9BDeDO
	YjzVaw9dXJkR44Psv/RI8VNdoNPPDbigmQJ3BfU8iBI75Xl4OhcgZ4OENvTOIjEaBsMbgMLnWti
	Jvi2D0OSMg0GP6cQSbEDoGjI0zbueGfO2Vp/4B4+na0PUE8fK3oMgPxLtnvcjYysuudtW6crJBu
	Ukd
X-Received: by 2002:a5d:5f51:0:b0:46e:8226:96a8 with SMTP id ffacd0b85a97d-47f2dcb7439mr16285201f8f.17.1784032367909;
        Tue, 14 Jul 2026 05:32:47 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c7c96sm7856162f8f.33.2026.07.14.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:32:46 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:32:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fanghao11@huawei.com, 
	linuxarm@huawei.com, liuyonglong@huawei.com, prime.zeng@hisilicon.com, 
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v3 1/2] drivers/perf: hisi: Support uncore ITS PMU
Message-ID: <alYrMQWRL515pYbZ@monoceros>
References: <20260713125647.2958626-1-wangyushan12@huawei.com>
 <20260713125647.2958626-2-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4izklbuzoc3hgjg7"
Content-Disposition: inline
In-Reply-To: <20260713125647.2958626-2-wangyushan12@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053250_250764_E2D4DF68 
X-CRM114-Status: GOOD (  30.99  )
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


--4izklbuzoc3hgjg7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] drivers/perf: hisi: Support uncore ITS PMU
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:56:46PM +0800, Yushan Wang wrote:
> Support uncore ITS PMU, which provides the capability of counting
> the number of interrupts routed to ITS by interrupt catagories, and the
> latency. It also supports collecting statistics of micro-ops of ITS.
>=20
> The driver adapts to HiSilicon uncore PMU framework. It does not support
> overflow interruption, which is the same as NoC PMU, so a few dummy
> functions or handling interrupts are left empty.
>=20
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst  |  13 +
>  drivers/perf/hisilicon/Makefile              |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 393 +++++++++++++++++++
>  3 files changed, 407 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>=20
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/=
admin-guide/perf/hisi-pmu.rst
> index d56b2d690709..278bd7e0ae60 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -128,6 +128,19 @@ channel with this option. The current supported chan=
nels are as follows:
>  7. tt_en: NoC PMU supports counting only transactions that have tracetag=
 set
>  if this option is set. See the 2nd list for more information about trace=
tag.
> =20
> +8. int_id: ITS PMU supports filtering by interrupt id, which is defined =
by
> +hardware. Interrupt id takes up to 32 bits, and can be divided into 2 pa=
rts:
> +
> +- Upper 16 bits: DeviceID if counting LPI, PEID if counting SGI/PPI.
> +- Lower 16 bits: EventID if counting LPI, IntID if counting SGI/PPI.
> +
> +int_id is a global configuration for each PMU instance. If multiple diff=
erent
> +int_id's are specified, the last came in will be effective. And if there=
 are
> +already filtered events running, new filtered events came in will be ref=
used.
> +
> +9. int_en: A one-bit flag to tell if int_id is used to filter the statis=
tics. It
> +allows filtering 0 DeviceID and EventID.
> +
>  For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs a=
re
>  further divided into parts for finer granularity of tracing, each part h=
as its
>  own dedicated PMU, and all such PMUs together cover the monitoring job o=
f events
> diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Mak=
efile
> index 186be3d02238..5f28cfdb8a72 100644
> --- a/drivers/perf/hisilicon/Makefile
> +++ b/drivers/perf/hisilicon/Makefile
> @@ -2,7 +2,7 @@
>  obj-$(CONFIG_HISI_PMU) +=3D hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
>  			  hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o=
 \
>  			  hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
> -			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
> +			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
> =20
>  obj-$(CONFIG_HISI_PCIE_PMU) +=3D hisi_pcie_pmu.o
>  obj-$(CONFIG_HNS3_PMU) +=3D hns3_pmu.o
> diff --git a/drivers/perf/hisilicon/hisi_uncore_its_pmu.c b/drivers/perf/=
hisilicon/hisi_uncore_its_pmu.c
> new file mode 100644
> index 000000000000..430e2b06cf4d
> --- /dev/null
> +++ b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for HiSilicon Uncore ITS PMU device
> + *
> + * Copyright (c) 2026 HiSilicon Technologies Co., Ltd.
> + * Author: Yushan Wang <wangyushan12@huawei.com>
> + */
> +#include <linux/bitops.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Please rely on linux/platform_device.h to provice acpi_device_id and
drop the include for <linux/mod_devicetable.h>.

> +static int __init hisi_its_pmu_module_init(void)
> +{
> +	int ret =3D cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +					  "perf/hisi/its:online",
> +					  hisi_uncore_pmu_online_cpu,
> +					  hisi_uncore_pmu_offline_cpu);

<disclaimer>I don't know anything about the functions involved
here</disclaimer>

This looks fishy. The module might be loaded on any machine, is it right
to call hisilicon specific functions then?

> +	if (ret < 0) {
> +		pr_err("hisi_its_pmu: Fail to setup cpuhp callbacks, ret =3D %d\n", re=
t);
> +		return ret;
> +	}
> +	hisi_its_pmu_cpuhp_state =3D ret;
> +
> +	ret =3D platform_driver_register(&hisi_its_pmu_driver);
> +	if (ret)
> +		cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
> +
> +	return ret;
> +}
> +module_init(hisi_its_pmu_module_init);

Best regards
Uwe

--4izklbuzoc3hgjg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWLGoACgkQj4D7WH0S
/k7Kswf9FaAfaQAEr3HDZPNPx1kG76FIY/eH1ZH3tYM/DazDuEwUA7deVfJvi7ii
+jiyVsRp73I5pEAt6lrhmMM5zF6PwgFoLOiT7rjk7P2JSXIAHndV9opBtNSDDNV8
wAbMW7BWMPQZK6yEArmo8FMqSp0R8UMZbr3yMUWOOwfb9eF4kmnR8nJ8M2O0wk/m
xo4qZHTvT1mXpJkJQ4yTGRMjd6NiNE6RMMGxLkar2mgP2nKe60e7EyZOVtElcnsW
p3l6FgRNVvvXGHyrszSFWNzIGVE6ObZ0dIyYKLU9g1MG+E/ssPTQUQi7wWGFfFok
BtsNtXZ4CrC+J+pNoIwD+rl3dSjOPg==
=iEvj
-----END PGP SIGNATURE-----

--4izklbuzoc3hgjg7--

