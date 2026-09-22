Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ooSDDkrViprypNWUVN/CPwtSDXObDWm+cEGnIgZ9A0=; b=tjRs7gwNaNrpqGy6u9qDuFgYqm
	GLq9hZTOWN+bulP6hrNXQCL374HkzDDWs9rQIpZwR6s/PCVBUpXSdr+utrEpmcPrD3HKi2wyDHujf
	UiZKeeLSnLtVzuyP/Bn+de/+Xe188p8RImoCSC6H2Ol4nZ+2IjOBDqqY4I1SI/fXh5v8l2y1NujWw
	oRNshge7UQYS8+FrjwaWOzrOYr3V76xDi+SiThhW93N6ArY7Co5jIeMZ+7MLdtEeTipF45Wl1lkYA
	gNO66my7CnINtlBnXq5ZJp2pdhWpKvc8Nkij6FAHOHg+r+KDspgGnJAD17lj5E3qRSmzbenUOopjK
	OSzXrk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zu3-00000005Lza-1F3o;
	Tue, 22 Sep 2026 12:47:19 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zu0-00000005LyV-2kKu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790081237; x=1821617237;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8ZKyqOu0mEmRU4MJJjqfKU5OT/hrxhKmNGxrkJ1omVE=;
  b=mTfEEfbcREFk4ROgPRcT6SbUNAtVp8sC2n9Z0HY3aKtHOZ0AYIHCjPpi
   x27+rlIA0QIRmEHoYVxgNkqucme9uAntiuum3liCv+9Yz67hnI5WZLqtX
   FsFPKwdvwOliYAlCongjUVz+sQrvslDZTzhGyrcvCbj43l7lqs0GKWU9R
   26CuM56Z0tgHiaO1amRe8wMCscG1ZV2DyCTUCxkdpCHbAOJWpspIKGWda
   iK0IxzB55RwT1iwJBJmL1TsTY/ns+6+bGZTjFvJYHd+yQuwUTs7Mn3UVu
   8CI9vt/F0ZZEm5JenJ5LgYiVqEOLTafvmC6PhnlTrWU02YOsNHWo0OzIi
   g==;
X-CSE-ConnectionGUID: twmGooohQJeQYwPsd4lekQ==
X-CSE-MsgGUID: ZQatqDUUSS6lQ9f5l1BR5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94509134"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="94509134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:47:15 -0700
X-CSE-ConnectionGUID: ZNKd8pjLSDqm/Bu8+RVLxA==
X-CSE-MsgGUID: Y5imD72iRmm/cXg8yK2ddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272318929"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Sep 2026 15:46:56 +0300 (EEST)
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
Subject: Re: [PATCH v1 08/17] platform/x86: x86-android-tablets: Use
 acpi_bus_get_primary_device()
In-Reply-To: <3912360.MHq7AAxBmi@rafael.j.wysocki>
Message-ID: <b5e7637d-e189-6ac7-6e47-9f4a21aab2ca@linux.intel.com>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki> <3912360.MHq7AAxBmi@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1698044991-1790081216=:1233"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_054716_702718_89E5EB72 
X-CRM114-Status: GOOD (  16.95  )
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

--8323328-1698044991-1790081216=:1233
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

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
>  drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index cfff7f5eac5d..2c262f117235 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -390,7 +390,6 @@ static int gpio_secondary_fwnode_init(struct device *=
parent,
>  {
>  =09const struct software_node *const *swnode;
>  =09struct fwnode_handle *fwnode;
> -=09struct device *phys_dev;
>  =09int ret;
> =20
>  =09if (!node_group)
> @@ -418,7 +417,8 @@ static int gpio_secondary_fwnode_init(struct device *=
parent,
>  =09=09if (WARN_ON(!fwnode))
>  =09=09=09return -ENOENT;
> =20
> -=09=09phys_dev =3D acpi_get_first_physical_node(to_acpi_device(dev));
> +=09=09struct device *phys_dev __free(put_device) =3D
> +=09=09=09=09acpi_bus_get_primary_device(to_acpi_device(dev));
>  =09=09if (!phys_dev)
>  =09=09=09return dev_err_probe(parent, -ENODEV,
>  =09=09=09=09=09     "No physical device for ACPI GPIO dev: %pfwP\n",
>=20

Seems to be based on the latest code,

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1698044991-1790081216=:1233--

