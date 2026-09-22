Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8129C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPF+ayuwPNkxuj/ujS1fxH31P6rprrzyBlOR3aJvTXs=; b=fiBQ1/K53EmTXpQ/9efuXP3bPH
	Fh2bdxEfwVksgrWaijyocmUSVpbR8tiDHXQMEyxz6jCEuZiaK0z2vpTwacxAx09ykPU5/E5rGHrx5
	o1chu5BLXMVU/KOLw2EKIOFcoHL4n0btKK29Q5opgSDJEwehUJbtBe6wV/TTkxDaDwSR859/l3IB1
	wYMgJFDze8G1VSGJ0R30VT9bgDN3N/Rg+yMMT77+lzu6XwZ2iaicmJZHfHMjAVc2SnDfD/z+vb2KP
	zd5fxSaCifKiwaw+fk3cbypGsf89kxUMqAbfAVy9FLVUILvJ981LRzJS4ISQ0ptyz6a1m9uXnbjdQ
	dQ4OpEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zvJ-00000005MIj-39tY;
	Tue, 22 Sep 2026 12:48:37 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zvH-00000005MI5-1tYC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790081315; x=1821617315;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qpF5www/qPUXSNZo2UHhbjLD5x+pblk2MWF/eef8p7I=;
  b=ggRV/+t6rkMcSi5yHn4cGG0U2Fon7SDCUFWO0eLQjBmP3h4j17DENuqq
   2IfALFjN2ZHnHpItjBh7hSpb1WuZI/kXFNbFMb0p5wcXDLlaGKGj5wDu1
   D2kTCcdsUOtxoUaYM/w1Tkfz0nls7kC+4ssUOj8XGPjInjwfM837nFPOL
   /1EYotmCXPC9lhfFxOe4QTorb5/kAlZt0sTAX4q3pMuJvGjJzu0rqGD4h
   6KLnyKHtOA2IBuXfv9RV/jcNIryeAaqHyW7TSkybxwrgK7Fd4q9FxCrkE
   T2mqR3Y0vcwnfxE0LbOb3WfYF2r0+DlzlP7dCHPSJJQWgmX+E0LHIeLBS
   A==;
X-CSE-ConnectionGUID: 2AXAm6rqQvKWWzemttH5Rw==
X-CSE-MsgGUID: 9uxcwEtrSPOnlKwzpETNKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90796983"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90796983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:48:34 -0700
X-CSE-ConnectionGUID: I61J/lMPR6yWm2SobW9uzQ==
X-CSE-MsgGUID: Y5GxCWZmT3qY5hE+HY8CAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301039531"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:48:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Sep 2026 15:48:19 +0300 (EEST)
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
Subject: Re: [PATCH v1 06/17] platform/x86: serdev_helpers: Switch to use
 acpi_bus_get_primary_device()
In-Reply-To: <2720286.Lt9SDvczpP@rafael.j.wysocki>
Message-ID: <5fa97997-ae1f-0ff3-918c-e3195164c2ef@linux.intel.com>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki> <2720286.Lt9SDvczpP@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1862122475-1790081299=:1233"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_054835_501145_ADBF8E57 
X-CRM114-Status: GOOD (  16.81  )
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

--8323328-1862122475-1790081299=:1233
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
>  drivers/platform/x86/serdev_helpers.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86=
/serdev_helpers.h
> index 57eac75805e2..20267e1941f1 100644
> --- a/drivers/platform/x86/serdev_helpers.h
> +++ b/drivers/platform/x86/serdev_helpers.h
> @@ -74,8 +74,7 @@ get_serdev_controller(const char *serial_ctrl_hid,
>  =09=09return ERR_PTR(-ENODEV);
>  =09}
> =20
> -=09/* get_first_physical_node() returns a weak ref */
> -=09parent =3D get_device(acpi_get_first_physical_node(adev));
> +=09parent =3D acpi_bus_get_primary_device(adev);
>  =09acpi_dev_put(adev);
>  =09if (!parent) {
>  =09=09pr_err("error could not get %s/%s serial-ctrl physical node\n",
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1862122475-1790081299=:1233--

