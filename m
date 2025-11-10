Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4390CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUP/dyn6VDZvlXP2kNtZRvGusygPar1BUVzWgetIKE4=; b=DQ5G0lcJ8vtcWWabv6GudAlmq8
	7Jr3kBK5h6HTcan63BWad3bDun855CKfEiskwGIPdfM8bzNIaSLFoF76zIrY7Tyq1ucCiwWoCe1en
	lk4iSwVVFuE21ao+s88wFjP8VLCMea8HykV7Ybog6NMFHf1qk44j3NXZ9Z76mzH2H8rIb1fUdRHKN
	tTUTSAF7M22XkyV9nLNEH5fm6JJXOB+AlO6FELfWE9Ed4TOyx512jerN7ZwDOg01U0ghiOGe/TkB8
	3tjTa8Qm0qn/LDgFc97mM8GAUp51xD/gKykyk2o29bcIephHTvM7yd++UcBPe9VthVn0OjVdtuNgG
	35U05Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPJ-00000005Lyv-1djQ;
	Mon, 10 Nov 2025 11:50:01 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPG-00000005LyE-1Osc;
	Mon, 10 Nov 2025 11:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762775398; x=1794311398;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kgLvGqGW6Y2MVxPS0dVKx+QUBt0U5B7prEs50cqFkU4=;
  b=MybNDpjYgKJzlFJE1XlpRif5sw8WHu5Oa0DPp+7PPcrvsdcoEou2DCsA
   nquc7AEVVNrIdcfV0p8X+fVSJJ2s5K6UjkbYi5X6xyb/iRbwnVjFLa2KX
   mUbdG6XTlJgOz7H3b1N0+b1qfvHFcpVJ40pB0DS+RgzpZrYDR/A8Ui9Bi
   E6FGEqNksD6qGPooTKNnZsSrn3UnlOn+SMCGgisksA9sl9etTKgVAbSR4
   zEexw75QcZkFksiEb7l+GbvPSNiK2pN0yZC3uRMTGlyIGWjwacAWEoxQF
   fuGD/FtPIFSgzt/kofTi1XRcIY+zeOz137dj9ZqKlbQTVUbDsyOVYq1z6
   w==;
X-CSE-ConnectionGUID: bac8SgFARaqN+WL1LI0WAg==
X-CSE-MsgGUID: LOE//R7mSBykWTr2GmiTsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75928786"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75928786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:49:57 -0800
X-CSE-ConnectionGUID: Sj9MWXvmSo6S4AGtYTK6HQ==
X-CSE-MsgGUID: q0aaSUIcTOWst/+WBvw2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193665319"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:49:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Nov 2025 13:49:42 +0200 (EET)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
    Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
    linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/13] platform: surface: Simplify with
 of_machine_get_match_data()
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-9-d780ea1780c2@linaro.org>
Message-ID: <4986f752-ba21-6a5f-641a-e0dadb4abd11@linux.intel.com>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org> <20251106-b4-of-match-matchine-data-v1-9-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1580227820-1762775382=:1060"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034958_464680_EE892137 
X-CRM114-Status: GOOD (  14.80  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1580227820-1762775382=:1060
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 6 Nov 2025, Krzysztof Kozlowski wrote:

Please change the prefixes to:

platform/surface: aggregator_registry: ...

Once that is changed,

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Depends on the first OF patch.
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 13 +-----------=
-
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/dri=
vers/platform/surface/surface_aggregator_registry.c
> index a594d5fcfcfd..78ac3a8fbb73 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -491,24 +491,13 @@ static const struct of_device_id ssam_platform_hub_=
of_match[] __maybe_unused =3D {
>  static int ssam_platform_hub_probe(struct platform_device *pdev)
>  {
>  =09const struct software_node **nodes;
> -=09const struct of_device_id *match;
> -=09struct device_node *fdt_root;
>  =09struct ssam_controller *ctrl;
>  =09struct fwnode_handle *root;
>  =09int status;
> =20
>  =09nodes =3D (const struct software_node **)acpi_device_get_match_data(&=
pdev->dev);
>  =09if (!nodes) {
> -=09=09fdt_root =3D of_find_node_by_path("/");
> -=09=09if (!fdt_root)
> -=09=09=09return -ENODEV;
> -
> -=09=09match =3D of_match_node(ssam_platform_hub_of_match, fdt_root);
> -=09=09of_node_put(fdt_root);
> -=09=09if (!match)
> -=09=09=09return -ENODEV;
> -
> -=09=09nodes =3D (const struct software_node **)match->data;
> +=09=09nodes =3D (const struct software_node **)of_machine_get_match_data=
(ssam_platform_hub_of_match);
>  =09=09if (!nodes)
>  =09=09=09return -ENODEV;
>  =09}
>=20
>=20
--8323328-1580227820-1762775382=:1060--

