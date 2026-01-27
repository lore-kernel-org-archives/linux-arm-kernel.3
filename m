Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A5D2F031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n++yDm7ssI9or4aRbyQsKwBqgsEaJvYdqeRPo39ZTIY=; b=CrE08PQeO8T2bad6GIxqNaae4R
	hWnqZjYeBByk9ggpvhlilpdB6hW9Q0tuN8JfgF/Qj+MI0SZpMAmP3ySKl2AEUB68oKF26cOTFsUz1
	euZC/r6irjYjDUXVy2uW2ANrv5lLJIXj9Jd8XGk45OSgU/ZJ2yIMlRilNS4jhMTWxwako/57vOXtr
	wg/Uno+K10obuH87kFWgstMDdouwuSoVtja+JOatY4pq2wZBNtBOlPTWumYpjBpec3iJIvjcuDAO3
	tu5QFGe3XBO1TAAU/3LIph8pSHAx62VDN0zS5JWpi1oG/DRN6mk5VGxovI9FKIkxto/lcKggiOIvL
	nDkYU0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjaS-0000000ELnM-3Ic7;
	Tue, 27 Jan 2026 13:58:32 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjaL-0000000ELkO-1xmI;
	Tue, 27 Jan 2026 13:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769522305; x=1801058305;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=og59pwZnyOqe7PNgzDbUl3i3pkVIgIempTHbdxTELvk=;
  b=KVc1UpHbtCBQ5eY+dMTxHSTCLs+H4VENdPD9mM2OdP0fOW3FUpggJxg8
   RULsiPBAaPhg8Ppzji3V1h6sXEfFOdSsW70ryJbKVlk0+/EkPd9L4tcW1
   aDGt5hC8jac42cTtUx+IoUGQY21W9uXCM0tkc/TbYgrAjrictWZgsMsSa
   fghts4ANmDhmN1wWeychArAL/4Y4BberOy76zYkGg8+83JLhYD3RQY/Ki
   Krru2aMEV9PRwb7+EFleKm+Ye3i5qVX+bu5DRHX4eSfj8+2k6b7Waep0p
   5pY60Zo2SlmUMSclapcN2a4ICo6Aw0ZOiDGRMEw3QjEqoj4M91/8tNGBx
   A==;
X-CSE-ConnectionGUID: btez0BeATFuZYtAHw4xPVg==
X-CSE-MsgGUID: MzGkm4iAQeKB3iBOworFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73302725"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73302725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:58:22 -0800
X-CSE-ConnectionGUID: BCzws0wPRNOMRGWv4OMbDg==
X-CSE-MsgGUID: 9fMvMzQpQUu7qdSrTcjCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207876830"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:58:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Diederik de Haas
 <diederik@cknow-tech.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
In-Reply-To: <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
Date: Tue, 27 Jan 2026 15:58:13 +0200
Message-ID: <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_055825_681393_AF923F81 
X-CRM114-Status: GOOD (  19.86  )
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

On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> =
wrote:
> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> include/linux/math.h.
>
> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> a common definition in uapi.
>
> Additionally, ensure it allows building ISO C applications by switching
> from the 'typeof' GNU extension to the ISO-friendly __typeof__.

I am not convinced that it's a good idea to make the implementation of
kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
change effectively does.

I'd at least like to get an ack from Andy Shevchenko first (Cc'd).


BR,
Jani.

> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/linux/math.h       | 18 +-----------------
>  include/uapi/linux/const.h | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 6dc1d1d32fbc..1e8fb3efbc8c 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -89,23 +89,7 @@
>  }							\
>  )
>=20=20
> -/*
> - * Divide positive or negative dividend by positive or negative divisor
> - * and round to closest integer. Result is undefined for negative
> - * divisors if the dividend variable type is unsigned and for negative
> - * dividends if the divisor variable type is unsigned.
> - */
> -#define DIV_ROUND_CLOSEST(x, divisor)(			\
> -{							\
> -	typeof(x) __x =3D x;				\
> -	typeof(divisor) __d =3D divisor;			\
> -	(((typeof(x))-1) > 0 ||				\
> -	 ((typeof(divisor))-1) > 0 ||			\
> -	 (((__x) > 0) =3D=3D ((__d) > 0))) ?		\
> -		(((__x) + ((__d) / 2)) / (__d)) :	\
> -		(((__x) - ((__d) / 2)) / (__d));	\
> -}							\
> -)
> +#define DIV_ROUND_CLOSEST __KERNEL_DIV_ROUND_CLOSEST
>  /*
>   * Same as above but for u64 dividends. divisor must be a 32-bit
>   * number.
> diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
> index b8f629ef135f..471877322f47 100644
> --- a/include/uapi/linux/const.h
> +++ b/include/uapi/linux/const.h
> @@ -50,4 +50,21 @@
>=20=20
>  #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>=20=20
> +/*
> + * Divide positive or negative dividend by positive or negative divisor
> + * and round to closest integer. Result is undefined for negative
> + * divisors if the dividend variable type is unsigned and for negative
> + * dividends if the divisor variable type is unsigned.
> + */
> +#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
> +{							\
> +	__typeof__(x) __x =3D x;				\
> +	__typeof__(divisor) __d =3D divisor;		\
> +	(((__typeof__(x))-1) > 0 ||			\
> +	 ((__typeof__(divisor))-1) > 0 ||		\
> +	 (((__x) > 0) =3D=3D ((__d) > 0))) ?		\
> +		(((__x) + ((__d) / 2)) / (__d)) :	\
> +		(((__x) - ((__d) / 2)) / (__d));	\
> +}							\
> +)
>  #endif /* _UAPI_LINUX_CONST_H */

--=20
Jani Nikula, Intel

