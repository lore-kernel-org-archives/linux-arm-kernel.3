Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFF7C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2jSfoVmmGxnKuCYX8tAJQ7xubX2vrZV9GTQr1E87rk=; b=D5gpBKX4VSvoRJlJYf/i0PeflN
	SQr73pRAYYywX7pEfAV/s0+e34XQIiBvOMRYh4SHQfq9bVK2VCPlq6qO+CnglJzBlQzCEpfLtjtHt
	AMYXPXy/oOUEli+aMtdCi6sDCQ4PSgJp8sU9QlgoB7ztf6Ta6bcfUpYPI+Z7BSfkvvD1owLDuykEW
	RD27j5CeR/l2QeV7WyWIkQ32CdoNM/e1WHsJDkO6nn6H9cxRVSFr/xc4Z2sAOqz30dHyvQ+AmvQZ8
	Pkx9ew+Id2Tvhmd+RF/uaOZB8nnDUt/gR8gTY9YKAtTUKLNXdEehe9EeVDUu/Hk8eJMg8cViUf6ki
	0SmFMmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRfq-00000008kAS-1BAz;
	Fri, 07 Aug 2026 21:00:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRfn-00000008kA1-1M7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 21:00:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2498053f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786136409; x=1786741209; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2jSfoVmmGxnKuCYX8tAJQ7xubX2vrZV9GTQr1E87rk=;
        b=Qs/bdKe/9MxzkU22YQRCyvyZgz+chTZ1o13BWTUtFuR6QmJ//TMM4uo9jEb8wR2wgY
         AHQBWegtZ7TZD+bwTVc5zNErSufZ7/LBWm1T8gA/I939rpURwxZl2NzY0HEvsb+aADG2
         k0cf8r+sgPTmgO7PL4hhozhyWg7L/pr3Sni1z17w6OjyeJefYj5cBae1LC13cM5i9F8B
         r6SimCAm5n5QPy2YLAuO3XzwgY0NxHkMcalM2GJFUItfy+mYPh2air9VOn+QKIChqBH9
         E9NqoAvJ3/prmxEX3PY2FQjqLHQ/azaG424jY4ARzZkC3oNnHtN8mDE5PQUraCU3kgsx
         c7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136409; x=1786741209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2jSfoVmmGxnKuCYX8tAJQ7xubX2vrZV9GTQr1E87rk=;
        b=AwmLG+SkOlipyxp5tA5f0miemCI73mTY3Ai6PDqxD5hrt7GBHG9V4k5vFCaEyuJSTc
         SWkaNF3VK5yrGigCf4IxnAreJ9ldHrt1kxgE1fsnKRQ+p0YyAaAgLr9UMzysiE8dxcf/
         Gk97FooWd5/iBVavsI9wkFRvw1sgILbcrEZCQ8gEKP51wuiA264qjAh3uEM3nyXKuydy
         dnqNB7uhMhyYSEE68s5EOVymzPwzEqov/I7QETBwlAsfi1XFdDOHkVNsJUwBhy+PbKvE
         SxFWfYEcT6H2Jr+ey+plGhVO8H9zAZS7i4degsoUU7ExY0fwqieRS7nK0XwSnnZpi6E0
         6Rag==
X-Forwarded-Encrypted: i=1; AHgh+Rqy0xYNzBRYOoDWCCa2G6eUCvJ/FiHwuGYSbzNwwvukvqpyHjmoPedzyuzbHA3gu9rjr5ZMIzoe6U5wuMpC0eZk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+bJbuJTGoc/XZ3UB7wirlxY5a4sy4sPpANwljUahgXHJnMgv
	M/0T0KDsEjkvktu+488/BklW/budUyOx4a5ENYDJ6bOzTzNIrEwGOKDAOfb+750kZ+A=
X-Gm-Gg: AR+sD13u91PYweZD6eWLfQtpZ0MiFr3+y3WHJBocE1OtU3CxNaYGDjgFJpVlHSuTH2M
	pSqik+9HKesqqMfg5Sb87ife8dWQnp0lAgmA5NYtj49u4O2wcYGjEtBGlpyoDcLVG9z43JUmAJz
	IJUx0WpWDtWVyCWj+vKFwgVa6O78i2LBv9p7EZzcRF5uFo9AU8wEmyqy8K6Jq9/OqLMVCVz2GxR
	X5irxoHXqAFPXZbr9GVjaLYi4MLOq4WNOZeeUsDEatoA+kF/GXu2TUpVQ5EC4fmECqPN6LFjtlK
	3zcwwz2haRsFbGPW9IB3eXPjPVXxHu2mMLmh4UDYlHldedVGMsc5cMWvk+8VUnPBHsTU0jTQetX
	XY4vrS2BGMlWf8I7OK2i+OtQ7ZAW3k241Mbsr+43nxJhwx1tlX7euGKPi+It1RTezNtxIobK5PU
	WWMoWNd2TaKgV3Yf2XkhaePxZTzFf/zzbB6QTi359KSGNj1MrZGLnqjct27oM0OZ3EgRWxSuNgl
	6KdWQ==
