Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970A9C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXRtUjSbpMdXF+epWVagH8q4h5Mvu9Yn2X2iOv8NNDs=; b=ACanMptT7/BlKx62hpvJk357WY
	5x4rCzXazt9XWiW66y1AT+r5yVEx8XSaSZuFn6dat8mz3bos+lNPlpH/M1DOopnorfm5bUGYunAsz
	Q/h0eTX0cojbO9BjbYG4ihZROHZffmJ00Bs1FsnKGzY1d2UwIMTohtNu9CJxAF3oSXsVbBCgIaeIW
	MYSvxyIBEvcxHQKTuzzfEvvNRFLwPZs1+ao47iql38qGiE5EcwsdY1X9suuIgcoLNba7oQ0f0AjWQ
	FyWaEBBFI+8fbdL52PaRmR5UFP7Olr1pp2gE/hn68N0mWsYqZQU0RpXGQQnt0VJQ4xxf9QNlmZqZw
	gfhnR/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zxC-00000005MdO-0gvJ;
	Tue, 22 Sep 2026 12:50:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zx4-00000005Mae-2ten
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790081427; x=1821617427;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=8UCgto53PpbzKbL4qGPd2JQxwKoYO+AmuFHXUf/Lc5w=;
  b=Ax6rctVOwLVHpuCnqfq+X2GqjzZu9ctTsnH1GvoTImEAokMJYVY4yLKL
   F80AncHDCrrhF6+Y/EdeoknPQVnAogqfCD1fqAnzou5gJNraOhorMnp1h
   2zB5woPyLowTQqPkqNeO/2unmmA8BdZ7xxspu7UCiYHV2U/Rk4ugCKGOX
   7QYFOSx5OSc4YkIMZ/jZOkfd4bRkBTNWfViQaOuICXXdrJvLkh9bvTani
   zMkps2v9bKK3ZjPsoLksRJR/vzzJchI6BeUQ4pjUCqvNRde/CzXArad2R
   45l+TW4OvuF3Qjw+XeTQrihD2wrYQYHw22grRldLlaAn8JNJeg60TtN+Q
   A==;
X-CSE-ConnectionGUID: C9iluTNaTPS41IniO3yCsA==
X-CSE-MsgGUID: vFLG5bRSQPGeg2kt8unXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94509507"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="94509507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:50:26 -0700
X-CSE-ConnectionGUID: HkEa0gd0RZ+cnyIro7LRgQ==
X-CSE-MsgGUID: ymEdX1ORQUutXFOq6Y/9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272319629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:50:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Sep 2026 15:50:07 +0300 (EEST)
To: "Rafael J. Wysocki" <rafael@kernel.org>
cc: Linux ACPI <linux-acpi@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
    Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, 
    Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
    "Joerg Roedel (AMD)" <joro@8bytes.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    David Rhodes <david.rhodes@cirrus.com>, 
    Richard Fitzgerald <rf@opensource.cirrus.com>, 
    Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
    linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>, 
    Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
    Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
    Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
    Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
    Cezary Rojewski <cezary.rojewski@intel.com>, 
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
    Bard Liao <yung-chuan.liao@linux.intel.com>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
    Binbin Zhou <zhoubinbin@loongson.cn>, 
    Andreas Noever <andreas.noever@gmail.com>, 
    Mika Westerberg <westeri@kernel.org>, 
    Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v1 05/17] platform/x86: yogabook: Switch to use
 acpi_bus_get_primary_device()
In-Reply-To: <1973238.CQOukoFCf9@rafael.j.wysocki>
Message-ID: <5d1b4f76-6cb4-385c-016c-4753c3f046cf@linux.intel.com>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki> <1973238.CQOukoFCf9@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1309644265-1790081383=:1233"
Content-ID: <4fd4f1cf-4cbd-5eb8-1a79-0891e6bcc942@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055026_758880_7FADD70D 
X-CRM114-Status: GOOD (  16.58  )
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

--8323328-1309644265-1790081383=:1233
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <bd368910-f979-56c9-1934-b22a9abc6ee9@linux.intel.com>

On Mon, 21 Sep 2026, Rafael J. Wysocki wrote:

> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.
>=20
> This addresses a potential use-after-free that may occur if the
> device returned by acpi_get_first_physical_node() is removed right
> after dropping its ACPI companion's physical_node_lock in that
> function.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/platform/x86/lenovo/yogabook.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x8=
6/lenovo/yogabook.c
> index 1a4b2ab1f35d..8a91d440724b 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -353,13 +353,13 @@ static int yogabook_wmi_probe(struct wmi_device *wd=
ev, const void *context)
>  =09=09goto error_put_devs;
>  =09}
> =20
> -=09data->kbd_dev =3D get_device(acpi_get_first_physical_node(data->kbd_a=
dev));
> +=09data->kbd_dev =3D acpi_bus_get_primary_device(data->kbd_adev);
>  =09if (!data->kbd_dev || !data->kbd_dev->driver) {
>  =09=09r =3D -EPROBE_DEFER;
>  =09=09goto error_put_devs;
>  =09}
> =20
> -=09data->dig_dev =3D get_device(acpi_get_first_physical_node(data->dig_a=
dev));
> +=09data->dig_dev =3D acpi_bus_get_primary_device(data->dig_adev);
>  =09if (!data->dig_dev || !data->dig_dev->driver) {
>  =09=09r =3D -EPROBE_DEFER;
>  =09=09goto error_put_devs;

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.
--8323328-1309644265-1790081383=:1233--

