Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE4BC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VStqp/+ypKOY1QcjUJXD1cAcqDN00V3HsMx47znq3U=; b=GiQzS5EXqE7tQTMHGsOfeFQ16R
	+WACy0K7zE6gf4hgDxj39dDeBTRSHlmBXwvPlQdj9jE2ElPhsZynEbQiRiYrWipSX4z3zmktdgsi6
	Azz9e8tyHl7DFsksq4XwZqu5Fe4IR/C0OJ9wtoDFhR0nZ7hBQMwilOLlB7oQzM56Zv19bXVyqKf7d
	I+gdo+1XZKxJvKIp4E+Dl6rT0G3EwJ4DUIXbMPWmgSihjnaqFAxhQ175Gdj+XvQUUmeY5ADWZgTDf
	FgFdlUpOjipJntgbZ2Jmy/TMA0KU9xZUfsrOKtqLFoFZSymlFuheeHIAXdBOH0E96gbIAB509ztXf
	Hk+H2r+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqVv-0000000HNeG-1j3P;
	Mon, 21 Jul 2025 13:25:07 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udovc-0000000HARY-0v79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753098212; x=1784634212;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hrgwN/w7MfcXcqLWZdBF/zPXpxKvQfR7TLLQJgj1w5s=;
  b=aJT02HYbTVag092hOhZBLAP1xdIqXb6KSTxEui9H2ezH7XTYU9+o/KoM
   uaaDJYZfJ9VC+UUKj/56VRgcYqOooB2YFkStW4LHYbUxSQq2khtYUuTuM
   YwA9MH8ugHpE1Xrah0z9YpUDqsBTZ6yuvaiVJguHM2RRbuQN8r/TQhreW
   u4JN2pA6NM0kmR/rJFvZ1e3YYguITdib0KEy/E0qria9MdKMI2r8/3wx/
   poZ+XYfdLY6pP4/sHFQoKGBCYX8mBxJWLiAQjW7pO6eJgOE+F/lHGCdTB
   Lc8ylI+G4gf94S4H3TeY+oYFc3YudG9LjQ8VphxN3Rn3aKHLrl3fbJ2MB
   w==;
X-CSE-ConnectionGUID: l7NHzfqWQjy6GRFdCYud+g==
X-CSE-MsgGUID: M8zZfdBqSYKwKuGDd/BOug==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59122811"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="59122811"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:43:31 -0700
X-CSE-ConnectionGUID: OYVcffK3Q/uchzoYBJ7H7A==
X-CSE-MsgGUID: k7jugmWySG2MAQVowyMegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158476181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:43:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Jul 2025 14:43:22 +0300 (EEST)
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
    neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
    maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
    simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, 
    Hans de Goede <hdegoede@redhat.com>, sven@kernel.org, alyssa@rosenzweig.io, 
    neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
    dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
    platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-fbdev@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2 01/15] platform/x86: dell-uart-backlight: Use blacklight
 power constant
In-Reply-To: <20250715122643.137027-2-tzimmermann@suse.de>
Message-ID: <c380d3a4-2a99-cf52-0952-ee916b6c9676@linux.intel.com>
References: <20250715122643.137027-1-tzimmermann@suse.de> <20250715122643.137027-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-766033278-1753098202=:69097"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_044332_267045_7D1AE204 
X-CRM114-Status: GOOD (  14.19  )
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

--8323328-766033278-1753098202=:69097
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Jul 2025, Thomas Zimmermann wrote:

> The backlight subsystem has gotten its own power constants. Replace
> FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/pl=
atform/x86/dell/dell-uart-backlight.c
> index 8f868f845350..f323a667dc2d 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_de=
vice *serdev)
>  =09dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + R=
ESP_DATA);
> =20
>  =09/* Initialize bl_power to a known value */
> -=09ret =3D dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> +=09ret =3D dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
>  =09if (ret)
>  =09=09return ret;

Hi Thomas,

Do you expect this entire series to go in this cycle through some other=20
tree than pdx86? If not, I'll take this through pdx86 tree in this cycle.

--=20
 i.

--8323328-766033278-1753098202=:69097--