X-Received: by 2002:a05:6000:388:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-480026ee69emr10610830f8f.28.1786136409374;
        Fri, 07 Aug 2026 14:00:09 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-480021509a5sm8514666f8f.16.2026.08.07.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:00:08 -0700 (PDT)
Date: Fri, 7 Aug 2026 23:00:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, git-dev@amd.com
Subject: Re: [PATCH 03/20] net: xilinx: tsn: add endpoint MAC driver skeleton
Message-ID: <anZG-AucFEZrwjjO@monoceros>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-4-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3a2p35cknyjhbm7"
Content-Disposition: inline
In-Reply-To: <20260807104431.157230-4-nagadheeraj.rottela@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_140011_408243_254ECEE1 
X-CRM114-Status: GOOD (  22.81  )
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


--s3a2p35cknyjhbm7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 03/20] net: xilinx: tsn: add endpoint MAC driver skeleton
MIME-Version: 1.0

On Fri, Aug 07, 2026 at 04:14:14PM +0530, Nagadheeraj Rottela wrote:
> From: Srinivas Neeli <srinivas.neeli@amd.com>
>=20
> The TSN Endpoint MAC owns the IP's host-side MCDMA data path and is the
> netdev physically wired to the CPU. The DSA switch needs this netdev to
> exist as its conduit.
>=20
> Add a platform driver (compatible "xlnx,tsn-ep-mac") for the endpoint.
> Register the netdev named "ep", set its MAC address, and provide minimal
> netdev and ethtool ops. This skeleton handles device bring-up only, with
> no data path yet. So ndo_open just starts the queues and ndo_start_xmit
> drops frames.
>=20
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Co-developed-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
> Signed-off-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
> ---
>  drivers/net/ethernet/xilinx/tsn/Makefile      |   2 +-
>  drivers/net/ethernet/xilinx/tsn/xilinx_tsn.h  |  15 ++
>  .../net/ethernet/xilinx/tsn/xilinx_tsn_ep.c   | 152 ++++++++++++++++++
>  .../net/ethernet/xilinx/tsn/xilinx_tsn_main.c |   3 +
>  4 files changed, 171 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/xilinx/tsn/xilinx_tsn.h
>  create mode 100644 drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
>=20
> diff --git a/drivers/net/ethernet/xilinx/tsn/Makefile b/drivers/net/ether=
net/xilinx/tsn/Makefile
> index 6f99226f3dc8..5886828b386f 100644
> --- a/drivers/net/ethernet/xilinx/tsn/Makefile
> +++ b/drivers/net/ethernet/xilinx/tsn/Makefile
> @@ -1,2 +1,2 @@
>  obj-$(CONFIG_XILINX_TSN) +=3D xilinx_tsn.o
> -xilinx_tsn-y :=3D xilinx_tsn_main.o
> +xilinx_tsn-y :=3D xilinx_tsn_main.o xilinx_tsn_ep.o
> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn.h b/drivers/net/e=
thernet/xilinx/tsn/xilinx_tsn.h
> new file mode 100644
> index 000000000000..b0757e22d1fd
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD/Xilinx TSN Endpoint Ethernet MAC driver, shared definitions.
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _XILINX_TSN_H
> +#define _XILINX_TSN_H
> +
> +#include <linux/platform_device.h>
> +
> +extern struct platform_driver xlnx_tsn_ep_driver;
> +
> +#endif /* _XILINX_TSN_H */
> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> new file mode 100644
> index 000000000000..9b556edf5423
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD/Xilinx TSN Endpoint MAC driver.
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/etherdevice.h>
> +#include <linux/ethtool.h>
> +#include <linux/if_ether.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/of.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <linux/types.h>

As for patch #2: Please drop <linux/mod_devicetable.h>.

Best regards
Uwe

--s3a2p35cknyjhbm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp2R1MACgkQj4D7WH0S
/k5O/Af/TgMIOtaQklVLmWBMkmBIzcsGU429YEzvVu05CyiD5QqR8zjbZJwQxKmw
SkyMCDxo8Lq8CrA6KdsXb8wFOgqxMS/L1M4pvvsMdK32qvm80JzIg6E7SGtf+tOE
WkMebpH8sCnZ+fawjduQcfq3KJP3vF8QS/GFeUxDtPrvAwt29padXs7p9fKdRVKd
OwKoX7evpfoIVchzwiduw8NKgwyL3PxM4rofCXNYn2bEN6wgBp3BlBguCrkthyey
OK7y/Un+T0wIHPiT7jyJgMobOIlJPqhbvLIdL0QWN2jg+fpzjaGGAMeH/yIkSUWw
G9Yviixwsqv9xIP/h8edIDavoQLkPw==
=9zsc
-----END PGP SIGNATURE-----

--s3a2p35cknyjhbm7--

